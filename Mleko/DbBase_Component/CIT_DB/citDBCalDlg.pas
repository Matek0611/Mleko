unit citDBCalDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, Buttons, citBaseCalDlg, Menus;

type          
  TDBCalendForm = class(TCalendForm)
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoShow; override;
  end;

implementation

uses citDBCalendar, DB;

procedure TDBCalendForm.DoShow;
var
   i : integer;
begin
  inherited;
  for i:=0 to Grid.ColCount-1 do Grid.Cells[i, 0] := ShortDayNames[((i+1) mod 7) + 1];
  with TcitDBDateEdit(Tag) do
   if PickFromField and (Field.DataSet.State <> dsInsert) then DecodeDate(StrToDate(Text), Year, Month, Day)
        else if DatePickMethod = dmToday then DecodeDate(Date, Year, Month, Day)
                                         else DecodeDate(LastEnteredDate, Year, Month, Day);
  UpdateCalendar(Day);
  SystemParametersInfo(SPI_GETKEYBOARDDELAY, 0, @i, 0);
  Delay := (i+1)*250;
  SystemParametersInfo(SPI_GETKEYBOARDSPEED, 0, @i, 0);
  Speed := Round(1000/(2+i*(28/31)));
end;

procedure TDBCalendForm.KeyDown(var Key: Word; Shift: TShiftState);
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

  with TcitDBDateEdit(Tag) do
   begin
     ShortCutToKey(TodayShortCut, ShortCutKey, ShortCutShift);
     if (ShortCutKey = Key) and (ShortCutShift = Shift) then BtnToday.Click;
   end;
  inherited 
end;

end.
