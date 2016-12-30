unit comp_TargetFilter_Panel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  stdctrls,ExtCtrls,TargetFilter_Utils;
type
  TTargetFilterRec = record
                       Filter : TWinControl;
                       FilterStr : string;
                       DatasetFilterStr : string;
                       ParamInfo : TTargetFilter_ParamInfo;
                     end;
  TOrAnd = (oaOr,oaAnd);
  TTargetFilter_Panel = class;
  TTargetFilter_Panel_OnFilterChanged = procedure (Sender : TTargetFilter_Panel) of object;
  TTargetFilter_Panel_OnFilterEnter   = procedure (Sender : TWinControl) of object;

  TTargetFilter_ORAnd = class;

  TTargetFilter_Panel_OnSetNewFilter = procedure (Sender : TTargetFilter_Panel;
                                                  Filter : TWinControl) of object;

  TTargetFilter_Panel = class(TPanel)
  private
    FTargetFilter_Panel : TTargetFilter_Panel;
    FMultilineFilter: boolean;
    FNeedWhereWord: boolean;
    filters : array of TTargetFilterRec;
    OrAnds  : array of TTargetFilter_OrAnd;
    FFilterMemo: TMemo;
    Fa_OrAnd: TOrAnd;
    Fa_OrAnd_AutoColors: boolean;
    StoredColor : TColor;
    fa_OnFilterChanged : TTargetFilter_Panel_OnFilterChanged;
    Fa_TabStop: boolean;
    FActiveFilter: TWinControl;
    Fa_OnFilterEnter: TTargetFilter_Panel_OnFilterEnter;
    FOnSetNewFilter: TTargetFilter_Panel_OnSetNewFilter;
    FEnableOnlyActiveFilter: boolean;
    function GetFilterStr : string;
    function GetParamInfo : TTargetFilter_ParamInfo;
    procedure SetMultilineFilter(const Value: boolean);
    procedure SetNeedWhereWord(const Value: boolean);
    procedure SetFilterStr(const Value: string);
    procedure SetFilterMemo(const Value: TMemo);
    procedure Seta_OrAnd(const Value: TOrAnd);
    procedure Seta_OrAnd_AutoColors(const Value: boolean);
    function Geta_AndColor: TColor;
    function Geta_OrColor: TColor;
    procedure Seta_AndColor(const Value: TColor);
    procedure Seta_OrColor(const Value: TColor);
    procedure Seta_TabStop(const Value: boolean);
    procedure UpdateFilterMemo;
    function getFilterCount: integer;
    procedure UpdateOrAndState;
    procedure SetOnSetNewFilter(
      const Value: TTargetFilter_Panel_OnSetNewFilter);
    function GetFilterControl(i: integer): TWinControl;
    function GetDatasetFilterStr: string;
    procedure SetDatasetFilterStr(const Value: string);
    { Private declarations }
  protected
    procedure Loaded; override;
    procedure UpdateFilterStr;
    procedure SetParent(AParent: TWinControl); override;
    procedure WndProc (var Message : TMessage); override;
    procedure SetEnabled (Value : boolean); override;
  private
    fOrAnd_Colors : array [oaOr..oaAnd] of TColor;
    LastOnChangedFilterStr : string;
  public
    property EnableOnlyActiveFilter : boolean read FEnableOnlyActiveFilter;
    property OnSetNewFilter : TTargetFilter_Panel_OnSetNewFilter read FOnSetNewFilter write SetOnSetNewFilter;
    property ActiveFilter : TWinControl read fActiveFilter;
    procedure GetNextFilter(GoForward : boolean);
    constructor Create (AOwner : TComponent); override;
    procedure SetFilter    (F : TWinControl; aFilterStr : string; aParamInfo : TTargetFilter_ParamInfo; aDatasetFilterStr : string);
    procedure RemoveFilter (F : TWinControl);

    procedure RegisterOrAnd   (OA : TTargetFilter_OrAnd);
    procedure UnregisterOrAnd (OA : TTargetFilter_OrAnd);

    property Filter : string read GetFilterStr write SetFilterStr;
    property DatasetFilter : string read GetDatasetFilterStr write SetDatasetFilterStr;
    property ParamInfo : TTargetFilter_ParamInfo read GetParamInfo;
    procedure SetActiveFilter          (Sender : TWinControl; const Value: TWinControl);
    procedure SetEnableOnlyActiveFilter(Sender : TWinControl;  const Value: boolean);

    procedure SetFilterTabStop_OnlyIfActive(Value : boolean);
    property FilterCount : integer read getFilterCount;
    property FilterControl [i : integer] : TWinControl read GetFilterControl;
    { Public declarations }
  published
    property a_Filter_NeedWhereWord   : boolean read FNeedWhereWord write SetNeedWhereWord default false;
    property a_Filter_MultilineFilter : boolean read FMultilineFilter write SetMultilineFilter default true;
    property a_FilterStr : string read GetFilterStr write SetFilterStr stored false;
    property a_FilterMemo : TMemo read FFilterMemo write SetFilterMemo;
    property a_OrAnd : TOrAnd read Fa_OrAnd write Seta_OrAnd default oaAnd;
    property a_OrAnd_AutoColors : boolean read Fa_OrAnd_AutoColors write Seta_OrAnd_AutoColors;
    property a_OrColor  : TColor read Geta_OrColor write Seta_OrColor default $00C2CAC1;
    property a_AndColor : TColor read Geta_AndColor write Seta_AndColor default $00C1CFD0;
    property a_OnFilterChanged : TTargetFilter_Panel_OnFilterChanged read fa_OnFilterChanged write fa_OnFilterChanged;
    property a_TabStop : boolean read Fa_TabStop write Seta_TabStop default true;
    property a_OnFilterEnter : TTargetFilter_Panel_OnFilterEnter read Fa_OnFilterEnter write Fa_OnFilterEnter;
    { Published declarations }
  end;

  TTargetFilter_OrAnd = class(TPanel)
                      private
                        fa_TargetFilter_Panel: TTargetFilter_Panel;
                        PrevRadioButtonColor     : TColor;
                        PrevRadioButtonFontColor : TColor;
    Fa_OrAndChange: TNotifyEvent;
                        procedure Seta_TargetFilter_Panel(const Value: TTargetFilter_Panel);
                        function Geta_OrAnd: TOrAnd;
                        procedure Seta_OrAnd(const Value: TOrAnd);
                        function GetA_RadioButton_FromBorderShift: integer;
                        procedure SetA_RadioButton_FromBorderShift(const Value: integer);
                        procedure RadioButtonEnter(Sender: TObject);
                        procedure RadioButtonExit(Sender: TObject);
    procedure Seta_OrAndChange(const Value: TNotifyEvent);
                      protected
                        procedure Loaded; override;
                        procedure SetParent(AParent: TWinControl); override;
                      public
                        rbOr, rbAnd : TRadioButton;
                        procedure RbKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
                        constructor Create (AOwner : TComponent); override;
                        procedure DoSetOrAnd(OrAnd : TOrAnd);
                        destructor Destroy; override;
                        procedure RBOnClick (Sender : TObject);
                        procedure SetEnabled(Value: Boolean); override;
                        procedure SetFocus; override;
                      published
                        property a_OrAndChange : TNotifyEvent read Fa_OrAndChange write Seta_OrAndChange;
                        property a_TargetFilter_Panel : TTargetFilter_Panel
                          read fa_TargetFilter_Panel write Seta_TargetFilter_Panel;
                        property a_OrAnd : TOrAnd read Geta_OrAnd write Seta_OrAnd;
                        property a_RadioButton_FromBorderShift : integer
                          read  GetA_RadioButton_FromBorderShift
                          write SetA_RadioButton_FromBorderShift
                          default 2;
                      end;

