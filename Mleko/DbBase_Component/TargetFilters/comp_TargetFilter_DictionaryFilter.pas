unit comp_TargetFilter_DictionaryFilter;

interface

uses
  math,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  stdctrls,extctrls,
  comp_TargetFilter_CustomFilter,
  TargetFilter_utils,
  buttons,
  variants;

type
  TDictionaryConditionType = (dtctNone,dtctE,dtctNE,dtctIsNull,dtctIsNotNull);
  TDictionaryConditionGroup = (dtcgNone,dtcgValue,dtcgNull);

  TTargetFilter_DictionaryFilter = class;
  TTargetFilter_DictionaryFilter_OnBeforeGetString = procedure (Sender : TTargetFilter_DictionaryFilter;
                                                                ConditionType: TDictionaryConditionType;
                                                                ConditionGroup : TDictionaryConditionGroup;
                                                                var Rec_PK : variant)
                                                  of object;

  TTargetFilter_DictionaryFilter_OnSelectValue = function (Sender : TTargetFilter_DictionaryFilter;
                                                            BtnBoundsRect : TRect;
                                                            ConditionType: TDictionaryConditionType;
                                                            ConditionGroup : TDictionaryConditionGroup;
                                                            var Rec_PK,Rec_Title : variant) : boolean
                                                  of object;

  TTargetFilter_DictionaryFilter = class(TTargetFilter_CustomFilter)
  private
    fRec_PK    : variant;
    fRec_Title : variant;
    Title_Edit,Code_Edit     : TEdit;
    btSelect : TSpeedButton;

    fConditionType: TDictionaryConditionType;
    fOnBeforeGetString: TTargetFilter_DictionaryFilter_OnBeforeGetString;
    fOnSelectValue : TTargetFilter_DictionaryFilter_OnSelectValue;
    Fa_Title_TabStop: boolean;
    procedure SetConditionType(const Value: TDictionaryConditionType);
    function GetConditionGroup: TDictionaryConditionGroup;
    procedure SetConditionGroup(const Value: TDictionaryConditionGroup);
    function GetCodeEditWidth: integer;
    procedure SetCodeEditWidth(const Value: integer);
    function Geta_Text: string;
    function Geta_Value: Variant;
    procedure SetA_Text(const Value: string);
    procedure SetA_Value(const Value: Variant);
    procedure Seta_Title_TabStop(const Value: boolean);
    { Private declarations }
  protected
    { Protected declarations }
    function ParamCount : integer; override;
    function GetParamInfo: TTargetFilter_ParamInfo; override;

    function GetFilterStr: string; override;
    function GetDatasetFilterStr : string; override;
    function FilterActive : boolean; override;
    function FilterValid(aErrorType : TTargetFilter_ErrorType): boolean; override;

    function GetEditAreaHeight: integer; override;
    procedure SetEditAreaBounds(aLeft,aTop,aWidth : integer); override;
    procedure DoOnChangeCondition(Sender : TObject); override;
    procedure DoOnClick(Sender : TObject);
    procedure DoOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState); override;
    procedure FinishCreation; override;
    property ConditionGroup : TDictionaryConditionGroup read GetConditionGroup write SetConditionGroup;
    procedure UpdateControlStatus; override;
  public
    { Public declarations }
    function SetDefaultConditionTypeIfNone: boolean; override;
    constructor Create(AOwner:TComponent); override;
    procedure LoadValue(V: Variant); override;
    procedure UpdateInterface;
    property a_Value : Variant read Geta_Value write SetA_Value;
    property a_Text  : string read Geta_Text write SetA_Text;
  published
    property a_Title_TabStop: boolean read Fa_Title_TabStop write Seta_Title_TabStop default false;
    property a_ConditionType : TDictionaryConditionType read fConditionType write SetConditionType default dtctNone;
    property a_OnBeforeGetString : TTargetFilter_DictionaryFilter_OnBeforeGetString
      read fOnBeforeGetString write fOnBeforeGetString;
    property a_OnSelectValue : TTargetFilter_DictionaryFilter_OnSelectValue
      read fOnSelectValue write fOnSelectValue;
    property a_CodeEdit_Width : integer read GetCodeEditWidth write SetCodeEditWidth;
    property a_EditAreaMinWidth default 160;
    { Published declarations }
  end;
procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('TargetDB', [TTargetFilter_DictionaryFilter]);
end;

