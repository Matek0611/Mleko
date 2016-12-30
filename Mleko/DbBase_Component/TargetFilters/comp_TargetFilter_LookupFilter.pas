unit comp_TargetFilter_LookupFilter;

interface

uses
  math,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  stdctrls,extctrls,db,
  comp_TargetFilter_CustomFilter,
  TargetFilter_utils,
  buttons,
  variants,
  comp_Target_DBCtrls;

type
  TLookupConditionType = (lctNone,lctE,lctNE,lctIsNull,lctIsNotNull);
  TLookupConditionGroup = (lcgNone,lcgValue,lcgNull);

  TTargetFilter_LookupFilter = class;
  TTargetFilter_LookupFilter_OnBeforeGetString = procedure (Sender : TTargetFilter_LookupFilter;
                                                                ConditionType: TLookupConditionType;
                                                                ConditionGroup : TLookupConditionGroup;
                                                                var Rec_PK : variant)
                                                  of object;

  TTargetFilter_LookupFilter_OnSelectValue = function (Sender : TTargetFilter_LookupFilter;
                                                            BtnBoundsRect : TRect;
                                                            ConditionType: TLookupConditionType;
                                                            ConditionGroup : TLookupConditionGroup;
                                                            var Rec_PK,Rec_Title : variant) : boolean
                                                  of object;

  TTargetFilter_LookupFilter_OnBeforeGetStringEx = procedure (Sender : TTargetFilter_LookupFilter;
                                                              ClientFilter : boolean;
                                                              var ConditionType: TLookupConditionType;
                                                              ConditionGroup : TLookupConditionGroup;
                                                              var Rec_PK : variant)
                                                  of object;


  TTargetFilter_LookupFilter_OnAfterGetString = function (Sender : TTargetFilter_LookupFilter;
                                                          ClientFilter : boolean;
                                                          ConditionType: TLookupConditionType;
                                                          ConditionGroup : TLookupConditionGroup;
                                                          Rec_PK : variant;
                                                          FilterStr : string) : string
                                                of object;

  TTargetFilter_LookupFilter = class(TTargetFilter_CustomFilter)
  private
    Fa_OnAfterGetString: TTargetFilter_LookupFilter_OnAfterGetString;
    Fa_OnBeforeGetStringEx: TTargetFilter_LookupFilter_OnBeforeGetStringEx;
    function GetfRec_PK: Variant;
    procedure SetfRec_PK(const Value: Variant);
    procedure SetOnSelectValue(
      const Value: TTargetFilter_LookupFilter_OnSelectValue);
    function Geta_FilterOnDropDown: string;
    procedure Seta_FilterOnDropDown(const Value: string);
    function Geta_AutoHint: boolean;
    procedure Seta_AutoHint(const Value: boolean);
    function Geta_DropDownWidth: integer;
    procedure Seta_DropDownWidth(const Value: integer);
    function GetKeyValue: Variant;
    procedure SetKeyValue(const Value: Variant);
    function GetA_NullText: string;
    procedure SetA_NullText(const Value: string);
  public
    function SetDefaultConditionTypeIfNone: boolean; override;
    function GetEditControlCount: integer; override;
    function GetEditControl(i: integer; outVisualColumn : Pointer = nil): TWinControl; override;
  private
    LookupCombo : TTarget_DBLookupComboBox;
    btSelect : TSpeedButton;

    fConditionType: TLookupConditionType;
    fOnBeforeGetString: TTargetFilter_LookupFilter_OnBeforeGetString;
    fOnSelectValue : TTargetFilter_LookupFilter_OnSelectValue;
    property fRec_PK : Variant read GetfRec_PK write SetfRec_PK;
    procedure SetConditionType(const Value: TLookupConditionType);
    function CalcConditionGroup  (in_ConditionType : TLookupConditionType): TLookupConditionGroup;
    function GetConditionGroup: TLookupConditionGroup;
    procedure SetConditionGroup(const Value: TLookupConditionGroup);
    function Geta_KeyField: string;
    function Geta_ListField: string;
    function Geta_ListFieldIndex: integer;
    function Geta_ListSource: TDataSource;
    procedure Seta_KeyField(const Value: string);
    procedure Seta_ListField(const Value: string);
    procedure Seta_ListFieldIndex(const Value: integer);
    procedure Seta_ListSource(const Value: TDataSource);
    //function GetCodeEditWidth: integer;
    //procedure SetCodeEditWidth(const Value: integer);
    { Private declarations }
  protected
    { Protected declarations }
    function FilterActive: boolean; override;
    procedure FocusFilter (ForceFocus : boolean); override;
    procedure LoadValue(V : Variant); override;
    procedure DoOnClick (Sender : TObject);
    function ParamCount : integer; override;
    function GetParamInfo: TTargetFilter_ParamInfo; override;

    function GetFilterStr: string; override;
    function GetDatasetFilterStr: string; override;
    function FilterValid(aErrorType : TTargetFilter_ErrorType): boolean; override;

    function GetEditAreaHeight: integer; override;
    procedure SetEditAreaBounds(aLeft,aTop,aWidth : integer); override;
    procedure DoOnChangeCondition(Sender : TObject); override;
    procedure DoOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState); override;
    procedure FinishCreation; override;
    property ConditionGroup : TLookupConditionGroup read GetConditionGroup write SetConditionGroup;
    procedure UpdateControlStatus; override;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
    //procedure MD (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  published
    property a_ConditionType : TLookupConditionType read fConditionType write SetConditionType default lctNone;
    property a_OnBeforeGetString : TTargetFilter_LookupFilter_OnBeforeGetString
      read fOnBeforeGetString write fOnBeforeGetString;
    property a_OnSelectValue : TTargetFilter_LookupFilter_OnSelectValue
      read fOnSelectValue write SetOnSelectValue;
    property a_ListSource : TDataSource read Geta_ListSource     write Seta_ListSource;
    property a_KeyField       : string  read Geta_KeyField       write Seta_KeyField;
    property a_ListField      : string  read Geta_ListField      write Seta_ListField;
    property a_ListFieldIndex : integer read Geta_ListFieldIndex write Seta_ListFieldIndex;
    property a_EditAreaMinWidth default 160;
    property a_FilterOnDropDown : string read Geta_FilterOnDropDown write Seta_FilterOnDropDown;
    property a_AutoHint : boolean read Geta_AutoHint write Seta_AutoHint default false;
    property a_DropDownWidth : integer read Geta_DropDownWidth write Seta_DropDownWidth default 0;
    property a_KeyValue : Variant read GetKeyValue write SetKeyValue;
    property a_OnBeforeGetStringEx : TTargetFilter_LookupFilter_OnBeforeGetStringEx read Fa_OnBeforeGetStringEx write Fa_OnBeforeGetStringEx;
    property a_OnAfterGetString : TTargetFilter_LookupFilter_OnAfterGetString read Fa_OnAfterGetString write Fa_OnAfterGetString;
    property a_NullText : string read GetA_NullText write SetA_NullText;
    { Published declarations }
  end;
procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('TargetDB', [TTargetFilter_LookupFilter]);
end;

{ TTargetFilter_LookupFilter }

constructor TTargetFilter_LookupFilter.Create(AOwner: TComponent);
  begin
    inherited;
    Height      := 20;
    fConditionType := lctNone;

    LookupCombo := TTarget_DBLookupComboBox.Create(self);
    With LookupCombo do begin
      AutoSize := false;
      Parent   := self;
      a_DisableDelete := false;
      //Width    := 80;
      //ReadOnly := true;
      Color    := clBtnFace;
      OnClick  := DoOnClick;
      //TabStop  := false;
    end;
    btSelect := TSpeedButton.Create(self);
    with btSelect do begin
      Parent    := self;
      OnClick   := DoOnClick;
      Flat      := true;
    end;
    btSelect.Glyph.LoadFromResourceName(HInstance,'TARGETFILTER_DOWNARROW');
    btSelect.Hint := 'Выбрать значение из списка (Ctrl+Space)';
    a_EditAreaMinWidth := 160;
  end;

function TTargetFilter_LookupFilter.GetFilterStr: string;
  var
    lRec_PK : variant;
    lConditionType  : TLookupConditionType;
    lConditionGroup : TLookupConditionGroup;
  begin
    Result := '';

    if not ReadyToGetFilterStr then begin
      Result := '';
      exit;
    end;

    lRec_PK := fRec_PK;

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [lcgNone,lcgNull])
      then fOnBeforeGetString(self,a_ConditionType,ConditionGroup,lRec_PK);

    lConditionType  := a_ConditionType;

    if Assigned(Fa_OnBeforeGetStringEx)
      then Fa_OnBeforeGetStringEx(self,false,lConditionType,ConditionGroup,lRec_PK);
    lConditionGroup := CalcConditionGroup(lConditionType);

    case lConditionType of
      lctE    : if VarIsStr(lRec_PK)
                  then Result := GetColumn(true) + ' = ' + ''''+lRec_PK+''''
                  else Result := GetColumn(true) + ' = ' + VarToStr(lRec_PK);
      lctNE   : if VarIsStr(lRec_PK)
                  then Result := GetColumn(true) + ' <> ' + ''''+lRec_PK+''''
                  else Result := GetColumn(true) + ' <> ' + VarToStr(lRec_PK);
      lctIsNull    : Result := GetColumn(true) + ' IS NULL';
      lctIsNotNull : Result := GetColumn(true) + ' IS NOT NULL';
    end;

    if Assigned(Fa_OnAfterGetString)
      then Result := Fa_OnAfterGetString(self,false,lConditionType,lConditionGroup,lRec_PK,Result);
  end;

