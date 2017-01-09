unit ListPlusPostForClosePlatRIsEconom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, CFLMLKCustom, citDBComboEdit;

type
  TListPlusPostForClosePlatRIsEconomForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListPlusPostForClosePlatRIsEconom: TMSDataSource;
    quListPlusPostForClosePlatRIsEconom: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    spInsInListPlusPostForClosePlatRIsEconom: TMSStoredProc;
    EdUserNo: TcitDBComboEdit;
    quListPlusPostForClosePlatRIsEconomUserNo: TSmallintField;
    quListPlusPostForClosePlatRIsEconomUserName: TStringField;
    quListPlusPostForClosePlatRIsEconomCheckPlus: TBooleanField;
    procedure OKClick(Sender: TObject);
    procedure JnvtyfClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure EdUserNoSelectOk(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  ListPlusPostForClosePlatRIsEconomForm: TListPlusPostForClosePlatRIsEconomForm;

implementation

uses data;

{$R *.dfm}

procedure TListPlusPostForClosePlatRIsEconomForm.OKClick(Sender: TObject);
begin
  if quListPlusPostForClosePlatRIsEconom.State in [dsInsert, dsEdit] then quListPlusPostForClosePlatRIsEconom.Post;
  ModalResult := mrOk;
end;

procedure TListPlusPostForClosePlatRIsEconomForm.JnvtyfClick(Sender: TObject);
begin
  quListPlusPostForClosePlatRIsEconom.Cancel;
  ModalResult := mrCancel;
end;

procedure TListPlusPostForClosePlatRIsEconomForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListPlusPostForClosePlatRIsEconom.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
 quListPlusPostForClosePlatRIsEconom.Refresh;
 DBGridEh1.Refresh;
end;

procedure TListPlusPostForClosePlatRIsEconomForm.DBGridEh1KeyPress(Sender: TObject;
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

procedure TListPlusPostForClosePlatRIsEconomForm.EdUserNoSelectOk(Sender: TObject);
begin
  spInsInListPlusPostForClosePlatRIsEconom.Close;
  spInsInListPlusPostForClosePlatRIsEconom.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListPlusPostForClosePlatRIsEconom.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListPlusPostForClosePlatRIsEconom.Execute;
  quListPlusPostForClosePlatRIsEconom.Refresh;
  DBGridEh1.Refresh;
end;

end.
