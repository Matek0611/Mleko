unit citRegDB;

interface

uses citDBCtrls, citDBTimeEdit, citDBCalendar, citDBCalculator, Classes,
     Forms, Controls, citDbGrid;


procedure Register;

implementation


procedure Register;
begin
  RegisterComponents('CIT Db',[TcitDBEdit, TcitDBDateEdit, TcitDBTimeEdit, TcitDBCalcEdit]);

end;

end.
