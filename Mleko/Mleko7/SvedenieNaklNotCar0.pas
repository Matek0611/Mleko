unit SvedenieNaklNotCar0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, DBAccess, MsAccess, MemDS, DBGridEh, StdCtrls,
  Buttons, ExtCtrls, Math, ToolWin, ComCtrls, GridsEh,
  comp_TargetFilter_CustomFilter, comp_TargetFilter_DateFilter, ActnList;

type
  TfmSvedenieNaklNotCar = class(TMlekoForm)
    quNaklR: TMSQuery;
    dsNaklR: TDataSource;
    quNaklRSumm: TMSQuery;
    quNaklRSummSumma: TFloatField;
    quNaklRSummWeight: TFloatField;
    quNaklRSummKolPerPak: TFloatField;
    quNaklRUpDate: TMSQuery;
    BCDField1: TFloatField;
    BCDField2: TFloatField;
    BCDField3: TFloatField;
    quWork: TMSQuery;
    UpdateSQL1: TMSUpdateSQL;
    quWork1: TMSQuery;
    CoolBar1: TToolBar;
    sbEdit: TSpeedButton;
    sbDel: TSpeedButton;
    sbPrev: TSpeedButton;
    sbPrint: TSpeedButton;
    DBGridEh1: TDBGridEh;
    sbSvedenie: TSpeedButton;
    ToolButton1: TToolButton;
    bbCancel: TBitBtn;
    ToolButton2: TToolButton;
    fltDateNakl: TTargetFilter_DateFilter;
    procedure quNaklRBeforeDelete(DataSet: TDataSet);
    procedure quNaklRBeforePost(DataSet: TDataSet);
    procedure sbDelClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbPrevClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure sbSvedenieClick(Sender: TObject);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure quNaklRBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    SearchString: string;
    bmCheck: TBitMap;
  public
    { Public declarations }
  end;

var
  fmSvedenieNaklNotCar: TfmSvedenieNaklNotCar;
  NoRashod: integer;
  SvedenieTrue: Boolean;
procedure SvedenieNaklNotCar;

implementation
//uses  data;
uses data, SelectItem0, Otchets0, RecycleExpedition0, main, EditNaklR0;
{$R *.dfm}

procedure SvedenieNaklNotCar;
begin
  fmSvedenieNaklNotCar := TfmSvedenieNaklNotCar.Create(Application);
  try
    fmSvedenieNaklNotCar.fltDateNakl.a_Minimum := main.GlobalDateNakl - 1;
    fmSvedenieNaklNotCar.fltDateNakl.a_Maximum := main.GlobalDateNakl;
    fmSvedenieNaklNotCar.quNaklR.Open;
    fmSvedenieNaklNotCar.ShowModal;
  finally
    fmSvedenieNaklNotCar.quNaklR.Close;
    fmSvedenieNaklNotCar.Free;
  end;
end;

procedure TfmSvedenieNaklNotCar.quNaklRBeforeDelete(DataSet: TDataSet);
begin
  UpdateSQL1.Apply(ukDelete);
end;

procedure TfmSvedenieNaklNotCar.quNaklRBeforePost(DataSet: TDataSet);
begin
  quWork.SQL.Clear;
  quWork.SQL.Add('SELECT Rashod.NaklNo, SUM(Rashod.Kol * Tovar.Weight / 1000) AS Weight, SUM(Rashod.Kol / Tovar.KolPerPak) AS KolPerPak ');
  quWork.SQL.Append('FROM Rashod INNER JOIN');
  quWork.SQL.Append('Tovar ON Rashod.TovarNo = Tovar.TovarNo ');
  quWork.SQL.Append('WHERE (NOT (Tovar.Weight IS NULL)) AND (Tovar.Weight <> 0) AND (NOT (Tovar.KolPerPak IS NULL)) AND (Tovar.KolPerPak <> 0) ');
  quWork.SQL.Append('GROUP BY Rashod.NaklNo ');
  quWork.SQL.Append('HAVING (Rashod.NaklNo = :NaklNo) ');
  quWork.ParamByName('NaklNo').AsInteger := quNaklR.FieldByName('NaklNo').AsInteger;
  quWork.Open;

  quNaklR.FieldByName('Weight').AsFloat := RoundTo(quWork.FieldByName('Weight').AsFloat, -2);
  quNaklR.FieldByName('KolPerPak').AsFloat := Round(quWork.FieldByName('KolPerPak').AsFloat);

  if SvedenieTrue then quNaklR.FieldByName('Svedenie').AsBoolean := True;

  UpdateSQL1.Apply(ukModify);

  dmDataModule.quWork.Close;
end;

procedure TfmSvedenieNaklNotCar.sbDelClick(Sender: TObject);
begin
  if (Application.MessageBox('Вы уверены, что хотите удалить накладную?', 'Удаление', MB_YESNO) = IDYES) then
  begin
    quNaklR.Delete;
  end;
end;

procedure TfmSvedenieNaklNotCar.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col, DBGridEh1.Row).Top) and (not (gdFocused in State) or not DBGridEh1.Focused) then
    DBGridEh1.Canvas.Brush.Color := clSilver;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  if (DataCol = 0) then
  begin
    if (quNaklR.FieldByName('Svedenie').AsBoolean) then
      DBGridEh1.Canvas.Draw(Rect.Left, Rect.Top, bmCheck)
  end;
end;

