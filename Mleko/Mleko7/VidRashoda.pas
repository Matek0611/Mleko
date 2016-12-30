unit VidRashoda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  DBCtrls, StdCtrls, Buttons, ExtCtrls, DB,
  DBGridEh, ToolWin, ComCtrls, GridsEh, ActnList;

type
  TfmVidRashoda = class(TMlekoForm)
    Panel3: TPanel;
    bbCancel: TBitBtn;
    CoolBar1: TCoolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBGridEh1: TDBGridEh;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  fmVidRashoda: TfmVidRashoda;
  function VidRashod(Visible: Boolean): integer;

implementation

uses data, EditRashoda;

{$R *.DFM}

function VidRashod(Visible: Boolean): integer;
begin
 fmVidRashoda:=TfmVidRashoda.Create(Application);
 try
// fmVidRashoda.RxDBGrid1.Col:=2;
 if Visible then dmDataModule.quVidRashod.MacroByName('_where').Value:= 'AND (Visible=0) '
 else dmDataModule.quVidRashod.MacroByName('_where').Value:=' ';
 dmDataModule.quVidRashod.Open;
 if fmVidRashoda.ShowModal=mrOk then
  Result:=dmDataModule.quVidRashodVidRashodNo.AsInteger
 finally
 dmDataModule.quVidRashod.Close;
 fmVidRashoda.Free;
 end;
end;

procedure TfmVidRashoda.DBGridEh1DblClick(Sender: TObject);
begin
 EditVidRashod;
end;

procedure TfmVidRashoda.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col,DBGridEh1.Row).Top) then
    DBGridEh1.Canvas.Brush.Color := $00E9E9E9;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if dmDataModule.quVidRashodVisible.AsBoolean then
    DBGridEh1.Canvas.Font.Color := clRed;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfmVidRashoda.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN: begin
              Key:=0;
              SpeedButton4Click(Sender);
             end;
  VK_INSERT: begin
              Key:=0;
              SpeedButton1Click(Sender);
             end;
  VK_DELETE: begin
              Key:=0;
              SpeedButton5Click(Sender);
             end;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TfmVidRashoda.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
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
   if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col-1].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TfmVidRashoda.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
 VidRashodNo:integer;
begin
 VidRashodNo:=dmDataModule.quVidRashodVidRashodNo.AsInteger;
 dmDataModule.quVidRashod.Close;
 case ACol of
  0:dmDataModule.quVidRashod.MacroByName('_order').Value:='VidRashodName';
 end;
 dmDataModule.quVidRashod.Open;
 dmDataModule.quVidRashod.Locate('VidRashodNo',VidRashodNo,[]);
end;

procedure TfmVidRashoda.SpeedButton1Click(Sender: TObject);
begin
 dmDataModule.quVidRashod.Append;
 EditVidRashod;
end;

procedure TfmVidRashoda.SpeedButton5Click(Sender: TObject);
begin
 if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
 dmDataModule.quVidRashod.Delete;
end;

procedure TfmVidRashoda.SpeedButton4Click(Sender: TObject);
begin
 EditVidRashod;
end;

end.
