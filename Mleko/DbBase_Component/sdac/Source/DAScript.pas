//////////////////////////////////////////////////
//  DB Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  DB Access
//////////////////////////////////////////////////
{$IFNDEF CLR}

{$I Dac.inc}

unit DAScript;
{$ENDIF}

interface

uses
  Classes, SysUtils,
{$IFDEF CLR}
  System.Text,
{$ELSE}
  CLRClasses,
{$ENDIF}
  DB, CRParser, DBAccess;

const
  ST_UNKNOWN = 0;
  ST_DELIMETER = 1;
  ST_COMMENT = 2;
  ST_SPECIFIC_SQL = $8000;

type
  TDAScript = class;

  TDAStatement = class(TCollectionItem)
  protected
    FOmit: boolean;
    FStatementType: integer;
    FStartPos: integer;
    FEndPos: integer;
    FStartLine: integer;
    FEndLine: integer;
    FStartOffset: integer;
    FEndOffset: integer;
    FParams: TDAParams;

    function GetSQL: string;
    function GetScript: TDAScript;
    function GetParams: TDAParams;
    function CreateParams: TDAParams;
  public
    destructor Destroy; override;
    property Script: TDAScript read GetScript;
    property SQL: string read GetSQL;
    property Omit: boolean read FOmit write FOmit;

    property StartPos: integer read FStartPos;
    property EndPos: integer read FEndPos;
    property StartLine: integer read FStartLine;
    property EndLine: integer read FEndLine;
    property StartOffset: integer read FStartOffset;
    property EndOffset: integer read FEndOffset;

    property Params: TDAParams read GetParams;

    procedure Excecute;
  end;

  TDAStatementClass = class of TDAStatement;

  TDAStatements = class(TCollection)
  protected
    FScript: TDAScript;
    function GetItem(Index: Integer): TDAStatement;
    function CreateStatement(StatementType: integer; Omit: boolean; StartPos,
      EndPos, StartLine, EndLine, StartOffset, EndOffset: integer): TDAStatement;
  public
    constructor Create(ItemClass: TCollectionItemClass; Script: TDAScript);
    property Items[Index: Integer]: TDAStatement read GetItem; default;
  end;

  TDAStatementsClass = class of TDAStatements;

  TBeforeStatementExecuteEvent = procedure (Sender: TObject; var SQL: string; var Omit: boolean) of object;
  TAfterStatementExecuteEvent = procedure (Sender: TObject; SQL: string) of object;
  TErrorAction = (eaAbort, eaFail, eaException, eaContinue);
  TOnErrorEvent = procedure (Sender: TObject; E: Exception; SQL: string; var Action: TErrorAction) of object;

  TDelimiterState = (dsNone, dsDelimiter, dsBlank, dsValue, dsSet);

  TDAScript = class (TComponent)
  protected
    FSQL: TStrings;
    FSQLActual: boolean;
    FStream: TStream;
    FCommand: TCustomDASQL;
    FMacros: TMacros;
    FErrorOffset: integer;
    FStartPos: integer;
    FEndPos: integer;
    FStartLine: integer;
    FEndLine: integer;
    FStartOffset: integer;
    FEndOffset: integer;
    FDataSource: TDataSource;
    FBeforeExecute: TBeforeStatementExecuteEvent;
    FAfterExecute: TAfterStatementExecuteEvent;
    FOnError: TOnErrorEvent;
    FParser: TParser;
    FSQLParser: TParser;
    FStmtOffset: integer;
    FDesignCreate: boolean;
    FCurrDelimiter: string;
    FDelimiter: string;
    FDelimiterState: TDelimiterState;
    FSt: string;
    FStatements: TDAStatements;
    FCurrentStatementIdx: integer;
    FStatementsPopulating: boolean;

    FUseOptimization: boolean;
    FAllowOptimization: boolean;
    FBuffer: StringBuilder;

    function GetConnection: TCustomDAConnection;
    procedure SetConnection(Value: TCustomDAConnection);
    procedure ValidateConnection(Value: TCustomDAConnection); virtual;
    function GetParserClass: TParserClass; virtual;
    function UsedConnection: TCustomDAConnection; virtual;
    function GetSQLText(StartLine, EndLine, StartOffset, EndOffset, Length: integer): string;
    procedure SetSQL(Value: TStrings);
    procedure SQLChanged(Sender: TObject);
    function GetDebug: boolean;
    procedure SetDebug(Value: boolean);
    procedure SetMacros(Value: TMacros);
    function GetDataSet: TCustomDADataSet;
    procedure SetDataSet(Value: TCustomDADataSet);
    function GetParams: TDAParams;
    procedure SetDelimiter(const Value: string);
    function IsDelimiterStored: boolean;
    function IsBlankEndsDelimeter: boolean; virtual;
    procedure Loaded; override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadMacroData(Reader: TReader);
    procedure WriteMacroData(Writer: TWriter);
    procedure CheckLexem(Code: integer; var StatementType: integer; var Omit: boolean); virtual;
    function GetReady(Code: integer): boolean; virtual;
    procedure AssignTo(Dest: TPersistent); override;
    function CreateParser(const Text: string): TParser; overload; virtual;
    function CreateParser(Stream: TStream): TParser; overload; virtual;
    function GetSQLParser(const Text: string): TParser; virtual;
    function CreateCommand: TCustomDASQL; virtual;
    procedure DoBeforeStatementExecute(var SQL: string; StatementType: integer; var Omit: boolean); virtual;
    procedure DoAfterStatementExecute(var SQL: string; StatementType: integer); virtual;
    procedure ExecuteStatement(SQL: string; StatementType: integer; var Omit: Boolean; out BreakExec: boolean; Params: TDAParams = nil); virtual;
    procedure CreateStatement(StatementType: integer; Omit: boolean; StartPos, EndPos,
      StartLine, EndLine, StartOffset, EndOffset: integer); virtual;
    procedure CalculateErrorOffset(E: Exception); virtual;

    function CreateStatementsObject: TDAStatements; virtual;
    function GetStatements: TDAStatements;
    procedure Open(Stream: TStream);
    procedure Close;

    function IsSpecificSQL(StatementType: integer): boolean; virtual;
    function CanOptimize(const SQL: string; const StatementType: integer): boolean; virtual; // Must return True if  statement may be concatenated with previous
    procedure InternalExecute(const SQL: string; out BreakExec: boolean; Params: TDAParams = nil); // Sends SQL to server
    procedure Flush(out BreakExec: boolean);

    property Params: TDAParams read GetParams;
    property UseOptimization: boolean read FUseOptimization write FUseOptimization default False;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    procedure Execute; virtual;
    procedure ExecuteStream(Stream: TStream);
    procedure ExecuteFile(const FileName: string);
    function ExecuteNext: boolean; virtual;
    procedure BreakExec; virtual;
    function FindMacro(Name: string): TMacro;
    function MacroByName(Name: string): TMacro;
    function ErrorOffset: integer;

    property Connection: TCustomDAConnection read GetConnection write SetConnection;
    property DataSet: TCustomDADataSet read GetDataSet write SetDataSet;
    property StartPos: integer read FStartPos;
    property EndPos: integer read FEndPos;
    property StartLine: integer read FStartLine;
    property EndLine: integer read FEndLine;
    property StartOffset: integer read FStartOffset;
    property EndOffset: integer read FEndOffset;
    property Statements: TDAStatements read GetStatements;
  published
    property SQL: TStrings read FSQL write SetSQL;
    property Debug: boolean read GetDebug write SetDebug default False;
    property Delimiter: string read FDelimiter write FDelimiter stored IsDelimiterStored;
    property Macros: TMacros read FMacros write SetMacros stored False;
    property BeforeExecute: TBeforeStatementExecuteEvent read FBeforeExecute write FBeforeExecute;
    property AfterExecute: TAfterStatementExecuteEvent read FAfterExecute write FAfterExecute;
    property OnError: TOnErrorEvent read FOnError write FOnError;
  end;

  TDAScriptUtils = class
  public
    class procedure SetDesignCreate(Obj: TDAScript; Value: boolean);
    class function GetDesignCreate(Obj: TDAScript): boolean;
    class procedure SetCommand(Obj: TDAScript; Command: TCustomDASQL);
    class function GetCommand(Obj: TDAScript): TCustomDASQL;
    class procedure Open(Obj: TDAScript; Stream: TStream);
    class procedure Close(Obj: TDAScript);
    class function UsedConnection(Obj: TDAScript): TCustomDAConnection;
  end;

