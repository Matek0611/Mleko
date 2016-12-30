unit GetMonth0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Spin,GetDate0, ActnList;

type
  TfmGetMonth = class(TMlekoForm)
    seYear: TSpinEdit;
    cbMonth: TComboBox;
    Bevel1: TBevel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmGetMonth: TfmGetMonth;
  function GetMonth:TPeriodDate;
implementation


{$R *.DFM}
function GetMonth:TPeriodDate;
var
 Year,Month,Day:word;
begin
 Result[1]:=0;
 Result[2]:=0;
 DecodeDate(Date,Year,Month,Day);
 fmGetMonth:=TfmGetMonth.Create(Application);
 fmGetMonth.cbMonth.ItemIndex:=Month-1;
 fmGetMonth.seYear.Value:=Year;
 try
 if fmGetMonth.ShowModal=mrOK then
  begin
   Result[1]:=EncodeDate(fmGetMonth.seYear.Value,fmGetMonth.cbMonth.ItemIndex+1,1);
   if fmGetMonth.cbMonth.ItemIndex+1=12 then
    begin
     Result[2]:=EncodeDate(fmGetMonth.seYear.Value+1,1,1)-1;
    end
   else
    Result[2]:=EncodeDate(fmGetMonth.seYear.Value,fmGetMonth.cbMonth.ItemIndex+2,1)-1;
  end;
 finally
// ShowMessage(DateToStr(result[1])+'/'+DateToStr(Result[2]));
 fmGetMonth.Free;
 end;
end;

end.
