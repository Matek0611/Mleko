unit MlekoSelectTypeReturn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder,   ActnList, 
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, MemDS;

type
  TMlekoSelectTypeReturnDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectTypeReturnDlg: TMlekoSelectTypeReturnDlg;

implementation

{$R *.dfm}
initialization
 RegisterClass(TMlekoSelectTypeReturnDlg);

finalization
 UnRegisterClass(TMlekoSelectTypeReturnDlg);

end.
