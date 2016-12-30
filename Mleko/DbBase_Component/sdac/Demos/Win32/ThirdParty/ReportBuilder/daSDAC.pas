
//////////////////////////////////////////////////
//  MS SQL Server Data Access Components
//  Copyright © 1998,2000 Core Lab. All right reserved.
//  ReportBuilder support
//  Based on Digital Metaphors Corporation's demos
//////////////////////////////////////////////////

unit daSDAC;

interface
uses
  Classes, SysUtils, Forms, ExtCtrls, DB,
  ppClass, ppComm, ppDBPipe, ppDB, ppClasUt, ppTypes,
  daDB, daDataView, daQueryDataView, daPreviewDataDlg,
  MSAccess;

type
  {MS SQL Server Data Access Components (SDAC) DataView Classes:
     1.  SDAC TDataSet descendants
           - TDataSets that can be children of a DataView.
           - Override the HasParent method of TComponent to return True
           - Must be registerd with the Delphi IDE using the RegisterNoIcon procedure

       a. TdaChildSDACQuery        - TMSQuery descendant that can be a child of a DataView
       b. TdaChildSDACTable        - TMSTable descendant that can be a child of a DataView
       b. TdaChildSDACStoredProc   - TMSStoredProc descendant that can be a child of a DataView

     3.  TdaSDACSession
           - descendant of TppSession
           - implements GetDatabaseNames, GetTableNames, etc.

     4.  TdaSDACDataSet
          - descendant of TppDataSet
          - implements GetFieldNames for SQL

     5.  TdaSDACQueryDataView
          - descendant of TppQueryDataView
          - uses the above classes to create the required
            Query -> DataSource -> Pipeline -> Report connection
          - uses the TdaSQL object built by the QueryWizard to assign
            SQL to the TSDACQuery etc.
      }

  { TdaChildSDACQuery }
  TdaChildSDACQuery = class(TMSQuery)
  public
    function HasParent: Boolean; override;
  end;  {class, TdaChildSDACQuery}

  { TdaChildSDACTable }
  TdaChildSDACTable = class(TMSTable)
  public
    function HasParent: Boolean; override;
  end;  {class, TdaChildSDACTable}

  { TdaChildSDACStoredProc }
  TdaChildSDACStoredProc = class(TMSStoredProc)
  public
    function HasParent: Boolean; override;
  end;  {class, TdaChildSDACStoredProc}

  { TdaSDACSession }
  TdaSDACSession = class(TdaSession)
  private

    procedure AddDatabase(aDatabase: TComponent);

  protected
    procedure SetDataOwner(aDataOwner: TComponent); override;

  public
    class function ClassDescription: String; override;
    class function DataSetClass: TdaDataSetClass; override;
    class function DatabaseClass: TComponentClass; override;

    procedure GetDatabaseNames(aList: TStrings); override;
    function  GetDatabaseType(const aDatabaseName: String): TppDatabaseType; override;
    procedure GetTableNames(const aDatabaseName: String; aList: TStrings); override;
    function  ValidDatabaseTypes: TppDatabaseTypes; override;
  end; {class, TdaSDACSession}

  { TdaSDACDataSet }
  TdaSDACDataSet = class(TdaDataSet)
  private
    FQuery: TMSQuery;
    FConnection: TMSConnection;

    function GetQuery: TMSQuery;

  protected
    procedure BuildFieldList; override;
    function  GetActive: Boolean; override;
    procedure SetActive(Value: Boolean); override;
    procedure SetDatabase(aDatabase: TComponent); override;
    procedure SetDataName(const aDataName: String); override;

    property Query: TMSQuery read GetQuery;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    class function ClassDescription: String; override;

    procedure GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings); override;
    procedure GetFieldsForSQL(aList: TList; aSQL: TStrings); override;
  end; {class, TdaSDACDataSet}

  { TdaSDACQueryDataView }
  TdaSDACQueryDataView = class(TdaQueryDataView)
    private
      FDataSource: TppChildDataSource;
      FQuery: TdaChildSDACQuery;

    protected
      procedure SQLChanged; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function PreviewFormClass: TFormClass; override;
      class function SessionClass: TClass; override;

      procedure Init; override;
      procedure ConnectPipelinesToData; override;

    published
      property DataSource: TppChildDataSource read FDataSource;

  end; {class, TdaSDACQueryDataView}


  {global functions to access default SDAC connection}
  function daGetDefaultSDACConnection: TMSConnection;

  {utility routines}
  procedure daGetSDACConnectionNames(aList: TStrings);
  function daGetSDACConnectionForName(aDatabaseName: String): TMSConnection;
  function daSDACConnectToDatabase(aDatabaseName: String): Boolean;

  function daGetSDACConnectionList: TppComponentList;

  {Delphi design time registration}
  procedure Register;

