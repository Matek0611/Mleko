//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  MSAccess
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Sdac.inc}

unit MSLoader;
{$ENDIF}
interface

uses
{$IFDEF CLR}
  System.Runtime.InteropServices, Variants,
{$ELSE}
  CLRClasses,
{$ENDIF}
  Windows, Classes, DB, MemDS, CRAccess, MemData,
  DALoader, OLEDBAccess, MSAccess, OLEDBC, OLEDBIntf;

type
  TMSColumn = class(TDAColumn)
  private
    FSize: integer;
    FPrecision: integer;
    FScale: integer;
    FIsWide: boolean;

    function GetSize: integer;
    procedure SetSize(Value: integer);

  protected
    procedure SetFieldType(Value: TFieldType); override;

  published
    property Size: integer read GetSize write SetSize;
    property Precision: integer read FPrecision write FPrecision default 0;
    property Scale: integer read FScale write FScale default 0;
  end;

  TMSLoader = class;

  TMSPutDataEvent = procedure (Sender: TMSLoader) of object;
  TMSGetColumnDataEvent = procedure (Sender: TObject; Column: TMSColumn;
    Row: integer; var Value: variant; var IsEOF: boolean) of object;

  TMSLoaderOptions = class(TPersistent)
  private
    FRowsPerBatch: integer;
    FKilobytesPerBatch: integer;
    FLockTable: boolean;
    FCheckConstraints: boolean;
    FOwner: TMSLoader;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create(Owner: TMSLoader);
  published
    property RowsPerBatch: integer read FRowsPerBatch write FRowsPerBatch default 0;
    property KilobytesPerBatch: integer read FKilobytesPerBatch write FKilobytesPerBatch default 0;
    property LockTable: boolean read FLockTable write FLockTable default False;
    property CheckConstraints: boolean read FCheckConstraints write FCheckConstraints default False;
  end;

  TDBIDAccessor = class
  protected
    FPDBID: PDBID;
    function GeteKind: DBKIND;
    procedure SeteKind(Value: DBKIND);
    function GetpwszName: IntPtr;
    procedure SetpwszName(Value: IntPtr);
    procedure SetPDBID(Value: PDBID);
  public
    constructor Create(APDBID: PDBID);
    property eKind: DBKIND read GeteKind write SeteKind;
    property pwszName: IntPtr read GetpwszName write SetpwszName;
  end;

  TMSLoader = class(TDALoader)
  private
    FIOpenRowset: IOpenRowset;
    FIRowsetFastLoad: IRowsetFastLoad;
    FParamsAccessorData: TParamsAccessorData;
    FOnPutData: TMSPutDataEvent;
    FOnGetColumnData: TMSGetColumnDataEvent;
    FKeepIdentity: boolean;
    FKeepNulls: boolean;
    FOptions: TMSLoaderOptions;
    FParamDescs: TParamDescs;

    procedure DAPutDataEvent(Sender: TDALoader);
    procedure DAGetColumnDataEvent(Sender: TObject; Column: TDAColumn;
      Row: integer; var Value: variant; var IsEOF: boolean);
  protected
    class function DAColumnClass: TDAColumnClass; override;
    function GetConnection: TMSConnection;
    procedure SetConnection(Value: TMSConnection);
    procedure SetOnPutData(const Value: TMSPutDataEvent);
    procedure SetOnGetColumnData(const Value: TMSGetColumnDataEvent);
    procedure SetKeepIdentity(Value: boolean);
    procedure SetKeepNulls(Value: boolean);
    procedure SetOptions(Value: TMSLoaderOptions);

    procedure Prepare; override;
    procedure Commit(Done: boolean = True);
    procedure Finish; override;

    procedure FillColumn(Column: TDAColumn; FieldDesc: TFieldDesc); override;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    procedure PutColumnData(Col: integer; Row: integer; const Value: variant); override;
  published
    property Connection: TMSConnection read GetConnection write SetConnection;
    property TableName;
    property Columns;
    property KeepIdentity: boolean read FKeepIdentity write SetKeepIdentity default False;
    property KeepNulls: boolean read FKeepNulls write SetKeepNulls default False;
    property Options: TMSLoaderOptions read FOptions write SetOptions;
    property OnPutData: TMSPutDataEvent read FOnPutData write SetOnPutData;
    property OnGetColumnData: TMSGetColumnDataEvent read FOnGetColumnData write SetOnGetColumnData;
    property OnProgress;
  end;

