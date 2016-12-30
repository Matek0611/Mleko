{******************************************}
{                                          }
{             FastReport v3.20             }
{         SDAC enduser components          }
{                                          }

// Created by: CoreLab
// E-mail: sdac@crlab.com

{                                          }
{******************************************}

unit frxSDACComponents;

interface

{$I frx.inc}

uses
  Windows, SysUtils, Classes, frxClass, frxCustomDB, DB, MSAccess, OLEDBAccess,
  OLEDBC, SdacVcl, frxDACComponents
 {$IFDEF Delphi6}
, Variants
 {$ENDIF}
 {$IFDEF QBUILDER}
, fqbClass
 {$ENDIF}
;

type
  TSDACTable = class(TMSTable)
  protected
    procedure InitFieldDefs; override;
  end;

  TSDACQuery = class(TMSQuery)
  protected
    procedure InitFieldDefs; override;
  end;

  TfrxSDACComponents = class(TfrxDACComponents)
  public
    function GetDescription: string; override;

    class function GetComponentsName: string; override;
    class function ResourceName: string; override;
    class function GetDatabaseClass: TfrxDACDatabaseClass; override;
    class function GetTableClass: TfrxDACTableClass; override;
    class function GetQueryClass: TfrxDACQueryClass; override;
  end;

  TfrxSDACDatabase = class(TfrxDACDatabase)
  private
  protected
    function GetDatabaseName: string; override;
    procedure SetDatabaseName(const Value: string); override;

  public
    constructor Create(AOwner: TComponent); override;
    class function GetDescription: string; override;

  published
    property LoginPrompt;
    property DatabaseName;
    property Username;
    property Password;
    property Server;
    property Connected;
    Property Params;
  end;

  TfrxSDACTable = class(TfrxDACTable)
  private
    FTable: TSDACTable;
  protected
    procedure SetDatabase(const Value: TfrxDACDatabase); override;
    procedure SetMaster(const Value: TDataSource); override;
    procedure SetMasterFields(const Value: string); override;
    procedure SetIndexFieldNames(const Value: string); override;
    function GetIndexFieldNames: string; override;
    function GetTableName: string; override;
    procedure SetTableName(const Value: string); override;
  public
    constructor Create(AOwner: TComponent); override;
    class function GetDescription: string; override;

    property Table: TSDACTable read FTable;
  published
    property Database;
    Property TableName: string read GetTableName write setTableName;
  end;

TfrxSDACQuery = class(TfrxDACQuery)
  public
    constructor Create(AOwner: TComponent); override;
    class function GetDescription: string; override;
{$IFDEF QBUILDER}
    function QBEngine: TfqbEngine; override;
{$ENDIF}
  published
    property Database;
    property IndexName;
    property MasterFields;
  end;

 {$IFDEF QBUILDER}
  TfrxEngineSDAC = class(TfrxEngineDAC)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ReadFieldList(const ATableName: string; var AFieldList: TfqbFieldList); override;
  end;
 {$ENDIF}

implementation

{$R *.res}

uses
  Graphics, frxSDACRTTI,
{$IFNDEF NO_EDITORS}
  frxSDACEditor,
{$ENDIF}
  frxDsgnIntf, frxRes;

{ TSDACTable }

procedure TSDACTable.InitFieldDefs;
begin
  if (TableName <> '') and (Assigned(Connection)) then
    inherited;
end;

{ TSDACQuery }

procedure TSDACQuery.InitFieldDefs;
begin
  if (SQL.Text <> '') and Assigned(Connection) then
    inherited;
end;

{ TfrxSDACComponents }

class function TfrxSDACComponents.GetComponentsName: string;
begin
  Result := 'SDAC';
end;

class function TfrxSDACComponents.GetDatabaseClass: TfrxDACDatabaseClass;
begin
  Result := TfrxSDACDatabase;
end;

class function TfrxSDACComponents.GetTableClass: TfrxDACTableClass;
begin
  Result := TfrxSDACTable;
end;

class function TfrxSDACComponents.GetQueryClass: TfrxDACQueryClass;
begin
  Result := TfrxSDACQuery;
end;

class function TfrxSDACComponents.ResourceName: string;
begin
  Result := 'FRXSDACOBJECTS';
end;

function TfrxSDACComponents.GetDescription: string;
begin
  Result := 'SDAC';
end;

{ TfrxSDACDatabase }

