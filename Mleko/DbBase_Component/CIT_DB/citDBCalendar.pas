unit citDBCalendar;

interface

uses Windows, Classes, Graphics, Forms, Controls, Buttons, citCtrls,
     ComCtrls, DB, DBCtrls, Messages, citmask, extctrls,
     Menus, citUtils, citDBCalDlg;

type
   TDialogStyle = (dsNoCaption, dsToolWindow);
   TDatePickMethod = (dmToday, dmLastEntered);
   TDateFormat = (dfShort, dfLong);
   TOnEditClickEvent = procedure(Sender : TObject; var AText : string) of object;
   TcitDBDateEdit = class(TcitCustomMaskEdit)
    private
      FDataLink : TFieldDataLink;
      FPickFromField : Boolean;
      FDatePickMethod : TDatePickMethod;
      FDialogStyle : TDialogStyle;
      FHeaderColor : TColor;
      FDayBackgroundColor : TColor;
      FDayTextColor : TColor;
      FWeekEndColor : TColor;
      FCalendarColor : TColor;
      FHeaderFont : TFont;
      FCalendarFont : TFont;
      FTodayShortCut : TShortCut;
      FDisableCheck : boolean;
      FDateFormat : TDateFormat;
      FDontPushIfDisabled : boolean;
      CalendarForm : TDBCalendForm;
      function GetDataField: string;
      function GetDataSource: TDataSource;
      function GetField: TField;
      function GetReadOnly: Boolean;
      function GetDate : TDate;
      procedure SetDataField(const Value: string);
      procedure SetDataSource(Value: TDataSource);
      procedure SetReadOnly(Value: Boolean);
      procedure SetCalendarFont(Value : TFont);
      procedure SetHeaderFont(Value : TFont);
      procedure SetDateFormat(Value : TDateFormat);
      procedure DataChange(Sender: TObject);
      procedure UpdateData(Sender: TObject);
      procedure EditingChange(Sender: TObject);
      procedure CalendEdit;
      procedure CMGetDataLink(var Msg : TMessage); message CM_GetDataLink;
      procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
      procedure CMExit(var Message: TWMNoParams); message CM_EXIT;
      procedure ButtonPushed(Sender : TObject); override;
      function NewFormatDate(DateTime: TDateTime): string;

    protected
      procedure Change; override;
      function EditCanModify: Boolean; override;
      procedure Loaded; override;
      procedure KeyPress(var Key: Char); override;
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      property Field: TField read GetField;
      property EditMask;
      property Text;
      property CurrentDate : TDate read GetDate;

    published
      property AutoSelect;
      property AutoSize;
      property BorderStyle;
      property CharCase;
      property Color;
      property Ctl3D;
      property DataField: string read GetDataField write SetDataField;
      property DataSource: TDataSource read GetDataSource write SetDataSource;
      property DialogStyle : TDialogStyle read FDialogStyle write FDialogStyle;
      property DontPushIfDisabled : boolean read FDontPushIfDisabled
                                            write FDontPushIfDisabled;
      property DragCursor;
      property DragMode;
      property Enabled;
      property Font;
      property OwnesLButton;
      property OwnesLLabel;
      property HideSelection;
      property ImeMode;
      property ImeName;
      property LBtnAlignment;
      property LBtnFlat;
      property LBtnCaption;
      property LBtnDown;
      property LBtnGroupIndex;
      property LBtnAllowAllUp;
      property LBtnGlyph;
      property LBtnGlyphKind;
      property LBtnNumGlyphs;
      property LBtnShortCut1;
      property LBtnShortCut2;
      property LBtnWidth;
      property LLblAlignment;
      property LLblCaption;
      property LLblWidth;
      property LLblFont;
      property LLblRequiredFont;
      property Required;
      property MaxLength;
      property OEMConvert;
      property ParentColor;
      property ParentCtl3D;
      property ParentFont;
      property ParentShowHint;
      property PasswordChar;
      property PopupMenu;
      property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
      property PickFromField: Boolean read FPickFromField write FPickFromField;
      property DatePickMethod: TDatePickMethod read FDatePickMethod write FDatePickMethod;
      property ShowHint;
      property TabOrder;
      property TabStop;
      property Visible;
      property OnChange;
      property OnClick;
      property OnDblClick;
      property OnDragDrop;
      property OnDragOver;
      property OnEndDrag;
      property OnEnter;
      property OnExit;
      property OnKeyDown;
      property OnKeyPress;
      property OnKeyUp;
      property OnMouseDown;
      property OnMouseMove;
      property OnMouseUp;
      property OnPushButton;
      property OnStartDrag;
      property Variant1;
      property Variant2;
      property HeaderColor : TColor read FHeaderColor write FHeaderColor;
      property DayBackgroundColor : TColor read FDayBackgroundColor write FDayBackgroundColor;
      property CalendarColor : TColor read FCalendarColor write FCalendarColor;
      property DayTextColor : TColor read FDayTextColor write FDayTextColor;
      property WeekEndColor : TColor read FWeekEndColor write FWeekEndColor;
      property HeaderFont : TFont read FHeaderFont write SetHeaderFont;
      property CalendarFont : TFont read FCalendarFont write SetCalendarFont;
      property TodayShortCut: TShortCut read FTodayShortCut write FTodayShortCut;
      property DisableCheck : boolean read FDisableCheck write FDisableCheck;
      property DateFormat : TDateFormat read FDateFormat write SetDateFormat;
   end;

