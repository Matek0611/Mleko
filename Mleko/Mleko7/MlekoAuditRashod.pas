unit MlekoAuditRashod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKList, Menus, citComponentProps, DB,   DBAccess, MsAccess,
  COMPSQLBuilder, ActnList, Grids, DBGrids, citDbGrid, ExtCtrls,
  comp_TargetFilter_Panel, ComCtrls, ToolWin, MemDS;

type
  TMlekoAuditRashodForm = class(TCFLMLKListForm)
    ActionExitForm: TAction;
    procedure SQLBuilderGetParams(Sender: TObject; var Params: TParams);
    procedure ActionExitFormExecute(Sender: TObject);
    function DBGridGetKey(Sender: TObject; DataSet: TDataSet): String;
  private
      NaklNo:integer;
     TovarNo:integer;
  public
    class procedure ShowForm(p_NaklNo: integer; p_TovarNo: integer=-1);
  end;

var
  MlekoAuditRashodForm: TMlekoAuditRashodForm;

implementation

{$R *.dfm}

class procedure TMlekoAuditRashodForm.ShowForm(p_NaklNo: integer; p_TovarNo: integer=-1);
begin
    with Create(Application) do begin
     NaklNo:= p_NaklNo;
     TovarNo:=p_TovarNo;
     ActionViewRefresh.Execute;
     ShowModal;
    end;
end;

procedure TMlekoAuditRashodForm.SQLBuilderGetParams(Sender: TObject;
  var Params: TParams);
  var is_all_tovar: integer;
begin
  inherited;
    if TovarNo=-1 then is_all_tovar:=1 else is_all_tovar:=0;
    with Params.CreateParam(ftInteger, 'TovarNo', ptInput) do AsInteger    := TovarNo;
    with Params.CreateParam(ftInteger, 'is_all_tovar', ptInput) do AsInteger    := is_all_tovar;
    with Params.CreateParam(ftInteger, 'NaklNo', ptInput) do AsInteger := NaklNo;
end;

procedure TMlekoAuditRashodForm.ActionExitFormExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

function TMlekoAuditRashodForm.DBGridGetKey(Sender: TObject;
  DataSet: TDataSet): String;
begin
  inherited;
  Result:=DataSet.FieldByName('ID').AsString;
end;

end.
