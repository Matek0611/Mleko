
//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Sdac.inc}

unit MSConnectionPool;

{$ENDIF}

interface

uses
{$IFDEF VER6P}
  Variants,
{$ENDIF}
  Classes, CRConnectionPool, CRAccess, OLEDBAccess;

type
  TMSConnectionParameters = class(TCRConnectionParameters)
  protected
    procedure AssignTo(Dest: TPersistent); override;

  public
    Database: string;
    IsolationLevel: TIsolationLevel;
    Authentication: TMSAuthentication;
    Provider: TOLEDBProvider;

    QuotedIdentifier: boolean;
    Language: string;
    Encrypt: boolean;
    PersistSecurityInfo: boolean;
    AutoTranslate: boolean;
    NetworkLibrary: string;
    ApplicationName: string;
    WorkstationID: string;
    PacketSize: integer;

    function Equals(Obj: TCRConnectionParameters): boolean; override;
  end;

  TMSLocalConnectionPool = class(TCRLocalConnectionPool)
  protected
    function CreateNewConnector: TCRConnection; override;
  end;


  TMSConnectionPoolManager = class(TCRConnectionPoolManager)
  protected
    function CreateCRConnectionPool(ConnectionParameters: TCRConnectionParameters): TCRConnectionPool; override;
  public
    class procedure Clear;  {$IFDEF CLR}static;{$ENDIF}
    class function GetConnection(ConnectionParameters: TCRConnectionParameters): TCRConnection; {$IFDEF CLR}static;{$ENDIF}
  end;

implementation

uses
{$IFDEF MSWINDOWS}
  Windows,
{$ENDIF}
  SysUtils, MemData, SyncObjs;

var
  ConnectionPoolManager: TMSConnectionPoolManager;
  LockPoolManagerCreate: TCriticalSection;

{ TMSConnectionParameters}

procedure TMSConnectionParameters.AssignTo(Dest: TPersistent);
begin
  if Dest is TMSConnectionParameters then begin
    TMSConnectionParameters(Dest).Database := Database;
    TMSConnectionParameters(Dest).IsolationLevel := IsolationLevel;
    TMSConnectionParameters(Dest).Authentication := Authentication;
    TMSConnectionParameters(Dest).Provider := Provider;

    TMSConnectionParameters(Dest).QuotedIdentifier := QuotedIdentifier;
    TMSConnectionParameters(Dest).Language := Language;
    TMSConnectionParameters(Dest).Encrypt := Encrypt;
    TMSConnectionParameters(Dest).PersistSecurityInfo := PersistSecurityInfo;
    TMSConnectionParameters(Dest).AutoTranslate := AutoTranslate;
    TMSConnectionParameters(Dest).NetworkLibrary := NetworkLibrary;
    TMSConnectionParameters(Dest).ApplicationName := ApplicationName;
    TMSConnectionParameters(Dest).WorkstationID := WorkstationID;
    TMSConnectionParameters(Dest).PacketSize := PacketSize;
  end;

  inherited;
end;

function TMSConnectionParameters.Equals(Obj: TCRConnectionParameters): boolean;
var
  O: TMSConnectionParameters;
begin
  Result := inherited Equals(Obj);
  if Result and (Obj is TMSConnectionParameters) then begin
    O := TMSConnectionParameters(obj);
    Result :=
      (AnsiCompareText(Database, O.Database) = 0) and
      (O.IsolationLevel = IsolationLevel) and
      (O.Authentication = Authentication) and
      (O.Provider = Provider) and
      (O.QuotedIdentifier = QuotedIdentifier) and
      (AnsiCompareText(O.Language, Language) = 0)and
      (O.Encrypt = Encrypt) and
      (O.PersistSecurityInfo = PersistSecurityInfo) and
      (O.AutoTranslate = AutoTranslate) and
      (AnsiCompareText(O.NetworkLibrary, NetworkLibrary) = 0) and
      (AnsiCompareText(O.ApplicationName, ApplicationName) = 0) and
      (AnsiCompareText(O.WorkstationID, WorkstationID) = 0) and
      (O.PacketSize = PacketSize);
  end;
