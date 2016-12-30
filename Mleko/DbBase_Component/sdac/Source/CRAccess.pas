
//////////////////////////////////////////////////
//  DB Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  Core Access
//  Created:            01.07.00
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Dac.inc}

unit CRAccess;
{$ENDIF}
interface
uses
{$IFDEF VER6P}
  Variants,
{$ENDIF}
{$IFDEF CLR}
  System.Runtime.InteropServices, Borland.Vcl.TypInfo,
{$ELSE}
  CLRClasses,
{$ENDIF}
{$IFDEF MSWINDOWS}
{$IFNDEF LITE}
  MTSCall,
{$ENDIF}
{$ENDIF}
  SysUtils, Classes, MemData, MemUtils;

const
// Props
  prUsername           = 1;  // char*
  prPassword           = 2;  // char*
  prServer             = 4;  // char*
  prAutoCommit         = 5;  // bool
  prSQL                = 10; // char*
  prScanParams         = 11; // bool
  prSQLType            = 12; // integer
  prRowsProcessed      = 13; // integer

  prUniDirectional     = 20; // bool
  prFetchRows          = 21; // integer
  prFetchAll           = 22; // bool
  prRowsFetched        = 23; // integer
  prExecuting          = 24; // bool
  prLongStrings        = 25; // bool

/// if False then PutField set Null for string fields with empty value ('')
  prEnableEmptyStrings = 26; // bool

  prFlatBuffers        = 27; // bool
  prConvertEOL         = 28; // bool
  prIndexFieldNames    = 29; // char*
{$IFDEF HAVE_COMPRESS}
  prCompressBlobMode   = 30; // TCompressBlobMode
{$ENDIF}
  prDisconnectedMode   = 31;
  prDisableParamScan   = 32; // Used for ODAC

{$IFNDEF LITE}
  prIsolationLevel     = 33; // TCRIsolationLevel
  prDefaultCloseAction = 34; // TCRDefaultCloseAction
{$ENDIF}

// Sub data types
const
  dtSingle = 1;
  dtUInt8  = 2;

type
  TCRConnection = class;
  TCRCommand    = class;
  TCRRecordSet  = class;
  TParamDesc    = class;
  TParamDescs   = class;

  TParamDescClass = class of TParamDesc;

  TCommandType = (ctUnknown, ctStatement, ctCursor);

  TCursorState = (
    csInactive, // default state (TCRRecordSet.InternalOpen, TCustomDASQL.SQLChanged)
    csOpen, // ODAC only: OCI73 TOCICommand.InternalOpen
    csParsed, // ODAC only: OCI73 - statement parsed
    csPrepared, // statement prepared
    csBound, // ODAC only: parameters bound
    csExecuteFetchAll, // ODAC only: 
    csExecuting, // ODAC only(?): statement is executing (TCRCommand.Execute)
    csExecuted, // statement successfully executed
    csFetching, // setted on first TCRRecordSet.Fetch
    csFetchingAll, // ODAC, IbDAC specific. Setted on the FetchAll start
    csFetched // fetch finished or canceled
  );

  TErrorProc = procedure (E: Exception; var Fail, Reconnect: boolean {$IFNDEF LITE}; var Reexecute: boolean; ReconnectAttempt: integer;
    var ConnLostCause: TConnLostCause{$ENDIF}) of object;
  TReconnectProc = procedure of object;
  TBoolProc = procedure (Value: boolean) of object;
  TBeforeFetchProc = procedure (out Cancel: boolean) of object;
  TAfterFetchProc = procedure of object;
  TDataChangeProc = procedure of object;

  EFailOver = class(Exception)
  public
    FConnLostCause: TConnLostCause;

    constructor Create(ConnLostCause: TConnLostCause);
  end;

{ TCRConnection }

{$IFNDEF LITE}
  TCRTransaction = class;
{$ENDIF}

  TCRConnection = class
  private
    FOnError: TErrorProc;
    FOnReconnectError: TReconnectProc;
    FOnReconnectSuccess: TReconnectProc;
    FConnectionTime: Longword;

  protected
    FConnected: boolean;
    FUsername: string;
    FPassword: string;
    FServer: string;
    FAutoCommit: boolean;
    FConvertEOL: boolean;
    FIsValid: boolean;
    FPool: TObject;
    FPoolVersion: integer;
    FComponent: TObject;
    FDisconnectedMode: boolean;
  {$IFNDEF LITE}
    FTransaction: TCRTransaction;
  {$ENDIF}

    FInProcessError: boolean;
    FReconnected: boolean;

  {$IFDEF MSWINDOWS}
  {$IFNDEF LITE}
    procedure Enlist(MTSTransaction: ICRTransactionSC); virtual;
    procedure UnEnlist(MTSTransaction: ICRTransactionSC); virtual;
  {$ENDIF}
  {$ENDIF}
    procedure DoError(E: Exception; var Fail: boolean); virtual;

    property AutoCommit: boolean read FAutoCommit write FAutoCommit;

  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure Connect(const ConnectString: string); virtual;
    procedure Disconnect; virtual; abstract;

    procedure StartTransaction; virtual; abstract;
    procedure Commit; virtual; abstract;
    procedure Rollback; virtual; abstract;

    function GetConnected: boolean;
    procedure SetConnected(Value: boolean);

    procedure SetUsername(const Value: string); virtual;
    procedure SetPassword(const Value: string); virtual;
    procedure SetServer(const Value: string);

    function CheckIsValid: boolean; virtual; abstract;
  {$IFNDEF LITE}
    procedure ReturnToPool; virtual;
  {$ENDIF}

    function SetProp(Prop: integer; const Value: variant): boolean; virtual;
    function GetProp(Prop: integer; var Value: variant): boolean; virtual;

    property OnError: TErrorProc read FOnError write FOnError;
    property OnReconnectError: TReconnectProc read FOnReconnectError write FOnReconnectError;
    property OnReconnectSuccess: TReconnectProc read FOnReconnectSuccess write FOnReconnectSuccess; 

    property ConnectionTime: Longword read FConnectionTime; 
    property IsValid: boolean read FIsValid write FIsValid;
    property Pool: TObject read FPool write FPool;
    property PoolVersion: integer read FPoolVersion write FPoolVersion;
    property Component: TObject read FComponent write FComponent; // Is needed for failover
    property DisconnectedMode: boolean read FDisconnectedMode write FDisconnectedMode;
  {$IFNDEF LITE}
    property Transaction: TCRTransaction read FTransaction;
  {$ENDIF}  
  end;

