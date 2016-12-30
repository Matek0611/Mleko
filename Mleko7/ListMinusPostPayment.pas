unit ListMinusPostPayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, CFLMLKCustom;

type
  TListMinusPostPaymentForm = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListMinusPostPayment: TMSDataSource;
    quListMinusPostPayment: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    quListMinusPostPaymentPostNo: TSmallintField;
    quListMinusPostPaymentName: TStringField;
    quListMinusPostPaymentCheckMinus: TBooleanField;
    procedure OKClick(Sender: TObject);
    procedure JnvtyfClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListMinusPostPaymentForm: TListMinusPostPaymentForm;

implementation

uses data;

{$R *.dfm}

procedure TListMinusPostPaymentForm.OKClick(Sender: TObject);
begin
  if quListMinusPostPayment.State in [dsInsert, dsEdit] then quListMinusPostPayment.Post;
  ModalResult := mrOk;
end;

procedure TListMinusPostPaymentForm.JnvtyfClick(Sender: TObject);
begin
  quListMinusPostPayment.Cancel;
  ModalResult := mrCancel;
end;

end.
