
//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  SQL Monitor
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Sdac.inc}

unit MSSQLMonitor;
{$ENDIF}

interface

uses
  SysUtils, Classes, DB, DBAccess, DASQLMonitor;

type
  TTypeInfo = record
    Name: string;
    DataType: TFieldType;
  end;

const
  // Obsolete, needs to change to DB.FieldTypeNames
  ArrTypeInfoCount = 16 {$IFDEF VER5P}+ 2{$ENDIF}{$IFDEF VER10P} + 1{$ENDIF};
  ArrTypeInfo: array [0..ArrTypeInfoCount - 1] of TTypeInfo = (
    (Name: 'Unknown';  DataType: ftUnknown),
    (Name: 'String';   DataType: ftString),
    (Name: 'WideString';DataType: ftWideString),
    (Name: 'Smallint'; DataType: ftSmallint),
    (Name: 'Integer';  DataType: ftInteger),
    (Name: 'Word';     DataType: ftWord),
    (Name: 'LargeInt'; DataType: ftLargeInt),
    (Name: 'Boolean';  DataType: ftBoolean),
    (Name: 'Float';    DataType: ftFloat),
    (Name: 'Currency'; DataType: ftCurrency),
    (Name: 'BCD';      DataType: ftBCD),
    (Name: 'DateTime'; DataType: ftDateTime),
    (Name: 'Memo';     DataType: ftMemo),
  {$IFDEF VER10P}
    (Name: 'WideMemo'; DataType: ftWideMemo),
  {$ENDIF}
    (Name: 'Bytes';    DataType: ftBytes),
    (Name: 'VarBytes'; DataType: ftVarBytes),
    (Name: 'Blob';     DataType: ftBlob){$IFDEF VER5P},
    (Name: 'GUID';     DataType: ftGuid),
    (Name: 'Variant';  DataType: ftVariant){$ENDIF}
  );

function GetArrTypeInfoIdx(DataType: TFieldType): integer; overload;
function GetArrTypeInfoIdx(Name: string): integer; overload;

type

{ TMSSQLMonitor }

  TMSSQLMonitorClass = class of TMSSQLMonitor;

  TMSSQLMonitor = class(TCustomDASQLMonitor)
  protected
    procedure InternalTRSavepoint(Connection: TCustomDAConnection; Savepoint: string);
    procedure InternalTRRollbackToSavepoint(Connection: TCustomDAConnection; Savepoint: string);
    procedure InternalInfoMessage(Connection: TCustomDAConnection; MessageText: string);

    class function GetMonitor: TCustomDASQLMonitor; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    class function GetParamDataType(Param: TDAParam): string; override;

    class procedure TRSavepoint(Connection: TCustomDAConnection; Savepoint: string);
    class procedure TRRollbackToSavepoint(Connection: TCustomDAConnection; Savepoint: string);

    class procedure InfoMessage(Connection: TCustomDAConnection; MessageText: string);

    class function GetCaption: string; override;
  
  published
    property Active default True;
    property Options;
    property OnSQL;
    property TraceFlags;
  end;

implementation

uses
  MemDS, MSAccess, OLEDBAccess, DBMonitorIntf;

var
  MSMonitor: TMSSQLMonitor;

function GetArrTypeInfoIdx(DataType: TFieldType): integer; 
var
  i: integer;
begin
  if DataType = ftFixedChar then
    DataType := ftString;

  Result := - 1;
  for i := 0 to ArrTypeInfoCount - 1 do
    if ArrTypeInfo[i].DataType = DataType then 
    begin
      Result := i;
      Break;
    end;
end;

function GetArrTypeInfoIdx(Name: string): integer; 
var
  i: integer;
begin
  Result := - 1;
  for i := 0 to ArrTypeInfoCount - 1 do
    if ArrTypeInfo[i].Name = Name then 
    begin
      Result := i;
      Break;
    end;
end;

