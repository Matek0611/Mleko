unit MlekoAuditRestPos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKList, Menus, citComponentProps, DB,   DBAccess, MsAccess,
  COMPSQLBuilder, ActnList, Grids, DBGrids, citDbGrid, ExtCtrls,
  comp_TargetFilter_Panel, ComCtrls, ToolWin, MemDS;

type
  TMlekoAuditRestPosForm = class(TCFLMLKListForm)
    ActionExitForm: TAction;
    procedure SQLBuilderGetParams(Sender: TObject; var Params: TParams);
    procedure ActionExitFormExecute(Sender: TObject);
  private
    { Private declarations }
  public
    class procedure ShowForm(p_date_beg: TDate;p_date_end: TDate; p_TovarNo: integer);
  end;

var
  MlekoAuditRestPosForm: TMlekoAuditRestPosForm;
  g_TovarNo:integer;
  g_date_beg: Tdate;
  g_date_end: Tdate;

implementation

{$R *.dfm}

class procedure TMlekoAuditRestPosForm.ShowForm(p_date_beg: TDate;p_date_end: TDate; p_TovarNo: integer);
begin
    with Create(Application) do begin
     g_date_beg:=p_date_beg;
     g_date_end:=p_date_end;
     g_TovarNo:=p_TovarNo;
     ActionViewRefresh.Execute;
    end;
end;

procedure TMlekoAuditRestPosForm.SQLBuilderGetParams(Sender: TObject;
  var Params: TParams);
begin
  inherited;
    with Params.CreateParam(ftInteger, 'p_date_beg', ptInput) do AsDate  := g_date_beg;
    with Params.CreateParam(ftInteger, 'p_date_end', ptInput) do AsDate  := g_date_end;
    with Params.CreateParam(ftInteger, 'p_tovarNo', ptInput) do AsInteger := g_TovarNo;
end;

procedure TMlekoAuditRestPosForm.ActionExitFormExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
