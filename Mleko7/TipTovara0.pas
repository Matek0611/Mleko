unit TipTovara0;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, MlekoForm, DBCtrls, DB, ExtCtrls, Buttons,Dialogs,
  DBGridEh, ToolWin, ComCtrls, GridsEh, ActnList;

type
  TfmTipTovara = class(TMlekoForm)
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
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  fmTipTovara: TfmTipTovara;
  procedure TipTovara(Visible: Boolean);

implementation
uses Data, EditTipTovara0;

{$R *.DFM}

procedure TipTovara(Visible: Boolean);
begin
 fmTipTovara:=TfmTipTovara.Create(Application);
 try
 if Visible then dmDataModule.quTipTovara.MacroByName('_where').Value:='where Visible=0 '
 else dmDataModule.quTipTovara.MacroByName('_where').Value:=' ';
 dmDataModule.quTipTovara.Open;
// fmTipTovara.RxDBGrid1.Col:=2;
 fmTipTovara.ShowModal;
 finally
 dmDataModule.quVidTov.Close;
 fmTipTovara.Free;
 end;
end;

procedure TfmTipTovara.RxDBGrid1DblClick(Sender: TObject);
begin
 EditTipTovara;
end;

procedure TfmTipTovara.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of
  VK_RETURN: begin
              Key:=0;
              EditTipTovara;
             end;
  VK_INSERT: begin
              Key:=0;
              dmDataModule.quTipTovara.Append;
              EditTipTovara;
             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             dmDataModule.quTipTovara.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TfmTipTovara.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
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

procedure TfmTipTovara.FormActivate(Sender: TObject);
begin
 ActiveControl:=RxDBGrid1;
end;

procedure TfmTipTovara.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
 TipNo:integer;
begin
 Screen.Cursor:=crHourGlass;
 TipNo:=dmDataModule.quTipTovaraTipNo.AsInteger;
 dmDataModule.quTipTovara.Close;
 case ACol of
//  0:dmDataModule.quTipTovara.MacroByName('_order').Value:='TipNo';
  0:dmDataModule.quTipTovara.MacroByName('_order').Value:='TipName';
 end;
 dmDataModule.quTipTovara.Open;
 dmDataModule.quTipTovara.Locate('TipNo',TipNo,[]);
 Screen.Cursor:=crDefault;
end;

procedure TfmTipTovara.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
//  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) and (not (gdFocused in State) or not RxDBGrid1.Focused) then
  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) then
    RxDBGrid1.Canvas.Brush.Color := $00E9E9E9;
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if dmDataModule.quTipTovaraVisible.AsBoolean then
    RxDBGrid1.Canvas.Font.Color := clRed;
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfmTipTovara.SpeedButton1Click(Sender: TObject);
begin
 dmDataModule.quTipTovara.Append;
 EditTipTovara;
end;

procedure TfmTipTovara.SpeedButton4Click(Sender: TObject);
begin
 EditTipTovara;
end;

procedure TfmTipTovara.SpeedButton5Click(Sender: TObject);
begin
 if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
  dmDataModule.quTipTovara.Delete;
end;

procedure TfmTipTovara.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  dmDataModule.quTipTovara.Close;
  dmDataModule.quTipTovara.MacroByName('_where').Value:=' ';
  dmDataModule.quTipTovara.Open;
end;

end.
