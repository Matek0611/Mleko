unit comp_TargetFilter_NumberFilter;

interface

uses
  math,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  stdctrls,extctrls,
  comp_TargetFilter_CustomFilter,comp_TargetFilter_Edits,
  TargetFilter_utils, buttons,variants;

type
  TNumberConditionType  = (nctNone,
                           nctL,nctLE,nctE,nctLike,nctGE,nctG,nctNE,
                           nctGE_LE,nctG_L,//nctGE_L,nctG_LE,
                           nctIsNull,nctIsNotNull);
  TNumberConditionGroup = (ncgNone,ncgValue,ncgInterval,ncgNull);

  TTargetFilter_NumberFilter = class;
  TTargetFilter_NumberFilter_OnBeforeGetString = procedure (Sender : TTargetFilter_NumberFilter;
                                                            ConditionType: TNumberConditionType;
                                                            ConditionGroup : TNumberConditionGroup;
                                                            var Value,Minimum,Maximum : extended)
                                                 of object;

  TTargetFilter_NumberFilter = class(TTargetFilter_CustomFilter)
  private
    fConditionType : TNumberConditionType;
    fOnBeforeGetString: TTargetFilter_NumberFilter_OnBeforeGetString;
    Fa_b_FieldName_Txt: string;
    Fa_DisableLikeCondition: boolean;
    function GetMaximum: extended;
    function GetMinimum: extended;
    function GetValue  : extended;
    procedure SetMaximum(const Value: extended);
    procedure SetMinimum(const Value: extended);
    procedure SetValue  (const Value: extended);
    procedure SetConditionType(const Value: TNumberConditionType);
    procedure SetConditionGroup(const Value: TNumberConditionGroup);
    function GetConditionGroup: TNumberConditionGroup;
    procedure Seta_b_FieldName_Txt(const Value: string);
    procedure Seta_DisableLikeCondition(const Value: boolean);
  public
    NumberCondition_Edit    : TTarget_ExtEdit;
    IntervalCondition_Edit1 : TTarget_ExtEdit;
    IntervalCondition_Edit2 : TTarget_ExtEdit;

    procedure DoOnEdit(Sender : TObject);
    { Private declarations }
  protected
    function GetEditControlCount: integer; override;
    function GetEditControl(i: integer; outVisualColumn : Pointer): TWinControl; override;
  protected
    { Protected declarations }
    procedure FocusFilter (ForceFocus : boolean); override;
    function GetFilterStr: string; override;
    function GetDatasetFilterStr : string; override;
    //function GetDatasetFilterStr : string; override;
    function ParamCount : integer; override;
    function GetParamInfo: TTargetFilter_ParamInfo; override;
    function Op(WhichOne : integer = 1) : string;

    function FilterValid(aErrorType : TTargetFilter_ErrorType): boolean; override;
    function FilterActive : boolean; override;

    function GetEditAreaHeight: integer; override;
    procedure SetEditAreaBounds(aLeft,aTop,aWidth : integer); override;
    procedure FinishCreation; override;
    property ConditionGroup : TNumberConditionGroup read GetConditionGroup write SetConditionGroup;
    procedure DoOnChangeCondition(Sender: TObject); override;
    procedure Seta_TabStop(const Value: boolean); override;
    procedure UpdateControlStatus; override;
  public
    { Public declarations }
    function SetDefaultConditionTypeIfNone: boolean; override;
    procedure SetDefaultAlignment;
    constructor Create(AOwner:TComponent); override;
    procedure LoadValue(V: Variant); override;
  published
    property Width default 320;
    property a_Minimum : extended read GetMinimum write SetMinimum;
    property a_Maximum : extended read GetMaximum write SetMaximum;
    property a_Value   : extended read GetValue   write SetValue;
    property a_DisableLikeCondition : boolean read Fa_DisableLikeCondition write Seta_DisableLikeCondition default true;
    property a_ConditionType : TNumberConditionType read fConditionType write SetConditionType default nctNone;
    property a_OnBeforeGetString : TTargetFilter_NumberFilter_OnBeforeGetString
      read fOnBeforeGetString write fOnBeforeGetString;
    property a_b_FieldName_Txt : string read Fa_b_FieldName_Txt write Seta_b_FieldName_Txt;
    property a_EditAreaMinWidth default 100;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('TargetDB', [TTargetFilter_NumberFilter]);
