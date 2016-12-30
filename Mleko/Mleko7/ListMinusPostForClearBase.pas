unit ListMinusPostForClearBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, citDBComboEdit, CFLMLKCustom;

type
  TListMinusPostForClearBaseForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListMinusPostForClearBase: TMSDataSource;
    quListMinusPostForClearBase: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    EdPostNo: TcitDBComboEdit;
    spInsInListMinusPostForClearBase: TMSStoredProc;
    quListMinusPostForClearBasePostNo: TSmallintField;
    quListMinusPostForClearBaseName: TStringField;
    quListMinusPostForClearBaseCheckMinus: TBooleanField;
    procedure OKClick(Sender: TObject);
    procedure JnvtyfClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure EdPostNoSelectOk(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  ListMinusPostForClearBaseForm: TListMinusPostForClearBaseForm;

implementation

uses data;

{$R *.dfm}

procedure TListMinusPostForClearBaseForm.OKClick(Sender: TObject);
begin
  if quListMinusPostForClearBase.State in [dsInsert, dsEdit] then quListMinusPostForClearBase.Post;
  ModalResult := mrOk;
end;

procedure TListMinusPostForClearBaseForm.JnvtyfClick(Sender: TObject);
begin
  quListMinusPostForClearBase.Cancel;
  ModalResult := mrCancel;
end;

procedure TListMinusPostForClearBaseForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListMinusPostForClearBase.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListMinusPostForClearBaseForm.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
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

procedure TListMinusPostForClearBaseForm.EdPostNoSelectOk(Sender: TObject);
begin
  spInsInListMinusPostForClearBase.Close;
  spInsInListMinusPostForClearBase.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListMinusPostForClearBase.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListMinusPostForClearBase.Execute;
  quListMinusPostForClearBase.Refresh;
  DBGridEh1.Refresh;
end;

end.
