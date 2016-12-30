
//////////////////////////////////////////////////
//  DB Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Dac.inc}

unit DADump;
{$ENDIF}

interface

uses
  SysUtils, Classes, DB, CRAccess, DBAccess, DAScript;
  
type
  TDADump = class;

  TDABackupProgressEvent = procedure (Sender: TObject; ObjectName: string; ObjectNum, ObjectCount, Percent: integer) of object;
  TDARestoreProgressEvent = procedure (Sender: TObject; Percent: integer) of object;
  
  TDADumpOptions = class(TPersistent)
  protected
    FOwner: TDADump;
    FGenerateHeader: boolean;
    FAddDrop: boolean;
    FQuoteNames: boolean;
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create(Owner: TDADump);
  published
    property GenerateHeader: boolean read FGenerateHeader write FGenerateHeader default True;
    property AddDrop: boolean read FAddDrop write FAddDrop default True;
    property QuoteNames: boolean read FQuoteNames write FQuoteNames default False;
  end;

  TDADump = class(TComponent)
  protected
    FConnection: TCustomDAConnection;
    FSQL: TStrings;
    FStream: TStream;
    FOptions: TDADumpOptions;
    FDebug: boolean;
    FDesignCreate: boolean;
    FTables: TStringList;

    FLeftQuote: char;
    FRightQuote: char;
    
    FOnBackupProgress: TDABackupProgressEvent;
    FOnRestoreProgress: TDARestoreProgressEvent;

    procedure AssignTo(Dest: TPersistent); override;
    function GetTableNames: string; virtual;
    procedure SetTableNames(Value: string); virtual;

    function CreateOptions: TDADumpOptions; virtual;
    function CreateScript: TDAScript; virtual;

    procedure Notification(Component: TComponent; Operation: TOperation); override;
    procedure SetConnection(Value: TCustomDAConnection);
    procedure BeginConnection;
    procedure EndConnection;

    procedure SetSQL(Value: TStrings);

    procedure SetOptions(Value: TDADumpOptions);

    procedure Loaded; override;

    procedure InternalBackup(Query: string); virtual; abstract;
    procedure Add(const Line: string); overload; // Line must be w/o #$D#$A
    procedure Add(const sl: TStringList); overload;
    procedure AddLineToSQL(const Line: string); overload; // Line may contains #$D#$A
    procedure AddLineToSQL(const Line: string; const Args: array of const); overload;
    function GetTableInfoClass: TTableInfoClass; virtual;
    function QuoteName(const AName: string): string; virtual;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;

    procedure Backup;
    procedure BackupToStream(Stream: TStream);
    procedure BackupToFile(const FileName: string);
    procedure BackupQuery(Query: string);
    procedure Restore;
    procedure RestoreFromStream(Stream: TStream);
    procedure RestoreFromFile(const FileName: string);

    property Connection: TCustomDAConnection read FConnection write SetConnection;
    property Options: TDADumpOptions read FOptions write SetOptions;
  published
    property TableNames: string read GetTableNames write SetTableNames;
    property SQL: TStrings read FSQL write SetSQL;
    property Debug: boolean read FDebug write FDebug default False;

    property OnBackupProgress: TDABackupProgressEvent read FOnBackupProgress write FOnBackupProgress;
    property OnRestoreProgress: TDARestoreProgressEvent read FOnRestoreProgress write FOnRestoreProgress;
  end;

  TDADumpUtils = class
  public
    class procedure SetDesignCreate(Obj: TDADump; Value: boolean);
    class function GetDesignCreate(Obj: TDADump): boolean;
  end;

implementation

uses
  DAConsts;

{ TDADumpOptions }

constructor TDADumpOptions.Create(Owner: TDADump);
begin
  inherited Create;
  
  FOwner := Owner;
  FGenerateHeader := True;
  FAddDrop := True;
  FQuoteNames := False;
end;

procedure TDADumpOptions.AssignTo(Dest: TPersistent);
begin
  if Dest is TDADumpOptions then begin
    TDADumpOptions(Dest).GenerateHeader := GenerateHeader;
    TDADumpOptions(Dest).AddDrop := AddDrop;
    TDADumpOptions(Dest).QuoteNames := QuoteNames;
  end
  else
    inherited;
end;

{ TDADump }

constructor TDADump.Create(Owner: TComponent);
begin
  inherited Create(Owner);

  FDesignCreate := csDesigning in ComponentState;
  FOptions := CreateOptions;
  FSQL := TStringList.Create;
  FTables := TStringList.Create;

  FLeftQuote := '"';
  FRightQuote := '"';
end;

destructor TDADump.Destroy;
begin
  FTables.Free;
  FSQL.Free;
  FOptions.Free;

  inherited;
end;

procedure TDADump.AssignTo(Dest: TPersistent);
begin
  if Dest is TDADump then begin
    TDADump(Dest).TableNames := TableNames;
    TDADump(Dest).Connection := Connection;
    TDADump(Dest).SQL.Text := SQL.Text;
    TDADump(Dest).Debug := Debug;
    TDADump(Dest).Options := Options;
  end
  else
    inherited;
end;

