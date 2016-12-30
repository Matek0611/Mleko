unit MlekoSelectStandarts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKSelect, MSAccess, DB, MemDS, DBAccess, COMPSQLBuilder,
  citComponentProps, ActnList, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, ExtCtrls;

type
  TMlekoSelectStandartsDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
    class function  SelectStandart (var aId:integer):boolean;
  end;

var
  MlekoSelectStandartsDlg: TMlekoSelectStandartsDlg;

implementation

{$R *.dfm}

class function TMlekoSelectStandartsDlg.SelectStandart (var aId:integer):boolean;
begin
  inherited;
  if OpenSelect(aId,true) then
   begin
      result:=true;
   end
    else result:=false;
end;

initialization
 RegisterClass(TMlekoSelectStandartsDlg);

finalization
 UnRegisterClass(TMlekoSelectStandartsDlg);

end.
