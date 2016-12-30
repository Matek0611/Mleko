unit MlekoClosePlatR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  MlekoForm, Dialogs, CFLMLKList, DBAccess, MsAccess, Menus, DB,
  citComponentProps, COMPSQLBuilder, ActnList, Grids, DBGrids,
  citDbGrid, ExtCtrls, comp_TargetFilter_Panel, ComCtrls, ToolWin,
  comp_TargetFilter_CustomFilter, comp_TargetFilter_DateFilter,
  StdCtrls, comp_Target_DBCtrls, VirtualTable,
  comp_TargetFilter_LookupFilter, comp_TargetFilter_NumberFilter,
  comp_TargetFilter_DictionaryFilter, DBCtrls, citCtrls, citmask,
  citDBComboEdit, DBGridEh, MemDS, GridsEh, UtilsCommon, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TMlekoClosePlatRForm = class(TCFLMLKListForm)
    ActionGoExcel: TAction;
    ToolButton6: TToolButton;
    ActionSpecPrint: TAction;
    quDepts: TMSQuery;
    PopupMenuLinkGrid: TPopupMenu;
    pmiLinkAdd: TMenuItem;
    pmiLinkProp: TMenuItem;
    pmiLinkDel: TMenuItem;
    N23: TMenuItem;
    pmiLinkRefresh: TMenuItem;
    pmiLinkLayout: TMenuItem;
    ActionListLink: TActionList;
    ActionLinkAdd: TAction;
    ActionLinkProp: TAction;
    ActionLinkDel: TAction;
    ActionLinkRefresh: TAction;
    ActionLinkLayout: TAction;
    ActionLinkMenuItemVisible: TAction;
    dsLink: TDataSource;
    ActionShowLink: TAction;
    ToolButton1: TToolButton;
    qryLink: TMSQuery;
    ActionRestoreLink: TAction;
    ActionUnlink: TAction;
    GoExelLink: TAction;
    Splitter1: TSplitter;
    ToolButton19: TToolButton;
    ActionShowFreeNakl: TAction;
    QuFreeNakl: TMSQuery;
    DsFreeNakl: TDataSource;
    ActionFreeNaklRefresh: TAction;
    ActionFreeNaklChLayot: TAction;
    spAddPlatToNakl: TMSStoredProc;
    quLinkSumma: TMSQuery;
    ActionLinkPlat: TAction;
    spDelEntity: TMSStoredProc;
    QuMrkNkl: TMSQuery;
    DSLinkSumma: TDataSource;
    ActionMarkLinkRefresh: TAction;
    SQLBuilderFreeNakl: TTargetSQLBuilder;
    SQLBuilderLink: TTargetSQLBuilder;
    ActionScroll: TAction;
    FilterSum: TTargetFilter_NumberFilter;
    flt_Buh: TcitDBComboEdit;
    flt_entity_type: TcitDBComboEdit;
    ActionRecalcSum: TAction;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    Sprecalc_entity_free_sum: TMSStoredProc;
    ActionRecalLinkSum: TAction;
    ToolButton12: TToolButton;
    ActionRecoverDolg: TAction;
    sprecover_dolg_naklR: TMSStoredProc;
    ActionCopyRow: TAction;
    ToolButton13: TToolButton;
    DsDepts: TDataSource;
    quVidRash: TMSQuery;
    dsVidRash: TDataSource;
    PanelPaymentLink: TPanel;
    ToolBarSerialNum: TToolBar;
    ToolBtnLinkAdd: TToolButton;
    ToolBtnLinkProp: TToolButton;
    ToolBtnLinkDel: TToolButton;
    ToolButton5: TToolButton;
    ToolBtnLinkRefresh: TToolButton;
    ToolBtnLinkLayout: TToolButton;
    ToolButton7: TToolButton;
    DBGridPaymentLink: TcitDBGrid;
    Splitter: TSplitter;
    PanelFreeNakl: TPanel;
    ToolBar1: TToolBar;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton3: TToolButton;
    ToolButton11: TToolButton;
    DBGridFreeNakl: TcitDBGrid;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    ActionAutoClose: TAction;
    ToolButton14: TToolButton;
    ToolButton2: TToolButton;
    ToolButton15: TToolButton;
    ToolButton20: TToolButton;
    CompPropsFreeNakl: TcitComponentProps;
    CompPropsLink: TcitComponentProps;
    Flt_Post: TcitDBComboEdit;
    Flt_Post_buh: TcitDBComboEdit;
    TabSheet2: TTabSheet;
    cbUncorect: TCheckBox;
    cb_is_econom: TCheckBox;
    flt_Tip: TcitDBComboEdit;
    flt_Otdel: TcitDBComboEdit;
    flt_OurFirm: TcitDBComboEdit;
    Flt_vidrash: TcitDBComboEdit;
    gBPeriod: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdDateBeg: TcxDateEdit;
    EdDateEnd: TcxDateEdit;
    ActionMarkMainGrid: TAction;
    ActionMarkMainGrid1: TMenuItem;
    PopupMenuFreeGrid: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    ActionLinkMark: TAction;
    ActionLinkMark1: TMenuItem;
    Panel1: TPanel;
    cbIsNaklR: TCheckBox;
    cbIsDolgNaklR: TCheckBox;
    Button1: TButton;
    cb_isNotTypePayment: TCheckBox;
    ToolButton8: TToolButton;
    ToolButton18: TToolButton;
    sd_SaveExelFile: TSaveDialog;
    od_InputOrderWithExcel: TOpenDialog;
    ToolButton21: TToolButton;
    sp_AddEntity: TMSStoredProc;
    procedure ActionGoExcelExecute(Sender: TObject);
    procedure ActionShowLinkExecute(Sender: TObject);
    procedure ActionLinkRefreshExecute(Sender: TObject);
    function DBGridGetKey(Sender: TObject; DataSet: TDataSet): string;
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure ActionLinkLayoutExecute(Sender: TObject);
    function FilterFirma_OnSelectValue(
      Sender: TTargetFilter_DictionaryFilter; BtnBoundsRect: TRect;
      ConditionType: TDictionaryConditionType;
      ConditionGroup: TDictionaryConditionGroup; var Rec_PK,
      Rec_Title: Variant): Boolean;
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure ActionLinkDelExecute(Sender: TObject);
    procedure GoExelLinkExecute(Sender: TObject);
    procedure ActionShowFreeNaklExecute(Sender: TObject);
    procedure ActionFreeNaklRefreshExecute(Sender: TObject);
    procedure ActionFreeNaklChLayotExecute(Sender: TObject);
    procedure ActionItemPropExecute(Sender: TObject);
    procedure ActionItemDelExecute(Sender: TObject);
    function DBGridFreeNaklGetKey(Sender: TObject;
      DataSet: TDataSet): string;
    procedure QueryAfterRefresh(DataSet: TDataSet);
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure ActionLinkPlatExecute(Sender: TObject);
    procedure ftOtdelSelectOk(Sender: TObject);
    procedure DBGridEh1DrawFooterCell(Sender: TObject; DataCol,
      Row: Integer; Column: TColumnEh; Rect: TRect; State: TGridDrawState);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ActionMarkLinkRefreshExecute(Sender: TObject);
    function SQLBuilderFreeNaklGetWhere(Sender: TObject): string;
    procedure SQLBuilderLinkGetParams(Sender: TObject;
      var Params: TParams);
    procedure ActionScrollExecute(Sender: TObject);
    procedure SQLBuilderGetParams(Sender: TObject; var Params: TParams);
    function DBGridPaymentLinkGetKey(Sender: TObject;
      DataSet: TDataSet): string;
    procedure ActionItemAddExecute(Sender: TObject);
    procedure ActionRecalcSumExecute(Sender: TObject);
    function DBGridIsLighted(Sender: TObject; DataSet: TDataSet): Boolean;
    function DBGridFreeNaklIsLighted(Sender: TObject;
      DataSet: TDataSet): Boolean;
    procedure ActionRecalLinkSumExecute(Sender: TObject);
    procedure ActionRecoverDolgExecute(Sender: TObject);
    procedure ActionCopyRowExecute(Sender: TObject);
    function DBGridFreeNaklTestBeforeMark(Sender: TObject;
      DataSet: TDataSet): Boolean;
    function DBGridTestBeforeMark(Sender: TObject;
      DataSet: TDataSet): Boolean;
    procedure ActionAutoCloseExecute(Sender: TObject);
    procedure QuFreeNaklAfterOpen(DataSet: TDataSet);
    procedure qryLinkAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ActionMarkMainGridExecute(Sender: TObject);
    procedure ActionLinkMarkExecute(Sender: TObject);
    procedure DBGridFreeNaklDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure cbIsNaklRClick(Sender: TObject);
    procedure cbIsDolgNaklRClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);

  private
    FMarkedSumma: Real;
    FMarkedFreeSumma: Real;
    FFreeMarkedFreeSumma: Real;
    procedure SetMarkedSumma(const Value: real);
    procedure SetMarkedFreeSumma(const Value: Real);
  protected
    procedure SetLinkPanelVisible(aIsVisible: boolean);
    procedure SetFreeNaklPanelVisible(aIsVisible: boolean);
    procedure SetActionsEnabled; override;
  private
    first_mark_entity_type: string;
    IsMark: boolean;
    property MarkedSumma: Real read FMarkedSumma write SetMarkedSumma;
    property MarkedFreeSumma: Real read FMarkedFreeSumma write SetMarkedFreeSumma;
    procedure AutoCloseEntity(p_KeyList: TStrings; p_KeyResult: Int64; p_Entity_Type1: string; p_Entity_Type2: string; p_link_summa: real);
  public
  end;

var
  //  is_ReadOnlySpec: boolean;
  k: integer;
  MlekoClosePlatRForm: TMlekoClosePlatRForm;
  StrOtdFlt: string;

implementation

uses data, UtilsDataConvert, main, MlekoSelectFIrm, MlekoPropPlatR,
     ListMinusPaymentForJournalOfExpenses, VidExportExelFileForJournalOfExpenses,
     Excel2000, Registry, ActiveX, ComObj, GetDate0;