procedure Register;

implementation
 uses comp_TargetFilter_CustomFilter;

procedure Register;
begin
  RegisterComponents('TargetDB', [TtargetFilter_Panel]);
  RegisterComponents('TargetDB', [TtargetFilter_OrAnd]);
end;

{ TtargetFilter_Panel }

function  TtargetFilter_Panel.GetParamInfo : TTargetFilter_ParamInfo;
  var
    StrDivider : string;
    i,j : integer;
  const
    OrAndOperator : array[oaOr..oaAnd] of string = ('OR','AND');
  begin
    InitTargetFilter_ParamInfo(Result);
    if fMultilineFilter
      then StrDivider := #13#10
      else StrDivider := '';

    for i := low(filters) to high(filters) do
      if filters[i].ParamInfo.ParamFilterStr <> '' then begin
        if Result.ParamFilterStr <> '' then
           Result.ParamFilterStr := Result.ParamFilterStr + OrAndOperator[a_OrAnd]+StrDivider;
        Result.ParamFilterStr := Result.ParamFilterStr
                                  + '  '+StringReplace(filters[i].ParamInfo.ParamFilterStr,
                                                       StrDivider, StrDivider + '  ',[rfReplaceAll]) + '  ' + StrDivider;
        if length(filters[i].ParamInfo.Params) > 0 then begin
           SetLength(Result.Params,Length(Result.Params) + Length(filters[i].ParamInfo.Params));
           for j := 0 to high(filters[i].ParamInfo.Params) do
             Result.Params[Length(Result.Params)-Length(filters[i].ParamInfo.Params)+j] :=
               filters[i].ParamInfo.Params[j];
        end;
      end;
    if Result.ParamFilterStr <> '' then
      Result.ParamFilterStr := ' ( '+ StrDivider + Result.ParamFilterStr + ' ) ';
    if fNeedWhereWord and (FTargetFilter_Panel = nil) and (Result.ParamFilterStr <> '')
      then Result.ParamFilterStr := ' where ' + StrDivider + Result.ParamFilterStr;
  end;

