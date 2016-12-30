unit MlekoSelectMarijaGroupTax;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKSelect, MSAccess, DB, MemDS, DBAccess, COMPSQLBuilder,
  citComponentProps, ActnList, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, ExtCtrls;

type
  TMlekoSelectMarijaGroupTaxDlg = class(TCFLMLKSelectDlg)
  private
    { Private declarations }
  public
    { Public declarations }
    class function  SelectMarijaGroupTax (var aId:integer):boolean;
  end;

var
  MlekoSelectMarijaGroupTaxDlg: TMlekoSelectMarijaGroupTaxDlg;

implementation

{$R *.dfm}

class function TMlekoSelectMarijaGroupTaxDlg.SelectMarijaGroupTax (var aId:integer):boolean;
begin
  inherited;
  if OpenSelect(aId,true) then
   begin
      result:=true;
   end
    else result:=false;
end;

initialization
 RegisterClass(TMlekoSelectMarijaGroupTaxDlg);

finalization
 UnRegisterClass(TMlekoSelectMarijaGroupTaxDlg);

end.
