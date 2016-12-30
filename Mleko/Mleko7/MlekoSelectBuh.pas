unit MlekoSelectBuh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKSelect, DBAccess, MsAccess, DB, COMPSQLBuilder,   ActnList, 
  citComponentProps, ExtCtrls, comp_TargetFilter_Panel, StdCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, citDbGrid, MemDS;

type
  TMlekoSelectBuhDlg = class(TCFLMLKSelectDlg)
    function SQLBuilderGetWhere(Sender: TObject): String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectBuhDlg: TMlekoSelectBuhDlg;

implementation

uses data;

{$R *.dfm}

function TMlekoSelectBuhDlg.SQLBuilderGetWhere(Sender: TObject): String;
var
  quUsersForChangeBuh : TMSQuery;
begin

  quUsersForChangeBuh := TMSQuery.Create(nil);
  quUsersForChangeBuh.Connection:= dmDataModule.DB;
  quUsersForChangeBuh.SQL.Clear;
  quUsersForChangeBuh.SQL.Text := 'select ChangeBuhType from ListUsersForChangeBuh where UserNo = :UserNo';
  quUsersForChangeBuh.ParamByName('UserNo').Value := data.UserNo;
  quUsersForChangeBuh.Open;

  if (quUsersForChangeBuh.FieldByName('ChangeBuhType').Value = 0) or (quUsersForChangeBuh.FieldByName('ChangeBuhType').IsNull)
   then begin
          result := 'Buh not in (1)';
        end;

end;

initialization
 RegisterClass(TMlekoSelectBuhDlg);

finalization
 UnRegisterClass(TMlekoSelectBuhDlg);

end.
