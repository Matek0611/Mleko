unit CRDBGrid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Grids, DBGrids, CRGrid, StdCtrls,
  ActnList, ExtCtrls, DBCtrls, MSAccess, SdacVcl,
  Buttons, DemoFrame, SdacDemoForm;

type
  TCRDBGridFrame = class(TDemoFrame)
    MSQuery: TMSQuery;
    DataSource: TDataSource;
    ActionList1: TActionList;
    actSearchBar: TAction;
    actFilterBar: TAction;
    scCreate: TMSSQL;
    scDrop: TMSSQL;
    CRDBGrid: TCRDBGrid;
    Panel2: TPanel;
    Panel1: TPanel;
    btOpen: TSpeedButton;
    btClose: TSpeedButton;
    Panel3: TPanel;
    chkFiltered: TCheckBox;
    chkFilterBar: TCheckBox;
    chkSearchBar: TCheckBox;
    chkRecCount: TCheckBox;
    chkStretch: TCheckBox;
    DBNavigator1: TDBNavigator;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure actSearchBarExecute(Sender: TObject);
    procedure actSearchBarUpdate(Sender: TObject);
    procedure actFilterBarExecute(Sender: TObject);
    procedure actFilterBarUpdate(Sender: TObject);
    procedure chkFilteredClick(Sender: TObject);
    procedure chkRecCountClick(Sender: TObject);
    procedure chkStretchClick(Sender: TObject);
  private
    { Private declarations }
  public
    // Demo management
    procedure Initialize; override;
    procedure SetDebug(Value: boolean); override;
  end;

implementation

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}

procedure TCRDBGridFrame.btOpenClick(Sender: TObject);
begin
  MSQuery.Open;
end;

procedure TCRDBGridFrame.btCloseClick(Sender: TObject);
begin
  MSQuery.Close;
end;

procedure TCRDBGridFrame.actSearchBarExecute(Sender: TObject);
begin
  actSearchBar.Checked := not actSearchBar.Checked;
  if actSearchBar.Checked then
    CRDBGrid.OptionsEx := CRDBGrid.OptionsEx + [dgeSearchBar]
  else
    CRDBGrid.OptionsEx := CRDBGrid.OptionsEx - [dgeSearchBar];
end;

procedure TCRDBGridFrame.actSearchBarUpdate(Sender: TObject);
begin
  actSearchBar.Checked := dgeSearchBar in CRDBGrid.OptionsEx;
end;

procedure TCRDBGridFrame.actFilterBarExecute(Sender: TObject);
begin
  actFilterBar.Checked := not actFilterBar.Checked;
  if actFilterBar.Checked then
    CRDBGrid.OptionsEx := CRDBGrid.OptionsEx + [dgeFilterBar]
  else
    CRDBGrid.OptionsEx := CRDBGrid.OptionsEx - [dgeFilterBar];
end;

procedure TCRDBGridFrame.actFilterBarUpdate(Sender: TObject);
begin
  actFilterBar.Checked := dgeFilterBar in CRDBGrid.OptionsEx;
end;

procedure TCRDBGridFrame.chkFilteredClick(Sender: TObject);
begin
  CRDBGrid.Filtered := chkFiltered.Checked;
end;

procedure TCRDBGridFrame.chkRecCountClick(Sender: TObject);
begin
  if chkRecCount.Checked then
    CRDBGrid.OptionsEx := CRDBGrid.OptionsEx + [dgeRecordCount]
  else
    CRDBGrid.OptionsEx := CRDBGrid.OptionsEx - [dgeRecordCount];
end;

procedure TCRDBGridFrame.chkStretchClick(Sender: TObject);
begin
  if chkStretch.Checked then
    CRDBGrid.OptionsEx := CRDBGrid.OptionsEx + [dgeStretch]
  else
    CRDBGrid.OptionsEx := CRDBGrid.OptionsEx - [dgeStretch];
end;

// Demo management
procedure TCRDBGridFrame.Initialize;
begin
  inherited;
  MSQuery.Connection := Connection as TMSConnection;
end;

procedure TCRDBGridFrame.SetDebug(Value: boolean);
begin
  MSQuery.Debug := Value;
end;

end.
