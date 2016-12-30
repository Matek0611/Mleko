unit CFLMLKCustomRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKProp, ActnList, ComCtrls, StdCtrls, frxExportPDF,
  frxExportRTF, frxExportXLS, frxClass, frxExportXML, frxDBSet, DB, DBAccess, MsAccess,
  citDBComboEdit, frxDesgn, DBCtrls, ExtCtrls,
  PropFilerEh, frxExportHTML,
  frxExportImage, frxExportTXT, CFLMLKPropDb, citCtrls, citmask, MemDS,
  ToolWin, frxCross, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, frxBarcode;

type
  TCFLMLKCustomRepDlg = class(TCFLMLKPropDbDlg)
    quTemplates: TMSQuery;
    quReport: TMSQuery;
    quParams: TMSQuery;
    ActionDesignReport: TAction;
    ToolBtnAdd: TToolButton;
    ActionEditReport: TAction;
    SPSaveReport: TMSStoredProc;
    frxDesigner1: TfrxDesigner;
    ActionViewSQL: TAction;
    ActionPushButton: TAction;
    DSReport: TDataSource;
    quWork: TMSQuery;
    ActionViewParam: TAction;
    Panel1: TPanel;
    CEView: TcitDBComboEdit;
    quViewTemplate: TMSQuery;
    Report: TfrxReport;
    quViewTemplateID: TIntegerField;
    quViewTemplateTEMPLATE: TMemoField;
    quViewTemplateName: TStringField;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTXTExport1: TfrxTXTExport;
    frxXMLExport1: TfrxXMLExport;
    frxCrossObject: TfrxCrossObject;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    IsDebugMode: TCheckBox;
    ToolButton1: TToolButton;
    frxBarCodeObject1: TfrxBarCodeObject;
    procedure ActionDesignReportExecute(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionPushButtOnExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    //    owner: String;
    procedure CreateTemplates;
    procedure ReadParam;
    procedure GetTemplateFromBlob;
  public
    class function ShowRep(p_ReportID: integer; var Params: TParams): boolean;
  end;

implementation

uses data, CFLMLKCustom;

{$R *.dfm}

class function TCFLMLKCustomRepDlg.ShowRep(p_ReportID: integer; var params: TParams): boolean;
var
  res: boolean;
begin
  inherited;
  res := TCFLMLKPropDbDlg.ShowDlg(p_ReportID, 'REPORT', params);
end;

procedure TCFLMLKCustomRepDlg.CreateTemplates;
var
  c: TMSQuery;
  r: TfrxDBDataset;
  sql_text: WideString;
begin
  quTemplates.First;
  while not quTemplates.Eof do
  begin
    try
      sql_text := dmDataModule.parse_flt_sql(quTemplates.FieldByName('SQL_TEXT').AsString, dmDataModule.get_prop_dlg_owner(dlg_id), '');
      c := TMSQuery.Create(Self);
      c.Name := 'QUERY' + quTemplates.FieldByName('num').AsString;
      c.Connection := dmDataModule.DB;
      //    c.CommandType:=cmdText;
      c.SQL.Text := sql_text;
      r := TfrxDBDataset.Create(Self);
      r.Name := 'frxDataSet' + quTemplates.FieldByName('num').AsString;
      r.DataSet := c;
      quTemplates.Next;
    except
      exit;
    end;
  end;
end;

procedure TCFLMLKCustomRepDlg.ActionDesignReportExecute(Sender: TObject);
var
  StreamWright: TStringStream;
  s1, s2: AnsiString;
begin
  inherited;
  ReadParam;
  if not quViewTemplate.FieldByName('Template').IsNull then GetTemplateFromBlob;
  Report.DesignReport;
  if Application.MessageBox('Сохранить?', 'Отчет', MB_YESNO) = IDYES then
  begin
    StreamWright := TStringStream.Create(s2);
    Report.SaveToStream(StreamWright);
    SPSaveReport.Close;
    SPSaveReport.Prepare;
    SPSaveReport.Params.ParamByName('p_report_id').Value := dlg_id;
    SPSaveReport.Params.ParamByName('p_template').LoadFromStream(StreamWright, ftMemo);
    SPSaveReport.Params.ParamByName('p_print_template_id').Value := quViewTemplate.FieldByName('ID').AsInteger;
    SPSaveReport.ExecProc;
    StreamWright.Free;
  end;
  ActionCancel.Execute;
end;

procedure TCFLMLKCustomRepDlg.GetTemplateFromBlob;
var
  StreamRead: TStream;
  s1, s2: AnsiString;
begin
  inherited;
  StreamRead := TStream.Create;
  //  StreamRead:=quViewTemplate.
  StreamRead := quViewTemplate.CreateBlobStream(quViewTemplate.FieldByName('template'), bmRead);
  Report.LoadFromStream(StreamRead);
  StreamRead.Free;
end;

procedure TCFLMLKCustomRepDlg.ActionOKExecute(Sender: TObject);
var
  i: integer;
begin
  if IsDebugMode.Checked then
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TMSQuery then TMSQuery(Components[i]).Debug := true;
    end;
  inherited;
  ReadParam;
  GetTemplateFromBlob;
  Report.ShowReport;
end;

procedure TCFLMLKCustomRepDlg.ReadParam;
var
  c: TMSQuery;
  s, DataSetName, param_name, data_type, param_value, control_class: string;
  i: integer;
  is_param_found: boolean;
  params: TStrings;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  quTemplates.First;
  i := 0;
  params := TStringList.Create;
  try
    ReadResultParams(dlg_id, params);
    while not quTemplates.Eof do
    begin
      DataSetName := 'QUERY' + quTemplates.FieldByName('num').AsString;
      if (FindComponent(DataSetName) is TMSQuery) then
      begin
        c := (FindComponent(DataSetName) as TMSQuery);
        dmDataModule.WriteDataSetParam(c, params);
      end;
      c.Open;
      quTemplates.Next;
    end;
  finally
    Screen.Cursor := crDefault;
    Params.Free;
  end;
end;

procedure TCFLMLKCustomRepDlg.ActionPushButtOnExecute(Sender: TObject);
begin
  inherited;
  if (Sender is TcitDBComboEdit) then (Sender as TcitDBComboEdit).ButtonPushed(Self);
end;

procedure TCFLMLKCustomRepDlg.FormShow(Sender: TObject);
begin
  inherited;
  quReport.Params.ParamByName('p_report_id').Value := dlg_id;
  quTemplates.Params.ParamByName('p_report_id').Value := dlg_id;
  quParams.Params.ParamByName('p_report_id').Value := dlg_id;
  quViewTemplate.Params.ParamByName('p_report_id').Value := dlg_id;
  quReport.Open;
  quTemplates.Open;
  quParams.Open;
  quViewTemplate.Open;
  CEView.KeyFieldValue := quViewTemplate.FieldByName('ID').AsString;
  CEView.GetLocateKey;
  CreateTemplates;
  Height := Height + Panel1.Height - 35;
end;

initialization
  RegisterClass(TCFLMLKCustomRepDlg);

finalization
  UnRegisterClass(TCFLMLKCustomRepDlg);

end.

