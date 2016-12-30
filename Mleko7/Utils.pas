unit Utils;
interface
uses Dialogs,SysUtils,Menus;
function IntToString(Value:LongInt):string;
function IntToStringUkr(Value:LongInt):string;
function MonthToString(Value:integer;RodPad:boolean):string;
function MonthToStringUkr(Value:integer;RodPad:boolean):string;

implementation
function IntToString(Value:LongInt):string;
var dig :array [1..6] of integer;
    i:integer;
    t:string;
begin
 Result:='';
 t:='тыс€ч ';
 if Value>999999 then
  begin
   Result:='******';
   exit;
  end;
 for i:=1 to 6 do
  begin
   dig[i]:=Value mod 10;
   Value:=Value div 10;
  end;
 case dig[6] of
  1:Result:=Result+'сто ';
  2:Result:=Result+'двести ';
  3:Result:=Result+'триста ';
  4:Result:=Result+'четыреста ';
  5:Result:=Result+'п€тьсот ';
  6:Result:=Result+'шестьсот ';
  7:Result:=Result+'семьсот ';
  8:Result:=Result+'восемьсот ';
  9:Result:=Result+'дев€тьсот ';
 end;
 case dig[5] of
  1:begin
     case dig[4] of
      0:Result:=Result+'дес€ть ';
      1:Result:=Result+'одинадцать ';
      2:Result:=Result+'двенадцать ';
      3:Result:=Result+'тринадцать ';
      4:Result:=Result+'четырнадцать ';
      5:Result:=Result+'п€тнадцать ';
      6:Result:=Result+'шестнадцать ';
      7:Result:=Result+'семнадцать ';
      8:Result:=Result+'восемнадцать ';
      9:Result:=Result+'дев€тнадцать ';
     end;
    end;
  2:Result:=Result+'двадцать ';
  3:Result:=Result+'тридцать ';
  4:Result:=Result+'сорок ';
  5:Result:=Result+'п€тьдес€т ';
  6:Result:=Result+'шестьдес€т ';
  7:Result:=Result+'семьдес€т ';
  8:Result:=Result+'восемьдес€т ';
  9:Result:=Result+'дев€носто ';
 end;
 if dig[5]<>1 then
  case dig[4] of
   1:begin
      Result:=Result+'одна ';
      t:='тыс€ча ';
     end;
   2:begin
      Result:=Result+'две ';
      t:='тыс€чи ';
     end;
   3:begin
      Result:=Result+'три ';
      t:='тыс€чи ';
     end;
   4:begin
      Result:=Result+'четыре ';
      t:='тыс€чи ';
     end;
   5:Result:=Result+'п€ть ';
   6:Result:=Result+'шесть ';
   7:Result:=Result+'семь ';
   8:Result:=Result+'восемь ';
   9:Result:=Result+'дев€ть ';
  end;
  if dig[6]+dig[5]+dig[4]>0 then Result:=Result+t;
//********************
 case dig[3] of
  1:Result:=Result+'сто ';
  2:Result:=Result+'двести ';
  3:Result:=Result+'триста ';
  4:Result:=Result+'четыреста ';
  5:Result:=Result+'п€тьсот ';
  6:Result:=Result+'шестьсот ';
  7:Result:=Result+'семьсот ';
  8:Result:=Result+'восемьсот ';
  9:Result:=Result+'дев€тьсот ';
 end;
 case dig[2] of
  1:begin
     case dig[1] of
      0:Result:=Result+'дес€ть ';
      1:Result:=Result+'одинадцать ';
      2:Result:=Result+'двенадцать ';
      3:Result:=Result+'тринадцать ';
      4:Result:=Result+'четырнадцать ';
      5:Result:=Result+'п€тнадцать ';
      6:Result:=Result+'шестнадцать ';
      7:Result:=Result+'семнадцать ';
      8:Result:=Result+'восемнадцать ';
      9:Result:=Result+'дев€тнадцать ';
     end;
    end;
  2:Result:=Result+'двадцать ';
  3:Result:=Result+'тридцать ';
  4:Result:=Result+'сорок ';
  5:Result:=Result+'п€тьдес€т ';
  6:Result:=Result+'шестьдес€т ';
  7:Result:=Result+'семьдес€т ';
  8:Result:=Result+'восемьдес€т ';
  9:Result:=Result+'дев€носто ';
 end;
 if dig[2]<>1 then
  case dig[1] of
   1:Result:=Result+'одна ';
   2:Result:=Result+'две ';
   3:Result:=Result+'три ';
   4:Result:=Result+'четыре ';
   5:Result:=Result+'п€ть ';
   6:Result:=Result+'шесть ';
   7:Result:=Result+'семь ';
   8:Result:=Result+'восемь ';
   9:Result:=Result+'дев€ть ';
  end;
 Result:=AnsiUpperCase(Copy(Result,1,1))+Copy(Result,2,255);
