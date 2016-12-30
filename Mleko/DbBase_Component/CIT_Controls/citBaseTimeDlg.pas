unit citBaseTimeDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, citUtils;

type
  TTimeForm = class(TForm)
    MainPanel: TPanel;
    BitBtnOK: TBitBtn;
    BitBtnCancel: TBitBtn;
    PanelH: TPanel;
    LabelH: TLabel;
    LabelFromH: TLabel;
    LabelToH: TLabel;
    TrackBarH: TTrackBar;
    PanelM: TPanel;
    LabelM: TLabel;
    LabelFromM: TLabel;
    LabelToM: TLabel;
    TrackBarM: TTrackBar;
    PanelS: TPanel;
    LabelS: TLabel;
    LabelFromS: TLabel;
    LabelToS: TLabel;
    TrackBarS: TTrackBar;
    procedure FormCreate(Sender: TObject);
  protected
    procedure CMMouseLeave(var Message : TMessage); message CM_MOUSELEAVE;
    procedure WMMouseMove(var Message : TMessage); message WM_MOUSEMOVE;
    procedure WMLButtonDown(var Message : TMessage); message WM_LBUTTONDOWN;
    procedure CMMouseEnter(var Message : TMessage); message CM_MOUSEENTER;
    procedure TrackBarHChange(Sender: TObject); virtual; abstract;
    procedure TrackBarMChange(Sender: TObject); virtual; abstract;
    procedure TrackBarSChange(Sender: TObject); virtual; abstract;
  end;

implementation

{$R *.DFM}

procedure TTimeForm.FormCreate(Sender: TObject);
begin
  TrackBarH.OnChange := TrackBarHChange;
  TrackBarM.OnChange := TrackBarMChange;
  TrackBarS.OnChange := TrackBarSChange;
end;

procedure TTimeForm.CMMouseLeave(var Message : TMessage);
begin
  if not MouseCapture then MouseCapture := True
                      else inherited;
end;

procedure TTimeForm.CMMouseEnter(var Message : TMessage);
begin
  if MouseCapture then MouseCapture := False
                  else inherited;
end;

procedure TTimeForm.WMMouseMove(var Message : TMessage);
var
  P : TPoint;
begin
  GetCursorPos(P);
  if MouseCapture and PointInRect(ScreenToClient(P), ClientRect) then MouseCapture := False
  else inherited;
end;

procedure TTimeForm.WMLButtonDown(var Message : TMessage);
var
  P : TPoint;
begin
  GetCursorPos(P);
  if MouseCapture and not PointInRect(P, Rect(Left, Top, Left+Width, Top+Height)) then
  begin
    MouseCapture := False;
    Close;
  end
  else inherited;
end;
end.
