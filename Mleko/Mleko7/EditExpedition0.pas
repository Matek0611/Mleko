unit EditExpedition0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,  MlekoForm,
  Dialogs, DB, StdCtrls, Buttons, Mask,
  DBCtrls, ExtCtrls, DBAccess, MsAccess, MemDS, DBGridEh, ImgList, GridsEh,
  ActnList, Forms;

type
  TfmEditExpedition = class(TMlekoForm)
    paTop: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    edDate: TDBEdit;
    edNom: TDBEdit;
    edCars: TDBEdit;
    paMiddle: TPanel;
    paBottom: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    edShipping_Agent: TDBEdit;
    quNaklR: TMSQuery;
    dsNaklR: TDataSource;
    quNaklRNaklNo: TIntegerField;
    quNaklRNom: TIntegerField;
    quNaklRSumma: TFloatField;
    quNaklRName: TStringField;
    quNaklRExpeditionNo: TSmallintField;
    quNaklRAddress: TStringField;
    quNaklRSumm: TMSQuery;
    quNaklRSummSumma: TFloatField;
    quNaklRKolPerPak: TFloatField;
    quNaklRWeight: TFloatField;
    quNaklRDateNakl: TDateTimeField;
    quNaklRSummWeight: TFloatField;
    quNaklRSummKolPerPak: TFloatField;
    DBGridEh1: TDBGridEh;
    quNaklRBuh: TSmallintField;
    quNaklRInCar: TBooleanField;
    ImageList1: TImageList;
    quNaklRUpDate: TMSQuery;
    BCDField1: TFloatField;
    BCDField2: TFloatField;
    BCDField3: TFloatField;
    quNaklRNameFirst: TStringField;
    quWork: TMSQuery;
    quNaklRPrint3: TBooleanField;
    quNaklRSourceTable: TStringField;
    quBlankHeadUpDate: TMSQuery;
    BCDField4: TFloatField;
    BCDField5: TFloatField;
    BCDField6: TFloatField;
    quNaklRVidNaklName: TStringField;
    bbInsert: TBitBtn;
    bbDelete: TBitBtn;
    bbPriview: TBitBtn;
    bbPrint: TBitBtn;
    Label2: TLabel;
    TTN_Query: TMSQuery;
    procedure edCarsEnter(Sender: TObject);
    procedure ChangeCars;
    procedure ChangeShipping_Agent;
    procedure edCarsDblClick(Sender: TObject);
    procedure edCarsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure paTopExit(Sender: TObject);
    procedure edShipping_AgentDblClick(Sender: TObject);
    procedure edShipping_AgentEnter(Sender: TObject);
    procedure edShipping_AgentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbCancelClick(Sender: TObject);
    procedure bbInsertClick(Sender: TObject);
    procedure bbDeleteClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure bbPrintClick(Sender: TObject);
    procedure bbPriviewClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
    SearchString:string;
    bmHelp:TBitmap;
  public
    { Public declarations }
  end;

var
  fmEditExpedition: TfmEditExpedition;
  procedure EditExpedition(ExpeditionNo: integer);

implementation

uses Expedition0, Cars0, Data, Shipping_Agent0, ExpeditionNakl0,
     GetPeriodDate0,  SelectItem0, Otchets0;

{$R *.dfm}

procedure EditExpedition(ExpeditionNo: integer);
begin
 fmEditExpedition:=TfmEditExpedition.Create(Application);
 try
  fmEditExpedition.quNaklR.ParamByName('ExpeditionNo').AsInteger:=ExpeditionNo;
  fmEditExpedition.quNaklR.Open;
 if fmEditExpedition.ShowModal=mrOk then
  begin
   if fmExpedition.quExpedition.State in [dsEdit,dsInsert] then
    fmExpedition.quExpedition.Post;
//   if fmEditExpedition.quNaklR.State in [dsEdit,dsInsert] then
//    fmEditExpedition.quNaklR.Post;
  end
 else
  begin
   if fmExpedition.quExpedition.State in [dsEdit,dsInsert] then
    fmExpedition.quExpedition.Cancel;
