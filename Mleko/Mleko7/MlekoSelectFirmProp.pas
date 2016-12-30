unit MlekoSelectFirmProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKSelect, MsAccess, DB, MemDS, DBAccess, COMPSQLBuilder,
  citComponentProps, ActnList, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, ExtCtrls;

type
  TMlekoSelectFirmPropDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectFirmPropDlg: TMlekoSelectFirmPropDlg;

implementation

{$R *.dfm}
initialization
  RegisterClass(TMlekoSelectFirmPropDlg);

finalization
  UnRegisterClass(TMlekoSelectFirmPropDlg);

end.
