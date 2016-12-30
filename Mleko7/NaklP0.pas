unit NaklP0;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  Db, DBAccess, MsAccess, MemDS, ExtCtrls, Grids, DBGrids, RXDBCtrl,
  Buttons, SelNakl0, Math, ActnList, frxClass, frxDBSet,
  frxExportPDF, frxExportImage, frxExportRTF, frxExportXML, frxExportXLS,
  frxExportHTML, frxExportTXT, ToolWin, ComCtrls, dxBar, CFLMLKMDIChild, dbf, dbf_fields;

type
  TfmNaklP = class(TCFLMLKMDIChildForm)
    RxDBGrid1: TRxDBGrid;
    quNaklP: TMSQuery;
    dsNaklP: TDataSource;
    ActionPrint: TAction;
    ActionFormClose: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionViewRefresh: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ActionAdd: TAction;
    ActionEdit: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ActionDel: TAction;
    quNaklP_Export: TMSQuery;
    SaveDialogDBF: TSaveDialog;
    ToolButton9: TToolButton;
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure quNaklPBeforePost(DataSet: TDataSet);
    procedure quNaklPNewRecord(DataSet: TDataSet);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure ActionPrintExecSQL(Sender: TObject);
    procedure ActionFormCloseExecSQL(Sender: TObject);
    procedure quNaklPBeforeOpen(DataSet: TDataSet);
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);

    
  private
    { Private declarations }
    SearchString: string;
  public
    { Public declarations }
  end;

var
  fmNaklP: TfmNaklP;
  OtdelNo: integer;
  DateBegin, DateEnd: TDate;
procedure NaklP(RetSelNakl: TRetSelNakl);
implementation

uses Data, qrNaklP0, SelectItem0, Otchets0, PrihodTov, UtilsCommon, CFLMLKCustomRep;

{$R *.DFM}

function DataTypeCodeToDataSetDataType(DataTypeCode: string): TFieldType;
begin
  result := ftUnknown;
  if DataTypeCode = 'VARCHAR' then result := ftString;
  if DataTypeCode = 'CHAR' then result := ftString;
  if DataTypeCode = 'CLOB' then result := ftMemo;
  if DataTypeCode = 'BLOB' then result := ftMemo;
  if DataTypeCode = 'FLOAT' then result := ftFloat;
  if DataTypeCode = 'SMALL_DATE' then result := ftDate;
  if DataTypeCode = 'DATE' then result := ftDateTime;
  if DataTypeCode = 'BOOL_Y_N' then result := ftBoolean;
  if DataTypeCode = 'BOOL_1_0' then result := ftBoolean;
  if DataTypeCode = 'INTEGER' then result := ftInteger;
  if result = ftUnknown then raise Exception.Create('Неизвестный тип данных');
end;

function CreateDBFDataSet(FTable_ID: Int64; FilePath: string): TDbf;
var
  dbf: Tdbf;
  FldDef: TDbfFieldDef;
  FldDefs: TDbfFieldDefs;
  Size, precesion: Integer;
  DataType: TFieldType;
  required: boolean;
  FieldName, DbmsCode, STR_QUOTES: string;
  QuFAttributes : TMSQuery;
begin
  dbf := TDBF.Create(nil);
  dbf.TableLevel := 4;
  //dbf.LanguageID:=DbfLangId_RUS_866;
  FldDefs := TDbfFieldDefs.Create(nil);
  try

    DeleteFile(FilePath);
    ForceDirectories(ExtractFileDir(FilePath));
    Dbf.Close;
    dbf.TableName := FilePath;

    QuFAttributes:=TMSQuery.Create(nil);
    QuFAttributes.Connection:=dmDataModule.DB;
    QuFAttributes.SQL.Clear;
    QuFAttributes.SQL.Text:='select * from d_fattribute where FtableId=:FtableId';
    QuFAttributes.Prepare;
    QuFAttributes.ParamByName('FtableId').Value :=FTable_ID; //quExcFtableProcInfo.FieldByName('FTable_ID').Value;
    QuFAttributes.Open;
    QuFAttributes.First;

    while not QuFAttributes.Eof do
    begin
          //-------------------Наполнение структурой из d_fattribute--------------
      size := QuFAttributes.FieldByName('field_size').AsInteger;
      precesion := QuFAttributes.FieldByName('precession').AsInteger;
      DataType := DataTypeCodeToDataSetDataType(QuFAttributes.FieldByName('code').AsString);
      required := QuFAttributes.FieldByName('REQUIRED').AsString = 'Y';
      FieldName := QuFAttributes.FieldByName('Name').AsString;

      FldDef := FldDefs.AddFieldDef;
      FldDef.FieldType := DataType;
      FldDef.FieldName := FieldName;
      FldDef.Size := Size;
      FldDef.Precision := precesion;
      FldDef.Required := required;
          //-------------------Наполнение структурой из d_fattribute--------------
      QuFAttributes.Next;
    end;
    dbf.CreateTableEx(FldDefs);
    Result := dbf;
  finally
    QuFAttributes.Free;
    FldDefs.Free;
  end;
