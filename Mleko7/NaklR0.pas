unit NaklR0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  Db, DBAccess, MsAccess, MemDS, ExtCtrls, Grids, DBGrids, RXDBCtrl,
  Buttons, SelNakl0, Math, ActnList, frxClass, frxDBSet,
  frxExportPDF, frxExportImage, frxExportRTF, frxExportXML, frxExportXLS,
  frxExportHTML, frxExportTXT, ToolWin, ComCtrls, dxBar, CFLMLKMDIChild, dbf, dbf_fields;

type
  TfmNaklR_ = class(TCFLMLKMDIChildForm)
    RxDBGrid1: TRxDBGrid;
    dsNaklR: TDataSource;
    quNaklR: TMSQuery;
    ActionList1: TActionList;
    ActionOpenSpec: TAction;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxPDFExport1: TfrxPDFExport;
    RepDataSet: TfrxDBDataset;
    frxReport: TfrxReport;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ActionViewRefresh: TAction;
    ToolButton3: TToolButton;
    ActionDelete: TAction;
    ActionAdd: TAction;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    ActionPrint: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ActionPrintNakl: TAction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ActionExit: TAction;
    ToolButton10: TToolButton;
    ActionExport: TAction;
    SaveDialogDBF: TSaveDialog;
    quNaklR_Export: TMSQuery;
    CreateNaklP: TToolButton;
    quCreateNaklP: TMSQuery;
    dsCreateNaklP: TMSDataSource;
    quCeckCreateNaklP: TMSQuery;
    dsCeckCreatenaklP: TMSDataSource;
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure quNaklPBeforePost(DataSet: TDataSet);
    procedure quNaklPNewRecord(DataSet: TDataSet);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure ActionOpenSpecExecSQL(Sender: TObject);
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionPrintNaklExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionExportExecute(Sender: TObject);
    procedure CreateNaklPClick(Sender: TObject);
  private
    { Private declarations }
    SearchString: string;
  public
    { Public declarations }
  end;

var
  fmNaklR_: TfmNaklR_;
  ReturnNakl: Boolean;
procedure NaklR(RetSelNakl: TRetSelNakl);
implementation

uses Data, EditNaklR0, SelectItem0, qrNaklR0, qrNaklR1,RequestForSupplyGoods,
     Otchets0, DeliveryOfGoods0,Post0,MlekoSelectBuh,MlekoSelectOtdel;

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
  if DataTypeCode = 'BIGINT' then result := ftLargeint;
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



procedure NaklR(RetSelNakl: TRetSelNakl);
var
  TmpSql: string;
begin
  Screen.Cursor := crHourGlass;
  fmNaklR_ := TfmNaklR_.Create(Application);
  TmpSQL := '';
  ReturnNakl := RetSelNakl.Return;
  if RetSelNakl.PostNo > 0 then
    TmpSql := '(h.PostNo=' + IntToStr(RetSelNakl.PostNo) + ')';
  if (RetSelNakl.DateBegin > 0) then
  begin
    if Length(TmpSql) > 0 then
      TmpSql := TmpSql + ' and ';
    TmpSql := TmpSql + ' (DateNakl>=:DateBegin) and (DateNakl<=:DateEnd) ';
  end;
  if (RetSelNakl.OtdelNo <> '') then
  begin
    if Length(TmpSql) > 0 then
      TmpSql := TmpSql + ' and ';
    TmpSql := TmpSql + ' (h.OtdelNo in ' + RetSelNakl.OtdelNo + ' or h.OtdelNo is null)';
  end
  else
  begin
    if Length(TmpSql) > 0 then
      TmpSql := TmpSql + ' and ';
    TmpSql := TmpSql + ' (h.OtdelNo not in (3,5))';
  end;
  if RetSelNakl.Return then
  begin
    if Length(TmpSql) > 0 then
      TmpSql := TmpSql + ' and ';
    TmpSql := TmpSql + ' (h.VidNaklNo in (3,5))';
    fmNaklR_.Caption := 'Возвратные накладные';
  end
  else
  begin
    if Length(TmpSql) > 0 then
      TmpSql := TmpSql + ' and ';
    TmpSql := TmpSql + ' (h.VidNaklNo not in (3,5))';
  end;

  //
  if Length(TmpSql) > 0 then
  begin
    fmNaklR_.quNaklR.MacroByName('_where').Value := TmpSQL;
    fmNaklR_.quNaklR.MacroByName('_order').Value := 'h.NaklNo';
    fmNaklR_.quNaklR.Prepare;
    if (RetSelNakl.DateBegin > 0) then
    begin
      fmNaklR_.quNaklR.ParamByName('DateBegin').AsDate := RetSelNakl.DateBegin;
      fmNaklR_.quNaklR.ParamByName('DateEnd').AsDate := RetSelNakl.DateEnd;
    end;
  end;
  fmNaklR_.quNaklR.Open;
  Screen.Cursor := crDefault;
  fmNaklR_.Show;
