unit ListMinusPostForOstatokZero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, citDBComboEdit, CFLMLKCustom;

type
  TListMinusPostForOstatokZeroaForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListMinusPostForOstatokZeroa: TMSDataSource;
    quListMinusPostForOstatokZeroa: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    EdPostNo: TcitDBComboEdit;
    quListMinusPostForOstatokZeroaPostNo: TSmallintField;
    quListMinusPostForOstatokZeroaName: TStringField;
    quListMinusPostForOstatokZeroaCheckMinus: TBooleanField;
    spInsInListMinusPostForOstatokZero: TMSStoredProc;
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
  ListMinusPostForOstatokZeroaForm: TListMinusPostForOstatokZeroaForm;

implementation

uses data;

{$R *.dfm}

procedure TListMinusPostForOstatokZeroaForm.OKClick(Sender: TObject);
begin
  if quListMinusPostForOstatokZeroa.State in [dsInsert, dsEdit] then quListMinusPostForOstatokZeroa.Post;
  ModalResult := mrOk;
end;

procedure TListMinusPostForOstatokZeroaForm.JnvtyfClick(Sender: TObject);
begin
  quListMinusPostForOstatokZeroa.Cancel;
  ModalResult := mrCancel;
end;

procedure TListMinusPostForOstatokZeroaForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListMinusPostForOstatokZeroa.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListMinusPostForOstatokZeroaForm.DBGridEh1KeyPress(Sender: TObject;
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

procedure TListMinusPostForOstatokZeroaForm.EdPostNoSelectOk(Sender: TObject);
begin
  spInsInListMinusPostForOstatokZero.Close;
  spInsInListMinusPostForOstatokZero.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListMinusPostForOstatokZero.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListMinusPostForOstatokZero.Execute;
  quListMinusPostForOstatokZeroa.Refresh;
  DBGridEh1.Refresh;
end;

end.
