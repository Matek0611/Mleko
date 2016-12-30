unit MoneyEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, StdCtrls;

type
  TMoneyEdit = class(TEdit)
  private
    procedure OnEditChange(Sender: TObject; var Key: Char);
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
  end;

procedure Register;

implementation

uses Dialogs;

constructor TMoneyEdit.Create(AOwner: TComponent);
begin
    inherited;
    OnKeyPress := OnEditChange;
end;

procedure TMoneyEdit.OnEditChange(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9', '.', ',']) then begin
        ShowMessage('јй-€-€й тебе не кажетс€, что это не цифра, а?');
    end;
end;

procedure Register;
begin
  RegisterComponents('Target', [TMoneyEdit]);
end;

end.
