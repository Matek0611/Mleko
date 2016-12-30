unit ListMinusPostForDolg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, CFLMLKCustom, citDBComboEdit;

type
  TListMinusPostForDolgForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListMinusPostForDolg: TMSDataSource;
    quListMinusPostForDolg: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    spInsInListMinusPostForDolg: TMSStoredProc;
    quListMinusPostForDolgPostNo: TSmallintField;
    quListMinusPostForDolgName: TStringField;
    quListMinusPostForDolgCheckMinus: TBooleanField;
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
  ListMinusPostForDolgForm: TListMinusPostForDolgForm;

implementation

uses data;

{$R *.dfm}

procedure TListMinusPostForDolgForm.OKClick(Sender: TObject);
begin
  if quListMinusPostForDolg.State in [dsInsert, dsEdit] then quListMinusPostForDolg.Post;
  ModalResult := mrOk;
end;

procedure TListMinusPostForDolgForm.JnvtyfClick(Sender: TObject);
begin
  quListMinusPostForDolg.Cancel;
  ModalResult := mrCancel;
end;

procedure TListMinusPostForDolgForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListMinusPostForDolg.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
 quListMinusPostForDolg.Refresh;
 DBGridEh1.Refresh;
end;

procedure TListMinusPostForDolgForm.DBGridEh1KeyPress(Sender: TObject;
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

procedure TListMinusPostForDolgForm.EdPostNoSelectOk(Sender: TObject);
begin
  spInsInListMinusPostForDolg.Close;
  spInsInListMinusPostForDolg.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListMinusPostForDolg.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListMinusPostForDolg.Execute;
  quListMinusPostForDolg.Refresh;
  DBGridEh1.Refresh;
end;

end.
