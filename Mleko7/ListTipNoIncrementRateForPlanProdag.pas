unit ListTipNoIncrementRateForPlanProdag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, DB, DBAccess, MSAccess, MemDS, StdCtrls, Buttons,
  ExtCtrls, ActnList, GridsEh, DBGridEh;

type
  TListTipNoIncrementRateForPlanProdagForm = class(TMlekoForm)
    ListTipNoIncrementRateForPlanProdag: TPanel;
    Panel2: TPanel;
    bbOK: TBitBtn;
    bbcancel: TBitBtn;
    quListTipNoIncrementRateForPlanProdag: TMSQuery;
    dsListTipNoIncrementRateForPlanProdag: TMSDataSource;
    DBGridEh1: TDBGridEh;
    quListTipNoIncrementRateForPlanProdagTipNo: TSmallintField;
    quListTipNoIncrementRateForPlanProdagTipName: TStringField;
    quListTipNoIncrementRateForPlanProdagIncrementRate: TIntegerField;
    quListTipNoIncrementRateForPlanProdagChecket: TBooleanField;
    quListTipNoIncrementRateForPlanProdagUserNo: TIntegerField;
    procedure bbOKClick(Sender: TObject);
    procedure bbcancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListTipNoIncrementRateForPlanProdagForm: TListTipNoIncrementRateForPlanProdagForm;

implementation

uses data;

{$R *.dfm}

procedure TListTipNoIncrementRateForPlanProdagForm.bbOKClick(
  Sender: TObject);
begin
  inherited;
  if quListTipNoIncrementRateForPlanProdag.State in [dsInsert, dsEdit] then quListTipNoIncrementRateForPlanProdag.Post;
end;

procedure TListTipNoIncrementRateForPlanProdagForm.bbcancelClick(
  Sender: TObject);
begin
  inherited;
  quListTipNoIncrementRateForPlanProdag.Cancel;
end;

end.