function TTargetFilter_LookupFilter.GetDatasetFilterStr: string;
  var
    lRec_PK : variant;
    lConditionType  : TLookupConditionType;
    lConditionGroup : TLookupConditionGroup;
  begin
    Result := '';

    if not ReadyToGetFilterStr then begin
      Result := '';
      exit;
    end;

    lRec_PK := fRec_PK;

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [lcgNone,lcgNull])
      then fOnBeforeGetString(self,a_ConditionType,ConditionGroup,lRec_PK);

    lConditionType  := a_ConditionType;

    if Assigned(Fa_OnBeforeGetStringEx)
      then Fa_OnBeforeGetStringEx(self,true,lConditionType,ConditionGroup,lRec_PK);
    lConditionGroup := CalcConditionGroup(lConditionType);


    Result := GetColumn(false);
    case lConditionType of
      lctE    : if VarIsStr(lRec_PK)
                  then Result := Result + ' = ' + ''''+lRec_PK+''''
                  else Result := Result + ' = ' + VarToStr(lRec_PK);
      lctNE   : if VarIsStr(lRec_PK)
                  then Result := Result + ' <> ' + ''''+lRec_PK+''''
                  else Result := Result + ' <> ' + VarToStr(lRec_PK);
      lctIsNull    : Result := Result + ' = NULL';
      lctIsNotNull : Result := Result + ' <> NULL';
    end;

    if Assigned(Fa_OnAfterGetString)
      then Result := Fa_OnAfterGetString(self,true,lConditionType,lConditionGroup,lRec_PK,Result);
  end;


function TTargetFilter_LookupFilter.FilterValid(aErrorType : TTargetFilter_ErrorType): boolean;
  begin
    if not Inherited FilterValid(aErrorType) then exit;
    case aErrorType of
      fetDesignTimeError: begin
                          end;
      fetRealTimeError  : begin
                            {case ConditionGroup of
                               lcgValue: if not TrueThat(not VarIsNull(fRec_PK) and not VarIsEmpty(fRec_PK),
                                                          aErrorType,'Не указан код для значения из справочника!') then exit;
                            end;}
                          end;
    end;
    Result := true;
  end;

function TTargetFilter_LookupFilter.GetEditAreaHeight: integer;
  begin
    Result := Max(Condition_ComboBox.Height,LookupCombo.Height);
  end;

