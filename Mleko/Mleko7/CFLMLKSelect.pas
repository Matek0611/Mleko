unit CFLMLKSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, ActnList, Grids, DBGrids, ExtCtrls,
  comp_TargetFilter_Panel, StdCtrls, ComCtrls, ToolWin,
  COMPSQLBuilder, DB, citComponentProps, citDbGrid,
  DBAccess, MsAccess, CFLMLKCustom, MemDS;

type
  TCFLMLKSelectDlg = class(TCFLMLKCustomForm)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    ButtonSelect: TButton;
    ButtonCancel: TButton;
    FilterPanel: TTargetFilter_Panel;
    ActionViewRefresh: TAction;
    ActionViewLayout: TAction;
    ActionGridFirst: TAction;
    ActionGridPrior: TAction;
    ActionGridNext: TAction;
    ActionGridLast: TAction;
    ActionFormSelect: TAction;
    ActionFormCancel: TAction;
    DS: TDataSource;
    SQLBuilder: TTargetSQLBuilder;
    ComponentProps: TcitComponentProps;
    ActionItemAdd: TAction;
    ActionItemProp: TAction;
    ActionItemDel: TAction;
    Query: TMSQuery;
    QueryProp: TMSQuery;
    Splitter: TSplitter;
    DSSelection: TDataSource;
    QuSelectList: TMSQuery;
    ActionViewSelectedSQL: TAction;
    ActionMark: TAction;
    ActionUnMark: TAction;
    ActionViewBuilderSQL: TAction;
    ActionCopyProfile: TAction;
    spCopyProfile: TMSStoredProc;
    ActionUnMarkAll: TAction;
    ActionMarkAll: TAction;
    PanelGrid: TPanel;
    DBGrid: TcitDBGrid;
    PanelSelect: TPanel;
    DBGridSelection: TcitDBGrid;
    ToolBar1: TToolBar;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolBar: TToolBar;
    ToolButtonRefresh: TToolButton;
    ToolButtonLayout: TToolButton;
    ToolButton6: TToolButton;
    btnViewSql: TToolButton;
    ActionViewDataSetSQL: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ActionRefreshSelected: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure ActionGridFirstExecute(Sender: TObject);
    procedure ActionGridPriorExecute(Sender: TObject);
    procedure ActionGridNextExecute(Sender: TObject);
    procedure ActionGridLastExecute(Sender: TObject);
    function SQLBuilderGetOrderBy(Sender: TObject): string;
    procedure ActionFormSelectExecute(Sender: TObject);
    procedure ActionFormCancelExecute(Sender: TObject);
    procedure DBGridReleaseGroup(Sender: TcitDBGrid);
    procedure ActionViewLayoutExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QueryAfterRefresh(DataSet: TDataSet);
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure DBGridDblClick(Sender: TObject);
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionMarkExecute(Sender: TObject);
    procedure ActionUnMarkExecute(Sender: TObject);
    function DBGridIsLighted(Sender: TObject; DataSet: TDataSet): Boolean;
    procedure ActionCopyProfileExecute(Sender: TObject);
    function SQLBuilderGetWhere(Sender: TObject): string;
    procedure AddFilter(var Filters: AnsiString; NewFilter: AnsiString);
    procedure ActionUnMarkAllExecute(Sender: TObject);
    procedure ActionMarkAllExecute(Sender: TObject);
    procedure QuSelectListAfterOpen(DataSet: TDataSet);
    procedure ActionRefreshSelectedExecute(Sender: TObject);
    function DBGridSelectionGetKey(Sender: TObject;
      DataSet: TDataSet): string;
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
  private
    OldActiveForm: AnsiString;
    query_filter: string;
    Fis_multiselect: boolean;
    procedure Setis_multiselect(const Value: boolean);
  protected
    SearchString:string;  
    ActiveSession: string;
    owner_name: string;
    entity_name: string;
    style: string;
    res_txt: string;
    Sql_Result: string;
    SqlQuery: string;
    is_hold_form: boolean;
    entity_param: TStrings;
    procedure SetActionsEnabled; virtual;
    function OnAction(Sender: TObject;DataSet:TDataSet): boolean; override;
  public
    property is_multiselect: boolean read Fis_multiselect write Setis_multiselect;
    class function OpenSelect(var KeyValues: TStrings; FirstLocate: boolean = true): boolean; overload;
    class function OpenSelect(var Value1: AnsiString; FirstLocate: boolean = true): boolean; overload;
    class function OpenSelect(var Value1: integer; FirstLocate: boolean = true): boolean; overload;
    class function OpenHoldSelect(p_owner_name: string
      ; p_entity_name: string
      ; p_entity_code: string
      ; p_is_multiselect: boolean = false
      ; p_query_filter: string = ''
      ; p_style: string = 'DEFAULT'): boolean;
  end;

