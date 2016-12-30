unit citTray;

interface

uses Forms, Windows, Classes, ShellAPI, Controls, SysUtils, Dialogs, Graphics,
     Messages, Menus;

type
  TcitTrayIcon = class(TComponent)
  private
    FNotifyStruct : PNotifyIconData;
    FIcon : TIcon;
    FActive : boolean;
    FHandle : HWnd;
    FOldMinimize : TNotifyEvent;
    FLPressed : boolean;
    FPopupMenu : TPopupMenu;
    FHideTaskButton : boolean;
    FHideTrayIcon : boolean;
    FOnClick: TNotifyEvent;
    FOnMouseDown: TMouseEvent;
    FOnMouseUp: TMouseEvent;
    FOnMouseMove: TMouseMoveEvent;
    FOnDblClick: TNotifyEvent;

    procedure IconChanged(Sender : TObject);
    procedure SetActive(Value : boolean);
    procedure SetTip(Value : string);
    procedure SetIcon(Value : TIcon);
    procedure AppMinimize(Sender : TObject);
    procedure Activate;
    procedure Deactivate;
    function GetTip : string;
  protected
    procedure Loaded; override;
    procedure WndProc(var Message: TMessage); virtual;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  published
    property Icon : TIcon read FIcon write SetIcon;
    property Tip : string read GetTip write SetTip;
    property PopupMenu : TPopupMenu read FPopupMenu write FPopupMenu;
    property HideTaskButton : boolean read FHideTaskButton write FHideTaskButton;
    property HideTrayIcon : boolean read FHideTrayIcon write FHideTrayIcon;
    property Active : boolean read FActive write SetActive;

    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnMouseDown: TMouseEvent read FOnMouseDown write FOnMouseDown;
    property OnMouseUp: TMouseEvent read FOnMouseUp write FOnMouseUp;
    property OnMouseMove: TMouseMoveEvent read FOnMouseMove write FOnMouseMove;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
  end;

implementation

const
  CM_TRAYICON = CM_BASE + 100;

constructor TcitTrayIcon.Create(AOwner : TComponent);
begin
  inherited;

  FHandle := AllocateHWnd(WndProc);
  New(FNotifyStruct);
  with FNotifyStruct^ do
  begin
    cbSize := SizeOf(FNotifyStruct^);
    Wnd := FHandle;
    uID := 1;
    uFlags := NIF_ICON or NIF_TIP or NIF_MESSAGE;
    uCallbackMessage := CM_TRAYICON;
    szTip := '';
  end;
  FActive := True;
  FHideTaskButton := True;
  FHideTrayIcon := True;
  FIcon := TIcon.Create;
  FIcon.OnChange := IconChanged;
  FOldMinimize := Application.OnMinimize;
  Application.OnMinimize := AppMinimize;
  FLPressed := False;
end;

destructor TcitTrayIcon.Destroy;
begin
  Application.OnMinimize := FOldMinimize;
  Shell_NotifyIcon(NIM_DELETE,FNotifyStruct);
  Dispose(FNotifyStruct);
  DeallocateHWnd(FHandle);
  inherited;
end;

procedure TcitTrayIcon.Loaded;
begin
  inherited;
  if FActive and not(csDesigning in ComponentState) then
    Shell_NotifyIcon(NIM_ADD, FNotifyStruct);
end;

procedure TcitTrayIcon.Activate;
begin
  if IsIconic(Application.Handle) or not FHideTrayIcon then
    Shell_NotifyIcon(NIM_ADD, FNotifyStruct);
  if IsIconic(Application.Handle) and FHideTaskButton then
    ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TcitTrayIcon.Deactivate;
begin
  ShowWindow(Application.Handle, SW_SHOWNA);
  if FHideTrayIcon then Shell_NotifyIcon(NIM_DELETE, FNotifyStruct);
end;

procedure TcitTrayIcon.SetActive(Value : boolean);
begin
  if (Value <> FActive) and not (csDesigning in ComponentState) then
    if Value then Activate
             else Deactivate;
  FActive := Value;
end;

procedure TcitTrayIcon.SetTip(Value : string);
begin
  if Length(Value) < SizeOf(FNotifyStruct^.szTip) then
  begin
    with FNotifyStruct^ do
      StrPLCopy(szTip, GetShortHint(Value), SizeOf(szTip) - 1);
    if not (csDesigning in ComponentState) then
      Shell_NotifyIcon(NIM_MODIFY, FNotifyStruct);
  end else
    MessageDlg('Cannot assign hint. Source size exceeds 64.', mtError, [mbOK], 0);
