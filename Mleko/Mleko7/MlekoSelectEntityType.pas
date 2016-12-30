unit MlekoSelectEntityType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder,   ActnList, 
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, MemDS;

type
  TMlekoSelectEntityTypeDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectEntityTypeDlg: TMlekoSelectEntityTypeDlg;

implementation

{$R *.dfm}

initialization
 RegisterClass(TMlekoSelectEntityTypeDlg);

finalization
 UnRegisterClass(TMlekoSelectEntityTypeDlg);

end.
