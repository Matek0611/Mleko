unit MLekoListAdrInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKList, DBAccess, MsAccess, Menus, citComponentProps, DB,
  COMPSQLBuilder, ActnList, Grids, DBGrids, citDbGrid, ExtCtrls,
  comp_TargetFilter_Panel, ComCtrls, ToolWin, MemDS, citCtrls, citmask, SdacVcl,
  cxControls, cxSplitter, StdCtrls, citDBComboEdit, cxPC, BCFrame,
  BCContainer, BCList, MLKList, MLKListD_POST_DELAY_STOP_CONTROL, BCCxList,
  MLKCxList, GetPeriodDate0, comp_TargetFilter_CustomFilter,
  comp_TargetFilter_NumberFilter, DateUtils,ComObj, AppEvnts;

type
  TMlekoListAdrInfoForm = class(TCFLMLKListForm)
    ActionCopyToExcel: TAction;
    ActionChangeSector: TAction;
    ActionChangeAddress: TAction;
    ActionChangeSotrud: TAction;
    ActionChangeOtdel: TAction;
    spChangeSector: TMSStoredProc;
    spChangeSotrud: TMSStoredProc;
    ToolButton6: TToolButton;
    spSetFirmProp: TMSStoredProc;
    ActionSetStrem: TAction;
    ActionSetStop: TAction;
    ToolButton7: TToolButton;
    Flt_Post_buh: TcitDBComboEdit;
    ActionStopCheckPost: TAction;
    ToolButton8: TToolButton;
    CBDolgAll: TCheckBox;
    ToolButton1: TToolButton;
    ActionSetExtDelay: TAction;
    SplAddr: TcxSplitter;
    DbGridAddr: TcitDBGrid;
    tlbAddr: TToolBar;
    QuAddr: TMSQuery;
    btnSector: TToolButton;
    btnSotrud: TToolButton;
    dsAddr: TDataSource;
    ActionRefreshAddr: TAction;
    btnRefr: TToolButton;
    pmAddr: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    GroupBox1: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    PGExt: TcxPageControl;
    tsAddr: TcxTabSheet;
    tsFreeNakl: TcxTabSheet;
    DbGridFreeNakl: TcitDBGrid;
    QuFreeNakl: TMSQuery;
    DsFreeNakl: TDataSource;
    tsStopControl: TcxTabSheet;
    frmstd_pst_dly_stp_cnt: TMLKListD_POST_DELAY_STOP_CONTROLFrame;
    DSD_POST_DELAY_STOP_CONTROL: TDataSource;
    btnOneDate: TToolButton;
    btnControlStopPeriod: TToolButton;
    ActionControlStopPeriod: TAction;
    btn1: TToolButton;
    ActionControlAntiStopPeriod: TAction;
    QuStopControl: TMSQuery;
    QuStartControl: TMSQuery;
    btnControlAntiStopPeriod: TToolButton;
    fltDayDelay: TTargetFilter_NumberFilter;
    fltDayProsr: TTargetFilter_NumberFilter;
    lbl1: TLabel;
    tsInfo: TcxTabSheet;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    ApplicationEvents1: TApplicationEvents;
    cbShowNakl: TCheckBox;
    cbVisiblePostStop: TCheckBox;
    cbNaklOverLimit: TCheckBox;
    btShowListMinusPostForListAdrInfo: TButton;
    cbShowOnlyActive: TCheckBox;
    cbVivibleMinusPost: TCheckBox;
    cbVip: TCheckBox;
    function DBGridGetKey(Sender: TObject; DataSet: TDataSet): string;
    procedure ActionCopyToExcelExecute(Sender: TObject);
    procedure ActionChangeSectorExecute(Sender: TObject);
    procedure ActionChangeSotrudExecute(Sender: TObject);
    procedure ActionSetStremExecute(Sender: TObject);
    procedure ActionSetStopExecute(Sender: TObject);
    procedure DBGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure SQLBuilderGetParams(Sender: TObject; var Params: TParams);
    procedure FormCreate(Sender: TObject);
    function SQLBuilderGetOrderBy(Sender: TObject): string;
    procedure ActionStopCheckPostExecute(Sender: TObject);
    procedure CBDolgAllClick(Sender: TObject);
    procedure ActionRefreshAddrExecute(Sender: TObject);
    procedure ActionViewRefreshExecute(Sender: TObject);
    function DbGridAddrGetKey(Sender: TObject; DataSet: TDataSet): string;
    procedure ActionSetExtDelayExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QuD_POST_DELAY_STOP_CONTROLBeforeUpdateExecute(
      Sender: TCustomMSDataSet; StatementTypes: TStatementTypes;
      Params: TMSParams);
    procedure ActionControlStopPeriodExecute(Sender: TObject);
    procedure ActionControlAntiStopPeriodExecute(Sender: TObject);
    procedure DbGridFreeNaklDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DbGridAddrDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DenOtsrocki;
    procedure ReopenDBGridFreeNakl;
    procedure Prosrochka;
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridCellClick(Column: TColumn);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure QueryBeforeOpen(DataSet: TDataSet);
    procedure cbShowNaklClick(Sender: TObject);
    procedure cbVisiblePostStopClick(Sender: TObject);
    procedure fltDayDelayEnter(Sender: TObject);
    procedure fltDayProsrEnter(Sender: TObject);
    procedure cbNaklOverLimitClick(Sender: TObject);
    procedure btShowListMinusPostForListAdrInfoClick(Sender: TObject);
    procedure cbShowOnlyActiveClick(Sender: TObject);
    procedure cbVivibleMinusPostClick(Sender: TObject);
    procedure cbVipClick(Sender: TObject);
  private
    procedure SetColumnExtDelay;
    procedure SetControlStop(pID: Int64; ReasonNo: Integer; p_DATE_BEG,
      p_DATE_End: TDate; Val: boolean);
    procedure SetControlStopPeriod(val: Boolean;ReasonNo:Integer;p_date_beg:TDate;p_date_end:TDate);
    { Private declarations }
  protected
    procedure SetActionsEnabled; override;
  public

  end;
  