end;

{ TTargetFilter_NumberFilter }
constructor TTargetFilter_NumberFilter.Create(AOwner: TComponent);
  begin
    inherited;
    Width       := 320;
    Height      := 20;

    fConditionType := nctNone;
    Fa_DisableLikeCondition := true;

    //ShowMessage('IntervalCondition_Edit1 := TTarget_ExtEdit.Create(self)');
    IntervalCondition_Edit1 := TTarget_ExtEdit.Create(self);
    With IntervalCondition_Edit1 do begin
      Parent := nil;
      //Text     := '0';
      AutoSize := false;
      OnChange := DoOnEdit;
      OnKeyDown := DoOnKeyDown;
      ChangeOnInvalidValue := true;
    end;
    IntervalCondition_Edit2 := TTarget_ExtEdit.Create(self);
    With IntervalCondition_Edit2 do begin
      Parent := nil;
      //Text     := '0';
      AutoSize := false;
      OnChange := DoOnEdit;
      OnKeyDown := DoOnKeyDown;
      ChangeOnInvalidValue := true;
    end;

    NumberCondition_Edit := TTarget_ExtEdit.Create(self);
    With NumberCondition_Edit do begin
      Parent := self;
      //Text     := '0';
      AutoSize := false;
      OnChange := DoOnEdit;
      OnKeyDown := DoOnKeyDown;
      ChangeOnInvalidValue := true;
    end;

    a_EditAreaMinWidth := 100;
  end;

procedure TTargetFilter_NumberFilter.DoOnEdit(Sender: TObject);
  begin
    UpdateFilterStr;
  end;

function TTargetFilter_NumberFilter.Op(WhichOne : integer = 1) : string;
    const
      O : array [nctNone..nctIsNotNull,1..2] of string =
        ((  '',  ''),//nctNone
         ( '<',  ''),//nctL
         ('<=',  ''),//nctLE,
         ( '=',  ''),//nctE,
         ('not used!',''),//nctLike,
         ('>=',  ''),//nctGE,
         ( '>',  ''),//nctG
         ('<>',  ''),//nctNE
         ('>=','<='),//nctGE_LE
         ( '>', '<'),//nctG_L
         //('>=', '<'),//nctGE_L
         //( '>','<='),//nctG_LE
         ( 'IS NULL',  ''),//nctIsNull
         ( 'IS NOT NULL',  ''));//nctIsNotNull )
    begin
      Result := ' ' + O[a_ConditionType,WhichOne] + ' ';
    end;

function TTargetFilter_NumberFilter.GetDatasetFilterStr: string;
  var
    lMinimum,lMaximum,lValue : Extended;
  begin
    if not ReadyToGetFilterStr then begin
      Result := '';
      exit;
    end;

    lValue         := a_Value;
    lMinimum       := a_Minimum;
    lMaximum       := a_Maximum;

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [ncgNone,ncgNull])
      then fOnBeforeGetString(self,a_ConditionType,ConditionGroup,lValue,lMinimum,lMaximum);

    Result := ' ';
    case ConditionGroup of
         ncgValue:  if a_ConditionType = nctLike
                      then begin
                             if Fa_b_FieldName_Txt <> ''
                               then Result := PreQuot+a_b_FieldName_Txt + PostQuot+' like ''%'+ GetDatasetNumberStr(lValue)+'%'''
                               else Result := PreQuot+a_b_FieldName + '_txt'+PostQuot+' like ''%'+ GetDatasetNumberStr(lValue)+'%'''
                           end
                      else Result := PreQuot+a_b_FieldName+PostQuot+ Op + GetDatasetNumberStr(lValue);
      ncgInterval:  Result := PreQuot+a_b_FieldName+PostQuot + Op(1) + GetDatasetNumberStr(lMinimum)+
                              ' and ' +
                              PreQuot+a_b_FieldName+PostQuot + Op(2) + GetNumberStr(lMaximum);
          ncgNull:  case a_ConditionType of
                      nctIsNull    : Result := PreQuot+a_b_FieldName+PostQuot + ' = Null';
                      nctIsNotNull : Result := PreQuot+a_b_FieldName+PostQuot + ' <> Null';
                    end;
     else Result := '';
    end;
  end;

