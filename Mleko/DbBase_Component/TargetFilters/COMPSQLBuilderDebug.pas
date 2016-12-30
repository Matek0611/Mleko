unit COMPSQLBuilderDebug;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TCOMPSQLBuilderDebugDlg = class(TForm)
    ButtonClose: TButton;
    MemoSQL: TMemo;
  private
  public
    class procedure ShowDebug(aSQL: AnsiString);
  end;

var
  COMPSQLBuilderDebugDlg: TCOMPSQLBuilderDebugDlg;

implementation

{$R *.dfm}

class procedure TCOMPSQLBuilderDebugDlg.ShowDebug(aSQL: AnsiString);
var
    Dlg: TCOMPSQLBuilderDebugDlg;
begin
    Dlg := TCOMPSQLBuilderDebugDlg.Create(Application);
    try
        Dlg.MemoSQL.Text := aSQL;
        Dlg.ShowModal;
    finally
        FreeAndNil(Dlg);
    end;
end;

end.