{ TTargetFilter_DictionaryFilter }

procedure TTargetFilter_DictionaryFilter.LoadValue(V: Variant);
  var
    i : integer;
  begin
    if not VarIsArray(V) then exit;
    for i := VarArrayLowBound(V,1) to VarArrayHighBound(V,1) do
      case i of
      0 : begin
            if not (VarIsNull(V[i]) or VarIsEmpty(V[i]))
              then fRec_Pk    := V[i]
              else begin
                     Condition_ComboBox.ItemIndex := 0;
                     Condition_ComboBox.OnChange(Condition_ComboBox);
                   end;
          end;
      1 : begin
            if not (VarIsNull(V[i]) or VarIsEmpty(V[i]))
              then fRec_Title := V[i];
          end;
      end;
    UpdateInterface;
    if Condition_ComboBox.ItemIndex <> 0 then Inherited;
  end;

procedure TTargetFilter_DictionaryFilter.UpdateInterface;
  begin
    if VarIsNull(fRec_Title) or VarIsEmpty(fRec_Title)
      then Title_Edit.Text := ''
      else Title_Edit.Text := fRec_Title;
    if VarIsNull(fRec_PK) or VarIsEmpty(fRec_PK)
      then Code_Edit.Text := ''
      else Code_Edit.Text := fRec_PK;
    if (a_ConditionType = dtctNone) and (Code_Edit.Text <> '')
      then a_ConditionType := dtctE
      else UpdateFilterStr;
  end;

constructor TTargetFilter_DictionaryFilter.Create(AOwner: TComponent);
  begin
    inherited;
    Height      := 20;
    fConditionType := dtctNone;

    Title_Edit := TEdit.Create(self);
    With Title_Edit do begin
      AutoSize := false;
      Parent   := self;
      Width    := 80;
      ReadOnly := true;
      Color    := clBtnFace;
      TabStop  := false;
      ParentShowHint := true;
      OnKeyDown := DoOnKeyDown;
    end;

    Code_Edit := TEdit.Create(self);
    With Code_Edit do begin
      Parent   := self;
      AutoSize := false;
      ReadOnly := true;
      Color    := clBtnFace;
      TabStop  := false;
      ParentShowHint := true;
      OnKeyDown := DoOnKeyDown;
    end;

    btSelect := TSpeedButton.Create(self);
    with btSelect do begin
      Parent    := self;
      OnClick   := DoOnClick;
      Flat      := true;
      ParentShowHint := true;
    end;
    btSelect.Glyph.LoadFromResourceName(HInstance,'TARGETFILTER_DOWNARROW');
    btSelect.Hint := 'Выбрать значение из списка (F4)';
    AddDontChangeHintControls(btSelect);

    a_EditAreaMinWidth := 160;
  end;

function TTargetFilter_DictionaryFilter.GetFilterStr: string;
  var
    lRec_PK : variant;
  begin
    if not ReadyToGetFilterStr then begin
      Result := '';
      exit;
    end;

    lRec_PK := fRec_PK;

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [dtcgNone,dtcgNull])
      then fOnBeforeGetString(self,a_ConditionType,ConditionGroup,lRec_PK);

    case a_ConditionType of
      dtctE    : if VarIsStr(lRec_PK)
                  then Result := GetColumn(true) + ' = ' + ''''+lRec_PK+''''
                  else Result := GetColumn(true) + ' = ' + VarToStr(lRec_PK);
      dtctNE   : if VarIsStr(lRec_PK)
                  then Result := GetColumn(true) + ' <> ' + ''''+lRec_PK+''''
                  else Result := GetColumn(true) + ' <> ' + VarToStr(lRec_PK);
      dtctIsNull    : Result := GetColumn(true) + ' IS NULL';
      dtctIsNotNull : Result := GetColumn(true) + ' IS NOT NULL';
    end;
  end;

function TTargetFilter_DictionaryFilter.GetDatasetFilterStr: string;
  var
    lRec_PK : variant;
  begin
    if not ReadyToGetFilterStr then begin
      Result := '';
      exit;
    end;

    lRec_PK := fRec_PK;

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [dtcgNone,dtcgNull])
      then fOnBeforeGetString(self,a_ConditionType,ConditionGroup,lRec_PK);

    Result := PreQuot+a_b_FieldName+PostQuot;
    case a_ConditionType of
      dtctE    : if VarIsStr(lRec_PK)
                  then Result := Result + ' = ' + ''''+lRec_PK+''''
                  else Result := Result + ' = ' + VarToStr(lRec_PK);
      dtctNE   : if VarIsStr(lRec_PK)
                  then Result := Result + ' <> ' + ''''+lRec_PK+''''
                  else Result := Result + ' <> ' + VarToStr(lRec_PK);
      dtctIsNull    : Result := Result + ' = NULL';
      dtctIsNotNull : Result := Result + ' <> NULL';
    end;
  end;


