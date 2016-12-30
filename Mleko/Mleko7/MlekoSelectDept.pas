unit MlekoSelectDept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, MsAccess, DB, MemDS, DBAccess, COMPSQLBuilder,
  ActnList, citComponentProps, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, ExtCtrls;

type
  TMlekoSelectDeptDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectDeptDlg: TMlekoSelectDeptDlg;

implementation

{$R *.dfm}
initialization
 RegisterClass(TMlekoSelectDeptDlg);

finalization
 UnRegisterClass(TMlekoSelectDeptDlg);

end.