implementation

const
  cDefaultConnection = 'DefaultSDACConnection';

var
  FSDACConnection: TMSConnection;
  FSDACConnectionList: TppComponentList;


{******************************************************************************
 *
 ** R E G I S T E R
 *
{******************************************************************************}

procedure Register;
begin
  {SDAC DataAccess Components}
  RegisterNoIcon([TdaChildSDACQuery, TdaChildSDACTable, TdaChildSDACStoredProc]);

  {SDAC DataViews}
  RegisterNoIcon([TdaSDACQueryDataView]);
end;


{******************************************************************************
 *
 ** C H I L D  S D A C  D A T A   A C C E S S   C O M P O N E N T S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaChildSDACQuery.HasParent }

function TdaChildSDACQuery.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TdaChildSDACTable.HasParent }

function TdaChildSDACTable.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TdaChildSDACStoredProc.HasParent }

function TdaChildSDACStoredProc.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{******************************************************************************
 *
 ** S D A C  S E S S I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaSDACSession.ClassDescription }

class function TdaSDACSession.ClassDescription: String;
begin
  Result := 'SDACSession';
end; {class function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaSDACSession.DataSetClass }

class function TdaSDACSession.DataSetClass: TdaDataSetClass;
begin
  Result := TdaSDACDataSet;
end; {class function, DataSetClass}

{------------------------------------------------------------------------------}
{ TdaSDACSession.DatabaseClass }

class function TdaSDACSession.DatabaseClass: TComponentClass;
begin
  Result := TMSConnection;
end;

{------------------------------------------------------------------------------}
{ TdaSDACSession.GetDatabaseType }

function TdaSDACSession.GetDatabaseType(const aDatabaseName: String): TppDatabaseType;
begin
  Result := dtMSSQLServer;
end; {procedure, GetDatabaseType}

{------------------------------------------------------------------------------}
{ TdaSDACSession.GetTableNames }

procedure TdaSDACSession.GetTableNames(const aDatabaseName: String; aList: TStrings);
  procedure GetTablesList(const Connection: TMSconnection; List: TStrings);
  var
    MDDS: TMSMetadata;

    procedure AddNamesToList;
    var
      NameFld: TStringField;
    begin
      MDDS.Open;

      NameFld := MDDS.FieldByName('TABLE_NAME') as TStringField;
      while not MDDS.Eof do begin
        List.Add(NameFld.Value);
        MDDS.Next
      end;
    end;

  begin
    if Connection = nil then
      Exit;

    MDDS := nil;
    try
      MDDS := TMSMetadata.Create(nil);
      MDDS.Connection := Connection;
      MDDS.DatabaseName := MDDS.Connection.Database;

      MDDS.ObjectType := otTables;
      AddNamesToList;

      MDDS.ObjectType := otViews;
      AddNamesToList;
    
      if List is TStringList then
        TStringList(List).Sort;
    finally
      MDDS.Free;
    end;
  end;

begin
  aList.Clear;

  {get list of table names from a table object}
  if not daSDACConnectToDatabase(aDatabaseName) then Exit;

  GetTablesList(daGetSDACConnectionForName(aDatabaseName), aList);
end; {procedure, GetTableNames}

{------------------------------------------------------------------------------}
{ TdaSDACSession.AddDatabase }

procedure TdaSDACSession.AddDatabase(aDatabase: TComponent);
begin
  if daGetSDACConnectionList.IndexOf(aDatabase) < 0 then
    FSDACConnectionList.Add(aDatabase);