function TTargetFilter_DictionaryFilter.FilterValid(aErrorType : TTargetFilter_ErrorType): boolean;
  begin
    Result := false;
    if not Inherited FilterValid(aErrorType) then exit;
    case aErrorType of
      fetDesignTimeError: begin
                          end;
      fetRealTimeError  : begin
                            case ConditionGroup of
                               dtcgValue: {if not TrueThat(not VarIsNull(fRec_PK) and not VarIsEmpty(fRec_PK),
                                                          aErrorType,'Не указан код для значения из справочника!') then exit};
                            end;
                          end;
    end;
    Result := true;
  end;

function TTargetFilter_DictionaryFilter.GetEditAreaHeight: integer;
  begin
    Result := Max(Condition_ComboBox.Height,Title_Edit.Height);
  end;

procedure TTargetFilter_DictionaryFilter.SetEditAreaBounds(aLeft,aTop,aWidth : integer);
  var
    btAreaWidth   : integer;
    EditAreaWidth : integer;
  begin
    btAreaWidth := btSelect.Width + 3;
    btSelect  .SetBounds(aLeft + aWidth - btAreaWidth+2,aTop,btSelect.Width,btSelect.Height);

    Code_Edit .SetBounds(aLeft + aWidth-2-a_CodeEdit_Width-btAreaWidth,aTop,
                         a_CodeEdit_Width,
                         Code_Edit .Height);
    Title_Edit.SetBounds(aLeft,aTop,aWidth - 4 - a_CodeEdit_Width - btAreaWidth,Title_Edit.Height);
  end;

procedure TTargetFilter_DictionaryFilter.SetConditionType(const Value: TDictionaryConditionType);
  begin
    fConditionType := Value;
    if csLoading in ComponentState then exit;
    Condition_ComboBox.ItemIndex := integer(Value);
    ConditionGroup := ConditionGroup;
    UpdateFilterStr;
  end;

procedure TTargetFilter_DictionaryFilter.DoOnChangeCondition(Sender: TObject);
  begin
    a_ConditionType := TDictionaryConditionType(Condition_ComboBox.ItemIndex);
    inherited;
  end;

procedure TTargetFilter_DictionaryFilter.FinishCreation;
 begin
   inherited;
   if Parent = nil then exit;
   With Condition_ComboBox do begin
     Items.Clear;
     Items.AddObject('выкл.',    TObject(dtcgNone));
     Items.AddObject('равно',    TObject(dtcgValue));
     Items.AddObject('не равно', TObject(dtcgValue));
     Items.AddObject('пусто',    TObject(dtcgNull));
     Items.AddObject('заполнено',TObject(dtcgNull));
     ItemIndex := Integer(fConditionType);
     OnChange(Condition_ComboBox);
   end;
   Title_Edit.Height := Condition_ComboBox.Height;
   Code_Edit .Height := Condition_ComboBox.Height;
   btSelect  .Height := Condition_ComboBox.Height;
 end;

function TTargetFilter_DictionaryFilter.GetConditionGroup: TDictionaryConditionGroup;
  begin
    Result := TDictionaryConditionGroup(Condition_ComboBox.Items.Objects[Condition_ComboBox.ItemIndex]);
  end;

procedure TTargetFilter_DictionaryFilter.SetConditionGroup(const Value: TDictionaryConditionGroup);
  begin
    if csLoading in ComponentState then exit;
    //SetControlStatus(Title_Edit,true,true);
    //SetControlStatus(Code_Edit ,false,true);
    //UpdateFilterStr;
    UpdateControlStatus;
  end;

procedure TTargetFilter_DictionaryFilter.UpdateControlStatus;
  begin
    Inherited;
    btSelect.Enabled := (ConditionGroup = dtcgValue) and Enabled and Assigned(fOnSelectValue);
  end;

