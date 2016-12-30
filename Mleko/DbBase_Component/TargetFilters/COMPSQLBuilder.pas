unit COMPSQLBuilder;

interface

uses
  Windows, Messages, SysUtils, Classes, comp_TargetFilter_Panel, DesignEditors,
  DesignIntf, TargetFilter_utils, DB;

type
  TGetStringEvent = function (Sender: TObject): string of object;
  TGetParamsEvent = procedure (Sender: TObject; var Params: Tparams) of object;
  TBuildedChangeEvent = procedure (Sender: TObject; Builded: boolean) of object;
  TBeforeRefreshEvent = procedure (Sender: TObject; aSQL: AnsiString; var Execute: boolean) of object;
  TChangeEvent = function (const aKeyFields: TStrings; var aKeyValues: TStrings): boolean of object;

  TTargetSQLBuilder = class(TComponent)
  private
    FSelect:  TStrings;
    FFrom:    TStrings;
    FWhere:   TStrings;
    FGroupBy: TStrings;
    FOrderBy: TStrings;
    FGetSelect:  TGetStringEvent;
    FGetFrom:    TGetStringEvent;
    FGetWhere:   TGetStringEvent;
    FGetGroupBy: TGetStringEvent;
    FGetOrderBy: TGetStringEvent;
    FGetParams:  TGetParamsEvent;
    FOnInsert: TChangeEvent;
    FOnUpdate: TChangeEvent;
    FOnDelete: TChangeEvent;
    FBuilded: boolean;
    FBuildedChange: TBuildedChangeEvent;
    FBeforeRefresh: TBeforeRefreshEvent;
    FFilterPanel: TTargetFilter_Panel;
    FQuery: TDataSet;
    FUseParams: boolean;
    FKeyFields: TStrings;
    FAutoLocate: boolean;
    FDebug: boolean;
    FParams: TParams;
    function LoadLocateData(UseNewLocate: boolean; var KeyString: AnsiString): Variant;
  protected
    procedure SetSelect(Value: TStrings);
    procedure SetFrom(Value: TStrings);
    procedure SetWhere(Value: TStrings);
    procedure SetGroupBy(Value: TStrings);
    procedure SetOrderBy(Value: TStrings);
    procedure SetQuery(Value: TDataSet);
    function GetSQL: AnsiString;
    procedure SetBuilded(Value: boolean);
    procedure SetKeyFields(Value: TStrings);
    procedure SetAutoLocate(Value: boolean);
    function  ExecChangeEvent(ChangeEvent: TChangeEvent): boolean;
  public
    NewLocateData: Variant;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Refresh: boolean; overload;
    function Refresh(aAutoLocate: boolean; aUseNewLocateInfo: boolean = false): boolean; overload;
    property SQL: AnsiString read GetSQL;
    property Builded: boolean read FBuilded write SetBuilded;
    procedure ItemInsert;
    procedure ItemUpdate;
    procedure ItemDelete;
    procedure CreateParams(aFilterParams: TTargetFilter_ParamRecArr);
    property Params: TParams read FParams;
  published
    property Select:  TStrings read FSelect  write SetSelect;
    property From:    TStrings read FFrom    write SetFrom;
    property Where:   TStrings read FWhere   write SetWhere;
    property GroupBy: TStrings read FGroupBy write SetGroupBy;
    property OrderBy: TStrings read FOrderBy write SetOrderBy;
    property OnGetSelect:  TGetStringEvent read FGetSelect  write FGetSelect;
    property OnGetFrom:    TGetStringEvent read FGetFrom    write FGetFrom;
    property OnGetWhere:   TGetStringEvent read FGetWhere   write FGetWhere;
    property OnGetGroupBy: TGetStringEvent read FGetGroupBy write FGetGroupBy;
    property OnGetOrderBy: TGetStringEvent read FGetOrderBy write FGetOrderBy;
    property OnGetParams:  TGetParamsEvent read FGetParams  write FGetParams;
    property OnBuildedChange: TBuildedChangeEvent read FBuildedChange write FBuildedChange;
    property OnInsert: TChangeEvent read FOnInsert write FOnInsert;
    property OnUpdate: TChangeEvent read FOnUpdate write FOnUpdate;
    property OnDelete: TChangeEvent read FOnDelete write FOnDelete;
    property BeforeRefresh: TBeforeRefreshEvent read FBeforeRefresh write FBeforeRefresh;
    property FilterPanel: TTargetFilter_Panel read FFilterPanel write FFilterPanel;
    property Query: TDataSet read FQuery write SetQuery;
    property UseParams: boolean read FUseParams write FUseParams default false;
    property KeyFields: TStrings read FKeyFields write SetKeyFields;
    property AutoLocate: boolean read FAutoLocate write SetAutoLocate;
    property Debug: boolean read FDebug write FDebug default false;