implementation

uses
{$IFNDEF VER6P}
  MemData,
{$ENDIF}
  DAConsts;

{ TDAStatement }
destructor TDAStatement.Destroy;
begin
  FParams.Free;
  
  inherited;
end;

function TDAStatement.GetScript: TDAScript;
begin
  Result := TDAStatements(Collection).FScript;
end;

function TDAStatement.GetSQL: string;
begin
  Result := Script.GetSQLText(FStartLine, FEndLine, FStartOffset, FEndOffset, FEndPos - FStartPos);
end;

function TDAStatement.GetParams: TDAParams;
begin
  if FParams = nil then begin
    FParams := CreateParams;
    TDBAccessUtils.ParseSQL(Script.FCommand, SQL, FParams);
  end;
  Result := FParams;
end;

function TDAStatement.CreateParams: TDAParams;
begin
  Result := TDBAccessUtils.CreateParamsObject(Script.FCommand);
end;

procedure TDAStatement.Excecute;
var
  BreakExec: boolean;
begin
  Script.ExecuteStatement(GetSQL, FStatementType, FOmit, BreakExec, FParams);
end;

{ TDAStatements }

constructor TDAStatements.Create(ItemClass: TCollectionItemClass; Script: TDAScript);
begin
  inherited Create(ItemClass);

  FScript := Script;
