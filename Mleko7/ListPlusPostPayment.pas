unit ListPlusPostPayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls;

type
  TListPlusPostPaymentForm = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListPlusPostPayment: TMSDataSource;
    quListPlusPostPayment: TMSQuery;
    OK: TButton;
    Cancel: TButton;
    quListPlusPostPaymentPostNo: TSmallintField;
    quListPlusPostPaymentName: TStringField;
    quListPlusPostPaymentCheckPlus: TBooleanField;
    procedure OKClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListPlusPostPaymentForm: TListPlusPostPaymentForm;

implementation

uses data;

{$R *.dfm}

procedure TListPlusPostPaymentForm.OKClick(Sender: TObject);
begin
  if quListPlusPostPayment.State in [dsInsert, dsEdit] then quListPlusPostPayment.Post;
  ModalResult := mrOk;
end;

procedure TListPlusPostPaymentForm.CancelClick(Sender: TObject);
begin
  quListPlusPostPayment.Cancel;
  ModalResult := mrCancel;
end;

end.
