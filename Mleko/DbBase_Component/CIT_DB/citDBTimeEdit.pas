unit citDBTimeEdit;

interface

uses Windows, Classes, Graphics, Forms, Controls, Buttons, citCtrls,
     ComCtrls, DB, DBCtrls, Messages, citmask, citDBtime, extctrls, citUtils;

type
//   TOnEditClickEvent = procedure(Sender : TObject; var AText : string) of object;
   TTimeStyle = (tsHourMin, tsAll, tsMinSec, tsMin);
   TDialogStyle = (dsToolWindow, dsNoCaption);
   TcitDBTimeEdit = class(TcitCustomMaskEdit)
    private
      FDataLink : TFieldDataLink;
      FTimeStyle : TTimeStyle;
      FDialogStyle : TDialogStyle;
      TimeForm : TDBTimeForm;
      FTicksInHours : integer;
      FTicksInMinutes : integer;
      FTicksInSeconds : integer;
      FDisableCheck : boolean;
      FDontPushIfDisabled : boolean;
      function GetDataField: string;
      function GetDataSource: TDataSource;
      function GetField: TField;
      function GetReadOnly: Boolean;
      procedure SetDataField(const Value: string);
      procedure SetDataSource(Value: TDataSource);
      procedure SetReadOnly(Value: Boolean);
      procedure SetTimeStyle(Value: TTimeStyle);
      procedure DataChange(Sender: TObject);
      procedure UpdateData(Sender: TObject);
      procedure EditingChange(Sender: TObject);
      procedure TrackEdit;
      procedure CMGetDataLink(var Msg : TMessage); message CM_GetDataLink;
      procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
      procedure CMExit(var Message: TWMNoParams); message CM_EXIT;
      procedure ButtonPushed(Sender : TObject); override;

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
//      property EditMask;
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

constructor TcitDBTimeEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.ReadOnly  := False;
  if (csDesigning in ComponentState) or not(csReading in ComponentState) then
   begin
     FTicksInHours := 6;
     FTicksInMinutes := 6;
     FTicksInSeconds := 6;
   end
end;

destructor TcitDBTimeEdit.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

procedure TcitDBTimeEdit.Loaded;
begin
  inherited Loaded;
  if (csDesigning in ComponentState) then DataChange(Self);
end;

procedure TcitDBTimeEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

function TcitDBTimeEdit.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TcitDBTimeEdit.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TcitDBTimeEdit.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TcitDBTimeEdit.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TcitDBTimeEdit.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TcitDBTimeEdit.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TcitDBTimeEdit.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TcitDBTimeEdit.DataChange(Sender: TObject);
var
   Hour, Min, Sec, MSec: Word;
begin
  with FDataLink do
   if (Field = nil) then EditText := ''
   else if Field.IsNull then Clear
                  else begin
                        EditText := TimeToStr(Frac(FDataLink.Field.AsDateTime));
                        DecodeTime(Frac(FDataLink.Field.AsDateTime), Hour, Min, Sec, MSec);
                        if Hour<10 then EditText := '0' + EditText;
                        case FTimeStyle of
                          tsHourMin : EditText := Copy(EditText, 1, 5);
                          tsMinSec : EditText := Copy(EditText, 4, 5);
                          tsMin : EditText := Copy(EditText, 4, 2);
                        end
                       end
end;

procedure TcitDBTimeEdit.UpdateData(Sender: TObject);
   function IntToStr2(i : integer) : string;
   begin
     if i<10 then Result := '0'+IntToStr(i)
             else Result := IntToStr(i);
   end;

var
   Hour, Min, Sec, MSec: Word;
begin
  if not ReadOnly then
    with FDataLink.Field do
     begin
      DecodeTime(Frac(AsDateTime), Hour, Min, Sec, MSec);
      case FTimeStyle of
       tsAll : AsDateTime:= Trunc(AsDateTime)+Frac(StrToTime(EditText));//Frac - тупость, но на всякий случай
       tsHourMin :
        AsDateTime:= Trunc(AsDateTime)+Frac(StrToTime(EditText+TimeSeparator+IntToStr2(Sec)));
       tsMinSec :
        AsDateTime:= Trunc(AsDateTime)+Frac(StrToTime(IntToStr(Hour)+TimeSeparator+EditText));
       tsMin :
        AsDateTime:= Trunc(AsDateTime)+Frac(StrToTime(IntToStr(Hour)+TimeSeparator+EditText+
                                                      TimeSeparator+IntToStr2(Sec)));
      end;
     end;
end;

