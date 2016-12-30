unit MlekoEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, MemDS, DBAccess, MSAccess, GridsEh,
  DBGridEh;

type
  TMlekoEmployee0 = class(TMlekoForm)
    dsEmployee: TDataSource;
    quEmployee: TMSQuery;
    DBGridEh1: TDBGridEh;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoEmployee0: TMlekoEmployee0;

  procedure ShowEmployee;

implementation

{$R *.dfm}

procedure ShowEmployee;
begin
 MlekoEmployee0:=TMlekoEmployee0.Create(Application);
 try
 MlekoEmployee0.quEmployee.Open;
 MlekoEmployee0.ShowModal;
 finally
 MlekoEmployee0.quEmployee.Close;
 MlekoEmployee0.Free;
 end;
end;

end.