end;

procedure TfmNaklR_.RxDBGrid1DblClick(Sender: TObject);
begin
  ActionOpenSpecExecSQL(Self);
end;

procedure TfmNaklR_.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_SPACE: RxDBGrid1.SelectedRows.CurrentRowSelected := not RxDBGrid1.SelectedRows.CurrentRowSelected;
    VK_DOWN, VK_UP: SearchString := '';
    VK_F9:
      begin
        if (ssCtrl in Shift) and (data.CodeAccess = 1) then
        begin
          if RxDBGrid1.Columns[8].Width = 0 then
          begin
            RxDBGrid1.Columns[8].Width := 61;
            RxDBGrid1.Columns[9].Width := 152;
          end
          else
          begin
            RxDBGrid1.Columns[8].Width := 0;
            RxDBGrid1.Columns[9].Width := 0;
          end;
        end
      end;
  end;
end;

procedure TfmNaklR_.quNaklPBeforePost(DataSet: TDataSet);
begin
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('SELECT Rashod.NaklNo, SUM(Rashod.Kol * Tovar.Weight / 1000) AS Weight, SUM(Rashod.Kol / Tovar.KolPerPak) AS KolPerPak ');
  dmDataModule.quWork.SQL.Append('FROM Rashod INNER JOIN');
  dmDataModule.quWork.SQL.Append('Tovar ON Rashod.TovarNo = Tovar.TovarNo ');
  dmDataModule.quWork.SQL.Append('WHERE (NOT (Tovar.Weight IS NULL)) AND (Tovar.Weight <> 0) AND (NOT (Tovar.KolPerPak IS NULL)) AND (Tovar.KolPerPak <> 0) ');
  dmDataModule.quWork.SQL.Append('GROUP BY Rashod.NaklNo ');
  dmDataModule.quWork.SQL.Append('HAVING (Rashod.NaklNo = :NaklNo) ');
  dmDataModule.quWork.ParamByName('NaklNo').AsInteger := quNaklR.FieldByName('NaklNo').AsInteger;
  dmDataModule.quWork.Open;

  quNaklR.FieldByName('Weight').AsFloat := RoundTo(dmDataModule.quWork.FieldByName('Weight').AsFloat, -2);
  quNaklR.FieldByName('KolPerPak').AsFloat := Round(dmDataModule.quWork.FieldByName('KolPerPak').AsFloat);

  dmDataModule.quWork.Close;
  if quNaklR.FieldByName('OtdelNo').AsInteger <> 3 then
  begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('SELECT SotrudOtdel ');
    dmDataModule.quWork.SQL.Append('FROM Sotrud ');
    dmDataModule.quWork.SQL.Append('WHERE (SotrudNo = :SotrudNo) ');
    dmDataModule.quWork.ParamByName('SotrudNo').AsInteger := quNaklR.FieldByName('SotrudNo').AsInteger;
    dmDataModule.quWork.Open;
    quNaklR.FieldByName('OtdelNo').AsInteger := dmDataModule.quWork.FieldByName('SotrudOtdel').AsInteger;
    dmDataModule.quWork.Close;
  end;

  if quNaklR.State in [dsInsert] then
  begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select Max(NaklNo) NaklNo from NaklR');
    dmDataModule.quWork.Open;
    quNaklR.FieldByName('NaklNo').AsInteger := dmDataModule.quWork.FieldByName('NaklNo').AsInteger + 1;
    dmDataModule.quWork.Close;
  end;
  dmDataModule.quWork.Close;
