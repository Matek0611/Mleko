unit EditClassifierABCDZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ExtCtrls, ActnList, StdCtrls, DB, DBAccess, MSAccess,
  MemDS, DBCtrls, Mask;

type
  TEditClassifierABCDZForm = class(TMlekoForm)
    Panel1: TPanel;
    DBEditClassifierName: TDBEdit;
    DBTextClassifierNo: TDBText;
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
  EditClassifierABCDZForm: TEditClassifierABCDZForm;

implementation

uses data, ClassifierABCDZ;

{$R *.dfm}

procedure TEditClassifierABCDZForm.bbOkClick(Sender: TObject);
begin
  inherited;
  try
  except
  SysUtils.Beep;
  exit;
 end;
 EditClassifierABCDZForm.Close;
end;

procedure TEditClassifierABCDZForm.bbCancelClick(Sender: TObject);
begin
  inherited;
  DBEditActive.Undo;
  DBEditClassifierName.Undo;
  EditClassifierABCDZForm.Close;
end;


end.