end;
function IntToStringUkr(Value:LongInt):string;
var dig :array [1..6] of integer;
    i:integer;
    t:string;
begin
 Result:='';
 if Value=0 then Result:='ноль';
 t:='тис€ч ';
 if Value>999999 then
  begin
   Result:='******';
   exit;
  end;
 for i:=1 to 6 do
  begin
   dig[i]:=Value mod 10;
   Value:=Value div 10;
  end;
 case dig[6] of
  1:Result:=Result+'сто ';
  2:Result:=Result+'дв≥ст≥ ';
  3:Result:=Result+'триста ';
  4:Result:=Result+'чотириста ';
  5:Result:=Result+'п`€тсот ';
  6:Result:=Result+'ш≥стьсот ';
  7:Result:=Result+'с≥мсот ';
  8:Result:=Result+'в≥с≥мсот ';
  9:Result:=Result+'дев`€тсот ';
 end;
 case dig[5] of
  1:begin
     case dig[4] of
      0:Result:=Result+'дес€ть ';
      1:Result:=Result+'одинадц€ть ';
      2:Result:=Result+'дванадц€ть ';
      3:Result:=Result+'тринадц€ть ';
      4:Result:=Result+'чотирнадц€ть ';
      5:Result:=Result+'п`€тнадц€ть ';
      6:Result:=Result+'ш≥стнадц€ть ';
      7:Result:=Result+'с≥мнадц€ть ';
      8:Result:=Result+'в≥с≥мнадц€ть ';
      9:Result:=Result+'дев`€тнадц€ть ';
     end;
    end;
  2:Result:=Result+'двадц€ть ';
  3:Result:=Result+'тридц€ть ';
  4:Result:=Result+'сорок ';
  5:Result:=Result+'п`€тдес€т ';
  6:Result:=Result+'ш≥стьдес€т ';
  7:Result:=Result+'с≥мдес€т ';
  8:Result:=Result+'в≥с≥мдес€т ';
  9:Result:=Result+'дев`€носто ';
 end;
 if dig[5]<>1 then
  case dig[4] of
   1:begin
      Result:=Result+'одна ';
      t:='тис€ча ';
     end;
   2:begin
      Result:=Result+'дв≥ ';
      t:='тис€ч≥ ';
     end;
   3:begin
      Result:=Result+'три ';
      t:='тис€ч≥ ';
     end;
   4:begin
      Result:=Result+'чотири ';
      t:='тис€ч≥ ';
     end;
   5:Result:=Result+'п`€ть ';
   6:Result:=Result+'ш≥сть ';
   7:Result:=Result+'с≥м ';
   8:Result:=Result+'в≥с≥м ';
   9:Result:=Result+'дев`€ть ';
  end;
  if dig[6]+dig[5]+dig[4]>0 then Result:=Result+t;
