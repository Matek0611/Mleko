
//////////////////////////////////////////////////
//  DB Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  TDALoader
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Dac.inc}

unit DALoader;
{$ENDIF}

interface

uses
{$IFDEF CLR}
  Variants,
{$ENDIF}
  Classes, SysUtils, DBAccess, DB, MemData;

type
  TDAColumnDataType = (ctString, ctDate, ctInteger, ctUInteger, ctFloat);

  TDAColumnClass = class of TDAColumn;

  TDAColumn = class (TCollectionItem)
  private
    FName: string;
    FFieldType: TFieldType;

  protected
    function GetDataType: TDAColumnDataType; virtual;
    procedure SetDataType(Value: TDAColumnDataType); virtual;
    procedure SetFieldType(Value: TFieldType); virtual;
    function GetDisplayName: string; override;
    property DataType: TDAColumnDataType read GetDataType write SetDataType;

  public
    constructor Create(Collection: TCollection); override;

  published
    property Name: string read FName write FName;
    property FieldType: TFieldType read FFieldType write SetFieldType default ftString;
  end;

  TDAColumns = class (TOwnedCollection)
  private
    function GetColumn(Index: integer): TDAColumn;
    procedure SetColumn(Index: integer; Value: TDAColumn);

  public
    property Items[Index: integer]: TDAColumn read GetColumn write SetColumn; default;
  end;

  TDALoader = class;

  TDAPutDataEvent = procedure (Sender: TDALoader) of object;
  TGetColumnDataEvent = procedure (Sender: TObject; Column: TDAColumn; Row: integer;
    var Value: variant; var IsEOF: boolean) of object;
  TLoaderProgressEvent = procedure (Sender: TObject; Percent: integer) of object;

  TDALoader = class (TComponent)
  private
    FTableName: string;

    FOnPutData: TDAPutDataEvent;
    FOnGetColumnData: TGetColumnDataEvent;

    procedure SetConnection(Value: TCustomDAConnection);
    procedure SetColumns(Value: TDAColumns);

    function IsColumnsStored: boolean;
    procedure CreateColumnsByFields(Fields: TFields);
  protected
    FColumns: TDAColumns;
    FConnection: TCustomDAConnection;

    FLastRow: integer;
    FDesignCreate: boolean;

    FSkipReadOnlyFieldDescs: boolean;
    FOnLoaderProgress: TLoaderProgressEvent;

    procedure DoLoaderProgress(Percent: integer);
    procedure Loaded; override;

    procedure Notification(Component: TComponent; Operation: TOperation); override;
    procedure BeginConnection; virtual;
    procedure EndConnection; virtual;

    procedure CheckTableName;

    procedure Prepare; virtual;
    procedure Reset; virtual;
    procedure InternalPutData; virtual;
    procedure PutData; virtual;
    procedure DoLoad; virtual;
    procedure Finish; virtual;
    procedure SetTableName(Value: string); virtual;

    class function DAColumnClass: TDAColumnClass; virtual;

    function UsedConnection: TCustomDAConnection; virtual;

    function ConvertDataTypeToColumnType( const DataType: word): TDAColumnDataType; virtual;
    procedure FillColumn(Column: TDAColumn; FieldDesc: TFieldDesc); virtual;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;

    procedure PutColumnData(Col: integer; Row: integer; const Value: variant); overload; virtual;
    procedure PutColumnData(const ColName: string; Row: integer; const Value: variant); overload;

    procedure Load; virtual;

    procedure CreateColumns;
    procedure LoadFromDataSet(DataSet: TDataSet);

    property Connection: TCustomDAConnection read FConnection write SetConnection;
    property TableName: string read FTableName write SetTableName;
    property Columns: TDAColumns read FColumns write SetColumns stored IsColumnsStored;

    property OnPutData: TDAPutDataEvent read FOnPutData write FOnPutData;
    property OnGetColumnData: TGetColumnDataEvent read FOnGetColumnData write FOnGetColumnData;
    property OnProgress: TLoaderProgressEvent read FOnLoaderProgress write FOnLoaderProgress;

  end;

  TDALoaderUtils = class
  public
    class procedure SetDesignCreate(Obj: TDALoader; Value: boolean);
    class function GetDesignCreate(Obj: TDALoader): boolean;
    class function UsedConnection(Obj: TDALoader): TCustomDAConnection;
  end;

implementation

