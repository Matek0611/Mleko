unit ListMinusPaymentForJournalOfExpenses;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, citDBComboEdit, CFLMLKCustom;

type
  TListMinusPaymentForJournalOfExpensesaForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListMinusPaymentForJournalOfExpensesa: TMSDataSource;
    quListMinusPaymentForJournalOfExpensesa: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    EdTipNo: TcitDBComboEdit;
    quListMinusPaymentForJournalOfExpensesaTipNo: TSmallintField;
    quListMinusPaymentForJournalOfExpensesaName: TStringField;
    quListMinusPaymentForJournalOfExpensesaCheckMinus: TBooleanField;
    spInsInListMinusPaymentForJournalOfExpenses: TMSStoredProc;
    procedure OKClick(Sender: TObject);
    procedure JnvtyfClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure EdTipNoSelectOk(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  ListMinusPaymentForJournalOfExpensesaForm: TListMinusPaymentForJournalOfExpensesaForm;

implementation

uses data;

{$R *.dfm}

procedure TListMinusPaymentForJournalOfExpensesaForm.OKClick(Sender: TObject);
begin
  if quListMinusPaymentForJournalOfExpensesa.State in [dsInsert, dsEdit] then quListMinusPaymentForJournalOfExpensesa.Post;
  ModalResult := mrOk;
end;

procedure TListMinusPaymentForJournalOfExpensesaForm.JnvtyfClick(Sender: TObject);
begin
  quListMinusPaymentForJournalOfExpensesa.Cancel;
  ModalResult := mrCancel;
end;

procedure TListMinusPaymentForJournalOfExpensesaForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListMinusPaymentForJournalOfExpensesa.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListMinusPaymentForJournalOfExpensesaForm.DBGridEh1KeyPress(Sender: TObject;
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

procedure TListMinusPaymentForJournalOfExpensesaForm.EdTipNoSelectOk(Sender: TObject);
begin
  spInsInListMinusPaymentForJournalOfExpenses.Close;
  spInsInListMinusPaymentForJournalOfExpenses.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListMinusPaymentForJournalOfExpenses.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListMinusPaymentForJournalOfExpenses.Execute;
  quListMinusPaymentForJournalOfExpensesa.Refresh;
  DBGridEh1.Refresh;
end;

end.
