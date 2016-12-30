
{$IFNDEF CLR}
{$I Dac.inc}

unit DBToolsClient;
{$ENDIF}

interface

uses
{$IFDEF WIN32}
  CLRClasses,
  VarUtils,
  DesignIntf,
  ToolsApi,
{$ELSE}
  System.Runtime.InteropServices,
  Borland.Vcl.Design.DesignIntf,
  Borland.Studio.ToolsAPI,
  System.Reflection,
  System.Diagnostics,
  CoreLab.DbTools,
  System.Text,
{$ENDIF}
  ActiveX,
  DADesignUtils,
  Windows, Classes, Controls, StdCtrls, ExtCtrls, DB, DBAccess,
  DBToolsIntf, ActnMan, ActnList, Graphics, Menus, Forms, Messages;

type
{$IFDEF CLR}
  TString = string;
  IIDEServices = IOTAService;
  IModuleServices = IOTAModuleServices;
{$ELSE}
  TString = PWideChar;
  PConnectionInfo = ^ConnectionInfo;
  IIDEServices = IOTAServices;
  IModuleServices = IOTAModuleServices70;
{$ENDIF}

  TParamTypeMap = record
    DACType: TFieldType;
    DBToolsType: integer;
  end;

  TSqlSource = class;

  TDBToolsVerb = (dbtEditSql, dbtQueryBuilder,
    dbtFindInDatabaseExplorer, dbtEditDatabaseObject, dbtExecuteSql,
    dbtDebugSql, dbtRetrieveData, dbtCompile, dbtCompileDebug);

  TDBToolsVerbs = set of TDBToolsVerb;

  TCompareFlag = (cfNormal, cfCaseSensitive, cfNone);

  TDBToolsService = class(TObject)
  protected
    FUsedConnectionStrList: TStringList;
    FUsedConnectionCompareFlags: array of TCompareFlag;

    FConnectionStrList: TStringList;
    FConnectionsList: TStringList;
    FDefaultConnectionList: TStringList;
    FDADesignUtils: TDADesignUtilsClass;
    FSqlService: IDbToolsService;
    FSqlEditors: array of ISqlEditor;
    FParamTypeMaps: array of TParamTypeMap;

    FCurrentDesigner: IDesigner;
    FCurrentComponent: TComponent;

    function GetSqlEditor: ISqlEditor;
    procedure ReturnSqlEditor(ASqlEditor: ISqlEditor);
    function GetSqlSource(Component: TComponent; Designer: IDesigner; SqlTextPrefix: string = ''): TSqlSource;
  {$IFDEF WIN32}
    class function AccessData(const V: PSafeArray): pointer;
    class procedure UnaccessData(const V: PSafeArray);
    class function DataHigh(const V: PSafeArray): integer;
  {$ENDIF}
    class function GetConnectionParamStr(const ParamName, ParamValue: string): string;
    function GetConnectionValueStr(ConnectionName: string): string;
    procedure ConnStrToList(ConnStr: string; const ConnList: TStrings);
    procedure CheckConnection(const Component: TComponent);

    procedure BeginConnectionStrGetting(const ConnectionStrList: TStringList);
  public
    constructor Create(ADADesignUtils: TDADesignUtilsClass; ASqlService: {$IFDEF WIN32}IUnknown{$ELSE}TObject{$ENDIF};ADefaultConnectionStr: string);
    destructor Destroy; override;
    function DBToolsTypeToDataType(AType: integer; OldType: TFieldType): TFieldType;
    function DataTypeToDBToolsType(AType: TFieldType): integer;

    function GetConnection(const Component: TComponent): TCustomDAConnection;
    function GetNativeConnectionString(const Component: TComponent): string;
    function GetConnectionString(const Component: TComponent): TString;
    function GetConnectionStringObjectTypeAndFullName(const Component: TComponent; out ConnectionString, ObjectType, FullName: TString): boolean;

    procedure GetConnections(NameList: TStrings; Condition: string = '');
    function FindConnectionName(AConnection: TCustomDAConnection): string; //Call GetConnections
    function GetConnectionStrList(ConnectionName: string): TStringList; //before!

    procedure FindInDatabaseExplorer;
    procedure EditDatabaseObject;
    procedure ExecuteSql(Debug: boolean);
    procedure Compile(Debug: boolean);
    procedure RetrieveData(AsDocument: boolean);
    procedure EditSql(AsQuery: boolean);

    procedure AddParamTypeMap(ADACType: TFieldType; ADBToolsType: integer);

    procedure PutConnectionParam(const ConnectionParam: string; const CompareFlag: TCompareFlag = cfNormal);
    procedure SkipConnectionParams(const Count: integer);

    property DADesignUtils: TDADesignUtilsClass read FDADesignUtils;
    property SqlService: IDbToolsService read FSqlService;
  end;

  TDACSqlEditorFrame = class(TPanel)
  private
    FReadOnly: boolean;
    FOnExit: TNotifyEvent;
    FOnChange: TNotifyEvent;
    FDBToolsService: TDBToolsService;
    FSqlEditors: array[TStatementType] of ISqlEditor;
    FStatementType: TStatementType;
    FComponent: TComponent;
    FLastConnectionString: string;
    FInInit: boolean;

    function GetSqlEditor: ISqlEditor;
    procedure SetStatementType(const Value: TStatementType);
    function GetText: string;
    procedure SetText(const Value: string); {$IFDEF CLR} reintroduce; {$ENDIF}
    procedure SetReadOnly(Value: boolean);
    procedure InternalResize;
  protected
    procedure Resize; override;
    function GetSqlEditorHandle: HWND;
    procedure CheckModified;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AOwner: TComponent; Component: TComponent; DBToolsService: TDBToolsService); reintroduce;
    destructor Destroy; override;
    procedure SetFocus; override;
    procedure CheckConnectionChange;
    procedure EndInit;

    property SqlEditor: ISqlEditor read GetSqlEditor;
    property Text: string read GetText write SetText;
    property OnExit: TNotifyEvent read FOnExit write FOnExit;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property ReadOnly: boolean read FReadOnly write SetReadOnly;
    property StatementType: TStatementType write SetStatementType;
  end;

  TDBToolsDesignNotification = class;

  TDBTools = class(TObject)
  private
    FIDEServices: IIDEServices;
    FModuleServices: IModuleServices;
    FDBToolsServices: array of TDBToolsService;
    FDesignNotification: TDBToolsDesignNotification;
    FCurrentDADesignUtils: TDADesignUtilsClass;
    FCurrentDBToolsService: TDBToolsService;
  {$IFDEF WIN32}
    FNeedUninitialize: boolean;
  {$ENDIF}
    FMenuManager: TActionManager;
    FMenuActions: array [TDBToolsVerb] of TAction;
    FLastDACSqlEditorFrame: TDACSqlEditorFrame;
    FLastMemo: TWinControl;
    FDACSqlEditorFrames: array of TDACSqlEditorFrame;

    function MenuItemsAvailable: boolean;
    procedure DebugSql(Sender: TObject);
    procedure EditDatabaseObject(Sender: TObject);
    procedure EditSql(Sender: TObject);
    procedure ExecuteSql(Sender: TObject);
    procedure Compile(Sender: TObject);
    procedure CompileDebug(Sender: TObject);
    procedure FindInDatabaseExplorer(Sender: TObject);
    procedure QueryBuilder(Sender: TObject);
    procedure RetrieveData(Sender: TObject);

    procedure CreateMenuActions;
    function GetMenuActions(Index: TDBToolsVerb): TAction;
  public
    property DesignNotification: TDBToolsDesignNotification read FDesignNotification;
    property IDEServices: IIDEServices read FIDEServices;
    property ModuleServices: IModuleServices read FModuleServices;

    constructor Create;
    destructor Destroy; override;
    function CreateDBToolsService(const DADesignUtils: TDADesignUtilsClass;
      const ClassIDs: array of TGUID;{$IFDEF CLR} const ServiceShortName: string; {$ENDIF}
      const DefaultConnectionStr: string; const ProviderKey: string;
      out ServiceVersion: int64; out NeedToCheck: TNeedToCheckDbTools): TObject;
    function CheckDevTools(const ClassIDs: array of TGUID; const ProviderKey: string; const DADesignUtils: TDADesignUtilsClass;
      out ServiceVersion: int64 {$IFDEF WIN32}; FoundClassID: PGUID = nil{$ENDIF}): TNeedToCheckDbTools;
    procedure CheckDBToolsChanges(Control: TWinControl);
    procedure ReplaceMemo(var Memo: TMemo; DADesignUtils: TDADesignUtilsClass; Component: TComponent);
    procedure DesignerClosing(const FileName: string);
    function GetDesignerName(Designer: IDesigner): string;
    procedure PrepareMenu(Designer: IDesigner; Component: TComponent; DADesignUtils: TDADesignUtilsClass);
    function HasDACSqlEditorFrame(Memo: TWinControl): boolean;
    function GetDACSqlEditorFrame(Memo: TWinControl): TDACSqlEditorFrame;
    procedure CheckConnectionChanges;
    function GetActiveDACSqlEditorFrame: TWinControl;

    property MenuActions[Index: TDBToolsVerb]: TAction read GetMenuActions;
  end;

  TSqlSource = class(TInterfacedObject, ISqlSource)
  protected
    FParameterCount: integer;
    FParameterSetted: array of boolean;
    FDesigner: IDesigner;
    FDesignerName: string;
    FComponent: TComponent;
    FLastName: string;
    FComponentSQL: string;
    FSqlSourceNotifier: ISqlSourceNotifier;
    FStatementType: TStatementType;
    FDBToolsService: TDBToolsService;
    FLastConnection: TCustomDAConnection;
    FLastConnectionString: string;
    FSqlTextPrefix: string;

    function GetParams: TDAParams;
    function GetSqlText: string;
    procedure SetSqlText(Value: string);

    function Get_Name: TString; {$IFDEF WIN32}stdcall;{$ENDIF}
    function Get_ConnectionString: TString; {$IFDEF WIN32}stdcall;{$ENDIF}
    function Get_DesignerName: TString; {$IFDEF WIN32}stdcall;{$ENDIF}
    function Get_Sql: TString; {$IFDEF WIN32}stdcall;{$ENDIF}
    procedure Set_Sql({$IFDEF WIN32}const {$ENDIF}Param1: TString); {$IFDEF WIN32}stdcall;{$ENDIF}
    procedure GetParameter({$IFDEF WIN32}const {$ENDIF}Index: integer; out Info: CommandParameterInfo); {$IFDEF WIN32}stdcall;{$ENDIF}
    procedure SetParameter({$IFDEF WIN32}const {$ENDIF}Index: integer; Info: CommandParameterInfo); {$IFDEF WIN32}stdcall;{$ENDIF}
    procedure Set_ParameterCount({$IFDEF WIN32}const {$ENDIF}Value: integer); {$IFDEF WIN32}stdcall;{$ENDIF}
    function Get_ParameterCount: integer; {$IFDEF WIN32}stdcall;{$ENDIF}

    procedure Close; {$IFDEF WIN32}stdcall;{$ENDIF}

    property Params: TDAParams read GetParams;
  public
    constructor Create(DBToolsService: TDBToolsService; Component: TComponent; Designer: IDesigner);
    destructor Destroy; override;
    procedure CheckRename;
    procedure CheckConnectionChange(InternalCheck: boolean);
    procedure CheckChanges;

    property SqlSourceNotifier: ISqlSourceNotifier read FSqlSourceNotifier;
    property Designer: IDesigner read FDesigner;
    property SqlTextPrefix: string read FSqlTextPrefix write FSqlTextPrefix;
  end;

  TSqlSourceList = class(TList)
  private
    FNotifiersToDelete: array of ISqlSourceNotifier;
  public
    function IndexOf(Component: TComponent): integer; reintroduce;
    function Find(Component: TComponent): TSqlSource; overload;
    function Find(Component: TComponent; SqlTextPrefix: string): TSqlSource; overload;
    function FindDesigner(FileName: string): IDesigner;
    procedure CheckSubordinated(AComponent: TComponent);
    procedure Delete(Index: integer; WithNotification: boolean = False); reintroduce; overload;
    procedure Delete(Component: TComponent; WithNotification: boolean = True); overload;
    procedure Delete(SqlSource: TSqlSource); overload;
    procedure Add(SqlSource: TSqlSource);
    procedure DeleteDesigner(Designer: IDesigner);
    procedure CheckDeletedComponents(Designer: IDesigner);    
  end;

  TModuleNotifier = class({$IFDEF CLR}TObject{$ELSE}TInterfacedObject, IOTANotifier, IOTAModuleNotifier, IOTAModuleNotifier80{$ENDIF})
  private
    FModule : IOTAModule;
  {$IFDEF WIN32}
    AllowSaveSwitch : boolean;
    FIndex : integer;
  {$ELSE}
    procedure BeforeSave(Sender: TObject; e: EventArgs);
  {$ENDIF}
    procedure RemoveNotifier;
  public
    constructor Create(const Module: IOTAModule);
    destructor Destroy; override;
  {$IFDEF WIN32}
  {IOTANotifier}
    procedure AfterSave;
    procedure BeforeSave;
    procedure Destroyed;
    procedure Modified;
  {IOTAModuleNotifier}
    function CheckOverwrite: Boolean;
    procedure ModuleRenamed(const NewName: string);
  {IOTAModuleNotifier80}
    function AllowSave: Boolean;
    function GetOverwriteFileNameCount: Integer;
    function GetOverwriteFileName(Index: Integer): string;
    procedure SetSaveFileName(const FileName: string);
  {$ENDIF}
    property Module: IOTAModule read FModule;
  end;

  TModuleList = class(TList)
  public
    function IndexOf(Module: IOTAModule): integer; reintroduce;
    procedure Add(Module: IOTAModule);
    procedure Delete(Index: integer); reintroduce; overload;
    procedure Delete(Module: IOTAModule); overload;
  end;

  TDBToolsDesignNotification = class(TInterfacedObject, IDesignNotification)
  protected
    FSqlSourceList: TSqlSourceList;
    FModuleList: TModuleList;
    FDebugStr: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ItemDeleted(const ADesigner: IDesigner; AItem: TPersistent);
    procedure ItemInserted(const ADesigner: IDesigner; AItem: TPersistent);
    procedure ItemsModified(const ADesigner: IDesigner);
    procedure SelectionChanged(const ADesigner: IDesigner; const ASelection: IDesignerSelections);
    procedure DesignerOpened(const ADesigner: IDesigner; AResurrecting: Boolean);
    procedure DesignerClosed(const ADesigner: IDesigner; AGoingDormant: Boolean);

    property SqlSourceList: TSqlSourceList read FSqlSourceList;
    property ModuleList: TModuleList read FModuleList;
  end;