end; {procedure, AddDatabase}

{------------------------------------------------------------------------------}
{ TdaSDACSession.GetDatabaseNames }

procedure TdaSDACSession.GetDatabaseNames(aList: TStrings);
var
  liIndex: Integer;
begin
//  GetDatabasesList(FSDACConnection, aList);
  
  {call utility routine to get list of database names}
  //daGetSDACConnectionNames(aList);

  daGetDatabaseObjectsFromOwner(TdaSessionClass(Self.ClassType), aList, DataOwner);

  for liIndex := 0 to aList.Count-1 do
    if aList.Objects[liIndex] <> nil then
      AddDatabase(TComponent(aList.Objects[liIndex]));//*)
end; {procedure, GetDatabaseNames}

{------------------------------------------------------------------------------}
{ TdaSDACSession.SetDataOwner }

procedure TdaSDACSession.SetDataOwner(aDataOwner: TComponent);
var
  lList: TStringList;
begin
  inherited SetDataOwner(aDataOwner);

  lList := TStringList.Create;

  GetDatabaseNames(lList);

  lList.Free;
end; {procedure, SetDataOwner}

{------------------------------------------------------------------------------}
{ TdaSDACSession.ValidDatabaseTypes }

function TdaSDACSession.ValidDatabaseTypes: TppDatabaseTypes;
begin
  Result := [dtMSSQLServer];
end; {function, ValidDatabaseTypes}

{******************************************************************************
 *
 ** S D A C  D A T A S E T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaSDACDataSet.Create }

constructor TdaSDACDataSet.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FQuery := nil;
end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaSDACDataSet.Destroy }

destructor TdaSDACDataSet.Destroy;
begin
  FQuery.Free;

  inherited Destroy;
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaSDACDataSet.ClassDescription }

class function TdaSDACDataSet.ClassDescription: String;
begin
  Result := 'SDACDataSet';
end; {class function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaSDACDataSet.GetActive }

function TdaSDACDataSet.GetActive: Boolean;
begin
  Result := GetQuery.Active
end; {function, GetActive}

{------------------------------------------------------------------------------}
{ TdaSDACDataSet.SetActive }

procedure TdaSDACDataSet.SetActive(Value: Boolean);
begin
  GetQuery.Active := Value;
end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TdaSDACDataSet.GetQuery }

function TdaSDACDataSet.GetQuery: TMSQuery;
begin
  {create SDACDataSet, if needed}
  if (FQuery = nil) then
    FQuery := TMSQuery.Create(Self);

  Result := FQuery;
end; {procedure, GetQuery}

{------------------------------------------------------------------------------}
{ TdaSDACDataSet.SetDatabase }

procedure TdaSDACDataSet.SetDatabase(aDatabase: TComponent);
begin
  inherited SetDatabase(aDatabase);

  {table cannot be active to set database property}
  if GetQuery.Active then
    FQuery.Active := False;

  FConnection := (aDatabase as TMSConnection);
  {get SDAC Connection for name}
  FQuery.Connection := FConnection;
end; {procedure, SetDatabaseName}

{------------------------------------------------------------------------------}
{ TdaSDACDataSet.SetDataName }

procedure TdaSDACDataSet.SetDataName(const aDataName: String);
begin
  inherited SetDataName(aDataName);

  {dataset cannot be active to set data name}
  if GetQuery.Active then
    FQuery.Active := False;

  {construct an SQL statment that returns an empty result set,
   this is used to get the field information }
  FQuery.SQL.Text := 'SELECT * FROM ' + aDataName +
                     ' WHERE ''c'' <> ''c'' ';
end; {procedure, SetDataName}

{------------------------------------------------------------------------------}
{ TdaSDACDataSet.BuildFieldList }

procedure TdaSDACDataSet.BuildFieldList;
var
  liIndex: Integer;
  lQueryField: TField;
  lField: TppField;