//********************
 case dig[3] of
  1:Result:=Result+'сто ';
  2:Result:=Result+'дв≥ст≥ ';
  3:Result:=Result+'триста ';
  4:Result:=Result+'чотириста ';
  5:Result:=Result+'п€`тьсот ';
  6:Result:=Result+'ш≥стьсот ';
  7:Result:=Result+'с≥мсот ';
  8:Result:=Result+'в≥с≥мсот ';
  9:Result:=Result+'дев`€тьсот ';
 end;
 case dig[2] of
  1:begin
     case dig[1] of
      0:Result:=Result+'дес€ть ';
      1:Result:=Result+'одинадц€ть ';
      2:Result:=Result+'дванадц€ть ';
      3:Result:=Result+'тринадц€ть ';
      4:Result:=Result+'чотирнадц€ть ';
      5:Result:=Result+'п`€тнадц€ть ';
      6:Result:=Result+'ш≥стнадц€ть ';
      7:Result:=Result+'с≥мнадц€ть ';
      8:Result:=Result+'в≥с≥мнадц€ть ';
      9:Result:=Result+'дев`€тнадц€ть ';
     end;
    end;
  2:Result:=Result+'двадц€ть ';
  3:Result:=Result+'тридц€ть ';
  4:Result:=Result+'сорок ';
  5:Result:=Result+'п`€тдес€т ';
  6:Result:=Result+'ш≥стдес€т ';
  7:Result:=Result+'с≥мдес€т ';
  8:Result:=Result+'в≥с≥мдес€т ';
  9:Result:=Result+'дев`€носто ';
 end;
 if dig[2]<>1 then
  case dig[1] of
   1:Result:=Result+'одна ';
   2:Result:=Result+'дв≥ ';
   3:Result:=Result+'три ';
   4:Result:=Result+'чотири ';
   5:Result:=Result+'п`€ть ';
   6:Result:=Result+'ш≥сть ';
   7:Result:=Result+'с≥м ';
   8:Result:=Result+'в≥с≥м ';
   9:Result:=Result+'дев`€ть ';
  end;
 Result:=AnsiUpperCase(Copy(Result,1,1))+Copy(Result,2,255);
end;

function MonthToString(Value:integer;RodPad:boolean):string;
begin
 Result:='';
 if RodPad then
  case Value of
   1:Result:='€нвар€';
   2:Result:='феврал€';
   3:Result:='марта';
   4:Result:='апрел€';
   5:Result:='ма€';
   6:Result:='июн€';
   7:Result:='июл€';
   8:Result:='августа';
   9:Result:='сент€бр€';
  10:Result:='окт€бр€';
  11:Result:='но€бр€';
  12:Result:='декабр€';
  end
 else
  case Value of
   1:Result:='€нварь';
   2:Result:='февраль';
   3:Result:='март';
   4:Result:='апрель';
   5:Result:='май';
   6:Result:='июнь';
   7:Result:='июль';
   8:Result:='август';
   9:Result:='сент€брь';
  10:Result:='окт€брь';
  11:Result:='но€брь';
  12:Result:='декабрь';
  end;
end;
function MonthToStringUkr(Value:integer;RodPad:boolean):string;
begin
 Result:='';
 if RodPad then
  case Value of
   1:Result:='с≥чн€';
   2:Result:='лютого';
   3:Result:='березн€';
   4:Result:='кв≥тн€';
   5:Result:='травн€';
   6:Result:='червн€';
   7:Result:='липн€';
   8:Result:='серпн€';
   9:Result:='вересн€';
  10:Result:='жовтн€';
  11:Result:='листопада';
  12:Result:='грудн€';
  end
 else
  case Value of
   1:Result:='с≥чень';
   2:Result:='лютий';
   3:Result:='березень';
   4:Result:='кв≥тень';
   5:Result:='травень';
   6:Result:='червень';
   7:Result:='липень';
   8:Result:='серпень';
   9:Result:='вересень';
  10:Result:='жовтень';
  11:Result:='листопад';
  12:Result:='грудень';
  end;
end;

end.