uses
{$IFDEF LINUX}
{$ELSE}
  Windows,
{$ENDIF}
  CRAccess, DAConsts {$IFNDEF CLR}{$IFDEF VER6P}, Variants{$ENDIF}{$ENDIF}, MemUtils;

{ TDAColumn }

constructor TDAColumn.Create(Collection: TCollection);
begin
  inherited;

  FFieldType := ftString;
end;

function TDAColumn.GetDataType: TDAColumnDataType;
begin
  case FieldType of
    ftString, ftMemo, ftFmtMemo, ftFixedChar, ftWideString, ftGuid {$IFDEF VER6P}, ftTimeStamp{$ENDIF}{$IFDEF VER10P}, ftWideMemo{$ENDIF}:
      Result := ctString;
    ftSmallint, ftInteger, ftWord, ftAutoInc:
      Result := ctInteger;
    ftLargeint:
      Result := ctUInteger;
    ftFloat, ftCurrency, ftBCD{$IFDEF VER6P}, ftFMTBcd{$ENDIF}:
      Result := ctFloat;
    ftDate, ftTime, ftDateTime:
      Result := ctDate;
    else
      Result := ctString;
  end;
end;

procedure TDAColumn.SetDataType(Value: TDAColumnDataType);
begin
  case Value of
    ctString:
      FieldType := ftString;
    ctDate:
      FieldType := ftDateTime;
    ctInteger:
      FieldType := ftInteger;
    ctUInteger:
      FieldType := ftLargeint;
    ctFloat:
      FieldType := ftFloat;
  end;
end;

procedure TDAColumn.SetFieldType(Value: TFieldType);
begin
  FFieldType := Value;
end;

function TDAColumn.GetDisplayName: string;
begin
  Result := FName;
end;

{ TDAColumns }

function TDAColumns.GetColumn(Index: integer): TDAColumn;
begin
  Result := TDAColumn(inherited Items[Index]);
end;

procedure TDAColumns.SetColumn(Index: integer; Value: TDAColumn);
begin
  Items[Index].Assign(Value);
end;

{ TDALoader }

constructor TDALoader.Create(Owner: TComponent);
begin
  inherited Create(Owner);

  FColumns := TDAColumns.Create(Self, DAColumnClass);

  FDesignCreate := csDesigning in ComponentState;
  FSkipReadOnlyFieldDescs := True;
end;

destructor TDALoader.Destroy;
begin
  FColumns.Free;

  inherited;
end;

procedure TDALoader.DoLoaderProgress(Percent: integer);
begin
  if Assigned(FOnLoaderProgress) then
    FOnLoaderProgress(Self, Percent);
end;

procedure TDALoader.Loaded;
begin
  inherited;

  FDesignCreate := False;
end;

procedure TDALoader.BeginConnection;
begin
  if UsedConnection = nil then
    raise Exception.Create(SConnectionNotDefined);
  TDBAccessUtils.InternalConnect(UsedConnection);
end;

procedure TDALoader.EndConnection;
begin
  TDBAccessUtils.InternalDisconnect(UsedConnection);
end;

procedure TDALoader.CheckTableName;
begin
  if Trim(FTableName) = '' then
    raise Exception.Create(STableNameNotDefined);
end;

procedure TDALoader.Prepare;
begin
  BeginConnection;
  CheckTableName;
  Reset;
end;

procedure TDALoader.Finish;
begin
  EndConnection;
end;

procedure TDALoader.Reset;
begin
  FLastRow := -1;
end;

procedure TDALoader.PutColumnData(Col: integer; Row: integer; const Value: variant);
begin
  if Col >= FColumns.Count then
    DatabaseError('Invalid column number');

  if (Row < FLastRow) or (Row < 1) then
    DatabaseError('Invalid row number');

  FLastRow := Row - 1;
end;

procedure TDALoader.PutColumnData(const ColName: string; Row: integer; const Value: variant);
var
  i: integer;
begin
  for i := 0 to FColumns.Count - 1 do
    if AnsiSameText(ColName, FColumns[i].Name) then begin
      PutColumnData(i, Row, Value);
      Exit;
    end;
  raise Exception.Create(Format(SColumnNotFound, [ColName]));
end;

procedure TDALoader.InternalPutData;
var
  Value: variant;
  EOF: boolean;
  i,Row: integer;
