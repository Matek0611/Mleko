unit VidTov0;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, MlekoForm, DBCtrls, DB, ExtCtrls, Buttons,Dialogs,
  DBGridEh,  ToolWin, ComCtrls, GridsEh, ActnList;

type
  TfmVidTov = class(TMlekoForm)
    RxDBGrid1: TDBGridEh;
    CoolBar1: TCoolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { private declarations }
    SearchString:string;
  public
    { public declarations }
  end;

var
  fmVidTov: TfmVidTov;
  function VidTov(SelectTov, Visible: Boolean):string;
implementation

uses data, EditVidTov0;

{$R *.DFM}

function VidTov(SelectTov, Visible: Boolean):string;
begin
 Result:='';
 fmVidTov:=TfmVidTov.Create(Application);
 try
 if SelectTov then fmVidTov.BitBtn3.Default:=True
 else fmVidTov.BitBtn3.Default:=False;
 if Visible then
   begin
   dmDataModule.quVidTov.MacroByName('_where').Value:='where Visible=0 ';
   end
 else begin
  dmDataModule.quVidTov.MacroByName('_where').Value:=' ';
 end;
 dmDataModule.quVidTov.Open;
 if fmVidTov.ShowModal=mrOk then
  Result:=IntToStr(dmDataModule.quVidTovVidNo.AsInteger)+'~'+dmDataModule.quVidTovVidName.AsString;

 fmVidTov.ActiveControl:=fmVidTov.RxDBGrid1;
 fmVidTov.RxDBGrid1.Col:=0;
// fmVidTov.ShowModal;
 finally
 dmDataModule.quVidTov.Close;
 fmVidTov.Free;
 end;
end;

procedure TfmVidTov.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN: begin
              Key:=0;
              EditVidTov;
             end;
  VK_INSERT: begin
              Key:=0;
              dmDataModule.quVidTov.Append;
              EditVidTov;
             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             dmDataModule.quVidTov.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TfmVidTov.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
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

procedure TfmVidTov.RxDBGrid1DblClick(Sender: TObject);
begin
 EditVidTov;
end;

procedure TfmVidTov.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
//  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) and (not (gdFocused in State) or not RxDBGrid1.Focused) then
  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) then
    RxDBGrid1.Canvas.Brush.Color := $00E9E9E9;
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if dmDataModule.quVidTovVisible.AsBoolean then
    RxDBGrid1.Canvas.Font.Color := clRed;
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfmVidTov.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
var
 VidNo:integer;
begin
 Screen.Cursor:=crHourGlass;
 VidNo:=dmDataModule.quVidTovVidNo.AsInteger;
 dmDataModule.quVidTov.Close;
 case ACol of
//  0:dmDataModule.quVidTov.MacroByName('_order').Value:='VidNo';
  0:dmDataModule.quVidTov.MacroByName('_order').Value:='VidName';
 end;
 dmDataModule.quVidTov.Open;
 dmDataModule.quVidTov.Locate('VidNo',VidNo,[]);
 Screen.Cursor:=crDefault;
end;

procedure TfmVidTov.SpeedButton1Click(Sender: TObject);
begin
 dmDataModule.quVidTov.Append;
 EditVidTov;
end;

procedure TfmVidTov.SpeedButton4Click(Sender: TObject);
begin
 EditVidTov;
end;

procedure TfmVidTov.SpeedButton5Click(Sender: TObject);
begin
 if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
  dmDataModule.quVidTov.Delete;
end;

end.
