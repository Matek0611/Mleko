
//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  MSAccess
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Sdac.inc}

unit MSAccess;
{$ENDIF}

{ $R MSAccess.res}

interface

uses
{$IFDEF CLR}
  Variants, System.XML, System.Text, System.IO,
{$ELSE}
  CLRClasses, CRXml,
{$ENDIF}
  Classes, MemDS, DBAccess, MemData, CRAccess, OLEDBAccess, SysUtils, DB, CRParser,
  MSConnectionPool, CRConnectionPool, OLEDBC, OLEDBIntf, MSConsts, MemUtils, DASQLMonitor,
  Windows, DAConsts,
{$IFNDEF CLR}
  MSUDT,
{$ENDIF}
  Win32Timer;

{$I SdacVer.inc}

const
  ftMSXML = 50;
  ftMSUDT = 51;
  
{ TMSParam }
const
  /// WAR Need to sync with EdMSParams.FieldTypesWithSize on change
  FieldTypesWithSize: set of TFieldType = [ftString, ftFixedChar, {ftMemo - BLOB, }ftBytes, ftVarBytes, ftWideString];

type
  TMSParam = class (TDAParam)
  private
    FOLEDBType: DBTYPE;
  protected
    function GetSize: integer; override;
    procedure SetSize(Value: integer); override;

    procedure SetAsString(Value: string); override;
    procedure SetAsWideString(Value: WideString); override;
    procedure SetAsVariant(const Value: Variant); override;

    procedure CreateObject; override;

    function IsObjectDataType: boolean; overload;
    property ParamObject;
    property OLEDBType: DBTYPE read FOLEDBType write FOLEDBType;
  public
    constructor Create(Collection: TCollection); override;

    procedure AssignFieldValue(Field: TField; const Value: Variant); override;

    property AsString: string read GetAsString write SetAsString;
    property AsWideString: WideString read GetAsWideString write SetAsWideString;

  end;

{ TMSParams }
  TMSParams = class (TDAParams)
  private
    function GetItem(Index: Integer): TMSParam;
    procedure SetItem(Index: Integer; Value: TMSParam);

  public
    constructor Create(Owner: TPersistent);

    procedure Assign(Source: TPersistent); override;

    function ParamByName(const Value: string): TMSParam;
    function FindParam(const Value: string): TMSParam;
    property Items[Index: integer]: TMSParam read GetItem write SetItem; default;

  end;

{ TMSConnection }

  TCustomMSConnection = class;
  
  TCustomMSConnectionOptions = class (TDAConnectionOptions)
  protected
    FQuotedIdentifier: boolean;
    FEncrypt: boolean;
    FNumericType: TDANumericType;
    FProvider: TOLEDBProvider;

    procedure SetQuotedIdentifier(const Value: boolean);
    procedure SetEncrypt(const Value: boolean);
    procedure SetNumericType(Value: TDANumericType);
    procedure SetProvider(const Value: TOLEDBProvider); virtual;
    
  protected
    procedure AssignTo(Dest: TPersistent); override;

  public
    constructor Create(Owner: TCustomMSConnection);

    property QuotedIdentifier: boolean read FQuotedIdentifier write SetQuotedIdentifier default True;
    property Encrypt: boolean read FEncrypt write SetEncrypt default False;

    property NumericType: TDANumericType read FNumericType write SetNumericType default ntFloat;
    property Provider: TOLEDBProvider read FProvider write SetProvider default prAuto;

    property KeepDesignConnected;
    property DisconnectedMode;
    property LocalFailover;
  end;

  TMSConnectionInfoMessageEvent = procedure (Sender: TObject; E: EMSError) of object;
  TMSSQL = class;

  TCustomMSConnection = class (TCustomDAConnection)
  protected
    FLoginPrompt: boolean;
    FLockLoginPrompt: boolean;

    FDatabase: string;
    FIsolationLevel: TIsolationLevel;
    FOptions: TCustomMSConnectionOptions;
    FMSSQL: TMSSQL;

    function GetIConnectionClass: TCRConnectionClass; override;
    function GetICommandClass: TCRCommandClass; override;
    function GetIRecordSetClass: TCRRecordSetClass; override;

    procedure CreateIConnection; override;
    procedure SetIConnection(Value: TCRConnection); override;
    procedure SetOptions(Value: TCustomMSConnectionOptions);

    procedure FillConnectionParameters(var ConnectionParameters: TMSConnectionParameters); virtual;
    procedure FillConnectionProps(OLEDBConnection: TOLEDBConnection); virtual;
    function GetOLEDBConnection: TOLEDBConnection;

    function SQLMonitorClass: TClass; override;
    function ConnectDialogClass: TConnectDialogClass; override;

    procedure AssignTo(Dest: TPersistent); override;

    procedure SetDatabase(Value: string);

    procedure SetIsolationLevel(const Value: TIsolationLevel);

    function NeedPrompt: boolean; override;

    function IsFatalError(E: EDAError): boolean; override;
    procedure DoError(E: Exception; var Fail, Reconnect, Reexecute: boolean; ReconnectAttempt: integer;
      var ConnLostCause: TConnLostCause); override;   
    function IsKeyViolation(E: EDAError): boolean; override;

    procedure Check(const Status: HRESULT; Sender: TObject);
    procedure CheckInactive;

  { Transaction control }
    procedure InternalStartTransaction; override;
    
    procedure DoConnect; override;

    function CommitOnDisconnect: boolean; override;

    procedure AddConnectStringParam(var Result: string; const ParamName: string;
      const Value: string; const DefValue: string);
    function GetConnectString: string; override;

    procedure InitConnectStringOptions; virtual;
    procedure ProcessConnectStringParam(const paramName, paramValue: string); virtual;
    function RecognizedParameter(const Args: array of string; const paramName: string): boolean;
    procedure SetConnectString(Value: string); override;

    function GetClientVersion: string;
    function GetServerVersion: string;

    function CreateOptions: TDAConnectionOptions; override;

    function IConnection: TOLEDBConnection;
    function IsCaseSensitive: boolean; override;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;

    function CreateDataSet: TCustomDADataSet; override;
    function CreateSQL: TCustomDASQL; override;

    function ExecSQL(Text: string; const Params: array of variant): variant; override;

    procedure GetTableNames(List: TStrings); override;
    procedure GetDatabaseNames(List: TStrings); override;
    procedure GetStoredProcNames(List: TStrings); overload; override;
    procedure GetStoredProcNames(List: TStrings; System: boolean); reintroduce; overload;

    property ClientVersion: string read GetClientVersion;
    property ServerVersion: string read GetServerVersion;

    property Database: string read FDatabase write SetDatabase;
    property IsolationLevel: TIsolationLevel read FIsolationLevel write SetIsolationLevel default ilReadCommitted;

    property PoolingOptions;
    property Pooling;

    property Options: TCustomMSConnectionOptions read FOptions write SetOptions;

    property Password;

    property AfterConnect;
    property BeforeConnect;
    property AfterDisconnect;
    property BeforeDisconnect;
    property OnLogin;
    property OnError;
    property ConnectDialog;
    property LoginPrompt;
    property ConnectString;

    property OnConnectionLost;
  end;

  TMSConnection = class;
  
  TMSConnectionOptions = class(TCustomMSConnectionOptions)
  protected
    FLanguage: string;
    FPersistSecurityInfo: boolean;
    FAutoTranslate: boolean;
    FNetworkLibrary: string;
    FApplicationName: string;
    FWorkstationID: string;
    FPacketSize: integer;
    FInitialFileName: string;
    FMultipleActiveResultSets: boolean;
    FFailoverPartner: string;
    FTrustServerCertificate: boolean;

    procedure SetLanguage(const Value: string);
    procedure SetPersistSecurityInfo(const Value: boolean);
    procedure SetAutoTranslate(const Value: boolean);
    procedure SetNetworkLibrary(const Value: string);
    procedure SetApplicationName(const Value: string);
    procedure SetWorkstationID(const Value: string);
    procedure SetPacketSize(const Value: integer);
    procedure SetInitialFileName(const Value: string);
    procedure SetMultipleActiveResultSets(const Value: boolean);
    procedure SetFailoverPartner(const Value: string);
    procedure SetTrustServerCertificate(const Value: boolean);

    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create(Owner: TMSConnection);
  published
    property QuotedIdentifier;
    property Language: string read FLanguage write SetLanguage;
    property NumericType;
    property Encrypt;
    property PersistSecurityInfo: boolean read FPersistSecurityInfo write SetPersistSecurityInfo default False;
    property AutoTranslate: boolean read FAutoTranslate write SetAutoTranslate default True;
    property NetworkLibrary: string read FNetworkLibrary write SetNetworkLibrary;
    property ApplicationName: string read FApplicationName write SetApplicationName;
    property WorkstationID: string read FWorkstationID write SetWorkstationID;
    property PacketSize: integer read FPacketSize write SetPacketSize default 4096;
    property InitialFileName: string read FInitialFileName write SetInitialFileName;
    property MultipleActiveResultSets: boolean read FMultipleActiveResultSets write SetMultipleActiveResultSets default False;
    property FailoverPartner: string read FFailoverPartner write SetFailoverPartner;
    property TrustServerCertificate: boolean read FTrustServerCertificate write SetTrustServerCertificate default False;
    property Provider;
    property KeepDesignConnected;
    property DisconnectedMode;
    property LocalFailover;
  end;

  TMSConnection = class(TCustomMSConnection)
  protected
    FAuthentication: TMSAuthentication;
    FConnectionTimeout: integer;
    FOnInfoMessage: TMSConnectionInfoMessageEvent;
    FIntegratedSecuritySSPI: boolean;
    FSPID: integer;

    procedure SetIConnection(Value: TCRConnection); override;

    procedure FillConnectionParameters(var ConnectionParameters: TMSConnectionParameters); override;
    procedure FillConnectionProps(OLEDBConnection: TOLEDBConnection); override;
    
    procedure AssignTo(Dest: TPersistent); override;

    function CreateOptions: TDAConnectionOptions; override;

    function GetOptions: TMSConnectionOptions;
    procedure SetOptions(Value: TMSConnectionOptions);

    procedure SetAuthentication(const Value: TMSAuthentication);
    procedure SetConnectionTimeout(const Value: integer);
    function NeedPrompt: boolean; override;

    function GetConnectString: string; override;
    procedure ProcessConnectStringParam(const paramName, paramValue: string); override;
    procedure InitConnectStringOptions; override;
    procedure SetConnectString(Value: string); override;

    procedure DoInfoMessage(E: EMSError);

    function GetSPID: integer;
    property SPID: integer read GetSPID;
  public
    constructor Create(Owner: TComponent); override;

    procedure ChangePassword(NewPassword: string);

  published
    property Database;
    property IsolationLevel;
    property Authentication: TMSAuthentication read FAuthentication write SetAuthentication default auServer;
    property ConnectionTimeout: integer read FConnectionTimeout write SetConnectionTimeout default 15;

    property Options: TMSConnectionOptions read GetOptions write SetOptions;

    property PoolingOptions;
    property Pooling;
    property Username;
    property Password;
    property Server;
    property Connected stored IsConnectedStored;

    property AfterConnect;
    property BeforeConnect;
    property AfterDisconnect;
    property BeforeDisconnect;
    property OnLogin;
    property OnError;
    property ConnectDialog;
    property LoginPrompt;
    property ConnectString;
    property OnInfoMessage: TMSConnectionInfoMessageEvent read FOnInfoMessage write FOnInfoMessage;
    property OnConnectionLost;
  end;
  
  TCustomMSDataSet = class;
  
{$IFNDEF STD}
{ TMSChangeNotification }

  TMSNotificationType = (ntChange, ntSubscribe, ntUnknown);

  TMSNotificationInfo = (niAlter, niDelete, niDrop, niError, niInsert, niInvalid, niIsolation,
    niOptions, niPreviousFire, niQuery, niResource, niRestart, niTemplateLimit, niTruncate, niUnknown, niUpdate);

  TMSNotificationSource = (nsClient, nsData, nsDatabase, nsEnvironment, nsExecution,
    nsObject, nsStatement, nsSystem, nsTimeout, nsUnknown);


  TMSChangeNotificationEvent = procedure(Sender: TObject; DataSet: TCustomMSDataSet; NotificationInfo: TMSNotificationInfo;
    NotificationSource: TMSNotificationSource; NotificationType: TMSNotificationType) of object;

  TMSChangeNotification = class(TComponent)
  private
    FEnabled: boolean;
    FTimeOut: integer;
    FService: string;
    FOnChange: TMSChangeNotificationEvent;
    FDataSets: TDAList;
    FNotificators: TDAList;

    procedure SetEnabled(Value: boolean);
    procedure SetTimeOut(Value: integer);
    procedure SetService(Value: string);

    procedure DoOnNotification(Sender: TObject);

    function GetSubscriptionKey(DataSet: TCustomMSDataSet): string;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    procedure AddDataSet(DataSet: TCustomMSDataSet);
    procedure RemoveDataSet(DataSet: TCustomMSDataSet);
    procedure CheckDataSet(DataSet: TCustomMSDataSet);

    function FindNotificator(DataSet: TCustomMSDataSet): TObject;
    procedure AddNotificator(DataSet: TCustomMSDataSet);
    procedure RemoveNotificator(DataSet: TCustomMSDataSet);

    procedure StartNotification(DataSet: TCustomMSDataSet);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Enabled: boolean read FEnabled write SetEnabled default True;
    property TimeOut: integer read FTimeOut write SetTimeOut default 432000;
    property Service: string read FService write SetService;
    property OnChange: TMSChangeNotificationEvent read FOnChange write FOnChange;
  end;
{$ENDIF}

{ TCustomMSDataSet }

  TMSDataSetOptions = class (TDADataSetOptions)
  private
    FEnableBCD: boolean;
    FUniqueRecords: boolean;
    FCursorUpdate: boolean;
    FQueryIdentity: boolean;
    FCheckRowVersion: boolean;
    FDMLRefresh: boolean;
    FAutoRefresh: boolean;
    FAutoRefreshInterval: integer;
    FDefaultValues: boolean;
    FNonBlocking: boolean;
    FReflectChangeNotify: boolean;

    procedure SetEnableBCD(Value: boolean);
    procedure SetUniqueRecords(Value: boolean);
    procedure SetCursorUpdate(Value: boolean);
    function GetAllFieldsEditable: boolean;
    procedure SetAllFieldsEditable(const Value: boolean);
    procedure SetAutoRefresh(Value: boolean);
    procedure SetAutoRefreshInterval(Value: integer);
    procedure SetNonBlocking(Value: boolean);
    procedure SetReflectChangeNotify(const Value: boolean);
  protected
    procedure AssignTo(Dest: TPersistent); override;

  public
    constructor Create(Owner: TCustomDADataSet);

  published
    property AllFieldsEditable: boolean read GetAllFieldsEditable write SetAllFieldsEditable stored False;
    property EnableBCD: boolean read FEnableBCD write SetEnableBCD default False;
    property UniqueRecords: boolean read FUniqueRecords write SetUniqueRecords default False;
    property CursorUpdate: boolean read FCursorUpdate write SetCursorUpdate default True;
    property QueryIdentity: boolean read FQueryIdentity write FQueryIdentity default True;
    property CheckRowVersion: boolean read FCheckRowVersion write FCheckRowVersion default False;
    property FullRefresh default False;
    property DMLRefresh: boolean read FDMLRefresh write FDMLRefresh default False;
    property AutoRefresh: boolean read FAutoRefresh write SetAutoRefresh default False;
    property AutoRefreshInterval: integer read FAutoRefreshInterval write SetAutoRefreshInterval default 60; /// Seconds dac6.txt
    property DefaultValues: boolean read FDefaultValues write FDefaultValues default False;
    property NonBlocking: boolean read FNonBlocking write SetNonBlocking default False;
    property ReflectChangeNotify: boolean read FReflectChangeNotify write SetReflectChangeNotify default False;

    property LongStrings;
    property RequiredFields default False;
    property StrictUpdate;
    property NumberRange;
    property ReturnParams;
    property TrimFixedChar;
    property TrimVarChar;
    property QueryRecCount;
    property AutoPrepare;
    property RemoveOnRefresh;
    property FlatBuffers;
    property QuoteNames;
    property DetailDelay;
  {$IFDEF HAVE_COMPRESS}
    property CompressBlobMode;
  {$ENDIF}
    property LocalMasterDetail;
    property CacheCalcFields;
    property UpdateBatchSize;
    property UpdateAllFields;
  end;

  TMSLockType = (ltUpdate, ltExclusive);
  TMSLockObject = (loRow, loTable);
  
  TMSUpdateExecuteEvent = procedure (Sender: TCustomMSDataSet;
    StatementTypes: TStatementTypes; Params: TMSParams) of object;

  TMSSQLGenerator = class (TDASQLGenerator)
  protected
    FLockType: TMSLockType;
    FLockObject: TMSLockObject;
    function AssembleSB(const StatementType: TStatementType): string; override;
    function GetActualFieldNameEx(FieldDesc: TCRFieldDesc; TableInfo: TCRTableInfo): string; overload; override;
    procedure GenerateInsertSQL(
      const KeyAndDataFields: TKeyAndDataFields;
      const ModifiedFieldsOnly: boolean;
      const Index: integer = -1); override;
    procedure GenerateUpdateSQL(
      const KeyAndDataFields: TKeyAndDataFields;
      const ModifiedFieldsOnly: boolean;
      const Index: integer = -1); override;
    procedure GenerateRefreshSQLSelectPart(const KeyAndDataFields: TKeyAndDataFields); override;
    procedure GenerateRefreshSQL(
      const KeyAndDataFields: TKeyAndDataFields;
      const ModifiedFieldsOnly: boolean); override;
    function GetActualFieldName(FldDesc: TCRFieldDesc; IsRefresh: boolean): string; override;
    procedure AddFieldToCondition(SB: StringBuilder; FieldDesc: TCRFieldDesc;
      const StatementType: TStatementType;
      const ModifiedFieldsOnly: boolean;
      const Index: integer = -1); override;

    procedure GenerateConditions(SB: StringBuilder; const StatementType: TStatementType;
      const ModifiedFieldsOnly: boolean;
      const KeyAndDataFields: TKeyAndDataFields;
      const Index: integer = -1); override;

    procedure GenerateLockSQL(
      const KeyAndDataFields: TKeyAndDataFields;
      const Index: integer = -1); override;
  end;

  TMSUpdateSQL = class;

  TCustomMSDataSet = class (TCustomDADataSet)
  private
    function GetConnection: TCustomMSConnection;
    procedure SetConnection(Value: TCustomMSConnection);
    procedure SetCursorType(const Value: TMSCursorType);
    procedure SetCommandTimeout(const Value: integer);

    function GetUpdateObject: TMSUpdateSQL;
    procedure SetUpdateObject(Value: TMSUpdateSQL);
   
  protected
  { IProviderSupport }
    function PSGetKeyFields: string; override;

  protected
    FIRecordSet: TOLEDBRecordSet;
    FICommand: TOLEDBCommand;

    FLockInitFieldDefs: boolean; //Used to prevent multiple calls to OLE DB Execute on FieldDefs.Update in DT generators

    FBeforeUpdateExecute: TMSUpdateExecuteEvent;
    FAfterUpdateExecute: TMSUpdateExecuteEvent;

    FIsAnyFieldDescCanBeModified: boolean;
    FTimestampField: TField;

    FOptions: TMSDataSetOptions;
    FCursorType: TMSCursorType;

    FCommandTimeout: integer;

    FIsInInitFieldDefs: boolean;
    FUseParamType: boolean;

    FCanOpenNext: boolean;

    FAutoRefreshTimer: TWin32Timer;
    
  {$IFNDEF STD}
    FChangeNotification: TMSChangeNotification;
    FNeedReflectChanges: boolean;
  {$ENDIF}

    procedure AutoRefreshTimer(Sender: TObject);
    
    function QuoteName(const AName: string): string; overload; override;
    function QuoteName(const AName: string; const LeftQuote, RightQuote: string): string; reintroduce; overload;

    function GetParams: TMSParams;
    procedure SetParams(Value: TMSParams);

    procedure CreateIRecordSet; override;
    procedure SetIRecordSet(Value: TData); override;
    procedure SetNumericType;

    procedure CreateCommand; override;

    function CreateOptions: TDADataSetOptions; override;
    procedure SetOptions(Value: TMSDataSetOptions);

    procedure AssignTo(Dest: TPersistent); override;

    procedure BeginConnection(NoConnectCheck: boolean = True); override;
    procedure EndConnection; override;

  {$IFNDEF STD}
    procedure SetChangeNotification(Value: TMSChangeNotification);
    procedure ReflectChanges(NotificationInfo: TMSNotificationInfo;
      NotificationSource: TMSNotificationSource; NotificationType: TMSNotificationType);
  {$ENDIF}
    
  { Open/Close }
    procedure SetActive(Value: Boolean); override;
    procedure DataReopen; override;
    procedure BeforeExecute; override;
    procedure InternalRefresh; override;
    procedure InternalRefreshQuick(const CheckDeleted: boolean); override;
    procedure InternalExecute; override;
    procedure InternalOpen; override;
    procedure InternalClose; override;
    procedure OpenCursor(InfoQuery: boolean); override;
    procedure CloseCursor; override;
    procedure GetFieldsInfo;
    function GetRecCount: longint; override;
    function GetRecordCount: integer; override;
    procedure DoCursorTypeChanged; // Callback from internal level. Called if CursorType or ReadOnly is changed on OLEDB execute
    procedure SetFetchAll(Value: boolean); override;
    procedure UpdateExecute(const StatementTypes: TStatementTypes); override;

    procedure CheckInactive; override;

  { Fields }
    procedure InitFieldDefs; override;
    procedure InternalInitFieldDefs; override;
    function GetFielDefSize(FieldType: TFieldType; FieldDesc: TFieldDesc): integer; override;
    function GetFieldType(DataType: word): TFieldType; override;
    function GetFieldType(FieldDesc: TFieldDesc): TFieldType; override;
    function GetFieldClass(FieldType: TFieldType): TFieldClass; override;
    procedure DataConvert(Field: TField; Source, Dest: TValueBuffer; ToNative: Boolean); override;
  {$IFDEF USE_FTAUTOINC}
    function GetFieldType(FieldDesc: TFieldDesc): TFieldType; override;
  {$ENDIF}
    procedure SetNumberRange(FieldDef: TFieldDef); override;
    procedure DetectIdentityField; override;

  { Edit }
    procedure CreateSQLGenerator; override;
    procedure SetReadOnly(Value: boolean); override;
    procedure InternalBeforeEdit; override;
    procedure GetKeyAndDataFields(
      out KeyAndDataFields: TKeyAndDataFields;
      const ForceUseAllKeyFields: boolean); override;

    procedure InternalRefreshRecord; override;
    procedure CheckUpdateQuery(const StatementType: TStatementType); override;
    function UseParamType: boolean; override; //This function indicates ParamType using in PerformSQL
    function PerformSQL(const SQL: string; const StatementTypes: TStatementTypes): boolean; override;
    function PerformLockSQL(SQL: string; StatementTypes: TStatementTypes): boolean;

    procedure InternalCreateProcCall(Name: string; NeedDescribe: boolean);
    
  { RefreshQuick}
    function IsRefreshQuickField(FieldDesc: TFieldDesc): boolean; override;
    procedure SaveMaxRefreshQuickValue(FieldDesc: TFieldDesc; const Value: variant); override;

    function GetCanModify: boolean; override;

    function GetRecord(Buffer: TRecordBuffer; GetMode: TGetMode; DoCheck: boolean): TGetResult; override;

    function NeedReturnParams: boolean; override;

    procedure AssignFieldValue(Param: TDAParam; Field: TField; Old: boolean); override;
   
  { Navigation }
    procedure InternalSetToRecord(Buffer: TRecordBuffer); override;

    procedure DoAfterExecute(Result: boolean); override;

  { Before / After UpdateExecute }
    function AssignedBeforeUpdateExecute: boolean; override;
    procedure DoBeforeUpdateExecute(Sender: TDataSet; StatementTypes: TStatementTypes;
      Params: TDAParams); override;
    function AssignedAfterUpdateExecute: boolean; override;
    procedure DoAfterUpdateExecute(Sender: TDataSet; StatementTypes: TStatementTypes;
      Params: TDAParams); override;

  { SQL Modifications }
    function SQLAddWhere(SQLText, Condition: string): string; override;
    function SQLDeleteWhere(SQLText: string): string; override;
    function SQLGetWhere(SQLText: string): string; override;
    function SQLSetOrderBy(SQLText: string; Fields: string): string; override;
    function SQLGetOrderBy(SQLText: string): string; override;

    procedure SetRefreshOptions(Value: TRefreshOptions); override;

  { XML }
    procedure WriteFieldXMLDataType(Field: TField; FieldDesc: TFieldDesc; const FieldAlias: string;
      XMLWriter: XMLTextWriter); override;
    procedure WriteFieldXMLAttributeType(Field: TField; FieldDesc: TFieldDesc; const FieldAlias: string;
      XMLWriter: XMLTextWriter); override;

  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;

  { Open/Close }
    function Fetched: boolean; override;
    procedure UnPrepare; override;
    function OpenNext: boolean; // Open next rowset in statement. if rowset not returne theh OpenNext return False. If statement has error, then raised exception
    procedure BreakExec;
    procedure RefreshQuick(const CheckDeleted: boolean);

    procedure LockTable(LockType: TMSLockType);
    procedure Lock(LockType: TMSLockType);
    
    function FindParam(const Value: string): TMSParam;
    function ParamByName(const Value: string): TMSParam;

  { Edit}
    procedure CreateProcCall(Name: string);

    procedure Post; override;
    procedure Cancel; override;
    
  { SQL Modify }
    property Connection: TCustomMSConnection read GetConnection write SetConnection;

    property Options: TMSDataSetOptions read FOptions write SetOptions;

  { Edit }
    property Params: TMSParams read GetParams write SetParams stored False;

    property CursorType: TMSCursorType read FCursorType write SetCursorType default ctDefaultResultSet;
    property CommandTimeout: integer read FCommandTimeout write SetCommandTimeout default 0;

    property BeforeUpdateExecute: TMSUpdateExecuteEvent read FBeforeUpdateExecute write FBeforeUpdateExecute;
    property AfterUpdateExecute: TMSUpdateExecuteEvent read FAfterUpdateExecute write FAfterUpdateExecute;
    property BeforeFetch;
    property AfterFetch;

    property FetchAll: boolean read FFetchAll write SetFetchAll default True;

    property UpdateObject: TMSUpdateSQL read GetUpdateObject write SetUpdateObject;

  {$IFNDEF STD}
    property ChangeNotification: TMSChangeNotification read FChangeNotification write SetChangeNotification;
  {$ENDIF}
  end;

{ TMSUpdateSQL }

  TMSUpdateSQL = class (TCustomDAUpdateSQL)
  protected
    function DataSetClass: TCustomDADataSetClass; override;
    function SQLClass: TCustomDASQLClass; override;
  end;

{ TMSQuery }

  TMSQuery = class (TCustomMSDataSet)
  protected
    procedure SetIRecordSet(Value: TData); override;

  published
    property SQLInsert;
    property SQLDelete;
    property SQLUpdate;
    property SQLRefresh;

    property Connection;
    property ParamCheck;
    property SQL;
    property Debug;
    property Macros;
    property Params;
    property FetchRows;
    property ReadOnly;
    property UniDirectional;
    property CachedUpdates;

    property AfterExecute;
    property BeforeUpdateExecute;
    property AfterUpdateExecute;
    property OnUpdateError;
    property OnUpdateRecord;

    property UpdateObject;
    property RefreshOptions;

    property AutoCalcFields;
    property Filtered;
    property Filter;
    property FilterOptions;

    property BeforeOpen;
    property AfterOpen;
    property BeforeClose;
    property AfterClose;
    property BeforeInsert;
    property AfterInsert;
    property BeforeEdit;
    property AfterEdit;
    property BeforePost;
    property AfterPost;
    property BeforeCancel;
    property AfterCancel;
    property BeforeDelete;
    property AfterDelete;
    property BeforeScroll;
    property AfterScroll;
    property OnCalcFields;
    property OnDeleteError;
    property OnEditError;
    property OnFilterRecord;
    property OnNewRecord;
    property OnPostError;
  {$IFNDEF VER4}
    property AfterRefresh;
    property BeforeRefresh;
  {$ENDIF}

    property Options;
    property FilterSQL;
  {$IFNDEF STD}
    property ChangeNotification;
  {$ENDIF}

    property MasterSource;
    property MasterFields;
    property DetailFields;

    property UpdatingTable;

    property FetchAll;
    property CursorType;
    property CommandTimeout;

    property IndexFieldNames;
    property Active; /// CR DAC 13049
    property BeforeFetch;
    property AfterFetch;  
  end;