{ TCRCommand }

  TCRCommand = class
  private
  protected
    FComponent: TObject;
    FConnection: TCRConnection;
    FSQL: string;
    FParams: TParamDescs;
    FAutoCommit: boolean;
    FAfterExecute: TBoolProc;
    FExecuting: boolean;
  {$IFDEF HAVE_COMPRESS}
    FCompressBlob: TCompressBlobMode;
  {$ENDIF}

    property Params: TParamDescs read FParams write FParams;
    property Executing: boolean read FExecuting write FExecuting;
    
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure Prepare; virtual;
    procedure Unprepare; virtual;
    function GetPrepared: boolean; virtual; abstract;

    procedure Execute(Iters: integer = 1); virtual; abstract;

    procedure SetConnection(Value: TCRConnection); virtual;
    procedure SetSQL(const Value: string); virtual;
    function GetCursorState: TCursorState; virtual; abstract;
    procedure SetCursorState(Value: TCursorState); virtual; abstract;

  { Params }
    function GetParamDescType: TParamDescClass; virtual;
    procedure ClearParams;
    function AddParam: TParamDesc; virtual;
    procedure DeleteParam(Index: integer);
    function GetParamCount: integer;
    function GetParam(Index: integer): TParamDesc;
    function FindParam(Name: string): TParamDesc;

    function SetProp(Prop: integer; const Value: variant): boolean; virtual;
    function GetProp(Prop: integer; var Value: variant): boolean; virtual;

    property SQL: string read FSQL write SetSQL;
    property Component: TObject read FComponent write FComponent; // Is needed for failover
    property AfterExecute: TBoolProc read FAfterExecute write FAfterExecute;
  end;

{ $IFNDEF LITE}
{ TCRTableInfo }

  TCRTablesInfo = class;

  TCRTableInfo = class(TObject)
  protected
    FOwner: TCRTablesInfo;
    FIndex: Integer;
    FTableName: string;
    FTableAlias: string;
    FIsView: boolean;
    procedure SetTableName(Value: string);
    procedure SetTableAlias(Value: string);
    function GetTableNameFull: string; virtual;
    procedure SetTableNameFull(Value: string); virtual;
  public
    constructor Create(Owner: TCRTablesInfo); virtual;

    class function NormalizeName(Value: string; const QuoteNames: boolean = False): string; overload; virtual;
    class function NormalizeName(Value: string; const LeftQ: char; const RightQ: char; const QuoteNames: boolean = False): string; overload; virtual;

    class function LeftQuote: Char; virtual;
    class function RightQuote: Char; virtual;

    class function Quote(const Value: string; const LeftQ: char; const RightQ: char): string;
    class function UnQuote(const Value: string): string;
    class function IsQuoted(const Value: string): boolean; virtual;
    class function QuotesNeeded(Value: string): boolean; virtual;

    property TableName: string read FTableName write SetTableName;
    property TableAlias: string read FTableAlias write SetTableAlias;
    property TableNameFull: string read GetTableNameFull write SetTableNameFull;
    property IsView: boolean read FIsView write FIsView;
    property Index: Integer read FIndex write FIndex;
  end;

  TTableInfoClass = class of TCRTableInfo;

  TCRTablesInfo = class
  private
    function GetItem(Index: Integer): TCRTableInfo;
    procedure SetItem(Index: Integer; const Value: TCRTableInfo);
  protected
    FList: array of TCRTableInfo;
    FUpdateCount: Integer;
    FTableInfoClass: TTableInfoClass;
    FTableNameList: TStringList;
    FTableAliasList: TStringList;
    FIsNormalized: Boolean;
    procedure InternalAdd(TableInfo: TCRTableInfo);
    procedure Changed;
    procedure TableNameChanged;
    procedure TableAliasChanged;
    function GetCount: Integer;
  public
    constructor Create(TableInfoClass: TTableInfoClass);
    destructor Destroy; override;
    function Add: TCRTableInfo;
    procedure Clear;
    procedure BeginUpdate; virtual;
    procedure EndUpdate; virtual;
    procedure Normalize;
    function FindByName(TableName: string): TCRTableInfo;
    function IndexOf(TableInfo: TCRTableInfo): Integer;
    function IndexByName(TableName: string): Integer;
    function IndexByAlias(TableAlias: string): Integer;
    property Items[Index: Integer]: TCRTableInfo read GetItem write SetItem; default;
    property Count: Integer read GetCount;
    property TableInfoClass: TTableInfoClass read FTableInfoClass;
  end;
{ $ENDIF}

{ TCRFieldDesc}

  TCRFieldDesc = class (TFieldDesc)
  { $IFNDEF LITE}
  protected
    FTableInfo: TCRTableInfo;
    FActualNameQuoted: array[boolean] of string; // cache for [QuoteNames]
  public
    function ActualNameQuoted(RecordSet: TCRRecordSet; const QuoteNames: boolean): string; virtual;

    property TableInfo: TCRTableInfo read FTableInfo write FTableInfo;
  { $ENDIF}
  end;

{ TCRRecordSet }

  TCRRecordSet = class (TMemData)
  private
  protected
    FCommand: TCRCommand;
    FUniDirectional: boolean;
    FFetchRows: integer;
    FFetchAll: boolean;
    FLongStrings: boolean;
    FFlatBuffers: boolean;

    FAfterExecFetch: TBoolProc;
    FAfterFetchAll: TBoolProc;
    FOnBeforeFetch: TBeforeFetchProc;
    FOnAfterFetch: TAfterFetchProc;
    FOnDataChanged: TDataChangeProc;
    FWaitForFetchBreak: boolean;
    FCommandType: TCommandType;

  { $IFNDEF LITE}
    FTablesInfo: TCRTablesInfo;
  { $ENDIF}

    procedure CreateCommand; virtual; abstract;
    procedure FreeCommand;
    procedure SetCommand(Value: TCRCommand); virtual;

    function CanFetchBack: boolean; virtual; // Return True, if BlockMan is store only one block of records

  { Open/Close }
    procedure InternalPrepare; override;
    procedure InternalUnPrepare; override;
    procedure InternalOpen; override;

    function NeedInitFields: boolean; virtual;
    procedure ExecFetch; virtual;
    procedure DoBeforeFetch(out Cancel: boolean); virtual;
    procedure DoAfterFetch; virtual;

  { Items/Data }
   // procedure PrepareData; override;

  { Fields }
    function NeedConvertEOL: boolean; override;

  { TablesInfo }
    class function GetTableInfoClass: TTableInfoClass; virtual;

    function GetComponent: TObject;
    procedure SetComponent(Value: TObject);
  public
    constructor Create; virtual;
    destructor Destroy; override;

  { Fields}
    function GetFieldDescType: TFieldDescClass; override;

  { Open/Close }
    procedure Prepare; override;
    procedure UnPrepare; override;
    procedure Disconnect; virtual;

    procedure Open; override;
    procedure Close; override;
    procedure ExecCommand; virtual; // Execute command

  { Records }
    procedure GetNextRecord(RecBuf: IntPtr); override;
    procedure GetPriorRecord(RecBuf: IntPtr); override;

  { Fetch }
    procedure FetchAll; virtual;
    procedure BreakFetch; virtual;// Breaks fetch. Can be called from other thread or in non-blocking mode 
    function CanDisconnect: boolean; virtual;

    function RowsReturn: boolean; virtual;

    function GetCommand: TCRCommand;
    procedure SetConnection(Value: TCRConnection); virtual;
    procedure SetSQL(const Value: string); virtual;

    function SetProp(Prop: integer; const Value: variant): boolean; virtual;
    function GetProp(Prop: integer; var Value: variant): boolean; virtual;

  { Filter }
    procedure FilterUpdated; override;

    property CommandType: TCommandType read FCommandType write FCommandType;
    property AfterExecFetch: TBoolProc read FAfterExecFetch write FAfterExecFetch;
    property AfterFetchAll: TBoolProc read FAfterFetchAll write FAfterFetchAll;
    property OnBeforeFetch: TBeforeFetchProc read FOnBeforeFetch write FOnBeforeFetch;
    property OnAfterFetch: TAfterFetchProc read FOnAfterFetch write FOnAfterFetch;
    property OnDataChanged: TDataChangeProc read FOnDataChanged write FOnDataChanged;

  { Sorting }
    procedure SortItems; override;

  { $IFNDEF LITE}
  { TablesInfo }
    property TablesInfo: TCRTablesInfo read FTablesInfo;
  { $ENDIF}
    property Component: TObject read GetComponent write SetComponent;
  end;