function TTargetFilter_NumberFilter.GetFilterStr: string;
  var
    lMinimum,lMaximum,lValue : Extended;
  begin
    if not ReadyToGetFilterStr then begin
      Result := '';
      exit;
    end;

    lValue         := a_Value;
    lMinimum       := a_Minimum;
    lMaximum       := a_Maximum;

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [ncgNone,ncgNull])
      then fOnBeforeGetString(self,a_ConditionType,ConditionGroup,lValue,lMinimum,lMaximum);

    Result := ' ';
    case ConditionGroup of
         ncgValue:  if a_ConditionType = nctLike
                      then Result := GetColumnToChar(true) + ' like '+ GetNumberToCharStr(lValue)
                      else Result := GetColumn(true) + Op    + GetNumberStr(lValue);
      ncgInterval:  Result := GetColumn(true) + Op(1) + GetNumberStr(lMinimum)+
                              ' and ' +
                              GetColumn(true) + Op(2) + GetNumberStr(lMaximum);
          ncgNull:  Result := GetColumn(true) + Op;
     else Result := '';
    end;
  end;

function TTargetFilter_NumberFilter.FilterActive: boolean;
  begin
    Result := false;
    if not Inherited FilterActive then exit;

    case ConditionGroup of
         ncgValue:   if not TrueThat(Trim(NumberCondition_Edit   .Text) <> '',fetFilterNotActive,'') then exit;
      ncgInterval: begin
                     if not (
                            TrueThat(Trim(IntervalCondition_Edit1.Text) <> '',fetFilterNotActive,'')
                            and
                            TrueThat(Trim(IntervalCondition_Edit2.Text) <> '',fetFilterNotActive,'')
                            ) then exit;
                   end;
         ncgNull : ;
    end;
    Result := true;
  end;

function TTargetFilter_NumberFilter.FilterValid(aErrorType : TTargetFilter_ErrorType): boolean;
  begin
    Result := false;
    if not Inherited FilterValid(aErrorType) then exit;
    case aErrorType of
      fetDesignTimeError: begin
                          end;
      fetRealTimeError  : begin
                            case ConditionGroup of
                                 ncgValue: begin
                                             if not TrueThat(NumberCondition_Edit.IsValueValid,
                                                           aErrorType,'Неправильно введено число!') then exit;

                                           end;
                              ncgInterval: if not (
                                                  TrueThat(IntervalCondition_Edit1.IsValueValid,
                                                           aErrorType,'Неправильно введено начало интервала!')
                                                  and
                                                  TrueThat(IntervalCondition_Edit2.IsValueValid,
                                                           aErrorType,'Неправильно введен конец интервала!')
                                                  ) then exit;
                                 ncgNull : ;
                            end;
                          end;
    end;
    Result := true;
  end;

function TTargetFilter_NumberFilter.GetEditAreaHeight: integer;
  begin
    Result := Max(Condition_ComboBox.Height,NumberCondition_Edit.Height);
  end;

procedure TTargetFilter_NumberFilter.SetEditAreaBounds(aLeft,aTop,aWidth : integer);
  var
    w,dw : integer;
    L,R : integer;
  begin
    L := aLeft;
    R := aLeft + aWidth-1;

    w :=  (R - L + 1);
    NumberCondition_Edit.SetBounds(L,
                                   aTop,
                                   w,
                                   NumberCondition_Edit.Height);
    dw := w mod 2;
    w := w div 2;
    IntervalCondition_Edit1.SetBounds(L,
                                      aTop,
                                      w,
                                      IntervalCondition_Edit1.Height);
    w := w + dw;
    IntervalCondition_Edit2.SetBounds(IntervalCondition_Edit1.BoundsRect.Right,
                                      aTop,
                                      w,
                                      IntervalCondition_Edit2.Height);
  end;