{ TMSTable }

  TCustomMSTable = class (TCustomMSDataSet)
  protected
  { IProviderSupport }
    function PSGetTableName: string; override;
    procedure PSSetParams(AParams: DB.TParams); override;
  {$IFDEF VER5P}
    procedure PSSetCommandText(const CommandText: string); override;
  {$ENDIF}

  protected
    FTableName: string;
    FOrderFields: string;

    procedure SetTableName(const Value: string);

    procedure SetOrderFields(Value: string);
    procedure AssignTo(Dest: TPersistent); override;
    function SQLAutoGenerated: boolean; override;

  { Open/Close }
    procedure OpenCursor(InfoQuery: boolean); override;

  public
  { Open/Close }
    procedure Prepare; override;
    procedure PrepareSQL;
    procedure Execute; override;

    property TableName: string read FTableName write SetTableName;
    property OrderFields: string read FOrderFields write SetOrderFields;
  end;
  
  TMSTable = class (TCustomMSTable)
  published
    property TableName;
    property OrderFields;
    property MasterFields;
    property DetailFields;
    property MasterSource;
    property ReadOnly;

    property Connection;

    property Debug;
    property FetchRows;
    property UniDirectional;
    property CachedUpdates;

    property OnUpdateError;
    property OnUpdateRecord;

    property UpdateObject;
    property RefreshOptions;

    property Active;
    property AutoCalcFields;
    property Filtered;
    property Filter;
    property FilterOptions;

    property BeforeOpen;
    property AfterOpen;
    property BeforeClose;
    property AfterClose;
    property BeforeInsert;
    property AfterInsert;
    property BeforeEdit;
    property AfterEdit;
    property BeforePost;
    property AfterPost;
    property BeforeCancel;
    property AfterCancel;
    property BeforeDelete;
    property AfterDelete;
    property BeforeScroll;
    property AfterScroll;
    property OnCalcFields;
    property OnDeleteError;
    property OnEditError;
    property OnFilterRecord;
    property OnNewRecord;
    property OnPostError;
  {$IFNDEF VER4}
    property AfterRefresh;
    property BeforeRefresh;
  {$ENDIF}
    property Options;
    property FilterSQL;

    property FetchAll;
    property CursorType;
    property CommandTimeout;

    property IndexFieldNames;
    
    property BeforeFetch;
    property AfterFetch;  
  end;
  
{ TMSStoredProc }

  TCustomMSStoredProc = class (TCustomMSDataSet)
  protected
  { IProviderSupport }
  {$IFDEF VER5P}
    procedure PSSetCommandText(const CommandText: string); override;
  {$ENDIF}

  protected
    FStoredProcName: string;
    FIsInPrepare: boolean;

    procedure SetIRecordSet(Value: TData); override;
    procedure SetStoredProcName(const Value: string);
    procedure AssignTo(Dest: TPersistent); override;

    function SQLAutoGenerated: boolean; override;
    procedure BeforeOpenCursor(InfoQuery: boolean); override;
    procedure BeforeExecute; override;
    procedure CreateFieldDefs; override;

  public
    procedure ExecProc; // for BDE compatibility
    
    procedure Prepare; override;
    procedure PrepareSQL; 

    property UpdatingTable;
    property StoredProcName: string read FStoredProcName write SetStoredProcName;
  end;

  TMSStoredProc = class(TCustomMSStoredProc)
  published
    property StoredProcName;

    property SQLInsert;
    property SQLDelete;
    property SQLUpdate;
    property SQLRefresh;

    property Connection;
    property ParamCheck stored False;
    property SQL;
    property Debug;
    property Params;
    property FetchRows;
    property ReadOnly;
    property UniDirectional;
    property CachedUpdates;

    property AfterExecute;
    property BeforeUpdateExecute;
    property AfterUpdateExecute;
    property OnUpdateError;
    property OnUpdateRecord;

    property Options;
    property UpdateObject;
    property RefreshOptions;
  {$IFNDEF STD}
    property ChangeNotification;
  {$ENDIF}

    property Active;
    property AutoCalcFields;
    property Filtered;
    property Filter;
    property FilterOptions;
    property BeforeOpen;
    property AfterOpen;
    property BeforeClose;
    property AfterClose;
    property BeforeInsert;
    property AfterInsert;
    property BeforeEdit;
    property AfterEdit;
    property BeforePost;
    property AfterPost;
    property BeforeCancel;
    property AfterCancel;
    property BeforeDelete;
    property AfterDelete;
    property BeforeScroll;
    property AfterScroll;
    property OnCalcFields;
    property OnDeleteError;
    property OnEditError;
    property OnFilterRecord;
    property OnNewRecord;
    property OnPostError;
  {$IFNDEF VER4}
    property AfterRefresh;
    property BeforeRefresh;
  {$ENDIF}

    property UpdatingTable;

    property FetchAll;
    property CursorType;
    property CommandTimeout;
  end;
  
{ TMSSQL }

  TMSSQL = class (TCustomDASQL)
  private
    function GetConnection: TCustomMSConnection;
    procedure SetConnection(Value: TCustomMSConnection);

    function GetParams: TMSParams;
    procedure SetParams(Value: TMSParams);

  protected
    FICommand: TOLEDBCommand;
    FCommandTimeout: integer;
    FNonBlocking: boolean;

    function GetPermitPrepare: boolean;
    procedure SetPermitPrepare(Value: boolean);

    procedure CreateICommand; override;
    procedure SetICommand(Value: TCRCommand); override;
    procedure InternalPrepare; override;
    procedure InternalExecute(Iters: integer); override;
    procedure AssignTo(Dest: TPersistent); override;

    function ParseSQL(const SQL: string; Params: TDAParams; RenamePrefix: string = ''): string; override;
    function CreateParser(const Text: string): TParser; override;
    procedure AssembleSQL; override;
    function CreateParamsObject: TDAParams; override;
    procedure CreateParams; override;
    procedure WriteParams(WriteValue: boolean = True); override;
    procedure ReadParams; override;

    procedure SetCommandTimeout(const Value: integer);
    procedure SetNonBlocking(const Value: boolean);
  public
    constructor Create(Owner: TComponent); override;
    procedure Execute(Iters: integer); override;
    procedure BreakExec;
    procedure UnPrepare; override;
    procedure ExecuteForXML(out XML: string); overload;

  {$IFNDEF BCB}
    procedure ExecuteForXML(out XML: UTF8String); overload;
  {$ENDIF}
  {$IFNDEF CLR}
  {$IFDEF VER6P}
    procedure ExecuteForXML(out XML: WideString); overload;
  {$ENDIF}
  {$ENDIF}
    procedure ExecuteForXML(Stream: TStream; OutputEncoding: TOLEDBOutputEncoding); overload;

    procedure CreateProcCall(Name: string);
  published
    function FindParam(const Value: string): TMSParam;
    function ParamByName(const Value: string): TMSParam;

    property Connection: TCustomMSConnection read GetConnection write SetConnection;
    property Params: TMSParams read GetParams write SetParams stored False;

    property ParamCheck;
    property SQL;
    property Macros;
    property Debug;

    property AfterExecute;
    property CommandTimeout: integer read FCommandTimeout write SetCommandTimeout;
    property NonBlocking: boolean read FNonBlocking write SetNonBlocking default False;

    property PermitPrepare: boolean write SetPermitPrepare stored False;

  end;

{ TMSMetadata }

  TMSObjectType = (otDatabases, 
    otColumnPrivileges, otColumns, 
    otForeignKeys, otPrimaryKeys, 
    otIndexes,
    otServerTypes,
    otSchemata, otStatistics,
    otStoredProcs, otStoredProcParams, 
    otAliases, otTables, otSynonyms, otSystemTables, otViews, otGlobalTempTables, otLocalTempTables, otSystemViews, 
    otAliasesInfo, otTablesInfo, otSynonymsInfo, otSystemTablesInfo, otViewsInfo, otGlobalTempTablesInfo, otLocalTempTablesInfo, otExternalTablesInfo, otSystemViewsInfo, 
    otTableConstraints, otTablePrivileges,
    otLinkedServers,
    otAssemblies,
    otAssemblyDependencies,
    otUserTypes,
    otXMLCollections,
    otCheckConstraints,
    otCheckConstraintsByTable,
    otTableStatistics);

  TMSMetadata = class (TCustomMSDataSet)
  protected
    FObjectType: TMSObjectType;

    FDatabaseName: string;
    FSchemaName: string;
    FTableName: string;
    FStoredProcName: string;
    FColumnName: string;
    FIndexName: string;
    FConstraintName: string;
    FLinkedServer: string;
    FAssemblyName: string;
    FAssemblyID: integer;
    FReferencedAssemblyID: integer;
    FUDTName: string;
    FSchemaCollectionName: string;
    FTargetNamespaceURI: string;
    FStatisticsName: string;

    procedure SetDatabaseName(Value: string);
    procedure SetSchemaName(Value: string);
    procedure SetObjectType(Value: TMSObjectType);
    procedure SetTableName(Value: string);
    procedure SetStoredProcName(Value: string);
    procedure SetColumnName(Value: string);
    procedure SetIndexName(Value: string);
    procedure SetConstraintName(Value: string);
    procedure SetLinkedServer(Value: string);
    procedure SetAssemblyName(Value: string);
    procedure SetAssemblyID(Value: integer);
    procedure SetReferencedAssemblyID(Value: integer);
    procedure SetUDTName(Value: string);
    procedure SetSchemaCollectionName(Value: string);
    procedure SetTargetNamespaceURI(Value: string);
    procedure SetStatisticsName(Value: string);

    function RequestIRowset: IRowset;
    procedure InternalExecute; override;
    procedure OpenCursor(InfoQuery: boolean); override;

  public
    constructor Create(Owner: TComponent); override;

  published
    property ObjectType: TMSObjectType read FObjectType write SetObjectType default otDatabases;

    property DatabaseName: string read FDatabaseName write SetDatabaseName;
    property SchemaName: string read FSchemaName write SetSchemaName;
    property TableName: string read FTableName write SetTableName;
    property StoredProcName: string read FStoredProcName write SetStoredProcName;
    property ColumnName: string read FColumnName write SetColumnName;
    property IndexName: string read FIndexName write SetIndexName;
    property ConstraintName: string read FConstraintName write SetConstraintName;

    property LinkedServer: string read FLinkedServer write SetLinkedServer;
    property AssemblyName: string read FAssemblyName write SetAssemblyName;
    property AssemblyID: integer read FAssemblyID write SetAssemblyID default 0;
    property ReferencedAssemblyID: integer read FReferencedAssemblyID write SetReferencedAssemblyID default 0;
    property UDTName: string read FUDTName write SetUDTName;
    property SchemaCollectionName: string read FSchemaCollectionName write SetSchemaCollectionName;
    property TargetNamespaceURI: string read FTargetNamespaceURI write SetTargetNamespaceURI;
    property StatisticsName: string read FStatisticsName write SetStatisticsName;

    property Active;
    property Connection;
  end;

{ TMSXMLField }

  TMSSchemaCollection = record
    Name: string;
    CatalogName: string;
    SchemaName: string;
  end;

  TMSXMLField = class(TField)
  protected
    FTyped: boolean;
    FSchemaCollection: TMSSchemaCollection;
    procedure GetText(var Text: string; DisplayText: Boolean); override;
    procedure SetSchemaCollection(Name, CatalogName, SchemaName: string);

    function GetBlobSize: Integer; 
    // function GetModified: Boolean;
    // procedure SetModified(Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;

    // Copied from TBlobField
    // procedure Assign(Source: TPersistent); override;
    procedure Clear; override;
    class function IsBlob: Boolean; override;
    procedure LoadFromFile(const FileName: string);
    procedure LoadFromStream(Stream: TStream);
    procedure SaveToFile(const FileName: string);
    procedure SaveToStream(Stream: TStream);
    procedure SetFieldType(Value: TFieldType); override;
    property BlobSize: Integer read GetBlobSize;
    // property Modified: Boolean read GetModified write SetModified;
    property Value: string read GetAsString write SetAsString;

    property XML: string read GetAsString write SetAsString;
    property Typed: boolean read FTyped;
    property SchemaCollection: TMSSchemaCollection read FSchemaCollection;
  published
    // property Transliterate: Boolean read FTransliterate write FTransliterate default True;
    // property Size default 0;
  end;

{ TMSUDTField }

  TMSUDTField = class(TVarBytesField)
  private
    FUDTSchemaname: WideString;
    FUDTName: WideString;
    FUDTCatalogname: WideString;
    FAssemblyTypename: WideString;
  {$IFNDEF CLR}
    FUDTDispatcher: TUDTDispatcher;
  {$ENDIF}
  protected
  {$IFNDEF CLR}
    function GetClassDesc: string; override;
    function GetAsUDT: Variant;
    procedure RetrieveUDTData;
    procedure AfterInvoke(Sender: TObject);
  {$ENDIF}
    procedure SetUDTTypeInfo(AUDTSchemaname, AUDTName, AUDTCatalogname,
      AAssemblyTypename: string{$IFNDEF CLR}; AUDTDispatcher: TUDTDispatcher{$ENDIF});
    procedure SetFieldDataType(Value: TFieldType);
  public
    constructor Create(AOwner: TComponent); override;
  {$IFNDEF CLR}
    property AsUDT: Variant read GetAsUDT;
  {$ENDIF}
    property UDTSchemaname: WideString read FUDTSchemaname;
    property UDTName: WideString read FUDTName;
    property UDTCatalogname: WideString read FUDTCatalogname;
    property AssemblyTypename: WideString read FAssemblyTypename;
  end;

{ TMSDataSource }

  TMSDataSource = class(TCRDataSource)
  end;

  TMSAccessUtils = class
  public
    class procedure GetKeyAndDataFields(
      Obj: TCustomMSDataSet;
      out KeyAndDataFields: TKeyAndDataFields;
      const ForceUseAllKeyFields: boolean);
    class procedure SetDesigning(Obj: TCustomMSDataSet; Value: Boolean; SetChildren: Boolean = True);
    class procedure SetLockLoginPromt(Obj: TCustomMSConnection; Value: Boolean);

    class function FIConnection(Obj: TCustomMSConnection): TOLEDBConnection;
    class function FIRecordSet(Obj: TCustomMSDataSet): TOLEDBRecordSet;

    class function GetOLEDBSQL(Obj: TCustomMSDataSet): string; overload;
    class function GetOLEDBSQL(Obj: TMSSQL): string; overload;

    class function FIDBCreateSession(Obj: TOLEDBConnection): IDBCreateSession;

    class procedure DoError(Obj: TCustomMSConnection; E: Exception; var Fail: boolean);
  end;

  procedure GetServerList(List: TStrings);
  procedure GetDatabasesList(const Connection: TCustomMSConnection; List: TStrings);
  procedure GetTablesList(const Connection: TCustomMSConnection; List: TStrings);

  function IsLargeDataTypeUsed(const Field: TField): boolean; overload;

  function TableNamesFromList(List: TStrings): string;
  procedure TableNamesToList(Value: string; List: TStrings);

var
  DefConnectDialogClassProc: function: TClass = nil;
  CurrentProjectOutputDir: string;
  __UseUpdateOptimization: boolean;


implementation

uses
{$IFDEF CLR}
  System.Runtime.InteropServices, System.Reflection,
{$ENDIF}
{$IFDEF VER7P}
  StrUtils,
{$ENDIF}
{$IFDEF VER6P}
{$IFNDEF CLR}
  Variants, VarUtils,
{$ENDIF}
{$ENDIF}
  DBCommon, DBConsts, MSParser, Registry, ActiveX, MSSQLMonitor, Math, DBMonitorIntf,
{$IFNDEF STD}
  MSServiceBroker,
{$ENDIF}
  Messages, ComObj;


{$IFNDEF STD}
const
  sNotificationService = 'SDAC_NS_';
  sNotificationContract = 'http://schemas.microsoft.com/SQL/Notifications/PostQueryNotification';

type
  TMSNotificationParser = class
  private
    FNotificationInfo: TMSNotificationInfo;
    FNotificationSource: TMSNotificationSource;
    FNotificationType: TMSNotificationType;
    FKey: string;
  public
    constructor Create;

    procedure ProcessMessage(Message: {$IFDEF CLR}TBytes{$ELSE}WideString{$ENDIF});
    property NotificationInfo: TMSNotificationInfo read FNotificationInfo;
    property NotificationSource: TMSNotificationSource read FNotificationSource;
    property NotificationType: TMSNotificationType read FNotificationType;
    property Key: string read FKey;
  end;
{$ENDIF}

{$IFNDEF VER6P}
const
  varShortInt = $0010; { vt_i1          }
  varWord     = $0012; { vt_ui2         }
  varLongWord = $0013; { vt_ui4         }
  varInt64    = $0014; { vt_i8          }
{$ENDIF}

function IsLargeDataTypeUsed(const Field: TField): boolean; overload;
begin
  Result :=
    (Field is TBlobField) or
    ((Field is TMemoField) and (TMemoField(Field).BlobSize > MaxNonBlobFieldLen));
end;

function IsLargeDataTypeUsed(const Param: TParam): boolean; overload;
begin
  Result :=
       (Param.DataType = ftBlob)
    or (Param.DataType = ftMemo)
  {$IFDEF VER10P}
    or (Param.DataType = ftWideMemo)
  {$ENDIF};
end;

function TableNamesFromList(List: TStrings): string;
var
  i: integer;
begin
  for i := 0 to List.Count - 1 do
    if i = 0 then
      Result := BracketIfNeed(List[i])
    else
      Result := Result + ', ' + BracketIfNeed(List[i]);
end;

procedure TableNamesToList(Value: string; List: TStrings);
var
  St: string;
  i: integer;
begin
  Value := Trim(Value);
  List.Clear;

  St := '';
  for i := 1 to Length(Value) do
    if (Value[i] = ',') or (Value[i] = ';') then begin
      St := UnbracketIfPossible(Trim(St));
      if St <> '' then
        List.Add(St);
      St := '';
    end
    else
      St := St + Value[i];

  St := UnbracketIfPossible(Trim(St));
  if St <> '' then
    List.Add(St);
end;

function GetFieldType(DataType: word): TFieldType;
begin
  case DataType of
    dtInt64:
      Result := ftLargeInt;
    dtWord:
      Result := ftWord;
    dtBoolean:
      Result := ftBoolean;
    dtCurrency:
      Result := ftCurrency;
    dtBytes:
      Result := ftBytes;
    dtVarBytes:
      Result := ftVarBytes;
    dtMSXML:
      Result := TFieldType(ftMSXML);
  {$IFDEF VER5P}
{    dtVariant:
      Result := ftVariant;}
{    dtIUnknown:
      Result := ftInterface;}
  {$ENDIF}
  else
    Result := MemDS.GetFieldType(DataType);
  end;
end;

function GetDataType(FieldType: TFieldType): word;
begin
  if Integer(FieldType) = ftMSXML then
    Result := dtMSXML
  else
  if Integer(FieldType) = ftMSUDT then
    Result := dtVarBytes
  else
    Result := MemDS.GetDataType(FieldType);
end;

function SetWhere(SQL: string; Condition: string): string;
begin
  Result := _SetWhere(SQL, Condition, TMSParser, True, lxSELECT, lxWHERE);
end;

function AddWhere(SQL: string; Condition: string): string;
begin
  Result := _AddWhere(SQL, Condition, TMSParser, False, lxSELECT, lxWHERE);
end;

function DeleteWhere(SQL: string): string;
begin
  Result := SetWhere(SQL, '');
end;

function GetWhere(SQL: string): string;
begin
  Result := _GetWhere(SQL, TMSParser, False, lxSELECT, lxWHERE);
end;

function SetOrderBy(SQL: string; Fields: string): string;
begin
  Result := _SetOrderBy(SQL, Fields, TMSParser, lxSELECT, lxORDER, lxBY);
end;

function GetOrderBy(SQL: string): string;
begin
  Result := _GetOrderBy(SQL, TMSParser, lxSELECT, lxORDER, lxBY);
end;

procedure GetServerList(List: TStrings);
  procedure GetServerListByReg;
  var
    Reg: TRegistry;
    i: integer;
    Value: string;
    sl: tstringlist;
  begin
    Reg := TRegistry.Create;
    sl := TStringList.Create;
    try
      Reg.RootKey := HKEY_Local_Machine;
      if Reg.OpenKeyReadOnly('SOFTWARE\Microsoft\MSSQLServer\Client\ConnectTo') then begin
        Reg.GetValueNames(sl);

        // Delete non-server occurences
        for i := sl.Count - 1 downto 0 do begin
          Value := Reg.ReadString(sl[i]);
          if Pos(',', Value) = 0 then
            sl.Delete(i);
        end;

        sl.Sort;
        List.AddStrings(sl);
      end;
    finally
      Reg.Free;
      sl.Free;
    end;
  end;

  procedure GetServerListByOleDBEnum;
  var
    SourcesRowset: ISourcesRowset;
    Rowset: IRowset;
    ds: TCustomMSDataset;
    iu: IUnknown;
  begin
    if CoCreateInstance(CLSID_SQLOLEDB_ENUMERATOR, 
                                 nil,
                                 CLSCTX_INPROC_SERVER, 
                                 IID_ISourcesRowset, 
                                 SourcesRowset) <> S_OK then
      Exit;
        
    if SourcesRowset.GetSourcesRowset(nil, IID_IRowset, 0, nil, iu) <> S_OK then
      Exit;

    Rowset := IRowset(iu);
    ds := TCustomMSDataSet.Create(nil);
    try
      TDBAccessUtils.SetLockDebug(ds, True); // To prevent AV on TCustomDADataSet.OpenCursor -> UsedConnection.SQLMonitorClass
      ds.FIRecordSet.SetIRowset(Rowset, False);
      ds.Open;

      while not ds.Eof do begin
        List.Add(ds.Fields[0].AsString);
        ds.Next;
      end;
    finally
      ds.Free;
    end;
  end;

begin
  List.Clear;
  GetServerListByOleDBEnum;
  GetServerListByReg;
end;

procedure GetDatabasesList(const Connection: TCustomMSConnection; List: TStrings);
begin
  if Connection = nil then
    Exit;

  Connection.GetDatabaseNames(List);
end;

procedure GetTablesList(const Connection: TCustomMSConnection; List: TStrings);
begin
  if Connection = nil then
    Exit;

  Connection.GetTableNames(List);
end;

{ TMSParam }

constructor TMSParam.Create(Collection: TCollection);
begin
  inherited Create(Collection);

  Bound := True;
end;

procedure TMSParam.SetAsString(Value: string);
begin
  if not ((DataType in [ftBytes, ftVarBytes]) or (DataType = TFieldType(ftMSUDT))) then
    inherited
  else
    Self.Value := Value;
end;

procedure TMSParam.SetAsWideString(Value: WideString);
begin
  if not ((DataType in [ftBytes, ftVarBytes]) or (DataType = TFieldType(ftMSUDT))) then
    inherited
  else
    Self.Value := Value;
end;

function TMSParam.GetSize: integer;
begin
  if (DataType in FieldTypesWithSize) or (DataType = TFieldType(ftMSUDT)) then begin
    if inherited GetSize > 0 then
      Result := inherited GetSize
    else
      if ((DataType in [ftBytes, ftVarBytes]) or (DataType = TFieldType(ftMSUDT))) and VarIsArray(Value) then
      {$IFDEF CLR}
        Result := VarArrayHighBound(Value, 1) - VarArrayLowBound(Value, 1) + 1
      {$ELSE}
        Result := TVarData(Value).VArray.Bounds[0].ElementCount
      {$ENDIF}
      else
      Result := Length(GetAsString);
  end
  else
    Result := 0;
end;

procedure TMSParam.SetSize(Value: integer);
begin
  if (DataType in FieldTypesWithSize) or (DataType = TFieldType(ftMSUDT)) then
    inherited;
end;

procedure TMSParam.SetAsVariant(const Value: Variant);
var
  l, lold: integer;
begin
  inherited;
  if ((DataType in FieldTypesWithSize) or (DataType = TFieldType(ftMSUDT))) and not (VarIsNull(Value) or VarIsEmpty(Value)) then begin
    lold := inherited GetSize;
    if lold > 0 then begin
    {$IFDEF CLR}
      if VarType(Value) = varArray + varByte then
        l := Length(TBytes(Value))
      else
    {$ENDIF}
        l := Length(Value);
      if l > lold then
        inherited SetSize(l);
    end;
  end;
  Bound := True;
end;

procedure TMSParam.CreateObject;
begin
  Assert(FParamObject = nil);
  if (DataType in [ftBlob, ftMemo{$IFDEF VER10P}, ftWideMemo{$ENDIF}]) or (DataType = TFieldType(ftMSXML)) then
  {$IFDEF HAVE_COMPRESS}
    FParamObject := TCompressedBlob.Create;
  {$ELSE}
    FParamObject := {$IFDEF CLR}CoreLab.Dac.MemData.{$ENDIF}TBlob.Create;
  {$ENDIF}
end;

function TMSParam.IsObjectDataType: boolean;
begin
  Result := inherited IsObjectDataType;
end;

procedure TMSParam.AssignFieldValue(Field: TField; const Value: Variant);
var
  FieldDesc: TOLEDBFieldDesc;
begin
  inherited AssignFieldValue(Field, Value);

  if IsClass(Field.DataSet, TCustomMSDataSet) then begin
    FieldDesc := TOLEDBFieldDesc(TCustomDADataSet(Field.DataSet).GetFieldDesc(Field));
    OLEDBType := FieldDesc.OLEDBType;
  end;
end;

{ TMSParams }

constructor TMSParams.Create(Owner: TPersistent);
begin
  inherited Create(TMSParam);

  FOwner := Owner;
  FNeedsUpdateItem := True;  
end;

procedure TMSParams.Assign(Source: TPersistent); 
var
  i: integer;
begin
  inherited;

  if Source is TMSParams then
    for i := 0 to Count - 1 do
      TMSParams(Source)[i].Assign(Items[i]);
end;
    
function TMSParams.GetItem(Index: Integer): TMSParam;
begin
  Result := inherited Items[Index] as TMSParam;
end;

procedure TMSParams.SetItem(Index: Integer; Value: TMSParam);
begin
  inherited SetItem(Index, Value);
end;

function TMSParams.ParamByName(const Value: string): TMSParam;
begin
  Result := TMSParam(inherited ParamByName(GetParamNameWODog(Value)));
end;

function TMSParams.FindParam(const Value: string): TMSParam;
begin
  Result := TMSParam(inherited FindParam(GetParamNameWODog(Value)));
end;

{ TMSConnectionOptions }

procedure TCustomMSConnectionOptions.AssignTo(Dest: TPersistent);
begin
  inherited;

  if Dest is TCustomMSConnectionOptions then begin
    TCustomMSConnectionOptions(Dest).QuotedIdentifier := QuotedIdentifier;
    TCustomMSConnectionOptions(Dest).Encrypt := Encrypt;
    TCustomMSConnectionOptions(Dest).Provider := Provider;
  end;
end;

constructor TCustomMSConnectionOptions.Create(Owner: TCustomMSConnection);
begin
  inherited Create(Owner);
  
  FQuotedIdentifier := True;
  FProvider := prAuto;
end;

procedure TCustomMSConnectionOptions.SetEncrypt(const Value: boolean);
begin
  if FEncrypt <> Value then begin
    TCustomMSConnection(FOwner).CheckInactive;
    FEncrypt := Value;
    if TCustomMSConnection(FOwner).IConnection <> nil then
      TCustomMSConnection(FOwner).IConnection.SetProp(prEncrypt, Value);
  end;