{ TParamDesc }

  TParamDirection = (pdUnknown, pdInput, pdOutput, pdInputOutput, pdResult);

  TParamDesc = class
  private
  protected
    FName: string;
    FDataType: word;
    FParamType: TParamDirection;

    FSize: integer;
    FData: variant; // pointer;
    FIsNull: boolean;
    FConvertEOL: boolean;

    property Name: string read FName write FName;
    property DataType: word read FDataType write FDataType;
    property ParamType: TParamDirection read FParamType write FParamType;
    property Size: integer read FSize write FSize;

  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure Clear;

    function GetName: string;
    procedure SetName(Value: string);

    function GetDataType: word;
    procedure SetDataType(Value: word); virtual;

    function GetParamType: TParamDirection;
    procedure SetParamType(Value: TParamDirection);

    function GetSize: integer;
    procedure SetSize(Value: integer); virtual;

    function GetValue: variant; virtual;
    procedure SetValue(const Value: variant); virtual;

    function GetObject: TSharedObject; virtual;
    procedure SetObject(Value: TSharedObject); virtual;

    function GetNull: boolean; virtual;
    procedure SetNull(const Value: boolean); virtual;

    procedure SetConvertEOL(const Value: boolean);

    property Value: variant read FData write SetValue;
  end;

{ TParamDescs }

  TParamDescs = class (TDAList)
  private
    function GetItems(Index: integer): TParamDesc;

  public
    destructor Destroy; override;

    procedure Clear; override;

    function FindParam(Name: string): TParamDesc;
    function ParamByName(Name: string): TParamDesc;

    property Items[Index: integer]: TParamDesc read GetItems; default;
  end;

{$IFNDEF LITE}
  TCRErrorProc = procedure (E: Exception; var Fail: boolean) of object;

  TCRIsolationLevel = (ilReadCommitted, ilSerializable);
  TCRTransactionAction = (taCommit, taRollback);
  
  TCRTransactionLink = class
    Connection: TCRConnection;
  public
    constructor Create; virtual;
  end;
  TCRTransactionLinkClass = class of TCRTransactionLink;

  TCRTransactionLinks = class(TDAList)
  private
    function GetItems(Index: integer): TCRTransactionLink;
  protected
    class function GetTransactionLinkClass: TCRTransactionLinkClass; virtual;
  public
    constructor Create; virtual;
    procedure Clear; override;
    function IndexOfConnection(Connection: TCRConnection): integer;
    function AddConnection(Connection: TCRConnection): integer;
    function RemoveConnection(Connection: TCRConnection): boolean;
    property Items[Index: Integer]: TCRTransactionLink read GetItems; default;
  end;
  TCRTransactionLinksClass = class of TCRTransactionLinks;
  
  TCRTransaction = class
  protected
    FActive: boolean;
    FOnError: TCRErrorProc;
    FTransactionLinks: TCRTransactionLinks;
    FIsolationLevel: TCRIsolationLevel;
    FDefaultCloseAction: TCRTransactionAction;

  {$IFDEF MSWINDOWS}
    FMTSGC: ICRTransactionDispenserSC;
    FMTSTrans: ICRTransactionSC;
  {$ENDIF}

    class function GetTransactionLinksClass: TCRTransactionLinksClass; virtual;
    
  {$IFDEF MSWINDOWS}
    procedure StartMTSTransaction; virtual;
    procedure CompleteMTSTransaction(Commit: boolean); virtual;
  {$ENDIF}
  
    procedure EnlistLink(TransactionLink: TCRTransactionLink); virtual;
    procedure UnEnlistLink(TransactionLink: TCRTransactionLink); virtual;

  public
    constructor Create; virtual;
    destructor Destroy; override;
    
    procedure CloseTransaction;

    procedure CheckState(State: boolean);
    function AddConnection(Connection: TCRConnection): boolean;
    function RemoveConnection(Connection: TCRConnection): boolean;

    function SetProp(Prop: integer; const Value: variant): boolean;
    function GetProp(Prop: integer; var Value: variant): boolean;

    procedure StartTransaction; virtual;
    procedure Commit; virtual;
    procedure Rollback; virtual;

    property Active: boolean read FActive;
    property OnError: TCRErrorProc read FOnError write FOnError;
  end;
{$ENDIF}  
  
{$IFDEF LINUX}
function GetTickCount: Cardinal;
{$ENDIF}
function GenerateTableName(const FieldDesc: TFieldDesc): string;


implementation

uses
{$IFNDEF LITE}
  CRConnectionPool,
{$ENDIF}
  DAConsts,
{$IFDEF VER6P}
  RTLConsts,
{$ELSE}
  Consts,
{$ENDIF}
{$IFDEF LINUX}
  Libc;
{$ELSE}
{$IFDEF MSWINDOWS}
{$IFNDEF LITE}
  ComObj,
{$ENDIF}
{$ENDIF}
  Windows;
{$ENDIF}

{ TCRAccess }

{$IFDEF LINUX}
function GetTickCount: Cardinal;
var
  tv: timeval;
begin
  gettimeofday(tv, nil);
  {$RANGECHECKS OFF}
  Result := int64(tv.tv_sec) * 1000 + tv.tv_usec div 1000;
end;
{$ENDIF}

function GenerateTableName(const FieldDesc: TFieldDesc): string;
begin
  if TCRFieldDesc(FieldDesc).TableInfo <> nil then
    Result := TCRFieldDesc(FieldDesc).TableInfo.TableName
  else
    Result := '';
end;

{ EFailOver }

constructor EFailOver.Create(ConnLostCause: TConnLostCause);
begin
  FConnLostCause := ConnLostCause;
  inherited Create('');
end;

{ TCRConnection }

constructor TCRConnection.Create;
begin
  inherited;

  FConnected:= False;
  FIsValid := True;
end;

destructor TCRConnection.Destroy;
begin
  Disconnect;
  inherited;
end;

procedure TCRConnection.Connect(const ConnectString: string);
begin
  FConnectionTime := GetTickCount;
  FIsValid := True;