function TTargetFilter_NumberFilter.GetMinimum: extended;
  begin
    Result := IntervalCondition_Edit1.Value;
  end;

function TTargetFilter_NumberFilter.GetMaximum: extended;
  begin
    Result := IntervalCondition_Edit2.Value;
  end;

function TTargetFilter_NumberFilter.GetValue: extended;
  begin
    Result := NumberCondition_Edit.Value;
  end;

procedure TTargetFilter_NumberFilter.SetMinimum(const Value: extended);
begin
  IntervalCondition_Edit1.Text := FloatToStr(Value);
  UpdateFilterStr;
end;

procedure TTargetFilter_NumberFilter.SetMaximum(const Value: extended);
begin
  IntervalCondition_Edit2.Text := FloatToStr(Value);
  UpdateFilterStr;
end;

procedure TTargetFilter_NumberFilter.SetValue(const Value: extended);
begin
  NumberCondition_Edit.Text := FloatToStr(Value);
  UpdateFilterStr;
end;

procedure TTargetFilter_NumberFilter.SetConditionType(const Value: TNumberConditionType);
  begin
    if (Value = nctLike) and a_DisableLikeCondition then begin
      MessageBox(0,
                 PChar('При установленном свойстве ''a_DisableLikeCondition'''#13+
                 'установка режима ''включает'' для числовых фильтров запрещена!'),
                 'Несовместимые установки!',
                 MB_OK + MB_ICONINFORMATION);
      exit;
    end;

  fConditionType := Value;
  if csLoading in ComponentState then exit;
  if a_DisableLikeCondition and (Value > nctLike)
    then Condition_ComboBox.ItemIndex := integer(Value)-1
    else Condition_ComboBox.ItemIndex := integer(Value);
  ConditionGroup := ConditionGroup;
  UpdateFilterStr;
end;

procedure TTargetFilter_NumberFilter.FinishCreation;
  begin
    Inherited;
    if Parent = nil then exit;
    With Condition_ComboBox do begin
     Items.Clear;
     Items.AddObject('выкл.' ,TObject(0));
     Items.AddObject('<'     ,TObject(1));
     Items.AddObject('<='    ,TObject(1));
     Items.AddObject('='     ,TObject(1));
     if not a_DisableLikeCondition
       then Items.AddObject('включает',TObject(1));
     Items.AddObject('>='    ,TObject(1));
     Items.AddObject('>'     ,TObject(1));
     Items.AddObject('не равно'    ,TObject(1));
     Items.AddObject('с(вкл)  … по(вкл)',TObject(2));
     Items.AddObject('с(искл) … по(искл)',TObject(2));
     //Items.AddObject('с(вкл)  … по(искл)',TObject(2));
     //Items.AddObject('с(искл) … по(вкл)',TObject(2));
     Items.AddObject('пусто',TObject(3));
     Items.AddObject('заполнено',TObject(3));
     ItemIndex := Integer(fConditionType);
     OnChange(Condition_ComboBox);
    end;
    NumberCondition_Edit.Height := Condition_ComboBox.Height;
    IntervalCondition_Edit1.Height := Condition_ComboBox.Height;
    IntervalCondition_Edit2.Height := Condition_ComboBox.Height;
  end;

procedure TTargetFilter_NumberFilter.DoOnChangeCondition(Sender: TObject);
  begin
    if a_DisableLikeCondition and (Condition_ComboBox.ItemIndex >= integer(nctLike))
      then a_ConditionType := TNumberConditionType(Condition_ComboBox.ItemIndex+1)
      else a_ConditionType := TNumberConditionType(Condition_ComboBox.ItemIndex);
    inherited;
  end;


