unit SvedenieNakl0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, ImgList, DB, DBAccess, MsAccess, MemDS, DBGridEh, StdCtrls,
  Buttons, Mask, DBCtrls, ExtCtrls, Math, ToolWin, ComCtrls, GridsEh,
  ActnList;

type
  TfmSvedenieNakl = class(TMlekoForm)
    paTop: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    edDate: TDBEdit;
    edNom: TDBEdit;
    edCars: TDBEdit;
    edShipping_Agent: TDBEdit;
    quNaklR: TMSQuery;
    dsNaklR: TDataSource;
    quNaklRSumm: TMSQuery;
    quNaklRSummSumma: TFloatField;
    quNaklRSummWeight: TFloatField;
    quNaklRSummKolPerPak: TFloatField;
    ImageList1: TImageList;
    quNaklRUpDate: TMSQuery;
    BCDField1: TFloatField;
    BCDField2: TFloatField;
    BCDField3: TFloatField;
    quWork: TMSQuery;
    quWork1: TMSQuery;
    quVidNakl: TMSQuery;
    quVidNaklVidNaklNo: TSmallintField;
    quVidNaklVidNaklName: TStringField;
    quTipNakl: TMSQuery;
    quTipNaklTipNo: TSmallintField;
    quTipNaklTipName: TStringField;
    CoolBar1: TToolBar;
    sbEdit: TSpeedButton;
    sbDel: TSpeedButton;
    sbPrev: TSpeedButton;
    sbPrint: TSpeedButton;
    DBGridEh1: TDBGridEh;
    sbBlankOst: TSpeedButton;
    bbCancel: TBitBtn;
    ToolButton1: TToolButton;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure quNaklRBeforePost(DataSet: TDataSet);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbPrevClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure sbBlankOstClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    SearchString: string;
    bmCheck: TBitMap;
    LastIndex: Integer;
    Descending: Boolean;    
  public
    { Public declarations }
  end;

var
  SvedenieTrue: Boolean;
  fmSvedenieNakl: TfmSvedenieNakl;
  CurExpeditionNo: integer;
procedure SvedenieNakl(ExpeditionNo: integer);

implementation

uses data, Expedition0, 
  SelectItem0, Otchets0, BlankOst0, EditNaklR0;
//, Cars0, Data, Shipping_Agent0, ExpeditionNakl0,
//     GetPeriodDate0, EditNaklR0;

{$R *.dfm}

procedure SvedenieNakl(ExpeditionNo: integer);
begin
  fmSvedenieNakl := TfmSvedenieNakl.Create(Application);
  try
    fmSvedenieNakl.quNaklR.ParamByName('ExpeditionNo').AsInteger := ExpeditionNo;
    fmSvedenieNakl.quNaklR.Open;
    CurExpeditionNo := ExpeditionNo;
    if fmSvedenieNakl.ShowModal = mrCancel then
    begin
      if fmExpedition.quExpedition.State in [dsEdit, dsInsert] then
        fmExpedition.quExpedition.Post;
      //   if fmEditExpedition.quNaklR.State in [dsEdit,dsInsert] then
      //    fmEditExpedition.quNaklR.Post;
    end
    else
    begin
      if fmExpedition.quExpedition.State in [dsEdit, dsInsert] then
        fmExpedition.quExpedition.Cancel;
      //   if fmEditExpedition.quNaklR.State in [dsEdit,dsInsert] then
      //    fmEditExpedition.quNaklR.Post;
    end;
  finally
    fmSvedenieNakl.quNaklR.Close;
    fmSvedenieNakl.Free;
  end;
end;

