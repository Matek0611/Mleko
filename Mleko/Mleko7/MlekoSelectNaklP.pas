unit MlekoSelectNaklP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKSelect, MSAccess, DB, MemDS, DBAccess, COMPSQLBuilder,
  citComponentProps, ActnList, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, ExtCtrls,
  comp_TargetFilter_CustomFilter, comp_TargetFilter_DateFilter;

type
  TMlekoSelectNaklPDlg = class(TCFLMLKSelectDlg)
    ftDateNakl: TTargetFilter_DateFilter;
    procedure FormCreate(Sender: TObject);
    procedure ftDateNakla_OnFilterChanged(
      Sender: TtargetFilter_CustomFilter);
  private
    { Private declarations }
  public
    { Public declarations }
    class function  SelectNaklP (var aNaklNo:integer):boolean;
  end;

var
  MlekoSelectNaklPDlg: TMlekoSelectNaklPDlg;

implementation

uses main;

{$R *.dfm}

class function TMlekoSelectNaklPDlg.SelectNaklP(var aNaklNo:integer):boolean;

begin
  inherited;
  if OpenSelect(aNaklNo,true) then
   begin
      result:=true;
   end
    else result:=false;
end;

procedure TMlekoSelectNaklPDlg.FormCreate(Sender: TObject);
begin
  inherited;
  ftDateNakl.a_Minimum := Main.GlobalDateNakl;
  ftDateNakl.a_Maximum := Main.GlobalDateNakl;
end;

procedure TMlekoSelectNaklPDlg.ftDateNakla_OnFilterChanged(
  Sender: TtargetFilter_CustomFilter);
begin
  inherited;
  dbgrid.Refresh;
end;

initialization
 RegisterClass(TMlekoSelectNaklPDlg);

finalization
 UnRegisterClass(TMlekoSelectNaklPDlg);
end.
