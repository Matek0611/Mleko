unit citUtils;

interface

{$R *.RES}

uses
  SysUtils, Forms, Controls, Windows;

type
  Unit1000Type = (Hundreds, Tens, Teens, OnesMale, OnesFemale);
  TGender = (Male, Female); // Gender(engl.) = род(рус.) = (м., ж.)

const
  FirstUnit = 1000000000;
  FirstUnitNum = 3;

var
  Units : array[1..FirstUnitNum, 0..9] of string;
  Unit1000 : array[Unit1000Type, 1..9] of string;
  UnitsGender : array [0..FirstUnitNum] of TGender;
  MainGender, SecondaryGender : TGender;
  ZeroStr, MinusStr, OverflowStr, CurrencyStr, CurrencyFracStr : string;

function GetToken(Breaker: char; var Statement: string): string;
{ GetToken2 function differs from GetToken in following :
  1. GetToken2 uses the string of possible delimiters
  2. GetToken2 never returns empty string except particular case
     when parameter string is empty or consists only from delimiters
  E.g. For string S = '[aaa,bbb,ccc]' and Delimiters = '[],' GetToken2 will
  consequently return 'aaa','bbb','ccc' }
function GetToken2(Delimiters : string; var S : string) : string;
procedure SetFormPosByControl(aForm: TForm; aControl: TControl);
function PointInRect(P : TPoint; R : TRect) : boolean;
function NumberInWords(X : extended) : string;
function IntegerInWords(X : integer; UnitGender : TGender) : string;
function FirstSecondStr(var isFirst: boolean; First, Second: string): string;
function TranslatePicCode(S : string) : integer;
function WildCardLoop(aStr: string): string;

implementation

function GetToken(Breaker: char; var Statement: string): string;
var
  i: integer;
begin
  i := Pos(Breaker, Statement);
  if i > 0 then
  begin
    Result := Trim(Copy(Statement, 1, i - 1));
    Statement := Trim(Copy(Statement, i + 1, Length(Statement) - i));
  end else begin
    Result := Trim(Statement);
    Statement := '';
  end;
end;

function GetToken2(Delimiters : string; var S : string) : string;
var
   i, Index, tmp : integer;
begin
 if Length(S)<1 then Result := ''
  else
  begin
   Index := Length(S)+1;
   for i:=1 to Length(Delimiters) do
     if Pos(Delimiters[i], S) <> 0 then begin
                                          tmp := Pos(Delimiters[i], S);
                                          if (tmp < Index) then Index := tmp
                                        end;
   if Index = Length(S)+1 then begin
                                 Result := S;
                                 S := ''
                               end
    else if Index = 1 then begin
                             Delete(S, 1, 1);
                             Result := GetToken2(Delimiters, S)
                           end
     else begin
            Result := Copy(S, 1, Index-1);
            Delete(S, 1, Index)
          end;
  end;
end;

procedure SetFormPosByControl(aForm: TForm; aControl: TControl);
var
  rectBox, WorkRect: TRect;
  UpperPoint, LowerPoint: TPoint;
begin
  with aControl do
  begin
    rectBox := ClientRect;
    UpperPoint.X := rectBox.Left;
    UpperPoint.Y := rectBox.Top;
    UpperPoint := ClientToScreen(UpperPoint);
    LowerPoint.X := rectBox.Right;
    LowerPoint.Y := rectBox.Bottom;
    LowerPoint := ClientToScreen(LowerPoint);
    SystemParametersInfo(SPI_GETWORKAREA, 0, @WorkRect, 0);  // Pay attention !

    if UpperPoint.X + 1 + aForm.Width > WorkRect.Right then
       aForm.Left := Screen.Width - aForm.Width - 1
    else aForm.Left := UpperPoint.X - 1;

    if LowerPoint.Y + 1 + aForm.Height > WorkRect.Bottom then
       aForm.Top := UpperPoint.Y - aForm.Height
    else aForm.Top := LowerPoint.Y + 1;
  end;
end;

function PointInRect(P : TPoint; R : TRect) : boolean;
begin
  if (P.X >= R.Left) and (P.X <= R.Right) and
     (P.Y >= R.Top) and (P.Y <= R.Bottom) then Result := True
                                          else Result := False;
end;

{function NumberInWords(X : extended) : string;
var
  s, sint, sfrac : string;
begin
  try
    s := FormatFloat('0.00', X);
    sfrac := Copy(s, Length(s)-1, 2);
    sint := Copy(s, 1, Length(s)-3);
    Result := IntegerInWords(StrToInt(sint)) + ' ' + CurrencyStr + ' ' +
              IntegerInWords(StrToInt(sfrac)) + ' ' + CurrencyFracStr;
  except
    Result := 'Ошибка преобразования';
  end;
end;}

