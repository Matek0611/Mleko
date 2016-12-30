unit citBaseCalDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TCalendarGrid = class(TStringGrid);
  TCalendarButton = class(TSpeedButton);
  TCalendForm = class(TForm)
    Timer: TTimer;
    Panel1: TPanel;
    PanelButtons: TPanel;
    BtnToday: TSpeedButton;
    BtnOK: TSpeedButton;
    BtnCancel: TSpeedButton;
    Grid: TStringGrid;
    PanelText: TPanel;
    BtnDecYear: TSpeedButton;
    BtnDecMonth: TSpeedButton;
    BtnIncMonth: TSpeedButton;
    BtnIncYear: TSpeedButton;
    LabelMonth: TLabel;
    LabelYear: TLabel;
    LabelGoda: TLabel;
    procedure GridSelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure GridDrawCell(Sender: TObject; Col, Row: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure UpdateCalendar(CurrentDay : Word);
    procedure BtnIncMonthClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtnIncMonthMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnIncMonthMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnDecMonthClick(Sender: TObject);
    procedure BtnIncYearClick(Sender: TObject);
    procedure BtnDecYearClick(Sender: TObject);
    procedure GridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure BtnTodayClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  protected
    { Private declarations }
    Delay, Speed : integer;
    procedure ReleaseButton(Btn : TCalendarButton);
    procedure SinkButton(Btn : TCalendarButton);

  public
    { Public declarations }
    Day, Month, Year, FirstDay : Word;
    FixedTextColor, RedColor : TColor;
  end;

var CalendForm1 : TCalendForm;

implementation

{$R *.DFM}
{$R MARK.RES}

procedure TCalendForm.GridSelectCell(Sender: TObject; Col, Row: Integer;
  var CanSelect: Boolean);
begin
  if Grid.Cells[Col, Row] = '' then CanSelect := False
                               else begin
                                      CanSelect := True;
                                      Day := StrToInt(Grid.Cells[Col, Row])
                                    end;
end;


procedure TCalendForm.GridDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
   S : string;
   TodayMark : TBitmap;
begin
  S := Grid.Cells[Col, Row];
  if Row = 0 then Grid.Canvas.Font.Color := FixedTextColor;
  if (Col = 6) and not(gdSelected in State) then Grid.Canvas.Font.Color := RedColor
             else if (gdSelected in State) and (Row > 0)
                                         then Grid.Canvas.Font.Color := clYellow
                                         else if Row = 0 then Grid.Canvas.Font.Color := FixedTextColor
                                              else Grid.Canvas.Font.Color := Grid.Font.Color;

  if gdSelected in State then
   ExtTextOut(Grid.Canvas.Handle, Rect.Left + 2, Rect.Top + 2, ETO_CLIPPED or
              ETO_OPAQUE, @Rect, PChar(S), Length(S), nil)
    else
   ExtTextOut(Grid.Canvas.Handle, Rect.Left + 2, Rect.Top + 2, ETO_CLIPPED,
              @Rect, PChar(S), Length(S), nil);

  if (Row > 0) and (Grid.Cells[Col, Row]<>'') then
   if (EncodeDate(Year, Month, (Row-1)*7+Col - FirstDay + 1) = Date)
      and not(gdSelected in State) then
     begin
       TodayMark := TBitmap.Create;
       TodayMark.Handle := LoadBitmap(HInstance, 'Today');
       Grid.Canvas.CopyMode := cmSrcAnd;
       Grid.Canvas.Draw(Rect.Left, Rect.Top, TodayMark);
       TodayMark.Free;
     end;
end;

procedure TCalendForm.UpdateCalendar(CurrentDay : Word);
var
   i : integer;
begin
  Grid.Rows[1].Clear;
  Grid.Rows[5].Clear;
  Grid.Rows[6].Clear;
  FirstDay := (DayOfWeek(EncodeDate(Year, Month, 1))+5) mod 7;
  for i:=1 to MonthDays[IsLeapYear(Year), Month] do
    Grid.Cells[(i + FirstDay - 1) mod 7, (i + FirstDay - 1) div 7 + 1] := IntToStr(i);
  LabelMonth.Caption := LongMonthNames[Month];
  LabelYear.Caption := IntToStr(Year);
  with TCalendarGrid(Grid) do
  if CurrentDay+1 <= MonthDays[IsLeapYear(Year), Month] then
   MoveColRow((FirstDay + CurrentDay - 1) mod 7,
              (FirstDay + CurrentDay - 1) div 7 + 1, False, False)
  else
   MoveColRow((FirstDay+MonthDays[IsLeapYear(Year), Month] - 1) mod 7,
              (FirstDay+MonthDays[IsLeapYear(Year), Month] - 1) div 7 + 1,
              False, False)
end;

procedure TCalendForm.BtnIncMonthClick(Sender: TObject);
begin
  Inc(Month);
  if Month = 13 then begin
                       Month := 1;
                       Inc(Year);
                     end;
  UpdateCalendar(Day);
end;

procedure TCalendForm.TimerTimer(Sender: TObject);
begin
  if TCalendarButton(BtnIncMonth).FState = bsDown then BtnIncMonth.Click;
  if TCalendarButton(BtnDecMonth).FState = bsDown then BtnDecMonth.Click;
  if TCalendarButton(BtnIncYear).FState = bsDown then BtnIncYear.Click;
  if TCalendarButton(BtnDecYear).FState = bsDown then BtnDecYear.Click;
  Timer.Interval := Speed
end;

procedure TCalendForm.BtnIncMonthMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Timer.Enabled := True;
end;

procedure TCalendForm.BtnIncMonthMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Timer.Enabled := False;
  Timer.Interval := Delay;
end;

procedure TCalendForm.BtnDecMonthClick(Sender: TObject);
begin
  Dec(Month);
  if Month = 0 then begin
                       Month := 12;
                       Dec(Year);
                     end;
  UpdateCalendar(Day);
end;

procedure TCalendForm.BtnIncYearClick(Sender: TObject);
begin
  Inc(Year);
  UpdateCalendar(Day);
end;

procedure TCalendForm.BtnDecYearClick(Sender: TObject);
begin
  Dec(Year);
  UpdateCalendar(Day);
end;

procedure TCalendForm.GridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 function PointInRect(P : TPoint; R : TRect): boolean;
  begin
    if (P.X >= R.Left) and (P.X <= R.Right) and (P.Y >= R.Top) and (P.Y <= R.Bottom) then
           Result := True
      else Result := False;
  end;
begin
  if PointInRect(Point(X, Y), Rect(Grid.Left, Grid.Top, Grid.Left+Grid.Width-1,
                                   Grid.Top+Grid.Height-1)) then ModalResult := mrOK;
end;

procedure TCalendForm.GridKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
   #13 :
    begin
      ModalResult := mrOK;
      Key := #0;
    end;
   #27 :
    begin
      ModalResult := mrCancel;
      Key := #0;
    end;
  end
end;

procedure TCalendForm.BtnTodayClick(Sender: TObject);
begin
  DecodeDate(Date, Year, Month, Day);
  UpdateCalendar(Day);
end;

procedure TCalendForm.BtnOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TCalendForm.BtnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel
end;

procedure TCalendForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
     VK_NEXT  : begin
                  ReleaseButton(TCalendarButton(BtnIncMonth));
                  ReleaseButton(TCalendarButton(BtnIncYear));
                end;
     VK_PRIOR : begin
                  ReleaseButton(TCalendarButton(BtnDecMonth));
                  ReleaseButton(TCalendarButton(BtnDecYear))
                end
   end
end;

procedure TCalendForm.ReleaseButton(Btn : TCalendarButton);
begin
  if Btn.FState <> bsUp then
    begin
     Btn.FState := bsUp;
     Btn.Invalidate
    end;
end;

procedure TCalendForm.SinkButton(Btn : TCalendarButton);
begin
  if Btn.FState <> bsDown then
    begin
     Btn.FState := bsDown;
     Btn.Invalidate
    end;
end;


end.