var
  MlekoListAdrInfoForm: TMlekoListAdrInfoForm;

implementation

uses MlekoSelectSector, MlekoSelectSotrud, UtilsCommon, data, main,
     ListMinusPostForListAdrInfo, ReasonForUnlocking0;

{$R *.dfm}

function TMlekoListAdrInfoForm.DBGridGetKey(Sender: TObject;
  DataSet: TDataSet): string;
begin
  inherited;
  Result := DataSet.FieldByName('ID').AsString;
end;

procedure TMlekoListAdrInfoForm.ActionCopyToExcelExecute(Sender: TObject);
var
XLApp,Sheet,Colum:Variant;
index,i,a:Integer;
begin
XLApp:= CreateOleObject('Excel.Application');
XLApp.Visible:=true;
XLApp.Workbooks.Add(-4167) ;
XLApp.Workbooks[ 1 ] .Worksheets[1].Name:='Отчет';
Colum:=XLApp.Workbooks[ 1 ] .Worksheets['Отчет'].Columns;
Colum.Columns[1].ColumnWidth:=20;
Colum.Columns[2].ColumnWidth:=20;
Colum.Columns[3].ColumnWidth:=20;
Colum.Columns[4].ColumnWidth:=20;
Colum.Columns[5].ColumnWidth:=20;
Colum.Columns[6].ColumnWidth:=20;
Colum.Columns[7].ColumnWidth:=20;
Colum.Columns[8].ColumnWidth:=20;
Colum.Columns[9].ColumnWidth:=20;
Colum.Columns[10].ColumnWidth:=20;
Colum.Columns[11].ColumnWidth:=20;

Colum:=XLApp.Workbooks[1].Worksheets['Отчет'].Rows;
Colum.Rows[2].Font.Bold:=true;
Colum.Rows[1].Font.Bold:=true;
Colum.Rows[1].Font.Color:=clBlue;
Colum.Rows[1].Font.Size:=14;


Sheet:=XLApp.Workbooks[1].Worksheets['Отчет'];
Sheet.Cells[1,2]:='Расходные накладные';
Sheet.Cells[2,1]:='Номер';
Sheet.Cells[2,2]:='Ном бух';
Sheet.Cells[2,3]:='Дата';
Sheet.Cells[2,4]:='Бух дата';
Sheet.Cells[2,5]:='Тип накл';
Sheet.Cells[2,6]:='Долг';
Sheet.Cells[2,7]:='Набор групп';
Sheet.Cells[2,8]:='Адрес';
Sheet.Cells[2,9]:='Отдел';
Sheet.Cells[2,10]:='Просрочка';
Sheet.Cells[2,11]:='Партнер';

 a:=0;
 index:=3;
 QuFreeNakl.First;
for i:=0 to QuFreeNakl.RecordCount-1  do
begin
  a:=a+1;
Sheet.Cells[index,1]:=QuFreeNakl.Fields.Fields[1].AsInteger;
Sheet.Cells[index,2]:=QuFreeNakl.Fields.Fields[2].AsInteger;
Sheet.Cells[index,3]:=QuFreeNakl.Fields.Fields[3].AsDateTime;
Sheet.Cells[index,4]:=QuFreeNakl.Fields.Fields[4].AsDateTime;
Sheet.Cells[index,5]:=QuFreeNakl.Fields.Fields[5].AsString;
Sheet.Cells[index,6]:=QuFreeNakl.Fields.Fields[6].AsFloat;
Sheet.Cells[index,7]:=QuFreeNakl.Fields.Fields[7].AsString;
Sheet.Cells[index,8]:=QuFreeNakl.Fields.Fields[9].AsString;
Sheet.Cells[index,9]:=QuFreeNakl.Fields.Fields[10].AsString;
Sheet.Cells[index,10]:=StringGrid1.Cells[0,a];
Sheet.Cells[index,11]:=Query.Fields.Fields[1].AsString;
Inc( index) ;
QuFreeNakl.Next;
 end;
 end;


