//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Sdac.inc}

unit MSDump;
{$ENDIF}

interface

uses
  SysUtils, Classes, DB, CRAccess, DBAccess, MSAccess, DADump, DAScript;

type
  TMSDump = class;

  //TMSDumpObject = (doData);
  //TMSDumpObjects = set of TMSDumpObject;

  TMSDumpOptions = class(TDADumpOptions)
  protected
    FIdentityInsert: boolean;
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create(Owner: TMSDump);
  published
    property IdentityInsert: boolean read FIdentityInsert write FIdentityInsert default False;
  end;

  TMSDump = class(TDADump)
  protected
    //FObjects: TMSDumpObjects;

    procedure AssignTo(Dest: TPersistent); override;

    function GetTableInfoClass: TTableInfoClass; override;

    function GetConnection: TMSConnection;
    procedure SetConnection(Value: TMSConnection);

    function GetTableNames: string; override;
    procedure SetTableNames(Value: string); override;

    function CreateOptions: TDADumpOptions; override;
    function CreateScript: TDAScript; override;
    
    function GetOptions: TMSDumpOptions;
    procedure SetOptions(Value: TMSDumpOptions);

    procedure InternalBackup(Query: string); override;
  public
    constructor Create(Owner: TComponent); override;
  published
    property Connection: TMSConnection read GetConnection write SetConnection;

    //property Objects: TMSDumpObjects read FObjects write FObjects default [doData];
    property Options: TMSDumpOptions read GetOptions write SetOptions;
  end;

implementation

uses
{$IFDEF CLR}
  System.Text, System.Runtime.InteropServices, 
{$ELSE}
  CLRClasses,
{$ENDIF}
{$IFDEF VER6P}
  Variants,
{$ENDIF}
  MemUtils, MemData, DAConsts, DALoader, OLEDBAccess, MSScript;

{ TMSDumpOptions }

constructor TMSDumpOptions.Create(Owner: TMSDump);
begin
  inherited Create(Owner);

  FIdentityInsert := False;
end;

procedure TMSDumpOptions.AssignTo(Dest: TPersistent);
begin
  inherited;

  if Dest is TMSDumpOptions then begin
    TMSDumpOptions(Dest).IdentityInsert := IdentityInsert;
  end;
end;

{ TMSDump }

constructor TMSDump.Create(Owner: TComponent);
begin
  inherited Create(Owner);

  //FObjects := [doData];
  
  FLeftQuote := OLEDBAccess.LeftQuote;
  FRightQuote := OLEDBAccess.RightQuote;
end;

procedure TMSDump.AssignTo(Dest: TPersistent);
begin
  inherited;
  
  if Dest is TMSDump then begin
    //TMSDump(Dest).Objects := Objects;
  end;
end;

function TMSDump.GetTableInfoClass: TTableInfoClass;
begin
  Result := TOLEDBTableInfo;
end;

function TMSDump.GetConnection: TMSConnection;
begin
  Result := TMSConnection(inherited Connection);
end;

procedure TMSDump.SetConnection(Value: TMSConnection);
begin
  inherited Connection := Value;
end;

function TMSDump.GetTableNames: string;
begin
  Result := TableNamesFromList(FTables);
end;

procedure TMSDump.SetTableNames(Value: string);
begin
  TableNamesToList(Value, FTables);
end;

function TMSDump.CreateOptions: TDADumpOptions;
begin
  Result := TMSDumpOptions.Create(nil);
end;

function TMSDump.CreateScript: TDAScript;
begin
  Result := TMSScript.Create(nil);
end;

function TMSDump.GetOptions: TMSDumpOptions;
begin
  Result := TMSDumpOptions(inherited Options);
end;

procedure TMSDump.SetOptions(Value: TMSDumpOptions);
begin
  inherited Options := Value;
end;

{$IFNDEF CLR}
type
  _StringBuilder = class (StringBuilder);
{$ENDIF}