begin
  if Assigned(FOnGetColumnData) then begin
    Row := 1;
    EOF := False;
    while not EOF do begin
      for i := 0 to FColumns.Count - 1 do begin
        FOnGetColumnData(Self, FColumns[i], Row, Value, EOF);
        if not EOF then
          PutColumnData(i, Row, Value)
        else begin
          if i <> 0 then
            FLastRow := -1; // to prevent insertion of incomplete row. If EOF is set to True on getting value 1..last field, all values of this record is ignored.
          break;            // stop loading immediately after getting EOF
        end;
      end;
      if not EOF then
        Inc(Row);
    end;
  end;
end;

procedure TDALoader.PutData;
begin
  if Assigned(FOnPutData) then
    FOnPutData(Self)
  else
    InternalPutData;
end;

procedure TDALoader.DoLoad;
begin
end;

procedure TDALoader.Load;
begin
  BeginConnection;
  try
    if Columns.Count = 0 then
      CreateColumns;
    try
      Prepare;
      StartWait;
      PutData;
    finally
      Finish;
      StopWait;
    end;
  finally
    EndConnection;
  end;
end;

function TDALoader.ConvertDataTypeToColumnType(const DataType: word): TDAColumnDataType;
begin
  Result := ctString; // To disable warning

  case DataType of
    dtUnknown, dtString, dtBoolean, dtBlob, dtMemo, dtWideMemo, dtExtString, dtWideString, dtExtWideString:
      Result := ctString;
    dtInt8, dtInt16, dtInt32, dtInt64:
      Result := ctInteger;
    dtUInt16, dtUInt32:
      Result := ctUInteger;
    dtFloat, dtCurrency:
      Result := ctFloat;
    dtDate, dtTime, dtDateTime:
      Result := ctDate;
  else
    //Assert(False, 'Unknown datatype (' + IntToStr(DataType) + ')');
  end;
end;

procedure TDALoader.FillColumn(Column: TDAColumn; FieldDesc: TFieldDesc);
begin
  Column.Name := FieldDesc.Name;
  Column.DataType := ConvertDataTypeToColumnType(FieldDesc.DataType);
  // Needs to override to fill ColumnType
end;

procedure TDALoader.CreateColumns;
var
  RecordSet: TCustomDADataSet;
  FieldDesc: TFieldDesc;
  i: integer;
begin
  BeginConnection;
  try
    CheckTableName;
    FColumns.Clear;
    RecordSet := UsedConnection.CreateDataSet;
    RecordSet.SQL.Text := 'SELECT * FROM ' + FTableName + ' WHERE 1=0'; // CR-M15322
    FColumns.BeginUpdate;
    try
      RecordSet.Execute;
      for i := 0 to RecordSet.FieldCount - 1 do begin
        FieldDesc := RecordSet.GetFieldDesc(RecordSet.Fields[i]);
        if not (FieldDesc.ReadOnly and FSkipReadOnlyFieldDescs) then
          FillColumn(TDAColumn(FColumns.Add), FieldDesc);
      end;
    finally
      FColumns.EndUpdate;
      RecordSet.Free;
    end;

  finally
    EndConnection;
  end;
end;

procedure TDALoader.CreateColumnsByFields(Fields: TFields);
var
  i: word;
  Field: TField;
begin
  FColumns.Clear;
  try
    FColumns.BeginUpdate;

    for i := 0 to Fields.Count - 1 do begin
      Field := Fields[i];
      if not Field.ReadOnly then
        with TDAColumn(FColumns.Add) do begin
          Name := Field.FieldName;
          FieldType := Field.DataType;
        end;
    end;

  finally
    FColumns.EndUpdate;
  end;
end;

procedure TDALoader.Notification(Component: TComponent; Operation: TOperation);
begin
  if (Component = FConnection) and (Operation = opRemove) then
    Connection := nil;

  inherited;
end;

procedure TDALoader.SetConnection(Value: TCustomDAConnection);
begin
  if Value <> FConnection then begin
    if FConnection <> nil then
      RemoveFreeNotification(FConnection);

    FConnection := Value;

    if FConnection <> nil then
      FreeNotification(FConnection);
  end;
end;

procedure TDALoader.SetColumns(Value: TDAColumns);
begin
  FColumns.Assign(Value);
end;

function TDALoader.IsColumnsStored: boolean;
begin
  Result := FColumns.Count > 0;
end;

procedure TDALoader.SetTableName(Value: string);
begin
  if Value <> FTableName then begin
    FTableName := Value;
    if not (csLoading in ComponentState) and (UsedConnection <> nil) and UsedConnection.Connected and (FColumns.Count = 0) then
      CreateColumns;
  end;