procedure TMlekoListAdrInfoForm.ActionChangeSectorExecute(Sender: TObject);
var
  ln_sector_id, i: Integer;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  if TMlekoSelectSectorDlg.SelectSector(ln_sector_id) then
  begin
    if (DbGridAddr.MarkItems.Count > 0) then
    begin
      for i := 0 to DbGridAddr.MarkItems.Count - 1 do
      begin
        spChangeSector.Close;
        spChangeSector.Params.ParamByName('p_id').Value := DbGridAddr.MarkItems[i];
        spChangeSector.Params.ParamByName('p_sector_id').Value := ln_sector_id;
        spChangeSector.ExecProc;
      end;
    end
    else
    begin
      spChangeSector.Close;
      spChangeSector.Params.ParamByName('p_id').Value := QuAddr.FieldbyName('id').AsString;
      spChangeSector.Params.ParamByName('p_sector_id').Value := ln_sector_id;
      spChangeSector.ExecProc;
    end;
    ActionRefreshAddr.Execute;
  end;
  Screen.Cursor := crDefault;
end;

procedure TMlekoListAdrInfoForm.ActionChangeSotrudExecute(Sender: TObject);
var
  ln_sotrud_id, i, PostNo: Integer;
begin
  inherited;
  PostNo := QuAddr.FieldByName('PostNo').Value;
  if TMlekoSelectSotrudDlg.SelectSotrud(ln_sotrud_id, -1) then
  begin
    if (DbGridAddr.MarkItems.Count > 0) then
    begin
      for i := 0 to DBGrid.MarkItems.Count - 1 do
      begin
        spChangeSotrud.Close;
        spChangeSotrud.Params.ParamByName('p_id').Value := DbGridAddr.MarkItems[i];
        spChangeSotrud.Params.ParamByName('p_sotrudNo').Value := ln_sotrud_id;
        spChangeSotrud.ExecProc;
      end;
    end
    else
    begin
      spChangeSotrud.Close;
      spChangeSotrud.Params.ParamByName('p_id').Value := QuAddr.FieldbyName('id').AsString;
      spChangeSotrud.Params.ParamByName('p_sotrudNo').Value := ln_sotrud_id;
      spChangeSotrud.ExecProc;
    end;
    ActionRefreshAddr.Execute;
  end;
end;

procedure TMlekoListAdrInfoForm.SetActionsEnabled;
var
  ne, c, aEditEnabled: boolean;
  status: Integer;
begin
  inherited;
  ne := not Query.IsEmpty;
  ActionSetStrem.Checked := ne and (Query.FieldByName('is_enable_stop_period').AsInteger = 1);
  ActionSetStop.Checked := ne and (Query.FieldByName('is_stop').AsInteger = 1);
  ActionStopCheckPost.Checked := ne and (Query.FieldByName('is_stop_check').AsInteger = 1);
end;

procedure TMlekoListAdrInfoForm.ActionSetStremExecute(Sender: TObject);
var
  ReasonNo : integer;
begin
  inherited;
  ShowMessage('Укажите причину разблокировки');
  ReasonNo := ReasonForUnlocking(true);

  if ReasonNo = 0 then raise Exception.Create('Разблокировка не возможна без указания причины!');

  dmDataModule.OpenSQL('select isnull(Limit,0) as Limit from ReasonForUnlocking where ReasonNo = :p1_ReasonNo', [ReasonNo]);

  if dmDataModule.QFO.FieldByName('Limit').AsInteger <>0 then if Query.FieldByname('Day_Prosr_group').AsInteger > dmDataModule.QFO.FieldByName('Limit').AsInteger then raise Exception.Create('Разблокировка не возможна из-за привышения лимита причины разблокировки');

  SetControlStopPeriod(true,ReasonNo,main.GlobalDateNakl, main.GlobalDateNakl);
end;


procedure TMlekoListAdrInfoForm.ActionSetStopExecute(Sender: TObject);
var
  Val: Integer;
  msg: string;
begin
  inherited;
  if ActionSetStop.Checked then
    val := 0
  else
    val := 1;
  if Val = 1 then
    msg := 'Запретить навсегда отгрузки партнеру?'
  else
    msg := 'Отменить запрет отгрузок партнеру ?';
  if Application.MessageBox(Pchar(msg), 'Изменения запрета отгрузки', MB_YESNO + MB_ICONWARNING) = IDYES then
  begin
    ActionSetStop.Checked := not ActionSetStop.Checked;
    spSetFirmProp.Close;
    spSetFirmProp.Params.ParamByName('p_postNo').Value := Query.FieldByName('PostNo').AsInteger;
    spSetFirmProp.Params.ParamByName('p_PropId').Value := 14;
    spSetFirmProp.Params.ParamByName('p_Value').Value := val;
    spSetFirmProp.ExecProc;
    ActionViewRefresh.Execute;
  end;
