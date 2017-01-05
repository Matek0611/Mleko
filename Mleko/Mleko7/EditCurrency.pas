unit EditCurrency;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, StdCtrls, Mask, DBCtrlsEh, Buttons, Db,
  ExtCtrls;

type
  TEditCurrencyForm = class(TMlekoForm)
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    isTrash: TDBCheckBoxEh;
    IsDefault: TDBCheckBoxEh;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    procedure IsDefaultClick(Sender: TObject);
    procedure DBCheckBoxEh1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditCurrencyForm: TEditCurrencyForm;
  procedure EditCurren;

implementation

uses data;

{$R *.dfm}

procedure EditCurren;
begin
 EditCurrencyForm := TEditCurrencyForm.Create(Application);
 try
  if EditCurrencyForm.ShowModal = mrOk then
   begin
     if dmDataModule.quCurrency.State in [dsEdit,dsInsert] then
     dmDataModule.quCurrency.Post;
   end
  else
   begin
     if dmDataModule.quCurrency.State in [dsEdit,dsInsert] then
     dmDataModule.quCurrency.Cancel;
   end
 finally
  EditCurrencyForm.Free;
 end;
end; 

procedure TEditCurrencyForm.IsDefaultClick(Sender: TObject);
begin
  inherited;
  if IsDefault.Checked then dmDataModule.ExecSQL('update d_currency set IsDefault = 0 where id <> ' + dmDataModule.quCurrencyId.AsString);
end;

procedure TEditCurrencyForm.DBCheckBoxEh1Click(Sender: TObject);
begin
  inherited;
//  if IsDefault.Checked then dmDataModule.ExecSQL('update d_currency set isCrossCurrency = 0 where id <> ' + dmDataModule.quCurrencyId.AsString);
end;

end.
