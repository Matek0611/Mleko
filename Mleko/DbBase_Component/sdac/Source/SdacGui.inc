type

{ TMSConnectDialog }

  TMSConnectDialog = class(TCustomConnectDialog)
  private
    FCachedServerList: TStrings;
    function GetConnection: TCustomMSConnection;
  protected
    FDatabaseLabel: string;
    function DefDialogClass: TClass; override;
    function GetKeyPath: string; override;
    function GetServerStoreName: string; override;

  {$IFDEF MSWINDOWS}
    procedure SaveInfoToRegistry(Registry: TRegistry); override;
    procedure LoadInfoFromRegistry(Registry: TRegistry); override;
  {$ENDIF}
  public
    constructor Create(Owner: TComponent); override;
    property Connection: TCustomMSConnection read GetConnection;
    procedure GetServerList(List: TStrings); override;
    destructor Destroy; override;

  published
    property Retries;
    property SavePassword;
    property DialogClass;

    property Caption;
    property UsernameLabel;
    property PasswordLabel;
    property ServerLabel;
    property DatabaseLabel: string read FDatabaseLabel write FDatabaseLabel;
    property ConnectButton;
    property CancelButton;

    property LabelSet;
    property StoreLogInfo;
  end;

function DefConnectDialogClass: TClass;

implementation

{$IFDEF MSWINDOWS}
uses
  Windows;
{$ENDIF}

function DefConnectDialogClass: TClass;
begin
  Result := TMSConnectDialog;
end;

const
  KeyPath = '\SOFTWARE\CoreLab\SDAC\';

{ TConnectDialog }

function TMSConnectDialog.DefDialogClass: TClass; 
begin
  Result := TMSConnectForm;
end;
    
function TMSConnectDialog.GetKeyPath: string;
begin        
  Result := KeyPath;
end;

constructor TMSConnectDialog.Create(Owner: TComponent);
begin
  inherited;
  FDatabaseLabel := 'Database';
  FCachedServerList := TStringList.Create;
end;

destructor TMSConnectDialog.Destroy;
begin
  FCachedServerList.Free;
  inherited;
end;

function TMSConnectDialog.GetServerStoreName: string;
begin
  Result := 'Server';
end;

procedure TMSConnectDialog.SaveInfoToRegistry(Registry: TRegistry);
begin
  inherited;

  Registry.WriteString('Database', Connection.Database);
end;

procedure TMSConnectDialog.LoadInfoFromRegistry(Registry: TRegistry);
begin
  inherited;
  if Registry.ValueExists('Database') then
    TCustomMSConnection(Connection).Database := Registry.ReadString('Database');
end;

procedure TMSConnectDialog.GetServerList(List: TStrings);
begin
  if FCachedServerList.Count = 0 then begin
    MSAccess.GetServerList(List);
    FCachedServerList.Assign(List);
  end else
    List.Assign(FCachedServerList);
end;

function TMSConnectDialog.GetConnection: TCustomMSConnection;
begin
  Result := (inherited Connection) as TCustomMSConnection;
end;

initialization
  DefConnectDialogClassProc := DefConnectDialogClass;
end.
