unit BankAndInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, DBAccess, GridsEh, DBGridEh, Buttons, ToolWin, ComCtrls,
  StdCtrls, ExtCtrls;

type
  TBankAndInvoiceForm = class(TMlekoForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    CoolBar1: TCoolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBGridEh1: TDBGridEh;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    SearchString : String;
  public
    { Public declarations }
  end;

var
  BankAndInvoiceForm: TBankAndInvoiceForm;

implementation

uses data, EditBankAndInvoice;

{$R *.dfm}

procedure TBankAndInvoiceForm.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dmDataModule.quBanks.Append;
  EditBankAndInvoic;
end;

procedure TBankAndInvoiceForm.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  EditBankAndInvoic;
end;

procedure TBankAndInvoiceForm.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
  dmDataModule.quBanks.Delete;
end;

procedure TBankAndInvoiceForm.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
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
   if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col-1].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TBankAndInvoiceForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
  VK_RETURN: begin
              Key:=0;
              SpeedButton4Click(Sender);
             end;
  VK_INSERT: begin
              Key:=0;
              SpeedButton1Click(Sender);
             end;
  VK_DELETE: begin
              Key:=0;
              SpeedButton5Click(Sender);
             end;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

end.