{ TMSSQLMonitor }

class procedure TMSSQLMonitor.TRSavepoint(Connection: TCustomDAConnection; Savepoint: string);
begin
  if GetMonitor <> nil then
    TMSSQLMonitor(GetMonitor).InternalTRSavepoint(Connection, Savepoint);
end;

class procedure TMSSQLMonitor.TRRollbackToSavepoint(Connection: TCustomDAConnection; Savepoint: string);
begin
  if GetMonitor <> nil then
    TMSSQLMonitor(GetMonitor).InternalTRRollbackToSavepoint(Connection, Savepoint);
end;

class procedure TMSSQLMonitor.InfoMessage(Connection: TCustomDAConnection; MessageText: string);
begin
  if (GetMonitor <> nil) then
    TMSSQLMonitor(GetMonitor).InternalInfoMessage(Connection, MessageText);
end;

class function TMSSQLMonitor.GetMonitor: TCustomDASQLMonitor;
begin
  Result := MSMonitor;
end;

class function TMSSQLMonitor.GetCaption: string;
begin
  Result := 'MS SQL';
end;

procedure TMSSQLMonitor.InternalTRSavepoint(Connection: TCustomDAConnection; Savepoint: string);
var
  St: string;
begin
  if Active then begin
    St := 'Savepoint ' + Savepoint + ': ' + Connection.Username + '@' + Connection.Server;

    if (moSQLMonitor in Options) and (tfTransact in TraceFlags) then
      AddStatement(St);

    if Assigned(FOnSQLEvent) then
      FOnSQLEvent(Connection, St, tfTransact);
  end;
end;

procedure TMSSQLMonitor.InternalTRRollbackToSavepoint(Connection: TCustomDAConnection; Savepoint: string);
var
  St: string;
begin
  if Active then begin
    St := 'Rollback to savepoint ' + Savepoint + ': ' + Connection.Username + '@' + Connection.Server;

    if (moSQLMonitor in Options) and (tfTransact in TraceFlags) then
      AddStatement(St);

    if Assigned(FOnSQLEvent) then
      FOnSQLEvent(Connection, St, tfTransact);
  end;
end;

procedure TMSSQLMonitor.InternalInfoMessage(Connection: TCustomDAConnection; MessageText: string);
var
  St: string;
  MessageID: Cardinal;
begin
  if Active and (tfMisc in TraceFlags) then begin
    St := 'Info Message: ' + MessageText + ': ' + Connection.Username + '@' + Connection.Server;

    if (moSQLMonitor in Options) then
      AddStatement(St);

    OnCustomMessage(St, Connection, tpBeforeEvent, MessageID);
    OnCustomMessage(St, Connection, tpAfterEvent, MessageID);

    if Assigned(FOnSQLEvent) then
      FOnSQLEvent(Connection, St, tfMisc);
  end;
end;

class function TMSSQLMonitor.GetParamDataType(Param: TDAParam): string;
begin
  if Param.DataType = TFieldType(ftMSXML) then
    Result := 'XML'
  else
  if Param.DataType = TFieldType(ftMSUDT) then
    Result := 'UDT'
  else
{$IFDEF D8} // Copied from inherited to avoid D8 Internal linker error: ILLK8903
  begin
    Result := FieldTypeNames[Param.DataType];
    if Param.DataType in [ftString,ftFixedChar,ftWideString] then
      Result := Result + '[' + IntToStr(Length(Param.AsString)) + ']';
  end;
{$ELSE}
    Result := inherited GetParamDataType(Param);
{$ENDIF}
end;

constructor TMSSQLMonitor.Create(AOwner: TComponent);
begin
  inherited;

  if MSMonitor = nil then
    MSMonitor := Self;
end;

destructor TMSSQLMonitor.Destroy;
begin
  if MSMonitor = Self then
    MSMonitor := nil;

  inherited;
end;

initialization

end.
 