end;

procedure ExportToDBF(var DataSetFrom, DataSetTo: TdataSet;ToOem: Boolean);
var ln_str_value: string;
  FldValCount, i: Integer;
  ln_value: Real;
  Res_Stream: TStream;
  StreamWright: TStringStream;
  s : string;
  s2, s1: AnsiString;
begin
  FldValCount := DataSetFrom.FieldCount;
  DataSetFrom.First;
  if not DataSetTo.Active then DataSetTo.Open;
  while not DataSetFrom.eof do
  begin
    DataSetTo.Insert;
    for i := 0 to FldValCount - 1 do
    begin
      if DataSetFrom.Fields[i].AsString <> '' then
      begin
        case DataSetTo.Fields[i].DataType of
          ftString:
             if ToOEM then
             begin
              s := DataSetFrom.Fields[i].AsString; // Это - в кодировке 1251 из SQL Server
              AnsiToOem(PChar(s),PChar(s));  // Здесь происходит преобразование строки
              DataSetTo.Fields[i].AsString  := s;
             end
             else
              DataSetTo.Fields[i].AsString := DataSetFrom.Fields[i].AsString;
          ftFloat, ftCurrency, ftBCD:
            begin
              ln_str_value := DataSetFrom.Fields[i].AsString;
              ln_value := StrToFloat(StringReplace(StringReplace(ln_str_value, '.', DecimalSeparator, [rfReplaceAll,
                rfIgnoreCase])
                  , ',', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]));
              DataSetTo.Fields[i].AsFloat := ln_value;
            end;
          ftBoolean: DataSetTo.Fields[i].AsBoolean := (DataSetFrom.Fields[i].AsString = '1') or
            (DataSetFrom.Fields[i].AsString = 'Y');
          ftDate, ftDateTime: DataSetTo.Fields[i].AsDateTime := DataSetFrom.Fields[i].AsDateTime;
          ftInteger: DataSetTO.Fields[i].AsInteger := DataSetFrom.Fields[i].AsInteger;
          ftMemo:
            begin
              StreamWright := TStringStream.Create(s2);
              Res_Stream := DataSetTo.CreateBlobStream(DataSetTo.Fields[i], bmReadWrite);
              try
                StreamWright.WriteString(DataSetFrom.Fields[i].AsString);
                s1 := DataSetFrom.Fields[i].AsString;
//                Res_Stream.WriteBuffer(s1,Length(s1));
                Res_Stream.CopyFrom(StreamWright, 0);
                DataSetTo.Post;
              finally
                Res_Stream.Free;
                StreamWright.Free;
              end;
            end;
        end;
      end;
    end;
    if DataSetTo.State in [dsEdit, dsInsert] then DataSetTo.Post;
    DataSetFrom.Next;
  end;
end;

procedure NaklP(RetSelNakl: TRetSelNakl);
var
  TmpSql: string;
