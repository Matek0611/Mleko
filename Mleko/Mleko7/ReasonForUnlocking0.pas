unit ReasonForUnlocking0;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, MlekoForm, DBCtrls, DB, ExtCtrls, Buttons,Dialogs,
  DBGridEh, ToolWin, ComCtrls, GridsEh, ActnList;

type
  TfmReasonForUnlocking = class(TMlekoForm)
    RxDBGrid1: TDBGridEh;
    Panel1: TPanel;
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
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  fmReasonForUnlocking: TfmReasonForUnlocking;
//  procedure ReasonForUnlocking(Visible: Boolean);
  function ReasonForUnlocking(Visible: Boolean) : integer;

implementation
uses Data, EditReasonForUnlocking0;

{$R *.DFM}

//procedure ReasonForUnlocking(Visible: Boolean);
function ReasonForUnlocking(Visible: Boolean) : integer;
begin
  Result := 0;
  fmReasonForUnlocking:=TfmReasonForUnlocking.Create(Application);
  try
//   DecimalSeparator := ',';
   if Visible then dmDataModule.quReasonForUnlocking.MacroByName('_where').Value:='where Visible=0 '
              else dmDataModule.quReasonForUnlocking.MacroByName('_where').Value:=' ';
   dmDataModule.quReasonForUnlocking.Open;
//   fmReasonForUnlocking.ShowModal;
    if fmReasonForUnlocking.ShowModal=mrOk then Result:= dmDataModule.quReasonForUnlockingReasonNo.Value;
  finally
   dmDataModule.quVidTov.Close;
   fmReasonForUnlocking.Free;
  end;
end;

procedure TfmReasonForUnlocking.RxDBGrid1DblClick(Sender: TObject);
begin
 EditReasonForUnlocking;
end;

procedure TfmReasonForUnlocking.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of
  VK_RETURN: begin
              Key:=0;
              EditReasonForUnlocking;
             end;
  VK_INSERT: begin
              Key:=0;
              dmDataModule.quReasonForUnlocking.Append;
              EditReasonForUnlocking;
             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             dmDataModule.quReasonForUnlocking.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TfmReasonForUnlocking.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
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

procedure TfmReasonForUnlocking.FormActivate(Sender: TObject);
begin
 ActiveControl:=RxDBGrid1;
end;

procedure TfmReasonForUnlocking.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
 ReasonNo:integer;
begin
 Screen.Cursor:=crHourGlass;
 ReasonNo:=dmDataModule.quReasonForUnlockingReasonNo.AsInteger;
 dmDataModule.quReasonForUnlocking.Close;
 case ACol of
//  0:dmDataModule.quReasonForUnlocking.MacroByName('_order').Value:='ReasonNo';
  0:dmDataModule.quReasonForUnlocking.MacroByName('_order').Value:='ReasonName';
 end;
 dmDataModule.quReasonForUnlocking.Open;
 dmDataModule.quReasonForUnlocking.Locate('ReasonNo',ReasonNo,[]);
 Screen.Cursor:=crDefault;
end;

procedure TfmReasonForUnlocking.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
//  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) and (not (gdFocused in State) or not RxDBGrid1.Focused) then
  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) then
    RxDBGrid1.Canvas.Brush.Color := $00E9E9E9;
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if dmDataModule.quReasonForUnlockingVisible.AsBoolean then
    RxDBGrid1.Canvas.Font.Color := clRed;
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfmReasonForUnlocking.SpeedButton1Click(Sender: TObject);
begin
 dmDataModule.quReasonForUnlocking.Append;
 EditReasonForUnlocking;
end;

procedure TfmReasonForUnlocking.SpeedButton4Click(Sender: TObject);
begin
 EditReasonForUnlocking;
end;

procedure TfmReasonForUnlocking.SpeedButton5Click(Sender: TObject);
begin
 if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
  dmDataModule.quReasonForUnlocking.Delete;
end;

procedure TfmReasonForUnlocking.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  dmDataModule.quReasonForUnlocking.Close;
  dmDataModule.quReasonForUnlocking.MacroByName('_where').Value:=' ';
  dmDataModule.quReasonForUnlocking.Open;
end;

end.