implementation

uses
  SysUtils,
{$IFDEF CLR}
  System.Text,
{$ENDIF}
{$IFDEF VER6P}
{$IFNDEF CLR}
  Variants,
{$ENDIF}
  FmtBcd,
{$ENDIF}
  ActiveX, MemUtils, DBAccess;

{ TMSColumn }

function TMSColumn.GetSize: integer;
begin
  if (FieldType in [ftString, ftFixedChar, ftWideString, ftBytes, ftVarBytes,
    ftBlob, ftMemo{$IFDEF VER10P}, ftWideMemo{$ENDIF}, ftVariant, ftUnknown]) then
    Result := FSize
  else
    Result := 0;
end;

procedure TMSColumn.SetFieldType(Value: TFieldType);
var
  NewValue: boolean;
begin
  NewValue := Value <> FieldType;

  inherited;

  if NewValue then
    case FieldType of
      ftGuid:
        FSize := SizeOf(TGuid);
      ftSmallint:
        FSize := SizeOf(SmallInt);
      ftInteger:
        FSize := SizeOf(Integer);
      ftWord:
        FSize := SizeOf(Word);
      ftLargeint:
        FSize := SizeOf(LargeInt);
      ftBoolean:
        FSize := SizeOf(Boolean);
      ftFloat, ftCurrency:
        FSize := SizeOf(Double);
      ftBCD:
        FSize := SizeOf(Currency);
    {$IFDEF VER6P}
      ftFMTBcd:
        FSize := SizeOf(TBcd);
    {$ENDIF}
      ftDate, ftTime, ftDateTime{$IFDEF VER6P}, ftTimeStamp{$ENDIF}:
        FSize := SizeOf(Double);
      else
        FSize := 0;
    end;
end;

procedure TMSColumn.SetSize(Value: integer);
begin
  if (FieldType in [ftString, ftFixedChar, ftWideString, ftBytes, ftVarBytes,
    ftBlob, ftMemo{$IFDEF VER10P}, ftWideMemo{$ENDIF}, ftVariant, ftUnknown]) and (Value > 0) then
    FSize := Value;
end;

{ TDBIDAccessor }

constructor TDBIDAccessor.Create(APDBID: PDBID);
begin
  inherited Create;

  FPDBID := APDBID;
end;

procedure TDBIDAccessor.SetPDBID(Value: PDBID);
begin
  FPDBID := Value;
end;

function TDBIDAccessor.GeteKind: DBKIND;
var
  Offset: integer;
begin
  Offset := 16;
  Result := Marshal.ReadInt32(FPDBID, Offset);
end;

procedure TDBIDAccessor.SeteKind(Value: DBKIND);
var
  Offset: integer;
begin
  Offset := 16;
  Marshal.WriteInt32(FPDBID, Offset, Value);
end;

function TDBIDAccessor.GetpwszName: IntPtr;
var
  Offset: integer;
begin
  Offset := 20;
  Result := Marshal.ReadIntPtr(FPDBID, Offset);
end;

procedure TDBIDAccessor.SetpwszName(Value: IntPtr);
var
  Offset: integer;
begin
  Offset := 20;
  Marshal.WriteIntPtr(FPDBID, Offset, Value);
end;

{ TMSLoader }

class function TMSLoader.DAColumnClass: TDAColumnClass;
begin
  Result := TMSColumn;
end;

function TMSLoader.GetConnection: TMSConnection;
begin
  Result := TMSConnection(inherited Connection);
end;

procedure TMSLoader.SetConnection(Value: TMSConnection);
begin
  inherited Connection := Value;
end;

procedure TMSLoader.DAPutDataEvent(Sender: TDALoader);
begin
  if Assigned(FOnPutData) then
    FOnPutData(TMSLoader(Sender));
end;

procedure TMSLoader.DAGetColumnDataEvent(Sender: TObject; Column: TDAColumn;
  Row: integer; var Value: variant; var IsEOF: boolean);
begin
  if Assigned(FOnGetColumnData) then
    FOnGetColumnData(Sender, TMSColumn(Column), Row, Value, IsEOF);
end;

procedure TMSLoader.SetOnPutData(const Value: TMSPutDataEvent);
begin
  FOnPutData := Value;
  if Assigned(FOnPutData) then
    inherited OnPutData := DAPutDataEvent
  else
    inherited OnPutData := nil;
