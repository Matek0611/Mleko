unit GetPeriodDateProiz0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, GetPeriodDate0, Buttons, RxToolEdit, DB, 
  ActnList, StdCtrls, Mask;

type
  TfmGetPeriodDateProiz = class(TfmGetPeriodDate)
  private
    { Private declarations }
  public
  end;

var
  fmGetPeriodDateProiz: TfmGetPeriodDateProiz;
  function GetPeriodDateProiz(DefDateBegin,DefDateEnd:TDate):TDatePeriod;
implementation

{$R *.dfm}
function GetPeriodDateProiz(DefDateBegin,DefDateEnd:TDate):TDatePeriod;
begin
  GetPeriodDate(DefDateBegin,DefDateEnd);
end;

end.
