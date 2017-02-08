unit UAnalyze_Debit_Debt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess,
  ExtCtrls, ActnList, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, citCtrls, citmask, citDBComboEdit,
  DBGridEhImpExp, ComCtrls, MlekoUtils, Mask, DBCtrlsEh;

type
  TfrmAnalyze_Debit_Debt = class(TCFLMLKCustomForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dsDebt: TMSDataSource;
    quDebt: TMSQuery;
    dbgDebts: TDBGridEh;
    EdDateAnalyzeEnd: TcxDateEdit;
    Label5: TLabel;
    cbIs_Ext_OtdelNo: TCheckBox;
    cbIs_Ext_VidNo: TCheckBox;
    cbIs_Ext_SotrudNo: TCheckBox;
    fltVidTov: TcitDBComboEdit;
    fltOtdel: TcitDBComboEdit;
    fltSotrud: TcitDBComboEdit;
    btnRefresh: TButton;
    btnExportToExcel: TButton;
    dlgSaveExportToExcel: TSaveDialog;
    sbStatus: TStatusBar;
    cbxBuhType: TCheckBox;
    cbxAgent: TCheckBox;
    cbxNaklNo: TCheckBox;
    fltBuhType: TcitDBComboEdit;
    cbxAddress: TCheckBox;
    fltAddress: TcitDBComboEdit;
    fltAgent: TcitDBComboEdit;
    fltNaklNo: TcitDBComboEdit;
    quDebtOtdelName: TStringField;
    quDebtVidTovName: TStringField;
    quDebtSotrudName: TStringField;
    quDebtBuhName: TStringField;
    quDebtAddress: TStringField;
    quDebtSumma: TFloatField;
    quDebtSummaDolg: TFloatField;
    quDebtOverSumma: TFloatField;
    quDebtDateNakl: TDateTimeField;
    quDebtDateOpl: TDateTimeField;
    quDebtSrok: TIntegerField;
    quDebtNom: TStringField;
    quDebtCurrencyHead: TStringField;
    quDebtCurAcc: TStringField;
    quDebtSummaAcc: TFloatField;
    quDebtSummaDolgAcc: TFloatField;
    quDebtName: TStringField;
    quDebtOtdel_Name: TStringField;
    quDebtVidTov_Name: TStringField;
    quDebtSotrud_Name: TStringField;
    quDebtBuh_Name: TStringField;
    quDebtName_: TStringField;
    quDebtSummaPlat: TFloatField;
    quDebtDay_Exp: TIntegerField;
    quDebtPhone: TStringField;
    quDebtVIP: TBooleanField;
    quDebtVipName: TStringField;
    quDebtMarschrutNo: TSmallintField;
    quDebtSectorName: TStringField;
    quDebtSource_Type: TStringField;
    quDebtOurFirmName: TStringField;
    quDebtNameTovar: TStringField;
    quDebtKolTovar: TStringField;
    quDebtSummaTovar: TStringField;
    quDebtAddressName: TStringField;
    procedure cbIs_Ext_OtdelNoClick(Sender: TObject);
    procedure cbIs_Ext_VidNoClick(Sender: TObject);
    procedure cbIs_Ext_TipNoClick(Sender: TObject);
    procedure cbIs_Ext_TovarNoClick(Sender: TObject);
    procedure cbIs_Ext_SotrudNoClick(Sender: TObject);
    procedure cbIs_Ext_ColnPriceClick(Sender: TObject);
    procedure fltSotrudSelectOk(Sender: TObject);
    procedure fltVidTovSelectOk(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure dbgDebtsTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
    procedure dbgDebtsKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDebtsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExportToExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure quDebtBeforeOpen(DataSet: TDataSet);
    procedure EdDateAnalyzeEndPropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Tracer: TTimeTracer;
    DisableCount: Integer;
    SearchString: string;
    MaxRecordCount: Integer;
    ExpansionIndex: Integer;
    SelectionList, ExpansionList: TList;
    Source, Fields, Temp: TStringList;
    procedure ShowStatusMsg(Index: Integer; Msg: string);
    procedure ShowRecordCount(SetMaxCount: Boolean = False);
    procedure SetParamsBeforeOpen;
    procedure Set_Ext_Param(ParamName: string; Owner: TCheckBox);
    procedure FillSourceList;
    procedure FillComponentLists;
    procedure ShowScript;
    procedure ApplyChanges;
    procedure SetParameter(ParamName, ParamValue: string);
    procedure SetParameters;
  public
    { Public declarations }
    procedure RefreshResults(SetMaxCount: Boolean = False);
    procedure DisableParams;
    procedure EnableParams;
  end;

var
  frmAnalyze_Debit_Debt: TfrmAnalyze_Debit_Debt;

implementation

uses
  data, About;

{$R *.dfm}

const
  idCurRecordCount = 0;
  idMaxRecordCount = 1;
  idPercent = 2;
  idTime = 3;
  idFileName = 4;
  idExpansions = 'SET @Expansions = ';

procedure SetBit(Addr: Pointer; Index: Integer; Value: Boolean); assembler;
asm
        OR      Value, Value
        JZ      @Zero
        BTS     [EAX], Index
        RET

@Zero:  BTR     [EAX], Index
        RET
end;

function GetBit(Addr: Pointer; Index: Integer): Boolean; assembler;
asm
        BT      [EAX], Index
        SBB     EAX, EAX
        AND     EAX, 1
end;

function GetControlText(Control: TControl): string;
var
  Len: Integer;
begin
  Len := Control.GetTextLen + 1;
  SetLength(Result, Len);
  Control.GetTextBuf(Pointer(Result), Len);
  Result := Trim(Result);
  //Result:= Control.Text; No Text property in TControl but in debug mode it is visible
end;

function GetStartPosIndex(Source: TStrings; S: string): Integer;
begin
  for Result := 0 to Source.Count - 1 do
  begin
    if Pos(S, Source[Result]) = 1 then
      Exit;
  end;
end;

function CollectGroupStrings(Source, Dest: TStrings; Group: Integer; Prefix:
  string): Integer;
var
  i, n: Integer;
begin
  Result := 0;
  if (Group <> 0) then
  begin
    n := Source.Count;
    if (LongInt(1) shl n) = (Group + 1) then
      Exit;
    for i := 0 to n - 1 do
    begin
      if GetBit(@Group, i) then
      begin
        if (i > 0) then
          Dest.Add(', ' + Prefix + Source[i])
        else
          Dest.Add('  ' + Prefix + Source[i]);
        Inc(Result);
      end;
    end;
    if (Result > 0) then
      Dest.Insert(Dest.Count - Result, 'GROUP BY');
  end;
end;

function CollectBitValues(List: TList): Integer;

  function GetBoolValue(Comp: TComponent): Boolean;
  begin
    Result := False;
    if (Comp is TCheckBox) then
      Result := (Comp as TCheckBox).Checked
    else if (Comp is TWinControl) then
      Result := GetControlText(Comp as TWinControl) <> '';
  end;

var
  i: Integer;
begin
  Result := 0;
  for i := 0 to List.Count - 1 do
    SetBit(@Result, i, GetBoolValue(TComponent(List[i])));
end;

procedure TfrmAnalyze_Debit_Debt.Set_Ext_Param(ParamName: string; Owner: TCheckBox);
begin
  inherited;
//  quDebt.Close;
//  quDebt.ParamByName(ParamName).Value := Owner.Checked;
//  quDebt.Open;
end;

procedure TfrmAnalyze_Debit_Debt.cbIs_Ext_OtdelNoClick(Sender: TObject);
begin
  inherited;
  //Set_Ext_Param('Is_Ext_Otd', cbIs_Ext_OtdelNo);
//  quDebt.Close;
//  quDebt.ParamByName('Is_Ext_Otd').Value := cbIs_Ext_OtdelNo.Checked;
//  quDebt.Open;
end;

procedure TfrmAnalyze_Debit_Debt.cbIs_Ext_VidNoClick(Sender: TObject);
begin
  inherited;
  //Set_Ext_Param('Is_Ext_Vid', cbIs_Ext_VidNo);
//  quDebt.Close;
//  quDebt.ParamByName('Is_Ext_Vid').Value := cbIs_Ext_VidNo.Checked;
//  quDebt.Open;
end;

procedure TfrmAnalyze_Debit_Debt.cbIs_Ext_TipNoClick(Sender: TObject);
begin
  inherited;
  //Set_Ext_Param('Is_Ext_TipNo', cbIs_Ext_VidNo);
//  quDebt.Close;
//  quDebt.ParamByName('Is_Ext_TipNo').Value := cbIs_Ext_TipNo.Checked;
//  quDebt.Open;
end;

procedure TfrmAnalyze_Debit_Debt.cbIs_Ext_TovarNoClick(Sender: TObject);
begin
  inherited;
//  quDebt.Close;
//  quDebt.ParamByName('Is_Ext_TovarNo').Value := cbIs_Ext_TovarNo.Checked;
//  quDebt.Open;
end;

procedure TfrmAnalyze_Debit_Debt.cbIs_Ext_SotrudNoClick(Sender: TObject);
begin
  inherited;
  //Set_Ext_Param('Is_Ext_Sot', cbIs_Ext_SotrudNo);
//  quDebt.Close;
//  quDebt.ParamByName('Is_Ext_Sot').Value := cbIs_Ext_SotrudNo.Checked;
//  quDebt.Open;
end;

procedure TfrmAnalyze_Debit_Debt.cbIs_Ext_ColnPriceClick(Sender: TObject);
begin
  inherited;
//  quDebt.Close;
//  quDebt.ParamByName('Is_Ext_ColnPrice').Value :=
//    cbIs_Ext_ColnPrice.Checked;
//  quDebt.Open;
end;

procedure TfrmAnalyze_Debit_Debt.DisableParams();
begin
  Inc(DisableCount);
end;

procedure TfrmAnalyze_Debit_Debt.EnableParams();
begin
  Dec(DisableCount);
end;

procedure TfrmAnalyze_Debit_Debt.fltSotrudSelectOk(Sender: TObject);
begin
  inherited;
  if fltSotrud.Text = '' then
  begin
    quDebt.Close;
    quDebt.ParamByName('p_SotrudNo').Value := -1;
    quDebt.Open;
  end
  else
  begin
    quDebt.Close;
    quDebt.ParamByName('p_SotrudNo').Value := 1;
    quDebt.ParamByName('UserNo').Value := Data.UserNo;
    quDebt.ParamByName('SPID').Value := dmDataModule.SPID;
    quDebt.Open;
  end;
end;

procedure TfrmAnalyze_Debit_Debt.fltVidTovSelectOk(Sender: TObject);
begin
  inherited;
//  if fltVidTov.Text = '' then
//  begin
//    quDebt.Close;
//    quDebt.ParamByName('Is_Sel_Vid').Value := 0;
//    quDebt.Open;
//  end
//  else
//  begin
//    quDebt.Close;
//    quDebt.ParamByName('Is_Sel_Vid').Value := 1;
//    quDebt.ParamByName('UserNo').Value := Data.UserNo;
//    quDebt.ParamByName('SPID').Value := dmDataModule.SPID;
//    quDebt.Open;
//  end;
end;

procedure TfrmAnalyze_Debit_Debt.ShowStatusMsg(Index: Integer; Msg: string);
begin
  sbStatus.Panels[Index].Text := Msg;
end;

procedure TfrmAnalyze_Debit_Debt.ShowRecordCount(SetMaxCount: Boolean = False);
begin
  if (MaxRecordCount = 0) or SetMaxCount then
    MaxRecordCount := quDebt.RecordCount;
  if (MaxRecordCount > 0) then
  begin
    ShowStatusMsg(idCurRecordCount, Format('Записей: %d', [quDebt.RecordCount]));
    ShowStatusMsg(idMaxRecordCount, Format('Всего: %d', [MaxRecordCount]));
    ShowStatusMsg(idPercent, Format('%6.2f%%', [quDebt.RecordCount * 100 /
      MaxRecordCount]));
  end
  else
  begin
    ShowStatusMsg(0, 'Записей: 0');
    ShowStatusMsg(0, 'Всего: 0');
    ShowStatusMsg(1, '');
  end;
  ShowStatusMsg(idTime, Format(' %8.2f сек', [Tracer.LastTime]));
end;

procedure TfrmAnalyze_Debit_Debt.SetParameter(ParamName, ParamValue: string);
begin
  Temp[ExpansionIndex] := ParamName + ParamValue;
end;

procedure TfrmAnalyze_Debit_Debt.SetParameters();
begin
  SetParameter(idExpansions, IntToStr(CollectBitValues(ExpansionList)));
end;

procedure TfrmAnalyze_Debit_Debt.ApplyChanges();
var
  Expansion: Integer;
begin
  //Expansion:= CollectBitValues(ExpansionList);
  Temp.Assign(Source);
  SetParameters;  
  // Prefix is actual view name
  //CollectGroupStrings(Fields, Temp, Expansion, '');
  quDebt.SQL.Assign(Temp);
end;

procedure TfrmAnalyze_Debit_Debt.ShowScript();
begin
  with TAboutBox.Create(Application) do
  try
    with Memo1 do
    begin
      Lines.Assign(quDebt.SQL);
      Color := clSilver;
      Font.Name := 'Fixedsys';
    end;
    Caption := 'Script to be executed';
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmAnalyze_Debit_Debt.RefreshResults(SetMaxCount: Boolean = False);

  procedure UpdateParam2(ParamName: string; ValueComp: TComponent);
  begin
    if (ValueComp is TCheckBox) then
      quDebt.ParamByName(ParamName).Value := TCheckBox(ValueComp).Checked
    else if (ValueComp is TcxDateEdit) then
      quDebt.ParamByName(ParamName).Value := TcxDateEdit(ValueComp).Date;
  end;

  procedure UpdateParam1(ComboEdit: TcitDBComboEdit; ParamName: string);
  begin
    if ComboEdit.Text = '' then
    begin
      quDebt.ParamByName(ParamName).Value := 0;
    end
    else
    begin
      quDebt.ParamByName(ParamName).Value := 1;
      quDebt.ParamByName('UserNo').Value := Data.UserNo;
      quDebt.ParamByName('SPID').Value := dmDataModule.SPID;
    end;
  end;

begin
  inherited;
  Tracer.Start;
  quDebt.Close;
  UpdateParam2('p_date_end', EdDateAnalyzeEnd);
  quDebt.ParamByName('OwnerName').Value:= 'frmAnalyze_Debit_Debt';
  quDebt.Open;
  Tracer.Stop;
  ShowRecordCount(SetMaxCount);
end;

procedure TfrmAnalyze_Debit_Debt.btnRefreshClick(Sender: TObject);
var
  Ctrl_Down: Boolean;
begin
  Ctrl_Down := Ctrl_Is_Down;
  ApplyChanges;
  if Ctrl_Down then
  begin
    ShowScript;
    ExpansionIndex:= GetStartPosIndex(quDebt.SQL, idExpansions);
  end
  else
    RefreshResults;
end;

procedure TfrmAnalyze_Debit_Debt.dbgDebtsTitleBtnClick(Sender: TObject; ACol:
  Integer; Column: TColumnEh);
var
  TovarNo: integer;
begin
//  TovarNo := quAnalisPlanningOrderTovarNo.Value;
//  quDebt.Close;
//  case ACol of
//    0:
//      quDebt.MacroByName('_order').Value := 't.SotrudOtdel';
//    1:
//      quDebt.MacroByName('_order').Value := 'VidName';
//    2:
//      quDebt.MacroByName('_order').Value := 'TipName';
//    3:
//      quDebt.MacroByName('_order').Value := 'TovarName';
//    4:
//      quDebt.MacroByName('_order').Value := 't.SotrudName';
//    8:
//      quDebt.MacroByName('_order').Value := 'ColName';
//    16:
//      quDebt.MacroByName('_order').Value :=
//        'FactSumCorrection_SummaProdag';
//  end;
//
//  quDebt.Open;
//  quDebt.Locate('TovarNo', TovarNo, []);

end;

procedure TfrmAnalyze_Debit_Debt.dbgDebtsKeyPress(Sender: TObject; var Key: Char);
var
  Found: boolean;
begin
  inherited;
  if (Key in Data.SearchSet) then
  begin
    SearchString := SearchString + Key;
    Key := Chr(0);
    Found := False;
    try
      Found := dbgDebts.DataSource.DataSet.Locate(dbgDebts.Columns[dbgDebts.Col
        - 1].FieldName, SearchString, [loPartialKey, loCaseInsensitive]);
    except
      SearchString := '';
    end;
    if (not Found) and (dbgDebts.Columns[dbgDebts.Col].Field.DataType = ftString) then
      SearchString := Copy(SearchString, 1, length(SearchString) - 1);
  end;
end;

procedure TfrmAnalyze_Debit_Debt.dbgDebtsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_DOWN, VK_UP:
      SearchString := '';
  end;
end;

procedure TfrmAnalyze_Debit_Debt.btnExportToExcelClick(Sender: TObject);
var
  Settings: TFormatSettings;
begin
  inherited;
  if (dlgSaveExportToExcel.FileName = '') then
  begin
    Settings.DateSeparator := '-';
    Settings.ShortDateFormat := 'dd-mm-yy';
    dlgSaveExportToExcel.FileName := ExtractFilePath(Application.ExeName) +
      'Дебит_задолж_' + DateToStr(Date(), Settings);
  end;
  if dlgSaveExportToExcel.Execute then
  begin
    SaveDBGridEhToExportFile(TDBGridEhExportAsXLS, dbgDebts,
      dlgSaveExportToExcel.FileName, True);
    if FileExists(dlgSaveExportToExcel.FileName) then
    begin
      ShowMessage('Создан файл: ' + dlgSaveExportToExcel.FileName);
      ShowStatusMsg(idFileName, dlgSaveExportToExcel.FileName);
    end
    else
      ShowMessage('Файл ' + dlgSaveExportToExcel.FileName + ' не создан!' +
        #10#13 + 'Обратитесь к системному администратору!');
  end;
end;

procedure TfrmAnalyze_Debit_Debt.FillSourceList();
begin
  quDebt.Close;
  Source.Assign(quDebt.SQL);
end;

procedure TfrmAnalyze_Debit_Debt.FillComponentLists();

  procedure FillExpansionList();
  begin
    ExpansionList.Clear;
    ExpansionList.Add(cbIs_Ext_OtdelNo);
    ExpansionList.Add(cbIs_Ext_VidNo);
    ExpansionList.Add(cbIs_Ext_SotrudNo);
    ExpansionList.Add(cbxBuhType);
    ExpansionList.Add(cbxAgent);
    ExpansionList.Add(cbxNaklNo);
    ExpansionList.Add(cbxAddress);
  end;

  procedure FillSelectionList();
  begin
    SelectionList.Clear;
    SelectionList.Add(fltOtdel);
    SelectionList.Add(fltVidTov);
    SelectionList.Add(fltSotrud);
    SelectionList.Add(cbxBuhType);
    SelectionList.Add(fltAgent);
    SelectionList.Add(fltNaklNo);
    SelectionList.Add(fltAddress);
  end;

  procedure FillFieldList();
  begin
    Fields.Clear;
    Fields.Add(quDebtOtdelName.FieldName);
    Fields.Add(quDebtVidTovName.FieldName);
    Fields.Add(quDebtSotrudName.FieldName);
    Fields.Add(quDebtBuhName.FieldName);
    Fields.Add(quDebtName.FieldName);
    Fields.Add(quDebtNom.FieldName);
    Fields.Add(quDebtAddress.FieldName);
  end;

begin
  FillExpansionList;
  FillSelectionList;
  FillFieldList;
end;

procedure TfrmAnalyze_Debit_Debt.FormCreate(Sender: TObject);
begin
  inherited;
  Tracer := TTimeTracer.Create;
  SelectionList := TList.Create;
  ExpansionList := TList.Create;
  Source := TStringList.Create;
  Fields := TStringList.Create;
  Temp := TStringList.Create;
  FillSourceList();                             
  FillComponentLists();
  ExpansionIndex:= GetStartPosIndex(quDebt.SQL, idExpansions);
end;

procedure TfrmAnalyze_Debit_Debt.FormShow(Sender: TObject);
begin
  inherited;
  ShowRecordCount;
end;

procedure TfrmAnalyze_Debit_Debt.SetParamsBeforeOpen();
begin
//  quDebt.ParamByName('OwnerForm').Value := 'frmAnalyzeDebitDebt';
//  quDebt.ParamByName('All_Otd').Value := 'Все отделы';
//  quDebt.ParamByName('All_Vid').Value := 'Все виды';
//  quDebt.ParamByName('All_Sot').Value := 'Все сотрудники';
//  quDebt.ParamByName('AllDeparts').Value := 'AllDeparts';
//  quDebt.ParamByName('AllKinds').Value := 'AllKinds';
//  quDebt.ParamByName('AllTypes').Value := 'AllTypes';
//  quDebt.ParamByName('AllGoods').Value := 'AllGoods';
//  quDebt.ParamByName('AllWorkers').Value := 'AllWorkers';
//  quDebt.ParamByName('AllPrices').Value := 'AllPrices';

(*
@AllDeparts  = 'AllDeparts'
@AllKinds    = 'AllKinds'
@AllTypes    = 'AllTypes'
@AllGoods    = 'AllGoods'
@AllWorkers  = 'AllWorkers'
@AllPrices   = 'AllPrices'

'AllDeparts'
'AllKinds'
'AllTypes'
'AllGoods'
'AllWorkers'
'AllPrices'
*)


end;

procedure TfrmAnalyze_Debit_Debt.quDebtBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParamsBeforeOpen();
end;

procedure TfrmAnalyze_Debit_Debt.EdDateAnalyzeEndPropertiesChange(Sender: TObject);
begin
  inherited;
//  if (DisableCount <> 0) then
//    Exit;
//  quDebt.Close;
//  quDebt.ParamByName('p_date_end').Value := EdDateAnalyzeEnd.Date;
//  quDebt.Open;
end;

procedure TfrmAnalyze_Debit_Debt.FormDestroy(Sender: TObject);
begin
  inherited;
  SelectionList.Free;
  ExpansionList.Free;
  Temp.Free;
  Fields.Free;
  Source.Free;
  Tracer.Free;
end;

end.


