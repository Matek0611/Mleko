unit MlekoSelectCategoryTT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKSelect, MSAccess, DB, MemDS, DBAccess, COMPSQLBuilder,
  citComponentProps, ActnList, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, ExtCtrls;

type
  TMlekoSelectCategoryTTDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectCategoryTTDlg: TMlekoSelectCategoryTTDlg;

implementation

{$R *.dfm}

initialization
 RegisterClass(TMlekoSelectCategoryTTDlg);

finalization
 UnRegisterClass(TMlekoSelectCategoryTTDlg);
end.
