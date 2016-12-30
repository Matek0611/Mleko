//////////////////////////////////////////////////
//  DB Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  DATransaction
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Dac.inc}

unit DATransaction;
{$ENDIF}

interface

uses
  SysUtils, Classes, MemUtils, CRAccess, DBAccess;

type
  TDATransactionErrorEvent = procedure(Sender: TObject; E: EDAError; var Fail: boolean) of object;

  TCRTransactionClass = class of TCRTransaction;

  TDATransaction = class(TComponent)
  protected
    FITransaction: TCRTransaction;
    FConnectionList: TDAList;
    FDefaultConnection: TCustomDAConnection;
    FDesignCreate: boolean;
    FIsolationLevel: TCRIsolationLevel;
    FDefaultCloseAction: TCRTransactionAction;
    FOnError: TDATransactionErrorEvent;

    function SQLMonitorClass: TClass; virtual;
    procedure DoError(E: Exception; var Fail: boolean);


    function GetITransactionClass: TCRTransactionClass; virtual;
    procedure CreateITransaction;
    procedure SetITransaction(Value: TCRTransaction);

    function GetConnections(Index: Integer): TCustomDAConnection;
    function GetConnectionsCount: integer;

    function GetActive: boolean;
    procedure SetIsolationLevel(Value: TCRIsolationLevel);
    procedure SetDefaultCloseAction(Value: TCRTransactionAction);
    procedure SetDefaultConnection(Value: TCustomDAConnection);

    procedure CheckInactive;
    
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    
    property DefaultConnection: TCustomDAConnection read FDefaultConnection write SetDefaultConnection;

    function InternalAddConnection(Connection: TCustomDAConnection): integer; virtual;
    function InternalRemoveConnection(Connection: TCustomDAConnection): integer; virtual;

    procedure InternalStartTransaction; virtual;

  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;

    procedure AddConnection(Connection: TCustomDAConnection);
    procedure RemoveConnection(Connection: TCustomDAConnection);
    procedure ClearConnections;

    procedure StartTransaction;
    procedure Commit;
    procedure Rollback;

    property Active: boolean read GetActive;

    property Connections[Index: integer]: TCustomDAConnection read GetConnections;
    property ConnectionsCount: integer read GetConnectionsCount;
    
    property IsolationLevel: TCRIsolationLevel read FIsolationLevel write SetIsolationLevel default ilReadCommitted;
    property DefaultCloseAction: TCRTransactionAction read FDefaultCloseAction write SetDefaultCloseAction default taCommit;
    property OnError: TDATransactionErrorEvent read FOnError write FOnError;
  end;

implementation

uses
{$IFDEF VER6P}
  Variants,
{$ENDIF}
  DASQLMonitor, DAConsts;
  
{ TDATransaction }

constructor TDATransaction.Create(Owner: TComponent);
begin
  inherited;

  FConnectionList := TDAList.Create;
  CreateITransaction;
  FITransaction.OnError := DoError;

  FDesignCreate := csDesigning in ComponentState;
end;

destructor TDATransaction.Destroy;
begin
  FITransaction.Free;
  FConnectionList.Free;

  inherited;
end;

function TDATransaction.SQLMonitorClass: TClass;
begin
  Result := nil;
end;

procedure TDATransaction.DoError(E: Exception; var Fail: boolean);
begin
  TDASQLMonitorClass(SQLMonitorClass).DBError(E as EDAError);

  if Assigned(FOnError) then
    FOnError(Self, E as EDAError, Fail);
end;

function TDATransaction.GetITransactionClass: TCRTransactionClass;
begin
  Assert(False, 'Must be overrided');
  Result := TCRTransaction;
end;

procedure TDATransaction.CreateITransaction;
begin
  FITransaction := GetITransactionClass.Create;
end;

procedure TDATransaction.SetITransaction(Value: TCRTransaction);
begin
  Assert(Value <> nil);
  FITransaction := Value;
end;

procedure TDATransaction.AddConnection(Connection: TCustomDAConnection);
begin
  InternalAddConnection(Connection);
end;

procedure TDATransaction.RemoveConnection(Connection: TCustomDAConnection);
begin
  InternalRemoveConnection(Connection);
end;

procedure TDATransaction.ClearConnections;
begin
  while FConnectionList.Count > 0 do
    InternalRemoveConnection(TCustomDAConnection(FConnectionList[0]));
end;

function TDATransaction.GetActive: boolean;
begin
  Result := FITransaction.Active;
end;

function TDATransaction.GetConnections(Index: Integer): TCustomDAConnection;
begin
  Result := TCustomDAConnection(FConnectionList[Index]);