begin
  Screen.Cursor := crHourGlass;
  fmNaklP := TfmNaklP.Create(Application);
  // try
  TmpSQL := '';
  if RetSelNakl.PostNo > 0 then
    TmpSql := '(NaklP.PostNo=' + IntToStr(RetSelNakl.PostNo) + ')';
  if (RetSelNakl.DateBegin > 0) then
  begin
    if Length(TmpSql) > 0 then
      TmpSql := TmpSql + ' and ';
    TmpSql := TmpSql + '(DateNakl>=:DateBegin) and (DateNakl<=:DateEnd)';
  end;
  if (RetSelNakl.OtdelNo = '') then
  begin
    OtdelNo := 1;
    if Length(TmpSql) > 0 then
      TmpSql := TmpSql + ' and ';
    TmpSql := TmpSql + ' (NaklP.OtdelNo <> 3)';
  end
  else
  begin
    OtdelNo := 3;
    if Length(TmpSql) > 0 then
      TmpSql := TmpSql + ' and ';
    TmpSql := TmpSql + ' (NaklP.OtdelNo = 3)';
  end;
  //
  if Length(TmpSql) > 0 then
  begin
    fmNaklP.quNaklP.MacroByName('_where').Value := TmpSQL;
    fmNaklP.quNaklP.Prepare;
    if (RetSelNakl.DateBegin > 0) then
    begin
      fmNaklP.quNaklP.ParamByName('DateBegin').AsDate := RetSelNakl.DateBegin;
      fmNaklP.quNaklP.ParamByName('DateEnd').AsDate := RetSelNakl.DateEnd;

      DateBegin := RetSelNakl.DateBegin;
      DateEnd := RetSelNakl.DateEnd;
    end;
  end;
  fmNaklP.quNaklP.Open;
  fmNaklP.quNaklP.Last;
  Screen.Cursor := crDefault;
  fmNaklP.Show;
  { finally
   Screen.Cursor:=crDefault;
   fmNaklP.quNaklP.Close;
   fmNaklP.quVidNakl.Close;
   fmNaklP.quTipNakl.Close;;
   fmNaklP.Free;
   end;}
end;

procedure TfmNaklP.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_SPACE: RxDBGrid1.SelectedRows.CurrentRowSelected := not RxDBGrid1.SelectedRows.CurrentRowSelected;
    VK_UP, VK_DOWN: SearchString := '';
  end;
end;

procedure TfmNaklP.quNaklPBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('OurFirmNo').AsInteger := dmDataModule.FirmNo;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select Max(NaklNo) NaklNo from NaklP');
  dmDataModule.quWork.Open;
  quNaklP.FieldByName('NaklNo').AsInteger := dmDataModule.quWork.FieldByName('NaklNo').AsInteger + 1;
  dmDataModule.quWork.Close;

end;

procedure TfmNaklP.quNaklPNewRecord(DataSet: TDataSet);
begin
  quNaklP.FieldByName('Date_Entity').AsDateTime := Date();
  quNaklP.FieldByName('Nom').AsInteger := 0;
  quNaklP.FieldByName('Summa').AsFloat := 0;
end;

procedure TfmNaklP.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
var
  NaklNo: integer;
begin
  Screen.Cursor := crHourGlass;
  NaklNo := quNaklP.FieldByName('NaklNo').AsInteger;
  quNaklP.Close;
  case ACol of
    0: quNaklP.MacroByName('_order').Value := 'NaklNo';
    1: quNaklP.MacroByName('_order').Value := 'Nom,DateNakl';
    2: quNaklP.MacroByName('_order').Value := 'DateNakl,PostName';
    3: quNaklP.MacroByName('_order').Value := 'PostName,DateNakl';
    4: quNaklP.MacroByName('_order').Value := 'Summa';
    5: quNaklP.MacroByName('_order').Value := 'SummaDolg';
  end;
  quNaklP.Open;
  quNaklP.Locate('NaklNo', NaklNo, []);
  Screen.Cursor := crDefault;
end;

procedure TfmNaklP.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
var
  Found: boolean;
begin
  if (Key in Data.SearchSet) then
  begin
    SearchString := SearchString + Key;
    Key := Chr(0);
    Found := False;
    try
      Found := RxDBGrid1.DataSource.DataSet.Locate(RxDBGrid1.Columns[RxDBGrid1.Col - 1].FieldName, SearchString, [loPartialKey, loCaseInsensitive]);
    except
      SearchString := '';
    end;
    if (not Found) and (RxDBGrid1.Columns[RxDBGrid1.Col - 1].Field.DataType = ftString) then
      SearchString := Copy(SearchString, 1, length(SearchString) - 1);
  end;
end;

procedure TfmNaklP.ActionPrintExecSQL(Sender: TObject);
var
  Rec: TBookmarkStr;
  i, c: integer;
  s: string;
  params: TParams;
