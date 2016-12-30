unit comp_TargetFilter_StringFilter;

interface

uses
  math,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  stdctrls,extctrls,
  comp_TargetFilter_CustomFilter,comp_TargetFilter_Edits,
  TargetFilter_utils, variants;

type
  TStringConditionType = (sctNone,sctLike,sctNotLike,sctIsNull,sctIsNotNull);
  TStringConditionGroup = (scgNone,scgValue,scgNull);

  TTargetFilter_StringFilter = class;
  TTargetFilter_StringFilter_OnBeforeGetString = procedure (Sender : TTargetFilter_StringFilter;
                                                            ConditionType: TStringConditionType;
                                                            ConditionGroup : TStringConditionGroup;
                                                            var LikeStr : string)
                                                  of object;

  TTargetFilter_StringFilter = class(TTargetFilter_CustomFilter)
  private
    Edit     : TTarget_Edit;
    fConditionType: TStringConditionType;
    fOnBeforeGetString: TTargetFilter_StringFilter_OnBeforeGetString;
    Fa_LikeStr_Suffix: string;
    Fa_LikeStr_Prefix: string;
    procedure DoOnEdit(Sender : TObject);
    procedure SetLikeStr(const Value: string);
    function  GetLikeStr: string;
    procedure SetConditionType(const Value: TStringConditionType);
    function GetConditionGroup: TStringConditionGroup;
    procedure SetConditionGroup(const Value: TStringConditionGroup);
    procedure Seta_LikeStr_Prefix(const Value: string);
    procedure Seta_LikeStr_Suffix(const Value: string);
    { Private declarations }
  protected
    function SetDefaultConditionTypeIfNone: boolean; override;
    procedure LoadValue(V: Variant); override;
    function GetEditControlCount: integer; override;
    function GetEditControl(i: integer; outVisualColumn : Pointer): TWinControl; override;
  protected
    { Protected declarations }
    procedure Seta_GoingToUseDatasetFilter (const Value : boolean); override;
    procedure FocusFilter(ForceFocus : boolean); override;
    function FilterActive : boolean; override;
    function FilterValid(aErrorType : TTargetFilter_ErrorType): boolean; override;
    function GetFilterStr: string; override;
    function GetDatasetFilterStr : string; override;
    function GetEditAreaHeight: integer; override;
    procedure SetEditAreaBounds(aLeft,aTop,aWidth : integer); override;
    procedure DoOnChangeCondition(Sender : TObject); override;
    procedure FinishCreation; override;
    property ConditionGroup : TStringConditionGroup read GetConditionGroup write SetConditionGroup;
    procedure AutoChangeValue; override;
    procedure Seta_TabStop(const Value: boolean); override;
    function ParamCount : integer; override;
    function GetParamInfo: TTargetFilter_ParamInfo; override;
    procedure UpdateControlStatus; override;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
    procedure DoOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState); override;
    procedure DoOnDblClick (Sender : TObject);
  published
    property a_LikeStr : string read GetLikeStr write SetLikeStr;
    property a_LikeStr_Prefix : string read Fa_LikeStr_Prefix write Seta_LikeStr_Prefix;
    property a_LikeStr_Suffix : string read Fa_LikeStr_Suffix write Seta_LikeStr_Suffix;
    property a_ConditionType : TStringConditionType read fConditionType write SetConditionType default sctNone;
    property a_OnBeforeGetString : TTargetFilter_StringFilter_OnBeforeGetString
      read fOnBeforeGetString write fOnBeforeGetString;
    property a_EditAreaMinWidth default 50;
    { Published declarations }
  end;
procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('TargetDB', [TTargetFilter_StringFilter]);
end;

{ TTargetFilter_StringFilter }

constructor TTargetFilter_StringFilter.Create(AOwner: TComponent);
  begin
    inherited;
    Height      := 20;
    Edit   := TTarget_Edit.Create(self);
    fConditionType := sctNone;
    With Edit do begin
      AutoSize := false;
      Anchors := [akLeft,akTop,akRight];
      OnKeyDown := DoOnKeyDown;
      OnChange := DoOnEdit;
      OnDblClick := DoOnDblClick;
      Parent := self;
      ChangeOnInvalidValue := true;
    end;
    a_EditAreaMinWidth := 50;
  end;

procedure TTargetFilter_StringFilter.DoOnEdit(Sender: TObject);
  begin
    UpdateFilterStr;
  end;

