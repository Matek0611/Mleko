{$DEFINE SystemMenu}

unit UAnalyzeDebitDebt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess,
  ExtCtrls, ActnList, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, citCtrls, citmask, citDBComboEdit,
  DBGridEhImpExp, ComCtrls, MlekoUtils, Mask, DBCtrlsEh, rxStrHlder,
  MemTableDataEh, MemTableEh, Grids, ValEdit, Menus, CheckLst;

type
  TParamType = (ptUserNo, ptSPID, ptOwnerName, ptExpansion, ptSelection);

  TParamIndexes = array[TParamType] of Integer;

  TParamKeys = array[TParamType] of string;

  TfrmAnalyzeDebitDebt = class(TCFLMLKCustomForm)
    Panel2: TPanel;
    Panel3: TPanel;
    dsDebt: TMSDataSource;
    quDebt: TMSQuery;
    dbgDebts: TDBGridEh;
    btnRefresh: TButton;
    btnExportToExcel: TButton;
    dlgSaveExportToExcel: TSaveDialog;
    sbStatus: TStatusBar;
    quDebtOtdelName: TStringField;
    quDebtVidTovName: TStringField;
    quDebtSotrudName: TStringField;
    quDebtBuhName: TStringField;
    quDebtSumma: TFloatField;
    quDebtSummaDolg: TFloatField;
    quDebtOverSumma: TFloatField;
    quDebtDateNakl: TDateTimeField;
    quDebtDateOpl: TDateTimeField;
    quDebtSrok: TIntegerField;
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
    quDebtAddress: TStringField;
    quDebtNom: TStringField;
    sthVerify: TStrHolder;
    quSession: TMSQuery;
    quSessionParamValue: TIntegerField;
    MemTableEh1: TMemTableEh;
    pnlControls: TPanel;
    vleDate: TValueListEditor;
    spl1: TSplitter;
    spl2: TSplitter;
    vleSelections: TValueListEditor;
    pmExpansion: TPopupMenu;
    mnuSet_All_Exp_False: TMenuItem;
    mnuSet_All_Exp_True: TMenuItem;
    pmDate: TPopupMenu;
    mnuSetDefaultDates: TMenuItem;
    gbxExpansions: TGroupBox;
    clbExpansions: TCheckListBox;
    pmSelections: TPopupMenu;
    mnuDeleteAllSelections: TMenuItem;
    procedure cbIs_Ext_OtdelNoClick(Sender: TObject);
    procedure cbIs_Ext_VidNoClick(Sender: TObject);
    procedure cbIs_Ext_TipNoClick(Sender: TObject);
    procedure cbIs_Ext_TovarNoClick(Sender: TObject);
    procedure cbIs_Ext_SotrudNoClick(Sender: TObject);
    procedure cbIs_Ext_ColnPriceClick(Sender: TObject);
    procedure fltSotrudSelectOk(Sender: TObject);
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
    procedure VerifyEditText(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fltNaklNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fltOtdelExit(Sender: TObject);
    procedure fltBuhTypePushButton(Sender: TObject);
    procedure vleDateSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure vleDateMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure mnuSet_All_Exp_FalseClick(Sender: TObject);
    procedure mnuSet_All_Exp_TrueClick(Sender: TObject);
    procedure mnuSetDefaultDatesClick(Sender: TObject);
    procedure vleSelectionsEditButtonClick(Sender: TObject);
    procedure vleSelectionsDblClick(Sender: TObject);
    procedure mnuDeleteAllSelectionsClick(Sender: TObject);
  private
    { Private declarations }
    cbxExpansion: TCheckBox;
    dtPicker: TDateTimePicker;
    Tracer: TTimeTracer;
    DisableCount: Integer;
    SearchString: string;
    MaxRecordCount: Integer;
    ExpansionIndex: Integer;
    SelectionIndex: Integer;
    UserNoIndex: Integer;
    SPIDIndex: Integer;
    OwnerNameIndex: Integer;
    ParamIndexes: TParamIndexes;
    ParamKeys: TParamKeys;
    SelectionList, ExpansionList: TList;
    Source, Fields, Temp: TStringList;
    ParamList: TStrings;
    DisableParamIndexes, ItemIsInteger: Boolean;
    procedure ShowStatusMsg(Index: Integer; Msg: string);
    procedure ShowRecordCount(SetMaxCount: Boolean = False);
    procedure SetParamsBeforeOpen;
    procedure Set_Ext_Param(ParamName: string; Owner: TCheckBox);
    procedure FillSourceList;
    procedure FillComponentLists;
    procedure ShowScript;
    procedure ApplyChanges;
    procedure SetParameters;
    procedure SetParameter(Index: Integer; Key, Value: string);
    procedure DetectParamIndexes;
    function SetParameterByType(ParamType: TParamType; Value: string): string;

    {$IFDEF SystemMenu}
    procedure InsertCommands(SysMenu: THandle);
    procedure wmSysCommand(var Message: TMessage); message WM_SYSCOMMAND;
    procedure CopySQLParams;
    procedure CollectSQLParams;
    function CreateSQLContainer(SetCaption: string; GetSQLText: Boolean = True): TForm;
    procedure VerifyNaklNoEditText;
    procedure VerifyCitDBComboEditText(cit: TcitDBComboEdit; ShowInStatus: Boolean = True);
    function IsEmptyDatasetOfCitDBComboEdit(cit: TcitDBComboEdit): Boolean;
    procedure SetDefaultExpansions;
    procedure SetAllExpansions(Value: Boolean);
    procedure cbxExpansionClick(Sender: TObject);
    procedure SetDefaultDates;
    procedure SetDateByIndex(ADate: TDate; Index: Integer);
    function GetDateByIndex(Index: Integer): TDate;
    procedure OnChangeDate(Sender: TObject);
    procedure SetDefaultEditStyleForSelections;
    procedure PushEditButtonForSelection;
    procedure DeleteAllSelections;
    {$ENDIF}
  public
    { Public declarations }
    procedure RefreshResults(SetMaxCount: Boolean = False);
    procedure DisableParams;
    procedure EnableParams;
  end;

var
  frmAnalyzeDebitDebt: TfrmAnalyzeDebitDebt;

implementation

uses
  data, About, StrUtils, CommCtrl;

{$R *.dfm}

type
  TBoolStrValue = string[3];

  THackGrid = class(TCustomGrid);
  THackControl = class(TControl);

const
  idCurRecordCount = 0;
  idMaxRecordCount = 1;
  idPercent = 2;
  idTime = 3;
  idFileName = 4;
  idParamPrefix = 'SET @';
  idParamPostfix = ' = ';
  idExpansions = 'Expansions';
  idSelections = 'Selections';
  idUserNo = 'UserNo';
  idSPID = 'SPID';
  idOwnerName = 'OwnerName';
  vk_Enter = 13;
  idLocalOwnerName = 'frmAnalyzeDebitDebt';
  idParamName = 'ParamName';
  idParamValue = 'ParamValue';

  BoolStrValues: array[Boolean] of TBoolStrValue =
  //('Нет', 'Да');
  (' ', '+');


function GetNormalDateStr(ADate: TDate): String;
 var Settings: TFormatSettings;
begin
  Settings.DateSeparator := '.';
  Settings.ShortDateFormat := 'dd.mm.yyyy';
  Result:= DateToStr(ADate, Settings);
end;

function GetCellRect(Grid: TCustomGrid; Row, Col: Integer): TRect;
  var HackGrid: THackGrid;
begin
  Result := THackGrid(Grid).CellRect(Col, Row);
end;

function GetOffsetPoint(Owner, Child: TControl): TPoint;
var POwner, PChild: TPoint;
begin
  POwner:= Owner.ClientToScreen(Point(0,0));
  PChild:= Child.ClientToScreen(Point(0,0));
  Result:= Point(PChild.X - POwner.X, PChild.Y - POwner.Y);
end;


procedure InsertChildInStringGrid(
          Child: TControl; Parent: TCustomGrid; Row, Col: Integer; AWidth: Integer = 0);
var
  Rect: TRect;
begin
  //THackControl(Child).SetParent(nil); // get access to the protected method
  //Child.Visible:= False;
  //THackControl(Child).SetParent(Parent); 
  Rect:= GetCellRect(Parent, Row, Col);
//  Child.Left:= Rect.Left+2;
//  Child.Top:= Rect.Top;
//  Child.Width:= Rect.Right - Rect.Left - 4;
  // get access to the protected method
  // Retreive the rectangle of the statuspanel (in my case the second)
  //SendMessage(Parent.Handle, SB_GETRECT, 0, Integer(@Rect));
  // Position the progressbar over the panel on the statusbar
  
  with Rect do
  begin
    if AWidth=-1 then AWidth:= Bottom - Top;
    if AWidth=0 then
      Child.SetBounds(Left, Top, Right - Left, Bottom - Top) else
      Child.SetBounds(Left, Top, AWidth, Bottom - Top);
  end;
//    Child.BringToFront;
  //Child.Visible:= True;
end;

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

procedure SetBoolValueInObjects(Items: TStrings; Index: Integer; Value: Integer);
begin
  if (Value=-1) then Value:= 1-Integer(Items.Objects[Index]);
  Items.ValueFromIndex[Index]:= BoolStrValues[Boolean(Value)];
  Items.Objects[Index]:= Pointer(Value);
end;

function GetBoolValueInObjects(Items: TStrings; Index: Integer): Boolean;
begin
  Result:= Boolean(Integer(Items.Objects[Index]));
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
    if Pos(UpperCase(S), UpperCase(Trim(Source[Result]))) = 1 then
      Exit;
  end;
  Result := -1;
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

function CollectBitValuesEx(Owner: TComponent): Integer;

  function GetBoolValue(i: Integer): Boolean;
  var
    S: string;
    cit: TcitDBComboEdit;
  begin
    Result := False;
    if (Owner is TCheckListBox) then
       Result := (Owner as TCheckListBox).Checked[i] else
  if (Owner is TValueListEditor) then
      Result:= (Owner as TValueListEditor).Strings.ValueFromIndex[i]<>'';
  end;

var List: TStrings;
  i: Integer;
  b: Boolean;
begin
  Result := 0;
  if (Owner is TCheckListBox) then
     List:= (Owner as TCheckListBox).Items else
  if (Owner is TValueListEditor) then
      List:= (Owner as TValueListEditor).Strings;
  for i := 0 to List.Count - 1 do
    SetBit(@Result, i, GetBoolValue(i));
//    begin
//      b:= GetBoolValue(TComponent(List[i]));
//      if b then
//         Inc(Result, Integer(1) shl i);
//    end;
end;


function CollectBitValues(List: TList): Integer;

  function GetBoolValue(Comp: TComponent): Boolean;
  var
    S: string;
    cit: TcitDBComboEdit;
  begin
    Result := False;
    if (Comp is TCheckBox) then
      Result := (Comp as TCheckBox).Checked
    else if (Comp is TcitDBComboEdit) then
    begin
//      cit:= Comp as TcitDBComboEdit;
//      S:= cit.Text;
//      Result := Trim(S) <> '';
      Result := Trim((Comp as TcitDBComboEdit).Text) <> '';
    end;
  end;

var
  i: Integer;
  b: Boolean;
begin
  Result := 0;
  for i := 0 to List.Count - 1 do
    SetBit(@Result, i, GetBoolValue(TComponent(List[i])));
//    begin
//      b:= GetBoolValue(TComponent(List[i]));
//      if b then
//         Inc(Result, Integer(1) shl i);
//    end;
end;

function GetObjectsAsIntegerList(List: TStrings; UseStrings: Boolean = False;
  Separator: Char = ','; SkipValue: Integer = -1): string;
var
  i, v: Integer;
begin
  Result := '';
  for i := 0 to List.Count - 1 do
  begin
    V := Integer(List.Objects[i]);
    if (V <> SkipValue) then
      if UseStrings then
        Result := Result + List[i] + Separator
      else
        Result := Result + IntToStr(V) + Separator;
  end;
  if (Result <> '') then
    Delete(Result, Length(Result), 1);
end;

function VerifyTextValues(Variables, Table, KeyField, TextField: string; List:
  TStrings; AsInteger: Boolean = False; MaxLength: Integer = 20; InitValue:
  Integer = -1): Integer;
const
  SQL_Template = 'SELECT %s, %s FROM %s WHERE %s IN (%s)';
  SQL_Like = 'SELECT %s, %s FROM %s WHERE %s LIKE ''%%%s%%''';
var
  P: PAnsiChar;
  aSQL, Values, s: string;
  i, n, v, c, m: Integer;
begin
  Result := 0;
  List.Clear;
  ExtractStrings([','], [], PAnsiChar(Variables), List);
  Values := '';
  n := List.Count;
  m := 0;
  for i := 0 to n - 1 do
  begin
    s := (AnsiDequotedStr(Trim(List[i]), '"'));
    //List[i]:= s;
    c := 0;
    List.Objects[i] := Pointer(InitValue);
    if AsInteger then
      Val(s, v, c) else
      s:= QuotedStr(s);
    if (c = 0) then
    begin
      //List.Objects[i]:= Pointer(0);
      Values := Values + s + ',';
      Inc(Result);
    end;
  end;
  //1-Бруно-Худошин
  if Result > 0 then
  begin
    Delete(Values, Length(Values), 1);
    if (not AsInteger) and (Result=1) then
    aSQL := Format(SQL_Like, [KeyField, TextField, Table, TextField, AnsiDequotedStr(Values, '''')]) else
    aSQL := Format(SQL_Template, [KeyField, TextField, Table, TextField, Values]);
    dmDataModule.OpenSQL(aSQL);
    dmDataModule.QFO.First;
    Result := 0;
    while not dmDataModule.QFO.Eof do
    begin
      s := dmDataModule.QFO.FieldByName(TextField).AsString;
      i := List.IndexOf(S);
      if (i >= 0) then
      begin
        v := dmDataModule.QFO.FieldByName(KeyField).AsInteger;
        List.Objects[i] := Pointer(v);
        Inc(Result);
      end;
      dmDataModule.QFO.Next;
    end;
    dmDataModule.QFO.Close;
  end;
end;

procedure TfrmAnalyzeDebitDebt.Set_Ext_Param(ParamName: string; Owner: TCheckBox);
begin
  inherited;
//  quDebt.Close;
//  quDebt.ParamByName(ParamName).Value := Owner.Checked;
//  quDebt.Open;
end;

procedure TfrmAnalyzeDebitDebt.cbIs_Ext_OtdelNoClick(Sender: TObject);
begin
  inherited;
  //Set_Ext_Param('Is_Ext_Otd', cbIs_Ext_OtdelNo);
//  quDebt.Close;
//  quDebt.ParamByName('Is_Ext_Otd').Value := cbIs_Ext_OtdelNo.Checked;
//  quDebt.Open;
end;

procedure TfrmAnalyzeDebitDebt.cbIs_Ext_VidNoClick(Sender: TObject);
begin
  inherited;
  //Set_Ext_Param('Is_Ext_Vid', cbIs_Ext_VidNo);
//  quDebt.Close;
//  quDebt.ParamByName('Is_Ext_Vid').Value := cbIs_Ext_VidNo.Checked;
//  quDebt.Open;
end;

procedure TfrmAnalyzeDebitDebt.cbIs_Ext_TipNoClick(Sender: TObject);
begin
  inherited;
  //Set_Ext_Param('Is_Ext_TipNo', cbIs_Ext_VidNo);
//  quDebt.Close;
//  quDebt.ParamByName('Is_Ext_TipNo').Value := cbIs_Ext_TipNo.Checked;
//  quDebt.Open;
end;

procedure TfrmAnalyzeDebitDebt.cbIs_Ext_TovarNoClick(Sender: TObject);
begin
  inherited;
//  quDebt.Close;
//  quDebt.ParamByName('Is_Ext_TovarNo').Value := cbIs_Ext_TovarNo.Checked;
//  quDebt.Open;
end;

procedure TfrmAnalyzeDebitDebt.cbIs_Ext_SotrudNoClick(Sender: TObject);
begin
  inherited;
  //Set_Ext_Param('Is_Ext_Sot', cbIs_Ext_SotrudNo);
//  quDebt.Close;
//  quDebt.ParamByName('Is_Ext_Sot').Value := cbIs_Ext_SotrudNo.Checked;
//  quDebt.Open;
end;

procedure TfrmAnalyzeDebitDebt.cbIs_Ext_ColnPriceClick(Sender: TObject);
begin
  inherited;
//  quDebt.Close;
//  quDebt.ParamByName('Is_Ext_ColnPrice').Value :=
//    cbIs_Ext_ColnPrice.Checked;
//  quDebt.Open;
end;

procedure TfrmAnalyzeDebitDebt.DisableParams();
begin
  Inc(DisableCount);
end;

procedure TfrmAnalyzeDebitDebt.EnableParams();
begin
  Dec(DisableCount);
end;

procedure TfrmAnalyzeDebitDebt.fltSotrudSelectOk(Sender: TObject);
begin
  inherited;
//  if fltSotrud.Text = '' then
//  begin
//    quDebt.Close;
//    quDebt.ParamByName('p_SotrudNo').Value := -1;
//    quDebt.Open;
//  end
//  else
//  begin
//    quDebt.Close;
//    quDebt.ParamByName('p_SotrudNo').Value := 1;
//    quDebt.ParamByName('UserNo').Value := Data.UserNo;
//    quDebt.ParamByName('SPID').Value := dmDataModule.SPID;
//    quDebt.Open;
//  end;
end;

procedure TfrmAnalyzeDebitDebt.ShowStatusMsg(Index: Integer; Msg: string);
begin
  sbStatus.Panels[Index].Text := Msg;
end;

procedure TfrmAnalyzeDebitDebt.ShowRecordCount(SetMaxCount: Boolean = False);
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

procedure TfrmAnalyzeDebitDebt.SetParameter(Index: Integer; Key, Value: string);
begin
  ParamList[Index] := idParamPrefix + Key + idParamPostfix + Value;
end;

function TfrmAnalyzeDebitDebt.SetParameterByType(ParamType: TParamType; Value:
  string): string;
begin
  Result := idParamPrefix + ParamKeys[ParamType] + idParamPostfix + Value;
  if (not DisableParamIndexes) and (ParamIndexes[ParamType] > 0) then
    ParamList[ParamIndexes[ParamType]] := Result
  else
    ParamList.Add(Result);
end;

procedure TfrmAnalyzeDebitDebt.ApplyChanges();
begin
  ParamList := quDebt.SQL;
  SetParameters;

end;

function TfrmAnalyzeDebitDebt.CreateSQLContainer(SetCaption: string; GetSQLText:
  Boolean = True): TForm;
begin
  Result := TAboutBox.Create(Application);
  with TAboutBox(Result) do
    with Memo1 do
    begin
      if GetSQLText then
        Lines.Assign(quDebt.SQL)
      else
      begin
        Lines.Text := DupeString(#$D#$A, 3);
      end;
      Color := clSilver;
      Font.Name := 'Fixedsys';
    end;
  Caption := 'Script to be executed';
end;

procedure TfrmAnalyzeDebitDebt.ShowScript();
begin
  with CreateSQLContainer('Script to be executed') do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmAnalyzeDebitDebt.RefreshResults(SetMaxCount: Boolean = False);

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
 (*
SET @All_OtdelNo = 'Все отделы'
SET @All_VidNo = 'Все виды'
SET @All_SotrudNo = 'Все сотрудникаи'
SET @All_buh = 'Все бух.типы'
SET @All_PostNo = 'Все контрагенты'
SET @All_NakRNo = 'Все накладные'
SET @All_AddressID = 'Все адреса'
 *)

  inherited;
  Tracer.Start;
  quDebt.Close;
  ApplyChanges;
      quDebt.ParamByName('p_date_end').AsDate := GetDateByIndex(0);
      quDebt.ParamByName('p_date_nakl_beg').AsDate := GetDateByIndex(1);
      quDebt.ParamByName('p_date_nakl_end').AsDate := GetDateByIndex(2);

      //quDebt.ParamByName('UserNo').Value := Data.UserNo;
     //quDebt.ParamByName('SPID').Value := dmDataModule.SPID;

  //UpdateParam2('p_date_end', EdDateAnalyzeEnd);
  //quDebt.ParamByName('OwnerName').Value := 'frmAnalyze_Debit_Debt';
  quDebt.Open;
  Tracer.Stop;
  ShowRecordCount(SetMaxCount);
end;

procedure TfrmAnalyzeDebitDebt.DetectParamIndexes();
var
  pt: TParamType;
begin
  //(ptUserNo, ptSPID, ptOwnerName, ptExpansion, ptSelection);
  ParamKeys[ptUserNo] := idUserNo;
  ParamKeys[ptSPID] := idSPID;
  ParamKeys[ptOwnerName] := idOwnerName;
  ParamKeys[ptExpansion] := idExpansions;
  ParamKeys[ptSelection] := idSelections;
  ParamList := quDebt.SQL;
  for pt := Low(TParamType) to High(TParamType) do
    ParamIndexes[pt] := GetStartPosIndex(ParamList, idParamPrefix + ParamKeys[pt]);
end;

procedure TfrmAnalyzeDebitDebt.SetParameters();
var
  pt: TParamType;
begin
  for pt := Low(TParamType) to High(TParamType) do
    case pt of
      ptUserNo:
        SetParameterByType(pt, IntToStr(Data.UserNo));
      ptSPID:
        SetParameterByType(pt, IntToStr(dmDataModule.SPID));
      ptOwnerName:
        SetParameterByType(pt, QuotedStr(idLocalOwnerName));
      ptExpansion:
        SetParameterByType(pt, IntToStr(CollectBitValuesEx(clbExpansions)));
      ptSelection:
        SetParameterByType(pt, IntToStr(CollectBitValuesEx(vleSelections)));
    end;
end;

procedure TfrmAnalyzeDebitDebt.btnRefreshClick(Sender: TObject);
var
  Ctrl_Down: Boolean;
begin
  Ctrl_Down := Ctrl_Is_Down;
  ApplyChanges;
  if Ctrl_Down then
  begin
    ShowScript;
  end
  else
    RefreshResults;
end;

procedure TfrmAnalyzeDebitDebt.dbgDebtsTitleBtnClick(Sender: TObject; ACol:
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

procedure TfrmAnalyzeDebitDebt.dbgDebtsKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmAnalyzeDebitDebt.dbgDebtsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_DOWN, VK_UP:
      SearchString := '';
  end;
end;

procedure TfrmAnalyzeDebitDebt.btnExportToExcelClick(Sender: TObject);
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

procedure TfrmAnalyzeDebitDebt.FillSourceList();
begin
  quDebt.Close;
  Source.Assign(quDebt.SQL);
end;

procedure TfrmAnalyzeDebitDebt.FillComponentLists();

  procedure FillExpansionList();
  begin

  end;

  procedure FillSelectionList();
  begin

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

{$IFDEF SystemMenu}
const
  idCopySQLParams = $401;
  idCollectSQLParams = $402;

procedure TfrmAnalyzeDebitDebt.InsertCommands(SysMenu: THandle);
var
  uIDShowItem: THandle;
begin
  if (SysMenu = 0) then
    SysMenu := GetSystemMenu(Handle, False);
  InsertMenu(SysMenu, Word(-1), MF_SEPARATOR, WM_USER, '');
  uIDShowItem := THandle(InsertMenu(SysMenu, Word(-1), MF_BYPOSITION,
    idCollectSQLParams, 'Collect SQL Params'));
end;

procedure TfrmAnalyzeDebitDebt.CollectSQLParams();
var
  Container: TForm;
begin
  Container := CreateSQLContainer('Collect SQL Params', False);
  with TAboutBox(Container) do
  begin
    ParamList := Memo1.Lines;
    DisableParamIndexes := True;
    SetParameters;
    DisableParamIndexes := False;
    ShowModal;
  end;
end;

procedure TfrmAnalyzeDebitDebt.wmSysCommand(var Message: TMessage);
var
  IsCreated: Boolean;
begin
  case Message.wParam of
    idCopySQLParams:
      CopySQLParams;
    idCollectSQLParams:
      CollectSQLParams;
  end;
  inherited;
end;
{$ENDIF}

procedure TfrmAnalyzeDebitDebt.cbxExpansionClick(Sender: TObject);
begin
  //cbxExpansion.Checked:= not cbxExpansion.Checked;
  //SetBoolValueInObjects(vleExpansions.Strings, vleExpansions.Tag, Integer(cbxExpansion.Checked));
end;

procedure TfrmAnalyzeDebitDebt.FormCreate(Sender: TObject);
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
  DetectParamIndexes;
  {$IFDEF SystemMenu}
  InsertCommands(0);
  {$ENDIF}
  DisableParams;
  EnableParams;
  dtPicker:= TDateTimePicker.Create(Self);
  dtPicker.Parent:= vleDate;
  dtPicker.OnChange:= Self.OnChangeDate;
  InsertChildInStringGrid(dtPicker, vleDate, 1, 1);
  SetDefaultExpansions;
  SetDefaultDates;
  SetDefaultEditStyleForSelections;
  //dtPicker:= TDateTimePicker.Create(nil);
  //dtPicker:= TDateTimePicker.CreateParented(vleDate.Handle);
  
end;

procedure TfrmAnalyzeDebitDebt.FormShow(Sender: TObject);
begin
  inherited;
  ShowRecordCount;
end;

procedure TfrmAnalyzeDebitDebt.SetParamsBeforeOpen();
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

procedure TfrmAnalyzeDebitDebt.quDebtBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  SetParamsBeforeOpen();
end;

procedure TfrmAnalyzeDebitDebt.EdDateAnalyzeEndPropertiesChange(Sender: TObject);
begin
  inherited;
//  if (DisableCount <> 0) then
//    Exit;
//  quDebt.Close;
//  quDebt.ParamByName('p_date_end').Value := EdDateAnalyzeEnd.Date;
//  quDebt.Open;
end;

procedure TfrmAnalyzeDebitDebt.FormDestroy(Sender: TObject);
begin
  inherited;
  //dtPicker.Free;
  SelectionList.Free;
  ExpansionList.Free;
  Temp.Free;
  Fields.Free;
  Source.Free;
  Tracer.Free;
end;

procedure TfrmAnalyzeDebitDebt.CopySQLParams;
begin

end;

(*
        SetParameterByType(pt, IntToStr(Data.UserNo));
      ptSPID:
        SetParameterByType(pt, IntToStr(dmDataModule.SPID));
      ptOwnerName:
        SetParameterByType(pt, QuotedStr('frmAnalyzeDebitDebt'));
      ptExpansion:
        SetParameterByType(pt, IntToStr(CollectBitValues(ExpansionList)));
      ptSelection:
        SetParameterByType(pt, IntToStr(CollectBitValues(SelectionList)));
*)

function TfrmAnalyzeDebitDebt.IsEmptyDatasetOfCitDBComboEdit(
         cit: TcitDBComboEdit): Boolean;
begin
  quSession.Close;
  try
  try
    quSession.ParamByName(idUserNo).AsInteger:= Data.UserNo;
    quSession.ParamByName(idSPID).AsInteger:= dmDataModule.SPID;
    quSession.ParamByName(idOwnerName).AsString:= idLocalOwnerName;
    quSession.ParamByName(idParamName).AsString:= cit.Name;
    quSession.Open;
    Result:= quSession.FieldByName(idParamValue).AsInteger = 0;
  except
    Result:= True;
  end;
  finally
    quSession.Close;
  end;
  
end;

procedure TfrmAnalyzeDebitDebt.VerifyCitDBComboEditText(cit: TcitDBComboEdit; ShowInStatus: Boolean = True);
var
  n: Integer;
begin
  n := VerifyTextValues(cit.Text, cit.EntityCode, cit.KeyField, cit.TextField,
    Temp, ItemIsInteger);
  if ShowInStatus then
  ShowStatusMsg(idTime, IntToStr(n) + ': ' + GetObjectsAsIntegerList(Temp, False, ',', -1));
end;

procedure TfrmAnalyzeDebitDebt.VerifyNaklNoEditText();
begin
end;

procedure TfrmAnalyzeDebitDebt.VerifyEditText(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = vk_Enter) and (ssCtrl in Shift) and
     (Sender is TcitDBComboEdit) then
     VerifyCitDBComboEditText(Sender as TcitDBComboEdit, True);
end;

procedure TfrmAnalyzeDebitDebt.fltNaklNoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  ItemIsInteger:= True;
  VerifyEditText(Sender, Key, Shift);
  ItemIsInteger:= False;
end;

procedure TfrmAnalyzeDebitDebt.fltOtdelExit(Sender: TObject);
begin
  inherited;
  ShowStatusMsg(idTime, '');
end;

procedure TfrmAnalyzeDebitDebt.fltBuhTypePushButton(Sender: TObject);
begin
  inherited;
  with Sender as TcitDBComboEdit do
  if (SelectMLKItemsByDialog(Self, Temp, Owner, Name, EntityCode, MultiSelect)>=0) then
     Text:= Temp.CommaText;
end;

procedure TfrmAnalyzeDebitDebt.SetAllExpansions(Value: Boolean);
var i: Integer; Items: TStrings;
begin
for i := 0 to clbExpansions.Count-1 do
  clbExpansions.Checked[i]:= Value;
 //SetBoolValueInObjects(vleExpansions.Strings, i, Integer(Odd(i)));
end;

procedure TfrmAnalyzeDebitDebt.SetDefaultExpansions();
begin
  SetAllExpansions(True);
end;

procedure TfrmAnalyzeDebitDebt.SetDefaultEditStyleForSelections();
var i: Integer; Prop: TItemProp; V: Variant;
begin
for i := 0 to vleSelections.RowCount-2 do
begin
  V:= i;
  //Prop:= TItemProp.Create(vleSelections);
  //vleSelections.ItemProps[v]:= Prop;
  Prop:= vleSelections.ItemProps[i];
  Prop.EditStyle:= esEllipsis;
end;


end;


procedure TfrmAnalyzeDebitDebt.SetDateByIndex(ADate: TDate; Index: Integer);
var i: Integer; Items: TStrings;
begin
  Items:= vleDate.Strings;
  Items.ValueFromIndex[Index]:= GetNormalDateStr(ADate);
end;

function TfrmAnalyzeDebitDebt.GetDateByIndex(Index: Integer): TDate;
var i: Integer; Items: TStrings;
begin
  Items:= vleDate.Strings;
  Result:= StrToDate(Items.ValueFromIndex[Index]);
end;

procedure TfrmAnalyzeDebitDebt.SetDefaultDates();
var
  Year, Month, Day: word;
  R: TGridRect;
begin
  DecodeDate(Date(), Year, Month, Day);
  SetDateByIndex(EncodeDate(Year, Month, Day+1), 0);
  SetDateByIndex(EncodeDate(Year, Month-1, 1), 1);
  SetDateByIndex(EncodeDate(Year, Month, Day+1), 2);
  R:= vleDate.Selection;
  dtPicker.Date:= GetDateByIndex(R.Top-1);
end;

procedure TfrmAnalyzeDebitDebt.OnChangeDate(Sender: TObject);
begin
  SetDateByIndex(dtPicker.Date, vleDate.Tag);
end;

procedure TfrmAnalyzeDebitDebt.DeleteAllSelections();
var i: Integer;
begin
for i := 1 to vleSelections.RowCount-1 do
vleSelections.Values[vleSelections.Keys[i]]:= '';
end;

procedure TfrmAnalyzeDebitDebt.PushEditButtonForSelection();
const
AQuote = '';
var i, z: Integer; Items: TStrings; S: String; R: TGridRect; P: PChar;
begin
//  R:= vleSelections.Selection;
//  i:= R.Top-1;
//  Items:= vleSelections.Strings;
  i:= vleSelections.Row-1;
  //S:= AnsiDequotedStr(Items.ValueFromIndex[i], '"');
  case i of
  0:
     z:= SelectMLKItemsByDialog(Self, Temp, idLocalOwnerName, 'fltOtdel', 'VIDOTDEL');
  1:
     z:= SelectMLKItemsByDialog(Self, Temp, idLocalOwnerName, 'fltVidTov', 'VIDTOV');
  2:
     z:= SelectMLKItemsByDialog(Self, Temp, idLocalOwnerName, 'fltSotrud', 'SOTRUD');
  3:
     z:= SelectMLKItemsByDialog(Self, Temp, idLocalOwnerName, 'fltBuhType', 'd_buh_type');
  4:
     z:= SelectMLKItemsByDialog(Self, Temp, idLocalOwnerName, 'fltAgent', 'Post');
  5:
     z:= SelectMLKItemsByDialog(Self, Temp, idLocalOwnerName, 'fltNaklNo', 'NaklR');
  6:
     z:= SelectMLKItemsByDialog(Self, Temp, idLocalOwnerName, 'fltAddress', 'AddressPost');
  end;
  if (z>=0) then
  begin
    S:= Temp.CommaText;
    S:= Trim(S);
    P:= PChar(S);
    if (S<>'') and (i<>5) and (i<>6) and (AnsiExtractQuotedStr(P, '"')='') then S:= AnsiQuotedStr(S, '"');
    //Items.ValueFromIndex[i]:= S;
    vleSelections.Values[vleSelections.Keys[vleSelections.Row]]:= S;
  end;
end;

procedure TfrmAnalyzeDebitDebt.vleDateSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  //Offset:= GetOffsetPoint(Self, vleDate);
  vleDate.Tag:= ARow-1;
  dtPicker.Date:= GetDateByIndex(ARow-1);
  InsertChildInStringGrid(dtPicker, vleDate, ARow, ACol);
  vleDate.Selection:= TGridRect(Rect(ACol, ARow, ACol, ARow));
  vleDate.Refresh;
  ActiveControl:= dtPicker;
  
//  Rect:= GetCellRect(vleDate, ARow, ACol);
//  ShowStatusMsg(4, Format('C:X:%d;Y:%d', [Rect.Left, Rect.Top]));
end;

procedure TfrmAnalyzeDebitDebt.vleDateMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  //ShowStatusMsg(3, Format('M:X:%d;Y:%d', [X, Y]));
end;

procedure TfrmAnalyzeDebitDebt.mnuSet_All_Exp_FalseClick(Sender: TObject);
begin
  inherited;
  SetAllExpansions(False);
end;

procedure TfrmAnalyzeDebitDebt.mnuSet_All_Exp_TrueClick(Sender: TObject);
begin
  inherited;
  SetAllExpansions(True);
end;

procedure TfrmAnalyzeDebitDebt.mnuSetDefaultDatesClick(Sender: TObject);
begin
  inherited;
  SetDefaultDates();
end;

procedure TfrmAnalyzeDebitDebt.vleSelectionsEditButtonClick(Sender: TObject);
begin
  inherited;
  PushEditButtonForSelection();
end;

procedure TfrmAnalyzeDebitDebt.vleSelectionsDblClick(Sender: TObject);
begin
  inherited;
  PushEditButtonForSelection();
end;


procedure TfrmAnalyzeDebitDebt.mnuDeleteAllSelectionsClick(
  Sender: TObject);
begin
  inherited;
  DeleteAllSelections();
end;

end.


