unit EditCurrencyExchange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DBCtrlsEh, StdCtrls, Mask, Buttons, Db,
  ExtCtrls, DBGridEh, DBLookupEh;

type
  TEditCurrencyExchangeForm = class(TMlekoForm)
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbIsActive: TDBCheckBoxEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    procedure cbIsActiveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditCurrencyExchangeForm: TEditCurrencyExchangeForm;
  procedure EditCurExchange;

implementation

uses data;

{$R *.dfm}

procedure EditCurExchange;
begin
 EditCurrencyExchangeForm := TEditCurrencyExchangeForm.Create(Application);
 try
  dmDataModule.quCurrency.Open;
  if EditCurrencyExchangeForm.ShowModal = mrOk then
   begin
     if dmDataModule.quCurrencyExchange.State in [dsEdit,dsInsert] then
     dmDataModule.quCurrencyExchange.Post;
     dmDataModule.quCurrencyExchange.Close;
     dmDataModule.quCurrencyExchange.Open;
   end
  else
   begin
     if dmDataModule.quCurrencyExchange.State in [dsEdit,dsInsert] then
     dmDataModule.quCurrencyExchange.Cancel;
     dmDataModule.quCurrency.Close;
   end
 finally
  EditCurrencyExchangeForm.Free;
 end;
end;

procedure TEditCurrencyExchangeForm.cbIsActiveClick(Sender: TObject);
begin
  inherited;
  if cbIsActive.Checked then begin
                               if dmDataModule.quCurrencyExchange.State in [dsEdit] then
                               dmDataModule.ExecSQL('update CurrencyExchange set IsActive = 0 where CurrencyId = :p1_CurrencyId and id <> :p2_id',[dmDataModule.quCurrencyExchange.FieldByName('CurrencyId').AsInteger,dmDataModule.quCurrencyExchange.FieldByName('CurrencyId').Value]);
                             end;
end;

end.