function TtargetFilter_Panel.GetFilterStr: string;
  var
    StrDivider : string;
    i : integer;
  const
    OrAndOperator : array[oaOr..oaAnd] of string = ('OR','AND');
  begin
    Result := '';
    if fMultilineFilter
      then StrDivider := #13#10
      else StrDivider := '';

    for i := low(filters) to high(filters) do
      if filters[i].FilterStr <> '' then begin
        if Result <> '' then
           Result := Result + OrAndOperator[a_OrAnd]+StrDivider;
        Result := Result + '  '+StringReplace(filters[i].FilterStr,
                                             StrDivider, StrDivider + '  ',[rfReplaceAll]) + '  ' + StrDivider;
      end;
    if Result <> '' then
      Result := ' ( '+ StrDivider + Result + ' ) ';
    if fNeedWhereWord and (FTargetFilter_Panel = nil) and (Result <> '')
      then Result := ' where ' + StrDivider + Result;
  end;

function TtargetFilter_Panel.GetDatasetFilterStr: string;
  var
    StrDivider : string;
    i : integer;
  const
    OrAndOperator : array[oaOr..oaAnd] of string = ('OR','AND');
  begin
    Result := '';
    for i := low(filters) to high(filters) do
      if filters[i].DatasetFilterStr <> '' then begin
        if Result <> '' then
           Result := Result + OrAndOperator[a_OrAnd];
        Result := Result + '  '+filters[i].DatasetFilterStr + '  ';
      end;
    if Result <> '' then
      Result := ' ( '+ Result + ' ) ';
  end;

procedure TtargetFilter_Panel.SetMultilineFilter(const Value: boolean);
  begin
    FMultilineFilter := Value;
    UpdateFilterStr;
  end;

procedure TtargetFilter_Panel.SetNeedWhereWord(const Value: boolean);
  begin
    FNeedWhereWord := Value;
    UpdateFilterStr;
  end;

procedure TtargetFilter_Panel.SetFilterStr(const Value: string);
  begin

  end;

procedure TtargetFilter_Panel.SetDatasetFilterStr(const Value: string);
  begin

  end;

procedure TTargetFilter_Panel.RegisterOrAnd    (OA : TTargetFilter_OrAnd);
  var
    i : integer;
  begin
    OA.DoSetOrAnd(a_OrAnd);
    for i := low(OrAnds) to high(OrAnds) do
      if OrAnds[i] = OA then begin
        exit;
      end;
    SetLength(OrAnds,Length(OrAnds)+1);
    OrAnds[high(OrAnds)] := OA;
  end;

procedure TTargetFilter_Panel.UnregisterOrAnd (OA : TTargetFilter_OrAnd);
  var
    i,j : integer;
  begin
    for i := low(OrAnds) to high(OrAnds) do
      if OrAnds[i] = OA then begin
        for j := i to high(OrAnds)-1 do
          OrAnds[j] := OrAnds[j+1];
        SetLength(OrAnds,length(OrAnds)-1);
        exit;
      end;
  end;

