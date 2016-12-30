unit Kassa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, ActnList, DB;

type
  TKassaForm = class(TMlekoForm)
    Panel1: TPanel;
    lbName: TLabel;
    lbDate: TLabel;
    lbSummaRest: TLabel;
    DBEditEhName: TDBEditEh;
    DBEditEhDate: TDBEditEh;
    DBEditEhSummaRest: TDBEditEh;
    Panel2: TPanel;
    btOk: TButton;
    btCancel: TButton;
    procedure btOkClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KassaForm: TKassaForm;

implementation

uses data;

{$R *.dfm}

procedure TKassaForm.btOkClick(Sender: TObject);
begin
  inherited;
  if dmDataModule.dsKassa.State in [dsEdit,dsInsert] then
    dmDataModule.quKassa.Post;
end;

procedure TKassaForm.btCancelClick(Sender: TObject);
begin
  inherited;
  if dmDataModule.dsKassa.State in [dsEdit,dsInsert] then
    dmDataModule.quKassa.Cancel;
end;

end.