end;

procedure TMlekoListAdrInfoForm.DBGridDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if Field = nil then exit;
  if (Field.FieldName = 'PostName')
    and (Query.FieldByName('KolDayDolg').AsInteger > Query.FieldByName('day_Delay_Main').AsInteger)
    and (Query.FieldByName('KolDayDolg').AsInteger <= Query.FieldByName('dayDelay').AsInteger)
    then DbGrid.Canvas.Brush.Color := clYellow;
  if (Field.FieldName = 'PostName') and (Query.FieldByName('is_prosr').AsInteger = 1) then DbGrid.Canvas.Brush.Color := $00FF9DFF;
  if (Field.FieldName = 'PostName') and (Query.FieldByName('is_stop_check').AsInteger = 1) then DbGrid.Canvas.Brush.Color := clGreen;
  if (Field.FieldName = 'PostName') and (Query.FieldByName('is_stop').AsInteger = 1) then DbGrid.Canvas.Brush.Color := clGray;
  if (Field.FieldName = 'Set_Name') and (Query.FieldByName('is_all_group').AsInteger = 1) then DbGrid.Canvas.Brush.Color := clGreen;
  if (Field.FieldName = 'PostName') and (Query.FieldByName('is_enable_stop_period').AsInteger = 1) then DbGrid.Canvas.Brush.Color := $00FF8080;

end;

procedure TMlekoListAdrInfoForm.SQLBuilderGetParams(Sender: TObject;
  var Params: TParams);
var
  is_all_Post_buh, is_all_vidrash, is_all_Tip, is_all_Otdel, is_all_dolg, is_all_post, is_not_minus_post, is_Vip : Integer;
begin
  if CBDolgAll.Checked then begin
                              is_all_dolg := 1;
//                              is_not_minus_post := 1;
//                              cbVisiblePostStop.Checked := false;
                            end
                       else begin
                              is_all_dolg := 0;
//                              is_not_minus_post := 0;
                            end;

  if cbVisiblePostStop.Checked then is_all_post := 1 else is_all_post := 0;

  if cbVivibleMinusPost.Checked then is_not_minus_post := 1 else is_not_minus_post := 0;

  if cbVip.Checked then is_Vip := 1 else is_Vip := 0;

  inherited;
  if flt_Post_buh.Text = '' then
    is_all_Post_buh := 1
  else
    is_all_Post_buh := 0;


  with Params.CreateParam(ftDate, 'DateNakl', ptInput) do AsDate := main.GlobalDateNakl;
  Params.ParamByName('DateNakl').AsDate := main.GlobalDateNakl;
{
  with Params.CreateParam(ftDate, 'DateNaklAll', ptInput) do AsDate := main.GlobalDateNakl - 1;
  Params.ParamByName('DateNaklAll').AsDate := main.GlobalDateNakl - 1;
}

//  showmessage(datetostr(main.GlobalDateNakl)+'   '+datetostr(main.GlobalDateNakl-1));
{
  UtilsCommon.SetParamValue(Params, 'DateNakl', main.GlobalDateNakl);
  UtilsCommon.SetParamValue(Params, 'DateNaklAll', main.GlobalDateNakl-1);
}
  UtilsCommon.SetParamValue(Params, 'is_all_post_buh', is_all_post_buh);
  UtilsCommon.SetParamValue(Params, 'is_all_dolg', is_all_dolg);
  UtilsCommon.SetParamValue(Params, 'is_all_post', is_all_post);
  UtilsCommon.SetParamValue(Params, 'is_not_minus_post', is_not_minus_post);
  UtilsCommon.SetParamValue(Params, 'is_Vip', is_Vip);

end;

procedure TMlekoListAdrInfoForm.FormCreate(Sender: TObject);
begin
  inherited;
  SQLBuilder.Where.Text := dmDataModule.parse_flt_sql(SQLBuilder.Where.Text, Name, '');
  StringGrid1.Visible:=False;
  if cbShowNakl.Checked then ReopenDBGridFreeNakl;

  end;

function TMlekoListAdrInfoForm.SQLBuilderGetOrderBy(
  Sender: TObject): string;
begin
  //  Result:=inherited(Sender);
  if Result = '' then result := 'a.PostName,a.Set_Name,a.Buh_type_name';
end;

procedure TMlekoListAdrInfoForm.ActionStopCheckPostExecute(Sender: TObject);
var
  Val: Integer;
  msg: string;