end;

procedure TMSLoader.SetOnGetColumnData(const Value: TMSGetColumnDataEvent);
begin
  FOnGetColumnData := Value;
  if Assigned(Value) then
    inherited OnGetColumnData := DAGetColumnDataEvent
  else
    inherited OnGetColumnData := nil;
end;

procedure TMSLoader.SetKeepIdentity(Value: boolean);
begin
  FKeepIdentity := Value;
end;

procedure TMSLoader.SetKeepNulls(Value: boolean);
begin
  FKeepNulls := Value;
end;

procedure TMSLoader.SetOptions(Value: TMSLoaderOptions);
begin
  FOptions.Assign(Value);
end;

constructor TMSLoader.Create(Owner: TComponent);
begin
  inherited Create(Owner);

  FOptions := TMSLoaderOptions.Create(Self);
  FKeepIdentity := False;
  FKeepNulls := False;
  FSkipReadOnlyFieldDescs := False;
end;

destructor TMSLoader.Destroy;
begin
  Assert(FIOpenRowset = nil);
  Assert(FIRowsetFastLoad = nil);
  FOptions.Free;
  
  inherited;
end;

procedure TMSLoader.FillColumn(Column: TDAColumn; FieldDesc: TFieldDesc);
begin
  with TMSColumn(Column) do begin
    Name := FieldDesc.Name;
    FIsWide := (FieldDesc.SubDataType and dtWide) <> 0;
    FieldType := GetFieldType(FieldDesc.DataType);
    case FieldType of
      ftString, ftFixedChar, ftWideString, ftBytes, ftVarBytes, ftBlob, ftMemo{$IFDEF VER10P}, ftWideMemo{$ENDIF}, ftVariant, ftUnknown:
        Size := FieldDesc.Length;
      ftFloat, ftCurrency, ftBCD{$IFDEF VER6P}, ftFMTBcd{$ENDIF}: begin
        Precision := FieldDesc.Length;
        Scale := FieldDesc.Scale;
      end;
    end;
  end;
end;

procedure TMSLoader.Prepare;
const
  MaxPropCount = 3;
var
  OLEDBConnection: TOLEDBConnection;
  TableID: PDBID;
  TableIDAccessor: TDBIDAccessor;
  BindMemorySize: UINT;
{$IFDEF CLR}
  rgBindingsGC: GCHandle;
{$ENDIF}
  rgBindings: PDBBinding;
  rgStatus: PUINT;
  i: integer;
  OLEDBPropertiesSet: TOLEDBPropertiesSet;
  OptionsStr: string;
  IUnk: IUnknown;
  ParamDesc: TOLEDBParamDesc;

  procedure AddOption(var OptionStr: string; const Value: string);
  begin
    if OptionStr <> '' then
      OptionStr := OptionStr + ', ';
    OptionStr := OptionStr + Value;
  end;

