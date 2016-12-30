unit citComponentProps;

interface

uses
  Windows, Messages, Classes, Forms, IniFiles, TypInfo, SysUtils, Registry,
  dbTables, Dialogs, DB, DesignEditors, DesignIntF,DbAccess;

const
  MaxSectionLen = 32;
  Dlmtr = '~';
  KeyNum = 7;
  RootKeysStr: array[0..KeyNum - 1] of string =
  ('HKEY_CLASSES_ROOT', 'HKEY_CURRENT_USER', 'HKEY_LOCAL_MACHINE',
    'HKEY_USERS', 'HKEY_PERFORMANCE_DATA', 'HKEY_CURRENT_CONFIG',
    'HKEY_DYN_DATA');
  RootKeys: array[0..KeyNum - 1] of Int64 =
  (HKEY_CLASSES_ROOT, HKEY_CURRENT_USER, HKEY_LOCAL_MACHINE,
    HKEY_USERS, HKEY_PERFORMANCE_DATA, HKEY_CURRENT_CONFIG,
    HKEY_DYN_DATA);

type
  TFormParam = (fpSize, fpPos, fpState, fpActiveControl);
  TFormParams = set of TFormParam;
  TStorage = (sIniFile, sRegistry, sDatabase);
  TIntegerSet = set of 0..SizeOf(Integer) * 8 - 1;

  TRootKeyProperty = class(TIntegerProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValueList(List: TStrings); virtual;
    procedure GetValues(Proc: TGetStrProc); override;
    function GetValue: string; override;
    procedure SetValue(const Value: string); override;
  end;

  TPropListProperty = class(TClassProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
  end;

  TComponentPropsEditor = class(TDefaultEditor)
  protected
    procedure EditProperty(const PropertyEditor: IProperty; var Continue: Boolean); override;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TcitComponentProps = class(TComponent)
  private
    FEnabled: Boolean;
    FLoadOnlySelected: Boolean;
    FProperties: TStrings;
    FPropVals: TStringList;
    FPropValsDef: TStringList;
    FMiscStrs: TStringList;
    FIniFileName: string;
    FIniSection: string;
    FTableName: AnsiString;
    FDefaultUser: string;
    FStorageType: TStorage;
    FFormParams: TFormParams;
    FRestoreOnly: boolean;
    FRestoreOnlyDefault: boolean;
    FLoadDefault: boolean;
    FOnCloseQuery: TCloseQueryEvent;
    FOnDestroy: TNotifyEvent;
    FAlreadySaved: Boolean;
    FQuery: TDataSet;
    SaveProps: array[TStorage] of procedure of object;
    LoadProps: array[TStorage] of procedure of object;
    FIniFile: TIniFile;
    FRegIniFile: TRegIniFile;
    FHandleCloseQuery: boolean;
    FRootKey: Int64;
    FUser: string;
    function GetOwnerForm: TForm;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure ReadProperties;
    procedure SavePropsToReg;
    procedure SavePropsToIni;
    procedure SavePropsToDB;
    procedure AssignProperties;
    procedure LoadPropsFromReg;
    procedure LoadPropsFromIni;
    procedure LoadPropsFromDB;
    procedure StoreProperty(AObject: TObject; PropInfo: PPropInfo; CName: string);
    procedure AddProp(FullPropName, Value: string);
    procedure AssignProperty(AObject: TObject; PropInfo: PPropInfo; Value: string);
    procedure SetRootKey(Value: Int64);
    procedure SetDefaultUser(Value: string);
    procedure SetQuery(Value: TDataSet);
    procedure SetUser(const Value: string);
  protected
    property OwnerForm: TForm read GetOwnerForm;
    procedure Loaded; override;
    function GetUserForQuery: string;
  public
    RestoreMethod: procedure of object;
    SaveMethod: procedure of object;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { AddToStorage procedure works only if LoadOnlySelected is set to TRUE }
    procedure AddToStorage(Props: array of string);
    procedure SaveToStorage;
    procedure RestoreFromStorage;
    procedure AddUserStrings(AStrings: TStrings);
    procedure ReadUserStrings(AComponentName: string; AStrings: TStrings);
    procedure ReadDefaultStrings(AComponentName: string; AStrings: TStrings);
  published
    property RootKey: Int64 read FRootKey write SetRootKey;
    property HandleCloseQuery: boolean read FHandleCloseQuery write FHandleCloseQuery;
    property Enabled: Boolean read FEnabled write FEnabled;
    property LoadOnlySelected: Boolean read FLoadOnlySelected write FLoadOnlySelected;
    property DefaultUser: string read FDefaultUser write SetDefaultUser;
    property Query: TDataSet read FQuery write SetQuery;
    property TableName: AnsiString read FTableName write FTableName;
    property Properties: TStrings read FProperties write FProperties;
    property IniFileName: string read FIniFileName write FIniFileName;
    property IniSection: string read FIniSection write FIniSection;
    property StorageType: TStorage read FStorageType write FStorageType;
    property FormParams: TFormParams read FFormParams write FFormParams;
    property RestoreOnly: boolean read FRestoreOnly write FRestoreOnly;
    property RestoreOnlyDefault: boolean read FRestoreOnlyDefault write FRestoreOnlyDefault;
    property LoadDefault: boolean read FLoadDefault write FLoadDefault default True;
    property User: string read FUser write SetUser;
  end;

procedure Register;
procedure ParseProp(s: string; c: char; var CompName, PropName: string);

implementation

uses
  TargetUtils, citPropDlg, ADODB, DBGrids, StdCtrls;

procedure ParseProp(s: string; c: char; var CompName, PropName: string);
begin
  CompName := Copy(s, 1, Pos(c, s) - 1);
  PropName := Copy(s, Pos(c, s) + 1, Length(s) - Pos(c, s));
end;

constructor TcitComponentProps.Create;
begin
  inherited Create(AOwner);
  FProperties := TStringList.Create;
  FRootKey := HKEY_CURRENT_USER;
  FPropVals := TStringList.Create;
  FPropValsDef := TStringList.Create;
  FMiscStrs := TStringList.Create;
  FAlreadySaved := False;
  FLoadDefault := True;
  SaveProps[sIniFile] := SavePropsToIni;
  SaveProps[sRegistry] := SavePropsToReg;
  SaveProps[sDatabase] := SavePropsToDB;
  LoadProps[sIniFile] := LoadPropsFromIni;
  LoadProps[sRegistry] := LoadPropsFromReg;
  LoadProps[sDatabase] := LoadPropsFromDB;
  FEnabled := True;
  FHandleCloseQuery := True;
  FUser := '';
end;

destructor TcitComponentProps.Destroy;
begin
  FProperties.Free;
  FPropVals.Free;
  FPropValsDef.Free;
  FMiscStrs.Free;
  FIniFile.Free;
  FRegIniFile.Free;
  if OwnerForm <> nil then
  begin
    OwnerForm.OnCloseQuery := FOnCloseQuery;
    OwnerForm.OnDestroy := FOnDestroy;
  end;
  inherited Destroy;
end;

procedure TcitComponentProps.SaveToStorage;
begin
  if FEnabled and not RestoreOnly then
  begin
    ReadProperties;
    FPropVals.AddStrings(FMiscStrs);
    SaveProps[FStorageType];
  end;
end;

procedure TcitComponentProps.AddUserStrings(AStrings: TStrings);
var
  i, a, b: integer;
  aIdxList: TStringList;
  aStr: string;
begin
  aIdxList := TStringList.Create;
  try
    // сохранение текущих позиций колонок в списке
    for i := 0 to AStrings.Count - 1 do
      if FMiscStrs.IndexOfName(AStrings.Names[i]) > -1 then
        aIdxList.Add(IntToStr(FMiscStrs.IndexOfName(AStrings.Names[i])));
    // сортировка позиций
    for a := 0 to aIdxList.Count - 2 do
      for b := a + 1 to aIdxList.Count - 1 do
        if StrToInt(aIdxList.Strings[a]) > StrToInt(aIdxList.Strings[b]) then
        begin
          aStr := aIdxList.Strings[a];
          aIdxList.Strings[a] := aIdxList.Strings[b];
          aIdxList.Strings[b] := aStr;
        end;

    a := aIdxList.Count - 1;
    if FEnabled then
      for i := AStrings.Count - 1 downto 0 do
      begin
        if a >= 0 then
        begin
          FMiscStrs.Strings[StrToInt(aIdxList.Strings[a])] := AStrings[i];
          a := a - 1;
        end
        else
          FMiscStrs.Insert(0, AStrings[i]);
      end;
  finally
    aIdxList.Free;
  end;
end;

procedure TcitComponentProps.ReadUserStrings(AComponentName: string;
  AStrings: TStrings);
var
  i: integer;
  ComponentName,
    PropertyName: string;
begin
  AStrings.Clear;
  with FMiscStrs do
    for i := 0 to Count - 1 do
    begin
      ParseProp(Names[i], Dlmtr, ComponentName, PropertyName);
      if ComponentName = AComponentName then
        AStrings.Add(PropertyName + '=' + Values[Names[i]]);
    end;
end;

procedure TcitComponentProps.ReadDefaultStrings(AComponentName: string;
  AStrings: TStrings);
var
  i: integer;
  ComponentName,
    PropertyName: string;
begin
  AStrings.Clear;
  with FPropValsDef do
    for i := 0 to Count - 1 do
    begin
      ParseProp(Names[i], Dlmtr, ComponentName, PropertyName);
      if ComponentName = AComponentName then
        AStrings.Add(PropertyName + '=' + Values[Names[i]]);
    end;
end;

procedure TcitComponentProps.RestoreFromStorage;
begin
  if FEnabled then LoadProps[FStorageType];
end;

function TcitComponentProps.GetOwnerForm: TForm;
begin
  Result := TForm(Owner);
end;

procedure TcitComponentProps.Loaded;
begin
  if not (csLoading in ComponentState) then Exit;
  inherited Loaded;
  if not (csDesigning in ComponentState) then
  begin
    FRegIniFile := TRegIniFile.Create(FIniFileName);
    FIniFile := TIniFile.Create(FIniFileName);
    try
      FRegIniFile.RootKey := FRootKey;
    except
      FRegIniFile.RootKey := HKEY_CURRENT_USER;
    end;
    FOnCloseQuery := OwnerForm.OnCloseQuery;
    OwnerForm.OnCloseQuery := FormCloseQuery;
    FOnDestroy := OwnerForm.OnDestroy;
    OwnerForm.OnDestroy := FormDestroy;
    if FEnabled then LoadProps[FStorageType];
    if Assigned(RestoreMethod) then RestoreMethod;
  end;
end;

procedure TcitComponentProps.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Assigned(FOnCloseQuery) then FOnCloseQuery(Sender, CanClose);
  if not FAlreadySaved and FEnabled and FHandleCloseQuery and not RestoreOnly then
  begin
    if Assigned(SaveMethod) then SaveMethod;
    ReadProperties;
    FPropVals.AddStrings(FMiscStrs);
    SaveProps[FStorageType];
    FAlreadySaved := True;
  end;
end;

procedure TcitComponentProps.FormDestroy(Sender: TObject);
begin
  if not FAlreadySaved and FEnabled and not RestoreOnly then
  begin
    if Assigned(SaveMethod) then SaveMethod;
    ReadProperties;
    FPropVals.AddStrings(FMiscStrs);
    SaveProps[FStorageType];
    FAlreadySaved := True;
  end;
  if Assigned(FOnDestroy) then FOnDestroy(Sender);
end;

procedure TcitComponentProps.AddProp(FullPropName, Value: string);
begin
  FPropVals.Add(FullPropName + '=' + Value);
end;

procedure TcitComponentProps.StoreProperty(AObject: TObject;
  PropInfo: PPropInfo; CName: string);
var
  TheName, StrSet: string;
  TheObject: TObject;
  ASet: TIntegerSet;
  ATypeInfo: PTypeInfo;
  TmpList: PPropList;
  i, j, Size, Count: integer;
  ColumnStrings: TStrings;
  Mask: AnsiString;
  ColumnWidth: integer;

  function StrPad(s, s_: string; enable: boolean): string;
  begin
    if enable then
      Result := s_ + s + s_
    else
      Result := s;
  end;

  procedure StoreFields;
  var
    i: integer;
  begin
    Count := GetPropList(TheObject.ClassInfo, tkProperties, nil);
    Size := Count * SizeOf(Pointer);
    GetMem(TmpList, Size);
    try
      GetPropList(TheObject.ClassInfo, tkProperties, TmpList);
      for i := 0 to Count - 1 do
        StoreProperty(TheObject, TmpList^[i], TheName);
    finally
      FreeMem(TmpList, Size)
    end
  end;

begin
  if CName = '' then
    TheName := (AObject as TComponent).Name + Dlmtr + PropInfo^.Name
  else
    TheName := CName + Dlmtr + PropInfo^.Name;

  case PropInfo^.PropType^.Kind of
    tkInteger: AddProp(TheName, IntToStr(GetOrdProp(AObject, PropInfo)));
    tkString,
      tkLString: AddProp(TheName, GetStrProp(AObject, PropInfo));
    tkChar: AddProp(TheName, chr(GetOrdProp(AObject, PropInfo)));
    tkFloat: AddProp(TheName, FloatToStr(GetFloatProp(AObject, PropInfo)));
    tkEnumeration: AddProp(TheName, GetEnumName(PropInfo^.PropType^,
        GetOrdProp(AObject, PropInfo)));
    tkSet:
      begin
        Integer(ASet) := GetOrdProp(AObject, PropInfo);
        ATypeInfo := GetTypeData(PropInfo^.PropType^)^.CompType^;
        StrSet := '[';
        for i := 0 to SizeOf(Integer) * 8 - 1 do
          if i in ASet then
          begin
            if Length(StrSet) <> 1 then StrSet := StrSet + ',';
            StrSet := StrSet + GetEnumName(ATypeInfo, i);
          end;
        StrSet := StrSet + ']';
        AddProp(TheName, StrSet)
      end;
    tkClass:
      begin
        TheObject := TObject(GetOrdProp(AObject, PropInfo));
        if (TheObject is TStrings) then
          AddProp(TheName, StrPad(TStrings(TheObject).CommaText,
            '''', FStorageType = sIniFile))
        else
        begin
          //Добавлено OIvanov 15.05.2003 - для сохранения настроек DBGrid
          if (TheObject is TDBGridColumns) then
          begin
            ColumnStrings := TStringList.Create;
            try
              for i := 0 to (TheObject as TDBGridColumns).Grid.DataSource.DataSet.FieldCount - 1 do
              begin
                if ((TheObject as TDBGridColumns).Grid.DataSource.DataSet.Fields[i] is TNumericField) then
                  Mask := ((TheObject as TDBGridColumns).Grid.DataSource.DataSet.Fields[i] as TNumericField).DisplayFormat
                else if ((TheObject as TDBGridColumns).Grid.DataSource.DataSet.Fields[i] is TDateTimeField) then
                  Mask := ((TheObject as TDBGridColumns).Grid.DataSource.DataSet.Fields[i] as TDateTimeField).DisplayFormat
                else
                  Mask := (TheObject as TDBGridColumns).Grid.DataSource.DataSet.Fields[i].EditMask;

                if not (TheObject as TDBGridColumns).Grid.DataSource.DataSet.Fields[i].Visible then
                  Mask := Mask + '~~';

                for j := 0 to (TheObject as TDBGridColumns).Count - 1 do
                  if (TheObject as TDBGridColumns)[j].FieldName = (TheObject as TDBGridColumns).Grid.DataSource.DataSet.Fields[i].FieldName then
                    ColumnWidth := (TheObject as TDBGridColumns)[j].Width;
                ColumnStrings.Add((TheObject as TDBGridColumns).Grid.DataSource.DataSet.Fields[i].FieldName + '||'
                  + (TheObject as TDBGridColumns).Grid.DataSource.DataSet.Fields[i].DisplayLabel + '&&'
                  + IntToStr(ColumnWidth) + '$$' + Mask);
              end;
              AddProp(TheName, StrPad(ColumnStrings.CommaText, '''', FStorageType = sIniFile))
            finally
              ColumnStrings.Free;
            end;
          end
          else
            {///////////////////////////////////////////////////////////////} if GetTypeData(PropInfo^.PropType^)^.ClassType.InheritsFrom(TComponent)
              then
              AddProp(TheName, TComponent(GetOrdProp(AObject, PropInfo)).Name)
            else
              StoreFields;
        end;
      end;

    tkRecord:
      begin
        TheObject := TObject(GetOrdProp(AObject, PropInfo));
        StoreFields;
      end;
  end;
end;

procedure TcitComponentProps.ReadProperties;
var
  i: integer;
  ComponentName, PropName: string;
  CurComponent: TComponent;
  CurPropInfo: PPropInfo;
begin
  FPropVals.Clear;
  for i := 0 to FProperties.Count - 1 do
  begin
    ParseProp(FProperties[i], '.', ComponentName, PropName);
    if ComponentName = '' then
      CurComponent := OwnerForm
    else
      CurComponent := OwnerForm.FindComponent(ComponentName);

    if CurComponent <> nil then
    begin
      CurPropInfo := GetPropInfo(CurComponent.ClassInfo, PropName);
      if CurPropInfo = nil then continue;
      StoreProperty(CurComponent, CurPropInfo, '');
    end;
  end;

  if fpSize in FFormParams then
  begin
    AddProp('Width', IntToStr(OwnerForm.Width));
    AddProp('Height', IntToStr(OwnerForm.Height));
  end;
  if fpPos in FFormParams then
  begin
    AddProp('Left', IntToStr(OwnerForm.Left));
    AddProp('Top', IntToStr(OwnerForm.Top));
  end;
  if fpActiveControl in FFormParams then
    AddProp('ActiveControl', OwnerForm.ActiveControl.Name);
  if fpState in FFormParams then
    AddProp('WindowState', GetEnumName(TypeInfo(TWindowState),
      ord(OwnerForm.WindowState)));
end;

procedure TcitComponentProps.SavePropsToIni;
var
  i: integer;
begin
  with FIniFile do
  try
    for i := 0 to FPropVals.Count - 1 do
    begin
      if ReadString(FIniSection, FPropVals.Names[i], '') <> '' then
        DeleteKey(FIniSection, FPropVals.Names[i]);
      WriteString(FIniSection, FPropVals.Names[i],
        FPropVals.Values[FPropVals.Names[i]]);
    end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TcitComponentProps.SavePropsToReg;
var
  i: integer;
begin
  with FRegIniFile do
  try
    for i := 0 to FPropVals.Count - 1 do
    begin
      if ReadString(FIniSection, FPropVals.Names[i], '') <> '' then
        DeleteKey(FIniSection, FPropVals.Names[i]);
      FRegIniFile.WriteString(FIniSection, FPropVals.Names[i],
        FPropVals.Values[FPropVals.Names[i]]);
    end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TcitComponentProps.SavePropsToDB;
var
  SQLTextDel: string;
  SQLTextIns: string;
  OSQL: TStrings;
  OParams: TParams;
  DParams: TParameters;
  userNo: string;
  cnt: integer;
begin
  try
    userNo := FDefaultUser;
    SQLTextDel := 'delete from ' + FTableName + ' where section = ''' + FIniSection + ''' and owner = ''' + userNo + '''';
    if (FIniSection = '') or (userNo = '') or (FPropVals.Text = '') then
    begin
      ShowMessage('Warning');
    end;
    SQLTextIns := 'insert into ' + FTableName + '(owner, section, data) values(:P_USER, :SECTION, :aData)';
    if Query.ClassNameIs('TADOQuery') then
    begin
      (Query as TAdoquery).SQL.Clear;
      (Query as TAdoquery).SQL.Add(SQLTextDel);
      (Query as TAdoquery).ExecSQL;
      (Query as TAdoquery).SQL.Clear;
      (Query as TAdoquery).SQL.Add(SQLTextIns);
      (Query as TAdoquery).Parameters.ParamByName('SECTION').Value := FIniSection;
      (Query as TAdoquery).Parameters.ParamByName('P_USER').Value := userNo;
      (Query as TAdoquery).Parameters.ParamByName('aData').Value := FPropVals.Text;
      (Query as TAdoquery).ExecSQL;
    end
    else
    begin
      (Query as TCustomDADataSet).SQL.Clear;
      (Query as TCustomDADataSet).SQL.Add(SQLTextDel);
      (Query as TCustomDADataSet).Execute;
      (Query as TCustomDADataSet).SQL.Clear;
      (Query as TCustomDADataSet).SQL.Add(SQLTextIns);
      (Query as TCustomDADataSet).Params.ParamByName('SECTION').AsString := FIniSection;
      (Query as TCustomDADataSet).Params.ParamByName('P_USER').AsString := userNo;
      (Query as TCustomDADataSet).Params.ParamByName('aData').AsString := FPropVals.Text;
      (Query as TCustomDADataSet).Execute;
    end;
  finally
    Query.Close;
  end;
end;

procedure TcitComponentProps.AssignProperty(AObject: TObject;
  PropInfo: PPropInfo; Value: string);
var
  TheObject: TObject;
  ASet: TIntegerSet;
  ATypeInfo: PTypeInfo;
  i, j: integer;
  ColumnStrings: TStrings;
  aField: TField;
  FieldName: AnsiString;
  FieldLabel: AnsiString;
  FieldMask: AnsiString;
  FieldWidth: integer;
  FieldVisible: boolean;
begin
  if (Length(Value) > 0) or (PropInfo^.PropType^.Kind in [tkString, tkLString]) then
    case PropInfo^.PropType^.Kind of
      tkInteger: SetOrdProp(AObject, PropInfo, StrToIntDef(Value, Low(Integer)));
      tkString,
        tkLString: SetStrProp(AObject, PropInfo, Value);
      tkChar: SetOrdProp(AObject, PropInfo, Ord(Value[1]));
      tkFloat: SetFloatProp(AObject, PropInfo, StrToFloat(Value));
      tkEnumeration: SetOrdProp(AObject, PropInfo,
          GetEnumValue(PropInfo^.PropType^, Value));
      tkSet:
        begin
          Integer(ASet) := 0;
          ATypeInfo := GetTypeData(PropInfo^.PropType^)^.CompType^;
          repeat
            ASet := ASet + [GetEnumValue(ATypeInfo, GetToken2('[],', Value))];
          until Value = '';
          SetOrdProp(AObject, PropInfo, Integer(ASet));
        end;
      tkClass:
        begin
          TheObject := TObject(GetOrdProp(AObject, PropInfo));
          if (TheObject is TStrings) then
            TStrings(TheObject).CommaText := Value
          else if (TheObject is TDBGridColumns) then
          begin
            ColumnStrings := TStringList.Create;
            try
              TStrings(ColumnStrings).CommaText := Value;
              for i := 0 to ColumnStrings.Count - 1 do
              begin
                try
                  FieldName := Copy(ColumnStrings[i], 1, Pos('||', ColumnStrings[i]) - 1);
                  FieldLabel := Copy(ColumnStrings[i], Pos('||', ColumnStrings[i]) + 2, Pos('&&', ColumnStrings[i]) - Pos('||', ColumnStrings[i]) -
                    2);
                  FieldWidth := StrToInt(Copy(ColumnStrings[i], Pos('&&', ColumnStrings[i]) + 2, Pos('$$', ColumnStrings[i]) - Pos('&&',
                    ColumnStrings[i]) - 2));
                  FieldMask := Copy(ColumnStrings[i], Pos('$$', ColumnStrings[i]) + 2, Length(ColumnStrings[i]) - Pos('$$', ColumnStrings[i]) - 1);

                  if Pos('~~', FieldMask) > 0 then
                  begin
                    FieldMask := Copy(FieldMask, 1, Length(FieldMask) - 2);
                    FieldVisible := false;
                  end
                  else
                    FieldVisible := true;
                  aField := (TheObject as TDBGridColumns).Grid.DataSource.DataSet.FieldByName(FieldName);
                  aField.DisplayLabel := FieldLabel;
                  for j := 0 to (TheObject as TDBGridColumns).Count - 1 do
                    if (TheObject as TDBGridColumns)[j].FieldName = FieldName then
                      (TheObject as TDBGridColumns)[j].Width := FieldWidth;

                  if (aField is TNumericField) then
                    (aField as TNumericField).DisplayFormat := FieldMask
                  else if (aField is TDateTimeField) then
                    (aField as TDateTimeField).DisplayFormat := FieldMask
                  else
                    aField.EditMask := FieldMask;
                  aField.Visible := FieldVisible;
                  aField.Index := i;
                except
                end;

              end;
            finally
              ColumnStrings.Free;
            end;
          end
          else if GetTypeData(PropInfo^.PropType^)^.ClassType.InheritsFrom(TComponent) then
            SetOrdProp(AObject, PropInfo,
              Integer(OwnerForm.FindComponent(Value)))
        end;
    end;
end;

procedure TcitComponentProps.AssignProperties;
var
  i: integer;
  ComponentName, PropName, SubProp, SubSubProp: string;
  CurComponent: TComponent;
  CurPropInfo: PPropInfo;
  TheObject: TObject;
  Fl: Boolean;
begin
  FMiscStrs.Clear;
  for i := 0 to FPropVals.Count - 1 do
  begin
    ParseProp(FPropVals.Names[i], Dlmtr, ComponentName, PropName);
    if ComponentName = '' then
      CurComponent := OwnerForm
    else
      CurComponent := OwnerForm.FindComponent(ComponentName);

    if CurComponent <> nil then
    begin
      ParseProp(PropName, Dlmtr, SubProp, SubSubProp);
      if SubProp = '' then
        CurPropInfo := GetPropInfo(CurComponent.ClassInfo, PropName)
      else
        CurPropInfo := GetPropInfo(CurComponent.ClassInfo, SubProp);
      if CurPropInfo = nil then
      begin
        FMiscStrs.Add(FPropVals[i]);
        continue;
      end;
      if (SubProp = '') then
      begin
        if not FLoadOnlySelected or (FLoadOnlySelected and ((ComponentName = '')
          or (FProperties.IndexOf(ComponentName + '.' + PropName) <> -1))) then
          AssignProperty(CurComponent, CurPropInfo, FPropVals.Values[FPropVals.Names[i]])
      end
      else if not FLoadOnlySelected or (FLoadOnlySelected and
        (FProperties.IndexOf(ComponentName + '.' + SubProp) <> -1)) then
      begin
        TheObject := CurComponent;
        Fl := False;
        SubProp := SubSubProp;
        repeat
          SubSubProp := GetToken2(Dlmtr, SubProp);
          TheObject := TObject(GetOrdProp(TheObject, CurPropInfo));
          CurPropInfo := GetPropInfo(CurPropInfo^.PropType^, SubSubProp);
          if CurPropInfo = nil then
          begin
            Fl := True;
            break;
          end;
        until SubProp = '';
        if Fl then continue;
        AssignProperty(TheObject, CurPropInfo, FPropVals.Values[FPropVals.Names[i]]);
      end;
    end;
  end;
end;

procedure TcitComponentProps.LoadPropsFromIni;
begin
  FIniFile.ReadSectionValues(FIniSection, FPropVals);
  AssignProperties;
end;

procedure TcitComponentProps.LoadPropsFromReg;
begin
  FRegIniFile.ReadSectionValues(FIniSection, FPropVals);
  AssignProperties;
end;

procedure TcitComponentProps.LoadPropsFromDB;
var
  OSQL: TStrings;
  OParams: TParams;
  DParams: TParameters;
  SQLStr: AnsiString;
  DefaultStr: AnsiString;
begin
  if FIniSection = '' then FIniSection := OwnerForm.Name;
  try
    if (Query.ClassNameIs('TADOQuery') or Query.ClassNameIs('TADOStoredProc')) then
    begin
      OSQL := (GetObjectProp(Query, 'SQL') as TStrings);
      DParams := (GetObjectProp(Query, 'Parameters') as TParameters);
    end
    else
    begin
      OSQL := (GetObjectProp(Query, 'SQL') as TStrings);
      OParams := (GetObjectProp(Query, 'Params') as TParams);
    end;

    SQLStr := 'select * from ' + FTableName + ' where section = ''' + FIniSection + ''' and owner = ';
    if FDefaultUser = '' then
      DefaultStr := '''DEFAULT_USER'''
    else
      DefaultStr := '''' + FDefaultUser + '''';
    if RestoreOnlyDefault then
      OSQL.Text := SQLStr + DefaultStr
        //        else OSQL.Text := SQLStr + 'user';
    else
      OSQL.Text := SQLStr + DefaultStr;

    Query.Open;

    if Query.RecordCount > 0 then
      FPropVals.Text := Query.FieldByName('DATA').AsString
    else if not RestoreOnlyDefault then
    begin
      Query.Close;
      OSQL.Text := SQLStr + DefaultStr;
      Query.Open;
      if Query.RecordCount > 0 then FPropVals.Text := Query.FieldByName('Data').AsString;
    end;
    AssignProperties;
  finally
    Query.Close;
  end;
end;

procedure TcitComponentProps.AddToStorage(Props: array of string);
var
  i: integer;
begin
  for i := Low(Props) to High(Props) do
    FProperties.Add(Props[i]);
end;

procedure TcitComponentProps.SetRootKey(Value: Int64);
begin
  FRootKey := Value;
end;

procedure TcitComponentProps.SetDefaultUser(Value: string);
begin
  FDefaultUser := StrUpper(PChar(Value));
end;

procedure TcitComponentProps.SetQuery(Value: TDataSet);
begin
  FQuery := Value;
end;

function TRootKeyProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paMultiSelect];
end;

procedure TRootKeyProperty.GetValues(Proc: TGetStrProc);
var
  i: integer;
  Values: TStringList;
begin
  Values := TStringList.Create;
  try
    GetValueList(Values);
    for i := 0 to Values.Count - 1 do
      Proc(Values[i]);
  finally
    Values.Free;
  end;
end;

procedure TRootKeyProperty.GetValueList(List: TStrings);
begin
  List.Clear;
  List.CommaText := 'HKEY_CLASSES_ROOT, HKEY_CURRENT_USER, HKEY_LOCAL_MACHINE,' +
    'HKEY_USERS, HKEY_PERFORMANCE_DATA, HKEY_CURRENT_CONFIG,' +
    'HKEY_DYN_DATA';
end;

function TRootKeyProperty.GetValue: string;
var
  i, RootKey: integer;
begin
  RootKey := GetOrdValue;
  Result := IntToStr(RootKey);

  for i := 0 to KeyNum - 1 do
    if RootKey = RootKeys[i] then Result := RootKeysStr[i];
end;

procedure TRootKeyProperty.SetValue(const Value: string);
var
  L, i: Longint;
begin
  for i := 0 to KeyNum - 1 do
    if RootKeysStr[i] = Value then
    begin
      SetOrdValue(RootKeys[i]);
      Exit;
    end;
  L := StrToInt(Value);
  with GetTypeData(GetPropType)^ do
    if (L < MinValue) or (L > MaxValue) then
      raise EPropertyError.CreateFmt('Value is out of range', [MinValue, MaxValue]);
  SetOrdValue(L);
end;

function TPropListProperty.GetValue: string;
begin
  if TStrings(GetOrdValue).Count > 0 then
    Result := inherited GetValue
  else
    Result := 'No properties';
end;

procedure TPropListProperty.Edit;
var
  PropListEditor: TPropListEditorDlg;
begin
  PropListEditor := TPropListEditorDlg.Create(Application);
  try
    PropListEditor.SourceForm := TComponent(GetComponent(0)).Owner; //Designer.Form;
    PropListEditor.Component := TComponent(GetComponent(0));
    PropListEditor.ShowModal;
    Modified;
  finally
    PropListEditor.Free;
  end;
end;

function TPropListProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog] - [paSubProperties];
end;

procedure TComponentPropsEditor.EditProperty(const PropertyEditor: IProperty; var Continue: Boolean);
var
  PropName: string;
begin
  PropName := PropertyEditor.GetName;
  if (CompareText(PropName, 'Properties') = 0) then
  begin
    PropertyEditor.Edit;
    Continue := False;
  end;
end;

function TComponentPropsEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

function TComponentPropsEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Edit Property List'
  else
    Result := '';
  end;
end;

procedure TComponentPropsEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then Edit;
end;

procedure Register;
begin
  RegisterComponents('Target', [TcitComponentProps]);
  RegisterComponentEditor(TcitComponentProps, TComponentPropsEditor);
  RegisterPropertyEditor(TypeInfo(TStrings), TcitComponentProps, 'Properties', TPropListProperty);
  RegisterPropertyEditor(TypeInfo(integer), TcitComponentProps, 'RootKey', TRootKeyProperty);
end;

procedure TcitComponentProps.SetUser(const Value: string);
begin
  FUser := Value;
end;

function TcitComponentProps.GetUserForQuery: string;
begin
  if FUser = '' then
    Result := 'user'
  else
    Result := '''' + FUser + '''';
end;

end.

