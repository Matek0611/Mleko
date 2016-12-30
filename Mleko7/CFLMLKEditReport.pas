unit CFLMLKEditReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, ExtCtrls, DB, StdCtrls, ComCtrls, DBCtrls, ToolWin, ActnList,
  DBAccess, MsAccess, DBGridEh, Mask, citCtrls, citmask, DBCtrlsEh,
  citDBComboEdit, DBLookupEh, MemDS, CFLMLKCustom, CFLMLKMDIChild, cxControls,
  cxSplitter, Menus, GridsEh, cxContainer, cxEdit, cxTextEdit, cxMemo;

type
  TCFLMLKEditReportForm = class(TCFLMLKMDIChildForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ActionList1: TActionList;
    quReport: TMSQuery;
    quTemplates: TMSQuery;
    quParams: TMSQuery;
    PanelRepDataSet: TPanel;
    Splitter2: TSplitter;
    Panel4: TPanel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    DSTemplates: TDataSource;
    DSParams: TDataSource;
    ActionTemplateCommit: TAction;
    ActionTemplateRefresh: TAction;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    ActionAddParam: TAction;
    ActionParamsRefresh: TAction;
    ActionReportRefresh: TAction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    Panel5: TPanel;
    DBMemo1: TDBMemo;
    DSReport: TDataSource;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBNumberEditEh1: TDBNumberEditEh;
    DBCheckBox1: TDBCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label4: TLabel;
    ActionEditParam: TAction;
    ActionDelParam: TAction;
    ActionDelTemplate: TAction;
    ActionAddTemplate: TAction;
    ActionAutoAddParam: TAction;
    ToolButton5: TToolButton;
    SpAddReport: TMSStoredProc;
    Panel7: TPanel;
    par_top: TDBNumberEditEh;
    par_left: TDBNumberEditEh;
    par_width: TDBNumberEditEh;
    par_height: TDBNumberEditEh;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label11: TLabel;
    quParamType: TMSQuery;
    DSParamType: TDataSource;
    rep_width: TDBNumberEditEh;
    rep_height: TDBNumberEditEh;
    Label13: TLabel;
    Label14: TLabel;
    Panel6: TPanel;
    PrPanel: TPanel;
    ActionPreviewRefresh: TAction;
    ToolButton6: TToolButton;
    DBEdit3: TDBEdit;
    Label15: TLabel;
    DBNumberEditEh2: TDBNumberEditEh;
    Label16: TLabel;
    DBMemo2: TDBMemo;
    Label17: TLabel;
    PanelPrintTemplate: TPanel;
    DBGridEh3: TDBGridEh;
    DSPrintTemplate: TDataSource;
    QuPrintTemplate: TMSQuery;
    ToolBar4: TToolBar;
    Label12: TLabel;
    ActionAutoPlace: TAction;
    ToolButton3: TToolButton;
    EdInc: TEdit;
    Edit1: TEdit;
    Edit3: TEdit;
    Label5: TLabel;
    DBComboBox1: TDBComboBox;
    QuPropDlgType: TMSQuery;
    DsPropDlgType: TDataSource;
    Label18: TLabel;
    ToolButton4: TToolButton;
    ActionPrintTemplateRefresh: TAction;
    ToolButton7: TToolButton;
    ToolButton13: TToolButton;
    PageControlQuery: TPageControl;
    TSSQLREPORT: TTabSheet;
    ReTemplateSQL: TDBRichEdit;
    TabSheetShowDlg: TTabSheet;
    TabSheetCmdDlg: TTabSheet;
    PageCmdDlg: TPageControl;
    TabSheet6: TTabSheet;
    ReCMDInsertSQL: TDBRichEdit;
    TabSheet7: TTabSheet;
    ReCMDEditSQL: TDBRichEdit;
    TabSheet8: TTabSheet;
    ReCMDDeleteSQL: TDBRichEdit;
    PageShowDlg: TPageControl;
    TabSheet10: TTabSheet;
    ReShowEditSQL: TDBRichEdit;
    ReShowInsertSQL: TDBRichEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBComboBox2: TDBComboBox;
    Label19: TLabel;
    DBCheckBox2: TDBCheckBox;
    MetaProcParam: TMSMetadata;
    MetaStoredProcs: TMSMetadata;
    ActionGenParamByProc: TAction;
    MetaStoredProcsPROCEDURE_NAME: TWideStringField;
    SpAddPropDlgAttribute: TMSStoredProc;
    MetaProcParamPROCEDURE_CATALOG: TWideStringField;
    MetaProcParamPROCEDURE_SCHEMA: TWideStringField;
    MetaProcParamPROCEDURE_NAME: TWideStringField;
    MetaProcParamPARAMETER_NAME: TWideStringField;
    MetaProcParamORDINAL_POSITION: TIntegerField;
    MetaProcParamPARAMETER_TYPE: TIntegerField;
    MetaProcParamPARAMETER_HASDEFAULT: TBooleanField;
    MetaProcParamPARAMETER_DEFAULT: TWideStringField;
    MetaProcParamIS_NULLABLE: TBooleanField;
    MetaProcParamDATA_TYPE: TIntegerField;
    MetaProcParamCHARACTER_MAXIMUM_LENGTH: TIntegerField;
    MetaProcParamCHARACTER_OCTET_LENGTH: TIntegerField;
    MetaProcParamNUMERIC_PRECISION: TIntegerField;
    MetaProcParamNUMERIC_SCALE: TSmallintField;
    MetaProcParamDESCRIPTION: TWideStringField;
    MetaProcParamTYPE_NAME: TWideStringField;
    MetaProcParamLOCAL_TYPE_NAME: TWideStringField;
    cxSplitter1: TcxSplitter;
    ToolBar5: TToolBar;
    ToolButton15: TToolButton;
    ActionExecSql: TAction;
    cxSplitter2: TcxSplitter;
    DsExecSql: TDataSource;
    QuExecSql: TMSQuery;
    DBGridSelect: TDBGridEh;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PageControl: TPageControl;
    TBPreview: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton14: TToolButton;
    citDBComboEdit1: TcitDBComboEdit;
    cxSplitter3: TcxSplitter;
    ActionPrintTemplateAdd: TAction;
    ActionPrintTemplateDel: TAction;
    ActionPrintTemplateEdit: TAction;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    cxSplitter4: TcxSplitter;
    TabShowDlg: TTabSheet;
    TabSheet3: TTabSheet;
    MemParsingScript: TcxMemo;
    ToolButton21: TToolButton;
    ActionViewSQL: TAction;
    procedure ActionTemplateCommitExecute(Sender: TObject);
    procedure ActionTemplateRefreshExecute(Sender: TObject);
    procedure ActionAddParamExecute(Sender: TObject);
    procedure ActionReportRefreshExecute(Sender: TObject);
    procedure ActionParamsRefreshExecute(Sender: TObject);
    procedure ActionDelTemplateExecute(Sender: TObject);
    procedure ActionDelParamExecute(Sender: TObject);
    procedure ActionAddTemplateExecute(Sender: TObject);
    procedure ActionPreviewRefreshExecute(Sender: TObject);
    procedure QuPrintTemplateBeforePost(DataSet: TDataSet);
    procedure ActionAutoPlaceExecute(Sender: TObject);
    procedure ActionPrintTemplateRefreshExecute(Sender: TObject);
    procedure QuPrintTemplateBeforeOpen(DataSet: TDataSet);
    procedure ActionGenParamByProcExecute(Sender: TObject);
    procedure ActionExecSqlExecute(Sender: TObject);
    procedure quTemplatesBeforeOpen(DataSet: TDataSet);
    procedure ActionPrintTemplateAddExecute(Sender: TObject);
    procedure ActionPrintTemplateEditExecute(Sender: TObject);
    procedure ActionPrintTemplateDelExecute(Sender: TObject);
    procedure DSReportDataChange(Sender: TObject; Field: TField);
    procedure ActionViewSQLExecute(Sender: TObject);
  private
    FPROP_DLG_ID: integer;
    fprop_dlg_type_code: string;
    procedure Set_prop_dlg_type_code(const Value: string);
    { Private declarations }
  public
    property PROP_DLG_ID: integer read FPROP_DLG_ID write FPROP_DLG_ID;
    property prop_dlg_type_code: string read fprop_dlg_type_code write Set_prop_dlg_type_code;
    class procedure ShowForm(PROP_DLG_ID: integer; prop_dlg_type_code: string = 'REPORT');
  end;

var
  SQL: AnsiString;
  frm: TCFLMLKEditReportForm;

implementation

uses MlekoEditRepParam, data;

{$R *.dfm}

class procedure TCFLMLKEditReportForm.ShowForm(PROP_DLG_ID: integer; prop_dlg_type_code: string = 'REPORT');
begin
  frm := TCFLMLKEditReportForm.Create(Application);
  frm.PROP_DLG_ID := PROP_DLG_ID;
  frm.prop_dlg_type_code := prop_dlg_type_code;
  with frm do
  begin
    if PROP_DLG_ID = -1 then
    begin
      SpAddReport.Close;
      SpAddReport.Prepare;
      SpAddReport.Params.ParamByName('p_id').AsInteger := PROP_DLG_ID;
      SpAddReport.Params.ParamByName('prop_dlg_type_code').AsString := prop_dlg_type_code;

      SpAddReport.ExecProc;
      PROP_DLG_ID := SpAddReport.Params.ParamByName('p_id').Value;
    end;
    quReport.ParamByName('p_report_id').Value := PROP_DLG_ID;
    quParams.ParamByName('p_report_id').Value := PROP_DLG_ID;
    quReport.Open;
    quParams.Open;
    quParamType.Open;
    QuPropDlgType.Open;
    Show;
  end;
end;

procedure TCFLMLKEditReportForm.ActionTemplateCommitExecute(Sender: TObject);
begin
  if quTemplates.Active then
  begin
    if not (quTemplates.State = dsEdit) then quTemplates.Edit;
    quTemplates.Post;
  end;
  if quReport.Active then
  begin
    if not (quReport.State = dsEdit) then quReport.Edit;
    quReport.Post;
  end;
  if quParams.Active then
  begin
    if not (quParams.State = dsEdit) then quParams.Edit;
    quParams.Post;
  end;
  if QuPrintTemplate.Active then
  begin
    if not (QuPrintTemplate.State = dsEdit) then QuPrintTemplate.Edit;
    QuPrintTemplate.Post;
  end;
end;

procedure TCFLMLKEditReportForm.ActionAddParamExecute(Sender: TObject);
var
  param_id: integer;
begin
  if TMlekoEditRepParamDlg.AddRepParam(PROP_DLG_ID, param_id) then
  begin
    ActionParamsRefresh.Execute;
    quParams.Last;
  end;
end;

procedure TCFLMLKEditReportForm.ActionTemplateRefreshExecute(Sender: TObject);
begin
  quTemplates.Close;
  quTemplates.Open;
end;

procedure TCFLMLKEditReportForm.ActionReportRefreshExecute(Sender: TObject);
begin
  quReport.Close;
  quReport.Open;
end;

procedure TCFLMLKEditReportForm.ActionParamsRefreshExecute(Sender: TObject);
begin
  quParams.Close;
  quParams.Open;
end;

procedure TCFLMLKEditReportForm.ActionDelTemplateExecute(Sender: TObject);
begin
  if Application.MessageBox('Вы уверены, что хотите удалить запрос?', 'Удаление', MB_YESNO) = IDYES then
  begin
    quTemplates.Delete;
  end;
  ActionTemplateRefresh.Execute;
end;

procedure TCFLMLKEditReportForm.ActionDelParamExecute(Sender: TObject);
begin
  if Application.MessageBox('Вы уверены, что хотите удалить параметр?', 'Удаление', MB_YESNO) = IDYES then
  begin
    quParams.Delete;
    ActionParamsRefresh.Execute;
  end;
end;

procedure TCFLMLKEditReportForm.ActionAddTemplateExecute(Sender: TObject);
begin
  quTemplates.Insert;
  quTemplates.FieldByName('PROP_DLG_ID').AsInteger := PROP_DLG_ID;
  quTemplates.Post;
  ActionTemplateRefresh.Execute;
  quTemplates.Last;
end;

procedure TCFLMLKEditReportForm.ActionPreviewRefreshExecute(Sender: TObject);
var
  i: Integer;
  l_name: string;
  Params: TParams;
begin
  PageControl.Left := 0;
  PageControl.Top := 0;
  PageControl.Width := quReport.FieldByName('width').AsInteger;
  PageControl.Height := quReport.FieldByName('height').AsInteger;
  Params := TParams.Create;
  try
    CreateControlsToParent(PROP_DLG_ID, TBPreview, Params);
  finally
    Params.Free;
  end;

end;

procedure TCFLMLKEditReportForm.QuPrintTemplateBeforePost(DataSet: TDataSet);
begin
  QuPrintTemplate.FieldByName('prop_dlg_id').AsInteger := PROP_DLG_ID;
end;

procedure TCFLMLKEditReportForm.ActionAutoPlaceExecute(Sender: TObject);
var
  l_pos_top, l_inc, i: Integer;
begin
  l_inc := StrToInt(EdInc.Text);
  l_pos_top := 20;
  quParams.first;
  while not quParams.Eof do
  begin
    quParams.Edit;
    quParams.FieldByName('pos_top').Value := l_pos_top;
    quParams.Post;
    l_pos_top := l_pos_top + l_inc;
    quParams.next;
  end;

end;

procedure TCFLMLKEditReportForm.ActionPrintTemplateRefreshExecute(
  Sender: TObject);
begin
  inherited;
  QuPrintTemplate.Close;
  QuPrintTemplate.Open;
end;

procedure TCFLMLKEditReportForm.QuPrintTemplateBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quPrintTemplate.Params.ParamByName('p_report_id').Value := PROP_DLG_ID;
end;

procedure TCFLMLKEditReportForm.ActionGenParamByProcExecute(Sender: TObject);
var
  i: Integer;
  l_param_name: string;
begin
  inherited;
  MetaProcParam.Close;
  //  MetaProcParam.Res Restrictions.Values['PROCEDURE_NAME'] := MetaStoredProcs.FieldByName('PROCEDURE_NAME').AsString;
  MetaProcParam.Open;
  i := 20;
  quParams.First;
  while not quParams.Eof do
  begin
    quParams.Delete;
    quParams.Next;
  end;
  MetaProcParam.First;
  while not MetaProcParam.Eof do
  begin
    l_param_name := copy(MetaProcParam.FieldByName('PARAMETER_NAME').AsString, 2, 200);
    SpAddPropDlgAttribute.Close;
    SpAddPropDlgAttribute.ParamByName('p_prop_dlg_id').AsInteger := PROP_DLG_ID;
    SpAddPropDlgAttribute.ParamByName('p_name').AsString := l_param_name;
    SpAddPropDlgAttribute.ParamByName('p_entity_type_id').AsInteger := 26;
    SpAddPropDlgAttribute.ParamByName('p_caption').AsString := l_param_name;
    SpAddPropDlgAttribute.ParamByName('p_pos_left').AsInteger := 10;
    SpAddPropDlgAttribute.ParamByName('p_pos_top').AsInteger := i;
    SpAddPropDlgAttribute.ParamByName('p_width').AsInteger := 120;
    SpAddPropDlgAttribute.ParamByName('p_height').AsInteger := 21;
    SpAddPropDlgAttribute.ParamByName('p_is_multiselect').AsBoolean := False;
    SpAddPropDlgAttribute.ParamByName('p_style').AsString := 'DEFAULT';
    SpAddPropDlgAttribute.ExecProc;
    MetaProcParam.Next;
    i := i + StrToInt(EdInc.Text);
  end;
  ActionParamsRefresh.Execute;
end;

procedure TCFLMLKEditReportForm.ActionExecSqlExecute(Sender: TObject);
var
  sparams: TStrings;
  Params: TParams;
  c: TDBRichEdit;
begin
  inherited;
  if (ActiveControl is TDBRichEdit) then
  begin
    c := (ActiveControl as TDBRichEdit);
    sparams := TStringList.Create;
    Params := TParams.Create;
    try
      CreateControlsToParent(PROP_DLG_ID, TBPreview, Params);
      ReadResultParams(PROP_DLG_ID, sparams);
      QuExecSql.Close;
      QuExecSql.SQL.Clear;
      ActionViewSQL.Execute;
      QuExecSql.SQL.Add(SQL);
      dmDataModule.WriteDataSetParam(QuExecSql, sparams);
      QuExecSql.Open;
    finally
      sparams.Free;
      Params.Free;
    end;
  end;
end;

procedure TCFLMLKEditReportForm.quTemplatesBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  (DataSet as TMSQuery).ParamByName('p_report_id').Value := PROP_DLG_ID;
end;

procedure TCFLMLKEditReportForm.ActionPrintTemplateAddExecute(
  Sender: TObject);
begin
  inherited;
  QuPrintTemplate.Insert;
  QuPrintTemplate.FieldByName('PROP_DLG_ID').AsInteger := PROP_DLG_ID;
  QuPrintTemplate.Post;
  ActionPrintTemplateRefresh.Execute;
  QuPrintTemplate.Last;
end;

procedure TCFLMLKEditReportForm.ActionPrintTemplateEditExecute(
  Sender: TObject);
begin
  inherited;
  //  QuPrintTemplate.Edit;
end;

procedure TCFLMLKEditReportForm.ActionPrintTemplateDelExecute(
  Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Вы уверены, что хотите удалить печатную форму?', 'Удаление', MB_YESNO) = IDYES then
  begin
    QuPrintTemplate.Delete;
    ActionPrintTemplateRefresh.Execute;
  end;
end;

procedure TCFLMLKEditReportForm.Set_prop_dlg_type_code(const Value: string);
begin
  fprop_dlg_type_code := Value;
  PanelPrintTemplate.Visible := fprop_dlg_type_code = 'REPORT';
  TSSQLREPORT.Enabled := fprop_dlg_type_code = 'REPORT';
  TSSQLREPORT.TabVisible := fprop_dlg_type_code = 'REPORT';
  PanelRepDataSet.Visible := fprop_dlg_type_code = 'REPORT';
  TabSheetCmdDlg.Enabled := not (fprop_dlg_type_code = 'REPORT');
  TabSheetCmdDlg.TabVisible := not (fprop_dlg_type_code = 'REPORT');
  TabSheetShowDlg.TabVisible := not (fprop_dlg_type_code = 'REPORT');
  TabSheetShowDlg.Enabled := not (fprop_dlg_type_code = 'REPORT');

  quTemplates.ReadOnly := not (fprop_dlg_type_code = 'REPORT');
  QuPrintTemplate.ReadOnly := not (fprop_dlg_type_code = 'REPORT');

  if fprop_dlg_type_code = 'REPORT' then
  begin
    quTemplates.Open;
    QuPrintTemplate.Open;
    PageControlQuery.ActivePage := TSSQLREPORT;
  end
  else
  begin
    PageControlQuery.ActivePage := TabSheetShowDlg;
  end;
end;

procedure TCFLMLKEditReportForm.DSReportDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Field <> nil then
  begin
    if Field.FieldName = 'type_id' then
    begin
      prop_dlg_type_code := QuPropDlgType.FieldByName('CODE').AsString;
    end
  end;
end;

procedure TCFLMLKEditReportForm.ActionViewSQLExecute(Sender: TObject);
begin
  inherited;
  MemParsingScript.Lines.Clear;
  SQL := dmDataModule.parse_flt_sql(ReTemplateSQL.Text, Self.Name, '');
  MemParsingScript.Lines.Add(SQL);
end;

end.