begin
  inherited;
  if ActionStopCheckPost.Checked then
    val := 0
  else
    val := 1;
  if Val = 1 then
    msg := 'Контроль отсрочки долга будет отключен навсегда , вы уверены?'
  else
    msg := 'Отменить отключение отсрочки долга навсегда , вы уверены ?';
  if Application.MessageBox(Pchar(msg), 'Отключение отсрочки долга навсегда', MB_YESNO + MB_ICONWARNING) = IDYES then
  begin
    ActionStopCheckPost.Checked := not ActionStopCheckPost.Checked;
    spSetFirmProp.Close;
    spSetFirmProp.Params.ParamByName('p_postNo').Value := Query.FieldByName('PostNo').AsInteger;
    spSetFirmProp.Params.ParamByName('p_PropId').Value := 21;
    spSetFirmProp.Params.ParamByName('p_Value').Value := val;
    spSetFirmProp.ExecProc;
    ActionViewRefresh.Execute;
  end;
end;

procedure TMlekoListAdrInfoForm.CBDolgAllClick(Sender: TObject);
begin
  inherited;
  ActionViewRefresh.Execute;
end;

procedure TMlekoListAdrInfoForm.ActionRefreshAddrExecute(Sender: TObject);
var old_id: Int64;
begin
  inherited;
  old_id := QuAddr.FieldByName('ID').Value;
  QuAddr.Close;
  QuAddr.Open;
  QuAddr.Locate('ID', old_id, []);
end;

procedure TMlekoListAdrInfoForm.ActionViewRefreshExecute(Sender: TObject);
begin
  inherited;
  if not QuAddr.Active then QuAddr.Open;
  if not QuFreeNakl.Active then begin
                                  if cbNaklOverLimit.Checked then begin
                                                                    QuFreeNakl.Close;
                                                                    QuFreeNakl.MacroByName('_where').Value := ' and doc_date <= '+''''+ DateToStr(Date-(Query.FieldByName('day_Delay_Main').AsInteger){-(Query.FieldByName('Day_delay_ext').AsInteger)+1})+''''+
                                                                                                              ' and SET_ARTICLE_GROUP_NAME = '+''''+ Query.FieldByName('Set_Name').AsString+'''';
                                                                    QuFreeNakl.Open;
                                                                  end
                                                             else begin
                                                                    QuFreeNakl.Close;
                                                                    QuFreeNakl.MacroByName('_where').Value := '';
                                                                    QuFreeNakl.Open;
                                                                  end;

                                end;
end;

function TMlekoListAdrInfoForm.DbGridAddrGetKey(Sender: TObject;
  DataSet: TDataSet): string;
begin
  inherited;
  Result := DataSet.FieldByName('ID').AsString;
end;

procedure TMlekoListAdrInfoForm.ActionSetExtDelayExecute(Sender: TObject);
begin
  inherited;
//

end;

procedure TMlekoListAdrInfoForm.SetColumnExtDelay;
var i: integer;
begin
  if not (UpperCase(DBGrid.Columns[DBGrid.SelectedIndex].FieldName) = 'DAY_DELAY_EXT') then
  begin
    for i := 0 to DBGrid.Columns.Count - 1 do
      if (UpperCase(DBGrid.Columns[i].FieldName) = 'DAY_DELAY_EXT') then DBGrid.SelectedIndex := i;
  end;
end;

procedure TMlekoListAdrInfoForm.FormShow(Sender: TObject);
begin
  inherited;
  frmstd_pst_dly_stp_cnt.Open;
  frmstd_pst_dly_stp_cnt.QuD_POST_DELAY_STOP_CONTROL.Close;
  frmstd_pst_dly_stp_cnt.QuD_POST_DELAY_STOP_CONTROL.MacroByName('_where').value := ' and active = ''Y''';
  frmstd_pst_dly_stp_cnt.QuD_POST_DELAY_STOP_CONTROL.Open;
end;

procedure TMlekoListAdrInfoForm.QuD_POST_DELAY_STOP_CONTROLBeforeUpdateExecute(
  Sender: TCustomMSDataSet; StatementTypes: TStatementTypes;
  Params: TMSParams);
begin
  inherited;
  if stInsert in StatementTypes then
  begin
    Params.ParamByName('USER_ID').Value := Data.UserNo;
  end;
end;

procedure TMlekoListAdrInfoForm.SetControlStop(pID: Int64; ReasonNo: Integer; p_DATE_BEG: TDate; p_DATE_End: TDate; Val: boolean);
var l_sql: string;
begin
   if Val then
  begin

    QuStopControl.Close;
    QuStopControl.ParamByName('p1_L_POST_SET_DELAY_ID').Value:= pID;
    QuStopControl.ParamByName('p2_USER_ID').Value:= data.UserNo;
    QuStopControl.ParamByName('p3_DATE_BEG').AsDate:= p_DATE_BEG;
    QuStopControl.ParamByName('p4_DATE_END').AsDate:= p_DATE_End;

    QuStopControl.ParamByName('p5_ReasonNo').AsInteger := ReasonNo;
    QuStopControl.ParamByName('p6_Day_Prosr_group').AsInteger := Query.FieldByname('Day_Prosr_group').Value;
    QuStopControl.ParamByName('p7_Day_Prosr').AsInteger := Query.FieldByname('DayDolgGroup').Value;
    QuStopControl.ParamByName('p8_SummaDolg').Value := Query.FieldByname('SummaDolgaAll').Value;

    QuStopControl.Execute;
  end else
  begin
    QuStartControl.Close;
    QuStartControl.ParamByName('p1_L_POST_SET_DELAY_ID').Value:= pID;
    QuStartControl.Execute;
  end;