end;

procedure TCRConnection.DoError(E: Exception; var Fail: boolean);
var
  Reconnect: boolean;
  Attempt: Integer;
{$IFNDEF LITE}
  Reexecute: boolean;
  ConnLostCause: TConnLostCause;
{$ENDIF}
begin
  Attempt := 0;
  while not FInProcessError do begin
    Reconnect := Attempt > 0;
  {$IFNDEF LITE}
    Reexecute := False;
  {$ENDIF}    
    if Assigned(OnError) then begin
      FInProcessError := True;
      try
        OnError(E, Fail, Reconnect{$IFNDEF LITE}, Reexecute, Attempt, ConnLostCause{$ENDIF});
      finally
        FInProcessError := False;
      end;
    end;        

    if Reconnect then begin
      FReconnected := False;
      try
        FInProcessError := True;
        if Attempt = 0 then
          Disconnect;
      except // don't raise exception
      end;
      try
        Connect('');
        FReconnected := True;
        OnReconnectSuccess;        
      except // don't raise exception
      end;
      FInProcessError := False;

    {$IFNDEF LITE}
      if FReconnected and Reexecute then
        raise EFailOver.Create(ConnLostCause); //Failover
    {$ENDIF}    

      inc(Attempt);
    end;

    if not Reconnect and (Attempt > 0) then
      if not FReconnected and Assigned(OnReconnectError) then begin
        FInProcessError := True;
        FConnected := True; // to bypass "Value <> GetConnected" check in TCustomDAConnection.SetConnected
        try
          OnReconnectError;
        except // don't raise exception
        end;
        FConnected := False;
        FInProcessError := False;
      end;
    
    if not Reconnect or FReconnected then
      break;
  end;
end;

function TCRConnection.GetConnected: boolean;
begin
  Result := FConnected;
end;

procedure TCRConnection.SetConnected(Value: boolean);
begin
  if Value then
    Connect('')
  else
    Disconnect;
end;

procedure TCRConnection.SetUsername(const Value: string);
begin
  FUsername := Value;
end;

procedure TCRConnection.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TCRConnection.SetServer(const Value: string);
begin
  FServer := Value;
end;

{$IFDEF MSWINDOWS}
{$IFNDEF LITE}
procedure TCRConnection.Enlist(MTSTransaction: ICRTransactionSC);
begin
  raise Exception.Create('MS DTC transactions not supported');
end;

procedure TCRConnection.UnEnlist(MTSTransaction: ICRTransactionSC);
begin
  raise Exception.Create('MS DTC transactions not supported');
end;
{$ENDIF}
{$ENDIF}

{$IFNDEF LITE}
procedure TCRConnection.ReturnToPool;
begin
  Assert(FPool <> nil);
  FOnError := nil;
  Component := nil;
  TCRConnectionPool(FPool).PutConnection(Self);
end;
{$ENDIF}

function TCRConnection.SetProp(Prop: integer; const Value: variant): boolean;
begin
  Result := True;
  case Prop of
    prAutoCommit:
      FAutoCommit := Value;
    prConvertEOL:
      FConvertEOL := Value;
    prDisconnectedMode:
      FDisconnectedMode := Boolean(Value); 
  else
    Assert(False, IntToStr(Prop));
    Result := False;
  end;
end;

function TCRConnection.GetProp(Prop: integer; var Value: variant): boolean;
begin
  Result := True;
  case Prop of
    prUsername: // used in Oracle dbExpress driver (TOraSQLMetaData.getProcedureParams)
                // to detect if schema name need to be included in procedure name  
      Value := FUsername;
  else
    Assert(False, IntToStr(Prop));
    Result := False;
  end;
end;

{ TCRCommand }

constructor TCRCommand.Create;
begin
  inherited;
  
  FParams:= TParamDescs.Create;
end;

destructor TCRCommand.Destroy;
begin
  FParams.Free;
end;

procedure TCRCommand.Prepare;
begin
  SetCursorState(csPrepared);
end;

procedure TCRCommand.Unprepare;
begin
  SetCursorState(csInactive);
end;

procedure TCRCommand.SetConnection(Value: TCRConnection);
begin
  FConnection := Value;
end;

procedure TCRCommand.SetSQL(const Value: string);
begin
  FSQL := Value;
end;

{function TCRCommand.GetSQL: PChar;
begin
  Result := PChar(FSQL);
end;}

{ Params }

function TCRCommand.GetParamDescType: TParamDescClass;
begin
  Result := TParamDesc;
end;

procedure TCRCommand.ClearParams;
begin
  FParams.Clear;
end;

function TCRCommand.AddParam: TParamDesc;
begin
  Result := TParamDesc.Create;
  FParams.Add(Result);
end;

procedure TCRCommand.DeleteParam(Index: integer);
begin
  TParamDesc(FParams[Index]).Free;
  FParams.Delete(Index);
end;

function TCRCommand.GetParamCount: integer;
begin
  Result := FParams.Count;
end;

function TCRCommand.GetParam(Index: integer): TParamDesc;
begin
  Result := FParams[Index];
end;

function TCRCommand.FindParam(Name: string): TParamDesc;
begin
  Result := FParams.FindParam(Name);
end;

function TCRCommand.SetProp(Prop: integer; const Value: variant): boolean;
begin
  Result := True;
  case Prop of
    prAutoCommit:
      FAutoCommit := Value;
    prDisableParamScan:; // Used for ODAC      
  else
    Assert(False, IntToStr(Prop));
    Result := False;
  end;
end;

function TCRCommand.GetProp(Prop: integer; var Value: variant): boolean;
begin
  Result := True;
  case Prop of
    prScanParams:
      Value := False;
    prExecuting:
      Value := FExecuting;
  else
    Assert(False, IntToStr(Prop));
    Result := False;
  end;
end;

{ $IFNDEF LITE}
{ TCRTableInfo }

constructor TCRTableInfo.Create(Owner: TCRTablesInfo);
begin
  inherited Create;
  FOwner := Owner;
  FIndex := -1;
end;

procedure TCRTableInfo.SetTableName(Value: string);
begin
  FTableName := Value;
  if FOwner <> nil then
    FOwner.TableNameChanged;
end;

procedure TCRTableInfo.SetTableAlias(Value: string);
begin
  FTableAlias := Value;
  if FOwner <> nil then
    FOwner.TableAliasChanged;
end;

function TCRTableInfo.GetTableNameFull: string;
begin
  Result := FTableName;
end;

procedure TCRTableInfo.SetTableNameFull(Value: string);
begin
end;

class function TCRTableInfo.IsQuoted(const Value: string): boolean;
var
  l: integer;
begin
  l := Length(Value);
  if (l <= 1) then
    Result := False
  else
    Result :=  (Value[1] = LeftQuote) and (Value[l] = RightQuote);
end;

class function TCRTableInfo.Quote(const Value: string; const LeftQ: char; const RightQ: char): string;
begin
  if not IsQuoted(Value) then
    Result := LeftQ + Value + RightQ
  else
    Result := Value;