begin
  inherited BuildFieldList;


  {set table to active}
  if not(GetQuery.Active) then
    FQuery.Active := True;

  {create TppField objects for each field in the table}
  for liIndex := 0 to FQuery.FieldCount - 1 do begin
    lQueryField := FQuery.Fields[liIndex];

    lField := TppField.Create(nil);

    lField.TableName    := DataName;
    lField.FieldName    := lQueryField.FieldName;
    lField.DataType     := ppConvertFieldType(lQueryField.DataType);

    AddField(lField);
  end;
end; {function, BuildFieldList}

{------------------------------------------------------------------------------}
{ TdaSDACDataSet.GetFieldNamesForSQL }

procedure TdaSDACDataSet.GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings);
var
  lQuery: TMSQuery;
begin
  aList.Clear;

  {create a temporary query}
  lQuery := TMSQuery.Create(Self);

  {set the database and SQL properties}
  lQuery.Connection := FConnection;
  lQuery.SQL := aSQL;

  {get the field names}
  lQuery.GetFieldNames(aList);

  lQuery.Free;
end; {procedure, GetFieldNamesForSQL}

{------------------------------------------------------------------------------}
{ TdaSDACDataSet.GetFieldsForSQL }

procedure TdaSDACDataSet.GetFieldsForSQL(aList: TList; aSQL: TStrings);
var
  lQuery: TMSQuery;
  lQueryField: TField;
  lField: TppField;
  liIndex: Integer;
begin
  aList.Clear;

  {create a temporary query}
  lQuery := TMSQuery.Create(Self);

  {assign databae and SQL properties}
  lQuery.Connection := FConnection;
  lQuery.SQL := aSQL;

  {set query to active}
  lQuery.Active := True;

  {create a TppField object for each field in the query}
  for liIndex := 0 to lQuery.FieldCount - 1 do begin
    lQueryField := lQuery.Fields[liIndex];

    lField := TppField.Create(nil);

    lField.FieldName    := lQueryField.FieldName;
    lField.DataType     := ppConvertFieldType(lQueryField.DataType);

    aList.Add(lField);
  end;

  lQuery.Free;
end; {procedure, GetFieldsForSQL}



{******************************************************************************
 *
 ** S D A C  Q U E R Y   D A T A V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaSDACQueryDataView.Create }

constructor TdaSDACQueryDataView.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  {notes: 1. must use ChildQuery, ChildDataSource, ChildPipeline etc.
          2. use Self as owner for Query, DataSource etc.
          3. do NOT assign a Name }

  FQuery := TdaChildSDACQuery.Create(Self);

  FDataSource := TppChildDataSource.Create(Self);
  FDataSource.DataSet := FQuery;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaSDACQueryDataView.Destroy }

destructor TdaSDACQueryDataView.Destroy;
begin
  FDataSource.Free;
  FQuery.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaSDACQueryDataView.PreviewFormClass }

class function TdaSDACQueryDataView.PreviewFormClass: TFormClass;
begin
  Result := TFormClass(GetClass('TdaPreviewDataDialog'));
end; {class function, PreviewFormClass}

{------------------------------------------------------------------------------}
{ TdaSDACQueryDataView.SessionClass }

class function TdaSDACQueryDataView.SessionClass: TClass;
begin
  Result := TdaSDACSession;
end; {class function, SessionClass}

{------------------------------------------------------------------------------}
{ TdaSDACQueryDataView.ConnectPipelinesToData }

procedure TdaSDACQueryDataView.ConnectPipelinesToData;
begin

  if DataPipelineCount = 0 then Exit;

  {need to reconnect here}
  TppDBPipeline(DataPipelines[0]).DataSource := FDataSource;

end; {procedure, ConnectPipelinesToData}

{------------------------------------------------------------------------------}
{ TdaSDACQueryDataView.Init }

procedure TdaSDACQueryDataView.Init;
var
  lDataPipeline: TppChildDBPipeline;

begin

  inherited Init;

  if DataPipelineCount > 0 then Exit;

  {note: DataView's owner must own the DataPipeline }
  lDataPipeline := TppChildDBPipeline(ppComponentCreate(Self, TppChildDBPipeline));
  lDataPipeline.DataSource := FDataSource;
 
  lDataPipeline.AutoCreateFields := False;

  {add DataPipeline to the dataview }
  lDataPipeline.DataView := Self;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TdaSDACQueryDataView.SQLChanged }