end;

procedure TCustomMSConnectionOptions.SetProvider(const Value: TOLEDBProvider);
begin
  if FProvider <> Value then begin
    TCustomMSConnection(FOwner).CheckInactive;
    FProvider := Value;
    if TCustomMSConnection(FOwner).IConnection <> nil then
      TCustomMSConnection(FOwner).IConnection.SetProp(prProvider, Integer(Value));
  end;
end;

procedure TCustomMSConnectionOptions.SetNumericType(Value: TDANumericType);
begin
  if FNumericType <> Value then begin
    TCustomMSConnection(FOwner).CheckInactive;
    FNumericType := Value;
  end;
end;

procedure TCustomMSConnectionOptions.SetQuotedIdentifier(const Value: boolean);
begin
  if FQuotedIdentifier <> Value then begin
    // CheckInactive is not need

    FQuotedIdentifier := Value;
    if TCustomMSConnection(FOwner).IConnection <> nil then
      TCustomMSConnection(FOwner).IConnection.SetProp(prQuotedIdentifier, Value);
  end;
end;

{ TCustomMSConnection }

constructor TCustomMSConnection.Create(Owner: TComponent);
begin
  inherited;

  FLockLoginPrompt := False;

  Database := '';
  IsolationLevel := ilReadCommitted;

  FOptions := inherited Options as TCustomMSConnectionOptions;
end;

destructor TCustomMSConnection.Destroy;
begin
  FMSSQL.Free;

  inherited;
end;

function TCustomMSConnection.CreateOptions: TDAConnectionOptions;
begin
  Result := TCustomMSConnectionOptions.Create(Self);
end;

function TCustomMSConnection.IConnection: TOLEDBConnection;
begin
  Result := TOLEDBConnection(FIConnection);
end;

function TCustomMSConnection.IsCaseSensitive: boolean;
begin
  Result := False;
end;

procedure TCustomMSConnection.Check(const Status: HRESULT; Sender: TObject);
begin
  Assert(FIConnection <> nil);
  TOLEDBConnection(FIConnection).Check(Status, Sender);
end;

procedure TCustomMSConnection.CheckInactive;
begin
  if Connected then
    if ([csUpdating, csDesigning] * ComponentState) <> [] then
      Close
    else
      DatabaseError(SConnectionOpen, Self);
end;

procedure TCustomMSConnection.InternalStartTransaction;
begin
  inherited;
  
  if {Assigned(OnConnectionLost) and}
    ((TOLEDBCOnnection(FIConnection).DBMSPrimaryVer <= 8) or (TOLEDBCOnnection(FIConnection).ProviderPrimaryVer <= 8))and
    not (Options.Provider = prCompact) then begin
    FTransactionID := '';
    ExecSQL(SCheckConnection, []);
  end;
  FTransactionID := 'Local';
end;


procedure TCustomMSConnection.DoConnect;
var
  Database: variant;
begin
  inherited;

  if FDatabase = '' then begin
    FIConnection.GetProp(prDatabase, Database);
    FDatabase := String(Database);
  end;
end;


function TCustomMSConnection.CommitOnDisconnect: boolean;
begin
  Result := False;
end;

procedure TCustomMSConnection.AddConnectStringParam(var Result: string; const ParamName: string;
  const Value: string; const DefValue: string);
begin
  if Value <> DefValue then begin
    if Result <> '' then
      Result := Result + ';';
    Result := Result + ParamName + '=' + Value;
  end;
end;

function TCustomMSConnection.GetConnectString: string;
begin
  Result := '';

  /// list of supported parameters must be syncronized with SetConnectString (ProcessParam and set param to default)
  if Options.FProvider <> prAuto then
    AddConnectStringParam(Result, 'Provider', GetProviderName(Options.FProvider), '');
  AddConnectStringParam(Result, 'User ID', UserName, '');
  AddConnectStringParam(Result, 'Password', Password, '');
  if Options.Provider <> prCompact then begin
    AddConnectStringParam(Result, 'Data Source', Server, '');
    AddConnectStringParam(Result, 'Initial Catalog', Database, '');
  end
  else
    AddConnectStringParam(Result, 'Data Source', '"' + Database + '"', '');
  AddConnectStringParam(Result, 'Use Encryption for Data', BoolToStr(Options.Encrypt, True), 'False');
end;

function TCustomMSConnection.RecognizedParameter(const Args: array of string; const paramName: string): boolean;
var
  i: integer;
begin
  Result := False;
  for i := 0 to Length(Args) - 1 do begin
    Result := SameText(paramName, Args[i]);
    if Result then
      Break;
  end;
end;

procedure TCustomMSConnection.ProcessConnectStringParam(const paramName, paramValue: string);
var
  s: string;
begin
  /// list of supported parameters must be syncronized with GetConnectString and dbxsda.ParseIniString
  if RecognizedParameter(['Provider'], paramName) then begin
    s := UpperCase(paramValue);
    if (s <> SProviderSQLOLEDB) and (s <> SProviderNativeClient) and (s <> SProviderCompact) then
      raise Exception.CreateFmt(SBadParamValue, [paramName, paramValue]);
    Options.Provider := GetProvider(s);
  end
  else
  if RecognizedParameter(['User ID', 'UID', 'Username'], paramName) then
    UserName := paramValue
  else
  if RecognizedParameter(['Password', 'PWD'], paramName) then
    Password := paramValue
  else
  if RecognizedParameter(['Data Source', 'Server'], paramName) then begin
    if Options.Provider <> prCompact then
      Server := paramValue
    else
      Database := paramValue;
  end
  else
  if RecognizedParameter(['Initial Catalog', 'Database'], paramName) then
    Database := paramValue
  else
  if RecognizedParameter(['Use Encryption for Data', 'Encryption', 'Encrypt'], paramName) then
    Options.Encrypt := {$IFDEF VER6}MemUtils.{$ENDIF}StrToBool(paramValue)
  else
  if RecognizedParameter([
    'Persist Security Info',
    'Use Procedure for Prepare',
    'Asynchronous Connection',
    'Client Failover',
    'Tag with column collation when possible'], paramName) then
    // ignored
  else
    raise Exception.CreateFmt(SParamNameUnknown, [paramName]);
end;

procedure TCustomMSConnection.InitConnectStringOptions;
begin
  UserName := '';
  Password := '';
  Server := '';
  Database := '';
  // bug in editor - ConnectionTimeout is not returned;
  // ConnectionTimeout := DefaultConnectionTimeout;
  Options.Encrypt := False;
  Options.Provider := prAuto;
end;

procedure TCustomMSConnection.SetConnectString(Value: string);

  procedure ParseIniString;
  var
    i, l: integer;
    cs: string;
    inString, inValue, allowSpaces: boolean;
    newIndex, startIndex: integer;
    paramName, paramValue: string;
    csLength: integer;

  begin
    cs := Trim(Value);

    // parse connection string
    startIndex := 1;
    paramName := '';
    paramValue := '';

    csLength := Length(cs);

    while startIndex < csLength do begin
      // look for param name
      newIndex := PosEx('=', cs, startIndex);
      if newIndex > 0 then begin
        paramName := Trim(Copy(cs, startIndex, newIndex - startIndex));
        if paramName = '' then
          raise Exception.Create(SParamNameMissing);
      end;

      // look for param value
      inString := False;
      inValue := False;     // Shows that we are parsing non-quoted value. Must be single word.
      allowSpaces := True;  // Brought in to avoid two-word non-quoted values.

      for i := newIndex + 1 to csLength do begin
        if cs[i] = '"' then
          inString := not inString
        else
          if not inString then begin
            if cs[i] = ';' then begin
              paramValue := Trim(Copy(cs, newIndex + 1, i - newIndex - 1));
              break;
            end
            else
              if cs[i] <= ' ' then begin
                if inValue then
                // no more spaces are allowed
                  allowSpaces := False;
              end
            else
              // check whether char is valid for non-quoted param value
              case cs[i] of
                '!'..'/', '\', '_', '@', '0'..'9', 'a'..'z', 'A'..'Z':
                begin
                  inValue := True;
                  if not allowSpaces then
                    raise Exception.Create(SInvalidChar);
                end
                else
                  raise Exception.Create(SInvalidChar);
              end;
          end;

        if i = csLength then
          paramValue := Trim(Copy(cs, newIndex + 1, i - newIndex));
      end;

      if paramValue = '' then
        raise Exception.Create(SParamValueMissing);

      l := Length(paramValue);
      if (l >= 2) and (paramValue[1] = '"') and (paramValue[l] = '"') then
        paramValue := Trim(Copy(paramValue, 2, l - 2));

      ProcessConnectStringParam(paramName, paramValue);

      startIndex := i + 1;
    end;
  end;

var
  OldCS: string;

begin
  OldCS := ConnectString;
  try
    InitConnectStringOptions;
    ParseIniString;
  except
    ConnectString := OldCS;
    raise;
  end;
end;
  
procedure TCustomMSConnection.CreateIConnection;
var
  CRConnection: TCRConnection;
begin
  if FIConnection <> nil then
    Exit;

  CRConnection := GetOLEDBConnection;
  SetIConnection(CRConnection);
end;

procedure TCustomMSConnection.SetIConnection(Value: TCRConnection);
begin
  inherited;

  FIConnection := Value as TOLEDBConnection;

  Database := FDatabase; // To prevent empty value
end;

function TCustomMSConnection.GetIConnectionClass: TCRConnectionClass;
begin
  Result := TOLEDBConnection;
end;

function TCustomMSConnection.GetICommandClass: TCRCommandClass;
begin
  Result := TOLEDBCommand;
end;

function TCustomMSConnection.GetIRecordSetClass: TCRRecordSetClass;
begin
  Result := TOLEDBRecordSet;
end;

procedure TCustomMSConnection.SetOptions(Value: TCustomMSConnectionOptions);
begin
  FOptions.Assign(Value);
end;

procedure TCustomMSConnection.FillConnectionParameters(var ConnectionParameters: TMSConnectionParameters);
begin
  ConnectionParameters.MinPoolSize := PoolingOptions.MinPoolSize;
  ConnectionParameters.MaxPoolSize := PoolingOptions.MaxPoolSize;
  ConnectionParameters.ConnectionLifeTime := PoolingOptions.ConnectionLifetime;
  ConnectionParameters.Validate := PoolingOptions.Validate;
  ConnectionParameters.Username := Username;
  ConnectionParameters.Server := Server;
  ConnectionParameters.Password := Password;

  ConnectionParameters.Database := Database;
  ConnectionParameters.IsolationLevel := IsolationLevel;

  ConnectionParameters.QuotedIdentifier := Options.QuotedIdentifier;
  ConnectionParameters.Encrypt := Options.Encrypt;
  ConnectionParameters.Provider := Options.FProvider;
end;

procedure TCustomMSConnection.FillConnectionProps(OLEDBConnection: TOLEDBConnection);
begin
  OLEDBConnection.SetProp(prDatabase, FDatabase);
  OLEDBConnection.SetProp(prIsolationLevel, Integer(FIsolationLevel));

  if FOptions <> nil then begin
    OLEDBConnection.SetProp(prQuotedIdentifier, FOptions.FQuotedIdentifier);
    OLEDBConnection.SetProp(prEncrypt, FOptions.FEncrypt);
    OLEDBConnection.SetProp(prProvider, Integer(FOptions.FProvider));
  end;
end;

function TCustomMSConnection.GetOLEDBConnection: TOLEDBConnection;
var
  ConnectionParameters: TMSConnectionParameters;
begin
  if Pooling then begin
    ConnectionParameters := TMSConnectionParameters.Create;
    try
      FillConnectionParameters(ConnectionParameters);
      Result := TMSConnectionPoolManager.GetConnection(ConnectionParameters) as TOLEDBConnection;
    finally
      ConnectionParameters.Free;
    end;
  end
  else begin
    Result := TOLEDBConnection.Create;
    FillConnectionProps(Result);
  end;

  if FIConnection <> nil then
    Result.Assign(FIConnection as TOLEDBConnection);
end;

procedure TCustomMSConnection.AssignTo(Dest: TPersistent);
begin
  inherited AssignTo(Dest);

  if Dest is TCustomMSConnection then begin
    TCustomMSConnection(Dest).Database := Database;
    TCustomMSConnection(Dest).IsolationLevel := IsolationLevel;
  end;
end;

procedure TCustomMSConnection.SetDatabase(Value: string);
begin
  if (Value <> Database) and (Options <> nil) and (Options.Provider = prCompact) then
    Disconnect;

  if Value <> Database then begin
    FDatabase := Value;
    
    if (Options <> nil) and (Options.Provider = prCompact) and
      (csDesigning in ComponentState) and (Value <> '') and (Value[1] = '.') and (CurrentProjectOutputDir <> '') then
      Value := IncludeTrailingBackslash(CurrentProjectOutputDir) + Value;
      
    if FIConnection <> nil then
      FIConnection.SetProp(prDatabase, Value);
  end;
end;

function TCustomMSConnection.CreateDataSet: TCustomDADataSet;
begin
  Result := TCustomMSDataSet.Create(nil);
  TCustomMSDataSet(Result).SetDesigning(csDesigning in ComponentState);
  Result.Connection := Self;
end;

function TCustomMSConnection.CreateSQL: TCustomDASQL;
begin
  Result := TMSSQL.Create(nil);
  TMSSQL(Result).SetDesigning(csDesigning in ComponentState);
  Result.Connection := Self;
end;

function TCustomMSConnection.GetClientVersion: string;
begin
  Connect;
  Assert(FIConnection <> nil);
  Result := IConnection.ProviderVer;
end;

function TCustomMSConnection.GetServerVersion: string;
begin
  Connect;
  Assert(FIConnection <> nil);
  Result := IConnection.DBMSVer;
end;

function TCustomMSConnection.ExecSQL(Text: string; const Params: array of variant): variant;
var
  i: integer;
  Param: TParam;
begin
  if FMSSQL = nil then
    FMSSQL := CreateSQL as TMSSQL;

  FMSSQL.SQL.Text := ''; // drop params from previous sql
  FMSSQL.SQL.Text := Text;

  for i := 0 to FMSSQL.ParamCount - 1 do
    if i <= High(Params) then
      FMSSQL.Params[i].Value := Params[i]
    else
      FMSSQL.Params[i].Value := Null;

  Param := FMSSQL.FindParam('Result');
  if Param <> nil then begin
    Param.ParamType := ptInputOutput;
    if Param.DataType = ftUnknown then
      Param.DataType := ftInteger;
  end;

  FMSSQL.Execute;

  if Param <> nil then
    Result := Param.Value
  else
    Result := Null;
end;

procedure TCustomMSConnection.GetTableNames(List: TStrings);
var
  MDDS: TMSMetadata;

  procedure AddNamesToList;
  var
    NameFld: TStringField;
    SchemaFld: TStringField;
  begin
    MDDS.Open;

    NameFld := MDDS.FieldByName('TABLE_NAME') as TStringField;
    SchemaFld := nil;
    if Options.Provider <> prCompact then
      SchemaFld := MDDS.FieldByName('TABLE_SCHEMA') as TStringField;
    while not MDDS.Eof do begin
      if (SchemaFld <> nil) and (SchemaFld.Value <> '') then
        List.Add(SchemaFld.Value + '.' + NameFld.Value)
      else
        List.Add(NameFld.Value);
      MDDS.Next;
    end;
  end;

begin
  List.Clear;
  MDDS := nil;
  try
    MDDS := TMSMetadata.Create(nil);
    MDDS.Connection := Self;
    MDDS.DatabaseName := MDDS.Connection.Database;

    MDDS.ObjectType := otTables;
    AddNamesToList;

    if Options.Provider <> prCompact then begin
      MDDS.ObjectType := otViews;
      AddNamesToList;
    end;
    
    if List is TStringList then
      TStringList(List).Sort;
  finally
    MDDS.Free;
  end;
end;

procedure TCustomMSConnection.GetDatabaseNames(List: TStrings);
var
  MDDS: TMSMetadata;
  NameFld: TStringField;
begin
  List.Clear;

  if Options.Provider = prCompact then
    Exit;
    
  MDDS := nil;
  try
    MDDS := TMSMetadata.Create(nil);
    MDDS.Connection := Self;
    MDDS.ObjectType := otDatabases;

    try
      MDDS.Open;
    except
      on E: EMSError do begin
        if E.ErrorCode = 4060 then  
          Database := '';
        raise;
      end;
    end;
       
    NameFld := MDDS.FieldByName('CATALOG_NAME') as TStringField;
    while not MDDS.Eof do begin
      List.Add(NameFld.Value);
      MDDS.Next
    end;

    if List is TStringList then
      TStringList(List).Sort;
  finally
    MDDS.Free;
  end;
end;

procedure TCustomMSConnection.GetStoredProcNames(List: TStrings);
var
  MDDS: TMSMetadata;
  NameFld: TStringField;
begin
  List.Clear;

  if Options.Provider = prCompact then
    Exit;

  MDDS := nil;
  try
    MDDS := TMSMetadata.Create(nil);
    MDDS.Connection := Self;
    MDDS.ObjectType := otStoredProcs;

    try
      MDDS.Open;
    except
      on E: EMSError do begin
        if E.ErrorCode = 4060 then
          Database := '';
        raise;
      end;
    end;

    NameFld := MDDS.FieldByName('PROCEDURE_NAME') as TStringField;
    while not MDDS.Eof do begin
      List.Add(NameFld.Value);
      MDDS.Next
    end;

    if List is TStringList then
      TStringList(List).Sort;
  finally
    MDDS.Free;
  end;
end;

procedure TCustomMSConnection.GetStoredProcNames(List: TStrings; System: boolean);
var
  Query: TMSQuery;
  NameFld: TStringField;
begin
  if System then
    GetStoredProcNames(List)
  else
  begin
    List.Clear;
    
    if Options.Provider = prCompact then
      Exit;

    Query := TMSQuery.Create(nil);
    try
      Query.Connection := Self;
      Query.SQL.Clear;
      Query.SQL.Add('SELECT name FROM sysobjects');
      Query.SQL.Add('WHERE OBJECTPROPERTY(id, N''IsProcedure'') = 1 or OBJECTPROPERTY(id, N''IsExtendedProc'') = 1');
      Query.SQL.Add('ORDER BY name');
      try
        Query.Open;
      except
        on E: EMSError do begin
          if E.ErrorCode = 4060 then
            Database := '';
          raise;
        end;
      end;

      NameFld := Query.FieldByName('name') as TStringField;
      while not Query.Eof do begin
        List.Add(NameFld.Value);
        Query.Next;
      end;
    finally
      Query.Free;
    end;
  end;
end;

function TCustomMSConnection.SQLMonitorClass: TClass;
begin
  Result := TMSSQLMonitor;
end;

function TCustomMSConnection.ConnectDialogClass: TConnectDialogClass;
begin
  if Assigned(DefConnectDialogClassProc) then
    Result := TConnectDialogClass(DefConnectDialogClassProc)
  else
    Result := nil;
end;

procedure TCustomMSConnection.SetIsolationLevel(const Value: TIsolationLevel);
begin
  if FIsolationLevel <> Value then begin
    FIsolationLevel := Value;
    if FIConnection <> nil then
      FIConnection.SetProp(prIsolationLevel, Integer(Value));
  end;
end;

function TCustomMSConnection.NeedPrompt: boolean;
begin
  Result := not FLockLoginPrompt and
    (LoginPrompt or (csDesigning in ComponentState) and
    ((Username = '') and (Password = ''))) and
    not ((csDesigning in ComponentState) and ((csReading in ComponentState) or FStreamedConnected))
end;

function TCustomMSConnection.IsFatalError(E: EDAError): boolean;
begin
  if E is EMSError then
    with EMSError(E) do begin
      Result := SeverityClass >= 20; {fatal error}
      if not Result then
        Result :=
          ((SeverityClass = 16) and (State = 1) and (MSSQLErrorCode <= NE_MAX_NETERROR))  // Network Library
        or
          ((SeverityClass = 10) and (State = 1) and (MSSQLErrorCode = WSAECONNRESET)) // Win sockets
        or
          ((SeverityClass = 16) and (State = 1) and (MSSQLErrorCode = WSAECONNRESET)) // Win sockets
        or
          ((SeverityClass = 16) and (State = 1) and (MSSQLErrorCode = ERROR_PIPE_NOT_CONNECTED)) // Named pipes
        or
          ((SeverityClass = 16) and (State = 1) and (MSSQLErrorCode = ERROR_NETNAME_DELETED)); // Named pipes
    end
  else
    Result := inherited IsFatalError(E);
end;

procedure TCustomMSConnection.DoError(E: Exception; var Fail, Reconnect, Reexecute: boolean;
  ReconnectAttempt: integer; var ConnLostCause: TConnLostCause);
var
  i: integer;
begin
  inherited;

  if Reconnect then
    for i := 0 to DataSetCount - 1 do begin // Check underfetched data
      Assert(DataSets[i] is TCustomMSDataSet);
      if TCustomMSDataSet(DataSets[i]).FIRecordSet.GetIRowset <> nil then begin
        Reconnect := False;
        Exit;
      end;
    end;
end;

function TCustomMSConnection.IsKeyViolation(E: EDAError): boolean;
begin
  if E is EMSError then
    Result := (E.ErrorCode = 2627{Violation of %ls constraint '%.*ls'. Cannot insert duplicate key in object '%.*ls'.})
  else
    Result := inherited IsKeyViolation(E);
end;

{ TMSConnectionOptions }

constructor TMSConnectionOptions.Create(Owner: TMSConnection);
begin
  inherited Create(Owner);

  FAutoTranslate := True;
  FPacketSize := DefaultPacketSize;
  FFailoverPartner := '';
end;

procedure TMSConnectionOptions.AssignTo(Dest: TPersistent);
begin
  inherited;

  if Dest is TMSConnectionOptions then begin
    TMSConnectionOptions(Dest).Language := Language;
    TMSConnectionOptions(Dest).PersistSecurityInfo := PersistSecurityInfo;
    TMSConnectionOptions(Dest).AutoTranslate := AutoTranslate;
    TMSConnectionOptions(Dest).NetworkLibrary := NetworkLibrary;
    TMSConnectionOptions(Dest).ApplicationName := ApplicationName;
    TMSConnectionOptions(Dest).WorkstationID := WorkstationID;
    TMSConnectionOptions(Dest).PacketSize := PacketSize;
    TMSConnectionOptions(Dest).FailoverPartner := FailoverPartner;    
  end;
end;

procedure TMSConnectionOptions.SetLanguage(const Value: string);
begin
  if FLanguage <> Value then begin
    TMSConnection(FOwner).CheckInactive;
    FLanguage := Value;
    if TMSConnection(FOwner).IConnection <> nil then
      TMSConnection(FOwner).IConnection.SetProp(prLanguage, Value);
  end;
end;

procedure TMSConnectionOptions.SetPersistSecurityInfo(const Value: boolean);
begin
  if FPersistSecurityInfo <> Value then begin
    TMSConnection(FOwner).CheckInactive;
    FPersistSecurityInfo := Value;
    if TMSConnection(FOwner).IConnection <> nil then
      TMSConnection(FOwner).IConnection.SetProp(prPersistSecurityInfo, Value);
  end;
end;

procedure TMSConnectionOptions.SetAutoTranslate(const Value: boolean);
begin
  if FAutoTranslate <> Value then begin
    TMSConnection(FOwner).CheckInactive;
    FAutoTranslate := Value;
    if TMSConnection(FOwner).IConnection <> nil then
      TMSConnection(FOwner).IConnection.SetProp(prAutoTranslate, Value);
  end;
end;

procedure TMSConnectionOptions.SetNetworkLibrary(const Value: string);
begin
  if FNetworkLibrary <> Value then begin
    TMSConnection(FOwner).CheckInactive;
    FNetworkLibrary := Value;
    if TMSConnection(FOwner).IConnection <> nil then
      TMSConnection(FOwner).IConnection.SetProp(prNetworkLibrary, Value);
  end;
end;

procedure TMSConnectionOptions.SetApplicationName(const Value: string);
begin
  if FApplicationName <> Value then begin
    TMSConnection(FOwner).CheckInactive;
    FApplicationName := Value;
    if TMSConnection(FOwner).IConnection <> nil then
      TMSConnection(FOwner).IConnection.SetProp(prApplicationName, Value);
  end;
end;

procedure TMSConnectionOptions.SetWorkstationID(const Value: string);
begin
  if FWorkstationID <> Value then begin
    TMSConnection(FOwner).CheckInactive;
    FWorkstationID := Value;
    if TMSConnection(FOwner).IConnection <> nil then
      TMSConnection(FOwner).IConnection.SetProp(prWorkstationID, Value);
  end;
end;

procedure TMSConnectionOptions.SetPacketSize(const Value: integer);
begin
  if FPacketSize <> Value then begin
    TMSConnection(FOwner).CheckInactive;
    FPacketSize := Value;
    if TMSConnection(FOwner).IConnection <> nil then
      TMSConnection(FOwner).IConnection.SetProp(prPacketSize, Value);
  end;
end;

procedure TMSConnectionOptions.SetInitialFileName(const Value: string);
begin
  if FInitialFileName <> Value then begin
    TMSConnection(FOwner).CheckInactive;
    FInitialFileName := Value;
    if TMSConnection(FOwner).IConnection <> nil then
      TCustomMSConnection(FOwner).IConnection.SetProp(prInitialFileName, Value);
  end;
end;

procedure TMSConnectionOptions.SetMultipleActiveResultSets(const Value: boolean);
begin
  if FMultipleActiveResultSets <> Value then begin
    TMSConnection(FOwner).CheckInactive;
    FMultipleActiveResultSets := Value;
    if TMSConnection(FOwner).IConnection <> nil then
      TMSConnection(FOwner).IConnection.SetProp(prMARS, Value);
  end;
end;

procedure TMSConnectionOptions.SetFailoverPartner(const Value: string);
begin
  if FFailoverPartner <> Value then begin
    TMSConnection(FOwner).CheckInactive;
    FFailoverPartner := Value;
    if TMSConnection(FOwner).IConnection <> nil then
      TMSConnection(FOwner).IConnection.SetProp(prFailoverPartner, Value);
  end;
end;

procedure TMSConnectionOptions.SetTrustServerCertificate(const Value: boolean);
begin
  if FTrustServerCertificate <> Value then begin
    TMSConnection(FOwner).CheckInactive;
    FTrustServerCertificate := Value;
    if TMSConnection(FOwner).IConnection <> nil then
      TMSConnection(FOwner).IConnection.SetProp(prTrustServerCertificate, Value);
  end;
end;

{ TMSConnection }

constructor TMSConnection.Create(Owner: TComponent);
begin
  inherited;

  Authentication := auServer;
  ConnectionTimeout := DefaultConnectionTimeout;
  FSPID := -1;
end;

procedure TMSConnection.SetIConnection(Value: TCRConnection);
begin
  inherited;

  if FIConnection <> nil then
    TOLEDBConnection(FIConnection).OnInfoMessage := DoInfoMessage;
end;

procedure TMSConnection.FillConnectionParameters(var ConnectionParameters: TMSConnectionParameters);
begin
  inherited;

  ConnectionParameters.Language := Options.Language;
  ConnectionParameters.PersistSecurityInfo := Options.PersistSecurityInfo;
  ConnectionParameters.AutoTranslate := Options.AutoTranslate;
  ConnectionParameters.Authentication := Authentication;
  ConnectionParameters.NetworkLibrary := Options.NetworkLibrary;
  ConnectionParameters.ApplicationName := Options.ApplicationName;
  ConnectionParameters.WorkstationID := Options.WorkstationID;
  ConnectionParameters.PacketSize := Options.PacketSize;
end;