end;

function TDAStatements.GetItem(Index: Integer): TDAStatement;
begin
  Result := TDAStatement(inherited Items[Index]);
end;

function TDAStatements.CreateStatement(StatementType: integer; Omit: boolean; StartPos,
  EndPos, StartLine, EndLine, StartOffset, EndOffset: integer): TDAStatement;
begin
  Result := Add as TDAStatement;

  Result.FOmit := Omit;
  Result.FStartLine := StartLine;
  Result.FEndLine := EndLine;
  Result.FStartPos := StartPos;
  Result.FEndPos := EndPos;
  Result.FStartOffset := StartOffset;
  Result.FEndOffset := EndOffset; 
  Result.FStatementType := StatementType;
end;

{ TDAScript }

constructor TDAScript.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FDataSource := TDataSource.Create(nil);
  FSQL := TStringList.Create;
  TStringList(FSQL).OnChange := SQLChanged;
  FCommand := CreateCommand;
  FMacros := TMacros.Create(nil);
  FOnError := nil;
  FErrorOffset := 0;
  FDelimiter := ';';
  FCurrDelimiter := FDelimiter;
  FCurrentStatementIdx := -1;
  FSQLActual := True;
  FBuffer := StringBuilder.Create;
  FDesignCreate := csDesigning in ComponentState;
end;

destructor TDAScript.Destroy;
begin
  FParser.Free;
  FMacros.Free;
  FCommand.Free;
  FSQL.Free;
  FDataSource.Free;
  FBuffer.Free;
  FSQLParser.Free;
  FStatements.Free;

  inherited;
end;

procedure TDAScript.Loaded;
begin
  inherited;
  FDesignCreate := False;
end;

procedure TDAScript.DefineProperties(Filer: TFiler);
  function WriteMacros: boolean;
  begin
    if Filer.Ancestor <> nil then
      Result := not FMacros.IsEqual(TDAScript(Filer.Ancestor).FMacros)
    else
      Result := FMacros.Count > 0;
  end;
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('MacroData', ReadMacroData, WriteMacroData, WriteMacros);
end;

procedure TDAScript.ReadMacroData(Reader: TReader);
begin
  Reader.ReadValue;
  Reader.ReadCollection(FMacros);
end;

procedure TDAScript.WriteMacroData(Writer: TWriter);
begin
  Writer.WriteCollection(FMacros);
end;

procedure TDAScript.Execute;
var
  BreakExec: boolean;
