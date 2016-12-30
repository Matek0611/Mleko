unit MLekoListRestAudit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKList, DBAccess, MsAccess, Menus, citComponentProps, DB,  
  COMPSQLBuilder, ActnList, Grids, DBGrids, citDbGrid, ExtCtrls,
  comp_TargetFilter_Panel, ComCtrls, ToolWin,
  comp_TargetFilter_DateFilter, StdCtrls,
  MemDS;

type
  TMlekoListRestAuditForm = class(TCFLMLKListForm)
    ActionCopyToExcel: TAction;
    ToolButton6: TToolButton;
    ActionAuditPos: TAction;
    ed_date_beg: TDateTimePicker;
    ed_date_end: TDateTimePicker;
    Label1: TLabel;
    function DBGridGetKey(Sender: TObject; DataSet: TDataSet): String;
    procedure ActionCopyToExcelExecute(Sender: TObject);
    procedure ActionAuditPosExecute(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SQLBuilderGetParams(Sender: TObject; var Params: TParams);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure SetActionsEnabled; override;
  public

  end;

var
  MlekoListRestAuditForm: TMlekoListRestAuditForm;

implementation

uses MlekoSelectSector, MlekoSelectSotrud, MlekoAuditRestPos, data, main;

{$R *.dfm}

function TMlekoListRestAuditForm.DBGridGetKey(Sender: TObject;
  DataSet: TDataSet): String;
begin
  inherited;
    Result := DataSet.FieldByName('ID').AsString;
end;

procedure TMlekoListRestAuditForm.ActionCopyToExcelExecute(Sender: TObject);
begin
  inherited;
  Dbgrid.CopyGridToExcel;
end;

procedure TMlekoListRestAuditForm.SetActionsEnabled;
var
  ne, c, aEditEnabled: boolean;
  status: Integer;
begin
  inherited;
  ne := not Query.IsEmpty ;
end;

procedure TMlekoListRestAuditForm.ActionAuditPosExecute(Sender: TObject);
begin
  inherited;
   TMlekoAuditRestPosForm.ShowForm(ed_date_beg.Date,ed_date_end.Date, DS.DataSet.FieldByName('tovarNo').AsInteger);
end;

procedure TMlekoListRestAuditForm.DBGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
    if (Key = VK_RETURN) then
    begin
      ActionAuditPos.Execute;
    end;
end;

procedure TMlekoListRestAuditForm.SQLBuilderGetParams(Sender: TObject;
  var Params: TParams);
begin
  inherited;
    with Params.CreateParam(ftInteger, 'p_date_beg', ptInput) do AsDate  := ed_date_beg.Date;
    with Params.CreateParam(ftInteger, 'p_date_end', ptInput) do AsDate  := ed_date_end.Date;
end;

procedure TMlekoListRestAuditForm.FormCreate(Sender: TObject);
begin
  inherited;
  ed_date_beg.Date:=Main.GlobalDateNakl;
  ed_date_end.Date:=Main.GlobalDateNakl;
end;

end.