end;

class function TCRTableInfo.UnQuote(const Value: string): string;
begin
  if IsQuoted(Value) then
    Result := Copy(Value, 2, length(Value) - 2)
  else
    Result := Value;
end;

class function TCRTableInfo.QuotesNeeded(Value: string): boolean;
var
  i: integer;
begin
  Value := UnQuote(Value);
  Result := False;
  for i := 1 to Length(Value) do
    case Value[i] of
      'a'..'z', 'A'..'Z', '_', '0'..'9':;
    else
      begin
        Result := True;
        Exit;
      end;
    end;
end;

class function TCRTableInfo.LeftQuote: Char;
begin
  Result := Char('"');
end;

class function TCRTableInfo.RightQuote: Char;
begin
  Result := Char('"');
end;

class function TCRTableInfo.NormalizeName(Value: string; const QuoteNames: boolean = False): string;
begin
  Result := NormalizeName(Value, LeftQuote, RightQuote, QuoteNames); 
end;

class function TCRTableInfo.NormalizeName(Value: string; const LeftQ: char; const RightQ: char; const QuoteNames: boolean = False): string;
var
  i: integer;
begin
  if Value = '' then begin
    Result := '';
    Exit;
  end;

  i := Pos('.', Value);
  if i <> 0 then
    Result := NormalizeName(Copy(Value, 1, i - 1), QuoteNames) + '.' + NormalizeName(Copy(Value, i + 1, Length(Value) - i), QuoteNames)
  else
    if QuoteNames or QuotesNeeded(Value) then
      Result := Quote(Value, LeftQ, RightQ)
    else
      Result := UnQuote(Value);
end;

{ TCRTablesInfo }

constructor TCRTablesInfo.Create(TableInfoClass: TTableInfoClass);
begin
  inherited Create;
  FTableInfoClass := TableInfoClass;
  FTableNameList := TStringList.Create;
  FTableAliasList := TStringList.Create;
{$IFDEF VER6P}
  // Just in case
  FTableNameList.CaseSensitive := False;
  FTableAliasList.CaseSensitive := False;
{$ENDIF}
  FUpdateCount := 0;
end;

destructor TCRTablesInfo.Destroy;
begin
  Clear;
  FTableNameList.Free;
  FTableAliasList.Free;
  inherited Destroy;
end;

procedure TCRTablesInfo.InternalAdd(TableInfo: TCRTableInfo);
var
  c: integer;
begin
  c := Count;
  SetLength(FList, c + 1);
  FList[c] := TableInfo;
  TableInfo.Index := c;
end;

function TCRTablesInfo.Add: TCRTableInfo;
begin
  Result := FTableInfoClass.Create(Self);
  InternalAdd(Result);
end;

procedure TCRTablesInfo.Clear;
var
  i: Integer;
begin
  if Count > 0 then begin
    for i := 0 to Count - 1 do
      FList[i].Free;
    SetLength(FList, 0);
    Changed;
    FIsNormalized := False;
  end;
end;

procedure TCRTablesInfo.Changed;
begin
  TableNameChanged;
  TableAliasChanged;
end;

procedure TCRTablesInfo.TableNameChanged;
var
  i: Integer;
begin
  if FUpdateCount = 0 then begin
    FTableNameList.Clear;
    for i := 0 to Count - 1 do
      FTableNameList.AddObject(FList[i].TableName, FList[i]);
    FTableNameList.Sort;
  end;
end;

procedure TCRTablesInfo.TableAliasChanged;
var
  i: Integer;
begin
  if FUpdateCount = 0 then begin
    FTableAliasList.Clear;
    for i := 0 to Count - 1 do
      FTableAliasList.AddObject(FList[i].TableAlias, FList[i]);
    FTableAliasList.Sort;
  end;
end;

function TCRTablesInfo.GetCount: Integer;
begin
  Result := Length(FList);
end;

procedure TCRTablesInfo.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TCRTablesInfo.EndUpdate;
begin
  Dec(FUpdateCount);
  Changed;
end;

procedure TCRTablesInfo.Normalize;
var
  i: integer;
begin
  BeginUpdate;
  try
    for i := 0 to Count - 1 do begin
      FList[i].TableName := TableInfoClass.NormalizeName(FList[i].TableName);
      FList[i].TableAlias := TableInfoClass.NormalizeName(FList[i].TableAlias);
      FList[i].TableNameFull := TableInfoClass.NormalizeName(FList[i].TableNameFull);
    end;
    FIsNormalized := True;
  finally
    EndUpdate;
  end;
end;

function TCRTablesInfo.FindByName(TableName: string): TCRTableInfo;
var
  Index: integer;
begin
  Index := IndexByName(TableName);
  if Index = -1 then
    Result := nil
  else
    Result := FList[Index];
end;

function TCRTablesInfo.IndexOf(TableInfo: TCRTableInfo): Integer;
begin
  Result := 0;
  while (Result < Count) and (FList[Result] <> TableInfo) do
    Inc(Result);
  if Result = Count then
    Result := -1;
end;

function TCRTablesInfo.IndexByName(TableName: string): Integer;
var
  i: integer;
begin
  if FIsNormalized then
    TableName := TableInfoClass.NormalizeName(TableName);
  if FUpdateCount = 0 then begin
    Result := FTableNameList.IndexOf(TableName);
    if Result <> -1 then
      Result := TCRTableInfo(FTableNameList.Objects[Result]).Index;
  end
  else
  begin
    Result := -1;
    for i := 0 to Count - 1 do
      if AnsiSameText(FList[i].TableName, TableName) then begin
        Result := i;
        Break;
      end;
  end;
end;

function TCRTablesInfo.IndexByAlias(TableAlias: string): Integer;
var
  i: integer;
begin
  if FIsNormalized then
    TableAlias := TableInfoClass.NormalizeName(TableAlias);
  if FUpdateCount = 0 then begin
    Result := FTableAliasList.IndexOf(TableAlias);
    if Result <> -1 then
      Result := TCRTableInfo(FTableAliasList.Objects[Result]).Index;
  end
  else
  begin
    Result := -1;
    for i := 0 to Count - 1 do
      if AnsiSameText(FList[i].TableAlias, TableAlias) then begin
        Result := i;
        Break;
      end;
  end;
end;

function TCRTablesInfo.GetItem(Index: Integer): TCRTableInfo;
begin
  if (Index < 0) or (Index >= Count) then
    raise Exception.CreateFmt(SListIndexError, [Index]);

  Result := FList[Index];
end;

procedure TCRTablesInfo.SetItem(Index: Integer; const Value: TCRTableInfo);
begin
  if (Index >= 0) and (Index < Count) then
    if Value <> FList[Index] then
      FList[Index] := Value;
end;

{ TCRFieldDesc }