{$R *.dfm}

function IsOLEObjectInstalled(Name:string):boolean;
var
  ClassID : TCLSID;
  Rez     : HRESULT;
begin
  // Ищем CLSID OLE-объекта
  Rez := CLSIDFromProgID(PWideChar(WideString(Name)),ClassID);
  if Rez=S_OK then
  // Объект найден
                Result := true
              else
                Result := false;
end;

procedure TMlekoClosePlatRForm.SetActionsEnabled;
var
  ne, c, aEditEnabled: boolean;
  status: Integer;
begin
  inherited;
  ne := not Query.IsEmpty;
  ActionLinkPlat.Enabled := ne and (abs(Query.FieldByName('Summa').AsFloat - Query.FieldByName('CloseSumma').AsFloat -
    Query.FieldByName('FreeSumma').AsFloat) <= 0.02);
  ActionRecalcSum.Enabled := (abs(Query.FieldByName('Summa').AsFloat - Query.FieldByName('CloseSumma').AsFloat -
    Query.FieldByName('FreeSumma').AsFloat) > 0.02);
  ActionRecoverDolg.Enabled := (abs(Query.FieldByName('Summa').AsFloat - Query.FieldByName('CloseSumma').AsFloat -
    Query.FieldByName('FreeSumma').AsFloat) > 0.02);
end;

procedure TMlekoClosePlatRForm.ActionGoExcelExecute(Sender: TObject);
begin
  inherited;
  DbGrid.CopyGridToExcel;
end;

procedure TMlekoClosePlatRForm.ActionShowLinkExecute(Sender: TObject);
begin
  inherited;
  ActionShowLink.Checked := not ActionShowLink.Checked;
  SetLinkPanelVisible(ActionShowLink.Checked);
end;

procedure TMlekoClosePlatRForm.SetLinkPanelVisible(aIsVisible: boolean);
var
  i: integer;
begin
  if aIsVisible then
  begin
    DBGridPaymentLink.Reopen;
  end;
  PanelPaymentLink.Visible := aIsVisible;
  Splitter.Visible := aIsVisible;
end;

procedure TMlekoClosePlatRForm.ActionLinkRefreshExecute(Sender: TObject);
begin
  inherited;
  DBGridPaymentLink.Refresh;
end;

function TMlekoClosePlatRForm.DBGridGetKey(Sender: TObject;
  DataSet: TDataSet): string;
begin
  inherited;
  Result := DataSet.FieldByName('table_key').AsString;
end;

procedure TMlekoClosePlatRForm.QueryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ActionScrollExecute(Self);
end;

procedure TMlekoClosePlatRForm.ActionLinkLayoutExecute(Sender: TObject);
begin
  inherited;
  DBGridPaymentLink.ChangeLayout;
  DBGridPaymentLink.PropStorage.DefaultUser := IntToStr(data.UserNo);
  DBGridPaymentLink.SaveFormatToStorage;
end;

function TMlekoClosePlatRForm.FilterFirma_OnSelectValue(
  Sender: TTargetFilter_DictionaryFilter; BtnBoundsRect: TRect;
  ConditionType: TDictionaryConditionType;
  ConditionGroup: TDictionaryConditionGroup; var Rec_PK,
  Rec_Title: Variant): Boolean;
var
  ID: integer;
begin
  inherited;
  if VarIsNull(Rec_PK) then
    ID := 0
  else
    ID := Rec_PK;
  Result := TMlekoSelectFirmDlg.SelectFirm(ID);
  if Result then
  begin
    Rec_PK := ID;
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select NameLong from Post where PostNo=' + IntToStr(ID));
    dmDataModule.quWork.Open;
    Rec_Title := dmDataModule.quWork.FieldByName('NameLong').AsString;
  end;
end;

procedure TMlekoClosePlatRForm.ActionViewRefreshExecute(Sender: TObject);
var
  l_old_checked, l_old_freeNakl_checked: boolean;
begin
  l_old_checked := ActionShowLink.Checked;
  l_old_freeNakl_checked := ActionShowFreeNakl.Checked;
  ActionShowLink.Checked := false;
  ActionShowFreeNakl.Checked := false;
  SetLinkPanelVisible(false);
  SetFreeNaklPanelVisible(false);
  MarkedSumma := 0;
  MarkedFreeSumma := 0;
  inherited;
  if l_old_checked then
  begin
    ActionShowLink.Checked := l_old_checked;
    SetLinkPanelVisible(l_old_checked);
  end;
  if l_old_freeNakl_checked then
  begin
    ActionShowFreeNakl.Checked := l_old_freeNakl_checked;
    SetFreeNaklPanelVisible(l_old_freeNakl_checked);
  end;
end;

procedure TMlekoClosePlatRForm.ActionLinkDelExecute(Sender: TObject);
var
  i: integer;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  if DBGridPaymentLink.MarkItems.Count > 0 then
  begin
    for i := 0 to DBGridPaymentLink.MarkItems.Count - 1 do
    begin
      spAddPlatToNakl.Close;
      spAddPlatToNakl.Params.ParamByName('p_ID').Value := StrToInt(DBGridPaymentLink.MarkItems[i]);
      spAddPlatToNakl.Params.ParamByName('p_entityNo_1').Value := qryLink.FIeldByname('EntityNo').AsInteger;
      spAddPlatToNakl.Params.ParamByName('p_entityNo_2').Value := qryLink.FIeldByname('EntityNo_Plat').AsInteger;
      spAddPlatToNakl.Params.ParamByName('p_Entity_Type_1').Value := qryLink.FIeldByname('Entity_type').AsString;
      spAddPlatToNakl.Params.ParamByName('p_Entity_Type_2').Value := qryLink.FIeldByname('Entity_type_Plat').AsString;
      spAddPlatToNakl.Params.ParamByName('p_Link_Summa').Value := 0;
      spAddPlatToNakl.Params.ParamByName('p_UserNo').Value := data.UserNo;
      spAddPlatToNakl.ExecProc;
    end;
  end
  else
  begin
    spAddPlatToNakl.Close;
    spAddPlatToNakl.Params.ParamByName('p_ID').Value := qryLink.FieldByName('id').AsInteger;
    spAddPlatToNakl.Params.ParamByName('p_entityNo_1').Value := qryLink.FIeldByname('EntityNo').AsInteger;
    spAddPlatToNakl.Params.ParamByName('p_entityNo_2').Value := qryLink.FIeldByname('EntityNo_Plat').AsInteger;
    spAddPlatToNakl.Params.ParamByName('p_Entity_Type_1').Value := qryLink.FIeldByname('Entity_type').AsString;
    spAddPlatToNakl.Params.ParamByName('p_Entity_Type_2').Value := qryLink.FIeldByname('Entity_type_Plat').AsString;
    spAddPlatToNakl.Params.ParamByName('p_Link_Summa').Value := 0;
    spAddPlatToNakl.Params.ParamByName('p_UserNo').Value := data.UserNo;
    spAddPlatToNakl.ExecProc;
  end;
  DBGridPaymentLink.Refresh;
  Screen.Cursor := crDefault;
end;

procedure TMlekoClosePlatRForm.GoExelLinkExecute(Sender: TObject);
begin
  inherited;
  DbGridPaymentLink.CopyGridToExcel;
end;

procedure TMlekoClosePlatRForm.ActionShowFreeNaklExecute(Sender: TObject);
begin
  inherited;
  ActionShowFreeNakl.Checked := not ActionShowFreeNakl.Checked;
  SetFreeNaklPanelVisible(ActionShowFreeNakl.Checked);
end;

procedure TMlekoClosePlatRForm.SetFreeNaklPanelVisible(aIsVisible: boolean);
var
  i: integer;
  str, p_factor_directon, p_sum_sign: string;
begin

  PanelFreeNakl.Visible := aIsVisible;
  Splitter1.Visible := aIsVisible;
  if Query.IsEmpty then exit;
  if aIsVisible then
  begin
    dmDataModule.SpGenTmpTable.Close;
    p_sum_sign := Query.FieldByName('sum_sign').AsString;
    p_factor_directon := Query.FieldByName('factor_direction').AsString;

    str := ' select sum(r.FreeSumma*r.factor_direction) as OtdelDolg';
    str := str + ' ,cast(0 as decimal(18,6)) as SummaLink';
    str := str + ' ,t.id as manager_team_id,t.Name as OtdelName';
    str := str + ' ,cast(0 as decimal(18,6)) as BeforeSumma';
    str := str + ' ,cast(1 as bit) as OtdFlt';
    str := str + ' ,cast(0 as decimal(18,6)) as SummaLinkAccauntCurrency';
    str := str + ' ,Rate';
    str := str + ' ,RateCurrencyAccounting';
    str := str + ' from v_list_entity r left outer join vidotdel o on r.OtdelNo=o.OtdelNo';
    str := str + ' inner join d_manager_team t on o.manager_team_id=t.id';
    str := str + ' and r.PostNo=' + Query.FieldByName('PostNo').AsString;
    str:=str+' and ((r.factor_direction<>'+p_factor_directon+' and sum_sign='+p_sum_sign+') or (r.factor_direction='+p_factor_directon+' and sum_sign<>'+p_sum_sign+'))'; // разкоменчено 30.06.2014
    str := str + ' group by t.id,t.Name, r.Rate, r.RateCurrencyAccounting';
    str := str + ' Having sum(r.FreeSumma)<>0 ';
//    dmDataModule.SpGenTmpTable.Params.
    dmDataModule.SpGenTmpTable.ParamByName('p_sql_string').Value := Str;
    dmDataModule.SpGenTmpTable.Open;
    DBGridFreeNakl.Reopen;
  end;
end;

procedure TMlekoClosePlatRForm.ActionFreeNaklRefreshExecute(
  Sender: TObject);
var
  str: string;
begin
  inherited;
  DBGridFreeNakl.Refresh;
  DsFreeNakl.DataSet.First;
end;

procedure TMlekoClosePlatRForm.ActionFreeNaklChLayotExecute(
  Sender: TObject);
