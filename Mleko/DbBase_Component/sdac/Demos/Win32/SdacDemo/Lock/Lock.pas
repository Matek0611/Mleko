unit Lock;

interface

uses
  MemDS, DBAccess, DB, MSAccess, DASQLMonitor, MSSQLMonitor, DemoFrame,
{$IFDEF LINUX}
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs, QStdCtrls,
  QDBCtrls, QComCtrls, QExtCtrls, QGrids, QDBGrids, SdacClx, QButtons,
{$ELSE}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, ToolWin, ComCtrls, SdacVcl, Buttons,
{$ENDIF}
  DAScript, MSScript;

type
  TLockFrame = class(TDemoFrame)
    MSQuery1: TMSQuery;
    DataSource1: TDataSource;
    ToolBar: TPanel;
    Panel5: TPanel;
    Memo1: TMemo;
    Panel6: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    rbExclusiveLock: TRadioButton;
    rbUpdateLock: TRadioButton;
    Panel3: TPanel;
    btClose: TSpeedButton;
    btOpen: TSpeedButton;
    DBGrid: TDBGrid;
    Label2: TLabel;
    meSQL: TMemo;
    Panel11: TPanel;
    Panel12: TPanel;
    DBNavigator1: TDBNavigator;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure meSQLExit(Sender: TObject);
    procedure MSQuery1AfterExecute(Sender: TObject; Result: Boolean);
    procedure MSQuery1BeforeEdit(DataSet: TDataSet);
    procedure MSQuery1AfterPost(DataSet: TDataSet);
    procedure MSQuery1AfterCancel(DataSet: TDataSet);
  private
    { Private declarations }
    procedure ShowState;
  public
    // Demo management
    procedure Initialize; override;
    procedure SetDebug(Value: boolean); override;
  end;

implementation

uses SDacDemoForm;

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}
{$IFDEF LINUX}
{$R *.xfm}
{$ENDIF}

procedure TLockFrame.ShowState;
var
  St:string;

  procedure AddSt(S:string);
  begin
    if St <> '' then
      St := St + ', ';
    St := St + S;
  end;

begin
  St := '';

  if MSQuery1.Prepared then begin
    AddSt('Prepared');

    if MSQuery1.IsQuery then
      AddSt('IsQuery');
  end;

  if MSQuery1.Active then
    AddSt('Active')
  else
    AddSt('Inactive');

  if MSQuery1.Executing then
    AddSt('Executing');

  if MSQuery1.Fetching then
    AddSt('Fetching');

  SDACForm.StatusBar.Panels[1].Text := St;
end;

procedure TLockFrame.meSQLExit(Sender: TObject);
begin
  if Trim(MSQuery1.SQL.Text) <> Trim(meSQL.Lines.Text) then
    MSQuery1.SQL.Text := meSQL.Lines.Text;
  ShowState;
end;

procedure TLockFrame.btOpenClick(Sender: TObject);
begin
  if Trim(MSQuery1.SQL.Text) <> Trim(meSQL.Lines.Text) then
    MSQuery1.SQL.Text := meSQL.Lines.Text;
  try
    MSQuery1.Open;
  finally
    ShowState;
  end;
end;

procedure TLockFrame.btCloseClick(Sender: TObject);
begin
  MSQuery1.Close;
  ShowState;
end;

procedure TLockFrame.MSQuery1AfterExecute(Sender: TObject; Result: Boolean);
begin
  ShowState;

  if Result then
    SDACForm.StatusBar.Panels[1].Text := SDACForm.StatusBar.Panels[1].Text + '   >>>> Success'
  else
    SDACForm.StatusBar.Panels[1].Text := SDACForm.StatusBar.Panels[1].Text + '   >>>> Fail';
end;

procedure TLockFrame.MSQuery1BeforeEdit(DataSet: TDataSet);
var
  MSQuery: TMSQuery;
begin
  MSQuery := (DataSet as TMSQuery);
  if not MSQuery.Connection.InTransaction then
    MSQuery.Connection.StartTransaction;
  if rbUpdateLock.Checked then
    MSQuery.Lock(ltUpdate) else
  if rbExclusiveLock.Checked then
    MSQuery.Lock(ltExclusive);
  MSQuery.RefreshRecord;
end;

procedure TLockFrame.MSQuery1AfterPost(DataSet: TDataSet);
begin
  if MSQuery1.Connection.InTransaction then
    MSQuery1.Connection.Commit;
end;

procedure TLockFrame.MSQuery1AfterCancel(DataSet: TDataSet);
begin
  if MSQuery1.Connection.InTransaction then
    MSQuery1.Connection.Rollback;
end;

// Demo management

procedure TLockFrame.Initialize;
begin
  MSQuery1.Connection := Connection as TCustomMSConnection;
  meSQL.Lines.Assign(MSQuery1.SQL);
  ShowState;
end;

procedure TLockFrame.SetDebug(Value: boolean);
begin
  MSQuery1.Debug := Value;
end;

end.