procedure TTargetFilter_Panel.UpdateOrAndState;
  var
    i : integer;
  begin
    for i := low(OrAnds) to high(OrAnds) do
      OrAnds[i].Enabled := FilterCount > 0;
  end;

procedure TTargetFilter_Panel.SetFilter(F: TWinControl; aFilterStr : string; aParamInfo : TTargetFilter_ParamInfo; aDatasetFilterStr : string);
  var
    i : integer;
  begin
    for i := low(filters) to high(filters) do
      if filters[i].Filter = f then begin
        filters[i].FilterStr := aFilterStr;
        filters[i].DatasetFilterStr := aDatasetFilterStr;
        AssignTargetFilter_ParamInfo(aParamInfo,filters[i].ParamInfo);
        UpdateFilterStr;
        exit;
      end;

    SetLength(filters,Length(filters)+1);
    filters[high(filters)].Filter    := F;
    filters[high(filters)].FilterStr := aFilterStr;
    filters[high(filters)].DatasetFilterStr := aDatasetFilterStr;
    AssignTargetFilter_ParamInfo(aParamInfo,filters[high(filters)].ParamInfo);
    UpdateFilterStr;
    if Length(filters) = 1 then UpdateOrAndState;
    if Assigned(FOnSetNewFilter)
      then begin
            //MessageBox(0,'cc','cc',mb_ok);
            FOnSetNewFilter(self,F);
           end;
  end;

procedure TTargetFilter_Panel.RemoveFilter(f: TWinControl);
  var
    i,j : integer;
  begin
    if fActiveFilter = F then fActiveFilter := nil;
    for i := low(filters) to high(filters) do
      if filters[i].Filter = f then begin
        for j := i to high(filters)-1 do
          filters[j] := filters[j+1];
        SetLength(filters,length(filters)-1);
        UpdateFilterStr;
        if Length(filters) = 0 then UpdateOrAndState;
        exit;
      end;
  end;

constructor TTargetFilter_Panel.Create(AOwner: TComponent);
  begin
    Inherited;

    fOrAnd_Colors [oaOr]  := $00C2CAC1;
    fOrAnd_Colors [oaAnd] := $00C1CFD0;
    Caption := '';
    StoredColor := clBtnFace;
    SetBounds(Left,Top,100,80);
    fa_TabStop := true;
    Fa_OrAnd              := oaAnd;
    FMultilineFilter      := true;
  end;

procedure TTargetFilter_Panel.Loaded;
 begin
   inherited;
   Caption := '';
   if (Parent is TTargetFilter_Panel) and
      (Parent <> FTargetFilter_Panel) then begin
      FTargetFilter_Panel := TTargetFilter_Panel(Parent);
      UpdateFilterStr;
    end;
 end;

procedure TTargetFilter_Panel.UpdateFilterMemo;
  begin
    if FFilterMemo <> nil then
      FFilterMemo.Text := a_FilterStr+#13#10+'-------------------------------------'+#13#10+
                          GetDatasetFilterStr+#13#10+'-------------------------------------'+#13#10+
                          ParamInfo.ParamFilterStr;

  end;

procedure TTargetFilter_Panel.SetFilterMemo(const Value: TMemo);
 begin
   FFilterMemo := Value;
   UpdateFilterMemo;
 end;

procedure TTargetFilter_Panel.UpdateFilterStr;
  begin
    if FTargetFilter_Panel <> nil then FTargetFilter_Panel.SetFilter(self,GetFilterStr,GetParamInfo,GetDatasetFilterStr);
    UpdateFilterMemo;
    if not (csDestroying	in ComponentState) and
      Assigned(fa_OnFilterChanged) and
      (LastOnChangedFilterStr <> a_FilterStr) then begin
      LastOnChangedFilterStr := a_FilterStr;
      fa_OnFilterChanged(self);
    end;
  end;

procedure TTargetFilter_Panel.SetParent(AParent: TWinControl);
  begin
    if not (csLoading in ComponentState) then begin
      if (FTargetFilter_Panel <> nil) then FTargetFilter_Panel.RemoveFilter(self);
      FTargetFilter_Panel := nil;
    end;
    inherited;
    if not (csLoading in ComponentState) then begin
     Caption := '';
     if (Parent <> nil) and (Parent is TTargetFilter_Panel)
       then begin
              FTargetFilter_Panel := Parent as TTargetFilter_Panel;
              UpdateFilterStr;
            end;
    end;
  end;


