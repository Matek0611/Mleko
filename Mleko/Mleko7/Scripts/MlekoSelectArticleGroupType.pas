unit MlekoSelectArticleGroupType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder,   ActnList, 
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, MemDS;

type
  TMlekoSelectArticleGroupTypeDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectArticleGroupTypeDlg: TMlekoSelectArticleGroupTypeDlg;

implementation

{$R *.dfm}
initialization
 RegisterClass(TMlekoSelectArticleGroupTypeDlg);

finalization
 UnRegisterClass(TMlekoSelectArticleGroupTypeDlg);

end.