end;

procedure TfmNaklR_.quNaklPNewRecord(DataSet: TDataSet);
begin
  quNaklR.FieldByName('DateNakl').AsDateTime := Date();
  quNaklR.FieldByName('Nom').AsInteger := 0;
  quNaklR.FieldByName('Summa').AsFloat := 0;
  quNaklR.FieldByName('Ask').AsBoolean := False;
end;

procedure TfmNaklR_.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
var
  NaklNo: integer;
begin
  Screen.Cursor := crHourGlass;
  NaklNo := quNaklR.FieldByName('NaklNo').AsInteger;
  quNaklR.Close;
  case ACol of
    0: quNaklR.MacroByName('_order').Value := 'h.NaklNo';
    1: quNaklR.MacroByName('_order').Value := 'Nom,DateNakl';
    2: quNaklR.MacroByName('_order').Value := 'DateNakl,P1.Name';
    3: quNaklR.MacroByName('_order').Value := 'Buh,DateNakl,P1.Name';
    4: quNaklR.MacroByName('_order').Value := 'VidOtdel.OtdelName,P1.Name,DateNakl';
    5: quNaklR.MacroByName('_order').Value := 'P1.Name,DateNakl';
    6: quNaklR.MacroByName('_order').Value := 'Summa';
    7: quNaklR.MacroByName('_order').Value := 'SummaDolg';
    8: quNaklR.MacroByName('_order').Value := 'DateNaklFirst,NameFirst';
    9: quNaklR.MacroByName('_order').Value := 'NameFirst,DateNaklFirst';
    10: quNaklR.MacroByName('_order').Value := 'Ask,NameFirst,DateNaklFirst';
  end;
  quNaklR.Prepare;
  quNaklR.Open;
  quNaklR.Locate('NaklNo', NaklNo, []);
  Screen.Cursor := crDefault;
end;

procedure TfmNaklR_.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
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

procedure TfmNaklR_.BitBtn2Click(Sender: TObject);
var
  i: integer;
begin
  {i:=SelectItem('Печать',['Расходная','Налоговая','Чек на склад','Список товара']);
   case i of
    0:PrintNaklRas(fmNaklR_.quNaklRNaklNo.AsInteger);
    1:PrintNaklNdsNew(fmNaklR_.quNaklRNaklNo.AsInteger);
    2:PrintCheckSklad(fmNaklR_.quNaklRNaklNo.AsInteger);
    3:PrintNaklRShort(fmNaklR_.quNaklRNaklNo.AsInteger);
   end;}
end;

procedure TfmNaklR_.ActionOpenSpecExecSQL(Sender: TObject);
var
  Pkey: Int64;
begin
  Pkey := quNaklR.FieldByName('Pkey').Value;

  dmDataModule.OpenSQL('select count(*) as cnt from Ostatok1Nakl where NaklNo = :p1_NaklNo',[quNaklR.FieldByName('NaklNo').Value]);

  if (DmDataModule.QFO.FieldByName('cnt').AsInteger > 0) then raise Exception.Create(' Редактирование запрещено!!!' + #10#13 +
                                                                                     'Данная накладная создана в системе Остаток-1! ');


  dmDataModule.quCurrency.Open;
  TfmEditNaklR.EditNaklR(Pkey, 'EDIT', false, false);
  dmDataModule.quCurrency.Close;


  ActionViewRefresh.Execute;
  quNaklR.Locate('Pkey', Pkey, []);
end;

procedure TfmNaklR_.ActionViewRefreshExecute(Sender: TObject);
var
  id: Int64;
begin
  if not quNaklR.Eof then
  begin
    id := quNaklR.FieldByName('pkey').Value;
    quNaklR.Close;
    quNaklR.Open;
    quNaklR.Locate('pkey', id, []);
  end;
end;

