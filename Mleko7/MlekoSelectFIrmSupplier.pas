unit MlekoSelectFIrmSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DB, DBAccess, MsAccess, COMPSQLBuilder, ActnList,
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls,
  ComCtrls, ToolWin, Grids, DBGrids, citDbGrid,
  comp_TargetFilter_CustomFilter, comp_TargetFilter_StringFilter,
  PropFilerEh, MemDS;

type
  TMlekoSelectFIrmSupplierDlg = class(TCFLMLKSelectDlg)
    FilterName: TTargetFilter_StringFilter;
    TargetFilter_StringFilter1: TTargetFilter_StringFilter;
    chkShowDolg: TCheckBox;
    chkOnlyDolg: TCheckBox;
    Button1: TButton;
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
  MlekoSelectFIrmSupplierDlg: TMlekoSelectFIrmSupplierDlg;

implementation

uses data;

{$R *.dfm}

class function TMlekoSelectFIrmSupplierDlg.SelectFirm(var aFirmId: integer): boolean;
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

procedure TMlekoSelectFIrmSupplierDlg.FilterNamea_OnBeforeGetString(
  Sender: TTargetFilter_StringFilter; ConditionType: TStringConditionType;
  ConditionGroup: TStringConditionGroup; var LikeStr: string);
begin
  inherited;
  LikeStr := '%' + LikeStr + '%';
end;

procedure TMlekoSelectFIrmSupplierDlg.QueryBeforeOpen(DataSet: TDataSet);
var
  _dolg_sql, _only_dolg: string;
begin
  inherited;
  _dolg_sql := '';
  _only_dolg := '';
  if chkShowDolg.Checked then _dolg_sql := ',(SELECT Sum(freesumma) FROM   v_list_entity  WHERE  postno = a.postno) AS summadolg';
  if chkOnlyDolg.Checked then _only_dolg := ' and exists (select 1 from NaklR where SummaDolg<>0  and PostNoFirst=a.PostNo union all select 1 from Naklp where SummaDolg<>0  and postNo=a.PostNo) ';
  TMSQuery(DataSet).MacroByName('_dolg_sql').Value:= _dolg_sql;
  TMSQuery(DataSet).MacroByName('_only_dolg').Value:= _only_dolg;
end;

initialization
  RegisterClass(TMlekoSelectFIrmSupplierDlg);

finalization
  UnRegisterClass(TMlekoSelectFIrmSupplierDlg);

end.