procedure TTargetFilter_LookupFilter.SetEditAreaBounds(aLeft,aTop,aWidth : integer);
  var
    btAreaWidth   : integer;
    EditAreaWidth : integer;
  begin
    if @fOnSelectValue <> nil
      then begin
             btSelect   .Parent := self;
             btAreaWidth := btSelect.Width + 3;
             btSelect   .SetBounds(aLeft + aWidth - btAreaWidth+2,aTop,btSelect.Width,btSelect.Height);
             btAreaWidth := btAreaWidth + 2;
           end
      else begin
             btSelect   .Parent := nil;
             btAreaWidth := 0;
           end;
    LookupCombo.SetBounds(aLeft,aTop,aWidth - btAreaWidth,LookupCombo.Height);
  end;

procedure TTargetFilter_LookupFilter.SetConditionType(const Value: TLookupConditionType);
  begin
    fConditionType := Value;
    if csLoading in ComponentState then exit;
    Condition_ComboBox.ItemIndex := integer(Value);
    ConditionGroup := ConditionGroup;
    UpdateFilterStr;
  end;

procedure TTargetFilter_LookupFilter.DoOnChangeCondition(Sender: TObject);
  begin
    a_ConditionType := TLookupConditionType(Condition_ComboBox.ItemIndex);
    inherited;
  end;

procedure TTargetFilter_LookupFilter.FinishCreation;
 begin
   inherited;
   if Parent = nil then exit;
   With Condition_ComboBox do begin
     Items.Clear;
     Items.AddObject('выкл.',    TObject(lcgNone));
     Items.AddObject('равно',    TObject(lcgValue));
     Items.AddObject('не равно', TObject(lcgValue));
     Items.AddObject('пусто',    TObject(lcgNull));
     Items.AddObject('заполнено',TObject(lcgNull));
     ItemIndex := Integer(fConditionType);
     OnChange(Condition_ComboBox);
   end;
   LookupCombo.Height := Condition_ComboBox.Height;
   btSelect  .Height := Condition_ComboBox.Height;
 end;

function TTargetFilter_LookupFilter.GetConditionGroup: TLookupConditionGroup;
  begin
    Result := CalcConditionGroup(TLookupConditionType(Condition_ComboBox.ItemIndex));
  end;

function TTargetFilter_LookupFilter.CalcConditionGroup(in_ConditionType : TLookupConditionType) : TLookupConditionGroup;
  begin
    Result := TLookupConditionGroup(Condition_ComboBox.Items.Objects[integer(in_ConditionType)]);
  end;

procedure TTargetFilter_LookupFilter.SetConditionGroup(const Value: TLookupConditionGroup);
  begin
    if csLoading in ComponentState then exit;
    //SetControlStatus(LookupCombo,true,true);
    //SetControlStatus(Code_Edit ,false,true);
    //UpdateFilterStr;
    UpdateControlStatus;
  end;

procedure TTargetFilter_LookupFilter.UpdateControlStatus;
  begin
    Inherited;
    btSelect.Enabled := (ConditionGroup = lcgValue) and Enabled and Assigned(fOnSelectValue);
    SetControlStatus(LookupCombo,(ConditionGroup = lcgValue) and Enabled,true);
  end;

procedure TTargetFilter_LookupFilter.DoOnClick(Sender: TObject);
  begin
    if Sender = LookupCombo then begin
      UpdateFilterStr;
      exit;
    end;

    if Sender = btSelect then
      if Assigned(fOnSelectValue) then begin
        {if fOnSelectValue(self,btSelect.BoundsRect,
                       a_ConditionType,ConditionGroup,
                       fRec_PK,fRec_Title) then begin
          if VarIsNull(fRec_Title) or VarIsEmpty(fRec_Title)
            then LookupCombo.Text := ''
            else LookupCombo.Text := fRec_Title;
          if VarIsNull(fRec_PK) or VarIsEmpty(fRec_PK)
            then Code_Edit.Text := ''
            else Code_Edit.Text := fRec_PK;
          if (a_ConditionType = lctNone) and (Code_Edit.Text <> '')
            then a_ConditionType := lctE
            else UpdateFilterStr;
        end;}
      end;
  end;