var
  DBTools: TDBTools;

function GetDBToolsService(DADesignUtilsClass: TDADesignUtilsClass): TDBToolsService;

implementation

{$IFDEF WIN32}
{$R DBToolsClient.res}
{$ENDIF}
uses
  DADesign, Registry, Download, DAConsts,
  Variants, SysUtils, ComObj, TypInfo;

const
  SConnectionName = '_ConnName_';
  SConnStrError = 'ConnectionString error';
  SCompilePrefix = 'compile';
  SEditPrefix = 'edit';  

{$IFDEF WIN32}
  function ToWideChar(s: WideString): PWideChar;
  begin
    if s = '' then    
      Result := nil
    else
      Result := SysAllocString(PWideChar(s));
  end;
{$ENDIF}

{ TSqlSourceList }

procedure TSqlSourceList.Add(SqlSource: TSqlSource);
var
  ModuleFileName, s: string;
  Module: IOTAModule;
begin
  SqlSource.Designer.ModuleFileNames(ModuleFileName, s, s);

  inherited Add(SqlSource);

  Module := DBTools.ModuleServices.FindModule(ModuleFileName);
  DBTools.DesignNotification.ModuleList.Add(Module)
end;

function TSqlSourceList.IndexOf(Component: TComponent): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if TSqlSource(Items[i]).FComponent = Component then begin
      Result := i;
      Break;
    end;
end;

function TSqlSourceList.Find(Component: TComponent): TSqlSource;
var
  i: integer;
begin
  i := IndexOf(Component);
  if i < 0 then
    Result := nil
  else
    Result := TSqlSource(Items[i]);
end;

function TSqlSourceList.Find(Component: TComponent; SqlTextPrefix: string): TSqlSource;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if (TSqlSource(Items[i]).FComponent = Component) and
      (TSqlSource(Items[i]).SqlTextPrefix = SqlTextPrefix) then begin
      Result := TSqlSource(Items[i]);
      Exit;
    end;
  Result := nil;
end;

procedure TSqlSourceList.CheckSubordinated(AComponent: TComponent);
var
  i: integer;
begin
  if AComponent is TCustomDAConnection then begin
    for i := 0 to Count - 1 do
      with TSqlSource(Items[i]) do
        if FDBToolsService.GetConnection(FComponent) = AComponent then
          CheckConnectionChange(False);
  end
  else
    for i := 0 to Count - 1 do
      if TSqlSource(Items[i]).FComponent.Owner = AComponent then
        TSqlSource(Items[i]).CheckRename;
end;

procedure TSqlSourceList.Delete(Index: integer; WithNotification: boolean = False);
var
  n: integer;
  SqlSource: TSqlSource;
begin
  SqlSource := TSqlSource(Items[Index]);
  if WithNotification and (SqlSource.FSqlSourceNotifier <> nil) then begin
    n := Length(FNotifiersToDelete);
    SetLength(FNotifiersToDelete, n + 1);
    FNotifiersToDelete[n] := SqlSource.FSqlSourceNotifier;
    SqlSource.FSqlSourceNotifier := nil;
    inherited Delete(Index);
  end
  else
    inherited Delete(Index);
end;

procedure TSqlSourceList.Delete(Component: TComponent; WithNotification: boolean = True);
var
  Index: integer;
begin
  Index := IndexOf(Component);
  if Index >= 0 then
    Delete(Index, WithNotification);
end;

procedure TSqlSourceList.Delete(SqlSource: TSqlSource);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TSqlSource(Items[i]) = SqlSource then begin
      inherited Delete(i);
      Break;
    end;
end;

procedure TSqlSourceList.DeleteDesigner(Designer: IDesigner);
var
  i: integer;
  SqlSource: TSqlSource;