procedure TMSConnection.FillConnectionProps(OLEDBConnection: TOLEDBConnection);
begin
  inherited;

  OLEDBConnection.SetProp(prAuthentication, Integer(FAuthentication));
  OLEDBConnection.SetProp(prConnectionTimeout, FConnectionTimeout);

  if FOptions <> nil then begin
    OLEDBConnection.SetProp(prLanguage, Options.FLanguage);
    OLEDBConnection.SetProp(prPersistSecurityInfo, Options.FPersistSecurityInfo);
    OLEDBConnection.SetProp(prAutoTranslate, Options.FAutoTranslate);
    OLEDBConnection.SetProp(prNetworkLibrary, Options.FNetworkLibrary);
    OLEDBConnection.SetProp(prApplicationName, Options.FApplicationName);
    OLEDBConnection.SetProp(prWorkstationID, Options.FWorkstationID);
    OLEDBConnection.SetProp(prPacketSize, Options.FPacketSize);
    OLEDBConnection.SetProp(prInitialFileName, Options.FInitialFileName);
    OLEDBConnection.SetProp(prMARS, Options.FMultipleActiveResultSets);
    OLEDBConnection.SetProp(prFailoverPartner, Options.FFailoverPartner);
    OLEDBConnection.SetProp(prTrustServerCertificate, Options.FTrustServerCertificate);
  end;
end;

procedure TMSConnection.AssignTo(Dest: TPersistent);
begin
  inherited AssignTo(Dest);

  if Dest is TMSConnection then begin
    TMSConnection(Dest).Authentication := Authentication;
    TMSConnection(Dest).ConnectionTimeout := ConnectionTimeout;
  end;
end;

function TMSConnection.CreateOptions: TDAConnectionOptions;
begin
  Result := TMSConnectionOptions.Create(Self);
end;

function TMSConnection.GetOptions: TMSConnectionOptions;
begin
  Result := FOptions as TMSConnectionOptions;
end;

procedure TMSConnection.SetOptions(Value: TMSConnectionOptions);
begin
  FOptions.Assign(Value);
end;

function TMSConnection.NeedPrompt: boolean;
begin
  Result := False;
  if Authentication = auWindows then
    Exit;

  Result := inherited NeedPrompt;
end;

procedure TMSConnection.SetAuthentication(const Value: TMSAuthentication);
begin
  if FAuthentication <> Value then begin
    Disconnect;
    FAuthentication := Value;
    if FIConnection <> nil then
      FIConnection.SetProp(prAuthentication, Integer(Value));
  end;
end;

procedure TMSConnection.SetConnectionTimeout(const Value: integer);
begin
  if FConnectionTimeout <> Value then begin
    FConnectionTimeout := Value;
    if FIConnection <> nil then
      FIConnection.SetProp(prConnectionTimeout, Value);
  end;
end;

function TMSConnection.GetConnectString: string;
begin
  Result := inherited GetConnectString;

  AddConnectStringParam(Result, 'Connect Timeout', IntToStr(ConnectionTimeout), IntToStr(DefaultConnectionTimeout));
  AddConnectStringParam(Result, 'Current Language', Options.Language, '');
  AddConnectStringParam(Result, 'Persist Security Info', BoolToStr(Options.PersistSecurityInfo, True), 'False');
  AddConnectStringParam(Result, 'Auto Translate', BoolToStr(Options.AutoTranslate, True), 'True');
  AddConnectStringParam(Result, 'Network Library', Options.NetworkLibrary, '');
  AddConnectStringParam(Result, 'Application Name', Options.ApplicationName, '');
  AddConnectStringParam(Result, 'Workstation ID', Options.WorkstationID, '');
  AddConnectStringParam(Result, 'Packet Size', IntToStr(Options.PacketSize), IntToStr(DefaultPacketSize));
  if Options.InitialFileName <> '' then
    AddConnectStringParam(Result, 'AttachDBFileName', Options.InitialFileName, '');
  AddConnectStringParam(Result, 'MultipleActiveResultSets', BoolToStr(Options.MultipleActiveResultSets, True), 'False');
  if Options.FailoverPartner <> '' then
    AddConnectStringParam(Result, 'Failover Partner', Options.FailoverPartner, '');
  AddConnectStringParam(Result, 'TrustServerCertificate', BoolToStr(Options.FTrustServerCertificate, True), 'False');
  
  if Authentication = auWindows then
    Result := Result + ';Integrated Security=SSPI';
end;

procedure TMSConnection.SetConnectString(Value: string);
begin
  inherited SetConnectString(Value);
  
  if FIntegratedSecuritySSPI then
    Authentication := auWindows;
end;

procedure TMSConnection.ProcessConnectStringParam(const paramName, paramValue: string);
begin
  if RecognizedParameter(['Integrated Security', 'Trusted_Connection'], paramName) then begin
    if paramValue = 'SSPI' then
      FIntegratedSecuritySSPI := True
    else
      if not TryStrToBool(paramValue, FIntegratedSecuritySSPI) then
        raise Exception.CreateFmt(SBadParamValue, [paramName, paramValue]);
  end
  else
  if RecognizedParameter(['Connect Timeout', 'ConnectTimeout', 'Timeout'], paramName) then
    ConnectionTimeout := StrToInt(paramValue)
  else
  if RecognizedParameter(['Current Language', 'Language'], paramName) then
    Options.Language := paramValue
  else
  if RecognizedParameter(['PersistSecurityInfo', 'Persist Security Info'], paramName) then
    Options.PersistSecurityInfo := {$IFDEF VER6}MemUtils.{$ENDIF}StrToBool(paramValue)
  else
  if RecognizedParameter(['AutoTranslate', 'Auto Translate'], paramName) then
    Options.AutoTranslate := {$IFDEF VER6}MemUtils.{$ENDIF}StrToBool(paramValue)
  else
  if RecognizedParameter(['Network Library', 'Network', 'NetworkLibrary', 'NetLibrary'], paramName) then
    Options.NetworkLibrary := paramValue
  else
  if RecognizedParameter(['ApplicationName', 'Application Name', 'AppName'], paramName) then
    Options.ApplicationName := paramValue
  else
  if RecognizedParameter(['WorkstationID', 'Workstation ID', 'WSID'], paramName) then
    Options.WorkstationID := paramValue
  else
  if RecognizedParameter(['Packet Size', 'PacketSize'], paramName) then
    Options.PacketSize := StrToInt(paramValue)
  else
  if RecognizedParameter(['AttachDBFileName', 'InitialFileName', 'InitFileName'], paramName) then
    Options.InitialFileName := paramValue
  else
  if RecognizedParameter(['MultipleActiveResultSets', 'Multiple Active Result Sets', 'MARS Connection', 'MARS'], paramName) then
    Options.MultipleActiveResultSets := {$IFDEF VER6}MemUtils.{$ENDIF}StrToBool(paramValue)
  else
  if RecognizedParameter(['FailoverPartner', 'Failover Partner', 'Failover_Partner'], paramName) then
    Options.FailoverPartner := paramValue
  else
  if RecognizedParameter(['TrustServerCertificate', 'Trust Server Certificate'], paramName) then
    Options.TrustServerCertificate := {$IFDEF VER6}MemUtils.{$ENDIF}StrToBool(paramValue)
  else
    inherited ProcessConnectStringParam(paramName, paramValue);
end;

procedure TMSConnection.InitConnectStringOptions;
begin
  inherited;

  Options.Language := '';
  Options.PersistSecurityInfo := False;
  Options.AutoTranslate := True;
  Options.NetworkLibrary := '';
  Options.PacketSize := DefaultPacketSize;
  Options.InitialFileName := '';
  Options.MultipleActiveResultSets := False;
  Options.FailoverPartner := '';
  Options.TrustServerCertificate := False;
        
  Authentication := auServer;
  FIntegratedSecuritySSPI := False;
end;

procedure TMSConnection.DoInfoMessage(E: EMSError);
begin
  TMSSQLMonitorClass(SQLMonitorClass).InfoMessage(Self, E.Message);

  if Assigned(FOnInfoMessage) then
    FOnInfoMessage(Self, E);
end;

function TMSConnection.GetSPID: integer;
begin
  if FSPID = -1 then
    FSPID := ExecSQL('SET :Result = @@SPID', []);
  Result := FSPID;
end;

procedure TMSConnection.ChangePassword(NewPassword: string);
var
  OldConnected: boolean;
  OldPassword: string;
  OldLoginPrompt: boolean;
begin
  OldConnected := Connected;
  OldPassword := Password;
  OldLoginPrompt := LoginPrompt;
  try
    if not Connected then
      CreateIConnection
    else
      Disconnect;
    LoginPrompt := False;
    Assert(FIConnection <> nil);
    FIConnection.SetProp(prOldPassword, Password);
    Password := NewPassword;
    try
      Connect;
    except
      Password := OldPassword;
      raise;
    end;
  finally
    Assert(FIConnection <> nil);
    FIConnection.SetProp(prOldPassword, '');
    LoginPrompt := OldLoginPrompt;
    if not OldConnected then
      Disconnect;
  end;
end;

{$IFNDEF STD}
{ TMSNotificationParser }

constructor TMSNotificationParser.Create;
begin
  inherited Create;
  
  FNotificationInfo := niUnknown;
  FNotificationSource := nsUnknown;
  FNotificationType := ntUnknown;
  FKey := '';
end;

procedure TMSNotificationParser.ProcessMessage(Message: {$IFDEF CLR}TBytes{$ELSE}WideString{$ENDIF});
const
  InfoAttribute = 'info';
  MessageNode = 'Message';
  RootNode = 'QueryNotification';
  SourceAttribute = 'source';
  TypeAttribute = 'type';
var
  XmlReader: XmlTextReader;
  Value: string;
begin
  XmlReader := nil;
  try
    FNotificationInfo := niUnknown;
    FNotificationSource := nsUnknown;
    FNotificationType := ntUnknown;
    FKey := '';
  {$IFDEF CLR}
    XmlReader := XmlTextReader.Create(MemoryStream.Create(Message));
  {$ELSE}
    XmlReader := XmlTextReader.Create(Message);
  {$ENDIF}
    if XmlReader.Read then begin
      if (XmlReader.NodeType = ntElement) and (LowerCase(XmlReader.Name) = 'qn:querynotification') and (XmlReader.AttributeCount >= 3) then begin
        XmlReader.MoveToAttribute(InfoAttribute);
        Value := LowerCase(XmlReader.Value);
        if Value = 'alter' then
          FNotificationInfo := niAlter
        else
        if Value = 'delete' then
          FNotificationInfo := niDelete
        else
        if Value = 'drop' then
          FNotificationInfo := niDrop
        else
        if Value = 'error' then
          FNotificationInfo := niError
        else
        if Value = 'insert' then
          FNotificationInfo := niInsert
        else
        if Value = 'invalid' then
          FNotificationInfo := niInvalid
        else
        if Value = 'isolation' then
          FNotificationInfo := niIsolation
        else
        if Value = 'set options' then
          FNotificationInfo := niOptions
        else
        if Value = 'previous invalid' then
          FNotificationInfo := niPreviousFire
        else
        if Value = 'query' then
          FNotificationInfo := niQuery
        else
        if Value = 'resource' then
          FNotificationInfo := niResource
        else
        if Value = 'restart' then
          FNotificationInfo := niRestart
        else
        if Value = 'query template limit' then
          FNotificationInfo := niTemplateLimit
        else
        if Value = 'truncate' then
          FNotificationInfo := niTruncate
        else
        if Value = 'update' then
          FNotificationInfo := niUpdate;

        XmlReader.MoveToAttribute(SourceAttribute);
        Value := LowerCase(XmlReader.Value);
        if Value = 'client' then
          FNotificationSource := nsClient
        else
        if Value = 'data' then
          FNotificationSource := nsData
        else
        if Value = 'database' then
          FNotificationSource := nsDatabase
        else
        if Value = 'environment' then
          FNotificationSource := nsEnvironment
        else
        if Value = 'execution' then
          FNotificationSource := nsExecution
        else
        if Value = 'object' then
          FNotificationSource := nsObject
        else
        if Value = 'statement' then
          FNotificationSource := nsStatement
        else
        if Value = 'system' then
          FNotificationSource := nsSystem
        else
        if Value = 'timeout' then
          FNotificationSource := nsTimeout;

        XmlReader.MoveToAttribute(TypeAttribute);
        Value := LowerCase(XmlReader.Value);
        if Value = 'change' then
          FNotificationType := ntChange
        else
        if Value = 'subscribe' then
          FNotificationType := ntSubscribe;

        XmlReader.Read;
        if (XmlReader.NodeType = ntElement) and (LowerCase(XmlReader.Name) = 'qn:message') then begin
          XmlReader.Read;
          FKey := XmlReader.Value;
        end;
      end;
    end;
  finally
    XmlReader.Free;
  end;
end;

{ TMSChangeNotification }

constructor TMSChangeNotification.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDataSets := TDAList.Create;
  FNotificators := TDAList.Create;
  FTimeOut := SSPROPVAL_DEFAULT_NOTIFICATION_TIMEOUT;
  FEnabled := True;
end;

destructor TMSChangeNotification.Destroy;
var
  i: integer;
begin
  for i := FDatasets.Count - 1 downto 0 do begin
    RemoveNotificator(TCustomMSDataSet(FDatasets[i]));
    TCustomMSDataSet(FDatasets[i]).ChangeNotification := nil;
  end;
  Assert(FDataSets.Count = 0);
  FDataSets.Free;
  Assert(FNotificators.Count = 0);
  FNotificators.Free;
  
  inherited;
end;

procedure TMSChangeNotification.SetEnabled(Value: boolean);
var
  i: integer;
begin
  if FEnabled <> Value then begin
    for i := 0 to FNotificators.Count - 1 do
      TMSServiceBroker(FNotificators[i]).AsyncNotification := Value;
    FEnabled := Value;
  end;
end;

procedure TMSChangeNotification.SetTimeOut(Value: integer);
begin
  // if (Value > SSPROPVAL_MAX_NOTIFICATION_TIMEOUT) then
  if (Value < 0) then
    DatabaseError(SInvalidNotificationTimeout);
  FTimeOut := Value;
end;

procedure TMSChangeNotification.SetService(Value: string);
begin
  FService := Value;
end;

procedure TMSChangeNotification.Notification(AComponent: TComponent; Operation: TOperation);
begin
  if (Operation = opRemove) and (AComponent <> nil) and IsClass(AComponent, TCustomMSDataSet) then
    RemoveDataSet(TCustomMSDataSet(AComponent));
  
  inherited;
end;

procedure TMSChangeNotification.AddDataSet(DataSet: TCustomMSDataSet);
begin
  FDataSets.Add(DataSet);
  DataSet.FreeNotification(Self);
end;

procedure TMSChangeNotification.RemoveDataSet(DataSet: TCustomMSDataSet);
begin
  FDataSets.Remove(DataSet);
  DataSet.RemoveFreeNotification(Self);
end;

function TMSChangeNotification.GetSubscriptionKey(DataSet: TCustomMSDataSet): string;
var
  i: integer;
begin
  Result := '';
  for i := 1 to Length(DataSet.SQL.Text) do
    Result := Result + IntToStr(Ord(DataSet.SQL.Text[i]));
end;

procedure TMSChangeNotification.CheckDataSet(DataSet: TCustomMSDataSet);
begin
  if not IsClass(DataSet.Connection, TMSConnection) then
    DatabaseError(SCompactEditionNotSupported, Self);
  if TMSConnection(DataSet.Connection).Options.Provider = prCompact then
    DatabaseError(SCompactEditionNotSupported, Self);
  //if (not DataSet.ReadOnly) and (not TMSConnection(DataSet.Connection).Options.MultipleActiveResultSets) then
  //  DatabaseError(SChangeNotificationNeedMARS, Self);
end;

function TMSChangeNotification.FindNotificator(DataSet: TCustomMSDataSet): TObject;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to FNotificators.Count - 1 do
    if TMSServiceBroker(FNotificators[i]).Connection = DataSet.Connection then begin
      Result := TMSServiceBroker(FNotificators[i]);
      Break;
    end;
end;

procedure TMSChangeNotification.AddNotificator(DataSet: TCustomMSDataSet);
var
  Notificator: TMSServiceBroker;
begin
  CheckDataSet(DataSet);
  Notificator := TMSServiceBroker(FindNotificator(DataSet));
  if Notificator = nil then begin
    Notificator := TMSServiceBroker.Create(nil);
    Notificator.Connection := TMSConnection(DataSet.Connection);
    Notificator.OnMessage := DoOnNotification;
    if FService = '' then begin
      Notificator.Service := sNotificationService + IntToStr(TMSConnection(DataSet.Connection).SPID);
      Notificator.CreateServerObjects(sNotificationContract);
    end
    else
      Notificator.Service := FService;
    FNotificators.Add(Notificator);
    Assert(Notificator.Queue <> ''); // cache queue name
  end;

  if DataSet.FICommand <> nil then begin
    DataSet.FICommand.SetProp(prNotificationService, Notificator.Service);
    DataSet.FICommand.SetProp(prNotificationMessage, GetSubscriptionKey(DataSet));
    DataSet.FICommand.SetProp(prNotificationTimeout, TimeOut);
  end;
end;

procedure TMSChangeNotification.RemoveNotificator(DataSet: TCustomMSDataSet);
var
  Notificator: TMSServiceBroker;
  i: integer;