function NumberInWords(X : extended) : string;
begin
  try
    Result := IntegerInWords(Trunc(X), MainGender) + ' ' + CurrencyStr + ' ' +
      IntegerInWords(Trunc(Abs(Frac(X)*100)), SecondaryGender) + ' ' + CurrencyFracStr;
  except
    Result := 'Ошибка преобразования';
  end;
end;

function IntegerInWords(X : integer; UnitGender : TGender) : string;
var
  CurUnit, CurNum, UnitNum : integer;
  Index : Unit1000Type;
begin
  Result := '';
  if X = 0 then Result := ZeroStr
  else if abs(X) > FirstUnit*1000.0-1 then Result := OverflowStr
  else
  begin
    if X < 0 then
      begin
        Result := MinusStr;
        X := -X;
      end;

    CurUnit := FirstUnit;
    UnitNum := FirstUnitNum;
    UnitsGender[0] := UnitGender;
    while X > 0 do
    begin
      if X div CurUnit <> 0 then
      begin
        CurNum := X div CurUnit;
        if CurNum div 100 > 0 then
          Result := Result + ' ' + Unit1000[Hundreds, CurNum div 100];
        CurNum := CurNum mod 100;
        if (CurNum div 10 >= 2) or (CurNum = 10) then
          Result := Result + ' ' + Unit1000[Tens, CurNum div 10]
        else if CurNum div 10 > 0 then
        begin
          Result := Result + ' ' + Unit1000[Teens, CurNum mod 10];
          CurNum := 0
        end;

        if UnitsGender[UnitNum] = Male then Index := OnesMale
        else Index := OnesFemale;

        if CurNum mod 10 > 0 then  Result := Result + ' ' + Unit1000[Index, CurNum mod 10];
        if UnitNum > 0 then Result := Result + ' ' + Units[UnitNum, CurNum mod 10];
      end;
      X := X mod CurUnit;
      CurUnit := CurUnit div 1000;
      Dec(UnitNum);
    end;
  end;

end;

procedure LoadResNumberStrings;
var
  ResStringRec : TResStringRec;
  i, j, k : integer;
begin
  ResStringRec.Module := @HInstance;
  k := 0;
  for i := 1 to FirstUnitNum do
    for j := 0 to 9 do
    begin
      ResStringRec.Identifier := k;
      Units[i, j] := LoadResString(@ResStringRec);
      Inc(k);
    end;
  for i := Integer(Hundreds) to Integer(OnesFemale) do
    for j := 1 to 9 do
    begin
      ResStringRec.Identifier := k;
      Unit1000[Unit1000Type(i), j] := LoadResString(@ResStringRec);
      Inc(k);
    end;

  ResStringRec.Identifier := k;
  ZeroStr := LoadResString(@ResStringRec);
  ResStringRec.Identifier := k+1;
  MinusStr := LoadResString(@ResStringRec);
  ResStringRec.Identifier := k+2;
  OverflowStr := LoadResString(@ResStringRec);
  ResStringRec.Identifier := k+3;
  CurrencyStr := LoadResString(@ResStringRec);
  ResStringRec.Identifier := k+4;
  CurrencyFracStr := LoadResString(@ResStringRec);

  ResStringRec.Identifier := k+5;
  MainGender := TGender(ord(StrUpper(PChar(LoadResString(@ResStringRec)))='F'));
  ResStringRec.Identifier := k+6;
  SecondaryGender := TGender(ord(StrUpper(PChar(LoadResString(@ResStringRec)))='F'));
  for i:= k+7 to k+6+FirstUnitNum do
  begin
    ResStringRec.Identifier := i;
    UnitsGender[i-k-6] := TGender(ord(StrUpper(PChar(LoadResString(@ResStringRec)))='F'));
  end;
end;

function FirstSecondStr(var isFirst: boolean; First, Second: string): string;
begin
  if isFirst then
  begin
    isFirst := False;
    Result := First;
  end else
    Result := Second;
end;

function TranslatePicCode(S: string): integer;
begin
  if Length(S) = 0 then
    Result := -1
  else if ord(S[1]) in [33..126] then
    Result := Ord(S[1])-33
  else
    Result := -1;
end;

function WildCardLoop(aStr: string): string;
var
  S: string;
begin
  S := aStr;
  if S <> '' then
    if (Pos('%', S) = 1) and (S[Length(S)] = '%') then
      Delete(S, Length(S), 1)
    else if S[Length(S)] = '%' then
       S := '%' + S
    else if Pos('%', S) = 1 then
      Delete(S, 1, 1)
    else
      S := S + '%';
  Result := S;
end;

initialization

  LoadResNumberStrings;

end.
