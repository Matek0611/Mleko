unit comp_TargetFilter_CustomFilter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,extctrls,
  comp_TargetFilter_Panel, TargetFilter_utils, stdctrls, math, actnlist,dbctrls,
  comctrls, menus, comp_Target_DbCtrls, variants;

const
  DisabledControlColor = clBtnFace;
type
  TtargetFilter_CustomFilter = class;
  TTargetFilter_OnFilterChanged = procedure (Sender : TtargetFilter_CustomFilter) of object;
  TTargetFilter_ErrorType = (fetFilterNotActive,fetNoError,fetDesignTimeError,fetRealTimeError);

  TTargetFilter_ComboBox = class (TComboBox)
                           protected
                             procedure KeyDown(var Key: Word; Shift: TShiftState); override;
                             procedure WndProc(var Message: TMessage); override;
                             procedure DropDown; override;
                             procedure CloseUp; override;
                             function Focused : boolean; override;
                           end;
  TTargetFilter_ServerType = (tfst_Oracle,tfst_MS_SQL);
  {TOnGetFilterStr = procedure (Sender : TtargetFilter_CustomFilter;
                               var}

  TtargetFilter_CustomFilter = class(TPanel)
  public
    BlockPositionEditArea : boolean;
  private
    FFieldName: string;
    FTableName: string;
    FLabelWidth: integer;
    FImagePanel : TPanel;
    FImage   : TImage;
    FLabel   : TLabel;
    FShortCutLabel : TLabel;
    Fa_OnFilterChanged: TTargetFilter_OnFilterChanged;
    Fa_TabStop: boolean;
    Fa_Hint: string;
    Fa_ParamNames: TStringList;
    FServerType: TTargetFilter_ServerType;
    FShortCutLabelWidth: integer;
    Fa_GoingToUseDatasetFilter: boolean;
    PrevImage : string;
    FServerFieldName: string;
    DontChangeHintControls : array of TControl;
    FOnFilterChangedEnabled: boolean;
    Fa_ListFontSizeMoreThanThatOfCombo: integer;
    procedure SetFieldName(const Value: string);
    procedure SetTableName(const Value: string);
    function GetLabel: string;
    function GetLabelAlignment: TAlignment;
    procedure SetLabel(const Value: string);
    procedure SetLabelAlignment(const Value: TAlignment);
    procedure SetComboWidth(const Value: integer);
    function  Get_Disable_ConditionType_Combo : boolean;
    procedure Set_Disable_ConditionType_Combo (const Value: boolean);
    procedure SetInvalidFilterInfo(const Value: string);
    function Geta_ShortCut : TShortCut;
    procedure PublishedSeta_TabStop (const Value : boolean);
    procedure Seta_Hint(const Value: string); virtual;
    function Geta_SecondaryShortCuts: TShortCutList;
    procedure Seta_SecondaryShortCuts(const Value: TShortCutList);
    procedure Seta_ParamNames(const Value: TStringList);
    procedure SetServerType(const Value: TTargetFilter_ServerType);
    procedure SetShortCutLabelWidth(const Value: integer);
    procedure SetServerFieldName(const Value: string);
    function GetServerFieldName: string;
    procedure SetOnFilterChangedEnabled(const Value: boolean);
    procedure Seta_ListFontSizeMoreThanThatOfCombo(const Value: integer);
  public
    function GetEditControlCount: integer; virtual;
    function GetEditControl(i: integer; outVisualColumn : Pointer = nil): TWinControl; virtual;
    { Private declarations }
  protected
    procedure AddDontChangeHintControls(C : TControl);
    procedure Seta_GoingToUseDatasetFilter(const Value: boolean); virtual;
    function GetDatasetFilterStr: string; virtual;
    function GetNumberStr(Number : Extended) : string; virtual;
    function GetDatasetNumberStr(E : Extended) : string; virtual;
    function GetDatasetDateStr(D : TDateTime;NeedTime : boolean = false) : string;
    function GetNumberToCharStr(Number : Extended) : string; virtual;
    function GetColumnToChar(ServerVersion : boolean) : string; virtual;
    function GetReplaceDecimalSeparatorInStrParam(ParamName : string) : string; virtual;
    function GetDateStr(DT : TDateTime; NeedTime : boolean = false) : string; virtual;
    procedure DoEnter; override;
    procedure Seta_TabStop(const Value: boolean); virtual;
    procedure Seta_ShortCut(const Value: TShortCut); virtual;
    function FilterActive : boolean; virtual;
    function FilterValid(aErrorType : TTargetFilter_ErrorType): boolean; virtual;
    function ReadyToGetFilterStr : boolean; virtual;

    function TrueThat(aCondition : boolean;
                      aErrorType : TTargetFilter_ErrorType;
                      aErrorInfo : string) : boolean;
    procedure UpdateFilterStatus (aErrorType : TTargetFilter_ErrorType;
                                  aErrorInfo : string = '');
  protected
    FComboWidth: integer;

    procedure PositionEditArea; virtual;
    procedure FinishCreation; virtual;
    function GetFilterStr : string; virtual;
    function GetParamInfo : TTargetFilter_ParamInfo; virtual;
    function GetColumn (ServerVersion : boolean): string;
    procedure Loaded; override;
    function GetEditAreaHeight : integer; virtual;
    procedure SetEditAreaBounds(aLeft,aTop,aWidth : integer); virtual;
    procedure AlignControls(AControl: TControl; var Rect: TRect); override;
    procedure SetLabelWidth(const Value: integer); virtual;
    procedure ShowInfo; virtual;
  private
    IgnoreDropDownKeyInControl : TWinControl;
  protected
    procedure ComboboxKeyPress(Sender: TObject;var Key: Char);
    procedure DoOnKeyDown (Sender : TObject; var Key: Word; Shift: TShiftState); virtual;
    procedure DoOnKeyUp   (Sender : TObject; var Key: Word; Shift: TShiftState); virtual;
    procedure DoOnChangeCondition(Sender : tObject); virtual;
    function GetInfo : string; virtual;
    function  NeedInitParamNames : boolean;
    procedure InitParamNames;
  protected
    fa_EditAreaMinWidth : integer;
    procedure UpdateControlStatus; virtual;
    procedure SetControlStatus (C : TMemo; IsEnabled,aIsVisible : boolean); overload;
    procedure SetControlStatus (C : TEdit; IsEnabled,aIsVisible : boolean); overload;
    procedure SetControlStatus (C : TDateTimePicker; IsEnabled,aIsVisible : boolean); overload;
    procedure SetControlStatus (C : TComboBox; IsEnabled,aIsVisible : boolean); overload;
    procedure SetControlStatus (C : TTarget_DBLookupComboBox; IsEnabled,aIsVisible: boolean); overload;
    procedure AutoChangeValue; virtual;
    procedure WndProc(var Message : TMessage); override;
    { Protected declarations }
  private
    LastOnFilterChangedStr  : string;
    property OnFilterChangedEnabled  : boolean read FOnFilterChangedEnabled write SetOnFilterChangedEnabled;
    procedure CallOnFilterChanged(CloseUpCall : boolean = false);
  private
    procedure acFocusFilterExecute (Sender : Tobject);
    procedure acFocusFilterUpdate  (Sender : TObject);
  public
    procedure FocusFilter (ForceFocus : boolean); virtual;
  protected
    PreQuot  : string;
    PostQuot : string;
    procedure SetFocus; override;
    destructor Destroy; override;
    function ParamCount : integer; virtual;
    procedure SetName(const NewName: TComponentName); override;
    procedure SetEnabled(Value: Boolean); override;
  public
    FTargetFilter_Panel : TTargetFilter_Panel;
    acList        : TActionList;
    acFocusFilter : TAction;
    Condition_ComboBox : TTargetFilter_ComboBox;
    function SetDefaultConditionTypeIfNone : boolean; virtual;
    function FilterFocused: boolean; virtual;
    function DoNotDisturb_IamInEditing : boolean; virtual;
    procedure UpdateFilterStr;
    property FilterStr : string read GetFilterStr;
    property DatasetFilterStr : string read GetDatasetFilterStr;
    { Public declarations }
    procedure SetParent(AParent: TWinControl); override;
    constructor Create (AOwner : TComponent); override;
    procedure LoadValue(V : Variant); virtual;
    function GetExtended(V : Variant) : Extended;
    function EditAreaMinWidth : integer; virtual;
  published
    property a_Disable_ConditionType_Combo : boolean
      read  Get_Disable_ConditionType_Combo
      write Set_Disable_ConditionType_Combo;
    property a_a_TableName : string read FTableName write SetTableName;
    property a_b_FieldName : string read FFieldName write SetFieldName;
    property a_b_ServerFieldName : string read GetServerFieldName write SetServerFieldName;
    property a_Label : string read GetLabel write SetLabel;
    property a_LabelWidth : integer read FLabelWidth write SetLabelWidth default 80;
    property a_ShortCutLabelWidth : integer read FShortCutLabelWidth write SetShortCutLabelWidth default 0;
    property a_ComboWidth : integer read FComboWidth write SetComboWidth default 110;
    property a_LabelAlignment : TAlignment
      read GetLabelAlignment write SetLabelAlignment default taLeftJustify;
    property BorderWidth default 4;
    property a_OnFilterChanged : TTargetFilter_OnFilterChanged
      read  Fa_OnFilterChanged write Fa_OnFilterChanged;
    property a_ShortCut : TShortCut  read Geta_ShortCut write Seta_ShortCut;
    property a_SecondaryShortCuts : TShortCutList read Geta_SecondaryShortCuts write Seta_SecondaryShortCuts;
    property a_TabStop  : boolean read Fa_TabStop write PublishedSeta_TabStop default true;
    property a_Hint     : string read Fa_Hint write Seta_Hint;
    property a_ParamNames : TStringList read Fa_ParamNames write Seta_ParamNames;
    property a_ServerType   : TTargetFilter_ServerType read FServerType write SetServerType default tfst_Oracle;
    property a_GoingToUseDatasetFilter : boolean read Fa_GoingToUseDatasetFilter write Seta_GoingToUseDatasetFilter default false;
    property a_EditAreaMinWidth : integer read fa_EditAreaMinWidth write fa_EditAreaMinWidth default 10;
    property a_ListFontSizeMoreThanThatOfCombo : integer read Fa_ListFontSizeMoreThanThatOfCombo write Seta_ListFontSizeMoreThanThatOfCombo default 0;
    { Published declarations }
  end;

implementation
{$R TargetFilter_Custom.res}
{$R TargetFilter.dcr}
{ TtargetFilter_CustomFilter }
  uses comp_TargetFilter_ScrollBox;

function TtargetFilter_CustomFilter.GetColumn(ServerVersion : boolean): string;
  begin
    if ServerVersion
      then begin
             if Trim(fTableName) <> ''
               then Result := PreQuot + Trim(UpperCase(fTableName))+PostQuot + '.'
               else Result := '';

               Result := Result + PreQuot + UpperCase(a_b_ServerFieldName) + PostQuot;
           end
      else begin
             Result := Result + PreQuot + UpperCase(a_b_FieldName) + PostQuot;
           end;
  end;

procedure TtargetFilter_CustomFilter.SetFieldName(const Value: string);
  begin
    FFieldName := Value;
    UpdateFilterStr;
  end;

procedure TtargetFilter_CustomFilter.SetParent(AParent: TWinControl);
var
  PF : TCustomForm;
  s : string;
  i : integer;
begin
  {if AParent <> nil then begin
    s := AParent.ClassName;
    MessageBox(0,PChar(s),PChar(s),MB_OK);
  end;}
  if not (csLoading in ComponentState) then begin
    if (FTargetFilter_Panel <> nil) then FTargetFilter_Panel.RemoveFilter(self);
    FTargetFilter_Panel := nil;
  end;
  inherited;
  if not (csLoading in ComponentState) then begin
   Caption := '';
   if (Parent <> nil) and (Parent is TTargetFilter_Panel)
     then begin
            //MessageBox(0,'1','',MB_OK);
            FTargetFilter_Panel := Parent as TTargetFilter_Panel;
            UpdateFilterStr;
            //MessageBox(0,'2','',MB_OK);
          end;
  end;
  FinishCreation;
  if Parent <> nil then
    if Condition_ComboBox <> nil
        then Condition_ComboBox.DropDownCount := Condition_ComboBox.Items.Count;

  if [csDesigning,csDestroying] * ComponentState = [] then begin
    if AParent = nil
      then PF := nil
      else PF := GetParentForm(AParent);
    if PF <> acList.Owner then begin
      if acList.Owner <> nil then acList.Owner.RemoveComponent(acList);
      if PF <> nil
        then PF.InsertComponent(acList)
    end;
  end;
  {if AParent <> nil then begin
    MessageBox(0,'After setParent','After setParent',MB_OK);
  end;}
end;

procedure TtargetFilter_CustomFilter.SetTableName(const Value: string);
  begin
    FTableName := Value;
    UpdateFilterStr;
  end;

constructor TtargetFilter_CustomFilter.Create(AOwner: TComponent);
  var
    i : Integer;
  begin
    PreQuot  := '"';
    PostQuot := '"';
    BlockPositionEditArea := true;
    inherited;
    ParentColor := true;
    ParentShowHint := true;

    FImagePanel := TPanel.Create(self);
    With FImagePanel do begin
      BevelOuter := bvRaised;
      BevelInner := bvLowered;
      BorderWidth := 0;
      Width := 20;
      Height := 20;
      Parent := self;
      ParentShowHint := true;
    end;

    FImage := TImage.Create(self);
    With FImage do begin
      Left := 4;
      Top  := 4;
      Transparent := true;
      AutoSize := true;
      Parent := nil;
      Hint := 'Фильтр включен и примет участие в фильтрации';
      ParentShowHint := true;
    end;
    AddDontChangeHintControls(fImage);

    Caption := '';

    FLabel := TLabel.Create(self);
    With FLabel do begin
      AutoSize := false;
      ParentColor := true;
      Caption := '';
      Anchors := [akLeft,akTop];
      Alignment := taLeftJustify;
      Parent := self;
      Transparent := true;
      ParentShowHint := true;
    end;

    FShortCutLabel := TLabel.Create(self);
    With FShortCutLabel do begin
      AutoSize := false;
      ParentColor := true;
      Caption := '';
      Anchors := [akLeft,akTop];
      Alignment := taLeftJustify;
      Parent := self;
      Transparent := true;
      ParentShowHint := true;
    end;

    Condition_ComboBox := TTargetFilter_ComboBox.Create(self);
    FLabel.FocusControl := Condition_ComboBox;

    With Condition_ComboBox do begin
      Style := csDropDownList;
      Parent := self;
      OnChange := DoOnChangeCondition;

      OnKeyDown := DoOnKeyDown;
      OnkeyPress := ComboboxKeyPress;
      Parent := self;
      TabOrder := 0;
      ParentShowHint := true;
    end;

    acList        := TActionList.Create(nil);
    acFocusFilter := TAction.Create(acList);
    With acFocusFilter do begin
      ActionList := acList;
      OnExecute  := acFocusFilterExecute;
      OnUpdate   := acFocusFilterUpdate;
      Caption    := 'Focus filter';
      Hint       := 'Focus filter';
    end;

    {With TButton.Create(self) do begin
      top     := - 40;
      TabStop := false;
      Parent := self;
      Action := acFocusFilter;
    end;}

    Fa_ParamNames := TStringList.Create;
    InitParamNames;

    fLabelWidth := 80;
    fComboWidth := 110;
    BorderWidth := 4;

    Fa_TabStop  := true;
    fa_EditAreaMinWidth := 10;
  end;

procedure TtargetFilter_CustomFilter.SetLabelWidth(const Value: integer);
begin
  FLabelWidth := Value;
  PositionEditArea;
end;

procedure TtargetFilter_CustomFilter.SetShortCutLabelWidth(
  const Value: integer);
begin
  FShortCutLabelWidth := Value;
  PositionEditArea;
end;


procedure TtargetFilter_CustomFilter.SetLabel(const Value: string);
  begin
    FLabel.Caption := Value;
  end;

procedure TtargetFilter_CustomFilter.PositionEditArea;
  var
    bw : integer;
    dh,w,PrefixW,EditAreaShift  : integer;
    EditAreaHeight : integer;
    ComboVertShift : integer;
  begin
    if BlockPositionEditArea then exit;
    bw := CalcPanelFullBorderWidth(self);
    EditAreaHeight := Max(GetEditAreaHeight,Condition_ComboBox.Height);
    if BorderStyle = bsSingle
      then dh := 4
      else dh := 0;
    if EditAreaHeight + 2*bw + dh > Constraints.MaxHeight
      then begin
             Constraints.MaxHeight := EditAreaHeight + 2*bw + dh;
             Constraints.MinHeight := EditAreaHeight + 2*bw + dh;
           end
      else begin
             Constraints.MinHeight := EditAreaHeight + 2*bw + dh;
             Constraints.MaxHeight := EditAreaHeight + 2*bw + dh;
           end;
    Height := Max(Min(Height,Constraints.MaxHeight),Constraints.MinHeight);
    w := (self.ClientRect.Right - self.ClientRect.Left);
    if EditAreaMinWidth > 0
      then EditAreaShift := 4
      else EditAreaShift := 0;
    PrefixW := Max(bw,(Constraints.MinHeight - FImagePanel.Height) div 2) +2+
               FImagePanel.Width + 5 + FLabelWidth+2+FShortCutLabelWidth+2*byte(FShortCutLabelWidth>0)+FComboWidth+EditAreaShift;

    SetEditAreaBounds(PrefixW,bw,w-bw-PrefixW);

    FImagePanel.SetBounds(Max(bw,(Constraints.MinHeight - FImagePanel.Height) div 2)+2,
                          (Constraints.MinHeight - FImagePanel.Height) div 2,
                          FImagePanel.Width,
                          FImagePanel.Height);
    FLabel.SetBounds(FImagePanel.BoundsRect.Right+5,
                    (Constraints.MinHeight - FLabel.Height) div 2 + 1,
                    FlabelWidth,
                    FLabel.Height);

    FShortCutLabel.SetBounds(FLabel.BoundsRect.Right+2*byte(FShortCutLabelWidth>0),
                             (Constraints.MinHeight - FLabel.Height) div 2 + 1,
                             FShortCutlabelWidth,
                             FShortCutlabel.Height);
    {if FShortCutLabelWidth > 0 then begin
      With FShortCutLabel,FShortCutLabel.BoundsRect do
        MessageBox(0,PChar('Caption = '+Caption+#13+
                           'Parent = '+Parent.ClassName+#13+
                           'Left = '+IntToSTr(Left)+', Top='+IntToStr(Top)+', Right = '+IntToSTr(Right)+', Bottom = '+IntToStr(Bottom)),'',mb_OKCANCEL);

    end;}

    ComboVertShift := (EditAreaHeight - Condition_ComboBox.Height) div 2;
    Condition_ComboBox.SetBounds(FShortCutLabel.BoundsRect.Right+2,bw+ComboVertShift,
                                 FComboWidth,Condition_ComboBox.Height);
    Constraints.MinWidth := PrefixW + EditAreaMinWidth + bw;
  end;

procedure TtargetFilter_CustomFilter.AlignControls(AControl: TControl; var Rect: TRect);
  begin
    inherited;
    PositionEditArea;
  end;

function TtargetFilter_CustomFilter.GetLabelAlignment: TAlignment;
  begin
    result := FLabel.Alignment;
  end;

procedure TtargetFilter_CustomFilter.SetLabelAlignment(const Value: TAlignment);
  begin
    FLabel.Alignment := Value;
  end;

function TtargetFilter_CustomFilter.GetLabel: string;
  begin
    Result := FLabel.Caption;
  end;

procedure TtargetFilter_CustomFilter.Loaded;
  var
    i : integer;

    procedure SetControlEvents(in_C : TControl);
      begin
        TPanel(in_C).OnClick     := OnClick;
        TPanel(in_C).OnDblClick  := OnDblClick;
        TPanel(in_C).OnMouseDown := OnMouseDown;
        TPanel(in_C).OnMouseUp   := OnMouseUp;
        TPanel(in_C).OnMouseMove := OnMouseMove;
      end;

  begin
    inherited;

    if Parent is TTargetFilter_ScrollBox then begin
      //AParent := TTargetFilter_ScrollBox(AParent).tf_Panel;
      TTargetFilter_ScrollBox(Parent).InsertFilter(self);
    end;

    FinishCreation;
    if Parent <> nil then begin
      if Condition_ComboBox <> nil
        then Condition_ComboBox.DropDownCount := Condition_ComboBox.Items.Count;
    end;
    if (Parent is TTargetFilter_Panel) and
       (Parent <> FTargetFilter_Panel) then begin
      FTargetFilter_Panel := TTargetFilter_Panel(Parent);
      UpdateFilterStr;
    end;
    OnFilterChangedEnabled := true;
    CallOnFilterChanged;

    SetControlEvents(FImagePanel);
    SetControlEvents(FImage);
    SetControlEvents(FLabel);
    SetControlEvents(FShortCutLabel);
  end;

function TtargetFilter_CustomFilter.GetEditAreaHeight: integer;
  begin
    Result := Condition_ComboBox.Height;
  end;

function TtargetFilter_CustomFilter.GetFilterStr: string;
  begin
    Result := '';
  end;

function TtargetFilter_CustomFilter.GetDatasetFilterStr: string;
  begin
    Result := '';
  end;


procedure TtargetFilter_CustomFilter.SetEditAreaBounds(aLeft, aTop,
  aWidth: integer);
begin

end;

procedure TtargetFilter_CustomFilter.DoOnKeyDown(Sender : TObject; var Key: Word; Shift: TShiftState);
  begin
    if ((Key = Ord('%')) or (Key = Ord('5'))) and (ssAlt in Shift)
      then AutoChangeValue;

    if (Shift = [ssShift,ssAlt,ssCtrl]) and
       (Key in [Ord('I'),ord('i'),ord('Ш'),ord('ш')])
      then ShowInfo;

    if Sender is TComboBox then
      if (Key in [vk_Space,vk_Return]) and (Shift = []) then begin
        if not TComboBox(Sender).DroppedDown then begin
          TComboBox(Sender).DroppedDown := true;
          IgnoreDropDownKeyInControl := TComboBox(Sender);
          Key := 0;
          exit;
        end;
      end;
  end;

procedure TtargetFilter_CustomFilter.ComboboxKeyPress(Sender: TObject;var Key: Char);
  begin
    if Key in [#13,#32] then begin
      if IgnoreDropDownKeyInControl = Sender then Key := #0;
    end;
    IgnoreDropDownKeyInControl := nil;
    inherited;
  end;


function TtargetFilter_CustomFilter.GetInfo : string;
  begin
    Result := 'Поле на клиенте : '+a_b_FieldName+#13+
              'Клиентский Фильтр : '+DatasetFilterStr+#13#13+
              'Таблица : '+a_a_TableName+#13+
              'Поле на сервере : '+a_b_ServerFieldName+#13+
              'Фильтр на сервере: '+FilterStr+#13;
  end;

procedure TtargetFilter_CustomFilter.ShowInfo;
  begin
    Application.MessageBox(PChar(GetInfo),PChar(a_label),MB_ICONINFORMATION+MB_OK);
  end;

function TtargetFilter_CustomFilter.FilterActive: boolean;
  begin
    Result := (Parent <> nil) and (Condition_ComboBox.ItemIndex > 0);
    if not Result then UpdateFilterStatus(fetFilterNotActive,'');
  end;

function TtargetFilter_CustomFilter.FilterValid(aErrorType : TTargetFilter_ErrorType): boolean;
  begin
    Result := false;
    case aErrorType of
      fetDesignTimeError: begin
                            if not TrueThat(Trim(fFieldName) <> '',
                                            aErrorType,'Не указано поле!'#13+'Обратитесь к разработчикам') then exit;
                            if not TrueThat(fa_ParamNames.Count = ParamCount,
                                            aErrorType,'В списке параметров '+IntToStr(fa_ParamNames.Count)+#13+
                                                       'Фильтр использует параметров '+IntToStr(ParamCount)+#13+
                                                       'Обратитесь к разработчикам') then exit;
                          end;
      fetRealTimeError  : begin
                          end;
    end;
    Result := true;
  end;

function TtargetFilter_CustomFilter.TrueThat(aCondition : boolean;
                                             aErrorType : TTargetFilter_ErrorType;
                                             aErrorInfo : string) : boolean;
  begin
    Result := aCondition;
    if not Result then UpdateFilterStatus(aErrorType,aErrorInfo);
  end;


procedure TtargetFilter_CustomFilter.UpdateFilterStr;
  begin
    if FTargetFilter_Panel <> nil then FTargetFilter_Panel.SetFilter(self,FilterStr,GetParamInfo,DatasetFilterStr);
    if ReadyToGetFilterStr then UpdateFilterStatus(fetNoError,'');
    CallOnFilterChanged;
  end;

function TtargetFilter_CustomFilter.ReadyToGetFilterStr: boolean;
  begin
    result := FilterValid(fetDesignTimeError) and FilterActive and
    FilterValid(fetRealTimeError);
  end;

procedure TtargetFilter_CustomFilter.CallOnFilterChanged(CloseUpCall : boolean = false);
  begin
    if CloseUpCall then FocusFilter(true);
    if not OnFilterChangedEnabled then exit;
    if LastOnFilterChangedStr = FilterStr then exit;
    LastOnFilterChangedStr := FilterStr;
    if Assigned(Fa_OnFilterChanged) then Fa_OnFilterChanged(self);
  end;

procedure TtargetFilter_CustomFilter.DoOnChangeCondition(Sender: tObject);
  var
    i : integer;
  begin
    UpdateFilterStr;
  end;

procedure TtargetFilter_CustomFilter.SetComboWidth(const Value: integer);
begin
  FComboWidth := Value;
  PositionEditArea;
end;

procedure TtargetFilter_CustomFilter.FinishCreation;
  begin
    if Parent = nil then exit;
    BlockPositionEditArea := false;
    PositionEditArea;
  end;

procedure TtargetFilter_CustomFilter.SetControlStatus(
  C: TComboBox; IsEnabled,aIsVisible : boolean);
  begin
    if aIsVisible
      then begin
             IsEnabled := IsEnabled and Enabled;
             C.Parent := self;
             C.Enabled := IsEnabled;
             if IsEnabled
               then C.Color := clWindow
               else C.Color := DisabledControlColor;
           end
      else begin
             C.Parent  := nil;
             C.Enabled := false;
           end;
  end;

procedure TtargetFilter_CustomFilter.SetControlStatus(
  C: TDateTimePicker; IsEnabled,aIsVisible: boolean);
  begin
    if aIsVisible
      then begin
             IsEnabled := IsEnabled and Enabled;
             C.Parent := self;
             C.Enabled := IsEnabled;
             if IsEnabled
               then C.Color := clWindow
               else C.Color := DisabledControlColor;
           end
      else begin
             C.Parent := nil;
             C.Enabled := false;
           end;
  end;

procedure TtargetFilter_CustomFilter.SetControlStatus(
  C: TEdit; IsEnabled,aIsVisible: boolean);
  begin
    if aIsVisible
      then begin
             IsEnabled := IsEnabled and Enabled;
             C.Parent := self;
             C.Enabled := IsEnabled;
             if IsEnabled
               then C.Color := clWindow
               else C.Color := DisabledControlColor;
           end
      else begin
             C.Parent := nil;
             C.Enabled := false;
           end;
  end;

procedure TtargetFilter_CustomFilter.SetControlStatus(
  C: TMemo; IsEnabled,aIsVisible: boolean);
  begin
    if aIsVisible
      then begin
             IsEnabled := IsEnabled and Enabled;
             C.Parent := self;
             C.Enabled := IsEnabled;
             if IsEnabled
               then C.Color := clWindow
               else C.Color := DisabledControlColor;
           end
      else begin
             C.Parent := nil;
             C.Enabled := false;
           end;
  end;


procedure TtargetFilter_CustomFilter.SetControlStatus(C: TTarget_DBLookupComboBox; IsEnabled,aIsVisible: boolean);
  begin
    if aIsVisible
      then begin
             IsEnabled := IsEnabled and Enabled;
             C.Parent := self;
             C.Enabled := IsEnabled;
             if IsEnabled
               then C.Color := clWindow
               else C.Color := DisabledControlColor;
           end
      else begin
             C.Parent := nil;
             C.Enabled := false;
           end;
  end;

procedure TtargetFilter_CustomFilter.DoOnKeyUp(Sender: TObject;var Key: Word; Shift: TShiftState);
  begin
  end;

procedure TtargetFilter_CustomFilter.AutoChangeValue;
  begin
  end;

procedure TtargetFilter_CustomFilter.WndProc(var Message: TMessage);
begin
  if Message.Msg = WM_SETTEXT then exit;
  if Message.Msg = TF_M_SetTabStop then begin
    SetA_TabStop(
                 (Message.WParam = 1)
                  and
                 ((Message.LParam = 0) or (Pointer(Message.LParam) = self))
                 );
  end;
  inherited;
end;

function  TtargetFilter_CustomFilter.Get_Disable_ConditionType_Combo : boolean;
  begin
    Result := not Condition_ComboBox.Enabled;
  end;

procedure TtargetFilter_CustomFilter.Set_Disable_ConditionType_Combo (const Value: boolean);
  begin
    Condition_ComboBox.Enabled := not Value;
    UpdateControlStatus;
  end;

procedure TtargetFilter_CustomFilter.SetInvalidFilterInfo(const Value: string);
  begin
    fImage.Hint := Value;
  end;

procedure TtargetFilter_CustomFilter.UpdateFilterStatus(aErrorType: TTargetFilter_ErrorType; aErrorInfo: string);
  begin
    FImage.Hint      := aErrorInfo;
    FImagePanel.Hint := aErrorInfo;

    if aErrorType = fetNoError then begin
      if 'TARGETFILTER_INDICATOR' = PrevImage then exit;
      FImage.Picture.Bitmap.LoadFromResourceName(HInstance,'TARGETFILTER_INDICATOR');
      FImage.Hint   := 'Фильтр активен и примет участие в фильтрации';
      FImage.Parent := FImagePanel;
      PrevImage := 'TARGETFILTER_INDICATOR';
      exit;
    end;

    if aErrorType = fetDesignTimeError then begin
      if 'TARGETFILTER_INVALIDFILTER_INDICATOR' = PrevImage then exit;
      FImage.Picture.Bitmap.LoadFromResourceName(HInstance,'TARGETFILTER_INVALIDFILTER_INDICATOR');
      FImage.Parent := FImagePanel;
      PrevImage := 'TARGETFILTER_INVALIDFILTER_INDICATOR';
      exit;
    end;

    if aErrorType = fetFilterNotActive then begin
      if '' = PrevImage then exit;
      FImage.Parent := nil;
      PrevImage := '';
      exit;
    end;

    if aErrorType = fetRealTimeError then begin
      if 'TARGETFILTER_INVALIDFILTER_INDICATOR' = PrevImage then exit;
      FImage.Picture.Bitmap.LoadFromResourceName(HInstance,'TARGETFILTER_INVALIDFILTER_INDICATOR');
      FImage.Parent := FImagePanel;
      PrevImage := 'TARGETFILTER_INVALIDFILTER_INDICATOR';
      exit;
    end;
  end;

procedure TtargetFilter_CustomFilter.acFocusFilterExecute(Sender: Tobject);
  begin
    FocusFilter(true);
  end;

procedure TtargetFilter_CustomFilter.acFocusFilterUpdate(Sender: TObject);

  function GetEnabled(C : TWinControl) : boolean;
    begin
      Result := true;
      if C = nil then exit;
      Result := C.Enabled and C.Visible and GetEnabled(C.Parent);
    end;

  begin
    TAction(Sender).Enabled := GetEnabled(Parent);
  end;

procedure TtargetFilter_CustomFilter.Seta_ShortCut(const Value: TShortCut);
  var
    i : integer;
    s : string;
  begin
    acFocusFilter.ShortCut := Value;
    a_Hint := a_Hint;
    s := tf_ShortCutToText(Value);
    if s <> ''
      then fShortCutLabel.Caption := '<'+s+'>'
      else fShortCutLabel.Caption := '';
    //   if Value <> 0 then MessageBox(0,PChar(tf_ShortCutToText(Value)),'',MB_OK);
  end;

function TtargetFilter_CustomFilter.Geta_ShortCut: TShortCut;
  begin
    Result := acFocusFilter.ShortCut;
  end;

procedure TtargetFilter_CustomFilter.FocusFilter(ForceFocus : boolean);
  var
    i : integer;
  begin
    Enabled := true;
    if not FilterFocused or ForceFocus then
      if Condition_ComboBox.CanFocus
        then Condition_ComboBox.SetFocus;
  end;

destructor TtargetFilter_CustomFilter.Destroy;
  begin
    try
      if acList.Owner = nil then acList.Free;
      Fa_ParamNames.Free;
    except
    end;
    inherited;
  end;

procedure TtargetFilter_CustomFilter.Seta_TabStop(const Value: boolean);
  begin
    Fa_TabStop := Value;
    Condition_ComboBox.TabStop := Value;
  end;

procedure TtargetFilter_CustomFilter.PublishedSeta_TabStop(const Value: boolean);
  begin
    //if FTargetFilter_Panel = nil then Seta_TabStop(Value);
  end;

procedure TtargetFilter_CustomFilter.DoEnter;
  begin
    inherited;
    if fTargetFilter_Panel <> nil then fTargetFilter_Panel.SetActiveFilter(self,self);
  end;

procedure TtargetFilter_CustomFilter.Seta_Hint(const Value: string);
  var
    i,j : integer;
    HStr : string;
    HintMayBeChanged : boolean;
  begin
    Fa_Hint := Value;
    HStr    := tf_ShortCutToText(a_ShortCut);
    if (Fa_Hint <> '') and (HStr <> '') then HStr := ' ('+HStr+')';
    HStr    := Fa_Hint + HStr;
    for i := 0 to ControlCount-1 do begin
      HintMayBeChanged := true;
      for j := 0 to high(DontChangeHintControls) do
        if Controls[i] = DontChangeHintControls[j] then begin
          HintMayBeChanged := false;
          break;
        end;
      if HintMayBeChanged
         then Controls[i].Hint := HStr;
    end;
  end;

function TtargetFilter_CustomFilter.Geta_SecondaryShortCuts: TShortCutList;
  begin
    Result := acFocusFilter.SecondaryShortCuts
  end;

procedure TtargetFilter_CustomFilter.Seta_SecondaryShortCuts(const Value: TShortCutList);
  begin
    acFocusFilter.SecondaryShortCuts := Value;
  end;

function TtargetFilter_CustomFilter.GetParamInfo: TTargetFilter_ParamInfo;
  begin
    InitTargetFilter_ParamInfo(Result);
  end;

procedure TtargetFilter_CustomFilter.Seta_ParamNames(const Value: TStringList);
  var
    i : integer;
  begin
    if Value.Count <> ParamCount then begin
      Application.MessageBox(PChar('Требуется параметров '+IntToStr(ParamCount)),
                             'Задание имён параметров',
                             MB_OK+MB_ICONWARNING);
      exit;
    end;

    for i := 0 to Value.Count - 1 do
      if Trim(Value[i]) = '' then begin
        Application.MessageBox(PChar('Пустое имя параметра '+IntToStr(ParamCount)+'!'),
                              'Задание имён параметров',
                              MB_OK+MB_ICONWARNING);
        exit;
      end;
    Fa_ParamNames.Assign(Value);
    UpdateFilterStr;
  end;

function TtargetFilter_CustomFilter.ParamCount: integer;
  begin
    Result := 0;
  end;

function TtargetFilter_CustomFilter.NeedInitParamNames : boolean;
  var
    i : integer;
  begin
    Result := Fa_ParamNames.Count < ParamCount;
    if not Result then
      for i := 0 to Fa_ParamNames.Count-1 do
        if (Fa_ParamNames[i] = '') or (Fa_ParamNames[i] = Name+'_param_'+IntToStr(i)) then begin
          Result := true;
          break;
        end;
  end;

procedure TtargetFilter_CustomFilter.InitParamNames;
  var
    i : integer;
  begin
    for i := Fa_ParamNames.Count to ParamCount-1 do Fa_ParamNames.Add('');
    for i := 0 to Fa_ParamNames.Count-1 do begin
      Fa_ParamNames[i] := Name+'_param_'+IntToStr(i);
    end;
  end;

procedure TtargetFilter_CustomFilter.SetName(const NewName: TComponentName);
  var
    fNeedInitParamNames : boolean;
  begin
    fNeedInitParamNames := NeedInitParamNames;
    inherited;
    if fNeedInitParamNames then InitParamNames;
  end;

procedure TtargetFilter_CustomFilter.SetServerType(const Value: TTargetFilter_ServerType);
  begin
    FServerType := Value;
    case a_ServerType of
      tfst_Oracle : begin
                      PreQuot  := '"';
                      PostQuot := '"';
                    end;
     tfst_MS_SQL : begin
                     PreQuot  := '[';
                     PostQuot := ']';
                   end;
    end;
    UpdateFilterStr;
  end;

function TtargetFilter_CustomFilter.GetDateStr(DT : TDateTime; NeedTime : boolean = false) : string;
  var
    Format : string;
    S      : string;
  begin
    case a_ServerType of
      tfst_Oracle : begin
                      if NeedTime
                        then begin
                               S := FormatDateTime('dd.mm.yyyy hh:nn:ss',DT);
                               Format := 'DD.MM.YYYY HH24:MI:SS';
                             end
                        else begin
                               S := FormatDateTime('dd.mm.yyyy',DT);
                               Format := 'DD.MM.YYYY';
                             end;
                      Result := 'TO_DATE('''+S+''','''+Format+''')';
                    end;
     tfst_MS_SQL : begin
                      if NeedTime
                        then begin
                               S := FormatDateTime('yyyy-mm-dd hh:nn:ss',DT);
                               Result := 'convert(datetime,'''+S+''',21)';
                             end
                        else begin
                               S := FormatDateTime('dd-mm-yyyy',DT);
                               Result := 'convert(datetime,'''+S+''',105)';
                             end;
                   end;
    end;
  end;

function TtargetFilter_CustomFilter.GetDatasetNumberStr(E : Extended) : string;
  var
    Format : string;
    i      : integer;
    S      : string;
  begin
    case a_ServerType of
      tfst_Oracle : begin
                      {S := FloatToStr(Number);
                      Format := StringReplace(S,ThousandSeparator,'',[rfReplaceAll]);
                      Format := StringReplace(Format,DecimalSeparator,'D',[rfReplaceAll]);
                      for i := 0 to 9 do
                        Format := StringReplace(Format,chr(ord('0')+i),'9',[rfReplaceAll]);
                      Format := StringReplace(Format,'-','',[rfReplaceAll]);
                      Format := StringReplace(Format,'+','',[rfReplaceAll]);

                      Result := 'TO_NUMBER('''+S+''','+
                                ''''+Format+''','+
                                ''' NLS_NUMERIC_CHARACTERS = '''''+
                                DecimalSeparator+ThousandSeparator+''''' '')';}
                    end;
     tfst_MS_SQL : begin
                      S := FloatToStr(E);
                      S := StringReplace(S,ThousandSeparator,'',[rfReplaceAll]);
                      S := StringReplace(S,DecimalSeparator,'.',[rfReplaceAll]);
                      Result := S;
                   end;
    end;
  end;

function TtargetFilter_CustomFilter.GetDatasetDateStr(D : TDateTime; NeedTime : boolean = false) : string;
  var
    Format : string;
    i      : integer;
    S      : string;
  begin
    case a_ServerType of
      tfst_Oracle : begin
                      {S := FloatToStr(Number);
                      Format := StringReplace(S,ThousandSeparator,'',[rfReplaceAll]);
                      Format := StringReplace(Format,DecimalSeparator,'D',[rfReplaceAll]);
                      for i := 0 to 9 do
                        Format := StringReplace(Format,chr(ord('0')+i),'9',[rfReplaceAll]);
                      Format := StringReplace(Format,'-','',[rfReplaceAll]);
                      Format := StringReplace(Format,'+','',[rfReplaceAll]);

                      Result := 'TO_NUMBER('''+S+''','+
                                ''''+Format+''','+
                                ''' NLS_NUMERIC_CHARACTERS = '''''+
                                DecimalSeparator+ThousandSeparator+''''' '')';}
                    end;
     tfst_MS_SQL : begin
                      if NeedTime
                        then Result := FormatDateTime('yyyy-mm-dd hh:nn:ss',D)
                        else Result := FormatDateTime('yyyy-mm-dd',D);
                   end;
    end;
  end;

function TtargetFilter_CustomFilter.GetNumberStr(Number : Extended) : string;
  var
    Format : string;
    i      : integer;
    S      : string;
  begin
    case a_ServerType of
      tfst_Oracle : begin
                      S := FloatToStr(Number);
                      Format := StringReplace(S,ThousandSeparator,'',[rfReplaceAll]);
                      Format := StringReplace(Format,DecimalSeparator,'D',[rfReplaceAll]);
                      for i := 0 to 9 do
                        Format := StringReplace(Format,chr(ord('0')+i),'9',[rfReplaceAll]);
                      Format := StringReplace(Format,'-','',[rfReplaceAll]);
                      Format := StringReplace(Format,'+','',[rfReplaceAll]);

                      Result := 'TO_NUMBER('''+S+''','+
                                ''''+Format+''','+
                                ''' NLS_NUMERIC_CHARACTERS = '''''+
                                DecimalSeparator+ThousandSeparator+''''' '')';
                    end;
     tfst_MS_SQL : begin
                      S := FloatToStr(Number);
                      S := StringReplace(S,ThousandSeparator,'',[rfReplaceAll]);
                      S := StringReplace(S,DecimalSeparator,'.',[rfReplaceAll]);
                      Result := S;
                   end;
    end;
  end;


function TtargetFilter_CustomFilter.GetColumnToChar(ServerVersion : boolean) : string;
  begin
    case a_ServerType of
      tfst_Oracle : Result := 'To_Char('+GetColumn(ServerVersion)+')';
      tfst_MS_SQL : Result := 'Convert(varchar,'+GetColumn(ServerVersion)+')';
    end;
  end;

function TtargetFilter_CustomFilter.GetNumberToCharStr(Number : Extended) : string;
  begin
    case a_ServerType of
      tfst_Oracle : Result := '''%''||To_Char('+GetNumberStr(Number)+')||''%''';
      tfst_MS_SQL : Result := '''%''+ Convert(varchar,'+GetNumberStr(Number)+')+''%''';
    end;
  end;

function TtargetFilter_CustomFilter.GetReplaceDecimalSeparatorInStrParam(ParamName: string): string;
  begin
    case a_ServerType of
      tfst_Oracle : Result := 'Replace(:'+ParamName+','''+DecimalSeparator+''','+
                                       '(select Substr(Value,1,1) from nls_session_parameters '+
                                       ' where parameter = ''NLS_NUMERIC_CHARACTERS''))';
      tfst_MS_SQL : Result := ':'+ParamName;
    end;
  end;

procedure TtargetFilter_CustomFilter.SetEnabled(Value: boolean);
  var
    i : integer;
  begin
    inherited;
    UpdateControlStatus;
  end;

procedure TtargetFilter_CustomFilter.UpdateControlStatus;
  begin
    if Condition_ComboBox.Enabled and Enabled
      then Condition_ComboBox.Color := clWindow
      else Condition_ComboBox.Color := clBtnFace;
  end;

function TtargetFilter_CustomFilter.GetEditControlCount: integer;
  begin
    Result := 1;
  end;

function TtargetFilter_CustomFilter.GetEditControl(i: integer; outVisualColumn : Pointer = nil): TWinControl;
  begin
    Result := nil;
    if i = 0 then begin
      Result := Condition_ComboBox;
      if outVisualColumn <> nil then integer(outVisualColumn^) := 0;
    end;
  end;

function TtargetFilter_CustomFilter.DoNotDisturb_IamInEditing: boolean;
  begin
    Result := false;
  end;

function TtargetFilter_CustomFilter.GetExtended(V : Variant) : Extended;
  begin
    if VarIsNull(V) or VarIsEmpty(V)
      then Result := 0
      else Result := V;
  end;

procedure TtargetFilter_CustomFilter.LoadValue(V: Variant);
  begin
    if not OnFilterChangedEnabled then begin
      OnFilterChangedEnabled := true;
      LastOnFilterChangedStr := '<?>';
    end;
    UpdateFilterStr;
  end;

function TtargetFilter_CustomFilter.FilterFocused: boolean;
  var
    i  : integer;
    C : TWinControl;
    b : boolean;
  begin
    Result := true;
    for i := 0 to GetEditControlCount - 1 do begin
      C := GetEditControl(i);
      b := C.Focused;
      b := (C is TComboBox) and (TComboBox(C).DroppedDown);
      b := (C is TDBLookupComboBox) and (TDBLookupComboBox(C).ListVisible);
      b := (C is TTarget_DBLookupComboBox) and (TTarget_DBLookupComboBox(C).ListVisible);

      if C.Focused or
         (C is TComboBox) and (TComboBox(C).DroppedDown)
         or
         (C is TDBLookupComboBox) and (TDBLookupComboBox(C).ListVisible)
         or
         (C is TTarget_DBLookupComboBox) and (TTarget_DBLookupComboBox(C).ListVisible)
         then exit;
    end;
    Result := false;
  end;

procedure TtargetFilter_CustomFilter.SetFocus;
begin
  inherited;
  FocusFilter(false);
end;

procedure TtargetFilter_CustomFilter.Seta_GoingToUseDatasetFilter(const Value: boolean);
begin
  Fa_GoingToUseDatasetFilter := Value;
end;

function TtargetFilter_CustomFilter.EditAreaMinWidth: integer;
  begin
    Result := fa_EditAreaMinWidth;
  end;

procedure TtargetFilter_CustomFilter.SetServerFieldName(const Value: string);
begin
  FServerFieldName := Value;
  UpdateFilterStr;
end;

function TtargetFilter_CustomFilter.GetServerFieldName: string;
  begin
    if FServerFieldName = ''
      then Result := FFieldName
      else Result := FServerFieldName;
  end;

function TtargetFilter_CustomFilter.SetDefaultConditionTypeIfNone: boolean;
  begin
    Result := Condition_ComboBox.ItemIndex = 0;
  end;

procedure TtargetFilter_CustomFilter.AddDontChangeHintControls(
  C: TControl);
begin
  SetLength(DontChangeHintControls,length(DontChangeHintControls)+1);
  DontChangeHintControls[high(DontChangeHintControls)] := C;
end;

procedure TtargetFilter_CustomFilter.SetOnFilterChangedEnabled(
  const Value: boolean);
begin
  FOnFilterChangedEnabled := Value;
end;

procedure TtargetFilter_CustomFilter.Seta_ListFontSizeMoreThanThatOfCombo(
  const Value: integer);
var
  i : integer;
begin
  Fa_ListFontSizeMoreThanThatOfCombo := Value;
  for i := 0 to ComponentCount-1 do
    if Components[i] is TTarget_DBLookupComboBox then
      TTarget_DBLookupComboBox(Components[i]).a_ListFontSizeMoreThanThatOfCombo := fa_ListFontSizeMoreThanThatOfCombo;
end;

{ TTargetFilter_ComboBox }

procedure TTargetFilter_ComboBox.CloseUp;
  begin
    inherited;
    if Assigned(OnChange) then OnChange(self);
    if Assigned(Parent) and (Parent is TTargetFilter_CustomFilter) then begin
      (Parent as TTargetFilter_CustomFilter).OnFilterChangedEnabled := true;
      (Parent as TTargetFilter_CustomFilter).CallOnFilterChanged(true);
    end;
  end;

procedure TTargetFilter_ComboBox.DropDown;
  begin
    inherited;
    if Assigned(Parent) and (Parent is TTargetFilter_CustomFilter) then
      With Parent as TTargetFilter_CustomFilter do begin
        OnFilterChangedEnabled := false;
      end;
  end;

function TTargetFilter_ComboBox.Focused: boolean;
  begin
    Result := Inherited Focused;
    if Result
      then Result := GetFocus <> 0;
  end;

procedure TTargetFilter_ComboBox.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Space then begin
    DroppedDown := true;
    exit;
  end;
  inherited;
end;

procedure TTargetFilter_ComboBox.WndProc(var Message: TMessage);
  var
    CBScreenRect : TRect;
  begin
    if Message.Msg = CB_GETCOUNT then begin
      CBScreenRect := BoundsRect;
      CBScreenRect.TopLeft := ClientToScreen(Point(CBScreenRect.Left,CBScreenRect.Top));
      CBScreenRect.BottomRight := ClientToScreen(Point(CBScreenRect.Right,CBScreenRect.Bottom));
      DropDownCount  := Max(CBScreenRect.Top,Screen.Height-1-CBScreenRect.Bottom) div ItemHeight;
    end;
    inherited;
  end;

end.


