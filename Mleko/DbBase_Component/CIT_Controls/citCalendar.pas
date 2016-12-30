unit citCalendar;

interface

uses Windows, Classes, Graphics, Forms, Controls, Buttons, citCtrls,
     ComCtrls, Messages, citmask, extctrls, Menus, citUtils,
     citCalDlg;

type
   TDialogStyle = (dsNoCaption, dsToolWindow);
   TDatePickMethod = (dmToday, dmLastEntered);
   TDateFormat = (dfShort, dfLong);

   TOnEditClickEvent = procedure(Sender : TObject; var AText : string) of object;
   TcitDateEdit = class(TcitCustomMaskEdit)
    private
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
      CalendarForm : TcitCalendForm;
      procedure SetCalendarFont(Value : TFont);
      procedure SetHeaderFont(Value : TFont);
      procedure SetDateFormat(Value : TDateFormat);
      procedure CalendEdit;
      procedure CMExit(var Message: TWMNoParams); message CM_EXIT;
      procedure ButtonPushed(Sender : TObject); override;
      function NewFormatDate(DateTime: TDateTime): string;
      function GetDate : TDate;

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
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
      property DialogStyle : TDialogStyle read FDialogStyle write FDialogStyle;
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
      property ReadOnly;//: Boolean read GetReadOnly write SetReadOnly default False;
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
      property CalendarColor : TColor read FCalendarColor write FCalendarColor default clWindow;
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

constructor TcitDateEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  FHeaderFont := TFont.Create;
  FCalendarFont := TFont.Create;
  FDateFormat := dfShort;
  FHeaderColor := clBtnFace;
  FCalendarColor := clWindow;
  FDayTextColor := clCaptionText;
  FWeekEndColor := clRed;
  FDayBackgroundColor := clActiveCaption;
  FHeaderFont.Name := 'MS Sans Serif';
  FHeaderFont.Color := clBlack;
  FCalendarFont.Name := 'MS Sans Serif';
  FTodayShortCut := TextToShortCut('F5');
end;

destructor TcitDateEdit.Destroy;
begin
  FHeaderFont.Free;
  FCalendarFont.Free;
  inherited Destroy;
end;

function TcitDateEdit.NewFormatDate(DateTime: TDateTime): string;
var
  NewFormat : string;
begin
  NewFormat := ShortDateFormat;
  SetLength(NewFormat, Pos('yy', NewFormat)-1);
  if FDateFormat = dfShort then Result := FormatDateTime(NewFormat+'yy', DateTime)
                           else Result := FormatDateTime(NewFormat+'yyyy', DateTime)
end;

procedure TcitDateEdit.CMExit(var Message: TWMNoParams);
begin
 try
   LastEnteredDate := StrToDate(EditText);
   inherited;
 except
   on Exception do if not FDisableCheck then SetFocus;
 end;
end;

procedure TcitDateEdit.CalendEdit;
var
   OldText : string;
begin
  OldText := Text;
  CalendarForm := TcitCalendForm.Create(Self);
  CalendarForm.Tag := LongInt(Self);
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
       else begin
              LastEnteredDate := EncodeDate(Year, Month, Day);
              Text := NewFormatDate(LastEnteredDate);
            end;
     CalendarForm.Free;
   end;
  SelectAll;
end;

procedure TcitDateEdit.ButtonPushed(Sender : TObject);
begin
  if Assigned(FOnPushButton) and FOwnesLButton then FOnPushButton(Self)
                                               else CalendEdit;
  SetFocus;
end;

procedure TcitDateEdit.SetCalendarFont(Value : TFont);
begin
  FCalendarFont.Assign(Value)
end;

procedure TcitDateEdit.SetHeaderFont(Value : TFont);
begin
  FHeaderFont.Assign(Value)
end;

procedure TcitDateEdit.SetDateFormat(Value : TDateFormat);
begin
  FDateFormat := Value;
  if Value = dfShort then EditMask := '!00'+DateSeparator+'00'+DateSeparator+'00;1;_'
                     else EditMask := '!00'+DateSeparator+'00'+DateSeparator+'0000;1;_'
end;

function TcitDateEdit.GetDate : TDate;
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
