unit GetPeriodDate0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Mask, rxToolEdit, ActnList;

type
  TfmGetPeriodDate = class(TMlekoForm)
    deDateBegin: TDateEdit;
    deDateEnd: TDateEdit;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TDatePeriod=record
   DateBegin:TDate;
   DateEnd  :TDate;
end;

var
  fmGetPeriodDate: TfmGetPeriodDate;
  function GetPeriodDate(DefDateBegin,DefDateEnd:TDate):TDatePeriod;
implementation

{$R *.DFM}
function GetPeriodDate(DefDateBegin,DefDateEnd:TDate):TDatePeriod;
var
 Year,Month,Day:word;
begin
 Result.DateBegin:=0;
 Result.DateEnd:=0;
 fmGetPeriodDate:=TfmGetPeriodDate.Create(Application);
 try
 DecodeDate(Date(),Year,Month,Day);
 with fmGetPeriodDate do
  begin
   if DefDateBegin<>0 then
    deDateBegin.Date:=DefDateBegin
   else
    deDateBegin.Date:=EncodeDate(Year,Month,1);

   if DefDateEnd<>0 then
    deDateEnd.Date:=DefDateEnd
   else
    begin
     if Month=12 then
      deDateEnd.Date:=EncodeDate(Year+1,1,1)-1
     else
      deDateEnd.Date:=EncodeDate(Year,Month+1,1)-1;
    end;
   if fmGetPeriodDate.ShowModal=mrOk then
    begin
     Result.DateBegin:=deDateBegin.Date;
     Result.DateEnd:=deDateEnd.Date;
    end;
  end;
 finally
 fmGetPeriodDate.Free;
 end;

end;

end.
