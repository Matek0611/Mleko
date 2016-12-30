unit KOATUU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, GridsEh, DBGridEh, StdCtrls, Buttons, DB,
  ExtCtrls;

type
  TKOATUUForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    DBGridEh1: TDBGridEh;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  KOATUUForm: TKOATUUForm;
  function ShowKOATUU(Visible: Boolean):integer;

implementation

uses data, EditKOATUU;

{$R *.dfm}

function ShowKOATUU(Visible: Boolean):integer;
begin
 Result:=0;
 KOATUUForm := TKOATUUForm.Create(Application);
 try
 KOATUUForm.DBGridEh1.Col:=1;
 if Visible then dmDataModule.quKOATUU.MacroByName('_where').Value:='where Active = 1 '
 else dmDataModule.quKOATUU.MacroByName('_where').Value:=' ';
 dmDataModule.quKOATUU.Open;
 if KOATUUForm.ShowModal=mrOk then
  Result:=dmDataModule.quKOATUU.FieldByName('Id').AsInteger
 finally
 dmDataModule.quKOATUU.Close;
 KOATUUForm.Free;
 end;
end;

procedure TKOATUUForm.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: begin
                 Key:=0;
                 ShowEditKOATUU;
               end;
    VK_INSERT: begin
                 Key:=0;
                 dmDataModule.quKOATUU.Append;
                 ShowEditKOATUU;
               end;
    VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
                dmDataModule.quKOATUU.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end

end;

procedure TKOATUUForm.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  ShowEditKOATUU;
end;

procedure TKOATUUForm.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
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

procedure TKOATUUForm.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col,DBGridEh1.Row).Top) then
    DBGridEh1.Canvas.Brush.Color := $00E9E9E9;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if not dmDataModule.quKOATUU.FieldByName('Active').AsBoolean then
    DBGridEh1.Canvas.Font.Color := clRed;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

end.