end;

procedure TMlekoListAdrInfoForm.ActionControlStopPeriodExecute(
  Sender: TObject);
var Period   : TDatePeriod;
    ReasonNo : Integer;
begin
  inherited;
  ShowMessage('Укажите причину разблокировки');
  ReasonNo := ReasonForUnlocking(true);

  if ReasonNo = 0 then raise Exception.Create('Разблокировка не возможна без указания причины!');

  dmDataModule.OpenSQL('select isnull(Limit,0) as Limit from ReasonForUnlocking where ReasonNo = :p1_ReasonNo', [ReasonNo]);

  if dmDataModule.QFO.FieldByName('Limit').AsInteger <>0 then if Query.FieldByname('Day_Prosr_group').AsInteger > dmDataModule.QFO.FieldByName('Limit').AsInteger then raise Exception.Create('Разблокировка не возможна из-за привышения лимита причины разблокировки');

  Period := GetPeriodDate(main.GlobalDateNakl, main.GlobalDateNakl);
  if Period.DateBegin = 0 then exit;
  SetControlStopPeriod(true,ReasonNo,Period.DateBegin,Period.DateEnd);
end;

procedure TMlekoListAdrInfoForm.SetControlStopPeriod(val: Boolean;ReasonNo: Integer;p_date_beg:TDate;p_date_end:TDate);
var
  msg: string;
  i,Day_Prosr_group,Day_Prosr :Integer;
  SummaDolga : double;
  Id : Int64;
begin
  inherited;
  if Val then
    msg := 'Контроль отсрочки долга будет отключен  , вы уверены?'
  else
    msg := 'Контроль отсрочки долга будет включен , вы уверены ?';

  if (DbGrid.MarkItems.Count > 0) then
  begin
    Id := Query.FieldByname('ID').Value;
    for i := 0 to DbGrid.MarkItems.Count - 1 do
    begin
{
      DBGrid. SelectedRows.  DataSource.DataSet.
      ShowMessage(DbGrid.MarkItems.   .FieldByName('Day_Prosr_group').asstring);

      ShowMessage(DBGrid.DataSource.DataSet.FieldByName('Day_Prosr_group').asstring) ;
      ShowMessage(DbGrid.MarkItems[i]);

      Query.Locate('Id', DbGrid.MarkItems[i], []);

      ShowMessage(Query.FieldByname('ID').AsString);
      ShowMessage(DBGrid.DataSource.DataSet.FieldByName('Day_Prosr_group').asstring) ;

      Day_Prosr_group := DBGrid.DataSource.DataSet.FieldByName('Day_Prosr_group').AsInteger;
      Day_Prosr := DBGrid.DataSource.DataSet.FieldByName('Day_Prosr').AsInteger;
//      SummaDolga := DBGrid.DataSource.DataSet.FieldByName('SummaDolga).;
}
      Query.Locate('Id', DbGrid.MarkItems[i], []);
      SetControlStop(StrToInt64(DbGrid.MarkItems[i]),ReasonNo, p_date_beg, p_date_end, val);
    end;
    Query.Locate('Id', Id, []);
  end
  else
  begin
    SetControlStop(Query.FieldByname('ID').Value,ReasonNo, p_date_beg, p_date_end, val);
  end;

  ActionViewRefresh.Execute;
  frmstd_pst_dly_stp_cnt.QuD_POST_DELAY_STOP_CONTROL.Close;
  frmstd_pst_dly_stp_cnt.QuD_POST_DELAY_STOP_CONTROL.Open;
end;


procedure TMlekoListAdrInfoForm.ActionControlAntiStopPeriodExecute(
  Sender: TObject);
var Period: TDatePeriod;
    ReasonNo: Integer;
begin
  inherited;
  Period := GetPeriodDate(main.GlobalDateNakl, main.GlobalDateNakl);
  if Period.DateBegin = 0 then exit;
  SetControlStopPeriod(false,ReasonNo,Period.DateBegin,Period.DateEnd);
end;


