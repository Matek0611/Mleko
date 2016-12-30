unit comp_TargetFilter_BooleanFilter;

interface

uses
  math,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  stdctrls,extctrls,
  comp_TargetFilter_CustomFilter,
  TargetFilter_utils, variants;

type
  TBooleanConditionType = (bctNone,bctTrue,bctFalse,bctIsNull,bctIsNotNull);
  TBooleanConditionGroup = (bcgNone,bcgValue,bcgNull);
  TTargetFilter_BooleanFilter = class;
  TTargetFilter_BooleanFilter_OnBeforeGetString = procedure (Sender : TTargetFilter_BooleanFilter;
                                                             var ConditionType: TBooleanConditionType;
                                                             ConditionGroup : TBooleanConditionGroup)
                                                  of object;
  TTargetFilter_BooleanValueType = (tfb_String,tfb_Number);

TTargetFilter_BooleanFilter = class(TTargetFilter_CustomFilter)
  private
    fConditionType: TBooleanConditionType;
    Fa_True: string;
    Fa_False: string;
    fOnBeforeGetString: TTargetFilter_BooleanFilter_OnBeforeGetString;
    Fa_BooleanValueType: TTargetFilter_BooleanValueType;
    procedure SetConditionType(const Value: TBooleanConditionType);
    function GetConditionGroup: TBooleanConditionGroup;
    procedure SetConditionGroup(const Value: TBooleanConditionGroup);
    procedure Seta_False(const Value: string);
    procedure Seta_True(const Value: string);
    procedure Seta_BooleanValueType(
      const Value: TTargetFilter_BooleanValueType);
    { Private declarations }
  protected
    { Protected declarations }
    procedure LoadValue(V: Variant); override;
    function ParamCount : integer; override;
    property ConditionGroup : TBooleanConditionGroup read GetConditionGroup write SetConditionGroup;
    function FilterValid(aErrorType : TTargetFilter_ErrorType): boolean; override;
    function GetDatasetFilterStr: string; override;
    function GetFilterStr: string; override;
    function GetParamInfo: TTargetFilter_ParamInfo; override;
    procedure DoOnChangeCondition(Sender : TObject); override;
    function EditAreaMinWidth : integer; override;
    procedure FinishCreation; override;
    function GetInfo : string; override;
  public
    { Public declarations }
    function SetDefaultConditionTypeIfNone : boolean; override;
    constructor Create(AOwner:TComponent); override;
  published
    property a_ConditionType : TBooleanConditionType read fConditionType write SetConditionType default bctNone;
    property a_True  : string read Fa_True write Seta_True;
    property a_False : string read Fa_False write Seta_False;
    property a_OnBeforeGetString : TTargetFilter_BooleanFilter_OnBeforeGetString
      read fOnBeforeGetString write fOnBeforeGetString;
    property a_BooleanValueType : TTargetFilter_BooleanValueType read Fa_BooleanValueType write Seta_BooleanValueType;
    { Published declarations }
  end;
procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('TargetDB', [TTargetFilter_BooleanFilter]);
end;

{ TTargetFilter_BooleanFilter }

constructor TTargetFilter_BooleanFilter.Create(AOwner: TComponent);
  begin
    inherited;
    Height      := 20;
    Width       := 20;
    fConditionType := bctNone;
  end;