//   if fmEditExpedition.quNaklR.State in [dsEdit,dsInsert] then
//    fmEditExpedition.quNaklR.Post;
  end;

 finally

 if StrToDate(fmEditExpedition.edDate.Text) < dmDataModule.quSetupDateBlock.AsDateTime then
  begin
    MessageDlg('Период заблокирован!!!', mtError, [mbOk], 0);
    fmEditExpedition.ActiveControl := fmEditExpedition.edDate;
  end;

 fmEditExpedition.quNaklR.Close;
 fmEditExpedition.Free;
 end;
end;

procedure TfmEditExpedition.ChangeShipping_Agent;
var
 ChangeShipping_AgentNo: integer;
begin
 ChangeShipping_AgentNo:=Shipping_Agent(True, True);
 if ChangeShipping_AgentNo>0 then
  begin
   if not (fmExpedition.quExpedition.State in [dsInsert,dsEdit]) then
    fmExpedition.quExpedition.Edit;
   fmExpedition.quExpeditionExpeditionShipping_AgentNo.AsInteger:=ChangeShipping_AgentNo;
   dmDataModule.quShipping_Agent.Open;
   dmDataModule.quShipping_Agent.Locate('Shipping_AgentNo',ChangeShipping_AgentNo,[]);
   fmExpedition.quExpeditionShipping_AgentName.AsString:=dmDataModule.quShipping_Agent.FieldByName('Shipping_AgentName').AsString;
   dmDataModule.quShipping_Agent.Close;
  end;
end;

procedure TfmEditExpedition.ChangeCars;
var
 CarsNo: integer;
begin
 CarsNo:=Cars(True, True, True);
 if CarsNo>0 then
  begin
   if not (fmExpedition.quExpedition.State in [dsInsert,dsEdit]) then
    fmExpedition.quExpedition.Edit;
   fmExpedition.quExpeditionExpeditionCarsNo.AsInteger:=CarsNo;
   dmDataModule.quCars.Open;
   dmDataModule.quCars.Locate('CarsNo',CarsNo,[]);
   fmExpedition.quExpeditionCarsName.AsString:=dmDataModule.quCars.FieldByName('CarsName').AsString;
   dmDataModule.quCars.Close;
  end;
end;

procedure TfmEditExpedition.edCarsEnter(Sender: TObject);
begin
 if fmExpedition.quExpeditionExpeditionCarsNo.AsInteger=0 then
  ChangeCars;
end;

procedure TfmEditExpedition.edCarsDblClick(Sender: TObject);
begin
 ChangeCars;
end;

procedure TfmEditExpedition.edCarsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  ChangeCars;
end;

procedure TfmEditExpedition.paTopExit(Sender: TObject);
begin
{ if fmExpedition.quExpedition.State in [dsInsert,dsEdit] then
  fmExpedition.quExpedition.Post;}
end;

procedure TfmEditExpedition.edShipping_AgentDblClick(Sender: TObject);
begin
 ChangeShipping_Agent;
end;

procedure TfmEditExpedition.edShipping_AgentEnter(Sender: TObject);
begin
 if fmExpedition.quExpeditionExpeditionShipping_AgentNo.AsInteger=0 then
  ChangeShipping_Agent;
end;

procedure TfmEditExpedition.edShipping_AgentKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
  ChangeShipping_Agent;
end;

procedure TfmEditExpedition.bbCancelClick(Sender: TObject);
begin
{ if (fmExpedition.quExpedition.State in [dsInsert]) then
  fmExpedition.quExpedition.Delete;}
 Close;
end;

procedure TfmEditExpedition.bbInsertClick(Sender: TObject);
var
 Period: TDatePeriod;
 ExpeditionNakl: TExpeditionNakl;
 FindExpeditionNo, FindNaklNo: integer;
begin
 if fmExpedition.quExpedition.State in [dsInsert,dsEdit] then
  fmExpedition.quExpedition.Post;

 Period:=GetPeriodDate(fmExpedition.quExpeditionExpeditionDateGo.AsDateTime, fmExpedition.quExpeditionExpeditionDateGo.AsDateTime);
 if Period.DateBegin=0 then exit;
 FindExpeditionNo:=StrToInt(edNom.Text);
 FindNaklNo:=GetExpeditionNakl(Period.DateBegin,Period.DateEnd, FindExpeditionNo);
 if FindNaklNo<>0 then
  begin
   quNaklR.Close;
   quNaklR.ParamByName('ExpeditionNo').AsInteger:=FindExpeditionNo;
   quNaklR.Prepare;
   quNaklR.Open;
   quNaklR.Locate('NaklNo',FindNaklNo,[]);

   quNaklRSumm.Close;
   quNaklRSumm.ParamByName('ExpeditionNo').AsInteger:=FindExpeditionNo;
   quNaklRSumm.Open;

   if not (fmExpedition.quExpedition.State in [dsInsert,dsEdit]) then
    fmExpedition.quExpedition.Edit;
   fmExpedition.quExpeditionExpeditionSumma.AsFloat:=quNaklRSummSumma.AsFloat;
   fmExpedition.quExpeditionExpeditionWeight.AsFloat:=quNaklRSummWeight.AsFloat;
   fmExpedition.quExpeditionExpeditionKolPerPak.AsFloat:=quNaklRSummKolPerPak.AsFloat;