function TTargetFilter_StringFilter.GetParamInfo: TTargetFilter_ParamInfo;
  var
    lLikeStr : string;

  begin
    InitTargetFilter_ParamInfo(Result);
    if not ReadyToGetFilterStr then begin
      exit;
    end;

    lLikeStr := StringReplace(a_LikeStr_Prefix+a_LikeStr+a_LikeStr_Suffix,'%%','%',[rfReplaceAll]);
    lLikeStr := StringReplace(lLikeStr,'**','*',[rfReplaceAll]);

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [scgNone,scgNull])
      then fOnBeforeGetString(self,a_ConditionType,ConditionGroup,lLikeStr);

    lLikeStr := AnsiLowerCase(lLikeStr);

    case a_ConditionType of
      sctLike      : Result.ParamFilterStr := 'Lower('+GetColumn(true) +') LIKE '     + ':'+a_ParamNames[0];
      sctNotLike   : Result.ParamFilterStr := 'Lower('+GetColumn(true) +') NOT LIKE ' + ':'+a_ParamNames[0];
      sctIsNull    : Result.ParamFilterStr := GetColumn(true) + ' IS NULL';
      sctIsNotNull : Result.ParamFilterStr := GetColumn(true) + ' IS NOT NULL';
    end;

    if a_ConditionType in [sctLike,sctNotLike] then begin
      SetLength(Result.Params,ParamCount);
      Result.Params[0].ParamName := a_ParamNames[0];
      Result.Params[0].ParamType := fptString;
      Result.Params[0].ParamValue := lLikeStr;
    end;
  end;


function TTargetFilter_StringFilter.GetFilterStr: string;
  var
    lLikeStr : string;
  begin
    if not ReadyToGetFilterStr then begin
      Result := '';
      exit;
    end;

    lLikeStr := StringReplace(a_LikeStr_Prefix+a_LikeStr+a_LikeStr_Suffix,'%%','%',[rfReplaceAll]);
    lLikeStr := StringReplace(lLikeStr,'**','*',[rfReplaceAll]);

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [scgNone,scgNull])
      then fOnBeforeGetString(self,a_ConditionType,ConditionGroup,lLikeStr);

    lLikeStr := AnsiLowerCase(lLikeStr);

    case a_ConditionType of
      sctLike      : Result := 'Lower('+GetColumn(true) + ') LIKE '     + ''''+lLikeStr+'''';
      sctNotLike   : Result := 'Lower('+GetColumn(true) + ') NOT LIKE ' + ''''+lLikeStr+'''';
      sctIsNull    : Result := GetColumn(true) + ' IS NULL';
      sctIsNotNull : Result := GetColumn(true) + ' IS NOT NULL';
    end;
  end;

function TTargetFilter_StringFilter.GetDatasetFilterStr: string;
  var
    lLikeStr : string;
  begin
    if not ReadyToGetFilterStr then begin
      Result := '';
      exit;
    end;

    lLikeStr := StringReplace(a_LikeStr_Prefix+a_LikeStr+a_LikeStr_Suffix,'%%','%',[rfReplaceAll]);
    lLikeStr := StringReplace(lLikeStr,'**','*',[rfReplaceAll]);

    if Assigned (fOnBeforeGetString) and not (ConditionGroup in [scgNone,scgNull])
      then fOnBeforeGetString(self,a_ConditionType,ConditionGroup,lLikeStr);

    lLikeStr := AnsiLowerCase(lLikeStr);
    if lLikeStr = '%' then begin
      case a_ConditionType of
        sctLike      : Result := PreQuot+a_b_FieldName+PostQuot + ' <> NULL';
        sctNotLike   : Result := PreQuot+a_b_FieldName+PostQuot + ' = NULL';
        sctIsNull    : Result := PreQuot+a_b_FieldName+PostQuot + ' = NULL';
        sctIsNotNull : Result := PreQuot+a_b_FieldName+PostQuot + ' <> NULL';
      end;
      exit;
    end;

    case a_ConditionType of
      sctLike      : Result := PreQuot+a_b_FieldName+PostQuot + ' LIKE '     + ''''+lLikeStr+'''';
      sctNotLike   : Result := PreQuot+a_b_FieldName+PostQuot + ' NOT LIKE ' + ''''+lLikeStr+'''';
      sctIsNull    : Result := PreQuot+a_b_FieldName+PostQuot + ' = NULL';
      sctIsNotNull : Result := PreQuot+a_b_FieldName+PostQuot + ' <> NULL';
    end;
  end;

function TTargetFilter_StringFilter.GetLikeStr: string;
  begin
    Result := Edit.Text;
  end;

procedure TTargetFilter_StringFilter.SetLikeStr(const Value: string);
  begin
    Edit.Text := Value;
    UpdateFilterStr;
  end;

