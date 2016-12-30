unit MlekoSelectFIrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DB, DBAccess, MsAccess, COMPSQLBuilder, ActnList,
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls,
  ComCtrls, ToolWin, Grids, DBGrids, citDbGrid,
  comp_TargetFilter_CustomFilter, comp_TargetFilter_StringFilter,
  PropFilerEh, MemDS;

type
  TMlekoSelectFIrmDlg = class(TCFLMLKSelectDlg)
    FilterName: TTargetFilter_StringFilter;
    TargetFilter_StringFilter1: TTargetFilter_StringFilter;
    chkShowDolg: TCheckBox;
    chkOnlyDolg: TCheckBox;
    BtNone: TButton;
    chkOnlyZatrati: TCheckBox;
    procedure FilterNamea_OnBeforeGetString(
      Sender: TTargetFilter_StringFilter;
      ConditionType: TStringConditionType;
      ConditionGroup: TStringConditionGroup; var LikeStr: string);
    procedure QueryBeforeOpen(DataSet: TDataSet);
  protected
    { Private declarations }
  public
    class function SelectFirm(var aFirmId: integer): boolean;
  end;

var
  MlekoSelectFIrmDlg: TMlekoSelectFIrmDlg;

implementation

uses data;

{$R *.dfm}

class function TMlekoSelectFIrmDlg.SelectFirm(var aFirmId: integer): boolean;
var
  lv_firmId: string;
begin
  inherited;
  if OpenSelect(aFirmId, true) then
  begin
    result := true;
  end
  else
    result := false;
end;

procedure TMlekoSelectFIrmDlg.FilterNamea_OnBeforeGetString(
  Sender: TTargetFilter_StringFilter; ConditionType: TStringConditionType;
  ConditionGroup: TStringConditionGroup; var LikeStr: string);
begin
  inherited;
  LikeStr := '%' + LikeStr + '%';
end;

procedure TMlekoSelectFIrmDlg.QueryBeforeOpen(DataSet: TDataSet);
var
  _dolg_sql, _only_dolg, _only_zatrati: string;
begin
  inherited;
  _dolg_sql := '';
  _only_dolg := '';
  _only_zatrati := '';
  if chkShowDolg.Checked then _dolg_sql := ',(SELECT Sum(freesumma) FROM   v_list_entity v  WHERE  v.postno = a.postno) AS summadolg';
  if chkOnlyDolg.Checked then _only_dolg := ' and exists (select 1 from NaklR where SummaDolg<>0  and PostNoFirst=a.PostNo union all select 1 from Naklp p where SummaDolg<>0  and p.postNo=a.PostNo) ';
  if chkOnlyZatrati.Checked then _only_zatrati := ' and (select prop_id from l_firm_prop where PostNo = a.PostNo and prop_id = 11) is not null ';
  TMSQuery(DataSet).MacroByName('_dolg_sql').Value:= _dolg_sql;
  TMSQuery(DataSet).MacroByName('_only_dolg').Value:= _only_dolg;
  TMSQuery(DataSet).MacroByName('_only_zatrati').Value:= _only_zatrati;
end;

initialization
  RegisterClass(TMlekoSelectFIrmDlg);

finalization
  UnRegisterClass(TMlekoSelectFIrmDlg);

end.