begin
  Notificator := TMSServiceBroker(FindNotificator(DataSet));
  if Notificator <> nil then begin
    for i := 0 to FDataSets.Count - 1 do
      if (Notificator.Connection = TCustomMSDataSet(FDataSets[i]).Connection) then
        if (TCustomMSDataSet(FDataSets[i]) <> DataSet) then
          Exit;
    if FService = '' then begin
      // Drop service, queue and services and queues for invalid connections
      Notificator.AsyncNotification := False;
      Notificator.Connection.ExecSQL(
        'DECLARE @INVALID_SERVICE nvarchar(128);' + LineSeparator +
        'SET @INVALID_SERVICE = N''' + Notificator.Service + ''';' + LineSeparator +
        'DECLARE @DROP_STATEMENT nvarchar(300);' + LineSeparator +
        'WHILE @INVALID_SERVICE <> N''''' + LineSeparator +
        'BEGIN' + LineSeparator +
        '  SET @DROP_STATEMENT = N''DROP SERVICE '' + @INVALID_SERVICE;' + LineSeparator +
        '  EXECUTE sp_executesql @DROP_STATEMENT;' + LineSeparator +
        '  SET @DROP_STATEMENT = N''DROP QUEUE '' + @INVALID_SERVICE + N''_QUEUE'';' + LineSeparator +
        '  EXECUTE sp_executesql @DROP_STATEMENT;' + LineSeparator +
        '  SET @INVALID_SERVICE = N'''';' + LineSeparator +
        '  SELECT TOP(1) @INVALID_SERVICE = [name] FROM sys.services' + LineSeparator +
        '  WHERE [name] LIKE ''' + sNotificationService + '%'' AND [name] not in' + LineSeparator +
        '    (SELECT ''' + sNotificationService + ''' + CAST([spid] AS VARCHAR(32)) AS [name] FROM master.dbo.sysprocesses WHERE [spid] >= 0 and spid <= 32767)' + LineSeparator +
        'END;', []);
    end;
    FNotificators.Remove(Notificator);
    TDBAccessUtils.InternalDisconnect(Notificator.Connection);
    Notificator.Free;
  end;
end;

procedure TMSChangeNotification.StartNotification(DataSet: TCustomMSDataSet);
var
  Notificator: TMSServiceBroker;
  DelayedSubsciption: variant;
  Subscriber: TMSSQL;
begin
  Notificator := TMSServiceBroker(FindNotificator(DataSet));
  Assert(Notificator <> nil);

  TDBAccessUtils.InternalConnect(Notificator.Connection);
  DataSet.FICommand.GetProp(prDelayedSubsciption, DelayedSubsciption);
  if Boolean(DelayedSubsciption) then begin
    Subscriber := TMSSQL.Create(nil);
    try
      Subscriber.Connection := DataSet.Connection;
      Subscriber.SQL.Text := SCheckConnection;
      Subscriber.Execute;
      Subscriber.SQL := DataSet.SQL;
      Subscriber.FICommand.SetProp(prNotification, True);
      Subscriber.FICommand.SetProp(prNotificationService, Notificator.Service);
      Subscriber.FICommand.SetProp(prNotificationTimeout, TimeOut);
      Subscriber.FICommand.SetProp(prNotificationMessage, GetSubscriptionKey(DataSet));
      Subscriber.Execute;
    finally
      Subscriber.Free;
    end;
  end;
  Notificator.AsyncNotification := True;
end;

procedure TMSChangeNotification.DoOnNotification(Sender: TObject);
var
  ServiceBroker: TMSServiceBroker;
  DataSet: TCustomMSDataSet;
  NotificationParser: TMSNotificationParser;
  i: integer;
begin
  Assert(IsClass(Sender, TMSServiceBroker));
  ServiceBroker := TMSServiceBroker(Sender);
  NotificationParser := TMSNotificationParser.Create;
  try
    while ServiceBroker.Receive do begin
    {$IFDEF CLR}
      NotificationParser.ProcessMessage(ServiceBroker.CurrentMessage.AsBytes);
    {$ELSE}
      NotificationParser.ProcessMessage(ServiceBroker.CurrentMessage.AsWideString);
    {$ENDIF}
      for i := 0 to FDataSets.Count - 1 do begin
        DataSet := TCustomMSDataSet(FDataSets[i]);
        if (DataSet.Connection = ServiceBroker.Connection) and (GetSubscriptionKey(DataSet) = NotificationParser.Key) then begin
          if Assigned(FOnChange) then
            FOnChange(Self, TCustomMSDataSet(DataSet), NotificationParser.NotificationInfo,
              NotificationParser.NotificationSource, NotificationParser.NotificationType);
          if DataSet.Active and DataSet.Options.ReflectChangeNotify then
            DataSet.ReflectChanges(NotificationParser.NotificationInfo,
              NotificationParser.NotificationSource, NotificationParser.NotificationType);
        end;
      end;
    end;
  finally
    NotificationParser.Free;
  end;
end;
{$ENDIF}

{ TMSDataSetOptions }

constructor TMSDataSetOptions.Create(Owner: TCustomDADataSet);
begin
  inherited Create(Owner);

  LongStrings := True;
  RequiredFields := False;
  EnableBCD := False;
  UniqueRecords := False;
  CursorUpdate := True;
  QueryIdentity := True;
  CheckRowVersion := False;
  FullRefresh := False;
  DMLRefresh := False;
  FAutoRefresh := False;
  FAutoRefreshInterval := 60;
  FDefaultValues := False;
  FNonBlocking := False;
end;

procedure TMSDataSetOptions.SetEnableBCD(Value: boolean);
begin
  if FEnableBCD <> Value then begin 
    TCustomMSDataSet(FOwner).CheckInactive;
    FEnableBCD := Value;
    TCustomMSDataSet(FOwner).SetNumericType;
  end;
end;

procedure TMSDataSetOptions.SetUniqueRecords(Value: boolean);
begin
  if FUniqueRecords <> Value then begin
    TCustomMSDataSet(FOwner).CheckInactive;
    TCustomMSDataSet(FOwner).FieldDefs.Updated := False;
    FUniqueRecords := Value;
    TCustomMSDataSet(FOwner).FIRecordSet.SetProp(prUniqueRecords, FUniqueRecords);
    TCustomMSDataSet(FOwner).FIRecordSet.SetProp(prRequestSQLObjects, FUniqueRecords or not FOwner.ReadOnly);
    FOwner.FieldDefs.Updated := False;
  end;
end;

procedure TMSDataSetOptions.SetCursorUpdate(Value: boolean);
begin
  if FCursorUpdate <> Value then begin
    TCustomMSDataSet(FOwner).CheckInactive;
    TCustomMSDataSet(FOwner).FieldDefs.Updated := False;
    FCursorUpdate := Value;
    TCustomMSDataSet(FOwner).FIRecordSet.SetProp(prCursorUpdate, FCursorUpdate);
  end;
end;

function TMSDataSetOptions.GetAllFieldsEditable: boolean;
begin
  Result := not SetFieldsReadOnly;
end;

procedure TMSDataSetOptions.SetAllFieldsEditable(const Value: boolean);
begin
  SetFieldsReadOnly := not Value;
end;

procedure TMSDataSetOptions.SetAutoRefresh(Value: boolean);
begin
  if FAutoRefresh <> Value then begin
    FAutoRefresh := Value;
    if not (csDesigning in FOwner.ComponentState) then
      TCustomMSDataSet(FOwner).FAutoRefreshTimer.Enabled := Value;
  end;
end;

procedure TMSDataSetOptions.SetAutoRefreshInterval(Value: integer);
begin
  if FAutoRefreshInterval <> Value then begin
    FAutoRefreshInterval := Value;
    TCustomMSDataSet(FOwner).FAutoRefreshTimer.Interval := Value * MSecsPerSec;
  end;
end;

procedure TMSDataSetOptions.SetNonBlocking(Value: boolean);
begin
  if FNonBlocking <> Value then begin
    TCustomMSDataSet(FOwner).CheckInactive;
    FNonBlocking := Value;
    TCustomMSDataSet(FOwner).FIRecordSet.SetProp(prNonBlocking, FNonBlocking);
  end;
end;

procedure TMSDataSetOptions.SetReflectChangeNotify(const Value: boolean);
begin
  FReflectChangeNotify := Value;
end;

procedure TMSDataSetOptions.AssignTo(Dest: TPersistent);
begin
  inherited;

  if Dest is TMSDataSetOptions then begin
    TMSDataSetOptions(Dest).LongStrings := LongStrings;
    TMSDataSetOptions(Dest).EnableBCD := EnableBCD;
    TMSDataSetOptions(Dest).UniqueRecords := UniqueRecords;
    TMSDataSetOptions(Dest).AllFieldsEditable := AllFieldsEditable;
    TMSDataSetOptions(Dest).CursorUpdate := CursorUpdate;
    TMSDataSetOptions(Dest).FullRefresh := FullRefresh;
    TMSDataSetOptions(Dest).DMLRefresh := DMLRefresh;
    TMSDataSetOptions(Dest).AutoRefresh := AutoRefresh;
    TMSDataSetOptions(Dest).AutoRefreshInterval := AutoRefreshInterval;
    TMSDataSetOptions(Dest).ReflectChangeNotify := ReflectChangeNotify;
  end;
end;

{ TMSSQLGenerator }

function TMSSQLGenerator.GetActualFieldNameEx(FieldDesc: TCRFieldDesc; TableInfo: TCRTableInfo): string;
var
  p: integer;
begin
  Result := TOLEDBFieldDesc(FieldDesc).BaseColumnName;
  if (FieldDesc.TableInfo = TableInfo) or (FieldDesc.TableInfo.TableName = TableInfo.TableName) then begin
    p := Pos('.', Result);
    if p <> 0 then
      Result := Copy(Result, p + 1, MaxInt);{Delete table name from fieldname}
  end;
end;

function TMSSQLGenerator.AssembleSB(const StatementType: TStatementType): string;
begin
  if TCustomMSDataSet(FOwner).Options.DMLRefresh and (StatementType = stInsert) then
    Result :=
      FHeaderSB.ToString +
      FFldSB.ToString +
      FMiddleSB.ToString +
      FFldParamSB.ToString +
      FFooterSB.ToString +
      FCondSB.ToString
  else
    Result := inherited AssembleSB(StatementType);
end;

procedure TMSSQLGenerator.GenerateInsertSQL(
  const KeyAndDataFields: TKeyAndDataFields;
  const ModifiedFieldsOnly: boolean;
  const Index: integer = -1);
var
  Field, IdentityField: TField;
  FieldDesc: TCRFieldDesc;
  i: integer;
  ActualName: string;
  AIConnection: TOLEDBConnection;
  IsFirstParam: boolean;
begin
  inherited;

  if FFldSB.Length = 0 then begin
    AIConnection := TMSAccessUtils.FIConnection(TCustomMSConnection(FOwner.Connection));
    if (AIConnection <> nil) and (AIConnection.ProviderPrimaryVer <> 3) then begin
      Clear;
      FHeaderSB.Append('INSERT INTO ');
      FHeaderSB.Append(FTableInfo.NormalizeName(FTableInfo.TableNameFull, FOwner.Options.QuoteNames));
      FHeaderSB.Append(' DEFAULT VALUES');
    end
    else begin
      for i := 0 to High(KeyAndDataFields.DataFieldDescs) do begin
        FieldDesc := KeyAndDataFields.DataFieldDescs[i];
        Field := FOwner.GetField(FieldDesc);
        Assert(Field <> nil);
        if not Field.ReadOnly then begin
          ActualName := GetActualFieldName(FieldDesc, False);

          if FFldSB.Length > 0 then begin
            FFldSB.Append(', ');
            FFldParamSB.Append(', ');
          end;
          FFldSB.Append(ActualName);
          FFldParamSB.Append('DEFAULT');
        end;
      end;
    end;
  end;

  if TCustomMSDataSet(FOwner).CursorType = ctDefaultResultSet then begin
    { Getting Identity value }
    if TCustomMSDataSet(FOwner).Options.QueryIdentity and (TOLEDBConnection(TCustomMSDataSet(FOwner).Connection.IConnection).DBMSPrimaryVer <> 3) then begin
      IdentityField := TDBAccessUtils.GetIdentityField(FOwner);
      if IdentityField <> nil then begin
        // Warning - Identity param must be last in param list, see SetIdentityParam
        // Warning - If in 'INSERT ...' statement present sql_variant value then adding 'SET ...' fails statement
        // Warning - TOLEDBFieldDesc(GetFieldDescByField(FIdentityField)).BaseColumnName cannot be used (for example see gettting identity on INSERT into View)

        FFooterSB.Append(#$D#$A'SET ');
        TCustomMSDataSet(FOwner).FUseParamType := True;
        AddParam(FFooterSB, FOwner.GetFieldDesc(IdentityField), stInsert, ptInputOutput);

        if TOLEDBConnection(TCustomMSDataSet(FOwner).Connection.IConnection).DBMSPrimaryVer > 7 then
          FFooterSB.Append(' = SCOPE_IDENTITY()')
        else
          FFooterSB.Append(' = @@Identity');
      end;
    end;

    { DMLRefresh }
    if TCustomMSDataSet(FOwner).Options.DMLRefresh then begin
      IsFirstParam := True;
      for i := 0 to High(KeyAndDataFields.DataFieldDescs) do begin
        FieldDesc := KeyAndDataFields.DataFieldDescs[i];
        Field := FOwner.GetField(FieldDesc);
        Assert(Field <> nil);
        if not Field.ReadOnly then begin
          if not IsFirstParam then
            FFooterSB.Append(', ')
          else
            FFooterSB.Append(LineSeparator + 'SELECT ');
          IsFirstParam := False;
          TCustomMSDataSet(FOwner).FUseParamType := True;
          AddParam(FFooterSB, FieldDesc, stRefresh, ptInputOutput);
          FFooterSB.Append(' = ' + QuoteName(TOLEDBFieldDesc(FieldDesc).BaseColumnName));
        end;
      end;
      if not IsFirstParam then begin
        FFooterSB.Append(' FROM ' + FTableInfo.NormalizeName(FTableInfo.TableNameFull, FOwner.Options.QuoteNames) +
          LineSeparator + 'WHERE' + LineSeparator + '  ');
        GenerateConditions(FCondSB, stInsert, ModifiedFieldsOnly, KeyAndDataFields);
      end;
    end;
  end;
end;

procedure TMSSQLGenerator.GenerateUpdateSQL(
      const KeyAndDataFields: TKeyAndDataFields;
      const ModifiedFieldsOnly: boolean;
      const Index: integer = -1);
var
  Field: TField;
  FieldDesc: TCRFieldDesc;
  i: integer;
  IsFirstParam: boolean;
  OldCondSB: StringBuilder;
begin
  inherited;

  if TCustomMSDataSet(FOwner).CursorType = ctDefaultResultSet then begin
    { DMLRefresh }
    if (FFldSB.Length > 0) and TCustomMSDataSet(FOwner).Options.DMLRefresh then begin
      FFooterSB.Append(LineSeparator);
      FFooterSB.Append('SELECT ');
      IsFirstParam := True;
      for i := 0 to High(KeyAndDataFields.DataFieldDescs) do begin
        FieldDesc := KeyAndDataFields.DataFieldDescs[i];
        Field := FOwner.GetField(FieldDesc);
        if not Field.ReadOnly then begin
          if not IsFirstParam then
            FFooterSB.Append(', ');
          IsFirstParam := False;
          TCustomMSDataSet(FOwner).FUseParamType := True;
          AddParam(FFooterSB, FieldDesc, stRefresh, ptInputOutput);
          FFooterSB.Append(' = ' + QuoteName(TOLEDBFieldDesc(FieldDesc).BaseColumnName));
        end;
      end;
      FFooterSB.Append(' FROM ');
      FFooterSB.Append(FTableInfo.NormalizeName(FTableInfo.TableNameFull, FOwner.Options.QuoteNames));
      FFooterSB.Append(LineSeparator);
      FFooterSB.Append('WHERE');
      FFooterSB.Append(LineSeparator);
      FFooterSB.Append('  ');
      OldCondSB := FCondSB;
      try
        FCondSB := StringBuilder.Create;
        try
          GenerateConditions(FCondSB, stUpdate, ModifiedFieldsOnly, KeyAndDataFields);
          FFooterSB.Append(FCondSB.ToString);
        finally
          FCondSB.Free;
        end;
      finally
        FCondSB := OldCondSB;
      end;
    end;
  end;
end;

procedure TMSSQLGenerator.GenerateRefreshSQLSelectPart(const KeyAndDataFields: TKeyAndDataFields); 
var
  Field: TField;
  FieldDesc: TOLEDBFieldDesc;
  TableName: string;
  UseDataFields: boolean;
  FieldArrHigh: integer;
begin
  inherited;

  if TCustomMSDataSet(FOwner).FTimestampField <> nil then begin
    UseDataFields := Length(KeyAndDataFields.DataFieldDescs) + Length(KeyAndDataFields.DataFieldDescs) > 0;
    if UseDataFields then
      FieldArrHigh := Length(KeyAndDataFields.DataFieldDescs) + Length(KeyAndDataFields.DataFieldDescs) - 1
    else
      FieldArrHigh := High(KeyAndDataFields.KeyFieldDescs);

    if FieldArrHigh >= 0 then
      FFldSB.Append(', ');
    Field := TCustomMSDataSet(FOwner).FTimestampField;
    FieldDesc := TOLEDBFieldDesc(FOwner.GetFieldDesc(Field));
    TableName := GenerateTableName(FieldDesc.BaseCatalogName, FieldDesc.BaseSchemaName, FieldDesc.BaseTableName, TCustomMSDataSet(FOwner).Connection.Database);
    if TableName = '' then
      FFldSB.Append(QuoteName(FieldDesc.ActualName))
    else
      if FieldDesc.TableInfo.TableAlias <> '' then
        FFldSB.Append(FieldDesc.TableInfo.NormalizeName(FieldDesc.TableInfo.TableAlias, FOwner.Options.QuoteNames) +
          '.' + QuoteName(FieldDesc.BaseColumnName))
      else
        FFldSB.Append(FieldDesc.TableInfo.NormalizeName(FieldDesc.TableInfo.TableName, FOwner.Options.QuoteNames) +
          '.' + QuoteName(FieldDesc.BaseColumnName));

    if not (csDesigning in FOwner.ComponentState) then
      FFldSB.Append(' AS ' + GenerateIndexName(IntToStr(TCustomMSDataSet(FOwner).FIRecordSet.Fields.IndexOf(FieldDesc))));
  end;
end;

procedure TMSSQLGenerator.GenerateRefreshSQL(
      const KeyAndDataFields: TKeyAndDataFields;
      const ModifiedFieldsOnly: boolean);

  procedure GenerateSPFullRefreshSQL;
  var
    i: integer;
    Field: TField;
    FieldDesc: TOLEDBFieldDesc;
    TableName: string;
    TblNames: TStringList;
  begin
    TblNames := TStringList.Create;
    try
      // SELECT ... FROM ... WHERE ... {WITH NOLOCK}
      // Add SELECT section
      FHeaderSB.Append('SELECT ');
      for i := 0 to FOwner.Fields.Count - 1 do begin
        Field := FOwner.Fields[i];
        if Field.FieldKind = fkData then begin
          FieldDesc := TOLEDBFieldDesc(FOwner.GetFieldDesc(Field));

          TableName := GenerateTableName(FieldDesc.BaseCatalogName, FieldDesc.BaseSchemaName, FieldDesc.BaseTableName, TCustomMSDataSet(FOwner).Connection.Database);
          if TblNames.IndexOf(TableName) = - 1 then
            TblNames.Add(TableName);

          FHeaderSB.Append(TableName + '.' + FieldDesc.Name);
          if not (csDesigning in FOwner.ComponentState) then
            FHeaderSB.Append(' AS _' + IntToStr(TCustomMSDataSet(FOwner).FIRecordSet.Fields.IndexOf(FieldDesc)));
          FHeaderSB.Append(', ');
        end;
      end;
      FHeaderSB.Length := FHeaderSB.Length - 2;

      // Add FROM section
      FHeaderSB.Append(' FROM ');
      for i := 0 to TblNames.Count - 1 do
        FHeaderSB.Append(QuoteName(TblNames[i]) + ', '); // Table name without aliases
      FHeaderSB.Length := FHeaderSB.Length - 2;

      // Add WHERE section
      GenerateConditions(FCondSB, stRefresh, ModifiedFieldsOnly, (*False {Refresh does not need to testing changes applied by other users},*) KeyAndDataFields);
      if FCondSB.Length > 0 then
        FMiddleSB.Append(' WHERE ');
    finally
      TblNames.Free;
    end;
  end;

begin
  if (FOwner is TCustomMSStoredProc) and TCustomMSDataSet(FOwner).Options.FullRefresh then
    GenerateSPFullRefreshSQL
  else
  if TCustomMSDataSet(FOwner).Options.FullRefresh or (FOwner.ReadOnly and not TCustomMSDataSet(FOwner).Options.UniqueRecords) then begin
    GenerateConditions(FCondSB, stRefresh, ModifiedFieldsOnly, KeyAndDataFields);
    if FCondSB.Length = 0 then
      FHeaderSB.Append(FOwner.SQL.Text)
    else begin
      FHeaderSB.Append(AddWhere(FOwner.SQL.Text, FCondSB.ToString));
      FCondSB.Length := 0; // WHERE clause already added to FHeaderSB
    end;
  end
  else
    inherited;
end;

function TMSSQLGenerator.GetActualFieldName(FldDesc: TCRFieldDesc; IsRefresh: boolean): string;
var
  TablesInfo: TCRTablesInfo;
  TableInfo: TCRTableInfo;
  IsView: boolean;
  UpdatingTableIdx: integer;
begin
  if not (((FldDesc.TableInfo <> nil) and (FldDesc.TableInfo.IsView)) or IsRefresh) then begin
    Result := TOLEDBFieldDesc(FldDesc).BaseColumnName;
    if Result = '' then
      Result := FldDesc.ActualName;
    Result := QuoteName(Result);
    Exit;
  end;
  
  IsView := False;
  UpdatingTableIdx := TDBAccessUtils.GetUpdatingTableIdx(FOwner);
  TablesInfo := TDBAccessUtils.GetTablesInfo(FOwner);
  if (UpdatingTableIdx >= 0) and (UpdatingTableIdx < TablesInfo.Count) then begin
    TableInfo := TablesInfo[UpdatingTableIdx];
    if TableInfo <> nil then
      IsView := TableInfo.IsView;
  end;

  if (FldDesc.TableInfo <> nil) and (not IsView) then
    Result := inherited GetActualFieldName(FldDesc, IsRefresh)
  else
    Result := QuoteName(FldDesc.ActualName);
end;

procedure TMSSQLGenerator.AddFieldToCondition(SB: StringBuilder; FieldDesc: TCRFieldDesc;
      const StatementType: TStatementType;
      const ModifiedFieldsOnly: boolean;
      const Index: integer = -1);
var
  ActualName: string;
  IsIdentityField: boolean;
  Field: TField;
begin
  Assert(FieldDesc <> nil);

  if ModifiedFieldsOnly then begin
    Field := FOwner.GetField(FieldDesc);
    IsIdentityField := Field = TDBAccessUtils.GetIdentityField(FOwner);
    if (StatementType = stInsert) and IsIdentityField then begin // DMLRefresh ?
      ActualName := GetActualFieldName(FieldDesc, False);
      FCondSB.Append(ActualName);
      FCondSB.Append(' = ');
      if TOLEDBConnection(TCustomMSDataSet(FOwner).Connection.IConnection).DBMSPrimaryVer > 7 then
        FCondSB.Append('SCOPE_IDENTITY()')
      else
        FCondSB.Append('@@Identity');
      Exit;
    end;
  end;

  inherited;
end;

procedure TMSSQLGenerator.GenerateConditions(SB: StringBuilder;
      const StatementType: TStatementType;
      const ModifiedFieldsOnly: boolean;
      const KeyAndDataFields: TKeyAndDataFields;
      const Index: integer = -1);

  procedure GenerateCondForRQ;
  {SQL Server Books Online -> Accessing and Changing Relational Data ->
   Transact-SQL Syntax Elements -> Using Data Types -> Using Special Data:

   In SQL Server version 7.0 and SQL Server 2000, @@DBTS is only incremented for use
   in timestamp columns. If a table contains a timestamp column, every time a row is
   modified by an INSERT, UPDATE, or DELETE statement, the timestamp value in the row
   is set to the current @@DBTS value, and then @@DBTS is incremented by one...}
  var
    TimestampField: TField;
    MaxTimestamp: Int64;
    FieldDesc: TOLEDBFieldDesc;
  begin
    TimestampField := TCustomMSDataSet(FOwner).FTimestampField;
    if TimestampField = nil then
      DatabaseError(STimestampFieldRequired);

    FieldDesc := TOLEDBFieldDesc(FOwner.GetFieldDesc(TimestampField));
    MaxTimestamp := TOLEDBTableInfo(FieldDesc.TableInfo).MaxTimestamp;
    FCondSB.Append(GetActualFieldName(FOwner.GetFieldDesc(TimestampField) as TCRFieldDesc, True) + ' > ' + '0x' + IntToHex(MaxTimestamp, SizeOf(MaxTimestamp) * 2));
  end;

var
  i: integer;
  FldUsed: set of byte;
  TestChanges: boolean;
begin
  Assert(FOwner <> nil);
  Assert(FOwner.Connection <> nil);
  Assert(IsClass(FOwner.Connection, TCustomMSConnection));

  FCondSB.Length := 0;

  if StatementType = stRefreshQuick then
    GenerateCondForRQ
  else
  begin
    TestChanges := (StatementType = stInsert) and TCustomMSDataSet(FOwner).Options.DMLRefresh and
      (TCustomMSDataSet(FOwner).CursorType = ctDefaultResultSet) and TCustomMSDataSet(FOwner).Options.CheckRowVersion;

    TestChanges := TestChanges or ((StatementType = stUpdate) and TCustomMSDataSet(FOwner).Options.DMLRefresh and
      (TCustomMSDataSet(FOwner).CursorType = ctDefaultResultSet) and TCustomMSDataSet(FOwner).Options.CheckRowVersion);

    if not TestChanges then
      inherited
    else
    begin
      if (TCustomMSDataSet(FOwner).FTimestampField <> nil) and not TCustomMSDataSet(FOwner).FTimestampField.IsNull then
        AddFieldToCondition(FCondSB, FOwner.GetFieldDesc(TCustomMSDataSet(FOwner).FTimestampField) as TCRFieldDesc, StatementType, ModifiedFieldsOnly, Index)
      else
      begin
        FldUsed := [];
        if Length(KeyAndDataFields.KeyFieldDescs) > 0 then
          for i := 0 to High(KeyAndDataFields.KeyFieldDescs) do begin
            AddFieldToCondition(FCondSB, KeyAndDataFields.KeyFieldDescs[i], StatementType, ModifiedFieldsOnly, Index);
            FldUsed := FldUsed + [KeyAndDataFields.KeyFieldDescs[i].FieldNo];
          end;

        if Length(KeyAndDataFields.DataFieldDescs) = 0 then
          DatabaseError(SNoKeyFields);
        for i := 0 to High(KeyAndDataFields.DataFieldDescs) do
          if not IsBlobDataType(KeyAndDataFields.DataFieldDescs[i].DataType) // not "text", "ntext", "image"
            and not (KeyAndDataFields.DataFieldDescs[i].FieldNo in FldUsed) then
            AddFieldToCondition(FCondSB, KeyAndDataFields.DataFieldDescs[i], StatementType, ModifiedFieldsOnly, Index);
      end;
    end;
  end;
end;

procedure TMSSQLGenerator.GenerateLockSQL(const KeyAndDataFields: TKeyAndDataFields; const Index: integer = -1);
begin
  FHeaderSB.Append('SELECT NULL FROM ');
  FHeaderSB.Append(FTableInfo.TableName);
  FHeaderSB.Append(SLLineSeparator);

  (* MSDN: Table Hint (Transact-SQL)
    HOLDLOCK     Makes shared locks more restrictive by holding them until a transaction is completed
    ROWLOCK      Specifies that row locks are taken when page or table locks are ordinarily taken.
    ROWLOCK      Specifies that row locks are taken when page or table locks are ordinarily taken.
    TABLOCK      Specifies that a shared lock is taken on the table held until the end-of-statement. If HOLDLOCK is also specified, the shared table lock is held until the end of the transaction.
    TABLOCKX     Specifies that an exclusive lock is taken on the table. If HOLDOCK is also specified, the lock is held until the transaction completes.
    UPDLOCK      Specifies that update locks are to be taken and held until the transaction completes.
    XLOCK        Specifies that exclusive locks are to be taken and held until the transaction completes.

    ltUpdate:    ROWLOCK, UPDLOCK, HOLDLOCK
    ltExclusive: ROWLOCK, XLOCK
  *)
  case FLockType of
    ltUpdate:
      case FLockObject of
        loRow:
          FMiddleSB.Append('WITH (UPDLOCK, ROWLOCK, HOLDLOCK)');
        loTable:
          FMiddleSB.Append('WITH (UPDLOCK, TABLOCK, HOLDLOCK)');
      end;
    ltExclusive:
      case FLockObject of
        loRow:
          FMiddleSB.Append('WITH (ROWLOCK, XLOCK)');
        loTable:
          FMiddleSB.Append('WITH (TABLOCKX, HOLDLOCK)');
      end;
  end;
  FMiddleSB.Append(SLLineSeparator);
  FMiddleSB.Append('WHERE');
  FMiddleSB.Append(SLLineSeparator);
  FMiddleSB.Append('  ');
  case FLockObject of
    loRow:
      GenerateConditions(FCondSB, stRefresh, False, KeyAndDataFields, Index);
    loTable:
      FCondSB.Append('1 = 0');
  end;
end;

{ TCustomMSDataSet}

procedure TCustomMSDataSet.AutoRefreshTimer(Sender: TObject);
begin
  if State = dsBrowse then begin
    try
      if FTimestampField <> nil then
        RefreshQuick(True)
      else
        Refresh;
    except
      Options.AutoRefresh := False;
      raise;
    end;

    // Reset timer
    FAutoRefreshTimer.Enabled := False;
    FAutoRefreshTimer.Enabled := True;
  end;
end;

function TCustomMSDataSet.QuoteName(const AName: string): string;
begin
  Result := QuoteName(AName, FLeftQuote, FRightQuote);
end;

function TCustomMSDataSet.QuoteName(const AName: string; const LeftQuote, RightQuote: string): string;
begin
  if FOptions.QuoteNames and (AName <> '')
    and ((AName[1] <> LeftQuote) and (AName[Length(AName)] <> RightQuote)) then
    Result := Concat(LeftQuote, AName, RightQuote)
  else
    Result := BracketIfNeed(AName);
end;

function TCustomMSDataSet.GetParams: TMSParams;
begin
  Result := TMSParams(inherited Params);
end;

procedure TCustomMSDataSet.SetParams(Value: TMSParams);
begin
  inherited Params := Value;
end;

constructor TCustomMSDataSet.Create(Owner: TComponent);
begin
  inherited Create(Owner);

  FOptions := inherited Options as TMSDataSetOptions;

  FLeftQuote := OLEDBAccess.LeftQuote;
  FRightQuote := OLEDBAccess.RightQuote;

  FLockInitFieldDefs := False;
  CursorType := ctDefaultResultSet;

  FIdentityField := nil;

  FIsInInitFieldDefs := False;

  FCommandTimeout := 0;
  FetchAll := True;

  FAutoRefreshTimer := TWin32Timer.Create(nil);
  FAutoRefreshTimer.OnTimer := AutoRefreshTimer;
  FAutoRefreshTimer.Interval := Options.AutoRefreshInterval * MSecsPerSec;
  FAutoRefreshTimer.Enabled := Options.AutoRefresh;
  
{$IFNDEF STD}  
  FNeedReflectChanges := False;
{$ENDIF}  
end;

destructor TCustomMSDataSet.Destroy;
begin
  if FAutoRefreshTimer <> nil then begin
    FAutoRefreshTimer.Enabled := False;
    FAutoRefreshTimer.Free;
  end;

  inherited;
end;

procedure TCustomMSDataSet.AssignTo(Dest: TPersistent);
begin
  inherited;

  if Dest is TCustomMSDataSet then begin
    TCustomMSDataSet(Dest).SQLInsert := SQLInsert;
    TCustomMSDataSet(Dest).SQLDelete := SQLDelete;
    TCustomMSDataSet(Dest).SQLUpdate := SQLUpdate;
    TCustomMSDataSet(Dest).SQLRefresh := SQLRefresh;
    TCustomMSDataSet(Dest).CursorType := CursorType;

    TCustomMSDataSet(Dest).Params.Assign(Params);
  end;
end;

{ Open/Close }

procedure TCustomMSDataSet.SetActive(Value: Boolean);
begin
  if Value <> Active then
    if Value then
      SetNumericType;
  try
      
    inherited;

    if Value and (FIRecordSet.FetchExecutor <> nil) then
      FIRecordSet.FetchExecutor.Resume;

  except
    on E: EDAError do begin
      if (E.Message = SCursorTypeChanged) then
        Unprepare;
      raise;
    end;
  end;
end;

procedure TCustomMSDataSet.DataReopen; 
var
  Field: TField;
  FieldDesc: TOLEDBFieldDesc;
  i: integer; 
begin
  // User-defined type
  for i := 0 to Fields.Count - 1 do begin
    Field := Fields[i];
    if Field.DataType = TFieldType(ftMSUDT) then begin
      Assert(Field is TMSUDTField);
      TMSUDTField(Field).SetUDTTypeInfo('', '', '', ''{$IFNDEF CLR}, nil{$ENDIF});
    end;
  end;

  if FCursorType in ServerCursorTypes then
    ClearBuffers;
  inherited;
  
  // User-defined type
  for i := 0 to Fields.Count - 1 do begin
    Field := Fields[i];
    if Field.DataType = TFieldType(ftMSUDT) then begin
      FieldDesc := TOLEDBFieldDesc(GetFieldDesc(Field));
      Assert(Field is TMSUDTField);
      TMSUDTField(Field).SetUDTTypeInfo(FieldDesc.UDTSchemaname, FieldDesc.UDTName, FieldDesc.UDTCatalogname,
        FieldDesc.AssemblyTypename{$IFNDEF CLR}, FieldDesc.UDTDispatcher{$ENDIF});
    end;
  end;
end;

procedure TCustomMSDataSet.InternalRefresh;
begin
  if Options.NonBlocking and (FIRecordSet.FetchExecutor <> nil) then // break previous fetch 
    FIRecordSet.BreakFetch;

  inherited;

  if Options.NonBlocking and (FIRecordSet.FetchExecutor <> nil) then // start new fetch
    FIRecordSet.FetchExecutor.Resume;
end;

procedure TCustomMSDataSet.InternalRefreshQuick(const CheckDeleted: boolean);
begin
  if Options.NonBlocking and (FIRecordSet.FetchExecutor <> nil) then // waiting until the previous fetch completes,
    FIRecordSet.FetchExecutor.WaitFor;                               // because the RefreshQuick function requires all data to be fetched

  inherited;

  if Options.NonBlocking and (FIRecordSet.FetchExecutor <> nil) then // start new fetch
    FIRecordSet.FetchExecutor.Resume;
end;

procedure TCustomMSDataSet.InternalExecute;
begin
  SetNumericType;
  inherited;
  if TCRRecordSet(Data).CommandType = ctCursor then
    InternalInitFieldDefs
  else
    TCRRecordSet(Data).GetCommand.SetCursorState(csInactive); // To prevent blocking execute on second exec
end;

procedure TCustomMSDataSet.InternalOpen;
  function IsAnyFieldDescCanBeModified: boolean;
  var
    i: integer;
  begin
    Result := False;
    for i := 0 to FIRecordSet.Fields.Count - 1 do
      if not FIRecordSet.Fields[i].ReadOnly then begin
        Result := True;
        Break;
      end;
  end;

  procedure FillFieldsOrigin;
  var
    Field: TField;
    FieldDesc: TOLEDBFieldDesc;

    TableName: string;

    i: integer;
  begin
    /// downto to correct set FIdentityField
    for i := Fields.Count - 1 downto 0 do begin
      Field := Fields[i];

      if Field.FieldKind = fkData then begin
        FieldDesc := TOLEDBFieldDesc(GetFieldDesc(Field));

        if not (Self is TCustomMSTable) then begin
          TableName := GenerateTableName(FieldDesc.BaseCatalogName, FieldDesc.BaseSchemaName, FieldDesc.BaseTableName, Connection.Database);
          Field.Origin := TableName + '.' + BracketIfNeed(FieldDesc.BaseColumnName);
        end
        else
          Field.Origin := TCustomMSTable(Self).FTableName + '.' + Field.FieldName;

        if FieldDesc.IsAutoIncrement then begin
          if Options.SetFieldsReadOnly then
            Field.ReadOnly := True;

          Assert((FUpdatingTableInfoIdx >= - 1) and (FUpdatingTableInfoIdx < TablesInfo.Count));

          if (FUpdatingTableInfoIdx >= 0)
            and (FIRecordSet.TablesInfo.IndexByName(GenerateTableName(FieldDesc.BaseCatalogName, FieldDesc.BaseSchemaName, FieldDesc.BaseTableName, Connection.Database)) = FUpdatingTableInfoIdx) then
            FIdentityField := Field;
        {$IFDEF VER5P}
          Field.AutoGenerateValue := arAutoInc;
        {$ENDIF}
        end;

        if FieldDesc.IsTimestamp
          and (FUpdatingTableInfoIdx >= 0)
          and (FieldDesc.BaseTableName = FIRecordSet.TablesInfo[FUpdatingTableInfoIdx].TableName) then
          FTimestampField := Field;
      end;
      if Field.DataType = TFieldType(ftMSXML) then begin
        FieldDesc := TOLEDBFieldDesc(GetFieldDesc(Field));
        Assert(Field is TMSXMLField);
        TMSXMLField(Field).SetSchemaCollection(FieldDesc.XMLSchemaCollectionName,
          FieldDesc.XMLSchemaCollectionCatalogName, FieldDesc.XMLSchemaCollectionSchemaName);
      end
      else
        if Field.DataType = TFieldType(ftMSUDT) then begin
          FieldDesc := TOLEDBFieldDesc(GetFieldDesc(Field));
          Assert(Field is TMSUDTField);
          TMSUDTField(Field).SetUDTTypeInfo(FieldDesc.UDTSchemaname, FieldDesc.UDTName, FieldDesc.UDTCatalogname,
            FieldDesc.AssemblyTypename{$IFNDEF CLR}, FieldDesc.UDTDispatcher{$ENDIF});
        end;
    end;
  end;

var
  i: integer;
  FieldDesc: TFieldDesc;
begin
  if CachedUpdates and (FCursorType in ServerCursorTypes) then
    DatabaseError(SCUandServerCursors);

  inherited;
  //Assert(not FIRecordSet.NativeRowset or (Length(FSQLObjects) <> 0));

  FNeedAddRef := FCursorType in ServerCursorTypes;

  FCanOpenNext := not FICommand.IUnknownNextIsNull;

  if FIRecordSet.NativeRowset then begin
    FIsAnyFieldDescCanBeModified := IsAnyFieldDescCanBeModified;

    if Fields.Count > 0 then
      FillFieldsOrigin;
  end
  else
    FIsAnyFieldDescCanBeModified := False;

  // Set right precision for TFloatField
  for i := 0 to Fields.Count - 1 do
    if (Fields[i] is TFloatField)
      and (TFloatField(Fields[i]).Precision = 15 {Default})
      and (Fields[i].FieldKind = fkData) then begin
      FieldDesc := GetFieldDesc(Fields[i]);
      case FieldDesc.DataType of
        dtFloat, dtCurrency: // Precision cannot be greater then 15
          TFloatField(Fields[i]).Precision := FieldDesc.Length;
      end;
    end;
end;

procedure TCustomMSDataSet.InternalClose;
var
  LockClearMultipleResults: boolean;
  v: Variant;
begin
  inherited;

  FTimestampField := nil;

  if FIsInInitFieldDefs then begin
    FICommand.ClearIUnknown;
    FIRecordSet.GetProp(prLockClearMultipleResults, v);
    LockClearMultipleResults := v;
    if not LockClearMultipleResults then begin
      FICommand.ClearIMultipleResults;
      FICommand.ClearIUnknownNext;
      FCanOpenNext := True;
    end;
  end;
end;

procedure TCustomMSDataSet.OpenCursor(InfoQuery: boolean);
begin

  FIRecordSet.SetProp(prReadOnly, ReadOnly);

  if FIRecordSet.NativeRowset and (SQL.Count = 0) then
    DatabaseError(SEmptySQLStatement, Self);

{$IFNDEF STD}
  if (FChangeNotification <> nil) and FChangeNotification.Enabled then begin
    BeginConnection;
    FChangeNotification.AddNotificator(Self);
  end;
{$ENDIF}

  inherited;

  if Options.DefaultValues then
    GetFieldsInfo;

  if InfoQuery then begin
    TCRRecordSet(Data).GetCommand.SetCursorState(csInactive); // To prevent blocking excute on second exec
    TCRRecordSet(Data).CommandType := CRAccess.ctUnknown;
  end;
end;

procedure TCustomMSDataSet.CloseCursor;
begin
  inherited;

{$IFNDEF STD}  
  if (FChangeNotification <> nil) and FChangeNotification.Enabled then begin
    FChangeNotification.RemoveNotificator(Self);
    EndConnection;
  end;
{$ENDIF}
end;

procedure TCustomMSDataSet.GetFieldsInfo;
var
  MetaData: TMSMetadata;
  Field: TField;
  DefValue: string;
begin
  MetaData := TMSMetadata.Create(nil);
  try
    MetaData.Connection := Connection;
    MetaData.DatabaseName := Connection.Database;
    MetaData.ObjectType := otColumns;
    MetaData.TableName := TablesInfo[FUpdatingTableInfoIdx].TableName;
    MetaData.Open;
    while not MetaData.EOF do begin
      Field := FindField(MetaData.FieldByName('COLUMN_NAME').AsString);
      if (Field <> nil) and MetaData.FieldByName('COLUMN_HASDEFAULT').AsBoolean and not MetaData.FieldByName('COLUMN_DEFAULT').IsNull then begin
        DefValue := MetaData.FieldByName('COLUMN_DEFAULT').AsString;
        case Field.DataType of
          ftBoolean:
            Field.DefaultExpression := BoolToStr(DefValue <> '0', True);
          ftFloat, ftBCD{$IFDEF VER6P}, ftFMTBCD{$ENDIF}:
            Field.DefaultExpression := StringReplace(DefValue, '.', DecimalSeparator, [rfReplaceAll]);
          else
            Field.DefaultExpression := DefValue;
        end;
      end;
      MetaData.Next;
    end;
  finally
    MetaData.Free;
  end;
end;

procedure TCustomMSDataSet.InitFieldDefs;
begin
  FIsInInitFieldDefs := True;
  try
    inherited;
  finally
    FIsInInitFieldDefs := False;
  end;
end;

procedure TCustomMSDataSet.InternalInitFieldDefs;
begin
  if not FLockInitFieldDefs then
    inherited;
end;

function TCustomMSDataSet.GetFielDefSize(FieldType: TFieldType; FieldDesc: TFieldDesc): integer;
begin
  if FieldType = TFieldType(ftMSUDT) then
    Result := FieldDesc.Length
  else
    Result := inherited GetFielDefSize(FieldType, FieldDesc);
end;

function TCustomMSDataSet.GetFieldType(DataType: word): TFieldType;
begin
  Result := {$IFDEF CLR}CoreLab.Sdac.{$ENDIF}MSAccess.GetFieldType(DataType);
end;

function TCustomMSDataSet.GetFieldType(FieldDesc: TFieldDesc): TFieldType;
begin
  if (FieldDesc.DataType in [dtVarBytes, dtExtVarBytes]) and (FieldDesc.SubDataType = dtMSUDT) then
    Result := TFieldType(ftMSUDT)
  else
    Result := inherited GetFieldType(FieldDesc);
end;

function TCustomMSDataSet.GetFieldClass(FieldType: TFieldType): TFieldClass;
begin
  if Integer(FieldType) = ftMSXML then
    Result := TMSXMLField
  else
  if Integer(FieldType) = ftMSUDT then
    Result := TMSUDTField 
  else
    Result := inherited GetFieldClass(Fieldtype);
end;

{$IFDEF USE_FTAUTOINC}
function TCustomMSDataSet.GetFieldType(FieldDesc: TFieldDesc): TFieldType;
begin
  Result := inherited GetFieldType(FieldDesc);
  Assert(FieldDesc is TOLEDBFieldDesc);
  if (Result = ftInteger) and TOLEDBFieldDesc(FieldDesc).IsAutoIncrement then
    Result := ftAutoInc;
end;
{$ENDIF}

procedure TCustomMSDataSet.DataConvert(Field: TField; Source, Dest: TValueBuffer; ToNative: Boolean);
begin
  if Field.DataType = TFieldType(ftMSUDT) then begin
    TMSUDTField(Field).SetFieldDataType(ftVarBytes);
    try
      inherited DataConvert(Field, Source, Dest, ToNative);
    finally
      TMSUDTField(Field).SetFieldDataType(TFieldType(ftMSUDT));
    end;
  end
  else
    inherited DataConvert(Field, Source, Dest, ToNative);
end;

procedure TCustomMSDataSet.CreateIRecordSet;
begin
  inherited;

  if FIRecordSet = nil then
    SetIRecordSet(TOLEDBRecordSet.Create);
end;

procedure TCustomMSDataSet.SetIRecordSet(Value: TData);
begin
  inherited;

  FIRecordSet := TOLEDBRecordSet(Value);

  if FIRecordSet <> nil then begin
    FICommand := TOLEDBCommand(FIRecordSet.GetCommand);
    if FOptions <> nil then begin
      SetNumericType;
      FIRecordSet.SetProp(prUniqueRecords, FOptions.FUniqueRecords);
      FIRecordSet.SetProp(prCursorUpdate, FOptions.FCursorUpdate);
    end;

    FIRecordSet.SetProp(prEnableEmptyStrings, True);
    FIRecordSet.SetProp(prReadOnly, ReadOnly);
    FIRecordSet.SetProp(prCursorType, Integer(CursorType));
    FIRecordSet.SetProp(prCommandTimeout, CommandTimeout);
    FIRecordSet.SetProp(prRequestSQLObjects, True);

    FIRecordSet.SetProp(prRoAfterUpdate, roAfterUpdate in RefreshOptions);

    TOLEDBRecordSet(FIRecordSet).CursorTypeChanged := DoCursorTypeChanged;
  end
  else
    FICommand := nil;
end;

procedure TCustomMSDataSet.SetNumericType;
begin
  if (FIRecordSet <> nil) and (FOptions <> nil) then begin
    if FOptions.EnableBCD or (Connection = nil) or (Connection.Options = nil) then begin
      Assert(FIRecordSet <> nil);
      FIRecordSet.SetProp(prEnableBCD, FOptions.FEnableBCD);
    {$IFDEF VER6P}
      FIRecordSet.SetProp(prEnableFMTBCD, False);
    {$ENDIF}
    end
    else
      case Connection.Options.NumericType of
        ntFloat: begin
          FIRecordSet.SetProp(prEnableBCD, False);
        {$IFDEF VER6P}
          FIRecordSet.SetProp(prEnableFMTBCD, False);
        {$ENDIF}
        end;
        ntBCD: begin
          FIRecordSet.SetProp(prEnableBCD, True);
        {$IFDEF VER6P}
          FIRecordSet.SetProp(prEnableFMTBCD, False);
        {$ENDIF}
        end;
      {$IFDEF VER6P}
        ntFMTBCD: begin
          FIRecordSet.SetProp(prEnableBCD, True);
          FIRecordSet.SetProp(prEnableFMTBCD, True);
        end;
      {$ENDIF}
      end;
  end;
  if FieldDefs <> nil then
    FieldDefs.Updated := False;
end;

function TCustomMSDataSet.GetCanModify: boolean;
begin
  Assert(FIRecordSet <> nil, 'FIRecordSet must be setted to this time');

  Result := inherited GetCanModify or
    not (ReadOnly or UniDirectional) and
    (FIsAnyFieldDescCanBeModified or
    (SQLInsert.Count > 0) or
    (SQLUpdate.Count > 0) or
    (SQLDelete.Count > 0))
    and (FCursorType <> ctStatic);
end;
    
procedure TCustomMSDataSet.CreateCommand;
begin
  SetCommand(TMSSQL.Create(Self));
end;

function TCustomMSDataSet.CreateOptions: TDADataSetOptions;
begin
  Result := TMSDataSetOptions.Create(Self);
end;

function TCustomMSDataSet.GetConnection: TCustomMSConnection;
begin
  Result := TCustomMSConnection(inherited Connection);
end;

procedure TCustomMSDataSet.SetConnection(Value: TCustomMSConnection);
begin
  inherited Connection := Value;
end;

function TCustomMSDataSet.PSGetKeyFields: string;
begin
  if FIRecordSet.NativeRowset then
    Result := inherited PSGetKeyFields
  else
    Result := '';
end;

procedure TCustomMSDataSet.CreateSQLGenerator;
begin
  SetSQLGenerator(TMSSQLGenerator.Create(Self));
end;

procedure TCustomMSDataSet.SetReadOnly(Value: boolean);
begin
  if ReadOnly <> Value then begin
    if CursorType in ServerCursorTypes then
      CheckInactive;
    FieldDefs.Updated := False;
    FIRecordSet.SetProp(prReadOnly, Value);
    FIRecordSet.SetProp(prRequestSQLObjects, FOptions.FUniqueRecords or not Value);
    inherited;
  end;
end;

procedure TCustomMSDataSet.InternalBeforeEdit; 
begin
  if roBeforeEdit in RefreshOptions then begin
    InternalRefreshRecord;
    if CursorType in ServerCursorTypes then
      Resync([]); // CR 9097
  end;

  inherited;
end;

procedure TCustomMSDataSet.UnPrepare;
var
  v: variant;
  LockClearMultipleResults: boolean;
begin
  Close;

  if FICommand <> nil then begin
    FICommand.ClearIUnknown;
    FIRecordSet.GetProp(prLockClearMultipleResults, v);
    LockClearMultipleResults := v;
    if not LockClearMultipleResults then begin
      FICommand.ClearIMultipleResults;
      FICommand.ClearIUnknownNext;
      FCanOpenNext := True;
    end;
  end;

  inherited;
end;

function TCustomMSDataSet.OpenNext: boolean; // Open next rowset in statement. if rowset is not provided then OpenNext return False. If statement has error, then raised exception
begin
  if Prepared then
    DatabaseError(SOpenNextPreparedSQL);

  Result := FCanOpenNext;
  if Result then
    BeginConnection;
  try
    FIRecordSet.SetProp(prLockClearMultipleResults, True);
    try
      Close;
      Unprepare;
    finally
      FIRecordSet.SetProp(prLockClearMultipleResults, False);
    end;

    if Result then begin
      FieldDefs.Updated := False;
      Open;
    end;
  finally
    if Result then
      EndConnection;
  end;
end;

function TCustomMSDataSet.FindParam(const Value: string): TMSParam;
begin
  Result := inherited FindParam(GetParamNameWODog(Value)) as TMSParam;
end;

function TCustomMSDataSet.ParamByName(const Value: string): TMSParam;
begin
  Result := inherited ParamByName(GetParamNameWODog(Value)) as TMSParam;
end;

procedure TCustomMSDataSet.CreateProcCall(Name: string);
begin
  InternalCreateProcCall(Name, True);
end;

procedure TCustomMSDataSet.Post;
begin
  inherited;

{$IFNDEF STD}
  if FNeedReflectChanges then
    Refresh;
{$ENDIF}
end;

procedure TCustomMSDataSet.Cancel;
begin
  inherited;

{$IFNDEF STD}
  if FNeedReflectChanges then
    Refresh;
{$ENDIF}
end;

function TCustomMSDataSet.SQLAddWhere(SQLText, Condition: string): string;
begin
  Result := {$IFDEF CLR}CoreLab.Sdac.{$ENDIF}MSAccess.AddWhere(SQLText, Condition);
end;

function TCustomMSDataSet.SQLDeleteWhere(SQLText: string): string;
begin
  Result := {$IFDEF CLR}CoreLab.Sdac.{$ENDIF}MSAccess.DeleteWhere(SQLText);
end;

function TCustomMSDataSet.SQLGetWhere(SQLText: string): string;
begin
  Result := {$IFDEF CLR}CoreLab.Sdac.{$ENDIF}MSAccess.GetWhere(SQLText);
end;

function TCustomMSDataSet.SQLSetOrderBy(SQLText: string; Fields: string): string;
begin
  Result := {$IFDEF CLR}CoreLab.Sdac.{$ENDIF}MSAccess.SetOrderBy(SQLText, Fields);
end;

function TCustomMSDataSet.SQLGetOrderBy(SQLText: string): string;
begin
  Result := {$IFDEF CLR}CoreLab.Sdac.{$ENDIF}MSAccess.GetOrderBy(SQLText);
end;

procedure TCustomMSDataSet.SetRefreshOptions(Value: TRefreshOptions);
begin
  inherited SetRefreshOptions(Value);
  if FIRecordSet <> nil then
    FIRecordSet.SetProp(prRoAfterUpdate, roAfterUpdate in RefreshOptions);
end;

procedure TCustomMSDataSet.WriteFieldXMLDataType(Field: TField; FieldDesc: TFieldDesc;
  const FieldAlias: string; XMLWriter: XMLTextWriter);
begin
  inherited;

  if FieldDesc is TOLEDBFieldDesc then begin
    if TOLEDBFieldDesc(FieldDesc).IsAutoIncrement
      and not (Field.Required and not Field.ReadOnly) // Already writed in MemDS
    then
      XmlWriter.WriteAttributeString('rs:maybenull', 'false');
  end;
end;

procedure TCustomMSDataSet.WriteFieldXMLAttributeType(Field: TField; FieldDesc: TFieldDesc;
  const FieldAlias: string; XMLWriter: XMLTextWriter);
begin
  inherited;

  if FieldDesc is TOLEDBFieldDesc then begin
    if TOLEDBFieldDesc(FieldDesc).BaseCatalogName <> '' then
      XmlWriter.WriteAttributeString('rs:basecatalog', XMLEncode(TOLEDBFieldDesc(FieldDesc).BaseCatalogName));

    if TOLEDBFieldDesc(FieldDesc).BaseSchemaName <> '' then
      XmlWriter.WriteAttributeString('rs:baseschema', XMLEncode(TOLEDBFieldDesc(FieldDesc).BaseSchemaName));

    if TOLEDBFieldDesc(FieldDesc).IsTimestamp then
      XmlWriter.WriteAttributeString('rs:rowver', 'true');
  end;
end;

procedure TCustomMSDataSet.GetKeyAndDataFields(
      out KeyAndDataFields: TKeyAndDataFields;
      const ForceUseAllKeyFields: boolean);

  procedure ProcessField(FieldDesc: TOLEDBFieldDesc);
  begin
    if FieldDesc.IsKey or FieldDesc.IsAutoIncrement then begin
      SetLength(KeyAndDataFields.KeyFieldDescs, Length(KeyAndDataFields.KeyFieldDescs) + 1);
      KeyAndDataFields.KeyFieldDescs[High(KeyAndDataFields.KeyFieldDescs)] := FieldDesc;
    end;

    if not FieldDesc.ReadOnly then begin
      SetLength(KeyAndDataFields.DataFieldDescs, Length(KeyAndDataFields.DataFieldDescs) + 1);
      KeyAndDataFields.DataFieldDescs[High(KeyAndDataFields.DataFieldDescs)] := FieldDesc;
    end;
  end;

var
  ByTable: boolean;
  Field: TField;
  FieldDesc: TOLEDBFieldDesc;
  i: integer;
  IsNeedProcessField: boolean;

begin
  if (Length(FCachedKeyAndDataFields[ForceUseAllKeyFields].KeyFieldDescs) = 0) and (Length(FCachedKeyAndDataFields[ForceUseAllKeyFields].DataFieldDescs) = 0) then begin
      // Search fields

    SetLength(KeyAndDataFields.KeyFieldDescs, 0);
    SetLength(KeyAndDataFields.DataFieldDescs, 0);

    if (Fields.Count = 0) or (FIRecordSet.Fields.Count = 0) then
      Exit;

    ByTable := False;
    if FUpdatingTableInfoIdx >= 0 then
      if Self is TCustomMSTable then
        ByTable := True
      else
        if not ForceUseAllKeyFields or not Options.FullRefresh then
          ByTable := True;

    for i := 0 to Fields.Count - 1 do begin
      Field := Fields[i];
      if Field.FieldKind = fkData then begin
        FieldDesc := GetFieldDesc(Field) as TOLEDBFieldDesc;
        if ByTable then
          IsNeedProcessField := (Self is TCustomMSTable) or (FieldDesc.TableInfo = TablesInfo[FUpdatingTableInfoIdx])
        else
          IsNeedProcessField := True;
        if IsNeedProcessField then
          ProcessField(FieldDesc);
      end;
    end;

    // Cache result
    FCachedKeyAndDataFields[ForceUseAllKeyFields] := KeyAndDataFields;
  end
  else // Get fields from cache
    KeyAndDataFields := FCachedKeyAndDataFields[ForceUseAllKeyFields];
end;

procedure TCustomMSDataSet.BeginConnection(NoConnectCheck: boolean = True);
begin
   if FIRecordSet.NativeRowset then
     inherited;
end;

procedure TCustomMSDataSet.EndConnection; 
begin
  if FIRecordSet.NativeRowset then
    inherited;
end;

procedure TCustomMSDataSet.SetNumberRange(FieldDef: TFieldDef);
var
  Field: TField;
  FieldDesc: TOLEDBFieldDesc;
{$IFDEF VER6P}
  mv: Extended;
{$ENDIF}
  AIConnection: TOLEDBConnection;
  ServerVersion: integer;
begin
  AIConnection := TMSAccessUtils.FIConnection(Connection);
  ServerVersion := 0;
  if AIConnection <> nil then
    ServerVersion := AIConnection.ProviderPrimaryVer;
  Field := FindField(FieldDef.Name);
  if Field <> nil then begin
    FieldDesc := GetFieldDesc(Field) as TOLEDBFieldDesc;
    case FieldDesc.OLEDBType of
      DBTYPE_UI1:
      begin
        Assert(Field is TWordField);
        TWordField(Field).MinValue := 0;
        TWordField(Field).MaxValue := 255;
      end;
    else
      case FieldDesc.DataType of
        dtInt8:
        begin
          TIntegerField(Field).MinValue := -128;
          TIntegerField(Field).MaxValue := 127;
        end;
        dtInt16:
        begin
          if ServerVersion = 3 then begin
            TSmallIntField(Field).MinValue := -32768;
            TSmallIntField(Field).MaxValue := 32767;
          end
          else begin
            TIntegerField(Field).MinValue := -32768;
            TIntegerField(Field).MaxValue := 32767;
          end;
        end;
        dtInt32:
        begin
          TIntegerField(Field).MinValue := -2147483647;
          TIntegerField(Field).MaxValue := 2147483647;
        end;
        dtInt64:
        begin
          TLargeintField(Field).MinValue := -9223372036854775807;
          TLargeintField(Field).MaxValue := 9223372036854775807;
        end;
        dtWord:
        begin
          TWordField(Field).MinValue := 0;
          TWordField(Field).MaxValue := 65535;
        end;
        dtFloat:
        begin
          if FieldDesc.Scale = 255 then begin
            if FieldDesc.Length = 7 then begin
              TFloatField(Field).MinValue := -3.40E38;
              TFloatField(Field).MaxValue := 3.40E38;
            end
            else
            begin
              TFloatField(Field).MinValue := -1.79E308;
              TFloatField(Field).MaxValue := 1.79E308;
            end;
          end
          else
            if (FieldDesc.Length > 0) then begin
              TFloatField(Field).Precision := FieldDesc.Length;
              TFloatField(Field).MaxValue :=
                IntPower(10, FieldDesc.Length - FieldDesc.Scale) -
                IntPower(10, - Integer(FieldDesc.Scale));
              TFloatField(Field).MinValue := -TFloatField(Field).MaxValue;
            end;
        end;
        dtBCD:
        begin
          TBCDField(Field).Precision := FieldDesc.Length;
          if (FieldDesc.Length > 0) and (FieldDesc.Length <= 15) then begin
            TBCDField(Field).MaxValue :=
              IntPower(10, FieldDesc.Length - FieldDesc.Scale) -
              IntPower(10, - Integer(FieldDesc.Scale));
            TBCDField(Field).MinValue := -TBCDField(Field).MaxValue;
          end;
        end;
      {$IFDEF VER6P}
        dtFmtBCD:
        begin
          TFMTBCDField(Field).Precision := FieldDesc.Length;
          if (FieldDesc.Length > 0) and (FieldDesc.Length <= 15) then begin
            mv :=
              IntPower(10, FieldDesc.Length - FieldDesc.Scale) -
              IntPower(10, - Integer(FieldDesc.Scale));
            TFMTBCDField(Field).MaxValue := FloatToStr(mv);
            TFMTBCDField(Field).MinValue := FloatToStr(-mv);
          end;
        end;
      {$ENDIF}
        dtCurrency:
          if ServerVersion <> 3 then begin
            if FieldDesc.Length = 10 then begin
              TFloatField(Field).MinValue := -214748.3648 ;
              TFloatField(Field).MaxValue := 214748.3647;
            end
            else
              if FieldDesc.Length = 19 then begin
                TFloatField(Field).MinValue := -922337203685477.5808;
                TFloatField(Field).MaxValue := 922337203685477.5807;
              end;
          end
          else begin
            TCurrencyField(Field).MinValue := -922337203685477.5808;
            TCurrencyField(Field).MaxValue := 922337203685477.5807;
          end;
      end;
    end;
  end;
end;

procedure TCustomMSDataSet.DetectIdentityField;
var
  i: integer;
  Field: TField;
  FieldDesc: TOLEDBFieldDesc;
begin
  inherited;

  //Search Identity Field
  for i := FieldCount - 1 downto 0 do begin
    Field := Fields[i];

    if Field.FieldKind = fkData then begin
      FieldDesc := TOLEDBFieldDesc(GetFieldDesc(Field));

      if FieldDesc.IsAutoIncrement then begin

        Assert((FUpdatingTableInfoIdx >= - 1) and (FUpdatingTableInfoIdx < TablesInfo.Count));

        if (FUpdatingTableInfoIdx >= 0)
          and (FIRecordSet.TablesInfo.IndexByName(GenerateTableName(FieldDesc.BaseCatalogName, FieldDesc.BaseSchemaName, FieldDesc.BaseTableName, Connection.Database)) = FUpdatingTableInfoIdx) then
          FIdentityField := Field;
      end;
    end;
  end;
end;

procedure TCustomMSDataSet.SetOptions(Value: TMSDataSetOptions);
begin
  Options.Assign(Value);
end;

{
procedure TCustomMSDataSet.AssignFieldValue(Param: TParam; Field: TField; Old: boolean);
begin
  inherited;
  if Field.IsNull then
    Param.Clear;
end;
}

function TCustomMSDataSet.NeedReturnParams: boolean;
begin
  Result := inherited NeedReturnParams or FOptions.FDMLRefresh;
end;

procedure TCustomMSDataSet.AssignFieldValue(Param: TDAParam; Field: TField; Old: boolean);
var
  FieldDesc: TOLEDBFieldDesc;
begin
  if TDBAccessUtils.IsObjectDataType(Param, Field.DataType) then begin
    FieldDesc := TOLEDBFieldDesc(GetFieldDesc(Field));
    TMSParam(Param).OLEDBType := FieldDesc.OLEDBType;
  end;

  inherited AssignFieldValue(Param, Field, Old);
end;

function TCustomMSDataSet.GetRecord(Buffer: TRecordBuffer; GetMode: TGetMode; DoCheck: boolean): TGetResult;
begin
  Result := grError;
  if (FCursorType = ctDynamic) and (BufferCount > 1) then
    DatabaseError(SBookmarksRequired)
  else
    Result := inherited GetRecord(Buffer, GetMode, DoCheck);
end;

procedure TCustomMSDataSet.InternalSetToRecord(Buffer: TRecordBuffer); 
begin
  inherited;
  
  if (FCursorType in ServerCursorTypes) and (GetBookmarkFlag(Buffer) <> bfInserted) then 
    GetRecord(Buffer, gmCurrent, True);
end;

procedure TCustomMSDataSet.DoAfterExecute(Result: boolean);
begin
  inherited;

{$IFNDEF STD}
  if Result and (FChangeNotification <> nil) and FChangeNotification.Enabled then
    FChangeNotification.StartNotification(Self);
{$ENDIF}
end;

{ Before / After UpdateExecute }

function TCustomMSDataSet.AssignedBeforeUpdateExecute: boolean;
begin
  Result := Assigned(FBeforeUpdateExecute);
end;

procedure TCustomMSDataSet.DoBeforeUpdateExecute(Sender: TDataSet; StatementTypes: TStatementTypes;
  Params: TDAParams);
begin
  if AssignedBeforeUpdateExecute then
    FBeforeUpdateExecute(Sender as TCustomMSDataSet, StatementTypes, Params as TMSParams);
end;

function TCustomMSDataSet.AssignedAfterUpdateExecute: boolean;
begin
  Result := Assigned(FAfterUpdateExecute);
end;

procedure TCustomMSDataSet.DoAfterUpdateExecute(Sender: TDataSet; StatementTypes: TStatementTypes;
  Params: TDAParams);
begin
  if AssignedAfterUpdateExecute then
    FAfterUpdateExecute(Sender as TCustomMSDataSet, StatementTypes, Params as TMSParams);
end;

function TCustomMSDataSet.GetRecCount: longint;
  function GetCount(const s: string): longint;
  var
    i: integer;
    OldParamCheck: boolean;
    UQ: TCustomMSDataSet;
    AIConnection: TOLEDBConnection;
  begin
    CheckUpdateQuery(stCustom);
    UQ := FUpdateQuery as TCustomMSDataSet;

    OldParamCheck := UQ.ParamCheck;
    try
      UQ.ParamCheck := ParamCheck;
      UQ.SQL.Text := s;
      if not ParamCheck then
        for i := 0 to Params.Count {without -1!} do
          UQ.Params.Add;

      if UQ.ParamCount > 0 then begin
        UQ.Params[0].DataType := ftLargeint;
        UQ.Params[0].ParamType := ptOutput;
      end;

      UQ.Macros.Assign(Macros);
      for i := 0 to Params.Count - 1 do
        UQ.Params[i + 1].Assign(Params[i]);

      AIConnection := TMSAccessUtils.FIConnection(Connection);
      if (AIConnection <> nil) and (AIConnection.ProviderPrimaryVer <> 3) then begin
        UQ.Execute;
        Result := UQ.Params[0].Value;
      end
      else begin
        UQ.Open;
        Result := UQ.Fields[0].Value;
      end;
    finally
      UQ.ParamCheck := OldParamCheck;
    end;
  end;

var
  Parser: TMSParser;
  SelectPos: integer;
  FromPos: integer;
  s: string;
  CountParamName: string;

begin
  if ((not FetchAll or Options.NonBlocking) and FOptions.QueryRecCount) // Server cursors or DefaultResultSet with FetchAll = False
    and not ((Params.Count > 0) and (Params[0].ParamType = ptResult)) then begin // Current SQL does not have RETURN parameter
    s := FinalSQL;
    s := {$IFDEF CLR}CoreLab.Sdac.{$ENDIF}MSAccess.SetOrderBy(s, '');
    Parser := TMSParser.Create(s);
    Parser.OmitBlank := False;
    Parser.OmitComment := True;
    try
      if Parser.ToLexem(lxSELECT) <> lcEnd then begin
        SelectPos := Parser.CurrPos;
        if Parser.ToLexem(lxFROM) <> lcEnd then begin
          FromPos := Parser.CurrPos;

          if Connection.Options.Provider <> prCompact then begin
            if ParamCheck then
              CountParamName := ':SDAC_COUNT'
            else
              CountParamName := '?';
            s := 'SET ' + CountParamName + ' = (' + Copy(s, 1, SelectPos) + ' COUNT(*)' + Copy(s, FromPos - 4 {length('FROM')}, MaxInt) + ')';
          end
          else begin
            CountParamName := 'SDAC_COUNT';
            s := Copy(s, 1, SelectPos) + ' COUNT(*) AS ' + CountParamName + ' ' + Copy(s, FromPos - 4 {length('FROM')}, MaxInt);
          end;  
        end;
      end;
    finally
      Parser.Free;
    end;

    if s <> '' then
      Result := GetCount(s)
    else
      Result := 0;
  end
  else
    Result := inherited GetRecCount;
end;

function TCustomMSDataSet.GetRecordCount: integer;
begin
  if (not FetchAll or Options.NonBlocking) and FOptions.QueryRecCount then // Server cursors or DefaultResultSet with FetchAll = False
    Result := FRecordCount
  else
    Result := inherited GetRecordCount;
end;

function TCustomMSDataSet.Fetched: boolean; 
begin
  if FCursorType in ServerCursorTypes then
    Result := False
  else
    Result := inherited Fetched;
end;

procedure TCustomMSDataSet.BeforeExecute;
begin
  inherited;
  
{$IFNDEF STD}
  if (FChangeNotification <> nil) and FChangeNotification.Enabled then begin
    BeginConnection;
    FChangeNotification.AddNotificator(Self);
  end;
{$ENDIF}
end;

procedure TCustomMSDataSet.DoCursorTypeChanged;
var
  v: Variant;
begin
  // Does not need to read ReadOnly property (for changes to static cursor)
  //  FIRecordSet.GetProp(prReadOnly, @ReadOnly);

  FIRecordSet.GetProp(prCursorType, v);
  FCursorType := TMSCursorType(v);
  raise EDAError.Create(0, SCursorTypeChanged);
end;

procedure TCustomMSDataSet.SetFetchAll(Value: boolean);
begin
  //if FetchAll <> Value then // CR 22065 S
  //  UnPrepare;

  inherited;
end;

procedure TCustomMSDataSet.UpdateExecute(const StatementTypes: TStatementTypes);
var
  UserSQL, ROnly: boolean;
  IdentityParamIdx: integer;
  UQParams: TDAParams;
  NewIdentityValue: variant;
  AIConnection: TOLEDBConnection;
begin
  IdentityParamIdx := - 1;
  UQParams := TDBAccessUtils.GetParams(FUpdateQuery);
  AIConnection := TMSAccessUtils.FIConnection(Connection);
  if stInsert in StatementTypes then begin
    if Assigned(UpdateObject) then
      UserSQL := UpdateObject.SQL[DB.ukInsert].Count > 0
    else
      UserSQL := FUpdateSQL[stInsert].Count > 0;

    if not UserSQL then begin // This is not custom user statement and last parameter is used for Identity
      if Options.QueryIdentity and (FIdentityField <> nil) and (CursorType = ctDefaultResultSet) then begin
        if (AIConnection <> nil) and (AIConnection.ProviderPrimaryVer = 3) then
          IdentityParamIdx := 0
        else begin
          IdentityParamIdx := UQParams.Count - 1;
          Assert(IdentityParamIdx >= 0);
          // UQParams[IdentityParamIdx].ParamType := ptInputOutput; - already setted by AddParam 
        end;
      end;
    end;
  end;

  inherited;

  if (IdentityParamIdx >= 0) and not NeedReturnParams then begin
    ROnly := FIdentityField.ReadOnly;
    if ROnly then begin
      SetTempState(State); // DisableControls
      FIdentityField.ReadOnly := False;
    end;
    if (AIConnection <> nil) and (AIConnection.ProviderPrimaryVer = 3) then begin
      TDBAccessUtils.GetSQL(FUpdateQuery).Text := 'SELECT @@IDENTITY';
      TDBAccessUtils.Open(FUpdateQuery);
      NewIdentityValue := TCustomMSDataSet(FUpdateQuery).Fields[IdentityParamIdx].Value;
    end
    else
      NewIdentityValue := UQParams[IdentityParamIdx].Value;
      
    FIdentityField.NewValue := NewIdentityValue;

    if ROnly then begin
      FIdentityField.ReadOnly := True;
      RestoreState(State);
    end
  end;
end;

procedure TCustomMSDataSet.InternalRefreshRecord;
var
  Bookmark: TBookmark;
begin
  case FCursorType of
    ctDefaultResultSet:
      inherited;
    ctStatic, ctKeySet:
    begin
      Bookmark := GetBookmark;
      try
        FIRecordSet.SetToBookmark(Bookmark); // ReFetch
      finally
        FreeBookmark(Bookmark);
      end;
      FRowsAffected := 1; // Must be always OK
    end;
    ctDynamic:
    begin
      if FIRecordSet.FetchToBookmarkValue then
        FRowsAffected := 1
      else
        FRowsAffected := 0;
    end;
  end;
end;

procedure TCustomMSDataSet.CheckUpdateQuery(const StatementType: TStatementType);
var
  UseMSSQL: boolean;
begin
  FUpdateQuery := FUpdateComponents[StatementType];
  if FUpdateQuery = nil then begin
    if not __UseUpdateOptimization then
      UseMSSQL := False
    else
      case StatementType of
        stInsert, stUpdate:
          UseMSSQL := not Options.DMLRefresh;
        stDelete:
          UseMSSQL := True;
        else
          UseMSSQL := False;
      end;
    if UseMSSQL and (Connection.Options.Provider = prCompact) then
      UseMSSQL := not (Options.QueryIdentity and (FIdentityField <> nil));
    if UseMSSQL then begin
      Assert(UsedConnection <> nil);
      FUpdateQuery := TMSSQL.Create(nil);
      TMSSQL(FUpdateQuery).Connection := TCustomMSConnection(UsedConnection);
    end;
  end;
  FUpdateComponents[StatementType] := FUpdateQuery;

  inherited;

  Assert(FUpdateComponents[StatementType] = FUpdateQuery);

  if FUpdateQuery is TCustomMSDataSet then begin
    TCustomMSDataSet(FUpdateQuery).FetchAll := True;
    TCustomMSDataSet(FUpdateQuery).ReadOnly := True;
    TCustomMSDataSet(FUpdateQuery).Options.FlatBuffers := True;
    TCustomMSDataSet(FUpdateQuery).Options.NumberRange := False;
    TCustomMSDataSet(FUpdateQuery).Options.QueryRecCount := False;
    TCustomMSDataSet(FUpdateQuery).Options.QuoteNames := False;
    TCustomMSDataSet(FUpdateQuery).Options.UniqueRecords := False;
    TCustomMSDataSet(FUpdateQuery).Options.FullRefresh := Options.FullRefresh;

    TCustomMSDataSet(FUpdateQuery).FIRecordSet.SetProp(prRequestSQLObjects, False);
  end;
end;

function TCustomMSDataSet.UseParamType: boolean;
begin
  Result := FUseParamType;
end;

function TCustomMSDataSet.PerformSQL(const SQL: string; const StatementTypes: TStatementTypes): boolean;
begin
  try
    Result := inherited PerformSQL(SQL, StatementTypes);
  finally
    FUseParamType := False;
  end;
end;

function TCustomMSDataSet.PerformLockSQL(SQL: string; StatementTypes: TStatementTypes): boolean;
var
  OldStrictUpdate: boolean;
begin
  OldStrictUpdate := Options.StrictUpdate;
  try
    Options.StrictUpdate := False;
    Result := PerformSQL(SQL, StatementTypes);
  finally
    Options.StrictUpdate := OldStrictUpdate;
  end;
end;

function ConvertCRParamTypeToBDE(const Value: TParamDirection): TParamType;
begin
  case Value of
    pdInput:
      Result := ptInput;
    pdInputOutput:
      Result := ptInputOutput;
    pdResult:
      Result := ptResult;
    else
      Assert(False, 'Invalid value in ConvertCRParamTypeToBDE(const Value: TParamDirection): TParamType');
      Result := ptUnknown; // To prevent compiler warning
  end;
end;

procedure TCustomMSDataSet.InternalCreateProcCall(Name: string; NeedDescribe: boolean);
var
  i: integer;
  ParamDescs: TParamDescs;
  ParamDesc: CRAccess.TParamDesc;

  Param: TMSParam;
  ParamType: TParamType;
  IsNewParam: boolean;
  ft: TFieldType;

  ProcCallSQL: string;
{$IFDEF VER6P}
  EnableFmtBcd: variant;
{$ENDIF}
begin
  BeginConnection;
  try
    if not NeedDescribe then
      TMSSQL(FCommand).WriteParams(False);

  {$IFDEF VER6P}
    EnableFmtBcd := FIRecordSet.GetProp(prEnableFMTBCD, EnableFmtBcd);
  {$ENDIF}
    ProcCallSQL := FICommand.CreateProcCall(Name, NeedDescribe, True, Options.EnableBCD, {$IFDEF VER6P}Boolean(EnableFmtBcd){$ELSE}False{$ENDIF});

    if NeedDescribe then
      TMSSQL(FCommand).CreateParams;
      
    if NeedDescribe and (Params <> nil) then begin
      ParamDescs := TOLEDBCommand(FICommand).Params;
      for i := 0 to ParamDescs.Count - 1 do begin
        ParamDesc := ParamDescs[i];
        ParamType := ConvertCRParamTypeToBDE(ParamDesc.GetParamType);

        Param := Params.FindParam(ParamDesc.GetName);
        IsNewParam := Param = nil;
        if IsNewParam then
          Param := TMSParam.Create(Params, ParamType);

        Param.ParamType := ParamType;
        ft := GetFieldType(ParamDesc.GetDataType);
        if ft <> Param.DataType then
          Param.DataType := ft; // To prevent clearing Param.Value on set DataType
        Param.Name := ParamDesc.GetName;
        if IsNewParam then
          Param.Value := ParamDesc.GetValue;
        Param.Size := ParamDesc.GetSize;
      end;
      
      FICommand.SetProp(prDisableParamScan, True);
      try
        FCommand.SQL.Text := ProcCallSQL;
      finally
        FICommand.SetProp(prDisableParamScan, False);
      end;
    end;
  finally
    EndConnection;
  end;
end;

function TCustomMSDataSet.IsRefreshQuickField(FieldDesc: TFieldDesc): boolean;
begin
  Result := TOLEDBFieldDesc(FieldDesc).IsTimestamp;
end;

procedure TCustomMSDataSet.SaveMaxRefreshQuickValue(FieldDesc: TFieldDesc; const Value: variant);
var
  Field: TOLEDBFieldDesc;
  Val: Int64;
{$IFDEF CLR}
  Data: TBytes;
{$ENDIF}
begin
  Field := TOLEDBFieldDesc(FIRecordSet.FindField(FieldDesc.Name));
  if (Field <> nil) and Field.IsTimestamp and (Field.TableInfo <> nil) then begin
  {$IFDEF CLR}
    Data := TBytes(Value);
    System.Array.Reverse(Data, 0, SizeOf(Int64));
    Val := BitConverter.ToInt64(Data, 0);
  {$ELSE}
    Val := Int64(TVarData(Value).VArray.Data^);
    Reverse8(@Val);
  {$ENDIF}
    if {$IFDEF VER7P}UInt64{$ENDIF}(TOLEDBTableInfo(Field.TableInfo).MaxTimestamp) < {$IFDEF VER7P}UInt64{$ENDIF}(Val) then
      TOLEDBTableInfo(Field.TableInfo).MaxTimestamp := Val;
  end;
end;

{ TMSUpdateSQL }

function TMSUpdateSQL.DataSetClass: TCustomDADataSetClass;
begin
  Result := TCustomMSDataSet;
end;

function TMSUpdateSQL.SQLClass: TCustomDASQLClass;
begin
  Result := TMSSQL;
end;

{ TMSQuery }

procedure TMSQuery.SetIRecordSet(Value: TData);
begin
  inherited;

  FIRecordSet := TOLEDBRecordSet(Value);
end;

procedure TCustomMSDataSet.SetCursorType(const Value: TMSCursorType);
begin
  if FCursorType <> Value then begin
    CheckInactive;
    FieldDefs.Updated := False;
    FCursorType := Value;
    if FIRecordSet <> nil then 
      FIRecordSet.SetProp(prCursorType, Integer(CursorType));
  end;
end;

procedure TCustomMSDataSet.SetCommandTimeout(const Value: integer);
begin
  if FCommandTimeout <> Value then begin
    FCommandTimeout := Value;
    if FIRecordSet <> nil then
      FIRecordSet.SetProp(prCommandTimeout, FCommandTimeout);
  end;
end;

procedure TCustomMSDataSet.BreakExec;
begin
  Assert(FICommand <> nil);
  if FICommand.Executing then
    FICommand.BreakExec;
  FIRecordSet.BreakFetch;
end;

procedure TCustomMSDataSet.RefreshQuick(const CheckDeleted: boolean);
begin
  InternalRefreshQuick(CheckDeleted);
end;

procedure TCustomMSDataSet.LockTable(LockType: TMSLockType);
begin
  CheckActive;

  //if FetchAll = False then
  //  DatabaseError('SLockVsFetchAll');
  if not Connection.InTransaction then
    DatabaseError(SMustBeInTransaction);

  Assert(FSQLGenerator is TMSSQLGenerator);
  TMSSQLGenerator(FSQLGenerator).FLockObject := loTable;
  TMSSQLGenerator(FSQLGenerator).FLockType := LockType;
  PerformLockSQL('', [stLock]);
end;

procedure TCustomMSDataSet.Lock(LockType: TMSLockType);
begin
  CheckActive;

  //if FetchAll = False then
  //  DatabaseError('SLockVsFetchAll');
  if not Connection.InTransaction then
    DatabaseError(SMustBeInTransaction);

  Assert(FSQLGenerator is TMSSQLGenerator);
  TMSSQLGenerator(FSQLGenerator).FLockObject := loRow;
  TMSSQLGenerator(FSQLGenerator).FLockType := LockType;
  PerformLockSQL('', [stLock]);
end;

procedure TCustomMSDataSet.CheckInactive;
begin
  inherited;
end;

function TCustomMSDataSet.GetUpdateObject: TMSUpdateSQL;
begin
  Result := TMSUpdateSQL(inherited UpdateObject);
end;

procedure TCustomMSDataSet.SetUpdateObject(Value: TMSUpdateSQL);
begin
  inherited UpdateObject := Value;
end;

{$IFNDEF STD}
procedure TCustomMSDataSet.SetChangeNotification(Value: TMSChangeNotification);
begin
  if FChangeNotification <> nil then
    FChangeNotification.RemoveDataSet(Self);

  FChangeNotification := Value;

  if FChangeNotification <> nil then begin
    CheckInactive;
    FChangeNotification.AddDataSet(Self);
  end;

  if FICommand <> nil then
    FICommand.SetProp(prNotification, FChangeNotification <> nil);
end;

procedure TCustomMSDataSet.ReflectChanges(NotificationInfo: TMSNotificationInfo;
  NotificationSource: TMSNotificationSource; NotificationType: TMSNotificationType);
begin
  if NotificationSource = nsData then begin
    if NotificationInfo in [niTruncate, niInsert, niUpdate, niDelete] then
      if State in [dsInsert, dsEdit] then
        FNeedReflectChanges := True
      else begin
        if (FTimestampField = nil) or (NotificationInfo = niTruncate) then
          Refresh
        else
          if NotificationInfo = niDelete then
            RefreshQuick(True)
          else
            RefreshQuick(False);
        FNeedReflectChanges := False;
      end;
  end
  else
    if NotificationSource = nsTimeout then
      DatabaseError(SSubscriptionTimedOut)
    else
      if NotificationSource = nsObject then
        case NotificationInfo of
          niDrop:
            DatabaseError(SQNObjectDropped);
          niAlter:
            DatabaseError(SQNObjectAltered);
        end
      else
        if NotificationSource = nsSystem then
          case NotificationInfo of
            niError:
              DatabaseError(SSQLInternalError);
            niResource:
              DatabaseError(SSubscriptionRemoved);
          end
        else
          if NotificationSource = nsStatement then
            case NotificationInfo of
              niQuery:
                DatabaseError(SInvalidQNStatement);
              niInvalid:
                DatabaseError(SStatementNotSupported);
              niPreviousFire:
                DatabaseError(SSPreviousInvalid);
              niOptions:
                DatabaseError(SInvalidQNSetOptions);
              niIsolation:
                DatabaseError(SInvalidQNIsolation);
              niTemplateLimit:
                DatabaseError(STemplateLimit);
            end;
end;
{$ENDIF}

{ TMSTable }

function TCustomMSTable.PSGetTableName: string;
begin
  Result := TableName;
end;

procedure TCustomMSTable.PSSetParams(AParams: DB.TParams);
var
  St: string;
  i: integer;
begin
  if (Params.Count <> AParams.Count) then begin
    SQL.Text := '';
    St := '';
    
    for i := 0 to AParams.count - 1 do begin
      if St <> '' then
        St := St + ' AND ';
      St := AParams[i].Name + ' = :' + AParams[i].Name;
    end;

    PrepareSQL;

    if St <> '' then
      AddWhere(St);
  end;

  inherited;
end;

{$IFDEF VER5P}

procedure TCustomMSTable.PSSetCommandText(const CommandText: string);
begin
  if CommandText <> '' then
    TableName := CommandText;
end;

{$ENDIF}

procedure TCustomMSTable.SetTableName(const Value: string);
begin
  if not (csReading in ComponentState) then
    Active := False;
  FTableName := UnbracketIfPossible(Trim(Value));

  SQL.Clear;
end;

procedure TCustomMSTable.SetOrderFields(Value: string);
var
  OldActive: boolean;
begin
  Value := Trim(Value);
  if Value <> FOrderFields then begin
    FOrderFields := Value;
    OldActive := Active;
    if not (csLoading in ComponentState) then
      SQL.Text := '';

    if OldActive then
      Open;
  end;
end;

procedure TCustomMSTable.PrepareSQL;
var
  St: string;
  MasterPos: integer;
  MasterName: string;
  Param: TDAParam;
begin
  //WAR TCustomMSStoredProc.PrepareSQL and TCustomMSTable.PrepareSQL is based on different principies and work in different ways
  if TableName = '' then
    DatabaseError(STableNameNotDefined);

  if SQL.Count = 0 then begin
    St := 'SELECT * FROM ' + BracketIfNeed(TableName);

    if OrderFields <> '' then
      St := St + ' ORDER BY ' + OrderFields;

    SQL.Text := St;
  end;

  // CR 8883
  // for TMSQuery second MD-way is more useful
  if (DataSource <> nil) and (FMasterFields <> '') and (FDetailFields <> '') and not DataSource.DataSet.Active// see TCustomDADataSet.GetFinalSQL
  then begin
    MasterPos := 1;
    while True do begin
      MasterName := ExtractFieldName(FMasterFields, MasterPos);
      if MasterName <> '' then begin
        Param := Params.FindParam(MasterName);
        if Param <> nil then
          Param.DataType := ftString;
      end
      else
        break;
    end;
  end;
end;

procedure TCustomMSTable.Prepare;
begin
  PrepareSQL;

  inherited;
end;

procedure TCustomMSTable.OpenCursor(InfoQuery: boolean);
begin
  PrepareSQL;

  inherited;
end;

procedure TCustomMSTable.Execute;
begin
  PrepareSQL;

  inherited;
end;

procedure TCustomMSTable.AssignTo(Dest: TPersistent);
begin
  inherited;

  if Dest is TCustomMSTable then begin
    TCustomMSTable(Dest).OrderFields := OrderFields;
    TCustomMSTable(Dest).TableName := TableName;
    TCustomMSTable(Dest).MasterSource := MasterSource;
    TCustomMSTable(Dest).MasterFields := MasterFields;
    TCustomMSTable(Dest).DetailFields := DetailFields;
  end;
end;

function TCustomMSTable.SQLAutoGenerated: boolean;
begin
  Result := True;
end;

{ TCustomMSStoredProc }

{$IFDEF VER5P}

procedure TCustomMSStoredProc.PSSetCommandText(const CommandText: string);
begin
  if CommandText <> '' then
    StoredProcName := CommandText;
end;

{$ENDIF}

procedure TCustomMSStoredProc.SetIRecordSet(Value: TData);
begin
  inherited;

  if FICommand <> nil then
    FICommand.SetProp(prIsSProc, True);
end;

procedure TCustomMSStoredProc.SetStoredProcName(const Value: string);
begin
  if Value <> FStoredProcName then begin
    SQL.Text := '';

    FStoredProcName := Trim(Value);

    if (Connection <> nil) and Connection.Connected and (FStoredProcName <> '') then
      PrepareSQL;

    if FICommand <> nil then
      FICommand.SetProp(prIsSProc, True);
  end;
end;

function TCustomMSStoredProc.SQLAutoGenerated: boolean;
begin
  Result := True;
end;

procedure TCustomMSStoredProc.PrepareSQL;
begin
  //WAR TCustomMSStoredProc.PrepareSQL and TCustomMSTable.PrepareSQL is based on different principies and work in different ways
  
  if SQL.Text = '' then begin
    if StoredProcName = '' then
      DatabaseError(SStoredProcNotDefined);

    InternalCreateProcCall(StoredProcName, Params.Count = 0);
  end;
end;

procedure TCustomMSStoredProc.Prepare;
begin
  PrepareSQL;

  FIsInPrepare := True;
  try
    inherited;
  finally
    FIsInPrepare := False;
  end;
end;

procedure TCustomMSStoredProc.BeforeExecute;
begin
  if not Prepared then
    PrepareSQL;

  inherited;
end;

procedure TCustomMSStoredProc.BeforeOpenCursor(InfoQuery: boolean);
begin
  PrepareSQL;

  inherited;
end;

procedure TCustomMSStoredProc.CreateFieldDefs;
begin
  if not FIsInPrepare then
    inherited;
end;

procedure TCustomMSStoredProc.ExecProc;
begin
  Execute;
end;

procedure TCustomMSStoredProc.AssignTo(Dest:TPersistent);
var
  I: Integer;
  P: TMSParam;
begin
  inherited;
                     
  if Dest is TCustomMSStoredProc then begin
    TCustomMSStoredProc(Dest).StoredProcName := FStoredProcName;

    for I := 0 to Params.Count - 1 do begin
      P := TCustomMSStoredProc(Dest).FindParam(Params[I].Name);
      if (P <> nil) and (P.DataType = Params[I].DataType) then begin
        P.Assign(Params[I]);
      end;
    end;
  end;
end;

{ TMSMetadata }

constructor TMSMetadata.Create(Owner: TComponent); 
begin
  inherited;

  Debug := False;
  
  ReadOnly := True;
end;


procedure TMSMetadata.SetDatabaseName(Value: string);    
begin
  Active := False;
  FDatabaseName := Value;
end;

procedure TMSMetadata.SetSchemaName(Value: string);    
begin
  Active := False;
  FSchemaName := Value;
end;

procedure TMSMetadata.SetObjectType(Value: TMSObjectType);    
begin
  Active := False;
  FieldDefs.Updated := False;
  FObjectType := Value;
end;

procedure TMSMetadata.SetTableName(Value: string);    
begin
  Active := False;
  FTableName := Value;
end;

procedure TMSMetadata.SetStoredProcName(Value: string);    
begin
  Active := False;
  FStoredProcName := Value;
end;

procedure TMSMetadata.SetColumnName(Value: string);    
begin
  Active := False;
  FColumnName := Value;
end;

procedure TMSMetadata.SetIndexName(Value: string);    
begin
  Active := False;
  FIndexName := Value;
end;

procedure TMSMetadata.SetConstraintName(Value: string);    
begin
  Active := False;
  FConstraintName := Value;
end;

procedure TMSMetadata.SetLinkedServer(Value: string);
begin
  Active := False;
  FLinkedServer := Value;
end;

procedure TMSMetadata.SetAssemblyName(Value: string);
begin
  Active := False;
  FAssemblyName := Value;
end;

procedure TMSMetadata.SetAssemblyID(Value: integer);
begin
  Active := False;
  FAssemblyID := Value;
end;

procedure TMSMetadata.SetReferencedAssemblyID(Value: integer);
begin
  Active := False;
  FReferencedAssemblyID := Value;
end;

procedure TMSMetadata.SetUDTName(Value: string);
begin
  Active := False;
  FUDTName := Value;
end;

procedure TMSMetadata.SetSchemaCollectionName(Value: string);
begin
  Active := False;
  FSchemaCollectionName := Value;
end;

procedure TMSMetadata.SetTargetNamespaceURI(Value: string);
begin
  Active := False;
  FTargetNamespaceURI := Value;
end;

procedure TMSMetadata.SetStatisticsName(Value: string);
begin
  Active := False;
  FStatisticsName := Value;
end;

function TMSMetadata.RequestIRowset: IRowset;
  function GetTableType: string;
  begin
    case ObjectType of
      otAliases, otAliasesInfo: 
        Result := 'ALIAS';
      otTables, otTablesInfo: 
        Result := 'TABLE';
      otSynonyms, otSynonymsInfo: 
        Result := 'SYNONYM';
      otSystemTables, otSystemTablesInfo: 
        Result := 'SYSTEM TABLE';
      otViews, otViewsInfo: 
        Result := 'VIEW';
      otGlobalTempTables, otGlobalTempTablesInfo:
        Result := 'GLOBAL TEMPORARY';
      otLocalTempTables, otLocalTempTablesInfo: 
        Result := 'LOCAL TEMPORARY';
      otSystemViews, otSystemViewsInfo:
        Result := 'SYSTEM VIEW';
      otExternalTablesInfo:
        Result := 'EXTERNAL TABLE';
    end;
  end;

var
  Schema: TGUID;
  rgRestrictions: TRestrictions;
begin
  BeginConnection;
  try
    case ObjectType of
      otDatabases:
      begin
        SetLength(rgRestrictions, 1);
        Schema := DBSCHEMA_CATALOGS;
        rgRestrictions[0] := DatabaseName;
      end;
      otColumnPrivileges:
      begin
        SetLength(rgRestrictions, 6);
        Schema := DBSCHEMA_COLUMN_PRIVILEGES;
        rgRestrictions[0] := DatabaseName;
        rgRestrictions[1] := SchemaName;
        rgRestrictions[2] := TableName;
        rgRestrictions[4 - 1] := ColumnName;
      end;
      otColumns:
      begin
        SetLength(rgRestrictions, 4);
        Schema := DBSCHEMA_COLUMNS;
        if Connection.Options.Provider <> prCompact then begin
          rgRestrictions[0] := DatabaseName;
          rgRestrictions[1] := SchemaName;
        end;
        rgRestrictions[2] := TableName;
        rgRestrictions[4 - 1] := ColumnName;
      end;
      otForeignKeys:
      begin
        SetLength(rgRestrictions, 6);
        rgRestrictions[3] := DatabaseName;
        rgRestrictions[4] := SchemaName;
        rgRestrictions[5] := TableName;
        Schema := DBSCHEMA_FOREIGN_KEYS;
      end;
      otPrimaryKeys:
      begin
        if Connection.Options.Provider <> prCompact then begin
          SetLength(rgRestrictions, 3);
          rgRestrictions[0] := DatabaseName;
          rgRestrictions[1] := SchemaName;
          rgRestrictions[2] := TableName;
          Schema := DBSCHEMA_PRIMARY_KEYS;
        end
        else begin
          SetLength(rgRestrictions, 7);
          rgRestrictions[2] := ConstraintName;
          rgRestrictions[5] := TableName;
          // Other Restriction columns not supported
          Schema := DBSCHEMA_KEY_COLUMN_USAGE;
        end;
      end;
      otIndexes:
      begin
        SetLength(rgRestrictions, 5);
        if Connection.Options.Provider <> prCompact then begin
          rgRestrictions[0] := DatabaseName;
          rgRestrictions[1] := SchemaName;
        end;
        rgRestrictions[2] := IndexName;
        rgRestrictions[4] := TableName;
        Schema := DBSCHEMA_INDEXES;
      end;
      otServerTypes:
      begin
        SetLength(rgRestrictions, 0);
        Schema := DBSCHEMA_PROVIDER_TYPES;
      end;
      otSchemata:
      begin
        SetLength(rgRestrictions, 2);
        Schema := DBSCHEMA_SCHEMATA;
        rgRestrictions[0] := DatabaseName;
        rgRestrictions[1] := SchemaName;
      end;
      otStatistics:
      begin
        SetLength(rgRestrictions, 3);
        Schema := DBSCHEMA_STATISTICS;
        rgRestrictions[0] := DatabaseName;
        rgRestrictions[1] := SchemaName;
        rgRestrictions[2] := TableName;
      end;
      otStoredProcs:
      begin
        SetLength(rgRestrictions, 3);
        Schema := DBSCHEMA_PROCEDURES;
        rgRestrictions[0] := DatabaseName;
        rgRestrictions[1] := SchemaName;
        rgRestrictions[2] := StoredProcName;
      end;
      otStoredProcParams:
      begin
        SetLength(rgRestrictions, 3);
        Schema := DBSCHEMA_PROCEDURE_PARAMETERS;
        rgRestrictions[0] := DatabaseName;
        rgRestrictions[1] := SchemaName;
        rgRestrictions[2] := StoredProcName;
      end;
      otAliases, otTables, otSynonyms, otSystemTables, otViews, otGlobalTempTables, otLocalTempTables, otSystemViews,
      otAliasesInfo, otTablesInfo, otSynonymsInfo, otSystemTablesInfo, otViewsInfo, otGlobalTempTablesInfo, otLocalTempTablesInfo, otExternalTablesInfo, otSystemViewsInfo:
      begin
        SetLength(rgRestrictions, 4);

        if ObjectType in [otAliases, otTables, otSynonyms, otSystemTables, otViews, otGlobalTempTables, otLocalTempTables, otSystemViews] then
          Schema := DBSCHEMA_TABLES
        else
          Schema := DBSCHEMA_TABLES_INFO;
        if Connection.Options.Provider <> prCompact then begin
          rgRestrictions[0] := DatabaseName;
          rgRestrictions[1] := SchemaName;
        end;
        rgRestrictions[2] := TableName;
        rgRestrictions[3] := GetTableType;
      end;
      otTableConstraints:
      begin
        SetLength(rgRestrictions, 6);
        Schema := DBSCHEMA_TABLE_CONSTRAINTS;
        if Connection.Options.Provider <> prCompact then begin
          rgRestrictions[0] := DatabaseName;
          rgRestrictions[1] := SchemaName;
        end;
        rgRestrictions[2] := ConstraintName;
        rgRestrictions[5] := TableName;
      end;
      otTablePrivileges:
      begin
        SetLength(rgRestrictions, 3);
        Schema := DBSCHEMA_TABLE_PRIVILEGES;
        rgRestrictions[0] := DatabaseName;
        rgRestrictions[1] := SchemaName;
        rgRestrictions[2] := TableName;
      end;
      otLinkedServers: begin
        SetLength(rgRestrictions, CRESTRICTIONS_DBSCHEMA_LINKEDSERVERS{1});
        Schema := DBSCHEMA_LINKEDSERVERS;
        rgRestrictions[0] := LinkedServer;
      end;
      otAssemblies: begin
        SetLength(rgRestrictions, CRESTRICTIONS_DBSCHEMA_SQL_ASSEMBLIES{4});
        Schema := DBSCHEMA_SQL_ASSEMBLIES;
        rgRestrictions[0] := DatabaseName;
        rgRestrictions[1] := SchemaName;
        rgRestrictions[2] := AssemblyName;
        if AssemblyID <> 0 then
          rgRestrictions[3] := AssemblyID;
      end;
      otAssemblyDependencies: begin
        SetLength(rgRestrictions, CRESTRICTIONS_DBSCHEMA_SQL_ASSEMBLY_DEPENDENCIES{4});
        Schema := DBSCHEMA_SQL_ASSEMBLY_DEPENDENCIES;
        rgRestrictions[0] := DatabaseName;
        rgRestrictions[1] := SchemaName;
        if AssemblyID <> 0 then
          rgRestrictions[2] := AssemblyID;
        if ReferencedAssemblyID <> 0 then
          rgRestrictions[3] := ReferencedAssemblyID;
      end;
      otUserTypes: begin
        SetLength(rgRestrictions, CRESTRICTIONS_DBSCHEMA_SQL_USER_TYPES{3});
        Schema := DBSCHEMA_SQL_USER_TYPES;
        rgRestrictions[0] := DatabaseName;
        rgRestrictions[1] := SchemaName;
        rgRestrictions[2] := UDTName;
      end;
      otXMLCollections: begin
        SetLength(rgRestrictions, CRESTRICTIONS_DBSCHEMA_XML_COLLECTIONS{4});
        Schema := DBSCHEMA_XML_COLLECTIONS;
        rgRestrictions[0] := DatabaseName;
        rgRestrictions[1] := SchemaName;
        rgRestrictions[2] := SchemaCollectionName;
        rgRestrictions[3] := TargetNamespaceURI;
      end;
      otCheckConstraints: begin
        SetLength(rgRestrictions, 3);
        Schema := DBSCHEMA_CHECK_CONSTRAINTS;
        rgRestrictions[0] := DatabaseName;
        rgRestrictions[1] := SchemaName;
        rgRestrictions[2] := ConstraintName;
      end;
      otCheckConstraintsByTable: begin
        SetLength(rgRestrictions, 6);
        Schema := DBSCHEMA_CHECK_CONSTRAINTS_BY_TABLE;
        rgRestrictions[0] := DatabaseName;
        rgRestrictions[1] := SchemaName;
        rgRestrictions[2] := TableName;
        rgRestrictions[3] := DatabaseName;
        rgRestrictions[4] := SchemaName;
        rgRestrictions[5] := ConstraintName;
      end;
      otTableStatistics: begin
        SetLength(rgRestrictions, 7);
        Schema := DBSCHEMA_TABLE_STATISTICS;
        rgRestrictions[0] := DatabaseName;
        rgRestrictions[1] := SchemaName;
        rgRestrictions[2] := TableName;
        rgRestrictions[3] := DatabaseName;
        rgRestrictions[4] := SchemaName;
        rgRestrictions[5] := StatisticsName;
      end;
    end;

    Result := FIRecordSet.GetSchemaRowset(Schema, rgRestrictions);
  finally
    EndConnection;
  end;
end;

procedure TMSMetadata.InternalExecute;
var
  Rowset: IRowset;
begin
  Rowset := RequestIRowset;
  FIRecordSet.SetIRowset(Rowset, False);
  inherited;
end;

procedure TMSMetadata.OpenCursor(InfoQuery: boolean);
var
  Rowset: IRowset;
begin
  Rowset := RequestIRowset;
  FIRecordSet.SetIRowset(Rowset, False);
  inherited;
end;

{ TMSSQL }

constructor TMSSQL.Create(Owner: TComponent);
begin
  inherited;

  FAutoCommit := True;
  FCommandTimeout := 0;
  Macros.SetParserClass(TMSParser);
end;

function TMSSQL.GetPermitPrepare: boolean;
begin
  Result := False;
end;

procedure TMSSQL.SetPermitPrepare(Value: boolean);
begin
end;

procedure TMSSQL.CreateICommand;
begin
  inherited;

  if FICommand = nil then
    SetICommand(TOLEDBCommand.Create);
end;

procedure TMSSQL.SetICommand(Value: TCRCommand);
begin
  FICommand := TOLEDBCommand(Value);

  if FICommand <> nil then begin
    FICommand.SetProp(prCommandTimeout, CommandTimeout);
    FICommand.ReadParams := ReadParams;
  end;

  inherited;
end;

procedure TMSSQL.InternalPrepare; 
begin
  if SQL.Count = 0 then
    DatabaseError(SEmptySQLStatement, Self);
    
  WriteParams;

  inherited;
end;

procedure TMSSQL.InternalExecute(Iters: integer); 
begin
  inherited;
  FICommand.SetCursorState(csInactive); // To prevent blocking execute on second exec
end;

function TMSSQL.GetConnection: TCustomMSConnection;
begin
  Result := TCustomMSConnection(inherited Connection);
end;

procedure TMSSQL.SetConnection(Value: TCustomMSConnection);
begin
  inherited Connection := Value;
end;

function TMSSQL.GetParams: TMSParams;
begin
  Result := TMSParams(inherited Params);
end;

procedure TMSSQL.SetParams(Value: TMSParams);
begin
  inherited Params := Value;
end;

procedure TMSSQL.AssignTo(Dest: TPersistent); 
begin
  inherited;

  if Dest is TMSSQL then begin
    TMSSQL(Dest).Params.Assign(Params);
    TMSSQL(Dest).NonBlocking := NonBlocking;
    TMSSQL(Dest).AfterExecute := AfterExecute;
  end;
end;

function TMSSQL.ParseSQL(const SQL: string; Params: TDAParams; RenamePrefix: string = ''): string;
begin
{$IFDEF CLR}
  if SQL.IndexOf(Char(':')) = -1 then
{$ELSE}
  if StrScan(PChar(SQL), ':') = nil then
{$ENDIF}
    Result := SQL // query without parameters
  else
    Result := inherited ParseSQL(SQL, Params, RenamePrefix);
end;

function TMSSQL.CreateParser(const Text: string): TParser;
begin
  Result := TMSParser.Create(Text);
end;

procedure TMSSQL.AssembleSQL;
begin
  if ParamCheck or (csDesigning in ComponentState) then
    inherited
  else begin
    FNativeSQL := SQL.Text;
    FNativeSQL := ParseSQL(nil);
    FICommand.SetSQL(FNativeSQL);
  end;
end;

function TMSSQL.CreateParamsObject: TDAParams;
begin
  Result := TMSParams.Create(Self);
end;

procedure TMSSQL.CreateParams;
var
  ParamDesc: TOLEDBParamDesc;
  i: integer;
begin
  Params.BeginUpdate;
  try
    Params.Clear;
    for i := 0 to FICommand.GetParamCount - 1 do begin
      ParamDesc := FICommand.GetParam(i);
      with Params.Add as TDAParam do begin
        Name := ParamDesc.GetName;
        DataType := GetFieldType(ParamDesc.GetDataType);
        ParamType := TParamType(ParamDesc.GetParamType);
      end;
    end;
  finally
    Params.EndUpdate;
  end;
end;

procedure TMSSQL.WriteParams(WriteValue: boolean = True);
var
  Param: TMSParam;
  ParamDesc: TOLEDBParamDesc;
  dt: word;

  procedure WriteParamValue;
  var
    Value: Variant;
  {$IFDEF CLR}
    Value1, Value2: TBytes;
  {$ELSE}
    Value1: Variant;
  {$ENDIF}
    i, l: integer;
    s: string;
    CurrentConnection: TCustomMSConnection;
  begin
    if not Param.Bound then
      TOLEDBParamDesc(ParamDesc).SetUseDefaultValue(True);
    
    if Param.IsObjectDataType then begin
      ParamDesc.SetNull(Param.IsNull);
      ParamDesc.SetObject(Param.ParamObject);
      Exit;
    end;

    Value := Param.Value;
    if (Param.DataType = ftDate) and not (VarIsEmpty(Value) or VarIsNull(Value)) then
      Value := Int(Value); // drop time info

    // SQL Server Everywhere
    CurrentConnection := Connection;
    if (CurrentConnection = nil) and (FDataSet <> nil) then
      CurrentConnection := TCustomMSConnection(FDataSet.Connection);
      
    Assert(CurrentConnection <> nil);

    if (CurrentConnection.Options.Provider = prCompact) and (Param.OLEDBType = DBTYPE_UI1) then
      ParamDesc.SetDataType(dtInt8);

    // Convert param values if need
    if (dt in [dtBytes, dtVarBytes, dtBlob])
      and (VarType(Value) <> varArray + varByte) then
      case VarType(Value) of
        varEmpty, varNull:;
        varShortInt {1 byte},
        varSmallint {2 bytes},
        varInteger {4 bytes},
        varInt64 {8 bytes},
        varByte {1 byte},
        varWord {2 bytes},
        varLongWord {4 bytes}: begin
          case VarType(Value) of
            varShortInt, varByte:
              l := 1;
            varSmallint, varWord:
              l := 2;
            varInteger, varLongWord:
              l := 4;
            varInt64:
              l := 8;
            else
            begin
              Assert(False);
              l := - 1;
            end;
          end;

          // reverse bytes order
        {$IFDEF CLR}
          Value1 := BitConverter.GetBytes(Int64(Value));
          //Assert(l = Length(Value1));
          SetLength(Value2, l);
          for i := 0 to l - 1 do
            Value2[i] := Value1[l - 1 - i];
          Value := Value2;
        {$ELSE}
          Value1 := VarArrayCreate([0, l - 1], varByte);

          for i := 0 to l - 1 do
            PChar(TVarData(Value1).VArray.Data)[i] := PChar(@TVarData(Value).VInteger)[l - 1 - i];
          Value := Unassigned;
          Value := Value1;
        {$ENDIF}
        end;
        varString{$IFDEF CLR}, varChar{$ENDIF}: begin
          s := Value;
          Value := Encoding.Default.GetBytes(s);
        end;
      end;
    ParamDesc.SetValue(Unassigned);
    ParamDesc.SetValue(Value);
  end;

var
  ft: TFieldType;
  i, l: integer;
begin
  for i := 0 to Params.Count - 1 do begin
    Param := Params[i] as TMSParam;
    if i < FICommand.GetParamCount then
      ParamDesc := TOLEDBParamDesc(FICommand.GetParam(i))
    else
      ParamDesc := TOLEDBParamDesc(FICommand.AddParam);
    ParamDesc.SetName(Param.Name);

    ft := Param.DataType;
    dt := GetDataType(ft);
    if dt = dtUnknown then
      case ft of
        {$IFDEF VER5P}
        ftGuid:
          dt := dtGuid;
        {$ENDIF}
        ftUnknown:
          dt := dtUnknown;
        ftBCD:
          dt := dtBCD;
        ftWideString:
          dt := dtWideString;
      else
        dt := dtString;
  //        Assert(False, Format('Invalid Param.DataType - %d', [Integer(ft)]));
      end;

    Assert(Param is TMSParam, 'Param must be TMSParam');
    l := TMSParam(Param).Size;
    ParamDesc.SetSize(l);

    ParamDesc.SetDataType(dt);
    ParamDesc.SetParamType(TParamDirection(Param.ParamType));
    ParamDesc.SetOLEDBType(Param.OLEDBType);

    if WriteValue then 
      WriteParamValue;
  end;
  while Params.Count < FICommand.GetParamCount do
    FICommand.DeleteParam(FICommand.GetParamCount - 1);
end;

procedure TMSSQL.ReadParams;
var
  v: Variant;
begin
  Assert(FICommand <> nil);
  if FICommand.IUnknownIsNull and FICommand.IMultipleResultsIsNull then begin
    FICommand.GetProp(prCanReadParams, v);
    if Boolean(v) then begin
      inherited;
      FICommand.SetProp(prCanReadParams, False);
    end;
  end;
end;

function TMSSQL.FindParam(const Value: string): TMSParam;
begin
  Result := inherited FindParam(GetParamNameWODog(Value)) as TMSParam;
end;

function TMSSQL.ParamByName(const Value: string): TMSParam;
begin
  Result := inherited ParamByName(GetParamNameWODog(Value)) as TMSParam;
end;

procedure TMSSQL.SetCommandTimeout(const Value: integer);
begin
  if FCommandTimeout <> Value then begin
    FCommandTimeout := Value;
    if FICommand <> nil then
      FICommand.SetProp(prCommandTimeout, FCommandTimeout);
  end;
end;

procedure TMSSQL.SetNonBlocking(const Value: boolean);
begin
  if FNonBlocking <> Value then begin
    FNonBlocking := Value;
    if FICommand <> nil then
      FICommand.SetProp(prNonBlocking, FNonBlocking);
  end;
end;

procedure TMSSQL.Execute(Iters: integer);
begin
  if NonBlocking and Executing then
    DatabaseError(SAsynchExecuting);

  inherited Execute(Iters);
end;

procedure TMSSQL.BreakExec;
begin
  Assert(FICommand <> nil);
  FICommand.BreakExec;
end;

procedure TMSSQL.UnPrepare;
begin
{  if Executing then
    BreakExec;
  Assert(not Executing);}
  inherited;
end;

procedure TMSSQL.ExecuteForXML(out XML: string);
var
  Stream: TStringStream;
begin
  Stream := TStringStream.Create(''{$IFDEF CLR}{$IFDEF VER9P}, Encoding.Unicode{$ENDIF}{$ENDIF});
  try
    ExecuteForXML(Stream,
    {$IFDEF CLR}
      oeUnicode
    {$ELSE}
      oeANSI
    {$ENDIF}
    );
    XML := Stream.DataString;
  finally
    Stream.Free;
  end;
end;

{$IFNDEF BCB}
procedure TMSSQL.ExecuteForXML(out XML: UTF8String);
var
  Stream: TStringStream;
begin
  Stream := TStringStream.Create('');
  try
    ExecuteForXML(Stream, oeUTF8);
    XML := Stream.DataString;
  finally
    Stream.Free;
  end;
end;
{$ENDIF}

{$IFNDEF CLR}
{$IFDEF VER6P}
procedure TMSSQL.ExecuteForXML(out XML: WideString);
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    ExecuteForXML(Stream, oeUnicode);
    XML := Marshal.PtrToStringUni(Stream.Memory, Stream.Size div 2);
  finally
    Stream.Free;
  end;
end;
{$ENDIF}
{$ENDIF}

procedure TMSSQL.ExecuteForXML(Stream: TStream; OutputEncoding: TOLEDBOutputEncoding);
begin
  FICommand.SetProp(prOutputStream, {$IFDEF CLR}Variant{$ELSE}Integer{$ENDIF}(Stream));
  try
    FICommand.SetProp(prOutputEncoding, Integer(OutputEncoding));
    Execute;
  finally
    FICommand.SetProp(prOutputStream, {$IFDEF CLR}Variant{$ELSE}Integer{$ENDIF}(nil));
  end;
end;

procedure TMSSQL.CreateProcCall(Name: string);
var
  NeedDescribe: boolean;
  ParamDescs: TParamDescs;
  ParamDesc: CRAccess.TParamDesc;
  
  Param: TMSParam;
  ParamType: TParamType;
  IsNewParam: boolean;
  ft: TFieldType;
  i: integer;

  ProcCallSQL: string;
begin
  BeginConnection;
  try
    NeedDescribe := Params.Count = 0;
    if NeedDescribe then begin
      ProcCallSQL := FICommand.CreateProcCall(Name, True, True, False, False);
      CreateParams;
    end
    else begin
      WriteParams(False);
      ProcCallSQL := FICommand.CreateProcCall(Name, False, True, False, False);
    end;
      
    if NeedDescribe and (Params <> nil) then begin
      ParamDescs := TOLEDBCommand(FICommand).Params;
      for i := 0 to ParamDescs.Count - 1 do begin
        ParamDesc := ParamDescs[i];
        ParamType := ConvertCRParamTypeToBDE(ParamDesc.GetParamType);

        Param := Params.FindParam(ParamDesc.GetName);
        IsNewParam := Param = nil;
        if IsNewParam then
          Param := TMSParam.Create(Params, ParamType);

        Param.ParamType := ParamType;
        ft := GetFieldType(ParamDesc.GetDataType);
        if ft <> Param.DataType then
          Param.DataType := ft; // To prevent clearing Param.Value on set DataType
        Param.Name := ParamDesc.GetName;
        if IsNewParam then
          Param.Value := ParamDesc.GetValue;
        Param.Size := ParamDesc.GetSize;
      end;
      
      FICommand.SetProp(prDisableParamScan, True);
      try
        SQL.Text := ProcCallSQL;
      finally
        FICommand.SetProp(prDisableParamScan, False);
      end;
    end;
  finally
    EndConnection;
  end;
end;

{ TMSXMLField }

constructor TMSXMLField.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  SetDataType(TFieldType(ftMSXML));
end;

procedure TMSXMLField.GetText(var Text: string; DisplayText: Boolean);
begin
  Text := '(xml)';
  if not GetIsNull then
    Text := AnsiUpperCase(Text);
end;

procedure TMSXMLField.SetSchemaCollection(Name, CatalogName, SchemaName: string);
begin
  FSchemaCollection.Name := Name;
  FSchemaCollection.CatalogName := CatalogName;
  FSchemaCollection.SchemaName := SchemaName;
  FTyped := (FSchemaCollection.Name <> '') or (FSchemaCollection.CatalogName <> '') or
    (FSchemaCollection.SchemaName <> '');
end;

function TMSXMLField.GetBlobSize: Integer;
begin
  with DataSet.CreateBlobStream(Self, bmRead) do
    try
      Result := Size;
    finally
      Free;
    end;
end;

procedure TMSXMLField.Clear;
begin
  DataSet.CreateBlobStream(Self, bmWrite).Free;
end;

class function TMSXMLField.IsBlob: Boolean;
begin
  Result := True;
end;

procedure TMSXMLField.LoadFromFile(const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead);
  try
    LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TMSXMLField.LoadFromStream(Stream: TStream);
begin
  with DataSet.CreateBlobStream(Self, bmWrite) do
  try
    CopyFrom(Stream, 0);
  finally
    Free;
  end;
end;

procedure TMSXMLField.SaveToFile(const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TMSXMLField.SaveToStream(Stream: TStream);
var
  BlobStream: TStream;
begin
  BlobStream := DataSet.CreateBlobStream(Self, bmRead);
  try
    Stream.CopyFrom(BlobStream, 0);
  finally
    BlobStream.Free;
  end;
end;

procedure TMSXMLField.SetFieldType(Value: TFieldType);
begin
  SetDataType(Value);
end;

{ TMSUDTField }

constructor TMSUDTField.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  SetDataType(TFieldType(ftMSUDT));
end;

procedure TMSUDTField.SetFieldDataType(Value: TFieldType);
begin
  SetDataType(Value);
end;

procedure TMSUDTField.SetUDTTypeInfo(AUDTSchemaname, AUDTName, AUDTCatalogname,
  AAssemblyTypename: string{$IFNDEF CLR}; AUDTDispatcher: TUDTDispatcher{$ENDIF});
begin
  FUDTSchemaname := AUDTSchemaname;
  FUDTName := AUDTName;
  FUDTCatalogname := AUDTCatalogname;
  FAssemblyTypename := AAssemblyTypename;
{$IFNDEF CLR}
  FUDTDispatcher := AUDTDispatcher;
  if FUDTDispatcher <> nil then
    FUDTDispatcher.AfterInvoke := AfterInvoke;
{$ENDIF}
end;

{$IFNDEF CLR}
function TMSUDTField.GetClassDesc: string; 
begin
  if IsNull then
    Result := '(msudt)'
  else
    Result := '(MSUDT)';
end;

function TMSUDTField.GetAsUDT: Variant;
var
  ped: pExceptionData;
begin
  Result := Unassigned;
  if IsClass(DataSet, TCustomMSDataSet) then begin
    FUDTDispatcher.InitUDTProxy;
    UDTCheck(FUDTDispatcher.UDTProxy.LoadAssemblyTypeName(PWideChar(FAssemblyTypename), ped), ped);
    //if DataSet.State <> dsInsert then
    if not IsNull then
      UDTCheck(FUDTDispatcher.UDTProxy.DeserializeInstance(PSafeArray(VarArrayAsPSafeArray(Value)), ped), ped)
    else begin
      UDTCheck(FUDTDispatcher.UDTProxy.DeserializeInstance(nil, ped), ped);
      RetrieveUDTData;
    end;
    Result := IDispatch(FUDTDispatcher);
  end;
end;

procedure TMSUDTField.RetrieveUDTData;
var
  PData: PVarArray;
  PVal: IntPtr;
  LBound, UBound: integer;
  Buffer: array of byte;
  ped: pExceptionData;
begin
  if DataSet.State in dsWriteModes then begin
    UDTCheck(FUDTDispatcher.UDTProxy.SerializeInstance(PSafeArray(PData), ped), ped);
    VarResultCheck(SafeArrayGetLBound(PSafeArray(PData), 1, LBound));
    VarResultCheck(SafeArrayGetUBound(PSafeArray(PData), 1, UBound));
    if SafeArrayLock(PSafeArray(PData)) = VAR_OK then
    try
      if SafeArrayAccessData(PSafeArray(PData), PVal) = VAR_OK then
      try
        SetLength(Buffer, UBound - LBound + 1);
        Move(PVal^, Buffer[0], UBound - LBound + 1);
        Value := Buffer;
      finally
        SafeArrayUnaccessData(PSafeArray(PData));
      end;
    finally
      SafeArrayUnlock(PSafeArray(PData));
      SafeArrayDestroy(PSafeArray(PData));
    end;
  end;
end;

procedure TMSUDTField.AfterInvoke(Sender: TObject);
begin
  RetrieveUDTData;
end;
{$ENDIF}

{ TMSAccessUtils }

class procedure TMSAccessUtils.GetKeyAndDataFields(
  Obj: TCustomMSDataSet;
  out KeyAndDataFields: TKeyAndDataFields;
  const ForceUseAllKeyFields: boolean);
begin
  Obj.GetKeyAndDataFields(KeyAndDataFields, ForceUseAllKeyFields);
end;

class procedure TMSAccessUtils.SetDesigning(Obj: TCustomMSDataSet; Value: Boolean; SetChildren: Boolean = True);
begin
  Obj.SetDesigning(Value, SetChildren);
end;

class procedure TMSAccessUtils.SetLockLoginPromt(Obj: TCustomMSConnection; Value: Boolean);
begin
  Obj.FLockLoginPrompt := Value;
end;

class function TMSAccessUtils.FIConnection(Obj: TCustomMSConnection): TOLEDBConnection;
begin
  Result := Obj.IConnection;
end;

class function TMSAccessUtils.FIRecordSet(Obj: TCustomMSDataSet): TOLEDBRecordSet;
begin
  Result := Obj.FIRecordSet;
end;

class function TMSAccessUtils.GetOLEDBSQL(Obj: TCustomMSDataSet): string;
begin
  Result := Obj.FICommand.SQL;
end;

class function TMSAccessUtils.GetOLEDBSQL(Obj: TMSSQL): string;
begin
  Result := Obj.FICommand.SQL;
end;

type
  _TOLEDBConnection = class(TOLEDBConnection);

class function TMSAccessUtils.FIDBCreateSession(Obj: TOLEDBConnection): IDBCreateSession;
begin
  Result := _TOLEDBConnection(Obj).FIDBCreateSession;
end;

class procedure TMSAccessUtils.DoError(Obj: TCustomMSConnection; E: Exception; var Fail: boolean);
begin
  Assert(Obj.IConnection <> nil);
  _TOLEDBConnection(Obj.IConnection).DoError(E, Fail);
end;

initialization
  __UseUpdateOptimization := True;

  try
    TMSConnectionPoolManager.Clear;
  except
  end;

  if
  {$IFDEF CLR}
    CompareText(Assembly.GetCallingAssembly.GetName.Name, 'CoreLab.Sdac') = 0
  {$ELSE}
    not IsLibrary
  {$ENDIF}
  then begin
    Classes.RegisterClass(TMSXMLField);
    Classes.RegisterClass(TMSUDTField);
  end;

finalization
    
end.
