unit DeliveryOfGoods0;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, MlekoForm, DBCtrls, DB, ExtCtrls, Buttons,Dialogs,
  DBGridEh, ToolWin, ComCtrls, GridsEh, ActnList;

type
  TfmDeliveryOfGoods = class(TMlekoForm)
    RxDBGrid1: TDBGridEh;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    CoolBar1: TCoolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  fmDeliveryOfGoods: TfmDeliveryOfGoods;
  procedure DeliveryOfGoods(Visible: Boolean);

implementation
uses Data, EditDeliveryOfGoods0;

{$R *.DFM}

procedure DeliveryOfGoods(Visible: Boolean);
begin
 fmDeliveryOfGoods:=TfmDeliveryOfGoods.Create(Application);
 try
 if Visible then dmDataModule.quDeliveryOfGoods.MacroByName('_where').Value := ' where Visible = 0 '
            else dmDataModule.quDeliveryOfGoods.MacroByName('_where').Value := ' ';
 dmDataModule.quDeliveryOfGoods.Open;
 fmDeliveryOfGoods.ShowModal;
 finally
 dmDataModule.quDeliveryOfGoods.Close;
 fmDeliveryOfGoods.Free;
 end;
end;

procedure TfmDeliveryOfGoods.RxDBGrid1DblClick(Sender: TObject);
begin
 EditDeliveryOfGoods;
end;

procedure TfmDeliveryOfGoods.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of
  VK_RETURN: begin
              Key:=0;
              EditDeliveryOfGoods;
             end;
  VK_INSERT: begin
              Key:=0;
              dmDataModule.quDeliveryOfGoods.Append;
              EditDeliveryOfGoods;
             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             dmDataModule.quDeliveryOfGoods.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TfmDeliveryOfGoods.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
 if (Key in Data.SearchSet) then
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=RxDBGrid1.DataSource.DataSet.Locate(RxDBGrid1.Columns[RxDBGrid1.Col].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (RxDBGrid1.Columns[RxDBGrid1.Col].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TfmDeliveryOfGoods.FormActivate(Sender: TObject);
begin
 ActiveControl:=RxDBGrid1;
end;

procedure TfmDeliveryOfGoods.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
 DeliveryTovarNo : integer;
begin
 Screen.Cursor := crHourGlass;
 DeliveryTovarNo := dmDataModule.quDeliveryOfGoodsDeliveryTovarNo.AsInteger;
 dmDataModule.quDeliveryOfGoods.Close;
 case ACol of

  0:dmDataModule.quDeliveryOfGoods.MacroByName('_order').Value:='DeliveryGoodsName';
 end;
 dmDataModule.quDeliveryOfGoods.Open;
 dmDataModule.quDeliveryOfGoods.Locate('DeliveryTovarNo',DeliveryTovarNo,[]);
 Screen.Cursor:=crDefault;
end;

procedure TfmDeliveryOfGoods.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
//  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) and (not (gdFocused in State) or not RxDBGrid1.Focused) then
  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) then
    RxDBGrid1.Canvas.Brush.Color := $00E9E9E9;
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if dmDataModule.quDeliveryOfGoodsVisible.AsBoolean then
    RxDBGrid1.Canvas.Font.Color := clRed;
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfmDeliveryOfGoods.SpeedButton1Click(Sender: TObject);
begin
 dmDataModule.quDeliveryOfGoods.Append;
 EditDeliveryOfGoods;
end;

procedure TfmDeliveryOfGoods.SpeedButton4Click(Sender: TObject);
begin
 EditDeliveryOfGoods;
end;

procedure TfmDeliveryOfGoods.SpeedButton5Click(Sender: TObject);
begin
 if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
  dmDataModule.quDeliveryOfGoods.Delete;
end;

procedure TfmDeliveryOfGoods.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  dmDataModule.quDeliveryOfGoods.Close;
  dmDataModule.quDeliveryOfGoods.MacroByName('_where').Value:=' ';
  dmDataModule.quDeliveryOfGoods.Open;
end;

procedure TfmDeliveryOfGoods.BitBtn3Click(Sender: TObject);
begin
  inherited;
//  dmDataModule.quDeliveryOfGoods.Post;
end;

procedure TfmDeliveryOfGoods.BitBtn4Click(Sender: TObject);
begin
  inherited;
//  dmDataModule.quDeliveryOfGoods.Cancel;
end;

end.
