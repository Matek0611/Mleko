unit MlekoSelectDocState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, MsAccess, DB, MemDS, DBAccess, COMPSQLBuilder,
  ActnList, citComponentProps, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, ExtCtrls;

type
  TMlekoSelectDocStateDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectDocStateDlg: TMlekoSelectDocStateDlg;

implementation

{$R *.dfm}

initialization
 RegisterClass(TMlekoSelectDocStateDlg);

finalization
 UnRegisterClass(TMlekoSelectDocStateDlg);

end.
