{$DEFINE SystemMenu}

(*
Дата формирования=
Начальная дата накл.=
Конечная дата накл.=
*)

unit UAnalyzeDebitDebt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess,
  ExtCtrls, ActnList, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, citCtrls, citmask, citDBComboEdit,
  DBGridEhImpExp, ComCtrls, MlekoUtils, Mask, DBCtrlsEh, rxStrHlder,
  MemTableDataEh, MemTableEh, Grids, ValEdit, Menus, CheckLst, StrListA;

type
  TParamType = ( ptUserNo, ptSPID, ptOwnerName,
                 ptExpansion, ptSelection,
                 ptFormDate, ptBegDate, ptStartDate, ptVeryOld,
                 ptOrderBy,
                 ptEndDate);

  TSelectionType = ( stOtdel, stVid, stSotrud, stBuh, stPost, stNakl, stAddress,
                     stDoc, stDayNakl, stDayOpl, stDayExp);

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
    sthSource: TStrHolder;
    quSession: TMSQuery;
    quSessionParamValue: TIntegerField;
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
    quTest: TMSQuery;
    quDebtOtdelName: TStringField;
    quDebtVidName: TStringField;
    quDebtSotrudName: TStringField;
    quDebtBuhName: TStringField;
    quDebtAgentName: TStringField;
    quDebt_NomNakl: TIntegerField;
    quDebtNomNakl: TStringField;
    quDebtPostAddress: TStringField;
    quDebtDocTypeName: TStringField;
    quDebtSumma: TFloatField;
    quDebtSummaDolg: TFloatField;
    quDebt_DateNakl: TIntegerField;
    quDebtDateNakl: TStringField;
    quDebt_DateOpl: TIntegerField;
    quDebtDateOpl: TStringField;
    quDebt_DayExp: TIntegerField;
    quDebtDayExp: TStringField;
    spl3: TSplitter;
    acRefresh: TAction;
    acExportToExcel: TAction;
    procedure dbgDebtsTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
    procedure dbgDebtsKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDebtsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    procedure mnuSet_All_Exp_FalseClick(Sender: TObject);
    procedure mnuSet_All_Exp_TrueClick(Sender: TObject);
    procedure mnuSetDefaultDatesClick(Sender: TObject);
    procedure vleSelectionsEditButtonClick(Sender: TObject);
    procedure vleSelectionsDblClick(Sender: TObject);
    procedure mnuDeleteAllSelectionsClick(Sender: TObject);
    procedure clbExpansionsClickCheck(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acExportToExcelExecute(Sender: TObject);
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
    Source, Fields, Temp, Selections: TStringList;
    AList: TStringListArray;
    ParamList: TStrings;
    OldCol, OldDir: Integer;
    DisableParamIndexes, ItemIsInteger,
    TestMode, CopySourceOnRefresh: Boolean;
    OrderFullStr: String;
    procedure ShowStatusMsg(Index: Integer; Msg: string);
    procedure ShowRecordCount(SetMaxCount: Boolean = False);
    procedure SetParamsBeforeOpen;
    procedure FillSourceList;
    procedure FillComponentLists;
    procedure ShowScript;
    procedure ApplyChanges();
    procedure SetParameters;
    procedure SetParameter(Index: Integer; Key, Value: string);
    procedure DetectParamIndexes;
    function SetParameterByType(ParamType: TParamType; Value: string): string;
    procedure SetParameterByTypeEx(pt: TParamType);

    {$IFDEF SystemMenu}
    procedure InsertCommands(SysMenu: THandle);
    procedure wmSysCommand(var Message: TMessage); message WM_SYSCOMMAND;
    procedure CopySQLParams;
    procedure CollectSQLParams;
    {$ENDIF}
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
    function SelectMLKItems(sel: TSelectionType; ParamName, ParamCode: string): Integer;
    procedure TransposeSelections;
    procedure SetDefaultTransposeParams;
    procedure ExecScript;
    function GetDateStrByIndex(Index: Integer; IsQuoted: Boolean = False): String;
    procedure VerifyInvoiceNumbers;
    function GetSelectionStrByIndex(Index: Integer;
      IsQuoted: Boolean = False): String;
    procedure VerifyEmptySelections;
    function SelectDateItems(sel: TSelectionType): Integer;
    procedure VerifyIntValues(sel: TSelectionType; DefValue: Integer = MaxInt);
    procedure VerifyDateValues(sel: TSelectionType);
    function EnableExpansion(Index: Integer): Boolean;
    function GetOrderFields(var FieldName: String; Index: Integer): String;
    procedure ExportToExcel;
    procedure ExecuteScript;
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
  data, About, StrUtils, DateUtils, CommCtrl,
  UFastDatasetView, USelectDateItemsDlg;

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
  idExpOption = 1;
  idSelOption = 2;
  idUserNo = 'UserNo';
  idNaklNo = 5;
  idSPID = 'SPID';
  idOwnerName = 'OwnerName';

  idFormDate = 'p_date_end';

  idBegDate = 'p_date_beg';
  idEndDate = 'p_date_end';
  idStartDate = 'DateStart';
  dtDateStart = '01.01.2000';
  dtBegDate = '01.01.1900';

  idVeryOldDay = 'VeryOldDay';
  idVeryOldVal = -10000;
  idOrderBy = 'ORDER BY';

//  idBegDate = 'p_date_nakl_beg';
//  idEndDate = 'p_date_nakl_end';

  vk_Enter = 13;
  idLocalOwnerName = 'frmAnalyzeDebitDebt';
  idParamName = 'ParamName';
  idParamValue = 'ParamValue';
  idNull = 'NULL';

  idInsertExpansions = 'INSERT INTO #Expansions Values';
  idInsertSelections = 'INSERT INTO #Selections Values';

  NaklNo_Template = 'SELECT %s, %s FROM %s WHERE %s IN (%s) and (NomReturn is NULL)';
  SQL_Template = 'SELECT %s, %s FROM %s WHERE %s IN (%s)';
  SQL_Like = 'SELECT %s, %s FROM %s WHERE %s LIKE ''%%%s%%''';

  DefExpValues : array[Boolean] of TBoolStrValue = ('0', '1');
  DefSelValues : array[Boolean] of TBoolStrValue = ('-1', '0');
  DefPrefValues : array[Boolean] of TBoolStrValue = ('', ', ');

  idDefaultSortFields = ' OtdelName, VidName, SotrudName, _NomNakl';

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
  Rect:= GetCellRect(Parent, Row, Col);
  with Rect do
  begin
    if AWidth=-1 then AWidth:= Bottom - Top;
    if AWidth=0 then
      Child.SetBounds(Left, Top, Right - Left, Bottom - Top) else
      Child.SetBounds(Left, Top, AWidth, Bottom - Top);
  end;
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
end;

function CollectBitValuesToString(Owner: TObject): String;
var Option: Integer;
  function GetBoolValueStr(i: Integer): String;
  begin
    case Option of
    idExpOption:
       Result := DefExpValues[TCheckListBox(Owner).Checked[i]];
    idSelOption:
      Result:= DefSelValues[TStringListArray(Owner).GetChild(i).Count>0];
    end;
  end;

var
  i, h: Integer;
begin
  Result := '';
  if (Owner is TCheckListBox) then
  begin
    Option:= idExpOption; h:= (Owner as TCheckListBox).Items.Count-1;
  end
    else
  if (Owner is TStringListArray) then
  begin
    Option:= idSelOption; h:= (Owner as TStringListArray).Count-1;
  end;
  Result:= '';
  for i := 0 to h do
    Result:= Result + GetBoolValueStr(i) + DefPrefValues[i<h];
  if (Result<>'') then
  Result:= '(' + Result + ')';
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

procedure PrepareStrValues(Variables: string; Keys: TStrings);
begin
  Keys.Clear;
  ExtractStrings([','], [' '], PAnsiChar(Variables), Keys);
end;

function VerifyIntKeys(Values: string; Keys: TStrings; DefValue: Integer = MaxInt): Integer;
var i, v, c: Integer;
begin
  Result:= 0;
  PrepareStrValues(Values, Keys);
  while (Result<Keys.Count) do
  begin
    Val(Keys[Result], v, c);
    if (c = 0) then
      Inc(Result)
    else
    if (DefValue<>MaxInt) then
       Keys.Delete(Result) else
       begin
         Keys[Result]:= IntToStr(DefValue);
         Inc(Result);
       end;
  end;
end;

function VerifyDateKeys(Values: string; Keys: TStrings; StartDate: TDate): Integer;
var i: Integer; ADate: TDate; BadDate: TDate;
begin
  PrepareStrValues(Values, Keys); Result := 0;
  BadDate:= StrToDate('01.01.1900');
  while (Result<Keys.Count) do
  begin
    ADate:= StrToDateDef(Keys[Result], BadDate);
    if (ADate<>BadDate) then
    begin
      Keys[Result]:= IntToStr(DaysBetween(StartDate, ADate));
      Inc(Result);
    end else
    Keys.Delete(Result);
  end;
end;

function VerifyTextValues(Variables, Table, KeyField, TextField: string;
         List, Keys: TStrings; SQL: string = ''; AsInteger: Boolean = False; MaxLength: Integer = 20; InitValue:
  Integer = -1): Integer;
var
  P: PAnsiChar;
  aSQL, Values, s, t: string;
  i, n, v, c, m: Integer;
begin
  Result := 0;
  List.Clear; if (Keys<>nil) then Keys.Clear;
  if Trim(Variables)='' then Exit;
  ExtractStrings([','], [], PAnsiChar(Variables), List);
  Values := '';
  n := List.Count;
  m := 0;
  for i := 0 to n - 1 do
  begin
    s := (AnsiDequotedStr(Trim(List[i]), '"'));
    if AsInteger then
    begin
      s:= Trim(s);
      List[i]:= s;
    end;
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
    if (SQL<>'') then t := SQL
                 else t:= SQL_Template;
    if (not AsInteger) and (Result=1) and (SQL='') then
    aSQL := Format(SQL_Like, [KeyField, TextField, Table, TextField, AnsiDequotedStr(Values, '''')]) else
    aSQL := Format(t, [KeyField, TextField, Table, TextField, Values]);
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
        if (Keys<>nil) then
            Keys.Add(IntToStr(v));
        Inc(Result);
      end;
      dmDataModule.QFO.Next;
    end;
    dmDataModule.QFO.Close;
  end;
end;

procedure TfrmAnalyzeDebitDebt.DisableParams();
begin
  Inc(DisableCount);
end;

procedure TfrmAnalyzeDebitDebt.EnableParams();
begin
  Dec(DisableCount);
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
  if (ParamType<>ptOrderBy) then
  Result := idParamPrefix + ParamKeys[ParamType] + idParamPostfix + Value else
  Result := Value;
  if (not DisableParamIndexes) and (ParamIndexes[ParamType] > 0) then
    ParamList[ParamIndexes[ParamType]] := Result
  else
    ParamList.Add(Result);
end;

procedure DeleteItemsInStrings(Strings: TStrings; Start, Qty: Integer);
var i: Integer;
begin
while (Qty>0) do
  begin
    i:= Start + Qty - 1;
    if (i<Strings.Count) then
       Strings.Delete(i) else
       Qty:= 1;
    Dec(Qty);
  end;
end;

procedure DeleteItemsInStringsUntilEmpty(Strings: TStrings; Start: Integer);
var i: Integer;
begin
while (Start < Strings.Count) do
  begin
  if (Trim(Strings[Start])<>'') then
       Strings.Delete(Start) else
       Break;
  end;
end;

procedure TfrmAnalyzeDebitDebt.VerifyInvoiceNumbers();
begin
  VerifyTextValues(
  GetSelectionStrByIndex(Ord(stNakl)), 'NaklR', 'NaklNo', 'Nom', Temp,
  AList.GetChild(Ord(stNakl)), NaklNo_Template, True);
end;

procedure TfrmAnalyzeDebitDebt.VerifyIntValues(sel: TSelectionType; DefValue: Integer = MaxInt);
var Child: TStrings;
begin
  Child:= AList.GetChild(Ord(sel));
  VerifyIntKeys(
  GetSelectionStrByIndex(Ord(sel)), Child, DefValue);
  if (sel=stDayExp) and (Child.Count=0) then Child.Add(IntToStr(DefValue));
end;

procedure TfrmAnalyzeDebitDebt.VerifyDateValues(sel: TSelectionType);
begin
  VerifyDateKeys(
  GetSelectionStrByIndex(Ord(sel)), AList.GetChild(Ord(sel)), StrToDate(dtDateStart));
end;

procedure TfrmAnalyzeDebitDebt.VerifyEmptySelections();
var i: Integer; sel: TSelectionType;
begin
for i := 0 to AList.Count-1 do
  if (TSelectionType(i)<>stDayExp) and (Trim(GetSelectionStrByIndex(i))='') then
     AList.GetChild(i).Clear else
     begin
       sel:= TSelectionType(i);
       case sel of
         stNakl: VerifyInvoiceNumbers;
         stDayNakl, stDayOpl: VerifyDateValues(sel);
         stDayExp: VerifyIntValues(sel, idVeryOldVal);
       end;
     end;  
end;

procedure TfrmAnalyzeDebitDebt.SetParameterByTypeEx(pt: TParamType);
var s, p: string;
begin
  p:= '';
  case pt of
    ptExpansion:
    S := idInsertExpansions + CollectBitValuesToString(clbExpansions);
    ptSelection:
    begin
//      if (not DisableParamIndexes) and (ParamIndexes[pt]>0) then
//         DeleteItemsInStringsUntilEmpty(ParamList, ParamIndexes[ptSelection]+1);
        //DeleteItemsInStrings(ParamList, ParamIndexes[ptSelection]+1, Selections.Count-1)
      //p:= Selections.Text;
      //VerifyInvoiceNumbers();
      VerifyEmptySelections();
      AList.TransposeToStrings(Selections, False, True, True);
      S := Trim(Selections.Text);
    end;
  end;
 if (not DisableParamIndexes) and (ParamIndexes[pt] > 0) then
     ParamList[ParamIndexes[pt]]:= S else
     begin
       ParamList.Add(S);
       //if (pt=ptSelection) then Selections.Text:= p;
     end;
end;

procedure TfrmAnalyzeDebitDebt.ApplyChanges();
begin
  if TestMode then
  begin
    quTest.Close;
    ParamList := quTest.SQL;
    ParamList.Assign(quDebt.SQL);
  end
     else
     begin
       quDebt.Close;
       ParamList := quDebt.SQL;
     end;
  SetParameters;
end;

function TfrmAnalyzeDebitDebt.CreateSQLContainer(SetCaption: string; GetSQLText:
  Boolean = True): TForm;
begin
  Result := TAboutBox.Create(Application);
  with TAboutBox(Result) do
  begin
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
end;

procedure TfrmAnalyzeDebitDebt.ShowScript();
begin
  quTest.Close;
  try
    ViewDatasetFast('Script to be executed', quTest, False);
  finally
    quTest.Close;
  end;
end;

procedure TfrmAnalyzeDebitDebt.ExecScript();
begin
  //ExecuteScript('Results of script execution', quDebt.SQL);
  quTest.Close;
  try
    ViewDatasetFast('Results of script execution', quTest, True);
  finally
    quTest.Close;
  end;
end;

procedure TfrmAnalyzeDebitDebt.RefreshResults(SetMaxCount: Boolean = False);
begin
  inherited;
  Tracer.Start;
  quDebt.Open;
  Tracer.Stop;
  ShowRecordCount(SetMaxCount);
end;

procedure TfrmAnalyzeDebitDebt.DetectParamIndexes();
var
  pt: TParamType;
begin
  //(ptUserNo, ptSPID, ptOwnerName, ptExpansion, ptSelection);
//  ParamKeys[ptUserNo] := idUserNo;
//  ParamKeys[ptSPID] := idSPID;
  ParamKeys[ptFormDate] := idFormDate;
  ParamKeys[ptBegDate] := idBegDate;
  ParamKeys[ptStartDate] := idStartDate;
  ParamKeys[ptVeryOld] := idVeryOldDay;
  ParamKeys[ptOrderBy] := idOrderBy;
  //ParamKeys[ptEndDate] := idEndDate;
//  ParamKeys[ptOwnerName] := idOwnerName;
//  ParamKeys[ptExpansion] := idExpansions;
//  ParamKeys[ptSelection] := idSelections;
  ParamList := sthSource.Strings;
//  for pt := Low(TParamType) to High(TParamType) do
//    ParamIndexes[pt] := GetStartPosIndex(ParamList, idParamPrefix + ParamKeys[pt]);
   for pt := ptFormDate to ptVeryOld do
   ParamIndexes[pt]:= GetStartPosIndex(ParamList, idParamPrefix + ParamKeys[pt]);

   ParamIndexes[ptOrderBy]:= GetStartPosIndex(ParamList, ParamKeys[pt], 10, False);
   OrderFullStr:= idOrderBy + ' ' + idDefaultSortFields;

   ParamIndexes[ptExpansion]:= GetStartPosIndex(ParamList, idInsertExpansions);
   ParamIndexes[ptSelection]:= GetStartPosIndex(ParamList, idInsertSelections);
end;

procedure TfrmAnalyzeDebitDebt.SetParameters();
var
  pt: TParamType;
begin
  for pt := Low(TParamType) to High(TParamType) do
    case pt of
//      ptUserNo:
//        SetParameterByType(pt, IntToStr(Data.UserNo));
//      ptSPID:
//        SetParameterByType(pt, IntToStr(dmDataModule.SPID));
//      ptOwnerName:
//        SetParameterByType(pt, QuotedStr(idLocalOwnerName));
//      ptExpansion:
//        SetParameterByType(pt, IntToStr(CollectBitValuesEx(clbExpansions)));
//      ptSelection:
//        SetParameterByType(pt, IntToStr(CollectBitValuesEx(vleSelections)));
      ptFormDate:
          SetParameterByType(pt, GetDateStrByIndex(0, True));
      ptBegDate:
          //SetParameterByType(pt, GetDateStrByIndex(1, True));
          SetParameterByType(pt, QuotedStr(dtBegDate));
      ptStartDate:
          SetParameterByType(pt, QuotedStr(dtDateStart));
      ptVeryOld:
          SetParameterByType(pt, IntToStr(idVeryOldVal));
      ptOrderBy:
      begin
        ParamIndexes[ptOrderBy]:= GetStartPosIndex(ParamList, ParamKeys[pt], 10, False);
        SetParameterByType(pt, OrderFullStr);
      end;
//      ptEndDate:
//          SetParameterByType(pt, GetDateStrByIndex(2, True));
      ptExpansion, ptSelection:
        SetParameterByTypeEx(pt);
    end;
end;

procedure TfrmAnalyzeDebitDebt.ExecuteScript();
var
  Ctrl_Down, Shift_Down: Boolean;
begin
  Ctrl_Down := Ctrl_Is_Down;
  Shift_Down:= Shift_Is_Down;
  TestMode:= Shift_Down or Ctrl_Down;
  ApplyChanges();
  if Ctrl_Down then
  begin
    ShowScript;
  end  else
  if Shift_Down then
  begin
    ExecScript;
  end
  else
    RefreshResults;
end;

function TfrmAnalyzeDebitDebt.EnableExpansion(Index: Integer): Boolean;
begin
  Result:= (Index>=0) and (Index<clbExpansions.Items.Count) and
            clbExpansions.Checked[Index];
end;

function TfrmAnalyzeDebitDebt.GetOrderFields(var FieldName: String; Index: Integer): String;
var Field: TField; i: Integer;
begin
  Result:= idDefaultSortFields;
  if EnableExpansion(Index) then
     begin
       Field:= quDebt.FindField('_' + FieldName);
       if (Field<>nil) then FieldName:= '_' + FieldName;
     end;
  PrepareStrValues(idDefaultSortFields, Temp);
  i:= Temp.IndexOf(FieldName);
  if (i>=0) then Temp.Delete(i);
  //Temp.Insert(0, FieldName);
  Result:= Temp.CommaText;
end;

procedure TfrmAnalyzeDebitDebt.dbgDebtsTitleBtnClick(Sender: TObject; ACol:
  Integer; Column: TColumnEh);
var
  OrderFields, MainField: String;
begin
  if not EnableExpansion(Column.Tag) and (Column.Tag>=0) then Exit;
  MainField:= Column.FieldName;
  OrderFields:= GetOrderFields(MainField, Column.Tag);
  OrderFullStr:=
  SortMSQueryInEhGrid( OldCol, OldDir, ACol, ParamIndexes[ptOrderBy], Column,
                       quDebt.SQL, quDebt, MainField, OrderFields, True);
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

procedure TfrmAnalyzeDebitDebt.ExportToExcel;
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

  procedure FillArrayList();
  var i: Integer; Items: TStrings;
  begin
    Items:= vleSelections.Strings;
    AList.Clear;
  for i := 0 to Items.Count-1 do
  AList.AddItem(Items.Names[i], nil);
  end;


  procedure FillFieldList();
  begin
//    Fields.Clear;
//    Fields.Add(quDebtOtdelName.FieldName);
//    Fields.Add(quDebtVidTovName.FieldName);
//    Fields.Add(quDebtSotrudName.FieldName);
//    Fields.Add(quDebtBuhName.FieldName);
//    Fields.Add(quDebtName.FieldName);
//    Fields.Add(quDebtNom.FieldName);
//    Fields.Add(quDebtAddress.FieldName);
  end;

begin
  FillExpansionList;
  FillSelectionList;
  FillFieldList;
  FillArrayList();
end;

{$IFDEF SystemMenu}
const
  idCopySQLParams = $401;
  idCollectSQLParams = $402;
  idTransposeSelections = $403;

procedure TfrmAnalyzeDebitDebt.InsertCommands(SysMenu: THandle);
var
  uIDShowItem: THandle;
begin
  if (SysMenu = 0) then
    SysMenu := GetSystemMenu(Handle, False);
  InsertMenu(SysMenu, Word(-1), MF_SEPARATOR, WM_USER, '');
  uIDShowItem := THandle(InsertMenu(SysMenu, Word(-1), MF_BYPOSITION,
    idCollectSQLParams, 'Collect SQL Params'));
  uIDShowItem := THandle(InsertMenu(SysMenu, Word(-1), MF_BYPOSITION,
    idTransposeSelections, 'Transpose Selections'));
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

procedure TfrmAnalyzeDebitDebt.TransposeSelections();
var
  Container: TForm;
begin
  Container := CreateSQLContainer('Transposed Selections', False);
  with TAboutBox(Container) do
  begin
    ParamList := Memo1.Lines;
    DisableParamIndexes := True;
    //AList.SetTransposeParamsNull;
    Memo1.Lines.Add('');
    Memo1.Lines.Add(idInsertExpansions + CollectBitValuesToString(clbExpansions));
//    if (AList.GetMaxCountInChildren()=0) then
//    Memo1.Lines.Add(idInsertSelections + CollectBitValuesToString(AList)) else
    AList.TransposeToStrings(Memo1.Lines, False, False, True);
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
      CopySQLParams();
    idCollectSQLParams:
      CollectSQLParams();
    idTransposeSelections:
      TransposeSelections();
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
  Selections:= TStringList.Create;
  Selections.Add(''); // make Selections.Count = 1
  AList:= TStringListArray.Create;
  FillSourceList();
  FillComponentLists();
  DetectParamIndexes;
  {$IFDEF SystemMenu}
  InsertCommands(0);
  {$ENDIF}
//  DisableParams;
//  EnableParams;
  dtPicker:= TDateTimePicker.Create(Self);
  dtPicker.Parent:= vleDate;
  dtPicker.OnChange:= Self.OnChangeDate;
  InsertChildInStringGrid(dtPicker, vleDate, 1, 1);
  SetDefaultExpansions;
  SetDefaultDates;
  SetDefaultTransposeParams;
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
  Selections.Free;
  AList.Free;
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
    Temp, nil, '', ItemIsInteger);
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

function TfrmAnalyzeDebitDebt.GetDateStrByIndex(Index: Integer; IsQuoted: Boolean = False): String;
begin
  Result:= vleDate.Strings.ValueFromIndex[Index];
  if IsQuoted then Result:= QuotedStr(Result);
end;

function TfrmAnalyzeDebitDebt.GetSelectionStrByIndex(Index: Integer; IsQuoted: Boolean = False): String;
begin
  Result:= vleSelections.Strings.ValueFromIndex[Index];
  if IsQuoted then Result:= QuotedStr(Result);
end;

function TfrmAnalyzeDebitDebt.GetDateByIndex(Index: Integer): TDate;
begin
  Result:= StrToDate(GetDateStrByIndex(Index));
end;

procedure TfrmAnalyzeDebitDebt.SetDefaultDates();
var
  Year, Month, Day: word;
  R: TGridRect;
begin
  {
  Дата формирования=
  Начальная дата накл.=
  }
  DecodeDate(Date(), Year, Month, Day);
  SetDateByIndex(EncodeDate(Year, Month, Day+1), 0);
  //SetDateByIndex(EncodeDate(1900, 1, 1), 1);
  //SetDateByIndex(EncodeDate(Year, Month-1, 1), 1);
  //SetDateByIndex(EncodeDate(Year, Month, Day+1), 2);
  R:= vleDate.Selection;
  dtPicker.Date:= GetDateByIndex(R.Top-1);
end;

procedure TfrmAnalyzeDebitDebt.SetDefaultTransposeParams();
begin
  AList.SetTransposeParams(', ', idNull, DefSelValues[False], idInsertSelections + '(', ')');
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

function TfrmAnalyzeDebitDebt.SelectMLKItems(sel: TSelectionType; ParamName, ParamCode: string): Integer;
begin
  Result:= SelectMLKItemsByDialog(
           Self, Temp, idLocalOwnerName, ParamName, ParamCode, True, AList.GetChild(Ord(sel)));
end;

function TfrmAnalyzeDebitDebt.SelectDateItems(sel: TSelectionType): Integer;
var Child: TStrings;
begin
  Child:= AList.GetChild(Ord(sel));
  PrepareStrValues(GetSelectionStrByIndex(Ord(sel)), Temp);
  Result:= SelectDateItemsDlg(Temp, Child, StrToDate(dtDateStart));
end;

procedure TfrmAnalyzeDebitDebt.PushEditButtonForSelection();
const
AQuote = '';
var i, z: Integer; Items: TStrings; S: String; R: TGridRect; P: PChar;
    st: TSelectionType;
begin
//  R:= vleSelections.Selection;
//  i:= R.Top-1;
//  Items:= vleSelections.Strings;
  z:= -1; S:= '';
  i:= vleSelections.Row-1;
  //S:= AnsiDequotedStr(Items.ValueFromIndex[i], '"');
  {
    TSelectionType = ( stOtdel, stVid, stSotrud, stBuh, stPost, stNakl, stAddress, stDoc,
                     stDayNakl, stDayOpl, stDayExp);
  }
  st:= TSelectionType(i);
  case st of
  stOtdel:
     z:= SelectMLKItems(st, 'fltOtdel', 'VIDOTDEL');
  stVid:
     z:= SelectMLKItems(st, 'fltVidTov', 'VIDTOV');
  stSotrud:
     z:= SelectMLKItems(st, 'fltSotrud', 'SOTRUD');
  stBuh:
     z:= SelectMLKItems(st, 'fltBuhType', 'd_buh_type');
  stPost:
     z:= SelectMLKItems(st, 'fltAgent', 'Post');
  stNakl:
     z:= SelectMLKItems(st, 'fltNaklNo', 'NaklR');
  stAddress:
     z:= SelectMLKItems(st, 'fltAddress', 'AddressPost');
  stDayNakl, stDayOpl:
     z:= SelectDateItems(st);
  end;
  if (z>=0) then
  begin
    S:= Temp.CommaText;
    S:= Trim(S);
    P:= PChar(S);
    if (S<>'') and (not (st in [stNakl, stAddress, stDayNakl, stDayOpl]))
    and (AnsiExtractQuotedStr(P, '"')='') then S:= AnsiQuotedStr(S, '"');
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

procedure TfrmAnalyzeDebitDebt.clbExpansionsClickCheck(Sender: TObject);
var i: Integer;
begin
  inherited;
  i:= clbExpansions.ItemIndex;
  clbExpansions.Items.Objects[i]:= Pointer(clbExpansions.Checked[i]);
end;

procedure TfrmAnalyzeDebitDebt.acRefreshExecute(Sender: TObject);
begin
  inherited;
  ExecuteScript;
end;

procedure TfrmAnalyzeDebitDebt.acExportToExcelExecute(Sender: TObject);
begin
  inherited;
  ExportToExcel();
end;

end.


