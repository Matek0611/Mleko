unit ListPlusPostForDolg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, CFLMLKCustom, citDBComboEdit;

type
  TListPlusPostForDolgForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListPlusPostForDolg: TMSDataSource;
    quListPlusPostForDolg: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    spInsInListPlusPostForDolg: TMSStoredProc;
    quListPlusPostForDolgPostNo: TSmallintField;
    quListPlusPostForDolgName: TStringField;
    quListPlusPostForDolgCheckPlus: TBooleanField;
    EdPostNo: TcitDBComboEdit;
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
  ListPlusPostForDolgForm: TListPlusPostForDolgForm;

implementation

uses data;

{$R *.dfm}

procedure TListPlusPostForDolgForm.OKClick(Sender: TObject);
begin
  if quListPlusPostForDolg.State in [dsInsert, dsEdit] then quListPlusPostForDolg.Post;
  ModalResult := mrOk;
end;

procedure TListPlusPostForDolgForm.JnvtyfClick(Sender: TObject);
begin
  quListPlusPostForDolg.Cancel;
  ModalResult := mrCancel;
end;

procedure TListPlusPostForDolgForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListPlusPostForDolg.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
 quListPlusPostForDolg.Refresh;
 DBGridEh1.Refresh;
end;

procedure TListPlusPostForDolgForm.DBGridEh1KeyPress(Sender: TObject;
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

procedure TListPlusPostForDolgForm.EdPostNoSelectOk(Sender: TObject);
begin
  spInsInListPlusPostForDolg.Close;
  spInsInListPlusPostForDolg.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListPlusPostForDolg.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListPlusPostForDolg.Execute;
  quListPlusPostForDolg.Refresh;
  DBGridEh1.Refresh;
end;

end.