procedure TTargetFilter_Panel.Seta_OrAnd(const Value: TOrAnd);
  var
    i : integer;
    Changed : boolean;
  begin
    Changed := Fa_OrAnd <> Value;
    Fa_OrAnd := Value;
    a_OrAnd_AutoColors := a_OrAnd_AutoColors;
    UpdateFilterStr;
    for i := low(OrAnds) to high(OrAnds) do
      OrAnds[i].DoSetOrAnd(a_OrAnd);
  end;

procedure TTargetFilter_Panel.Seta_OrAnd_AutoColors(const Value: boolean);
  begin
    if (not Fa_OrAnd_AutoColors) and (Color <> a_OrColor) and (Color <>  a_AndColor)
      then StoredColor := Color;
    Fa_OrAnd_AutoColors := Value;
    if Value
      then Color := fOrAnd_Colors[a_OrAnd]
      else Color := StoredColor;
  end;

function TTargetFilter_Panel.Geta_AndColor: TColor;
  begin
    Result := fOrAnd_Colors[oaAnd];
  end;

function TTargetFilter_Panel.Geta_OrColor: TColor;
  begin
    Result := fOrAnd_Colors[oaOr];
  end;

procedure TTargetFilter_Panel.Seta_AndColor(const Value: TColor);
  begin
    fOrAnd_Colors[oaAnd] := Value;
    a_OrAnd_AutoColors := a_OrAnd_AutoColors;
  end;

procedure TTargetFilter_Panel.Seta_OrColor(const Value: TColor);
  begin
    fOrAnd_Colors[oaOr] := Value;
    a_OrAnd_AutoColors := a_OrAnd_AutoColors;
  end;



procedure TTargetFilter_Panel.Seta_TabStop(const Value: boolean);
  var
    i : integer;
    fTabStop : integer;

  begin
    Fa_TabStop := Value;
    if Value
      then fTabStop := 1
      else fTabStop := 0;
    for i := low(Filters) to high(Filters) do
      PostMessage(Filters[i].Filter.Handle,TF_M_SetTabStop,fTabStop,0);
  end;

procedure TTargetFilter_Panel.WndProc(var Message: TMessage);
  var
    i : integer;
  begin
    if Message.Msg = TF_M_SetTabStop then begin
      for i := low(Filters) to high(Filters) do
        PostMessage(Filters[i].Filter.Handle,Message.Msg,Message.WParam,Message.LParam);
      exit;
    end;
    inherited;
  end;

procedure TTargetFilter_Panel.SetEnableOnlyActiveFilter(Sender : TWinControl; const Value: boolean);
  var
    i : integer;
  begin
    FEnableOnlyActiveFilter := Value;
    for i := 0 to ControlCount - 1 do
      Controls[i].Enabled := not Value or (Controls[i] = ActiveFilter);

    for i := low(Filters) to high(Filters) do
      if (Filters[i].Filter is TTargetFilter_Panel) and (Filters[i].Filter <> Sender) then
        TTargetFilter_Panel(Filters[i].Filter).SetEnableOnlyActiveFilter(self,Value);
    if (FTargetFilter_Panel <> nil) and (FTargetFilter_Panel <> Sender)
      then FTargetFilter_Panel.SetEnableOnlyActiveFilter(self,Value);
  end;

procedure TTargetFilter_Panel.SetActiveFilter(Sender : TWinControl; const Value: TWinControl);
  var
    i : integer;
  begin
    if EnableOnlyActiveFilter and (FActiveFilter <> nil) and (FActiveFilter <> Value) then FActiveFilter.Enabled := false;
    FActiveFilter := Value;

    for i := low(Filters) to high(Filters) do
      if (Filters[i].Filter is TTargetFilter_Panel) and (Filters[i].Filter <> Sender) then
        TTargetFilter_Panel(Filters[i].Filter).SetActiveFilter(self,Value);
    if (FTargetFilter_Panel <> nil) and (FTargetFilter_Panel <> Sender)
      then FTargetFilter_Panel.SetActiveFilter(self,Value);
    if Assigned(Fa_OnFilterEnter) then Fa_OnFilterEnter(Value);
  end;