end;

TSQLBuilderEditor = class(TDefaultEditor)
  protected
    procedure EditProperty(const Prop: IProperty; var Continue: Boolean); override;
  public
    procedure Edit; override;
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;


procedure Register;

implementation

uses
    COMPSQLBuilderDlg, Forms, Controls, ADODB, COMPSQLBuilderDebug, Variants, Dialogs,
    TypInfo;


constructor TTargetSQLBuilder.Create(AOwner: TComponent);
begin
    inherited;
    FSelect    := TStringList.Create;
    FFrom      := TStringList.Create;
    FWhere     := TStringList.Create;
    FGroupBy   := TStringList.Create;
    FOrderBy   := TStringList.Create;
    FKeyFields := TStringList.Create;
    FParams    := TParams.Create;
    FBuilded   := False;
end;

destructor TTargetSQLBuilder.Destroy;
begin
    FreeAndNil(FSelect);
    FreeAndNil(FFrom);
    FreeAndNil(FWhere);
    FreeAndNil(FGroupBy);
    FreeAndNil(FOrderBy);
    FreeAndNil(FKeyFields);
    FreeAndNil(FParams);
    inherited;
end;

function TTargetSQLBuilder.Refresh: boolean;
begin
    Result := Refresh(AutoLocate);
end;

function TTargetSQLBuilder.Refresh(aAutoLocate: boolean; aUseNewLocateInfo: boolean = false): boolean;
type
    TPBNProc = function(const Value: String): Pointer;
var
    IsLocate: boolean;
    IsExecute: boolean;
    i: integer;
    KeyString: AnsiString;
    KeyValues: Variant;
    KeysCount: integer;
    OParams: TParams;
    OSQL: TStrings;
begin
    Result := false;
    IsLocate := aAutoLocate and AutoLocate;
    IsExecute := true;
    //Получение параметров для Locate
    if IsLocate and (Query.Active or aUseNewLocateInfo) then begin
        KeyValues := LoadLocateData(aUseNewLocateInfo, KeyString);
    {
        KeyString := '';
        KeyValues := VarArrayCreate([0, KeyFields.Count - 1], varVariant);
        for i:=0 to KeyFields.Count - 1 do begin
            KeyString := KeyString + KeyFields[i];
            KeyValues[i] := Query.FieldByName(KeyFields[i]).Value;
            if i <> KeyFields.Count - 1 then KeyString := KeyString + ';';
        end;
    }
    end else IsLocate := false;
    KeysCount := KeyFields.Count;

    //Событие перед выполнением
    if Assigned(BeforeRefresh) then BeforeRefresh(Self, SQL, IsExecute);

    //Выполнение SQL
    if Assigned(Query) and IsExecute then begin
        if Debug then begin
            TCOMPSQLBuilderDebugDlg.ShowDebug(SQL);
        end;
        if Query.ClassNameIs('TORAQuery') then begin
            OSQL := (GetObjectProp(Query, 'SQL') as TStrings);
            OSQL.Text := SQL;
            if UseParams then begin
                OParams := (GetObjectProp(Query, 'PARAMS') as TParams);
                for i:= Low(FilterPanel.ParamInfo.Params) to High(FilterPanel.ParamInfo.Params) do begin
                    if FilterPanel.ParamInfo.Params[i].ParamType = fptString then
                        OParams.ParamByName(FilterPanel.ParamInfo.Params[i].ParamName).AsString := FilterPanel.ParamInfo.Params[i].ParamValue;
                    if FilterPanel.ParamInfo.Params[i].ParamType = fptFloat then
                        OParams.ParamByName(FilterPanel.ParamInfo.Params[i].ParamName).AsFloat := FilterPanel.ParamInfo.Params[i].ParamValue;
                    if FilterPanel.ParamInfo.Params[i].ParamType = fptDate then
                        OParams.ParamByName(FilterPanel.ParamInfo.Params[i].ParamName).AsDateTime := FilterPanel.ParamInfo.Params[i].ParamValue;
                end;
            end;
            Query.Open;
            if IsLocate then begin
                Query.Locate(KeyString, KeyValues, []);
            end;
            Result := true;
        end;
        if Query.ClassNameIs('TADOQuery') then begin
            if (Query as TADOQuery).Active then (Query as TADOQuery).Close;
            (Query as TADOQuery).SQL.Text := SQL;
            if UseParams then begin
                for i:= Low(FilterPanel.ParamInfo.Params) to High(FilterPanel.ParamInfo.Params) do begin
                    if FilterPanel.ParamInfo.Params[i].ParamType = fptString then
                        (Query as TADOQuery).Parameters.ParamByName(FilterPanel.ParamInfo.Params[i].ParamName).Value := FilterPanel.ParamInfo.Params[i].ParamValue;
                    if FilterPanel.ParamInfo.Params[i].ParamType = fptFloat then
                        (Query as TADOQuery).Parameters.ParamByName(FilterPanel.ParamInfo.Params[i].ParamName).Value := FilterPanel.ParamInfo.Params[i].ParamValue;
                    if FilterPanel.ParamInfo.Params[i].ParamType = fptDate then
                        (Query as TADOQuery).Parameters.ParamByName(FilterPanel.ParamInfo.Params[i].ParamName).Value := FilterPanel.ParamInfo.Params[i].ParamValue;
                end;
            end;
            (Query as TADOQuery).Open;
            if IsLocate then begin
                if KeysCount = 1 then
                    (Query as TADOQuery).Locate(KeyString, KeyValues[0], [])
                else
                    (Query as TADOQuery).Locate(KeyString, KeyValues, []);
            end;
            Result := true;
        end;
    end;
