unit Sotrud0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  DBCtrls, StdCtrls, Buttons, ExtCtrls, DB,
  DBGridEh, ToolWin, ComCtrls, GridsEh, ActnList;

type
  TfmSotrud = class(TMlekoForm)
    RxDBGrid1: TDBGridEh;
    CoolBar1: TCoolBar;
    sbInsert: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Button1: TButton;
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbInsertClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  fmSotrud: TfmSotrud;
  function Sotrud(Visible: Boolean):integer;
  function SotrudLevel(Visible: Boolean; Level: String):integer;
  function SotrudLevelStr(Visible: Boolean; Level: String):string;
implementation

uses data, qrSotrudFirm0, EditSotrud0;

{$R *.DFM}
function Sotrud(Visible: Boolean):integer;
begin
 Result:=0;
 fmSotrud:=TfmSotrud.Create(Application);
 try
 fmSotrud.RxDBGrid1.Col:=0;
 if Visible then dmDataModule.quSotrud.MacroByName('_where').Value:='where Sotrud.Visible=0 '
            else dmDataModule.quSotrud.MacroByName('_where').Value:=' ';
 dmDataModule.quSotrud.Open;
 if fmSotrud.ShowModal=mrOk then
  if not dmDataModule.quSotrud.FieldByName('SotrudNo').IsNull then Result := dmDataModule.quSotrud.FieldByName('SotrudNo').AsInteger else Result := 0
 finally
 dmDataModule.quSotrud.Close;
 fmSotrud.Free;
 end;
end;

function SotrudLevel(Visible: Boolean; Level: String):integer;
var
  where : string;
begin
 Result:=0;
 fmSotrud:=TfmSotrud.Create(Application);
 try
 fmSotrud.RxDBGrid1.Col:=0;

 if Visible then where := 'where Sotrud.Visible=0 '
            else where := ' ';

 if where = ' ' then where := 'where Sotrud.SotrudLevelInPepsico = '+''''+Level+''''
                else where := ' and Sotrud.SotrudLevelInPepsico = '+''''+Level+'''';

 dmDataModule.quSotrud.MacroByName('_where').Value := where;
 dmDataModule.quSotrud.Open;

 case fmSotrud.ShowModal of
   mrOk : Result := dmDataModule.quSotrud.FieldByName('SotrudNo').AsInteger;
   mrCancel : Result := -1;
   mrIgnore : begin end;
 end;
{
 if fmSotrud.ShowModal = mrOk then
  Result := dmDataModule.quSotrud.FieldByName('SotrudNo').AsInteger;

 if fmSotrud.ShowModal = mrCancel then
  Result := -1;
 }
  dmDataModule.quSotrud.Close;
  if Visible then dmDataModule.quSotrud.MacroByName('_where').Value := 'where Sotrud.Visible=0 '
             else dmDataModule.quSotrud.MacroByName('_where').Value := ' ';
  dmDataModule.quSotrud.Open;

 finally
 dmDataModule.quSotrud.Close;
 fmSotrud.Free;
 end;
end;

function SotrudLevelStr(Visible: Boolean; Level: String):string;
var
  where : string;
begin
 Result:='0';
 fmSotrud := TfmSotrud.Create(Application);
 try
 fmSotrud.RxDBGrid1.Col := 0;

 if Visible then where := 'where Sotrud.Visible=0 '
            else where := ' ';

 if where = ' ' then where := 'where Sotrud.SotrudLevelInPepsico = '+''''+Level+''''
                else where := ' and Sotrud.SotrudLevelInPepsico = '+''''+Level+'''';

 dmDataModule.quSotrud.MacroByName('_where').Value := where;
 dmDataModule.quSotrud.Open;

 case fmSotrud.ShowModal of
   mrOk : begin
            if dmDataModule.quSotrudV.Value = true then Result := dmDataModule.quSotrud.FieldByName('SotrudNo').AsString;
            dmDataModule.quSotrud.First;
            while not dmDataModule.quSotrud.Eof do
             begin
               if dmDataModule.quSotrudV.Value = true then Result := Result +','+ dmDataModule.quSotrud.FieldByName('SotrudNo').AsString;
               dmDataModule.quSotrud.Next;
             end;
          end;
   mrCancel : Result := '-1';
   mrIgnore : begin end;
 end;

  dmDataModule.quSotrud.Close;
  if Visible then dmDataModule.quSotrud.MacroByName('_where').Value := 'where Sotrud.Visible=0 '
             else dmDataModule.quSotrud.MacroByName('_where').Value := ' ';
  dmDataModule.quSotrud.Open;

 finally
 dmDataModule.quSotrud.Close;
 fmSotrud.Free;
 end;
end;

procedure TfmSotrud.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN: begin
              Key:=0;
              EditSotrud;
             end;
  VK_INSERT: begin
              Key:=0;
              dmDataModule.quSotrud.Append;
              EditSotrud;
             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
              dmDataModule.quSotrud.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TfmSotrud.RxDBGrid1DblClick(Sender: TObject);
begin
 EditSotrud;
end;

procedure TfmSotrud.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
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

procedure TfmSotrud.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
//  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) and (not (gdFocused in State) or not RxDBGrid1.Focused) then
  if (Rect.Top = RxDBGrid1.CellRect(RxDBGrid1.Col,RxDBGrid1.Row).Top) then
    RxDBGrid1.Canvas.Brush.Color := $00E9E9E9;
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if dmDataModule.quSotrud.FieldByName('Visible').AsBoolean then
    RxDBGrid1.Canvas.Font.Color := clRed;
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfmSotrud.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
var
 SotrudNo:integer;
begin
 SotrudNo:=dmDataModule.quSotrud.FieldByName('SotrudNo').AsInteger;
 dmDataModule.quSotrud.Close;
 case ACol of
  0:dmDataModule.quSotrud.MacroByName('_order').Value:='Sotrud.SotrudOtdel';
  1:dmDataModule.quSotrud.MacroByName('_order').Value:='VidOtdel.OtdelName';
 end;
 dmDataModule.quSotrud.Open;
 dmDataModule.quSotrud.Locate('SotrudNo',SotrudNo,[]);
end;

procedure TfmSotrud.SpeedButton4Click(Sender: TObject);
begin
 SotrudFirm(dmDataModule.quSotrud.FieldByName('SotrudNo').AsInteger);
end;

procedure TfmSotrud.SpeedButton2Click(Sender: TObject);
begin
EditSotrud;
end;

procedure TfmSotrud.sbInsertClick(Sender: TObject);
begin
 dmDataModule.quSotrud.Append;
 EditSotrud;
end;

procedure TfmSotrud.SpeedButton3Click(Sender: TObject);
begin
 if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
  dmDataModule.quSotrud.Delete;
end;


procedure TfmSotrud.bbOkClick(Sender: TObject);
begin
  if dmDataModule.dsSotrud.State in [dsInsert,dsEdit] then dmDataModule.quSotrud.Post;
  inherited;

end;

end.
