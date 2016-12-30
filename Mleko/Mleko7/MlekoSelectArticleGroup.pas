unit MlekoSelectArticleGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKSelect, MSAccess, DB, MemDS, DBAccess, COMPSQLBuilder,
  citComponentProps, ActnList, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, ExtCtrls;

type
  TMlekoSelectArticleGroupDlg = class(TCFLMLKSelectDlg)
    QueryID: TLargeintField;
    QueryGroupName: TStringField;
    Queryis_select: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    class function  SelectArticleGroup (var aId:integer):boolean;
  end;

var
  MlekoSelectArticleGroupDlg: TMlekoSelectArticleGroupDlg;

implementation

{$R *.dfm}

class function TMlekoSelectArticleGroupDlg.SelectArticleGroup(var aId:integer):boolean;

begin
  inherited;
  if OpenSelect(aId,true) then
   begin
      result:=true;
   end
    else result:=false;
end;


initialization
 RegisterClass(TMlekoSelectArticleGroupDlg);

finalization
 UnRegisterClass(TMlekoSelectArticleGroupDlg);

end.