end;

procedure TTargetSQLBuilder.SetSelect(Value: TStrings);
begin
    FSelect.Assign(Value);
end;

procedure TTargetSQLBuilder.SetFrom(Value: TStrings);
begin
    FFrom.Assign(Value);
end;

procedure TTargetSQLBuilder.SetWhere(Value: TStrings);
begin
    FWhere.Assign(Value);
end;

procedure TTargetSQLBuilder.SetGroupBy(Value: TStrings);
begin
    FGroupBy.Assign(Value);
end;

procedure TTargetSQLBuilder.SetOrderBy(Value: TStrings);
begin
    FOrderBy.Assign(Value);
end;

procedure TTargetSQLBuilder.SetBuilded(Value: boolean);
var
    b: boolean;
begin
    b := FBuilded <> Value;
    FBuilded := Value;
    if b and Assigned(FBuildedChange) then
        FBuildedChange(Self, FBuilded);
end;

procedure TTargetSQLBuilder.SetKeyFields(Value: TStrings);
begin
    FKeyFields.Assign(Value);
end;

procedure TTargetSQLBuilder.SetAutoLocate(Value: boolean);
begin
    if not Value then FAutoLocate := false
    else
        if KeyFields.Count > 0 then
            FAutoLocate := true
        else begin
            FAutoLocate := false;
            raise Exception.Create('Не определены ключевые поля. Автоматический поиск невозможен.');
        end

end;

procedure TTargetSQLBuilder.SetQuery(Value: TDataSet);
begin
  FQuery := Value;
end;

function TTargetSQLBuilder.GetSQL: AnsiString;
var
    s: string;
    IsWhere: boolean;
