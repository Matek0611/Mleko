unit Transaction;

interface

uses
{$IFDEF VER6P}
  Variants,
{$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DemoFrame, ExtCtrls, StdCtrls, DB, DBAccess, MSAccess,
  MSServiceBroker, Buttons, DBCtrls, Grids, DBGrids,
  CRAccess, MemDS, DATransaction, MSTransaction;

type
  TTransactionFrame = class(TDemoFrame)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Connection2: TMSConnection;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel5: TPanel;
    DBNavigator1: TDBNavigator;
    Panel7: TPanel;
    btStartTransaction: TSpeedButton;
    btCommit: TSpeedButton;
    btRollback: TSpeedButton;
    MSTransaction: TMSTransaction;
    Panel8: TPanel;
    Label3: TLabel;
    cbIsolationLevel: TComboBox;
    Panel9: TPanel;
    btClose1: TSpeedButton;
    btRefresh1: TSpeedButton;
    btOpen1: TSpeedButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    btClose2: TSpeedButton;
    btRefresh2: TSpeedButton;
    btOpen2: TSpeedButton;
    DBNavigator2: TDBNavigator;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Query1: TMSQuery;
    Query2: TMSQuery;
    lbConn1State: TLabel;
    lbConn2State: TLabel;
    procedure btStartTransactionClick(Sender: TObject);
    procedure btCommitClick(Sender: TObject);
    procedure btRollbackClick(Sender: TObject);
    procedure cbIsolationLevelChange(Sender: TObject);
    procedure btOpen1Click(Sender: TObject);
    procedure btClose1Click(Sender: TObject);
    procedure btRefresh1Click(Sender: TObject);
    procedure btOpen2Click(Sender: TObject);
    procedure btClose2Click(Sender: TObject);
    procedure btRefresh2Click(Sender: TObject);
    procedure Connection1AfterConnect(Sender: TObject);
    procedure Connection1AfterDisconnect(Sender: TObject);
    procedure Connection2AfterConnect(Sender: TObject);
  private
    OldAfterConnectEvent: TNotifyEvent;
    OldAfterDisconnectEvent: TNotifyEvent;
    procedure ShowTransState;
    procedure ShowConnectState;
  public
    // Demo management
    procedure Initialize; override;
    procedure SetDebug(Value: boolean); override;
    destructor Destroy; override;
  end;

var
  TransactionFrame: TTransactionFrame;

implementation

uses SdacDemoForm;

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}

{ TTransactionFrame }

procedure TTransactionFrame.ShowTransState;
begin
  if MSTransaction.Active then begin
    SdacForm.StatusBar.Panels[1].Text := 'In Transaction';
    SdacForm.StatusBar.Panels[2].Text := 'Connections in Transaction: ' + IntToStr(MSTransaction.ConnectionsCount);
  end
  else begin
    SdacForm.StatusBar.Panels[1].Text := '';
    SdacForm.StatusBar.Panels[2].Text := '';
  end;
end;

procedure TTransactionFrame.ShowConnectState;
begin
  if Assigned(Connection) and Connection.Connected then
    lbConn1State.Caption := 'Connected to ' + Connection.Server
  else
    lbConn1State.Caption := 'Disconnected';
  if Assigned(Connection2) and Connection2.Connected then
    lbConn2State.Caption := 'Connected to ' + Connection2.Server
  else
    lbConn2State.Caption := 'Disconnected';
end;

procedure TTransactionFrame.btStartTransactionClick(Sender: TObject);
begin
  MSTransaction.StartTransaction;
  ShowTransState;
end;

procedure TTransactionFrame.btCommitClick(Sender: TObject);
begin
  MSTransaction.Commit;
  ShowTransState;
end;

procedure TTransactionFrame.btRollbackClick(Sender: TObject);
begin
  MSTransaction.Rollback;
  ShowTransState;
end;

procedure TTransactionFrame.cbIsolationLevelChange(Sender: TObject);
begin
  try
    case cbIsolationLevel.ItemIndex of
      0:
        MSTransaction.IsolationLevel := ilReadCommitted;
      1:
        MSTransaction.IsolationLevel := ilSerializable;
    end;
  except
    case MSTransaction.IsolationLevel of
      ilReadCommitted:
        cbIsolationLevel.ItemIndex := 0;
      ilSerializable:
        cbIsolationLevel.ItemIndex := 1;
    end;
    raise;
  end;
end;

procedure TTransactionFrame.btOpen1Click(Sender: TObject);
begin
  Connection.Connect;
  MSTransaction.AddConnection(Connection);
  Query1.Open;
  ShowTransState;
end;

procedure TTransactionFrame.btClose1Click(Sender: TObject);
begin
  Query1.Close;
  MSTransaction.RemoveConnection(Connection);
  ShowTransState;
end;

procedure TTransactionFrame.btRefresh1Click(Sender: TObject);
begin
  Query1.Refresh;
end;

procedure TTransactionFrame.btOpen2Click(Sender: TObject);
begin
  if not Connection2.Connected then
    Connection2.Assign(Connection);
  Connection2.Connect;
  MSTransaction.AddConnection(Connection2);
  Query2.Open;
  ShowTransState;
end;

procedure TTransactionFrame.btClose2Click(Sender: TObject);
begin
  Query2.Close;
  MSTransaction.RemoveConnection(Connection2);
  ShowTransState;
end;

procedure TTransactionFrame.btRefresh2Click(Sender: TObject);
begin
  Query2.Refresh;
end;

// Demo management
procedure TTransactionFrame.Initialize;
begin
  inherited;

  Query1.Connection := TCustomMSConnection(Connection);
  OldAfterConnectEvent := Query1.Connection.AfterConnect;
  Query1.Connection.AfterConnect := Connection1AfterConnect;
  OldAfterDisconnectEvent := Query1.Connection.AfterDisconnect;
  Query1.Connection.AfterDisconnect := Connection1AfterDisconnect;
end;

procedure TTransactionFrame.SetDebug(Value: boolean);
begin
  Query1.Debug := Value;
  Query2.Debug := Value;
end;

procedure TTransactionFrame.Connection1AfterConnect(Sender: TObject);
begin
  try
    OldAfterConnectEvent(self);
  finally
    ShowConnectState;
  end;
end;

procedure TTransactionFrame.Connection1AfterDisconnect(Sender: TObject);
begin
  try
    OldAfterDisconnectEvent(self);
  finally
    if Assigned(Connection2) then begin
      Connection2.Disconnect;
      ShowConnectState;
    end;
  end;
end;

destructor TTransactionFrame.Destroy;
begin
  if not (csDestroying in Self.Parent.ComponentState) then begin
    Query1.Connection.AfterConnect := OldAfterConnectEvent;
    Query1.Connection.AfterDisconnect := OldAfterDisconnectEvent;
  end;
  inherited;
end;

procedure TTransactionFrame.Connection2AfterConnect(Sender: TObject);
begin
  ShowConnectState;
end;

end.