procedure TTargetFilter_NumberFilter.UpdateControlStatus;
  begin
    Inherited;
    SetControlStatus(NumberCondition_Edit,
                     ConditionGroup = ncgValue,
                     (ConditionGroup = ncgValue) or (ConditionGroup in [ncgNone,ncgNull]) and (NumberCondition_Edit.Parent <> nil));
    SetControlStatus(IntervalCondition_Edit1,
                     ConditionGroup = ncgInterval,
                     (ConditionGroup = ncgInterval) or (ConditionGroup in [ncgNone,ncgNull]) and (IntervalCondition_Edit1.Parent <> nil));
    SetControlStatus(IntervalCondition_Edit2,
                     ConditionGroup = ncgInterval,
                     (ConditionGroup = ncgInterval) or (ConditionGroup in [ncgNone,ncgNull]) and (IntervalCondition_Edit2.Parent <> nil));
    SetDefaultAlignment;                     
  end;

procedure TTargetFilter_NumberFilter.SetConditionGroup(const Value: TNumberConditionGroup);
   begin
    if csLoading in ComponentState then exit;
    //UpdateFilterStr;
    UpdateControlStatus;
  end;

function TTargetFilter_NumberFilter.GetConditionGroup: TNumberConditionGroup;
  begin
    Result := TNumberConditionGroup(Condition_ComboBox.Items.Objects[Condition_ComboBox.ItemIndex]);
  end;

procedure TTargetFilter_NumberFilter.FocusFilter(ForceFocus : boolean);
  begin
    Enabled := true;
    if not FilterFocused or ForceFocus then
      if NumberCondition_Edit.CanFocus
        then begin
               NumberCondition_Edit.SetFocus;
               ForceFocus := false;
             end
        else if IntervalCondition_Edit1.CanFocus
               then begin
                      IntervalCondition_Edit1.SetFocus;
                      ForceFocus := false;
                    end;
    inherited;
  end;

procedure TTargetFilter_NumberFilter.Seta_TabStop(const Value: boolean);
  begin
    inherited;
    NumberCondition_Edit   .TabStop := Value;
    IntervalCondition_Edit1.TabStop := Value;
    IntervalCondition_Edit2.TabStop := Value;
  end;

function TTargetFilter_NumberFilter.GetParamInfo: TTargetFilter_ParamInfo;
  var
    lMinimum,lMaximum,lValue : Extended;
    RealParamCount : integer;
    i : Integer;

  procedure SetRes(aResult_ParamFilterStr : string; aRealParamCount : integer; E1,E2 : Extended);
    begin
      Result.ParamFilterStr := aResult_ParamFilterStr;
      Result.Params[0].ParamValue := E1;
      Result.Params[1].ParamValue := E2;
      RealParamCount := aRealParamCount;
    end;

  begin
    InitTargetFilter_ParamInfo(Result);
    if not ReadyToGetFilterStr then begin
      exit;
    end;

    lValue         := a_Value;
    lMinimum       := a_Minimum;
    lMaximum       := a_Maximum;

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [ncgNone,ncgNull])
      then fOnBeforeGetString(self,a_ConditionType,ConditionGroup,lValue,lMinimum,lMaximum);

    SetLength(Result.Params,ParamCount);
    case ConditionGroup of
        ncgValue: if a_ConditionType = nctLike
                     then Result.ParamFilterStr := GetColumnToChar(true) + ' like '+GetReplaceDecimalSeparatorInStrParam(a_ParamNames[0])
                     else SetRes(GetColumn(true) + Op    + ':'+a_ParamNames[0],1,lValue,0);

      ncgInterval:  SetRes(GetColumn(true) + Op(1) + ':'+a_ParamNames[0]+
                              ' and ' +
                           GetColumn(true) + Op(2) + ':'+a_ParamNames[1],2,lMinimum,lMaximum);
          ncgNull:  SetRes(GetColumn(true) + Op,0,0,0);
    end;

    if a_ConditionType = nctLike
      then begin
             SetLength(Result.Params,1);
             Result.Params[0].ParamName  := a_ParamNames[0];
             Result.Params[0].ParamType  := fptString;
             Result.Params[0].ParamValue := '%'+StringReplace(FloatToStr(lValue),ThousandSeparator,'',[rfReplaceAll])+'%';
           end
      else begin
             SetLength(Result.Params,RealParamCount);
             for i := low(Result.Params) to high(Result.Params) do begin
               Result.Params[i].ParamName := a_ParamNames[i];
               Result.Params[i].ParamType := fptFloat;
             end;
           end;
  end;