begin
  Rec := quNaklP.Bookmark;
  quNaklP.DisableControls;
  i := SelectItem('Печать', ['Загрузка', 'Список', 'Приходная накладная']);
  case i of
    0:
      begin
        S := '';
        for c := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          quNaklP.Bookmark := RxDBGrid1.SelectedRows[c];
          S := S + quNaklP.FieldByName('NaklNo').AsString + ',';
        end;
        if s = '' then
        begin
          RxDBGrid1.DataSource.DataSet.First;
          while not RxDBGrid1.DataSource.DataSet.Eof do
          begin
            S := S + quNaklP.FieldByName('NaklNo').AsString + ',';
            RxDBGrid1.DataSource.DataSet.Next;
          end;
        end;
        if S <> '' then
        begin
          S := Copy(S, 1, Length(S) - 1);
          S := '(' + S + ')';
          LoadCarNewP(S, DateBegin, DateEnd);
        end;
      end;
    1:
      begin
        qrNaklP := TqrNaklP.Create(Application);
        try
          qrNaklP.Preview;
        finally
          qrNaklP.Free;
        end;
      end;
    2:
      begin
        Params := TParams.Create;
        try
          UtilsCommon.SetParamValue(Params, 'p_NaklNo', quNaklP.FieldByName('NaklNo').AsString);
          TCFLMLKCustomRepDlg.ShowRep(83, Params);
        finally
          Params.Free;
        end;
      end;
  end;
  quNaklP.Bookmark := Rec;
  quNaklP.EnableControls;
end;

procedure TfmNaklP.ActionFormCloseExecSQL(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmNaklP.quNaklPBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quNaklP.ParamByName('OurFIrmNo').AsInteger := dmDataModule.FirmNo;
end;

procedure TfmNaklP.ActionViewRefreshExecute(Sender: TObject);
var
  NaklNo: Integer;
begin
  inherited;
  NaklNo := quNaklP.FieldByName('NaklNo').AsInteger;
  quNaklP.Close;
  quNaklP.Open;
  quNaklP.Locate('NaklNo', NaklNo, []);
end;

procedure TfmNaklP.ActionEditExecute(Sender: TObject);
var
  pkey: Int64;
begin
  inherited;
  pkey := quNaklP.FieldByName('Pkey').Value;
  PrihodTovar(OtdelNo, pkey);
  ActionViewRefresh.Execute;
  quNaklP.Locate('pkey', Pkey, []);
end;

procedure TfmNaklP.ActionAddExecute(Sender: TObject);
var
  pkey: Int64;
begin
  inherited;
  pkey := -1;
  PrihodTovar(OtdelNo, pkey);
  ActionViewRefresh.Execute;
  quNaklP.Locate('pkey', Pkey, []);
end;

procedure TfmNaklP.RxDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  ActionEdit.Execute;
end;

procedure TfmNaklP.ActionDelExecute(Sender: TObject);
begin
  inherited;
  if (MessageDlg('Вы уверены что хотите удалить накладную ?', mtConfirmation, [mbNo,mbYes], 0) in [mrYes]) then  quNaklP.Delete;
end;

procedure TfmNaklP.ToolButton9Click(Sender: TObject);
var DataSetFrom,DataSetTo : TDataSet;
    FTable_ID : int64;
    NaklPList : String;
    i         : integer;
begin
  inherited;
{Экспорт в dbf}
  if SaveDialogDBF.Execute then
  begin
     try
      NaklPList:='-1';
      if RxDBGrid1.SelCount = 0 then RxDBGrid1.ToggleRowSelection;
      for i:=0 to RxDBGrid1.SelCount-1 do
      begin
         RxDBGrid1.GotoSelection(i);
         NaklPList := NaklPList +','+ quNaklP.FieldByName('Nom').AsString;
      end;

      quNaklP_Export.Close;
      quNaklP_Export.SQL.Clear;
      quNaklP_Export.SQL.Add('select * from v_NaklP_Export');
      //quNaklP_Export.SQL.Add('where NTTN in ('+NaklPList+') and SUMMA >0');  //and SUMMA >0 для нормальной выгрузки Порча-Возврат
      quNaklP_Export.SQL.Add('where NTTN in ('+NaklPList+')');  //and SUMMA >0 для нормальной выгрузки Порча-Возврат
      quNaklP_Export.Prepare;
      quNaklP_Export.Open;

      FTable_ID:=1;
      DataSetFrom :=quNaklP_Export as TDataset;
      DataSetTo:= CreateDBFDataSet(FTable_ID,SaveDialogDBF.FileName) as TDataset;
      ExportTODBF(DataSetFrom,DataSetTo,True);
      quNaklP_Export.Close;
     except
      ShowMessage('Ошибка экспорта в dbf');
     end;

  end;
end;

end.

