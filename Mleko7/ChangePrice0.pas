unit ChangePrice0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, MemDS, DBAccess, MSAccess, StdCtrls,
  Mask, DBCtrlsEh, Buttons;

type
  TfmChangePrice = class(TMlekoForm)
    ds_ChangePrice: TDataSource;
    qu_ChangePrice: TMSQuery;
    qu_ChangePriceDeltaPriceInInst: TFloatField;
    DBNumberEditEhChangePriceInInst: TDBNumberEditEh;
    Lb_ChangePriceInInst: TLabel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmChangePrice: TfmChangePrice;

implementation

uses data, main;

{$R *.dfm}


procedure TfmChangePrice.bbOkClick(Sender: TObject);
begin
  inherited;
  if qu_ChangePrice.State in [dsInsert, dsEdit]
  then qu_ChangePrice.Post;

  DeltaPriceInInst := qu_ChangePriceDeltaPriceInInst.Value;

end;

procedure TfmChangePrice.bbCancelClick(Sender: TObject);
begin
  inherited;
  if qu_ChangePrice.State in [dsInsert, dsEdit]
  then qu_ChangePrice.Cancel;

end;

end.