constructor TfrxSDACDatabase.Create(AOwner: TComponent);
begin
  inherited;
  FDatabase := TMSConnection.Create(nil);
  Component := FDatabase;
end;

class function TfrxSDACDatabase.GetDescription: string;
begin
  Result := 'SDAC Database';
end;

function TfrxSDACDatabase.GetDatabaseName: string;
begin
  Result := TMSConnection(FDatabase).Database;
end;

procedure TfrxSDACDatabase.SetDatabaseName(const Value: string);
begin
    TMSConnection(FDatabase).Database := Value;
end;

{ TfrxSDACTable }

constructor TfrxSDACTable.Create(AOwner: TComponent);
begin
  FTable := TSDACTable.Create(nil);
  DataSet := FTable;
  SetDatabase(nil);
  inherited;
end;

class function TfrxSDACTable.GetDescription: string;
begin
  Result := 'SDAC Table';
end;

procedure TfrxSDACTable.SetDatabase(const Value: TfrxDACDatabase);
begin
  inherited;
  if Value <> nil then
    FTable.Connection := TMSConnection(Value.Database)
  else
    if DACComponents <> nil then
      FTable.Connection := TMSConnection(DACComponents.DefaultDatabase)
    else
      FTable.Connection := nil;
end;

function TfrxSDACTable.GetIndexFieldNames: string;
begin
  Result := FTable.IndexFieldNames;
end;

function TfrxSDACTable.GetTableName: string;
begin
  Result := FTable.TableName;
end;

procedure TfrxSDACTable.SetIndexFieldNames(const Value: string);
begin
  FTable.IndexFieldNames := Value;
end;

procedure TfrxSDACTable.SetTableName(const Value: string);
begin
  FTable.TableName := Value;
  if Assigned(FTable.Connection) then
    FTable.InitFieldDefs;
end;

procedure TfrxSDACTable.SetMaster(const Value: TDataSource);
begin
  FTable.MasterSource := Value;
end;

procedure TfrxSDACTable.SetMasterFields(const Value: string);
var
  MasterNames: string;
  DetailNames: string;
begin
  GetMasterDetailNames(MasterFields, MasterNames, DetailNames);
  FTable.MasterFields := MasterNames;
  FTable.DetailFields := DetailNames;
end;

{ TfrxSDACQuery }

constructor TfrxSDACQuery.Create(AOwner: TComponent);
begin
  FQuery := TSDACQuery.Create(nil);
  inherited Create(AOwner);
end;

class function TfrxSDACQuery.GetDescription: string;
begin
  Result := 'SDAC Query';
end;

 {$IFDEF QBUILDER}
function TfrxSDACQuery.QBEngine: TfqbEngine;
begin
  Result := TfrxEngineSDAC.Create(nil);
  TfrxEngineSDAC(Result).FQuery.Connection := TCustomMSConnection(FQuery.Connection);
end;
 {$ENDIF}

 {$IFDEF QBUILDER}

{ TfrxEngineSDAC }

constructor TfrxEngineSDAC.Create(AOwner: TComponent);
begin
  inherited;
  FQuery := TSDACQuery.Create(Self);
end;

destructor TfrxEngineSDAC.Destroy;
begin
  FQuery.Free;
  inherited;
end;

procedure TfrxEngineSDAC.ReadFieldList(const ATableName: string;
  var AFieldList: TfqbFieldList);
var
  TempTable: TSDACTable;
  Fields: TFieldDefs;
  i: Integer;
  tmpField: TfqbField;
begin
  AFieldList.Clear;
  TempTable := TSDACTable.Create(Self);
  try
    TempTable.Connection := TCustomMSConnection(FQuery.Connection);
    TempTable.TableName := ATableName;
    Fields := TempTable.FieldDefs;
    try
      TempTable.Active := True;
      tmpField:= TfqbField(AFieldList.Add);
      tmpField.FieldName := '*';
      for i := 0 to Fields.Count - 1 do begin
        tmpField := TfqbField(AFieldList.Add);
        tmpField.FieldName := Fields.Items[i].Name;
        tmpField.FieldType := Ord(Fields.Items[i].DataType)
      end;
    except
    end;
  finally
    TempTable.Free;
  end;
end;

 {$ENDIF}

initialization
  RegisterDacComponents(TfrxSDACComponents);

finalization
  UnRegisterDacComponents(TfrxSDACComponents);

end.



