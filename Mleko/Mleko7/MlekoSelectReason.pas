unit MlekoSelectReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKSelect, MSAccess, DB, MemDS, DBAccess, COMPSQLBuilder,
  citComponentProps, ActnList, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, ExtCtrls;

type
  TMlekoSelectReasonDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectReasonDlg: TMlekoSelectReasonDlg;

implementation

{$R *.dfm}

initialization
 RegisterClass(TMlekoSelectReasonDlg);

finalization
 UnRegisterClass(TMlekoSelectReasonDlg);

end.