//   fmExpedition.post;
  end;
 ActiveControl:=DBGridEh1;
{ GetExpeditionNakl(ColnPrice,VidNaklNo:integer):TExpeditionNakl;
  begin
   quNaklR.Append;
   quNaklR RashodTovarNo.AsInteger:=Ost.TovarNo;
   quRashodNameTovar.AsString:=Ost.NameTovar;
   quRashodKol.AsFloat:=Ost.Kol;
   quRashodPriceOut.AsFloat:=Ost.Price;
   quRashodAvgPriceIn.AsFloat:=Ost.AvgPriceIn;
   quNaklR.Post;
  end;
 if quRashod.State=dsInsert then quRashod.Cancel;}
 quWork.Close;
 quWork.SQL.Clear;
 quWork.SQL.Add('SELECT ExpeditionPrint ');
 quWork.SQL.Append('FROM Expedition ');
 quWork.SQL.Append('WHERE (ExpeditionNo = :ExpeditionNo)');
 quWork.ParamByName('ExpeditionNo').AsInteger:=fmExpedition.quExpeditionExpeditionNo.AsInteger;
 quWork.Open;
 if quWork.FieldByName('ExpeditionPrint').AsBoolean then
  MessageDlg('Внимание произведено изменение!!! Распечатайте новое требование.', mtWarning, [mbOK], 0);
 quWork.Close;
end;

procedure TfmEditExpedition.bbDeleteClick(Sender: TObject);
begin
 if not quNaklR.Eof then
  if (Application.MessageBox('Вы уверены, что хотите удалить накладную?','Удаление',MB_YESNO)=IDYES) then
   begin
   if quNaklRSourceTable.AsString='NAKLR' then
   begin
    dmDataModule.quWork.Close;
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('UPDATE NaklR ');
    dmDataModule.quWork.SQL.Append('SET ExpeditionNo = :ExpeditionNo');
    dmDataModule.quWork.SQL.Append('WHERE (NaklNo = :NaklNo)');
    dmDataModule.quWork.ParamByName('ExpeditionNo').AsInteger:=0;
    dmDataModule.quWork.ParamByName('NaklNo').AsInteger:=quNaklRNaklNo.AsInteger;
    dmDataModule.quWork.Execute;
   end;

   if quNaklRSourceTable.AsString='E_BLANK_HEAD' then
   begin
    dmDataModule.quWork.Close;
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('UPDATE E_BLANK_HEAD ');
    dmDataModule.quWork.SQL.Append('SET ExpeditionNo = :ExpeditionNo');
    dmDataModule.quWork.SQL.Append('WHERE (ID = :NaklNo)');
    dmDataModule.quWork.ParamByName('ExpeditionNo').AsInteger:=0;
    dmDataModule.quWork.ParamByName('NaklNo').AsInteger:=quNaklRNaklNo.AsInteger;
    dmDataModule.quWork.Execute;
   end;

    quNaklR.Close;
    quNaklR.ParamByName('ExpeditionNo').AsInteger:=StrToInt(edNom.Text);
    quNaklR.Prepare;
    quNaklR.Open;

    quNaklRSumm.Close;
    quNaklRSumm.ParamByName('ExpeditionNo').AsInteger:=StrToInt(edNom.Text);
    quNaklRSumm.Open;

    if not (fmExpedition.quExpedition.State in [dsInsert,dsEdit]) then
     fmExpedition.quExpedition.Edit;
    fmExpedition.quExpeditionExpeditionSumma.AsFloat:=quNaklRSummSumma.AsFloat;
    fmExpedition.quExpeditionExpeditionWeight.AsFloat:=quNaklRSummWeight.AsFloat;
    fmExpedition.quExpeditionExpeditionKolPerPak.AsFloat:=quNaklRSummKolPerPak.AsFloat;

    quWork.Close;
    quWork.SQL.Clear;
    quWork.SQL.Add('SELECT ExpeditionPrint ');
    quWork.SQL.Append('FROM Expedition ');
    quWork.SQL.Append('WHERE (ExpeditionNo = :ExpeditionNo)');
    quWork.ParamByName('ExpeditionNo').AsInteger:=fmExpedition.quExpeditionExpeditionNo.AsInteger;
    quWork.Open;
    if quWork.FieldByName('ExpeditionPrint').AsBoolean then
     MessageDlg('Внимание произведено изменение!!! Распечатайте новое требование.', mtWarning, [mbOK], 0);
    quWork.Close;
   end;