end;

{ TMSLocalConnectionPool }

function TMSLocalConnectionPool.CreateNewConnector: TCRConnection;
begin
  Result := TOLEDBConnection.Create;

  Result.SetProp(prDatabase, TMSConnectionParameters(ConnectionParameters).Database);
  Result.SetProp(prIsolationLevel, Integer(TMSConnectionParameters(ConnectionParameters).IsolationLevel));
  Result.SetProp(prAuthentication, Integer(TMSConnectionParameters(ConnectionParameters).Authentication));
  Result.SetProp(prProvider, Integer(TMSConnectionParameters(ConnectionParameters).Provider));

  Result.SetProp(prQuotedIdentifier, TMSConnectionParameters(ConnectionParameters).QuotedIdentifier);
  Result.SetProp(prLanguage, TMSConnectionParameters(ConnectionParameters).Language);
  Result.SetProp(prEncrypt, TMSConnectionParameters(ConnectionParameters).Encrypt);
  Result.SetProp(prPersistSecurityInfo, TMSConnectionParameters(ConnectionParameters).PersistSecurityInfo);
  Result.SetProp(prAutoTranslate, TMSConnectionParameters(ConnectionParameters).AutoTranslate);
  Result.SetProp(prNetworkLibrary, TMSConnectionParameters(ConnectionParameters).NetworkLibrary);
  Result.SetProp(prApplicationName, TMSConnectionParameters(ConnectionParameters).ApplicationName);
  Result.SetProp(prWorkstationID, TMSConnectionParameters(ConnectionParameters).WorkstationID);
  Result.SetProp(prPacketSize, TMSConnectionParameters(ConnectionParameters).PacketSize);

  StartWait;
  try
    Result.SetUsername(ConnectionParameters.Username);
    Result.SetPassword(ConnectionParameters.Password);
    Result.SetServer(ConnectionParameters.Server);

    Result.Connect('');
  finally
    StopWait
  end;
end;

{ TMSConnectionPoolManager }

function TMSConnectionPoolManager.CreateCRConnectionPool(ConnectionParameters: TCRConnectionParameters): TCRConnectionPool;
begin
  Result := TMSLocalConnectionPool.Create(Self, ConnectionParameters);
end;

class procedure TMSConnectionPoolManager.Clear;
begin
  if ConnectionPoolManager <> nil then
    ConnectionPoolManager.InternalClear;
end;

class function TMSConnectionPoolManager.GetConnection(ConnectionParameters: TCRConnectionParameters): TCRConnection;
begin
  LockPoolManagerCreate.Enter;
  try
    if ConnectionPoolManager = nil then
      ConnectionPoolManager := TMSConnectionPoolManager.Create;
  finally
    LockPoolManagerCreate.Leave;
  end;

  Result := ConnectionPoolManager.InternalGetConnection(ConnectionParameters);
end;

{$IFDEF WIN32}
{$IFNDEF VER6P}
type
  TDLLProc = procedure (Reason: Integer);
{$ENDIF}

var
  OldDLLProc: TDLLProc;

procedure LibraryProc(Reason: integer);
begin
  if Reason = DLL_PROCESS_DETACH then begin
    ConnectionPoolManager.Free;
    ConnectionPoolManager := nil;
  end;
  if Assigned(OldDLLProc) then
    OldDLLProc(Reason);
end;
{$ENDIF}

initialization
{$IFDEF WIN32}
  OldDLLProc := DLLProc;
  DLLProc := @LibraryProc;
{$ENDIF}
  ConnectionPoolManager := nil;
  LockPoolManagerCreate := TCriticalSection.Create;

finalization
  ConnectionPoolManager.Free;
  ConnectionPoolManager := nil;
  LockPoolManagerCreate.Free;
  
end.
