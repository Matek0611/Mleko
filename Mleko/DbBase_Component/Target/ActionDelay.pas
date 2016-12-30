unit ActionDelay;

interface

uses
  Windows, Messages, SysUtils, Classes, ExtCtrls, ActnList;

type
  TActionDelay = class(TTimer)
  private
    FAction: TAction;
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    property Action: TAction read FAction write FAction;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Target', [TActionDelay]);
end;

end.