begin
  i := 0;
  while i < Count do begin
    SqlSource := TSqlSource(Items[i]);
    if SqlSource.Designer = Designer then begin
      if SqlSource.FSqlSourceNotifier <> nil then begin
        SqlSource.FSqlSourceNotifier.OnSqlSourceDeleted;
        SqlSource.FSqlSourceNotifier := nil;
      end;
      inherited Delete(i);
    end
    else
      Inc(i);
  end;
end;

procedure TSqlSourceList.CheckDeletedComponents(Designer: IDesigner);
var
  i, n: integer;
  Notifier: ISqlSourceNotifier;
  Sel: IDesignerSelections;
begin
  n := Length(FNotifiersToDelete);
  if n <= 0 then
    Exit;
  Sel := CreateSelectionList;
  Sel.Add(Designer.Root);
  Designer.SetSelections(Sel);
  Designer.Activate;
  for i := n - 1 downto 0 do begin
    Notifier := FNotifiersToDelete[i];
    SetLength(FNotifiersToDelete, i);
    Notifier.OnSqlSourceDeleted;
  end;
end;

function TSqlSourceList.FindDesigner(FileName: string): IDesigner;
var
  i: integer;
  ModuleFileName, s: string;
begin
  for i := 0 to Count - 1 do begin
    TSqlSource(Items[i]).Designer.ModuleFileNames(ModuleFileName, s, s);
    if ModuleFileName = FileName then begin
      Result := TSqlSource(Items[i]).Designer;
      Exit;
    end;
  end;
  Result := nil;
end;

{ TDBToolsDesignNotification }

constructor TDBToolsDesignNotification.Create;
begin
  inherited;
  FSqlSourceList := TSqlSourceList.Create;
  FModuleList := TModuleList.Create;
end;

procedure TDBToolsDesignNotification.DesignerClosed(const ADesigner: IDesigner;
  AGoingDormant: Boolean);
begin
  if ADesigner <> nil then
    DBTools.DesignNotification.SqlSourceList.DeleteDesigner(ADesigner);
end;

procedure TDBToolsDesignNotification.DesignerOpened(const ADesigner: IDesigner;
  AResurrecting: Boolean);
begin
end;

destructor TDBToolsDesignNotification.Destroy;
var
  i, n: integer;
begin
  n := FSqlSourceList.Count;
  for i := n - 1 downto 0 do
    FSqlSourceList.Delete(i);
  FSqlSourceList.Free;

  n := FModuleList.Count;
  for i := n - 1 downto 0 do begin
  {$IFDEF CLR}
    TModuleNotifier(FModuleList.Items[i]).Free;
  {$ENDIF}
    FModuleList.Delete(i);
  end;
  FModuleList.Free;
end;

procedure TDBToolsDesignNotification.ItemDeleted(const ADesigner: IDesigner;
  AItem: TPersistent);
begin
  if AItem is TComponent then
    FSqlSourceList.Delete(TComponent(AItem));
  FSqlSourceList.CheckDeletedComponents(ADesigner);
end;

procedure TDBToolsDesignNotification.ItemInserted(const ADesigner: IDesigner;
  AItem: TPersistent);
begin
end;

procedure TDBToolsDesignNotification.ItemsModified(const ADesigner: IDesigner);
var
  i: Integer;
  SqlSource: TSqlSource;
  SelectionList: IDesignerSelections;
  Component: TComponent;
begin
  if ADesigner = nil then
    Exit;
  SelectionList := CreateSelectionList;
  ADesigner.GetSelections(SelectionList);
  for i := 0 to SelectionList.Count - 1 do begin
    if SelectionList.Items[i] is TComponent then begin
      Component := TComponent(SelectionList.Items[i]);
      SqlSource := FSqlSourceList.Find(Component);
      if SqlSource <> nil then
        SqlSource.CheckChanges
      else
        FSqlSourceList.CheckSubordinated(Component);
    end;
  end;
end;

procedure TDBToolsDesignNotification.SelectionChanged(const ADesigner: IDesigner;
  const ASelection: IDesignerSelections);
begin
end;

{ TSqlSource }

procedure TSqlSource.Close;
begin
  Assert(DBTools.DesignNotification <> nil);
  DBTools.DesignNotification.SqlSourceList.Delete(FComponent, False);
end;

constructor TSqlSource.Create(DBToolsService: TDBToolsService; Component: TComponent; Designer: IDesigner);
begin
  inherited Create;
  Assert(DBToolsService <> nil);
  FComponent := Component;
  FDBToolsService := DBToolsService;
  FStatementType := stQuery;
  FLastName := Get_Name;
  FComponentSQL := GetSqlText;
  FDesigner := Designer;
  FDesignerName := DBTools.GetDesignerName(FDesigner);
  FLastConnection := FDBToolsService.GetConnection(Component);
  FLastConnectionString := FDBToolsService.GetNativeConnectionString(FLastConnection);
end;

destructor TSqlSource.Destroy;
begin
  inherited;
end;

function TSqlSource.GetParams: TDAParams;
begin
  with FDBToolsService.DADesignUtils do
    if HasParams(FComponent) then
      Result := GetParams(FComponent)
    else
      Result := nil;
end;

function TSqlSource.Get_ConnectionString: TString;
begin
  Result := {$IFDEF WIN32}ToWideChar({$ENDIF}
    FLastConnectionString
  {$IFDEF WIN32}){$ENDIF};
end;

function TSqlSource.Get_DesignerName: TString;
begin
  Result := {$IFDEF WIN32}ToWideChar(FDesignerName){$ELSE}FDesignerName{$ENDIF};
end;

function TSqlSource.Get_Name: TString;
begin
  Result := {$IFDEF WIN32}ToWideChar({$ENDIF}
    FComponent.Owner.Name + '-' + FComponent.Name
  {$IFDEF WIN32}){$ENDIF};
end;

function TSqlSource.GetSqlText: string;
var
  SQL: TStrings;
  Macros: TMacros;
  NewMacros: TDesignMacros;
begin
  with FDBToolsService.DADesignUtils do
    if IsStoredProc(FComponent) then begin
      Result := Trim(GetFullName(FComponent));
      if Result <> '' then
        Result := GetObjectType(FComponent) + ':' + Result;
    end
    else begin
      SQL := GetSQL(FComponent);
      Macros := GetMacros(FComponent);
      NewMacros := TDesignMacros.Create(nil);
      try
        NewMacros.SetParserClass(TDBAccessUtils.GetParserClass(Macros));
        NewMacros.Assign(Macros);
        Result := SQL.Text;
        NewMacros.Expand(Result);        
      finally
        NewMacros.Free;
      end;
    end;
  if (FSqlTextPrefix <> '') and (FSqlTextPrefix <> SEditPrefix) then
    Result := FSqlTextPrefix + ':' + Result;
end;

procedure TSqlSource.SetSqlText(Value: string);
var
  SQL: TStrings;
  Macros: TMacros;
  NewMacros: TDesignMacros;
begin
  with FDBToolsService.DADesignUtils do
    if not IsStoredProc(FComponent) then begin
      SQL := GetSQL(FComponent);
      Macros := GetMacros(FComponent);
      NewMacros := TDesignMacros.Create(nil);
      try
        NewMacros.SetParserClass(TDBAccessUtils.GetParserClass(Macros));
        NewMacros.Scan(Value);
        SQL.Text := Value;
        Macros.Assign(NewMacros);
      finally
        NewMacros.Free;
      end;
    end;
end;

function TSqlSource.Get_Sql: TString;
begin
  Result := {$IFDEF WIN32}ToWideChar({$ENDIF}
    WideString(GetSqlText)
  {$IFDEF WIN32}){$ENDIF};
end;

procedure TSqlSource.Set_Sql({$IFDEF WIN32}const {$ENDIF}Param1: TString);
begin
  SetSqlText(Param1);
end;

procedure TSqlSource.GetParameter({$IFDEF WIN32}const {$ENDIF}Index: integer; out Info: CommandParameterInfo);
begin
  Assert(Index < Get_ParameterCount);
  Info.Name := {$IFDEF WIN32}ToWideChar({$ENDIF}Params[Index].Name
    {$IFDEF WIN32}){$ENDIF};
  Info.DataType := FDBToolsService.DataTypeToDBToolsType(Params[Index].DataType);
  Info.Value := Params[Index].Value;
  case Params[Index].ParamType of
    ptUnknown,
    ptInput:
      Info.ParameterType := ParameterType_Input;
    ptOutput:
      Info.ParameterType := ParameterType_Output;
    ptInputOutput:
      Info.ParameterType := ParameterType_InputOutput;
    ptResult:
      Info.ParameterType := ParameterType_ReturnValue;
  end;
end;

function TSqlSource.Get_ParameterCount: integer;
begin
  if (Params <> nil) and (Params.Count > FParameterCount) then
    Set_ParameterCount(Params.Count);
  Result := FParameterCount;
end;

procedure TSqlSource.Set_ParameterCount({$IFDEF WIN32}const {$ENDIF}Value: integer);
var
  i, n: integer;
begin
  if Params = nil then
    Exit;
  FParameterCount := Value;
  SetLength(FParameterSetted, Value);
  n := Params.Count;
  for i := 0 to Value - 1 do begin
    if i >= n then
      Params.Add;
    FParameterSetted[i] := False;
  end;
end;

procedure TSqlSource.SetParameter({$IFDEF WIN32}const {$ENDIF}Index: integer; Info: CommandParameterInfo);
var
  i, j: integer;
  TempParam: TDAParam;
