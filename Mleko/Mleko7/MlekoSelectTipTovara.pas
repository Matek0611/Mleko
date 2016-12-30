unit MlekoSelectTipTovara;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder,   ActnList, 
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, MemDS,
  comp_TargetFilter_CustomFilter, comp_TargetFilter_StringFilter;

type
  TMlekoSelectTipTovaraDlg = class(TCFLMLKSelectDlg)
    TargetFilter_VidName: TTargetFilter_StringFilter;
    procedure TargetFilter_VidNamea_OnBeforeGetString(
      Sender: TTargetFilter_StringFilter;
      ConditionType: TStringConditionType;
      ConditionGroup: TStringConditionGroup; var LikeStr: String);

  private
    { Private declarations }
  public
    class function SelectTipNo(var aTipNo:integer):boolean;
    { Public declarations }
  end;

var
  MlekoSelectTipTovaraDlg: TMlekoSelectTipTovaraDlg;

implementation

uses data;

{$R *.dfm}

class function TMlekoSelectTipTovaraDlg.SelectTipNo(var aTipNo:integer):boolean;
Var lv_firmId: String;
begin
  inherited;
  if OpenSelect(aTipNo,true) then begin
      result:=true;
   end else result:=false;
end;

procedure TMlekoSelectTipTovaraDlg.TargetFilter_VidNamea_OnBeforeGetString(
  Sender: TTargetFilter_StringFilter; ConditionType: TStringConditionType;
  ConditionGroup: TStringConditionGroup; var LikeStr: String);
begin
  inherited;
    LikeStr := '%'+LikeStr+'%';

end;

initialization
 RegisterClass(TMlekoSelectTipTovaraDlg);

finalization
 UnRegisterClass(TMlekoSelectTipTovaraDlg);

end.
