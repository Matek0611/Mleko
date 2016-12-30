unit MlekoSelectReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder,   ActnList, 
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, comp_TargetFilter_CustomFilter,
  comp_TargetFilter_StringFilter, MemDS ;

type
  TMlekoSelectReportDlg = class(TCFLMLKSelectDlg)
    TargetFilter_StringFilter1: TTargetFilter_StringFilter;
    FilterName: TTargetFilter_StringFilter;
    SpDelReport: TMSStoredProc;
    procedure ActionItemDelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SQLBuilderGetParams(Sender: TObject; var Params: TParams);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectReportDlg: TMlekoSelectReportDlg;

implementation

uses data;

{$R *.dfm}

procedure TMlekoSelectReportDlg.ActionItemDelExecute(Sender: TObject);
begin
  inherited;
    if Application.MessageBox('Удалить отчет, уверены?','Отчет',MB_YESNO)=IDYES then begin
    SpDelReport.Close;
    SpDelReport.Prepare;
    SpDelReport.Params.ParamByName('p_report_id').Value:=Query.FieldByName('ID').AsInteger;
    SpDelReport.ExecProc;
    ActionViewRefresh.Execute;
  end;
end;

procedure TMlekoSelectReportDlg.FormShow(Sender: TObject);
begin
  inherited;
  ActionItemDel.Enabled:=(data.CodeAccess<=1);
end;

procedure TMlekoSelectReportDlg.SQLBuilderGetParams(Sender: TObject;
  var Params: TParams);
  var is_show_all_active:Integer;
begin
  inherited;
  if data.CodeAccess<=1 then is_show_all_active:=1 else is_show_all_active:=0;
      with Params.CreateParam(ftInteger, 'p_CodeAccess', ptInput) do AsInteger := data.CodeAccess;
      with Params.CreateParam(ftInteger, 'is_show_all_active', ptInput) do AsInteger := is_show_all_active;
end;

initialization
 RegisterClass(TMlekoSelectReportDlg);

finalization
 UnRegisterClass(TMlekoSelectReportDlg);

end.
