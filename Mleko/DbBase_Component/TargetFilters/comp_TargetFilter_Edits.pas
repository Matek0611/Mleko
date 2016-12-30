unit comp_TargetFilter_Edits;

interface
  uses windows,extctrls, controls, forms,sysutils,stdctrls,messages,classes,comctrls,dialogs,variants;
type
  TTarget_ValueValidEvent = function (Sender : TObject) : boolean of object;

  function CalcPanelFullBorderWidth (p : TPanel) : integer;

  function IsExtendedValue  (s : string;
                            IsMes : boolean = false;
                            CallerInfo : string = '';
                            PValue : Pointer = nil) : boolean; overload;
  function IsExtendedValue (s : string; var Value : extended) : boolean; overload;
  function PrepareSToConvertToFloat(S : string) : string;
  function IsIntValue      (s : string;
                            IsMes : boolean = false;
                            CallerInfo : string = '';
                            PValue : Pointer = nil) : boolean;
  procedure DecodeDateValue(s : string; var DateValue : TDate; var TimeValue : TTime; IsMes : boolean = false);
  function DecSep(S : string) : string;
type
   TTarget_Edit = class(TMemo)
                  private
                    fText        : string;
                    PrevOnChange : TNotifyEvent;
                    PrevOnExit   : TNotifyEvent;
                    PrevOnEnter  : TNotifyEvent;
                    fOnChangeStored : boolean;
                    af_Target_ValueValidEvent: TTarget_ValueValidEvent;
                    Fa_ForceValidate: boolean;
    FChangeOnInvalidValue: boolean;
                    function StoreEvents : boolean;
                    procedure RestoreEvents(Event : integer);
                    function GetText: string; virtual;
                    procedure SetText(const Txt: string);
    procedure Seta_ForceValidate(const Value: boolean);
    procedure SetChangeOnInvalidValue(const Value: boolean);
                  protected
                    procedure SetParent(AParent: TWinControl); override;
                    procedure Change; override;
                    function IsValueValid(NeedMess : boolean = false; MsgBoxTitle : string = '') : boolean; virtual;
                    procedure DoExit ; override;
                    procedure DoEnter; override;
                  public
                    fMsgBoxTitle : string;
                    fDisableValidateOnExit : boolean;
                    property ChangeOnInvalidValue : boolean read FChangeOnInvalidValue write SetChangeOnInvalidValue;
                    procedure WndProc (var msg : TMessage); override;
                    constructor Create (AOwner : TComponent); override;
                    procedure CreateParams(var Params: TCreateParams); override;
                  published
                    property Text : string read GetText write SetText;
                    property a_Target_ValueValidEvent : TTarget_ValueValidEvent read af_Target_ValueValidEvent write af_Target_ValueValidEvent;
                    property a_ForceValidate : boolean read Fa_ForceValidate write Seta_ForceValidate;
                  end;

  TTarget_NumberEdit   = class (TTarget_Edit)
                         private
                            Fa_UseConstraints: boolean;
                            Fa_Max: extended;
                            Fa_Min: extended;
                            DontDoAlignment : boolean;
                            procedure Seta_Max(const Value: extended);
                            procedure Seta_Min(const Value: extended);
                            procedure Seta_UseConstraints(const Value: boolean);
                            procedure Loaded;
                         private
                           InResettingAlignment : boolean;
                           function GetText: string; override;
                         protected
                           procedure KeyPress (var Key: Char); override;
                           procedure KeyDown(var Key: Word; Shift: TShiftState); override;
                           function IsCharValid (C : Char) : boolean; virtual; abstract;
                           procedure WndProc (var Message : TMessage); override;
                           function IndirCaseNumberName : string; virtual; abstract;
                           constructor Create (AOwner : TComponent); override;
                           procedure SetParent (AOwner : TWinControl); override;
                         public
                           procedure DoEnter; override;
                           procedure SetDefaultAlignment;
                           procedure DoExit ; override;
                         published
                           property a_Min : extended read Fa_Min write Seta_Min;
                           property a_Max : extended read Fa_Max write Seta_Max;
                           property a_UseConstraints : boolean read Fa_UseConstraints write Seta_UseConstraints;
                         end;

  TTarget_ExtEdit = class (TTarget_NumberEdit)
                            private
                              FDisplayFormat: string;
                              function  GetValue: extended;
                              procedure SetValue(const Value: extended);
                              function GetDecText: string;
                              procedure SetDisplayFormat(const F: string);
                              function GetVariantValue: Variant;
                              procedure SetVariantValue(const VariantValue: Variant);
                            protected
                              function IndirCaseNumberName : string; override;
                              function IsCharValid (C : Char) : boolean; override;
                            public
                              property Value : extended read GetValue write SetValue;
                              property VariantValue : Variant read GetVariantValue write SetVariantValue;
                              property DecText : string read GetDecText;
                              function IsValueValid(NeedMess : boolean = false; MsgBoxTitle : string = '') : boolean; override;
                              procedure DoEnter; override;
                              procedure DoExit ; override;
                              constructor Create (AOwner : TComponent); override;
                            published
                              property a_DisplayFormat : string read FDisplayFormat write SetDisplayFormat;
                            end;

  TTarget_IntEdit      = class (TTarget_NumberEdit)
                            private
                              function  GetValue: integer;
                              procedure SetValue(const Value: integer);
                            protected
                              function IndirCaseNumberName : string; override;
                              function IsCharValid (C : Char) : boolean; override;
                            public
                              property Value : integer read GetValue write SetValue;
                              function IsValueValid(NeedMess : boolean = false; MsgBoxTitle : string = '') : boolean; override;
                            end;
