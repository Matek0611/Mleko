unit EditTypeReturn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ExtCtrls, ActnList, StdCtrls, DB, DBAccess, MSAccess,
  MemDS, DBCtrls, Mask;

type
  TEditTypeReturnForm = class(TMlekoForm)
    Panel1: TPanel;
    DBEditTypeReturnName: TDBEdit;
    DBTextTypeReturnNo: TDBText;
    DBEditActive: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    bbOk: TButton;
    bbCancel: TButton;
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditTypeReturnForm: TEditTypeReturnForm;

implementation

uses data, TypeReturn;

{$R *.dfm}

procedure TEditTypeReturnForm.bbOkClick(Sender: TObject);
begin
  inherited;
    try
    DBEditTypeReturnName.Update;
    DBEditActive.Update;
    except
    SysUtils.Beep;
    exit;
 end;
 EditTypeReturnForm.Close;
end;

procedure TEditTypeReturnForm.bbCancelClick(Sender: TObject);
begin
  inherited;
  DBEditActive.Undo;
  DBEditTypeReturnName.Undo;
  EditTypeReturnForm.Close;
end;

end.