begin
  inherited;
  DBGridFreeNakl.ChangeLayout;
  DBGridFreeNakl.PropStorage.DefaultUser := IntToStr(data.UserNo);
  DBGridFreeNakl.SaveFormatToStorage;
end;

procedure TMlekoClosePlatRForm.ActionItemPropExecute(Sender: TObject);
var
  ln_id: Int64;
  Params: TParams;
begin
  inherited;
  ln_id := ds.DataSet.FieldByName('table_key').Value;
  if (Query.fieldByName('Entity_type').AsString = 'PLATP') or (Query.fieldByName('Entity_type').AsString = 'PLATR') then
  begin
    Params := TParams.Create;
    try
      UtilsDataConvert.DataSetToParams(Query, Params);
      UtilsCommon.SetParamValue(Params, 'MARKEDSUMMA', MarkedSumma);
      UtilsCommon.SetParamValue(Params, 'MARKEDFREESUMMA', MarkedFreeSumma);
      if TMlekoPropPlatRDlg.Upd_Dlg(Params) then ActionViewRefreshExecute(Self);
    finally
      Params.Free;
    end;
  end;
end;

procedure TMlekoClosePlatRForm.ActionItemDelExecute(Sender: TObject);
begin
  inherited;
  if (Query.fieldByName('Entity_type').AsString = 'PLATP') or (Query.fieldByName('Entity_type').AsString = 'PLATR') then
  begin
    if Application.MessageBox('Удалить оплату?', 'Оплата', MB_YESNO) = IDYES then
    begin
      spDelEntity.Close;
      spDelEntity.Params.ParamByName('Pkey').Value := DS.DataSet.FieldByName('table_key').Value;
      spDelEntity.ExecProc;
      ActionViewRefreshExecute(Self);
    end;
  end;
end;

function TMlekoClosePlatRForm.DBGridFreeNaklGetKey(Sender: TObject;
  DataSet: TDataSet): string;
begin
  inherited;
//  showmessage(DataSet.FieldByName('table_key').AsString);
  Result := DataSet.FieldByName('table_key').AsString;
end;

procedure TMlekoClosePlatRForm.QueryAfterRefresh(DataSet: TDataSet);
begin
  inherited;
  ActionScrollExecute(Self);
end;

procedure TMlekoClosePlatRForm.QueryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ActionScrollExecute(Self);
end;

procedure TMlekoClosePlatRForm.ActionLinkPlatExecute(Sender: TObject);
var
  i: integer;
  l_rest_summa: real;
  l_close_summa: real;
  l_close_summa_CurrencyAccounting: real;
  l_rest_summaCurrencyAccounting: real;
  Rate, RateCurrencyAccounting: real;
begin
  inherited;

//  showmessage (Query.FieldByName('FreeSumma').AsString);

  if DBGridEh1.FieldColumns['BeforeSumma'].Footer.SumValue > Query.FieldByName('FreeSumma').AsFloat then
  begin
    Application.MessageBox('Общая сумма закрытия больше свободной', 'Оплата', MB_OK);
    Exit;
  end;
  if (DBGridFreeNakl.MarkItems.Count > 0) then
  begin
    DSLinkSumma.DataSet.First;
    while not DSLinkSumma.DataSet.EOF do
    begin
      l_rest_summa := abs(DSLinkSumma.DataSet.FieldByName('BeforeSumma').AsFloat);

      if DSLinkSumma.DataSet.FieldByName('Rate').IsNull then begin
                                                               dmDataModule.OpenSQL('select ce.Rate from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0');
                                                               Rate := dmDataModule.qfo.FieldByName('Rate').Value;
                                                             end
                                                        else Rate := DSLinkSumma.DataSet.FieldByName('Rate').AsFloat;

      if DSLinkSumma.DataSet.FieldByName('RateCurrencyAccounting').IsNull then begin
                                                                                 dmDataModule.OpenSQL('select ce.Rate from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0');
                                                                                 RateCurrencyAccounting := dmDataModule.qfo.FieldByName('Rate').Value;
                                                                               end
                                                        else RateCurrencyAccounting := DSLinkSumma.DataSet.FieldByName('RateCurrencyAccounting').AsFloat;

      l_rest_summaCurrencyAccounting := l_rest_summa * Rate / RateCurrencyAccounting;
      QuMrkNkl.Close;
      QuMrkNkl.SQL.Clear;
      QuMrkNkl.SQL.Add('select r.*  from v_list_entity r,vidotdel o where r.otdelNo=o.OtdelNo');
      QuMrkNkl.SQL.Add(' and table_key in (' + DBGridFreeNakl.MarkItems.CommaText + ')');
      QuMrkNkl.SQL.Add(' and o.manager_team_id=' + IntToStr(DSLinkSumma.DataSet.FieldByName('manager_team_id').AsInteger));
      QuMrkNkl.Open;
      QuMrkNkl.First;
      while (not QuMrkNkl.Eof) and (l_rest_summa > 0) do
      begin
        if l_rest_summa < abs(QuMrkNkl.FieldByName('FreeSumma').AsFloat) then
         begin
          l_close_summa := l_rest_summa;
          l_close_summa_CurrencyAccounting := l_rest_summaCurrencyAccounting;
         end
        else begin
               l_close_summa := abs(QuMrkNkl.FieldByName('FreeSumma').AsFloat);
               l_close_summa_CurrencyAccounting := abs(QuMrkNkl.FieldByName('FreeSumma').AsFloat) * Rate / RateCurrencyAccounting;
             end;
{
        if l_rest_summaCurrencyAccounting < abs(QuMrkNkl.FieldByName('SummaDolgCurrencyAccounting').AsFloat) then
         begin
          l_close_summa_CurrencyAccounting := l_rest_summaCurrencyAccounting;
         end
        else
          l_close_summa_CurrencyAccounting := abs(QuMrkNkl.FieldByName('SummaDolgCurrencyAccounting').AsFloat);
}


        spAddPlatToNakl.Close;
        spAddPlatToNakl.Params.ParamByName('p_ID').Value := -1;
        spAddPlatToNakl.Params.ParamByName('p_entityNo_1').Value := Query.FieldByName('ID').AsInteger;
        spAddPlatToNakl.Params.ParamByName('p_entityNo_2').Value := QuMrkNkl.FieldByName('ID').AsInteger;

        spAddPlatToNakl.Params.ParamByName('p_Entity_Type_1').Value := Query.FieldByName('ENtity_type').AsString;
        spAddPlatToNakl.Params.ParamByName('p_Entity_Type_2').Value := QuMrkNkl.FieldByName('ENtity_type').AsString;

        spAddPlatToNakl.Params.ParamByName('p_Link_Summa').Value := abs(l_close_summa);
        spAddPlatToNakl.Params.ParamByName('p_Link_SummaCurrencyAccounting').Value := abs(l_close_summa_CurrencyAccounting);
        spAddPlatToNakl.Params.ParamByName('p_UserNo').Value := data.UserNo;
        spAddPlatToNakl.ExecProc;
        QuMrkNkl.Next;
        l_rest_summa := l_rest_summa - l_close_summa;
        l_rest_summaCurrencyAccounting := l_rest_summaCurrencyAccounting - l_close_summa_CurrencyAccounting
      end;
      DSLinkSumma.DataSet.Next;
    end;
  end
  else
    Application.MessageBox('Не выделено ни одной позиции', 'Не выделено ни одной позиции');
  ActionViewRefresh.Execute;
end;

procedure TMlekoClosePlatRForm.ftOtdelSelectOk(Sender: TObject);
begin
  inherited;
  //  QuFreeNakl.Params.ParamByName('OtdelNo').Value:=StrToInt(ftOtdel.KeyFieldValue);
end;

procedure TMlekoClosePlatRForm.DBGridEh1DrawFooterCell(Sender: TObject;
  DataCol, Row: Integer; Column: TColumnEh; Rect: TRect;
  State: TGridDrawState);
begin
  inherited;
  if DBGridEh1.Columns[1].Footer.SumValue > Query.FieldByName('FreeSumma').AsFloat then
    DBGridEh1.Columns[1].Footer.Font.Color := ClRed
  else
    DBGridEh1.Columns[1].Footer.Font.Color := clBlue;

  if DBGridEh1.Columns[2].Footer.SumValue > Query.FieldByName('FreeSumma').AsFloat then
    DBGridEh1.Columns[2].Footer.Font.Color := clRed
  else
    DBGridEh1.Columns[2].Footer.Font.Color := clBlue;
end;

procedure TMlekoClosePlatRForm.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
    Rate, RateCurrencyAccounting: real;
begin
  inherited;
  if Column.FieldName = 'SummaLink' then
  begin
    if DSLinkSumma.DataSet.FieldByName('SummaLink').AsFloat > DSLinkSumma.DataSet.FieldByName('BeforeSumma').AsFloat then AFont.Color := ClRed;
{
    if DSLinkSumma.DataSet.FieldByName('Rate').IsNull then begin
                                                             dmDataModule.OpenSQL('select ce.Rate from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0');
                                                           end
                                                      else Rate := DSLinkSumma.DataSet.FieldByName('Rate').AsFloat;

    if DSLinkSumma.DataSet.FieldByName('RateCurrencyAccounting').IsNull then begin
                                                                               dmDataModule.OpenSQL('select ce.Rate from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0');
                                                                             end
                                                      else RateCurrencyAccounting := DSLinkSumma.DataSet.FieldByName('RateCurrencyAccounting').AsFloat;
    if not (DSLinkSumma.DataSet.State in [dsInsert,dsEdit]) then DSLinkSumma.DataSet.Edit;
    DSLinkSumma.DataSet.FieldByName('SummaLinkAccauntCurrency').AsFloat := DSLinkSumma.DataSet.FieldByName('SummaLinkAccauntCurrency').AsFloat * Rate / RateCurrencyAccounting;
    DSLinkSumma.DataSet.Post;
}
  end;
end;

procedure TMlekoClosePlatRForm.ActionMarkLinkRefreshExecute(
  Sender: TObject);
