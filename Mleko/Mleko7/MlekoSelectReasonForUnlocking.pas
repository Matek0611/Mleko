unit MlekoSelectReasonForUnlocking;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder, ActnList, 
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, MemDS ;

type
  TMlekoSelectReasonForUnlockingDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectReasonForUnlockingDlg: TMlekoSelectReasonForUnlockingDlg;

implementation

{$R *.dfm}

initialization
 RegisterClass(TMlekoSelectReasonForUnlockingDlg);

finalization
 UnRegisterClass(TMlekoSelectReasonForUnlockingDlg);

end.
