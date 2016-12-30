unit citTimeEdit;

interface

uses Windows, Classes, Graphics, Forms, Controls, Buttons, citCtrls,
     ComCtrls, Messages, citmask, cittime, extctrls, Dialogs, citUtils;

type
   TOnEditClickEvent = procedure(Sender : TObject; var AText : string) of object;
   TTimeStyle = (tsHourMin, tsAll, tsMinSec, tsMin);
   TDialogStyle = (dsToolWindow, dsNoCaption);
   TcitTimeEdit = class(TcitCustomMaskEdit)
    private
      FTimeStyle : TTimeStyle;
      FDialogStyle : TDialogStyle;
      citTimeForm : TcitTimeForm;
      FTicksInHours : integer;
      FTicksInMinutes : integer;
      FTicksInSeconds : integer;
      FDisableCheck : boolean;
      procedure CMExit(var Message: TWMNoParams); message CM_EXIT;
      procedure SetTimeStyle(Value: TTimeStyle);
      procedure TrackEdit;
      procedure ButtonPushed(Sender : TObject); override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      property EditMask;
      property Text;

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
      property ReadOnly; //: Boolean read GetReadOnly write SetReadOnly default False;
      property ShowHint;
      property TabOrder;
      property TabStop;
      property TimeStyle: TTimeStyle read FTimeStyle write SetTimeStyle;
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
      property TicksInHours : integer read FTicksInHours write FTicksInHours default 6;
      property TicksInMinutes : integer read FTicksInMinutes write FTicksInMinutes default 6;
      property TicksInSeconds : integer read FTicksInSeconds write FTicksInSeconds default 6;
      property DisableCheck : boolean read FDisableCheck write FDisableCheck;
   end;

implementation

uses SysUtils;

constructor TcitTimeEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  if (csDesigning in ComponentState) or not(csReading in ComponentState) then
   begin
     FTicksInHours := 6;
     FTicksInMinutes := 6;
     FTicksInSeconds := 6;
     EditMask := '!00'+TimeSeparator+'00;1;_';
   end;
end;

destructor TcitTimeEdit.Destroy;
begin
  inherited Destroy;
end;

procedure TcitTimeEdit.TrackEdit;
var
   OldText : string;
   OldSelStart : integer;
begin
  OldText := Text;
  OldSelStart := SelStart;
  citTimeForm := TcitTimeForm.Create(Self);
  citTimeForm.Tag := LongInt(Self);
  with citTimeForm do
  begin
   case FTimeStyle of
    tsHourMin : begin
                  TrackBarH.Position := StrToIntDef(Copy(Text, 1, 2), 0);
                  TrackBarM.Position := StrToIntDef(Copy(Text, 4, 2), 0);
                  PanelS.Visible := False;
                  if SelStart < 3 then ActiveControl := TrackBarH
                                  else ActiveControl := TrackBarM;
                  BitBtnOK.Top := BitBtnOK.Top - PanelS.Height;
                  BitBtnCancel.Top := BitBtnCancel.Top - PanelS.Height;
                  Height := Height - PanelS.Height;
                end;
    tsAll : begin
              TrackBarH.Position := StrToIntDef(Copy(EditText, 1, 2), 0);
              TrackBarM.Position := StrToIntDef(Copy(EditText, 4, 2), 0);
              TrackBarS.Position := StrToIntDef(Copy(EditText, 7, 2), 0);
              if SelStart < 3 then ActiveControl := TrackBarH
                              else if SelStart < 6 then ActiveControl := TrackBarM
                                                   else ActiveControl := TrackBarS;
            end;
    tsMinSec : begin
                 TrackBarM.Position := StrToIntDef(Copy(EditText, 1, 2), 0);
                 TrackBarS.Position := StrToIntDef(Copy(EditText, 4, 2), 0);
                 PanelH.Visible := False;
                 if SelStart < 3 then ActiveControl := TrackBarM
                                 else ActiveControl := TrackBarS;
                 BitBtnOK.Top := BitBtnOK.Top - PanelH.Height;
                 BitBtnCancel.Top := BitBtnCancel.Top - PanelH.Height;
                 PanelM.Top := PanelM.Top - PanelH.Height;
                 PanelS.Top := PanelS.Top - PanelH.Height;
                 Height := Height - PanelH.Height;
               end;
    tsMin : begin
              TrackBarM.Position := StrToIntDef(EditText, 0);
              PanelS.Visible := False;
              PanelH.Visible := False;
              ActiveControl := TrackBarM;
              BitBtnOK.Top := BitBtnOK.Top - PanelH.Height - PanelS.Height;
              BitBtnCancel.Top := BitBtnCancel.Top - PanelH.Height - PanelS.Height;;
              PanelM.Top := PanelM.Top - PanelH.Height;
              Height := Height - PanelH.Height - PanelS.Height;
            end;

   end;
   TrackBarH.Frequency := FTicksInHours;
   TrackBarM.Frequency := FTicksInMinutes;
   TrackBarS.Frequency := FTicksInSeconds;
  end;
  if FDialogStyle = dsNoCaption then
   begin
     citTimeForm.BorderStyle := bsNone;
     citTimeForm.MainPanel.BevelOuter := bvRaised;
     citTimeForm.Height := citTimeForm.Height - GetSystemMetrics(SM_CYSMCAPTION) -
                           2*GetSystemMetrics(SM_CYDLGFRAME)
   end;
  SetFormPosByControl(citTimeForm, Self);
  citTimeForm.ShowModal;
  if citTimeForm.ModalResult = mrCancel then Text := OldText;
  SelStart := OldSelStart;
  citTimeForm.Free;
end;

procedure TcitTimeEdit.ButtonPushed(Sender : TObject);
begin
  if Assigned(FOnPushButton) and FOwnesLButton then FOnPushButton(Self)
                                               else TrackEdit;
  SetFocus;
end;

procedure TcitTimeEdit.SetTimeStyle(Value : TTimeStyle);
begin
  FTimeStyle := Value;
  case Value of
    tsAll     : EditMask := '!00'+TimeSeparator+'00'+TimeSeparator+'00;1;_';
    tsHourMin,
    tsMinSec  : EditMask := '!00'+TimeSeparator+'00;1;_';
    tsMin     : EditMask := '!00;1;_';
  end;
  Text := '00:00:00'
end;

procedure TcitTimeEdit.CMExit(var Message: TWMNoParams);
const Ranges : array [TTimeStyle, 1..8] of char = (('2','3',':','5','9',':',':',':'),
                                                   ('2','3',':','5','9',':','5','9'),
                                                   ('5','9',':','5','9',':',':',':'),
                                                   ('5','9',':',':',':',':',':',':'));
 function Between(c, c1, c2 : char) : boolean;
 begin
   if c in [c1..c2] then Result := True
                    else Result := False;
 end;
var
   i : integer;
begin
  if not FDisableCheck then
  for i:=1 to Length(Text) do
    if not Between(Text[i], '0', Ranges[FTimeStyle, i]) then
       begin
         if (i=2) and (Text[2]>'3') and (Text[1]<'2') and (FTimeStyle in [tsAll, tsHourMin])
            then continue;
         SetFocus;
         break;
       end;
  try
    inherited
  except on Exception do;
  end; 
end;

end.