procedure TfmNaklR_.ActionPrintExecute(Sender: TObject);
var
  i, c: integer;
  S: string;
  Print3 :boolean;
  Dlg : TfmDeliveryOfGoods;
  DeliveryTovarNo : Integer;
begin
  if quNaklR.FieldByName('TTN').AsBoolean = true then
                                                   i := SelectItem('Печать', ['Загрузка', 'Список', 'Список с районами', 'Внутренняя накладная',
                                                                              'Требование на погрузку', 'Расширенный полный список','Расходная накладная',
                                                                              'Поставка товара', 'Требование на погрузку ИМ' ,'Погрузка ИМ с партнерами' ,'Товарно-транспортная'])
                                                 else
                                                   i := SelectItem('Печать', ['Загрузка', 'Список', 'Список с районами', 'Внутренняя накладная',
                                                                              'Требование на погрузку', 'Расширенный полный список','Расходная накладная',
                                                                              'Поставка товара', 'Требование на погрузку ИМ','Погрузка ИМ с партнерами']);
  case i of
    0:
      begin
        S := '';
        for c := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          quNaklR.Bookmark := RxDBGrid1.SelectedRows[c];
          S := S + quNaklR.FieldByName('NaklNo').AsString + ',';
        end;
        if S <> '' then
        begin
          S := Copy(S, 1, Length(S) - 1);
          S := '(' + S + ')';
          LoadCarNew(1, S, '', True, True, '                                   ', '                                   ', Now);
        end;
      end;
    1:
      begin
        qrNaklR := TqrNaklR.Create(Application);
        try
          qrNaklR.Preview;
        finally
          qrNaklR.Free;
        end;
      end;
    2:
      begin
        qrNaklREx := TqrNaklREx.Create(Application);
        try
          qrNaklREx.Preview;
        finally
          qrNaklREx.Free;
        end;
      end;
    3:
      begin
        S := '';
        for c := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          quNaklR.Bookmark := RxDBGrid1.SelectedRows[c];
          S := S + quNaklR.FieldByName('NaklNo').AsString + ',';
        end;
        if S <> '' then
        begin
          S := Copy(S, 1, Length(S) - 1);
          S := '(' + S + ')';
          LoadCarNakl(S);
        end;
      end;
    4:
      begin
        S := '';
        for c := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          quNaklR.Bookmark := RxDBGrid1.SelectedRows[c];
          S := S + quNaklR.FieldByName('NaklNo').AsString + ',';
        end;
        if S <> '' then
        begin
          S := Copy(S, 1, Length(S) - 1);
          S := '(' + S + ')';
          LoadCarNaklTreb(S);
        end;
      end;
    5:
      begin
        frxReport.Clear;
        frxReport.LoadFromFile('RepListNakl.fr3');
        frxReport.ShowReport;
      end;
    6:
      begin
         Print3:=fmNaklR_.quNaklR.FieldByName('Print3').AsBoolean;
         if fmNaklR_.quNaklR.FieldByName('Buh').AsInteger = 2 then
          begin
           PrintNaklRasNew(quNaklR.FieldByName('NaklNo').AsInteger, False, True, True, Print3);
          end
          else
          begin
            PrintNaklRasNew(quNaklR.FieldByName('NaklNo').AsInteger, False, True, False, Print3);
          end;
      end;
    7:
      begin
        S := '';
        for c := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          quNaklR.Bookmark := RxDBGrid1.SelectedRows[c];
          S := S + quNaklR.FieldByName('NaklNo').AsString + ',';
        end;
        if S <> '' then
        begin
          S := Copy(S, 1, Length(S) - 1);
          S := '(' + S + ')';

          Dlg := TfmDeliveryOfGoods.Create(Application);
          dmDataModule.quDeliveryOfGoods.Open;
          Dlg.CoolBar1.Visible := false;
 // Dlg.RxDBGrid1.Enabled := false ;
          try
           if Dlg.ShowModal = mrok then begin
                                  DeliveryTovarNo := data.dmDataModule.quDeliveryOfGoodsDeliveryTovarNo.Value;
                                end;
          finally
            dmDataModule.quDeliveryOfGoods.Close;
            Dlg.Free;
          end;
          RequestForSupply(S,DeliveryTovarNo);
        end;
      end;
    8:
      begin
        S := '';
        for c := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          quNaklR.Bookmark := RxDBGrid1.SelectedRows[c];
          S := S + quNaklR.FieldByName('NaklNo').AsString + ',';
        end;
        if S <> '' then
        begin
          S := Copy(S, 1, Length(S) - 1);
          S := '(' + S + ')';
          LoadCarNaklTrebIM(S);
        end;
      end;
    9:
      begin
        S := '';
        for c := 0 to RxDBGrid1.SelectedRows.Count - 1 do
        begin
          quNaklR.Bookmark := RxDBGrid1.SelectedRows[c];
          S := S + quNaklR.FieldByName('NaklNo').AsString + ',';
        end;
        if S <> '' then
        begin
          S := Copy(S, 1, Length(S) - 1);
          S := '(' + S + ')';
          LoadCarNaklTrebPostIM(S);
        end;
      end;
    10:
     begin
        Print3:=fmNaklR_.quNaklR.FieldByName('Print3').AsBoolean;
        PrintNaklTransportRasNew(quNaklR.FieldByName('NaklNo').AsInteger,True,Print3);
      end;
  end;
