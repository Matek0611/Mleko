unit MlekoSelectRegion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKSelect, MSAccess, DB, MemDS, DBAccess, COMPSQLBuilder,
  citComponentProps, ActnList, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, ExtCtrls,
  comp_TargetFilter_CustomFilter, comp_TargetFilter_StringFilter;

type
  TMlekoSelectRegionDlg = class(TCFLMLKSelectDlg)
    TargetFilter_StringFilter1: TTargetFilter_StringFilter;
    procedure TargetFilter_StringFilter1a_OnBeforeGetString(
      Sender: TTargetFilter_StringFilter;
      ConditionType: TStringConditionType;
      ConditionGroup: TStringConditionGroup; var LikeStr: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectRegionDlg: TMlekoSelectRegionDlg;

implementation

{$R *.dfm}

procedure TMlekoSelectRegionDlg.TargetFilter_StringFilter1a_OnBeforeGetString(
  Sender: TTargetFilter_StringFilter; ConditionType: TStringConditionType;
  ConditionGroup: TStringConditionGroup; var LikeStr: String);
begin
  inherited;
  LikeStr := '%' + LikeStr + '%';
end;

initialization
  RegisterClass(TMlekoSelectRegionDlg);

finalization
  UnRegisterClass(TMlekoSelectRegionDlg);

end.
