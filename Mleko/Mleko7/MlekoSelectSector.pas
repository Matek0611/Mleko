unit MlekoSelectSector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder,   ActnList, 
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, MemDS;

type
  TMlekoSelectSectorDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    class function SelectSector(var aSectorId:integer):boolean;
  end;

var
  MlekoSelectSectorDlg: TMlekoSelectSectorDlg;

implementation

{$R *.dfm}

class function TMlekoSelectSectorDlg.SelectSector(var aSectorId:integer):boolean;
Var lv_firmId: String;
begin
  inherited;
  if OpenSelect(aSectorId,true) then begin
      result:=true;
   end else result:=false;
end;

initialization
 RegisterClass(TMlekoSelectSectorDlg);

finalization
 UnRegisterClass(TMlekoSelectSectorDlg);

end.