procedure TMSDump.InternalBackup(Query: string);
var
  MSQuery: TMSQuery;
  TableCount: integer;

  procedure VarToMSSQL(Field: TField; FieldDesc: TOLEDBFieldDesc; sb: StringBuilder);
  var
    dt: TDateTime;
    Blob: TBlob;
    Piece: PPieceHeader;
    Value: Variant;
    Data: TBytes;
  {$IFNDEF VER6P}
    pValueData: PVarData;
  {$ENDIF}
  {$IFDEF CLR}
    Bytes: TBytes;
  {$ELSE}
    sbOffset: integer;
  {$ENDIF}
  begin
    SetLength(Data, 0); // To avoid Hint from compiler
    case FieldDesc.DataType of
      dtBoolean:
        sb.Append(BoolToStr(Field.AsBoolean));
      dtUnknown, dtString, dtMemo, dtWideMemo, dtExtString, dtWideString, dtExtWideString, dtGuid{$IFDEF VER5P}, dtVariant{$ENDIF}:
        sb.Append(QuotedStr(Field.AsString));
      dtInt8, dtInt16, dtInt32, dtInt64,
      dtUInt16, dtUInt32: begin
      {$IFNDEF VER6P}
        Value := Field.AsVariant;
        pValueData := @TVarData(Value);
        if pValueData.VType = varDecimal then
          sb.Append(IntToStr(PInt64(@pValueData.VInteger)^))
        else
      {$ENDIF}
          sb.Append(Field.AsString);
      end;
      dtFloat, dtCurrency:
        sb.Append(ChangeDecimalSeparator(Field.AsString));
      dtDate, dtTime, dtDateTime: begin
        dt := Field.AsDateTime;
        if dt = 0 then
          sb.Append(QuotedStr('1900-01-01 00:00:00'))
        else
          sb.Append(QuotedStr(FormatDateTime('YYYY-MM-DD HH:NN:SS', dt)));
      end;
      dtBlob, dtMSXML: begin
        sb.Append('0x');
        Blob := MSQuery.GetBlob(Field.FieldName);
        Piece := Blob.FirstPiece;

      {$IFDEF CLR}
        while IntPtr(Piece) <> nil do begin
          SetLength(Data, Piece.Used);
          Marshal.Copy(IntPtr(Integer(Piece) + sizeof(TPieceHeader)), Data, 0, Piece.Used);
          SetLength(Bytes, Length(Data) * 2);
          BinToHex(Data, 0, Bytes, 0, Length(Data));
          sb.Append(Encoding.Default.GetString(Bytes));
          Piece := Piece.Next;
        end;
      {$ELSE}
        sbOffset := sb.Length + 1;
        sb.Length := sb.Length + Integer(Blob.Size) * 2;
        while Piece <> nil do begin
          BinToHex(IntPtr(Integer(Piece) + sizeof(TPieceHeader)),
            IntPtr(Integer(@_StringBuilder(sb).FString[sbOffset])), Piece.Used);
          sbOffset := sbOffset + Integer(Piece.Used);
          Piece := Piece.Next;
        end;
      {$ENDIF}
      end;
      dtBytes, dtVarBytes, dtExtVarBytes: begin
        sb.Append('0x');
        Value := Field.Value;
        Data := Value;
      {$IFDEF CLR}
        SetLength(Bytes, Length(Data) * 2);
        BinToHex(Data, 0, Bytes, 0, Length(Data));
        sb.Append(Encoding.Default.GetString(Bytes));
      {$ELSE}
        sbOffset := sb.Length + 1;
        sb.Length := sb.Length + Length(Data) * 2;
        BinToHex(@Data[0],
          IntPtr(Integer(@_StringBuilder(sb).FString[sbOffset])), Length(Data));
      {$ENDIF}
      end;
      else
        Assert(False, 'Unknown datatype (' + IntToStr(FieldDesc.DataType) + ')');
    end;
  end;

  procedure BackupTablesAndData;

    function FieldIsIdentity(Field: TField): boolean;
    var
      FieldDesc: TOLEDBFieldDesc;
    begin
      FieldDesc := MSQuery.GetFieldDesc(Field) as TOLEDBFieldDesc;
      Result := FieldDesc.IsAutoIncrement;
    end;

    procedure BackupTable(TableName: string; TableNum: integer);
    var
      KeyAndDataFields: TKeyAndDataFields;

      procedure GetCurrentRow(sb: StringBuilder);
      var
        sbOldLen: integer;

        procedure ProcessField(Field: TField);
        var
          Value: Variant;
          FieldDesc: TOLEDBFieldDesc;
        begin
          if sbOldLen <> sb.Length then
            sb.Append(', ');

          Value := Field.AsVariant;
          if VarIsEmpty(Value) or VarIsNull(Value) or Field.IsNull then
            sb.Append('NULL')
          else
          begin
            FieldDesc := MSQuery.GetFieldDesc(Field) as TOLEDBFieldDesc;
            VarToMSSQL(Field, FieldDesc, sb);
          end;
        end;

      var
        i: integer;
      begin
        sbOldLen := sb.Length;

        if Length(KeyAndDataFields.DataFieldDescs) = 0 then begin
          for i := 0 to MSQuery.FieldCount - 1 do
            if not (FieldIsIdentity(MSQuery.Fields[i]) and not Options.IdentityInsert) then
              ProcessField(MSQuery.Fields[i]);
        end
        else
        begin
          if (TDBAccessUtils.GetIdentityField(MSQuery) <> nil) and Options.IdentityInsert then
            ProcessField(TDBAccessUtils.GetIdentityField(MSQuery));
          for i := 0 to Length(KeyAndDataFields.DataFieldDescs) - 1 do
            ProcessField(MSQuery.GetField(KeyAndDataFields.DataFieldDescs[i]));
        end;
      end;

    var
      RecordCount: integer;
      InsHeader: string;
      FieldList: string;
      i: integer;
      SQLSelect1: string;
      sb: StringBuilder;

    begin
      FieldList := '';
      if Query = '' then
        SQLSelect1 := 'SELECT * FROM ' + TableName
      else
        SQLSelect1 := Query;

      MSQuery.SQL.Text := SQLSelect1;
      MSQuery.AddWhere('0=1');
      try
        MSQuery.Open;

        if (TableName = '')
          and (TDBAccessUtils.GetTablesInfo(MSQuery).Count > 0) then
          TableName := TDBAccessUtils.GetTablesInfo(MSQuery)[0].TableName;

        if (TDBAccessUtils.GetIdentityField(MSQuery) <> nil) and Options.IdentityInsert then
          FieldList := QuoteName(TDBAccessUtils.GetIdentityField(MSQuery).FieldName);

        TDBAccessUtils.GetKeyAndDataFields(MSQuery, KeyAndDataFields, False);
        for i := 0 to Length(KeyAndDataFields.DataFieldDescs) - 1 do
          if not (TOLEDBFieldDesc(KeyAndDataFields.DataFieldDescs[i]).IsAutoIncrement and not Options.IdentityInsert) then
            if FieldList = '' then
              FieldList := QuoteName(KeyAndDataFields.DataFieldDescs[i].Name)
            else
              FieldList := FieldList + ', ' + QuoteName(KeyAndDataFields.DataFieldDescs[i].Name);
      finally
        MSQuery.Close;
      end;

      if True {(doData in Objects)} then begin
        if Options.GenerateHeader then
          AddLineToSQL(SBHTableData, [TableName]);

        if Options.AddDrop {and not (doTables in Objects)} then
          Add('TRUNCATE TABLE ' + TableName + ';');

        if Options.IdentityInsert then
          Add(Format('SET IDENTITY_INSERT %s ON;', [TableName]));

        MSQuery.SQL.Text := 'SELECT COUNT(*) FROM ' + TableName;
        MSQuery.Execute;
        RecordCount := MSQuery.Fields[0].AsInteger;

        if Assigned(FOnBackupProgress) then
          FOnBackupProgress(Self, TableName, TableNum, TableCount, 0);

        if RecordCount > 0 then begin
          if FieldList = '' then
            InsHeader := TableName
          else
            InsHeader := TableName + '(' + FieldList + ')';

          InsHeader := 'INSERT INTO ' + InsHeader + ' VALUES';

          MSQuery.SQL.Text := SQLSelect1;
          MSQuery.Open;
          if FieldList <> '' then
            TDBAccessUtils.GetKeyAndDataFields(MSQuery, KeyAndDataFields, False);

          sb := StringBuilder.Create;
          try
            while not MSQuery.Eof do begin
              if Assigned(FOnBackupProgress) then
                FOnBackupProgress(Self, TableName, TableNum, TableCount, Trunc(MSQuery.RecNo * 100 / RecordCount));

              sb.Length := 0;
              sb.Append(InsHeader);
              sb.Append(' (');
              GetCurrentRow(sb);
              sb.Append(');');
              Add(sb.ToString);
              MSQuery.Next;
            end;
          finally
            sb.Free;
          end;
        end;
        if Options.IdentityInsert then
          Add(Format('SET IDENTITY_INSERT %s OFF;', [TableName]));
      end;
    end;

  var
    i: integer;
    TablesList: TStringList;
    TableName: string;

  begin
    if Query = '' then begin
      TablesList := nil;
      try
        TablesList := TStringList.Create;

        if FTables.Count = 0 then
          GetTablesList(Connection, TablesList)
        else
          TablesList.Assign(FTables);

        for i := 0 to TablesList.Count - 1 do begin
          TableName := QuoteName(TablesList[i]);

          if Assigned(FOnBackupProgress) then
            FOnBackupProgress(Self, TableName, i, TablesList.Count, 0);

          TableCount := TablesList.Count;
          BackupTable(TableName, i);
          Add('');
        end;

      finally
        TablesList.Free;
      end;
    end
    else
    begin
      if FTables.Count = 1 then
        TableName := QuoteName(FTables[0])
      else
        TableName := '';

      if Assigned(FOnBackupProgress) then
         FOnBackupProgress(Self, TableName, 0, 1, 0);

      TableCount := 1;
      BackupTable(TableName, 0);
      Add('');
    end;
  end;

begin
  BeginConnection;
  try
    Query := Trim(Query);
    if (Query <> '') and (FTables.Count > 1) then
      raise Exception.Create(SWrongTblCount);
    MSQuery := nil;
    FSQL.BeginUpdate;
    try
      FSQL.Text := '';
      if Options.GenerateHeader then
        AddLineToSQL(Format(SBHCaption, ['Sdac', SDACVersion,
        'MS SQL', Connection.ServerVersion, 'MS SQL', Connection.ClientVersion, DateTimeToStr(Now),
          Connection.Server, Connection.Database]));

      MSQuery := TMSQuery.Create(nil);
      MSQuery.Connection := Connection;
      MSQuery.ReadOnly := False;
      MSQuery.FetchAll := True;
      MSQuery.UniDirectional := True;
      MSQuery.Options.SetFieldsReadOnly := True;
      MSQuery.Options.QueryRecCount := False;

      // if doData in Objects then
        BackupTablesAndData;

    finally
      FSQL.EndUpdate;
      MSQuery.Free;
    end;
  finally
    EndConnection;
  end;
end;

end.