implementation

uses data, MlekoSelectUser, UtilsCommon, UtilsDataConvert,BCCommon;


{$R *.dfm}

class function TCFLMLKSelectDlg.OpenSelect(var KeyValues: TStrings; FirstLocate: boolean = true): boolean;
var
  i: integer;
  Dlg: TCFLMLKSelectDlg;
begin
  Result := false;
  Dlg := Create(Application);
  DLG.is_hold_form := false;
  Dlg.ComponentProps.DefaultUser := IntToStr(data.UserNo);
  try
    if (KeyValues.Count <> Dlg.SQLBuilder.KeyFields.Count) and (KeyValues.Count <> 0) then
      raise Exception.CreateFmt('Невозможно открыть форму. Таблица имеет %d ключевых полей, а задано %d', [Dlg.SQLBuilder.KeyFields.Count,
        KeyValues.Count]);
    if (KeyValues.Count <> 0) and (FirstLocate) then
    begin
      Dlg.SQLBuilder.NewLocateData := VarArrayCreate([0, KeyValues.Count - 1], varVariant);
      for i := 0 to KeyValues.Count - 1 do
        Dlg.SQLBuilder.NewLocateData[i] := KeyValues[i];
      Dlg.DBGrid.Reopen;
      //            Dlg.SQLBuilder.Refresh(true, true);
    end
    else
      Dlg.DBGrid.Reopen; //Dlg.SQLBuilder.Refresh(false, false);
    //        Dlg.DBGrid.RestoreFormatFromStorage;
    Result := Dlg.ShowModal = mrOk;
    if Result then
    begin
      if (KeyValues.Count = 0) then
        for i := 0 to Dlg.SQLBuilder.KeyFields.Count - 1 do
          KeyValues.Add(Dlg.SQLBuilder.Query.FieldByName(Dlg.SQLBuilder.KeyFields[i]).AsString)
      else
        for i := 0 to Dlg.SQLBuilder.KeyFields.Count - 1 do
          KeyValues[i] := Dlg.SQLBuilder.Query.FieldByName(Dlg.SQLBuilder.KeyFields[i]).AsString;
    end;
  finally
    Dlg.Free;
  end;
end;

class function TCFLMLKSelectDlg.OpenSelect(var Value1: AnsiString; FirstLocate: boolean = true): boolean;
var
  aKeyValues: TStrings;
  l_res_sql: string;
begin
  Result := false;
  aKeyValues := TStringList.Create;
  try
    aKeyValues.Add(Value1);
    Result := OpenSelect(aKeyValues, FirstLocate);
    if Result then
      Value1 := aKeyValues[0];
  finally
    aKeyValues.Free;
  end;
end;

class function TCFLMLKSelectDlg.OpenSelect(var Value1: integer; FirstLocate: boolean = true): boolean;
var
  Str: AnsiString;
begin
  Str := IntToStr(Value1);
  Result := OpenSelect(Str, FirstLocate);
  if Result then
    Value1 := StrToInt(Str);
end;

class function TCFLMLKSelectDlg.OpenHoldSelect(p_owner_name: string
  ; p_entity_name: string
  ; p_entity_code: string
  ; p_is_multiselect: boolean = false
  ; p_query_filter: string = ''
  ; p_style: string = 'DEFAULT'): boolean;
var
  Dlg: TCFLMLKSelectDlg;
  i: integer;
  ls_entity_param: TStrings;
  PClass: TComponentClass;
  l_sql: string;
begin
  ls_entity_param := dmDataModule.get_entity_param(p_entity_code);