procedure TMlekoListAdrInfoForm.DenOtsrocki;
var
a,b:string;
i,c,d:Integer;
begin
  inherited;
  StringGrid1.RowCount:=QuFreeNakl.RecordCount+1;
  d:=0;
  for c:=0 to QuFreeNakl.RecordCount -1 do begin
                                             d:=d+1;
                                             a:=DateToStr(Date);
                                             b:=DateToStr(QuFreeNakl.FieldByName('doc_date').AsDateTime);
                                             i:=((DaysBetween(StrToDate(a), StrToDate(b))-(Query.FieldByName('day_Delay_Main').AsInteger))+1);
                                             //     -(Query.FieldByName('Day_delay_ext').AsInteger);
                                             StringGrid1.Cells[0,d]:=IntToStr(i);
                                             if QuFreeNakl.FieldByName('SET_ARTICLE_GROUP_NAME').AsString <> Query.FieldByName('Set_Name').AsString
                                              then (StringGrid1.Cells[0,d]:='');
                                             if i <=0 then  StringGrid1.Cells[0,d]:='';
                                             QuFreeNakl.Next;
                                           end;
end;

procedure TMlekoListAdrInfoForm.Prosrochka;
var
c,d:Integer;
begin
  inherited;
  DbGridFreeNakl.Columns.Items[9].Width:=64;
  StringGrid1.RowCount:=QuFreeNakl.RecordCount+1;
  d:=0;
  for c:=0 to QuFreeNakl.RecordCount -1 do begin
                                             d:=d+1;
                                             QuFreeNakl.Edit;
                                             QuFreeNakl.FieldByName('ACTIVITY_TYPE_ID').AsString := StringGrid1.Cells[0,d];
                                             QuFreeNakl.Next;
                                           end;
  QuFreeNakl.RecNo:=1;
end;

procedure TMlekoListAdrInfoForm.ReopenDBGridFreeNakl;
begin
  if cbNaklOverLimit.Checked then begin
                                    QuFreeNakl.Close;
                                    QuFreeNakl.MacroByName('_where').Value := ' and doc_date <= '+''''+ DateToStr(Date-(Query.FieldByName('day_Delay_Main').AsInteger){-(Query.FieldByName('Day_delay_ext').AsInteger)+1})+''''+
                                                                              ' and SET_ARTICLE_GROUP_NAME = '+''''+ Query.FieldByName('Set_Name').AsString+''''+
                                                                              ' and Currency = '+''''+ Query.FieldByName('Currency').AsString+'''';
                                    QuFreeNakl.Open;
                                  end
                             else begin
                                    QuFreeNakl.Close;
                                    QuFreeNakl.MacroByName('_where').Value := '';
                                    QuFreeNakl.Open;
                                  end;
  DbGridFreeNakl.Reopen;
  DbGridFreeNakl.Columns.Items[0].Width:=72;
  DbGridFreeNakl.Columns.Items[1].Width:=72;
  DbGridFreeNakl.Columns.Items[2].Width:=93;
  DbGridFreeNakl.Columns.Items[3].Width:=93;
  DbGridFreeNakl.Columns.Items[4].Width:=229;
  DbGridFreeNakl.Columns.Items[5].Width:=83;
  DbGridFreeNakl.Columns.Items[6].Width:=230;
  DbGridFreeNakl.Columns.Items[7].Width:=136;
  DbGridFreeNakl.Columns.Items[8].Width:=122;
  DbGridFreeNakl.Columns.Items[9].Width:=0;
end;

procedure TMlekoListAdrInfoForm.DbGridFreeNaklDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
begin
  inherited;
       if (QuFreeNakl.FieldByName('doc_date').AsDateTime <= Date -
          (Query.FieldByName('day_Delay_Main').AsInteger))
{
          -(Query.FieldByName('Day_delay_ext').AsInteger)+1)
}          
          and (QuFreeNakl.FieldByName('SET_ARTICLE_GROUP_NAME').AsString =
               Query.FieldByName('Set_Name').AsString) then
    begin with DbGridFreeNakl.Canvas do
      begin
		    Brush.Color:=$00FF9DFF;
    		Font.Color:=clBlack;
		    FillRect(Rect);
    		TextOut(Rect.Left+2,Rect.Top+2,Column.Field.Text);
  	  end;
    end;
end;

procedure TMlekoListAdrInfoForm.DbGridAddrDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (QuAddr.FieldByName('address').AsString = QuFreeNakl.FieldByName('OUT_TRADE_NAME').AsString)
      and (QuAddr.FieldByName('OtdelName').AsString = QuFreeNakl.FieldByName('Manager_dept_Name').AsString)
  then
    begin with DbGridAddr.Canvas do begin
                                  		Brush.Color:=clSkyBlue;
                                  		Font.Color:=clBlack;
                                   		FillRect(Rect);
                                  		TextOut(Rect.Left+3,Rect.Top +2,Column.Field.Text);
                                  	end;
    end;
end;

procedure TMlekoListAdrInfoForm.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var
   i: SmallInt;
begin
   if Msg.message = WM_MOUSEWHEEL then
   begin
     Msg.message := WM_KEYDOWN;
     Msg.lParam := 0;
     i := HiWord(Msg.wParam) ;
     if i > 0 then Msg.wParam := VK_UP
              else Msg.wParam := VK_DOWN;
     Handled := False;
   end;