end;

function TDATransaction.GetConnectionsCount: integer;
begin
  Result := FConnectionList.Count;
end;

procedure TDATransaction.SetIsolationLevel(Value: TCRIsolationLevel);
begin
  if Value <> FIsolationLevel then begin
    CheckInactive;
    FIsolationLevel := Value;
    if FITransaction <> nil then
      FITransaction.SetProp(prIsolationLevel, Variant(Value));
  end;
end;

procedure TDATransaction.SetDefaultCloseAction(Value: TCRTransactionAction);
begin
  if Value <> FDefaultCloseAction then begin
    FDefaultCloseAction := Value;
    if FITransaction <> nil then
      FITransaction.SetProp(prDefaultCloseAction, Variant(Value));
  end;
end;

procedure TDATransaction.SetDefaultConnection(Value: TCustomDAConnection);
begin
  if Value <> FDefaultConnection then begin
    if FDefaultConnection <> nil then begin
      FDefaultConnection.RemoveFreeNotification(Self);
      InternalRemoveConnection(FDefaultConnection); // this sets FDefaultSession to nil
    end;

    FDefaultConnection := Value;

    if FDefaultConnection <> nil then begin
      InternalAddConnection(Value);
      FDefaultConnection.FreeNotification(Self);
    end;
  end;
end;

procedure TDATransaction.CheckInactive;
begin
  FITransaction.CheckState(False);
end;

procedure TDATransaction.Loaded;
begin
  inherited;

  FDesignCreate := False;
end;

procedure TDATransaction.Notification(AComponent: TComponent; Operation: TOperation);
begin
  if (Operation = opRemove) and (AComponent = DefaultConnection) then
    DefaultConnection := nil;
    
  inherited;
end;

function TDATransaction.InternalAddConnection(Connection: TCustomDAConnection): integer;
begin
  Result := FConnectionList.IndexOf(Connection);

  if Result = -1 then begin
    Result := FConnectionList.Add(Connection);
    if Active then begin
      if not Connection.Connected then
        raise Exception.Create(SConnectionIsClosed);
      FITransaction.AddConnection(TDBAccessUtils.GetIConnection(Connection));
      TDBAccessUtils.InternalConnect(Connection); //Increase ConnectCount
      TDBAccessUtils.SuppressAutoCommit(Connection);
    end;
  end;
end;

function TDATransaction.InternalRemoveConnection(Connection: TCustomDAConnection): integer;
var
  CRConnection: TCRConnection;
begin
  Result := FConnectionList.Remove(Connection);

  if Result >= 0 then begin
    if Connection = FDefaultConnection then
      FDefaultConnection := nil;
    CRConnection := TDBAccessUtils.GetIConnection(Connection);
    if CRConnection <> nil then
      FITransaction.RemoveConnection(CRConnection);
  end;
end;

procedure TDATransaction.InternalStartTransaction;
begin
  FITransaction.StartTransaction;
end;

procedure TDATransaction.StartTransaction;
var
  i: integer;
  Connection: TCustomDAConnection;
begin
  CheckInactive;

  for i := 0 to FConnectionList.Count - 1 do begin
    Connection := TCustomDAConnection(FConnectionList[i]);
    if not Connection.Connected then
      raise Exception.Create(SConnectionInTransactionNotActive);
    FITransaction.AddConnection(TDBAccessUtils.GetIConnection(Connection));
  end;

  InternalStartTransaction;

  for i := 0 to FConnectionList.Count - 1 do begin
    TDBAccessUtils.InternalConnect(TCustomDAConnection(FConnectionList[i])); //Increase ConnectCount
    TDBAccessUtils.SuppressAutoCommit(TCustomDAConnection(FConnectionList[i]));
  end;
end;

procedure TDATransaction.Commit;
var
  i: integer;
begin
  FITransaction.Commit;
  for i := 0 to FConnectionList.Count - 1 do begin
    TDBAccessUtils.RestoreAutoCommit(TCustomDAConnection(FConnectionList[i]));
    TDBAccessUtils.InternalDisconnect(TCustomDAConnection(FConnectionList[i]));//Decrease ConnectCount
  end;
end;

procedure TDATransaction.Rollback;
var
  i: integer;
begin
  FITransaction.Rollback;
  for i := 0 to FConnectionList.Count - 1 do begin
    TDBAccessUtils.RestoreAutoCommit(TCustomDAConnection(FConnectionList[i]));
    TDBAccessUtils.InternalDisconnect(TCustomDAConnection(FConnectionList[i]));//Decrease ConnectCount
  end;
end;

end.
