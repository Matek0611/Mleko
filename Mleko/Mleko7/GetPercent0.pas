unit GetPercent0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Mask, RxCurrEdit, rxToolEdit, ActnList;

type
  TfmGetPercent = class(TMlekoForm)
    cePercent: TCurrencyEdit;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmGetPercent: TfmGetPercent;
  function GetPercent:double;
implementation

{$R *.DFM}
function GetPercent:double;
begin
 Result:=0;
 fmGetPercent:=TfmGetPercent.Create(Application);
 try
 if fmGetPercent.ShowModal=mrOk then
  Result:=fmGetPercent.cePercent.Value;
 finally
 fmGetPercent.Free;
 end;
end;

end.