var LastEnteredDate : TDate;

implementation

uses SysUtils;

constructor TcitDBDateEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.ReadOnly  := False;
  FDateFormat := dfShort;
  FHeaderFont := TFont.Create;
  FCalendarFont := TFont.Create;
  FHeaderColor := clBtnFace;
  FCalendarColor := clWindow;
  FDayTextColor := clCaptionText;
  FWeekEndColor := clRed;
  FDayBackgroundColor := clActiveCaption;
  FHeaderFont.Name := 'MS Sans Serif';
  FHeaderFont.Color := clBlack;
  FCalendarFont.Name := 'MS Sans Serif';
  FTodayShortCut := TextToShortCut('F5');
  FDisableCheck := True;
end;

destructor TcitDBDateEdit.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  FHeaderFont.Free;
  FCalendarFont.Free;
  inherited Destroy;
end;

function TcitDBDateEdit.NewFormatDate(DateTime: TDateTime): string;
var
  NewFormat : string;
begin
  NewFormat := ShortDateFormat;
  SetLength(NewFormat, Pos('yy', NewFormat)-1);
  if FDateFormat = dfShort then Result := FormatDateTime(NewFormat+'yy', DateTime)
                           else Result := FormatDateTime(NewFormat+'yyyy', DateTime)
end;

procedure TcitDBDateEdit.Loaded;
begin
  inherited Loaded;
  if (csDesigning in ComponentState) then DataChange(Self);
end;

procedure TcitDBDateEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

function TcitDBDateEdit.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TcitDBDateEdit.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TcitDBDateEdit.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TcitDBDateEdit.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TcitDBDateEdit.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TcitDBDateEdit.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TcitDBDateEdit.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TcitDBDateEdit.DataChange(Sender: TObject);
begin
  with FDataLink do
   if (Field = nil) then EditText := ''
   else if Field.IsNull then Clear
   else EditText := NewFormatDate(Field.AsDateTime);
end;

procedure TcitDBDateEdit.UpdateData(Sender: TObject);
begin
  if not ReadOnly then
   with FDataLink.Field do
    begin
      AsDateTime := Frac(AsDateTime) + Trunc(StrToDate(EditText));
      LastEnteredDate := Trunc(AsDateTime);
    end;
end;

procedure TcitDBDateEdit.CMGetDataLink(var Msg : TMessage);
begin
  Msg.Result := integer(FDataLink);
end;