begin
  Assert(Index < Get_ParameterCount);
  for i := 0 to Params.Count - 1 do
    if Params[i].Name = Info.Name then begin
      if i <> Index then begin
        TempParam := Params[Index];
        Params[Index] := Params[i];
        Params[i] := TempParam;
      end;
      Break;
    end;
  with TDAParam(Params[Index]) do begin
    Name := Info.Name;
    DataType := FDBToolsService.DBToolsTypeToDataType(Info.DataType, DataType);
    Value := Variant(Info.Value);
    case Info.ParameterType of
      ParameterType_Input:
        ParamType := ptInput;
      ParameterType_Output:
        ParamType := ptOutput;
      ParameterType_InputOutput:
        ParamType := ptInputOutput;
      ParameterType_ReturnValue:
        ParamType := ptResult;
    end;
  end;
  for i := FParameterCount - 1 downto 0 do
    if not FParameterSetted[i] then
      Break
    else
      if i = 0 then
        for j := Params.Count - 1 downto FParameterCount do
          Params.Delete(j);
end;

procedure TSqlSource.CheckRename;
begin
  if (FLastName <> Get_Name) then begin
    if FSqlSourceNotifier <> nil then
      FSqlSourceNotifier.OnSqlSourceRenamed(Get_Name);
    FLastName := Get_Name;
  end;
end;

procedure TSqlSource.CheckConnectionChange(InternalCheck: boolean);
var
  NewConnection: TCustomDAConnection;
  NewConnectionString: string;
begin
  NewConnection := FDBToolsService.GetConnection(FComponent);
  if InternalCheck and (FLastConnection = NewConnection) then
    Exit;
  NewConnectionString := FDBToolsService.GetNativeConnectionString(NewConnection);
  if NewConnectionString <> FLastConnectionString then begin
    FLastConnectionString := NewConnectionString;
    if not InternalCheck and (FSqlSourceNotifier <> nil) then
      FSqlSourceNotifier.OnSqlSourceChanged;
  end;
end;

procedure TSqlSource.CheckChanges;
begin
  CheckRename;
  CheckConnectionChange(True);
  if GetSqlText <> FComponentSQL then begin
    if FSqlSourceNotifier <> nil then
      FSqlSourceNotifier.OnSqlSourceChanged;
    FComponentSQL := GetSqlText;
  end;
end;

{ TDACSqlEditorFrame }

procedure TDACSqlEditorFrame.CheckModified;
begin
  if (SqlEditor <> nil) and (SqlEditor.Modified) then begin
    if Assigned(FOnChange) then
      FOnChange(Self);
    if Assigned(FOnExit) then
      FOnExit(Self);
    SqlEditor.Modified := False;
  end;
end;

constructor TDACSqlEditorFrame.Create(AOwner: TComponent; Component: TComponent; DBToolsService: TDBToolsService);
var
  i: integer;
begin
  inherited Create(AOwner);

  FInInit := True;
  FComponent := Component;
  FDBToolsService := DBToolsService;
  BevelOuter := bvNone;
  FStatementType := stQuery;
  TabStop := True;
  i := Length(DBTools.FDACSqlEditorFrames);
  SetLength(DBTools.FDACSqlEditorFrames, i + 1);
  DBTools.FDACSqlEditorFrames[i] := Self;
end;

destructor TDACSqlEditorFrame.Destroy;
var
  st: TStatementType;
  i, j, n: integer;
begin
  for st := Low(TStatementType) to High(TStatementType) do
    if FSqlEditors[st] <> nil then
      FDBToolsService.ReturnSqlEditor(FSqlEditors[st]);
  n := High(DBTools.FDACSqlEditorFrames);
  for i := 0 to n do
    if DBTools.FDACSqlEditorFrames[i] = Self then begin
      for j := i to n - 1 do
        DBTools.FDACSqlEditorFrames[j] := DBTools.FDACSqlEditorFrames[j + 1];
      SetLength(DBTools.FDACSqlEditorFrames, n);
      Break;
    end;

  inherited;
end;

procedure TDACSqlEditorFrame.EndInit;
begin
  FInInit := False;
end;

procedure TDACSqlEditorFrame.InternalResize;
begin
  if SqlEditor <> nil then
    Windows.SetWindowPos(GetSqlEditorHandle, 0, 0, 0, ClientWidth, ClientHeight, SWP_NOZORDER or SWP_SHOWWINDOW);
end;

procedure TDACSqlEditorFrame.Resize;
begin
  InternalResize;
  inherited;
end;

procedure TDACSqlEditorFrame.SetFocus;
begin
  inherited;

  if SqlEditor <> nil then
    Windows.SetFocus(GetSqlEditorHandle);
end;

procedure TDACSqlEditorFrame.WndProc(var Message: TMessage);
begin
  if not FInInit and (Message.Msg = WM_SETFOCUS) and (SqlEditor <> nil) then
    Windows.SetFocus(GetSqlEditorHandle)
  else
    inherited;
end;

procedure TDACSqlEditorFrame.CheckConnectionChange;
var
  NewConnectionString: string;
  st: TStatementType;
begin
  Assert(SqlEditor <> nil);

  NewConnectionString := FDBToolsService.GetNativeConnectionString(FComponent);
  if NewConnectionString <> FLastConnectionString then begin
    FLastConnectionString := NewConnectionString;

    if FLastConnectionString <> '' then
      for st := Low(TStatementType) to High(TStatementType) do
        if FSqlEditors[st] <> nil then
          FSqlEditors[st].SetConnection({$IFDEF WIN32}ToWideChar({$ENDIF}
            FLastConnectionString
          {$IFDEF WIN32}){$ENDIF});
  end;
end;

function TDACSqlEditorFrame.GetSqlEditorHandle: HWND;
begin
  Assert(SqlEditor <> nil);

  Result := SqlEditor.Handle{$IFDEF CLR}.ToInt32{$ENDIF};
end;

function TDACSqlEditorFrame.GetText: string;
begin
  if SqlEditor <> nil then
    Result := SqlEditor.Text
  else
    Result := '';
end;

procedure TDACSqlEditorFrame.SetText(const Value: string);
begin
  if SqlEditor <> nil then
    SqlEditor.Text := {$IFDEF WIN32}ToWideChar(Value){$ELSE}Value{$ENDIF};
end;

procedure TDACSqlEditorFrame.SetReadOnly(Value: boolean);
var
  st: TStatementType;
begin
  if Value <> FReadOnly then begin
    FReadOnly := Value;
    for st := Low(TStatementType) to High(TStatementType) do
       if FSqlEditors[st] <> nil then
          FSqlEditors[st].ReadOnly := Value;
    SetStatementType(FStatementType);
  end;
end;

function TDACSqlEditorFrame.GetSqlEditor: ISqlEditor;
begin
  if (not ReadOnly) or (FSqlEditors[FStatementType] <> nil) then
    Result := FSqlEditors[FStatementType]
  else
    Result := FSqlEditors[stQuery];
end;

procedure TDACSqlEditorFrame.SetStatementType(const Value: TStatementType);
var
  NewStatementType: TStatementType;
  FHide, FShow, FFocused: boolean;
begin
  if FReadOnly and (FSqlEditors[Value] = nil) then
    NewStatementType := stQuery
  else
    NewStatementType := Value;
  FHide := NewStatementType <> FStatementType;
  FShow := FHide;
  if FSqlEditors[NewStatementType] = nil then
    if (FSqlEditors[stQuery] <> nil) and (FSqlEditors[stQuery].Text = '') then begin
      FSqlEditors[NewStatementType] := FSqlEditors[stQuery];
      FSqlEditors[stQuery] := nil;
      FHide := False;
      FShow := False;
    end
    else begin
      FSqlEditors[NewStatementType] := FDBToolsService.GetSqlEditor;
      if FLastConnectionString <> '' then
        FSqlEditors[NewStatementType].SetConnection({$IFDEF WIN32}ToWideChar({$ENDIF}
          FLastConnectionString
        {$IFDEF WIN32}){$ENDIF});
      FSqlEditors[NewStatementType].Text := {$IFDEF WIN32}nil{$ELSE}''{$ENDIF};
      FShow := True;
    end;
  if FHide and (FSqlEditors[NewStatementType] <> nil) then begin
    Windows.SetParent(GetSqlEditorHandle, MAXDWORD - 2{HWND_MESSAGE});
    FFocused := Windows.GetFocus = GetSqlEditorHandle;
  end
  else
    FFocused := False;

  FStatementType := Value;
  if FShow then begin
    Windows.SetParent(GetSqlEditorHandle, Handle);
    FSqlEditors[NewStatementType].ReadOnly := FReadOnly;
    InternalResize;
    if FFocused then
      Windows.SetFocus(GetSqlEditorHandle);
  end;
end;

{ TDBTools }

procedure TDBTools.CheckDBToolsChanges(Control: TWinControl);
var
  i: integer;
begin
  if Control <> nil then
    for i := 0 to Control.ComponentCount - 1 do
      if Control.Components[i] is TDACSqlEditorFrame then
        TDACSqlEditorFrame(Control.Components[i]).CheckModified;
end;

function TDBTools.CreateDBToolsService(const DADesignUtils: TDADesignUtilsClass;
      const ClassIDs: array of TGUID;{$IFDEF CLR} const ServiceShortName: string; {$ENDIF}
      const DefaultConnectionStr: string; const ProviderKey: string;
      out ServiceVersion: int64; out NeedToCheck: TNeedToCheckDbTools): TObject;