var
  str, str_id, str_type: string;
  i: Integer;
  LinkSumma, Value: Real;
begin
  inherited;
  DBGridFreeNakl.IsMarked := not DBGridFreeNakl.IsMarked;
  Value := QuFreeNakl.FieldByName('FreeSumma').AsFloat;
  if DSLinkSumma.DataSet.Locate('manager_team_id', QuFreeNakl.FieldByName('manager_team_id').AsInteger, []) then
  begin
    LinkSumma := DSLinkSumma.DataSet.FieldByName('SummaLink').AsFloat;
    if DSLinkSumma.DataSet.State <> dsEdit then DSLinkSumma.DataSet.Edit;
    if DBGridFreeNakl.IsMarked then
      LinkSumma := LinkSumma + Value
    else
      LinkSumma := LinkSumma - Value;
    DSLinkSumma.DataSet.FieldByName('SummaLink').AsFloat := LinkSumma;
  end
  else
  begin
    DSLinkSumma.DataSet.Edit;
    DSLinkSumma.DataSet.FieldByName('SummaLink').AsFloat := 0;
  end;
  if DSLinkSumma.DataSet.State = dsEdit then DSLinkSumma.DataSet.Post;
  if not QuFreeNakl.EOF then
    QuFreeNakl.Next;

end;

function TMlekoClosePlatRForm.SQLBuilderFreeNaklGetWhere(
  Sender: TObject): string;
var
  OtdList: TStrings;
  flt: string;
  p_factor_directon, p_sum_sign, IsNaklR, IsDolgNaklR : string;
  addWhereIsNaklR, addWhereIsDolgNaklR : string;
begin
  inherited;
  p_sum_sign := Query.FieldByName('sum_sign').AsString;
  p_factor_directon := Query.FieldByName('factor_direction').AsString;

  if cbIsNaklR.Checked then IsNaklR := ' 1 ' else IsNaklR := ' 0 ';
  if cbIsDolgNaklR.Checked then IsDolgNaklR := ' 1 ' else IsDolgNaklR := ' 0 ';

  addWhereIsNaklR := ' and Entity_Type = ''NaklR'' ';
  addWhereIsDolgNaklR := ' and (DateEntity < (dateadd (day,-(DAY_DELAY + DAY_DELAY_EXT),getdate())) and Entity_Type = ''NaklR'') ';

  result := 'FreeSumma<>0 and OurFIrmNo=' + Query.FieldByName('OurFIrmNo').AsString + ' and PostNo=' + Query.FieldByName('PostNo').AsString +
    ' and Buh = ' + Query.FieldByName('buh').AsString + ' and ((a.factor_direction<>' + p_factor_directon + ' and sum_sign=' + p_sum_sign +
    ') or (a.factor_direction=' + p_factor_directon + ' and sum_sign<>' + p_sum_sign + ')) '; //+addWhere;

  if cbIsNaklR.Checked then result := result + addWhereIsNaklR else result := result;
  if cbIsDolgNaklR.Checked then result := result + addWhereIsDolgNaklR else result := result;

  OtdList := TStringList.Create;
  DSLinkSumma.DataSet.First;

  while not DSLinkSumma.DataSet.Eof do
  begin
    if DSLinkSumma.DataSet.FieldByName('OtdFlt').AsBoolean then OtdList.Add(DSLinkSumma.DataSet.FieldByName('manager_team_id').AsString);
    DSLinkSumma.DataSet.Next;
  end;
  if OtdList.Count > 0 then
  begin
    flt := ' manager_team_id in (' + OtdList.CommaText + ')';
    AddFilter(Result, flt);
  end;
  OtdList.Free;
end;

procedure TMlekoClosePlatRForm.SQLBuilderLinkGetParams(Sender: TObject;
  var Params: TParams);
begin
  inherited;
  with Params.CreateParam(ftInteger, 'p_PlatNo1', ptInput) do
    AsInteger := Query.FieldByName('ID').AsInteger;
  with Params.CreateParam(ftInteger, 'p_LinkNaklType1', ptInput) do
    AsString := Query.FieldByName('Entity_Type').AsString;

  with Params.CreateParam(ftInteger, 'p_PlatNo2', ptInput) do
    AsInteger := Query.FieldByName('ID').AsInteger;
  with Params.CreateParam(ftInteger, 'p_LinkNaklType2', ptInput) do
    AsString := Query.FieldByName('Entity_Type').AsString;

end;

procedure TMlekoClosePlatRForm.ActionScrollExecute(Sender: TObject);
var
  Str: string;
  ln_key: Integer;
begin
  inherited;
  if Query.IsEmpty then
  begin
    dmDataModule.SpGenTmpTable.Close;
    QuFreeNakl.Close;
    qryLink.Close;
    exit;
  end;
  if ActionShowLink.Checked then
  begin
    ActionLinkRefreshExecute(Self);
  end;
  if ActionShowFreeNakl.Checked then
  begin
    dmDataModule.SpGenTmpTable.Close;
    dmDataModule.SpGenTmpTable.Prepare;

    str := ' select sum(r.FreeSumma*r.factor_direction) as OtdelDolg';
    str := str + ' ,cast(0 as decimal(18,6)) as SummaLink';
    str := str + ' ,t.id as manager_team_id,t.Name as OtdelName';
    str := str + ' ,cast(0 as decimal(18,6)) as BeforeSumma';
    str := str + ' ,cast(1 as bit) as OtdFlt';
    str := str + ' ,cast(0 as decimal(18,6)) as SummaLinkAccauntCurrency';
    str := str + ' ,Rate';
    str := str + ' ,RateCurrencyAccounting';
    str := str + ' from v_list_entity r left outer join vidotdel o on r.OtdelNo=o.OtdelNo';
    str := str + ' inner join d_manager_team t on o.manager_team_id=t.id';
    str := str + ' and r.PostNo= ' + Query.FieldByName('PostNo').AsString;
//    str:=str+' and ((r.factor_direction<>'+ p_factor_directon +' and sum_sign='+p_sum_sign+') or (r.factor_direction='+p_factor_directon+' and sum_sign<>'+p_sum_sign+'))';
    str := str + ' group by t.id,t.Name, r.Rate, r.RateCurrencyAccounting';
    str := str + ' Having sum(r.FreeSumma)<>0 ';

    dmDataModule.SpGenTmpTable.Params.ParamByName('p_sql_string').Value := Str;
    dmDataModule.SpGenTmpTable.Open;
    ActionFreeNaklRefreshExecute(Self);
  end;
end;

procedure TMlekoClosePlatRForm.SQLBuilderGetParams(Sender: TObject;
  var Params: TParams);
var
  is_all_OurFirm, is_all_vidrash, is_all_Tip, is_all_Otdel, is_all_Post_buh: Integer;
  is_all_Post, is_all_entity_type, is_uncorect, is_all_econom, is_all_Buh: Integer;
  is_econom, isNotTypePayment: Integer;
begin
  inherited;

  if flt_entity_type.Text = '' then
    is_all_entity_type := 1
  else
    is_all_entity_type := 0;

  if flt_Otdel.Text = '' then
    is_all_Otdel := 1
  else
    is_all_Otdel := 0;

  if flt_Buh.Text = '' then
    is_all_buh := 1
  else
    is_all_buh := 0;

  if Flt_vidrash.Text = '' then
    is_all_vidrash := 1
  else
    is_all_vidrash := 0;

  if flt_Tip.Text = '' then
    is_all_Tip := 1
  else
    is_all_Tip := 0;

  if cbUncorect.Checked then
    is_uncorect := 1
  else
    is_uncorect := 0;

  if cb_is_econom.Checked then
    is_econom := 1
  else
    is_econom := 0;

  if cb_is_econom.State = StdCtrls.cbGrayed then
    is_all_econom := 1
  else
    is_all_econom := 0;

  if flt_OurFirm.Text = '' then
    is_all_ourfirm := 1
  else
    is_all_ourfirm := 0;

  if flt_Post.Text = '' then
    is_all_post := 1
  else
    is_all_post := 0;

  if flt_Post_buh.Text = '' then
    is_all_Post_buh := 1
  else
    is_all_Post_buh := 0;


  if cb_isNotTypePayment.Checked then
    isNotTypePayment := 1
  else
    isNotTypePayment := 0;

  UtilsCommon.SetParamValue(Params, 'p_date_beg', EdDateBeg.Date);
  UtilsCommon.SetParamValue(Params, 'p_date_end', EdDateEnd.Date);
  UtilsCommon.SetParamValue(Params, 'is_uncorect', is_uncorect);
  UtilsCommon.SetParamValue(Params, 'is_econom', is_econom);
  UtilsCommon.SetParamValue(Params, 'is_all_econom', is_all_econom);
  UtilsCommon.SetParamValue(Params, 'is_all_post', is_all_post);
  UtilsCommon.SetParamValue(Params, 'is_all_post_buh', is_all_post_buh);
  UtilsCommon.SetParamValue(Params, 'is_all_entity_type', is_all_entity_type);
  UtilsCommon.SetParamValue(Params, 'is_all_buh', is_all_buh);
  UtilsCommon.SetParamValue(Params, 'is_all_ourfirm', is_all_ourfirm);
  UtilsCommon.SetParamValue(Params, 'is_all_Otdel', is_all_Otdel);
  UtilsCommon.SetParamValue(Params, 'is_all_Tip', is_all_Tip);
  UtilsCommon.SetParamValue(Params, 'is_all_vidrash', is_all_vidrash);
  UtilsCommon.SetParamValue(Params, 'isNotTypePayment', isNotTypePayment);

end;

function TMlekoClosePlatRForm.DBGridPaymentLinkGetKey(Sender: TObject;
  DataSet: TDataSet): string;
begin
  inherited;
  Result := DataSet.FieldByName('ID').AsString;
end;

procedure TMlekoClosePlatRForm.ActionItemAddExecute(Sender: TObject);
var
  ln_id: Int64;
  Params: TParams;