procedure TTargetFilter_Panel.SetFilterTabStop_OnlyIfActive(Value: boolean);
  var
    fTabStop : integer;
    i : integer;
  begin
    if Value
      then fTabStop := 1
      else fTabStop := 0;
    for i := low(Filters) to high(Filters) do
      PostMessage(Filters[i].Filter.Handle,TF_M_SetTabStop,fTabStop,integer(fActiveFilter));
  end;


function TTargetFilter_Panel.getFilterCount: integer;
  begin
    Result := length(Filters);
  end;

procedure TTargetFilter_Panel.SetEnabled(Value: boolean);
  var
    i : Integer;
  begin
    inherited;
    for i := 0 to ControlCount -1 do
      Controls[i].Enabled := Value and (not EnableOnlyActiveFilter or (Controls[i] = ActiveFilter));
  end;

procedure TTargetFilter_Panel.SetOnSetNewFilter(const Value: TTargetFilter_Panel_OnSetNewFilter);
begin
  FOnSetNewFilter := Value;
end;

function TTargetFilter_Panel.GetFilterControl(i: integer): TWinControl;
  begin
    Result := Filters[i].Filter;
  end;

procedure TTargetFilter_Panel.GetNextFilter(GoForward: boolean);
  var
    F : TCustomForm;
    AC : TWinControl;
    FToFocusID,i  : integer;
    FToFocus : TWinControl;
  begin
    if ActiveFilter = nil then exit;

    AC := nil;
    F := GetParentForm(self);
    if (F <> nil) and not targetFilter_Utils.HasParent(F.ActiveControl,self)
      then AC := F.ActiveControl;

    for i := 0 to FilterCount- 1 do
      if FilterControl[i] = ActiveFilter then begin
        if GoForward
          then FToFocusId := i + 1
          else FToFocusId := i - 1;
        if     (FToFocusID >= 0)
           and (FToFocusID <= FilterCount-1)
           and (FilterControl[FToFocusID] is TtargetFilter_CustomFilter) then
            TtargetFilter_CustomFilter(FilterControl[FToFocusID]).FocusFilter(true);
        break;
      end;

    if (AC <> nil) and (F.ActiveControl <> AC)
      then F.ActiveControl := AC;
  end;

{ TTargetFilter_ORAnd }

constructor TTargetFilter_ORAnd.Create(AOwner: TComponent);
begin
  inherited;
  SetBounds(0,0,46,36);
  rbOr    := TRadioButton.Create(self);
  Caption := '';
  with rbOr do begin
    OnEnter := RadioButtonEnter;
    OnExit  := RadioButtonExit;
    Checked := true;
    Caption := 'или';
    SetBounds(2,2,self.Width - 6,rbOr.Height);
    //Anchors := [akLeft,akRight,akTop];
    Anchors := [akLeft,akTop,akRight];
    Parent := self;
    OnClick := RBOnClick;
    Enabled := false;
    OnKeyDown := RbkeyDown;
  end;
  rbAnd := TRadioButton.Create(self);
  with rbAnd do begin
    OnEnter := RadioButtonEnter;
    OnExit  := RadioButtonExit;
    Caption := 'и';
    //Anchors := [akLeft,akRight,akBottom];
    Anchors := [akLeft,akBottom,akRight];
    SetBounds(2,self.Height-2-rbAnd.Height,rbOr.Width,rbAnd.Height);
    Parent := self;
    OnClick := RBOnClick;
    OnKeyDown := RbkeyDown;
  end;
  {ShowMessage('OA   .H   = '+IntToStr(Self.height)+#13+
              'rbAnd.H   = '+IntToStr(rbAnd.Height)+#13+
              'Shift     = 2'#13+
              'rbAnd.Top = '+IntToStr(rbAnd.Top)+#13+
              'rbOr.Top  = '+IntToStr(rbOr .Top));}
end;

procedure TTargetFilter_OrAnd.SetA_RadioButton_FromBorderShift(const Value: integer);
  begin
    rbOr .SetBounds(Value,Value,self.Width - 2*Value,rbOr .Height);
    rbAnd.SetBounds(Value,self.Height-Value-rbAnd.Height,rbOr.Width,rbAnd.Height);
    {ShowMessage('OA   .H   = '+IntToStr(Self.height)+#13+
                'rbAnd.H   = '+IntToStr(rbAnd.Height)+#13+
                'Shift     = '+IntToStr(Value)+#13+
                'rbAnd.Top = '+IntToStr(rbAnd.Top)+#13+
                'rbOr.Top  = '+IntToStr(rbOr .Top));}
  end;