end;

procedure TfmNaklR_.ActionPrintNaklExecute(Sender: TObject);
var Print3 :boolean;
begin
  if fmNaklR_.quNaklR.FieldByName('Print3').IsNull then
   Print3:= false
  else
   Print3:=fmNaklR_.quNaklR.FieldByName('Print3').AsBoolean;
  if fmNaklR_.quNaklR.FieldByName('Buh').AsInteger = 2 then
  begin
    PrintNaklRasNew(quNaklR.FieldByName('NaklNo').AsInteger, False, False, True, Print3);
    //PrintNaklRas(2, fmNaklR_.quNaklRNaklNo.AsInteger,False,False);
  end
  else
  begin
    PrintNaklRasNew(quNaklR.FieldByName('NaklNo').AsInteger, False, False, False, Print3);
    //PrintNaklRas(1, fmNaklR_.quNaklRNaklNo.AsInteger,False,False);
    //PrintNaklRShort(fmNaklR_.quNaklRNaklNo.AsInteger, False);
  end;
  if not fmNaklR_.quNaklR.Eof then fmNaklR_.quNaklR.Next;
end;
   
procedure TfmNaklR_.ActionDeleteExecute(Sender: TObject);
begin
  if (MessageDlg('Вы уверены что хотите удалить накладную ?', mtConfirmation, [mbNo, mbYes], 0) in [mrYes]) then quNaklR.Delete;
end;

procedure TfmNaklR_.ActionAddExecute(Sender: TObject);
var
  Pkey: Int64;
begin
  dmDataModule.quCurrency.Open;
  TfmEditNaklR.EditNaklR(Pkey, 'ADD', false, false);
  dmDataModule.quCurrency.Close;
  ActionViewRefresh.Execute;
  quNaklR.Locate('Pkey', Pkey, []);
end;

procedure TfmNaklR_.ActionExitExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmNaklR_.ActionExportExecute(Sender: TObject);
var DataSetFrom,DataSetTo : TDataSet;
    FTable_ID : int64;
    NaklRList : String;
    i         : integer;
begin
  inherited;
{Экспорт в dbf}
  if SaveDialogDBF.Execute then
  begin
     try
      NaklRList:='-1';
      if RxDBGrid1.SelCount = 0 then RxDBGrid1.ToggleRowSelection;
      for i:=0 to RxDBGrid1.SelCount-1 do
      begin
         RxDBGrid1.GotoSelection(i);
         NaklRList := NaklRList +','+ quNaklR.FieldByName('Nom').AsString;
      end;

      quNaklR_Export.Close;
      quNaklR_Export.SQL.Clear;
      quNaklR_Export.SQL.Add('select * from v_NaklR_Export');
      quNaklR_Export.SQL.Add('where NTTN in ('+NaklRList+') and SUMMA >0');  //and SUMMA >0 для нормальной выгрузки Порча-Возврат
      quNaklR_Export.Prepare;
      quNaklR_Export.Open;

      FTable_ID:=1;
      DataSetFrom :=quNaklR_Export as TDataset;
      DataSetTo:= CreateDBFDataSet(FTable_ID,SaveDialogDBF.FileName) as TDataset;
      ExportTODBF(DataSetFrom,DataSetTo,True);
      quNaklR_Export.Close;
     except
      ShowMessage('Ошибка экспорта в dbf');
     end;

  end;