begin
  inherited;
  ln_id := -1;
  Params := TParams.Create;
  try
    UtilsCommon.SetParamValue(Params, 'table_key', -1);
    UtilsCommon.SetParamValue(Params, 'MARKEDSUMMA', MarkedSumma);
    UtilsCommon.SetParamValue(Params, 'MARKEDFREESUMMA', MarkedFreeSumma);
    if TMlekoPropPlatRDlg.Add_Dlg(Params) then
    begin
      ActionViewRefresh.Execute;
      Query.Locate('table_key', UtilsCommon.GetParamValue(Params, 'table_key', varInt64, -1), [])
    end;
  finally
    Params.Free;
  end;
end;

procedure TMlekoClosePlatRForm.ActionRecalcSumExecute(Sender: TObject);
var
  i: integer;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  if DBGrid.MarkItems.Count > 0 then
  begin
    for i := 0 to DBGrid.MarkItems.Count - 1 do
    begin
      Sprecalc_entity_free_sum.Close;
      Sprecalc_entity_free_sum.Params.ParamByName('PKey').Value := StrToInt64(DBGrid.MarkItems[i]);
      Sprecalc_entity_free_sum.ExecProc;
    end;
  end
  else
  begin
    Sprecalc_entity_free_sum.Close;
    Sprecalc_entity_free_sum.Params.ParamByName('Pkey').Value := Query.FieldByName('table_key').Value;
    Sprecalc_entity_free_sum.ExecProc;
  end;
  Screen.Cursor := crDefault;
  ActionViewRefresh.Execute;
end;

function TMlekoClosePlatRForm.DBGridIsLighted(Sender: TObject;
  DataSet: TDataSet): Boolean;
begin
  inherited;
  result := False;
  if (DataSet.FindField('Summa') <> nil) and (DataSet.FindField('CloseSumma') <> nil) and (DataSet.FindField('FreeSumma') <> nil) then
    result := (abs(DataSet.FieldByName('Summa').AsFloat - DataSet.FieldByName('CloseSumma').AsFloat - DataSet.FieldByName('FreeSumma').AsFloat) >
      0.02);
end;

function TMlekoClosePlatRForm.DBGridFreeNaklIsLighted(Sender: TObject;
  DataSet: TDataSet): Boolean;
begin
  inherited;
  result := (abs(DataSet.FieldByName('Summa').AsFloat - DataSet.FieldByName('CloseSumma').AsFloat - DataSet.FieldByName('FreeSumma').AsFloat) >
    0.02);
end;

procedure TMlekoClosePlatRForm.ActionRecalLinkSumExecute(Sender: TObject);
begin
  inherited;
  Sprecalc_entity_free_sum.Close;
  Sprecalc_entity_free_sum.Params.ParamByName('p_entityNo').Value := QuFreeNakl.FieldByName('ID').AsInteger;
  Sprecalc_entity_free_sum.Params.ParamByName('p_Entity_Type').Value := QuFreeNakl.FieldByName('ENtity_type').AsString;
  Sprecalc_entity_free_sum.ExecProc;
end;

procedure TMlekoClosePlatRForm.ActionRecoverDolgExecute(Sender: TObject);
begin
  inherited;
  if query.FieldByName('ENtity_type').AsString = 'NAKLR' then
  begin
    sprecover_dolg_naklR.Close;
    sprecover_dolg_naklR.Params.ParamByName('PKey').Value := query.FieldByName('table_key').Value;
    sprecover_dolg_naklR.Params.ParamByName('p_UserNo').Value := data.UserNo;
    sprecover_dolg_naklR.ExecProc;
  end;
  DBGridPaymentLink.Refresh;
end;

procedure TMlekoClosePlatRForm.ActionCopyRowExecute(Sender: TObject);
begin
  inherited;
  ln_id := ds.DataSet.FieldByName('table_key').AsInteger;
  Params := TParams.Create;
  try
    UtilsDataConvert.DataSetToParams(Query, Params);
    UtilsCommon.SetParamValue(Params, 'MARKEDSUMMA', MarkedSumma);
    UtilsCommon.SetParamValue(Params, 'MARKEDFREESUMMA', MarkedFreeSumma);

    if TMlekoPropPlatRDlg.Add_Dlg(Params) then
      ActionViewRefreshExecute(Self);
  finally
    Params.Free;
  end;
end;

function TMlekoClosePlatRForm.DBGridFreeNaklTestBeforeMark(Sender: TObject;
  DataSet: TDataSet): Boolean;
begin
  inherited;
  result := (abs(QuFreeNakl.FieldByName('Summa').AsFloat - QuFreeNakl.FieldByName('CloseSumma').AsFloat - QuFreeNakl.FieldByName('FreeSumma').AsFloat)
    <= 0.02);
end;

function TMlekoClosePlatRForm.DBGridTestBeforeMark(Sender: TObject;
  DataSet: TDataSet): Boolean;
begin
  inherited;
  result := true;
  if (Sender as TcitDbGrid).MarkItems.Count = 0 then
  begin
    first_mark_entity_type := dataSet.FieldByName('Entity_type').AsString;
  end;
  if dataSet.FieldByName('Entity_type').AsString <> first_mark_entity_type then
  begin
    Application.MessageBox('Невозможно пометить сущности разных типов', 'Ошибка меток', MB_OK);
    result := false;
  end;

end;

procedure TMlekoClosePlatRForm.ActionAutoCloseExecute(Sender: TObject);
var
  ln_id_to: Int64;
  i: integer;
  lv_entity_type_from, lv_entity_type_to: string;
  lv_list_id_from: TStrings;
  summa: Real;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    lv_list_id_from := TStringList.Create;
    if DBGrid.MarkItems.Count > 0 then
    begin
      lv_list_id_from.AddStrings(DBGrid.MarkItems);
      summa := MarkedFreeSumma;
    end
    else
    begin
      lv_list_id_from.Add(Query.FieldByName('table_key').AsString);
      summa := Query.FieldByName('FreeSumma').AsFloat;
    end;

    Params := TParams.Create;
    try
      lv_entity_type_from := Query.FieldByName('Entity_type').AsString;
      if lv_entity_type_from = 'PLATP' then
        lv_entity_type_to := 'PLATR'
      else
        lv_entity_type_to := 'PLATP';
      UtilsDataConvert.DataSetToParams(Query, Params);
      UtilsCommon.SetParamValue(Params, 'MARKEDFREESUMMA', summa);
      UtilsCommon.SetParamValue(Params, 'Entity_type', lv_entity_type_to);
      if TMlekoPropPlatRDlg.Add_Dlg(Params) then
      begin
        ln_id_to := UtilsCommon.GetParamValue(Params, 'table_key', varInt64, -1);
        AutoCloseEntity(lv_list_id_from, ln_id_to, lv_entity_type_from, lv_entity_type_to, summa);
        ActionViewRefreshExecute(Self);
      end;
    finally
      Params.Free;
    end;
  finally
    lv_list_id_from.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TMlekoClosePlatRForm.AutoCloseEntity(p_KeyList: TStrings; p_KeyResult: Int64; p_Entity_Type1: string; p_Entity_Type2: string; p_link_summa:
  real);
var
  i: integer;
  p_EntityNo1, p_entityNo_2: Integer;
  Link_Summa: Real;
begin
  for i := 0 to p_KeyList.Count - 1 do
  begin
    MainDm.OpenSQL('select id,freesumma from v_list_entity where table_key= :p1_id', [StrToInt64(p_KeyList[i])]);
    p_EntityNo1 := TdmDataModule(MainDm).QFO.FieldByName('ID').AsInteger;
    Link_Summa := TdmDataModule(MainDm).QFO.FieldByName('freesumma').AsFloat;
    MainDm.OpenSQL('select id from v_list_entity where table_key= :p1_id', [p_KeyResult]);
    p_entityNo_2 := TdmDataModule(MainDm).QFO.FieldByName('ID').AsInteger;
    spAddPlatToNakl.Close;
    spAddPlatToNakl.Params.ParamByName('p_ID').Value := -1;
    spAddPlatToNakl.Params.ParamByName('p_entityNo_1').Value := p_EntityNo1;
    spAddPlatToNakl.Params.ParamByName('p_entityNo_2').Value := p_entityNo_2;
    spAddPlatToNakl.Params.ParamByName('p_Entity_Type_1').Value := p_Entity_Type1;
    spAddPlatToNakl.Params.ParamByName('p_Entity_Type_2').Value := p_Entity_Type2;
    spAddPlatToNakl.Params.ParamByName('p_Link_Summa').AsFloat := Link_Summa;
    spAddPlatToNakl.Params.ParamByName('p_UserNo').Value := data.UserNo;
    spAddPlatToNakl.ExecProc;
  end;
end;

procedure TMlekoClosePlatRForm.QuFreeNaklAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DBGridFreeNakl.PropStorage.User := IntToStr(data.UserNo);
  DBGridFreeNakl.RestoreFormatFromStorage;
end;

procedure TMlekoClosePlatRForm.qryLinkAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DBGridPaymentLink.PropStorage.User := IntToStr(data.UserNo);
  DBGridPaymentLink.RestoreFormatFromStorage;
end;

procedure TMlekoClosePlatRForm.FormCreate(Sender: TObject);
begin
  inherited;
  quDepts.Open;
  quVidRash.Open;
  EdDateBeg.Date := Main.GlobalDateNakl;
  EdDateEnd.Date := Main.GlobalDateNakl;
  MarkedSumma := 0;
  IsMark := false;
  ActionShowLink.Checked := False;
  SetLinkPanelVisible(False);
  ActionShowFreeNakl.Checked := False;
  SetFreeNaklPanelVisible(false);
  SQLBuilder.Where.Text := dmDataModule.parse_flt_sql(SQLBuilder.Where.Text, Name, '');
end;

procedure TMlekoClosePlatRForm.SetMarkedSumma(const Value: Real);
begin
  FMarkedSumma := Value;
  StatusBar.Panels[4].Text := FloatToStr(Value);
end;

procedure TMlekoClosePlatRForm.SetMarkedFreeSumma(const Value: Real);
begin
  FMarkedFreeSumma := Value;
  StatusBar.Panels[1].Text := FloatToStr(Value);
