//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  MSScript
//////////////////////////////////////////////////
{$IFNDEF CLR}

{$I Sdac.inc}

unit MSScript;
{$ENDIF}

interface

uses
  SysUtils, Classes, DAScript, CRParser, MSParser, MSAccess, DBAccess;

type

  TMSScript = class(TDAScript)
  private
    FCodes: array of integer;
  protected
    function GetConnection: TMSConnection;
    procedure SetConnection(Value: TMSConnection);
    function GetDataSet: TCustomMSDataSet;
    procedure SetDataSet(Value: TCustomMSDataSet);
    function GetParserClass: TParserClass; override;
    function CreateCommand: TCustomDASQL; override;
    procedure CheckLexem(Code: integer; var StatementType: integer; var Omit: boolean); override;
    function GetReady(Code: integer): boolean; override;
    function CanOptimize(const SQL: string; const StatementType: integer): boolean; override;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    function ExecuteNext: boolean; override;

  published
    property Connection: TMSConnection read GetConnection write SetConnection;
    property DataSet: TCustomMSDataSet read GetDataSet write SetDataSet;
    property UseOptimization;
  end;

implementation

{ TMSScript }

function TMSScript.CreateCommand: TCustomDASQL;
begin
  Result := TMSSQL.Create(nil);
end;

function TMSScript.GetParserClass: TParserClass;
begin
  Result := TMSParser;
end;

function TMSScript.ExecuteNext: boolean;
var
  OldCommandTimeout: integer;
  i: integer;
begin
  for i := Low(FCodes) to High(FCodes) do
    FCodes[i] := 0;
  OldCommandTimeout := 0;
  if Assigned(DataSet) then
    OldCommandTimeout := DataSet.CommandTimeout;
  try
    Result := inherited ExecuteNext;
  finally
    if Assigned(DataSet) then
      DataSet.CommandTimeout := OldCommandTimeout;
  end;
end;

function TMSScript.GetConnection: TMSConnection;
begin
  Result := TMSConnection(inherited Connection);
end;

procedure TMSScript.SetConnection(Value: TMSConnection);
begin
  inherited Connection := Value;
end;

function TMSScript.GetDataSet: TCustomMSDataSet;
begin
  Result := TCustomMSDataSet(inherited DataSet);
end;

procedure TMSScript.SetDataSet(Value: TCustomMSDataSet);
begin
  inherited DataSet := Value;
end;

constructor TMSScript.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  SetLength(FCodes, 3);
  FMacros.SetParserClass(TMSParser);
  Delimiter := ';';
end;

destructor TMSScript.Destroy;
begin
  SetLength(FCodes, 0);
  inherited;
end;

procedure TMSScript.CheckLexem(Code: integer; var StatementType: integer; var Omit: boolean);
var
  i: integer;
begin
  if (Code <> lcBlank) and (Code <> lcComment) then begin
    for i := Low(FCodes) to High(FCodes) - 1 do
      FCodes[i] := FCodes[i + 1];
    FCodes[2] := Code;

    if (FCurrDelimiter = ';') then
      if (FCodes[2] in [lxBEGIN, lxDECLARE])
        or ((FCodes[2] in [lxPROCEDURE, lxFUNCTION, lxTRIGGER])
        and ((FCodes[1] = lxCREATE) and (FCodes[0] = 0) or
             (FCodes[1] = lxALTER) and (FCodes[0] = 0)))
      then
        StatementType := ST_SPECIFIC_SQL;
  end;
end;

function TMSScript.GetReady(Code: integer): boolean;
begin
  Result := Code = lxGO;
end;

function TMSScript.CanOptimize(const SQL: string; const StatementType: integer): boolean;
begin
  Result := (StatementType <> ST_SPECIFIC_SQL) and inherited CanOptimize(SQL, StatementType);
end;

end.
