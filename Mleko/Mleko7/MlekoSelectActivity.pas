unit MlekoSelectActivity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder,   ActnList, 
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, MemDS;

type
  TMlekoSelectActivityDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectActivityDlg: TMlekoSelectActivityDlg;

implementation

{$R *.dfm}
initialization
 RegisterClass(TMlekoSelectActivityDlg);

finalization
 UnRegisterClass(TMlekoSelectActivityDlg);

end.
