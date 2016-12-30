unit Tovar0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Buttons, DB,
  DBGridEh, ToolWin, ComCtrls, GridsEh, ActnList;

type
  TfmTovar = class(TMlekoForm)
    RxDBGrid1: TDBGridEh;
    Panel1: TPanel;
    bbCancel: TBitBtn;
    bbOk: TBitBtn;
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

type
 TRetTovar = record
  TovarNo   : integer;
  NameTovar : string;
  VidName   : string;
end;

var
  fmTovar: TfmTovar;
  Tara: Boolean;
  function Tovar(Select, Visible:boolean; Otdel:integer):TRetTovar;
implementation

uses data, EditTovar0;

{$R *.DFM}
function Tovar(Select, Visible:boolean; Otdel:integer):TRetTovar;
begin
 Result.TovarNo:=0;
 Tara:=False;
 fmTovar:=TfmTovar.Create(Application);
 try
 if Otdel=3 then
  begin
   if Otdel=3 then fmTovar.Caption:='Справочник тары' else fmTovar.Caption:='Справочник товаров';
   Tara:=True;
   if Visible then
    dmDataModule.quTovar.MacroByName('_where').Value:='Where (t.OtdelNo=3) AND (t.Visible=0)'
   else
    dmDataModule.quTovar.MacroByName('_where').Value:='Where (t.OtdelNo=3)';
  end
 else
  begin
   if Visible then
    dmDataModule.quTovar.MacroByName('_where').Value:='Where (t.OtdelNo<>3 AND (t.Visible=0))'
   else
    dmDataModule.quTovar.MacroByName('_where').Value:='Where (t.OtdelNo<>3)';
  end;

 dmDataModule.quTovar.Open;
 fmTovar.ActiveControl:=fmTovar.RxDBGrid1;
 fmTovar.RxDBGrid1.Col:=2;
 fmTovar.bbOk.Default:=Select;
 if fmTovar.ShowModal=mrOK then
  begin
   Result.TovarNo:=dmDataModule.quTovarTovarNo.AsInteger;
   Result.NameTovar:=dmDataModule.quTovarNameTovar.AsString;
   Result.VidName:=dmDataModule.quTovarVidName.AsString;
  end;
 finally
 dmDataModule.quTovar.Close;
 dmDataModule.quVidTov.Close;
 dmDataModule.quCompany.Close;
 fmTovar.Free;
 end;
end;

procedure TfmTovar.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
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

procedure TfmTovar.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) and (not (gdFocused in State) or not RxDBGrid1.Focused) then
//  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) then
    RxDBGrid1.Canvas.Brush.Color := $00E9E9E9;
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if dmDataModule.quTovarVisible.AsBoolean then
    RxDBGrid1.Canvas.Font.Color := clRed;
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfmTovar.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
 Screen.Cursor:=crHourGlass;
 dmDataModule.quTovar.Close;
 case ACol of
  0:dmDataModule.quTovar.MacroByName('_order').Value:='TovarNo';
  1:dmDataModule.quTovar.MacroByName('_order').Value:='VidName,NameTovar';
  2:dmDataModule.quTovar.MacroByName('_order').Value:='NameTovar';
  3:dmDataModule.quTovar.MacroByName('_order').Value:='EdIzm,NameTovar';
  4:dmDataModule.quTovar.MacroByName('_order').Value:='NameCompany,NameTovar';
  5:dmDataModule.quTovar.MacroByName('_order').Value:='KolPerPak,NameTovar';
 end;
 dmDataModule.quTovar.Open;
 Screen.Cursor:=crDefault;
end;

procedure TfmTovar.SpeedButton3Click(Sender: TObject);
begin
 if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
  dmDataModule.quTovar.Delete;
end;

end.