begin
  inherited;

  OLEDBConnection := TMSAccessUtils.FIConnection(Connection);
  OLEDBConnection.Check(TMSAccessUtils.FIDBCreateSession(OLEDBConnection).CreateSession(nil, IID_IOpenRowset, IUnk), Self);
  FIOpenRowset := IOpenRowset(IUnk);

  TableID := Marshal.AllocHGlobal(SizeOf(TDBID));
  TableIDAccessor := TDBIDAccessor.Create(TableID);
  OLEDBPropertiesSet := TOLEDBPropertiesSet.Create(OLEDBConnection, DBPROPSET_SQLSERVERROWSET);
  try
    TableIDAccessor.eKind := DBKIND_NAME;
    TableIDAccessor.pwszName := Marshal.AllocHGlobal(Length(TableName) * SizeOf(WideChar) + SizeOf(WideChar));
    CopyBuffer(Marshal.StringToHGlobalUni(Encoding.Default.GetString(Encoding.Default.GetBytes(TableName), 0, Length(TableName))),
      TableIDAccessor.pwszName, Length(TableName) * SizeOf(WideChar) + SizeOf(WideChar));

    OLEDBPropertiesSet.AddPropBool(SSPROP_FASTLOADKEEPIDENTITY, FKeepIdentity);
    OLEDBPropertiesSet.AddPropBool(SSPROP_FASTLOADKEEPNULLS, FKeepNulls);
    if (FOptions.FRowsPerBatch > 0) or (FOptions.FKilobytesPerBatch > 0) or FOptions.FLockTable or FOptions.FCheckConstraints then begin
       OptionsStr := '';
       if FOptions.FRowsPerBatch > 0 then
         AddOption(OptionsStr, 'ROWS_PER_BATCH = ' + IntToStr(FOptions.FRowsPerBatch));
       if FOptions.FKilobytesPerBatch > 0 then
         AddOption(OptionsStr, 'KILOBYTES_PER_BATCH = ' + IntToStr(FOptions.FKilobytesPerBatch));
       if FOptions.FLockTable then
         AddOption(OptionsStr, 'TABLOCK');
       if FOptions.FCheckConstraints then
         AddOption(OptionsStr, 'CHECK_CONSTRAINTS');
      OLEDBPropertiesSet.AddPropStr(SSPROP_FASTLOADOPTIONS, OptionsStr);
    end;

    OLEDBConnection.Check(FIOpenRowset.OpenRowset(nil, TableID, nil, IID_IRowsetFastLoad, 1,
      PDBPropIDSetArray(OLEDBPropertiesSet.InitPropSet), IUnk), Self);
    FIRowsetFastLoad := IRowsetFastLoad(IUnk);
  finally
    OLEDBPropertiesSet.Free;
    Marshal.FreeHGlobal(TableIDAccessor.pwszName);
    Marshal.FreeHGlobal(TableID);
    TableIDAccessor.Free;
  end;
  
  rgStatus := Marshal.AllocHGlobal(Columns.Count * SizeOf(UINT));
{$IFNDEF CLR}
  IntPtr(FParamsAccessorData.Accessor) := nil;
{$ENDIF}
  try
    try
      FParamsAccessorData.ExecuteParams.HACCESSOR := 0;
      FParamsAccessorData.ExecuteParams.pData := nil;
      FParamsAccessorData.ExecuteParams.cParamSets := 1;

      SetLength(FParamsAccessorData.rgBindings, Columns.Count);

      for i := 0 to Columns.Count - 1 do
        FParamsAccessorData.rgBindings[i].pObject := nil;

      BindMemorySize := 0;

      FParamDescs := TParamDescs.Create;
      for i := 0 to Columns.Count - 1 do begin
        ParamDesc := TOLEDBParamDesc.Create;
        try
          ParamDesc.SetName(Columns[i].Name); // +++
          ParamDesc.SetDataType(GetDataType(TMSColumn(Columns[i]).FieldType));
          ParamDesc.SetParamType(pdInput);
          FillBindingForParam(i + 1, ParamDesc, OLEDBConnection, FParamsAccessorData.rgBindings[i], BindMemorySize, False, TMSColumn(Columns[i]).FIsWide);
          FParamsAccessorData.rgBindings[i].eParamIO := DBPARAMIO_NOTPARAM;
          ParamDesc.SetSize(FParamsAccessorData.rgBindings[i].cbMaxLen);
        finally
          FParamDescs.Add(ParamDesc);
        end;
      end;

      FParamsAccessorData.ExecuteParams.pData := Marshal.AllocHGlobal(BindMemorySize);
      FillChar(FParamsAccessorData.ExecuteParams.pData, BindMemorySize, 0);

      QueryIntf(FIRowsetFastLoad, {$IFDEF CLR}IAccessor{$ELSE}IID_IAccessor{$ENDIF}, FParamsAccessorData.Accessor);

    {$IFDEF CLR}
      rgBindingsGC := GCHandle.Alloc(FParamsAccessorData.rgBindings, GCHandleType.Pinned);
      rgBindings := Marshal.UnsafeAddrOfPinnedArrayElement(FParamsAccessorData.rgBindings, 0);
    {$ELSE}
      rgBindings := @FParamsAccessorData.rgBindings[0];
    {$ENDIF}

      OLEDBConnection.Check(FParamsAccessorData.Accessor.CreateAccessor(DBACCESSOR_ROWDATA, Columns.Count,
        rgBindings, BindMemorySize, FParamsAccessorData.ExecuteParams.HACCESSOR, rgStatus), Self);
    except
      if FParamsAccessorData.ExecuteParams.pData <> nil then
        Marshal.FreeHGlobal(FParamsAccessorData.ExecuteParams.pData);
      FParamsAccessorData.ExecuteParams.pData := nil;

      if Length(FParamsAccessorData.rgBindings) <> 0 then begin
        for i := 0 to Columns.Count - 1 do begin
          if FParamsAccessorData.rgBindings[i].pObject <> nil then
            Marshal.FreeHGlobal(FParamsAccessorData.rgBindings[i].pObject);
        end;
        SetLength(FParamsAccessorData.rgBindings, 0);
      end;

      raise;
    end;
  finally
    Marshal.FreeHGlobal(rgStatus);
  {$IFDEF CLR}
    if IntPtr(rgBindingsGC) <> nil then
      rgBindingsGC.Free;
  {$ENDIF}
  end;