{function TTargetFilter_LookupFilter.GetCodeEditWidth: integer;
  begin
    Result := Code_Edit.Width;
  end;

procedure TTargetFilter_LookupFilter.SetCodeEditWidth(const Value: integer);
  begin
    Code_Edit.Width := Value;
    PositionEditArea;
  end;}

procedure TTargetFilter_LookupFilter.DoOnKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
  begin
    if (Key = vk_Space) and (Shift = [ssCtrl]) then begin
      btSelect.Click;
      exit;
    end;
    inherited;
  end;

function TTargetFilter_LookupFilter.GetParamInfo: TTargetFilter_ParamInfo;
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

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [lcgNone,lcgNull])
      then fOnBeforeGetString(self,a_ConditionType,ConditionGroup,lRec_PK);

    SetLength(Result.Params,ParamCount);
    case a_ConditionType of
      lctE         : SetRes(GetColumn(true) + ' =  :' + a_ParamNames[0],1,lRec_PK,VarIsStr(lRec_PK));
      lctNE        : SetRes(GetColumn(true) + ' != :' + a_ParamNames[0],1,lRec_PK,VarIsStr(lRec_PK));
      lctIsNull    : SetRes(GetColumn(true) + ' IS NULL'                   ,0,Null   ,false);
      lctIsNotNull : SetRes(GetColumn(true) + ' IS NOT NULL'               ,0,Null   ,false);
    end;

    SetLength(Result.Params,RealParamCount);
    for i := low(Result.Params) to high(Result.Params)
      do Result.Params[i].ParamName := a_ParamNames[i];
  end;

function TTargetFilter_LookupFilter.ParamCount: integer;
  begin
    Result := 1;
  end;

function TTargetFilter_LookupFilter.Geta_KeyField: string;
begin
  Result := LookupCombo.KeyField;
end;

function TTargetFilter_LookupFilter.Geta_ListField: string;
begin
 Result := LookupCombo.ListField;
end;

function TTargetFilter_LookupFilter.Geta_ListFieldIndex: integer;
begin
 Result := LookupCombo.ListFieldIndex;
end;

function TTargetFilter_LookupFilter.Geta_ListSource: TDataSource;
begin
 Result := LookupCombo.ListSource;
end;

procedure TTargetFilter_LookupFilter.Seta_KeyField(const Value: string);
begin
  LookupCombo.KeyField := Value;
end;

procedure TTargetFilter_LookupFilter.Seta_ListField(const Value: string);
begin
  LookupCombo.ListField := Value;
end;

procedure TTargetFilter_LookupFilter.Seta_ListFieldIndex(
  const Value: integer);
begin
  LookupCombo.ListFieldIndex := Value;
  LookupCombo.DoUpdateListFields;
end;

procedure TTargetFilter_LookupFilter.Seta_ListSource(
  const Value: TDataSource);
begin
  LookupCombo.ListSource := Value;
end;

function TTargetFilter_LookupFilter.GetfRec_PK: Variant;
  begin
    Result := LookupCombo.KeyValue;
  end;

procedure TTargetFilter_LookupFilter.SetfRec_PK(const Value: Variant);
  begin
    LookupCombo.KeyValue := Value;
    UpdateFilterStr;
  end;

function TTargetFilter_LookupFilter.GetEditControlCount: integer;
  begin
    Result := Inherited GetEditControlCount + 1;
  end;

function TTargetFilter_LookupFilter.GetEditControl(i: integer;outVisualColumn: Pointer): TWinControl;
  var
    vc : integer;
  begin
    Result := Inherited GetEditControl(i,outVisualColumn);
    if Result <> nil then exit;

    case (i - (Inherited GetEditControlCount-1)) of
      1: begin
           Result := LookupCombo;
           vc := 1;
         end;
    end;

    if (Result <> nil) and (outVisualColumn <> nil)
      then integer(outVisualColumn^) := vc;
  end;