end;

procedure TMlekoClosePlatRForm.ActionMarkMainGridExecute(Sender: TObject);
begin
  inherited;
  DBGrid.IsMarked := not DBGrid.IsMarked;
  DBGrid.MarkItems.Delimiter := ',';
  if DBGrid.MarkItems.Count > 0 then
  begin
    if DbGrid.IsMarked then
      MarkedSumma := MarkedSumma + Query.FieldByName('summa').AsFloat
    else
      MarkedSumma := MarkedSumma - Query.FieldByName('summa').AsFloat;
    if DbGrid.IsMarked then
      MarkedFreeSumma := MarkedFreeSumma + Query.FieldByName('freesumma').AsFloat
    else
      MarkedFreeSumma := MarkedFreeSumma - Query.FieldByName('freesumma').AsFloat;
  end
  else
  begin
    MarkedSumma := 0;
    MarkedFreeSumma := 0;
  end;
  if not Query.EOF then
    Query.Next;
end;

procedure TMlekoClosePlatRForm.ActionLinkMarkExecute(Sender: TObject);
begin
  inherited;
  DBGridPaymentLink.IsMarked:= not DBGridPaymentLink.IsMarked;
  qryLink.Next;
end;



procedure TMlekoClosePlatRForm.DBGridFreeNaklDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  if ((not DBGridFreeNakl.DataSource.DataSet.FindField('DateEntity').IsNull) and (not DBGridFreeNakl.IsMarked)) then
   if ((DBGridFreeNakl.DataSource.DataSet.FindField('DateEntity').AsDateTime < Date -
        DBGridFreeNakl.DataSource.DataSet.FindField('DAY_DELAY').AsInteger -
        DBGridFreeNakl.DataSource.DataSet.FindField('DAY_DELAY_EXT').AsInteger + 1) and
       (DBGridFreeNakl.DataSource.DataSet.FindField('Entity_Type').AsString = 'NAKLR'))
    then begin with DbGridFreeNakl.Canvas do
           begin
		         Brush.Color:=$00FF9DFF;
             Font.Color:=clBlack;
		         FillRect(Rect);
    		     TextOut(Rect.Left+2,Rect.Top+2,Column.Field.Text);
      	   end;
         end;
end;

/////////////////////

procedure TMlekoClosePlatRForm.cbIsNaklRClick(Sender: TObject);
begin
  inherited;
  SQLBuilderFreeNaklGetWhere(Sender);
  SQLBuilderFreeNakl.Refresh;
  DBGridFreeNakl.Refresh;
end;

procedure TMlekoClosePlatRForm.cbIsDolgNaklRClick(Sender: TObject);
begin
  inherited;
  SQLBuilderFreeNaklGetWhere(Sender);
  SQLBuilderFreeNakl.Refresh;
  DBGridFreeNakl.Refresh;
end;

procedure TMlekoClosePlatRForm.Button1Click(Sender: TObject);
begin
  inherited;
  with TListMinusPaymentForJournalOfExpensesaForm.Create(Application) do
  try
   quListMinusPaymentForJournalOfExpensesa.Open;
   ShowModal;
  finally
   quListMinusPaymentForJournalOfExpensesa.Close;
   Free;
  end;
end;

procedure TMlekoClosePlatRForm.ToolButton8Click(Sender: TObject);
begin
  inherited;
  with TVidExportExelFileForJournalOfExpensesForm.Create(Application) do
  try
    quVidExportExelFile.ParamByName('UserNo').value := data.UserNo;
    quVidExportExelFile.Open;
    ShowModal;
  finally
    quVidExportExelFile.Close;
    Free;
  end;
end;

procedure TMlekoClosePlatRForm.ToolButton18Click(Sender: TObject);
var
  QuPreparationSQL                : TMSQuery;
  QuExportExcelFile               : TMSQuery;
  Select, Select1, s              : String;
  Owner_Name                      : String;
  PostNoFirstParam                : String;
  PostNoParam                     : String;
  Entity_type_id                  : String;
  buh                             : String;
  OurFirmNo                       : String;
  OtdelNo                         : String;
  tip                             : String;
  VidNo                           : String;
  is_all_OurFirm, is_all_vidrash, is_all_Tip, is_all_Otdel, is_all_Post_buh: Integer;
  is_all_Post, is_all_entity_type, is_uncorect, is_all_econom, is_all_Buh: Integer;
  is_econom, isNotTypePayment: Integer;


   cls_ExcelObject: string;
   RegData: TRegistry;
   Workbook, WorkSheet, ArrayData, Excel, Range, Cell1, Cell2 : Variant;
   fname, fname1, xls_name, dbf_name1 :String;
   ExecString, FilePath  : String;
   AddressNo : Integer;
   BeginCol, BeginRow, RowCount, ColCount, j: integer;
   ErrorCode : Integer;

 Vf1, Vf2: TextFile;
begin
  inherited;

  Owner_Name := QuotedStr('MlekoClosePlatRForm');
  PostNoFirstParam := QuotedStr('FLT_POST');
  PostNoParam := QuotedStr('FLT_POST_BUH');
  Entity_type_id := QuotedStr('FLT_ENTITY_TYPE');
  buh := QuotedStr('FLT_BUH');
  OurFirmNo := QuotedStr('FLT_OURFIRM');
  OtdelNo := QuotedStr('FLT_OTDEL');
  tip := QuotedStr('FLT_TIP');
  VidNo := QuotedStr('FLT_VIDRASH');


  QuPreparationSQL:=TMSQuery.Create(nil);
  QuPreparationSQL.Connection:=dmDataModule.DB;
  QuPreparationSQL.SQL.Clear;
  QuPreparationSQL.SQL.Text := 'select * '
                     +' from L_VidExportExelFileForJournalOfExpenses '
                     +'  where UserNo = :UserNo '
                     +'    and Is_Checked = 1 '
                     +'order by isnull(N_pp,100) ';
  QuPreparationSQL.Prepare;
  QuPreparationSQL.ParamByName('UserNo').Value := data.UserNo;
  QuPreparationSQL.Open;

  if QuPreparationSQL.RecordCount = 0 then raise Exception.Create(' Не настроена таблица специальной выгрузки в Ексель!'+ #10#13+
                                                                  'Настройте таблицу и повторите попытку. ');

  while not QuPreparationSQL.Eof do
   begin
     if ((QuPreparationSQL.FieldByName('Column_Name').Value = 'DateEntity') or (QuPreparationSQL.FieldByName('Column_Name').Value = 'DateNaklFirst'))
      then Select := Select + 'convert(varchar(256),'+ QuPreparationSQL.FieldByName('Column_Name').AsString+ ',4) ,'
      else Select := Select + 'cast(isnull('+QuPreparationSQL.FieldByName('Column_Name').AsString+',0) as varchar(256)), ';

     Select1 := Select1 + '''' + QuPreparationSQL.FieldByName('Column_Name').AsString +''''+ ', ';
     QuPreparationSQL.Next;
   end;
  delete (Select,Length(Select)-1,Length(Select));
  delete (Select1,Length(Select1)-1,Length(Select1));

  QuExportExcelFile := TMSQuery.Create(nil);
  QuExportExcelFile.Connection:=dmDataModule.DB;
  QuExportExcelFile.SQL.Text :=  'declare '
                                +'    @UserNo int '
                                +'	, @SPID int '
                                +'set @UserNo = convert(int,:UserNo) '
                                +'set @SPID = convert(int,:SPID) '
                                +' select ' + Select1
                                +' union all '
                                +' select ' + Select
                                +' from dbo.V_List_entity a '
                                +'  where DateEntity between :p_date_beg and :p_date_end '
                                +'    and ((abs(Summa-CloseSumma-FreeSumma)>0.02) or :is_uncorect =0) '

                                +'    and (is_econom= :is_econom or :is_all_econom = 1) '
                                +'    AND (a.PostNoFirst in (select cast(Param_Value as int) '
                                +'                            from e_Session_Params '
                                +'                             where Userno = @UserNo '
                                +'                               and Owner_Name = '+Owner_Name
                                +'                               and Param_Name = '+PostNoFirstParam
                                +'                               and Spid = @SPID) or :is_all_post = 1) '

 
                                +'    AND (a.PostNo in (select cast(Param_Value as int) '
                                +'                       from e_Session_Params '
                                +'                        where Userno = @UserNo '
                                +'                          and Owner_Name = '+Owner_Name
                                +'                          and Param_Name = '+PostNoParam
                                +'                          and Spid = @SPID) or :is_all_post_buh = 1) '
                                +'    AND (a.Entity_type_id in (select cast(Param_Value as int) '
                                +'                               from e_Session_Params '
                                +'                                where Userno = @UserNo '
                                +'                                  and Owner_Name = '+Owner_Name
                                +'                                  and Param_Name = '+Entity_type_id
                                +'                                  and Spid = @SPID) or :is_all_entity_type = 1) '
                                +'    AND (a.buh in (select cast(Param_Value as int) '
                                +'                    from e_Session_Params '
                                +'                     where Userno = @UserNo '
                                +'                       and Owner_Name = '+Owner_Name
                                +'                       and Param_Name = '+buh
                                +'                       and Spid = @SPID) or :is_all_buh = 1) '
                                +'    AND (a.OurFirmNo in (select cast(Param_Value as int) '
                                +'                          from e_Session_Params '
                                +'                           where Userno = @UserNo '
                                +'                             and Owner_Name = '+Owner_Name
                                +'                             and Param_Name = '+OurFirmNo
                                +'                             and Spid = @SPID) or :is_all_ourfirm = 1) '
                                +'    AND (a.OtdelNo in (select cast(Param_Value as int) '
                                +'                        from e_Session_Params '
                                +'                         where Userno = @UserNo '
                                +'                           and Owner_Name = '+Owner_Name
                                +'                           and Param_Name = '+OtdelNo
                                +'                           and Spid = @SPID) or :is_all_Otdel = 1) '
                                +'    AND (a.tip in (select cast(Param_Value as int) '
                                +'                    from e_Session_Params '
                                +'                     where Userno = @UserNo '
                                +'                       and Owner_Name = '+Owner_Name
                                +'                       and Param_Name = '+tip
                                +'                       and Spid = @SPID) or :is_all_Tip = 1) '
                                +'    AND (a.VidNo in (select cast(Param_Value as int) '
                                +'                      from e_Session_Params '
                                +'                       where Userno = @UserNo '
                                +'                         and Owner_Name = '+Owner_Name
                                +'                         and Param_Name = '+VidNo
                                +'                         and Spid = @SPID) or :is_all_vidrash = 1) '
                                +'    and ((a.tip not in (select TipNo from ListMinusPaymentForJournalOfExpenses where CheckMinus = 1) or a.tip is null) or :isNotTypePayment = 0) ';
{
  showmessage(QuExportExcelFile.SQL.Text);

AssignFile( Vf2, 'd:\1.txt');
Rewrite( Vf2);
Write( Vf2, QuExportExcelFile.SQL.Text );
}
//  writeln('',QuExportExcelFile.SQL.Text);

  QuExportExcelFile.Prepare;

  if flt_entity_type.Text = '' then
    is_all_entity_type := 1
  else
    is_all_entity_type := 0;

  if flt_Otdel.Text = '' then
    is_all_Otdel := 1
  else
    is_all_Otdel := 0;

  if flt_Buh.Text = '' then
    is_all_buh := 1
  else
    is_all_buh := 0;

  if Flt_vidrash.Text = '' then
    is_all_vidrash := 1
  else
    is_all_vidrash := 0;

  if flt_Tip.Text = '' then
    is_all_Tip := 1
  else
    is_all_Tip := 0;

  if cbUncorect.Checked then
    is_uncorect := 1
  else
    is_uncorect := 0;

  if cb_is_econom.Checked then
    is_econom := 1
  else
    is_econom := 0;

  if cb_is_econom.State = StdCtrls.cbGrayed then
    is_all_econom := 1
  else
    is_all_econom := 0;

  if flt_OurFirm.Text = '' then
    is_all_ourfirm := 1
  else
    is_all_ourfirm := 0;

  if flt_Post.Text = '' then
    is_all_post := 1
  else
    is_all_post := 0;

  if flt_Post_buh.Text = '' then
    is_all_Post_buh := 1
  else
    is_all_Post_buh := 0;


  if cb_isNotTypePayment.Checked then
    isNotTypePayment := 1
  else
    isNotTypePayment := 0;

  if Length(FilterSum.FilterStr)> 0 then
   QuExportExcelFile.SQL.Text := QuExportExcelFile.SQL.Text +' and ' +  FilterSum.FilterStr;
