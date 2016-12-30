unit MlekoSelectResponseDept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, MsAccess, DB, MemDS, DBAccess, COMPSQLBuilder,
  citComponentProps, ActnList, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, ExtCtrls;

type
  TMlekoSelectResponseDeptDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectResponseDeptDlg: TMlekoSelectResponseDeptDlg;

implementation

{$R *.dfm}

initialization
 RegisterClass(TMlekoSelectResponseDeptDlg);

finalization
 UnRegisterClass(TMlekoSelectResponseDeptDlg);

end.