var
  n: integer;
{$IFDEF CLR}
  ServiceType: System.Type;
  Obj: TObject;
{$ELSE}
  Obj: IUnknown;
  ClassID: TGUID; 
{$ENDIF}
  DBToolsService: TDBToolsService;

{$IFDEF CLR}
  function FindType(const TypeFullName, AssemblyNameFilter: string; out AType: System.Type): boolean;
  var
    i, j: integer;
    LoadedAssemblies: array of Assembly;
    Types: array of System.Type;
  begin
    Result := False;
    LoadedAssemblies := System.AppDomain.CurrentDomain.GetAssemblies;
    for i := 0 to Length(LoadedAssemblies) - 1 do
      if (LoadedAssemblies[i].FullName.ToLower.IndexOf(AssemblyNameFilter.ToLower) >= 0) then begin
        Types := LoadedAssemblies[i].GetExportedTypes;
        for j := 0 to Length(Types) - 1 do
          if Types[j].FullName = TypeFullName then begin
            AType := Types[j];
            Result := True;
            Exit;
          end;
      end;
  end;
{$ENDIF}

begin
  Result := nil;
  Obj := nil;
  try
    NeedToCheck := ncNoAddin;
    ServiceVersion := 0;
    DADesignUtils.SetDBToolsDownloadParams(False, False);
    if FIDEServices = nil then begin
    {$IFDEF WIN32}
      Supports(BorlandIDEServices, IIDEServices, FIDEServices);
      Supports(BorlandIDEServices, IModuleServices, FModuleServices);
    {$ELSE}
      FIDEServices := BorlandIDE.OTAService;
      FModuleServices := BorlandIDE.ModuleServices;
    {$ENDIF}
    end;

    NeedToCheck := CheckDevTools(ClassIDs, ProviderKey, DADesignUtils, ServiceVersion{$IFDEF WIN32}, @ClassId{$ENDIF});
    if NeedToCheck <> ncNone then
      Exit;
  {$IFDEF CLR}
    if FindType('CoreLab.DbTools.' + ServiceShortName + '.' + ServiceShortName + 'DbToolsService', ServiceShortName, ServiceType) then
  {$ENDIF}
    begin
    {$IFDEF WIN32}
      if not FNeedUninitialize then
        FNeedUninitialize := Succeeded(CoInitialize(nil));
      Obj := CreateComObject(ClassID);
    {$ELSE}
      Obj := BorlandIDE.GetService(ServiceType);
    {$ENDIF}
    end;
    if Obj = nil then begin
      NeedToCheck := ncExpired;
      Exit;
    end
    else begin
      if FDesignNotification = nil then begin
        FDesignNotification := TDBToolsDesignNotification.Create;
        RegisterDesignNotification(FDesignNotification);
      end;
      DBToolsService := TDBToolsService.Create(DADesignUtils, Obj, DefaultConnectionStr);
      Result := DBToolsService;
      n := Length(FDBToolsServices);
      SetLength(FDBToolsServices, n + 1);
      FDBToolsServices[n] := DBToolsService;
    end;
  except
    NeedToCheck := ncExpired;
  end;
end;