end;

function TcitTrayIcon.GetTip : string;
begin
  Result := FNotifyStruct^.szTip;
end;

procedure TcitTrayIcon.SetIcon(Value : TIcon);
begin
  FIcon.Assign(Value);
  if Value <> nil then IconChanged(FIcon);
end;

procedure TcitTrayIcon.IconChanged(Sender : TObject);
begin
  FNotifyStruct^.hIcon := FIcon.Handle;
  Shell_NotifyIcon(NIM_MODIFY, FNotifyStruct);
end;

procedure TcitTrayIcon.WndProc(var Message: TMessage);
  procedure SendCancelMode;
  var
    F: TForm;
  begin
    if not (csDestroying in ComponentState) then
    begin
      F := Screen.ActiveForm;
      if F = nil then F := Application.MainForm;
      if F <> nil then F.SendCancelMode(nil);
    end;
  end;

  procedure SwitchToWindow(Wnd: HWnd);
  begin
    if IsWindowEnabled(Wnd) then SetForegroundWindow(Wnd);
  end;

  function GetShiftState: TShiftState;
  begin
    Result := [];
    if GetAsyncKeyState(VK_SHIFT) < 0 then Include(Result, ssShift);
    if GetAsyncKeyState(VK_CONTROL) < 0 then Include(Result, ssCtrl);
    if GetAsyncKeyState(VK_MENU) < 0 then Include(Result, ssAlt);
  end;

var
  Pt : TPoint;
  Shift: TShiftState;

  procedure DoMouseEvent(Event : TMouseEvent; MouseButton : TMouseButton;
                         MShift : TShiftState);
  begin
    Shift := GetShiftState + MShift;
    GetCursorPos(Pt);
    if Assigned(Event) then Event(Self, MouseButton, Shift, Pt.X, Pt.Y);
  end;

  procedure DoNotifyEvent(Event : TNotifyEvent);
  begin
    if Assigned(Event) then Event(Self);
  end;

  procedure DoMouseMoveEvent(Event : TMouseMoveEvent);
  begin
    GetCursorPos(Pt);
    if Assigned(Event) then Event(Self, GetShiftState, Pt.X, Pt.Y);
  end;

begin
  with Message do
  if Msg = CM_TRAYICON then
  case LParam of
    WM_LBUTTONDOWN :
      begin
        if IsIconic(Application.Handle) then
          if not FLPressed then FLPressed := True;
        DoMouseEvent(FOnMouseDown, mbLeft, [ssLeft]);
      end;
    WM_LBUTTONUP :
      begin
        if FLPressed then
        begin
          ShowWindow(Application.Handle, SW_SHOW);
          Application.Restore;
          Deactivate;
          FLPressed := False;
          DoNotifyEvent(FOnClick);
        end;
        DoMouseEvent(FOnMouseUp, mbLeft, [ssLeft]);
      end;
    WM_RBUTTONDOWN :
      DoMouseEvent(FOnMouseDown, mbRight, [ssRight]);
    WM_RBUTTONUP :
      begin
        DoMouseEvent(FOnMouseUp, mbRight, [ssRight]);
        if Assigned(FPopupMenu) then
          if PopupMenu.AutoPopup then
          begin
            FPopupMenu.PopupComponent := Self;
            SendCancelMode;
            SwitchToWindow(Application.Handle);
            Application.ProcessMessages;
            try
              FPopupMenu.Popup(Pt.x, Pt.y);
            finally
              SwitchToWindow(Application.Handle);
            end;
          end;
      end;
    WM_MBUTTONDOWN :
      DoMouseEvent(FOnMouseDown, mbMiddle, [ssMiddle]);
    WM_MBUTTONUP :
      DoMouseEvent(FOnMouseUp, mbMiddle, [ssMiddle]);
    WM_LBUTTONDBLCLK, WM_RBUTTONDBLCLK, WM_MBUTTONDBLCLK :
      DoNotifyEvent(FOnDblClick);
    WM_MOUSEMOVE :
      DoMouseMoveEvent(FOnMouseMove)
  end
  else Result := DefWindowProc(FHandle, Msg, wParam, lParam);
end;

procedure TcitTrayIcon.AppMinimize(Sender : TObject);
begin
  if not (csDesigning in ComponentState) then
  begin
    if FHideTaskButton then ShowWindow(Application.Handle, SW_HIDE);
    Activate;
  end;
  if Assigned(FOldMinimize) then FOldMinimize(Sender);
end;

procedure Register;
begin
  RegisterComponents('Target', [TcitTrayIcon]);
end;

end.
