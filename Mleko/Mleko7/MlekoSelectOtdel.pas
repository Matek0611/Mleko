unit MlekoSelectOtdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder, ActnList, 
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, MemDS ;

type
  TMlekoSelectOtdelDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectOtdelDlg: TMlekoSelectOtdelDlg;

implementation

{$R *.dfm}

initialization
 RegisterClass(TMlekoSelectOtdelDlg);

finalization
 UnRegisterClass(TMlekoSelectOtdelDlg);

end.