function TDBTools.CheckDevTools(const ClassIDs: array of TGUID; const ProviderKey: string; const DADesignUtils: TDADesignUtilsClass;
      out ServiceVersion: int64 {$IFDEF WIN32}; FoundClassID: PGUID = nil{$ENDIF}): TNeedToCheckDbTools;

  function GetFileVersion(Filename: string): int64;
  var
  {$IFDEF CLR}
    VersionInfo: FileVersionInfo;
  {$ELSE}
    Handle,
    FixedFileInfoLen,
    VersionDataLen: DWORD;
    VersionData: TBytes;
    FixedFileInfo: ^VS_FIXEDFILEINFO;
  {$ENDIF}
  begin
    Result := 0;
    if FileExists(Filename) then begin
    {$IFDEF CLR}
      VersionInfo := FileVersionInfo.GetVersionInfo(Filename);
      Result :=
        VersionInfo.FileMajorPart * $1000000000000 +
        VersionInfo.FileMinorPart * $100000000 +
        VersionInfo.FileBuildPart * $10000 +
        VersionInfo.FilePrivatePart;
    {$ELSE}
      VersionDataLen := GetFileVersionInfoSize(PChar(Filename), Handle);
      SetLength(VersionData, VersionDataLen);
      if GetFileVersionInfo(PChar(Filename), Handle, VersionDataLen, VersionData) and
        VerQueryValue(VersionData, '\', Pointer(FixedFileInfo), FixedFileInfoLen) then
        Result := FixedFileInfo.dwFileVersionMS * $100000000 + FixedFileInfo.dwFileVersionLS;
    {$ENDIF}
    end;
  end;

var
  i: integer;

begin
  Result := ncNoAddin;
  ServiceVersion := 0;
  with TRegistry.Create do
    try
      try
        RootKey := HKEY_CLASSES_ROOT;

        for i := 0 to High(ClassIDs) do
          if OpenKeyReadOnly({$IFDEF WIN32}'CLSID\' + GUIDToString(ClassIDs[i]) + '\InprocServer32'
            {$ELSE}'CLSID\{' + GUIDToString(ClassIDs[i]) + '}\InprocServer32'{$ENDIF})
            and ValueExists('CodeBase') then begin
            Result := ncIncompatible;
            ServiceVersion := GetFileVersion(ReadString('CodeBase'));
            CloseKey;
            if ServiceVersion <> 0 then
              Result := ncNone;
          {$IFDEF WIN32}
            if FoundClassID <> nil then
              FoundClassID^ := ClassIDs[i];
          {$ENDIF}
            Break;
          end;

        if Result = ncNoAddin then begin
          RootKey := HKEY_LOCAL_MACHINE;
          if OpenKeyReadOnly('SOFTWARE\CoreLab\Database Developer Tools\DatabaseProviders\' + ProviderKey)
            and ValueExists('Assembly') then begin
            Result := ncIncompatible;
            ServiceVersion := GetFileVersion(ReadString('Assembly'));
            CloseKey;
          end;
        end;
      except
        //Silent
      end;
    finally
      Free;
      if Result <> ncNone then begin
        DADesignUtils.SetDBToolsDownloadParams(False, Result = ncIncompatible);
        CheckForTools(Result = ncIncompatible);
      end;
    end;
end;

function TDBTools.MenuItemsAvailable: boolean;
var
  Incompatible: boolean;
begin
  Result := FCurrentDADesignUtils.DBToolsAvailable;
  Incompatible := FCurrentDADesignUtils.NeedToCheckDbTools = ncIncompatible;
  if not Result then begin
    FCurrentDADesignUtils.SetDBToolsDownloadParams(True, Incompatible);
    CheckForTools(Incompatible);
  end;
end;

procedure TDBTools.EditSql(Sender: TObject);
begin
  if MenuItemsAvailable then
    FCurrentDBToolsService.EditSql(False);
end;

procedure TDBTools.QueryBuilder(Sender: TObject);
begin
  if MenuItemsAvailable then
    FCurrentDBToolsService.EditSql(True);
end;

procedure TDBTools.FindInDatabaseExplorer(Sender: TObject);
begin
  if MenuItemsAvailable then
    FCurrentDBToolsService.FindInDatabaseExplorer;
end;

procedure TDBTools.EditDatabaseObject(Sender: TObject);
begin
  if MenuItemsAvailable then
    FCurrentDBToolsService.EditDatabaseObject;
end;

procedure TDBTools.ExecuteSql(Sender: TObject);
begin
  if MenuItemsAvailable then
    FCurrentDBToolsService.ExecuteSql(False);
end;

procedure TDBTools.Compile(Sender: TObject);
begin
  if MenuItemsAvailable then
    FCurrentDBToolsService.Compile(False);
end;

procedure TDBTools.CompileDebug(Sender: TObject);
begin
  if MenuItemsAvailable then
    FCurrentDBToolsService.Compile(True);
end;

procedure TDBTools.DebugSql(Sender: TObject);
begin
  if MenuItemsAvailable then
    FCurrentDBToolsService.ExecuteSql(True);
end;

procedure TDBTools.RetrieveData(Sender: TObject);
begin
  if MenuItemsAvailable then
    FCurrentDBToolsService.RetrieveData(True);
end;

procedure TDBTools.PrepareMenu(Designer: IDesigner; Component: TComponent; DADesignUtils: TDADesignUtilsClass);
begin
  FCurrentDADesignUtils := DADesignUtils;
  FCurrentDBToolsService := GetDBToolsService(DADesignUtils);
  if FCurrentDBToolsService <> nil then
    with FCurrentDBToolsService do begin
      FCurrentDesigner := Designer;
      FCurrentComponent := Component;
    end;
end;

function TDBTools.HasDACSqlEditorFrame(Memo: TWinControl): boolean;
begin
  FLastMemo := Memo;
  FLastDACSqlEditorFrame := TDACSqlEditorFrame(Memo.Owner.FindComponent(Memo.Name + '_dbt'));
  Result := FLastDACSqlEditorFrame <> nil;
end;

function TDBTools.GetDACSqlEditorFrame(Memo: TWinControl): TDACSqlEditorFrame;
begin
  if Memo <> FLastMemo then
    HasDACSqlEditorFrame(Memo);
  Result := FLastDACSqlEditorFrame;
end;

procedure TDBTools.CheckConnectionChanges;
var
  i: integer;
begin
  for i := 0 to High(FDACSqlEditorFrames) do
    FDACSqlEditorFrames[i].CheckConnectionChange;
end;

function TDBTools.GetActiveDACSqlEditorFrame: TWinControl;
var
  i: integer;
  Handle: HWND;
  ClassName: {$IFDEF WIN32}PChar{$ELSE}StringBuilder{$ENDIF};
begin
  Result := nil;
{$IFDEF WIN32}
  GetMem(ClassName, 1024);
{$ELSE}
  ClassName := StringBuilder.Create;
  ClassName.Capacity := 1024;
{$ENDIF}
  try
    Handle := GetFocus;
    repeat
      Handle := GetParent(Handle);
      if Handle = 0 then
        Exit;
      GetClassName(Handle, ClassName, 1024);
  {$IFDEF WIN32}
    until ClassName = TDACSqlEditorFrame.ClassName;
  {$ELSE}
    until Pos(TDACSqlEditorFrame.ClassName, ClassName.ToString) <> 0;
  {$ENDIF}

    for i := 0 to High(FDACSqlEditorFrames) do
      if FDACSqlEditorFrames[i].Handle = Handle then begin
        Result := FDACSqlEditorFrames[i];
        Break;
      end;
  finally
  {$IFDEF WIN32}
    FreeMem(ClassName);
  {$ELSE}
    ClassName.Free;
  {$ENDIF}
  end;
end;

procedure TDBTools.CreateMenuActions;
var
  VerbIdx: TDBToolsVerb;
{$IFDEF WIN32}
  Bitmap: TBitmap;
  MenuImages: TImageList;
{$ENDIF}
begin
{$IFDEF WIN32}
  MenuImages := TImageList.Create(nil);
  Bitmap := TBitmap.Create;
  Bitmap.LoadFromResourceName(HInstance, 'MENUICONS');
  MenuImages.AddMasked(BitMap, $ff00ff);
  Bitmap.Free;
  (BorlandIDEServices as INTAServices).AddImages(MenuImages);
  MenuImages.Free;
{$ENDIF}
  FMenuManager := TActionManager.Create(nil);
  for VerbIdx := Low(TDBToolsVerb) to High(TDBToolsVerb) do begin
    FMenuActions[VerbIdx] := TAction.Create(FMenuManager);
    with FMenuActions[VerbIdx] do
      case VerbIdx of
        dbtEditSql: begin
          Caption := 'Edit SQL';
          OnExecute := EditSql;
        end;
        dbtQueryBuilder: begin
          Caption := 'Query Builder...';
          OnExecute := QueryBuilder;
        end;
        dbtFindInDatabaseExplorer: begin
          Caption := 'Find in Database Explorer';
          OnExecute := FindInDatabaseExplorer;
        end;
        dbtEditDatabaseObject: begin
          Caption := 'Edit object';
          OnExecute := EditDatabaseObject;
        end;
        dbtExecuteSql: begin
          Caption := 'Execute';
          OnExecute := ExecuteSql;
        end;
        dbtDebugSql: begin
          Caption := 'Step Into';
          OnExecute := DebugSql;
        end;
        dbtRetrieveData: begin
          Caption := 'Retreive data';
          OnExecute := RetrieveData;
        end;
        dbtCompile: begin
          Caption := 'Recompile';
          OnExecute := Compile;
        end;
        dbtCompileDebug: begin
          Caption := 'Recompile with debug info';
          OnExecute := CompileDebug;
        end;
      end;
  {$IFDEF WIN32}
    FMenuActions[VerbIdx].ImageIndex := Ord(VerbIdx);
    (BorlandIDEServices as INTAServices).AddActionMenu('', FMenuActions[VerbIdx], nil);
  {$ENDIF}
  end;
end;

constructor TDBTools.Create;
begin
  inherited;
  CreateMenuActions;
end;

destructor TDBTools.Destroy;
begin
  FMenuManager.Free;
  if FDesignNotification <> nil then
    UnregisterDesignNotification(FDesignNotification);
{$IFDEF WIN32}
  if FNeedUninitialize then
    CoUninitialize;
{$ENDIF}

  inherited;
end;

function TDBTools.GetDesignerName(Designer: IDesigner): string;
{$IFDEF CLR}
var
  Ptr: IntPtr;
{$ENDIF}
begin
{$IFDEF CLR}
  Ptr := Marshal.GetIUnknownForObject(Designer);
{$ENDIF}
  Result := 'Designer_' + IntToHex(Integer({$IFDEF WIN32}Designer{$ELSE}Ptr{$ENDIF}), 8) + FDesignNotification.FDebugStr;
{$IFDEF CLR}
  Marshal.Release(Ptr);
{$ENDIF}
end;

function TDBTools.GetMenuActions(Index: TDBToolsVerb): TAction;
begin
  Result := FMenuActions[Index];
end;

procedure TDBTools.ReplaceMemo(var Memo: TMemo; DADesignUtils: TDADesignUtilsClass; Component: TComponent);
var
  NewMemo: TWinControl;
  OldName: string;
  C: TComponent;
  DBToolsService: TDBToolsService;
begin
  DBToolsService := GetDBToolsService(DADesignUtils);
  if (DBToolsService = nil) or HasDACSqlEditorFrame(Memo) then
    Exit;

  NewMemo := TDACSqlEditorFrame.Create(Memo.Owner, Component, DBToolsService);
  with TDACSqlEditorFrame(NewMemo) do begin
    Parent := Memo.Parent;
    Left := Memo.Left;
    Top := Memo.Top;
    Width := Memo.Width;
    Height := Memo.Height;
    Align := Memo.Align;
    TabOrder := Memo.TabOrder;
    Anchors := Memo.Anchors;
    HelpContext := Memo.HelpContext;
    ReadOnly := Memo.ReadOnly;
    OnChange := Memo.OnChange;
    OnExit := Memo.OnExit;
    //OnKeyDown, OnKeyPress

    StatementType := stQuery;
    CheckConnectionChange;
  end;

  if Memo.Owner <> nil then begin
    Memo.OnExit := nil;
    C := NewMemo.Owner;
    while C <> nil do begin
      if C is TCustomForm then begin
        if TCustomForm(C).ActiveControl = Memo then begin
          TCustomForm(C).ActiveControl := NewMemo;
          NewMemo.SetFocus;
        end;
        Break;
      end;
      C := C.Owner;
    end;
  end;
  OldName := Memo.Name;
  Memo.Hide;

  NewMemo.Name := OldName + '_dbt';
  TDACSqlEditorFrame(NewMemo).EndInit;
end;

procedure TDBTools.DesignerClosing(const FileName: string);
var
  i: integer;
  Designer: IDesigner;
  DesignerName: string;
begin
  Designer := FDesignNotification.SqlSourceList.FindDesigner(FileName);
  if Designer = nil then
    Exit;
  DesignerName := GetDesignerName(Designer);
  for i := 0 to Length(FDBToolsServices) - 1 do
    FDBToolsServices[i].SqlService.DesignerClosing(DesignerName);
end;

{ TDBToolsService }

constructor TDBToolsService.Create(ADADesignUtils: TDADesignUtilsClass; ASqlService: {$IFDEF WIN32}IUnknown{$ELSE}TObject{$ENDIF}; ADefaultConnectionStr: string);
begin
  inherited Create;

  FConnectionStrList := TStringList.Create;
  FConnectionsList := TStringList.Create;
  FDefaultConnectionList := TStringList.Create;
  FDADesignUtils := ADADesignUtils;

{$IFDEF WIN32}
  ASqlService.QueryInterface(IDbToolsService, FSqlService);
{$ELSE}
  FSqlService := ASqlService as IDbToolsService;
{$ENDIF}
  ConnStrToList(ADefaultConnectionStr, FDefaultConnectionList);
end;

destructor TDBToolsService.Destroy;
begin
{$IFDEF WIN32}
  PInteger(@FSqlService)^ := 0; // To prevent _Release calling
{$ENDIF}
  FDefaultConnectionList.Free;
  FConnectionStrList.Free;
  FConnectionsList.Free;

  inherited;
end;

function TDBToolsService.DataTypeToDBToolsType(AType: TFieldType): integer;
var
  i: integer;
begin
  Assert(Length(FParamTypeMaps) > 0);
  Result := FParamTypeMaps[0].DBToolsType;
  for i := 0 to High(FParamTypeMaps) do
    if FParamTypeMaps[i].DACType = AType then begin
      Result := FParamTypeMaps[i].DBToolsType;
      Break;
    end;
end;

function TDBToolsService.DBToolsTypeToDataType(AType: integer; OldType: TFieldType): TFieldType;
var
  i: integer;
begin
  Result := ftUnknown;
  for i := 0 to High(FParamTypeMaps) do
    if FParamTypeMaps[i].DBToolsType = AType then begin
      if (Result = ftUnknown) or (FParamTypeMaps[i].DACType = OldType) then
        Result := FParamTypeMaps[i].DACType;
      if Result = OldType then
        Break;
    end
    else
      if Result <> ftUnknown then
        Break;
end;

procedure TDBToolsService.BeginConnectionStrGetting(const ConnectionStrList: TStringList);
begin
  FUsedConnectionStrList := ConnectionStrList;
  SetLength(FUsedConnectionCompareFlags, 0);
end;

procedure TDBToolsService.PutConnectionParam(const ConnectionParam: string; const CompareFlag: TCompareFlag = cfNormal);
var
  i: integer;
begin
  i := Length(FUsedConnectionCompareFlags);
  Assert (i < FDefaultConnectionList.Count);
  FUsedConnectionStrList.Values[FDefaultConnectionList.Names[i]] := ConnectionParam;
  SetLength(FUsedConnectionCompareFlags, i + 1);
  FUsedConnectionCompareFlags[i] := CompareFlag;
end;

procedure TDBToolsService.SkipConnectionParams(const Count: integer);
var
  i, j: integer;
begin
  i := Length(FUsedConnectionCompareFlags);
  Assert (i + Count <= FDefaultConnectionList.Count);
  SetLength(FUsedConnectionCompareFlags, i + Count);
  for j := i to i + Count - 1 do
    FUsedConnectionCompareFlags[j] := cfNone;
end;

class function TDBToolsService.GetConnectionParamStr(const ParamName, ParamValue: string): string;
var
  i: integer;
  QuoteChar: char;
begin
  Result := ParamName + '=';
  if Pos('''', ParamValue) > 0 then
    QuoteChar := '"'
  else
    if Pos('"', ParamValue) > 0 then
      QuoteChar := ''''
    else
      if (Pos(' ', ParamValue) > 0) or (Pos(';', ParamValue) > 0) then
        QuoteChar := '"'
      else
        QuoteChar := #0;
  if QuoteChar <> #0 then
    Result := Result + QuoteChar;
  for i := 1 to Length(ParamValue) do begin
    if (QuoteChar <> #0) and (ParamValue[i] = QuoteChar) then
      Result := Result + QuoteChar;
    Result := Result + ParamValue[i];
  end;
  if QuoteChar <> #0 then
    Result := Result + QuoteChar;
  Result := Result + ';';
end;

function TDBToolsService.GetConnection(const Component: TComponent): TCustomDAConnection;
begin
  if Component = nil then
    Result := nil
  else
  if Component is TCustomDAConnection then
    Result := TCustomDAConnection(Component)
  else
    Result := DADesignUtils.UsedConnection(Component);
end;

function TDBToolsService.GetNativeConnectionString(const Component: TComponent): string;
var
  i, n: integer;
  DefStr: string;
  Connection: TCustomDAConnection;
  ConnectionList: TStringList;
begin
  Result := '';
  Connection := GetConnection(Component);
  if Connection <> nil then begin
    ConnectionList := TStringList.Create;
    try
      BeginConnectionStrGetting(ConnectionList);
      DADesignUtils.GetDBToolsConnectionList(Connection);
      n := ConnectionList.Count - 1;
      for i := n downto 0 do begin
        DefStr := FDefaultConnectionList.Values[ConnectionList.Names[i]];
        if (DefStr <> '') and (DefStr = ConnectionList.ValueFromIndex[i]) then
          ConnectionList.Delete(i);
      end;
      for i := 0 to ConnectionList.Count - 1 do
         Result := Result + GetConnectionParamStr(ConnectionList.Names[i], ConnectionList.ValueFromIndex[i]);
    finally
      ConnectionList.Free;
    end;
  end;
end;

function TDBToolsService.GetConnectionString(const Component: TComponent): TString;
begin
  Result := {$IFDEF WIN32}ToWideChar({$ENDIF}
    GetNativeConnectionString(Component)
  {$IFDEF WIN32}){$ENDIF};
end;

function TDBToolsService.GetConnectionStringObjectTypeAndFullName(const Component: TComponent; out ConnectionString, ObjectType, FullName: TString): boolean;
begin
  ConnectionString := GetConnectionString(Component);
  Result := ConnectionString <> '';
  if Result then begin
    FullName := {$IFDEF WIN32}ToWideChar({$ENDIF}
      DADesignUtils.GetFullName(Component){$IFDEF WIN32}){$ENDIF};
    ObjectType := {$IFDEF WIN32}ToWideChar({$ENDIF}
      DADesignUtils.GetObjectType(Component){$IFDEF WIN32}){$ENDIF};
    if not(Component is TCustomDAConnection) then
      Result := Length(FullName) > 0;
  end
  else begin
    FullName := {$IFDEF WIN32}nil{$ELSE}''{$ENDIF};
    ObjectType := {$IFDEF WIN32}nil{$ELSE}''{$ENDIF};
  end;
end;

procedure TDBToolsService.GetConnections(NameList: TStrings; Condition: string = '');
var
  ConnectionInfoArray: TConnectionInfoArray;
  i: integer;
  Connection: {$IFDEF WIN32}PConnectionInfo{$ELSE}ConnectionInfo{$ENDIF};
begin
  ConnectionInfoArray := FSqlService.GetConnections;
  NameList.BeginUpdate;
  FConnectionsList.BeginUpdate;
{$IFDEF WIN32}
  Connection := AccessData(ConnectionInfoArray);
{$ENDIF}
  try
    FConnectionsList.Clear;
    NameList.Clear;
    for i := 0 to {$IFDEF WIN32}DataHigh{$ELSE}High{$ENDIF}(ConnectionInfoArray) do begin
    {$IFDEF CLR}
      Connection := ConnectionInfoArray[i];
    {$ENDIF}
      if (Condition = '') or (Pos(Condition, Connection.ConnectionString) > 0) then begin
        NameList.Add(Connection.Name);
        FConnectionsList.Add(GetConnectionValueStr(Connection.Name) + Connection.ConnectionString);
      end;
    {$IFDEF WIN32}
      Inc(Connection);
    {$ENDIF}
    end;
  finally
    NameList.EndUpdate;
    FConnectionsList.EndUpdate;
  {$IFDEF WIN32}
    UnaccessData(ConnectionInfoArray);
  {$ENDIF}
  end;
end;

function TDBToolsService.FindConnectionName(AConnection: TCustomDAConnection): string;
var
  i, j: integer;
  AConnectionStrList: TStringList;
  Str1, Str2, DefStr: string;

  function ToCommonCase(const s: string): string;
  var
    ts: string;
  begin
    Result := s;
    if FUsedConnectionCompareFlags[j] = cfNormal then begin
      ts := Trim(Result);
      if (Length(ts) < 2) or (ts[1] <> '"') or (ts[Length(ts)] <> '"') then
        Result := UpperCase(Result);
    end;
  end;

begin
  AConnectionStrList := TStringList.Create;
  try
    BeginConnectionStrGetting(AConnectionStrList);
    DADesignUtils.GetDBToolsConnectionList(AConnection);
    i := Length(FUsedConnectionCompareFlags);
    SetLength(FUsedConnectionCompareFlags, FDefaultConnectionList.Count);
    for j := i to FDefaultConnectionList.Count - 1 do
      FUsedConnectionCompareFlags[j] := cfNormal;
    for i := 0 to FConnectionsList.Count - 1 do begin
      ConnStrToList(FConnectionsList[i], FConnectionStrList);
      for j := 0 to FDefaultConnectionList.Count - 1 do begin
        if FUsedConnectionCompareFlags[j] = cfNone then
          Continue;

        DefStr := FDefaultConnectionList.ValueFromIndex[j];
        Str1 := ToCommonCase(AConnectionStrList.Values[FDefaultConnectionList.Names[j]]);
        Str2 := ToCommonCase(FConnectionStrList.Values[FDefaultConnectionList.Names[j]]);
        if (Str1 <> Str2) and (DefStr <> '') then begin
          if Str1 = '' then
            Str1 := ToCommonCase(DefStr);
          if Str2 = '' then
            Str2 := ToCommonCase(DefStr);
        end;
        if Str1 <> Str2 then
          Break
        else
          if j = FDefaultConnectionList.Count - 1 then begin
            Result := FConnectionStrList.Values[SConnectionName];
            Exit;
          end;
      end;
    end;
    Result := '';
  finally
    AConnectionStrList.Free;
  end;
end;

function TDBToolsService.GetConnectionStrList(ConnectionName: string): TStringList;
var
  i, j, k: integer;
  s: string;
begin
  Result := FConnectionStrList;
  s := GetConnectionValueStr(ConnectionName);
  for i := 0 to FConnectionsList.Count - 1 do
    if (Length(FConnectionsList[i]) >= Length(s)) and
      (Copy(FConnectionsList[i], 1, Length(s)) = s) then begin
      ConnStrToList(Copy(FConnectionsList[i], Length(s) + 1, Length(FConnectionsList[i]) - Length(s)), Result);

      for j := 0 to FDefaultConnectionList.Count - 1 do begin
        k := Result.IndexOfName(FDefaultConnectionList.Names[j]);
        if k < 0 then
          Result.Add(FDefaultConnectionList[j])
        else
          if Result.ValueFromIndex[k] = '' then
            Result[k] := FDefaultConnectionList[j];
      end;
      Exit;
    end;
  Result.Clear;
end;

procedure TDBToolsService.CheckConnection(const Component: TComponent);
var
  Connection: TCustomDAConnection;
begin
  Connection := GetConnection(Component);
  if Connection = nil then
    DatabaseError(SConnectionNotDefined);
end;

procedure TDBToolsService.FindInDatabaseExplorer;
var
  ConnectionString, ObjectType, FullName: TString;
begin
  CheckConnection(FCurrentComponent);
  if GetConnectionStringObjectTypeAndFullName(FCurrentComponent, ConnectionString, ObjectType, FullName) then
    SqlService.FindInDatabaseExplorer(ConnectionString, ObjectType, FullName);
end;

procedure TDBToolsService.EditDatabaseObject;
var
  ConnectionString, ObjectType, FullName: TString;
begin
  CheckConnection(FCurrentComponent);
  if GetConnectionStringObjectTypeAndFullName(FCurrentComponent, ConnectionString, ObjectType, FullName) then
    SqlService.EditDatabaseObject(ConnectionString, ObjectType, FullName);
end;

procedure TDBToolsService.ExecuteSql(Debug: boolean);
var
  SqlSource: TSqlSource;
begin
  CheckConnection(FCurrentComponent);
  SqlSource := GetSqlSource(FCurrentComponent, FCurrentDesigner);
  SqlService.ExecuteSql(SqlSource, Debug);
end;

procedure TDBToolsService.Compile(Debug: boolean);
var
  SqlSource: TSqlSource;
begin
  CheckConnection(FCurrentComponent);
  SqlSource := GetSqlSource(FCurrentComponent, FCurrentDesigner, SCompilePrefix);
  SqlService.ExecuteSql(SqlSource, Debug);
end;

procedure TDBToolsService.RetrieveData(AsDocument: boolean);
var
  SqlSource: TSqlSource;
begin
  CheckConnection(FCurrentComponent);
  SqlSource := GetSqlSource(FCurrentComponent, FCurrentDesigner);
  SqlService.RetrieveData(SqlSource, AsDocument);
end;

procedure TDBToolsService.EditSql(AsQuery: boolean);
var
  SqlSource: TSqlSource;
begin
  SqlSource := GetSqlSource(FCurrentComponent, FCurrentDesigner, SEditPrefix);
  SqlService.EditSql(SqlSource, AsQuery, SqlSource.FSqlSourceNotifier);
  if SqlSource.FSqlSourceNotifier = nil then
    DBTools.DesignNotification.SqlSourceList.Delete(SqlSource);
end;

function TDBToolsService.GetSqlEditor: ISqlEditor;
var
  n: integer;
begin
  n := Length(FSqlEditors) - 1;
  if n >= 0 then begin
    Result := FSqlEditors[n];
    SetLength(FSqlEditors, n);
  end
  else
    SqlService.CreateSqlEditor(Result);
end;

function TDBToolsService.GetSqlSource(Component: TComponent; Designer: IDesigner; SqlTextPrefix: string = ''): TSqlSource;
begin
  Assert(DBTools.DesignNotification <> nil);
  Result := DBTools.DesignNotification.SqlSourceList.Find(Component, SqlTextPrefix);
  if Result = nil then begin
    Result := TSqlSource.Create(Self, Component, Designer);
    Result.SqlTextPrefix := SqlTextPrefix;
    DBTools.DesignNotification.SqlSourceList.Add(Result);
  end;
end;

procedure TDBToolsService.ReturnSqlEditor(ASqlEditor: ISqlEditor);
var
  n: integer;
begin
  Windows.SetParent(ASqlEditor.Handle{$IFDEF CLR}.ToInt32{$ENDIF}, MAXDWORD - 2{HWND_MESSAGE});
  n := Length(FSqlEditors);
  SetLength(FSqlEditors, n + 1);
  FSqlEditors[n] := ASqlEditor;
end;

procedure TDBToolsService.AddParamTypeMap(ADACType: TFieldType; ADBToolsType: integer);
var
  n: integer;
begin
  n := Length(FParamTypeMaps);
  SetLength(FParamTypeMaps, n + 1);
  with FParamTypeMaps[n] do begin
    DACType := ADACType;
    DBToolsType := ADBToolsType;
  end;
end;

{$IFDEF WIN32}
class function TDBToolsService.AccessData(const V: PSafeArray): pointer;
begin
  if V = nil then
    Result := nil
  else
    SafeArrayCheck(SafeArrayAccessData(V, Result));
end;

class procedure TDBToolsService.UnaccessData(const V: PSafeArray);
begin
  if V <> nil then
    SafeArrayCheck(SafeArrayUnaccessData(V));
end;

class function TDBToolsService.DataHigh(const V: PSafeArray): integer;
begin
  if V = nil then
    Result := -1
  else
    SafeArrayGetUBound(V, 1, Result);
end;
{$ENDIF}

function TDBToolsService.GetConnectionValueStr(ConnectionName: string): string;
begin
  Result := SConnectionName + '=' + ConnectionName + ';';
end;

procedure TDBToolsService.ConnStrToList(ConnStr: string; const ConnList: TStrings);
var
  ParamName, ParamValue: string;
  QuoteChar: char;
  Quoted: boolean;
  i, l: integer;
begin
  ConnStr := Trim(ConnStr);
  ConnList.BeginUpdate;
  ConnList.Clear;
  try
    if ConnStr = '' then
      Exit;
    if ConnStr[Length(ConnStr)] <> ';' then
      ConnStr := ConnStr + ';';
    repeat
      i := Pos('=', ConnStr);
      if i <= 0 then
        Break;
      ParamName := Copy(ConnStr, 1, i); //with '='
      Inc(i);
      QuoteChar := ConnStr[i];
      Quoted := {$IFDEF CLR}AnsiChar{$ENDIF}(QuoteChar) in ['''', '"'];
      if Quoted then
        Inc(i);
      ParamValue := '';
      repeat
        if i + Ord(Quoted) > Length(ConnStr) then
          raise Exception.Create(SConnStrError);

        if Quoted then
          if ConnStr[i] = QuoteChar then begin
            Quoted := ConnStr[i + 1] <> ';';
            if (ConnStr[i + 1] = QuoteChar) or not Quoted then
              Inc(i)
            else
              raise Exception.Create(SConnStrError);
          end;

        if not Quoted and (ConnStr[i] = ';') then
          Break
        else
          ParamValue := ParamValue + ConnStr[i];
        Inc(i);
      until False;
      ConnList.Add(ParamName + ParamValue);
      l := Length(ConnStr) - i;
      if l > 0 then
        ConnStr := Copy(ConnStr, i + 1, l)
      else
        Break;
    until False;
  finally
    ConnList.EndUpdate;
  end;
end;

{ TModuleNotifier}

constructor TModuleNotifier.Create(const Module : IOTAModule);
begin
  inherited Create;

  FModule := Module;
{$IFDEF WIN32}
  FIndex := Module.AddNotifier(Self);
{$ELSE}
  Include(Module.BeforeSave, BeforeSave);
{$ENDIF}
end;

procedure TModuleNotifier.RemoveNotifier;
begin
{$IFDEF WIN32}
  if Findex >= 0 then
  begin
    FModule.RemoveNotifier(FIndex);
    FIndex := -1;
  end;
{$ELSE}
  Exclude(FModule.BeforeSave, BeforeSave);
{$ENDIF}
  DBTools.DesignNotification.ModuleList.Delete(FModule);
end;

destructor TModuleNotifier.Destroy;
begin
  RemoveNotifier;

  inherited;
end;

{$IFDEF WIN32}
procedure TModuleNotifier.Destroyed;
begin
  RemoveNotifier;
  FModule := nil;
end;

procedure TModuleNotifier.AfterSave;
begin
end;

procedure TModuleNotifier.BeforeSave;
begin
end;

procedure TModuleNotifier.Modified;
begin
end;

function TModuleNotifier.CheckOverwrite: Boolean;
begin
  Result := True;
end;

procedure TModuleNotifier.ModuleRenamed(const NewName: string);
begin
end;

function TModuleNotifier.AllowSave: Boolean;
begin
  if AllowSaveSwitch then
    DBTools.DesignerClosing(FModule.FileName);
  AllowSaveSwitch := not AllowSaveSwitch;
  Result := True;
end;

function TModuleNotifier.GetOverwriteFileNameCount: Integer;
begin
  Result := 0;
end;

function TModuleNotifier.GetOverwriteFileName(Index: Integer): string;
begin
  Result := '';
end;

procedure TModuleNotifier.SetSaveFileName(const FileName: string);
begin
end;

{$ELSE}
procedure TModuleNotifier.BeforeSave(Sender: TObject; e: EventArgs);
begin
  DBTools.DesignerClosing(FModule.FileName);
end;
{$ENDIF}

{ TModuleList }

function TModuleList.IndexOf(Module: IOTAModule): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if TModuleNotifier(Items[i]).Module = Module then begin
      Result := i;
      Break;
    end;
end;

procedure TModuleList.Add(Module: IOTAModule);
begin
  if IndexOf(Module) < 0 then
    inherited Add(TModuleNotifier.Create(Module));
end;

procedure TModuleList.Delete(Module: IOTAModule);
var
  Index: integer;
begin
  Index := IndexOf(Module);
  if Index >= 0 then
    Delete(Index);
end;

procedure TModuleList.Delete(Index: integer);
var
  ModuleNotifier: TModuleNotifier;
begin
  ModuleNotifier := TModuleNotifier(Items[Index]);
  inherited Delete(Index);
{$IFDEF WIN32}
  ModuleNotifier.Destroyed;
{$ENDIF}
end;

function GetDBToolsService(DADesignUtilsClass: TDADesignUtilsClass): TDBToolsService;
begin
  Result := TDBToolsService(DADesignUtilsClass.DBToolsService);
end;

initialization
  DBTools := TDBTools.Create;

finalization
  DBTools.Free;

end.