end;

procedure TMlekoListAdrInfoForm.DBGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

begin
  inherited;
  case Key of
    VK_UP: begin
             if cbShowNakl.Checked then ReopenDBGridFreeNakl;
           end;
    VK_DOWN: begin
               if cbShowNakl.Checked then ReopenDBGridFreeNakl;
             end;
  end;
end;

procedure TMlekoListAdrInfoForm.DBGridCellClick(Column: TColumn);
begin
  inherited;
  if cbShowNakl.Checked then begin
                               ReopenDBGridFreeNakl;
                               DenOtsrocki;
                               ReopenDBGridFreeNakl;
                               Prosrochka;
                             end;
end;

procedure TMlekoListAdrInfoForm.DBGridKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then begin
                      if cbShowNakl.Checked then begin
                                                   ReopenDBGridFreeNakl;
                                                   DenOtsrocki;
                                                   ReopenDBGridFreeNakl;
                                                   Prosrochka;
                                                 end;
                    end;
end;

procedure TMlekoListAdrInfoForm.QueryAfterOpen(DataSet: TDataSet);
begin
  inherited;
//  ds.DataSet.ControlsDisabled := false;
//  QuFreeNakl.ControlsDisabled := false;
end;

procedure TMlekoListAdrInfoForm.QueryBeforeOpen(DataSet: TDataSet);
begin
  inherited;
//  DBgrid.DataSource.DataSet.ControlsDisabled := false;
end;

procedure TMlekoListAdrInfoForm.cbShowNaklClick(Sender: TObject);
begin
  inherited;
  if cbShowNakl.Checked then begin
                               ReopenDBGridFreeNakl;
                               DenOtsrocki;
                               ReopenDBGridFreeNakl;
                               Prosrochka;
                             end;
end;

procedure TMlekoListAdrInfoForm.cbVisiblePostStopClick(Sender: TObject);
begin
  inherited;
  ActionViewRefresh.Execute;
end;

procedure TMlekoListAdrInfoForm.fltDayDelayEnter(Sender: TObject);
begin
  inherited;
  ActionViewRefresh.Execute;
end;

procedure TMlekoListAdrInfoForm.fltDayProsrEnter(Sender: TObject);
begin
  inherited;
  ActionViewRefresh.Execute;
end;

procedure TMlekoListAdrInfoForm.cbNaklOverLimitClick(Sender: TObject);
begin
  inherited;
  if cbNaklOverLimit.Checked then begin
                                    QuFreeNakl.Close;
                                    QuFreeNakl.MacroByName('_where').Value := ' and doc_date <= '+''''+ DateToStr(Date-(Query.FieldByName('day_Delay_Main').AsInteger){-(Query.FieldByName('Day_delay_ext').AsInteger)+1})+''''+
                                                                              ' and SET_ARTICLE_GROUP_NAME = '+''''+ Query.FieldByName('Set_Name').AsString+'''';
                                    QuFreeNakl.Open;
                                  end
                             else begin
                                    QuFreeNakl.Close;
                                    QuFreeNakl.MacroByName('_where').Value := '';
                                    QuFreeNakl.Open;
                                  end;
end;

procedure TMlekoListAdrInfoForm.btShowListMinusPostForListAdrInfoClick(
  Sender: TObject);
begin
  inherited;
  with TListMinusPostForListAdrInfoaForm.Create(Application) do
   try
     quListMinusPostForListAdrInfoa.Open;
     ShowModal;
   finally
     quListMinusPostForListAdrInfoa.Close;
     Free;
   end;
end;

procedure TMlekoListAdrInfoForm.cbShowOnlyActiveClick(Sender: TObject);
begin
  inherited;
  if cbShowOnlyActive.Checked then begin
                                     frmstd_pst_dly_stp_cnt.QuD_POST_DELAY_STOP_CONTROL.Close;
                                     frmstd_pst_dly_stp_cnt.QuD_POST_DELAY_STOP_CONTROL.MacroByName('_where').value := ' and active = ''Y''';
                                     frmstd_pst_dly_stp_cnt.QuD_POST_DELAY_STOP_CONTROL.Open;
                                   end
                              else begin
                                     frmstd_pst_dly_stp_cnt.QuD_POST_DELAY_STOP_CONTROL.Close;
                                     frmstd_pst_dly_stp_cnt.QuD_POST_DELAY_STOP_CONTROL.MacroByName('_where').value := '';
                                     frmstd_pst_dly_stp_cnt.QuD_POST_DELAY_STOP_CONTROL.Open;
                                   end;
end;

procedure TMlekoListAdrInfoForm.cbVivibleMinusPostClick(Sender: TObject);
begin
  inherited;
  ActionViewRefresh.Execute;
end;

procedure TMlekoListAdrInfoForm.cbVipClick(Sender: TObject);
begin
  inherited;
  ActionViewRefresh.Execute;
end;

end.