end;

procedure TfmEditExpedition.DBGrid1DblClick(Sender: TObject);
begin
// EditNaklR;
end;

procedure TfmEditExpedition.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 FoundNaklNo: integer;
begin
 case Key of
  VK_SPACE: begin
             if quNaklRSourceTable.AsString='NAKLR' then
             begin
               quNaklRUpDate.Close;
               quNaklRUpDate.ParamByName('NaklNo').AsInteger:=quNaklRNaklNo.AsInteger;
               if quNaklRInCar.AsBoolean then
                quNaklRUpDate.ParamByName('InCar').AsBoolean:=False
               else
                quNaklRUpDate.ParamByName('InCar').AsBoolean:=True;
               quNaklRUpDate.Execute;
             end;

             if quNaklRSourceTable.AsString='E_BLANK_HEAD' then
             begin
               quBlankHeadUpDate.Close;
               quBlankHeadUpDate.ParamByName('NaklNo').AsInteger:=quNaklRNaklNo.AsInteger;
               if quNaklRInCar.AsBoolean then
                quBlankHeadUpDate.ParamByName('InCar').AsBoolean:=False
               else
                quBlankHeadUpDate.ParamByName('InCar').AsBoolean:=True;
               quBlankHeadUpDate.Execute;
             end;

             FoundNaklNo:=quNaklRNaklNo.AsInteger;
             quNaklR.Close;
             quNaklR.Open;
             quNaklR.Locate('NaklNo',FoundNaklNo,[]);
            end;
  VK_RETURN:begin
             Key:=0;
             //EditNaklR;
            end;
  VK_INSERT:begin
             Key:=0;
             bbInsertClick(Sender);
            end;
  VK_DELETE:begin
             Key:=0;
             bbDeleteClick(Sender);
            end;
  VK_DOWN,VK_UP,VK_LEFT,VK_RIGHT :SearchString:='';
  VK_F5:begin
         bbPriviewClick(Sender);
        end;
  VK_F6:begin
         bbPrintClick(Sender);
        end;
  VK_F9:begin
         if (ssCtrl in Shift) and (data.CodeAccess=1) then
          begin
           if DBGridEh1.Columns[4].Visible=True then
            DBGridEh1.Columns[4].Visible:=False
           else
            DBGridEh1.Columns[4].Visible:=True;
          end;
        end;
 end;
end;

procedure TfmEditExpedition.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
var
 Found:boolean;
begin
 if (Key in Data.SearchSet) then
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.Col].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TfmEditExpedition.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
 FindNaklRNo:integer;
begin
 Screen.Cursor:=crHourGlass;
 FindNaklRNo:=quNaklRNaklNo.AsInteger;
 quNaklR.Close;
 case ACol of
  0:quNaklR.MacroByName('_order').Value:='NaklR.Nom';
  1:quNaklR.MacroByName('_order').Value:='NaklR.DateNaklFirst,NaklR.Nom';
  2:quNaklR.MacroByName('_order').Value:='Post.Name, AddressPost.Address';
  3:quNaklR.MacroByName('_order').Value:='AddressPost.Address,Post.Name';
  4:quNaklR.MacroByName('_order').Value:='NaklR.Summa, Post.Name, AddressPost.Address';
 end;
 quNaklR.Prepare;
 quNaklR.Open;
 quNaklR.Locate('NaklNo',FindNaklRNo,[]);
 Screen.Cursor:=crDefault;
