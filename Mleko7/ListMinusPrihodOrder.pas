unit ListMinusPrihodOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls;

type
  TListMinusPrihodOrderForm = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListMinusPrihodOrder: TMSDataSource;
    quListMinusPrihodOrder: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    quListMinusPrihodOrderPostNo: TSmallintField;
    quListMinusPrihodOrderName: TStringField;
    quListMinusPrihodOrderCheckMinus: TBooleanField;
    procedure OKClick(Sender: TObject);
    procedure JnvtyfClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListMinusPrihodOrderForm: TListMinusPrihodOrderForm;

implementation

uses data;

{$R *.dfm}

procedure TListMinusPrihodOrderForm.OKClick(Sender: TObject);
begin
  if quListMinusPrihodOrder.State in [dsInsert, dsEdit] then quListMinusPrihodOrder.Post;
  ModalResult := mrOk;
end;

procedure TListMinusPrihodOrderForm.JnvtyfClick(Sender: TObject);
begin
  quListMinusPrihodOrder.Cancel;
  ModalResult := mrCancel;
end;

end.
