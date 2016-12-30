unit MlekoSelectVidNakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder,   ActnList, 
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, MemDS;

type
  TMlekoSelectVidNaklDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectVidNaklDlg: TMlekoSelectVidNaklDlg;

implementation

{$R *.dfm}
initialization
 RegisterClass(TMlekoSelectVidNaklDlg);

finalization
 UnRegisterClass(TMlekoSelectVidNaklDlg);

end.
