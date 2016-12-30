unit FetchAll;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, Db, Grids, DBGrids,  StdCtrls, ToolWin, SdacVcl,
  ComCtrls, Buttons, MemDS, DBAccess, MSAccess, OLEDBAccess, DemoFrame,
  SdacDemoForm;

type
  TFetchAllFrame = class(TDemoFrame)
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    ToolBar: TPanel;
    Memo: TMemo;
    MSQuery: TMSQuery;
    Panel1: TPanel;
    btClose: TSpeedButton;
    DBNavigator: TDBNavigator;
    btOpen: TSpeedButton;
    Splitter1: TSplitter;
    Panel2: TPanel;
    FetchAllCB: TCheckBox;
    btFillTables: TSpeedButton;
    Panel3: TPanel;
    Label1: TLabel;
    edRowCount: TEdit;
    MSSQLFillTables: TMSSQL;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure FetchAllCBClick(Sender: TObject);
    procedure btFillTablesClick(Sender: TObject);
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

procedure TFetchAllFrame.btOpenClick(Sender: TObject);
var
  dt: TDateTime;
begin
  MSQuery.Connection.Open;

  MSQuery.SQL.Assign(Memo.Lines);

  if MSQuery.FetchAll then
    SdacForm.StatusBar.Panels[1].Text := 'FetchAll is True'
  else
    SdacForm.StatusBar.Panels[1].Text := 'FetchAll is False';

  dt := Now;
  MSQuery.Open;
  SdacForm.StatusBar.Panels[2].Text := 'Opened in ' + TimeToStr(Now - dt);
  SdacForm.StatusBar.Update;
end;

procedure TFetchAllFrame.btCloseClick(Sender: TObject);
begin
  MSQuery.Close;
end;

procedure TFetchAllFrame.FetchAllCBClick(Sender: TObject);
begin
  MSQuery.FetchAll := FetchAllCB.Checked;
end;

// Demo management
procedure TFetchAllFrame.Initialize;
begin
  inherited;
  MSQuery.Connection := Connection as TMSConnection;
  Memo.Lines.Text := MSQuery.SQL.Text;
  FetchAllCB.Checked := MSQuery.FetchAll;
end;

procedure TFetchAllFrame.SetDebug(Value: boolean);
begin
  MSQuery.Debug := Value;
end;

procedure TFetchAllFrame.btFillTablesClick(Sender: TObject);
begin
  MSSQLFillTables.ParamByName('cnt').AsString := edRowCount.Text;
  MSSQLFillTables.Execute;
end;

end.
