unit citCalDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  citBaseCalDlg, ExtCtrls, StdCtrls, Grids, Buttons, Menus, citUtils;

type
  TcitCalendForm = class(TCalendForm)
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoShow; override;
    procedure CMMouseLeave(var Message : TMessage); message CM_MOUSELEAVE;
    procedure WMMouseMove(var Message : TMessage); message WM_MOUSEMOVE;
    procedure WMLButtonDown(var Message : TMessage); message WM_LBUTTONDOWN;
    procedure CMMouseEnter(var Message : TMessage); message CM_MOUSEENTER;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses citCalendar;

procedure TcitCalendForm.DoShow;
 function StrToDate2(s : string) : TDate;
  begin
    try
      Result := StrToDate(s);
    except
      on Exception do Result := 0
    end;
  end;

var
   i : integer;
begin
  inherited;
  for i:=0 to Grid.ColCount-1 do Grid.Cells[i, 0] := ShortDayNames[((i+1) mod 7) + 1];
  with TcitDateEdit(Tag) do
   if PickFromField and (StrToDate2(EditText)<>0) then DecodeDate(StrToDate(Text), Year, Month, Day)
        else if DatePickMethod = dmToday then DecodeDate(Date, Year, Month, Day)
                                         else DecodeDate(LastEnteredDate, Year, Month, Day);
  UpdateCalendar(Day);
  SystemParametersInfo(SPI_GETKEYBOARDDELAY, 0, @i, 0);
  Delay := (i+1)*250;
  SystemParametersInfo(SPI_GETKEYBOARDSPEED, 0, @i, 0);
  Speed := Round(1000/(2+i*(28/31)));
  SetCursorPos(Left + Width div 2, Top + Height div 2);
end;

procedure TcitCalendForm.KeyDown(var Key: Word; Shift: TShiftState);
var
   ShortCutKey : Word;
   ShortCutShift : TShiftState;
begin
  if Shift = [] then
   case Key of
     VK_NEXT  : begin
                  SinkButton(TCalendarButton(BtnIncMonth));
                  BtnIncMonth.Click;
                end;
     VK_PRIOR : begin
                  SinkButton(TCalendarButton(BtnDecMonth));
                  BtnDecMonth.Click;
                end;
   end
  else if Shift=[ssCtrl] then
   case Key of
     VK_NEXT  : begin
                  SinkButton(TCalendarButton(BtnIncYear));
                  BtnIncYear.Click;
                end;
     VK_PRIOR : begin
                  SinkButton(TCalendarButton(BtnDecYear));
                  BtnDecYear.Click;
                end;
   end;

  with TcitDateEdit(Tag) do
   begin
     ShortCutToKey(TodayShortCut, ShortCutKey, ShortCutShift);
     if (ShortCutKey = Key) and (ShortCutShift = Shift) then BtnToday.Click;
   end;
  inherited;
end;

procedure TcitCalendForm.CMMouseLeave(var Message : TMessage);
begin
  if not MouseCapture then MouseCapture := True
                      else inherited;
end;

procedure TcitCalendForm.CMMouseEnter(var Message : TMessage);
begin
  if MouseCapture then MouseCapture := False
                  else inherited;
end;

procedure TcitCalendForm.WMMouseMove(var Message : TMessage);
var
  P : TPoint;
begin
  GetCursorPos(P);
  if MouseCapture and PointInRect(ScreenToClient(P), ClientRect) then MouseCapture := False
  else inherited;
end;

procedure TcitCalendForm.WMLButtonDown(var Message : TMessage);
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