procedure TcitDBTimeEdit.CMGetDataLink(var Msg : TMessage);
begin
  Msg.Result := integer(FDataLink);
end;

procedure TcitDBTimeEdit.CMExit(var Message: TWMNoParams);
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
 try
   if not FDisableCheck then
   for i:=1 to Length(Text) do
     if not Between(Text[i], '0', Ranges[FTimeStyle, i]) then
        begin
          if (i=2) and (Text[2]>'3') and (Text[1]<'2') and (FTimeStyle in [tsAll, tsHourMin])
             then continue;
          SetFocus;
          Exit;
        end;
   FDataLink.UpdateRecord;
 except
   on Exception do SetFocus;
 end;
 inherited;
end;

procedure TcitDBTimeEdit.Change;
begin
  FDataLink.Modified;
  inherited Change;
end;

procedure TcitDBTimeEdit.EditingChange(Sender: TObject);
begin
  inherited ReadOnly := not FDataLink.Editing;
end;

procedure TcitDBTimeEdit.KeyPress(var Key: Char);
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

procedure TcitDBTimeEdit.TrackEdit;
var
   OldText : string;
   OldSelStart : integer;
begin
  OldText := Text;
  OldSelStart := SelStart;
  TimeForm := TDBTimeForm.Create(Self);
  TimeForm.Tag := LongInt(Self);
  with TimeForm do
  begin
   case FTimeStyle of
    tsHourMin : begin
                  TrackBarH.Position := StrToInt(Copy(Text, 1, 2));
                  TrackBarM.Position := StrToInt(Copy(Text, 4, 2));
                  PanelS.Visible := False;
                  if SelStart < 3 then ActiveControl := TrackBarH
                                  else ActiveControl := TrackBarM;
                  BitBtnOK.Top := BitBtnOK.Top - PanelS.Height;
                  BitBtnCancel.Top := BitBtnCancel.Top - PanelS.Height;
                  Height := Height - PanelS.Height;
                end;
    tsAll : begin
              TrackBarH.Position := StrToInt(Copy(Text, 1, 2));
              TrackBarM.Position := StrToInt(Copy(Text, 4, 2));
              TrackBarS.Position := StrToInt(Copy(Text, 7, 2));
              if SelStart < 3 then ActiveControl := TrackBarH
                              else if SelStart < 6 then ActiveControl := TrackBarM
                                                   else ActiveControl := TrackBarS;
            end;
    tsMinSec : begin
                 TrackBarM.Position := StrToInt(Copy(Text, 1, 2));
                 TrackBarS.Position := StrToInt(Copy(Text, 4, 2));
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
              TrackBarM.Position := StrToInt(Text);
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
  FDataLink.Edit;
  if FDialogStyle = dsNoCaption then
   begin
     TimeForm.BorderStyle := bsNone;
     TimeForm.MainPanel.BevelOuter := bvRaised;
     TimeForm.Height := TimeForm.Height - GetSystemMetrics(SM_CYSMCAPTION) -
                        2*GetSystemMetrics(SM_CYDLGFRAME)
   end;
  SetFormPosByControl(TimeForm, Self);
  TimeForm.ShowModal;
  if TimeForm.ModalResult = mrCancel then Text := OldText;
  if not Focused then FDataLink.UpdateRecord;
  SelStart := OldSelStart;
  TimeForm.Free;
end;

procedure TcitDBTimeEdit.ButtonPushed(Sender : TObject);
begin
  if FDataLink.CanModify or not FDontPushIfDisabled then
   if Assigned(FOnPushButton) and FOwnesLButton then begin
                                                      FDataLink.Edit;
                                                      FOnPushButton(Self);
                                                      if not Focused then
                                                                     FDataLink.UpdateRecord;
                                                     end
                                                else TrackEdit;
  SetFocus;
end;

procedure TcitDBTimeEdit.SetTimeStyle(Value : TTimeStyle);
begin
  FTimeStyle := Value;
  case Value of
    tsAll     : EditMask := '!00'+TimeSeparator+'00'+TimeSeparator+'00;1;_';
    tsHourMin,
    tsMinSec  : EditMask := '!00'+TimeSeparator+'00;1;_';
    tsMin     : EditMask := '!00;1;_';
  end;
  DataChange(Self);
end;

function TcitDBTimeEdit.EditCanModify: Boolean;
begin
  Result := FDataLink.Edit;
end;

procedure TcitDBTimeEdit.CMEnter(var Message: TCMEnter);
begin
  FDataLink.Reset;
  inherited;
  if SysLocale.FarEast and FDataLink.CanModify then
    inherited ReadOnly := False;
end;

end.
