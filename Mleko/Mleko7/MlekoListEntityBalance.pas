unit MlekoListEntityBalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, MsAccess, Menus, citComponentProps, DB, 
  DBAccess, COMPSQLBuilder, ActnList, citDbGrid,
  ExtCtrls, comp_TargetFilter_Panel, ComCtrls, ToolWin,CFLMLKMDIChild, 
  cxControls, cxSplitter, cxPropertiesStore;

type
  TMlekoListEntityBalanceForm = class(TCFLMLKMDIChildForm)
    PanelLeft: TPanel;
    PanelRight: TPanel;
    PanelDebMain: TPanel;
    PanelGridKredMain: TPanel;
    Splitter: TcxSplitter;
    PS: TcxPropertiesStore;
    procedure SplitterMoved(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoListEntityBalanceForm: TMlekoListEntityBalanceForm;

implementation

uses data;

{$R *.dfm}

procedure TMlekoListEntityBalanceForm.SplitterMoved(Sender: TObject);
begin
  inherited;
//  if PanelLeft.Width>PanelRight.Width then Splitter.Control:=PanelLeft else Splitter.Control:=PanelRight;
end;

end.
