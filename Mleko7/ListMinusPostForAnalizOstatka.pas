unit ListMinusPostForAnalizOstatka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, citDBComboEdit, CFLMLKCustom;

type
  TListMinusPostForAnalizOstatkaaForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListMinusPostForAnalizOstatkaa: TMSDataSource;
    quListMinusPostForAnalizOstatkaa: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    EdPostNo: TcitDBComboEdit;
    quListMinusPostForAnalizOstatkaaPostNo: TSmallintField;
    quListMinusPostForAnalizOstatkaaName: TStringField;
    quListMinusPostForAnalizOstatkaaCheckMinus: TBooleanField;
    spInsInListMinusPostForAnalizOstatka: TMSStoredProc;
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
  ListMinusPostForAnalizOstatkaaForm: TListMinusPostForAnalizOstatkaaForm;

implementation

uses data;

{$R *.dfm}

procedure TListMinusPostForAnalizOstatkaaForm.OKClick(Sender: TObject);
begin
  if quListMinusPostForAnalizOstatkaa.State in [dsInsert, dsEdit] then quListMinusPostForAnalizOstatkaa.Post;
  ModalResult := mrOk;
end;

procedure TListMinusPostForAnalizOstatkaaForm.JnvtyfClick(Sender: TObject);
begin
  quListMinusPostForAnalizOstatkaa.Cancel;
  ModalResult := mrCancel;
end;

procedure TListMinusPostForAnalizOstatkaaForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListMinusPostForAnalizOstatkaa.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListMinusPostForAnalizOstatkaaForm.DBGridEh1KeyPress(Sender: TObject;
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

procedure TListMinusPostForAnalizOstatkaaForm.EdPostNoSelectOk(Sender: TObject);
begin
  spInsInListMinusPostForAnalizOstatka.Close;
  spInsInListMinusPostForAnalizOstatka.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListMinusPostForAnalizOstatka.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListMinusPostForAnalizOstatka.Execute;
  quListMinusPostForAnalizOstatkaa.Refresh;
  DBGridEh1.Refresh;
end;

end.