function TTargetFilter_BooleanFilter.GetParamInfo: TTargetFilter_ParamInfo;
  var
    lConditionType : TBooleanConditionType;
    QuoteStr       : string;
    E : extended;
    i : integer;
  begin
    InitTargetFilter_ParamInfo(Result);
    if not ReadyToGetFilterStr then begin
      exit;
    end;

    lConditionType := a_ConditionType;

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [bcgNone,bcgNull])
      then fOnBeforeGetString(self,lConditionType,ConditionGroup);

    Result.ParamFilterStr := GetColumn(true);
    case lConditionType of
      bctTrue      : Result.ParamFilterStr := Result.ParamFilterStr + ' = :' + a_ParamNames[0];
      bctFalse     : Result.ParamFilterStr := Result.ParamFilterStr + ' = :' + a_ParamNames[0];
      bctIsNull    : Result.ParamFilterStr := Result.ParamFilterStr + ' IS NULL';
      bctIsNotNull : Result.ParamFilterStr := Result.ParamFilterStr + ' IS NOT NULL';
      else Result.ParamFilterStr := '';
    end;

    if lConditionType in [bctTrue,bctFalse] then begin
      SetLength(Result.Params,ParamCount);
      for i := low(Result.Params) to high(Result.Params) do
        Result.Params[i].ParamName := a_ParamNames[i];

      if a_BooleanValueType = tfb_Number
        then begin
               Result.Params[0].ParamType := fptFloat;
               if lConditionType = bctTrue
                 then IsExtendedValue(a_True ,false,'',@E)
                 else IsExtendedValue(a_False,false,'',@E);
               Result.Params[0].ParamValue := E;
             end
        else begin
               Result.Params[0].ParamType  := fptString;
               if lConditionType = bctTrue
                 then Result.Params[0].ParamValue := a_True
                 else Result.Params[0].ParamValue := a_False;
             end;
    end;
  end;


function TTargetFilter_BooleanFilter.GetFilterStr: string;
  var
    lConditionType : TBooleanConditionType;

  function GetValueStr(V : String) : string;
    begin
      if a_BooleanValueType = tfb_Number
        then begin
               V      := PrepareSToConvertToFloat(V);
               Result := StringReplace(V,DecimalSeparator,'.',[]);
             end
        else Result := ''''+V+'''';
    end;

  begin
    if not ReadyToGetFilterStr then begin
      Result := '';
      exit;
    end;

    lConditionType := a_ConditionType;

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [bcgNone,bcgNull])
      then fOnBeforeGetString(self,lConditionType,ConditionGroup);

    Result := GetColumn(true);
    case lConditionType of
      bctTrue      : Result := Result + ' = ' + GetValueStr(a_True);
      bctFalse     : Result := Result + ' = ' + GetValueStr(a_False);
      bctIsNull    : Result := Result + ' IS NULL';
      bctIsNotNull : Result := Result + ' IS NOT NULL';
      else Result := '';
    end;
  end;

function TTargetFilter_BooleanFilter.GetDatasetFilterStr: string;
  var
    lConditionType : TBooleanConditionType;

  function GetValueStr(V : String) : string;
    begin
      if a_BooleanValueType = tfb_Number
        then begin
               V      := PrepareSToConvertToFloat(V);
               Result := StringReplace(V,DecimalSeparator,'.',[]);
             end
        else Result := ''''+V+'''';
    end;

  begin
    if not ReadyToGetFilterStr then begin
      Result := '';
      exit;
    end;

    lConditionType := a_ConditionType;

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [bcgNone,bcgNull])
      then fOnBeforeGetString(self,lConditionType,ConditionGroup);

    Result := PreQuot+a_b_FieldName+PostQuot;
    case lConditionType of
      bctTrue      : Result := Result + ' = ' + GetValueStr(a_True);
      bctFalse     : Result := Result + ' = ' + GetValueStr(a_False);
      bctIsNull    : Result := Result + ' = NULL';
      bctIsNotNull : Result := Result + ' <> NULL';
      else Result := '';
    end;
  end;


procedure TTargetFilter_BooleanFilter.SetConditionType(const Value: TBooleanConditionType);
  begin
    fConditionType := Value;
    if csLoading in ComponentState then exit;
    Condition_ComboBox.ItemIndex := integer(Value);
    ConditionGroup := ConditionGroup;
    UpdateFilterStr;
  end;

procedure TTargetFilter_BooleanFilter.DoOnChangeCondition(Sender: TObject);
  begin
    a_ConditionType := TBooleanConditionType(Condition_ComboBox.ItemIndex);
    inherited;
  end;

function TTargetFilter_BooleanFilter.EditAreaMinWidth: integer;
  begin
    Result := 0;
  end;

