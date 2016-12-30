unit AddressPost_CODE_Commerce_Network;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, GridsEh, DBGridEh, StdCtrls, Buttons, DB,
  ExtCtrls;

type
  TAddressPost_CODE_Commerce_NetworkForm = class(TMlekoForm)
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
  AddressPost_CODE_Commerce_NetworkForm: TAddressPost_CODE_Commerce_NetworkForm;
  function ShowAddressPost_CODE_Commerce_Network(Visible: Boolean):integer;

implementation

uses data, EditAddressPost_CODE_Commerce_Network;

{$R *.dfm}

function ShowAddressPost_CODE_Commerce_Network(Visible: Boolean):integer;
begin
 Result:=0;
 AddressPost_CODE_Commerce_NetworkForm := TAddressPost_CODE_Commerce_NetworkForm.Create(Application);
 try
 AddressPost_CODE_Commerce_NetworkForm.DBGridEh1.Col:=1;
 if Visible then dmDataModule.quAddressPost_CODE_Commerce_Network.MacroByName('_where').Value:='where Active = 1 '
 else dmDataModule.quAddressPost_CODE_Commerce_Network.MacroByName('_where').Value:=' ';
 dmDataModule.quAddressPost_CODE_Commerce_Network.Open;
 if AddressPost_CODE_Commerce_NetworkForm.ShowModal=mrOk then
  Result:=dmDataModule.quAddressPost_CODE_Commerce_Network.FieldByName('Id').AsInteger
 finally
 dmDataModule.quAddressPost_CODE_Commerce_Network.Close;
 AddressPost_CODE_Commerce_NetworkForm.Free;
 end;
end;

procedure TAddressPost_CODE_Commerce_NetworkForm.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: begin
                 Key:=0;
                 ShowEditAddressPost_CODE_Commerce_Network;
               end;
    VK_INSERT: begin
                 Key:=0;
                 dmDataModule.quAddressPost_CODE_Commerce_Network.Append;
                 ShowEditAddressPost_CODE_Commerce_Network;
               end;
    VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
                dmDataModule.quAddressPost_CODE_Commerce_Network.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end

end;

procedure TAddressPost_CODE_Commerce_NetworkForm.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  ShowEditAddressPost_CODE_Commerce_Network;
end;

procedure TAddressPost_CODE_Commerce_NetworkForm.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
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

procedure TAddressPost_CODE_Commerce_NetworkForm.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col,DBGridEh1.Row).Top) then
    DBGridEh1.Canvas.Brush.Color := $00E9E9E9;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if not dmDataModule.quAddressPost_CODE_Commerce_Network.FieldByName('Active').AsBoolean then
    DBGridEh1.Canvas.Font.Color := clRed;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

end.