function TTargetFilter_NumberFilter.ParamCount: integer;
  begin
    Result := 2;
  end;

function TTargetFilter_NumberFilter.GetEditControlCount: integer;
  begin
    Result := Inherited GetEditControlCount + 3;
  end;

function TTargetFilter_NumberFilter.GetEditControl(i: integer;outVisualColumn: Pointer): TWinControl;
  var
    vc : integer;
  begin
    Result := Inherited GetEditControl(i,outVisualColumn);
    if Result <> nil then exit;

    case (i - (Inherited GetEditControlCount-1)) of
      1: begin
           Result := NumberCondition_Edit;
           vc := 1;
         end;
      2: begin
           Result := IntervalCondition_Edit1;
           vc := 1;
         end;
      3: begin
           Result := IntervalCondition_Edit2;
           vc := 2;
         end;
    end;

    if (Result <> nil) and (outVisualColumn <> nil)
      then integer(outVisualColumn^) := vc;
  end;

procedure TTargetFilter_NumberFilter.LoadValue(V: Variant);
  var
    i : integer;
  begin
    if not VarIsArray(V) then exit;
    for i := VarArrayLowBound(V,1) to VarArrayHighBound(V,1) do
        case i of
        0 : begin
              if not (VarIsNull(V[0]) or VarIsEmpty(V[0]))
                then NumberCondition_Edit.Value := V[i]
                else begin
                       Condition_ComboBox.ItemIndex := 0;
                       Condition_ComboBox.OnChange(Condition_ComboBox);
                     end;
            end;
        1 : begin
              if not (VarIsNull(V[i]) or VarIsEmpty(V[i]))
                then IntervalCondition_Edit1.Value := V[i];
            end;
        2 : begin
              if not (VarIsNull(V[i]) or VarIsEmpty(V[i]))
                then IntervalCondition_Edit2.Value := V[i];
            end;
        end;
    if Condition_ComboBox.ItemIndex <> 0 then inherited;
  end;

procedure TTargetFilter_NumberFilter.Seta_b_FieldName_Txt(const Value: string);
  begin
    Fa_b_FieldName_Txt := Value;
    UpdateFilterStr;
  end;

procedure TTargetFilter_NumberFilter.Seta_DisableLikeCondition(const Value: boolean);
  begin
    if Fa_DisableLikeCondition = Value then exit;
    Fa_DisableLikeCondition := Value;
    if Value
      then begin
             Condition_ComboBox.Items.Delete(integer(nctLike));
             if a_ConditionType = nctLike
               then a_ConditionType := TNumberConditionType(integer(nctLike)+1)
               else if a_ConditionType > nctLike
                      then Condition_ComboBox.ItemIndex := Condition_ComboBox.ItemIndex - 1;
           end
      else begin
             Condition_ComboBox.Items.InsertObject(integer(nctLike),'включает',TObject(1));
             if a_ConditionType > nctLike
               then Condition_ComboBox.ItemIndex := Condition_ComboBox.ItemIndex + 1;
           end;
  end;

procedure TTargetFilter_NumberFilter.SetDefaultAlignment;
  begin
    if GetParentForm(NumberCondition_Edit)    <> nil then NumberCondition_Edit   .SetDefaultAlignment;
    if GetParentForm(IntervalCondition_Edit1) <> nil then IntervalCondition_Edit1.SetDefaultAlignment;
    if GetParentForm(IntervalCondition_Edit2) <> nil then IntervalCondition_Edit2.SetDefaultAlignment;
  end;

function TTargetFilter_NumberFilter.SetDefaultConditionTypeIfNone: boolean;
  begin
    if not Inherited SetDefaultConditionTypeIfNone then exit;
    a_ConditionType := nctE;
  end;


initialization
  RegisterClass(TTargetFilter_NumberFilter);
end.
