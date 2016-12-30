unit MlekoSelectUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder,   ActnList, 
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, comp_TargetFilter_CustomFilter,
  comp_TargetFilter_StringFilter, MemDS;

type
  TMlekoSelectUserDlg = class(TCFLMLKSelectDlg)
    TargetFilter_StringFilter1: TTargetFilter_StringFilter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectUserDlg: TMlekoSelectUserDlg;

implementation

{$R *.dfm}

initialization
 RegisterClass(TMlekoSelectUserDlg);

finalization
 UnRegisterClass(TMlekoSelectUserDlg);

end.