procedure TTargetFilter_DictionaryFilter.DoOnClick(Sender: TObject);
  begin
    if Assigned(fOnSelectValue) then begin
      if fOnSelectValue(self,btSelect.BoundsRect,
                     a_ConditionType,ConditionGroup,
                     fRec_PK,fRec_Title) then begin
        UpdateInterface;
      end;
    end;
  end;

function TTargetFilter_DictionaryFilter.GetCodeEditWidth: integer;
  begin
    Result := Code_Edit.Width;
  end;

procedure TTargetFilter_DictionaryFilter.SetCodeEditWidth(const Value: integer);
  begin
    Code_Edit.Width := Value;
    PositionEditArea;
  end;

procedure TTargetFilter_DictionaryFilter.DoOnKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
  begin
    if (Key = vk_F4) and (Shift = []) then begin
      Key := 0;
      btSelect.Click;
      exit;
    end;
    if (Key = vk_Delete) and (Shift = []) then begin
      fRec_Pk    := Null;
      fRec_Title := '';
      UpdateInterface;
      exit;
    end;
    inherited;
  end;

function TTargetFilter_DictionaryFilter.GetParamInfo: TTargetFilter_ParamInfo;
  var
    i : Integer;
    lRec_PK : variant;
    RealParamCount : integer;

  procedure SetRes(aResult_ParamFilterStr : string;
                   aRealParamCount : integer;
                   V : Variant;
                   ParamIsString : boolean);
    begin
      Result.ParamFilterStr := aResult_ParamFilterStr;
      Result.Params[0].ParamValue := V;
      if ParamIsString
        then Result.Params[0].ParamType := fptString
        else Result.Params[0].ParamType := fptFloat;
      RealParamCount := aRealParamCount;
    end;

  begin
    InitTargetFilter_ParamInfo(Result);
    if not ReadyToGetFilterStr then begin
      exit;
    end;

    lRec_PK := fRec_PK;

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [dtcgNone,dtcgNull])
      then fOnBeforeGetString(self,a_ConditionType,ConditionGroup,lRec_PK);

    SetLength(Result.Params,ParamCount);
    case a_ConditionType of
      dtctE         : SetRes(GetColumn(true) + ' =  :' + a_ParamNames[0],1,lRec_PK,VarIsStr(lRec_PK));
      dtctNE        : SetRes(GetColumn(true) + ' != :' + a_ParamNames[0],1,lRec_PK,VarIsStr(lRec_PK));
      dtctIsNull    : SetRes(GetColumn(true) + ' IS NULL'                   ,0,Null   ,false);
      dtctIsNotNull : SetRes(GetColumn(true) + ' IS NOT NULL'               ,0,Null   ,false);
    end;

    SetLength(Result.Params,RealParamCount);
    for i := low(Result.Params) to high(Result.Params)
      do Result.Params[i].ParamName := a_ParamNames[i];
  end;

function TTargetFilter_DictionaryFilter.ParamCount: integer;
  begin
    Result := 1;
  end;

function TTargetFilter_DictionaryFilter.SetDefaultConditionTypeIfNone: boolean;
begin
  if not Inherited SetDefaultConditionTypeIfNone then exit;
  a_ConditionType := dtctE;
end;

function TTargetFilter_DictionaryFilter.FilterActive: boolean;
  begin
    Result := Inherited FilterActive;
    if not Result then exit;
    case ConditionGroup of
       dtcgValue: Result := not (VarIsNull(fRec_PK) or VarIsEmpty(fRec_Pk));
       else Result := false;
    end;
  end;

function TTargetFilter_DictionaryFilter.Geta_Text: string;
begin
  Result := fRec_Title;
end;

function TTargetFilter_DictionaryFilter.Geta_Value: Variant;
begin
  Result := fRec_Pk;
end;

procedure TTargetFilter_DictionaryFilter.SetA_Text(const Value: string);
begin
  fRec_Title := Value;
  UpdateInterface;
end;

procedure TTargetFilter_DictionaryFilter.SetA_Value(const Value: Variant);
begin
  fRec_Pk := Value;
  UpdateInterface;
end;

procedure TTargetFilter_DictionaryFilter.Seta_Title_TabStop(
  const Value: boolean);
begin
  Fa_Title_TabStop := Value;
  Title_Edit.TabStop := Fa_Title_TabStop;
end;

initialization
  RegisterClass(TTargetFilter_DictionaryFilter);
end.