begin
  if not FStatementsPopulating then begin
    if Assigned(DataSet) then begin
      if TDBAccessUtils.UsedConnection(DataSet) = nil then
        raise EDatabaseError.Create(SConnectionNotDefined);
      DataSet.DisableControls;
      TDBAccessUtils.InternalConnect(TDBAccessUtils.UsedConnection(DataSet));
    end
    else begin
      if TDBAccessUtils.UsedConnection(FCommand) = nil then
        raise EDatabaseError.Create(SConnectionNotDefined);
      TDBAccessUtils.InternalConnect(TDBAccessUtils.UsedConnection(FCommand));
    end;
  end;
  try
    FAllowOptimization := True;
    try
      FCurrDelimiter := FDelimiter;
      while ExecuteNext do;
      Flush(BreakExec);
    finally
      FAllowOptimization := False;
    end;
  finally
    if not FStatementsPopulating then begin
      if Assigned(DataSet) then begin
        DataSet.EnableControls;
        TDBAccessUtils.InternalDisconnect(TDBAccessUtils.UsedConnection(DataSet));
      end
      else
        TDBAccessUtils.InternalDisconnect(TDBAccessUtils.UsedConnection(FCommand));
    end;
  end;
end;

procedure TDAScript.Open(Stream: TStream);
begin
  Assert(FStream = nil);
  FStream := Stream;
end;

procedure TDAScript.Close;
begin
  FStream := nil;
end;

function TDAScript.CanOptimize(const SQL: string; const StatementType: integer): boolean;
begin
  Result := FBuffer.Length + Length(SQL) < $FFFF;
end;

function TDAScript.IsSpecificSQL(StatementType: integer): boolean;
begin
  Result := StatementType = ST_SPECIFIC_SQL;
end;

procedure TDAScript.InternalExecute(const SQL: string; out BreakExec: boolean;
  Params: TDAParams = nil); // Sends SQL to server
var
  i: Integer;
  Action: TErrorAction;
  MacrosDest: TMacros;
  ParamsDest: TDAParams;
begin
  if Assigned(DataSet) then begin
    DataSet.SQL.Text := SQL;
    ParamsDest := DataSet.Params;
    MacrosDest := DataSet.Macros;
  end
  else begin
    FCommand.SQL.Text := SQL;
    ParamsDest := FCommand.Params;
    MacrosDest := FCommand.Macros;
  end;

  Assert(ParamsDest <> nil);
  if Params <> nil then
    ParamsDest.AssignValues(Params);

  Assert(MacrosDest <> nil);
  for i := 0 to MacrosDest.Count - 1 do
    MacrosDest[i].Assign(MacroByName(MacrosDest[i].Name));

  try
    if Assigned(DataSet) then
      DataSet.Execute
    else
      FCommand.Execute;

  except
    on EAbort do
      raise;
    on E: Exception do begin
      CalculateErrorOffset(E);
      Action := eaException;
      if Assigned(FOnError) then
        FOnError(Self, E, Trim(SQL), Action);
      case Action of
        eaAbort:
          BreakExec := True;
        eaFail:
          raise;
        eaException:
          ApplicationHandleException(E);
      end;
    end;
  end;
end;

procedure TDAScript.Flush(out BreakExec: boolean);
begin
  if FBuffer.Length <> 0 then // Flush
    InternalExecute(FBuffer.ToString, BreakExec);
  FBuffer.Length := 0;
end;

procedure TDAScript.ExecuteStream(Stream: TStream);
begin
  Open(Stream);
  try
    Execute;
  finally
    Close;
  end;
end;

procedure TDAScript.ExecuteFile(const FileName: string);
var
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(FileName, fmOpenRead);
  try
    ExecuteStream(FileStream);
  finally
    FileStream.Free;
  end;
end;

function TDAScript.FindMacro(Name: string): TMacro;
begin
  Result := FMacros.FindMacro(Name);
end;

function TDAScript.MacroByName(Name: string): TMacro;
begin
  Result := FMacros.MacroByName(Name);
end;

function TDAScript.ErrorOffset: integer;
begin
  Result := FErrorOffset;
end;

function TDAScript.GetReady(Code: integer): boolean;
begin
  Result := False;
end;

procedure TDAScript.AssignTo(Dest: TPersistent);
begin
  if Dest is TDAScript then begin
    TDAScript(Dest).SetConnection(GetConnection);
    TDAScript(Dest).SQL.Text := SQL.Text;
    TDAScript(Dest).Debug := Debug;
    TDAScript(Dest).Macros := Macros;
  end
  else
    inherited;
end;

function TDAScript.GetConnection: TCustomDAConnection;
begin
  Result := FCommand.Connection;
end;

procedure TDAScript.SetConnection(Value: TCustomDAConnection);
begin
  FCommand.Connection := Value;
  ValidateConnection(Value);
end;