//  showmessage(ls_entity_param.Values['select_entity_class']);


  PClass := TComponentClass(GetClass(ls_entity_param.Values['select_entity_class']));

  Application.CreateForm(PClass, Dlg);
  Dlg.entity_param := ls_entity_param;
  Dlg.owner_name := p_owner_name;
  Dlg.entity_name := p_entity_name;
  Dlg.style := p_style;
  Dlg.res_txt := '';
  Dlg.is_hold_form := true;
  DLG.is_multiselect := p_is_multiselect;
  DLG.query_filter := p_query_filter;
  DLG.Caption := ls_entity_param.Values['description'];
  DLG.SQLBuilder.Select.Add(',(select 1 from e_session_params sp where sp.owner_name=''' + dlg.owner_name + ''' and sp.param_name=''' +
    dlg.entity_name + '''' + ' and SPID=' + IntTOStr(Dlg.MainDm.SPID) + ' and sp.param_value=' + dlg.entity_param.Values['key_field'] +
    ') as is_select');
  l_sql := dmDataModule.Get_selected_sql(p_owner_name, p_entity_name, ls_entity_param.Values['code']);
  if p_is_multiselect then
  begin
    DLg.QuSelectList.SQL.Clear;
    DLg.QuSelectList.SQL.Add(l_sql);
    DLg.QuSelectList.Open;
  end;
  try
    Result := Dlg.ShowModal = mrOk;
    if Result then
    begin
      if not Dlg.is_multiselect {nd not(Dlg.QuSelectList.Eof)} then
      begin
        dmDataModule.Del_session_params(dlg.owner_name, dlg.entity_name, '#NULL#');
        dmDataModule.Add_session_params(dlg.owner_name, dlg.entity_name, Dlg.Query.FieldByName(dlg.entity_param.Values['key_field']).AsString);
      end;
    end;
  finally
    ls_entity_param.Free;
    Dlg.Free;
  end;
end;

procedure TCFLMLKSelectDlg.ActionViewRefreshExecute(Sender: TObject);
var
  is_locate: boolean;
  l_old_id,l_key_field: string;
begin
  try
    Screen.Cursor := crHourGlass;
    l_key_field:=SQLBuilder.KeyFields[0];
    if l_key_field='' then l_key_field:='ID';
    is_locate := false;
    if not QuSelectList.IsEmpty then
    begin
      l_old_id := QuSelectList.FIeldByName('key_field').AsString;
      is_locate := true;
    end;
    if DBGrid.DataSource.DataSet.Active then
    begin
      l_old_id := Query.FieldByName(l_key_field).AsString;
      is_locate := true;
    end;
    DBGrid.Reopen;
    if QuSelectList.Active then QuSelectList.Refresh;
    if is_locate then Query.Locate(l_key_field, l_old_id, []);
  finally
    if DBGrid.CanFocus then ActiveControl := DBGrid;
    Screen.Cursor := crDefault;
  end;
end;

procedure TCFLMLKSelectDlg.ActionGridFirstExecute(Sender: TObject);
begin
  SQLBuilder.Query.First;
end;

procedure TCFLMLKSelectDlg.ActionGridPriorExecute(Sender: TObject);
begin
  SQLBuilder.Query.Prior;
end;

procedure TCFLMLKSelectDlg.ActionGridNextExecute(Sender: TObject);
begin
  SQLBuilder.Query.Next;
end;

procedure TCFLMLKSelectDlg.ActionGridLastExecute(Sender: TObject);
begin
  SQLBuilder.Query.Last;
end;

function TCFLMLKSelectDlg.SQLBuilderGetOrderBy(Sender: TObject): string;
begin
  Result := DbGrid.OrderBy;
end;

procedure TCFLMLKSelectDlg.ActionFormSelectExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TCFLMLKSelectDlg.ActionFormCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCFLMLKSelectDlg.DBGridReleaseGroup(Sender: TcitDBGrid);
begin
  DBGrid.Reopen;
end;

procedure TCFLMLKSelectDlg.ActionViewLayoutExecute(Sender: TObject);
begin
  DBGrid.ChangeLayout;
end;

procedure TCFLMLKSelectDlg.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  ComponentProps.DefaultUser := IntToStr(data.UserNo);
  ToolBar.Left := PageControl.Left + PageControl.Width - ToolBar.Width;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TcitComponentProps) then
      if TcitComponentProps(Components[i]).Enabled then
      begin
        TcitComponentProps(Components[i]).DefaultUser := IntToStr(data.UserNo);
        TcitComponentProps(Components[i]).RestoreFromStorage;
      end;
end;

procedure TCFLMLKSelectDlg.QueryAfterOpen(DataSet: TDataSet);
var
  i: integer;
begin
  SetActionsEnabled;
end;

procedure TCFLMLKSelectDlg.QueryAfterRefresh(DataSet: TDataSet);
begin
  SetActionsEnabled;
end;

procedure TCFLMLKSelectDlg.QueryAfterScroll(DataSet: TDataSet);
begin
  SetActionsEnabled;
end;

procedure TCFLMLKSelectDlg.SetActionsEnabled;
var
  l_key_field_value: Integer;
  ne: boolean;
begin
  ne := (not Query.IsEmpty);
  ActionItemProp.Enabled := ne;
  ActionItemDel.Enabled := ne;
  ActionFormSelect.Enabled := ne;
  if ne and is_multiselect and QuSelectList.Active and not (QuSelectList.IsEmpty) then
  begin
    l_key_field_value := Query.FIeldByName(entity_param.Values['key_field']).AsInteger;
    QuSelectList.Locate('key_field', l_key_field_value, []);
  end;
end;

procedure TCFLMLKSelectDlg.DBGridDblClick(Sender: TObject);
begin
  if ActionFormSelect.Enabled then ActionFormSelectExecute(nil);
end;

procedure TCFLMLKSelectDlg.FormShow(Sender: TObject);
begin
  inherited;
  ComponentProps.DefaultUser := IntToStr(data.UserNo);
  ActionViewRefresh.Execute;
  DBGrid.RestoreFormatFromStorage;
  if is_hold_form then Query.Locate('is_select', 1, []);
end;

procedure TCFLMLKSelectDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ComponentProps.DefaultUser := IntToStr(data.UserNo);
  DBGrid.SaveFormatToStorage;
end;

procedure TCFLMLKSelectDlg.ActionMarkExecute(Sender: TObject);
begin
  dmDataModule.Add_session_params(owner_name, entity_name, Query.FieldByName(entity_param.Values['key_field']).AsString);
  ActionViewRefresh.Execute;
end;

procedure TCFLMLKSelectDlg.ActionUnMarkExecute(Sender: TObject);
begin
  dmDataModule.del_session_params(owner_name, entity_name, QuSelectList.FieldByName('key_field').AsString);
  ActionViewRefresh.Execute;
  DBGridSelection.SetFocus;
end;

function TCFLMLKSelectDlg.DBGridIsLighted(Sender: TObject;
  DataSet: TDataSet): Boolean;
begin
  if is_hold_form then
    result := (DataSet.FieldByName('is_select').AsInteger = 1)
  else
    result := false;
end;

procedure TCFLMLKSelectDlg.ActionCopyProfileExecute(Sender: TObject);
var
  ID: integer;
begin
  if TMlekoSelectUserDlg.OpenSelect(ID, false) then
  begin
    if Application.MessageBox('При следующем входе в этот экран будут загружены настройки другого пользователя, вы уверены?', 'Настройки', MB_YESNO)
      = IDYES then
    begin
      spCopyProfile.Close;
      spCopyProfile.Params.ParamByName('p_owner_from').Value := IntToStr(ID);
      spCopyProfile.Params.ParamByName('p_owner_to').Value := IntToStr(data.UserNo);
      spCopyProfile.Params.ParamByName('p_section').Value := Name;
      spCopyProfile.ExecProc;
      ComponentProps.Enabled := false;
    end;
  end;
end;

function TCFLMLKSelectDlg.SQLBuilderGetWhere(Sender: TObject): string;
var
  s: TStrings;
  cnt, i: integer;
begin
  result := SQLBuilder.Where.Text;
  if query_filter <> '' then
    AddFilter(Result, query_filter);
end;

procedure TCFLMLKSelectDlg.AddFilter(var Filters: AnsiString; NewFilter: AnsiString);
begin
  if Trim(NewFilter) <> '' then
  begin
    if Trim(Filters) <> '' then Filters := Filters + ' and ';
    Filters := Filters + NewFilter;
  end;
end;

procedure TCFLMLKSelectDlg.ActionUnMarkAllExecute(Sender: TObject);
begin
  if not QuSelectList.Active then QuSelectList.Open;
  QuSelectList.First;
  while not QuSelectList.Eof do
  begin
    dmDataModule.del_session_params(owner_name, entity_name, QuSelectList.FieldByName('key_field').AsString);
    QuSelectList.Next;
  end;
  ActionViewRefresh.Execute;
  DBGridSelection.SetFocus;
end;

procedure TCFLMLKSelectDlg.ActionMarkAllExecute(Sender: TObject);
begin
  inherited;
  Query.First;
  while not Query.Eof do
  begin
    dmDataModule.Add_session_params(owner_name, entity_name, Query.FieldByName(entity_param.Values['key_field']).AsString);
    Query.Next;
  end;
  ActionViewRefresh.Execute;
  DBGridSelection.SetFocus;
end;

procedure TCFLMLKSelectDlg.QuSelectListAfterOpen(DataSet: TDataSet);
begin
  inherited;
  QuSelectList.FieldByName('SPID').Visible := false;
  QuSelectList.FieldByName('key_field').Visible := false;
  QuSelectList.FieldByName('txt_field').DisplayLabel := 'Выбор';
end;

procedure TCFLMLKSelectDlg.ActionRefreshSelectedExecute(Sender: TObject);
begin
  inherited;
  DBGridSelection.Refresh;
end;

function TCFLMLKSelectDlg.DBGridSelectionGetKey(Sender: TObject;
  DataSet: TDataSet): string;
begin
  inherited;
  result := DataSet.FieldByName('key_field').AsString;
end;

procedure TCFLMLKSelectDlg.Setis_multiselect(const Value: boolean);
begin
  Fis_multiselect := Value;
  PanelSelect.Visible := Value;
  Splitter.Visible := Value;
  ActionMark.Enabled := Value;
  ActionUnMark.Enabled := Value;
  ActionMarkAll.Enabled := Value;
  ActionUnMarkAll.Enabled := Value;
end;

function TCFLMLKSelectDlg.OnAction(Sender: TObject;DataSet:TDataSet): boolean;
var
  i: integer;
  ls_entity_param: TStrings;
  l_entity_code, l_sql: string;
begin
  result := inherited OnAction(Sender,DataSet);
  if Action = acSELECT then
  begin

    l_entity_code := GetParamValue(Params, 'ENTITY_CODE', varString, '');
    entity_param := dmDataModule.get_entity_param(l_entity_code);
    owner_name := GetParamValue(Params, 'OWNER_NAME', varString, '');
    entity_name := GetParamValue(Params, 'ENTITY_NAME', varString, '');
    style := GetParamValue(Params, 'STYLE', varString, 'DEFAULT');
    is_multiselect := GetParamValue(Params, 'IS_MULTISELECT', varBoolean, False);
    query_filter := GetParamValue(Params, 'QUERY_FILTER', varString, '');
    ls_entity_param := dmDataModule.get_entity_param(l_entity_code);
    res_txt := '';
    is_hold_form := true;
    SQLBuilder.Select.Add(',(select 1 from e_session_params sp where sp.owner_name=''' + owner_name + ''' and sp.param_name=''' +
      entity_name + '''' + ' and SPID=' + IntTOStr(MainDm.SPID) + ' and sp.param_value=' + entity_param.Values['key_field'] +
      ') as is_select');
    l_sql := dmDataModule.Get_selected_sql(owner_name, entity_name, ls_entity_param.Values['code']);
    if is_multiselect then
    begin
      QuSelectList.SQL.Clear;
      QuSelectList.SQL.Add(l_sql);
      QuSelectList.Open;
    end;
    try
      Result := ShowModal = mrOk;
      if Result then
      begin
        if not is_multiselect then
        begin
          dmDataModule.Del_session_params(owner_name, entity_name, '#NULL#');
          dmDataModule.Add_session_params(owner_name, entity_name, Query.FieldByName(entity_param.Values['key_field']).AsString);
        end;
        UtilsDataConvert.DataSetToParams(Query, Params);
      end;
    finally
      ls_entity_param.Free;
    end;
  end;
end;

procedure TCFLMLKSelectDlg.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 case Key of
  VK_RETURN:begin
             SearchString:='';
             Key:=0;
            end;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TCFLMLKSelectDlg.DBGridKeyPress(Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
 if Key in data.SearchSet then
  begin
   Found:=False;
   SearchString:=SearchString+Key;
   try
   Found:=DBGrid.DataSource.DataSet.Locate(DBGrid.Columns[DBGrid.SelectedIndex].FieldName,AnsiUpperCase(SearchString),[loCaseInsensitive,loPartialKey]);
   except
   SearchString:='';
   end;
   if DBGrid.Columns[DBGrid.SelectedIndex].Field.DataType=ftString then
    if not Found then SearchString:=Copy(SearchString,1,Length(SearchString)-1);
   Key:=Chr(0);
  end;
end;

end.