end;

procedure TMSLoader.PutColumnData(Col: integer; Row: integer; const Value: variant);
var
  ParamDesc: CRAccess.TParamDesc;
  pLength: PUINT;
{$IFDEF CLR}
  ParamGCHandle: TIntPtrDynArray;
{$ENDIF}  
begin
  inherited;

  ParamDesc := FParamDescs.Items[Col];
  ParamDesc.SetValue(Unassigned);
  ParamDesc.SetValue(Value);
  FParamsAccessorData.rgBindings[Col].eParamIO := DBPARAMIO_INPUT;


  SaveParamValue(ParamDesc, FParamsAccessorData.rgBindings[Col], FParamsAccessorData{$IFDEF HAVE_COMPRESS}, cbNone{$ENDIF},
    {$IFDEF CLR}ParamGCHandle, {$ENDIF}TMSAccessUtils.FIConnection(Connection).DBMSPrimaryVer, TMSAccessUtils.FIConnection(Connection).ProviderPrimaryVer);
  FParamsAccessorData.rgBindings[Col].eParamIO := DBPARAMIO_NOTPARAM;

  if not (ParamDesc.GetDataType in CharsByRef + BytesByRef) and not (ParamDesc.GetDataType in [dtUnknown]) then begin
    pLength := PUINT(UINT(Integer(FParamsAccessorData.ExecuteParams.pData)) + FParamsAccessorData.rgBindings[Col].obLength);
    Marshal.WriteInt32(pLength, FParamsAccessorData.rgBindings[Col].cbMaxLen);
  end;

  if Col = Columns.Count - 1 then
    TMSAccessUtils.FIConnection(Connection).Check(FIRowsetFastLoad.InsertRow(FParamsAccessorData.ExecuteParams.HACCESSOR,
      FParamsAccessorData.ExecuteParams.pData), Self);
end;

procedure TMSLoader.Commit(Done: boolean = True);
begin
  if FIRowsetFastLoad <> nil then
    TMSAccessUtils.FIConnection(Connection).Check(FIRowsetFastLoad.Commit(Done), Self);
end;

procedure TMSLoader.Finish;
begin
  inherited;

  try
    Commit;

    FParamDescs.Free;

    if FParamsAccessorData.ExecuteParams.pData <> nil then
      TMSAccessUtils.FIConnection(Connection).Check(FParamsAccessorData.Accessor.ReleaseAccessor(FParamsAccessorData.ExecuteParams.HACCESSOR, nil), Self);
  finally
    FParamsAccessorData.ExecuteParams.HACCESSOR := 0;
    FParamsAccessorData.Accessor := nil;
    if FParamsAccessorData.ExecuteParams.pData <> nil then
      Marshal.FreeHGlobal(FParamsAccessorData.ExecuteParams.pData);
    FParamsAccessorData.ExecuteParams.pData := nil;

    FIOpenRowset := nil;
    FIRowsetFastLoad := nil;
    Reset;
  end;
end;

{ TMSLoaderOptions }

constructor TMSLoaderOptions.Create(Owner: TMSLoader);
begin
  inherited Create;

  FOwner := Owner;
  FRowsPerBatch := 0;
  FKilobytesPerBatch := 0;
  FLockTable := False;
  FCheckConstraints := False;
end;

procedure TMSLoaderOptions.AssignTo(Dest: TPersistent);
begin
  if Dest is TMSLoaderOptions then begin
    TMSLoaderOptions(Dest).RowsPerBatch := RowsPerBatch;
    TMSLoaderOptions(Dest).KilobytesPerBatch := KilobytesPerBatch; 
    TMSLoaderOptions(Dest).LockTable := LockTable;
    TMSLoaderOptions(Dest).CheckConstraints := CheckConstraints;
  end
  else
    inherited;
end;

end.