var
  TF_M_SetTabStop : cardinal;
  SetAlignmentMessage : integer;
type
  TTargetFilter_ParamType =
    (fptString,fptFloat,fptDate);
  TTargetFilter_ParamRec = record
                             ParamName  : string;
                             ParamType  : TTargetFilter_ParamType;
                             ParamValue : Variant;
                           end;
  TTargetFilter_ParamRecArr = array of TTargetFilter_ParamRec;
  TTargetFilter_ParamInfo = record
                              ParamFilterStr : string;
                              Params : TTargetFilter_ParamRecArr;
                            end;
  procedure InitTargetFilter_ParamInfo (var R : TTargetFilter_ParamInfo);
  procedure AssignTargetFilter_ParamInfo(InR  : TTargetFilter_ParamInfo;
                                         var OutR : TTargetFilter_ParamInfo);
  function tf_ShortCutToText(ShCt : TShortCut) : string;

  procedure Register;

implementation

  procedure Register;
    begin
      RegisterComponents('TargetDB', [TTarget_IntEdit]);
      RegisterComponents('TargetDB', [TTarget_ExtEdit]);
      //RegisterComponents('TargetDB', [TTarget_ExtEdit1]);
    end;

  function CalcPanelFullBorderWidth (p : TPanel) : integer;
    begin
      Result := 0;
      if p = nil then begin
        exit;
      end;
      Result := Result + p.BorderWidth;
      if p.BevelOuter <> bvNone then Result := Result + p.BevelWidth;
      if p.BevelInner <> bvNone then Result := Result + p.BevelWidth;
    end;

  function PrepareSToConvertToFloat(S : string) : string;
    begin
      Result := StringReplace (S     ,',',DecimalSeparator,[rfReplaceAll]);
      Result := StringReplace (Result,'.',DecimalSeparator,[rfReplaceAll]);
    end;

  function IsExtendedValue (s : string;
                            IsMes : boolean = false;
                            CallerInfo : string = '';
                            PValue : Pointer = nil) : boolean;
    var
      Value : extended;
    begin
      try
        s := PrepareSToConvertToFloat(s);
        Value := StrToFloat(s);
        if PValue <> nil then Extended(PValue^) := Value;
        Result := true;
      except
        on e : exception do begin
          if IsMes then begin
                          if CallerInfo <> #13 then CallerInfo := #13+CallerInfo;
                          Application.MessageBox(PChar('Неправильный формат числа:'#13+S+CallerInfo),
                                               'Ввод вещественного числа',0);
                        end;
          Result := false;
        end;
      end;
    end;

  function IsIntValue (s : string;
                       IsMes : boolean = false;
                       CallerInfo : string = '';
                       PValue : Pointer = nil) : boolean;
    var
      Value : integer;
    begin
      try
        Value := StrToInt(s);
        Result := true;
        if PValue <> nil then integer(PValue^) := Value;
      except
        on e : exception do begin
          if IsMes then begin
                          if CallerInfo <> #13 then CallerInfo := #13+CallerInfo;
                          Application.MessageBox(PChar('Неправильный формат числа:'#13+S+CallerInfo),
                                                 'Ввод целого числа',0);
                        end;
          Result := false;
        end;
      end;
    end;


  function IsExtendedValue (s : string; var Value : extended) : boolean;
    begin
      try
        s := PrepareSToConvertToFloat(s);
        Value := StrToFloat(s);
        Result := true;
      except
        Result := false;
      end;
    end;

  procedure DecodeDateValue(s : string; var DateValue : TDate; var TimeValue : TTime; IsMes : boolean = false);
    begin
      try
        (*DateValue := EncodeDate(StrToInt(Copy(DateValue,4,2)),
                                StrToInt(Copy(DateValue,4,2)),
                                StrToInt(Copy(DateValue,1,2))*);

      except
        on e : exception do begin
          if IsMes then Application.MessageBox(PChar('Введите дату в формате ''dd.mm.yyyy hh:nn:ss'''#13+
                                           'Введена дата: '''+s+'''')
                                    ,'Неправильный формат даты',MB_OK);
        end;
      end;
    end;

  function DecSep(S : string) : string;
    begin
      Result := StringReplace(S,     ',',DecimalSeparator,[]);
      Result := StringReplace(Result,'.',DecimalSeparator,[]);
      Result := StringReplace(Result,' ','',[rfReplaceAll]);
      Result := StringReplace(Result,ThousandSeparator,'',[rfReplaceAll]);
    end;


{ TTarget_ExtEdit }

function TTarget_ExtEdit.GetDecText: string;
  begin
    Result := Trim(DecSep(Text));
  end;

function TTarget_ExtEdit.GetValue: extended;
  begin
    if IsExtendedValue(DecText)
      then Result := StrToFloat(DecText)
      else Result := 0;
  end;

procedure TTarget_ExtEdit.SetValue(const Value: extended);
  var
    b : boolean;
  begin
    try
      b := StoreEvents;
      if Focused
        then Text := FormatFloat(FDisplayFormat,Value)
        else Text := FormatFloat(FDisplayFormat,Value);
    finally
      if b then ReStoreEvents(-100);
    end;
  end;

  function TTarget_ExtEdit.IsValueValid(NeedMess : boolean = false; MsgBoxTitle : string = '') : boolean;
    begin
      Result := IsExtendedValue(DecText);
      if MsgBoxTitle = '' then
        if fMsgBoxTitle = ''
          then MsgBoxTitle := 'Ошибка ввода'
          else MsgBoxTitle := fMsgBoxTitle;

      if not Result then begin
        if (a_ForceValidate or (Trim(Text) <> '')) and NeedMess then Application.MessageBox('Введённая строка не является числом!',
                                                                    PChar(MsgBoxTitle),
                                                                    MB_OK + MB_ICONINFORMATION);
        exit;
      end;
      Result := not a_UseConstraints or
               (Value >= a_Min) and (Value <= a_Max);
      if not Result and NeedMess then Application.MessageBox(PChar('Введите число в пределах'#13+
                                                             'от '+FloatToStr(a_Min)+#13+
                                                             'до '+FloatToStr(a_Max)),
                                                             PChar(MsgBoxTitle),
                                                             MB_OK + MB_ICONINFORMATION);
    end;

function TTarget_ExtEdit.IsCharValid(C: Char): boolean;
  begin
    Result := C in ['0'..'9','-','+','.',',',#8];
  end;

function TTarget_ExtEdit.IndirCaseNumberName: string;
  begin
    Result := 'вещественным';
  end;

procedure TTarget_ExtEdit.SetDisplayFormat(const F: string);
  var
    b : boolean;
  begin
    try
      b := StoreEvents;
      FDisplayFormat := F;
      if Text <> ''
        then Text := FormatFloat(FDisplayFormat,Value);
    finally
      if b then ReStoreEvents(-100);
    end;
  end;

procedure TTarget_ExtEdit.DoEnter;
  var
    b : boolean;
    b1 : boolean;
  begin
    try
      b := StoreEvents;
      //b1 := LockWindowUpdate(Handle);
      inherited;
      if Trim(Text) <> ''
        then Text := FormatFloat('#############0.#############',Value)
        else Text := '';
    finally
      if b then ReStoreEvents(1);
      //if b1 then LockWindowUpdate(0);
    end;
  end;

procedure TTarget_ExtEdit.DoExit;
  var
    b : boolean;
  begin
    if csDestroying in ComponentState then begin
      Inherited;
      exit;
    end;
    try
      b := StoreEvents;
      inherited;
      if Trim(Text) <> ''
        then Text := FormatFloat(FDisplayFormat,Value);
    finally
      if b then ReStoreEvents(-1);
    end;
  end;

constructor TTarget_ExtEdit.Create(AOwner: TComponent);
  begin
    //ShowMessage('TTarget_ExtEdit.Create');
    inherited;
    FDisplayFormat := '###,###,###,###,##0.#########';
  end;

function TTarget_ExtEdit.GetVariantValue: Variant;
  begin
    if not IsExtendedValue(DecText)
      then Result := Null
      else Result := Value;
  end;

procedure TTarget_ExtEdit.SetVariantValue(const VariantValue: Variant);
begin
  if VarIsNull(VariantValue)
    then Text := ''
    else Value := VariantValue;
end;

{ TTarget_IntEdit }

function TTarget_IntEdit.GetValue: integer;
  begin
    if IsIntValue(Trim(Text))
      then Result := StrToInt(Trim(Text))
      else Result := 0;
  end;

function TTarget_IntEdit.IndirCaseNumberName: string;
  begin
    Result := 'целым';
  end;

function TTarget_IntEdit.IsCharValid(C: Char): boolean;
  begin
    Result := C in ['0'..'9','-','+',#8];
  end;

  function TTarget_IntEdit.IsValueValid(NeedMess : boolean = false; MsgBoxTitle : string = '') : boolean;
    begin
      Result := IsIntValue(Trim(Text));
      if MsgBoxTitle = '' then
        if fMsgBoxTitle = ''
          then MsgBoxTitle := 'Ошибка ввода'
          else MsgBoxTitle := fMsgBoxTitle;
      if not Result then begin
        if (Trim(Text) <> '') and NeedMess then Application.MessageBox('Введённая строка не является целым числом!',
                                                                       PChar(MsgBoxTitle),
                                                                       MB_OK + MB_ICONINFORMATION);
        exit;
      end;
      Result := not a_UseConstraints or
               (Value >= trunc(a_Min)) and (Value <= trunc(a_Max));
      if not Result and NeedMess then Application.MessageBox(PChar('Введите целое число в пределах'#13+
                                                             'от '+FloatToStr(trunc(a_Min))+#13+
                                                             'до '+FloatToStr(trunc(a_Max))),
                                                             PChar(MsgBoxTitle),
                                                             MB_OK + MB_ICONINFORMATION);
    end;

procedure TTarget_IntEdit.SetValue(const Value: integer);
  begin
    Text := IntToStr(Value);
  end;

{ TTarget_NumberEdit }

constructor TTarget_NumberEdit.Create(AOwner: TComponent);
  begin
    //ShowMessage('TTarget_NumberEdit.Create');
    inherited;
  end;

procedure TTarget_NumberEdit.SetDefaultAlignment;
  begin
    if Focused
      then PostMessage(Handle,SetAlignmentMessage,integer(taLeftJustify),100)
      else PostMessage(Handle,SetAlignmentMessage,integer(taRightJustify),100)
  end;

procedure TTarget_NumberEdit.DoEnter;
  var
    b : boolean;
  begin
    if InResettingAlignment then begin
      Inherited;
      exit;
    end;
    PostMessage(Handle,SetAlignmentMessage,integer(taLeftJustify),1);
  end;

procedure TTarget_NumberEdit.DoExit;
  var
    b : boolean;
  begin
    if csDestroying in ComponentState then begin
      Inherited;
      exit;
    end;

    if not fDisableValidateOnExit and not IsValueValid(true) and ((Trim(Text) <> '') or a_ForceValidate) then begin
      SetFocus;
      exit;
    end;

    if Assigned(af_Target_ValueValidEvent) and not af_Target_ValueValidEvent(self) then begin
      SetFocus;
      exit;
    end;

    if InResettingAlignment then begin
      Inherited;
      exit;
    end;
    PostMessage(Handle,SetAlignmentMessage,integer(taRightJustify),-1);
  end;

function TTarget_NumberEdit.GetText: string;
  begin
    Result := Inherited GetText;
    Result := StringReplace(Result,ThousandSeparator,'',[rfReplaceAll]);
  end;

procedure TTarget_NumberEdit.KeyPress(var Key: Char);
  begin
    inherited;
    if not IsCharValid(Key) then Key := #0;
  end;

procedure TTarget_NumberEdit.Loaded;
  var
    b : boolean;
  begin
    Inherited;
  end;


procedure TTarget_NumberEdit.Seta_Max(const Value: extended);
begin
  Fa_Max := Value;
end;

procedure TTarget_NumberEdit.Seta_Min(const Value: extended);
begin
  Fa_Min := Value;
end;

procedure TTarget_NumberEdit.Seta_UseConstraints(const Value: boolean);
begin
  Fa_UseConstraints := Value;
end;

procedure TTarget_NumberEdit.SetParent(AOwner: TWinControl);
  begin
    inherited;
    {if not (csLoading in ComponentState) then
      if (AOwner <> nil) and (Alignment <> taRightJustify)
        then PostMessage(Handle,SetAlignmentMessage,integer(taRightJustify),100)}
  end;

procedure TTarget_NumberEdit.WndProc(var Message: TMessage);
  var
    PrevText : string;
    i : integer;
    PrevSelStart,PrevSelLength : integer;
    Dots : string;
    F   : TCustomForm;
    AlignmentMessageToSent : TMessage;
    lpMsg : TagMsg;

  b : boolean;
  b1 : boolean;
  begin
    if Message.Msg = WM_PASTE then begin
      PrevText := Text;
      PrevSelStart := SelStart;
      PrevSelLength := SelLength;
    end;

    if (Message.Msg = SetAlignmentMessage) and not (csDestroying in ComponentState) then begin
      try
        b1 := false;
        b := StoreEvents;
        F := GetParentForm(self);
        //b1 := (F <> nil) and LockWindowUpdate(F.Handle);

        InResettingAlignment := true;

        while PeekMessage(lpMsg,Handle,SetAlignmentMessage,SetAlignmentMessage,PM_REMOVE) do
          begin
            Message.WParam := lpMsg.WParam;
            Message.LParam := lpMsg.LParam;
          end;

        Alignment := TAlignment(Message.WParam);

        if Alignment = taLeftJustify then begin
          if AutoSelect then begin
            SelStart  := 0;
            SelLength := Length(Text);
          end;
        end;
      finally
        //if b1 then LockWindowUpdate(0);
        InResettingAlignment := false;
        if b then RestoreEvents(Message.LParam);
      end;
      exit;
    end;


    inherited;
    if Message.Msg = WM_PASTE then begin
      if not IsValueValid then begin
        if Length(Text) > 100
          then Dots := '...'
          else Dots := '';
        Application.MessageBox(PChar('Вставляемый текст не является '+IndirCaseNumberName + ' числом:'#13+
                               Copy(Text,1,100)+Dots),
                               'Ошибка вставки',
                               MB_ICONWARNING + MB_OK);
        Text := PrevText;
        SelStart := PrevSelStart;
        SelLength := PrevSelLength;
      end;
    end;
  end;

procedure InitTargetFilter_ParamInfo (var R : TTargetFilter_ParamInfo);
  begin
    R.ParamFilterStr := '';
    R.Params := nil;
  end;

procedure AssignTargetFilter_ParamInfo(InR : TTargetFilter_ParamInfo;
                                       var OutR : TTargetFilter_ParamInfo);
  var
    i : integer;
  begin
    OutR.ParamFilterStr := InR.ParamFilterStr;
    SetLength(OutR.Params,Length(InR.Params));
    for i := 0 to high(OutR.Params) do
      OutR.Params[i] := InR.Params[i];
  end;

  function tf_ShortCutToText(ShCt : TShortCut) : string;
    begin
      Result := '';
      if ShCt = 0 then exit;
      if (WordRec(ShCt).Hi and (scShift shr 8)) <> 0 then Result := 'Shift+';
      if (WordRec(ShCt).Hi and (scCtrl  shr 8)) <> 0 then Result := 'Ctrl+';
      if (WordRec(ShCt).Hi and (scAlt   shr 8)) <> 0 then Result := 'Alt+';

      if WordRec(ShCt).Lo <> 0
        then Result := Result + Char(WordRec(ShCt).Lo);
    end;

  {TFilter_Rec = record
                  ParamName  : string;
                  ParamType  : TFilter_ParamType;
                  ParamValue : Variant;
                end;}
{ TTarget_Edit }

function TTarget_Edit.GetText: string;
  begin
    Result := fText;
    Result := StringReplace(Result,#10,'',[rfReplaceAll]);
    Result := StringReplace(Result,#13,'',[rfReplaceAll]);
  end;

function TTarget_Edit.StoreEvents;
  begin
    Result := false;
    if fOnChangeStored then exit;
    PrevOnChange := OnChange;
    PrevOnEnter  := OnEnter;
    PrevOnExit   := OnExit;

    OnChange     := nil;
    OnEnter      := nil;
    OnExit       := nil;

    fOnChangeStored := true;
    Result := true;
  end;

procedure TTarget_Edit.ReStoreEvents(Event : integer);
  begin
    fOnChangeStored := false;

    OnChange := PrevOnChange;
    OnEnter  := PrevOnEnter;
    OnExit   := PrevOnExit;
    case Event of
    -1 : if Assigned(OnExit)   then OnExit  (self);
     0 : if Assigned(OnChange) then OnChange(self);
     1 : if Assigned(OnEnter)  then OnEnter (self);
    end;

    PrevOnChange := nil;
    PrevOnEnter  := nil;
    PrevOnExit   := nil;
  end;

procedure TTarget_Edit.SetText(const Txt: string);
  var
    b : boolean;
  begin
    fText := Txt;
    //try
      try
        b := StoreEvents;
        if GetParentForm(self) <> nil then begin
          if Lines.Count < 1 then Lines.Add('');
          Lines.Text := Txt;
        end;
      finally
        if b then ReStoreEvents(-100);
      end;
    //except
    //end;
 end;

procedure TTarget_Edit.WndProc(var msg: TMessage);
  begin
    {if (Msg.Msg = EM_SETSEL) and (msg.lParam = -1) then begin
      SelStart  := 0;
      SelLength := 0;
      exit;
    end;}

   inherited;
  end;

procedure TTarget_Edit.SetParent(AParent: TWinControl);
  begin
    inherited;
    if GetParentForm(self) <> nil then begin
      //try
      Lines.Text  := fText;
      //except
    end;
      //end;
  end;

constructor TTarget_Edit.Create(AOwner: TComponent);
  var
    ED : TEdit;
  begin
    inherited;
    ED := TEdit.Create(Self);
    With Ed do begin
      Font := Self.Font;
      self.Height := Height;
    end;
    FreeAndNil(ED);

    WantReturns := false;
    WantTabs    := false;
    WordWrap    := false;
  end;

procedure TTarget_Edit.Change;
  begin
    fText := Lines.Text;
    if not ChangeOnInvalidValue and not isValueValid(false) then exit;
    inherited;
  end;

function TTarget_Edit.IsValueValid(NeedMess : boolean = false; MsgBoxTitle : string = '') : boolean;

  begin
    Result := true;
  end;

procedure TTarget_Edit.DoExit;
  begin
    if a_ForceValidate and Not IsValueValid(true) then begin
      SetFocus;
      exit;
    end;
    inherited;
  end;

procedure TTarget_Edit.Seta_ForceValidate(const Value: boolean);
begin
  Fa_ForceValidate := Value;
end;

procedure TTarget_Edit.SetChangeOnInvalidValue(const Value: boolean);
  begin
    FChangeOnInvalidValue := Value;
  end;

procedure TTarget_Edit.DoEnter;
begin
  inherited;
  if not (csLButtonDown in ControlState) then SelectAll;
end;

procedure TTarget_Edit.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style and not ES_MULTILINE or (ES_AUTOHSCROLL or ES_AUTOVSCROLL);
end;

procedure TTarget_NumberEdit.KeyDown(var Key: Word; Shift: TShiftState);
  begin
    if (char(Key) in ['V','v','M','m']) and (Shift = [ssCtrl]) then begin
      Key := 0;
      PasteFromClipboard;
      exit;
    end;
    inherited;
  end;

initialization
  SetAlignmentMessage := RegisterWindowMessage('TTarget_Edit_SetAlignment');
end.