end;

class function TDALoader.DAColumnClass: TDAColumnClass;
begin
  Result := TDAColumn;
end;

function TDALoader.UsedConnection: TCustomDAConnection;
begin
  Result := FConnection;
end;

procedure TDALoader.LoadFromDataSet(DataSet: TDataSet);
var
  row, col: integer;
  ColNo: array of integer;
  OldActive: boolean;

  Field: TField;
  FieldDesc: TFieldDesc;
  RecordSet: TCRRecordSet;
  ObjRef: TSharedObject;
  IsBlank: boolean;
  AValue: variant;
  Bookmark: TBookmark;
  RecCount: integer;

  procedure FillColumsNumber;
  var
    i, j: integer;
    fname: string;
  begin
    for i := 0 to DataSet.FieldCount - 1 do begin
      ColNo[i] := -1;
      fname := DataSet.Fields[i].FieldName;

      for j := 0 to FColumns.Count - 1 do
        if AnsiSameText(fname, FColumns[j].Name) then begin
          ColNo[i] := j;
          break;
        end;
    end;
  end;

begin
  if DataSet = nil then
    raise Exception.Create(SDataSetNotDefined);

  OldActive := DataSet.Active;
  Bookmark := nil;
  try
    DataSet.DisableControls;
    Bookmark := DataSet.GetBookmark;

    DataSet.Open;
    DataSet.First;

    SetLength(ColNo, DataSet.FieldCount);

    if Columns.Count = 0 then begin
      CreateColumnsByFields(DataSet.Fields);

      for col := 0 to DataSet.FieldCount - 1 do
        ColNo[col] := col;
    end
    else
      FillColumsNumber;

    Prepare;
    StartWait;
    try
      DataSet.First;
      RecCount := DataSet.RecordCount;
      for row := 1 to RecCount do begin
        for col := 0 to DataSet.FieldCount - 1 do
          if ColNo[col] >= 0 then begin
            Field := DataSet.Fields[col];
            if DataSet is TCustomDADataSet then
              with TCustomDADataSet(DataSet) do begin
                FieldDesc := GetFieldDesc(Field);
                if FieldDesc <> nil then begin
                  RecordSet := TDBAccessUtils.GetIRecordSet(TCustomDADataSet(DataSet));
                  if RecordSet.IsComplexFieldType(FieldDesc.DataType)
                    and not((FieldDesc.DataType = dtExtString)
                    or (FieldDesc.DataType = dtExtWideString)
                    or (FieldDesc.DataType = dtExtVarBytes)
                    {$IFDEF VER5P}or (FieldDesc.DataType = dtVariant){$ENDIF}) then begin
                    IsBlank := RecordSet.GetNull(FieldDesc.FieldNo, ActiveBuffer);
                    ObjRef := RecordSet.GetObject(FieldDesc.FieldNo, ActiveBuffer);
                    if IsBlank then
                      AValue := Null
                    else begin
                    {$IFDEF CLR}
                      AValue := Variant(ObjRef);
                    {$ELSE}
                      AValue := Unassigned;
                      TVarData(AValue).VType := varByRef;
                      TVarData(AValue).VPointer := ObjRef;
                    {$ENDIF}
                    end;
                    PutColumnData(ColNo[col], row, AValue);
                    Continue;
                  end;
                end;
              end;
            // To avoid memory leak
            AValue := Unassigned;
            AValue := Field.Value;
            PutColumnData(ColNo[col], row, AValue);
          end;

        DoLoaderProgress(Round((row * 100) / RecCount));
        DataSet.Next;
      end;
      DoLoad;
    finally
      Finish;
      StopWait;
    end;
  finally
    DataSet.Active := OldActive;
    DataSet.GotoBookmark(Bookmark);
    DataSet.EnableControls;
  end;
end;

{ TDALoaderUtils }

class procedure TDALoaderUtils.SetDesignCreate(Obj: TDALoader; Value: boolean);
begin
  Obj.FDesignCreate := Value;
end;

class function TDALoaderUtils.GetDesignCreate(Obj: TDALoader): boolean;
begin
  Result := Obj.FDesignCreate;
end;

class function TDALoaderUtils.UsedConnection(Obj: TDALoader): TCustomDAConnection;
begin
  Result := Obj.UsedConnection;
end;

end.