procedure TdaSDACQueryDataView.SQLChanged;
begin

  if FQuery.Active then
    FQuery.Close;

  FQuery.Connection := daGetSDACConnectionForName(SQL.DatabaseName);
  FQuery.SQL := SQL.MagicSQLText;

end; {procedure, SQLChanged}


{******************************************************************************
 *
 ** P R O C E D U R E S   A N D   F U N C T I O N S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ daGetDefaultSDACConnection }

function daGetDefaultSDACConnection: TMSConnection;
begin
  {create the default Connection, if needed}
  if (FSDACConnection = nil) then begin
    {create default SDAC Connection}
    FSDACConnection := TMSConnection.Create(nil);
    FSDACConnection.Name := cDefaultConnection;
  end;

  Result := FSDACConnection;
end; {function, daGetDefaultSDACConnection}

{------------------------------------------------------------------------------}
{ daGetSDACConnectionNames }

procedure daGetSDACConnectionNames(aList: TStrings);
begin
end; {procedure, daGetSDACConnectionNames}

{------------------------------------------------------------------------------}
{ daGetSDACConnectionForName }

function daGetSDACConnectionForName(aDatabaseName: String): TMSConnection;
var
  liIndex: Integer;
begin
  Result := nil;

  liIndex := 0;

 {check for a database object with this name}
  while (Result = nil) and (liIndex < daGetSDACConnectionList.Count) do
  begin
    if (AnsiCompareStr(FSDACConnectionList[liIndex].Name, aDatabaseName) = 0) or
       (AnsiCompareStr(TMSConnection(FSDACConnectionList[liIndex]).Server, aDatabaseName) = 0)
    then
      Result :=  TMSConnection(FSDACConnectionList[liIndex]);
    Inc(liIndex);
  end;

  if (Result <> nil) then
    Exit;

  {use the default database object}
  Result := daGetDefaultSDACConnection;

  {set DatabaseName property, if needed}
  if (Result.Server <> aDatabaseName) then begin
    if Result.Connected then
      Result.Connected := False;
    Result.Server := aDatabaseName;
  end;
end; {function, daGetSDACConnectionForName}

{------------------------------------------------------------------------------}
{ daSDACConnectToDatabase }

function daSDACConnectToDatabase(aDatabaseName: String): Boolean;
var
  lConnection: TMSConnection;
begin
  Result := False;

  lConnection := daGetSDACConnectionForName(aDatabaseName);

  if (lConnection = nil) then
    Exit;

  if not lConnection.Connected then begin
    if (lConnection = daGetDefaultSDACConnection) then
      lConnection.Connected := True
    else
      lConnection.Connected := True;
  end;

  Result := lConnection.Connected;
end; {function, daSDACConnectToDatabase}


{------------------------------------------------------------------------------}
{ daGetSDACConnectionList }

function daGetSDACConnectionList: TppComponentList;
begin
  if (FSDACConnectionList = nil) then
    FSDACConnectionList := TppComponentList.Create(nil);

  Result := FSDACConnectionList;
end; {function, daGetSDACConnectionList}


initialization
  {register the SDAC descendant classes}
  RegisterClasses([TdaChildSDACQuery, TdaChildSDACTable, TdaChildSDACStoredProc]);

  {register DADE descendant session, dataset, dataview}
  daRegisterSession(TdaSDACSession);
  daRegisterDataSet(TdaSDACDataSet);
  daRegisterDataView(TdaSDACQueryDataView);

  {initialize internal reference variables}
  FSDACConnection     := nil;
  FSDACConnectionList := nil;

finalization
  {free the default connection object}
  FSDACConnection.Free;
  FSDACConnectionList.Free;

  {unregister the SDAC descendant classes}
  UnRegisterClasses([TdaChildSDACQuery, TdaChildSDACTable, TdaChildSDACStoredProc]);

  {unregister DADE descendant the session, dataset, dataview}
  daUnRegisterSession(TdaSDACSession);
  daUnRegisterDataSet(TdaSDACDataSet);
  daUnRegisterDataView(TdaSDACQueryDataView);
end.