//  ShowMessage(FilterSum.FilterStr);


  QuExportExcelFile.ParamByName('UserNo').Value := data.UserNo;
  QuExportExcelFile.ParamByName('SPID').Value := MainDm.SPID;
  QuExportExcelFile.ParamByName('p_date_beg').Value := EdDateBeg.Date;
  QuExportExcelFile.ParamByName('p_date_end').Value := EdDateEnd.Date;
  QuExportExcelFile.ParamByName('is_all_econom').Value := is_all_econom;
  QuExportExcelFile.ParamByName('is_uncorect').Value := is_uncorect;
  QuExportExcelFile.ParamByName('is_econom').Value := is_econom;
  QuExportExcelFile.ParamByName('is_all_post').Value := is_all_post;
  QuExportExcelFile.ParamByName('is_all_Post_buh').Value := is_all_Post_buh;
  QuExportExcelFile.ParamByName('is_all_entity_type').Value := is_all_entity_type;
  QuExportExcelFile.ParamByName('is_all_buh').Value := is_all_buh;
  QuExportExcelFile.ParamByName('is_all_ourfirm').Value := is_all_ourfirm;
  QuExportExcelFile.ParamByName('is_all_Otdel').Value := is_all_Otdel;
  QuExportExcelFile.ParamByName('is_all_Tip').Value := is_all_Tip;
  QuExportExcelFile.ParamByName('is_all_vidrash').Value := is_all_vidrash;
  QuExportExcelFile.ParamByName('isNotTypePayment').Value := isNotTypePayment;

  QuExportExcelFile.Prepare;
  QuExportExcelFile.Open;

  if QuExportExcelFile.RecordCount = 1 then raise Exception.Create('Нет записи в запросе! Проверьте условия фильтров!!!'+ #10#13 +QuExportExcelFile.SQL.Text);




  RowCount := QuExportExcelFile.RecordCount;
  ColCount := QuPreparationSQL.RecordCount;

  cls_ExcelObject := 'Excel.Application';
  RegData := TRegistry.Create;
  RegData.RootKey := HKEY_CLASSES_ROOT;
         try
           if RegData.OpenKey('\Excel.Application\CurVer', False) then
           begin
             cls_ExcelObject := regData.ReadString('');
             RegData.CloseKey;
           end
         finally
           regData.Free;
         end;

         if not IsOLEObjectInstalled(cls_ExcelObject) then
          begin
            ShowMessage('Excel не установлен.');
            exit;
          end;

         // Вот теперь откроем Excel
         Excel := CreateOleObject(cls_ExcelObject);

         // Отключаем реакцию Excel на события,
         // чтобы ускорить обработку информации информации
         // и делаем процесс невидимым

         Excel.Application.ScreenUpdating := False;
         Excel.Application.EnableEvents := false;
         Excel.Application.Interactive := False;
         Excel.Application.DisplayAlerts := False;
         Excel.Application.DisplayStatusBar := False;
         Excel.Visible := false;

   BeginCol := 1;
   BeginRow := 1;

         // Создаем новую таблицу

         Workbook := Excel.Workbooks.Add; //(xls_name);

         WorkSheet := Excel.Workbooks[1].WorkSheets[1];
         ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);

         QuExportExcelFile.First;
         while not QuExportExcelFile.Eof do
          begin
            For J := 1 To QuPreparationSQL.RecordCount Do
              Begin
                  ArrayData[QuExportExcelFile.RecNo, J] :=
                   QuExportExcelFile.FieldbyName(QuExportExcelFile.FieldDefs.Items[j - 1].DisplayName).value;
              End;
            QuExportExcelFile.Next;
          end;

       // Левая верхняя ячейка области, в которую будем выводить данные
         Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];
       // Правая нижняя ячейка области, в которую будем выводить данные
         Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount - 1,
         BeginCol + ColCount - 1];

       // Область, в которую будем выводить данные
         Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];

       // А вот и сам вывод данных
       // Намного быстрее поячеечного присвоения
         Range.Value := ArrayData;

         QuExportExcelFile.Close;

         xls_name := 'Выгрузка_для_созданияприходов_расходов_денег';

         sd_SaveExelFile := TSaveDialog.Create(self);

                     sd_SaveExelFile.FileName := xls_name;
                     sd_SaveExelFile.DefaultExt := '.xls';
                     sd_SaveExelFile.Filter := 'Excel (*.xls)|*.xls';

                     if sd_SaveExelFile.Execute then Excel.ActiveWorkBook.SaveAs(sd_SaveExelFile.FileName);

                     ShowMessage('Создан файл '+sd_SaveExelFile.FileName);

                     sd_SaveExelFile.Free;

//         Excel.Application.EnableEvents := true;
//         Excel.Application.Interactive := true;
//         Excel.Application.DisplayAlerts := true;
         Excel.ActiveWorkBook.SaveAs(xls_name);
//         Excel.ActiveWorkBook.Close(0); // xlDontSaveChanges
         Excel.Quit;
         Excel := Unassigned;



        showmessage ('Выгрузка данных завершена');
//
end;

procedure TMlekoClosePlatRForm.ToolButton21Click(Sender: TObject);
var
  cls_ExcelObject: string;
  WorkSheet: Variant;
  Excel: Variant;
  RegData: TRegistry;
  index, i, cnt : integer;
  Summa,FreeSumma : Double;
  SummaS : string;
  Period : TPeriodDate;
  DatePlat : TDateTime;
  isSetDate: boolean;
  EntityType : string;
  D_RESPONSE_DEPT_ID, D_ACTIVITY_TYPE_ID : integer;
  D_BANK_INVOICE, VidZatrat : integer;
begin
  inherited;
  isSetDate := False;
  cnt := 0;
  if Application.MessageBox('Задать дату?', 'Дата', MB_YESNO) = IDYES then
   begin
     Period:=ZapDate(1);
     DatePlat := Period[1];
     isSetDate := True;
   end;


// Чтобы не применять локальные
// для каждой версии
// названия "Excel.Application.8", "Excel.Application.9".

  cls_ExcelObject := 'Excel.Application';
  RegData := TRegistry.Create;
  RegData.RootKey := HKEY_CLASSES_ROOT;
  try
    if RegData.OpenKey('\Excel.Application\CurVer', False) then
    begin
      cls_ExcelObject := regData.ReadString('');
      RegData.CloseKey;
    end
  finally
    regData.Free;
  end;

  if not IsOLEObjectInstalled(cls_ExcelObject) then
   begin
     ShowMessage('Excel не установлен.');
     exit;
   end;

  // Вот теперь откроем Excel
  Excel := CreateOleObject(cls_ExcelObject);

  // Отключаем реакцию Excel на события,
  // чтобы ускорить обработку информации информации
  // и делаем процесс невидимым

  Excel.Application.ScreenUpdating := False;
  Excel.Application.EnableEvents := false;
  Excel.Application.Interactive := False;
  Excel.Application.DisplayAlerts := False;
//  Excel.ActiveSheet.DisplayPageBreaks := False;
  Excel.Application.DisplayStatusBar := False;
  Excel.Visible := false;

  od_InputOrderWithExcel.DefaultExt := '.xls';   // Выбираем файл для импорта данных
  od_InputOrderWithExcel.Filter := 'Excel (*.xls)|*.xls'; // Устанавливаем фильтер

  if od_InputOrderWithExcel.Execute then
   begin
     Excel.Workbooks.Open(od_InputOrderWithExcel.FileName);
     WorkSheet := Excel.Workbooks[1].WorkSheets[1];
     WorkSheet.Columns['A:Z'].AutoFit;
     WorkSheet.Columns[20].NumberFormat := '###0'; 