procedure TfmSvedenieNaklNotCar.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  FoundNaklNo: integer;
begin
  case Key of
    VK_SPACE:
      begin
        {quNaklRUpDate.Close;
        quNaklRUpDate.ParamByName('NaklNo').AsInteger:=quNaklR.FieldByName('NaklNo').AsInteger;
        if quNaklRInCar.AsBoolean then
         quNaklRUpDate.ParamByName('InCar').AsBoolean:=False
        else
         quNaklRUpDate.ParamByName('InCar').AsBoolean:=True;
        quNaklRUpDate.Execute;
        FoundNaklNo:=quNaklR.FieldByName('NaklNo').AsInteger;
        quNaklR.Close;
        quNaklR.Open;
        quNaklR.Locate('NaklNo',FoundNaklNo,[]);}
      end;
    VK_RETURN:
      begin
        Key := 0;
        sbEditClick(Sender);
      end;
    VK_INSERT:
      begin
        Key := 0;
        //bbInsertClick(Sender);
      end;
    VK_DELETE:
      begin
        Key := 0;
        sbDelClick(Sender);
      end;
    VK_DOWN, VK_UP, VK_LEFT, VK_RIGHT: SearchString := '';
    VK_F5:
      begin
        sbPrevClick(Sender);
      end;
    VK_F6:
      begin
        sbPrintClick(Sender);
      end;
  end;
end;

procedure TfmSvedenieNaklNotCar.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
var
  Found: boolean;
begin
  if (Key in Data.SearchSet) then
  begin
    SearchString := SearchString + Key;
    Key := Chr(0);
    Found := False;
    try
      Found := DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.Col].FieldName, SearchString, [loPartialKey, loCaseInsensitive]);
    except
      SearchString := '';
    end;
    if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col].Field.DataType = ftString) then
      SearchString := Copy(SearchString, 1, length(SearchString) - 1);
  end;
end;

procedure TfmSvedenieNaklNotCar.DBGridEh1DblClick(Sender: TObject);
begin
  sbEditClick(Sender);
end;

procedure TfmSvedenieNaklNotCar.sbEditClick(Sender: TObject);
var
  Pkey: Int64;
begin
  pkey := quNaklR.fieldByName('pkey').Value;
  TfmEditNaklR.EditNaklR(Pkey, 'EDIT', False, false, true);
  quNaklR.Refresh;
  if not quNaklR.fieldByName('Svedenie').AsBoolean then
  begin
    if not (quNaklR.State in [dsEdit, dsInsert]) then quNaklR.Edit;
    if MessageDlg('Желаете поставить пометку о том что накладная сведена?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      quNaklR.FieldByName('Svedenie').AsBoolean := True
    else
      quNaklR.FieldByName('Svedenie').AsBoolean := False;
  end;
  if quNaklR.State in [dsEdit, dsInsert] then quNaklR.Post;
end;


procedure TfmSvedenieNaklNotCar.sbPrevClick(Sender: TObject);
var
  i: integer;
begin
  i := SelectItem('Печать', ['Товарная накладная', 'Транспортная накладная']);
  case i of
    0:
      begin
        if quNaklR.FieldByName('Buh').AsInteger = 2 then
          PrintNaklRasNew(quNaklR.FieldByName('NaklNo').AsInteger, False, True, True, quNaklR.FieldByName('Print3').AsBoolean)
        else
          PrintNaklRasNew(quNaklR.FieldByName('NaklNo').AsInteger, False, True, False, quNaklR.FieldByName('Print3').AsBoolean);
      end;
    1:
      begin
        PrintNaklTransportRasNew(quNaklR.FieldByName('NaklNo').AsInteger, True, quNaklR.FieldByName('Print3').AsBoolean);
      end;
  end;
  ActiveControl := DBGridEh1;
end;

procedure TfmSvedenieNaklNotCar.sbPrintClick(Sender: TObject);
var
  i: integer;
begin
  i := SelectItem('Печать', ['Товарная накладная', 'Товарно-транспортная накладная']);
  case i of
    0:
      begin
        if quNaklR.FieldByName('Buh').AsInteger = 2 then
          PrintNaklRasNew(quNaklR.FieldByName('NaklNo').AsInteger, False, False, True, quNaklR.FieldByName('Print3').AsBoolean)
        else
          PrintNaklRasNew(quNaklR.FieldByName('NaklNo').AsInteger, False, False, False, quNaklR.FieldByName('Print3').AsBoolean);
      end;
    1:
      begin
        PrintNaklTransportRasNew(quNaklR.FieldByName('NaklNo').AsInteger, False, quNaklR.FieldByName('Print3').AsBoolean);
      end;
  end;
  ActiveControl := DBGridEh1;
end;

procedure TfmSvedenieNaklNotCar.sbSvedenieClick(Sender: TObject);
begin
  RecycleExpedition(0);
end;

procedure TfmSvedenieNaklNotCar.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  NaklNo: integer;
begin
  Screen.Cursor := crHourGlass;
  NaklNo := quNaklR.FieldByName('NaklNo').AsInteger;
  quNaklR.Close;
  case ACol of
    1: quNaklR.MacroByName('_order').Value := 'Nom';
    2: quNaklR.MacroByName('_order').Value := 'DateNakl';
    3: quNaklR.MacroByName('_order').Value := 'TipName';
    4: quNaklR.MacroByName('_order').Value := 'Post.Name';
    5: quNaklR.MacroByName('_order').Value := 'NameFirst';
    6: quNaklR.MacroByName('_order').Value := 'AddressPost.Address';
    7: quNaklR.MacroByName('_order').Value := 'Summa';
  end;
  quNaklR.Prepare;
  quNaklR.Open;
  quNaklR.Locate('NaklNo', NaklNo, []);
  Screen.Cursor := crDefault;
end;

procedure TfmSvedenieNaklNotCar.quNaklRBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quNaklR.ParamByName('DateNaklBeg').AsDate := fltDateNakl.a_Minimum;
  quNaklR.ParamByName('DateNaklEnd').AsDate := fltDateNakl.a_Maximum;
end;

end.

