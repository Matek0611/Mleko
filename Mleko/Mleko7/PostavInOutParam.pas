unit PostavInOutParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ExtCtrls, citCtrls, citmask, citCalendar, pr_Common,
  pr_Classes, DB, DBAccess, MSAccess;

type
  TfmPostavInOutParam = class(TMlekoForm)
    Bevel1: TBevel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    EdDateBeginOut: TcitDateEdit;
    EdDateEndIn: TcitDateEdit;
    EdDateBeginIn: TcitDateEdit;
    EdDateEndOut: TcitDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    sp_get_in_out_report: TMSStoredProc;
    prReport1: TprReport;
  private
    { Private declarations }
     DateBeginIn :TDateTime;
     DateEndIn   :TDateTime;
     DateBeginOut:TDateTime;
     DateEndOut  :TDateTime;
  public
    { Public declarations }
  end;


var
  fmPostavInOutParam: TfmPostavInOutParam;
  function GetPostavInOutParam():Integer;

implementation

uses GetDate0, post0, SelOtdel, data;

{$R *.DFM}
function GetPostavInOutParam():Integer;
begin

// Result.OtdelNo:='';
 fmPostavInOutParam:=TfmPostavInOutParam.Create(Application);

 fmPostavInOutParam.EdDateBeginIn.Text:=datetostr(Date()-14);
 fmPostavInOutParam.EdDateBeginOut.Text:=datetostr(Date()-7);
 fmPostavInOutParam.EdDateEndIn.Text:=datetostr(Date()-7);
 fmPostavInOutParam.EdDateEndOut.Text:=datetostr(Date());
 try
 if fmPostavInOutParam.ShowModal=mrOk then
  begin
//    fmPostavInOutParam.sp_get_in_out_report.Prepare;
    fmPostavInOutParam.sp_get_in_out_report.Params[1].Value:=fmPostavInOutParam.EdDateBeginIn.CurrentDate;
    fmPostavInOutParam.sp_get_in_out_report.Params[2].Value:=fmPostavInOutParam.EdDateEndIn.CurrentDate;
    fmPostavInOutParam.sp_get_in_out_report.Params[3].Value:=fmPostavInOutParam.EdDateBeginOut.CurrentDate;
    fmPostavInOutParam.sp_get_in_out_report.Params[4].Value:=fmPostavInOutParam.EdDateEndOut.CurrentDate;
    fmPostavInOutParam.sp_get_in_out_report.Open;
    if fmPostavInOutParam.prReport1.PrepareReport then
       fmPostavInOutParam.prReport1.PreviewPreparedReport(true);
  end
 finally
 fmPostavInOutParam.Free;
 end;
end;

end.
