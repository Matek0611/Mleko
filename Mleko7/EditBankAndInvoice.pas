unit EditBankAndInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  MlekoForm, StdCtrls, DBCtrlsEh, ExtCtrls, ActnList, Mask, Buttons, DB;

type
  TEditBankAndInvoiceForm = class(TMlekoForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBCheckBoxEhIsMain: TDBCheckBoxEh;
    DBEditEhNAME: TDBEditEh;
    DBEditEhOKPO: TDBEditEh;
    DBEditEhMFO: TDBEditEh;
    DBEditEhinvoice_num: TDBEditEh;
    DBEditEhName_Invoice: TDBEditEh;
    DBEditEhDescription: TDBEditEh;
    DBEditEhDate: TDBEditEh;
    DBEditEhSummaRest: TDBEditEh;
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    procedure DBCheckBoxEhIsMainExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditBankAndInvoiceForm: TEditBankAndInvoiceForm;

procedure EditBankAndInvoic;

implementation

uses data, main;

{$R *.dfm}

procedure EditBankAndInvoic;
begin
 EditBankAndInvoiceForm := TEditBankAndInvoiceForm.Create(Application);
 EditBankAndInvoiceForm.ActiveControl := EditBankAndInvoiceForm.DBEditEhNAME;
 try
 if EditBankAndInvoiceForm.ShowModal=mrOk then
  begin
   if dmDataModule.dsBanks.State in [dsEdit,dsInsert] then
    dmDataModule.quBanks.Post;
  end
 else
  begin
   if dmDataModule.dsBanks.State in [dsEdit,dsInsert] then
    dmDataModule.quBanks.Cancel;
  end
 finally
 EditBankAndInvoiceForm.Free;
 end;

end;

procedure TEditBankAndInvoiceForm.DBCheckBoxEhIsMainExit(Sender: TObject);
begin
  inherited;
  dmDataModule.QFO.Close;
  dmDataModule.QFO.SQL.Clear;
  dmDataModule.QFO.SQL.Add('select Bank_Name from D_BANK_INVOICE where isMain = 1');
  dmDataModule.QFO.Open;
  if ((dmDataModule.QFO.RecordCount > 0) and
      (dmDataModule.quBanksName_Invoice.AsString <> dmDataModule.QFO.FieldByName('Bank_Name').AsString)) then
   begin
     ShowMessage(' Основным счетом может быть только один!' + #10#13 +
                 'Необходимо убрать признак основного в счете :' + dmDataModule.QFO.FieldByName('Bank_Name').AsString);
     DBCheckBoxEhIsMain.Checked := False;
   end;
end;

end.
