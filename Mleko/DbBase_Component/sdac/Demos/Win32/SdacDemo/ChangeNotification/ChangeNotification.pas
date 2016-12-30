unit ChangeNotification;

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
  TChangeNotificationFrame = class(TDemoFrame)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Connection2: TMSConnection;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel5: TPanel;
    btClose1: TSpeedButton;
    btRefresh1: TSpeedButton;
    btOpen1: TSpeedButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    btClose2: TSpeedButton;
    btOpen2: TSpeedButton;
    DBNavigator2: TDBNavigator;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Query1: TMSQuery;
    Query2: TMSQuery;
    MSChangeNotification: TMSChangeNotification;
    cbReadOnly: TCheckBox;
    cbReflectChanges: TCheckBox;
    meLog: TMemo;
    Splitter2: TSplitter;
    procedure btOpen1Click(Sender: TObject);
    procedure btClose1Click(Sender: TObject);
    procedure btRefresh1Click(Sender: TObject);
    procedure btOpen2Click(Sender: TObject);
    procedure btClose2Click(Sender: TObject);
    procedure cbReadOnlyClick(Sender: TObject);
    procedure cbReflectChangesClick(Sender: TObject);
    procedure MSChangeNotificationChange(Sender: TObject;
      DataSet: TCustomMSDataSet;
      NotificationInfo: TMSNotificationInfo;
      NotificationSource: TMSNotificationSource;
      NotificationType: TMSNotificationType);
  public
    // Demo management
    procedure Initialize; override;
    procedure SetDebug(Value: boolean); override;
  end;

var
  ChangeNotificationFrame: TChangeNotificationFrame;

implementation

uses SdacDemoForm;

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}

{ TChangeNotificationFrame }

procedure TChangeNotificationFrame.btOpen1Click(Sender: TObject);
begin
  Connection.Connect;
  Query1.Open;
end;

procedure TChangeNotificationFrame.btClose1Click(Sender: TObject);
begin
  Query1.Close;
end;

procedure TChangeNotificationFrame.btRefresh1Click(Sender: TObject);
begin
  Query1.Refresh;
end;

procedure TChangeNotificationFrame.btOpen2Click(Sender: TObject);
begin
  if not Connection2.Connected then
    Connection2.Assign(Connection);
  Connection2.Connect;
  Query2.Open;
end;

procedure TChangeNotificationFrame.btClose2Click(Sender: TObject);
begin
  Query2.Close;
end;

procedure TChangeNotificationFrame.cbReadOnlyClick(Sender: TObject);
begin
  try
    Query1.ReadOnly := cbReadOnly.Checked;
  except
    cbReadOnly.Checked := Query1.ReadOnly;
    raise;
  end;
end;

procedure TChangeNotificationFrame.cbReflectChangesClick(Sender: TObject);
begin
  try
    Query1.Options.ReflectChangeNotify := cbReflectChanges.Checked;
  except
    cbReflectChanges.Checked := Query1.Options.ReflectChangeNotify;
    raise;
  end;
end;

function NotificationInfoToString(NotificationInfo: TMSNotificationInfo): string;
begin
  case NotificationInfo of
    niAlter:
      Result := 'Alter';
    niDelete:
      Result := 'Delete';
    niDrop:
      Result := 'Drop';
    niError:
      Result := 'Error';
    niInsert:
      Result := 'Insert';
    niInvalid:
      Result := 'Invalid';
    niIsolation:
      Result := 'Isolation';
    niOptions:
      Result := 'Options';
    niPreviousFire:
      Result := 'PreviousFire';
    niQuery:
      Result := 'Query';
    niResource:
      Result := 'Resource';
    niRestart:
      Result := 'Restart';
    niTemplateLimit:
      Result := 'TemplateLimit';
    niTruncate:
      Result := 'Truncate';
    niUnknown:
      Result := 'Unknown';
    niUpdate:
      Result := 'Update';
    else
      Result := '';
  end;
end;

function NotificationSourceToString(NotificationSource: TMSNotificationSource): string;
begin
  case NotificationSource of
    nsClient:
      Result := 'Client';
    nsData:
      Result := 'Data';
    nsDatabase:
      Result := 'Database';
    nsEnvironment:
      Result := 'Environment';
    nsExecution:
      Result := 'Execution';
    nsObject:
      Result := 'Object';
    nsStatement:
      Result := 'Statement';
    nsSystem:
      Result := 'System';
    nsTimeout:
      Result := 'Timeout';
    nsUnknown:
      Result := 'Unknown';
    else
      Result := '';
  end;
end;

function NotificationTypeToString(NotificationType: TMSNotificationType): string;
begin
  case NotificationType of
    ntChange:
      Result := 'Change';
    ntSubscribe:
      Result := 'Subscribe';
    ntUnknown:
      Result := 'Unknown';
    else
      Result := '';
  end;
end;

procedure TChangeNotificationFrame.MSChangeNotificationChange(
  Sender: TObject;
  DataSet: TCustomMSDataSet; NotificationInfo: TMSNotificationInfo;
  NotificationSource: TMSNotificationSource;
  NotificationType: TMSNotificationType);
begin
  if meLog.Lines.Count > 0 then
    meLog.Lines.Add('---------------------------------');
  meLog.Lines.Add('DataSet: ' + DataSet.Name);
  meLog.Lines.Add('Notification Info: ' + NotificationInfoToString(NotificationInfo));
  meLog.Lines.Add('Notification Source: ' + NotificationSourceToString(NotificationSource));
  meLog.Lines.Add('Notification Type: ' + NotificationTypeToString(NotificationType));
end;

// Demo management
procedure TChangeNotificationFrame.Initialize;
var
  OldConnected, OldLoginPrompt: boolean;
begin
  inherited;

  if not (Connection is TMSConnection) then
    raise Exception.Create('Connection must be of TMSConnection class');
  Query1.Connection := TCustomMSConnection(Connection);
  Query1.ChangeNotification := MSChangeNotification;
  Query1.ReadOnly := cbReadOnly.Checked;
  Query1.Options.ReflectChangeNotify := cbReflectChanges.Checked;

  if TMSConnection(Connection).Options.MultipleActiveResultSets = True then
    Exit;
  OldConnected := Connection.Connected;
  OldLoginPrompt := Connection.LoginPrompt;
  try
    Connection.LoginPrompt := False;
    if Connection.Connected then
      Connection.Disconnect;
    TMSConnection(Connection).Options.MultipleActiveResultSets := True;
  finally
    Connection.Connected := OldConnected;
    Connection.LoginPrompt := OldLoginPrompt;
  end;
end;

procedure TChangeNotificationFrame.SetDebug(Value: boolean);
begin
  Query1.Debug := Value;
  Query2.Debug := Value;
end;

end.