function TTargetFilter_OrAnd.GetA_RadioButton_FromBorderShift : integer;
  begin
    Result := rbOr.Top;
  end;


destructor TTargetFilter_ORAnd.Destroy;
  begin
    if fa_TargetFilter_Panel <> nil then
       fa_TargetFilter_Panel.UnregisterOrAnd(self);
    fa_TargetFilter_Panel := nil;
    inherited;
  end;

procedure TTargetFilter_ORAnd.DoSetOrAnd(OrAnd: TOrAnd);
  begin
    if OrAnd = oaOr
      then rbOr.Checked  := true
      else rbAnd.Checked := true;
  end;

function TTargetFilter_ORAnd.Geta_OrAnd: TOrAnd;
  begin
    if rbOr.Checked
      then Result := oaOr
      else Result := oaAnd;
  end;

procedure TTargetFilter_OrAnd.Loaded;
begin
  inherited;
  a_RadioButton_FromBorderShift := a_RadioButton_FromBorderShift;
  Caption := '';
end;

procedure TTargetFilter_OrAnd.RBOnClick(Sender: TObject);
  begin
    a_OrAnd := a_OrAnd;
  end;

procedure TTargetFilter_ORAnd.Seta_OrAnd(const Value: TOrAnd);
  begin
    DoSetOrAnd(Value);
    if not (csLoading in ComponentState) and (fa_TargetFilter_Panel <> nil) then
       fa_TargetFilter_Panel.a_OrAnd := Value;
    if Assigned(Fa_OrAndChange) then Fa_OrAndChange(Self);
  end;

procedure TTargetFilter_ORAnd.Seta_TargetFilter_Panel(const Value: TTargetFilter_Panel);
  begin
    fa_TargetFilter_Panel := Value;
      if fa_TargetFilter_Panel <> nil then begin
        DoSetOrAnd(fa_TargetFilter_Panel.a_OrAnd);
        fa_TargetFilter_Panel.RegisterOrAnd(self);
        Enabled := fa_TargetFilter_Panel.FilterCount > 0;
      end
    else Enabled := false;
  end;

procedure TTargetFilter_ORAnd.SetParent(AParent: TWinControl);
  begin
    Inherited;
    if not (csLoading in ComponentState) then begin
     Caption := '';
    end;
  end;

procedure TTargetFilter_OrAnd.SetEnabled(Value: Boolean);
  begin
    inherited;
    rbOr.Enabled  := Value;
    rbAnd.Enabled := Value;
  end;

procedure TTargetFilter_OrAnd.SetFocus;
  begin
    inherited;
    if rbOr.Checked
      then rbOr.SetFocus
      else rbAnd.SetFocus;
  end;

procedure TTargetFilter_OrAnd.RbKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  rbToSelect : TRadioButton;
begin
  if (Key = vk_Space) and (Shift = []) then begin
    if Sender = rbOr
      then rbToSelect := rbAnd
      else rbToSelect := rbOr;
    rbToSelect.Checked := true;
    rbToSelect.SetFocus;
    rbToSelect.OnClick(rbToSelect);
    Key := 0;
  end;
end;

procedure TTargetFilter_OrAnd.RadioButtonEnter(Sender: TObject);
  begin
    if Sender is TRadioButton then begin
      PrevRadioButtonColor     := TRadioButton(Sender).Color;
      PrevRadioButtonFontColor := TRadioButton(Sender).Font.Color;
      TRadioButton(Sender).Color      := clHighlight;
      TRadioButton(Sender).Font.Color := clHighlightText;
    end;
  end;

procedure TTargetFilter_OrAnd.RadioButtonExit(Sender: TObject);
  begin
    if Sender is TRadioButton then begin
      TRadioButton(Sender).Color      := PrevRadioButtonColor;
      TRadioButton(Sender).Font.Color := PrevRadioButtonFontColor;
    end;
  end;


procedure TTargetFilter_OrAnd.Seta_OrAndChange(const Value: TNotifyEvent);
begin
  Fa_OrAndChange := Value;
end;

end.
