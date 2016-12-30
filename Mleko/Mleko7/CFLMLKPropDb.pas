unit CFLMLKPropDb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKProp, ActnList, ComCtrls, DBAccess, MsAccess, DB, DBCtrls,
  MemDS, ToolWin, StdCtrls, citDBComboEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TCFLMLKPropDbDlg = class(TCFLMLKPropDlg)
    ActionDebugAll: TAction;
    ActionShowContextValues: TAction;
    DS: TDataSource;
    Query: TMSQuery;
    ToolBar: TToolBar;
    BtnEditDlg: TToolButton;
    ActionViewEditTollBar: TAction;
    ActionEditDlg: TAction;
    quCMD: TMSQuery;
    procedure FormCreate(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure ActionApplyExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure QueryAfterEdit(DataSet: TDataSet);
    procedure ActionDebugExecute(Sender: TObject);
    procedure ActionDebugAllExecute(Sender: TObject);
    procedure QueryAfterInsert(DataSet: TDataSet);
    procedure ActionViewEditTollBarExecute(Sender: TObject);
    procedure ActionEditDlgExecute(Sender: TObject);

  private
    procedure OnDataChanged(Sender: TObject);
  protected
  public
    dlg_id: Integer;
    edit_type: string;
//    class function CreatePropDlg(p_prop_dlg_id:Integer;p_edit_type:String;var p_params: TStrings):boolean;
    class function ShowDlg(p_prop_dlg_id: Integer; p_edit_type: string; var p_params: TParams): boolean;
  end;

var
  CFLMLKPropDbDlg: TCFLMLKPropDbDlg;

implementation

uses CFLMLKEditReport, data;


{$R *.dfm}

procedure TCFLMLKPropDbDlg.OnDataChanged(Sender: TObject);
begin
//    DataChanged := true;
end;

procedure TCFLMLKPropDbDlg.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited;
{
    for i:=0 to ComponentCount - 1 do begin
        if Components[i].ClassNameIs('TDBEdit')           then (Components[i] as TDBEdit).OnChange := OnDataChanged;
        if Components[i].ClassNameIs('TDBMemo')           then (Components[i] as TDBMemo).OnChange := OnDataChanged;
        if Components[i].ClassNameIs('TDBListBox')        then (Components[i] as TDBListBox).OnChange := OnDataChanged;
        if Components[i].ClassNameIs('TDBCheckBox')       then (Components[i] as TDBCheckBox).OnChange := OnDataChanged;
        if Components[i].ClassNameIs('TDBRadioGroup')     then (Components[i] as TDBRadioGroup).OnChange := OnDataChanged;
        if Components[i].ClassNameIs('TDBLookupListBox')  then (Components[i] as TDBLookupListBox).OnChange := OnDataChanged;
        if Components[i].ClassNameIs('TDBLookupComboBox') then (Components[i] as TDBLookupComboBox).OnChange := OnDataChanged;
    end;
}
end;

procedure TCFLMLKPropDbDlg.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if DS.State <> dsBrowse then DataChanged := true;
end;

procedure TCFLMLKPropDbDlg.ActionApplyExecute(Sender: TObject);
begin
  inherited;
  if Saved then
  begin
    if (Query.State = dsInsert) or (Query.State = dsEdit) then Query.Post;
    if DataChanged then begin
      Saved := true;
      DataChanged := false;
    end;
  end;
end;

procedure TCFLMLKPropDbDlg.ActionCancelExecute(Sender: TObject);
begin
  if (Query.State = dsInsert) or (Query.State = dsEdit) then Query.Cancel;
  inherited;
end;

procedure TCFLMLKPropDbDlg.QueryAfterEdit(DataSet: TDataSet);
begin
  inherited;
  if Query.State <> dsBrowse then DataChanged := true;
end;

procedure TCFLMLKPropDbDlg.QueryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if Query.State <> dsBrowse then DataChanged := true;
end;

procedure TCFLMLKPropDbDlg.ActionDebugExecute(Sender: TObject);
begin
  inherited;
  ActionDebug.Checked := not ActionDebug.Checked;
  Query.Debug := ActionDebug.Checked;
end;

procedure TCFLMLKPropDbDlg.ActionDebugAllExecute(Sender: TObject);
var
  i: integer;
begin
  inherited;
  ActionDebugAll.Checked := not ActionDebugAll.Checked;
  for i := 0 to ComponentCount - 1 do begin
    if Components[i].InheritsFrom(TCustomDADataSet) then
      (Components[i] as TCustomDADataSet).Debug := ActionDebugAll.Checked;
  end;
end;

class function TCFLMLKPropDbDlg.ShowDlg(p_prop_dlg_id: Integer; p_edit_type: string; var p_params: TParams): boolean;
var
  Dlg: TCFLMLKPropDBDlg;
  i, l_height, l_width: integer;
  PClass: TComponentClass;
  Caption_Edit_type: string;
  l_sql: WideString;
begin
  dmDataModule.QFO.Close;
  dmDataModule.QFO.SQL.Clear;
  dmDataModule.QFO.SQL.Add('select * from d_prop_Dlg where id=' + IntTOStr(p_prop_dlg_id));
  dmDataModule.QFO.Open;
  l_width := dmDataModule.QFO.FieldByName('width').AsInteger;
  l_height := dmDataModule.QFO.FieldByName('height').AsInteger;
//  PClass := TComponentClass(GetClass(dmDataModule.QFO.FieldByName('class').AsString));
  PClass := TComponentClass(GetClass('TCFLMLKCustomRepDlg'));

  Application.CreateForm(PClass, Dlg);

  Dlg.dlg_id := p_prop_dlg_id;
  Dlg.edit_type := p_edit_type;
  if l_width < 240 then l_width := 240;
  if l_height < 120 then l_height := 120;
  Dlg.PageControl.Width := l_width;
  Dlg.PageControl.Height := l_height;
  Dlg.Width := l_width + 8;
  Dlg.Height := l_height + 85;

  if p_edit_type = 'EDIT' then
  begin
    Caption_Edit_type := 'Редактирование - ';
    dlg.Query.Close;
    dlg.Query.SQL.Clear;
    dlg.Query.SQL.add(dmDataModule.QFO.FieldByName('sql_edit').AsString);
    dlg.QuCMD.Close;
    dlg.QuCMD.SQL.Clear;
    dlg.QuCMD.SQL.add(dmDataModule.QFO.FieldByName('sql_cmd_edit').AsString);
  end;
  if p_edit_type = 'ADD' then
  begin
    Caption_Edit_type := 'Добавление - ';
    dlg.Query.Close;
    dlg.Query.SQL.Clear;
    dlg.Query.SQL.add(dmDataModule.QFO.FieldByName('sql_insert').AsString);
    dlg.QuCMD.Close;
    dlg.QuCMD.SQL.Clear;
    dlg.QuCMD.SQL.add(dmDataModule.QFO.FieldByName('sql_cmd_insert').AsString);
  end;
  if p_edit_type = 'DEL' then
  begin
    dlg.QuCMD.Close;
    dlg.QuCMD.SQL.Clear;
    dlg.QuCMD.SQL.add(dmDataModule.QFO.FieldByName('sql_cmd_delete').AsString);
  end;

  if p_edit_type = 'REPORT' then
  begin
    Caption_Edit_type := 'Отчет - ';
  end;

  Dlg.Caption := Caption_Edit_type + dmDataModule.QFO.FieldByName('name').AsString;
  if p_edit_type <> 'DEL' then Dlg.CreateControlsToParent(p_prop_dlg_id, dlg.TabSheet1, p_Params);
  try
    Result := Dlg.ShowModal = mrOk;
    if Result then
    begin
//
    end;
  finally
    Dlg.Free;
  end;
end;

procedure TCFLMLKPropDbDlg.ActionViewEditTollBarExecute(Sender: TObject);
begin
  inherited;
  ToolBar.Visible := not (ToolBar.Visible);
end;

procedure TCFLMLKPropDbDlg.ActionEditDlgExecute(Sender: TObject);
var l_code: string;
begin
  inherited;
  ModalResult := mrCancel;
  if edit_type = 'REPORT' then l_code := 'REPORT' else l_code := 'PROP';
  TCFLMLKEditReportForm.ShowForm(dlg_id, l_code);
end;



initialization
  RegisterClass(TCFLMLKPropDbDlg);

finalization
  UnRegisterClass(TCFLMLKPropDbDlg);

end.