function TCRFieldDesc.ActualNameQuoted(RecordSet: TCRRecordSet; const QuoteNames: boolean): string;
begin
  if FActualNameQuoted[QuoteNames] <> '' then
    Result := FActualNameQuoted[QuoteNames]
  else
  begin
    if FTableInfo <> nil then begin
      Result := FTableInfo.NormalizeName(ActualName, QuoteNames);
      FActualNameQuoted[QuoteNames] := Result;
    end
    else begin
      Result := RecordSet.GetTableInfoClass.NormalizeName(ActualName, QuoteNames);
      FActualNameQuoted[QuoteNames] := Result;
    end;
  end;
end;
{ $ENDIF}

{ TCRRecordSet }

constructor TCRRecordSet.Create;
begin
  inherited;

  FAfterExecFetch := nil;
  FAfterFetchAll := nil;

  FTablesInfo := TCRTablesInfo.Create(GetTableInfoClass);
  CreateCommand;

  FLongStrings := True;
  FFlatBuffers := True;
end;

destructor TCRRecordSet.Destroy;
begin
  FreeCommand;
  
{$IFNDEF LITE}
  FTablesInfo.Free;
{$ENDIF}
  
  inherited;
end;

{procedure TCRRecordSet.CreateCommand;
begin
  SetCommand(nil);
end;}

procedure TCRRecordSet.FreeCommand;
begin
  FCommand.Free;
  SetCommand(nil);
end;

procedure TCRRecordSet.SetCommand(Value: TCRCommand);
begin
  FCommand := Value;
end;

function TCRRecordSet.CanFetchBack: boolean; 
begin
  Result := False;
end;
    
{ Open/Close }

procedure TCRRecordSet.InternalPrepare;
begin
  FCommand.Prepare;
end;

procedure TCRRecordSet.InternalUnPrepare;
begin
  FCommand.UnPrepare;
end;

procedure TCRRecordSet.InternalOpen;
begin
  try
    inherited;

    FEOF := False;

    ExecFetch;
  except
    if not Prepared then
      InternalUnprepare;

    if FCommand.GetCursorState = csExecuted then
      FCommand.SetCursorState(csInactive);

    raise;
  end
end;

procedure TCRRecordSet.Prepare;
begin
  if not Prepared then begin

    inherited;

    if CommandType = ctCursor then
      try
        InitFields;
        Prepared := True;
      except
        Prepared := False;
        InternalUnPrepare;
        raise;
      end;
  end;
end;

procedure TCRRecordSet.Unprepare;
begin
  try
    inherited;
  finally
  {$IFNDEF LITE}
    FTablesInfo.Clear;
  {$ENDIF}
  end;
end;

procedure TCRRecordSet.Disconnect;
begin
  InternalUnprepare; //Remove all links to DB but not close Data
  Prepared := False; //Set recordset unprepared in case of disconnect mode and
                     //explicit disconnection this will prevent from wrong Prepare state
end;

procedure TCRRecordSet.Open;
begin
  inherited;
end;

procedure TCRRecordSet.Close;
begin
  inherited;
end;

procedure TCRRecordSet.ExecCommand;
begin
  FCommand.Execute;
  FWaitForFetchBreak := False;
end;

function TCRRecordSet.NeedInitFields: boolean;
begin
  Result := False;
end;

procedure TCRRecordSet.ExecFetch;
var
  OldCommandType: TCommandType;
begin
  OldCommandType := CommandType;

  ExecCommand;

  if (OldCommandType <> ctCursor) or NeedInitFields then
    InitFields;

  if FFetchAll then
    FetchAll
  else
    Fetch;
end;

procedure TCRRecordSet.BreakFetch; // Breaks fetch. Can be called from other thread or in non-blocking mode
begin
  FWaitForFetchBreak := True;
end;

procedure TCRRecordSet.DoBeforeFetch(out Cancel: boolean);
begin
  Cancel := FWaitForFetchBreak;

  if Assigned(FOnBeforeFetch) then
    FOnBeforeFetch(Cancel);

  if Cancel then begin
    // reset cursor state for FetchAll
    if (FCommand.GetCursorState = csFetchingAll) then
      FCommand.SetCursorState(csFetching);
  end;
end;

procedure TCRRecordSet.DoAfterFetch;
begin
  if Assigned(FOnAfterFetch) then
    FOnAfterFetch;
end;

procedure TCRRecordSet.SortItems;
begin
  if IndexFields.Count = 0 then
    Exit;
  FetchAll;

  inherited SortItems;
end;

{ Fields }
function TCRRecordSet.GetFieldDescType: TFieldDescClass;
begin
  Result := TCRFieldDesc;
end;

function TCRRecordSet.NeedConvertEOL: boolean;
begin
  if (FCommand = nil) or (FCommand.FConnection = nil) then
    Result := False
  else
    Result := FCommand.FConnection.FConvertEOL;
end;

{ Records }

procedure TCRRecordSet.GetNextRecord(RecBuf: IntPtr);
var
  Found: boolean;
  Item: PItemHeader;
begin
  if not EOF then begin
    if IntPtr(FirstItem) = nil then begin
      if not Fetch then begin
        FEOF := True;
        Exit;
      end
      else
        CurrentItem := FirstItem;
    end
    else
      if IntPtr(CurrentItem) = nil then
        CurrentItem := FirstItem
      else
        CurrentItem := CurrentItem.Next;

    repeat
      if IntPtr(CurrentItem) = nil then begin
        Item := LastItem;

        if not Fetch then begin
          FEOF := True;
          Exit;
        end
        else begin
          if FUniDirectional or CanFetchBack then begin
            FirstItem.Prev := nil;  // remove cycle link
            LastItem.Next := nil;
          end;
          if (IntPtr(Item.Next) = nil) or FUniDirectional then
            CurrentItem := FirstItem
          else
            CurrentItem := Item.Next;
        end
      end;

      Found := not OmitRecord(CurrentItem);
      if not Found then
        CurrentItem := CurrentItem.Next;
    until Found;

    FBOF := False;
    FEOF := False;
    if RecBuf <> nil then
      GetRecord(RecBuf);
  end;
end;

procedure TCRRecordSet.GetPriorRecord(RecBuf: IntPtr);
var
  Found: boolean;
  Item: PItemHeader;
begin
  if FUniDirectional then begin
    FBOF := True;
    CurrentItem := nil;
  end
  else
    if not CanFetchBack then
      inherited
    else
      if not BOF then begin
        if IntPtr(LastItem) = nil then begin
          if not Fetch(True){FetchBack!} then begin
            FBOF := True;
            Exit;
          end
          else
            CurrentItem := LastItem;
        end
        else
          if IntPtr(CurrentItem) = nil then
            CurrentItem := LastItem
          else
            CurrentItem := CurrentItem.Prev;

        repeat
          if IntPtr(CurrentItem) = nil then begin
            Item := FirstItem;

            if not Fetch(True){FetchBack!} then begin
              FBOF := True;
              Exit;
            end
            else begin
              FirstItem.Prev := nil;  // remove cycle link
              LastItem.Next := nil;
              if IntPtr(Item.Prev) = nil then
                CurrentItem := LastItem
              else
                CurrentItem := Item.Prev;
            end;
          end;

          Found := not OmitRecord(CurrentItem);
          if not Found then
            CurrentItem := CurrentItem.Prev;
        until Found;

        FBOF := False;
        FEOF := False;
        if RecBuf <> nil then
          GetRecord(RecBuf);
      end;
