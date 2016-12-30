
unit Debug;

interface
uses
  Windows;

type
  TTickInfo = class
  private
    StartTime: DWORD;
    StopTime: DWORD;
    Working: boolean;
  public
    procedure Start;
    procedure Stop;

    function GetInterval:DWORD;
    function GetIntervalSt:string;
  end;

function IntervalToStr(T:DWORD):string;

implementation
uses
  SysUtils;

procedure TTickInfo.Start;
begin
  Working := True;
  StartTime := GetTickCount;
end;

procedure TTickInfo.Stop;
begin
  StopTime := GetTickCount;
  Working := False;
end;

function TTickInfo.GetInterval:DWORD;
begin
  if Working then
    Result := GetTickCount - StartTime
  else
    Result := StopTime - StartTime;
end;

function TTickInfo.GetIntervalSt:string;
begin
  Result := IntervalToStr(GetInterval);
end;

function IntervalToStr(T:DWORD):string;
var
  St:string;
begin
  if T > 60000 then begin
    Result := IntToStr(T div 60000) + ':';
    T:= T mod 60000;
  end
  else
    Result:= '0:';

  if T > 1000 then
    Result := Result + IntToStr(T div 1000) + ':'
  else
    Result := Result + '0:';

  St:= IntToStr(T mod 1000);
  while Length(St) < 3 do
    St := '0' + St;

  Result := Result + St;
end;

end.
