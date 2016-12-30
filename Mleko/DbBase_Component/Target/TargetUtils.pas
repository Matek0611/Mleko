unit TargetUtils;

interface

function GetToken(Breaker: char; var Statement: string): string;
function GetToken2(Delimiters : string; var S : string) : string;

implementation

uses
    SysUtils;
    
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

end.
