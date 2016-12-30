
//////////////////////////////////////////////////
//  DB Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  DB Access
//  Created:            01.07.00
//////////////////////////////////////////////////

{$J+}
{$IFNDEF CLR}

{$I Dac.inc}

unit DBAccess;
{$ENDIF}
interface
uses
  SysUtils, Classes, DB, MemData, MemDS, CRAccess, CRParser, TypInfo, MemUtils,
{$IFDEF VER6P}Variants, SqlTimSt,{$ENDIF}
{$IFDEF MSWINDOWS}
  Windows, Registry,
{$IFDEF CLR}
  ExtCtrls, System.XML,
{$ELSE}
  Win32Timer,
{$ENDIF}
{$ENDIF}
{$IFDEF CLR}
  System.Runtime.InteropServices, System.Text, Contnrs,
{$ELSE}
  CLRClasses, CRXml,
{$ENDIF}
  SyncObjs;

const
  OperationsStackDelta = 50;  

type
  TCustomDAConnection = class;
  TCustomDASQL = class;
  TCustomDADataSet = class;
  TCustomDASQLClass = class of TCustomDASQL;
  TCustomDADataSetClass = class of TCustomDADataSet;
  TCustomDAUpdateSQL = class;
  TMacro = class;
  TMacros = class;
  TCustomConnectDialog = class;
  TConnectDialogClass = class of TCustomConnectDialog;

  TCRConnectionClass = class of TCRConnection;
  TCRCommandClass = class of TCRCommand;
  TCRRecordSetClass = class of TCRRecordSet;

{ EDAError }

  EDAError = class (EDatabaseError)
  protected
    FErrorCode: integer;
    FComponent: TObject;
  public
    constructor Create(ErrorCode: integer; Msg: string);

    property ErrorCode: integer read FErrorCode;
    property Component: TObject read FComponent write FComponent;
  end;

{ TCustomDAConnection }
  TRetryMode = (rmRaise, rmReconnect, rmReconnectExecute);

  TFailOverOperation = record
    Operation: TConnLostCause;
    AllowFailOver: boolean;
  end;
  TOperationsStack = array of TFailOverOperation;// executed operations stack used to track dowm connection lost cause

  TDAConnectionErrorEvent = procedure (Sender: TObject; E: EDAError; var Fail: boolean) of object;
  TConnectionLostEvent = procedure (Sender: TObject; Component: TComponent; ConnLostCause: TConnLostCause;
                           var RetryMode: TRetryMode) of object;

  TDAConnectionOptions = class (TPersistent)
  protected
    FKeepDesignConnected: boolean;
    FOwner: TCustomDAConnection;
    FDisconnectedMode: boolean;
    FLocalFailover: boolean;

    procedure SetDisconnectedMode(Value: boolean); virtual;
    procedure AssignTo(Dest: TPersistent); override;

  public
    constructor Create(Owner: TCustomDAConnection);

    property DisconnectedMode: boolean read FDisconnectedMode write SetDisconnectedMode default False;
    property KeepDesignConnected: boolean read FKeepDesignConnected write FKeepDesignConnected default True;
    property LocalFailover: boolean read FLocalFailover write FLocalFailover default False;
  end;

  TPoolingOptions = class(TPersistent)
  protected
    FOwner: TCustomDAConnection;
    FMaxPoolSize: integer;
    FMinPoolSize: integer;
    FConnectionLifetime: integer;
    FValidate: boolean;

    procedure AssignTo(Dest: TPersistent); override;

  public
    constructor Create(Owner: TCustomDAConnection); virtual;

  published
    property MaxPoolSize: integer read FMaxPoolSize write FMaxPoolSize default 100;
    property MinPoolSize: integer read FMinPoolSize write FMinPoolSize default 0;
    property ConnectionLifetime: integer read FConnectionLifetime write FConnectionLifetime default 0;
    property Validate: boolean read FValidate write FValidate default False;
  end;

  TCustomDAConnection = class (TCustomConnection)
  private
    FUsername: string;
    FAutoCommit: boolean;
    FInProcessError: boolean;
    FConnectDialog: TCustomConnectDialog;

    FOnError: TDAConnectionErrorEvent;
    FConvertEOL: boolean;

    FOptions: TDAConnectionOptions;
    FPoolingOptions: TPoolingOptions;
    FPooling: boolean;
    FOnConnectionLost: TConnectionLostEvent;
    hRegisterClient: TCriticalSection;

    procedure ClearRefs;

    procedure SetUsername(const Value: string);
    procedure SetPassword(const Value: string);
    procedure SetAutoCommit(Value: boolean);
    procedure SetConnectDialog(Value: TCustomConnectDialog);
    procedure SetPooling(Value: boolean);

    procedure DoAfterConnect;
  protected
    FConnectCount: integer;
    FSQLs: TDAList;
    FIConnection: TCRConnection;
    FStreamedConnected: boolean;
    FServer: string;
    FPassword: string;
    FTransactionID: string;
    FShouldShowPrompt: boolean; //Disconnect mode flag that allow to avoid unnecessary Login porompt showing
    FOperationsStack: TOperationsStack ;  //FailOver support
    FOperationsStackLen: integer;

    function GetTransactionID: string; virtual;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    function GetIConnectionClass: TCRConnectionClass; virtual;
    function GetICommandClass: TCRCommandClass; virtual;
    function GetIRecordSetClass: TCRRecordSetClass; virtual;

    procedure CreateIConnection; virtual;
    function CreateICommand: TCRCommand;
    function CreateIRecordSet: TCRRecordSet;
    procedure FreeIConnection;
    procedure SetIConnection(Value: TCRConnection); virtual;

    procedure Loaded; override;

    procedure RegisterClient(Client: TObject; Event: TConnectChangeEvent = nil); override;
    procedure UnRegisterClient(Client: TObject); override;

    function SQLMonitorClass: TClass; virtual; // TDASQLMonitorClass
    function ConnectDialogClass: TConnectDialogClass; virtual;

    procedure DoConnect; override;
    procedure DoDisconnect; override;
    function CommitOnDisconnect: boolean; virtual;
    procedure InternalConnect; virtual;
    procedure InternalDisconnect; virtual;

    function IsConnectedStored: boolean; virtual;
    function NeedPrompt: boolean; virtual;
  //Operations stack functionality
    function PushOperation(Operation: TConnLostCause; AllowFailOver: boolean = true): integer; virtual;
    function PopOperation: TConnLostCause; virtual;

    function IsFatalError(E: EDAError): boolean; virtual;
    procedure ResetOnFatalError; virtual;
    procedure RestoreAfterFailOver; virtual;
    function DetectConnLostCause(Component: TObject): TConnLostCause; virtual;
    procedure DoError(E: Exception; var Fail, Reconnect, Reexecute: boolean; ReconnectAttempt: integer;
      var ConnLostCause: TConnLostCause); virtual;
    function IsKeyViolation(E: EDAError): boolean; virtual;

    procedure AssignTo(Dest: TPersistent); override;

    function GetConnected: boolean; override;
    procedure SetConnected(Value: boolean); override;
    function GetConnectString: string; virtual;
    procedure SetConnectString(Value: string); virtual;
    procedure SetServer(const Value: string); virtual;

    procedure SuppressAutoCommit;
    procedure RestoreAutoCommit;
    function GetInTransaction: boolean; virtual;
    procedure SetConvertEOL(Value: boolean);
    
  { Transaction control }
    procedure InternalStartTransaction; virtual;

    function CreateOptions: TDAConnectionOptions; virtual;
    procedure SetOptions(Value: TDAConnectionOptions);
    function CreatePoolingOptions: TPoolingOptions; virtual;
    procedure SetPoolingOptions(Value: TPoolingOptions);

    function IsCaseSensitive: boolean; virtual;

    property AutoCommit: boolean read FAutoCommit write SetAutoCommit default True;
    property ConnectString: string read GetConnectString write SetConnectString stored False;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;

    procedure Connect;
    procedure Disconnect;
    procedure PerformConnect(Retry: boolean = False);

    function ExecSQL(Text: string; const Params: array of variant): variant; virtual; abstract;

    procedure GetTableNames(List: TStrings); virtual;
    procedure GetDatabaseNames(List: TStrings); virtual;
    procedure GetStoredProcNames(List: TStrings); virtual;

  { Transaction control }
    procedure StartTransaction; virtual;
    procedure Commit; virtual;
    procedure Rollback; virtual;

    procedure ApplyUpdates; overload; virtual;
    procedure ApplyUpdates(DataSets: array of TCustomDADataSet); overload; virtual;

    function CreateDataSet: TCustomDADataSet; virtual;
    function CreateSQL: TCustomDASQL; virtual;

    procedure RemoveFromPool;
    procedure MonitorMessage(const Msg: string);

    property Username: string read FUsername write SetUsername;
    property Password: string read FPassword write SetPassword;
    property Server: string read FServer write SetServer;
    property InTransaction: boolean read GetInTransaction;
    property ConnectDialog: TCustomConnectDialog read FConnectDialog write SetConnectDialog;

    property OnError: TDAConnectionErrorEvent read FOnError write FOnError;
    property OnConnectionLost: TConnectionLostEvent read FOnConnectionLost write FOnConnectionLost;

    property LoginPrompt default True;
    property ConvertEOL: boolean read FConvertEOL write SetConvertEOL default False;

    property Options: TDAConnectionOptions read FOptions write SetOptions;
    property PoolingOptions: TPoolingOptions read FPoolingOptions write SetPoolingOptions;
    property Pooling: boolean read FPooling write SetPooling default False;

  end;

{ TDAParam }
  TDAParams = class;

  TDAParamInfoClass = class of TDAParamInfo;
  TDAParamInfo = class(TCollectionItem)
  protected
    FField: TField;
    FOld: boolean;
    FParamIndex: integer;
  public
    property Field: TField read FField write FField;
    property Old: boolean read FOld write FOld;
    property ParamIndex: integer read FParamIndex write FParamIndex;
  end;

  TDAParamsInfo = class(TCollection)
  protected
    function GetItem(Index: Integer): TDAParamInfo;
    procedure SetItem(Index: Integer; Value: TDAParamInfo);
  public
    property Items[Index: Integer]: TDAParamInfo read GetItem write SetItem; default;
  end;

  TDAParam = class (TParam)
  private
    FSize: integer;

    function IsDataTypeStored: boolean;
    function IsValueStored: boolean;

    procedure SetParamObject(Value: TSharedObject);

  protected
    FParamObject: TSharedObject;

    function IsObjectDataType(DataType: TFieldType): boolean; overload; virtual;
    function IsObjectDataType: boolean; overload;
    function IsBlobDataType: boolean; virtual;
    function GetDataType: TFieldType; virtual;
    procedure SetDataType(Value: TFieldType); virtual;

    function GetSize: integer; virtual;
    procedure SetSize(Value: integer); virtual;

    function GetAsString: string; virtual;
    procedure SetAsString(Value: string); virtual;

    function GetAsWideString: WideString; virtual;
    procedure SetAsWideString(Value: WideString); virtual;

    function GetAsInteger: integer; virtual;
    procedure SetAsInteger(Value: integer); virtual;

    function GetAsFloat: double; virtual;
    procedure SetAsFloat(Value: double); virtual;

    procedure SetAsBlob(Value: TBlobData); virtual;

    procedure SetAsMemo(Value: string); virtual;

    function GetAsBlobRef: TBlob; virtual;
    procedure SetAsBlobRef(const Value: TBlob); virtual;

    function GetAsMemoRef: TBlob; virtual;
    procedure SetAsMemoRef(const Value: TBlob); virtual;

    function GetAsVariant: variant; virtual;
    procedure SetAsVariant(const Value: variant); virtual;

  {$IFDEF VER6P}
    function GetAsSQLTimeStamp: TSQLTimeStamp; virtual;
    procedure SetAsSQLTimeStamp(const Value: TSQLTimeStamp); virtual;
  {$ENDIF}

    procedure SetText(const Value: string); virtual;

    function GetIsNull: boolean; virtual;

    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadExtDataType(Reader: TReader);
    procedure WriteExtDataType(Writer: TWriter);

    procedure CreateObject; virtual;
    procedure FreeObject; virtual;

    procedure AssignParam(Param: TParam);
    procedure AssignTo(Dest: TPersistent); override;

    property ParamObject: TSharedObject read FParamObject write SetParamObject;

  public
    destructor Destroy; override;

    procedure Clear; virtual;

    procedure Assign(Source: TPersistent); override;
    procedure AssignField(Field: TField);
    procedure AssignFieldValue(Field: TField; const Value: Variant); virtual;

    procedure LoadFromFile(const FileName: string; BlobType: TBlobType);
    procedure LoadFromStream(Stream: TStream; BlobType: TBlobType); virtual;
    procedure SetBlobData(Buffer: TBytes; Size: Integer); overload;
    procedure SetBlobData(Buffer: TValueBuffer); overload;

    property AsString: TBlobData read GetAsString write SetAsString;
    property AsWideString: WideString read GetAsWideString write SetAsWideString;
    property AsInteger: integer read GetAsInteger write SetAsInteger;
    property AsFloat: double read GetAsFloat write SetAsFloat;
    property AsBlob: TBlobData read GetAsString write SetAsBlob;
    property AsMemo: string read GetAsString write SetAsMemo;
    property AsBlobRef: TBlob read GetAsBlobRef write SetAsBlobRef;
    property AsMemoRef: TBlob read GetAsMemoRef write SetAsMemoRef;
  {$IFDEF VER6P}
    property AsSQLTimeStamp: TSQLTimeStamp read GetAsSQLTimeStamp write SetAsSQLTimeStamp;
  {$ENDIF}
    property IsNull: boolean read GetIsNull;
    property Text: string read GetAsString write SetText;

  published
    property DataType: TFieldType read GetDataType write SetDataType stored IsDataTypeStored;
    property ParamType default DB.ptUnknown;
    property Size: integer read GetSize write SetSize default 0;
    property Value: variant read GetAsVariant write SetAsVariant stored IsValueStored;
  end;

{ TDAParams }

  TDAParams = class (TParams)
  private
    function GetItem(Index: integer): TDAParam;
    procedure SetItem(Index: integer; Value: TDAParam);

  protected
    FOwner: TPersistent;
    FNeedsUpdateItem: boolean;
    procedure Update(Item: TCollectionItem); override;

  public
    constructor Create(Owner: TPersistent); overload;

    function ParamByName(const Value: string): TDAParam;
    function FindParam(const Value: string): TDAParam;
    function CreateParam(FldType: TFieldType; const ParamName: string;
      ParamType: TParamType): TDAParam;
    property Items[Index: integer]: TDAParam read GetItem write SetItem; default;
  end;

{ TDADetailDataLink }

  TDADetailDataLink = class (TDetailDataLink)
  private
    FDataSet: TCustomDADataSet;

  protected
    procedure ActiveChanged; override;
    procedure RecordChanged(Field: TField); override;
    procedure CheckBrowseMode; override;

    function GetDetailDataSet: TDataSet; override;

  public
    constructor Create(DataSet: TCustomDADataSet);
  end;

{ TDASQLGenerator }

  TFieldArray = array of TField;
  TFieldDescArray = array of TCRFieldDesc;
  TKeyAndDataFields = record
    KeyFieldDescs: TFieldDescArray;
    DataFieldDescs: TFieldDescArray;
  end;

  TStatementType = (stQuery, stInsert, stUpdate, stDelete, stLock, stRefresh,
    stCheck, stCustom, stRefreshQuick, stRefreshCheckDeleted, stBatchUpdate);
  TStatementTypes = set of TStatementType;

  TDASQLGenerator = class
  protected
    FOwner: TCustomDADataSet;

                                    // stInsert                 stUpdate                 stDelete                 stRefresh
    FHeaderSB,                      // INSERT INTO Tbl(         UPDATE Tbl SET           DELETE FROM Tbl WHERE    SELECT
    FFldSB,                         // f1, f2, f3, ...          f1 = :p1, f2 = :p2, ...                           f1, f2, f3, ...
    FMiddleSB,                      // ) VALUES (               WHERE                                             FROM Tbl WHERE
    FFldParamSB,                    // :p1, :p2, :p3, ...
    FCondSB,                        //                          f0 = :p0                 f0 = :p0                 f0 = :p0
    FFooterSB: StringBuilder;       // )
    FOldRecBuf, FNewRecBuf: IntPtr;
    FParams: TDAParams;
    FParamsInfo: TDAParamsInfo;
    FTableInfo: TCRTableInfo;

    procedure Clear; virtual;
    function AssembleSB(const StatementType: TStatementType): string; virtual;
    function Data: TData;
    function OldRecBuf: IntPtr;
    function NewRecBuf: IntPtr;

    function IsBlobDataType(DataType: word): boolean; virtual;
    function IsObjectDataType(DataType: word): boolean; virtual;

    function FieldIsNull(FieldDesc: TCRFieldDesc; OldValue: boolean; Data: TData; OldRecBuf, NewRecBuf: IntPtr): boolean; overload; virtual;
    function FieldIsNull(FieldDesc: TCRFieldDesc; OldValue: boolean): boolean; overload; virtual;

    function FieldModified(FieldDesc: TCRFieldDesc; Data: TData; OldRecBuf, NewRecBuf: IntPtr): boolean; overload; virtual;
    function FieldModified(FieldDesc: TCRFieldDesc): boolean; overload; virtual;

    function GetActualFieldNameEx(FieldDesc: TCRFieldDesc; TableInfo: TCRTableInfo): string; virtual;
    function GetActualFieldName(FieldDesc: TCRFieldDesc; IsRefresh: boolean): string; virtual;

    function IndexedPrefix: string;

    function GenerateIndexName(Name: string): string; virtual;
    function DecodeFieldIndex(FieldName: string): integer; virtual;

    function QuoteName(const AName: string): string;
    function UnQuoteName(AName: string): string;

    function IsSubstituteParamName: boolean; virtual;
    procedure AddParam(SB: StringBuilder; FieldDesc: TFieldDesc;
      const StatementType: TStatementType;
      const ParamType: TParamType;
      Index: integer = -1;
      Old: boolean = False); virtual;

    procedure AddFieldToInsertSQL(FieldDesc: TCRFieldDesc; const Index: integer = -1); virtual;
    procedure AddFieldToUpdateSQL(FieldDesc: TCRFieldDesc;
      const ModifiedFieldsOnly: boolean;
      const Index: integer = -1); virtual;
    procedure AddFieldToRefreshSQL(FieldDesc: TCRFieldDesc); virtual;
    procedure AddFieldToCondition(SB: StringBuilder;
      FieldDesc: TCRFieldDesc;
      const StatementType: TStatementType;
      const ModifiedFieldsOnly: boolean;
      const Index: integer = -1); virtual;

    procedure GenerateInsertSQL(
      const KeyAndDataFields: TKeyAndDataFields;
      const ModifiedFieldsOnly: boolean;
      const Index: integer = -1); virtual;
    procedure GenerateUpdateSQL(
      const KeyAndDataFields: TKeyAndDataFields;
      const ModifiedFieldsOnly: boolean;
      const Index: integer = -1); virtual;
    procedure GenerateDeleteSQL(
      const KeyAndDataFields: TKeyAndDataFields;
      const ModifiedFieldsOnly: boolean;
      const Index: integer = -1); virtual;
    procedure GenerateLockSQL(
      const KeyAndDataFields: TKeyAndDataFields;
      const Index: integer = -1); virtual;
    procedure GenerateRefreshSQLSelectPart(const KeyAndDataFields: TKeyAndDataFields); virtual;
    procedure GenerateRefreshSQLFromPart; virtual;
    procedure GenerateRefreshSQL(
      const KeyAndDataFields: TKeyAndDataFields;
      const ModifiedFieldsOnly: boolean); virtual;
    procedure GenerateRefreshQuickSQL(const KeyAndDataFields: TKeyAndDataFields); virtual;
    procedure GenerateRefreshCheckDeletedSQL(const KeyAndDataFields: TKeyAndDataFields); virtual;

    procedure GenerateConditions(SB: StringBuilder; const StatementType: TStatementType;
      const ModifiedFieldsOnly: boolean;
      const KeyAndDataFields: TKeyAndDataFields;
      const Index: integer = -1); virtual;// Generate WHERE part for UPDATE, DELETE, REFRESH SQLs

    function GetParamInfoClass: TDAParamInfoClass; virtual;
  public
    constructor Create(Owner: TCustomDADataSet);
    destructor Destroy; override;

    // Generate insert, update, delete or refresh SQL statements
    function GenerateSQLforUpdTable(TableInfo: TCRTableInfo;
      const KeyAndDataFields: TKeyAndDataFields;
      const StatementType: TStatementType;
      const ModifiedFieldsOnly: boolean;
      Params: TDAParams;
      const Index: integer = -1): string; virtual;

    function GenerateSQL(const StatementType: TStatementType;
      const ModifiedFieldsOnly: boolean;
      Params: TDAParams;
      const Index: Integer = -1): string; virtual;

    property ParamsInfo: TDAParamsInfo read FParamsInfo;
  end;

{ TCustomDADataSet }

  TRefreshOption = (roAfterInsert, roAfterUpdate, roBeforeEdit);
  TRefreshOptions = set of TRefreshOption;

  TAfterExecuteEvent = procedure (Sender: TObject; Result: boolean) of object;
  TUpdateExecuteEvent = procedure (Sender: TDataSet; StatementTypes: TStatementTypes;
    Params: TDAParams) of object;
  TBeforeFetchEvent = procedure (DataSet: TCustomDADataSet; var Cancel: boolean) of object;
  TAfterFetchEvent = procedure (DataSet: TCustomDADataSet) of object;

  TLocalMDLink = record
    IsNull: boolean;
    Buffer: IntPtr;
    BufferType: integer;
    NativeBuffer: boolean;
    FieldNo: integer;
  end;

  TLocalMDLinks = array of TLocalMDLink;

  TDADataSetOptions = class (TPersistent)
  private
    FSetFieldsReadOnly: boolean;
    FRequiredFields: boolean;
    FStrictUpdate: boolean;
    FNumberRange: boolean;
    FQueryRecCount: boolean;
    FAutoPrepare: boolean;
    FReturnParams: boolean;
    FTrimFixedChar: boolean;
    FTrimVarChar: boolean;
    FLongStrings: boolean;
    FRemoveOnRefresh: boolean;
    FFlatBuffers: boolean;
    FQuoteNames: boolean;
    FDetailDelay: integer;
  {$IFDEF HAVE_COMPRESS}
    FCompressBlobMode: TCompressBlobMode;
  {$ENDIF}
    FFullRefresh: boolean;
    FLocalMasterDetail: boolean;
    FFieldsOrigin: boolean;
    FUpdateBatchSize: integer;
    FUpdateAllFields: boolean;
    FPrepareUpdateSQL: boolean;

    procedure SetRequiredFields(Value: boolean);
    procedure SetNumberRange(Value: boolean);
    procedure SetTrimFixedChar(Value: boolean);
    procedure SetTrimVarChar(Value: boolean);
    procedure SetLongStrings(Value: boolean);
    procedure SetAutoPrepare(Value: boolean);
    procedure SetFlatBuffers(const Value: boolean);
    procedure SetDetailDelay(Value: integer);
  {$IFDEF HAVE_COMPRESS}
    procedure SetCompressBlobMode(Value: TCompressBlobMode);
  {$ENDIF}
    procedure SetLocalMasterDetail(Value: boolean);
    function GetCacheCalcFields: boolean;
    procedure SetCacheCalcFields(Value: boolean);
  protected
    FOwner: TCustomDADataSet;

    procedure AssignTo(Dest: TPersistent); override;

    property FullRefresh: boolean read FFullRefresh write FFullRefresh default False;
    property TrimVarChar: boolean read FTrimVarChar write SetTrimVarChar default False;
    property PrepareUpdateSQL: boolean read FPrepareUpdateSQL write FPrepareUpdateSQL default False;
  public
    constructor Create(Owner: TCustomDADataSet);

    property SetFieldsReadOnly: boolean read FSetFieldsReadOnly write FSetFieldsReadOnly default False;
    property RequiredFields: boolean read FRequiredFields write SetRequiredFields default True;
    property StrictUpdate: boolean read FStrictUpdate write FStrictUpdate default True;
    property NumberRange: boolean read FNumberRange write SetNumberRange default False;
    property QueryRecCount: boolean read FQueryRecCount write FQueryRecCount default False;
    property AutoPrepare: boolean read FAutoPrepare write SetAutoPrepare default False;
    property ReturnParams: boolean read FReturnParams write FReturnParams default False;
    property TrimFixedChar: boolean read FTrimFixedChar write SetTrimFixedChar default True;
    property LongStrings: boolean read FLongStrings write SetLongStrings default True;
    property FlatBuffers: boolean read FFlatBuffers write SetFlatBuffers default False;
    property RemoveOnRefresh: boolean read FRemoveOnRefresh write FRemoveOnRefresh default True;
    property QuoteNames: boolean read FQuoteNames write FQuoteNames default False;
    property DetailDelay: integer read FDetailDelay write SetDetailDelay default 0;
  {$IFDEF HAVE_COMPRESS}
    property CompressBlobMode: TCompressBlobMode read FCompressBlobMode write SetCompressBlobMode default cbNone;
  {$ENDIF}
    property LocalMasterDetail: boolean read FLocalMasterDetail write SetLocalMasterDetail default False;
    property CacheCalcFields: boolean read GetCacheCalcFields write SetCacheCalcFields default False;
    property FieldsOrigin: boolean read FFieldsOrigin write FFieldsOrigin stored False default False;
    property UpdateBatchSize: Integer read FUpdateBatchSize write FUpdateBatchSize default 1;
    property UpdateAllFields: boolean read FUpdateAllFields write FUpdateAllFields default False;
  end;

  TCustomDADataSet = class (TMemDataSet)
  private
    FConnection: TCustomDAConnection;
    FParams: TDAParams; // for easy reference of FCommand.Params
    FMacros: TMacros; // for easy reference of FCommand.Macros
    FFetchRows: integer;
    FDataLink: TDADetailDataLink;
    FDebug: boolean;
    FReadOnly: boolean;
    FUniDirectional: boolean;
    FAutoCommit: boolean;
    FUpdateObject: TCustomDAUpdateSQL;
    FRefreshOptions: TRefreshOptions;
    FOptions: TDADataSetOptions;
    FActiveRecRefresh: boolean; // ActiveBufLevelRecordRefresh
    FBaseSQL: string;
  {$IFDEF MSWINDOWS}
    FDetailRefreshTimer: {$IFDEF CLR}TTimer{$ELSE}TWin32Timer{$ENDIF};
  {$ENDIF}
    FLocalMDLinks: TLocalMDLinks;
    FAfterExecute: TAfterExecuteEvent;

    FBeforeFetch: TBeforeFetchEvent;
    FAfterFetch: TAfterFetchEvent;
    FBeforeUpdateExecute: TUpdateExecuteEvent;
    FAfterUpdateExecute: TUpdateExecuteEvent;

    FFindKeyOptions: TLocateExOptions;

    function GetSQL: TStrings;
    procedure SetSQL(Value: TStrings);
    procedure SetFetchRows(Value: integer);
    procedure SetMasterSource(Value: TDataSource);
    function GetParams: TDAParams;
    procedure SetParams(Value: TDAParams);
    function GetParamCount: word;
    function GetParamCheck: boolean;
    procedure SetParamCheck(Value: boolean);
    function GetMacros: TMacros;
    procedure SetMacros(Value: TMacros);
    function GetMacroCount: word;
    function GetRowsAffected: integer;
    procedure SetUniDirectional(Value: boolean);
    procedure SetAutoCommit(Value: boolean);
    //procedure SetUpdateMode(const Value: TUpdateMode);
    procedure SetUpdateObject(Value: TCustomDAUpdateSQL);
    procedure SetOptions(Value: TDADataSetOptions);
    procedure SetMasterFields(Value: string);
    procedure SetForeignKeyFields(Value: string);
    procedure SaveModifiedSQL(NewSQL: string);
    function GetBaseSQL: string;
  {$IFDEF MSWINDOWS}
    procedure CheckRefreshDetailTimer;
  {$ENDIF}

  {$IFDEF VER5P}
  protected
  { IProviderSupport }
    FOldKeyFields: string; // To PSGetKeyFields after closing table (see SDAC 3034)
    FOldTableName: string; // PSGetTableName must return right value even after DataSet.Close
    procedure PSEndTransaction(Commit: Boolean); override;
    procedure PSExecute; override;
    function PSExecuteStatement(const ASQL: string; AParams: TParams;
      {$IFDEF CLR}var ResultSet: TObject{$ELSE}ResultSet: Pointer = nil{$ENDIF}): Integer; override;
    function PSGetParams: DB.TParams; override;
    function PSGetQuoteChar: string; override;
    function PSGetTableName: string; override;
    function PSInTransaction: Boolean; override;
    function PSIsSQLBased: Boolean; override;
    function PSIsSQLSupported: Boolean; override;
    procedure PSReset; override;
    procedure PSSetParams(AParams: DB.TParams); override;
    procedure PSSetCommandText(const CommandText: string); override;
    procedure PSStartTransaction; override;
    function PSUpdateRecord(UpdateKind: TUpdateKind; Delta: TDataSet): Boolean; override;
    function PSGetDefaultOrder: TIndexDef; override;
    function PreventPSKeyFields(var PSKeyFields: string): boolean; virtual;
    function PSGetKeyFields: string; override;
  {$ENDIF}

  protected
    FRowsAffected: integer;

    FIRecordSet: TCRRecordSet;
    FICommand: TCRCommand;  // for perf
    FCommand: TCustomDASQL;

    FFilterSQL: string;  //CR ODAC (8387) vs (8751)

    FCachedKeyAndDataFields: array [boolean] of TKeyAndDataFields;
    FSQLGenerator: TDASQLGenerator;

    FIdentityField: TField;
    FUpdatingTableInfoIdx: integer;
    FUpdatingTable: string;//Can not delete because FTablesInfo created only on ~open

    FMasterFields: string;
    FDetailFields: string;

    FDesignCreate: boolean;
    FNonBlocking: boolean;
    FLockDebug: boolean; // locking trans debug info
    FUpdateQuery: TComponent;
    FUpdateComponents: array [TStatementType] of TComponent;
    FUpdateSQL: array [TStatementType] of TStrings; // SQLInsert, SQLUpdate etc

    FRecordCount: integer;

    FFetchAll: boolean;
    FFetchCanceled: boolean;

    FLeftQuote: char;
    FRightQuote: char;

    FStreamedOpen: Boolean;

    FBatchSQLs: StringBuilder;
    FBatchParams: TDAParams;
    FBatchStatements: integer;

    function GetFieldObject(Field: TField): TSharedObject; overload;
    function GetFieldObject(FieldDesc: TFieldDesc): TSharedObject; overload;

    function BatchUpdate: boolean; override;
    function CanFlushBatch: boolean; override;
    function PrepareBatch(SQL: string): string; virtual;
    procedure FlushBatch; override;
    procedure ClearBatch;

    function QuoteName(const AName: string): string; virtual;
    function UnQuoteName(AName: string): string; virtual;

    procedure CheckInactive; override;
    procedure CreateIRecordSet; override;
    procedure FreeIRecordSet;
    procedure SetIRecordSet(Value: TData{TRecordSet}); override;
    procedure CheckIRecordSet;

    procedure CreateCommand; virtual;
    procedure FreeCommand;
    procedure SetCommand(Value: TCustomDASQL);

    function CreateOptions: TDADataSetOptions; virtual;

    procedure Loaded; override;

    procedure SetConnection(Value: TCustomDAConnection);
    function UsedConnection: TCustomDAConnection; virtual;
    procedure CheckConnection; virtual;
    procedure BeginConnection(NoConnectCheck: boolean = True); virtual;
    procedure EndConnection; virtual;
    procedure Disconnect; virtual;
    procedure ConnectChange(Sender: TObject; Connecting: boolean); virtual;

  { TablesInfo }
    function GetTablesInfo: TCRTablesInfo;
    procedure SetUpdatingTable(Value: string); virtual;
    procedure InitUpdatingTable;
    procedure DetectIdentityField; virtual;
    function ReadOnlyFieldsEnabled: boolean; virtual;

  { Open/Close }
    procedure SetActive(Value: Boolean); override;
    procedure BeforeOpenCursor(InfoQuery: boolean); virtual;
    procedure OpenCursor(InfoQuery: boolean); override;
    procedure AfterOpenCursor(InfoQuery: boolean); virtual;
    procedure CloseCursor; override;
    function OpenCursorAllowFailOver: boolean; virtual;

    function GetActualFieldName(FieldDesc: TFieldDesc): string; overload;
    function GetActualFieldName(Field: TField): string; overload;
    procedure GetCurrentKeys(out KeyFields: TFieldArray; out Values: variant);
    procedure DataReopen; override;
    procedure InternalRefresh; override;
    procedure InternalRefreshQuick(const CheckDeleted: boolean); virtual;
    procedure InternalExecute; virtual;
    procedure InternalClose; override;

    function GetRecCount: longint; virtual;
    procedure SetRefreshOptions(Value: TRefreshOptions); virtual;
    procedure SetFetchAll(Value: boolean); virtual;
    function SQLAutoGenerated: boolean; virtual;

    procedure BeforeExecute; virtual;
  { Edit }
    function IsNeedEditPreconnect: boolean; virtual;
    function IsNeedInsertPreconnect: boolean; virtual;

    procedure SetReadOnly(Value: boolean); virtual;

    function IsPreconnected : boolean; virtual;
    procedure InternalBeforeEdit; virtual;
    procedure InternalEdit; override;
    procedure InternalInsert; override;
    procedure InternalCancel; override;
    procedure InternalPost; override;
    procedure InternalDeferredPost; override;
    procedure InternalApplyUpdates(AllowFailOver: boolean);

    procedure CreateSQLGenerator; virtual;
    procedure FreeSQLGenerator;
    procedure SetSQLGenerator(Value: TDASQLGenerator);

    function GetUpdateStatement(const StatementType: TStatementType): string; virtual;

    function GetUpdateSQLStatementTypes: TStatementTypes; virtual;
    function GetUpdateSQLIndex(Index: integer): TStrings;
    procedure SetUpdateSQLIndex(Index: integer; Value: TStrings);

    procedure SetFilterSQL(Value: string); virtual; //CR ODAC (8387) vs (8751)
    procedure SetFiltered(Value: boolean); override;

    function PerformAppend: boolean; override;
    function PerformDelete: boolean; override;
    function PerformUpdate: boolean; override;
    procedure InternalRefreshRecord; virtual;

    procedure CheckUpdateQuery(const StatementType: TStatementType); virtual;
    procedure UpdateExecute(const StatementTypes: TStatementTypes); virtual;
    procedure CheckUpdateSQL(const SQL: string; const StatementTypes: TStatementTypes; out ParamsInfo: TDAParamsInfo); virtual;
    function UseParamType: boolean; virtual; //This function indicates ParamType using in PerformSQL
    function FieldByParamName(var ParamName: string; var Old: boolean; var AFieldNo: integer): TField; virtual;
    function PerformSQL(const SQL: string; const StatementTypes: TStatementTypes): boolean; virtual;
    function RefreshAfterInsertAllowed: boolean; virtual;

  { RefreshQuick }
    function IsRefreshQuickField(FieldDesc: TFieldDesc): boolean; virtual;
    procedure SaveMaxRefreshQuickValue(FieldDesc: TFieldDesc; const Value: variant); virtual;

    function IsAutoCommit: boolean; virtual;
    function GetCanModify: boolean; override;

    procedure SetStateFieldValue(State: TDataSetState; Field: TField; const Value: Variant); override; // Need to support int64 fields on PerformSQL in RefreshRecord
    function CanRefreshField(Field: TField): boolean; virtual;
    function NeedReturnParams: boolean; virtual;
    procedure AssignFieldValue(Param: TDAParam; Field: TField; Old: boolean); overload; virtual;
    procedure AssignFieldValue(Param: TDAParam; FieldDesc: TFieldDesc; Old: boolean); overload; virtual;
    procedure GetIdentityField; virtual;
    procedure GetKeyAndDataFields(out KeyAndDataFields: TKeyAndDataFields;
      const ForceUseAllKeyFields: boolean); virtual;
    procedure ClearCachedKeyAndDataFields;

  { Master/Detail }
    procedure RefreshParams;
    function NeedDetailRefresh(Param: TDAParam; FieldValue: TSharedObject): boolean; virtual;
    procedure RefreshDetail(Sender: TObject);
    function SetMasterParams(AParams: TDAParams): boolean;
    function IsConnectedToMaster: boolean;
    procedure RefreshDetailSQL;
    function LocalDetailFilter(RecBuf: IntPtr): boolean;

    procedure AssembleSQL;
    procedure ScanMacros(Sender: TObject = nil); virtual;

    procedure DefineProperties(Filer: TFiler); override;

    procedure AssignTo(Dest: TPersistent); override;

    procedure DoAfterExecute(Result: boolean); virtual;
    procedure DoAfterExecFetch(Result: boolean);
    procedure DoAfterFetchAll(Result: boolean);
    procedure DoAfterScroll; override;
    procedure DoOnBeforeFetch(out Cancel: boolean); virtual;
    procedure DoOnAfterFetch; virtual;
    procedure DoOnDataChanged;
    procedure DoOnNewRecord; override;

    function GetDataSource: TDataSource; override;
    function GetRecordCount: integer; override;
    function GetIsQuery: boolean; virtual;

  { Before / After UpdateExecute }
    function AssignedBeforeUpdateExecute: boolean; virtual;
    procedure DoBeforeUpdateExecute(Sender: TDataSet; StatementTypes: TStatementTypes;
      Params: TDAParams); virtual;
    function AssignedAfterUpdateExecute: boolean; virtual;
    procedure DoAfterUpdateExecute(Sender: TDataSet; StatementTypes: TStatementTypes;
      Params: TDAParams); virtual;

  { KeySequence }
    procedure InternalOpen; override;

  { SQL Modifications }
    function SQLAddWhere(SQLText, Condition: string): string; virtual;
    function SQLDeleteWhere(SQLText: string): string; virtual;
    function SQLGetWhere(SQLText: string): string; virtual;
    function SQLSetOrderBy(SQLText: string; Fields: string): string; virtual;
    function SQLGetOrderBy(SQLText: string): string; virtual;

    function GetFinalSQL: string; virtual;

   { TablesInfo }
    property TablesInfo: TCRTablesInfo read GetTablesInfo;
    property IdentityField: TField read FIdentityField;
    property UpdatingTableInfoIdx: integer read FUpdatingTableInfoIdx;
    property UpdatingTable: string read FUpdatingTable write SetUpdatingTable; // Does not need for public use

  { XML }
    procedure WriteFieldXMLAttributeType(Field: TField; FieldDesc: TFieldDesc; const FieldAlias: string;
      XMLWriter: XMLTextWriter); override;

    property AutoCommit: boolean read FAutoCommit write SetAutoCommit default True;

    property UpdateObject: TCustomDAUpdateSQL read FUpdateObject write SetUpdateObject;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;

  { Open/Close }
    procedure Prepare; override;
    procedure UnPrepare; override;

    procedure Execute; virtual;
    function Executing: boolean;
    function Fetching: boolean;
    function FetchingAll: boolean;
    function Fetched: boolean; virtual;

    procedure Resync(Mode: TResyncMode); override;

    procedure GetDetailLinkFields(MasterFields, DetailFields: {$IFDEF CLR}TObjectList{$ELSE}TList{$ENDIF}); override;

    {for BDE compatibility}
    function FindKey(const KeyValues: array of const): Boolean;
    procedure FindNearest(const KeyValues: array of const);
    procedure GotoCurrent(DataSet: TCustomDADataSet);

    function CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream; override;

  { Edit }
    procedure ApplyUpdates; override;

    property SQLInsert: TStrings index stInsert read GetUpdateSQLIndex write SetUpdateSQLIndex;
    property SQLDelete: TStrings index stDelete read GetUpdateSQLIndex write SetUpdateSQLIndex;
    property SQLUpdate: TStrings index stUpdate read GetUpdateSQLIndex write SetUpdateSQLIndex;
    property SQLRefresh: TStrings index stRefresh read GetUpdateSQLIndex write SetUpdateSQLIndex;
    
    procedure RefreshRecord;
    //procedure Lock;
    //procedure Unlock;

    function FindParam(const Value: string): TDAParam;
    function ParamByName(const Value: string): TDAParam;

    function FindMacro(const Value: string): TMacro;
    function MacroByName(const Value: string): TMacro;

  { SQL Modifications }
    procedure SaveSQL;
    procedure RestoreSQL;
    function SQLSaved: boolean;

    procedure AddWhere(Condition: string);
    procedure DeleteWhere;
    procedure SetOrderBy(Fields: string);
    function GetOrderBy: string;

  { Additional data types }
    function GetField(FieldDesc: TFieldDesc): TField;
    function GetDataType(const FieldName: string): integer; virtual;
    function GetFieldDesc(const FieldName: string): TFieldDesc; overload;
    function GetFieldDesc(const FieldNo: integer): TFieldDesc; overload; virtual;
    function GetFieldPrecision(const FieldName: string): integer;
    function GetFieldScale(const FieldName: string): integer;
    function GetFieldObject(const FieldName: string): TSharedObject; overload;

    property Connection: TCustomDAConnection read FConnection write SetConnection;
    property ParamCheck: boolean read GetParamCheck write SetParamCheck default True; // before SQL
    property SQL: TStrings read GetSQL write SetSQL;
    property FetchRows: integer read FFetchRows write SetFetchRows default 25;
    property FetchAll: boolean read FFetchAll write SetFetchAll default False;
    property Debug: boolean read FDebug write FDebug default False;
    property MasterSource: TDataSource read GetDataSource write SetMasterSource;
    property Params: TDAParams read GetParams write SetParams stored False;
    property ParamCount: word read GetParamCount;
    property Macros: TMacros read GetMacros write SetMacros stored False;
    property MacroCount: word read GetMacroCount;
    property UniDirectional: boolean read FUniDirectional write SetUniDirectional default False;
    property ReadOnly: boolean read FReadOnly write SetReadOnly default False;
    property RowsAffected: integer read GetRowsAffected;
    property IsQuery: boolean read GetIsQuery;
    property RefreshOptions: TRefreshOptions read FRefreshOptions write SetRefreshOptions default [];
    property Options: TDADataSetOptions read FOptions write SetOptions;
    property BaseSQL: string read GetBaseSQL;
    property FinalSQL: string read GetFinalSQL;
    property FilterSQL: string read FFilterSQL write SetFilterSQL;
    property MasterFields: string read FMasterFields write SetMasterFields;
    property DetailFields: string read FDetailFields write SetForeignKeyFields;  // ForeignKeyFields

    property AfterExecute: TAfterExecuteEvent read FAfterExecute write FAfterExecute;
    property BeforeUpdateExecute: TUpdateExecuteEvent read FBeforeUpdateExecute write FBeforeUpdateExecute;
    property AfterUpdateExecute: TUpdateExecuteEvent read FAfterUpdateExecute write FAfterUpdateExecute;
    property BeforeFetch: TBeforeFetchEvent read FBeforeFetch write FBeforeFetch;
    property AfterFetch: TAfterFetchEvent read FAfterFetch write FAfterFetch;
  end;

{ TCustomDASQL }

  TCustomDASQL = class (TComponent)
  private
    FConnection: TCustomDAConnection;
    FSQL: TStrings;
    FParams: TDAParams;
    FParamCheck: boolean;
    FMacros: TMacros;
    FDebug: boolean;
    FChangeCursor: boolean;

    FAfterExecute: TAfterExecuteEvent;
    {FOnDisconnect: TNotifyEvent;
    FGetFinalSQL: TGetFinalSQLEvent;
    FOnScanMacros: TNotifyEvent;}

    procedure SetSQL(Value: TStrings);
    function GetPrepared: boolean;
    procedure SetPrepared(Value: boolean);
    procedure SetParams(Value: TDAParams);
    function GetParamCount: word;
    procedure SetParamCheck(Value: boolean);
    function GetParamValues(ParamName: string): variant;
    procedure SetParamValues(ParamName: string; Value: variant);
    procedure SetMacros(Value: TMacros);
    function GetMacroCount: word;
    function GetRowsAffected: integer;

  protected
    FAutoCommit: boolean;
    FICommand: TCRCommand;
    FDataSet: TCustomDADataSet; // dataset that owns
    FDesignCreate: boolean;  // for design-time only
    FNonBlocking: boolean;
    FLockDebug, FLockAssembleSQL, FLockMacros: boolean; // locking trans debug info
    FNativeSQL: string;

    procedure CreateICommand; virtual;
    procedure FreeICommand;
    procedure SetICommand(Value: TCRCommand); virtual;
    procedure CheckICommand;

    function CreateParamsObject: TDAParams; virtual;

    procedure Loaded; override;

    procedure SetAutoCommit(Value: boolean);
    procedure SetConnection(Value: TCustomDAConnection);
    function UsedConnection: TCustomDAConnection; virtual;
    procedure CheckConnection; virtual;
    procedure BeginConnection(NoConnectCheck: boolean = True); virtual;
    procedure EndConnection; virtual;
    procedure Disconnect; virtual;
    procedure ConnectChange(Sender: TObject; Connecting: boolean); virtual;

    procedure InternalPrepare; virtual;
    procedure InternalUnPrepare; virtual;
    procedure InternalExecute(Iters: integer); virtual;

    procedure DoAfterExecute(Result: boolean);

    /// Parse SQL and replace ':ParamName' by '?'
    /// Params may be nil
    function ParseSQL(const SQL: string; Params: TDAParams; RenamePrefix: string = ''): string; overload; virtual;
    function ParseSQL(Params: TDAParams): string; overload;
    procedure ParseSQLParam(ParsedSQL: StringBuilder; Parser: TParser; Params: TDAParams; const LeftQuote, RightQuote: char; RenamePrefix: string); virtual;
    function CreateParser(const Text: string): TParser; virtual;

    procedure SQLChanged(Sender: TObject); virtual;
    procedure ScanMacros; virtual;
    function GetFinalSQL: string; virtual;
    procedure AssembleSQL; virtual;

    procedure CreateParams; virtual;
    procedure WriteParams(WriteValue: boolean = True); virtual;
    procedure ReadParams; virtual;

    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadParamData(Reader: TReader);
    procedure WriteParamData(Writer: TWriter);
    procedure ReadMacroData(Reader: TReader);
    procedure WriteMacroData(Writer: TWriter);

    procedure AssignTo(Dest: TPersistent); override;

    property AutoCommit: boolean read FAutoCommit write SetAutoCommit default False;

  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;

    procedure Prepare; virtual;
    procedure UnPrepare; virtual;

    procedure Execute; overload; virtual;
    procedure Execute(Iters: integer); overload; virtual;

    function Executing: boolean;
    function WaitExecuting(TimeOut: integer = 0): boolean;

    function FindParam(const Value: string): TDAParam;
    function ParamByName(const Value: string): TDAParam;

    function FindMacro(const Value: string): TMacro;
    function MacroByName(const Value: string): TMacro;

    property Connection: TCustomDAConnection read FConnection write SetConnection;
    property ParamCheck: boolean read FParamCheck write SetParamCheck default True; // before SQL
    property SQL: TStrings read FSQL write SetSQL;
    property Prepared: boolean read GetPrepared write SetPrepared;
    property Params: TDAParams read FParams write SetParams stored False;
    property ParamCount: word read GetParamCount;
    property ParamValues[ParamName: string]: variant read GetParamValues write SetParamValues; default;
    property Macros: TMacros read FMacros write SetMacros stored False;
    property MacroCount: word read GetMacroCount;
    property Debug: boolean read FDebug write FDebug default False;
    property ChangeCursor: boolean read FChangeCursor write FChangeCursor;
    property RowsAffected: integer read GetRowsAffected;
    property FinalSQL: string read GetFinalSQL;

    property AfterExecute: TAfterExecuteEvent read FAfterExecute write FAfterExecute;
  end;

{ TCustomDAUpdateSQL }

  TCustomDAUpdateSQL = class (TComponent)
  private
    FDataSet: TCustomDADataSet;
    FSQLText: array [TStatementType] of TStrings;

    FUpdateObject: array [TStatementType] of TComponent;

  protected
    FDesignCreate: boolean;  // for design-time only

    // get/set FSQLText by TStatementType
    function GetSQLIndex(Index: integer): TStrings;
    procedure SetSQLIndex(Index: integer; Value: TStrings);

    // get/set FSQLText by TUpdateKind
    function GetSQL(UpdateKind: TUpdateKind): TStrings; virtual;
    procedure SetSQL(UpdateKind: TUpdateKind; Value: TStrings);

    // get/set FUpdateObject by TStatementType
    function GetObjectIndex(Index: integer): TComponent;
    procedure SetObjectIndex(Index: integer; Value: TComponent);

    function GetDataSet: TCustomDADataSet; virtual;
    procedure SetDataSet(DataSet: TCustomDADataSet); virtual;
    procedure Loaded; override;
    procedure AssignTo(Dest: TPersistent); override;

    function DataSetClass: TCustomDADataSetClass; virtual;
    function SQLClass: TCustomDASQLClass; virtual;
    procedure CheckUpdateComponent(Component: TComponent); overload;
    procedure CheckUpdateComponent(Component: TComponent; NewDataset: TCustomDADataset); overload;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    procedure Apply(UpdateKind: TUpdateKind); virtual;
    procedure ExecSQL(UpdateKind: TUpdateKind);
    property DataSet: TCustomDADataSet read GetDataSet write SetDataSet;
    property SQL[UpdateKind: TUpdateKind]: TStrings read GetSQL write SetSQL;

  published
    property InsertSQL: TStrings index stInsert read GetSQLIndex write SetSQLIndex;
    property DeleteSQL: TStrings index stDelete read GetSQLIndex write SetSQLIndex;
    property ModifySQL: TStrings index stUpdate read GetSQLIndex write SetSQLIndex;
    property RefreshSQL: TStrings index stRefresh read GetSQLIndex write SetSQLIndex;

    property InsertObject: TComponent index stInsert read GetObjectIndex write SetObjectIndex;
    property DeleteObject: TComponent index stDelete read GetObjectIndex write SetObjectIndex;
    property ModifyObject: TComponent index stUpdate read GetObjectIndex write SetObjectIndex;
    property RefreshObject: TComponent index stRefresh read GetObjectIndex write SetObjectIndex;
  end;

{ TMacro }

  TMacro = class (TCollectionItem)
  private
    FName: string;
    FValue: string;
    FActive: boolean;
    //FOwner: TComponent;

    procedure SetValue(Value: string);
    procedure SetActive(Value: boolean);

    function GetAsDateTime: TDateTime;
    procedure SetAsDateTime(Value: TDateTime);
    function GetAsFloat: double;
    procedure SetAsFloat(Value: double);
    function GetAsInteger: integer;
    procedure SetAsInteger(Value: integer);
    function GetAsString: string;
    procedure SetAsString(Value: string);

  protected
    procedure AssignTo(Dest: TPersistent); override;

    function IsEqual(Value: TMacro): boolean;

    function GetDisplayName: string; override;

  public
    constructor Create(Collection: TCollection); override;

    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
    property AsFloat: double read GetAsFloat write SetAsFloat;
    property AsInteger: integer read GetAsInteger write SetAsInteger;
    property AsString: string read GetAsString write SetAsString;

  published
    property Name: string read FName write FName;
    property Value: string read FValue write SetValue;
    property Active: boolean read FActive write SetActive default True;
  end;

{ TMacros }

  TMacros = class (TCollection)
  private
    FOwner: TPersistent;

    procedure ReadBinaryData(Stream: TStream);
    //procedure WriteBinaryData(Stream: TStream);

    function GetItem(Index: integer): TMacro;
    procedure SetItem(Index: integer; Value: TMacro);
    function GetUpdateCount: integer;

  protected
    FParserClass: TParserClass;
      
    procedure AssignTo(Dest: TPersistent); override;

    procedure DefineProperties(Filer: TFiler); override;

    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;

    function GetMacroValue(Macro: TMacro): string; virtual;

    property UpdateCount: integer read GetUpdateCount;

  public
    constructor Create(Owner: TPersistent);

    procedure Scan(SQL: string); // ParseSQL
    procedure AssignValues(Value: TMacros);
    function IsEqual(Value: TMacros): boolean;

    function FindMacro(const Value: string): TMacro;
    function MacroByName(const Value: string): TMacro;

    procedure Expand(var SQL: string);

    procedure SetParserClass(Value: TParserClass);

    property Items[Index: integer]: TMacro read GetItem write SetItem; default;
  end;

{ TCustomConnectDialog }

  TLabelSet = (lsCustom, lsEnglish, lsFrench, lsGerman, lsItalian, lsPolish,
    lsPortuguese, lsRussian, lsSpanish);

  TCustomConnectDialog = class(TComponent)
  private
    FConnection: TCustomDAConnection;
    FRetries: word;
    FDialogClass: string;
    FSavePassword: boolean;
    FStoreLogInfo: boolean;

    FLabelSet: TLabelSet;
    FCaption: string;
    FUsernameLabel: string;
    FPasswordLabel: string;
    FServerLabel: string;
    FConnectButton: string;
    FCancelButton: string;

    procedure SetCaption(Value: string);
    procedure SetUsernameLabel(Value: string);
    procedure SetPasswordLabel(Value: string);
    procedure SetServerLabel(Value: string);
    procedure SetConnectButton(Value: string);
    procedure SetCancelButton(Value: string);

  protected
  {$IFDEF WIN32}
    function GetString(Id: integer): string;
  {$ENDIF}
    procedure SetLabelSet(Value: TLabelSet); virtual;
    
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    function DefDialogClass: TClass; virtual;
    function GetKeyPath: string; virtual;
    function GetServerStoreName: string; virtual;
  {$IFDEF MSWINDOWS}
    procedure SaveServerListToRegistry;
    procedure SaveInfoToRegistry(Registry: TRegistry); virtual;
    procedure LoadInfoFromRegistry(Registry: TRegistry); virtual;
  {$ENDIF}
    //class function AcceptBlankPassword: boolean; virtual;

  public
    constructor Create(Owner: TComponent); override;

    function Execute: boolean; virtual;

    procedure GetServerList(List: TStrings); virtual;

    property Connection: TCustomDAConnection read FConnection;

    property Retries: word read FRetries write FRetries default 3;
    property SavePassword: boolean read FSavePassword write FSavePassword default False;
    property StoreLogInfo: boolean read FStoreLogInfo write FStoreLogInfo default True;

    property DialogClass: string read FDialogClass write FDialogClass;

    property Caption: string read FCaption write SetCaption;
    property UsernameLabel: string read FUsernameLabel write SetUsernameLabel;
    property PasswordLabel: string read FPasswordLabel write SetPasswordLabel;
    property ServerLabel: string read FServerLabel write SetServerLabel;
    property ConnectButton: string read FConnectButton write SetConnectButton;
    property CancelButton: string read FCancelButton write SetCancelButton;

    property LabelSet: TLabelSet read FLabelSet write SetLabelSet default lsEnglish;
  end;

  TTableInfo = record
    Name: string;
    Alias: string;
  end;
  TTablesInfo = array of TTableInfo;

{$IFDEF MSWINDOWS}

{ TCRNetManager }

  TCRServiceStatus = (ssStopped, ssStartPending, ssStopPending, ssRunning, ssContinuePending, ssPausePending, ssPaused); // equal to TCurrentStatus from SvcMgr

  TCRServiceInfo = record
    ServiceName, DisplayName: string;
    Status: TCRServiceStatus;
  end;

  TCRServicesInfo = array of TCRServiceInfo;
  TCRServiceNamesThread = class;
  TCRServicesThread = class(TThread)
  private
    FList: TStrings;
    FKeywords: string;
  protected
    property Terminated;
    procedure Execute; override;
  public
    constructor Create(List: TStrings; const Keywords: string);
  end;

  TCRServiceNamesThread = class(TThread)
  protected
    FKeywords: string;
    FServices: TCRServicesThread;
    FServer: string;
    FServiceNames: TCRServicesInfo;
    procedure Execute; override;
  public
    constructor Create(const Server: string; Services: TCRServicesThread; const Keywords: string);
  end;

  SC_HANDLE = THandle;

  TCRNetManager = class
  protected
    FServicesCS: TCriticalSection;
    FCachedServerList: TStringList;
    FLastTickCount: LongWord;

    class procedure ServiceManagerOpen(const Server: string; const ReadOnly: boolean; out sch: SC_HANDLE);
    class procedure ServiceManagerClose(const sch: SC_HANDLE);
    class procedure ServiceOpen(const Server: string; const ServiceName: string; const ReadOnly: boolean; out sch: SC_HANDLE; out sh: SC_HANDLE);
    class procedure ServiceClose(const sch: SC_HANDLE; const sh: SC_HANDLE);

    procedure ClearCachedServerList;
    procedure AddToCachedServerList(const Keywords: string; const Server: string);
  public
    constructor Create;
    destructor Destroy; override;

    // Service Control
    class function GetServiceNames(const Server: string): TCRServicesInfo;
    class function GetServiceStatus(const Server: string; const ServiceName: string): TCRServiceStatus;
    class procedure ServiceStart(const Server: string; const ServiceName: string; ParamStr: string = '');
    class procedure ServiceStop(const Server: string; const ServiceName: string);

    // Net control
    class procedure GetServerList(List: TStrings); overload;
    procedure GetServerList(List: TStrings; const Keywords: string; const Timeout: Longword = 1; const CacheTimeout: Longword = 120); overload;
  end;

var
  CRNetManager: TCRNetManager;

type
{$ENDIF}

  TDADataSetUtils = class
  protected
    FCount: integer;
    FDataSet: TCustomDADataSet;

    FOldActive: boolean;
    FOldDebug: boolean;
    FOldFetchAll: boolean;
    FOldFetchRows: integer;

  public
    procedure QuickOpen(DataSet: TCustomDADataSet; Refresh: boolean = False); virtual;
    procedure Restore(RestoreActive: boolean = True); virtual;
    procedure QuickOpenAndRestore(DataSet: TCustomDADataSet; Refresh: boolean = False);
  end;

{ TCRDataSource }

  TCRDataSource = class (TDataSource)
  protected
    FDesignCreate: boolean;

    procedure Loaded; override;
    procedure AssignTo(Dest: TPersistent); override;

  public
    constructor Create(Owner: TComponent); override;
  end;

  TDBAccessUtils = class
  public
    class function IsKeyViolation(Obj: TCustomDAConnection; E: EDAError): boolean;
    class function IsObjectDataType(Obj: TDAParam; DataType: TFieldType): boolean;

    class procedure CheckConnection(Obj: TCustomDADataSet); overload;
    class procedure CheckConnection(Obj: TCustomDASQL); overload;
    class function UsedConnection(Obj: TCustomDADataSet): TCustomDAConnection; overload;
    class function UsedConnection(Obj: TCustomDASQL): TCustomDAConnection; overload;
    class procedure SetAutoCommit(Obj: TComponent; Value: boolean);
    class function GetAutoCommit(Obj: TComponent): boolean;
    class procedure SetDesignCreate(Obj: TCustomDADataSet; Value: boolean); overload;
    class function GetDesignCreate(Obj: TCustomDADataSet): boolean; overload;
    class procedure SetDesignCreate(Obj: TCustomDASQL; Value: boolean); overload;
    class function GetDesignCreate(Obj: TCustomDASQL): boolean; overload;
    class procedure SetDesignCreate(Obj: TCustomDAUpdateSQL; Value: boolean); overload;
    class function GetDesignCreate(Obj: TCustomDAUpdateSQL): boolean; overload;
    class procedure SetDesignCreate(Obj: TCRDataSource; Value: boolean); overload;
    class function GetDesignCreate(Obj: TCRDataSource): boolean; overload;
    class function CreateIRecordSet(Obj: TCustomDAConnection): TCRRecordSet;
    class function GetIConnection(Obj: TCustomDAConnection): TCRConnection;
    class function GetUpdateQuery(Obj: TCustomDADataSet): TComponent;
    class function GetTablesInfo(Obj: TCustomDADataSet): TCRTablesInfo;
    class function GetUpdatingTable(Obj: TCustomDADataSet): string;
    class procedure SetUpdatingTable(Obj: TCustomDADataSet; Value: string);
    class function GetUpdatingTableIdx(Obj: TCustomDADataSet): integer;
    class procedure SetUpdatingTableIdx(Obj: TCustomDADataSet; Value: integer);
    class procedure InternalConnect(Obj: TCustomDAConnection);
    class procedure InternalDisconnect(Obj: TCustomDAConnection);
    class procedure SuppressAutoCommit(Obj: TCustomDAConnection);
    class procedure RestoreAutoCommit(Obj: TCustomDAConnection);

    class procedure Disconnect(Obj: TCustomDASQL);

    class function SQLGenerator(Obj: TCustomDADataSet): TDASQLGenerator;
    class function GetSQLs(Obj: TCustomDAConnection): TDAList;

    class procedure GetKeyAndDataFields(
      Obj: TCustomDADataSet;
      out KeyAndDataFields: TKeyAndDataFields;
      const ForceUseAllKeyFields: boolean);

    class function GetLockDebug(Obj: TComponent): boolean;
    class procedure SetLockDebug(Obj: TComponent; Value: boolean);
    class function FOwner(Obj: TDAConnectionOptions): TCustomDAConnection; overload;
    class function FOwner(Obj: TDADataSetOptions): TCustomDADataSet; overload;
    class function SQLMonitorClass(Obj: TCustomDAConnection): TClass;

    class function QuoteName(Obj: TCustomDADataSet; const AName: string): string;
    class function UnQuoteName(Obj: TCustomDADataSet; AName: string): string;

    class procedure RegisterClient(Obj: TCustomDAConnection; Client: TObject; Event: TConnectChangeEvent = nil);
    class procedure UnRegisterClient(Obj: TCustomDAConnection; Client: TObject);

    class function GetIdentityField(Obj: TCustomDADataSet): TField;

    class function GetSQL(Obj: TComponent): TStrings;
    class procedure SetSQL(Obj: TComponent; Value: TStrings);
    class procedure SetSQLText(Obj: TComponent; const SQLText: string; const LockAssembleSQL, LockMacros: boolean; const DisableScanParams: boolean = True);

    class function GetParams(Obj: TComponent): TDAParams;
    class procedure Execute(Obj: TComponent);
    class procedure Open(Obj: TComponent);
    class function GetRowsAffected(Obj: TComponent): integer;
    class function GetUpdateSQLStatementTypes(Obj: TCustomDADataSet): TStatementTypes;
    class function GetUpdateSQLIndex(Obj: TCustomDADataSet; StatementType: TStatementType): TStrings;
    class function ParseSQL(Obj: TCustomDASQL; const SQL: string; Params: TDAParams; RenamePrefix: string = ''): string;
    class function CreateParamsObject(Obj: TCustomDASQL): TDAParams;

    class procedure SetDesigning(Obj: TComponent; Value: Boolean; SetChildren: Boolean = True);
    class function GetIRecordSet(Obj: TCustomDADataSet): TCRRecordSet;

    class function GetDataSetClass(Obj: TCustomDAUpdateSQL): TCustomDADataSetClass;
    class function GetSQLClass(Obj: TCustomDAUpdateSQL): TCustomDASQLClass;

    class function GetParserClass(Obj: TMacros): TParserClass;
  {$IFDEF MSWINDOWS}
    class procedure SaveServerListToRegistry(Obj: TCustomConnectDialog); // used in connection editor
  {$ENDIF}
  end;

const
  crSQLArrow            = -30;

  procedure SetCursor(Value: integer);

var
  ChangeCursor: boolean;
  MacroChar: char;
  SetCursorProc: procedure(Value: integer);
  ShowConnectFormProc: function(ConnectDialog: TCustomConnectDialog): boolean;
  BaseSQLOldBehavior: boolean;
  SQLGeneratorCompatibility: boolean;

  function _AddWhere(
    const SQL: string; Condition: string;
    ParserClass: TParserClass; // TOraParser, TMSparser, TMyParser
    OmitComment: boolean;
    SelectCode, WhereCode: integer
  ): string;
  function _SetWhere(
    const SQL: string; Condition: string;
    ParserClass: TParserClass; // TOraParser, TMSparser, TMyParser
    OmitComment: boolean;
    SelectCode, WhereCode: integer
  ): string;
  function _GetWhere(
    const SQL: string;
    ParserClass: TParserClass; // TOraParser, TMSparser, TMyParser
    OmitComment: boolean;
    SelectCode, WhereCode: integer
  ): string;
  function _SetOrderBy(
    const SQL: string; Fields: string;
    ParserClass: TParserClass; // TOraParser, TMSparser, TMyParser
    SelectCode, OrderCode, ByCode: Integer
  ): string;
  function _GetOrderBy(
    const SQL: string;
    ParserClass: TParserClass; // TOraParser, TMSparser, TMyParser
    SelectCode, OrderCode, ByCode: Integer
  ): string;


  function UpdateKindToStatementType(const UpdateKind: TUpdateKind): TStatementType;
  function StatementTypeToUpdateKind(const StatementType: TStatementType): TUpdateKind;

implementation
uses
{$IFDEF PERF_COUNTER}
  Debug,
{$ENDIF}
{$IFDEF CLR}
  System.Security,
{$ENDIF}
{$IFNDEF LINUX}
  Messages,
{$ENDIF}
  DBCommon, DBConsts, DAConsts, DASQLMonitor, CRConnectionPool;

{$IFDEF WIN32}
{$R *.res}
{$ENDIF}

procedure RecreateParamsRef(Params: TParams);
var
  i: integer;
  s: string;
  Param: TParam;
begin
  for i := 0 to Params.Count - 1 do begin
    Param := TParam(TCollection(Params).Items[i]);
    s := Param.Name;
    Param.Name := '';
    Params[i].Name := s; // Don't optimize this line!  This is necessary to force ParamRef initialization 
  end;
end;

procedure SetCursor(Value: integer);
begin
  if Assigned(SetCursorProc) then
    SetCursorProc(Value);
end;

function _AddWhere(
  const SQL: string; Condition: string;
  ParserClass: TParserClass; // TOraParser, TMSparser, TMyParser
  OmitComment: boolean;
  SelectCode, WhereCode: integer
): string;
var
  Parser: TParser;
  IsWhere: boolean;
  Code: integer;
  PrevCode: integer;
  St: string;
  StLex: string;
  BracketCount: integer;
  WherePos: integer;
  NeedBracket: boolean;
  Bracket: string;
  IsMacro: boolean;
  MacroSt: string;

begin
  Result := SQL;

  if Trim(Condition) = '' then
    Exit;

  Parser := ParserClass.Create(PChar(SQL));
  Parser.OmitComment := OmitComment;
  WherePos := 0;
  IsMacro := False;
  MacroSt := MacroChar;

  try
    if Parser.ToLexem(SelectCode) <> lcEnd then begin
      IsWhere := False;
      NeedBracket := False;
      Code := 0;
      BracketCount := 0;
      repeat
        PrevCode := Code;
        Code := Parser.GetNext(StLex); //+++ char instead of string
        if (Code = WhereCode) and (not IsMacro) and (BracketCount = 0) then begin
          IsWhere := True;
          WherePos := Parser.CurrPos + 2;
          NeedBracket := True;
        end
        else
          if Code = lcSymbol then
            if StLex = '(' then
              Inc(BracketCount)
            else
              if StLex = ')' then
                Dec(BracketCount);

        IsMacro := (Code <> lcString) and (StLex = MacroSt);
        if (BracketCount = 0) and Parser.IsClauseLexem(Code) and (Code <> WhereCode) then
          Break;
      until Code = lcEnd;

      if NeedBracket then begin
        if PrevCode = lcComment then
          Bracket := LineSeparator + ')'
        else
          Bracket := ')';
      end;

      if not IsWhere then
        St := LineSeparator + 'WHERE ' + Condition + ' '
      else
        if (PrevCode = lcComment) and not NeedBracket then 
          St :=  LineSeparator +'AND ' + Condition + ' '
        else
          St := ' AND ' + Condition + ' ';

      if Code = lcEnd then begin
        if NeedBracket then begin
          Insert('(', Result, WherePos);
          Result := Trim(Result) + Bracket + St;
        end
        else
          if not Parser.IsSemicolon(PrevCode) then
            Result := Trim(Result) + St
          else
            Insert(St, Result, Parser.PrevPos);
      end
      else
        if NeedBracket then begin
          Insert(Bracket + St, Result, Parser.PrevPos + 1);
          Insert('(', Result, WherePos);
        end
        else
          Insert(St, Result, Parser.PrevPos + 1);
    end;
  finally
    Parser.Free;
  end;
end;

//++ Must be merged with _AddWhere 
function _SetWhere(
  const SQL: string; Condition: string;
  ParserClass: TParserClass; // TOraParser, TMSparser, TMyParser
  OmitComment: boolean;
  SelectCode, WhereCode: integer
): string;
var
  Parser: TParser;
  FirstPos: integer;
  LastPos: integer;
  Code: integer;
  StLex: string;
  BracketCount: integer;
begin
  Result := SQL;
  Parser := ParserClass.Create(PChar(SQL));
  Parser.OmitBlank := False;
  Parser.OmitComment := True;
  try
    if Parser.ToLexem(SelectCode) <> lcEnd then begin
      FirstPos := 0;
      LastPos := 0;
      BracketCount := 0;
      Code := Parser.GetNext(StLex); //+++ char instead of string
      repeat
        if Code = lcBlank then begin
          if LastPos = 0 then
            LastPos := Parser.PrevPos;
        end
        else begin
          LastPos := 0;

          if Code = WhereCode then begin
            if BracketCount = 0 then begin
              if Condition = '' then
                FirstPos := Parser.PrevPrevPos + 1
              else begin
                Parser.GetNext(StLex); // blank
                FirstPos := Parser.CurrPos + 1;
              end;
            end;
          end
          else
          if Code = lcSymbol then begin
            if StLex = '(' then
              Inc(BracketCount)
            else
              if StLex = ')' then
                Dec(BracketCount);
          end;
        end;

        Code := Parser.GetNext(StLex);
      until (Code = lcEnd) or (Parser.IsClauseLexem(Code) and (Code <> WhereCode)) and (BracketCount = 0);

      if LastPos = 0 then
        LastPos := Length(Result);

      if FirstPos > 0 then
        Delete(Result, FirstPos, LastPos - FirstPos + 1);

      if Condition <> '' then begin
        if FirstPos = 0 then begin
          FirstPos := LastPos + 1;
          Condition := ' WHERE ' + Condition;
          if Pos(#13, Copy(Result, 1, FirstPos)) > 0 then
            Condition :=  LineSeparator + ' ' + Condition;
        end;
        Insert(Condition, Result, FirstPos);
      end;
    end;
  finally
    Parser.Free;
  end;
end;

function _GetWhere(
    const SQL: string;
    ParserClass: TParserClass; // TOraParser, TMSparser, TMyParser
    OmitComment: boolean;
    SelectCode, WhereCode: integer
  ): string;
var
  Parser: TParser;
  IsWhere: boolean;
  Code: integer;
  StLex: string;
  BracketCount: integer;
  WherePos: integer;
  IsMacro: boolean;
  MacroSt: string;
begin
  Result := '';
  Parser := ParserClass.Create(PChar(SQL));
  Parser.OmitComment := OmitComment;
  WherePos := 0;
  IsMacro := False;
  MacroSt := MacroChar;
  try
    if Parser.ToLexem(SelectCode) <> lcEnd then begin
      IsWhere := False;
      BracketCount := 0;
      repeat
        Code := Parser.GetNext(StLex); //+++ char instead of string
        if (Code = WhereCode) and (not IsMacro) and (BracketCount = 0) then begin
          IsWhere := True;
          WherePos := Parser.CurrPos + 2;
        end
        else
          if Code = lcSymbol then
            if StLex = '(' then
              Inc(BracketCount)
            else
              if StLex = ')' then
                Dec(BracketCount);

        IsMacro := (Code <> lcString) and (StLex = MacroSt);
        if (BracketCount = 0) and Parser.IsClauseLexem(Code) and (Code <> WhereCode) then begin
          Parser.Back;
          Break;
        end;
      until Code = lcEnd;

      if IsWhere then
        Result := Copy(SQL, WherePos, Parser.CurrPos - WherePos + 1);
    end;
  finally
    Parser.Free;
  end;
end;

function _SetOrderBy(
  const SQL: string; Fields: string;
  ParserClass: TParserClass;
  SelectCode, OrderCode, ByCode: Integer
  ): string;
var
  Parser: TParser;
  FirstPos: integer;
  LastPos: integer;
  Code: integer;
  i, p, pOrder: integer;
begin
  for i := 1 to Length(Fields) do
    if Fields[i] = ';' then
      Fields[i] := ',';

  Result := SQL;
  Parser := ParserClass.Create(PChar(Result));
  Parser.OmitBlank := False;
  Parser.OmitComment := True;
  try
    if Parser.ToLexem(SelectCode) <> lcEnd then begin
      FirstPos := 0;
      LastPos := 0;
      Code := Parser.GetNextCode;
      pOrder := Parser.PosClauseLexem(OrderCode);
      repeat
        if Code = OrderCode then begin
          if Fields = '' then
            FirstPos := Parser.PrevPrevPos + 1;
          Parser.GetNextCode;  // blank
          if Parser.GetNextCode = ByCode then begin
            if Fields <> '' then begin
              Parser.GetNextCode; // blank
              FirstPos := Parser.CurrPos + 1;
            end;
          end
          else
            FirstPos := 0;
        end;

        if (Code = lcBlank) or (Code = lcComment) then begin
          if LastPos = 0 then
            LastPos := Parser.PrevPos;
        end
        else
          LastPos := 0;

        Code := Parser.GetNextCode;
        p := Parser.PosClauseLexem(Code);
        if p > pOrder then
          Break;
      until (Code = lcEnd);

      if LastPos = 0 then
        LastPos := Length(Result);

      if FirstPos > 0 then
        Delete(Result, FirstPos, LastPos - FirstPos + 1);

      if Fields <> '' then begin
        if FirstPos = 0 then begin
          FirstPos := LastPos + 1;
          Fields := ' ORDER BY ' + Fields;
          if Pos(#13, Copy(Result, 1, FirstPos)) > 0 then
            Fields := LineSeparator + ' ' + Fields;
        end;
        Insert(Fields, Result, FirstPos);
      end;
    end;
  finally
    Parser.Free;
  end;
end;

function _GetOrderBy(
  const SQL: string;
  ParserClass: TParserClass;
  SelectCode, OrderCode, ByCode: Integer
): string;
var
  Parser: TParser;
  FirstPos: integer;
  LastPos: integer;
  Code: integer;
begin
  Result := '';
  Parser := ParserClass.Create(PChar(SQL));
  try
    FirstPos := 0;
    LastPos := Length(SQL);
    if Parser.ToLexem(SelectCode) <> lcEnd then begin
      if Parser.ToLexem(OrderCode) <> lcEnd then
        if Parser.GetNextCode = ByCode then
          FirstPos := Parser.CurrPos + 1
        else
          FirstPos := 0;

      if FirstPos <> 0 then begin
        Result := Copy(SQL, FirstPos, LastPos - FirstPos + 1);
        
        Parser.SetText(Result);
        repeat
          Code := Parser.GetNextCode;
          if Parser.IsClauseLexem(Code) then
            Result := Copy(Result, 0, Parser.PrevPos);
        until Code = lcEnd;
      end;
    end;
  finally
    Parser.Free;
  end;
end;

function UpdateKindToStatementType(const UpdateKind: TUpdateKind): TStatementType;
begin
  case UpdateKind of
    DB.ukModify:
      Result := stUpdate;
    DB.ukInsert:
      Result := stInsert;
    DB.ukDelete:
      Result := stDelete;
    else
    begin
      Result := stCustom; // To prevent compiler warning
      Assert(False);
    end;
  end;
end;

function StatementTypeToUpdateKind(const StatementType: TStatementType): TUpdateKind;
begin
  case StatementType of
    stUpdate:
      Result := DB.ukModify;
    stInsert:
      Result := DB.ukInsert;
    stDelete:
      Result := DB.ukDelete;
    else
    begin
      Result := DB.ukInsert; // To prevent compiler warning
      Assert(False);
    end;
  end;
end;
{ EDAError }

constructor EDAError.Create(ErrorCode: integer; Msg: string);
begin
  inherited Create(Msg);

  FErrorCode := ErrorCode;
end;

{ TDAConnectionOptions }

constructor TDAConnectionOptions.Create(Owner: TCustomDAConnection);
begin
  inherited Create;

  FOwner := Owner;
  KeepDesignConnected := True;
end;

procedure TDAConnectionOptions.AssignTo(Dest: TPersistent);
begin
  if Dest is TDAConnectionOptions then begin
    TDAConnectionOptions(Dest).KeepDesignConnected := KeepDesignConnected;
    TDAConnectionOptions(Dest).DisconnectedMode := DisconnectedMode;
  end  
  else
    inherited;
end;

procedure TDAConnectionOptions.SetDisconnectedMode(Value: boolean);
begin
  if Value <> DisconnectedMode then begin
    FOwner.Disconnect;
    FDisconnectedMode := Value;
    if FOwner.FIConnection <> nil then
      FOwner.FIConnection.SetProp(prDisconnectedMode, Value);
  end;
end;

{ TPoolingOptions }

constructor TPoolingOptions.Create(Owner: TCustomDAConnection);
begin
  inherited Create;

  FOwner := Owner;
  FMaxPoolSize := 100;
end;

procedure TPoolingOptions.AssignTo(Dest: TPersistent);
begin
  if Dest is TPoolingOptions then begin
    TPoolingOptions(Dest).FMaxPoolSize := FMaxPoolSize;
    TPoolingOptions(Dest).FMinPoolSize := FMinPoolSize;
    TPoolingOptions(Dest).FConnectionLifetime := FConnectionLifetime;
    TPoolingOptions(Dest).FValidate := FValidate;
  end
  else
    inherited;
end;

{ TCustomDAConnection }

constructor TCustomDAConnection.Create(Owner: TComponent);
begin
  inherited Create(Owner);

  FSQLs := TDAList.Create;
  FAutoCommit := True;
  LoginPrompt := True;

  FOptions := CreateOptions;
  FPoolingOptions := CreatePoolingOptions;
  FShouldShowPrompt := True;

  hRegisterClient := TCriticalSection.Create;
end;

destructor TCustomDAConnection.Destroy;
begin
  try
    Disconnect;
  finally
    ClearRefs;

    inherited;

    FSQLs.Free; // placed after inherited for successful UnregisterClient on destroy
    FreeIConnection;
    FPoolingOptions.Free;
    FOptions.Free;
    hRegisterClient.Free;
  end;
end;

procedure TCustomDAConnection.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;

  if (Operation = opRemove) and (FConnectDialog = AComponent) then
    FConnectDialog := nil;
end;

function TCustomDAConnection.GetIConnectionClass: TCRConnectionClass;
begin
  Assert(False, 'Must be overrided');
  Result := TCRConnection;
end;

function TCustomDAConnection.GetICommandClass: TCRCommandClass;
begin
  Assert(False, 'Must be overrided');
  Result := TCRCommand;
end;

function TCustomDAConnection.GetIRecordSetClass: TCRRecordSetClass;
begin
  Assert(False, 'Must be overrided');
  Result := TCRRecordSet;
end;

procedure TCustomDAConnection.CreateIConnection;
begin
  SetIConnection(nil);
end;

function TCustomDAConnection.CreateICommand: TCRCommand;
begin
  Result := GetICommandClass.Create;
  Result.SetConnection(nil);
end;

function TCustomDAConnection.CreateIRecordSet: TCRRecordSet;
begin
  Result := GetIRecordSetClass.Create;
  Result.SetConnection(FIConnection);
end;

procedure TCustomDAConnection.FreeIConnection;
begin
  if FIConnection = nil then
    exit;

  if FIConnection.Pool <> nil then
    FIConnection.ReturnToPool
  else
    FIConnection.Free;
  SetIConnection(nil);
end;

procedure TCustomDAConnection.SetIConnection(Value: TCRConnection);
var
  i: integer;
begin
  if Value <> nil then begin
    FIConnection := Value;
    FIConnection.OnError := DoError;
    FIConnection.OnReconnectError := Disconnect;
    FIConnection.OnReconnectSuccess := DoAfterConnect;
    FIConnection.Component := Self;

    for i := 0 to FSQLs.Count - 1 do begin
      TCustomDASQL(FSQLs[i]).CheckICommand;
      TCustomDASQL(FSQLs[i]).FICommand.SetConnection(FIConnection);
    end;
    for i := 0 to DataSetCount  - 1 do begin
      (DataSets[i] as TCustomDADataSet).CheckIRecordSet;
      (DataSets[i] as TCustomDADataSet).FIRecordSet.SetConnection(FIConnection);
    end;
  end
  else begin
    if (FIConnection <> nil) and not (csDestroying in ComponentState) then begin
      for i := 0 to FSQLs.Count - 1 do
        if TCustomDASQL(FSQLs[i]).FICommand <> nil then
          TCustomDASQL(FSQLs[i]).FICommand.SetConnection(Value {nil});
      for i := 0 to DataSetCount  - 1 do
        if (DataSets[i] as TCustomDADataSet).FIRecordSet <> nil then
          TCustomDADataSet(DataSets[i]).FIRecordSet.SetConnection(Value {nil});
    end;
    FIConnection := Value;
  end;
end;

function TCustomDAConnection.CreateDataSet: TCustomDADataSet;
begin
  Result := TCustomDADataSet.Create(nil);  // Self ???
  Result.Connection := Self;
end;

function TCustomDAConnection.CreateSQL: TCustomDASQL;
begin
  Result := TCustomDASQL.Create(nil);
  Result.Connection := Self;
end;

procedure TCustomDAConnection.RemoveFromPool;
begin
  if FIConnection <> nil then
    FIConnection.IsValid := False;
end;

procedure TCustomDAConnection.MonitorMessage(const Msg: string);
var
  MessageID: cardinal;
begin
  TDASQLMonitorClass(SQLMonitorClass).CustomMessage(Self, Msg, MessageID);
end;

procedure TCustomDAConnection.Loaded;
begin
  inherited;

  try
    try
      if FStreamedConnected then
        SetConnected(True);
    except
      on E: Exception do
        if csDesigning in ComponentState then
          ShowException(E, ExceptAddr)
        else
          raise;
    end;
  finally
    FStreamedConnected := False;
  end;
end;

procedure TCustomDAConnection.ClearRefs;
begin
  while FSQLs.Count > 0 do
    TCustomDASQL(FSQLs[0]).Connection := nil;
  while DataSetCount > 0 do
    (DataSets[0] as TCustomDADataSet).Connection := nil;
end;

procedure TCustomDAConnection.RegisterClient(Client: TObject; Event: TConnectChangeEvent = nil);
begin
  hRegisterClient.Enter;
  try
    inherited;

    if Client is TCustomDASQL then
      FSQLs.Add(Client);
  finally
    hRegisterClient.Leave;
  end;
end;

procedure TCustomDAConnection.UnRegisterClient(Client: TObject);
begin
  hRegisterClient.Enter;
  try
    inherited;

    if Client is TCustomDASQL then
      FSQLs.Remove(Client);
  finally
    hRegisterClient.Leave;
  end;
end;

function TCustomDAConnection.SQLMonitorClass: TClass;
begin
  Result := TCustomDASQLMonitor;
end;

function TCustomDAConnection.ConnectDialogClass: TConnectDialogClass;
begin
  Result := TCustomConnectDialog;
end;

function TCustomDAConnection.NeedPrompt: boolean;
begin
  Result := (LoginPrompt or (csDesigning in ComponentState) and
    ((Username = '') or (Password = ''))) and
    not ((csDesigning in ComponentState) and ((csReading in ComponentState) or FStreamedConnected));
end;

function TCustomDAConnection.IsConnectedStored: boolean;
begin
  Result := Connected and not Options.DisconnectedMode; //In disconnect mode Design-time connection disabled
end;

procedure TCustomDAConnection.DoConnect;
var
  MessageID: cardinal;
begin
  TDASQLMonitorClass(SQLMonitorClass).DBConnect(Self, MessageID, True);

  CreateIConnection;
  PushOperation(clConnect);
  StartWait;
  try
    FIConnection.SetUsername(FUsername);
    FIConnection.SetPassword(FPassword);
    FIConnection.SetServer(FServer);

    FIConnection.Connect('');
  finally
    StopWait;
    PopOperation;
  end;

  TDASQLMonitorClass(SQLMonitorClass).DBConnect(Self, MessageID, False);
end;

procedure TCustomDAConnection.DoDisconnect;
var
  MessageID: cardinal;
begin
  try
    try
      if InTransaction and not FInProcessError {to prevent call Commit(Rollback) on fatal error} then
        if CommitOnDisconnect then
          Commit
        else
          Rollback;
    finally
      if Connected then begin  //disconnect was done in Commit or Rollback
        TDASQLMonitorClass(SQLMonitorClass).DBDisconnect(Self, MessageID, True);

        if (FIConnection.Pool <> nil) and FIConnection.IsValid then begin
          FIConnection.ReturnToPool;
          SetIConnection(nil);
        end
        else
          FIConnection.Disconnect;

        TDASQLMonitorClass(SQLMonitorClass).DBDisconnect(Self, MessageID, False);
      end;
    end;
  except
    on E: EDAError do begin
      if not((csDestroying in ComponentState) and IsFatalError(E)) then
        raise;
    end
    else
      raise;
  end;
end;

function TCustomDAConnection.CommitOnDisconnect: boolean;
begin
  Result := True;
end;

procedure TCustomDAConnection.InternalConnect;
var
  StoredConnectCount: integer;
  StoredLoginPrompt: boolean;
begin
  Inc(FConnectCount);
  StoredConnectCount := FConnectCount;
  StoredLoginPrompt := LoginPrompt;
  LoginPrompt := LoginPrompt and FShouldShowPrompt;
  try
    try
      Connect;
    except
      on EFailOver do;
      else begin
        if not Connected then
          Dec(StoredConnectCount);//Restore ConnectCount in case of Connection Failure
        raise;
      end;
    end;
  finally
    FConnectCount := StoredConnectCount;
    LoginPrompt := StoredLoginPrompt;
    FShouldShowPrompt := not Connected; //in case of Connect Exception LogPrompt appears again
  end;
end;

procedure TCustomDAConnection.InternalDisconnect;
begin
  Dec(FConnectCount);
  if FConnectCount < 0 then //This could happen in case of Commit/RollBack after Execute with AutoCommit = False
    FConnectCount := 0;
  if (FConnectCount = 0) and Options.DisconnectedMode then
    if not InTransaction then //Execute with AutoCommit = False, after execute InTransaction = True, so wait for Commit/RollBack or for
                              //execute with AutoCommit = True
      Disconnect;
  FShouldShowPrompt := False;
end;

procedure TCustomDAConnection.Connect;
begin
  SetConnected(True);
end;

procedure TCustomDAConnection.Disconnect;
begin
  SetConnected(False);
end;

procedure TCustomDAConnection.PerformConnect(Retry: boolean);
begin
  if csReading in ComponentState then
    FStreamedConnected := True
  else begin
    if GetConnected then
      Exit;
    if not Retry and Assigned(BeforeConnect) then
      BeforeConnect(Self);
    DoConnect;
    Inc(FConnectCount);
    SendConnectEvent(True);
    if Assigned(AfterConnect) then
      AfterConnect(Self);
  end;
end;

procedure TCustomDAConnection.GetTableNames(List: TStrings);
begin
  List.Clear;
end;

procedure TCustomDAConnection.GetDatabaseNames(List: TStrings);
begin
  List.Clear;
end;

procedure TCustomDAConnection.GetStoredProcNames(List: TStrings);
begin
  List.Clear;
end;

{ Transaction control }

procedure TCustomDAConnection.SuppressAutoCommit;
var
  Temp: boolean;
begin
  Temp := False;
  FIConnection.SetProp(prAutoCommit, Temp);
end;

procedure TCustomDAConnection.RestoreAutoCommit;
begin
  FIConnection.SetProp(prAutoCommit, FAutoCommit);
end;

procedure TCustomDAConnection.InternalStartTransaction;
begin
  FIConnection.StartTransaction;
  FTransactionID := 'Local';
end;

procedure TCustomDAConnection.StartTransaction;
var
  MessageID: cardinal;
  ReStart: boolean;
begin
  if Options.DisconnectedMode then
    InternalConnect;
  if not Connected then
    DatabaseError(SConnectionIsClosed);
  if InTransaction then
    DatabaseError(STransactionInProgress);

  TDASQLMonitorClass(SQLMonitorClass).TRStart(Self, MessageID, True);

  PushOperation(clTransStart);
  try
    repeat
      ReStart := False;
      try
        InternalStartTransaction;
        FTransactionID := 'Local';
        SuppressAutoCommit;
      except
        on E: EFailOver do
          ReStart := True;
      end
    until not ReStart;
  finally
    PopOperation;
  end;
  TDASQLMonitorClass(SQLMonitorClass).TRStart(Self, MessageID, False);
end;

procedure TCustomDAConnection.Commit;
var
  MessageID: cardinal;
  WasInTransaction: boolean;
begin
  if not Connected then
    DatabaseError(SConnectionIsClosed);

  WasInTransaction := InTransaction;
  TDASQLMonitorClass(SQLMonitorClass).TRCommit(Self, MessageID, True);

  FIConnection.Commit;
  FTransactionID := '';
  RestoreAutocommit;

  TDASQLMonitorClass(SQLMonitorClass).TRCommit(Self, MessageID, False);
  if WasInTransaction and Options.DisconnectedMode then  //Only in case of explicit transaction start
    InternalDisconnect;
end;

procedure TCustomDAConnection.Rollback;
var
  MessageID: cardinal;
  WasInTransaction: boolean;
begin
  if not Connected then
    DatabaseError(SConnectionIsClosed);

  WasInTransaction := InTransaction;
  TDASQLMonitorClass(SQLMonitorClass).TRRollback(Self, MessageID, True);

  FIConnection.Rollback;
  FTransactionID := '';
  RestoreAutoCommit;

  TDASQLMonitorClass(SQLMonitorClass).TRRollback(Self, MessageID, False);
  if WasInTransaction and Options.DisconnectedMode then  //Only in case of explicit transaction start
    InternalDisconnect;
end;

procedure TCustomDAConnection.ApplyUpdates(DataSets: array of TCustomDADataSet);
var
  DataSet: TCustomDADataSet;
  i: integer;
  ReApply: boolean;
begin
  PushOperation(clConnectionApply);
  try
    repeat
      ReApply := False;
      for i := 0 to High(DataSets) do begin
        DataSet := DataSets[i];
        if DataSet.Connection <> Self then
          DatabaseError(Format(SUpdateWrongDB, [DataSet.Name, Name]));
      end;
      try
        StartTransaction;
        try
          for i := 0 to High(DataSets) do begin
            DataSet := DataSets[i];
            if DataSet.Active and DataSet.CachedUpdates then
              DataSet.ApplyUpdates;
          end;
          Commit;
        except
          on EFailOver do raise;
          else begin
            Rollback;
            raise;
          end;
        end;

        for i := 0 to High(DataSets) do begin
          DataSet := DataSets[i];
          if (DataSet.Connection = Self) and DataSet.Active and DataSet.CachedUpdates then
            DataSet.CommitUpdates;
        end;
      except
        on EFailOver do
          ReApply := True;
      end;
    until (not ReApply);
  finally
    PopOperation;
  end;
end;

procedure TCustomDAConnection.ApplyUpdates;
var
  i: integer;
  DataSetArray: array of TCustomDADataSet;
begin
  SetLength(DataSetArray, DataSetCount);
  for i := 0 to DataSetCount - 1 do
    DataSetArray[i] := TCustomDADataSet(DataSets[i]);
  ApplyUpdates(DataSetArray);
end;

//Operations stack
function TCustomDAConnection.PushOperation(Operation: TConnLostCause; AllowFailOver: boolean = true): integer;
var
  FOOperation: TFailOverOperation;
begin
  Result := 0;
  if Options.LocalFailover then begin
    if FOperationsStackLen = Length(FOperationsStack) then
      SetLength(FOperationsStack, FOperationsStackLen + OperationsStackDelta);

    Result := FOperationsStackLen;
    FOOperation.Operation := Operation;
    FOOperation.AllowFailOver := AllowFailOver;
    FOperationsStack[Result] := FOOperation;
    Inc(FOperationsStackLen);
  end;  
end;

function TCustomDAConnection.PopOperation: TConnLostCause;
begin
  Result := clUnknown;
  if Options.LocalFailover then begin
    Result := FOperationsStack[FOperationsStackLen].Operation;
    Dec(FOperationsStackLen);
  end;  
end;

function TCustomDAConnection.IsFatalError(E: EDAError): boolean;
begin
  Result := False;
end;

procedure TCustomDAConnection.ResetOnFatalError;
begin
  //should be ovveriden on product level
end;

procedure TCustomDAConnection.RestoreAfterFailOver;
begin
  //should be ovveriden on product level
end;

function TCustomDAConnection.DetectConnLostCause(Component: TObject): TConnLostCause;
var
  i: integer;
  AllowFailOver: boolean;
begin
  Result := clUnknown;
  AllowFailOver := True;
  for i := FOperationsStackLen - 1 downto 0 do begin

    if Result < FOperationsStack[i].Operation then begin
      Result := FOperationsStack[i].Operation;
      AllowFailOver := FOperationsStack[i].AllowFailOver;
    end;

    case Result of
      clConnect: begin
        if TCustomDAConnection(Component).FShouldShowPrompt then
          Result := clUnknown;// This is the first connect or non DisconnectedMode - so we should raise exception
        break;
      end;
      clOpen, clExecute: begin
        if ((Component is TCustomDADataSet) and not TCustomDADataSet(Component).IsQuery) or
          (Component is TCustomDASQL) then
          Inc(FConnectCount); // Add ConnectCount - > cause of EndConnection in TCustomDADataSet.DoAfterExecute
      end;
    end;
  end;

  if not AllowFailOver then
    Result := clUnknown;
end;

procedure TCustomDAConnection.DoError(E: Exception; var Fail, Reconnect, Reexecute: boolean;
  ReconnectAttempt: integer; var ConnLostCause: TConnLostCause);
var
  i: integer;
  FatalError: boolean;
  RetryMode: TRetryMode;
begin
  ConnLostCause := clUnknown;
  TDASQLMonitorClass(SQLMonitorClass).DBError(EDAError(E));

  FatalError := IsFatalError(EDAError(E));

  if FatalError then begin

    with EDAError(E) do begin
      ConnLostCause := DetectConnLostCause(Component);

      Reconnect :=
        (Connected
        or ((ReconnectAttempt > 0) and Options.LocalFailover)       // After first abortive attempt Connected = False
        or (ConnLostCause = clConnect) and Options.DisconnectedMode)  // For disconnect mode TODO:
        and ((FTransactionID = '') or (ConnLostCause = clConnectionApply)); // and not InTransaction - ODAC specific: InTransaction can raise exception

      if Reconnect then
        for i := 0 to DataSetCount - 1 do begin
          Assert(DataSets[i] is TCustomDADataSet);
          if TCustomDADataSet(DataSets[i]).Prepared or
            ((DataSets[i].Active and not TCustomDADataSet(DataSets[i]).FetchAll
              and not TCustomDADataSet(DataSets[i]).Fetched) and
              not ((ConnLostCause = clRefresh) and (DataSets[i] = Component)))  //In case of Refresh and Active dataset with unfetched data.
            then begin
            Reconnect := False;
            Break;
          end;
        end;

      if Reconnect then
        for i := 0 to FSQLs.Count - 1 do begin
          Assert(TObject(FSQLs[i]) is TCustomDASQL);
          if TCustomDASQL(FSQLs[i]).Prepared and not TCustomDASQL(FSQLs[i]).Executing then begin
            Reconnect := False;
            Break;
          end;
        end;
    end;
  end;

  if Reconnect then
    if Options.LocalFailover then begin
      if (ConnLostCause = clUnknown) or (ConnLostCause = clExecute) then
        RetryMode := rmRaise
      else
        RetryMode := rmReconnectExecute;

      if Assigned(FOnConnectionLost) then
        FOnConnectionLost(Self, TComponent(EDAError(E).Component), ConnLostCause, RetryMode);
      Reconnect := RetryMode > rmRaise;
      Reexecute := ((RetryMode > rmReconnect) and not (ConnLostCause = clUnknown)) or
        ((ConnLostCause = clConnect) and (RetryMode >= rmReconnect));
      Fail := not Reexecute;
    end;

  if not Options.LocalFailover or not Reconnect then
    if Assigned(FOnError) then
      FOnError(Self, EDAError(E), Fail);

  if FatalError and (FIConnection <> nil) then begin
    FIConnection.IsValid := False;
    if FIConnection.Pool <> nil then
      TCRConnectionPool(FIConnection.Pool).Invalidate;
  end;

  if FatalError and (ReconnectAttempt = 0) then
    ResetOnFatalError;

  if not FInProcessError and not Reconnect and FatalError and
    (ReconnectAttempt = 0) // If Attempt > 0 disconnect was called on CRAccess level
  then begin
    FInProcessError := True;
    try
      Disconnect;
    except // don't raise exception
    end;
    FInProcessError := False;
  end;
end;

function TCustomDAConnection.IsKeyViolation(E: EDAError): boolean;
begin
  Result := False;
end;

procedure TCustomDAConnection.AssignTo(Dest: TPersistent);
begin
  if Dest is TCustomDAConnection then begin
    TCustomDAConnection(Dest).Username := Username;
    TCustomDAConnection(Dest).Password := Password;
    TCustomDAConnection(Dest).Server := Server;
    TCustomDAConnection(Dest).LoginPrompt := LoginPrompt;
    PoolingOptions.AssignTo(TCustomDAConnection(Dest).PoolingOptions);
    TCustomDAConnection(Dest).Pooling := Pooling;
    TCustomDAConnection(Dest).ConnectDialog := ConnectDialog;
    TCustomDAConnection(Dest).OnError := OnError;
    TCustomDAConnection(Dest).ConvertEOL := ConvertEOL;
    Options.AssignTo(TCustomDAConnection(Dest).Options);
    TCustomDAConnection(Dest).AutoCommit := AutoCommit;

    TCustomDAConnection(Dest).AfterConnect := AfterConnect;
    TCustomDAConnection(Dest).BeforeConnect := BeforeConnect;
    TCustomDAConnection(Dest).AfterDisconnect := AfterDisconnect;
    TCustomDAConnection(Dest).BeforeDisconnect := BeforeDisconnect;
    TCustomDAConnection(Dest).OnLogin := OnLogin;
  end
  else
    inherited;
end;

function TCustomDAConnection.GetConnected: boolean;
begin
  Result := (FIConnection <> nil) and FIConnection.GetConnected;
end;

procedure TCustomDAConnection.SetConnected(Value: boolean);
var
  Dialog: TCustomConnectDialog;
  DialogResult: boolean;
  OldBeforeDisconnect: TNotifyEvent;
  StoredConnectCount: integer;
begin
  OldBeforeDisconnect := nil;
  try
    if Value <> GetConnected then begin
      try
        // ignore exceptions to disconnect all client
        if not Value then begin
          FConnectCount := 0; //Explicit disconnect
          FShouldShowPrompt := True;
          if Assigned(BeforeDisconnect) then BeforeDisconnect(Self);
          while True do
            try
              SendConnectEvent(False);
              break;
            except
              on E: EDAError do
                if not IsFatalError(E) then
                  raise
            end;
        end
        else
          if not FStreamedConnected then //DFM loading issue
            Inc(FConnectCount);
      finally
        if csReading in ComponentState then begin
          if FOptions.KeepDesignConnected or (csDesigning in ComponentState) then
            FStreamedConnected := Value;
        end
        else if not Value then begin
          OldBeforeDisconnect := BeforeDisconnect;
          if Assigned(BeforeDisconnect) then //Design-time event lose fix
            BeforeDisconnect := nil;

          inherited SetConnected(False); //There is no server operations

          FTransactionID := '';
        end;
      end;
      if not (csReading in ComponentState) and Value then begin
        if NeedPrompt and (ConnectDialogClass <> nil) then begin
          if FConnectDialog = nil then
            Dialog := ConnectDialogClass.Create(nil)
          else
            Dialog := FConnectDialog;
          StoredConnectCount := FConnectCount;
          DialogResult := False;
          try
            Dialog.FConnection := Self;
            DialogResult := Dialog.Execute;
          finally
            if not DialogResult then
              Dec(StoredConnectCount);
            FConnectCount := StoredConnectCount;
            if FConnectDialog = nil then
              Dialog.Free;
          end;

          if not DialogResult then begin
            if FStreamedConnected or (csDesigning in ComponentState) then
              DatabaseError(SCannotConnect)
            else
              Abort;
          end;
        end
        else begin
          StoredConnectCount := FConnectCount;
          try
            try
              PerformConnect;
            except
              if not Connected then
                Dec(StoredConnectCount);//Restore ConnectCount in case of Connection Failure
              raise;
            end;
          finally
            FConnectCount := StoredConnectCount;
          end;
        end;
      end;
    end;
  finally
    if Assigned(OldBeforeDisconnect) then
      BeforeDisconnect := OldBeforeDisconnect;
  end;
end;

procedure TCustomDAConnection.SetUsername(const Value: string);
begin
  if Value <> FUsername then begin
    Disconnect;
    FUsername := Value;
  end;
end;

procedure TCustomDAConnection.SetPassword(const Value: string);
begin
  if Value <> FPassword then begin
    Disconnect;
    FPassword := Value;
  end;
end;

procedure TCustomDAConnection.SetServer(const Value: string);
begin
  if Value <> FServer then begin
    Disconnect;
    FServer := Value;
  end;
end;

function TCustomDAConnection.GetConnectString: string;
begin
  Result := '';
end;

procedure TCustomDAConnection.SetConnectString(Value: string);
begin
end;

procedure TCustomDAConnection.SetAutoCommit(Value: boolean);
begin
  FAutoCommit := Value;
  if FIConnection <> nil then
    FIConnection.SetProp(prAutoCommit, FAutoCommit);
end;

function TCustomDAConnection.GetInTransaction: boolean;
begin
  Result := GetTransactionID <> '';
end;

function TCustomDAConnection.GetTransactionID: string;
begin
  Result := FTransactionID;
end;

procedure TCustomDAConnection.SetConvertEOL(Value: boolean);
begin
  FConvertEOL := Value;
  if FIConnection <> nil then
    FIConnection.SetProp(prConvertEOL, Value);
end;

function TCustomDAConnection.CreateOptions: TDAConnectionOptions;
begin
  Result := TDAConnectionOptions.Create(Self);
end;

procedure TCustomDAConnection.SetOptions(Value: TDAConnectionOptions);
begin
  FOptions.Assign(Value);
end;

function TCustomDAConnection.CreatePoolingOptions: TPoolingOptions;
begin
  Result := TPoolingOptions.Create(Self);
end;

procedure TCustomDAConnection.SetPoolingOptions(Value: TPoolingOptions);
begin
  FPoolingOptions.Assign(Value);
end;

function TCustomDAConnection.IsCaseSensitive: boolean;
begin
  Result := True;
end;

procedure TCustomDAConnection.SetConnectDialog(Value: TCustomConnectDialog);
begin
  if Value <> FConnectDialog then begin
    if FConnectDialog <> nil then begin
      RemoveFreeNotification(FConnectDialog);
      if FConnectDialog.FConnection = Self then
        FConnectDialog.FConnection := nil;
    end;

    FConnectDialog := Value;

    if FConnectDialog <> nil then begin
      FreeNotification(FConnectDialog);
      FConnectDialog.FConnection := Self;
    end;
  end;
end;

procedure TCustomDAConnection.SetPooling(Value: boolean);
begin
  if FPooling <> Value then begin
    SetConnected(False);
    FreeIConnection;
  end;
  FPooling := Value;
end;

procedure TCustomDAConnection.DoAfterConnect;
begin
  if Assigned(AfterConnect) then
    AfterConnect(Self);
end;

{ TDAParamsInfo }

function TDAParamsInfo.GetItem(Index: Integer): TDAParamInfo;
begin
  Result := TDAParamInfo(inherited GetItem(Index));
end;

procedure TDAParamsInfo.SetItem(Index: Integer; Value: TDAParamInfo);
begin
  inherited SetItem(Index, Value);
end;

{ TDAParam }

destructor TDAParam.Destroy;
begin
  FreeObject;

  inherited;
end;

procedure TDAParam.Clear;
begin
  if IsBlobDataType then
    TBlob(FParamObject).Clear
  else
    inherited Clear;
end;

procedure TDAParam.Assign(Source: TPersistent);
{$IFDEF VER6P}
var
  StreamPersist: IStreamPersist;
{$ENDIF}

{$IFDEF VER6P}
  procedure Load(const StreamPersist: IStreamPersist);
  var
    MS: TMemoryStream;
  begin
    if not (DataType in [ftBlob, ftMemo{$IFDEF VER10P}, ftWideMemo{$ENDIF}, ftOraBlob, ftOraClob]) then
      raise Exception.Create(SDataTypeNotSupported);

    MS := TMemoryStream.Create;
    try
      StreamPersist.SaveToStream(MS);
      LoadFromStream(MS, DataType);
    finally
      MS.Free;
    end;
  end;
{$ENDIF}

begin
  if Source is TDAParam then begin
    AssignParam(TParam(Source));
  {$IFDEF VER6P}
    TParam(Self).Size := TParam(Source).Size; // CR11511
  {$ENDIF}
    FSize := TDAParam(Source).FSize; // CR11511
    ParamObject := TDAParam(Source).ParamObject;
  end
  else
  if Source is TParam then
    AssignParam(TParam(Source))
  else
  if Source is TField then
    AssignField(TField(Source))
  else
  if Source is TStrings then
    AsMemo := TStrings(Source).Text
  else
{$IFDEF VER6P}
  if Supports(Source, IStreamPersist, StreamPersist) then
    Load(StreamPersist)
  else
{$ENDIF}
    inherited Assign(Source);
end;

procedure TDAParam.AssignParam(Param: TParam);
begin
  if Param <> nil then begin
    DataType := Param.DataType;
    if Param.IsNull then
      Clear
    else
      if IsBlobDataType and not (Param is TDAParam) then
        // in MIDAS we need to do such assignment
        // as TDAParam.Value = TParam.Value
        Value := Param.Value
      else
        inherited Value := Param.Value;
    Name := Param.Name;
    if ParamType = ptUnknown then
      ParamType := Param.ParamType;
  end;
end;

procedure TDAParam.AssignTo(Dest: TPersistent);
begin
  if Dest is TField then
    TField(Dest).Value := Value
  else
    inherited AssignTo(Dest);
end;

procedure TDAParam.AssignField(Field: TField);
begin
  if Field <> nil then begin
    AssignFieldValue(Field, Field.Value);
    Name := Field.FieldName;
  end;
end;

procedure TDAParam.AssignFieldValue(Field: TField; const Value: Variant);
begin
  if Field <> nil then begin
    if (Field.DataType = ftString) and TStringField(Field).FixedChar then
      DataType := ftFixedChar
    else
    if (Field.DataType = ftMemo) and (Field.Size > 255) then
      DataType := ftString
    else
  {$IFDEF VER10P}
    if (Field.DataType = ftWideMemo) and (Field.Size > 255) then
      DataType := ftWideString
    else
  {$ENDIF}
      DataType := Field.DataType;
    if
      VarIsNull(Value)
    {$IFDEF CLR}
      or ((Field is TBytesField) and Field.IsNull) // See d7 TField.GetAsByteArray and d8 TVarBytesField(TField).GetAsByteArray for details
    {$ENDIF}
    then
      Clear
    else
      Self.Value := Value;
  end;
end;

procedure TDAParam.LoadFromFile(const FileName: string; BlobType: TBlobType);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead);
  try
    LoadFromStream(Stream, BlobType);
  finally
    Stream.Free;
  end;
end;

procedure TDAParam.LoadFromStream(Stream: TStream; BlobType: TBlobType);
begin
  if not (BlobType in [ftBlob, ftMemo{$IFDEF VER10P}, ftWideMemo{$ENDIF}, ftOraBlob, ftOraClob]) then
    raise Exception.Create(SDataTypeNotSupported);
  with Stream do begin
    DataType := BlobType;
    Position := 0;
    Assert(FParamObject <> nil, SDataTypeNotSupported);
    TBlob(FParamObject).LoadFromStream(Stream);
  end;
end;

procedure TDAParam.SetBlobData(Buffer: TBytes; Size: Integer);
begin
  AsBlob := Encoding.Default.GetString(Buffer, 0, Size);
end;

procedure TDAParam.SetBlobData(Buffer: TValueBuffer);
begin
  AsBlob := Marshal.PtrToStringAnsi(Buffer);
end;

procedure TDAParam.CreateObject;
begin
  Assert(FParamObject = nil);

  if DataType in [ftBlob, ftMemo{$IFDEF VER10P}, ftWideMemo{$ENDIF}] then begin
    FParamObject := TBlob.Create;
  {$IFDEF VER10P}
    if DataType = ftWideMemo then
      TBlob(FParamObject).IsUnicode := True;
  {$ENDIF}
  end;
end;

procedure TDAParam.FreeObject;
begin
  if FParamObject <> nil then begin
    FParamObject.Free;
    FParamObject := nil;
  end;
end;

procedure TDAParam.SetParamObject(Value: TSharedObject);
begin
  FreeObject;

  FParamObject := Value;
  if FParamObject <> nil then begin
    FParamObject.AddRef;
    inherited Value := 'Object'; // for IsNull = False
  end;
end;

function TDAParam.IsDataTypeStored: boolean;
begin
  Result := Integer(DataType) <= Integer(High(TFieldType));
end;

function TDAParam.IsValueStored: boolean;
begin
  Result := Bound and not VarIsArray(Value);
end;

procedure TDAParam.DefineProperties(Filer: TFiler);

  function WriteData: boolean;
  begin
    Result := not IsDataTypeStored;
  end;

begin
  inherited DefineProperties(Filer);

  Filer.DefineProperty('ExtDataType', ReadExtDataType, WriteExtDataType, WriteData);
end;

procedure TDAParam.ReadExtDataType(Reader: TReader);
begin
  DataType := TFieldType(Reader.ReadInteger);
end;

procedure TDAParam.WriteExtDataType(Writer: TWriter);
begin
  Writer.WriteInteger(Integer(DataType));
end;

function TDAParam.IsObjectDataType(DataType: TFieldType): boolean;
begin
  Result := DataType in [ftMemo{$IFDEF VER10P}, ftWideMemo{$ENDIF}, ftBlob];
end;

function TDAParam.IsObjectDataType: boolean;
begin
  Result := IsObjectDataType(DataType);
end;

function TDAParam.IsBlobDataType: boolean;
begin
  Result := DataType in [ftMemo{$IFDEF VER10P}, ftWideMemo{$ENDIF}, ftBlob];
end;

function TDAParam.GetDataType: TFieldType;
begin
  Result := inherited DataType;
end;

procedure TDAParam.SetDataType(Value: TFieldType);
begin
  if Value <> inherited DataType then begin
    if IsObjectDataType then
      FreeObject;

    inherited DataType := Value;

    if IsObjectDataType then
      CreateObject;
  end;
end;

function TDAParam.GetSize: integer;
begin
  Result := FSize;
end;

procedure TDAParam.SetSize(Value: integer);
begin
  FSize := Value;
end;

function TDAParam.GetAsString: string;
begin
  if IsNull then
    Result := ''
  else
  if IsBlobDataType then begin
    Assert(FParamObject is TBlob);
    Result := TBlob(FParamObject).AsString;
  end
  else
  {$IFNDEF CLR}
    if DataType in [ftDate, ftDateTime] then
      Result := DateToStr(TVarData(Value).VDate)
    else
  {$ENDIF}
      Result := inherited AsString;
end;

procedure TDAParam.SetAsString(Value: string);
begin
  if IsBlobDataType then
    TBlob(FParamObject).AsString := Value
  else
  if DataType = ftWideString then
    AsWideString := Value
  else
    inherited AsString := Value;
end;

function TDAParam.GetAsWideString: WideString;
begin
  if IsNull then
    Result := ''
  else
  if IsBlobDataType then begin
    Assert(FParamObject is TBlob);
    Result := TBlob(FParamObject).AsWideString;
  end
  else
    Result := inherited Value;
end;

procedure TDAParam.SetAsWideString(Value: WideString);
begin
  if IsBlobDataType then
    TBlob(FParamObject).AsWideString := Value
  else
    inherited Value := Value;
end;

function TDAParam.GetAsInteger: integer;
begin
  Result := inherited AsInteger;
end;

procedure TDAParam.SetAsInteger(Value: integer);
begin
  inherited AsInteger := Value;
end;

function TDAParam.GetAsFloat: double;
begin
  Result := inherited AsFloat;
end;

procedure TDAParam.SetAsFloat(Value: double);
begin
  inherited AsFloat := Value;
end;

procedure TDAParam.SetAsBlob(Value: TBlobData);
begin
  DataType := ftBlob;
  TBlob(FParamObject).AsString := Value
end;

procedure TDAParam.SetAsMemo(Value: string);
begin
  DataType := ftMemo;
  Assert(FParamObject <> nil);
  TBlob(FParamObject).AsString := Value
end;

function TDAParam.GetAsBlobRef: TBlob;
begin
  if DataType = ftUnknown then
    DataType := ftBlob;

  if IsBlobDataType then
    Result := FParamObject as TBlob
  else
    Result := nil;
end;

procedure TDAParam.SetAsBlobRef(const Value: TBlob);
begin
  FreeObject;

  inherited DataType := ftBlob;

  ParamObject := Value;
end;

function TDAParam.GetAsMemoRef: TBlob;
begin
  if DataType = ftUnknown then begin
  {$IFDEF VER10P}
    if IsBlobDataType and (FParamObject is TBlob) and TBlob(FParamObject).IsUnicode then
      DataType := ftWideMemo
    else
  {$ENDIF}
      DataType := ftMemo;
  end;

  if IsBlobDataType then
    Result := FParamObject as TBlob
  else
    Result := nil;
end;

procedure TDAParam.SetAsMemoRef(const Value: TBlob);
begin
  FreeObject;

{$IFDEF VER10P}
  if Value.IsUnicode then
    inherited DataType := ftWideMemo
  else
{$ENDIF}
    inherited DataType := ftMemo;

  ParamObject := Value;
end;

function TDAParam.GetAsVariant: variant;
begin
  if IsBlobDataType then
    Result := TBlob(FParamObject).AsString
  else
    Result := inherited Value;
end;

procedure TDAParam.SetAsVariant(const Value: variant);
begin
  if IsBlobDataType then
    TBlob(FParamObject).AsString := Value
  else
    inherited Value := Value;
end;

{$IFDEF VER6P}
function TDAParam.GetAsSQLTimeStamp: TSQLTimeStamp;
begin
  Result := inherited AsSQLTimeStamp;
end;

procedure TDAParam.SetAsSQLTimeStamp(const Value: TSQLTimeStamp);
begin
  inherited AsSQLTimeStamp := Value;
end;
{$ENDIF}

procedure TDAParam.SetText(const Value: string);
begin
  if IsBlobDataType then
    TBlob(FParamObject).AsString := Value
  else
    inherited SetText(Value);
end;

function TDAParam.GetIsNull: boolean;
begin
  if IsBlobDataType then
    Result := TBlob(FParamObject).Size = 0
  else
    Result := inherited IsNull;
end;

{ TDAParams }

constructor TDAParams.Create(Owner: TPersistent);
begin
  inherited Create(TDAParam);

  FOwner := Owner;
  FNeedsUpdateItem := True;
end;

procedure TDAParams.Update(Item: TCollectionItem);
begin
  if FNeedsUpdateItem then
    inherited;
end;

function TDAParams.GetItem(Index: integer): TDAParam;
begin
  Result := TDAParam(inherited Items[Index]);
end;

procedure TDAParams.SetItem(Index: integer; Value: TDAParam);
begin
  inherited Items[Index] := Value;
end;

function TDAParams.ParamByName(const Value: string): TDAParam;
begin
  Result := TDAParam(inherited ParamByName(Value));
end;

function TDAParams.FindParam(const Value: string): TDAParam;
begin
  Result := TDAParam(inherited FindParam(Value));
end;

function TDAParams.CreateParam(FldType: TFieldType; const ParamName: string;
  ParamType: TParamType): TDAParam;
begin
  Result := TDAParam(inherited CreateParam(ftUnknown, ParamName, ParamType));
  Result.DataType :=  FldType;
end;

{ TDADetailDataLink }

constructor TDADetailDataLink.Create(DataSet: TCustomDADataSet);
begin
  inherited Create;

  FDataSet := DataSet;
end;

procedure TDADetailDataLink.ActiveChanged;
begin
  if FDataSet.Active and
    not (csDestroying in FDataSet.ComponentState) and
    Active
  then
    FDataSet.RefreshParams;
end;

procedure TDADetailDataLink.RecordChanged(Field: TField);
begin
  if ((Field = nil) or (DataSet.Fields.IndexOf(Field) >= 0)) and FDataSet.Active and
    not ((Field <> nil) and (FDataSet.State in [dsEdit, dsInsert])) then
      FDataSet.RefreshParams;
end;

procedure TDADetailDataLink.CheckBrowseMode;
begin
  if FDataSet.Active and
    not((DataSet.State in [dsInsert]) and (FDataSet.State in [dsEdit,dsInsert]))
  then // Prevent post detail before post master
    FDataSet.CheckBrowseMode;
end;

function TDADetailDataLink.GetDetailDataSet: TDataSet;
begin
  Result := FDataSet;
end;

{ TCustomDADataSet }

constructor TCustomDADataSet.Create(Owner: TComponent);
var
  stIdx: TStatementType;
begin
  inherited Create(Owner);

  FDataLink := TDADetailDataLink.Create(Self);

  for stIdx := Low(TStatementType) to High(TStatementType) do
    if stIdx in GetUpdateSQLStatementTypes then begin
      Assert(FUpdateSQL[stIdx] = nil);
      FUpdateSQL[stIdx] := TStringList.Create;
      TStringList(FUpdateSQL[stIdx]).OnChange := ScanMacros;
    end;

  FFetchRows := 25;
  FAutoCommit := True;
  FRowsAffected := -1;
  FRefreshOptions := [];
  FLeftQuote := '"';
  FRightQuote := '"';

  FBatchSQLs := StringBuilder.Create(100);

  CreateCommand;
  CreateSQLGenerator;

  SetIRecordSet(FIRecordSet); // TODO - SetIRecordSet called twice

  FDesignCreate := csDesigning in ComponentState;
  FOptions := CreateOptions;

  FUpdatingTableInfoIdx := -1;
end;

destructor TCustomDADataSet.Destroy;
var
  stIdx: TStatementType;
begin
  Close;
  UnPrepare;

  if UsedConnection <> nil then
    UsedConnection.UnregisterClient(Self);

  FreeCommand;
  FreeSQLGenerator; /// CR11636

  FOptions.Free;
  FDataLink.Free;
  FBatchParams.Free;
  FBatchSQLs.Free;

  for stIdx := Low(FUpdateComponents) to High(FUpdateComponents) do begin
    FUpdateComponents[stIdx].Free;
    FUpdateComponents[stIdx] := nil;
    FUpdateSQL[stIdx].Free;
    FUpdateSQL[stIdx] := nil;
  end;

{$IFDEF MSWINDOWS}
  FDetailRefreshTimer.Free;
{$ENDIF}

  inherited;

  SetUpdateObject(nil);
end;

function TCustomDADataSet.QuoteName(const AName: string): string;
begin
  if FOptions.FQuoteNames and (AName <> '') then
    Result := Concat(FLeftQuote, AName, FRightQuote)
  else
    Result := AName;
end;

function TCustomDADataSet.UnQuoteName(AName: string): string;
var
  l: integer;
begin
  AName := Trim(AName);
  l := Length(AName);
  if FOptions.FQuoteNames and (l >= 3) and (AName[1] = FLeftQuote) and (AName[l] = FRightQuote) then
    Result := Copy(AName, 2, l - 2)
  else
    Result := AName;
end;

procedure TCustomDADataSet.CheckInactive;
begin
  inherited CheckInactive;
end;

procedure TCustomDADataSet.CreateIRecordSet;
begin
  if UsedConnection <> nil then
    SetIRecordSet(UsedConnection.CreateIRecordSet)
  else
    SetIRecordSet(nil);
end;

procedure TCustomDADataSet.FreeIRecordSet;
begin
  FIRecordSet.Free;
  SetIRecordSet(nil);
end;

procedure TCustomDADataSet.SetIRecordSet(Value: TData);
var
  stIdx: TStatementType;
begin
  inherited;

  FIRecordSet := TCRRecordSet(Value); // Value as TCRRecordSet;
  if FIRecordSet <> nil then begin
    FICommand := FIRecordSet.GetCommand;
    FIRecordSet.SetProp(prUniDirectional, FUniDirectional);
    FIRecordSet.SetProp(prFetchRows, FFetchRows);
    FIRecordSet.SetProp(prFetchAll, FFetchAll);
    if FOptions <> nil then begin
      FIRecordSet.SetProp(prLongStrings, FOptions.FLongStrings);
      FIRecordSet.SetProp(prFlatBuffers, FOptions.FFlatBuffers);
      FIRecordSet.TrimFixedChar := FOptions.TrimFixedChar;
      FIRecordSet.TrimVarChar := FOptions.TrimVarChar;
    end;

    FIRecordSet.AfterExecFetch := DoAfterExecFetch;
    FIRecordSet.AfterFetchAll := DoAfterFetchAll;
    FIRecordSet.OnBeforeFetch := DoOnBeforeFetch;
    FIRecordSet.OnAfterFetch := DoOnAfterFetch;
    FIRecordSet.OnDataChanged := DoOnDataChanged;
    FIRecordSet.Component := Self;
  end
  else
    FICommand := nil;

  if FCommand <> nil then
    FCommand.SetICommand(FICommand);

  if FICommand <> nil then begin
    FICommand.SetProp(prAutoCommit, FAutoCommit);
    FICommand.AfterExecute := DoAfterExecute;
  end;
  for stIdx := Low(FUpdateComponents) to High(FUpdateComponents) do
    FreeAndNil(FUpdateComponents[stIdx]);
  FUpdateQuery := nil;
end;

procedure TCustomDADataSet.CheckIRecordSet;
var
  ClassType: TClass;
begin
  if (UsedConnection <> nil) then
    ClassType := UsedConnection.GetIRecordSetClass
  else
    ClassType := nil;

  if (ClassType = nil) or not IsClass(FIRecordSet, ClassType) then begin
    FreeIRecordSet;
    CreateIRecordSet;
  end;
end;

procedure TCustomDADataSet.CreateCommand;
begin
  SetCommand(TCustomDASQL.Create(Self));
end;

procedure TCustomDADataSet.FreeCommand;
begin
  FCommand.Free;
  FCommand := nil;
end;

procedure TCustomDADataSet.SetCommand(Value: TCustomDASQL);
begin
  //FreeCommand;

  FCommand := Value;
  if FCommand <> nil then begin
    FCommand.SetICommand(FICommand);
    FCommand.FDataSet := Self;

    FParams := FCommand.Params;
    FMacros := FCommand.Macros;
  end;
end;

function TCustomDADataSet.CreateOptions: TDADataSetOptions;
begin
  Result := TDADataSetOptions.Create(Self);
end;

procedure TCustomDADataSet.Loaded;
begin
  FStreamedOpen := True;
  try
    inherited;
    FDesignCreate := False;
  finally
    FStreamedOpen := False;
  end;
end;

function TCustomDADataSet.UsedConnection: TCustomDAConnection;
begin
  Result := FConnection
end;

procedure TCustomDADataSet.CheckConnection;
begin
  BeginConnection(False);
end;

procedure TCustomDADataSet.BeginConnection(NoConnectCheck: boolean);
  function HasDataSet(DAConnection: TCustomDAConnection; DataSet: TDataSet): boolean;
  var
    i: integer;
  begin
    for i := 0 to DAConnection.DataSetCount - 1 do begin
      if DAConnection.DataSets[i] = DataSet then begin
        Result := True;
        exit;
      end;
    end;
    Result := False;
  end;
begin
  if UsedConnection = nil then
    DatabaseError(SConnectionNotDefined);

    if NoConnectCheck then
      UsedConnection.InternalConnect // We should call connect each time to update ConnectCount
    else
      if not UsedConnection.Connected then
        UsedConnection.Connect;

// use default session
  if (FConnection = nil) and not HasDataSet(UsedConnection, Self)  // FDataSets
  then begin
    UsedConnection.RegisterClient(Self, ConnectChange);

    CheckIRecordSet;
    FIRecordSet.SetConnection(UsedConnection.FIConnection)
  end;
end;

procedure TCustomDADataSet.EndConnection;
begin
  if UsedConnection <> nil then
    UsedConnection.InternalDisconnect;
end;

procedure TCustomDADataSet.Disconnect;
begin
  Close;
  UnPrepare;
  FieldDefs.Updated := False;
end;

procedure TCustomDADataSet.ConnectChange(Sender: TObject; Connecting: boolean);
begin
  if not Connecting then begin
    if not TCustomDAConnection(Sender).Options.DisconnectedMode then
      Disconnect
    else
      FIRecordSet.Disconnect;
  end
  else
    if not (Sender is TCustomDAConnection) then begin // Dll call
      Assert(FIRecordSet <> nil);
      Assert(UsedConnection <> nil);
      Assert(UsedConnection.FIConnection <> nil);
      FIRecordSet.SetConnection(UsedConnection.FIConnection);
    end;
end;

{ TablesInfo }

function TCustomDADataSet.GetTablesInfo: TCRTablesInfo;
begin
  Result := FIRecordSet.TablesInfo;
end;

procedure TCustomDADataSet.SetUpdatingTable(Value: string);
var
  i, j: integer;
  KeyAndDataFields: TKeyAndDataFields;
  OldUpdatingTable: string;
  FieldDesc: TFieldDesc;
  UpdatingTableIsEmpty: boolean;

  function GetRootParent(FieldDesc: TFieldDesc): TFieldDesc;
  begin
    Result := FieldDesc;
    while Result.ParentField <> nil do
      Result := Result.ParentField;
  end;
begin
  Value := TablesInfo.TableInfoClass.NormalizeName(Value);
  OldUpdatingTable := FUpdatingTable;
  FUpdatingTable := Value;

  // Clear FCachedKeyAndDataFields
  if FUpdatingTable <> OldUpdatingTable then
    ClearCachedKeyAndDataFields;

//  Count can be equal to 0 in case: select t.a from (select a from table) t
//  if TablesInfo.Count = 0 then
//    Exit; // TablesInfo is not avaible (DataSet is not open)}
  if not FIRecordSet.Active then
    Exit;

  //Assert(Length(FSQLObjects) > 0, 'Function TCustomMSDataSet.SetUpdatingTable cannot be called for non-select query!');

  UpdatingTableIsEmpty := False;
  if TablesInfo.Count = 0 then
    i := -1
  else
  if Value = '' then // Select default updating table
    i := 0
  else begin
    i := TablesInfo.IndexByName(Value);
    if i = -1 then
      i := TablesInfo.IndexByAlias(Value);

    if i = - 1 then begin
      if FUpdatingTable <> OldUpdatingTable then begin
        FUpdatingTable := OldUpdatingTable;
        DatabaseErrorFmt(SBadUpdatingTable, [Value]);
      end
      else
      begin
        UpdatingTable := '';
        UpdatingTableIsEmpty := True; // All properties must be setted by previous command
      end;
    end;
  end;

  if not UpdatingTableIsEmpty then begin
    FUpdatingTableInfoIdx := i;

    DetectIdentityField;

    if not ReadOnly then begin
      // Set Fields[i].ReadOnly Values
      if Options.SetFieldsReadOnly and ReadOnlyFieldsEnabled then begin

        for i := 0 to Fields.Count - 1 do
          if Fields[i].FieldKind = fkData then
            Fields[i].ReadOnly := True;

        GetKeyAndDataFields(KeyAndDataFields, False);
        
        for i := 0 to Fields.Count - 1 do begin
          FieldDesc := GetFieldDesc(Fields[i]);
          for j := 0 to High(KeyAndDataFields.DataFieldDescs) do
            if (FieldDesc = KeyAndDataFields.DataFieldDescs[j]) or (GetRootParent(FieldDesc) = KeyAndDataFields.DataFieldDescs[j]) then begin
              Fields[i].ReadOnly := False;
              Break;
            end;
        end;
      end;
    end;
  end;

  if TablesInfo.Count > 0 then
    FOldKeyFields := PSGetKeyFields;
end;

{ Open/Close }

procedure TCustomDADataSet.Prepare;
var
  MessageID: cardinal;
begin
  if not Prepared and not Active then begin
    BeginConnection;

    // Get param values from master dataset to avoid bug with master/detail and
    // Execute method on detail dataset.
    if (FDataLink.DataSource <> nil) and (FDataLink.DataSource.DataSet <> nil)
      and (FDataLink.DataSource.DataSet.Active)
    then
      SetMasterParams(Params);

    if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then
      TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLPrepare(Self, FinalSQL, FParams, MessageID, True);

    StartWait;

    FCommand.WriteParams(False);

    inherited;

    if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then
      TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLPrepare(Self, FinalSQL, FParams, MessageID, False);
  end;
end;

procedure TCustomDADataSet.UnPrepare;
var
  NeedDisconnect: boolean;
  MessageID: cardinal;
  UnpreparePending: boolean;
begin
  NeedDisconnect := Prepared;
  UnpreparePending := False;

  if Prepared and (UsedConnection <> nil) then
    if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then begin
      TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLUnprepare(Self, FinalSQL, FParams, MessageID, True);
      UnpreparePending := True;
    end;

  try
    inherited;
  finally
    if NeedDisconnect then
      EndConnection;
  end;
  FIRecordSet.TablesInfo.Clear;
  FUpdatingTableInfoIdx := -1;

  if UnpreparePending and (UsedConnection <> nil) then
    if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then
      TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLUnprepare(Self, FinalSQL, FParams, MessageID, False);
end;

procedure TCustomDADataSet.SetActive(Value: Boolean);
begin
  if not FStreamedOpen or (csDesigning in ComponentState) or (FConnection = nil) or
    FConnection.Options.KeepDesignConnected then
    inherited;

  if Value then
    FOldTableName := PSGetTableName;
end;

procedure TCustomDADataSet.BeforeOpenCursor(InfoQuery: boolean);
begin
end;

procedure TCustomDADataSet.AfterOpenCursor(InfoQuery: boolean);
begin
end;

function TCustomDADataSet.OpenCursorAllowFailOver: boolean;
begin
  Result := True;
end;

procedure TCustomDADataSet.OpenCursor(InfoQuery: boolean);
var
  ReOpen: boolean;
begin
  if UsedConnection <> nil then
    UsedConnection.PushOperation(clOpen, OpenCursorAllowFailOver);
  try
    FOldKeyFields := '';
    BeginConnection;
    if Active then
      Exit;       // for open OnChangeConnect
    repeat
      ReOpen := False;
      
      BeforeOpenCursor(InfoQuery);
      // get param values from master dataset
      if (FDataLink.DataSource <> nil)
        and (FDataLink.DataSource.DataSet <> nil)
        and (FDataLink.DataSource.DataSet.Active)
        and (not Foptions.LocalMasterDetail)
      then
        SetMasterParams(Params);

      if FOptions.QueryRecCount then
        FRecordCount := GetRecCount
      else
        FRecordCount := 0;

      if FNonBlocking then begin
        if not InfoQuery then begin
          SetCursor(crSQLArrow);
          DisableControls;
        end;
      end
      else
        StartWait;

      try
        FCommand.WriteParams;
        inherited;
      except
        on E: TObject do begin
          if FNonBlocking then begin
            EnableControls;
            StopWait;
          end;
          if E is EFailOver then begin
            UsedConnection.RestoreAfterFailOver;
            Reopen := True
          end
          else begin
            EndConnection;
            raise;
          end;
        end;
      end;
      FRowsAffected := -1;

      AfterOpenCursor(InfoQuery);                                
    until (not ReOpen);
  finally
    if UsedConnection <> nil then
      UsedConnection.PopOperation;
  end;
end;

procedure TCustomDADataset.CloseCursor;
var
  stIdx: TStatementType;
  NeedDisconnect: boolean;
begin
  NeedDisconnect := (FICommand.GetCursorState <> csInactive) and (not FIRecordSet.CanDisconnect); // if command is active and we doesn't
                                                                                                  //already substract ConnectCount after all data fetch
  inherited;

/// FUpdateQuery may be prepared for optimization purposes
  for stIdx := Low(FUpdateComponents) to High(FUpdateComponents) do
    if FUpdateComponents[stIdx] is TCustomDADataSet then
      TCustomDADataSet(FUpdateComponents[stIdx]).UnPrepare;

  if NeedDisconnect then //If there is opened cursor then we should disconnect
    EndConnection;
end;

procedure TCustomDADataset.InternalExecute;
var
  MessageID: cardinal;
begin
  if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then
    TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLExecute(Self, FinalSQL, FParams, '', MessageID, True);

  FIRecordSet.ExecCommand;

  if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then
    TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLExecute(Self, FinalSQL, FParams, '', MessageID, False);
end;

procedure TCustomDADataSet.BeforeExecute;
begin
  ; //This routine should be used for actions that performed before execute and
    //affected by local failover feature (like PrepareSQL in stored proc)
end;

procedure TCustomDADataSet.Execute;
var
  ReExecute: boolean;
begin
  if UsedConnection <> nil then
    UsedConnection.PushOperation(clExecute);
  try
    if Executing then
      Exit;
    BeginConnection;
    if Active then
       Close;
    repeat
      ReExecute := False;

      BeforeExecute;
      if not FNonBlocking then
        StartWait;
      try
        if Options.AutoPrepare then
          Prepare;
        if IsQuery then begin
          Open;
          EndConnection; //Here we decrement UsedConection.FConnectCount that was incremented in InternalExecute and then
                         //in OpenCursor, also we make disconection in case of all data fetched during Opening (Less or equal to one fetch block)
        end
        else begin
          // get param values from master dataset
          if (FDataLink.DataSource <> nil)
            and (FDataLink.DataSource.DataSet <> nil)
            and (FDataLink.DataSource.DataSet.Active)
          then
            SetMasterParams(Params);
          if FNonBlocking then
            SetCursor(crSQLArrow);
          FCommand.WriteParams;
          InternalExecute;
          if IsQuery then begin
            Open;
            EndConnection; //Here we decrement UsedConection.FConnectCount that was incremented in InternalExecute and then
                           //in OpenCursor, also we make disconection in case of all data fetched during Opening (Less or equal to one fetch block)
          end;
        end;
      except
        on E: TObject do begin
          if FNonBlocking then begin
            StopWait;
          end;
          if (E is EFailOver) and (EFailOver(E).FConnLostCause = clExecute) then begin
            UsedConnection.RestoreAfterFailOver; //Restore all read transactions
            ReExecute := True; //We should pass clConnectionApplyUpdates FailOver
          end
          else begin
            EndConnection;
            raise;
          end;
        end;
      end;
    until (not ReExecute);
  finally
    if UsedConnection <> nil then
      UsedConnection.PopOperation;
  end;
end;

procedure TCustomDADataSet.DoAfterExecute(Result: boolean);
var
  Value: variant;
begin
  if Result then begin
    FCommand.ReadParams;

    FICommand.GetProp(prRowsProcessed, Value);
    FRowsAffected := Value;
  end;

  if FNonBlocking then
    StopWait;

  if not IsQuery then begin//Leave connection alive in case of SELECT .Execute instead of .Open to perform Fetch
    if UsedConnection.Options.DisconnectedMode and Connection.Connected then begin
      //AutoCommit control
      if not (UsedConnection.AutoCommit and AutoCommit) and
        (UsedConnection.FTransactionID = '') then begin //Connection.GetInTransaction are not allowed here since it could be setted to True on
                                              // Product level during Execuion without AutoCommit (ODAC, IBDAC)
        //There is uncommitted transaction that was implicitly started by server
        UsedConnection.FTransactionID := 'CRImplicitTransaction'; //Set default value
        UsedConnection.FTransactionID := UsedConnection.GetTransactionID; //To return product specific TransactionId
                                                                  //or even reset InTransaction in case of transaction-free server operation
      end
      else
        if UsedConnection.AutoCommit and AutoCommit then begin
          UsedConnection.FTransactionID := UsedConnection.GetTransactionID; //To return product specific TransactionId
        end;
    end;
    EndConnection;    //we should read all Out parameters before disconnect
                      //In NonBlocking Mode this event must be called exactly after server execute
  end;
  if Assigned(FAfterExecute) then
    FAfterExecute(Self, Result);
end;

procedure TCustomDADataSet.DoAfterExecFetch(Result: boolean);
begin
  if Result then
    FCommand.ReadParams;

  if FNonBlocking then begin
    if Result then begin
      if State <> dsInactive then
        Resync([])
    end
    else
      Close;

    if not(FetchAll and Result) then
      StopWait;
    EnableControls;
  end;
    
  if Assigned(FAfterExecute) then
    FAfterExecute(Self, Result);
end;

procedure TCustomDADataSet.DoAfterFetchAll(Result: boolean);
begin
  if FNonBlocking then begin
    StopWait;
    if Trim(IndexFieldNames) <> '' then
      Resync([]);
  end;
end;

procedure TCustomDADataSet.DoAfterScroll;
begin
  if FFetchCanceled then begin
    Resync([]);
    FFetchCanceled := False;
  end;

  inherited;
end;

procedure TCustomDADataSet.DoOnBeforeFetch(out Cancel: boolean);
begin
  if not FNonBlocking then
    StartWait;

  if Assigned(FBeforeFetch) then
    FBeforeFetch(Self, Cancel);
  FFetchCanceled := Cancel;

end;

procedure TCustomDADataSet.DoOnAfterFetch;
begin
  if not FFetchAll or (FICommand.GetCursorState = csFetched) then
    if Assigned(FAfterFetch) then
      FAfterFetch(Self);

  if FIRecordSet.CanDisconnect then
    EndConnection; //Close connection after all data was fetched.
end;

procedure TCustomDADataSet.DoOnDataChanged;
begin
  Resync([]);
end;

function TCustomDADataSet.Executing: boolean;
var
  Value: variant;
begin
  FICommand.GetProp(prExecuting, Value);
  Result := Value;
end;

function TCustomDADataSet.Fetching: boolean;
begin
  Result := FICommand.GetCursorState in [csFetching, csFetchingAll];
end;

function TCustomDADataSet.FetchingAll: boolean;
begin
  Result := FICommand.GetCursorState = csFetchingAll;
end;

function TCustomDADataSet.Fetched: boolean;
begin
  Result := (FICommand.GetCursorState >= csFetched) or
    Active and (FICommand.GetCursorState = csInactive);
end;

procedure TCustomDADataSet.DoOnNewRecord;
var
  DataSet: TDataSet;
  MasterField, DetailField: TField;
  MasterName: string;
  DetailName: string;
  MasterPos: integer;
  DetailPos: integer;

  procedure LinkMDFields(const MasterName, DetailName: string);
  begin
    MasterField := DataSet.FindField(MasterName);
    if Assigned(MasterField) then begin
      DetailField := FindField(DetailName);
      if Assigned(DetailField) and not DetailField.ReadOnly then // CR 11917
        DetailField.Assign(MasterField);
    end;
  end;

begin
  if (DataSource <> nil) then begin
    DataSet := DataSource.DataSet;
    if (DataSet <> nil) and DataSet.Active then begin
      //MD link by MasteFields and DetailFields
      if (FMasterFields <> '') and (FDetailFields <> '') then begin
          MasterPos := 1;
          DetailPos := 1;
          while True do begin
            MasterName := ExtractFieldName(FMasterFields, MasterPos);
            DetailName := ExtractFieldName(FDetailFields, DetailPos);
            if (MasterName <> '') and (DetailName <> '') then 
              LinkMDFields(MasterName, DetailName)
            else
              break;
          end;
      end;
      //We couldn't link MD fields in case of undefined FMasterFields or FDetailFields
      //cause there is could be field names mismatch
    end;
  end;

  inherited;
end;

{ Before / After UpdateExecute }

function TCustomDADataSet.AssignedBeforeUpdateExecute: boolean;
begin
  Result := Assigned(FBeforeUpdateExecute);
end;

procedure TCustomDADataSet.DoBeforeUpdateExecute(Sender: TDataSet; StatementTypes: TStatementTypes;
  Params: TDAParams);
begin
  if AssignedBeforeUpdateExecute then
    FBeforeUpdateExecute(Sender, StatementTypes, Params);
end;

function TCustomDADataSet.AssignedAfterUpdateExecute: boolean;
begin
  Result := Assigned(FAfterUpdateExecute);
end;

procedure TCustomDADataSet.DoAfterUpdateExecute(Sender: TDataSet; StatementTypes: TStatementTypes;
  Params: TDAParams);
begin
  if AssignedAfterUpdateExecute then
    FAfterUpdateExecute(Sender, StatementTypes, Params);
end;

function TCustomDADataSet.GetActualFieldName(Field: TField): string;
var
  FieldDesc: TFieldDesc;
begin
  FieldDesc := GetFieldDesc(Field);
  Result := GetActualFieldName(FieldDesc);
end;

function TCustomDADataSet.GetActualFieldName(FieldDesc: TFieldDesc): string;
begin
  Result := FieldDesc.Name;
  if Result = '' then
    Result := FieldDesc.ActualName;
  Result := QuoteName(Result);
end;

procedure TCustomDADataSet.GetCurrentKeys(out KeyFields: TFieldArray; out Values: variant);
var
  KeyAndDataFields: TKeyAndDataFields;
  KeyFieldsCount, DataFieldsCount: integer;
  i, j: integer;
  RecBuf: TRecordBuffer;
  TmpVar: variant;
  Delta: integer;
  EmptyRecBuf: boolean;
begin
  GetKeyAndDataFields(KeyAndDataFields, False);
  KeyFieldsCount := Length(KeyAndDataFields.KeyFieldDescs);
  DataFieldsCount := Length(KeyAndDataFields.DataFieldDescs);
  SetLength(KeyFields, KeyFieldsCount);
  Values := Unassigned;

  EmptyRecBuf := not GetActiveRecBuf(RecBuf);

  if KeyFieldsCount = 1 then begin
    KeyFields[0] := GetField(KeyAndDataFields.KeyFieldDescs[0]);
    if not EmptyRecBuf then
      Data.GetFieldAsVariant(KeyAndDataFields.KeyFieldDescs[0].FieldNo, RecBuf, Values);
  end
  else
  if KeyFieldsCount > 1 then begin
    Values := VarArrayCreate([0, KeyFieldsCount - 1], varVariant);
    for i := 0 to KeyFieldsCount - 1 do begin
      KeyFields[i] := GetField(KeyAndDataFields.KeyFieldDescs[i]);
      Values[i] := Unassigned;
      if not EmptyRecBuf then begin
        Data.GetFieldAsVariant(KeyAndDataFields.KeyFieldDescs[i].FieldNo, RecBuf, TmpVar);
        Values[i] := TmpVar;
      end;  
    end;
  end
  else
  if (KeyFieldsCount = 0) and (DataFieldsCount > 0) then begin
    Delta := 0;
    Assert(FSQLGenerator <> nil);
    for i := DataFieldsCount - 1 downto 0 do
      if FSQLGenerator.IsBlobDataType(KeyAndDataFields.DataFieldDescs[i].DataType) or
        FSQLGenerator.IsObjectDataType(KeyAndDataFields.DataFieldDescs[i].DataType)
      then begin
        Inc(Delta);
        for j := i to DataFieldsCount - Delta - 1 do
          KeyAndDataFields.DataFieldDescs[j] := KeyAndDataFields.DataFieldDescs[j + 1]; 
      end;

    SetLength(KeyFields, DataFieldsCount - Delta);
    Values := VarArrayCreate([0, DataFieldsCount - Delta - 1], varVariant);
    for i := 0 to DataFieldsCount - Delta - 1 do begin
      KeyFields[i] := GetField(KeyAndDataFields.DataFieldDescs[i]);
      Values[i] := Unassigned;
      if not EmptyRecBuf then begin
        Data.GetFieldAsVariant(KeyAndDataFields.DataFieldDescs[i].FieldNo, RecBuf, TmpVar);
        Values[i] := TmpVar;
      end;
    end;
  end;
end;

procedure TCustomDADataSet.DataReopen;
begin
  if Data.IsFullReopen then
    ClearCachedKeyAndDataFields;

  Data.Reopen;    
end;

procedure TCustomDADataSet.InternalRefresh;
var
  MessageID: cardinal;
  KeyFields: TFieldArray;
  Values: variant;

  KeyFieldsReaded, Retry: boolean;
begin
  if UsedConnection <> nil then
    UsedConnection.PushOperation(clRefresh, OpenCursorAllowFailOver);
  try
    KeyFieldsReaded := False;
    BeginConnection;
    repeat
      Retry := False;
      try
        if not KeyFieldsReaded then
          GetCurrentKeys(KeyFields, Values);
        KeyFieldsReaded := True; //this will allow us to restore active record after failover
        if FOptions.QueryRecCount then
          FRecordCount := GetRecCount
        else
          FRecordCount := 0;

        if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then
          TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLExecute(Self, FinalSQL, FParams, 'Refresh', MessageID, True);

        StartWait;
        FCommand.WriteParams;

        inherited;

        if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then
          TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLExecute(Self, FinalSQL, FParams, 'Refresh', MessageID, False);

        FRowsAffected := -1;

        if Length(KeyFields) = 0 then // CR N 11512
          First
        else begin
          DoBeforeScroll;
          if not LocateRecord(KeyFields, Values, [], False) then
            First
          else begin
            Resync([]);
            DoAfterScroll;
          end;
        end;

      except
        on E: Exception do begin
{         if FNonBlocking then begin
            EnableControls;
            StopWait;
          end;}          
          if E is EFailOver then begin
            UsedConnection.RestoreAfterFailOver;
            Retry := True
          end
          else
            raise;
        end;
      end;

    until not Retry;
  finally
    if UsedConnection <> nil then
      UsedConnection.PopOperation;
  end;
end;

procedure TCustomDADataSet.InternalRefreshQuick(const CheckDeleted: boolean);
var
  KeyAndDataFields: TKeyAndDataFields;

var
  OldStrictUpdate, OldFiltered: boolean;
  KeyFields: TFieldArray;
  Values: variant;
  KeyFieldsCount: integer;

begin
  DoBeforeRefresh;
  
  BeginConnection;
  try
    CheckActive;

    GetKeyAndDataFields(KeyAndDataFields, False);
    KeyFieldsCount := Length(KeyAndDataFields.KeyFieldDescs);
    if KeyFieldsCount = 0 then
      DatabaseError(SKeyFieldsReq);

    CheckBrowseMode;
    if FUpdatingTableInfoIdx = - 1 then
      Exit;

    OldStrictUpdate := Options.StrictUpdate;
    OldFiltered := Filtered;
    DisableControls;
    try
      Filtered := False;
      Options.StrictUpdate := False;
      GetCurrentKeys(KeyFields, Values);

      if CheckDeleted and not IsEmpty then
        PerformSQL('', [stRefreshCheckDeleted]);

      PerformSQL('', [stRefreshQuick]);

      if not Locate(KeyFields, Values, []) then
        First;
    finally
      Options.StrictUpdate := OldStrictUpdate;
      Filtered := OldFiltered;
      EnableControls;
      DoAfterRefresh;
    end;

  finally
    EndConnection;
  end;
end;

procedure TCustomDADataSet.InternalClose;
var
  i: integer;
begin
  try
    try
      inherited;
    except
      on E: EDAError do  // Borland's bug in DoInternalClose with FBufferCount
        if not(UsedConnection.IsFatalError(E)) then
          raise;
      else
        raise;
    end;
  finally
    FIdentityField := nil;
    if not Prepared then begin // In case that User doesn't call Prepare directly
      FIRecordSet.TablesInfo.Clear;
      FUpdatingTableInfoIdx := -1;
    end;
    ClearCachedKeyAndDataFields;

    for i := 0 to Length(FLocalMDLinks) - 1 do
      if not FLocalMDLinks[i].NativeBuffer then
      Marshal.FreeHGlobal(FLocalMDLinks[i].Buffer);
    SetLength(FLocalMDLinks, 0);
  end;  
end;

function TCustomDADataSet.GetRecCount: longint;
begin
  Result := 0;
end;

procedure TCustomDADataSet.SetRefreshOptions(Value: TRefreshOptions);
begin
  FRefreshOptions := Value;
end;

{ Edit }

procedure TCustomDADataSet.SetReadOnly(Value: boolean); 
begin
  FReadOnly := Value;
end;

function TCustomDADataSet.IsNeedEditPreconnect: boolean;
begin
  Result := False;
end;

function TCustomDADataSet.IsNeedInsertPreconnect: boolean;
begin
  Result := False;
end;

procedure TCustomDADataSet.InternalBeforeEdit;
begin
end;

procedure TCustomDADataSet.InternalEdit;
begin
  if IsNeedEditPreconnect then
    BeginConnection;
  try
    InternalBeforeEdit;

    inherited;
  except
    if IsNeedEditPreconnect then
      EndConnection;
    raise;
  end;
end;

procedure TCustomDADataSet.InternalInsert;
begin
  if IsNeedInsertPreconnect then
    BeginConnection;
  try
    inherited;
  except
    if IsNeedInsertPreconnect then
      EndConnection;
  end;
end;

function TCustomDADataSet.IsPreconnected : boolean;
begin
  Result := ((State = dsEdit) and IsNeedEditPreconnect) or
    ((State = dsInsert) and IsNeedInsertPreconnect);
end;

procedure TCustomDADataSet.InternalCancel;
begin
  try
    inherited;
  finally
    if IsPreconnected then
      EndConnection;
  end;
end;

procedure TCustomDADataSet.InternalPost;
var
  DataSet: TDataSet;
  MasterField, DetailField: TField;
  MasterName: string;
  DetailName: string;
  MasterPos: integer;
  DetailPos: integer;
  RemoveRecord: Boolean;
begin
  try
    inherited;

    if IsConnectedToMaster then begin
      DataSet := DataSource.DataSet;
      if (DataSet <> nil) and (DataSet.Active) then begin
        MasterPos := 1;
        DetailPos := 1;
        While True do begin
          MasterName := ExtractFieldName(FMasterFields, MasterPos);
          DetailName := ExtractFieldName(FDetailFields, DetailPos);
          if (MasterName <> '') and (DetailName <> '') then begin
            MasterField := DataSet.FindField(MasterName);
            if Assigned(MasterField) then begin
              DetailField := FindField(DetailName);
              if Assigned(DetailField) then begin                  // Fixed bug with case insensitive master/detail
                if (not UsedConnection.IsCaseSensitive) and
                  (VarType(DetailField.AsVariant) = {$IFDEF CLR} varChar {$ELSE} varString {$ENDIF}) and
                  (VarType(MasterField.AsVariant) = {$IFDEF CLR} varChar {$ELSE} varString {$ENDIF}) then
                    RemoveRecord := AnsiCompareTextS(DetailField.AsVariant, MasterField.AsVariant) <> 0
                else
                  if (not UsedConnection.IsCaseSensitive) and
                    (VarType(DetailField.AsVariant) = {$IFDEF CLR} varChar {$ELSE} varOleStr {$ENDIF}) and
                    (VarType(MasterField.AsVariant) = {$IFDEF CLR} varChar {$ELSE} varOleStr {$ENDIF}) then
                      RemoveRecord := AnsiStrICompWS(DetailField.AsVariant, MasterField.AsVariant) <> 0
                  else
                    RemoveRecord := not VarEqual(DetailField.AsVariant, MasterField.AsVariant);
                if RemoveRecord then begin
                  Assert(not CachedUpdates, 'Can not use Master/Detail with CachedUpdates');
                  FIRecordSet.RemoveRecord;
                  Exit;
                end;
              end;
            end;
          end
          else
            break;
        end;
      end;
    end;

    if (State = dsInsert) and not CachedUpdates and (roAfterInsert in RefreshOptions) and
      RefreshAfterInsertAllowed
    then
      InternalRefreshRecord;
  finally
    if IsPreconnected then
      EndConnection;
  end;
end;

procedure TCustomDADataSet.InternalDeferredPost;
begin
  FActiveRecRefresh := True;
  try
    inherited;

    if (State = dsInsert) and not CachedUpdates and (roAfterInsert in RefreshOptions) and
      RefreshAfterInsertAllowed
    then
      InternalRefreshRecord;
  finally
    FActiveRecRefresh := False;
  end;
end;

procedure TCustomDADataSet.CreateSQLGenerator;
begin
  SetSQLGenerator(TDASQLGenerator.Create(Self));
end;

procedure TCustomDADataSet.FreeSQLGenerator;
begin
  FSQLGenerator.Free;
  FSQLGenerator := nil;
end;

procedure TCustomDADataSet.SetSQLGenerator(Value: TDASQLGenerator);
begin
  FreeSQLGenerator;
  FSQLGenerator := Value;
end;

function TCustomDADataSet.GetUpdateStatement(const StatementType: TStatementType): string;
var
  UpdateSQL: TStrings;
  SelectSQL: string;
begin
  UpdateSQL:= FUpdateSQL[StatementType];
  if UpdateSQL = nil then
    Result := ''
  else
  begin
    Result := UpdateSQL.Text;
    if StatementType = stRefresh then begin
      Result := Trim(Result);
      if Pos('WHERE', AnsiUpperCase(Result)) = 1 then begin
        if SQLGeneratorCompatibility then
          SelectSQL := BaseSQL
        else
          SelectSQL := Self.SQL.Text;
        Result := SQLAddWhere(SelectSQL, Trim(Copy(Result, 6, Length(Result))));
      end;
    end;
  end;
end;

function TCustomDADataSet.GetUpdateSQLStatementTypes: TStatementTypes;
begin
  Result := [stInsert, stDelete, stUpdate, stRefresh];
end;

procedure TCustomDADataSet.SetUpdateSQLIndex(Index: integer; Value: TStrings);
begin
  with FUpdateSQL[TStatementType(Index)] do begin
    BeginUpdate;
    try
      Assign(Value);
    finally
      EndUpdate;
    end;
  end;
end;

function TCustomDADataSet.GetUpdateSQLIndex(Index: integer): TStrings;
begin
  Result := FUpdateSQL[TStatementType(Index)];
end;

procedure TCustomDADataSet.GetIdentityField;
begin
end;

procedure TCustomDADataSet.GetKeyAndDataFields(out KeyAndDataFields: TKeyAndDataFields;
  const ForceUseAllKeyFields: boolean);
begin
end;

procedure TCustomDADataSet.ClearCachedKeyAndDataFields;
begin
  SetLength(FCachedKeyAndDataFields[False].KeyFieldDescs, 0);
  SetLength(FCachedKeyAndDataFields[False].DataFieldDescs, 0);
  SetLength(FCachedKeyAndDataFields[True].KeyFieldDescs, 0);
  SetLength(FCachedKeyAndDataFields[True].DataFieldDescs, 0);
end;

function TCustomDADataSet.PerformAppend: boolean;
begin
  Result := PerformSQL('', [stInsert]);

  if Result then begin
    GetIdentityField;

    // Additional InternalRefreshRecord (for CachedUpdates = False) call is
    // moved to InternalPost in order to avoid bug with TMemData.PutRecord in
    // PerformSQL.
    if (roAfterInsert in RefreshOptions) and FInCacheProcessing and
      RefreshAfterInsertAllowed
    then
      InternalRefreshRecord;
  end;
end;

function TCustomDADataSet.PerformDelete: boolean;
begin
  Result := PerformSQL('', [stDelete]);
end;

function TCustomDADataSet.PerformUpdate: boolean;
begin
  Result := PerformSQL('', [stUpdate]);

  if Result and (roAfterUpdate in RefreshOptions) then
    InternalRefreshRecord;
end;

procedure TCustomDADataSet.InternalRefreshRecord;
begin
  if CachedUpdates and (UpdateStatus = usModified) and (not FInCacheProcessing) then
    RevertRecord; {TODO -cMemoryLeak: cause memory leak and DisposeBuf failed}
  FreeRefComplexFields(ActiveBuffer);
  PerformSQL('', [stRefresh]);
end;

procedure TCustomDADataSet.Resync(Mode: TResyncMode);
begin
  // this need if Resync called for closed dataset (AV BUG !!!)
  if Active then
    inherited;
end;

procedure TCustomDADataSet.GetDetailLinkFields(MasterFields, DetailFields: {$IFDEF CLR}TObjectList{$ELSE}TList{$ENDIF});

  function AddFieldToList(const FieldName: string; DataSet: TDataSet;
    List: TList): Boolean;
  var
    Field: TField;
  begin
    Field := DataSet.FindField(FieldName);
    if (Field <> nil) then
      List.Add(Field);
    Result := Field <> nil;
  end;

var
  i: Integer;

  DataSet: TDataSet;
  MasterName: string;
  DetailName: string;
  MasterPos: integer;
  DetailPos: integer;
begin
  MasterFields.Clear;
  DetailFields.Clear;
  if (DataSource <> nil) and (DataSource.DataSet <> nil) then begin
    if Params.Count > 0 then
    begin
      for i := 0 to Params.Count - 1 do
        if AddFieldToList(Params[i].Name, DataSource.DataSet, MasterFields) then
           AddFieldToList(Params[i].Name, Self, DetailFields)
    end
    else
    if (Self.MasterFields <> '') and (Self.DetailFields <> '') then
    begin
      DataSet := DataSource.DataSet;
      if (DataSet <> nil) and DataSet.Active then begin
        MasterPos := 1;
        DetailPos := 1;
        while True do begin
          MasterName := ExtractFieldName(FMasterFields, MasterPos);
          DetailName := ExtractFieldName(FDetailFields, DetailPos);
          if (MasterName = '') or (DetailName = '') then
            Break;
          if AddFieldToList(MasterName, DataSource.DataSet, MasterFields) then
             AddFieldToList(DetailName, Self, DetailFields);
        end;
      end;
    end;
  end;
end;

function TCustomDADataSet.FindKey(const KeyValues: array of const): Boolean;
  function GetKeyValue(Index: integer): variant; // nearly copied from TField.AssignValue
    procedure Error;
    begin
      DatabaseErrorFmt(SFieldValueError, [IntToStr(Index)]);
    end;
  {$IFDEF CLR}
  var
    Value: Variant;
  {$ENDIF}
  begin
    Result := Unassigned;
  {$IFDEF CLR}
    Value := Variant(KeyValues[Index]); 
    case VarType(Value) of
      varInteger, varSmallInt, varShortInt, varByte, varWord, varLongWord, varInt64, varUInt64:
        Result := Integer(Value);
      varBoolean:
        Result := Boolean(Value);
      varChar, varString:
        Result := String(Value);
      varDouble, varSingle:
        Result := Double(Value);
      varObject:
        Result := Value;
      varEmpty, varNull:
        {Clear};
      varDateTime, varDate:
        Result := TDateTime(Value);
      {varDecimal:
        AsBcd := Value;}
      varCurrency:
        Result := Currency(Value);
      else
        Error;
    end;
  {$ELSE}
    with KeyValues[Index] do
      case VType of
        vtInteger:
          Result := Integer(VInteger);
        vtInt64: begin /// CR-D12558
        {$IFDEF VER6P}
          Result := VInt64^;
        {$ELSE}
          TVarData(Result).VType := varDecimal;
          TVarDataD6(Result).VInt64 := VInt64^;
        {$ENDIF}
        end;
        vtBoolean:
          Result := Boolean(VBoolean);
        vtChar:
          Result := String(VChar);
        vtExtended:
          Result := Extended(VExtended^);
        vtString:
          Result := String(VString^);
        vtPointer, vtObject:
          if VPointer <> nil then Error;
        vtPChar:
          Result := String(VPChar);
        vtAnsiString:
          Result := String(VAnsiString);
        vtCurrency:
          Result := Currency(VCurrency^);
        vtVariant:
          if not {$IFDEF VER6P}VarIsClear{$ELSE}VarIsEmpty{$ENDIF}(VVariant^) then
            Result := Variant(VVariant^);
        vtWideString:
          Result := WideString(VWideString);
      else
        Error;
      end;
  {$ENDIF}
  end;

var
  KeyAndDataFields: TKeyAndDataFields;
  Values: variant;
  KeyFieldsCount: integer;
  KeyFields: TFieldArray;
  i: integer;
begin
  CheckBrowseMode;
  GetKeyAndDataFields(KeyAndDataFields, False);

  Values := Unassigned; // To prevent warning
  KeyFieldsCount := Length(KeyAndDataFields.KeyFieldDescs);
  SetLength(KeyFields, KeyFieldsCount);
  case KeyFieldsCount of
    0:
      DatabaseError(SKeyFieldsRequired);
    1: begin
      KeyFields[0] := GetField(KeyAndDataFields.KeyFieldDescs[0]);
      Values := GetKeyValue(0);
    end;
    else
    begin
      Values := VarArrayCreate([0, KeyFieldsCount - 1], varVariant);
      for i := 0 to KeyFieldsCount - 1 do begin
          KeyFields[i] := GetField(KeyAndDataFields.KeyFieldDescs[i]);

        if i <= High(KeyValues) then
          Values[i] := GetKeyValue(i)
        else
          Values[i] := Unassigned;
      end;
    end;
  end;

  Result := LocateEx(KeyFields, Values, FFindKeyOptions);
end;

procedure TCustomDADataSet.FindNearest(const KeyValues: array of const);
begin
  FFindKeyOptions := [lxNearest];
  try
    FindKey(KeyValues);
  finally
    FFindKeyOptions := [];
  end;
end;

procedure TCustomDADataSet.GotoCurrent(DataSet: TCustomDADataSet);
var
  KeyFields: TFieldArray;
  Values: variant;
begin
  DataSet.GetCurrentKeys(KeyFields, Values);
  if (Length(KeyFields) = 0) or not Locate(KeyFields, Values, []) then
    First;
end;

procedure TCustomDADataSet.InternalApplyUpdates(AllowFailOver: boolean);
var
  ReApply: boolean;
begin
  if (UsedConnection <> nil) then
    UsedConnection.PushOperation(clApply, AllowFailOver); //Add ApplyUpdates Operation to Operations Stack (FailOver)
  try
    repeat
      ReApply := False;
      try
        inherited ApplyUpdates;
        
      except
        on E: EFailOver do
          if E.FConnLostCause = clApply then begin
            UsedConnection.RestoreAfterFailOver;
            ReApply := True;
          end
          else
            raise;
      end;
    until (not ReApply);
  finally
    if UsedConnection <> nil then
      UsedConnection.PopOperation; //Remove ApplyUpdates Operation from Operations Stack
  end;
end;


procedure TCustomDADataSet.ApplyUpdates;
begin
  if UsedConnection = nil then
    DatabaseError(SConnectionNotDefined);

  InternalApplyUpdates(not UsedConnection.InTransaction and not AutoCommit);
end;

procedure TCustomDADataSet.RefreshRecord;
begin
  CheckActive;

  case State of
    dsInsert:
    begin
      Cancel;
      Exit;
    end;
    dsEdit:
      Cancel;
    dsSetKey:
      Post;
  end;
  
  if not IsEmpty then begin
    UpdateCursorPos;
    InternalRefreshRecord;
    if FRowsAffected = 0 then begin
    // remove deleted record from dataset
      if Options.RemoveOnRefresh then
        FIRecordSet.RemoveRecord;
      Resync([]);
    end
    else
      if FRowsAffected > 0 then
        Resync([]);
    //DataEvent(deRecordChange, 0);
  end;
end;

procedure TCustomDADataSet.AssignFieldValue(Param: TDAParam; Field: TField;
  Old: boolean);
begin
  if Param.IsObjectDataType(Field.DataType) then begin
    Param.DataType := Field.DataType;
    Param.ParamObject := GetFieldObject(Field);
  end
  else
    if Old then
      Param.AssignFieldValue(Field, Field.OldValue)
    else
      Param.AssignFieldValue(Field, Field.NewValue);
end;

procedure TCustomDADataSet.AssignFieldValue(Param: TDAParam; FieldDesc: TFieldDesc; Old: boolean);
var
  FieldType: TFieldType;
begin
  FieldType := GetFieldType(FieldDesc.DataType);
  if Param.IsObjectDataType(FieldType) then begin
    Param.DataType := FieldType;
    Param.ParamObject := GetFieldObject(FieldDesc);
  end
  else
    Assert(False, 'This overload should be used only for object fields');
end;

procedure TCustomDADataSet.CheckUpdateQuery(const StatementType: TStatementType);
begin
  FUpdateQuery := FUpdateComponents[StatementType];
  if FUpdateQuery = nil then begin
    Assert(UsedConnection <> nil);
    FUpdateQuery := UsedConnection.CreateDataSet;
    TCustomDADataSet(FUpdateQuery).FIRecordSet.Component := Self;
  end
  else
    if FUpdateQuery is TCustomDADataSet then
      TCustomDADataSet(FUpdateQuery).Connection := UsedConnection
    else
    if FUpdateQuery is TCustomDASQL then
      TCustomDASQL(FUpdateQuery).Connection := UsedConnection
    else
      Assert(False, 'FUpdateQuery is ' + FUpdateQuery.ClassName);

  TDBAccessUtils.SetLockDebug(FUpdateQuery, True);

  if FUpdateQuery is TCustomDADataSet then begin
    TCustomDADataSet(FUpdateQuery).Close; // To prevent exception raising on setting properties
    TCustomDADataSet(FUpdateQuery).Options.TrimFixedChar := Options.TrimFixedChar;
    TCustomDADataSet(FUpdateQuery).Options.TrimVarChar := Options.TrimVarChar;
    TCustomDADataSet(FUpdateQuery).Options.FlatBuffers := True;
    TCustomDADataSet(FUpdateQuery).Options.FullRefresh := Options.FullRefresh;
  {$IFDEF HAVE_COMPRESS}
    TCustomDADataSet(FUpdateQuery).Options.CompressBlobMode := Options.CompressBlobMode;
    if StatementType in [stRefresh, stRefreshQuick, stRefreshCheckDeleted] then
      TCustomDADataSet(FUpdateQuery).Options.LongStrings := Options.LongStrings;
  {$ENDIF}
    if StatementType = stBatchUpdate then begin
      TCustomDADataSet(FUpdateQuery).ParamCheck := False;
      TCustomDADataSet(FUpdateQuery).Params.Clear;
    end;  
  end;
  FUpdateComponents[StatementType] := FUpdateQuery;
end;

/// UpdateExecute performes execute of the UpdateQuery. We need this procedure
/// to get two update models: with and without explicit prepare.
procedure TCustomDADataSet.UpdateExecute;
var
  MessageID: cardinal;
  i: integer;
  St: string;
begin
  if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then begin
    St := '';
    for i := 0 to Integer(High(TStatementType)) do
      if TStatementType(i) in StatementTypes then begin
        if St <> '' then
          St := St + ',';
        St := St + Copy(GetEnumName(TypeInfo(TStatementType), i), 3,
          Length(GetEnumName(TypeInfo(TStatementType), i)));
      end;
    TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLExecute(Self, TDBAccessUtils.GetSQL(FUpdateQuery).Text, TDBAccessUtils.GetParams(FUpdateQuery), St, MessageID, True);
  end;

  TDBAccessUtils.Execute(FUpdateQuery);

  if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then
    TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLExecute(Self, TDBAccessUtils.GetSQL(FUpdateQuery).Text, TDBAccessUtils.GetParams(FUpdateQuery), St, MessageID, False);
end;

function TCustomDADataSet.IsAutoCommit: boolean;
begin
  Result := AutoCommit;
end;

procedure TCustomDADataSet.CheckUpdateSQL(const SQL: string; const StatementTypes: TStatementTypes;
  out ParamsInfo: TDAParamsInfo);
var
  NewSQL, OldSQL: string;
  StatementType: TStatementType;
  stIdx: TStatementType;
  CheckSQLNeeded: boolean;
  UpdateObjectSQL: TStrings;
  IsSQLAutoGenerated: boolean;
  Index: Integer;
  LockMacros: boolean;
  LockAssembleSQL: boolean;
  DisableScanParams: boolean;
  UQParams: TDAParams;

begin
  IsSQLAutoGenerated := False;
  CheckSQLNeeded := True;
  StatementType := stCustom;
  for stIdx := Low(TStatementType) to High(TStatementType) do
    if stIdx in StatementTypes then begin
      if StatementType <> stCustom then
        StatementType := stCustom
      else
        StatementType := stIdx;
      if StatementType = stCustom then
        Break;
    end;

  FUpdateQuery := nil;
  try
    if Assigned(UpdateObject) then begin
      FUpdateQuery := UpdateObject.GetObjectIndex(Ord(StatementType));
      if FUpdateQuery <> nil then begin
        CheckSQLNeeded := False;
        if not ((FUpdateQuery is TCustomDADataSet) and TCustomDADataSet(FUpdateQuery).SQLAutoGenerated) and
          (TDBAccessUtils.GetSQL(FUpdateQuery).Count = 0)
        then
          DatabaseError(SUpdateObjectEmptySQL);
      end;
    end;
    if FUpdateQuery = nil then
      CheckUpdateQuery(StatementType);
  finally
    Assert(FUpdateQuery <> nil, 'FUpdateQuery = nil. StatementTypes = ' + IntToStr(Word(StatementTypes)));
  end;

  if CheckSQLNeeded then begin
    TDBAccessUtils.SetAutoCommit(FUpdateQuery,
      (StatementTypes * [stInsert, stUpdate, stDelete, stBatchUpdate] <> []) and IsAutoCommit);

    NewSQL := SQL;
    if StatementType = stBatchUpdate then
      NewSQL := PrepareBatch(FBatchSQLs.ToString)
    else
      if NewSQL = '' then begin
        if Assigned(UpdateObject) then
          UpdateObjectSQL := UpdateObject.GetSQLIndex(Ord(StatementType))
        else
          UpdateObjectSQL := nil;

        if Assigned(UpdateObjectSQL) then
          NewSQL := UpdateObjectSQL.Text;

        if NewSQL = '' then begin
          NewSQL := GetUpdateStatement(StatementType);
          if (NewSQL <> '') and (Macros.Count > 0) then
            Macros.Expand(NewSQL);

          if NewSQL = '' then begin
            IsSQLAutoGenerated := True;
            if BatchUpdate then
              Index := FBatchStatements
            else
              Index := -1;

            if ((StatementType = stRefreshCheckDeleted) or (StatementType = stRefreshQuick))
              and (
                (FFilterSQL <> '')
                or ((DataSource <> nil) and (FMasterFields <> '') and (FDetailFields <> '') and not (FOptions.LocalMasterDetail))
              )
            then /// CR S22583 (RefreshQuick + MD)
              UQParams := nil
            else
              UQParams := TDBAccessUtils.GetParams(FUpdateQuery);
            NewSQL := FSQLGenerator.GenerateSQL(StatementType,
              not (csDesigning in ComponentState) and not Options.UpdateAllFields,
              UQParams, Index);
            case StatementType of
              stInsert, stUpdate, stDelete:
                LockMacros := True;
              else
                LockMacros := False;
            end;
            if UQParams = nil then
              LockAssembleSQL := False
            else
              LockAssembleSQL := not (StatementType in [stRefreshQuick, stRefreshCheckDeleted]) and not (((Params.Count > 0) or Options.FullRefresh) and (StatementType = stRefresh));
            DisableScanParams := LockAssembleSQL;
            TDBAccessUtils.SetSQLText(FUpdateQuery, NewSQL,
              LockAssembleSQL,
              LockMacros,
              DisableScanParams);
            ParamsInfo := FSQLGenerator.ParamsInfo;
          end;
        end;
      end;

    // Check whether SQL text is the same. For multiple update operations.
    if BatchUpdate and not ((StatementType = stBatchUpdate) or (StatementType = stLock) or (StatementType = stRefresh)) then begin
      if not IsSQLAutoGenerated then
         NewSQL := FCommand.ParseSQL(NewSQL, nil, ':' + FSQLGenerator.IndexedPrefix + IntToStr(FBatchStatements) + '_');
      if NewSQL <> '' then begin
        if FBatchSQLs.Length <> 0 then
          FBatchSQLs.Append(#13#10);
        FBatchSQLs.Append(NewSQL);
        FBatchSQLs.Append(';');
        inc(FBatchStatements);
      end;
    end;

    Assert(FUpdateQuery <> nil);
    if not IsSQLAutoGenerated then begin
      OldSQL := TDBAccessUtils.GetSQL(FUpdateQuery).Text;
      NewSQL := NewSQL;
      if OldSQL <> NewSQL then begin
        TDBAccessUtils.GetParams(FUpdateQuery).Clear; /// Performance optimization - skipping reassigning old params values on changing SQL
        TDBAccessUtils.GetSQL(FUpdateQuery).Text := NewSQL;
      end;
    end;

    //Used user defined SQL and internal update object used so we could prepare Update object to obtain some performance gain
    if Options.PrepareUpdateSQL and not UsedConnection.Options.DisconnectedMode and not BatchUpdate then begin
      if FUpdateQuery is TCustomDADataSet then
        TCustomDADataSet(FUpdateQuery).Options.AutoPrepare := not IsSQLAutoGenerated and (SQL = '')
      else
      if FUpdateQuery is TCustomDASQL then
        TCustomDASQL(FUpdateQuery).Prepared :=  not IsSQLAutoGenerated and (SQL = '');
    end;
  end;
end;

function TCustomDADataSet.UseParamType: boolean;
begin
  Result := False;
end;

function TCustomDADataSet.FieldByParamName(var ParamName: string; var Old: boolean; var AFieldNo: integer): TField;
// Returns field that corresponds to ParamName
  function FindFieldByFieldNo(FieldNo: integer): TField;
  var
    i: integer;
  begin
    for i := 0 to Fields.Count - 1 do begin
      Result := Fields[i];
      if Result.FieldNo = FieldNo then
        Exit;
    end;
    Result := nil;
  end;

var
  e: integer;
begin
  Old := CompareText(Copy(ParamName, 1, 4), 'OLD_') = 0;
  Result := nil;
  if Old then begin
    Result := FindField(ParamName);
    if Result <> nil then
      Old := False // fieldname is starting with OLD_
    else
      ParamName := Copy(ParamName, 5, Length(ParamName) - 4);
  end;

  if Result = nil then begin
    Val(ParamName, AFieldNo, e);
    if e = 0 then
      Result := FindFieldByFieldNo(AFieldNo)
    else
      AFieldNo := -1;
  end
  else begin
    AFieldNo := -1;
  end;

  if Result = nil then
    Result := FindField(ParamName);
end;

function TCustomDADataSet.BatchUpdate: boolean;
begin
  Result := FInCacheProcessing and (FOptions.UpdateBatchSize > 1) and
    not Assigned(UpdateObject);
end;

function TCustomDADataSet.CanFlushBatch: boolean;
begin
  Result := BatchUpdate and (FBatchStatements > 0) and (FBatchStatements >= FOptions.UpdateBatchSize);
end;

procedure TCustomDADataSet.ClearBatch;
begin
  FBatchSQLs.Length := 0;
  FBatchParams.Clear;
  FBatchStatements := 0;
end;

procedure TCustomDADataSet.FlushBatch;
begin
  if FBatchStatements > 0 then
    try
      PerformSQL('', [stBatchUpdate]);
    finally
      ClearBatch;
    end;
end;

function TCustomDADataSet.PrepareBatch(SQL: string): string;
begin
  Result := SQL;
end;

function TCustomDADataSet.PerformSQL(const SQL: string; const StatementTypes: TStatementTypes): boolean;

  function FindFieldByFieldNo(FieldNo: integer): TField;
  var
    i: integer;
  begin
    for i := 0 to Fields.Count - 1 do begin
      Result := Fields[i];
      if Result.FieldNo = FieldNo then
        Exit;
    end;
    Result := nil;
  end;

  function FindFieldDescByFieldNo(FieldNo: integer): TFieldDesc;
  var
    i: integer;
  begin
    for i := 0 to FIRecordSet.Fields.Count - 1 do begin
      Result := FIRecordSet.Fields[i];
      if Result.FieldNo = FieldNo then
        Exit;
    end;
    Result := nil;
  end;

  function SuppressBatchPrefix(Value: string): string;
  var
    i,e: integer;
  begin
    Result := Value;
    if BatchUpdate then begin
      i := Pos(FSQLGenerator.IndexedPrefix, Value);
      if i > 0 then begin
        e := i + 2;
        while (e <= Length(Result)) and (Result[e] <> '_') do
          inc(e);

        {$IFDEF CLR}Borland.Delphi.{$ENDIF}System.Delete(Result, i, e - i + 1);
      end;  
    end;
  end;

  procedure WriteUQParams(ParamsInfo: TDAParamsInfo);
  var
    i: integer;
    Param, Param1: TDAParam;
    ParamName: string;
    Old: boolean;
    Field: TField;
    AFieldNo: integer;
    AFieldDesc: TFieldDesc;
    Params: TDAParams;
    LowIndex: integer;

    procedure AssignFieldValueEx(Param: TDAParam; Field: TField; Old: boolean);
    begin
      if UseParamType and
        ((Param.ParamType = ptOutput) or (Param.ParamType = ptResult)) then begin
        Param.DataType := Field.DataType;
        Param.Value := Null;
      end
      else
        AssignFieldValue(Param, Field, Old);
    end;

  begin
  {$IFDEF PERF_COUNTER}
    PerfCounters[5].Start;
  {$ENDIF}

    // assigning parameter values from fields of the same name
    if BatchUpdate then begin
      // copy parameters from UpdateQuery to common collection
      if FBatchParams = nil then
        FBatchParams := FCommand.CreateParamsObject;

      Params := TDBAccessUtils.GetParams(FUpdateQuery);
      FBatchParams.BeginUpdate;
      try
        for i := 0 to Params.Count - 1 do
          FBatchParams.CreateParam(Params[i].DataType, Params[i].Name, Params[i].ParamType);
      finally
        FBatchParams.FNeedsUpdateItem := False;
        FBatchParams.EndUpdate;
        RecreateParamsRef(FBatchParams);
        FBatchParams.FNeedsUpdateItem := True;
      end;

      Params := FBatchParams;
      LowIndex := Params.Count - TDBAccessUtils.GetParams(FUpdateQuery).Count;
    end
    else begin
      Params := TDBAccessUtils.GetParams(FUpdateQuery);
      LowIndex := 0;
    end;

    for i := LowIndex to Params.Count - 1 do begin
      Param := Params[i];
      AFieldNo := -1;
      ParamName := '';
      Field := nil;
      if (ParamsInfo <> nil) and ([stRefreshQuick, stRefreshCheckDeleted] * StatementTypes =[]) and not ((Self.Params.Count > 0) and (stRefresh in StatementTypes)) then begin
        Old := ParamsInfo.Items[i - LowIndex].Old;
        Field := ParamsInfo.Items[i - LowIndex].Field;
      end;

      if (ParamsInfo = nil) or (Field = nil) then begin
        // should remove additional index before assigning value from field
        ParamName := SuppressBatchPrefix(Param.Name);
        if (MasterSource <> nil) and (MasterFields = '') and (DetailFields = '') and (Self.Params.Count > 0) and (stRefresh in StatementTypes) then begin
          if FindParam(ParamName) = nil then
            Field := FieldByParamName(ParamName, Old, AFieldNo)
        end
        else
          Field := FieldByParamName(ParamName, Old, AFieldNo);
      end;

      if Field <> nil then
        AssignFieldValueEx(Param, Field, Old and (not ((State = dsInsert) and not FInDeferredPost))) // OldValue is Null on Insert
      else begin
        Assert(ParamName <> '');

        AFieldDesc := nil;
        if AFieldNo >= 0 then
          AFieldDesc := FindFieldDescByFieldNo(AFieldNo);
        if AFieldDesc = nil then
          AFieldDesc := FIRecordSet.FindField(ParamName);
        if (AFieldDesc <> nil) and (AFieldDesc.DataType in [dtObject,dtArray]) then // object fields in not objectview
          AssignFieldValue(Param, AFieldDesc, False)
        else begin
          Param1 := FindParam(ParamName);
          if (Param1 <> nil) and ([stRefresh, stRefreshQuick, stRefreshCheckDeleted] * StatementTypes <> []) then
            Param.Assign(Param1)  // assign param from param of SQL
          else
            if not AssignedBeforeUpdateExecute then
              DatabaseError(Format(SNoCorrespondParam, [Param.Name]));
        end;
      end;
      if ([stRefreshQuick, stRefreshCheckDeleted] * StatementTypes) <> [] then
        SetMasterParams(Params);
      if not UseParamType then
        Param.ParamType := ptInput;
    end;
  {$IFDEF PERF_COUNTER}
    PerfCounters[5].Stop;
  {$ENDIF}
  end;

  procedure ReadUQParams(RecordSet: TCRRecordSet; Buffer: TValueBuffer; ParamsInfo: TDAParamsInfo);
  var
    i: integer;
    Param: TDAParam;
    ParamName: string;
    Old: boolean;
    Field: TField;
    AFieldNo: integer;
    FieldDesc: TFieldDesc;
    RecBuf: TRecordBuffer;
    IsBlank: boolean;
    SharedObject: TSharedObject;
    ReadOnly: boolean;

  begin
  {$IFDEF PERF_COUNTER}
    PerfCounters[5].Start;
  {$ENDIF}
    for i := 0 to TDBAccessUtils.GetParams(FUpdateQuery).Count - 1 do begin
      Param := TDBAccessUtils.GetParams(FUpdateQuery)[i];
      if UseParamType then
        if Param.ParamType < ptOutput then
          Continue;

      if ParamsInfo <> nil then begin
        Old := ParamsInfo.Items[i].Old;
        Field := ParamsInfo.Items[i].Field;
      end
      else
      begin
        ParamName := Param.Name;
        Field := FieldByParamName(ParamName, Old, AFieldNo);
      end;

      if Assigned(Field) and not Old and CanRefreshField(Field)
      then begin
        ReadOnly := Field.ReadOnly;
        if Field.ReadOnly then begin
          SetTempState(State); // DisableControls
          Field.ReadOnly := False;
        end;

        FieldDesc := FIRecordSet.Fields[Field.FieldNo - 1];

        if (Param.ParamObject <> nil) and (RecordSet <> nil)
          and (RecordSet.IsComplexFieldType(FieldDesc.DataType)
          and not((FieldDesc.DataType = dtExtString)
          or (FieldDesc.DataType = dtExtWideString)
          or (FieldDesc.DataType = dtExtVarBytes)
          {$IFDEF VER5P}or (FieldDesc.DataType = dtVariant){$ENDIF}))
        then begin
          // pass SharedObject from parameter to recordset
          if FInCacheProcessing then
            RecBuf := FIRecordSet.NewCacheRecBuf
          else
            RecBuf := ActiveBuffer;
          FIRecordSet.GetField(FieldDesc.FieldNo, RecBuf, Buffer, IsBlank);
          SharedObject := TSharedObject(GetGCHandleTarget(Marshal.ReadIntPtr(Buffer)));
          if SharedObject <> nil then
            SharedObject.Free;

          SharedObject := Param.ParamObject;
          SharedObject.AddRef;

          if Param.IsNull then begin
            FIRecordSet.PutField(FieldDesc.FieldNo, RecBuf, Buffer);
            FIRecordSet.SetNull(FieldDesc.FieldNo, RecBuf, True);
          end
          else
            FIRecordSet.PutField(FieldDesc.FieldNo, RecBuf, Buffer);

          if (FieldDesc.DataType in [dtBlob, dtMemo, dtWideMemo]) and
           (State in [dsInsert,dsEdit])
          then
            TBlob(SharedObject).EnableRollback;
        end
        else
          if Param.IsNull then
            Field.NewValue := Null
          else
            if not VarEqual(Field.Value, Param.Value) then
              Field.NewValue := Param.Value;

        if ReadOnly then begin
          Field.ReadOnly := True;
          RestoreState(State);
        end
      end;
    end;
  {$IFDEF PERF_COUNTER}
    PerfCounters[5].Stop;
  {$ENDIF}
  end;

  procedure CopyRecBuf(SrcRecordSet: TData; SrcRecBuf: TRecordBuffer; Buffer: TValueBuffer);
  var
    i: integer;
    RecBuf: TRecordBuffer;
    FieldDesc: TFieldDesc;
    FieldName: string;
    FieldDescIdx: integer;
    AFieldDesc: TFieldDesc;
    RecordSetFieldNo: integer;
    IsBlank: boolean;
    SharedObject: TSharedObject;
    Value, NewValue: variant;
    Field: TField;
    UQFieldDesc: TFieldDesc;
  begin
    if FInCacheProcessing then
      RecBuf := FIRecordSet.NewCacheRecBuf
    else
      RecBuf := ActiveBuffer;

    for i := 0 to SrcRecordSet.FieldCount - 1 do
      if not SrcRecordSet.Fields[i].HasParent then begin
        FieldDesc := SrcRecordSet.Fields[i];
        FieldName := FieldDesc.Name;

        // FindField optimization
        AFieldDesc := nil;
        FieldDescIdx := FSQLGenerator.DecodeFieldIndex(FieldName);
        if FieldDescIdx >= 0 then
          AFieldDesc := FIRecordSet.Fields[FieldDescIdx];

        if AFieldDesc = nil then
          AFieldDesc := FIRecordSet.FindField(FieldDesc.Name);
        if (AFieldDesc <> nil){ and CanRefreshField(Field) and}
        then
          if SrcRecordSet.IsComplexFieldType(FieldDesc.DataType)
            and not((FieldDesc.DataType = dtExtString)
            or (FieldDesc.DataType = dtExtWideString)
            or (FieldDesc.DataType = dtExtVarBytes)
            {$IFDEF VER5P}or (FieldDesc.DataType = dtVariant){$ENDIF})
          then begin
            if ([stRefresh, stRefreshQuick, stRefreshCheckDeleted] * StatementTypes) <> [] then begin
              RecordSetFieldNo := AFieldDesc.FieldNo;
              FIRecordSet.GetField(RecordSetFieldNo, RecBuf, Buffer, IsBlank);
              SharedObject := TSharedObject(GetGCHandleTarget(Marshal.ReadIntPtr(Buffer)));
              if SharedObject <> nil then
                SharedObject.Free;

              SrcRecordSet.GetField(FieldDesc.FieldNo, SrcRecBuf, Buffer, IsBlank);
              SharedObject := TSharedObject(GetGCHandleTarget(Marshal.ReadIntPtr(Buffer)));
              SharedObject.AddRef;
              FIRecordSet.PutField(RecordSetFieldNo, RecBuf, Buffer);

              if IsBlank then begin
                FIRecordSet.SetNull(RecordSetFieldNo, RecBuf, True);
                if IsClass(SharedObject, TBlob) then                    // After RefreshRecord for Null Blob fields
                  TBlobUtils.SetModified(TBlob(SharedObject), False);   // TBlob.Modified is True
              end;

              if (FieldDesc.DataType in [dtBlob, dtMemo, dtWideMemo]) and
               (State in [dsInsert,dsEdit])
              then
                TBlob(SharedObject).EnableRollback;
            end;
          end
        {$IFDEF VER5P}
          else
          if FieldDesc.DataType = dtVariant then begin
            RecordSetFieldNo := AFieldDesc.FieldNo;

            UQFieldDesc := FIRecordSet.Fields[RecordSetFieldNo - 1];
            CopyBuffer(IntPtr(Integer(RecBuf) + UQFieldDesc.Offset), Buffer, sizeof(TVariantObject));

            SharedObject := TSharedObject(GetGCHandleTarget(Marshal.ReadIntPtr(Buffer)));
            if SharedObject <> nil then
              SharedObject.Free;

            IsBlank := SrcRecordSet.GetNull(FieldDesc.FieldNo, SrcRecBuf);
            UQFieldDesc := SrcRecordSet.Fields[FieldDesc.FieldNo - 1];
            CopyBuffer(IntPtr(Integer(SrcRecBuf) + UQFieldDesc.Offset), Buffer, sizeof(TVariantObject));

            SharedObject := TSharedObject(GetGCHandleTarget(Marshal.ReadIntPtr(Buffer)));
            SharedObject.AddRef;

            UQFieldDesc := FIRecordSet.Fields[RecordSetFieldNo - 1];
            CopyBuffer(Buffer, IntPtr(Integer(RecBuf) + UQFieldDesc.Offset), sizeof(TVariantObject));
            FIRecordSet.SetNull(RecordSetFieldNo, RecBuf, IsBlank);
          end
        {$ENDIF}
          else begin
            SrcRecordSet.GetFieldAsVariant(FieldDesc.FieldNo,
              SrcRecBuf, NewValue);
            {This code raises AV with disposed ExtStrings
            if FieldDesc.DataType in [dtExtString, dtExtWideString, dtExtVarBytes] then
              SrcRecordSet.PutFieldData(FieldDesc, SrcRecBuf, nil);}
            Field := FindFieldByFieldNo(AFieldDesc.FieldNo);
            if Field <> nil then begin
              if stCheck in StatementTypes then begin
              // check
                if State in dsEditModes then
                  Value := Field.OldValue
                else
                  Value := Field.NewValue;

                if not VarEqual(Value, NewValue) then
                  DatabaseError(SRecordChanged);
              end
              else
              // refresh
                if FActiveRecRefresh or FInCacheProcessing then begin // DeferredPost and CachedUpdates
                  if Field.ReadOnly then begin
                    SetTempState(State); // DisableControls
                    Field.ReadOnly := False;
                    Field.NewValue := NewValue;
                    Field.ReadOnly := True;
                    RestoreState(State);
                  end
                  else
                    Field.NewValue := NewValue;
                end
                else
                  FIRecordSet.PutFieldAsVariant(AFieldDesc.FieldNo, RecBuf, NewValue)
            end;
          end;
    end;
    if (([stRefresh, stRefreshQuick, stRefreshCheckDeleted] * StatementTypes) <> []) and
      not FActiveRecRefresh and
      not FInCacheProcessing
    then begin
      {if CachedUpdates then
        FIRecordSet.RevertRecord; }  /// ??? problem with one record
      FIRecordSet.PutRecord(RecBuf);
      Data.AddRefComplexFields(RecBuf);
      PRecInfo(IntPtr(integer(RecBuf) + FRecInfoOfs)).RefComplexFields := True;
    end;
  end;

  procedure GetUQFields(const KeyFields: TFieldArray; out KeyFieldsUQ: TFieldArray);
  var
    i: integer;
  begin
    Assert(FUpdateQuery is TCustomDADataSet);
    SetLength(KeyFieldsUQ, Length(KeyFields));
    for i := 0 to Length(KeyFields) - 1 do
      KeyFieldsUQ[i] := TCustomDADataSet(FUpdateQuery).Fields.FindField(KeyFields[i].FieldName);
  end;


var
  i: integer;
  RecordSet: TCRRecordSet;
  RefreshRecBuf: TRecordBuffer;
  RecBuf: TRecordBuffer;
  Buffer: TValueBuffer;
  s, OldIndexFieldNames: string;
  KeyFields, KeyFieldsUQ: TFieldArray;
  v: variant;
  RQFieldDesc: TFieldDesc;
  NewValue: variant;

  OldOnAppend: TOnModifyRecord;
  ParamsInfo: TDAParamsInfo;
  TempParams: TDAParams;

begin
  BeginConnection;
  try
    CheckUpdateSQL(SQL, StatementTypes, ParamsInfo);

    if TDBAccessUtils.GetSQL(FUpdateQuery).Count = 0 then begin
      Result := False;
      Exit;
    end;

    if FUpdateQuery is TCustomDADataSet then
      RecordSet := TCustomDADataSet(FUpdateQuery).FIRecordSet
    else
      RecordSet := nil;


    if StatementTypes = [stBatchUpdate] then begin
      TempParams := TDBAccessUtils.GetParams(FUpdateQuery);
      TempParams.Assign(FBatchParams);
      RecreateParamsRef(TempParams);
    end
    else
      // assigning parameter values from fields of the same name
      WriteUQParams(ParamsInfo);

    // No need to call events and UpdateExecute when collecting statemets
    if not BatchUpdate or (StatementTypes = [stBatchUpdate]) then begin
      DoBeforeUpdateExecute(Self, StatementTypes, TDBAccessUtils.GetParams(FUpdateQuery));
      if AssignedBeforeUpdateExecute then begin
        for i:= 0 to TDBAccessUtils.GetParams(FUpdateQuery).Count - 1 do
          if TDBAccessUtils.GetParams(FUpdateQuery)[i].DataType = ftUnknown then
            DatabaseError(Format(SUnknownParamDataType, [TDBAccessUtils.GetParams(FUpdateQuery)[i].Name]));
      end;
      UpdateExecute(StatementTypes);
    end;

    Buffer := Marshal.AllocHGlobal(sizeof(integer));
    try
      if (StatementTypes = [stRefreshCheckDeleted]) and (FUpdateQuery is TCustomDADataSet) then begin
        UpdateCursorPos;
        First;
        GetCurrentKeys(KeyFields, v);
        GetUQFields(KeyFields, KeyFieldsUQ);
        s := '';
        for i := Low(KeyFields) to High(KeyFields) do begin
          if s <> '' then
            s := s + ';' + GetActualFieldName(KeyFields[i])
          else
            s := GetActualFieldName(KeyFields[i]);
        end;

        OldIndexFieldNames := TCustomDADataSet(FUpdateQuery).IndexFieldNames;
        try
          TCustomDADataSet(FUpdateQuery).IndexFieldNames := s;
          while not Eof do begin
            GetCurrentKeys(KeyFields, v);
            if not TCustomDADataSet(FUpdateQuery).Locate(KeyFieldsUQ, v, []) then
              FIRecordSet.RemoveRecord;
            Next;
          end;
        finally
          TCustomDADataSet(FUpdateQuery).Close;
          TCustomDADataSet(FUpdateQuery).IndexFieldNames := OldIndexFieldNames;
        end;
        Resync([]);
      end
      else
      if (([stRefreshQuick, stRefreshCheckDeleted] * StatementTypes) <> []) and (FUpdateQuery is TCustomDADataSet) then begin
      // Refresh from fields and check

        FRowsAffected := TCustomDADataSet(FUpdateQuery).RecordCount;

        UpdateCursorPos;
        RecordSet.AllocRecBuf(IntPtr(RefreshRecBuf));
        try
          TCustomDADataSet(FUpdateQuery).First;
          // Get key fields list from base DataSet
          GetCurrentKeys(KeyFields, v);
          GetUQFields(KeyFields, KeyFieldsUQ);
          while not TCustomDADataSet(FUpdateQuery).Eof do begin
            // And get values from FUpdateQuery
            v := VarArrayCreate([0, Length(KeyFieldsUQ) - 1], varVariant);
            for i := 0 to Length(KeyFieldsUQ) - 1 do
              v[i] := KeyFieldsUQ[i].Value;

            if not LocateEx(KeyFields, v, []) then begin
              FIRecordSet.AllocRecBuf(IntPtr(RecBuf));
              OldOnAppend := FIRecordSet.OnAppend;
              try
                FIRecordSet.OnAppend := nil;
                FIRecordSet.InitRecord(RecBuf);
                FIRecordSet.AppendRecord(RecBuf);
                Resync([]);
              finally
                FIRecordSet.OnAppend := OldOnAppend;
                FIRecordSet.FreeRecBuf(RecBuf);
              end;
            end;

            RecordSet.GetRecord(RefreshRecBuf);
            CopyRecBuf(RecordSet, RefreshRecBuf, Buffer);

            for i := 0 to RecordSet.Fields.Count - 1 do begin
              RQFieldDesc := RecordSet.Fields[i];
              if IsRefreshQuickField(RQFieldDesc) then begin
                RecordSet.GetFieldAsVariant(RQFieldDesc.FieldNo, RefreshRecBuf, NewValue);
                SaveMaxRefreshQuickValue(RQFieldDesc, NewValue);
              end;
            end;

            TCustomDADataSet(FUpdateQuery).Next;
          end;
        finally
          Data.FreeRecBuf(RefreshRecBuf);
        end;
        FIRecordSet.SortItems;
        Resync([]);
      end
      else
      if ([stRefresh, stCheck] * StatementTypes <> []) and (FUpdateQuery is TCustomDADataSet)
        and TCustomDADataSet(FUpdateQuery).IsQuery then begin
        // Refresh from fields and check
        FRowsAffected := TCustomDADataSet(FUpdateQuery).RecordCount;

        if FOptions.StrictUpdate and (FRowsAffected <> 1) then
          DatabaseError(Format(SRefreshFailed, [FRowsAffected]));

        RecordSet.AllocRecBuf(IntPtr(RefreshRecBuf));
        try
          RecordSet.SetToBegin;  // temp
          RecordSet.GetNextRecord(RefreshRecBuf);
          if not RecordSet.EOF then
            CopyRecBuf(RecordSet, RefreshRecBuf, Buffer);
        finally
          Data.FreeRecBuf(RefreshRecBuf);
        end;
      end
      else
      // strict update and DMLRefresh don't work in BatchUpdate mode
      if not BatchUpdate then begin
        FRowsAffected := TDBAccessUtils.GetRowsAffected(FUpdateQuery);

        if FOptions.StrictUpdate and
          //(Command.SQLType in [SQL_INSERT,SQL_UPDATE,SQL_DELETE]) and  /// for ODAC
          ((FRowsAffected = 0) or (FRowsAffected > 1))
        then
          DatabaseError(Format(SUpdateFailed, [FRowsAffected]));

        // Refresh fields from params of the same name
          if NeedReturnParams or (stRefresh in StatementTypes) then // DML Refresh
            ReadUQParams(RecordSet, Buffer, ParamsInfo);
      end;

      // No need to call events and UpdateExecute when collecting statemets
      if not BatchUpdate or (StatementTypes = [stBatchUpdate]) then
        DoAfterUpdateExecute(Self, StatementTypes, TDBAccessUtils.GetParams(FUpdateQuery));

      Result := True;
    finally
      Marshal.FreeHGlobal(Buffer);
      if FUpdateQuery is TCustomDADataSet then
        TCustomDADataSet(FUpdateQuery).Close;
    end;
  finally
    EndConnection;
  end;
end;

function TCustomDADataSet.RefreshAfterInsertAllowed: boolean;
begin
  Result := True;
end;

function TCustomDADataSet.IsRefreshQuickField(FieldDesc: TFieldDesc): boolean;
begin
  Result := False;
end;

procedure TCustomDADataSet.SaveMaxRefreshQuickValue(FieldDesc: TFieldDesc; const Value: variant);
begin
end;

function TCustomDADataSet.GetCanModify: boolean;
begin
  Result := not (ReadOnly or UniDirectional) and
    (LocalUpdate or
    CachedUpdates and Assigned(OnUpdateRecord) or
    Assigned(UpdateObject));
end;

procedure TCustomDADataSet.SetStateFieldValue(State: TDataSetState; Field: TField; const Value: Variant); // Need to support int64 fields on PerformSQL in RefreshRecord
var
  SaveState: TDataSetState;
{$IFNDEF VER6P}
  i64: int64;
{$ENDIF}
begin
  if not (Field is TLargeintField) then
    inherited
  else
  begin
    // Nearly copied from inherited
    if Field.FieldKind <> fkData then Exit;
  {$IFNDEF VER6P}
    if not TVarDataD6(Value).VType in [varSmallint, varInteger, varByte, $12{vt_ui2}, $13{vt_ui4}] then begin
      inherited;
      exit;
    end;

    i64 := TVarDataD6(Value).VInt64;
  {$ENDIF}
    
    SaveState := SetTempState(State);
    try
    {$IFDEF VER6P}
      if VarIsNull(Value) then
        Field.Clear
      else
        TLargeintField(Field).AsLargeInt := Value;
    {$ELSE}
      TLargeintField(Field).AsLargeInt := i64;
    {$ENDIF}
    finally
      RestoreState(SaveState);
    end;
  end;
end;

function TCustomDADataSet.CanRefreshField(Field: TField): boolean;
begin
  Result := True;
end;

function TCustomDADataSet.NeedReturnParams: boolean;
begin
  Result := FOptions.ReturnParams;
end;

{ Master/Detail }

procedure TCustomDADataSet.RefreshParams;
var
  DataSet: TDataSet;
begin
  FreeRefBuffers;

  if FDataLink.DataSource <> nil then begin
    DataSet := FDataLink.DataSource.DataSet;
    if DataSet <> nil then
      if DataSet.Active and (DataSet.State <> dsSetKey) then begin
        if SetMasterParams(Params) then begin // need refresh
        {$IFDEF MSWINDOWS}
          if (FDetailRefreshTimer = nil) or (FDetailRefreshTimer.Interval = 0) then
            RefreshDetail(nil)
          else begin
            FDetailRefreshTimer.Enabled := False; //reset time period
            FDetailRefreshTimer.Enabled := True;
          end;
        {$ELSE}
          RefreshDetail(nil)
        {$ENDIF}
        end;
      end;
  end;
end;

{$IFDEF MSWINDOWS}
procedure TCustomDADataSet.CheckRefreshDetailTimer;
begin
  if FDetailRefreshTimer = nil then begin
    FDetailRefreshTimer := {$IFDEF CLR}TTimer{$ELSE}TWin32Timer{$ENDIF}.Create(Self);
    FDetailRefreshTimer.Enabled := False;
    FDetailRefreshTimer.OnTimer := RefreshDetail;
  end;
end;
{$ENDIF}

procedure TCustomDADataSet.RefreshDetail(Sender: TObject);
var
  MessageID: cardinal;
begin
{$IFDEF MSWINDOWS}
  if FDetailRefreshTimer <> nil then
    FDetailRefreshTimer.Enabled := False;
{$ENDIF}

  if FOptions.LocalMasterDetail then begin
    FIRecordSet.FilterUpdated;
    Resync([]);
    First;
  end
  else begin
    if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then
      TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLExecute(Self, FinalSQL, FParams, 'Refresh', MessageID, True);

    BeginConnection;

    DisableControls;
    try
      StartWait;
      // Refresh
      FCommand.WriteParams;
      {$IFDEF VER5P}
      DoBeforeRefresh;
      {$ENDIF}
      CheckBrowseMode;
      UpdateCursorPos;
      try
        DataReopen;
        if FIRecordSet.IndexFields.Count > 0 then
          FIRecordSet.SortItems;
      finally
        Resync([]);
      {$IFDEF VER5P}
        DoAfterRefresh;
        if not IsEmpty then DoAfterScroll;
      {$ENDIF}
      end;
    finally
      EnableControls;
    end;

    if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then
      TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLExecute(Self, FinalSQL, FParams, 'Refresh', MessageID, False);

    if FOptions.QueryRecCount then
      FRecordCount := GetRecCount
    else
      FRecordCount := 0;

    FRowsAffected := -1;
  end;
end;

function TCustomDADataSet.NeedDetailRefresh(Param: TDAParam; FieldValue: TSharedObject): boolean;
begin
  Result := False;
  Param.ParamObject := FieldValue;
end;

function TCustomDADataSet.SetMasterParams(AParams: TDAParams): boolean;
var
  DataSet: TDataSet;
  DADataSet: TCustomDADataSet;
  Field: TField;
  i: integer;
  RecBuf: TRecordBuffer;
  Buffer: IntPtr;
  SharedObject: TSharedObject;
  IsBlank: boolean;

  MasterField: TField;
  MasterFieldDesc: TFieldDesc;
  DetailField: TField;
  DetailFieldDesc: TFieldDesc;
  MasterPos: integer;
  DetailPos: integer;
  MasterName: string;
  DetailName: string;
  LinksCount: integer;
begin
  Result := False;

  if FOptions.LocalMasterDetail then begin
    Result := True;
    Assert(DataSource.DataSet is TCustomDADataSet);

    if Length(FLocalMDLinks) > 0 then
      for i := 0 to Length(FLocalMDLinks) - 1 do
        if not FLocalMDLinks[i].NativeBuffer then
          Marshal.FreeHGlobal(FLocalMDLinks[i].Buffer);

    LinksCount := 0;
    if (DataSource <> nil) and (FMasterFields <> '') and (FDetailFields <> '')
    then begin
      DADataSet := TCustomDADataSet(DataSource.DataSet);
      if (DADataSet <> nil) and DADataSet.Active then begin
        MasterPos := 1;
        DetailPos := 1;
        while True do begin
          MasterName := ExtractFieldName(FMasterFields, MasterPos);
          DetailName := ExtractFieldName(FDetailFields, DetailPos);
          if (MasterName <> '') and (DetailName <> '') then begin
            MasterField := DADataSet.FindField(MasterName);
            if Assigned(MasterField) then begin
              DetailField := FindField(DetailName);
              if Assigned(DetailField) then begin
                SetLength(FLocalMDLinks, LinksCount + 1);
                with FLocalMDLinks[LinksCount] do begin
                  DetailFieldDesc := Data.FindField(DetailField.FieldName);
                  MasterFieldDesc := DADataSet.GetFieldDesc(MasterField);
                  if DetailFieldDesc = nil then
                    raise Exception.Create(Format(SFieldNotFound, [DetailField.FieldName]));
                  if MasterFieldDesc = nil then
                    raise Exception.Create(Format(SFieldNotFound, [MasterField.FieldName])); //TODO: Field : cannot be used for local master/detail link
                  FieldNo := DetailFieldDesc.FieldNo;                    
                  Buffer := nil;
                  IsNull := MasterField.IsNull;
                  NativeBuffer := False;
                  if not IsNull then
                    if DetailFieldDesc.DataType = MasterFieldDesc.DataType then begin
                      if DADataSet.GetActiveRecBuf(RecBuf) then
                        FLocalMDLinks[LinksCount].Buffer := DADataSet.Data.GetFieldBuf(RecBuf, MasterFieldDesc, BufferType, IsNull, NativeBuffer);
                    end
                    else
                      CopyFieldValue(MasterField.Value, Buffer, BufferType, DetailFieldDesc);
                end;
                Inc(LinksCount);
              end;
            end;
          end
          else
            break;
        end;
      end;
    end;
  end
  else
  if FDataLink.DataSource <> nil then begin
    DataSet := FDataLink.DataSource.DataSet;
    if DataSet <> nil then begin
      for i := 0 to AParams.Count - 1 do begin
        Field := DataSet.FindField(AParams[i].Name);

        if not Assigned(Field) then
          Continue;

        AParams[i].DataType := Field.DataType; // set datatype for null Field value
        if AParams[i].IsObjectDataType then begin
          SharedObject := nil;
          if (DataSet is TCustomDADataset) then
            with TCustomDADataset(DataSet) do
              if Field.FieldNo <> 0 then begin
                if GetActiveRecBuf(RecBuf) then begin
                  Buffer := Marshal.AllocHGlobal(sizeof(IntPtr));
                  try
                    Data.GetField(Field.FieldNo, RecBuf, Buffer, IsBlank);
                    SharedObject := TSharedObject(GetGCHandleTarget(Marshal.ReadIntPtr(Buffer)));
                  finally
                    Marshal.FreeHGlobal(Buffer);
                  end;

                end;
              end
              else
                SharedObject := GetFieldObject(Field);

          Result := NeedDetailRefresh(AParams[i], SharedObject);
        end
        else
          if (VarIsEmpty(AParams[i].Value) or not VarEqual(AParams[i].Value, Field.Value)) and
            not (VarIsEmpty(AParams[i].Value) and Field.IsNull) then begin
              AParams[i].AssignField(Field);
              Result := True;
          end;
        AParams[i].ParamType := ptInput;
      end;
    end;
  end;
end;

function TCustomDADataSet.IsConnectedToMaster: boolean;
begin
  Result := (MasterSource <> nil) and (FMasterFields <> '') and (FDetailFields <> '');
end;

procedure TCustomDADataSet.RefreshDetailSQL;
var
  OldActive: boolean;
begin
  OldActive := Active;

  Close;
  UnPrepare;
  AssembleSQL;

  if OldActive then
    Open;
end;

function TCustomDADataSet.LocalDetailFilter(RecBuf: IntPtr): boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 0 to Length(FLocalMDLinks) - 1 do
    with FLocalMDLinks[i] do begin
      if not Result then
        Break;
      if (IsNull) or (TMemData(Data).GetNull(FieldNo, RecBuf)) then
        Result := not ((IsNull) or (TMemData(Data).GetNull(FieldNo, RecBuf)))
      else
        Result := TMemData(Data).CompareFieldValue(Buffer, BufferType, Data.Fields[FieldNo - 1], RecBuf, []) = 0;
    end;
end;

procedure TCustomDADataSet.AssembleSQL;
begin
  FCommand.AssembleSQL;

// close and unprepare to apply new sql
  UnPrepare;
end;

procedure TCustomDADataSet.ScanMacros(Sender: TObject = nil);
var
  AllSQL: string;
  stIdx: TStatementType;
begin
  AllSQL := SQL.Text;
  for stIdx := Low(FUpdateSQL) to High(FUpdateSQL) do
    if Assigned(FUpdateSQL[stIdx]) then
      AllSQL := AllSQL + FUpdateSQL[stIdx].Text;
  Macros.Scan(AllSQL);    
end;

{function TCustomDADataSet.DoGetFinalSQL: string;
begin
  Result := GetFinalSQL;
end;

procedure TCustomDADataSet.DoScanMacros(Sender: TObject);
begin
  ScanMacros;
end;}

procedure TCustomDADataSet.DefineProperties(Filer: TFiler);
  function WriteParams: boolean;
  begin
    if Filer.Ancestor <> nil then
      Result := not FParams.IsEqual(TCustomDADataSet(Filer.Ancestor).FParams)
    else
      Result := FParams.Count > 0;
  end;

  function WriteMacros: boolean;
  begin
    if Filer.Ancestor <> nil then
      Result := not FMacros.IsEqual(TCustomDADataSet(Filer.Ancestor).FMacros)
    else
      Result := FMacros.Count > 0;
  end;
begin
  inherited DefineProperties(Filer);

  Filer.DefineProperty('ParamData', FCommand.ReadParamData, FCommand.WriteParamData, WriteParams);
  Filer.DefineProperty('MacroData', FCommand.ReadMacroData, FCommand.WriteMacroData, WriteMacros);
end;

function TCustomDADataSet.FindParam(const Value: string): TDAParam;
begin
  Result := FParams.FindParam(Value);
end;

function TCustomDADataSet.ParamByName(const Value: string): TDAParam;
begin
  Result := FParams.ParamByName(Value);
end;

function TCustomDADataSet.FindMacro(const Value: string): TMacro;
begin
  Result := FMacros.FindMacro(Value);
end;

function TCustomDADataSet.MacroByName(const Value: string): TMacro;
begin
  Result := FMacros.MacroByName(Value);
end;

{ Additional data types }

function TCustomDADataSet.GetField(FieldDesc: TFieldDesc): TField;
var
  i: integer;
begin
  Assert(FieldDesc <> nil);
  Result := nil;
  for i := 0 to Fields.Count - 1 do
    if Fields[i].FieldNo = FieldDesc.FieldNo then begin
      Result := Fields[i];
      Break;
    end;
end;

function TCustomDADataSet.GetDataType(const FieldName: string): integer;
begin
  Result := FIRecordSet.FieldByName(FieldName).DataType;
end;

function TCustomDADataSet.GetFieldDesc(const FieldName: string): TFieldDesc;
begin
  Result := FIRecordSet.FieldByName(FieldName);
end;

function TCustomDADataSet.GetFieldDesc(const FieldNo: integer): TFieldDesc;
begin
  if FieldNo <= 0 then {fkCalculated, fkLookup}
    Result := nil
  else
    Result := TFieldDesc(FIRecordSet.Fields[FieldNo - 1])
end;

function TCustomDADataSet.GetFieldPrecision(const FieldName: string): integer;
var
  Field: TFieldDesc;
begin
  Field := FIRecordSet.FieldByName(FieldName);
  if (Field <> nil) and (Field.DataType in [dtInteger,dtFloat]) then
    Result := Field.Length
  else
    Result := 0;
end;

function TCustomDADataSet.GetFieldScale(const FieldName: string): integer;
var
  Field: TFieldDesc;
begin
  Field := FIRecordSet.FieldByName(FieldName);
  if (Field <> nil) and (Field.DataType in [dtInteger,dtFloat]) then
    Result := Field.Scale
  else
    Result := 0;
end;

function TCustomDADataSet.GetFieldObject(FieldDesc: TFieldDesc): TSharedObject;
var
  RecBuf: TRecordBuffer;
begin
  if GetActiveRecBuf(RecBuf) then begin
    if not FIRecordSet.IsComplexFieldType(FieldDesc.DataType) then
      DatabaseError(SNeedBlobType);

    Result := TSharedObject(GetGCHandleTarget(Marshal.ReadIntPtr(RecBuf, FieldDesc.Offset)));
  end
  else
    Result := nil;
end;

function TCustomDADataSet.GetFieldObject(Field: TField): TSharedObject;
var
  FieldDesc: TFieldDesc;
begin
  FieldDesc := GetFieldDesc(Field);
  Result := GetFieldObject(FieldDesc);
end;

function TCustomDADataSet.GetFieldObject(const FieldName: string): TSharedObject;
var
  FieldDesc: TFieldDesc;
begin
  FieldDesc := FIRecordSet.FieldByName(FieldName);
  Result := GetFieldObject(FieldDesc);
end;

{$IFDEF VER5P}

{ IProviderSupport }

procedure TCustomDADataSet.PSEndTransaction(Commit: Boolean);
begin
  if (UsedConnection <> nil) and
    AutoCommit and
    UsedConnection.AutoCommit
  then
    if Commit then
      UsedConnection.Commit
    else
      UsedConnection.Rollback;
end;

procedure TCustomDADataSet.PSExecute;
begin
  Execute;
end;

function TCustomDADataSet.PSExecuteStatement(const ASQL: string; AParams: TParams;
  {$IFDEF CLR}var ResultSet: TObject{$ELSE}ResultSet: Pointer = nil{$ENDIF}): Integer;

  procedure SetSQL(SQL: TStrings);
  var
    St: StringBuilder;
    i, j: integer;
  begin
    // replace parameters in SQL
    St := StringBuilder.Create(Length(ASQL) + Length(ASQL) div 2);
    try
      j := 1;
      for i := 1 to Length(ASQL) do
        if ASQL[i] = '?' then begin
          St.Append(':');
          St.Append(IntToStr(j));
          Inc(j)
        end
        else
          St.Append(ASQL[i]);
      SQL.Text := St.ToString;
    finally
      St.Free;
    end;
  end;

  procedure SetParams(Params: TDAParams);
  var
    i: integer;
  begin
    //FQuery.Params.Assign(AParams);  // params doesn't name
    for i := 0 to Params.Count - 1 do begin
      Params[i].Assign(AParams[i]);
      Params[i].Name := IntToStr(i + 1);
      if Params[i].ParamType = ptUnknown then
        Params[i].ParamType := ptInput;
    end;
  end;

var
  Command: TCustomDASQL;
  Query: TCustomDADataSet;
begin
  if Assigned(ResultSet) then begin
    Query := UsedConnection.CreateDataSet;
    try
      Query.Debug := Debug;
      SetSQL(Query.SQL);
      SetParams(Query.Params);
      Query.Execute;
      Result := Query.RowsAffected;
    {$IFDEF CLR}
      ResultSet := Query;
    {$ELSE}
      TDataSet(ResultSet^) := Query;
    {$ENDIF}
    except
      Query.Free;
      raise;
    end;
  end
  else
  begin
    Command := UsedConnection.CreateSQL;
    try
      Command.Debug := Debug;
      SetSQL(Command.SQL);
      SetParams(Command.Params);
      Command.Execute;
      Result := Command.RowsAffected;
    finally
      Command.Free;
    end;
  end;
end;

function TCustomDADataSet.PSGetParams: DB.TParams;
begin
  Result := Params;
end;

function TCustomDADataSet.PSGetQuoteChar: string;
begin
  Result := '"';
end;

function TCustomDADataSet.PSGetTableName: string;
begin
  if Active then begin
    if (FUpdatingTableInfoIdx < 0) or (FUpdatingTableInfoIdx >= TablesInfo.Count) then
      Result := FUpdatingTable
    else
      Result := TablesInfo[FUpdatingTableInfoIdx].TableName;
  end
  else begin
    Result := FOldTableName;
    if Result = '' then
      Result := TablesInfo.TableInfoClass.NormalizeName(FUpdatingTable);
    if Result = '' then
      Result := TablesInfo.TableInfoClass.NormalizeName(GetTableNameFromSQL(SQL.Text));
  end;
end;

function TCustomDADataSet.PSInTransaction: Boolean;
begin
  if UsedConnection <> nil then
    Result := UsedConnection.InTransaction
  else
    Result := False;
end;

function TCustomDADataSet.PSIsSQLBased: Boolean;
begin
  Result := True;
end;

function TCustomDADataSet.PSIsSQLSupported: Boolean;
begin
  Result := True;
end;

procedure TCustomDADataSet.PSReset;
begin
  inherited PSReset;

  if Active then begin
    Close;
    Open;
  end;
end;

procedure TCustomDADataSet.PSSetParams(AParams: DB.TParams);
begin
  if AParams.Count <> 0 then
    Params.Assign(AParams);
end;

procedure TCustomDADataSet.PSSetCommandText(const CommandText: string);
begin
  if CommandText <> '' then
    SQL.Text := CommandText;
end;

procedure TCustomDADataSet.PSStartTransaction;
begin
  if (UsedConnection <> nil) and
    AutoCommit and
    UsedConnection.AutoCommit
  then
    UsedConnection.StartTransaction;
end;

function TCustomDADataSet.PSUpdateRecord(UpdateKind: TUpdateKind; Delta: TDataSet): Boolean;
var
  UpdateAction: TUpdateAction;

  I: Integer;
  Old: Boolean;
  Param: TDAParam;
  Params: TDAParams;
  PName: string;
  Field: TField;
  Value: Variant;

begin
  Result := False;
  if Assigned(OnUpdateRecord) then
  begin
    UpdateAction := uaFail;
    OnUpdateRecord(Delta, UpdateKind, UpdateAction);
    Result := UpdateAction = uaApplied;
  end;

  if not Result and Assigned(FUpdateObject) and Assigned(Delta) then begin
    CheckUpdateQuery(UpdateKindToStatementType(UpdateKind));

    TDBAccessUtils.SetAutoCommit(FUpdateQuery, AutoCommit);
    Params := TDBAccessUtils.GetParams(FUpdateQuery);

    // Nearly copied from TUpdateSQL.SetParams
    with FUpdateQuery do
      for I := 0 to Params.Count - 1 do
      begin
        Param := Params[I];
        PName := Param.Name;
        Old := CompareText(Copy(PName, 1, 4), 'OLD_') = 0;
        if Old then {$IFDEF CLR}Borland.Delphi.{$ENDIF}System.Delete(PName, 1, 4);
        Field := Delta.FindField(PName);
        if not Assigned(Field) then Continue;
        if Old then Param.AssignFieldValue(Field, Field.OldValue) else
        begin
          Value := Field.NewValue;
          if {$IFNDEF VER6P} VarIsEmpty {$ELSE}VarIsClear{$ENDIF}(Value) then Value := Field.OldValue;
          Param.AssignFieldValue(Field, Value);
        end;
      end;
    TDBAccessUtils.Execute(FUpdateQuery);

    Result := True;
  end;
end;

function TCustomDADataSet.PSGetDefaultOrder: TIndexDef;

  function AddField(const Fields, NewField: string): string;
  begin
    if Fields <> '' then
      Result := Fields + ';' + NewField
    else
      Result := NewField;
  end;

var
  S, Token, SaveField: string;
  Parser: TBoolParser;
  Code, Index: integer;
begin
  Result := nil;
  S := GetOrderBy;
  if S = '' then
    Exit;

  Parser := TBoolParser.Create(S);
  Parser.DecSeparator := '.';
  try
    Result := TIndexDef.Create(nil);
    Parser.ToBegin();

    Code := Parser.GetNext(Token);
    while Code <> lcEnd do begin
      case Code of
        lcIdent, lcString: begin
          if 'DESC' = UpperCase(Token) then begin
            Result.DescFields := AddField(Result.DescFields, SaveField);
          end
          else
          if Assigned(FindField(Token)) then begin
            Result.Fields := AddField(Result.Fields, Token);
            SaveField := Token;
          end;
        end;
        lcNumber: begin
          try
            Index := StrToInt(Token);
            SaveField := FieldDefs[Index - 1].Name;
          except // float number
            Code := Parser.GetNext(Token);  //to prevent freezeng on errors. CR
            continue;
          end;
          Result.Fields := AddField(Result.Fields, SaveField);
        end;
      end;

      Code := Parser.GetNext(Token);
    end;
  finally
    Parser.Free;
  end;
end;

function TCustomDADataSet.PreventPSKeyFields(var PSKeyFields: string): boolean;
begin
  Result := False;
end;


function TCustomDADataSet.PSGetKeyFields: string;
var
  OldDebug: boolean;
  OldFetchAll: boolean;
  OldFetchRows: integer;

  procedure QuickOpen;
  begin
    OldDebug := Debug;
    OldFetchAll := FetchAll;
    OldFetchRows := FetchRows;

    Debug := False;
    FetchAll := False;
    FetchRows := 1;
    Execute;
  end;

  procedure Restore;
  begin
    Close;
    Debug := OldDebug;
    FetchAll := OldFetchAll;
    FetchRows := OldFetchRows;
  end;

var
  i: integer;
  KeyAndDataFields: TKeyAndDataFields;
  QO: boolean;

begin
  Result := inherited PSGetKeyFields;
  if Result = '' then
    if FOldKeyFields = '' then begin
      if not PreventPSKeyFields(Result) then begin //Set product specific KeyField values or omit Server roundtrip on DS opening
        QO := not Active and (Connection <> nil) and (FIRecordSet <> nil) and (FIRecordSet.FieldCount = 0);
        if QO then
          QuickOpen;
        try
          GetKeyAndDataFields(KeyAndDataFields, False);

          for i := 0 to High(KeyAndDataFields.KeyFieldDescs) do
            if Result = '' then
              Result := KeyAndDataFields.KeyFieldDescs[i].Name
            else
              Result := Result + ';' + KeyAndDataFields.KeyFieldDescs[i].Name;
        finally
          if QO then
            Restore;
        end;
      end;
      FOldKeyFields := Result;
    end
    else
      Result := FOldKeyFields;
end;
{$ENDIF}

procedure TCustomDADataSet.AssignTo(Dest: TPersistent);
var
  stIdx: TStatementType;
begin
  inherited;

  if Dest is TCustomDADataSet then begin
    TCustomDADataSet(Dest).Connection := Connection;
    TCustomDADataSet(Dest).MasterSource := MasterSource;
    TCustomDADataSet(Dest).MasterFields := MasterFields;
    TCustomDADataSet(Dest).DetailFields := DetailFields;
    TCustomDADataSet(Dest).ParamCheck := ParamCheck;  // before SQL
    TCustomDADataSet(Dest).SQL.Text := SQL.Text;
    for stIdx := Low(FUpdateSQL) to High(FUpdateSQL) do
      if Assigned(TCustomDADataSet(Dest).FUpdateSQL[stIdx]) and Assigned(FUpdateSQL[stIdx]) then
        TCustomDADataSet(Dest).FUpdateSQL[stIdx].Text := FUpdateSQL[stIdx].Text;

    TCustomDADataSet(Dest).FilterSQL := FilterSQL;
    TCustomDADataSet(Dest).Macros.Assign(Macros);
    TCustomDADataSet(Dest).Params.Assign(Params);
    TCustomDADataSet(Dest).Debug := Debug;

    TCustomDADataSet(Dest).FetchRows := FetchRows;
    TCustomDADataSet(Dest).UniDirectional := UniDirectional;
    TCustomDADataSet(Dest).AutoCommit := AutoCommit;
    TCustomDADataSet(Dest).RefreshOptions := RefreshOptions;
    TCustomDADataSet(Dest).UpdatingTable := UpdatingTable;
    TCustomDADataSet(Dest).Options.Assign(Options);
  end;
end;

procedure TCustomDADataSet.SetConnection(Value: TCustomDAConnection);
begin
  if (Value <> FConnection) or (Value <> UsedConnection) then begin

    if UsedConnection <> nil then begin
      Disconnect;
      UsedConnection.UnregisterClient(Self);
    end;

    FConnection := Value;

    if FConnection <> nil then begin
      Value.RegisterClient(Self, ConnectChange);

      CheckIRecordSet;
      FIRecordSet.SetConnection(FConnection.FIConnection)
    end
    else
      FIRecordSet.SetConnection(nil);
  {$IFDEF CLR}
    DataEvent(dePropertyChange, nil);
  {$ELSE}
    DataEvent(dePropertyChange, 0);
  {$ENDIF}
  end;
end;

function TCustomDADataSet.GetSQL: TStrings;
begin
  Result := FCommand.SQL;
end;

procedure TCustomDADataSet.SetSQL(Value: TStrings);
begin
  FCommand.SQL := Value;
end;

procedure TCustomDADataSet.SetFetchRows(Value: integer);
begin
  if FFetchRows <> Value then begin
    CheckInactive;
    if (Value < 1) or (Value > 10000) then
      DatabaseError(SInvalidFetchRows);

    FFetchRows := Value;
    FIRecordSet.SetProp(prFetchRows, FetchRows);
  end;
end;

procedure TCustomDADataSet.SetFetchAll(Value: boolean);
begin
  FFetchAll := Value;
  FIRecordSet.SetProp(prFetchAll, FetchAll);
  if FFetchAll then begin
    UniDirectional := False;
    if Active then begin
      FIRecordSet.FetchAll;
      Resync([]);
    end;
  end;
end;

function TCustomDADataSet.SQLAutoGenerated: boolean;
begin
  Result := False;
end;

function TCustomDADataSet.CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream;
var
  Blob: TBlob;
  OldModified: boolean;
begin
  if Field.DataSet = Self then
    Blob := GetBlob(Field)
  else
    Blob := GetBlob(Field.FieldName);
  if (Blob <> nil) and (Mode <> bmWrite) and UsedConnection.ConvertEOL
    and (Field.DataType in [ftMemo{$IFDEF VER10P}, ftWideMemo{$ENDIF}, ftOraClob])
  then begin
    OldModified := Blob.Modified;
    Blob.AddCR;
    TBlobUtils.SetModified(Blob, OldModified);
  end;
    
  Result := inherited CreateBlobStream(Field, Mode);
end;

function TCustomDADataSet.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TCustomDADataSet.SetMasterSource(Value: TDataSource);
var
  NeedRefresh: boolean;
begin
  if FDataLink.DataSource <> Value then begin
    if IsLinkedTo(Value) then
      DatabaseError(SCircularDataLink);
    NeedRefresh := IsConnectedToMaster;
    FDataLink.DataSource := Value;
    NeedRefresh := NeedRefresh or IsConnectedToMaster;

    if NeedRefresh then
      RefreshDetailSQL;
  end;
end;

function TCustomDADataSet.GetParams: TDAParams;
begin
  Result := FCommand.Params;
end;

procedure TCustomDADataSet.SetParams(Value: TDAParams);
begin
  FCommand.Params := Value;
end;

function TCustomDADataSet.GetParamCount: word;
begin
  Result := FParams.Count;
end;

function TCustomDADataSet.GetParamCheck: boolean;
begin
  Result := FCommand.ParamCheck;
end;

procedure TCustomDADataSet.SetParamCheck(Value: boolean);
begin
  FCommand.ParamCheck := Value;
end;

function TCustomDADataSet.GetMacros: TMacros;
begin
  Result := FCommand.Macros;
end;

procedure TCustomDADataSet.SetMacros(Value: TMacros);
begin
  FCommand.Macros := Value;
end;

function TCustomDADataSet.GetMacroCount: word;
begin
  Result := FMacros.Count;
end;

function TCustomDADataSet.GetRecordCount: integer;
var
  RowsFetched: variant;
begin
  if not Active or Fetched or not Options.QueryRecCount or (FRecordCount = 0) then
    Result := inherited GetRecordCount
  else begin
    FICommand.GetProp(prRowsProcessed, RowsFetched);
    Result := FRecordCount - RowsFetched + Data.RecordCount;
  end;
end;

function TCustomDADataSet.GetRowsAffected: integer;
begin
  Result := FRowsAffected;
end;

procedure TCustomDADataSet.SetUniDirectional(Value: boolean);
begin
  if Value <> FUniDirectional then begin
    CheckInactive;
    FUniDirectional := Value;
    FIRecordSet.SetProp(prUniDirectional, FUniDirectional);
    if FUniDirectional then
      FetchAll := False;
  end;
end;

procedure TCustomDADataSet.SetAutoCommit(Value: boolean);
begin
  FAutoCommit := Value;
  FICommand.SetProp(prAutoCommit, FAutoCommit);
end;

function TCustomDADataSet.GetIsQuery: boolean;
begin
  Result := TCRRecordSet(Data).RowsReturn;
end;

//------------------------------------------------------------------------------
// SQL Modification methods
//------------------------------------------------------------------------------

procedure TCustomDADataSet.SaveSQL;
begin
  FBaseSQL := SQL.Text;
end;

procedure TCustomDADataSet.RestoreSQL;
begin
  if FBaseSQL <> '' then begin
    SQL.Text := FBaseSQL;
    FBaseSQL := '';
  end;
end;

function TCustomDADataSet.SQLSaved: boolean;
begin
  Result := FBaseSQL <> '';
end;

/// SaveModifiedSQL is used to back up original sql text before modification.
procedure TCustomDADataSet.SaveModifiedSQL(NewSQL: string);
var
  BaseSQL: string;
begin
  if NewSQL <> Trim(SQL.Text) then begin
    if FBaseSQL = '' then
      FBaseSQL := SQL.Text;
    if not BaseSQLOldbehavior then
      BaseSQL := FBaseSQL;

    SQL.Text := NewSQL;
    if not BaseSQLOldbehavior then
      FBaseSQL := BaseSQL;
  end;
end;

procedure TCustomDADataSet.InitUpdatingTable;
begin
  if (FUpdatingTable <> '') and
    (TablesInfo.IndexByName(TablesInfo.TableInfoClass.NormalizeName(FUpdatingTable)) = - 1) then
    FUpdatingTable := '';
  SetUpdatingTable(FUpdatingTable);
end;

procedure TCustomDADataSet.DetectIdentityField;
begin
  FIdentityField := nil;
end;

function TCustomDADataSet.ReadOnlyFieldsEnabled: boolean;
begin
  Result := True;
end;

procedure TCustomDADataSet.WriteFieldXMLAttributeType(Field: TField; FieldDesc: TFieldDesc; const FieldAlias: string; XMLWriter: XMLTextWriter);
begin
  inherited;

  if (FieldDesc is TCRFieldDesc)
    and (TCRFieldDesc(FieldDesc).TableInfo <> nil)
    and (TCRFieldDesc(FieldDesc).TableInfo.TableName <> '') then
    XmlWriter.WriteAttributeString('rs:basetable', TCRFieldDesc(FieldDesc).TableInfo.TableName);
end;

procedure TCustomDADataSet.InternalOpen;
var
  MessageID: cardinal;
begin
  if Options.AutoPrepare then
    Prepare;

  if not FLockDebug
    and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug)
    and (FIRecordSet.GetCommand.GetCursorState <> csExecuted) {To prevent multiple calls on DataSet.Execute}
  then
    TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLExecute(Self, FinalSQL, FParams, '', MessageID, True);

  inherited;

  if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then
    TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLExecute(Self, FinalSQL, FParams, '', MessageID, False);

  ClearCachedKeyAndDataFields;
  InitUpdatingTable;

  if (FDataLink.DataSource <> nil)
    and (FDataLink.DataSource.DataSet <> nil)
    and (FDataLink.DataSource.DataSet.Active)
    and (FOptions.LocalMasterDetail)
  then begin
    SetMasterParams(Params);
    Data.FilterUpdated;
  end;

end;

/// SQLAddWhere, SQLDeleteWhere, SQLSetOrderBy, SQlGetOrderBy are SQL-server
/// specific functions and they should be overriden in descendants. They operate
/// with strings only. Return value is new SQL text or it's part being
/// requested.
function TCustomDADataSet.SQLAddWhere(SQLText, Condition: string): string;
begin
  Result := '';
end;

function TCustomDADataSet.SQLDeleteWhere(SQLText: string): string;
begin
  Result := '';
end;

function TCustomDADataSet.SQLGetWhere(SQLText: string): string;
begin
  Result := '';
end;

function TCustomDADataSet.SQLSetOrderBy(SQLText: string; Fields: string): string;
begin
  Result := '';
end;

function TCustomDADataSet.SQLGetOrderBy(SQLText: string): string;
begin
  Result := '';
end;

/// AddWhere, DeleteWhere, SetOrderBy, GetOrderBy are public SQL-server
/// indepedant methods. They can modify SQL property value of the dataset. Each
/// method calls it's internal equivalent with 'SQL' prefix.
procedure TCustomDADataSet.AddWhere(Condition: string);
begin
  SaveModifiedSQL(SQLAddWhere(Trim(SQL.Text), Condition));
end;

procedure TCustomDADataSet.DeleteWhere;
begin
  SaveModifiedSQL(SQLDeleteWhere(Trim(SQL.Text)));
end;

procedure TCustomDADataSet.SetOrderBy(Fields: string);
begin
  SaveModifiedSQL(SQLSetOrderBy(Trim(SQL.Text), Fields));
end;

function TCustomDADataSet.GetOrderBy: string;
begin
  Result := SQLGetOrderBy(Trim(SQL.Text));
end;

/// GetBaseSQL returns original sql text with expanded macros.
function TCustomDADataSet.GetBaseSQL: string;
begin
  if FBaseSQL <> '' then
    Result := FBaseSQL
  else
    Result := SQL.Text;

  if Macros.Count > 0 then
    Macros.Expand(Result);
end;

function TCustomDADataSet.GetFinalSQL: string;
var
  Str, Where: string;
  MasterName: string;
  DetailName: string;
  MasterPos: integer;
  DetailPos: integer;
begin
  Str := FCommand.FinalSQL;

  if FFilterSQL <> '' then
    Str := SQLAddWhere(Str, FilterSQL);

  if (DataSource <> nil) and (FMasterFields <> '') and (FDetailFields <> '')
    and not (FOptions.LocalMasterDetail)
  then begin
    MasterPos := 1;
    DetailPos := 1;
    Where := '';
    while True do begin
      MasterName := ExtractFieldName(FMasterFields, MasterPos);
      DetailName := ExtractFieldName(FDetailFields, DetailPos);
      if (MasterName <> '') and (DetailName <> '') then begin
        if Where <> '' then
          Where := Where + ' and ';
        Where := Where + TablesInfo.TableInfoClass.NormalizeName(DetailName, Options.QuoteNames) + ' = :' + TablesInfo.TableInfoClass.NormalizeName(MasterName, Options.QuoteNames);
      end
      else
        break;
    end;
    if Where <> '' then
      Str := SQLAddWhere(Str, Where);
  end;

  Result := Str;
end;

procedure TCustomDADataSet.SetUpdateObject(Value: TCustomDAUpdateSQL);
begin
  if Value <> nil then begin
    Value.CheckUpdateComponent(Value.ModifyObject, Self);
    Value.CheckUpdateComponent(Value.InsertObject, Self);
    Value.CheckUpdateComponent(Value.DeleteObject, Self);
    Value.CheckUpdateComponent(Value.RefreshObject, Self);
  end;
  if Value <> FUpdateObject then begin
    if Assigned(FUpdateObject) and (FUpdateObject.DataSet = Self) then
      FUpdateObject.DataSet := nil;
    FUpdateObject := Value;
    if Assigned(FUpdateObject) then begin
      if Assigned(FUpdateObject.DataSet) and
        (FUpdateObject.DataSet <> Self) then
        FUpdateObject.DataSet.UpdateObject := nil;
      FUpdateObject.DataSet := Self;
    end;
  end;
end;

procedure TCustomDADataSet.SetOptions(Value: TDADataSetOptions);
begin
  FOptions.Assign(Value);
end;

procedure TCustomDADataSet.SetFilterSQL(Value: string);
var
  OldFilter: string;
  OldActive: boolean;
begin
  if Value <> FFilterSQL then begin
    OldFilter := FFilterSQL;
    FFilterSQL := Trim(Value);

    OldActive := Active;
    if not (csReading in ComponentState) then begin
      Close;
      UnPrepare;
    end;

    AssembleSQL;

    if OldActive then
      try
        Open;
        if Filtered and (Filter <> '') then begin
          Data.FilterUpdated;
          Resync([]);
          First;
        end;
      except
        FFilterSQL := OldFilter;
        AssembleSQL;
        raise;
      end;
  end;
end;

procedure TCustomDADataSet.SetFiltered(Value: boolean);
var
  KeyFields: TFieldArray;
  Values: variant;
begin
  if Value <> Filtered then begin
    if Active then
      GetCurrentKeys(KeyFields, Values);

    inherited;

    if Active and (Length(KeyFields) <> 0) then
      Locate(KeyFields, Values, []);
  end;
end;

procedure TCustomDADataSet.SetMasterFields(Value: string);
var
  NeedRefresh: boolean;
begin
  if Value <> FMasterFields then begin
    NeedRefresh := IsConnectedToMaster;
    FMasterFields := Value;
    NeedRefresh := NeedRefresh or IsConnectedToMaster;

    if NeedRefresh then
      RefreshDetailSQL;
  end;
end;

procedure TCustomDADataSet.SetForeignKeyFields(Value: string);
var
  NeedRefresh: boolean;
begin
  if Value <> FDetailFields then begin
    NeedRefresh := IsConnectedToMaster;
    FDetailFields := Value;
    NeedRefresh := NeedRefresh or IsConnectedToMaster;

    if NeedRefresh then
      RefreshDetailSQL;
  end;
end;

{ TDADataSetOptions }

constructor TDADataSetOptions.Create(Owner: TCustomDADataSet);
begin
  inherited Create;

  FOwner := Owner;

  RequiredFields := True;
  StrictUpdate := True;
  TrimFixedChar := True;
  LongStrings := True;
  FlatBuffers := False;
  RemoveOnRefresh := True;
  FDetailDelay := 0;
  UpdateBatchSize := 1;
end;

procedure TDADataSetOptions.AssignTo(Dest: TPersistent);
begin
  if Dest is TDADataSetOptions then begin
    TDADataSetOptions(Dest).RequiredFields := RequiredFields;
    TDADataSetOptions(Dest).StrictUpdate := StrictUpdate;
    TDADataSetOptions(Dest).NumberRange := NumberRange;
    TDADataSetOptions(Dest).QueryRecCount := QueryRecCount;
    TDADataSetOptions(Dest).AutoPrepare := AutoPrepare;
    TDADataSetOptions(Dest).ReturnParams := ReturnParams;
    TDADataSetOptions(Dest).TrimFixedChar := TrimFixedChar;
    TDADataSetOptions(Dest).TrimVarChar := TrimVarChar;
    TDADataSetOptions(Dest).LongStrings := LongStrings;
    TDADataSetOptions(Dest).FlatBuffers := FlatBuffers;
    TDADataSetOptions(Dest).DetailDelay := DetailDelay;
    TDADataSetOptions(Dest).SetFieldsReadOnly := SetFieldsReadOnly;
    TDADataSetOptions(Dest).QuoteNames := QuoteNames;
  {$IFDEF HAVE_COMPRESS}
    TDADataSetOptions(Dest).CompressBlobMode := CompressBlobMode;
  {$ENDIF}
    TDADataSetOptions(Dest).LocalMasterDetail := LocalMasterDetail;
    TDADataSetOptions(Dest).CacheCalcFields := CacheCalcFields;
    TDADataSetOptions(Dest).FullRefresh := FullRefresh;
    TDADataSetOptions(Dest).UpdateAllFields := UpdateAllFields;
  end
  else
    inherited;
end;

procedure TDADataSetOptions.SetRequiredFields(Value: boolean);
begin
  if FRequiredFields <> Value then begin
    FRequiredFields := Value;
    FOwner.FLocalConstraints := FRequiredFields;
    FOwner.FieldDefs.Updated := False;
    if FOwner.Active then // for change RequiredFields in runtime
      FOwner.FieldDefs.Update;
  end;
end;

procedure TDADataSetOptions.SetNumberRange(Value: boolean);
begin
  FNumberRange := Value;
  FOwner.FNumberRange := FNumberRange;
end;

procedure TDADataSetOptions.SetTrimFixedChar(Value: boolean);
begin
  FTrimFixedChar := Value;
  FOwner.Data.TrimFixedChar := FTrimFixedChar;
end;

procedure TDADataSetOptions.SetTrimVarChar(Value: boolean);
begin
  FTrimVarChar := Value;
  FOwner.Data.TrimVarChar := FTrimVarChar;
end;

procedure TDADataSetOptions.SetLongStrings(Value: boolean);
begin
  FOwner.CheckInactive;
  FLongStrings := Value;
  FOwner.FIRecordSet.SetProp(prLongStrings, FLongStrings);
  FOwner.FieldDefs.Updated := False;
end;

procedure TDADataSetOptions.SetAutoPrepare(Value: boolean);
begin
  if FAutoPrepare = Value then
    Exit;

  FOwner.Unprepare;
  FAutoPrepare := Value;
end;

procedure TDADataSetOptions.SetFlatBuffers(const Value: boolean);
begin
  FOwner.CheckInactive;
  FFlatBuffers := Value;
  FOwner.FIRecordSet.SetProp(prFlatBuffers, Value);
end;

procedure TDADataSetOptions.SetDetailDelay(Value: integer);
begin
  FDetailDelay := Value;
{$IFDEF MSWINDOWS}
  FOwner.CheckRefreshDetailTimer;
  FOwner.FDetailRefreshTimer.Interval := Value;
{$ENDIF}
end;

procedure TDADataSetOptions.SetLocalMasterDetail(Value: boolean);
begin
  if Value <> FLocalMasterDetail then begin
    FOwner.CheckInactive;  
    FLocalMasterDetail := Value;
    if FLocalMasterDetail then
      FOwner.FIRecordSet.FilterMDFunc := FOwner.LocalDetailFilter
    else
      FOwner.FIRecordSet.FilterMDFunc := nil;

    if Value then
      FOwner.AssembleSQL;
  end;  
end;

function TDADataSetOptions.GetCacheCalcFields: boolean;
begin
  Result := FOwner.FCacheCalcFields;
end;

procedure TDADataSetOptions.SetCacheCalcFields(Value: boolean);
begin
  if Value <> CacheCalcFields then begin
    FOwner.CheckInactive;
    FOwner.FCacheCalcFields := Value;
  end;
end;

{$IFDEF HAVE_COMPRESS}
procedure TDADataSetOptions.SetCompressBlobMode(Value: TCompressBlobMode);
begin
  if FCompressBlobMode <> Value then begin
    TCustomDADataSet(FOwner).CheckInactive;
    FCompressBlobMode := Value;
    FOwner.FIRecordSet.SetProp(prCompressBlobMode, Integer(Value));
    FOwner.FieldDefs.Updated := False;
  end;
end;
{$ENDIF}

{ TDASQLGenerator }

constructor TDASQLGenerator.Create(Owner: TCustomDADataSet);
begin
  inherited Create;

  Assert(Owner <> nil);
  FOwner := Owner;

  FHeaderSB := StringBuilder.Create(100);
  FFldSB := StringBuilder.Create(100);
  FMiddleSB := StringBuilder.Create(100);
  FFldParamSB := StringBuilder.Create(100);
  FCondSB := StringBuilder.Create(100);
  FFooterSB := StringBuilder.Create(100);

  FParamsInfo := TDAParamsInfo.Create(GetParamInfoClass);
end;

destructor TDASQLGenerator.Destroy;
begin
  FParamsInfo.Free;

  FHeaderSB.Free;
  FFldSB.Free;
  FMiddleSB.Free;
  FFldParamSB.Free;
  FCondSB.Free;
  FFooterSB.Free;
  inherited;
end;

function TDASQLGenerator.GetParamInfoClass: TDAParamInfoClass;
begin
  Result := TDAParamInfo;
end;

procedure TDASQLGenerator.Clear;
begin
  FHeaderSB.Length := 0;
  FFldSB.Length := 0;
  FMiddleSB.Length := 0;
  FFldParamSB.Length := 0;
  FCondSB.Length := 0;
  FFooterSB.Length := 0;

  FOldRecBuf := nil;
  FNewRecBuf := nil;
end;

function TDASQLGenerator.AssembleSB(const StatementType: TStatementType): string;
begin
  // TODO: may be optimized for Win32
  Result :=
    FHeaderSB.ToString +
    FFldSB.ToString +
    FMiddleSB.ToString +
    FFldParamSB.ToString +
    FCondSB.ToString +
    FFooterSB.ToString;
end;

function TDASQLGenerator.Data: TData;
begin
  Result := FOwner.Data;
end;

function TDASQLGenerator.OldRecBuf: IntPtr;
begin
  if FOldRecBuf <> nil then
    Result := FOldRecBuf
  else
  begin
    // Old buffer
    if FOwner.FInDeferredPost then
      Result := FOwner.OldDeferredPostBuf
    else
    if FOwner.FInCacheProcessing then
      Result := FOwner.OldCacheRecBuf
    else
      Result := FOwner.GetOldRecord;
    FOldRecBuf := Result;
  end
end;

function TDASQLGenerator.NewRecBuf: IntPtr;
begin
  if FNewRecBuf <> nil then
    Result := FNewRecBuf
  else
  begin
    // New buffer
    if FOwner.FInCacheProcessing then
      Result := FOwner.NewCacheRecBuf
    else
      Result := FOwner.ActiveBuffer;
    FNewRecBuf := Result;
  end
end;

function TDASQLGenerator.IsBlobDataType(DataType: word): boolean;
begin
  Result := DataType in [dtBlob, dtMemo, dtWideMemo];  //Data.IsBlobFieldType
end;

function TDASQLGenerator.IsObjectDataType(DataType: word): boolean;
begin
  Result := DataType in [dtObject, dtArray];
end;

function TDASQLGenerator.FieldIsNull(FieldDesc: TCRFieldDesc; OldValue: boolean; Data: TData; OldRecBuf, NewRecBuf: IntPtr): boolean;
//This function added for Expand fields support
var
  i: integer;
begin
  Result := not FOwner.Active;
  if Result then
    Exit;
    
  if IsObjectDataType(FieldDesc.DataType) then begin
    i := FieldDesc.FieldNo;
    while (i < Data.FieldCount) and (Data.Fields[i].ParentField = FieldDesc) do begin
      Result := FieldIsNull(TCRFieldDesc(Data.Fields[i]), OldValue);
      inc(i);
      if not Result then
        Break;
    end;
  end
  else
    if OldValue then
      Result := Data.GetNull(FieldDesc.FieldNo, OldRecBuf)
    else
      Result := Data.GetNull(FieldDesc.FieldNo, NewRecBuf);
end;

function TDASQLGenerator.FieldIsNull(FieldDesc: TCRFieldDesc; OldValue: boolean): boolean;
begin
  Result := not FOwner.Active;
  if Result then
    Exit;

  Result := FieldIsNull(FieldDesc, OldValue, Data, OldRecBuf, NewRecBuf);
end;

function TDASQLGenerator.FieldModified(FieldDesc: TCRFieldDesc; Data: TData; OldRecBuf, NewRecBuf: IntPtr): boolean;
//This function added for Expand fields support
var
  i: integer;
begin
  if IsBlobDataType(FieldDesc.DataType) then begin
    if FOwner.FInCacheProcessing then
      Result := Data.GetObject(FieldDesc.FieldNo, NewRecBuf) <>
        Data.GetObject(FieldDesc.FieldNo, OldRecBuf)
    else
      Result := TBlob(Data.GetObject(FieldDesc.FieldNo, NewRecBuf)).Modified
  end
  else
  if IsObjectDataType(FieldDesc.DataType) then begin
    Result := False;
    i := FieldDesc.FieldNo;
    while (i < Data.FieldCount) and (Data.Fields[i].ParentField = FieldDesc) do begin //Child FieldDescs always next to parent FielDescs
      Result := FieldModified(TCRFieldDesc(Data.Fields[i]));
      inc(i);
      if Result then
        break;
    end;
  end
  else
    Result := TMemData(Data).CompareFields(OldRecBuf, NewRecBuf, FieldDesc) <> 0;
end;

function TDASQLGenerator.FieldModified(FieldDesc: TCRFieldDesc): boolean;
begin
  Result := FieldModified(FieldDesc, Data, OldRecBuf, NewRecBuf);
end;

function TDASQLGenerator.GetActualFieldName(FieldDesc: TCRFieldDesc; IsRefresh: boolean): string;
begin
  Result := QuoteName(GetActualFieldNameEx(FieldDesc, FieldDesc.TableInfo));
  if IsRefresh and FOwner.Options.FullRefresh or FOwner.ReadOnly then begin//Use original Select part, so we could use Field aliasess
    if (FieldDesc.TableInfo <> nil) then
      if FieldDesc.TableInfo.TableAlias <> '' then
        Result := FieldDesc.TableInfo.NormalizeName(FieldDesc.TableInfo.TableAlias, FOwner.FOptions.FQuoteNames) +
          '.' + Result
      else
        Result := FieldDesc.TableInfo.NormalizeName(FieldDesc.TableInfo.TableName, FOwner.FOptions.FQuoteNames) +
          '.' + Result;
  end;
end;

function TDASQLGenerator.GetActualFieldNameEx(FieldDesc: TCRFieldDesc; TableInfo: TCRTableInfo): string;
var
  p: integer;
begin
  Result := FieldDesc.ActualName;
  if (FieldDesc.TableInfo = TableInfo) or (FieldDesc.TableInfo.TableName = TableInfo.TableName) then begin
    p := Pos('.', Result);
    if (p <> 0) and (Pos(FieldDesc.TableInfo.TableName, Result) = 1) then //Here we should detremine that Result is not something like "Dot.FieldName"
      Result := Copy(Result, p + 1, MaxInt);{Delete table name from fieldname}
  end;
end;

function TDASQLGenerator.GenerateIndexName(Name: string): string;
begin
  Result := '_' + Name;
end;

function TDASQLGenerator.DecodeFieldIndex(FieldName: string): integer;
var
  e: integer;
begin
  Result := -1;
  if (Length(FieldName) >= 2) and (FieldName[1] = '_') then begin
    Val(Copy(FieldName, 2, MaxInt), Result, e);
    if e <> 0 then
      Result := -1;
  end;
end;

function TDASQLGenerator.IndexedPrefix: string;
begin
  Result := 'P_';
end;

function TDASQLGenerator.QuoteName(const AName: string): string;
begin
  Assert(FOwner <> nil);
  Result := FOwner.QuoteName(AName);
end;

function TDASQLGenerator.UnQuoteName(AName: string): string;
begin
  Assert(FOwner <> nil);
  Result := FOwner.UnQuoteName(AName);
end;

function TDASQLGenerator.IsSubstituteParamName: boolean;
begin
  Result := True;
end;

procedure TDASQLGenerator.AddParam(SB: StringBuilder; FieldDesc: TFieldDesc;
      const StatementType: TStatementType;
      const ParamType: TParamType;
      Index: integer = -1;
      Old: boolean = False);
var
  ParamName: string;
  ParamInfo: TDAParamInfo;
  Param: TDAParam;
begin
  { Nonsense after adding ParamsInfo support
  if not (csDesigning in FOwner.ComponentState) and (FieldDesc.FieldNo <> 0) then
    ParamName := IntToStr(FieldDesc.FieldNo)
  else}
    ParamName := FieldDesc.Name;

  if Old then
    ParamName := 'Old_' + ParamName;

  if Index > - 1 then
    ParamName := IndexedPrefix + IntToStr(Index) + '_' + ParamName;

//  if csDesigning in FOwner.ComponentState then // Don't call QuoteName IntToStr(FieldDesc.FieldNo)
    ParamName := QuoteName(ParamName); //TODO:???? QuoteName

  if ((FParams = nil) or not IsSubstituteParamName) or (((FOwner.Params.Count > 0) or FOwner.Options.FullRefresh) and (StatementType = stRefresh)) then begin
    SB.Append(':');
    SB.Append(ParamName);
  end
  else
    SB.Append('?');

  if FParams <> nil then begin
    Param := TDAParam(FParams.Add);
    Param.ParamType := ParamType;
    Param.Name := ParamName;
    ParamInfo := TDAParamInfo(FParamsInfo.Add);
    ParamInfo.Field := FOwner.GetField(FieldDesc);
    ParamInfo.Old := Old;
    ParamInfo.ParamIndex := Index;
  end;
end;

procedure TDASQLGenerator.AddFieldToCondition(SB: StringBuilder; FieldDesc: TCRFieldDesc; const StatementType: TStatementType;
  const ModifiedFieldsOnly: boolean; const Index: integer = -1);
var
  ActualName: string;
begin
  if SB.Length > 0 then
    SB.Append(' AND ');
    
  Assert(FieldDesc <> nil);
  ActualName := GetActualFieldName(FieldDesc, StatementType = stRefresh);
  SB.Append(ActualName);

  if ModifiedFieldsOnly and FieldIsNull(FieldDesc, StatementType <> stRefresh) then  //Refresh generated with current field values
    SB.Append(' IS NULL')
  else
  begin
    SB.Append(' = ');
    AddParam(SB,FieldDesc, StatementType, ptInput, Index, (StatementType <> stRefresh) or
      (FOwner.CachedUpdates and (StatementType = stRefresh))); //Refresh generated with current field values
  end;
end;

procedure TDASQLGenerator.GenerateConditions(SB: StringBuilder; const StatementType: TStatementType;
      const ModifiedFieldsOnly: boolean; const KeyAndDataFields: TKeyAndDataFields;
      const Index: integer = -1);
var
  i: integer;
begin
  if Length(KeyAndDataFields.KeyFieldDescs) > 0 then
    for i := 0 to High(KeyAndDataFields.KeyFieldDescs) do
      AddFieldToCondition(SB, KeyAndDataFields.KeyFieldDescs[i], StatementType, ModifiedFieldsOnly, Index)
  else begin
    if FOwner.FIdentityField <> nil then
      AddFieldToCondition(SB, TCRFieldDesc(FOwner.GetFieldDesc(FOwner.FIdentityField)),
        StatementType, ModifiedFieldsOnly, Index)
    else begin
      if Length(KeyAndDataFields.DataFieldDescs) = 0 then
        DatabaseError(SNoKeyFields);
      for i := 0 to High(KeyAndDataFields.DataFieldDescs) do
        if not IsBlobDataType(KeyAndDataFields.DataFieldDescs[i].DataType) then 
          AddFieldToCondition(SB, KeyAndDataFields.DataFieldDescs[i], StatementType, ModifiedFieldsOnly, Index);
    end;
  end;
end;

procedure TDASQLGenerator.AddFieldToInsertSQL(FieldDesc: TCRFieldDesc; const Index: integer = -1);
begin
  if FFldSB.Length > 0 then begin
    FFldSB.Append(', ');
    FFldParamSB.Append(', ');
  end;

  FFldSB.Append(FieldDesc.ActualNameQuoted(TCRRecordSet(FOwner.Data), FOwner.Options.QuoteNames));
  AddParam(FFldParamSB, FieldDesc, stInsert, ptInput, Index);
end;

procedure TDASQLGenerator.GenerateInsertSQL(
  const KeyAndDataFields: TKeyAndDataFields;
  const ModifiedFieldsOnly: boolean;
  const Index: integer = -1);
var
  i: integer;
  FieldDesc: TCRFieldDesc;
begin
  for i := 0 to High(KeyAndDataFields.DataFieldDescs) do begin
    FieldDesc := KeyAndDataFields.DataFieldDescs[i];
    // Insert all(!) field values
    if not ModifiedFieldsOnly or not FieldIsNull(FieldDesc, False) then
      AddFieldToInsertSQL(FieldDesc, Index);
  end;

  FHeaderSB.Append('INSERT INTO ');
  FHeaderSB.Append(FTableInfo.NormalizeName(FTableInfo.TableNameFull, FOwner.FOptions.FQuoteNames));
  FHeaderSB.Append(SLLineSeparator);
  FHeaderSB.Append('  (');
  // Append FFldSB
  FMiddleSB.Append(')');
  FMiddleSB.Append(SLLineSeparator);
  FMiddleSB.Append('VALUES');
  FMiddleSB.Append(SLLineSeparator);
  FMiddleSB.Append('  (');
  // Append FFldParamSB
  FFooterSB.Append(')');
end;

procedure TDASQLGenerator.AddFieldToUpdateSQL(FieldDesc: TCRFieldDesc; const ModifiedFieldsOnly: boolean;
  const Index: integer = -1);
begin
  if FFldSB.Length > 0 then
    FFldSB.Append(', ');
    
  FFldSB.Append(FieldDesc.ActualNameQuoted(TCRRecordSet(FOwner.Data), FOwner.Options.QuoteNames));
  FFldSB.Append(' = ');
  AddParam(FFldSB, FieldDesc, stUpdate, ptInput, Index);
end;

procedure TDASQLGenerator.GenerateUpdateSQL(
  const KeyAndDataFields: TKeyAndDataFields;
  const ModifiedFieldsOnly: boolean;
  const Index: integer = -1);
var
  i: integer;
  FieldDesc: TCRFieldDesc;
begin
  for i := 0 to High(KeyAndDataFields.DataFieldDescs) do begin
    FieldDesc := KeyAndDataFields.DataFieldDescs[i];

    if not ModifiedFieldsOnly or FieldModified(FieldDesc) then
      AddFieldToUpdateSQL(FieldDesc, ModifiedFieldsOnly, Index);
  end;

  if FFldSB.Length > 0 then begin
    FHeaderSB.Append('UPDATE ');
    FHeaderSB.Append(FTableInfo.NormalizeName(FTableInfo.TableNameFull, FOwner.FOptions.FQuoteNames));
    FHeaderSB.Append(SLLineSeparator);
    FHeaderSB.Append('SET');
    FHeaderSB.Append(SLLineSeparator);
    FHeaderSB.Append('  ');
    // Append FFldSB
    FMiddleSB.Append(SLLineSeparator);
    FMiddleSB.Append('WHERE');
    FMiddleSB.Append(SLLineSeparator);
    FMiddleSB.Append('  ');
    // Append FParamSB
    GenerateConditions(FCondSB, stUpdate, ModifiedFieldsOnly, KeyAndDataFields, Index);
  end;
end;

procedure TDASQLGenerator.GenerateDeleteSQL(
  const KeyAndDataFields: TKeyAndDataFields;
  const ModifiedFieldsOnly: boolean;
  const Index: integer = -1);
begin
  FHeaderSB.Append('DELETE FROM ');
  FHeaderSB.Append(FTableInfo.NormalizeName(FTableInfo.TableNameFull, FOwner.FOptions.FQuoteNames));
  FHeaderSB.Append(SLLineSeparator);
  FHeaderSB.Append('WHERE');
  FHeaderSB.Append(SLLineSeparator);
  FHeaderSB.Append('  ');
  GenerateConditions(FCondSB, stDelete, ModifiedFieldsOnly, KeyAndDataFields, Index);
end;
 
procedure TDASQLGenerator.GenerateLockSQL(
  const KeyAndDataFields: TKeyAndDataFields;
  const Index: integer = -1);
begin
  
end;

procedure TDASQLGenerator.AddFieldToRefreshSQL(FieldDesc: TCRFieldDesc);
begin
  if FFldSB.Length > 0 then
    FFldSB.Append(', ');

  if FieldDesc.TableInfo = nil then
    FFldSB.Append(FieldDesc.ActualNameQuoted(TCRRecordSet(FOwner.Data), FOwner.Options.QuoteNames))
  else
    if FieldDesc.TableInfo.TableAlias <> '' then
      FFldSB.Append(FieldDesc.TableInfo.NormalizeName(FieldDesc.TableInfo.TableAlias, FOwner.FOptions.FQuoteNames) +
        '.' + FieldDesc.ActualNameQuoted(TCRRecordSet(FOwner.Data), FOwner.Options.QuoteNames))
    else
      FFldSB.Append(FieldDesc.TableInfo.NormalizeName(FieldDesc.TableInfo.TableName, FOwner.FOptions.FQuoteNames) +
        '.' + FieldDesc.ActualNameQuoted(TCRRecordSet(FOwner.Data), FOwner.Options.QuoteNames));

  if not (csDesigning in FOwner.ComponentState) then
    FFldSB.Append(' AS ' + GenerateIndexName(IntToStr(FOwner.FIRecordSet.Fields.IndexOf(FieldDesc))));
end;

procedure TDASQLGenerator.GenerateRefreshSQLSelectPart(const KeyAndDataFields: TKeyAndDataFields);
var
  i: integer;
  FieldArrHigh: integer;
  UseDataFields: boolean;
  FieldDesc: TCRFieldDesc;
begin
  FHeaderSB.Append('SELECT ');

  UseDataFields := Length(KeyAndDataFields.DataFieldDescs) > 0;
  if UseDataFields then
    FieldArrHigh := Length(KeyAndDataFields.DataFieldDescs) - 1
  else
    FieldArrHigh := High(KeyAndDataFields.KeyFieldDescs);

  // SELECT ... FROM .... {WITH NOLOCK}
  // Add SELECT section
  for i := 0 to FieldArrHigh do begin
    if UseDataFields then
      FieldDesc := KeyAndDataFields.DataFieldDescs[i]
    else
      FieldDesc := KeyAndDataFields.KeyFieldDescs[i];

    AddFieldToRefreshSQL(FieldDesc);
  end;
end;

procedure TDASQLGenerator.GenerateRefreshSQLFromPart;
begin
  FMiddleSB.Append(FTableInfo.NormalizeName(FTableInfo.TableName, FOwner.FOptions.FQuoteNames));
  if FTableInfo.TableAlias <> '' then begin
    FMiddleSB.Append(' ');
    FMiddleSB.Append(FTableInfo.NormalizeName(FTableInfo.TableAlias, FOwner.FOptions.FQuoteNames));
  end;
end;

procedure TDASQLGenerator.GenerateRefreshSQL(
  const KeyAndDataFields: TKeyAndDataFields;
  const ModifiedFieldsOnly: boolean);
begin
  GenerateConditions(FCondSB, stRefresh, ModifiedFieldsOnly, KeyAndDataFields);
  if FOwner.Options.FullRefresh or FOwner.ReadOnly then begin
    if FCondSB.Length = 0 then
      FHeaderSB.Append(FOwner.SQL.Text)
    else begin
      FHeaderSB.Append(FOwner.SQLAddWhere(FOwner.SQL.Text, SLLineSeparator + '  ' + FCondSB.ToString));
      FCondSB.Length := 0; // WHERE clause already added to FHeaderSB
    end;
  end
  else begin
    GenerateRefreshSQLSelectPart(KeyAndDataFields);
    FMiddleSB.Append(' FROM ');
    GenerateRefreshSQLFromPart;
    FMiddleSB.Append(SLLineSeparator);
    FMiddleSB.Append('WHERE');
    FMiddleSB.Append(SLLineSeparator);
    FMiddleSB.Append('  ');
  end;
end;

procedure TDASQLGenerator.GenerateRefreshQuickSQL(const KeyAndDataFields: TKeyAndDataFields);
begin
  GenerateConditions(FCondSB, stRefreshQuick, False{ignored}, KeyAndDataFields);
  FHeaderSB.Append(FOwner.SQLAddWhere(FOwner.FinalSQL, FCondSB.ToString));
  FCondSB.Length := 0; // WHERE clause already added to FHeaderSB
end;

procedure TDASQLGenerator.GenerateRefreshCheckDeletedSQL(const KeyAndDataFields: TKeyAndDataFields);
var
  i: integer;
  FieldDesc: TFieldDesc;
  ActualFieldName: string;
  Condition: string;

  function ForceUnQuoteName(AName: string): string;
  var
    l: integer;
  begin
    AName := Trim(AName);
    l := Length(AName);
    if (l >= 3) and (AName[1] = FOwner.FLeftQuote) and (AName[l] = FOwner.FRightQuote) then
      Result := Copy(AName, 2, l - 2)
    else
      Result := AName;
  end;

begin
  FHeaderSB.Append('SELECT ');

  for i:= 0 to Length(KeyAndDataFields.KeyFieldDescs) - 1 do begin
    FieldDesc := KeyAndDataFields.KeyFieldDescs[i];
    if i > 0 then begin
      FFldSB.Append(', ');
      FFooterSB.Append(', ');
    end;
    ActualFieldName := GetActualFieldName(TCRFieldDesc(FieldDesc), False);
    FFldSB.Append(ActualFieldName);
    FFooterSB.Append(ActualFieldName);
    if UpperCase(ForceUnQuoteName(ActualFieldName)) <> UpperCase(ForceUnQuoteName(FieldDesc.Name)) then
      FFldSB.Append(' AS ' + FieldDesc.Name);
  end;

  FMiddleSB.Append(' FROM ');
  FMiddleSB.Append(FTableInfo.NormalizeName(FTableInfo.TableNameFull, FOwner.FOptions.FQuoteNames));
  Condition := FOwner.SQLGetWhere(FOwner.FinalSQL);
  if Condition <> '' then
    FMiddleSB.Append(' WHERE ' + Condition);
  FMiddleSB.Append(' ORDER BY ');
end;

function TDASQLGenerator.GenerateSQLforUpdTable(TableInfo: TCRTableInfo;
  const KeyAndDataFields: TKeyAndDataFields;
  const StatementType: TStatementType;
  const ModifiedFieldsOnly: boolean;
  Params: TDAParams;
  const Index: integer = -1): string;
begin
  if TableInfo.TableName = '' then
    DatabaseError(SBadTableInfoName);

  Clear;

  FTableInfo := TableInfo;
  FParams := Params;
  if FParams <> nil then begin
    FParams.BeginUpdate;
    FParams.Clear;
    FParamsInfo.Clear;
  end;
  try
    case StatementType of
      stInsert:
        GenerateInsertSQL(KeyAndDataFields, ModifiedFieldsOnly, Index);
      stUpdate:
        GenerateUpdateSQL(KeyAndDataFields, ModifiedFieldsOnly, Index);
      stDelete:
        GenerateDeleteSQL(KeyAndDataFields, ModifiedFieldsOnly, Index);
      stLock:
        GenerateLockSQL(KeyAndDataFields, Index);
      stRefresh:
        GenerateRefreshSQL(KeyAndDataFields, ModifiedFieldsOnly);
      stRefreshQuick:
        GenerateRefreshQuickSQL(KeyAndDataFields);
      stRefreshCheckDeleted:
        GenerateRefreshCheckDeletedSQL(KeyAndDataFields);
    else
      DatabaseError(SBadStatementType);
    end;

    Result := AssembleSB(StatementType);
  finally
    if FParams <> nil then begin
      FParams.EndUpdate;
      RecreateParamsRef(FParams);
    end;
  end;
end;

function TDASQLGenerator.GenerateSQL(const StatementType: TStatementType;
  const ModifiedFieldsOnly: boolean;
  Params: TDAParams;
  const Index: Integer = -1): string;
var
  KeyAndDataFields: TKeyAndDataFields;
begin
{$IFDEF PERF_COUNTER}
  PerfCounters[4].Start;
{$ENDIF}
  if FOwner.FUpdatingTableInfoIdx = -1 then
    Result := ''
  else
  begin
    FOwner.GetKeyAndDataFields(KeyAndDataFields, (StatementType = stRefresh) and FOwner.Options.FullRefresh);
    Result := GenerateSQLforUpdTable(FOwner.TablesInfo[FOwner.FUpdatingTableInfoIdx],
      KeyAndDataFields, StatementType, ModifiedFieldsOnly, Params, Index);
  end;
{$IFDEF PERF_COUNTER}
  PerfCounters[4].Stop;
{$ENDIF}
end;

{ TCustomDASQL }

constructor TCustomDASQL.Create(Owner: TComponent);
begin
  inherited Create(Owner);

  FSQL := TStringList.Create;
  TStringList(FSQL).OnChange := SQLChanged;
  FParams := CreateParamsObject;
  FParamCheck := True;
  if Owner is TCustomDADataSet then
    FMacros := TMacros.Create(Owner)
  else
    FMacros := TMacros.Create(Self);
  FChangeCursor := True;

  FDesignCreate := csDesigning in ComponentState;

  if not (Owner is TCustomDADataSet) then  // temp
    CreateICommand;
end;

destructor TCustomDASQL.Destroy;
var
  Owner: TComponent;
begin
  UnPrepare;

  if UsedConnection <> nil then
    UsedConnection.UnregisterClient(Self);

  FMacros.Free;
  FParams.Clear; // To prevent SharedObj leak on CLR
  FParams.Free;
  FSQL.Free;

  Owner := Self.Owner;

  inherited;

  if not (Owner is TCustomDADataSet) then  // temp
    FreeICommand;
end;

procedure TCustomDASQL.CreateICommand;
begin
  if UsedConnection <> nil then
    SetICommand(UsedConnection.CreateICommand)
  else
    SetICommand(nil);
end;

procedure TCustomDASQL.FreeICommand;
begin
  FICommand.Free;
  SetICommand(nil);
end;

procedure TCustomDASQL.SetICommand(Value: TCRCommand);
var
  ScanParams: variant;
begin
  FICommand := Value;

  if FICommand <> nil then begin
    if FConnection <> nil then
      FICommand.SetConnection(FConnection.FIConnection)
    else
      FICommand.SetConnection(nil);

    FICommand.SetSQL(FNativeSQL);  //AssembleSQL; // set FICommand.SQL
    FICommand.SetProp(prAutoCommit, FAutoCommit);
    FICommand.AfterExecute := DoAfterExecute;
    if (Owner is TCustomDADataSet) or (Owner is TCustomDAConnection) then
      FICommand.Component := Owner
    else
      FICommand.Component := Self;  
    FICommand.GetProp(prScanParams, ScanParams);

    // Write param info
    if not boolean(ScanParams) then
      WriteParams(False);
  end;
end;

procedure TCustomDASQL.CheckICommand;
var
  ClassType: TClass;
begin
  if (UsedConnection <> nil) then
    ClassType := UsedConnection.GetICommandClass
  else
    ClassType := nil;

  if (ClassType = nil) or not (FICommand is ClassType) then begin
    FreeICommand;
    CreateICommand;
  end;
end;

function TCustomDASQL.CreateParamsObject: TDAParams;
begin
  Result := TDAParams.Create(Self);
end;

procedure TCustomDASQL.Loaded;
begin
  inherited;

  FDesignCreate := False;
end;

function TCustomDASQL.UsedConnection: TCustomDAConnection;
begin
  Result := FConnection
end;

procedure TCustomDASQL.CheckConnection;
begin
  BeginConnection(False);
end;

procedure TCustomDASQL.BeginConnection(NoConnectCheck: boolean = True);
begin
  if UsedConnection = nil then
    DatabaseError(SConnectionNotDefined);


    if NoConnectCheck then
      UsedConnection.InternalConnect // We should call connect each time to update ConnectCount
    else
      if not UsedConnection.Connected then
        UsedConnection.Connect;

// use default session
  if (FConnection = nil) and (UsedConnection.FSQLs.IndexOf(Self) = -1) then begin
    UsedConnection.RegisterClient(Self, ConnectChange);

    CheckICommand;
    FICommand.SetConnection(UsedConnection.FIConnection)
  end;
end;

procedure TCustomDASQL.EndConnection;
begin
  if UsedConnection <> nil then
    UsedConnection.InternalDisconnect;
end;

procedure TCustomDASQL.Disconnect;
begin
  if FDataSet = nil then
    UnPrepare
  else
    FDataSet.Disconnect;
end;

procedure TCustomDASQL.ConnectChange(Sender: TObject; Connecting: boolean);
begin
  if not Connecting then
    Disconnect;
end;

procedure TCustomDASQL.InternalPrepare;
begin
  FICommand.Prepare;
end;

procedure TCustomDASQL.Prepare;
var
  MessageID: cardinal;
begin
  if not Prepared then begin
    BeginConnection;

    if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then
      TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLPrepare(Self, FinalSQL, FParams, MessageID, True);

    InternalPrepare;

    if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then
      TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLPrepare(Self, FinalSQL, FParams, MessageID, False);
  end;
end;

procedure TCustomDASQL.InternalUnPrepare;
begin
  FICommand.Unprepare;
end;

procedure TCustomDASQL.UnPrepare;
begin
  if Prepared then begin
    try
      InternalUnPrepare;
    finally
      EndConnection; //Diconnect after no longer prepared
    end;
  end;
end;

procedure TCustomDASQL.InternalExecute(Iters: integer);
var
  ReExecute: boolean;
begin
  if UsedConnection <> nil then
    UsedConnection.PushOperation(clExecute);
  try
    repeat
      ReExecute := False;
      try
        FICommand.Execute(Iters);
      except
        on E: EFailOver do
          if E.FConnLostCause = clExecute then begin
            Connection.RestoreAfterFailOver; //Restore all read transactions
            ReExecute := True; //We should pass clConnectionApplyUpdates FailOver
          end  
          else
            raise;
      end;
    until (not ReExecute);
  finally
    if UsedConnection <> nil then
      UsedConnection.PopOperation;
  end;
end;

procedure TCustomDASQL.Execute;
begin
  Execute(1);
end;

procedure TCustomDASQL.Execute(Iters: integer);
var
  MessageID: cardinal;
begin
  if not Executing then begin
    BeginConnection;

    if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then
      TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLExecute(Self, FinalSQL, FParams, '', MessageID, True);

    if FChangeCursor then
      if FNonBlocking then
        SetCursor(crSQLArrow)
      else
        StartWait;

    WriteParams;
    InternalExecute(Iters);

    if not FLockDebug and (TDASQLMonitorClass(UsedConnection.SQLMonitorClass).HasMonitor or Debug) then
      TDASQLMonitorClass(UsedConnection.SQLMonitorClass).SQLExecute(Self, FinalSQL, FParams, '', MessageID, False);
  end;
end;

procedure TCustomDASQL.DoAfterExecute(Result: boolean);
var
  Connection: TCustomDAConnection;
begin
  if Result then
    ReadParams;

  if FChangeCursor and FNonBlocking then
    StopWait;

  Connection := UsedConnection;
  if Connection.Options.DisconnectedMode and Connection.Connected then begin
    //AutoCommit control
    if not (Connection.AutoCommit and AutoCommit) and
      (Connection.FTransactionID = '') then begin //Connection.GetInTransaction are not allowed here since it could be setted to True on
                                            // Product level during Execuion without AutoCommit (ODAC, IBDAC)
      //There is uncommitted transaction that was implicitly started by server
      Connection.FTransactionID := 'CRImplicitTransaction'; //Set default value
      Connection.FTransactionID := Connection.GetTransactionID; //To return product specific TransactionId
                                                                //or even reset InTransaction in case of transaction-free server operation
    end
    else
    if Connection.AutoCommit and AutoCommit then begin
      Connection.FTransactionID := Connection.GetTransactionID; //To return product specific TransactionId
    end;
  end;
  EndConnection; //we should read all Out parameters before disconnect, so
                 //in NonBlocking Mode this event must be called exactly after server execute
  if Assigned(FAfterExecute) then
    FAfterExecute(Self, Result);
end;

function TCustomDASQL.Executing: boolean;
var
  Value: variant;
begin
  FICommand.GetProp(prExecuting, Value);
  Result := Value;
end;

function TCustomDASQL.WaitExecuting(TimeOut: integer): boolean;
{$IFDEF MSWINDOWS}
var
  Msg: TMSG;
  T: DWORD;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  T := GetTickCount;
  while Executing and ((TimeOut = 0) or (GetTickCount - T < DWORD(TimeOut * 1000))) do
    if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then begin
      if Msg.Message <> WM_QUIT then begin
        TranslateMessage(Msg);
        DispatchMessage(Msg);
      end;
    end;
{$ELSE}
  while Executing do;
{$ENDIF}

  Result := not Executing;
end;

procedure TCustomDASQL.ScanMacros;
begin
  if FDataSet = nil then
    FMacros.Scan(FSQL.Text)
  else
    FDataSet.ScanMacros;
end;

function TCustomDASQL.GetFinalSQL: string;
var
  i: Integer;
begin
  Result := FSQL.Text;

  // Copied from SysUtils
  i := Length(Result);
  while (i > 0) and (Result[i] <= ' ') do
    Dec(i);
  SetLength(Result, i);

  if FMacros.Count > 0 then
    FMacros.Expand(Result);
end;

function TCustomDASQL.ParseSQL(const SQL: string; Params: TDAParams; RenamePrefix: string = ''): string;
var
  ParsedSQL: StringBuilder;
  Parser: TParser;
  StartPos: integer;

  LeftQuote, RightQuote: char;
begin
  if FDataSet <> nil then begin
    LeftQuote := FDataSet.FLeftQuote;
    RightQuote := FDataSet.FRightQuote;
  end
  else
  begin
    LeftQuote := '"';
    RightQuote := '"';
  end;

  ParsedSQL := StringBuilder.Create(Length(SQL) + Length(SQL) div 2);
  try
    Parser := CreateParser(SQL);
    try
      if Params <> nil then begin
        Params.BeginUpdate;
        Params.Clear;
      end;
      Parser.OmitBlank := False;
      Parser.OmitComment := True;
      Parser.QuotedString := True;
      Parser.ToBegin;
      StartPos := Parser.CurrPos;
      while Parser.ToLexem(':') do begin
        ParsedSQL.Append(Copy(SQL, StartPos + 1, Parser.CurrPos - StartPos - 1));
        ParseSQLParam(ParsedSQL, Parser, Params, LeftQuote, RightQuote, RenamePrefix);

        StartPos := Parser.CurrPos;
      end;
      ParsedSQL.Append(Copy(SQL, StartPos + 1, Parser.CurrPos - StartPos));
    finally
      Parser.Free;
      if Params <> nil then
        Params.EndUpdate;
    end;

    Result := ParsedSQL.ToString;
  finally
    ParsedSQL.Free;
  end;
end;

function TCustomDASQL.ParseSQL(Params: TDAParams): string;
begin
  Result := ParseSQL(FNativeSQL, Params, '');
end;

procedure TCustomDASQL.ParseSQLParam(ParsedSQL: StringBuilder; Parser: TParser; Params: TDAParams; const LeftQuote, RightQuote: char; RenamePrefix: string);
var
  Code: integer;
  St: string;
  DogPresent: boolean;
  l: integer;
  ParamName: string;
begin
  Code := Parser.GetNext(St);
  DogPresent := St = '@';
  if DogPresent then
    Code := Parser.GetNext(St); // Omit '@' in ParamName for BDE compatibility

  if ((Params <> nil) or (RenamePrefix <> '')) and ((Code = lcIdent) or (Code = lcNumber) or (Parser.KeywordLexems.IndexOf(St) <> -1)) // and (St <> '=')
  then begin
    if DogPresent then
      ParamName := '@' + St
    else
      ParamName := St;

    l := Length(ParamName);
    // remove quotes
    if (ParamName[1] = LeftQuote) and (ParamName[l] = RightQuote) then
      ParamName := Copy(ParamName, 2, l - 2);
    if Params <> nil then begin
      TDAParam(Params.Add).Name := ParamName;
      ParsedSQL.Append('?');
    end
    else
      ParsedSQL.Append(RenamePrefix + ParamName);
  end
  else // Labels in SQL Server, MySQL syntax and PL SQL Blocks (a := b).
  begin
    ParsedSQL.Append(':');
    if DogPresent then
      ParsedSQL.Append('@');
    ParsedSQL.Append(St);
  end;
end;

function TCustomDASQL.CreateParser(const Text: string): TParser;
begin
  Result := TParser.Create(Text);
end;

procedure TCustomDASQL.AssembleSQL;
var
  InternalScanParams: variant;  // scan params by internal layer
  List: TDAParams;
begin
{$IFDEF PERF_COUNTER}
  //PerfCounters[3].Start;
{$ENDIF}

  if FDataSet = nil then
    FNativeSQL := FinalSQL
  else
    FNativeSQL := FDataSet.FinalSQL;

  FICommand.GetProp(prScanParams, InternalScanParams);

  if ParamCheck or (csDesigning in ComponentState) then begin
    List := CreateParamsObject;
    try
      if boolean(InternalScanParams) then begin
      // Internal param parsing
        List.Assign(FParams);

        FICommand.SetSQL(FNativeSQL);

        CreateParams;

        FParams.AssignValues(List);
      end
      else begin
        List.BeginUpdate;
        try
          FNativeSQL := ParseSQL(FNativeSQL, List);
          List.AssignValues(FParams);
        finally
          List.EndUpdate;
        end;

        FParams.Clear;
        FParams.Assign(List);

        FICommand.SetSQL(FNativeSQL);

        WriteParams(False);
      end;
    finally
      List.Clear;
      List.Free;
    end;
  end
  else begin
//    if not InternalScanParams then                       // replace parameters
//      FNativeSQL := FParams.ParseSQL(FNativeSQL, False); // needed only in SDAC

    FICommand.SetSQL(FNativeSQL);
  end;
{$IFDEF PERF_COUNTER}
  //PerfCounters[3].Stop;
{$ENDIF}
end;

// creates TDAParam objects if parameters was parsed by FICommand
procedure TCustomDASQL.CreateParams;
var
  ParamDesc: TParamDesc;
  i: integer;
begin
  FParams.BeginUpdate;
  try
    FParams.Clear;
    for i := 0 to FICommand.GetParamCount - 1 do begin
      ParamDesc := FICommand.GetParam(i);
      with FParams.Add as TDAParam do begin
        Name := ParamDesc.GetName;
        DataType := GetFieldType(ParamDesc.GetDataType);
        ParamType := TParamType(ParamDesc.GetParamType);
      end;
    end;
  finally
    FParams.EndUpdate;
  end;
end;

// Write values of parameters to FICommand
procedure TCustomDASQL.WriteParams(WriteValue: boolean = True);
var
  Param: TDAParam;
  ParamDesc: CRAccess.TParamDesc;
  Dt: word;

  procedure WriteParamValue;
  var
    Value: Variant;
  {$IFDEF CLR}
    Bytes: TBytes;
  {$ELSE}
    l: integer;
    s: string;
  {$ENDIF}
  {$IFNDEF VER6P}
    tmp: int64;
  {$ENDIF}
  begin
    if Param.IsObjectDataType then begin
      ParamDesc.SetNull(Param.IsNull);
      ParamDesc.SetObject(Param.ParamObject);
      Exit;
    end;

    Value := Param.Value;
    if (Param.DataType = ftDate) and not (VarIsEmpty(Value) or VarIsNull(Value)) then begin
    {$IFDEF VER6P}
      Value := Trunc(Value); // drop time info /// CR-D16224
    {$ELSE}
      tmp := Trunc(Value);
      TVarData(Value).VType := varInt64;
      TVarDataD6(Value).VInt64 := tmp;
    {$ENDIF}
    end;


    // Convert param values if necessary
    if ((Dt = dtBytes) or (Dt = dtVarBytes) or (Dt = dtBlob))
      and (VarType(Value) <> varArray + varByte) then
      case VarType(Value) of
        varString{$IFDEF CLR}, varChar{$ENDIF}: begin
        {$IFDEF CLR}
          Bytes := Encoding.Default.GetBytes(String(Value));
          Value := Unassigned;
          Value := Bytes;
        {$ELSE}
          s := Value;
          l := Length(s);
          Value := Unassigned;
          Value := VarArrayCreate([0, l - 1], varByte);
          if l > 0 then
            Move(s[1], TVarData(Value).VArray.Data^, l);
        {$ENDIF}
        end;
      end;
    ParamDesc.SetValue(Unassigned);
    ParamDesc.SetValue(Value);
  end;
  
var
  ft: TFieldType;
  i: integer;
begin
  for i := 0 to Params.Count - 1 do begin
    Param := Params[i];
    if i < FICommand.GetParamCount then
      ParamDesc := FICommand.GetParam(i)
    else
      ParamDesc := FICommand.AddParam;
    ParamDesc.SetName(Param.Name);

    ft := Param.DataType;
    dt := GetDataType(ft);

    ParamDesc.SetDataType(dt);
    ParamDesc.SetParamType(TParamDirection(Param.ParamType));

    if WriteValue then begin
    {$IFDEF PERF_COUNTER}
      PerfCounters[5].Start;
    {$ENDIF}
      WriteParamValue;
    {$IFDEF PERF_COUNTER}
      PerfCounters[5].Stop;
    {$ENDIF}
    end;
  end;
  while Params.Count < FICommand.GetParamCount do
    FICommand.DeleteParam(FICommand.GetParamCount - 1);
end;

// Read values of parameters from FICommand
procedure TCustomDASQL.ReadParams;
var
  i: integer;
  Param: TDAParam;
  ParamDesc: TParamDesc;
begin
  for i := 0 to FParams.Count - 1 do begin
    Param := Params[i];
    ParamDesc := FICommand.GetParam(i);
    if ParamDesc <> nil then
      if (not Param.IsObjectDataType) and (Param.ParamType in [ptUnknown, ptOutput, ptInputOutput, ptResult]) then
        Param.Value := ParamDesc.Value;
  end;
end;

procedure TCustomDASQL.DefineProperties(Filer: TFiler);
  function WriteParams: boolean;
  begin
    if Filer.Ancestor <> nil then
      Result := not FParams.IsEqual(TCustomDASQL(Filer.Ancestor).FParams)
    else
      Result := FParams.Count > 0;
  end;

  function WriteMacros: boolean;
  begin
    if Filer.Ancestor <> nil then
      Result := not FMacros.IsEqual(TCustomDASQL(Filer.Ancestor).FMacros)
    else
      Result := FMacros.Count > 0;
  end;
begin
  inherited DefineProperties(Filer);

  Filer.DefineProperty('ParamData', ReadParamData, WriteParamData, WriteParams);
  Filer.DefineProperty('MacroData', ReadMacroData, WriteMacroData, WriteMacros);
end;

procedure TCustomDASQL.ReadParamData(Reader: TReader);
begin
  Reader.ReadValue;
  Reader.ReadCollection(FParams);
end;

procedure TCustomDASQL.WriteParamData(Writer: TWriter);
begin
  Writer.WriteCollection(FParams);
end;

procedure TCustomDASQL.ReadMacroData(Reader: TReader);
begin
  Reader.ReadValue;
  Reader.ReadCollection(FMacros);
end;

procedure TCustomDASQL.WriteMacroData(Writer: TWriter);
begin
  Writer.WriteCollection(FMacros);
end;

function TCustomDASQL.FindParam(const Value: string): TDAParam;
begin
  Result := FParams.FindParam(Value);
end;

function TCustomDASQL.ParamByName(const Value: string): TDAParam;
begin
  Result := FParams.ParamByName(Value);
end;

function TCustomDASQL.FindMacro(const Value: string): TMacro;
begin
  Result := FMacros.FindMacro(Value);
end;

function TCustomDASQL.MacroByName(const Value: string): TMacro;
begin
  Result := FMacros.MacroByName(Value);
end;

procedure TCustomDASQL.AssignTo(Dest: TPersistent);
begin
  if Dest is TCustomDASQL then begin
    TCustomDASQL(Dest).Connection := Connection;
    TCustomDASQL(Dest).ParamCheck := ParamCheck;  // before SQL
    TCustomDASQL(Dest).SQL.Text := SQL.Text;
    TCustomDASQL(Dest).Macros.Assign(Macros);
    TCustomDASQL(Dest).Params.Assign(Params);
    TCustomDASQL(Dest).Debug := Debug;
    TCustomDASQL(Dest).AutoCommit := AutoCommit;
  end
  else
    inherited;
end;

procedure TCustomDASQL.SetConnection(Value: TCustomDAConnection);
begin
  if (Value <> FConnection) or (Value <> UsedConnection) then begin
    if UsedConnection <> nil then begin
      Disconnect;
      UsedConnection.UnregisterClient(Self);
    end;

    FConnection := Value;

    if FConnection <> nil then begin
      Value.RegisterClient(Self, ConnectChange);

      CheckICommand;
      FICommand.SetConnection(FConnection.FIConnection)
    end
    else
      FICommand.SetConnection(nil);
  end;
end;

procedure TCustomDASQL.SetSQL(Value: TStrings);
begin
 if FSQL.Text <> Value.Text then begin
    FSQL.BeginUpdate;
    try
      FSQL.Assign(Value);
    finally
      FSQL.EndUpdate;
    end;
  end;
end;

procedure TCustomDASQL.SQLChanged(Sender: TObject);
var
  Cmd: TCRCommand;
begin
  //if not (csReading in ComponentState) then begin
  if FDataSet = nil then
    UnPrepare
  else begin
    if not BaseSQLOldBehavior then
      FDataSet.FBaseSQL := '';
    FDataSet.Close;
    FDataSet.UnPrepare;
    FDataSet.FieldDefs.Updated := False;

    if FDataSet.Data is TCRRecordSet then begin
      Cmd := TCRRecordSet(FDataSet.Data).GetCommand;
      if Cmd <> nil then
        Cmd.SetCursorState(csInactive);
      TCRRecordSet(FDataSet.Data).CommandType := ctUnknown;
    end;

    FDataSet.FOldTableName := '';
    FDataSet.FOldKeyFields := '';
  end;

  if not FLockMacros then
    ScanMacros;

  if not FLockAssembleSQL then
    AssembleSQL
  else
    FICommand.SetSQL(FSQL.Text);
end;

function TCustomDASQL.GetPrepared: boolean;
begin
  Result := FICommand.GetPrepared;
end;

procedure TCustomDASQL.SetPrepared(Value: boolean);
begin
  if Value then
    Prepare
  else
    UnPrepare;
end;

procedure TCustomDASQL.SetParams(Value: TDAParams);
begin
  FParams.AssignValues(Value);
end;

function TCustomDASQL.GetParamCount: word;
begin
  Result := FParams.Count;
end;

procedure TCustomDASQL.SetParamCheck(Value: boolean);
begin
  FParamCheck := Value;

  Value := Value or (csDesigning in ComponentState); // set value of ScanParams
  FICommand.SetProp(prScanParams, Value);

  if Value then
    AssembleSQL;
end;

function TCustomDASQL.GetParamValues(ParamName: string): variant;
begin
  Result := FParams.ParamValues[ParamName];
end;

procedure TCustomDASQL.SetParamValues(ParamName: string; Value: variant);
begin
  FParams.ParamValues[ParamName] := Value;
end;

procedure TCustomDASQL.SetMacros(Value: TMacros);
begin
  FMacros.Assign(Value);
end;

function TCustomDASQL.GetMacroCount: word;
begin
  Result := FMacros.Count;
end;

procedure TCustomDASQL.SetAutoCommit(Value: boolean);
begin
  FAutoCommit := Value;
  Assert(FICommand <> nil);
  FICommand.SetProp(prAutoCommit, FAutoCommit);
end;

function TCustomDASQL.GetRowsAffected: integer;
var
  Value: variant;
begin
  FICommand.GetProp(prRowsProcessed, Value);
  Result := Value;
end;

{ TCustomDAUpdateSQL }

constructor TCustomDAUpdateSQL.Create(Owner: TComponent);
var
  UpdateKind: TUpdateKind;
begin
  inherited;

  for UpdateKind := Low(TUpdateKind) to High(TUpdateKind) do
    FSQLText[UpdateKindToStatementType(UpdateKind)] := TStringList.Create;
  FSQLText[stRefresh] := TStringList.Create;
end;

destructor TCustomDAUpdateSQL.Destroy;
var
  StatementType: TStatementType;
begin
  if Assigned(FDataSet) and (FDataSet.UpdateObject = Self) then
    FDataSet.UpdateObject := nil;
  for StatementType := Low(TStatementType) to High(TStatementType) do
    FSQLText[StatementType].Free;

  inherited;
end;

procedure TCustomDAUpdateSQL.ExecSQL(UpdateKind: TUpdateKind);
var
  StatementType: TStatementType;
begin
  StatementType := UpdateKindToStatementType(UpdateKind);
  FDataSet.PerformSQL(FSQLText[StatementType].Text, [StatementType]);
end;

function TCustomDAUpdateSQL.GetSQL(UpdateKind: TUpdateKind): TStrings;
begin
  Result := GetSQLIndex(Ord(UpdateKindToStatementType(UpdateKind)));
end;

procedure TCustomDAUpdateSQL.SetSQL(UpdateKind: TUpdateKind; Value: TStrings);
begin
  SetSQLIndex(Ord(UpdateKindToStatementType(UpdateKind)), Value);
end;

function TCustomDAUpdateSQL.GetSQLIndex(Index: integer): TStrings;
begin
  Result := FSQLText[TStatementType(Index)];
end;

procedure TCustomDAUpdateSQL.SetSQLIndex(Index: integer; Value: TStrings);
begin
  FSQLText[TStatementType(Index)].Assign(Value);
end;

function TCustomDAUpdateSQL.GetDataSet: TCustomDADataSet;
begin
  Result := FDataSet;
end;

procedure TCustomDAUpdateSQL.SetDataSet(DataSet: TCustomDADataSet);
begin
  FDataSet := DataSet;
end;

procedure TCustomDAUpdateSQL.SetObjectIndex(Index: integer; Value: TComponent);
begin
  CheckUpdateComponent(Value);
  FUpdateObject[TStatementType(Index)] := Value;
end;

function TCustomDAUpdateSQL.GetObjectIndex(Index: integer): TComponent;
begin
  Result := FUpdateObject[TStatementType(Index)];
end;

function TCustomDAUpdateSQL.DataSetClass: TCustomDADataSetClass;
begin
  Result := TCustomDADataSet;
end;

function TCustomDAUpdateSQL.SQLClass: TCustomDASQLClass;
begin
  Result := TCustomDASQL;
end;

procedure TCustomDAUpdateSQL.CheckUpdateComponent(Component: TComponent; NewDataset: TCustomDADataset);
begin
  if Component <> nil then begin
    if not ((Component is SQLClass) or (Component is DataSetClass)) then
      raise Exception.Create(Format(SUpdateComponentInvalidType, [DataSetClass.ClassName, SQLClass.ClassName]));
    if NewDataSet = Component then
      raise Exception.Create(SUpdateComponentCircularReferences);
  end;
end;

procedure TCustomDAUpdateSQL.CheckUpdateComponent(Component: TComponent);
begin
  CheckUpdateComponent(Component, FDataset);
end;

procedure TCustomDAUpdateSQL.Notification(AComponent: TComponent; Operation: TOperation);
var
  stIdx: TStatementType;
begin
  inherited;
  if Operation = opRemove then
    for stIdx := Low(FUpdateObject) to High(FUpdateObject) do
      if FUpdateObject[stIdx] = AComponent then
        FUpdateObject[stIdx] := nil;
end;

procedure TCustomDAUpdateSQL.Apply(UpdateKind: TUpdateKind);
begin
  ExecSQL(UpdateKind);
end;

procedure TCustomDAUpdateSQL.Loaded;
begin
  inherited;

  FDesignCreate := False;
end;

procedure TCustomDAUpdateSQL.AssignTo(Dest: TPersistent);
begin
  if Dest is TCustomDAUpdateSQL then begin
    TCustomDAUpdateSQL(Dest).RefreshSQL := RefreshSQL;
    TCustomDAUpdateSQL(Dest).ModifySQL := ModifySQL;
    TCustomDAUpdateSQL(Dest).InsertSQL := InsertSQL;
    TCustomDAUpdateSQL(Dest).DeleteSQL := DeleteSQL;
    TCustomDAUpdateSQL(Dest).DataSet := DataSet;
    TCustomDAUpdateSQL(Dest).RefreshObject := RefreshObject;
    TCustomDAUpdateSQL(Dest).ModifyObject := ModifyObject;
    TCustomDAUpdateSQL(Dest).InsertObject := InsertObject;
    TCustomDAUpdateSQL(Dest).DeleteObject := DeleteObject;
  end
  else
    inherited;
end;

{ TMacro }

constructor TMacro.Create(Collection: TCollection);
begin
  inherited;

  FActive := True;
end;

procedure TMacro.AssignTo(Dest: TPersistent);
begin
  if Dest is TMacro then begin
    TMacro(Dest).Name := Name;
    TMacro(Dest).Value := Value;
    TMacro(Dest).Active := Active;
  end
  else
    inherited;
end;

function TMacro.IsEqual(Value: TMacro): boolean;
begin
  Result := (Name = Value.Name) and
    (Self.Value = Value.Value) and
    (Active = Value.Active);
end;

function TMacro.GetDisplayName: string;
begin
  if FName = '' then
    Result := inherited GetDisplayName
  else
    Result := FName;
end;

procedure TMacro.SetValue(Value: string);
var
  Owner: TPersistent;
  OldBaseSQL: string;
begin
  if Value <> FValue then begin
    FValue := Value;
    Owner := TMacros(Collection).FOwner;
    if (TMacros(Collection).UpdateCount = 0) and
      (Owner <> nil)
    then
      if Owner is TCustomDADataSet then
        with TCustomDADataSet(Owner) do begin
          if not Active or (Pos(MacroChar + Self.Name, SQL.Text) <> 0) then begin
            OldBaseSQL := FBaseSQL;
            FCommand.SQLChanged(Self);
            FBaseSQL := OldBaseSQL;
          end;
        end
      else
        TCustomDASQL(Owner).SQLChanged(Self);
  end;
end;

function TMacro.GetAsDateTime: TDateTime;
var
  St: string;
  iStart: integer;
  iEnd: integer;
  Len: integer;
begin
  St := Trim(FValue);
  Len := Length(FValue);
  if (Len > 0) and (St[1] = '''') then
    iStart := 2
  else
    iStart := 1;

  if (Len > 0) and (St[Length(St)] = '''') then
    iEnd := Length(St) - 1
  else
    iEnd := Length(St);

  Result := StrToDateTime(Copy(St, iStart, iEnd - iStart + 1));
end;

procedure TMacro.SetAsDateTime(Value: TDateTime);
begin
  Self.Value := '''' + DateTimeToStr(Value) + '''';
end;

function TMacro.GetAsFloat: double;
begin
  Result := StrToFloat(FValue);
end;

procedure TMacro.SetAsFloat(Value: double);
begin
  Self.Value := FloatToStr(Value);
end;

function TMacro.GetAsInteger: integer;
begin
  Result := StrToInt(FValue);
end;

procedure TMacro.SetAsInteger(Value: integer);
begin
  Self.Value := IntToStr(Value);
end;

function TMacro.GetAsString: string;
var
  St: string;
  iStart: integer;
  iEnd: integer;
  Len: integer;
begin
  St := Trim(FValue);
  Len := Length(FValue);
  if (Len > 0) and (St[1] = '''') then
    iStart := 2
  else
    iStart := 1;

  if (Len > 0) and (St[Length(St)] = '''') then
    iEnd := Length(St) - 1
  else
    iEnd := Length(St);

  Result := Copy(St, iStart, iEnd - iStart + 1);
end;

procedure TMacro.SetAsString(Value: string);
begin
  Self.Value := '''' + Value + '''';
end;

procedure TMacro.SetActive(Value: boolean);
var
  Owner: TPersistent;
begin
  if Value <> FActive then begin
    FActive := Value;
    Owner := TMacros(Collection).FOwner;
    if (TMacros(Collection).UpdateCount = 0) and
      (Owner <> nil)
    then
      if Owner is TCustomDADataSet then
        with TCustomDADataSet(Owner) do begin
          if not Active or (Pos(MacroChar + Self.Name, SQL.Text) <> 0) then
            AssembleSQL;
        end
      else
        TCustomDASQL(Owner).AssembleSQL
  end;
end;

{ TMacros }

constructor TMacros.Create(Owner: TPersistent);
begin
  inherited Create(TMacro);

  FOwner := Owner;
  FParserClass := TParser;
end;

procedure TMacros.Scan(SQL: string);
var
  Macro: TMacro;
  NewMacros: TMacros;
  Parser: TParser;
  CodeLexem: integer;
  St, St2: string;
  MacroSt: string; // Delphi problem with compare MacroChar = St
  Changed, NeedNext: boolean;
  i: integer;

begin
  // performance reason
{$IFDEF CLR}
  if SQL.IndexOf(Char(MacroChar)) = -1 then begin
{$ELSE}
  if StrScan(PChar(SQL), MacroChar) = nil then begin
{$ENDIF}
    Clear;
    Exit;
  end;

  NewMacros := TMacros.Create(nil);
  NewMacros.BeginUpdate;

  Parser := FParserClass.Create(SQL);
  MacroSt := MacroChar;
  Parser.OmitBlank := False;
  Parser.Uppered := False;
  try
    Parser.ToBegin;
    repeat
      repeat
        CodeLexem := Parser.GetNext(St); //+++ char instead of string
      until (CodeLexem = lcEnd) or (St = MacroSt);
      repeat
        NeedNext := True;
        if (St = MacroSt) and Parser.IsMacroAllowed(CodeLexem) then begin
          CodeLexem := Parser.GetNext(St);
          if (CodeLexem = lcIdent) or Parser.IsNumericMacroNameAllowed and (CodeLexem = lcNumber) or
            (CodeLexem > Parser.SymbolLexems.Count) and
            (CodeLexem <= Parser.SymbolLexems.Count + Parser.KeywordLexems.Count)
            // SQL reserved words are allowed
          then begin
            St2 := St;
            if CodeLexem = lcNumber then begin
              CodeLexem := Parser.GetNext(St);
              if (CodeLexem = lcIdent) or (CodeLexem > Parser.SymbolLexems.Count)
                and (CodeLexem <= Parser.SymbolLexems.Count + Parser.KeywordLexems.Count)
              then
                St2 := St2 + St
              else
                NeedNext := False
            end;
            Macro := NewMacros.FindMacro(St2);
            if Macro = nil then begin
              Macro := TMacro(NewMacros.Add);
              if FindMacro(St2) <> nil then
                Macro.Assign(FindMacro(St2))
              else
                Macro.Name := St2;
            end;
          end;
        end;
      until NeedNext;
    until CodeLexem = lcEnd;

    if Count <> NewMacros.Count then
      Changed := True
    else
    begin
      Changed := False;
      for i := 0 to Count - 1 do
        if not Items[i].IsEqual(NewMacros.Items[i]) then begin
          Changed := True;
          Break;
        end;
    end;

    if Changed then
      Assign(NewMacros);
  finally
    Parser.Free;
    NewMacros.Free;
  end;
end;

function TMacros.GetMacroValue(Macro: TMacro): string;
begin
  if Macro.Active then
    Result := Macro.Value
  else
    Result := '';
end;

procedure TMacros.Expand(var SQL: string);
var
  Parser: TParser;
  CodeLexem: integer;
  Macro: TMacro;
  St, St2: string;
  MacroSt: string; // Delphi problem with compare MacroChar = St
  Result: string;
  NeedNext: boolean;
begin
  Parser := FParserClass.Create(SQL);
  MacroSt := MacroChar;
  Parser.OmitBlank := False;
  Parser.Uppered := False;
  Parser.QuotedString := True;
  try
    Result := '';
    St := '';
    NeedNext := True;
    CodeLexem := 0; // to prevent warning
    Parser.ToBegin;
    while True do begin
      if NeedNext then
        CodeLexem := Parser.GetNext(St);

      if CodeLexem = lcEnd then
        Break;

      NeedNext := True;
      if (St = MacroSt) and Parser.IsMacroAllowed(CodeLexem) then begin
        CodeLexem := Parser.GetNext(St);
        if (CodeLexem = lcIdent) or Parser.IsNumericMacroNameAllowed and (CodeLexem = lcNumber) or
         (CodeLexem > Parser.SymbolLexems.Count) and
         (CodeLexem <= Parser.SymbolLexems.Count + Parser.KeywordLexems.Count)
          // SQL reserved words is allowed
        then begin
          St2 := St;
          if CodeLexem = lcNumber then begin
            CodeLexem := Parser.GetNext(St);
            if (CodeLexem = lcIdent) or (CodeLexem > Parser.SymbolLexems.Count)
              and (CodeLexem <= Parser.SymbolLexems.Count + Parser.KeywordLexems.Count)
            then
              St2 := St2 + St
            else
              NeedNext := False
          end;
          Macro := FindMacro(St2);
          if Macro <> nil then
            Result := Result + GetMacroValue(Macro);
        end
        else
          Result := Result + MacroSt + St;
      end
      else
        Result := Result + St;
    end;
  finally
    Parser.Free;
  end;

  SQL:= Result;
end;

procedure TMacros.AssignTo(Dest: TPersistent);
begin
  if Dest is TMacros then
    TMacros(Dest).Assign(Self)
  else
    inherited AssignTo(Dest);
end;

procedure TMacros.AssignValues(Value: TMacros);
var
  i: integer;
  Macro: TMacro;
begin
  for i := 0 to Value.Count - 1 do begin
    Macro := FindMacro(Value[i].Name);
    if Macro <> nil then
      Macro.Assign(Value[i]);
  end;
end;

procedure TMacros.DefineProperties(Filer: TFiler);
begin
  Filer.DefineBinaryProperty('Data', ReadBinaryData, nil, False);
end;

function TMacros.IsEqual(Value: TMacros): boolean;
var
  i: integer;
begin
  Result := True;
  if Self = Value then
    Exit;
  if Count = Value.Count then begin
    for i := 0 to Count - 1 do
      if (Items[i].Name <> Value[i].Name) or
        (Items[i].Value <> Value[i].Value) or
        (Items[i].Active <> Value[i].Active)
      then
        Result := False;
  end
  else
    Result := False;
end;

{  Structure of Data
  Version        1 (100) -- !!! Add in 100
  ItemCount      1
    NameLength   1
    Name         Length(Name)
    ValueLength  2
    Value        Length(Value)
    Active       1       -- !!! Add in 100
}

procedure TMacros.ReadBinaryData(Stream: TStream);
const
  BufLen = 1000;
var
  i, Len: word;
  Version: byte;
  B: boolean;
  Buf: TBytes;
  St: string;
begin
  SetLength(Buf, BufLen + 1{??? - array [0..BufLen] of byte});

  with Stream do begin
    ReadBuffer(Version, 1);  // Version or Count

    if Version = 100 then begin
      Len := 0;
      ReadBuffer(Len, 1);
    end;

    for i := 0 to Count - 1 do begin
      Len := 0;
      ReadBuffer(Len, 1);
      if Len > BufLen then
        Len := BufLen;
      ReadBuffer(Buf{$IFNDEF CLR}[0]{$ENDIF}, Len);
      Buf[Len] := 0;
      St := Encoding.Default.GetString(Buf, 0, Len);
      with MacroByName(St) do begin
        ReadBuffer(Len, 2);
        if Len > BufLen then
          Len := BufLen;
        ReadBuffer(Buf{$IFNDEF CLR}[0]{$ENDIF}, Len);
        Buf[Len] := 0;
        St := Encoding.Default.GetString(Buf, 0, Len);
        Value := St;

        if Version = 100 then begin
          ReadBuffer(B, 1);  // Active
          Active := B;
        end;
      end;
    end;
  end;
end;

function TMacros.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

procedure TMacros.Update(Item: TCollectionItem);
begin
  inherited;
  
  if FOwner <> nil then
    if FOwner is TCustomDADataSet then
      TCustomDADataSet(FOwner).AssembleSQL
    else
      TCustomDASQL(FOwner).AssembleSQL
end;

function TMacros.GetItem(Index: integer): TMacro;
begin
  Result := TMacro(inherited Items[Index]);
end;

procedure TMacros.SetItem(Index: integer; Value: TMacro);
begin
  inherited SetItem(Index, TCollectionItem(Value));
end;

function TMacros.GetUpdateCount: integer;
begin
  Result  := inherited UpdateCount;
end;

function TMacros.FindMacro(const Value: string): TMacro;
var
  i: integer;
begin
  for i := 0 to Count - 1 do begin
    Result := TMacro(inherited Items[i]);
    if AnsiCompareText(Result.Name, Value) = 0 then
      Exit;
  end;
  Result := nil;
end;

function TMacros.MacroByName(const Value: string): TMacro;
begin
  Result := FindMacro(Value);

  if Result = nil then
    DatabaseErrorFmt(SMacroNotFound, [Value], FOwner as TComponent);
end;

procedure TMacros.SetParserClass(Value: TParserClass);
begin
  FParserClass := Value;
end;

{ TCustomConnectDialog }

constructor TCustomConnectDialog.Create(Owner: TComponent);
begin
  inherited;

  FRetries := 3;
  LabelSet := lsEnglish;
  FStoreLogInfo := True;
end;

procedure TCustomConnectDialog.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;

  if (Operation = opRemove) and (FConnection = AComponent) then
    FConnection := nil;
end;

function TCustomConnectDialog.DefDialogClass: TClass;
begin
  Result := nil;
end;

procedure TCustomConnectDialog.GetServerList(List: TStrings);
begin
end;

function TCustomConnectDialog.GetKeyPath: string;
begin
  Result := '';
end;

function TCustomConnectDialog.GetServerStoreName: string;
begin
  Result := 'Server';
end;

{$IFDEF MSWINDOWS}
procedure TCustomConnectDialog.SaveServerListToRegistry;
var
  Registry: TRegistry;
  List: TStrings;
  i,j: integer;
  ServerKey: string;
begin
  Registry := TRegistry.Create;
  try
    if Registry.OpenKey(GetKeyPath + 'Connect', False) then begin
      List := TStringList.Create;
      try
        GetServerList(List);
        ServerKey := GetServerStoreName;
        Registry.WriteString(Format('%s %d', [ServerKey, 1]), Connection.Server);
        i := 2;
        for j := 0 to List.Count - 1 do
          if AnsiCompareText(List[j], Connection.Server) <> 0 then begin
            Registry.WriteString(Format('%s %d', [ServerKey, i]), List[j]);
            Inc(i);
          end;
        Registry.CloseKey;
      finally
        List.Free;
      end;
    end;
  finally
    Registry.Free;
  end;
end;

procedure TCustomConnectDialog.SaveInfoToRegistry(Registry: TRegistry);
begin
  Registry.WriteString('Username', Connection.Username);
  Registry.WriteString(GetServerStoreName, Connection.Server);
end;

procedure TCustomConnectDialog.LoadInfoFromRegistry(Registry: TRegistry);
var
  ServerKey: string;
begin
  ServerKey := GetServerStoreName;
  if Registry.ValueExists('Username') then
    Connection.FUsername := Registry.ReadString('Username');
  if Registry.ValueExists(ServerKey) then
    Connection.FServer := Registry.ReadString(ServerKey);
end;
{$ENDIF}

{class function TCustomConnectDialog.AcceptBlankPassword: boolean;
begin
  Result := False;
end;}

function TCustomConnectDialog.Execute: boolean;
var
  Key: string;
  OldUsername, OldPassword, OldServer: string;
{$IFDEF MSWINDOWS}
  KeyOpened, IDE: boolean;
  Registry: TRegistry;
{$ENDIF}
begin
  Result := False;

  if Connection = nil then
    DatabaseError(SConnectionNotDefined);

  OldUsername := Connection.Username;
  OldPassword := Connection.Password;
  OldServer := Connection.Server;

  Key := GetKeyPath + 'Connect\' + ApplicationTitle;

{$IFDEF MSWINDOWS}
  Registry := nil;
{$ENDIF}
  try
    if FStoreLogInfo then begin
    {$IFDEF MSWINDOWS}
      Registry := TRegistry.Create;

      KeyOpened := Registry.OpenKey(Key, False);
      IDE := (Pos('Delphi', ApplicationTitle) = 1) or
        (Pos('C++Builder', ApplicationTitle) = 1);

      if KeyOpened and (not IDE or (Connection.Username = '')) then
        LoadInfoFromRegistry(Registry);

      if not SavePassword and not IDE or
        (AnsiCompareText(Connection.Username, OldUsername) <> 0)
      then
         Connection.FPassword := '';

      if KeyOpened then
        Registry.CloseKey;
    {$ENDIF}
    end;

    if Assigned(ShowConnectFormProc) then
      Result := ShowConnectFormProc(Self)
    else
      Result := False;

    if Result then begin
      if FStoreLogInfo then begin
      {$IFDEF MSWINDOWS}
        // StoreLogInfo can be changed by user since previous check
        if Registry = nil then
          Registry := TRegistry.Create;

        if Registry.OpenKey(Key, True) then begin
          SaveInfoToRegistry(Registry);
          Registry.CloseKey;
        end;

        SaveServerListToRegistry;
      {$ENDIF}
      end;
    end;
  finally
    if not Result then begin
      Connection.FUsername := OldUsername;
      Connection.FPassword := OldPassword;
      Connection.FServer := OldServer;
    end;
  {$IFDEF MSWINDOWS}
    Registry.Free;
  {$ENDIF}
  end;
end;

{$IFDEF WIN32}
function TCustomConnectDialog.GetString(Id: integer): string;
const
  BufLen = 50;
var
  Buf: array [0..BufLen] of char;
  Base: integer;
begin
  case FLabelSet of
    lsEnglish:
      Base := 100;
    lsFrench:
      Base := 200;
    lsGerman:
      Base := 300;
    lsItalian:
      Base := 400;
    lsPolish:
      Base := 500;
    lsPortuguese:
      Base := 600;
    lsRussian:
      Base := 0;
    lsSpanish:
      Base := 700;
  else
      Base := 100;    
  end;

  Buf[0] := #0;
  LoadString(hInstance, Id + Base, @Buf, BufLen);
  Result := Buf;
end;
{$ENDIF}

procedure TCustomConnectDialog.SetLabelSet(Value: TLabelSet);
{$IFDEF WIN32}
begin
  FLabelSet := Value;
  if FLabelSet <> lsCustom then begin

    FCaption := GetString(0);
    FUsernameLabel := GetString(1);
    FPasswordLabel := GetString(2);
    FServerLabel := GetString(3);
    FConnectButton := GetString(4);
    FCancelButton := GetString(5);
  end;
{$ELSE}
begin
  FCaption := 'Connect';
  FUsernameLabel := 'Username';
  FPasswordLabel := 'Password';
  FServerLabel := 'Server';
  FConnectButton := 'Connect';
  FCancelButton := 'Cancel';
{$ENDIF}
end;

procedure TCustomConnectDialog.SetCaption(Value: string);
begin
  if not(csLoading in ComponentState) then
    FLabelSet := lsCustom;

  FCaption := Value;
end;

procedure TCustomConnectDialog.SetUsernameLabel(Value: string);
begin
  if not(csLoading in ComponentState) then
    FLabelSet := lsCustom;

  FUsernameLabel := Value;
end;

procedure TCustomConnectDialog.SetPasswordLabel(Value: string);
begin
  if not(csLoading in ComponentState) then
    FLabelSet := lsCustom;

  FPasswordLabel := Value;
end;

procedure TCustomConnectDialog.SetServerLabel(Value: string);
begin
  if not(csLoading in ComponentState) then
    FLabelSet := lsCustom;

  FServerLabel := Value;
end;

procedure TCustomConnectDialog.SetConnectButton(Value: string);
begin
  if not(csLoading in ComponentState) then
    FLabelSet := lsCustom;

  FConnectButton := Value;
end;

procedure TCustomConnectDialog.SetCancelButton(Value: string);
begin
  if not(csLoading in ComponentState) then
    FLabelSet := lsCustom;

  FCancelButton := Value;
end;

{$IFDEF MSWINDOWS}
const
  advapi32 = 'advapi32.dll';
  netapi32 = 'netapi32.dll'; 

  // Service State -- for CurrentState
  SERVICE_STOPPED                = $00000001;
  SERVICE_START_PENDING          = $00000002;
  SERVICE_STOP_PENDING           = $00000003;
  SERVICE_RUNNING                = $00000004;
  SERVICE_CONTINUE_PENDING       = $00000005;
  SERVICE_PAUSE_PENDING          = $00000006;
  SERVICE_PAUSED                 = $00000007;

  // Service object specific access type
  SERVICE_QUERY_CONFIG           = $0001;
  SERVICE_CHANGE_CONFIG          = $0002;
  SERVICE_QUERY_STATUS           = $0004;
  SERVICE_ENUMERATE_DEPENDENTS   = $0008;
  SERVICE_START                  = $0010;
  SERVICE_STOP                   = $0020;
  SERVICE_PAUSE_CONTINUE         = $0040;
  SERVICE_INTERROGATE            = $0080;
  SERVICE_USER_DEFINED_CONTROL   = $0100;
  SERVICE_ALL_ACCESS             = (STANDARD_RIGHTS_REQUIRED or
                                    SERVICE_QUERY_CONFIG or
                                    SERVICE_CHANGE_CONFIG or
                                    SERVICE_QUERY_STATUS or
                                    SERVICE_ENUMERATE_DEPENDENTS or
                                    SERVICE_START or
                                    SERVICE_STOP or
                                    SERVICE_PAUSE_CONTINUE or
                                    SERVICE_INTERROGATE or
                                    SERVICE_USER_DEFINED_CONTROL);
  
  // Service Control Manager object specific access types
  SC_MANAGER_CONNECT             = $0001;
  SC_MANAGER_CREATE_SERVICE      = $0002;
  SC_MANAGER_ENUMERATE_SERVICE   = $0004;
  SC_MANAGER_LOCK                = $0008;
  SC_MANAGER_QUERY_LOCK_STATUS   = $0010;
  SC_MANAGER_MODIFY_BOOT_CONFIG  = $0020;
  SC_MANAGER_ALL_ACCESS          = (STANDARD_RIGHTS_REQUIRED or SC_MANAGER_CONNECT or
    SC_MANAGER_CREATE_SERVICE or SC_MANAGER_ENUMERATE_SERVICE or SC_MANAGER_LOCK or
    SC_MANAGER_QUERY_LOCK_STATUS or SC_MANAGER_MODIFY_BOOT_CONFIG);

  // Service Types    
  SERVICE_WIN32_OWN_PROCESS     = $00000010;
  SERVICE_WIN32_SHARE_PROCESS   = $00000020;
  SERVICE_WIN32                 = (SERVICE_WIN32_OWN_PROCESS or
                                   SERVICE_WIN32_SHARE_PROCESS);

  // Service State -- for Enum Requests (Bit Mask)
  SERVICE_ACTIVE                 = $00000001;
  SERVICE_INACTIVE               = $00000002;
  SERVICE_STATE_ALL              = (SERVICE_ACTIVE   or
                                    SERVICE_INACTIVE);

  // Controls
  SERVICE_CONTROL_STOP           = $00000001;
                                   
type
  // Service Status Enumeration Structure
{$IFDEF CLR}
  [StructLayout(LayoutKind.Sequential)]
{$ENDIF}  
  _SERVICE_STATUS = record
    dwServiceType: DWORD;
    dwCurrentState: DWORD;
    dwControlsAccepted: DWORD;
    dwWin32ExitCode: DWORD;
    dwServiceSpecificExitCode: DWORD;
    dwCheckPoint: DWORD;
    dwWaitHint: DWORD;
  end;
  TServiceStatus = _SERVICE_STATUS;

{$IFDEF CLR}  
  [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Auto)]
  _ENUM_SERVICE_STATUS = record
    [MarshalAs(UnmanagedType.LPTStr)]
    lpServiceName: string;
    [MarshalAs(UnmanagedType.LPTStr)]
    lpDisplayName: string;
    ServiceStatus: TServiceStatus;
  end;
  TEnumServiceStatus = _ENUM_SERVICE_STATUS;
{$ELSE}
  _ENUM_SERVICE_STATUSA = record
    lpServiceName: PAnsiChar;
    lpDisplayName: PAnsiChar;
    ServiceStatus: TServiceStatus;
  end;
  TEnumServiceStatus = _ENUM_SERVICE_STATUSA;
{$ENDIF}

  TOpenSCManager = function (lpMachineName: {$IFDEF CLR}string{$ELSE}PChar{$ENDIF}; lpDatabaseName: {$IFDEF CLR}IntPtr{$ELSE}PChar{$ENDIF}; dwDesiredAccess: DWORD): SC_HANDLE;{$IFNDEF CLR} stdcall;{$ENDIF}
  TCloseServiceHandle = function (hSCObject: SC_HANDLE): BOOL;{$IFNDEF CLR} stdcall;{$ENDIF}
  TOpenService = function (hSCManager: SC_HANDLE; lpServiceName: PChar; dwDesiredAccess: DWORD): SC_HANDLE;{$IFNDEF CLR} stdcall;{$ENDIF}
  TEnumServicesStatus = function (hSCManager: SC_HANDLE; dwServiceType, dwServiceState: DWORD;{$IFDEF CLR}lpServices: IntPtr{$ELSE}var lpServices: TEnumServiceStatus{$ENDIF};
    cbBufSize: DWORD; {$IFDEF CLR}out{$ELSE}var{$ENDIF} pcbBytesNeeded, lpServicesReturned: DWORD; var lpResumeHandle: DWORD): BOOL;{$IFNDEF CLR} stdcall;{$ENDIF}
  TQueryServiceStatus = function (hService: SC_HANDLE; {$IFDEF CLR}out{$ELSE}var{$ENDIF} lpServiceStatus: TServiceStatus): BOOL;{$IFNDEF CLR} stdcall;{$ENDIF}
  TStartService = function (hService: SC_HANDLE; dwNumServiceArgs: DWORD; {$IFNDEF CLR}var{$ENDIF} lpServiceArgVectors: {$IFDEF CLR}IntPtr{$ELSE}PChar{$ENDIF}): BOOL;{$IFNDEF CLR} stdcall;{$ENDIF}
  TControlService = function (hService: SC_HANDLE; dwControl: DWORD; {$IFDEF CLR}out{$ELSE}var{$ENDIF} lpServiceStatus: TServiceStatus): BOOL;{$IFNDEF CLR} stdcall;{$ENDIF}
  TNetServerEnum = function (ServerName: IntPtr; Level: longint; var BufPtr: IntPtr; PrefMaxLen: longint;
    var EntriesRead, TotalEntries: longint; ServType: longint; Domain: {$IFDEF CLR}IntPtr{$ELSE}PWideChar{$ENDIF}; var ResumeHandle: integer): longint;{$IFNDEF CLR} stdcall;{$ENDIF}
  TNetApiBufferFree = function (BufPtr: IntPtr): longint;{$IFNDEF CLR} stdcall;{$ENDIF}
  
{$IFDEF CLR}
[SuppressUnmanagedCodeSecurity, DllImport(advapi32, CharSet = CharSet.Auto, SetLastError = True, EntryPoint = 'OpenSCManager')]
function FnOpenSCManager(lpMachineName: string; lpDatabaseName: IntPtr; dwDesiredAccess: DWORD): SC_HANDLE; external;

[SuppressUnmanagedCodeSecurity, DllImport(advapi32, CharSet = CharSet.Ansi, SetLastError = True, EntryPoint = 'CloseServiceHandle')]
function FnCloseServiceHandle(hSCObject: SC_HANDLE): BOOL; external;

[SuppressUnmanagedCodeSecurity, DllImport(advapi32, CharSet = CharSet.Auto, SetLastError = True, EntryPoint = 'OpenService')]
function FnOpenService(hSCManager: SC_HANDLE; lpServiceName: string; dwDesiredAccess: DWORD): SC_HANDLE; external;

[SuppressUnmanagedCodeSecurity, DllImport(advapi32, CharSet = CharSet.Auto, SetLastError = True, EntryPoint = 'EnumServicesStatus')]
function FnEnumServicesStatus(hSCManager: SC_HANDLE; dwServiceType,
  dwServiceState: DWORD; lpServices: IntPtr; cbBufSize: DWORD;
  out pcbBytesNeeded, lpServicesReturned: DWORD; var lpResumeHandle: DWORD): BOOL; external;

[SuppressUnmanagedCodeSecurity, DllImport(advapi32, CharSet = CharSet.Ansi, SetLastError = True, EntryPoint = 'QueryServiceStatus')]  
function FnQueryServiceStatus(hService: SC_HANDLE; out lpServiceStatus: TServiceStatus): BOOL; external;

[SuppressUnmanagedCodeSecurity, DllImport(advapi32, CharSet = CharSet.Auto, SetLastError = True, EntryPoint = 'StartService')]
function FnStartService(hService: SC_HANDLE; dwNumServiceArgs: DWORD; lpServiceArgVectors: IntPtr): BOOL; external;

[SuppressUnmanagedCodeSecurity, DllImport(advapi32, CharSet = CharSet.Ansi, SetLastError = True, EntryPoint = 'StartServiceA')]
function StartServiceA(hService: SC_HANDLE; dwNumServiceArgs: DWORD; lpServiceArgVectors: IntPtr): BOOL; external;

[SuppressUnmanagedCodeSecurity, DllImport(advapi32, CharSet = CharSet.Ansi, SetLastError = True, EntryPoint = 'ControlService')]
function FnControlService(hService: SC_HANDLE; dwControl: DWORD; out lpServiceStatus: TServiceStatus): BOOL; external;

[SuppressUnmanagedCodeSecurity, DllImport(netapi32, CharSet = CharSet.Auto, SetLastError = True, EntryPoint = 'NetServerEnum')]
function FnNetServerEnum(ServerName: IntPtr;  Level: longint; var BufPtr: IntPtr; PrefMaxLen: longint;
  var EntriesRead, TotalEntries: longint; ServType: longint; Domain: IntPtr; var ResumeHandle: integer): longint; external;

[SuppressUnmanagedCodeSecurity, DllImport(netapi32, CharSet = CharSet.Auto, SetLastError = True, EntryPoint = 'NetApiBufferFree')]
function FnNetApiBufferFree(BufPtr: IntPtr): longint; external;
{$ENDIF}  

var
  hAdvapi32Lib: HMODULE;
  hNetapi32Lib: HMODULE;
  OpenSCManager: TOpenSCManager;
  CloseServiceHandle: TCloseServiceHandle;
  OpenService: TOpenService;
  EnumServicesStatus: TEnumServicesStatus;
  QueryServiceStatus: TQueryServiceStatus;
  StartService: TStartService;
  ControlService: TControlService;
  NetServerEnum: TNetServerEnum;
  NetApiBufferFree: TNetApiBufferFree;

function NotLink: integer;
begin
  raise Exception.Create('function is not linked');
  Result := 0;
end;

procedure LoadNetManagerLib;
{$IFNDEF CLR}
  function GetProc(hLib: HMODULE; Name: string): FARPROC;
  begin
    Result := GetProcAddress(hLib, PChar(Name));
    if Result = nil then
      Result := @NotLink;
  end;
{$ENDIF} 
begin
  hAdvapi32Lib := LoadLibrary(PChar(advapi32));

  if hAdvapi32Lib > 0 then begin
  {$IFDEF CLR}
    OpenSCManager := FnOpenSCManager;
    CloseServiceHandle := FnCloseServiceHandle;
    OpenService := FnOpenService;
    EnumServicesStatus := FnEnumServicesStatus;
    QueryServiceStatus := FnQueryServiceStatus;
    StartService := FnStartService;
    ControlService := FnControlService;
  {$ELSE}
    OpenSCManager := GetProc(hAdvapi32Lib, 'OpenSCManagerA');
    CloseServiceHandle := GetProc(hAdvapi32Lib, 'CloseServiceHandle');
    OpenService := GetProc(hAdvapi32Lib, 'OpenServiceA');
    EnumServicesStatus := GetProc(hAdvapi32Lib, 'EnumServicesStatusA');
    QueryServiceStatus := GetProc(hAdvapi32Lib, 'QueryServiceStatus');
    StartService := GetProc(hAdvapi32Lib, 'StartServiceA');
    ControlService := GetProc(hAdvapi32Lib, 'ControlService');
  {$ENDIF}
  end;

  hNetapi32Lib := LoadLibrary(PChar(netapi32));
  
  if hNetapi32Lib > 0 then begin
  {$IFDEF CLR}
    if GetProcAddress(hNetapi32Lib, 'NetServerEnum') <> nil then
      NetServerEnum := FnNetServerEnum;
    if GetProcAddress(hNetapi32Lib, 'NetApiBufferFree') <> nil then
      NetApiBufferFree := FnNetApiBufferFree;
  {$ELSE}
    NetServerEnum := GetProc(hNetapi32Lib, 'NetServerEnum');
    NetApiBufferFree := GetProc(hNetapi32Lib, 'NetApiBufferFree');
  {$ENDIF}
  end;
end;

procedure FreeNetManagerLib;
begin
  if hAdvapi32Lib > 0 then begin
    FreeLibrary(hAdvapi32Lib);
    hAdvapi32Lib := 0;
  end;

  if hNetapi32Lib > 0 then begin
    FreeLibrary(hNetapi32Lib);
    hNetapi32Lib := 0;
  end;
end;

{ TCRServiceNamesThread }

constructor TCRServiceNamesThread.Create(const Server: string; Services: TCRServicesThread; const Keywords: string);
begin
  inherited Create(True);
  FServer := Server;
  FKeywords := Keywords;
  FServices := Services;
  Priority := tpHighest;
  Resume;
end;

procedure TCRServiceNamesThread.Execute;
{var
  tc: cardinal;}
var
  j, k: integer;
  sl: TStringList;
  b: boolean;
begin
  // tc := GetTickCount;
  try
    FServiceNames := TCRNetManager.GetServiceNames(FServer);

    sl := TStringList.Create;
    try
      sl.Text := FKeywords;

      b := False;
      for j := 0 to Length(FServiceNames) - 1 do begin
        for k := 0 to sl.Count - 1 do
          if (Pos(sl[k], LowerCase(FServiceNames[j].ServiceName)) > 0) or
             (Pos(sl[k], LowerCase(FServiceNames[j].DisplayName)) > 0) then begin
            b := True;
            CRNetManager.AddToCachedServerList(FKeywords, FServer);
            Break;
          end;
        if b then
          Break;
      end;
    finally
      sl.Free;
    end;
  except
    // Silent
  end;
  {tc := GetTickCount - tc;
  OFS(FServer + ' ' + IntToStr(tc) + ' ' + IntToStr(Length(FServices.FServiceNames[FIndex])));}
end;

constructor TCRServicesThread.Create(List: TStrings; const Keywords: string);
begin
  inherited Create(True);

  FList := List;
  FKeywords := Keywords;
  FreeOnTerminate := True;

  Resume;
end;

procedure TCRServicesThread.Execute;
var
  i: integer;
  Threads: array of TCRServiceNamesThread;
begin
  SetLength(Threads, FList.Count);
  for i := 0 to FList.Count - 1 do
    Threads[i] := nil;
  try
    for i := 0 to FList.Count - 1 do
      Threads[i] := TCRServiceNamesThread.Create(FList[i], Self, FKeywords);

    for i := 0 to FList.Count - 1 do
      Threads[i].WaitFor;

  finally
    for i := 0 to FList.Count - 1 do 
      Threads[i].Free;
  end;
end;

{ TCRNetManager }

function ServiceStatusToCurrentStatus(const CurrentState: DWORD): TCRServiceStatus;
begin
  case CurrentState of
    SERVICE_STOPPED:
      Result := ssStopped;
    SERVICE_START_PENDING:
      Result := ssStartPending;
    SERVICE_STOP_PENDING:
          Result := ssStopPending;
    SERVICE_RUNNING:
      Result := ssRunning;
    SERVICE_CONTINUE_PENDING:
      Result := ssContinuePending;
    SERVICE_PAUSE_PENDING:
      Result := ssPausePending;
    SERVICE_PAUSED:
      Result := ssPaused;
    else
    begin
      DatabaseErrorFmt('Unknown service status $%X (%d)', [CurrentState, CurrentState]);
      Result := ssStopped;
    end;
  end;
end;

constructor TCRNetManager.Create;
begin
  inherited;
  
  FServicesCS := TCriticalSection.Create;
end;

destructor TCRNetManager.Destroy;
begin
  ClearCachedServerList;
  FServicesCS.Free;
  
  inherited;
end;

class procedure TCRNetManager.ServiceManagerOpen(const Server: string; const ReadOnly: boolean; out sch: SC_HANDLE);
var
  s: string;
  dwDesiredAccess: DWORD;
begin
  sch := 0;
  if Trim(LowerCase(Server)) = 'localhost' then
    s := ''
  else
    s := Server;
  if ReadOnly then
    dwDesiredAccess := GENERIC_READ
  else
    dwDesiredAccess := SC_MANAGER_ALL_ACCESS;
  sch := OpenSCManager({$IFDEF CLR}s{$ELSE}PChar(s){$ENDIF}, nil, dwDesiredAccess);
  Win32Check(sch <> 0);
end;

class procedure TCRNetManager.ServiceManagerClose(const sch: SC_HANDLE);
begin
  if sch <> 0 then
    CloseServiceHandle(sch);
end;

class procedure TCRNetManager.ServiceOpen(const Server: string; const ServiceName: string; const ReadOnly: boolean; out sch: SC_HANDLE; out sh: SC_HANDLE);
begin
  ServiceManagerOpen(Server, ReadOnly, sch);
  try
    sh := OpenService(sch, {$IFDEF CLR}ServiceName{$ELSE}PChar(ServiceName){$ENDIF}, SERVICE_ALL_ACCESS);
    Win32Check(sh <> 0);
  except
    ServiceManagerClose(sch);
    raise;
  end;
end;

class procedure TCRNetManager.ServiceClose(const sch: SC_HANDLE; const sh: SC_HANDLE);
begin
  if sh <> 0 then
    CloseServiceHandle(sh);
  ServiceManagerClose(sch);
end;

class function TCRNetManager.GetServiceNames(const Server: string): TCRServicesInfo;
var
  sch: SC_HANDLE;
{$IFDEF CLR}
  pService: TEnumServiceStatus;
{$ELSE}
  pService: ^TEnumServiceStatus;
{$ENDIF}
  pServices: IntPtr;
  pcbBytesNeeded, lpServicesReturned, lpResumeHandle: DWORD;
  i: integer;
  SizeOfTEnumServiceStatus: LongWord;

begin
  SetLength(Result, 0);

  pServices := nil;
  ServiceManagerOpen(Server, True, sch);
  try
    //lpServices := nil;
    lpResumeHandle := 0;
    pcbBytesNeeded := 0;
    lpServicesReturned := 0;
    EnumServicesStatus(sch, SERVICE_WIN32, SERVICE_STATE_ALL, {$IFDEF CLR}nil{$ELSE}TEnumServiceStatus(pServices^){$ENDIF}, 0, pcbBytesNeeded, lpServicesReturned, lpResumeHandle);
    SizeOfTEnumServiceStatus := SizeOf(TEnumServiceStatus);
    lpServicesReturned := 0;
    pServices := Marshal.AllocHGlobal(pcbBytesNeeded);
    Win32Check(EnumServicesStatus(sch, SERVICE_WIN32, SERVICE_STATE_ALL, {$IFDEF CLR}pServices{$ELSE}TEnumServiceStatus(pServices^){$ENDIF}, pcbBytesNeeded, pcbBytesNeeded, lpServicesReturned, lpResumeHandle));
//    Win32Check(EnumServicesStatus(sch, SERVICE_WIN32, SERVICE_STATE_ALL, Services{$IFNDEF CLR}[0]{$ENDIF}, cbBufSize, pcbBytesNeeded, lpServicesReturned, lpResumeHandle));
    SetLength(Result, lpServicesReturned);

    for i := 0 to lpServicesReturned - 1 do begin
    {$IFDEF CLR}
      pService := TEnumServiceStatus(Marshal.PtrToStructure(IntPtr(Integer(pServices) + Integer(SizeOfTEnumServiceStatus) * i), TypeOf(TEnumServiceStatus)));
    {$ELSE}
      pService := IntPtr(Integer(pServices) + Integer(SizeOfTEnumServiceStatus) * i);
    {$ENDIF}

      Result[i].ServiceName := pService.lpServiceName;
      Result[i].DisplayName := pService.lpDisplayName;
      Result[i].Status := ServiceStatusToCurrentStatus(pService.ServiceStatus.dwCurrentState);
    end;
  finally
    ServiceManagerClose(sch);
    Marshal.FreeHGlobal(pServices);
  end;
end;

class function TCRNetManager.GetServiceStatus(const Server: string; const ServiceName: string): TCRServiceStatus;
var
  sch: SC_HANDLE;
  sh: SC_HANDLE;
  ss: TServiceStatus;
begin
  ServiceOpen(Server, ServiceName, True, sch, sh);
  try
    Win32Check(QueryServiceStatus(sh, ss));
    Result := ServiceStatusToCurrentStatus(ss.dwCurrentState);
  finally
    ServiceClose(sch, sh);
  end;
end;

class procedure TCRNetManager.ServiceStart(const Server: string; const ServiceName: string; ParamStr: string = '');
  // based on Delphi7 system.pas GetParamStr function
  function GetParamStr(Idx: integer; var Param: string): integer;
  var
    Len: Integer;
    StartIdx, SIdx, QIdx: Integer;
  begin
    while True do
    begin
      while (ParamStr[Idx] <> #0) and (ParamStr[Idx] <= ' ') do
        Inc(Idx);
      if (ParamStr[Idx] = '"') and (ParamStr[Idx + 1] = '"') then Inc(Idx, 2) else Break;
    end;
    Len := 0;
    StartIdx := Idx;
    while ParamStr[Idx] > ' ' do
    begin
      if ParamStr[Idx] = '"' then
      begin
        Inc(Idx);
        while (ParamStr[Idx] <> #0) and (ParamStr[Idx] <> '"') do
        begin
          QIdx := Idx + 1;
          Inc(Len, QIdx - Idx);
          Idx := QIdx;
        end;
        if ParamStr[Idx] <> #0 then
          Inc(Idx);
      end
      else
      begin
        QIdx := Idx + 1;
        Inc(Len, QIdx - Idx);
        Idx := QIdx;
      end;
    end;

    SetLength(Param, Len);

    Idx := StartIdx;
    SIdx := 1;
    while ParamStr[Idx] > ' ' do
    begin
      if ParamStr[Idx] = '"' then
      begin
        Inc(Idx);
        while (ParamStr[Idx] <> #0) and (ParamStr[Idx] <> '"') do
        begin
          QIdx := Idx + 1;
          while Idx < QIdx do
          begin
            Param[SIdx] := ParamStr[Idx];
            Inc(Idx);
            Inc(SIdx);
          end;
        end;
        if ParamStr[Idx] <> #0 then
          Inc(Idx);
      end
      else
      begin
        QIdx := Idx + 1;
        while Idx < QIdx do
        begin
          Param[SIdx] := ParamStr[Idx];
          Inc(Idx);
          Inc(SIdx);
        end;
      end;
    end;

    Result := Idx;
  end;
var
  sch: SC_HANDLE;
  sh: SC_HANDLE;
  i, Idx: integer;
  Param: string;
  Args: array of string;
  pArgs: array of {$IFDEF CLR}IntPtr{$ELSE}PChar{$ENDIF};
  p: {$IFDEF CLR}IntPtr{$ELSE}PChar{$ENDIF};
{$IFDEF CLR}
  b: TBytes;
  p1: IntPtr;
  Len: integer;
{$ENDIF}

begin
  ServiceOpen(Server, ServiceName, False, sch, sh);
  try
    ParamStr := Trim(ParamStr);
    if ParamStr <> '' then begin
      Idx := 1;
      SetLength(Args, 0);

      ParamStr := ParamStr + #0;
      while True do
      begin
        Idx := GetParamStr(Idx, Param);
        if Param = '' then Break;

        i := Length(Args);
        SetLength(Args, i + 1);
        Args[i] := Param;
      end;

      SetLength(pArgs, Length(Args));
    {$IFDEF CLR}
      for i := 0 to Length(Args) - 1 do
        pArgs[i] := nil;
      p := Marshal.AllocHGlobal(Length(Args) * SizeOf(IntPtr));
      try
        for i := 0 to Length(Args) - 1 do begin
          Len := Length(Args[i]);
          SetLength(b, Len + 1);
          Encoding.Default.GetBytes(Args[i], 0, Len, b, 0);
          b[Len] := 0;
          p1 := Marshal.AllocHGlobal(Len + 1);
          Marshal.Copy(b, 0, p1, Len + 1);
          pArgs[i] := p1;
          Marshal.WriteIntPtr(p, i * SizeOf(IntPtr), p1);
        end;

        i := Length(Args);
        Win32Check(StartServiceA(sh, i, p));
      finally
        for i := 0 to Length(Args) - 1 do
          Marshal.FreeHGlobal(pArgs[i]);
        Marshal.FreeHGlobal(p);
      end;
    {$ELSE}
      for i := 0 to Length(Args) - 1 do
        pArgs[i] := @Args[i][1];

      i := Length(Args);
      Win32Check(StartService(sh, i, pArgs[0]));
    {$ENDIF}
    end
    else
    begin
      p := nil;
      Win32Check(StartService(sh, 0, p));
    end;
  finally
    ServiceClose(sch, sh);
  end;
end;

class procedure TCRNetManager.ServiceStop(const Server: string; const ServiceName: string);
var
  sch: SC_HANDLE;
  sh: SC_HANDLE;
  ss: TServiceStatus;
begin
  ServiceOpen(Server, ServiceName, False, sch, sh);
  try
    Win32Check(ControlService(sh, SERVICE_CONTROL_STOP, ss));
  finally
    ServiceClose(sch, sh);
  end;
end;

procedure TCRNetManager.ClearCachedServerList;
var
  i: integer;
begin
  if FCachedServerList = nil then
    Exit;

  try
    for i := 0 to FCachedServerList.Count - 1 do
      FCachedServerList.Objects[i].Free;
  finally
    FreeAndNil(FCachedServerList);
  end;
end;

procedure TCRNetManager.AddToCachedServerList(const Keywords: string; const Server: string);
var
//  s: string;
  i: integer;
  sl: TStringList;
begin
{  s := '';
  for i := Low(Keywords) to High(Keywords) do begin
    if s <> '' then
      s := s + #$D#$A;
    s := s + Keywords[i];
  end;}

  FServicesCS.Acquire;
  try
    if FCachedServerList = nil then begin
      FCachedServerList := TStringList.Create;
    {$IFDEF VER6P}
      FCachedServerList.CaseSensitive := False;
    {$ENDIF}
      FCachedServerList.Sorted := True;
    end;
    i := FCachedServerList.IndexOf(Keywords);
    if i = - 1 then begin
      sl := TStringList.Create;
    {$IFDEF VER6P}
      sl.CaseSensitive := False;
    {$ENDIF}
      sl.Sorted := True;
      FCachedServerList.AddObject(Keywords, sl);
    end
    else
      sl := FCachedServerList.Objects[i] as TStringList;
    if sl.IndexOf(Server) = -1 then
      sl.Add(Server);
  finally
    FServicesCS.Release;
  end;
end;

class procedure TCRNetManager.GetServerList(List: TStrings);
var
  pData, psvr_Name: IntPtr;
  EntRead, EntTotal, Resume, i : integer;
  s: string;
  Info : integer;
begin
  List.Clear;
  pData := nil;
  try
    Resume := 0;
    Info := NetServerEnum(nil, 100, pData, -1{MAX_PREFERRED_LENGTH}, EntRead, EntTotal, 1{SV_TYPE_WORKSTATION - All LAN Manager workstations}, nil, Resume);
    if Info <> 0 then
      raise Exception.Create('NetServerEnum error ' + IntToStr(Info));

    Assert(pData <> nil);
    for i := 0 to EntRead - 1 do begin
      psvr_Name := Marshal.ReadIntPtr(pData, i * 8 {sizeof(SERVER_INFO_100 )} + 4);
      s := Marshal.PtrToStringUni(psvr_Name);
      List.Add(s);
    end;
  finally
    if pData <> nil then
      NetApiBufferFree(pData);
  end;
end;

procedure TCRNetManager.GetServerList(List: TStrings; const Keywords: string; const Timeout: Longword = 1; const CacheTimeout: Longword = 120);
var
  mList, sl: TStringList;
  i: integer;
  tc: LongWord;
  Threads: TCRServicesThread;
{$IFDEF CLR}
  ReturnValue: LongWord;
{$ENDIF}
begin
  List.Clear;
  if Timeout = 0 then
    Exit;

  StartWait;
  mList := nil;
  try
    mList := TStringList.Create;
  {$IFDEF VER6P}
    mList.CaseSensitive := False;
  {$ENDIF}
    mList.Sorted := True;

    tc := LongWord(Int64(FLastTickCount) + CacheTimeout * 1000);
    if (tc < GetTickCount) or (GetTickCount < FLastTickCount) then begin
      GetServerList(mList);
      mList.Add('localhost');
      Threads := TCRServicesThread.Create(mList, Keywords);
    {$IFDEF CLR}
      Threads.WaitFor(Timeout * 1000, ReturnValue);
    {$ELSE}
      WaitForSingleObject(Threads.Handle, Timeout * 1000);
    {$ENDIF}
      FLastTickCount := GetTickCount;
    end;

    if FCachedServerList <> nil then begin
      mList.Clear;
      FServicesCS.Acquire;
      try
        i := FCachedServerList.IndexOf(Keywords);
        if i <> -1 then begin
          sl := FCachedServerList.Objects[i] as TStringList;
          for i := 0 to sl.Count - 1 do begin
            if mList.IndexOf(sl[i]) = -1 then
              mList.Add(sl[i]);
          end;
        end;
      finally
        FServicesCS.Release;
      end;
    end;

    List.Assign(mList);
  finally
    StopWait;
    mList.Free;
  end;
end;
{$ENDIF}

{ TDADataSetUtils }

procedure TDADataSetUtils.QuickOpen(DataSet: TCustomDADataSet; Refresh: boolean = False);
begin
  Inc(FCount);
  if FCount > 1 then begin
    Assert(FDataSet = DataSet);
    Exit;
  end;

  Assert(FDataSet = nil, 'TDADataSetUtils.QuickOpen - twice call');
  FDataSet := DataSet;

  FOldActive := DataSet.Active;
  FOldDebug := DataSet.Debug;
  FOldFetchAll := DataSet.FetchAll;
  FOldFetchRows := DataSet.FetchRows;

  if not DataSet.Active or Refresh then begin
    DataSet.Debug := False;
    DataSet.FetchAll := False;
    DataSet.Close;
    DataSet.FetchRows := 1;
    DataSet.Execute;
  end;
end;

procedure TDADataSetUtils.Restore(RestoreActive: boolean = True);
begin
  Assert(FDataSet <> nil, 'TDADataSetUtils.Restore without QuickOpen');
  Dec(FCount);
  if FCount > 0 then
    Exit;

  FDataSet.Debug := FOldDebug;
  FDataSet.FetchAll := FOldFetchAll;
  if RestoreActive then begin
    if FDataSet.FetchRows <> FOldFetchRows then begin
      FDataSet.Active := False;
      FDataSet.FetchRows := FOldFetchRows;
    end;
    FDataSet.Active := FOldActive;
  end;

  FDataSet := nil;
end;

procedure TDADataSetUtils.QuickOpenAndRestore(DataSet: TCustomDADataSet; Refresh: boolean = False);
begin
  try
    QuickOpen(DataSet, Refresh);
  finally
    Restore;
  end;
end;

{ TDBAccessUtils }

class function TDBAccessUtils.IsKeyViolation(Obj: TCustomDAConnection; E: EDAError): boolean;
begin
  Result := Obj.IsKeyViolation(E);
end;

class function TDBAccessUtils.IsObjectDataType(Obj: TDAParam; DataType: TFieldType): boolean;
begin
  Result := Obj.IsObjectDataType(DataType);
end;

class procedure TDBAccessUtils.CheckConnection(Obj: TCustomDADataSet);
begin
  Obj.CheckConnection;
end;

class procedure TDBAccessUtils.CheckConnection(Obj: TCustomDASQL);
begin
  Obj.CheckConnection;
end;

class function TDBAccessUtils.UsedConnection(Obj: TCustomDADataSet): TCustomDAConnection;
begin
  Result := Obj.UsedConnection;
end;

class function TDBAccessUtils.UsedConnection(Obj: TCustomDASQL): TCustomDAConnection;
begin
  Result := Obj.UsedConnection;
end;

class procedure TDBAccessUtils.SetAutoCommit(Obj: TComponent; Value: boolean);
begin
  Assert(Obj <> nil);
  if Obj is TCustomDASQL then
    TCustomDASQL(Obj).AutoCommit := Value
  else
  if IsClass(Obj, TCustomDADataSet) then
    TCustomDADataSet(Obj).AutoCommit := Value
  else
    Assert(False, Obj.ClassName);
end;

class function TDBAccessUtils.GetAutoCommit(Obj: TComponent): boolean;
begin
  Result := False;
  Assert(Obj <> nil);
  if Obj is TCustomDASQL then
    Result := TCustomDASQL(Obj).AutoCommit
  else
  if Obj is TCustomDADataSet then
    Result := TCustomDADataSet(Obj).AutoCommit
  else
    Assert(False, Obj.ClassName);
end;

class procedure TDBAccessUtils.SetDesignCreate(Obj: TCustomDADataSet; Value: boolean);
begin
  Obj.FDesignCreate := Value;
end;

class function TDBAccessUtils.GetDesignCreate(Obj: TCustomDADataSet): boolean;
begin
  Result := Obj.FDesignCreate;
end;

class procedure TDBAccessUtils.SetDesignCreate(Obj: TCustomDASQL; Value: boolean);
begin
  Obj.FDesignCreate := Value;
end;

class function TDBAccessUtils.GetDesignCreate(Obj: TCustomDASQL): boolean;
begin
  Result := Obj.FDesignCreate;
end;

class procedure TDBAccessUtils.SetDesignCreate(Obj: TCustomDAUpdateSQL; Value: boolean);
begin
  Obj.FDesignCreate := Value;
end;

class function TDBAccessUtils.GetDesignCreate(Obj: TCustomDAUpdateSQL): boolean;
begin
  Result := Obj.FDesignCreate;
end;

class procedure TDBAccessUtils.SetDesignCreate(Obj: TCRDataSource; Value: boolean);
begin
  Obj.FDesignCreate := Value;
end;

class function TDBAccessUtils.GetDesignCreate(Obj: TCRDataSource): boolean;
begin
  Result := Obj.FDesignCreate;
end;

class function TDBAccessUtils.CreateIRecordSet(Obj: TCustomDAConnection): TCRRecordSet;
begin
  Result := Obj.CreateIRecordSet;
end;

class function TDBAccessUtils.GetIConnection(Obj: TCustomDAConnection): TCRConnection;
begin
  Result := Obj.FIConnection;
end;

class function TDBAccessUtils.GetUpdateQuery(Obj: TCustomDADataSet): TComponent;
begin
  Result := Obj.FUpdateQuery;
end;

class function TDBAccessUtils.GetTablesInfo(Obj: TCustomDADataSet): TCRTablesInfo;
begin
  Result := Obj.TablesInfo;
end;

class function TDBAccessUtils.GetUpdatingTable(Obj: TCustomDADataSet): string;
begin
  Result := Obj.UpdatingTable;
end;

class procedure TDBAccessUtils.SetUpdatingTable(Obj: TCustomDADataSet; Value: string);
begin
  Obj.UpdatingTable := Value;
end;

class function TDBAccessUtils.GetUpdatingTableIdx(Obj: TCustomDADataSet): integer;
begin
  Result := Obj.FUpdatingTableInfoIdx;
end;

class procedure TDBAccessUtils.SetUpdatingTableIdx(Obj: TCustomDADataSet; Value: integer);
begin
  Obj.FUpdatingTableInfoIdx := Value;
end;

class procedure TDBAccessUtils.InternalConnect(Obj: TCustomDAConnection);
begin
  Assert(Obj <> nil);
  Obj.InternalConnect;
end;

class procedure TDBAccessUtils.InternalDisconnect(Obj: TCustomDAConnection);
begin
  Assert(Obj <> nil);
  Obj.InternalDisconnect;
end;

class procedure TDBAccessUtils.SuppressAutoCommit(Obj: TCustomDAConnection);
begin
  Obj.SuppressAutoCommit;
end;

class procedure TDBAccessUtils.RestoreAutoCommit(Obj: TCustomDAConnection);
begin
  Obj.RestoreAutoCommit;
end;

class procedure TDBAccessUtils.Disconnect(Obj: TCustomDASQL);
begin
  Obj.Disconnect;
end;

class function TDBAccessUtils.SQLGenerator(Obj: TCustomDADataSet): TDASQLGenerator;
begin
  Result := Obj.FSQLGenerator;
end;

class procedure TDBAccessUtils.GetKeyAndDataFields(
  Obj: TCustomDADataSet;
  out KeyAndDataFields: TKeyAndDataFields;
  const ForceUseAllKeyFields: boolean);
begin
  Obj.GetKeyAndDataFields(KeyAndDataFields, ForceUseAllKeyFields);
end;

class function TDBAccessUtils.GetLockDebug(Obj: TComponent): boolean;
begin
  if Obj is TCustomDADataSet then 
    Result := TCustomDADataSet(Obj).FLockDebug
  else
  if Obj is TCustomDASQL then 
    Result := TCustomDASQL(Obj).FLockDebug
  else
  begin
    Result := False;
    Assert(False, 'Obj is ' + Obj.ClassName);
  end;
end;

class procedure TDBAccessUtils.SetLockDebug(Obj: TComponent; Value: boolean);
begin
  if IsClass(Obj, TCustomDADataSet) then
    TCustomDADataSet(Obj).FLockDebug := Value
  else
  if IsClass(Obj, TCustomDASQL) then
    TCustomDASQL(Obj).FLockDebug := Value
  else
    Assert(False, 'Obj is ' + Obj.ClassName);
end;

class function TDBAccessUtils.FOwner(Obj: TDAConnectionOptions): TCustomDAConnection;
begin
  Result := Obj.FOwner;
end;

class function TDBAccessUtils.FOwner(Obj: TDADataSetOptions): TCustomDADataSet;
begin
  Result := Obj.FOwner;
end;

class function TDBAccessUtils.SQLMonitorClass(Obj: TCustomDAConnection): TClass;
begin
  Result := Obj.SQLMonitorClass;
end;

class function TDBAccessUtils.QuoteName(Obj: TCustomDADataSet; const AName: string): string;
begin
  Result := Obj.QuoteName(AName);
end;

class function TDBAccessUtils.UnQuoteName(Obj: TCustomDADataSet; AName: string): string;
begin
  Result := Obj.UnQuoteName(AName);
end;

class function TDBAccessUtils.GetSQLs(Obj: TCustomDAConnection): TDAList;
begin
  Result := Obj.FSQLs;
end;

class procedure TDBAccessUtils.RegisterClient(Obj: TCustomDAConnection; Client: TObject; Event: TConnectChangeEvent = nil);
begin
  Obj.RegisterClient(Client, Event);
end;

class procedure TDBAccessUtils.UnRegisterClient(Obj: TCustomDAConnection; Client: TObject);
begin
  Obj.UnRegisterClient(Client);
end;

class function TDBAccessUtils.GetIdentityField(Obj: TCustomDADataSet): TField;
begin
  Result := Obj.FIdentityField;
end;

class function TDBAccessUtils.GetSQL(Obj: TComponent): TStrings;
begin
  Result := nil;
  Assert(Obj <> nil);
  if IsClass(Obj, TCustomDASQL) then
    Result := TCustomDASQL(Obj).SQL
  else
  if IsClass(Obj, TCustomDADataSet) then
    Result := TCustomDADataSet(Obj).SQL
  else
    Assert(False, Obj.ClassName);
end;

class procedure TDBAccessUtils.SetSQL(Obj: TComponent; Value: TStrings);
begin
  Assert(Obj <> nil);
  if Obj is TCustomDASQL then
    TCustomDASQL(Obj).SQL := Value
  else
  if Obj is TCustomDADataSet then
    TCustomDADataSet(Obj).SQL := Value
  else
    Assert(False, Obj.ClassName);
end;

class procedure TDBAccessUtils.SetSQLText(Obj: TComponent; const SQLText: string; const LockAssembleSQL, LockMacros: boolean; const DisableScanParams: boolean = True);
begin
  Assert(Obj <> nil);
  if IsClass(Obj, TCustomDASQL) then
    try
      TCustomDASQL(Obj).FLockMacros := LockMacros;
      TCustomDASQL(Obj).FLockAssembleSQL := LockAssembleSQL;
      TCustomDASQL(Obj).FICommand.SetProp(prDisableParamScan, Variant(True));
      TCustomDASQL(Obj).SQL.Text := SQLText;
    finally
      TCustomDASQL(Obj).FLockMacros := False;
      TCustomDASQL(Obj).FLockAssembleSQL := False;
      TCustomDASQL(Obj).FICommand.SetProp(prDisableParamScan, Variant(False));
    end
  else
  if IsClass(Obj, TCustomDADataSet) then
    try
      TCustomDADataSet(Obj).FCommand.FLockMacros := LockMacros;
      TCustomDADataSet(Obj).FCommand.FLockAssembleSQL := LockAssembleSQL;
      TCustomDADataSet(Obj).FCommand.FICommand.SetProp(prDisableParamScan, Variant(DisableScanParams));
      TCustomDADataSet(Obj).SQL.Text := SQLText;
    finally
      TCustomDADataSet(Obj).FCommand.FLockMacros := False;
      TCustomDADataSet(Obj).FCommand.FLockAssembleSQL := False;
      TCustomDADataSet(Obj).FCommand.FICommand.SetProp(prDisableParamScan, Variant(False));      
    end
  else
    Assert(False, Obj.ClassName);
end;

class function TDBAccessUtils.GetParams(Obj: TComponent): TDAParams;
begin
  Result := nil;
  Assert(Obj <> nil);
  if IsClass(Obj, TCustomDASQL) then
    Result := TCustomDASQL(Obj).Params
  else
  if IsClass(Obj, TCustomDADataSet) then
    Result := TCustomDADataSet(Obj).Params
  else
    Assert(False, Obj.ClassName);
end;

class procedure TDBAccessUtils.Execute(Obj: TComponent);
begin
  Assert(Obj <> nil);
  if IsClass(Obj, TCustomDASQL) then
    TCustomDASQL(Obj).Execute
  else
  if IsClass(Obj, TCustomDADataSet) then
    TCustomDADataSet(Obj).Execute
  else
    Assert(False, Obj.ClassName);
end;

class procedure TDBAccessUtils.Open(Obj: TComponent);
begin
  Assert(Obj <> nil);
  Assert(Obj is TCustomDADataSet);
  TCustomDADataSet(Obj).Open;
end;

class function TDBAccessUtils.GetRowsAffected(Obj: TComponent): integer;
begin
  Result := 0;
  Assert(Obj <> nil);
  if IsClass(Obj, TCustomDASQL) then
    Result := TCustomDASQL(Obj).RowsAffected
  else
  if IsClass(Obj, TCustomDADataSet) then
    Result := TCustomDADataSet(Obj).RowsAffected
  else
    Assert(False, Obj.ClassName);
end;

class function TDBAccessUtils.GetUpdateSQLStatementTypes(Obj: TCustomDADataSet): TStatementTypes;
begin
  Result := Obj.GetUpdateSQLStatementTypes;
end;

class function TDBAccessUtils.GetUpdateSQLIndex(Obj: TCustomDADataSet; StatementType: TStatementType): TStrings;
begin
  Result := nil;
  if Assigned(Obj.UpdateObject) then
    if Obj.UpdateObject.GetObjectIndex(Ord(StatementType)) = nil then
      Result := Obj.UpdateObject.GetSQLIndex(Ord(StatementType))
    else
      Exit;
  if Result = nil then
    Result := Obj.GetUpdateSQLIndex(Ord(StatementType));
end;

class function TDBAccessUtils.ParseSQL(Obj: TCustomDASQL; const SQL: string; Params: TDAParams; RenamePrefix: string = ''): string;
begin
  Result := Obj.ParseSQL(SQL, Params, RenamePrefix);
end;

class function TDBAccessUtils.CreateParamsObject(Obj: TCustomDASQL): TDAParams;
begin
  Result := Obj.CreateParamsObject;
end;

class procedure TDBAccessUtils.SetDesigning(Obj: TComponent; Value: Boolean; SetChildren: Boolean = True);
begin
  if Obj is TCustomDADataSet then
    TCustomDADataSet(Obj).SetDesigning(Value, SetChildren)
  else
  if Obj is TCustomDASQL then
    TCustomDASQL(Obj).SetDesigning(Value, SetChildren)
  else
    Assert(False, Obj.ClassName);
end;

class function TDBAccessUtils.GetIRecordSet(Obj: TCustomDADataSet): TCRRecordSet;
begin
  Result := Obj.FIRecordSet;
end;

class function TDBAccessUtils.GetDataSetClass(Obj: TCustomDAUpdateSQL): TCustomDADataSetClass;
begin
  Result := Obj.DataSetClass;
end;

class function TDBAccessUtils.GetSQLClass(Obj: TCustomDAUpdateSQL): TCustomDASQLClass;
begin
  Result := Obj.SQLClass;
end;

class function TDBAccessUtils.GetParserClass(Obj: TMacros): TParserClass;
begin
  Result := Obj.FParserClass;
end;

{$IFDEF MSWINDOWS}
class procedure TDBAccessUtils.SaveServerListToRegistry(Obj: TCustomConnectDialog);
begin
  Obj.SaveServerListToRegistry;
end;
{$ENDIF}

{ TCRDataSource }

constructor TCRDataSource.Create(Owner: TComponent);
begin
  inherited Create(Owner);

  FDesignCreate := csDesigning in ComponentState;
end;

procedure TCRDataSource.Loaded;
begin
  inherited;

  FDesignCreate := False;
end;

procedure TCRDataSource.AssignTo(Dest: TPersistent);
begin
  if Dest is TDataSource then begin
    TDataSource(Dest).DataSet := DataSet;
    TDataSource(Dest).AutoEdit := AutoEdit;
    TDataSource(Dest).Enabled := Enabled;
  end else
    inherited;
end;

initialization
  ChangeCursor := True;
  MacroChar := '&';
  SetCursorProc := nil;
  ShowConnectFormProc := nil;
  BaseSQLOldBehavior := False;
  SQLGeneratorCompatibility := False;
{$IFDEF MSWINDOWS}
{$IFNDEF CLR}
  OpenSCManager := @NotLink;
  CloseServiceHandle := @NotLink;
  OpenService := @NotLink;
  EnumServicesStatus := @NotLink;
  QueryServiceStatus := @NotLink;
  StartService := @NotLink;
  ControlService := @NotLink;
  NetServerEnum := @NotLink;
  NetApiBufferFree := @NotLink;
{$ENDIF}
  LoadNetManagerLib;
  CRNetManager := TCRNetManager.Create;
{$ENDIF}

finalization
{$IFDEF MSWINDOWS}
  CRNetManager.Free;
  FreeNetManagerLib;
{$ENDIF}

end.