function TTargetFilter_StringFilter.FilterActive : boolean;
  var
    lLikeStr : string;

  function WildCardPos (s : string) : integer;
    begin
      Result := Pos('%',s);
      if Result = 0 then Result := Pos('*',s);
    end;
    
  begin
    Result := false;
    if not Inherited FilterActive then exit;

    case ConditionGroup of
      scgValue:  begin
                   if not TrueThat(Trim(a_LikeStr_Prefix+Edit.Text+a_LikeStr_Suffix) <> '',
                                 fetFilterNotActive,'') then exit;
                   if a_GoingToUseDatasetFilter then begin
                     lLikeStr := StringReplace(a_LikeStr_Prefix+a_LikeStr+a_LikeStr_Suffix,'%%','%',[rfReplaceAll]);
                     lLikeStr := StringReplace(lLikeStr,'**','*',[rfReplaceAll]);
                     if not TrueThat(
                               (WildCardPos(lLikeStr) = 0)
                                or
                               (WildCardPos(lLikeStr) = Length(lLikeStr))
                                and
                               (Length(lLikeStr) > 1)
                                or
                               (WildCardPos(lLikeStr) = 1)
                                 and
                               (WildCardPos(Copy(lLikeStr,2,Length(lLikeStr))) = Length(Copy(lLikeStr,2,Length(lLikeStr))))
                                 and
                               (Length(lLikeStr) > 2),
                               fetFilterNotActive,'Сформирована строка для фильтрации'#13+
                                          ''''+lLikeStr+''''+#13+
                                          'Один из символов масок (*,%) должен быть только в конце'#13'или в начале и конце строки') then exit;
                   end;
                 end;
    end;
    Result := true;
  end;

procedure TTargetFilter_StringFilter.DoOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  begin
    inherited;
  end;

function TTargetFilter_StringFilter.GetEditAreaHeight: integer;
  begin
    Result := Max(Condition_ComboBox.Height,Edit.Height);
  end;

procedure TTargetFilter_StringFilter.SetEditAreaBounds(aLeft,aTop,aWidth : integer);
  begin
    Edit.SetBounds(aLeft,aTop,aWidth,Edit.Height);
  end;

procedure TTargetFilter_StringFilter.SetConditionType(const Value: TStringConditionType);
  begin
    if (Value = sctNotLike) and a_GoingToUseDatasetFilter then begin
      MessageBox(0,
                 PChar('При установленном свойстве ''a_GoingToUseDatasetFiler'''#13+
                 'установка режима ''не равно'' для текстовых фильтров запрещена!'),
                 'Несовместимые установки!',
                 MB_OK + MB_ICONINFORMATION);
      exit;
    end;

    fConditionType := Value;
    if csLoading in ComponentState then exit;
    if a_GoingToUseDatasetFilter and (Value > sctNotLike)
      then Condition_ComboBox.ItemIndex := integer(Value)-1
      else Condition_ComboBox.ItemIndex := integer(Value);
    ConditionGroup := ConditionGroup;
    UpdateFilterStr;
  end;

procedure TTargetFilter_StringFilter.DoOnChangeCondition(Sender: TObject);
  begin
    if a_GoingToUseDatasetFilter and (Condition_ComboBox.ItemIndex >= integer(sctNotLike))
      then a_ConditionType := TStringConditionType(Condition_ComboBox.ItemIndex+1)
      else a_ConditionType := TStringConditionType(Condition_ComboBox.ItemIndex);
    inherited;
  end;

procedure TTargetFilter_StringFilter.FinishCreation;
 begin
   inherited;
   if Parent = nil then exit;
   With Condition_ComboBox do begin
     Items.Clear;
     Items.AddObject('выкл.',TObject(0));
     Items.AddObject('равно',    TObject(1));

     if not a_GoingToUseDatasetFilter
       then Items.AddObject('не равно',TObject(1));

     Items.AddObject('пусто',TObject(2));
     Items.AddObject('заполнено',TObject(2));
     ItemIndex := Integer(fConditionType);
     OnChange(Condition_ComboBox);
   end;
   Edit.Height := Condition_ComboBox.Height;
 end;

function TTargetFilter_StringFilter.GetConditionGroup: TStringConditionGroup;
  begin
    Result := TStringConditionGroup(Condition_ComboBox.Items.Objects[Condition_ComboBox.ItemIndex]);
  end;

procedure TTargetFilter_StringFilter.SetConditionGroup(const Value: TStringConditionGroup);
  begin
    if csLoading in ComponentState then exit;
    UpdateControlStatus;
    //UpdateFilterStr;
  end;

procedure TTargetFilter_StringFilter.UpdateControlStatus;
  begin
    Inherited;
    SetControlStatus(Edit,(ConditionGroup = scgValue),true);
  end;

procedure TTargetFilter_StringFilter.AutoChangeValue;
  var
    t : string;
  begin
    t := Edit.Text;
         if t    = ''
            then t := '%'
    else if t    = '%'
            then t := ''
    else if (t[1] <> '%') and (t[length(t)] <> '%')
            then t := t + '%'
    else if (t[1] <> '%') and (t[length(t)] =  '%')
            then t := '%' + Copy(t,1,Length(t)-1)
    else if (t[1] = '%')  and (t[length(t)] <>  '%')
            then t := t + '%'
    else if (t[1] = '%')  and (t[length(t)] = '%')
            then t := Copy(t,2,Length(t)-2);
    if Edit.Text <> t then Edit.Text := t;
  end;

procedure TTargetFilter_StringFilter.DoOnDblClick(Sender: TObject);
  begin
    AutoChangeValue;
  end;

procedure TTargetFilter_StringFilter.FocusFilter (ForceFocus : boolean);
  begin
    Enabled := true;
    if ForceFocus or not FilterFocused
      then if Edit.CanFocus
             then begin
                    Edit.SetFocus;
                    ForceFocus := false;
                  end;
    Inherited;
  end;

procedure TTargetFilter_StringFilter.Seta_TabStop(const Value: boolean);
  begin
    inherited;
    Edit.TabStop := Value;
  end;

function TTargetFilter_StringFilter.ParamCount: integer;
  begin
    Result := 1;
  end;

procedure TTargetFilter_StringFilter.Seta_LikeStr_Prefix(const Value: string);
begin
  Fa_LikeStr_Prefix := Value;
  UpdateFilterStr;
end;

procedure TTargetFilter_StringFilter.Seta_LikeStr_Suffix(const Value: string);
begin
  Fa_LikeStr_Suffix := Value;
  UpdateFilterStr;
end;

function TTargetFilter_StringFilter.GetEditControlCount: integer;
  begin
    Result := Inherited GetEditControlCount + 1;
  end;

function TTargetFilter_StringFilter.GetEditControl(i: integer;outVisualColumn: Pointer): TWinControl;
  var
    vc : integer;
  begin
    Result := Inherited GetEditControl(i,outVisualColumn);
    if Result <> nil then exit;

    case (i - (Inherited GetEditControlCount-1)) of
      1: begin
           Result := Edit;
           vc := 1;
         end;
    end;

    if (Result <> nil) and (outVisualColumn <> nil)
      then integer(outVisualColumn^) := vc;
  end;

procedure TTargetFilter_StringFilter.LoadValue(V: Variant);
  var
    i : integer;
  begin
    if not VarIsArray(V) then exit;
    for i := VarArrayLowBound(V,1) to VarArrayHighBound(V,1) do
      case i of
        0 : if not (VarIsNull(V[i]) or VarIsEmpty(V[i]))
             then begin
                    Edit.Text := Trim(V[0]);
                  end
             else begin
                    Condition_ComboBox.ItemIndex := 0;
                    Condition_ComboBox.OnChange(Condition_ComboBox);
                  end;
      end;
    if Condition_ComboBox.ItemIndex <> 0 then Inherited;
  end;

procedure TTargetFilter_StringFilter.Seta_GoingToUseDatasetFilter(const Value: boolean);
  begin
    if a_GoingToUseDatasetFilter = Value then exit;
    inherited;
    if Value
      then begin
             Condition_ComboBox.Items.Delete(integer(sctNotLike));
             if a_ConditionType = sctNotLike
               then a_ConditionType := TStringConditionType(integer(sctNotLike)+1)
               else if a_ConditionType > sctNotLike
                      then Condition_ComboBox.ItemIndex := Condition_ComboBox.ItemIndex - 1;
           end
      else begin
             Condition_ComboBox.Items.InsertObject(integer(sctNotLike),'не равно',TObject(1));
             if a_ConditionType > sctNotLike
               then Condition_ComboBox.ItemIndex := Condition_ComboBox.ItemIndex + 1;
           end;
  end;

function TTargetFilter_StringFilter.FilterValid(aErrorType: TTargetFilter_ErrorType): boolean;
  begin
    Result := false;
    case aErrorType of
      fetDesignTimeError: begin
                          end;
      fetRealTimeError  : begin
                          end;
    end;
    Result := true;
 end;

function TTargetFilter_StringFilter.SetDefaultConditionTypeIfNone: boolean;
  begin
    if not Inherited SetDefaultConditionTypeIfNone then exit;
    a_ConditionType := sctLike;
  end;


initialization
  RegisterClass(TTargetFilter_StringFilter);
end.