begin
    FParams.Clear;
    if Assigned(FGetParams) then FGetParams(Self, FParams);
    // Select ------------------------------------------------------------------
    if Assigned(FGetSelect) then Result := Result + 'SELECT ' + FGetSelect(Self)
    else                         Result := Result + 'SELECT ' + FSelect.Text;
    // From --------------------------------------------------------------------
    if Assigned(FGetFrom) then Result := Result + ' FROM ' + FGetFrom(Self)
    else                       Result := Result + ' FROM ' + FFrom.Text;
    // Where -------------------------------------------------------------------
    IsWhere := True;
    if Assigned(FGetWhere) then s := FGetWhere(Self)
    else                        s := FWhere.Text;
    if s <> '' then
    begin
        Result := Result + ' WHERE ' + s;
        IsWhere := False;
    end;
    // Filters -----------------------------------------------------------------
    if Assigned(FilterPanel) then
        if UseParams then begin
            s := FilterPanel.ParamInfo.ParamFilterStr;
            CreateParams(FilterPanel.ParamInfo.Params);
        end else s := FilterPanel.a_FilterStr
    else
        s := '';
    if s <> '' then
        if IsWhere then Result := Result + ' WHERE ' + s
        else            Result := Result + ' AND ' + s;
    // Group By -----------------------------------------
    if Assigned(FGetGroupBy) then s:= FGetGroupBy(Self)
    else                          s:= FGroupBy.Text;
    if (s <> '') and (s <> #$D#$A) then Result := Result + ' GROUP BY ' + s;
    // Order By -----------------------------------------
    if Assigned(FGetOrderBy) then s:= FGetOrderBy(Self)
    else                          s:= FOrderBy.Text;
    if (s <> '') and (s <> #$D#$A) then Result := Result + ' ORDER BY ' + s;
    //  Result := Result + '/* END ' + Name + ' */'#$D#$A;
end;

procedure TTargetSQLBuilder.ItemInsert;
begin
    if ExecChangeEvent(FOnInsert) then Refresh(AutoLocate, true);
end;

procedure TTargetSQLBuilder.ItemUpdate;
begin
    if ExecChangeEvent(FOnUpdate) then Refresh(AutoLocate, true);
end;

procedure TTargetSQLBuilder.ItemDelete;
begin
    if ExecChangeEvent(FOnDelete) then Refresh(AutoLocate, true);
end;

function TTargetSQLBuilder.LoadLocateData(UseNewLocate: boolean; var KeyString: AnsiString): Variant;
var
    i: integer;
begin
    KeyString := '';
    for i:=0 to KeyFields.Count - 1 do begin
        KeyString := KeyString + KeyFields[i];
        if i <> KeyFields.Count - 1 then KeyString := KeyString + ';';
    end;
    if not UseNewLocate then begin
        Result := VarArrayCreate([0, KeyFields.Count - 1], varVariant);
        for i:=0 to KeyFields.Count - 1 do begin
            Result[i] := Query.FieldByName(KeyFields[i]).Value;
        end;
    end else Result := NewLocateData;
end;

function TTargetSQLBuilder.ExecChangeEvent(ChangeEvent: TChangeEvent): boolean;
var
    aKeyValues: TStrings;
    i: integer;
begin
    Result := false;
    aKeyValues := TStringList.Create;
    try
        for i:=0 to KeyFields.Count - 1 do
            aKeyValues.Add(Query.FieldByName(KeyFields.Strings[i]).AsString);
        if Assigned(FOnInsert) and Query.Active then begin
            if ChangeEvent(KeyFields, aKeyValues) then begin
                Result := true;
                NewLocateData := VarArrayCreate([0, KeyFields.Count - 1], varVariant);
                for i:=0 to KeyFields.Count - 1 do begin
                    NewLocateData[i] := Query.FieldByName(KeyFields[i]).Value;
                end;
            end;
        end;
    finally
        FreeAndNil(aKeyValues);
    end;
end;

procedure TTargetSQLBuilder.CreateParams(aFilterParams: TTargetFilter_ParamRecArr);
var
  i: integer;
begin
  for i:= Low(aFilterParams) to High(aFilterParams) do begin
      if aFilterParams[i].ParamType = fptString then
          with FParams.CreateParam(ftString, aFilterParams[i].ParamName, ptInput) do AsString := aFilterParams[i].ParamValue;
      if aFilterParams[i].ParamType = fptFloat then
          with FParams.CreateParam(ftFloat, aFilterParams[i].ParamName, ptInput) do AsFloat := aFilterParams[i].ParamValue;
      if aFilterParams[i].ParamType = fptDate then
          with FParams.CreateParam(ftDateTime, aFilterParams[i].ParamName, ptInput) do AsDateTime := aFilterParams[i].ParamValue;
  end;
end;

procedure TSQLBuilderEditor.Edit;
var
  Dlg : TSQLDlg;
  P   : TControl;
  i   : integer;
  I_D : IDesigner;
begin
  Dlg := TSQLDlg.Create(Application);
  with TTargetSQLBuilder(GetComponent), Dlg do
    try
      MemoSelect.Lines.Assign(Select);
      MemoFrom.Lines.Assign(From);
      MemoWhere.Lines.Assign(Where);
      MemoOrderBy.Lines.Assign(OrderBy);
      MemoGroupBy.Lines.Assign(GroupBy);
      if ShowModal = mrOK then
      begin
        Select.Assign(MemoSelect.Lines);
        From.Assign(MemoFrom.Lines);
        Where.Assign(MemoWhere.Lines);
        OrderBy.Assign(MemoOrderBy.Lines);
        GroupBy.Assign(MemoGroupBy.Lines);
        if Self.Designer <> nil then Self.Designer.Modified;
      end;
    finally
      FreeAndNil(Dlg);
    end;
end;

procedure TSQLBuilderEditor.EditProperty(const Prop: IProperty; var Continue: Boolean);
begin
    Prop.Edit;
    Continue := False;
end;

function TSQLBuilderEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

function TSQLBuilderEditor.GetVerb(Index: Integer): string;
begin
    case Index of
        0:   Result := 'Edit SQL Query'
        else Result := '';
    end;
end;

procedure TSQLBuilderEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then Edit;
end;

procedure Register;
begin
    RegisterComponents('TargetDB', [TTargetSQLBuilder]);
    RegisterComponentEditor(TTargetSQLBuilder, TSQLBuilderEditor);
end;

end.
