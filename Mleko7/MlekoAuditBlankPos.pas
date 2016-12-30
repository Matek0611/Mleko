unit MlekoAuditBlankPos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKList, Menus, citComponentProps, DB,   DBAccess, MsAccess,
  COMPSQLBuilder, ActnList, Grids, DBGrids, citDbGrid, ExtCtrls,
  comp_TargetFilter_Panel, ComCtrls, ToolWin, MemDS;

type
  TMlekoAuditBlankPosForm = class(TCFLMLKListForm)
    ActionExitForm: TAction;
    procedure SQLBuilderGetParams(Sender: TObject; var Params: TParams);
    procedure ActionExitFormExecute(Sender: TObject);
  private
    { Private declarations }
  public
    class procedure ShowForm(p_document_id: integer; p_TovarNo: integer);
  end;

var
  MlekoAuditBlankPosForm: TMlekoAuditBlankPosForm;
  g_Document_id:integer;
  g_TovarNo:integer;

implementation

{$R *.dfm}

class procedure TMlekoAuditBlankPosForm.ShowForm(p_document_id: integer; p_TovarNo: integer);
begin
    with Create(Application) do begin
     g_document_id:= p_document_id;
     g_TovarNo:=p_TovarNo;
     ActionViewRefresh.Execute;
    end;
end;

procedure TMlekoAuditBlankPosForm.SQLBuilderGetParams(Sender: TObject;
  var Params: TParams);
begin
  inherited;
    with Params.CreateParam(ftInteger, 'p_document_id', ptInput) do AsInteger    := g_Document_id;
    with Params.CreateParam(ftInteger, 'p_tovarNo', ptInput) do AsInteger := g_TovarNo;
end;

procedure TMlekoAuditBlankPosForm.ActionExitFormExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
