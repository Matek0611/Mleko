unit MlekoSelectPriceType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder,   ActnList, 
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, MemDS;

type
  TMlekoSelectPriceTypeDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectPriceTypeDlg: TMlekoSelectPriceTypeDlg;

implementation

{$R *.dfm}
initialization
 RegisterClass(TMlekoSelectPriceTypeDlg);

finalization
 UnRegisterClass(TMlekoSelectPriceTypeDlg);

end.