procedure TcitDBDateEdit.CMExit(var Message: TWMNoParams);
begin
 try
   LastEnteredDate := StrToDate(Text);
   FDataLink.UpdateRecord;
 except
   on Exception do if not FDisableCheck then SetFocus;
 end;
 inherited;
end;

procedure TcitDBDateEdit.Change;
begin
  FDataLink.Modified;
  inherited Change;
end;

procedure TcitDBDateEdit.KeyPress(var Key: Char);
var
   Key2 : Char;
begin
//  inherited KeyPress(Key);
  Key2 := Key;
  if (Key in [#32..#255]) and (FDataLink.Field <> nil) and
    not FDataLink.Field.IsValidChar(Key) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
  case Key of
    ^H, ^V, ^X, #32..#255:
      FDataLink.Edit;
    #27:
      begin
        FDataLink.Reset;
        SelectAll;
        Key := #0;
      end;
  end;
  Key := Key2;
  inherited KeyPress(Key);
end;

procedure TcitDBDateEdit.CalendEdit;
var
   OldText : string;
begin
  OldText := Text;
  CalendarForm := TDBCalendForm.Create(Self);
  CalendarForm.Tag := LongInt(Self);
  FDataLink.Edit;
  with CalendarForm do
   begin
     if FDialogStyle = dsToolWindow then
      begin
           BorderStyle := bsToolWindow;
           BorderIcons := [biSystemMenu];
           Height := Height + GetSystemMetrics(SM_CYSMCAPTION) + 2*GetSystemMetrics(SM_CYDLGFRAME);
           Width := Width + 2*GetSystemMetrics(SM_CXDLGFRAME);
           Caption := '¬ведите дату'
      end;
     SetFormPosByControl(CalendarForm, Self);
     PanelText.Color := FHeaderColor;
     PanelText.Font.Assign(FHeaderFont);
     Grid.FixedColor := FDayBackgroundColor;
     Grid.Font.Assign(FCalendarFont);
     Grid.Color := FCalendarColor;
     FixedTextColor := FDayTextColor;
     RedColor := WeekEndColor;
     ShowModal;
     if ModalResult = mrCancel then Text := OldText
     else Text := NewFormatDate(EncodeDate(Year, Month, Day));

     if not Focused then FDataLink.UpdateRecord;
     CalendarForm.Free;
   end;
  SelectAll;
end;

procedure TcitDBDateEdit.ButtonPushed(Sender : TObject);
begin
  if FDataLink.CanModify or not FDontPushIfDisabled then
   if Assigned(FOnPushButton) and FOwnesLButton then begin
                                                      FDataLink.Edit;
                                                      FOnPushButton(Self);
                                                      if not Focused then
                                                        FDataLink.UpdateRecord;
                                                     end
                                                else CalendEdit;
  SetFocus;
end;

function TcitDBDateEdit.EditCanModify: Boolean;
begin
  Result := FDataLink.Edit;
end;

procedure TcitDBDateEdit.EditingChange(Sender: TObject);
begin
  inherited ReadOnly := not FDataLink.Editing;
end;

procedure TcitDBDateEdit.CMEnter(var Message: TCMEnter);
begin
  FDataLink.Reset;
  inherited;
  if SysLocale.FarEast and FDataLink.CanModify then
    inherited ReadOnly := False;
end;

procedure TcitDBDateEdit.SetCalendarFont(Value : TFont);
begin
  FCalendarFont.Assign(Value)
end;

procedure TcitDBDateEdit.SetHeaderFont(Value : TFont);
begin
  FHeaderFont.Assign(Value)
end;

procedure TcitDBDateEdit.SetDateFormat(Value : TDateFormat);
begin
  FDateFormat := Value;
  if Value = dfShort then EditMask := '!00'+DateSeparator+'00'+DateSeparator+'00;1;_'
                     else EditMask := '!00'+DateSeparator+'00'+DateSeparator+'0000;1;_'
end;

function TcitDBDateEdit.GetDate : TDate;
begin
  try
    Result := StrToDate(Text);
  except
    Result := 0;
  end;
end;

initialization
 LastEnteredDate := Date;
end.