procedure TTargetFilter_BooleanFilter.FinishCreation;
 begin
   inherited;
   if Parent = nil then exit;
   With Condition_ComboBox do begin
     Items.Clear;
     Items.AddObject('выкл.',  TObject(0));
     Items.AddObject('да',     TObject(1));
     Items.AddObject('нет',    TObject(1));
     Items.AddObject('пусто',    TObject(2));
     Items.AddObject('заполнено',TObject(2));
     ItemIndex := Integer(fConditionType);
     OnChange(Condition_ComboBox);
   end;
 end;

function TTargetFilter_BooleanFilter.GetConditionGroup: TBooleanConditionGroup;
  begin
    Result := TBooleanConditionGroup(Condition_ComboBox.Items.Objects[Condition_ComboBox.ItemIndex]);
  end;

procedure TTargetFilter_BooleanFilter.SetConditionGroup(const Value: TBooleanConditionGroup);
  begin
    if csLoading in ComponentState then exit;
    //UpdateFilterStr;
  end;

procedure TTargetFilter_BooleanFilter.Seta_False(const Value: string);
  begin
    if (a_BooleanValueType = tfb_Number) then begin
      if not IsExtendedValue(Value,true,'(нечисловое значение FALSE в числовом режиме)') then exit;
    end;

    Fa_False := Trim(Value);
    UpdateFilterStr;
  end;

procedure TTargetFilter_BooleanFilter.Seta_True(const Value: string);
  begin
    if (a_BooleanValueType = tfb_Number) then begin
      if not IsExtendedValue(Value,true,'(нечисловое значение TRUE в числовом режиме)') then exit;
    end;

    Fa_True := Trim(Value);
    UpdateFilterStr;
  end;

function TTargetFilter_BooleanFilter.FilterValid(aErrorType : TTargetFilter_ErrorType): boolean;
  begin
    Result := false;
    if not Inherited FilterValid(aErrorType) then exit;
    case aErrorType of
      fetDesignTimeError: begin
                            if not (
                                   TrueThat(a_True  <> '', aErrorType,'Ќе указано представление дл€ значени€ ''ƒа'''#13+
                                                                      'ќбратитесь к разработчикам')
                                   and
                                   TrueThat(a_False <> '', aErrorType,'Ќе указано представление дл€ значени€ ''Ќет'''#13+
                                                                      'ќбратитесь к разработчикам')
                                   ) then exit;
                          end;
      fetRealTimeError  : begin
                          end;
    end;
    Result := true;
  end;

function TTargetFilter_BooleanFilter.GetInfo: string;
  begin
    Result := Inherited GetInfo + #13+
              'True : '+a_True+#13+
              'False : '+a_False;
  end;

procedure TTargetFilter_BooleanFilter.Seta_BooleanValueType(const Value: TTargetFilter_BooleanValueType);
  begin
    if (Value = tfb_Number) then begin
      if not (IsExtendedValue(a_True  ,true,'(нечисловое значение TRUE в числовом режиме)')
              and
              IsExtendedValue(a_False ,true,'(нечисловое значение FALSE в числовом режиме)')) then exit;
    end;

    Fa_BooleanValueType := Value;
    UpdateFilterStr;
  end;

function TTargetFilter_BooleanFilter.ParamCount: integer;
  begin
    Result := 1;
  end;

procedure TTargetFilter_BooleanFilter.LoadValue(V: Variant);
  var
    i : integer;
  begin
    if not VarIsArray(V) then exit;
    for i := VarArrayLowBound(V,1) to VarArrayHighBound(V,1) do
        case i of
        0 : begin
              if not (VarIsNull(V[i]) or VarIsEmpty(V[i]))
                then begin
                       if V[i] = fa_True
                         then a_ConditionType := bctTrue
                         else a_ConditionType := bctFalse;
                     end
                else begin
                       Condition_ComboBox.ItemIndex := 0;
                       Condition_ComboBox.OnChange(Condition_ComboBox);
                     end;
            end;
        end;
    if Condition_ComboBox.ItemIndex <> 0 then inherited;
  end;


function TTargetFilter_BooleanFilter.SetDefaultConditionTypeIfNone: boolean;
  begin
    if not Inherited SetDefaultConditionTypeIfNone then exit;
    a_ConditionType := bctNone;
  end;

initialization
  RegisterClass(TTargetFilter_BooleanFilter);
end.