end;

procedure TfmNaklR_.CreateNaklPClick(Sender: TObject);
var
  S, ListErrorTovar, ListErrorNaklNo : string;
  RetPost: TRetPost;
  c,PostNo,Buh,OtdelNo,NaklNoP : integer;
  Dlg:TMlekoSelectBuhDlg;
  Dlg1:TMlekoSelectOtdelDlg;
  quCheckCreateNaklNo : TMSQuery;
  IsRun : boolean;
begin
  inherited;


  ListErrorTovar := '';
  ListErrorNaklNo := '';
  IsRun := True;
  if quNaklR.FieldByName('PostNo').AsInteger = 793 then
  if Application.MessageBox('Будет сформирована приходная накладная , вы уверены?', 'Приходная накладная', MB_YESNO) = IDYES then
   begin
     if RxDBGrid1.SelectedRows.Count > 0 then begin
                                                S := '';
                                                for c := 0 to RxDBGrid1.SelectedRows.Count - 1 do begin
                                                                                                    quNaklR.Bookmark := RxDBGrid1.SelectedRows[c];
                                                                                                    S := S + quNaklR.FieldByName('NaklNo').AsString + ',';

                                                                                                    quCheckCreateNaklNo := TMSQuery.Create(nil);
                                                                                                    quCheckCreateNaklNo.Connection:= dmDataModule.DB;
                                                                                                    quCheckCreateNaklNo.SQL.Clear;
                                                                                                    quCheckCreateNaklNo.SQL.Text := 'select * from l_NaklPForNaklR where NaklNoR = :NaklNoR';
                                                                                                    quCheckCreateNaklNo.ParamByName('NaklNoR').Value := quNaklR.FieldByName('NaklNo').AsInteger;
                                                                                                    quCheckCreateNaklNo.Open;
                                                                                                    if quCheckCreateNaklNo.RecordCount <> 0 then
                                                                                                     begin
                                                                                                       quCheckCreateNaklNo.First;
                                                                                                       while not quCheckCreateNaklNo.Eof do begin
                                                                                                                                              ListErrorNaklNo := ListErrorNaklNo + quNaklR.FieldByName('NaklNo').AsString + #10#13;
                                                                                                                                              NaklNoP := quCheckCreateNaklNo.FieldByName('NaklNoP').AsInteger;
                                                                                                                                              quCheckCreateNaklNo.Next;
                                                                                                                                            end;
                                                                                                     end;
                                                                                                    quCheckCreateNaklNo.Close;
                                                                                                  end;
                                                if S <> '' then  begin
                                                                   S := Copy(S, 1, Length(S) - 1);
                                                                   S := '(' + S + ')';
                                                                 end;
                                              end
                                         else begin
                                                S := '('+ quNaklR.FieldByName('NaklNo').AsString + ')';

                                                quCheckCreateNaklNo := TMSQuery.Create(nil);
                                                quCheckCreateNaklNo.Connection:= dmDataModule.DB;
                                                quCheckCreateNaklNo.SQL.Clear;
                                                quCheckCreateNaklNo.SQL.Text := 'select * from l_NaklPForNaklR where NaklNoR = :NaklNoR';
                                                quCheckCreateNaklNo.ParamByName('NaklNoR').Value := quNaklR.FieldByName('NaklNo').AsInteger;
                                                quCheckCreateNaklNo.Open;
                                                if quCheckCreateNaklNo.RecordCount <> 0 then
                                                 begin
                                                   quCheckCreateNaklNo.First;
                                                   while not quCheckCreateNaklNo.Eof do begin
                                                                                          ListErrorNaklNo := ListErrorNaklNo + quNaklR.FieldByName('NaklNo').AsString + #10#13;
                                                                                          NaklNoP := quCheckCreateNaklNo.FieldByName('NaklNoP').AsInteger;
                                                                                          quCheckCreateNaklNo.Next;
                                                                                        end;
                                                 end;
                                                quCheckCreateNaklNo.Close;
                                              end;
     if ListErrorNaklNo <> '' then raise Exception.Create(' Накладная уже создавалась!' + #10#13 +
                                                          'Список накладных :'+ ListErrorNaklNo + #10#13 +
                                                          'Для повторного создания , '+ #10#13 +
                                                          'необходимо удалить приходную накладную :'+ #10#13 + IntToStr(NaklNoP));

     RetPost := Post(True, True);
     if RetPost.PostNo <> 0 then begin
                                   PostNo := RetPost.PostNo;
                                 end
                            else begin
                                   IsRun := False;
                                   ShowMessage ('Отменено пользователем!');
                                 end;

     if IsRun then begin
                     Dlg := TMlekoSelectBuhDlg.Create(Application);
                     try
                      if Dlg.ShowModal = mrok Then begin
                                                     Buh := Dlg.Query.FieldByName('Buh').Value;
                                                   end
                                              Else begin
                                                     IsRun := False;
                                                     ShowMessage ('Отменено пользователем!');
                                                   end;
                     finally
                      Dlg.Query.Close;
                      Dlg.Free;
                     end;
                   end;

     if IsRun then begin
                     Dlg1 := TMlekoSelectOtdelDlg.Create(Application);
                     try
                      if Dlg1.ShowModal = mrok Then begin
                                                      OtdelNo := Dlg1.Query.FieldByName('OtdelNo').Value;
                                                    end
                                               else begin
                                                      IsRun := False;
                                                      ShowMessage ('Отменено пользователем!');
                                                    end;
                     finally
                      Dlg1.Query.Close;
                      Dlg1.Free;
                     end;
                   end;

     if not IsRun  then begin
                          quCreateNaklP.Close;
                          raise Exception.Create('Создание Приходной накладной прекращено пользователем!');
                        end;

     quCreateNaklP.ParamByName('PostNo').Value := PostNo;
     quCreateNaklP.ParamByName('Buh').Value := Buh;
     quCreateNaklP.ParamByName('OtdelNo').Value := OtdelNo;
     quCreateNaklP.ParamByName('UserNo').Value := Data.UserNo;

     quCreateNaklP.MacroByName('_NaklS').Value:= S;
     quCreateNaklP.MacroByName('_NaklNo').Value:= S;
     quCreateNaklP.MacroByName('_NaklL').Value:= S;

     quCeckCreatenaklP.MacroByName('_NaklS').Value:= S;
     quCeckCreatenaklP.Open;


     if quCeckCreateNaklP.RecordCount > 0 then begin
                                                 ListErrorTovar := 'Список не привязанного товара:' +#13#10;
                                                 quCeckCreatenaklP.First;
                                                 while not quCeckCreatenaklP.Eof do begin
                                                                                      ListErrorTovar := ListErrorTovar + quCeckCreatenaklP.FieldByName('TovarNo').AsString +' '+quCeckCreatenaklP.FieldByName('NameTovar').AsString +#13#10;
                                                                                      quCeckCreateNaklP.Next;
                                                                                    end;
                                               end;


     if ListErrorTovar <> '' then raise Exception.Create(' Есть не привязанный товар!' +#13#10+
                                                         'Накладная создана не будет!' +#13#10+ ListErrorTovar)
                             else if isRun then quCreateNaklP.Execute;


     if isRun then begin
                     ShowMessage('Создание Приходной накладной завершено!')
                   end
              else begin
                     ShowMessage('Создание Приходной накладной прекращено пользователем!');
                     quCreateNaklP.Close;
                   end;
//     ShowMessage('PostNo: '+IntToStr(PostNo)+ ' Бух: '+IntToStr(Buh)+ ' Отдел: '+IntToStr(OtdelNo))

   end;
end;

end.