end;

procedure TfmEditExpedition.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col,DBGridEh1.Row).Top) and (not (gdFocused in State) or not DBGridEh1.Focused) then
    DBGridEh1.Canvas.Brush.Color := clSilver;
  DBGridEh1.DefaultDrawColumnCell( Rect,DataCol,Column,State);
end;

procedure TfmEditExpedition.bbPrintClick(Sender: TObject);
var
 i: integer;
begin
   TTN_Query.Close;
  TTN_Query.ParamByName('aa').AsString:=DBGridEh1.Columns[3].Field.Value;  
  TTN_Query.Open;
  if TTN_Query.FieldByName('TTN').AsBoolean  = true then
   i:=SelectItem('Печать',['Товарная накладная','Товарно-транспортная накладная']) else
     i:=SelectItem('Печать',['Товарная накладная']);
  case i of
  0: begin
      if quNaklRBuh.AsInteger=2 then
       PrintNaklRasNew(quNaklRNaklNo.AsInteger, False, False, True, quNaklRPrint3.AsBoolean)
      else
       PrintNaklRasNew(quNaklRNaklNo.AsInteger, False, False, False, quNaklRPrint3.AsBoolean);
     end;
  1: begin
      PrintNaklTransportRasNew(quNaklRNaklNo.AsInteger, true, quNaklRPrint3.AsBoolean);
     end;
 end;
 ActiveControl:=DBGridEh1;
end;

procedure TfmEditExpedition.bbPriviewClick(Sender: TObject);
var
 i: integer;
begin
 i:=SelectItem('Печать',['Товарная накладная','Транспортная накладная']);
 case i of
  0: begin
      if quNaklRBuh.AsInteger=2 then
       PrintNaklRasNew(quNaklRNaklNo.AsInteger, False, True, True, quNaklRPrint3.AsBoolean)
      else
       PrintNaklRasNew(quNaklRNaklNo.AsInteger, False, True, False, quNaklRPrint3.AsBoolean);
     end;
  1: begin
      PrintNaklTransportRasNew(quNaklRNaklNo.AsInteger, True, quNaklRPrint3.AsBoolean);
     end;
 end;
 ActiveControl:=DBGridEh1;
end;

procedure TfmEditExpedition.DBGridEh1DblClick(Sender: TObject);
var
 FoundNaklNo: integer;
begin

 if quNaklRSourceTable.AsString='NAKLR' then
 begin
  quNaklRUpDate.Close;
  quNaklRUpDate.ParamByName('NaklNo').AsInteger:=quNaklRNaklNo.AsInteger;
  if quNaklRInCar.AsBoolean then
   quNaklRUpDate.ParamByName('InCar').AsBoolean:=False
  else
   quNaklRUpDate.ParamByName('InCar').AsBoolean:=True;
  quNaklRUpDate.Execute;
 End;

 if quNaklRSourceTable.AsString='E_BLANK_HEAD' then
 begin
  quBlankHeadUpDate.Close;
  quBlankHeadUpDate.ParamByName('NaklNo').AsInteger:=quNaklRNaklNo.AsInteger;
  if quNaklRInCar.AsBoolean then
   quBlankHeadUpDate.ParamByName('InCar').AsBoolean:=False
  else
   quBlankHeadUpDate.ParamByName('InCar').AsBoolean:=True;
  quBlankHeadUpDate.Execute;
 End;

  FoundNaklNo:=quNaklRNaklNo.AsInteger;
  quNaklR.Close;
  quNaklR.Open;
  quNaklR.Locate('NaklNo',FoundNaklNo,[]);

end;

procedure TfmEditExpedition.bbOkClick(Sender: TObject);
begin
 if Length(edCars.Text)<>0 then
  begin
   if Length(edShipping_Agent.Text)<>0 then
    ModalResult:=mrOk
   else
    begin
     MessageDlg('Не выбран экспедитор!!!', mtError, [mbOK], 0);
     ActiveControl:=edShipping_Agent;
    end;
  end
 else
  begin
   MessageDlg('Не выбран автомобиль!!!', mtError, [mbOK], 0);
   ActiveControl:=edCars;
  end;
end;

procedure TfmEditExpedition.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if quNaklRSourceTable.AsString='E_BLANK_HEAD' then Background:=clMoneyGreen;
end;

end.