procedure TfmSvedenieNakl.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  FoundNaklNo: integer;
begin
  case Key of
    VK_SPACE:
      begin
        {quNaklRUpDate.Close;
        quNaklRUpDate.ParamByName('NaklNo').AsInteger:=quNaklRNaklNo.AsInteger;
        if quNaklRInCar.AsBoolean then
         quNaklRUpDate.ParamByName('InCar').AsBoolean:=False
        else
         quNaklRUpDate.ParamByName('InCar').AsBoolean:=True;
        quNaklRUpDate.Execute;
        FoundNaklNo:=quNaklRNaklNo.AsInteger;
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

procedure TfmSvedenieNakl.DBGridEh1KeyPress(Sender: TObject;
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

procedure TfmSvedenieNakl.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
 FindNaklRNo:integer;
 MacroValue: String;
 OldColumn: TColumnEh;
begin
 Screen.Cursor:=crHourGlass;
 FindNaklRNo := quNaklR.FieldByName('NaklNo').AsInteger;
 quNaklR.Close;
 if (ACol in [1,2,4,6,7,9,10]) then
 begin
 if (LastIndex<>ACol) then
    begin
    if (LastIndex>=0) then
       begin
         OldColumn:= DBGridEh1.Columns[LastIndex];
         OldColumn.Title.SortMarker:= smNoneEh;
       end;
    Descending:= false;
    end;
 case ACol of
    1: MacroValue := 'NaklR.Nom';
    2: MacroValue := 'NaklR.DateNaklFirst,NaklR.Nom';
    4: MacroValue := 'Post.Name';
    6: MacroValue := 'AddressPost.Address';
    7: MacroValue := 'NaklR.Summa';
    9:MacroValue:=   'NaklR.OrderInFlight';
   10:MacroValue:=   'NaklR.ArrivalTime';
 end;
 if Descending then MacroValue:= MacroValue + ' desc';
 if Descending then
    Column.Title.SortMarker:= smUpEh else
    Column.Title.SortMarker:= smDownEh;
 LastIndex:= ACol;
 Descending:= not Descending;
 end;
 quNaklR.MacroByName('_order').Value:= MacroValue;
 quNaklR.Prepare;
 quNaklR.Open;
 quNaklR.Locate('NaklNo',FindNaklRNo,[]);
 Screen.Cursor:=crDefault;
end;


procedure TfmSvedenieNakl.DBGridEh1DrawColumnCell(Sender: TObject;
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

procedure TfmSvedenieNakl.quNaklRBeforePost(DataSet: TDataSet);
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
  dmDataModule.quWork.Close;
end;

procedure TfmSvedenieNakl.DBGridEh1DblClick(Sender: TObject);
begin
  sbEditClick(Sender);
end;

procedure TfmSvedenieNakl.sbDelClick(Sender: TObject);
begin
  if (Application.MessageBox('Вы уверены, что хотите удалить накладную?', 'Удаление', MB_YESNO) = IDYES) then
  begin
    quNaklR.Delete;
    quNaklR.Refresh;
  end;
end;

procedure TfmSvedenieNakl.sbEditClick(Sender: TObject);
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

procedure TfmSvedenieNakl.sbPrevClick(Sender: TObject);
var
  i: integer;
begin
  i := SelectItem('Печать', ['Товарная накладная', 'Транспортная накладная']);
  case i of
    0:
      begin
        if quNaklR.fieldByName('Buh').AsInteger = 2 then
          PrintNaklRasNew(quNaklR.fieldByName('NaklNo').AsInteger, False, True, True, quNaklR.fieldByName('Print3').AsBoolean)
        else
          PrintNaklRasNew(quNaklR.fieldByName('NaklNo').AsInteger, False, True, False, quNaklR.fieldByName('Print3').AsBoolean);
      end;
    1:
      begin
        PrintNaklTransportRasNew(quNaklR.fieldByName('NaklNo').AsInteger, True, quNaklR.fieldByName('Print3').AsBoolean);
      end;
  end;
  ActiveControl := DBGridEh1;
end;

procedure TfmSvedenieNakl.sbPrintClick(Sender: TObject);
var
  i: integer;
begin
  i := SelectItem('Печать', ['Товарная накладная', 'Товарно-транспортная накладная']);
  case i of
    0:
      begin
        if quNaklR.fieldByName('Buh').AsInteger = 2 then
          PrintNaklRasNew(quNaklR.fieldByName('NaklNo').AsInteger, False, False, True, quNaklR.fieldByName('Print3').AsBoolean)
        else
          PrintNaklRasNew(quNaklR.fieldByName('NaklNo').AsInteger, False, False, False, quNaklR.fieldByName('Print3').AsBoolean);
      end;
    1:
      begin
        PrintNaklTransportRasNew(quNaklR.fieldByName('NaklNo').AsInteger, False, quNaklR.fieldByName('Print3').AsBoolean);
      end;
  end;
  ActiveControl := DBGridEh1;
end;

procedure TfmSvedenieNakl.sbBlankOstClick(Sender: TObject);
begin
  BlankOstatok(fmExpedition.quExpeditionExpeditionNo.AsInteger);
end;

procedure TfmSvedenieNakl.FormCreate(Sender: TObject);
begin
  inherited;
  LastIndex:= -1;
end;

end.