end;

{ Fetch }

procedure TCRRecordSet.FetchAll;
begin
  while Fetch do;
end;

function TCRRecordSet.CanDisconnect: boolean;
var
  CursorState: TCursorState;
begin
  Assert(FCommand <> nil);
  CursorState := FCommand.GetCursorState;
  Result := (CursorState = csInactive) or (CursorState = csFetched);
end;

function TCRRecordSet.RowsReturn: boolean;
begin
  Result := (CommandType = ctCursor);
end;

function TCRRecordSet.GetCommand: TCRCommand;
begin
  Result := FCommand;
end;

procedure TCRRecordSet.SetConnection(Value: TCRConnection);
begin
  FCommand.SetConnection(Value);
end;

procedure TCRRecordSet.SetSQL(const Value: string);
begin
  FCommand.SetSQL(Value);
end;

function TCRRecordSet.SetProp(Prop: integer; const Value: variant): boolean;
begin
  Result := True;
  case Prop of
    prUniDirectional:
      FUniDirectional := Value;
    prFetchRows:
      FFetchRows := Value;
    prFetchAll:
      FFetchAll := Value;
    prLongStrings:
      FLongStrings := Value;
    prFlatBuffers:
      FFlatBuffers := Value;
    prEnableEmptyStrings:
      EnableEmptyStrings := Value;
    prIndexFieldNames:
      SetIndexFieldNames(Value);
  {$IFDEF HAVE_COMPRESS}
    prCompressBlobMode:
      FCommand.FCompressBlob := TCompressBlobMode(Integer(Value));
  {$ENDIF}
  else
    Assert(False, IntToStr(Prop));
    Result := False;
  end;
end;

procedure TCRRecordSet.SetComponent(Value: TObject);
begin
  FCommand.Component := Value;
end;

function TCRRecordSet.GetComponent: TObject;
begin
  Result := FCommand.Component;
end;

function TCRRecordSet.GetProp(Prop: integer; var Value: variant): boolean;
begin
  Result := True;
  case Prop of
    prFetchAll:
      Value := FFetchAll;
  else
    Assert(False, IntToStr(Prop));
    Result := False;
  end;
end;

procedure TCRRecordSet.FilterUpdated;
var
  NotFetched: boolean;
begin
  NotFetched := (RecordCount = 0) and not FEOF;
  inherited FilterUpdated;
  FEOF := FEOF and not NotFetched;
end;

class function TCRRecordSet.GetTableInfoClass: TTableInfoClass;
begin
  Result := TCRTableInfo;
end;

{ TParamDesc }

constructor TParamDesc.Create;
begin
  inherited;

  FDataType := dtUnknown;
end;

destructor TParamDesc.Destroy;
begin
end;

procedure TParamDesc.Clear;
begin
  FDataType := dtUnknown;
end;

function TParamDesc.GetName: string;
begin
  Result := FName;
end;

procedure TParamDesc.SetName(Value: string);
begin
  FName := Value;
end;

function TParamDesc.GetDataType: word;
begin
  Result := FDataType;
end;

procedure TParamDesc.SetDataType(Value: word);
begin
  FDataType := Value;
end;

function TParamDesc.GetParamType: TParamDirection;
begin
  Result := FParamType;
end;

procedure TParamDesc.SetParamType(Value: TParamDirection);
begin
  FParamType := Value;
end;

function TParamDesc.GetSize: integer;
begin
  Result := FSize;
end;

procedure TParamDesc.SetSize(Value: integer);
begin
  FSize := Value;
end;

function TParamDesc.GetValue: variant;
begin
  Result := FData;
end;

procedure TParamDesc.SetValue(const Value: variant);
begin
{$IFNDEF VER6P}
  if TVarData(Value).VType = varByRef then
    SetObject(TVarData(Value).VPointer)
  else
{$ENDIF}
    FData := Value;
  FIsNull := VarIsEmpty(FData) or VarIsNull(FData);
end;

function TParamDesc.GetNull: boolean;
begin
  Result := FIsNull;
end;

function TParamDesc.GetObject: TSharedObject;
begin
  if VarIsEmpty(FData) or VarIsNull(FData) then
    Result := nil
  else
  begin
  {$IFDEF CLR}
    Assert(FData is TSharedObject);
    Result := TSharedObject(FData);
  {$ELSE}
    Assert(TVarData(FData).VType = varByRef);
    Result := TVarData(FData).VPointer;
  {$ENDIF}
  end;
end;

procedure TParamDesc.SetObject(Value: TSharedObject);
begin
{$IFDEF CLR}
  FData := Variant(Value);
{$ELSE}
  FData := Unassigned;
  TVarData(FData).VType := varByRef;
  TVarData(FData).VPointer := Value;
{$ENDIF}
end;

procedure TParamDesc.SetNull(const Value: boolean);
begin
  FIsNull := Value;
  FData := Unassigned;
end;

procedure TParamDesc.SetConvertEOL(const Value: boolean);
begin
  FConvertEOL := Value;
end;

{ TParamDescs }

destructor TParamDescs.Destroy;
begin
  Clear;

  inherited;
end;

procedure TParamDescs.Clear;
var
  i:integer;
begin
  for i:= 0 to Count - 1 do
    if Items[i] <> nil then
      TParamDesc(Items[i]).Free;

  inherited Clear;
end;

function TParamDescs.FindParam(Name: string): TParamDesc;
var
  i: integer;
begin
  Result := nil;

  for i := 0 to Count - 1 do
    if (Items[i] <> nil) then
      if AnsiCompareText(TParamDesc(Items[i]).FName, Name) = 0 then begin
        Result := Items[i];
        break;
      end;
end;

function TParamDescs.ParamByName(Name: string): TParamDesc;
begin
  Result := FindParam(Name);

  if Result = nil then
    Assert(False);
    //raise Exception.Create(Format(SParamNotFound, [Name]));
end;

function TParamDescs.GetItems(Index: integer): TParamDesc;
begin
  Result := TParamDesc(inherited Items[Index]);
end;

{$IFNDEF LITE}

{ TCRTransactionLink }

constructor TCRTransactionLink.Create;
begin
  inherited Create;
end;

{ TCRTransactionLinks }

constructor TCRTransactionLinks.Create;
begin
  inherited Create;
end;

function TCRTransactionLinks.GetItems(Index: integer): TCRTransactionLink;
begin
  Result := TCRTransactionLink(inherited Items[Index]);
end;

function TCRTransactionLinks.IndexOfConnection(Connection: TCRConnection): integer;
var
  i: integer;
  TransactionLink: TCRTransactionLink;
begin
  for i := 0 to Count - 1 do begin
    TransactionLink := Items[i];
    if TransactionLink.Connection = Connection then begin
      Result := i;
      Exit;
    end;
  end;
  Result := -1;