procedure TTargetFilter_LookupFilter.LoadValue(V: Variant);
  var
    i : integer;
  begin
    if not VarIsArray(V) then exit;
    for i := VarArrayLowBound(V,1) to VarArrayHighBound(V,1) do
      case i of
        0 : fRec_PK := V[0];
            {if not (VarIsNull(V[i]) or VarIsEmpty(V[i]))
             then begin
                    fRec_PK := V[0];
                  end
             else begin
                    Condition_ComboBox.ItemIndex := 0;
                    Condition_ComboBox.OnChange(Condition_ComboBox);
                  end;}
      end;
    if Condition_ComboBox.ItemIndex <> 0 then Inherited;
  end;


procedure TTargetFilter_LookupFilter.FocusFilter (ForceFocus : boolean);
  begin
    Enabled := true;
    if not FilterFocused or ForceFocus
      then if LookupCombo.Enabled
             then begin
                    LookupCombo.SetFocus;
                    ForceFocus := false;
                  end;
    inherited;
  end;

procedure TTargetFilter_LookupFilter.SetOnSelectValue(const Value: TTargetFilter_LookupFilter_OnSelectValue);
  var
    V,T : Variant;
  begin
    fOnSelectValue := Value;
    PositionEditArea;
  end;

function TTargetFilter_LookupFilter.FilterActive: boolean;
  begin
    Result := false;
    if not Inherited FilterActive then exit;

    case ConditionGroup of
         lcgValue:   if not TrueThat(not VarIsNull(fRec_PK) and not VarIsEmpty(fRec_PK),fetFilterNotActive,'') then exit;
         lcgNull : ;
    end;
    Result := true;
  end;


function TTargetFilter_LookupFilter.Geta_FilterOnDropDown: string;
  begin
    if LookupCombo <> nil
      then Result := LookupCombo.a_FilterOnDropDown
      else Result := '';
  end;

procedure TTargetFilter_LookupFilter.Seta_FilterOnDropDown(const Value: string);
  begin
    if LookupCombo <> nil then LookupCombo.a_FilterOnDropDown := Value;
  end;

function TTargetFilter_LookupFilter.Geta_AutoHint: boolean;
  begin
    Result := LookupCombo.a_AutoHint;
  end;

procedure TTargetFilter_LookupFilter.Seta_AutoHint(const Value: boolean);
  begin
    LookupCombo.a_AutoHint := Value;
  end;

function TTargetFilter_LookupFilter.Geta_DropDownWidth: integer;
  begin
    Result := LookupCombo.DropDownWidth;
  end;

procedure TTargetFilter_LookupFilter.Seta_DropDownWidth(const Value: integer);
  begin
    LookupCombo.DropDownWidth := Value;
  end;

function TTargetFilter_LookupFilter.GetKeyValue: Variant;
  begin
    Result := LookupCombo.KeyValue;
  end;

procedure TTargetFilter_LookupFilter.SetKeyValue(const Value: Variant);
  begin
    if not VarEquals(Value,LookupCombo.KeyValue) then begin
      LookupCombo.KeyValue := Value;
      if Assigned(LookupCombo.OnClick) then LookupCombo.OnClick(LookupCombo);
    end;
  end;

function TTargetFilter_LookupFilter.SetDefaultConditionTypeIfNone: boolean;
  begin
    if not Inherited SetDefaultConditionTypeIfNone then exit;
    a_ConditionType := lctE;
  end;

function VarIsOk (V : Variant) : boolean;
  begin
    Result := not (VarIsNull(V) or VarIsEmpty(V));
  end;

function IsNull(V : Variant; Default : variant) : Variant;
  begin
    if not VarIsOk(V)
      then Result := Default
      else Result := V;
  end;


{procedure TTargetFilter_LookupFilter.MD(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  a_KeyValue := IsNull(a_KeyValue,1) + 1;
end;}

function TTargetFilter_LookupFilter.GetA_NullText: string;
  begin
    if LookupCombo <> nil
      then Result := LookupCombo.a_NullText
      else Result := '';
  end;

procedure TTargetFilter_LookupFilter.SetA_NullText(const Value: string);
  begin
    if LookupCombo <> nil
      then LookupCombo.a_NullText := Value;
  end;

initialization
  RegisterClass(TTargetFilter_LookupFilter);
end.