//     WorkSheet.Columns.AutoFit;

     i := Excel.ActiveSheet.UsedRange.Rows.Count;

// Загружаем данные из выбранного файла в табличку OrdersFromExcel

     for index := 2 to i do
     begin
       if ((WorkSheet.Cells[index,1].Text = 'PLATP') or (WorkSheet.Cells[index,1].Text = 'PLATR')) then
        begin
          
          DecimalSeparator := '.';

          SummaS := StringReplace(WorkSheet.Cells[index,4].Text, '''', '',[rfReplaceAll, rfIgnoreCase]);
          SummaS := StringReplace(SummaS, ',', '.',[rfReplaceAll, rfIgnoreCase]);
          Summa := StrToFloat(SummaS);

          SummaS := StringReplace(WorkSheet.Cells[index,5].Text, '''', '',[rfReplaceAll, rfIgnoreCase]);
          SummaS := StringReplace(SummaS, ',', '.',[rfReplaceAll, rfIgnoreCase]);
          FreeSumma := StrToFloat(SummaS);

          if (FreeSumma <> 0) then
           begin
             cnt := cnt + 1;
             sp_AddEntity.Close;

             sp_AddEntity.ParamByName('p_Entity_type').Value := WorkSheet.Cells[index,1].Text;
             sp_AddEntity.ParamByName('p_PostNo').Value := StrToInt(WorkSheet.Cells[index,2].Text);
             sp_AddEntity.ParamByName('p_PostNoFirst').Value := StrToInt(WorkSheet.Cells[index,18].Text);

             if isSetDate then sp_AddEntity.ParamByName('p_DatePlat').Value := DatePlat
                          else sp_AddEntity.ParamByName('p_DatePlat').Value := StrToDate(WorkSheet.Cells[index,3].Text);
             sp_AddEntity.ParamByName('p_Summa').Value := FreeSumma;
             sp_AddEntity.ParamByName('p_FreeSumma').Value := FreeSumma;
             sp_AddEntity.ParamByName('p_Buh').Value := StrToInt(WorkSheet.Cells[index,6].Text);
             sp_AddEntity.ParamByName('p_Spravka').Value := WorkSheet.Cells[index,7].Text;
             sp_AddEntity.ParamByName('p_TipPlat').Value := StrToInt(WorkSheet.Cells[index,8].Text);
             sp_AddEntity.ParamByName('p_UserNo').Value := StrToInt(WorkSheet.Cells[index,9].Text);
             sp_AddEntity.ParamByName('p_SotrudNo').Value := StrToInt(WorkSheet.Cells[index,10].Text);
             sp_AddEntity.ParamByName('p_bank_invoice_id').Value := StrToInt(WorkSheet.Cells[index,11].Text);
             sp_AddEntity.ParamByName('p_activity_type_id').Value := StrToInt(WorkSheet.Cells[index,12].Text);
             sp_AddEntity.ParamByName('p_response_dept_id').Value := StrToInt(WorkSheet.Cells[index,13].Text);
             sp_AddEntity.ParamByName('p_VidRashodNo').Value := StrToInt(WorkSheet.Cells[index,14].Text);
             sp_AddEntity.ParamByName('p_OtdelNo').Value := StrToInt(WorkSheet.Cells[index,15].Text);
             sp_AddEntity.ParamByName('p_our_firmNo').Value := main.GlobalOurFirmNo;
             sp_AddEntity.ParamByName('p_is_econom').Value := StrToInt(WorkSheet.Cells[index,17].Text);
             sp_AddEntity.ParamByName('p_DataLoad').Value := StrToDate(WorkSheet.Cells[index,3].Text);
             sp_AddEntity.ParamByName('p_SummaLoad').Value := Summa;
             sp_AddEntity.ParamByName('p_FreeSummaLoad').Value := FreeSumma;
             sp_AddEntity.ParamByName('p_EntityTypeLoad').Value := WorkSheet.Cells[index,1].Text;
             sp_AddEntity.ParamByName('p_AddressLoad').Value := WorkSheet.Cells[index,19].Text;

             sp_AddEntity.ParamByName('p_SetArticleGroupName').Value := WorkSheet.Cells[index,20].Text;
             sp_AddEntity.ParamByName('p_DayDeley').Value := StrToInt(WorkSheet.Cells[index,21].Text);

             sp_AddEntity.Execute;
           end;
        end;
       if ((WorkSheet.Cells[index,1].Text = 'NAKLP') or (WorkSheet.Cells[index,1].Text = 'NAKLR')) then
        begin


          if (WorkSheet.Cells[index,1].Text = 'NAKLP') then EntityType := 'PLATP';
          if (WorkSheet.Cells[index,1].Text = 'NAKLR') then EntityType := 'PLATR';

          DecimalSeparator := '.';

          SummaS := StringReplace(WorkSheet.Cells[index,4].Text, '''', '',[rfReplaceAll, rfIgnoreCase]);
          SummaS := StringReplace(SummaS, ',', '.',[rfReplaceAll, rfIgnoreCase]);
          Summa := StrToFloat(SummaS);

          SummaS := StringReplace(WorkSheet.Cells[index,5].Text, '''', '',[rfReplaceAll, rfIgnoreCase]);
          SummaS := StringReplace(SummaS, ',', '.',[rfReplaceAll, rfIgnoreCase]);
          FreeSumma := StrToFloat(SummaS);



          if (FreeSumma <> 0) then
           begin
             dmDataModule.OpenSQL('select D_RESPONSE_DEPT_ID, D_ACTIVITY_TYPE_ID from l_VidOtdelProp s where s.OtdelNo= :p1_OtdelNo', [StrToInt(WorkSheet.Cells[index,15].Text)]);
             D_RESPONSE_DEPT_ID := dmDataModule.qfo.FieldByName('D_RESPONSE_DEPT_ID').AsInteger;
             D_ACTIVITY_TYPE_ID := dmDataModule.qfo.FieldByName('D_ACTIVITY_TYPE_ID').AsInteger;

             dmDataModule.OpenSQL('select id from D_BANK_INVOICE where IsMain = 1');
             D_BANK_INVOICE := dmDataModule.qfo.FieldByName('id').AsInteger;

             dmDataModule.OpenSQL('select VidZatrat from VidNakl where VidNaklNo = :p1_VidNaklNo',[StrToInt(WorkSheet.Cells[index,14].Text)]);
             VidZatrat := dmDataModule.qfo.FieldByName('VidZatrat').AsInteger;

             cnt := cnt + 1;

             sp_AddEntity.Close;

             sp_AddEntity.ParamByName('p_Entity_type').Value := EntityType;
             sp_AddEntity.ParamByName('p_PostNo').Value := StrToInt(WorkSheet.Cells[index,2].Text);
             sp_AddEntity.ParamByName('p_PostNoFirst').Value := StrToInt(WorkSheet.Cells[index,18].Text);

             if isSetDate then sp_AddEntity.ParamByName('p_DatePlat').Value := DatePlat
                          else sp_AddEntity.ParamByName('p_DatePlat').Value := StrToDate(WorkSheet.Cells[index,3].Text);

             sp_AddEntity.ParamByName('p_Summa').Value := FreeSumma;
             sp_AddEntity.ParamByName('p_FreeSumma').Value := FreeSumma;
             sp_AddEntity.ParamByName('p_Buh').Value := StrToInt(WorkSheet.Cells[index,6].Text);
             sp_AddEntity.ParamByName('p_Spravka').Value := WorkSheet.Cells[index,7].Text;
             sp_AddEntity.ParamByName('p_TipPlat').Value := 1;
             sp_AddEntity.ParamByName('p_UserNo').Value := StrToInt(WorkSheet.Cells[index,9].Text);
             sp_AddEntity.ParamByName('p_SotrudNo').Value := StrToInt(WorkSheet.Cells[index,10].Text);
             sp_AddEntity.ParamByName('p_bank_invoice_id').Value := D_BANK_INVOICE;
             sp_AddEntity.ParamByName('p_activity_type_id').Value := D_ACTIVITY_TYPE_ID;
             sp_AddEntity.ParamByName('p_response_dept_id').Value := D_RESPONSE_DEPT_ID;
             sp_AddEntity.ParamByName('p_VidRashodNo').Value := VidZatrat;
             sp_AddEntity.ParamByName('p_OtdelNo').Value := StrToInt(WorkSheet.Cells[index,15].Text);
             sp_AddEntity.ParamByName('p_our_firmNo').Value := main.GlobalOurFirmNo;
             sp_AddEntity.ParamByName('p_is_econom').Value := StrToInt(WorkSheet.Cells[index,17].Text);
             sp_AddEntity.ParamByName('p_DataLoad').Value := StrToDate(WorkSheet.Cells[index,3].Text);
             sp_AddEntity.ParamByName('p_SummaLoad').Value := Summa;
             sp_AddEntity.ParamByName('p_FreeSummaLoad').Value := FreeSumma;
             sp_AddEntity.ParamByName('p_EntityTypeLoad').Value := WorkSheet.Cells[index,1].Text;
             sp_AddEntity.ParamByName('p_AddressLoad').Value := WorkSheet.Cells[index,19].Text;

             sp_AddEntity.ParamByName('p_SetArticleGroupName').Value := WorkSheet.Cells[index,20].Text;
             sp_AddEntity.ParamByName('p_DayDeley').Value := StrToInt(WorkSheet.Cells[index,21].Text);

             sp_AddEntity.Execute;
           end;
        end;
     end;
   end;


  Excel.Quit;
  Excel := UnAssigned;
  Excel := Null;

  ShowMessage(' Загрузка данных завершена.'+ #10#13 +
              'Обработано ' + IntToStr(index-2)+' записей.'+ #10#13 +
              'Создано ' + IntToStr(cnt)+ ' док.');
  ToolBtnRefresh.Click;              

end;

end.