end;

class function TCRTransactionLinks.GetTransactionLinkClass: TCRTransactionLinkClass;
begin
  Result := TCRTransactionLink;
end;

function TCRTransactionLinks.AddConnection(Connection: TCRConnection): integer;
var
  TransactionLink: TCRTransactionLink;
begin
  Result := IndexOfConnection(Connection);
  if Result = -1 then begin
    TransactionLink := GetTransactionLinkClass.Create;
    TransactionLink.Connection := Connection;
    Result := Add(TransactionLink);
  end;
end;

function TCRTransactionLinks.RemoveConnection(Connection: TCRConnection): boolean;
var
  i: integer;
begin
  i := IndexOfConnection(Connection);
  if i >= 0 then begin
    Items[i].Free;
    Delete(i);
    Result := True;
  end
  else
    Result := False;
end;

procedure TCRTransactionLinks.Clear;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Free;
    
  inherited;
end;

{ TCRTransaction }

constructor TCRTransaction.Create;
begin
  inherited;

  FTransactionLinks := GetTransactionLinksClass.Create;
end;

destructor TCRTransaction.Destroy;
begin
  CloseTransaction;
  
  FTransactionLinks.Free;

{$IFDEF MSWINDOWS}
  FMTSGC := nil;
{$ENDIF}

  inherited;
end;

class function TCRTransaction.GetTransactionLinksClass: TCRTransactionLinksClass;
begin
  Result := TCRTransactionLinks;
end;

procedure TCRTransaction.CloseTransaction;
begin
  if FActive then
    try
      case FDefaultCloseAction of
        taCommit:
          Commit;
        taRollback:
          Rollback;
      end;
    except
    end;
end;

procedure TCRTransaction.CheckState(State: boolean);
begin
  if FActive <> State then
    if State then
      raise Exception.Create(STransactionMustBeActive)
    else
      raise Exception.Create(SInvalidTransactionState);
end;

function TCRTransaction.AddConnection(Connection: TCRConnection): boolean;
var
  Index: integer;
begin
  Index := FTransactionLinks.AddConnection(Connection);
  Result := Index <> -1;
  if Result and Active then
    EnlistLink(FTransactionLinks[Index]);
end;

function TCRTransaction.RemoveConnection(Connection: TCRConnection): boolean;
var
  Index: integer;
begin
  Index := FTransactionLinks.IndexOfConnection(Connection);
  if Active and (Index <> -1) then
    UnEnlistLink(FTransactionLinks[Index]);
  Result := FTransactionLinks.RemoveConnection(Connection);
end;

function TCRTransaction.SetProp(Prop: integer; const Value: variant): boolean;
begin
  Result := True;
  case Prop of
    prIsolationLevel: begin
      CheckState(False);
      FIsolationLevel := TCRIsolationLevel(Value);
    end;
    prDefaultCloseAction:
      FDefaultCloseAction := TCRTransactionAction(Value);
  else
    Assert(False, IntToStr(Prop));
    Result := False;
  end;
end;

function TCRTransaction.GetProp(Prop: integer; var Value: variant): boolean;
begin
  Result := True;
  case Prop of
    prIsolationLevel:
      Value := Integer(FIsolationLevel);
  else
    Assert(False, IntToStr(Prop));
    Result := False;
  end;
end;

procedure TCRTransaction.StartTransaction;
var
  i: integer;
begin
  CheckState(False);

  for i := 0 to FTransactionLinks.Count - 1 do
    if not FTransactionLinks[i].Connection.GetConnected then
      raise Exception.Create(SConnectionInTransactionNotActive);

{$IFDEF MSWINDOWS}      
  StartMTSTransaction;
{$ENDIF}  

  FActive := True;
  try
    for i := 0 to FTransactionLinks.Count - 1 do
      EnlistLink(FTransactionLinks[i]);
  except
    Rollback;
    raise;
  end;
end;

procedure TCRTransaction.Commit;
begin
  CheckState(True);
  
{$IFDEF MSWINDOWS}
  CompleteMTSTransaction(True)
{$ENDIF}  
end;

procedure TCRTransaction.Rollback;
begin
  CheckState(True);

{$IFDEF MSWINDOWS}  
  CompleteMTSTransaction(False);
{$ENDIF}  
end;

{$IFDEF MSWINDOWS}
procedure TCRTransaction.StartMTSTransaction;
var
  MTSIsolationLevel: integer;
  MTSFlags: integer;
  MTSTransaction: ICRTransaction;
  MTSOptions: ICRTransactionOptions;
{$IFDEF CLR}
  hGuid: IntPtr;
  aGuid: array of byte;
  i: integer;
const
  GuidSize = 16;
{$ENDIF}
begin
  InitMSDTC;

  if FMTSGC = nil then begin
  {$IFDEF CLR}
    hGuid := Marshal.AllocHGlobal(GuidSize);
    try
      aGuid := StringToGUID(IID_ITransactionDispenser).ToByteArray;
      for i := 0 to GuidSize - 1 do
        Marshal.WriteByte(hGuid, i, aGuid[i]);
      OleCheck(DtcGetTransactionManagerEx(nil, nil, hGuid, 0, nil, FMTSGC));
    finally
      Marshal.FreeHGlobal(hGuid);
    end;
  {$ELSE}
    OleCheck(DtcGetTransactionManagerEx(nil, nil, IID_ITransactionDispenser, 0, nil, FMTSGC));
  {$ENDIF}
  end;

  case FIsolationLevel of
    ilReadCommitted:
      MTSIsolationLevel := ISOLATIONLEVEL_READCOMMITTED;
    ilSerializable:
      MTSIsolationLevel := ISOLATIONLEVEL_SERIALIZABLE;
  else
    Assert(False);
    MTSIsolationLevel := 0;
  end;
  MTSFlags := 0;
  MTSOptions := nil; 

  FMTSGC.BeginTransaction(nil, MTSIsolationLevel, MTSFlags, MTSOptions, MTSTransaction);
  FMTSTrans := ICRTransactionSC(MTSTransaction);
end;

procedure TCRTransaction.CompleteMTSTransaction(Commit: boolean);
begin
  Assert(FMTSTrans <> nil);
  FActive := False;
  try
    if Commit then
      FMTSTrans.Commit(False, 0, 0)
    else
      FMTSTrans.Abort(nil, False, False);
  finally
    FMTSTrans := nil;
  end;
end;
{$ENDIF}

procedure TCRTransaction.EnlistLink(TransactionLink: TCRTransactionLink);
begin
  TransactionLink.Connection.FTransaction := Self;
{$IFDEF MSWINDOWS}
  TransactionLink.Connection.Enlist(FMTSTrans);
{$ENDIF}
end;

procedure TCRTransaction.UnEnlistLink(TransactionLink: TCRTransactionLink);
begin
{$IFDEF MSWINDOWS}
  TransactionLink.Connection.UnEnlist(FMTSTrans);
{$ENDIF}
  TransactionLink.Connection.FTransaction := nil;
end;
{$ENDIF}

end.