function TDADump.GetTableNames: string;
begin
  Result := '';
  Assert(False);
end;

procedure TDADump.SetTableNames(Value: string);
begin
  Assert(False);
end;

function TDADump.CreateOptions: TDADumpOptions;
begin
  Result := TDADumpOptions.Create(Self);
end;

function TDADump.CreateScript: TDAScript;
begin
  Result := TDAScript.Create(nil);
end;

procedure TDADump.Notification(Component: TComponent; Operation: TOperation);
begin
  if (Component = FConnection) and (Operation = opRemove) then
    Connection := nil;

  inherited;
end;

procedure TDADump.SetConnection(Value: TCustomDAConnection);
begin
  if Value <> FConnection then begin
    if FConnection <> nil then
      RemoveFreeNotification(FConnection);

    FConnection := Value;

    if FConnection <> nil then
      FreeNotification(FConnection);
  end;
end;

procedure TDADump.BeginConnection;
begin
  if FConnection = nil then
    raise Exception.Create(SConnectionNotDefined);
  TDBAccessUtils.InternalConnect(FConnection);
end;

procedure TDADump.EndConnection;
begin
  TDBAccessUtils.InternalDisconnect(FConnection);
end;

procedure TDADump.SetSQL(Value: TStrings);
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

procedure TDADump.SetOptions(Value: TDADumpOptions);
begin
  FOptions.Assign(Value);
end;

procedure TDADump.Loaded;
begin
  inherited;

  FDesignCreate := False;
end;

procedure TDADump.Backup;
begin
  InternalBackup('');
end;

procedure TDADump.BackupToStream(Stream: TStream);
begin
  FStream := Stream;
  try
    InternalBackup('');
  finally
    FStream := nil;
  end;
end;

procedure TDADump.BackupToFile(const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    BackupToStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TDADump.BackupQuery(Query: string);
var
  OldTables: TStringList;
begin
  if Trim(Query) = '' then
    raise EDatabaseError.Create(SEmptySQLStatement);

  OldTables := TStringList.Create;
  OldTables.Assign(FTables);
  FTables.Clear;
  try
    InternalBackup(Query);
  finally
    FTables.Assign(OldTables);
    OldTables.Free;
  end;
end;

procedure TDADump.Restore;
var
  Script: TDAScript;
  Len: integer;
begin
  Script := CreateScript;
  try
    Script.Connection := Connection;
    Script.Debug := Debug;
    Script.SQL := SQL;
    Len := Length(SQL.Text);

    while Script.ExecuteNext do
      if Assigned(FOnRestoreProgress) and (Len > 0) then
        FOnRestoreProgress(Self, Trunc((Script.StartPos / Len) * 100{"*" after "/" to prevent IntOverflow}));
  finally
    Script.Free;
  end;
end;

procedure TDADump.RestoreFromStream(Stream: TStream);
const
  BlockSize = 64 * 1024;
var
  Script: TDAScript;
  TotalCount: Int64;
begin
  Script := CreateScript;
  try
    TotalCount := Stream.Size;
    Script.Connection := Connection;
    Script.Debug := Debug;
    TDAScriptUtils.Open(Script, Stream);
    try
      while Script.ExecuteNext do
        if Assigned(FOnRestoreProgress) and (TotalCount > 0) then
           FOnRestoreProgress(Self, Trunc((Script.StartPos / TotalCount) * 100{"*" after "/" to prevent IntOverflow}));
    finally
      TDAScriptUtils.Close(Script);
    end;
  finally
    Script.Free;
  end;
end;

procedure TDADump.RestoreFromFile(const FileName: string);
var
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    RestoreFromStream(FileStream);
  finally
    FileStream.Free;
  end;
end;

procedure TDADump.Add(const Line: string);  // Line must be w/o #$D#$A
var
  s: string;
begin
  if FStream = nil then
    FSQL.Add(Line)
  else
  begin
    s := Line + #$D#$A;
    FStream.WriteBuffer(s[1], Length(s));
  end;
end;

procedure TDADump.Add(const sl: TStringList);
var
  i: integer;
begin
  for i := 0 to sl.Count - 1 do
    Add(sl[i]);
end;

procedure TDADump.AddLineToSQL(const Line: string); // Line may contains #$D#$A
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    sl.Text := Line;
    Add(sl);
  finally
    sl.Free;
  end;
end;

procedure TDADump.AddLineToSQL(const Line: string; const Args: array of const);
begin
  AddLineToSQL(Format(Line, Args));
end;

function TDADump.GetTableInfoClass: TTableInfoClass;
begin
  Result := TCRTableInfo;
end;

function TDADump.QuoteName(const AName: string): string;
begin
  Result := GetTableInfoClass.NormalizeName(AName, FLeftQuote, FRightQuote, FOptions.QuoteNames);
end;

{ TDADumpUtils }

class procedure TDADumpUtils.SetDesignCreate(Obj: TDADump; Value: boolean);
begin
  Obj.FDesignCreate := Value;
end;

class function TDADumpUtils.GetDesignCreate(Obj: TDADump): boolean;
begin
  Result := Obj.FDesignCreate;
end;

end.
