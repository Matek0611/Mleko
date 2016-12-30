unit VidSotrudInPepsico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, StdCtrls, Buttons, GridsEh, DBGridEh, DB,
  ExtCtrls;

type
  TVidSotrudInPepsicoForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    bbCancel: TBitBtn;
    bbOk: TBitBtn;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  VidSotrudInPepsicoForm: TVidSotrudInPepsicoForm;
  function VidSotrudInPepsi(Visible: Boolean):integer;

implementation

uses data, EditVidSotrudInPepsico;

{$R *.dfm}
function VidSotrudInPepsi(Visible: Boolean):integer;
begin
 Result:=0;
 VidSotrudInPepsicoForm := TVidSotrudInPepsicoForm.Create(Application);
 try
 VidSotrudInPepsicoForm.DBGridEh1.Col:=1;
 if Visible then dmDataModule.quVidSotrudInPepsico.MacroByName('_where').Value:='where Active = 1 '
 else dmDataModule.quVidSotrudInPepsico.MacroByName('_where').Value:=' ';
 dmDataModule.quVidSotrudInPepsico.Open;
 if VidSotrudInPepsicoForm.ShowModal=mrOk then
  Result:=dmDataModule.quVidSotrudInPepsico.FieldByName('Id').AsInteger
 finally
 dmDataModule.quVidSotrudInPepsico.Close;
 VidSotrudInPepsicoForm.Free;
 end;
end;




procedure TVidSotrudInPepsicoForm.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  EditVidSotrudInPepsi;
end;

procedure TVidSotrudInPepsicoForm.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col,DBGridEh1.Row).Top) then
    DBGridEh1.Canvas.Brush.Color := $00E9E9E9;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if not dmDataModule.quVidSotrudInPepsico.FieldByName('Active').AsBoolean then
    DBGridEh1.Canvas.Font.Color := clRed;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TVidSotrudInPepsicoForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
   VK_RETURN: begin
                Key:=0;
                EditVidSotrudInPepsi;
              end;
   VK_INSERT: begin
                Key:=0;
                dmDataModule.quVidSotrudInPepsico.Append;
                EditVidSotrudInPepsi;
              end;
   VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
              dmDataModule.quVidSotrudInPepsico.Delete;
   VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TVidSotrudInPepsicoForm.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
var
 Found:boolean;  
begin
  inherited;
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

end.