procedure TDAScript.ValidateConnection(Value: TCustomDAConnection);
begin
end;

function TDAScript.UsedConnection: TCustomDAConnection;
begin
  Result := TDBAccessUtils.UsedConnection(FCommand);
end;

function TDAScript.GetSQLText(StartLine, EndLine, StartOffset, EndOffset, Length: integer): string;
var
  SQL: StringBuilder;
  i: integer;
  SPos, EPos: integer;
begin
  SQL := StringBuilder.Create(Length);
  try
    for i := StartLine to EndLine do begin
      if i = StartLine then
        SPos := StartOffset + 1
      else
        SPos := 1;
      if i = EndLine then
        EPos := EndOffset + 1
      else
        EPos := {$IFDEF CLR}Borland.Delphi.{$ENDIF}System.Length(FSQL[i]);
      SQL.Append(Copy(FSQL[i], SPos, EPos - SPos + 1));
      if i <> EndLine then
        SQL.Append(#$D#$A);
      Result := SQL.ToString;
    end;
  finally
    SQL.Free;
  end;
end;

procedure TDAScript.SetSQL(Value: TStrings);
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

procedure TDAScript.SQLChanged(Sender: TObject);
begin
  FMacros.Scan(FSQL.Text);
  BreakExec;
  FStatements.Free;
  FStatements := nil;
  FSQLActual := True;
end;

function TDAScript.GetDebug: boolean;
begin
  Result := FCommand.Debug;
end;

procedure TDAScript.SetDebug(Value: boolean);
begin
  FCommand.Debug := Value;
end;

procedure TDAScript.SetMacros(Value: TMacros);
begin
  FMacros.Assign(Value);
end;

function TDAScript.GetDataSet: TCustomDADataSet;
begin
  Result := FDataSource.DataSet as TCustomDADataSet;
end;

procedure TDAScript.SetDataSet(Value: TCustomDADataSet);
begin
  FDataSource.DataSet := Value;
end;

procedure TDAScript.BreakExec;
begin
  FParser.Free;
  FParser := nil;
  FStmtOffset := 0;
  FStartPos := 0;
  FStartLine := 0;
  FEndPos := 0;
  FEndLine := 0;
end;

function TDAScript.CreateParser(const Text: string): TParser;
begin
  Result := GetParserClass.Create(Text);
end;

function TDAScript.CreateParser(Stream: TStream): TParser;
begin
  Result := GetParserClass.Create(Stream);
end;

function TDAScript.GetSQLParser(const Text: string): TParser;
begin
  if FSQLParser = nil then begin
    FSQLParser := TParser(CreateParser(Text));
    FSQLParser.OmitBlank := False;
    FSQLParser.Uppered := False;
  end
  else
    FSQLParser.SetText(Text);
  Result := FSQLParser;
end;

function TDAScript.CreateCommand: TCustomDASQL;
begin
  Result := TCustomDASQL.Create(nil);
end;

procedure TDAScript.CalculateErrorOffset(E: Exception);
begin
  FErrorOffset := FStmtOffset;
end;

function TDAScript.CreateStatementsObject: TDAStatements;
begin
  Result := TDAStatements.Create(TDAStatement, Self);
end;

function TDAScript.GetStatements: TDAStatements;
begin
  if FStatements = nil then begin
    FStatements := CreateStatementsObject;
    FStatementsPopulating := True;
    try
      Execute;
    finally
      FStatementsPopulating := False;
    end;
  end;
  Result := FStatements;
end;

procedure TDAScript.DoBeforeStatementExecute(var SQL: string; StatementType: integer; var Omit: boolean);
begin
end;

procedure TDAScript.DoAfterStatementExecute(var SQL: string; StatementType: integer);
begin
end;

procedure TDAScript.CreateStatement(StatementType: integer; Omit: boolean; StartPos,
  EndPos, StartLine, EndLine, StartOffset, EndOffset: integer);
begin
  FStatements.CreateStatement(StatementType, Omit, StartPos, EndPos,
    StartLine, EndLine, StartOffset, EndOffset);
end;

procedure TDAScript.ExecuteStatement(SQL: string; StatementType: integer;
  var Omit: Boolean; out BreakExec: boolean; Params: TDAParams = nil);
begin
  BreakExec := False;
  if FStatementsPopulating then
    CreateStatement(StatementType, False, StartPos, EndPos, StartLine,
      EndLine, StartOffset, EndOffset)
  else
  begin
    if SQL = '' then
      Exit;
    if Assigned(FBeforeExecute) then
      FBeforeExecute(Self, SQL, Omit);
    DoBeforeStatementExecute(SQL, StatementType, Omit);
    if not Omit then begin
      try
        if not (UseOptimization and FAllowOptimization) then
          InternalExecute(SQL, BreakExec, Params)
        else
        begin
          if not CanOptimize(SQL, StatementType) then
            Flush(BreakExec);
          if FBuffer.Length <> 0 then begin
            FBuffer.Append(Delimiter);
            FBuffer.Append(#$D#$A);
          end;
          FBuffer.Append(SQL);
        end;
      finally
        DoAfterStatementExecute(SQL, StatementType);
      end;
      if Assigned(FAfterExecute) then
        FAfterExecute(Self, SQL);
    end;
  end;
end;

function TDAScript.ExecuteNext: boolean;
var
  SQL: StringBuilder;
  PrevSt, s: string;
  Code: integer;
  Ready: boolean;
  NewDelimiter: string;
  BreakExecution: boolean;
  StatementType: integer;
  Omit: boolean;
  OldDebug: boolean;
  CurrentStatement: TDAStatement;
begin
  Result := False;

  if not FStatementsPopulating and (FStatements <> nil) and (FStream = nil) then begin
    if (FStatements.Count > 0) then begin
      if FCurrentStatementIdx = -1 then
        FCurrentStatementIdx := 0;
      if FCurrentStatementIdx <= FStatements.Count - 1 then begin
        try
          CurrentStatement := FStatements[FCurrentStatementIdx];
          Omit := CurrentStatement.Omit;
          ExecuteStatement(CurrentStatement.SQL, CurrentStatement.FStatementType, Omit, BreakExecution, CurrentStatement.FParams);
          Result := not BreakExecution;
        finally
          Inc(FCurrentStatementIdx);
        end;
      end
      else
        FCurrentStatementIdx := -1;
    end;
  end
  else begin
    if FParser = nil then begin
      if FStream <> nil then
        FParser := CreateParser(FStream)
      else
        FParser := CreateParser(TrimRight(FSQL.Text));

      FParser.OmitBlank := False;
      FParser.Uppered := False;
      FParser.QuotedString := True;
      FParser.AdvancedStringParsing := True;
    end;
    
    SQL := nil;
    StatementType := ST_UNKNOWN;
    Omit := False;
    FDelimiterState := dsNone;
    NewDelimiter := '';
    PrevSt := '';
    FErrorOffset := 0;
    Code := 0;
    FStartPos := FParser.CurrPos;
    FStartLine := FParser.CurrLine;
    FStartOffset := FParser.CurrCol;
    OldDebug := False;
    if Assigned(DataSet) then begin
      OldDebug := DataSet.Debug;
      DataSet.Debug := Debug;
    end;
    try
      SQL := StringBuilder.Create;
      repeat
        if (Code <> lcBlank) and (Code <> lcComment) then
          PrevSt := FSt;
        Code := FParser.GetNext(FSt);
        if (FDelimiterState = dsBlank) and (Code <> lcBlank) then
          FDelimiterState := dsValue;
        if FDelimiterState = dsValue then begin
          if (FSt <> FCurrDelimiter) then begin
            if (Code <> lcBlank) and (Code <> lcEnd) then
              NewDelimiter := NewDelimiter + FSt
            else
              if IsBlankEndsDelimeter then
                FDelimiterState := dsSet;
          end
          else
            FDelimiterState := dsSet;
        end;
        if (FDelimiterState = dsDelimiter) and (Code = lcBlank) then
          FDelimiterState := dsBlank;
        Ready := (FDelimiterState = dsSet) or (Code = lcEnd) or GetReady(Code);
        if not Ready and (Code <> lcString) then
          if FCurrDelimiter = FDelimiter{';'} {old mode} then
            Ready := ((FSt = FDelimiter) and not IsSpecificSQL(StatementType)) or
              ((FSt = '/') and (FParser.PrevCol = 0))
          else begin
            Ready := (FSt = FCurrDelimiter) or ((FCurrDelimiter = '//') and (FSt = '/') and (PrevSt = '/'));
            if not Ready and (Length(FCurrDelimiter) = 2) then
              Ready := ((PrevSt = FCurrDelimiter[1]) and (FSt = FCurrDelimiter[2]));
          end;
        if Ready then begin
          s := SQL.ToString;
          if (Code <> lcEnd) and (Length(FCurrDelimiter) > 1) then
            s := Copy(s, 1, Length(s) - Length(FCurrDelimiter) + 1);

          Ready := (Trim(s) <> '') or GetReady(Code);
        end;
        if Ready then begin
          // Execution
          Omit := (FDelimiterState = dsSet) or Omit;
          if FDelimiterState = dsSet then begin
            // DelimiterState := dsNone;
            FCurrDelimiter := NewDelimiter;
          end;
          ExecuteStatement(s, StatementType, Omit, BreakExecution);
          if not Omit and BreakExecution then
            break;
          FStmtOffset := FParser.CurrPos;
          FStartPos := FParser.CurrPos;
          FStartLine := FParser.CurrLine;
          FStartOffset := FParser.CurrCol;
          Result := True;
          break;
        end
        else begin
          CheckLexem(Code, StatementType, Omit);
          if not ((FSt = '/') and (FParser.PrevCol = 0)) or (FCurrDelimiter <> FDelimiter{';'}) then
            if (Code = lcString) or (Code <> lcBlank) or (SQL.Length <> 0) then begin
              SQL.Append(FSt);

              FEndPos := FParser.CurrPos - 1;
              FEndLine := FParser.CurrLine;
              FEndOffset := FParser.CurrCol - 1;
            end
            else begin
              Inc(FStmtOffset, Length(FSt));
              //to correct start position
              FStartLine := FParser.CurrLine;
              FStartPos := FParser.CurrPos;
              FStartOffset := FParser.CurrCol;
            end;
        end;
      until Code = lcEnd;
      if not Result then begin
        FParser.Free;
        FParser := nil;
      end;
    finally
      SQL.Free;
      if Assigned(DataSet) then begin
        DataSet.Debug := OldDebug;
      end;
    end;
  end;
end;

procedure TDAScript.SetDelimiter(const Value: string);
begin
  FDelimiter := Value;
  FCurrDelimiter := FDelimiter;
  FDelimiterState := dsNone;
end;

procedure TDAScript.CheckLexem(Code: integer; var StatementType: integer; var Omit: boolean);
begin
  if (Code = lcComment) and (StatementType = ST_UNKNOWN) then
    StatementType := ST_COMMENT
  else
    if (StatementType = ST_COMMENT) and (Code <> lcComment) and
      (Code <> lcBlank) then
      StatementType := ST_UNKNOWN;
end;

function TDAScript.GetParams: TDAParams;
begin
  if Assigned(DataSet) then
    Result := DataSet.Params
  else
    Result := FCommand.Params;
end;

function TDAScript.IsDelimiterStored: boolean;
begin
  Result := FDelimiter <> ';';
end;

function TDAScript.IsBlankEndsDelimeter: boolean;
begin
  //This function determine if lxBlank ends delimeter settings  
  Result := False;
end;

function TDAScript.GetParserClass: TParserClass;
begin
  Result := nil;
  Assert(False, 'Should be overriden');
end;

{ TDAScriptUtils }

class procedure TDAScriptUtils.SetDesignCreate(Obj: TDAScript; Value: boolean);
begin
  Obj.FDesignCreate := Value;
end;

class function TDAScriptUtils.GetDesignCreate(Obj: TDAScript): boolean;
begin
  Result := Obj.FDesignCreate;
end;

class procedure TDAScriptUtils.SetCommand(Obj: TDAScript; Command: TCustomDASQL);
begin
  Obj.FCommand := Command;
end;

class function TDAScriptUtils.GetCommand(Obj: TDAScript): TCustomDASQL;
begin
  Result := Obj.FCommand;
end;

class procedure TDAScriptUtils.Open(Obj: TDAScript; Stream: TStream);
begin
  Obj.Open(Stream);
end;

class procedure TDAScriptUtils.Close(Obj: TDAScript);
begin
  Obj.Close;
end;

class function TDAScriptUtils.UsedConnection(Obj: TDAScript): TCustomDAConnection;
begin
  Result := Obj.UsedConnection;
end;

end.

