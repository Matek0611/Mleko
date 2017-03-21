{$DEFINE SystemMenu}
// Money
unit UMoneyCompensation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess,
  ExtCtrls, ActnList, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, citmask, citDBComboEdit,
  ComCtrls, MlekoUtils, DBCtrlsEh, rxStrHlder,
  MemTableDataEh, Grids, ValEdit, Menus, CheckLst, StrListA,
  ADODB, USortedIntList, UColumnObjects;

type


  TParamType = ( ptNone, ptUserNo, ptSPID, ptOwnerName, ptAllTypes,
                 ptExpansion, ptSelection, ptOnlyTotals,
                 ptDisableExclusion, ptUseColnPrice, ptDisableZeroSumAcn,
                 ptFormDate, ptBegDate, ptStartDate, ptVeryOld,
                 ptOrderBy, ptOrderFirst, ptOrderSecond,
                 ptEndDate);

  TSelectionType = ( stDepart, stAgent, stDocType, stDocNum, stDocDate,
                     stPayType, stWorker, stExpenseItem, stNakl);

  TParamIndexes = array[TParamType] of Integer;

  TParamKeys = array[TParamType] of string;

  TfrmMoneyCompensation = class(TCFLMLKCustomForm)
    pnlBottom: TPanel;
    Panel3: TPanel;
    dsDebt: TMSDataSource;
    quDebt: TMSQuery;
    dbgDebts: TDBGridEh;
    btnRefresh: TButton;
    btnExportToExcel: TButton;
    dlgSaveExportToExcel: TSaveDialog;
    sbStatus: TStatusBar;
    sthSource: TStrHolder;
    pnlControls: TPanel;
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
    spl3: TSplitter;
    acRefresh: TAction;
    acExportToExcel: TAction;
    pnlLeft: TPanel;
    vleDate: TValueListEditor;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    btnSettings: TButton;
    acGetSettingsDlg: TAction;
    mnuShowHide: TMenuItem;
    acToggleSettingsVisibility: TAction;
    quTest: TMSQuery;
    quDebt_key: TIntegerField;
    quDebt_Count: TIntegerField;
    quDebtID: TIntegerField;
    quDebtpkey: TStringField;
    quDebtSumma: TFloatField;
    quDebtFreeSumma: TFloatField;
    quDebt_Depart: TIntegerField;
    quDebtDepart: TStringField;
    quDebt_Agent: TSmallintField;
    quDebtAgent: TStringField;
    quDebt_DocType: TIntegerField;
    quDebtDocType: TStringField;
    quDebtDocNum: TIntegerField;
    quDebtDocDate: TDateTimeField;
    quDebt_PayType: TSmallintField;
    quDebtPayType: TStringField;
    quDebt_Worker: TIntegerField;
    quDebtWorker: TStringField;
    quDebt_Expense: TIntegerField;
    quDebtExpense: TStringField;
    quDebtDescription: TStringField;
    btnHelp: TButton;
    btnSetExPayTypes: TButton;
    sthHelp: TStrHolder;
    cbxOnlyTotals: TCheckBox;
    quDebt_FreeSumma: TFloatField;
    quDebt_DocDate: TIntegerField;
    quDebt_Summa: TFloatField;
    sthFields: TStrHolder;
    procedure dbgDebtsTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
    procedure dbgDebtsKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDebtsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
    procedure acGetSettingsDlgExecute(Sender: TObject);
    procedure mnuShowHideClick(Sender: TObject);
    procedure clbExpansionsDblClick(Sender: TObject);
    procedure acToggleSettingsVisibilityExecute(Sender: TObject);
    procedure quDebtFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure vleSelectionsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnHelpClick(Sender: TObject);
    procedure btnSetExPayTypesClick(Sender: TObject);
    procedure dbgDebtsGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure cbxOnlyTotalsClick(Sender: TObject);
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
    ColObjs: TColumnObjects;
    KeyField: TField;
    SortedKeys: TSortedIntList;
    Source, Fields, Temp, OldKeys,
    FieldVals, FieldKeys, Selections: TStringList;
    AList: TStringListArray;
    ParamList: TStrings;
    OldCol, OldDir, OldTag, RecordKey: Integer;
    DisableParamIndexes, ItemIsInteger,
    TestMode, CopySourceOnRefresh,
    DisableVerification, EnableFiltering, FirstShown: Boolean;
    OrderFullStr: String;
    OrderFullStrings: array[ptOrderFirst..ptOrderSecond] of String;
    UserParamType: TParamType;
    {$IFDEF SystemMenu}
    UseColnPrice: Boolean;
    DisableExclusion: Boolean;
    DisableZeroSumAcn: Integer;
    SysMenu: THandle;
    DisableExclusionItem: THandle;
    VisibleRowCount: Cardinal;
    {$ENDIF}
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
    procedure InsertCommands();
    procedure wmSysCommand(var Message: TMessage); message WM_SYSCOMMAND;
    procedure CopySQLParams;
    procedure CollectSQLParams;
    procedure ToggleDisableExclusionItem();
    procedure ToggleUseColnPrice();    
    procedure InputValueForDisableZeroSumAcn;
    {$ENDIF}
    function CreateSQLContainer(SetCaption: string; GetSQLText: Boolean = True): TForm;
    procedure VerifyNaklNoEditText;
    procedure VerifyCitDBComboEditText(cit: TcitDBComboEdit; ShowInStatus: Boolean = True);
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
    function SelectMLKItems(
    sel: TSelectionType; ParamName, ParamCode: string;
    SQLFilter: string = ''): Integer;
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
    function GetOrderFields(var FieldName: String; Index: Integer; EnableSortField: Boolean = True): String;
    procedure ExportToExcel;
    procedure ExecuteScript;
    procedure GetSettingsDlg;
    function MakeColumnVisible(Index: Integer;
      IsVisible: Boolean): Boolean;
    procedure ToggleShowHide;
    function GetSortField(const FieldName: String; Index: Integer): String;
    procedure GetFieldValues(Items, Keys: TStrings; DataSet: TDataSet;
      MainFieldStr, KeyFieldStr: String);
    procedure AcceptFilterValues(IntKeys: TSortedIntList;
      StrKeys: TStrings);
    procedure SortRowsByAllowedColumn(Column: TColumnEh; Dir: Integer = 0);
    procedure ClearAllSortMarkers;
    procedure ResetGridState;
    procedure FilteringEvent(Sender: TObject);
    procedure AfterColumnFilterSelection(SelCount: Integer);
    procedure RefreshFilterList(Column: TColumnEh);
    procedure ShowTotalSumValues;
    procedure VerifySelectedTextValues(sel: TSelectionType);
    function VerifySelectedTextValuesEx(sel: TSelectionType;
         CheckDataType: TVarType = varAny; UseKeyValues: Boolean = True;
         TextToKeys: Boolean = False; IntArray: PDynIntegerArray = nil): string;
    procedure VerifyNumberSelection(sel: TSelectionType);
    procedure SetDefaultOrderFullStr;
    procedure ShowHelpWindow;
    procedure SetExcludedPayTypes;
    procedure SetDefaultSelections(sel: TSelectionType;
      SelIntArray: array of Integer);
    procedure SetSelectionStrByIndex(Index: Integer; S: String);
    procedure FindOrderMarks(MarkCount: Integer; Start: TParamType);
    function EnableFieldFunc(Obj: TObject): Boolean;
    function EnableAgentKey: Boolean;
    procedure AcceptSelectedItems;
    procedure ApplyTestMode;
  public
    { Public declarations }
    procedure RefreshResults(SetMaxCount: Boolean = False);
    procedure DisableParams;
    procedure EnableParams;
  end;

var
  frmMoneyCompensation: TfrmMoneyCompensation;

implementation

uses
  data, About, StrUtils, DateUtils, 
  UFastDatasetView, USelectDateItemsDlg, UListMinusPostForDebit,
  UColumnFilterDlg, ListMinusPaymentForJournalOfExpenses;

{$R *.dfm}

type
  TBoolStrValue = string[3];

  THackGrid = class(TCustomGrid);
  THackControl = class(TControl);

const

  AllowedSumIndexes: array[0..3] of Integer = (-1, -2, -3, -4);

  AllowedFilterIndexes = [7]; // used for filtering
  AllowedIntIndexes = [5, 8, 9, 10]; // used for sorting

  AllowedIntSelectionTypes = [ stDepart, stAgent, stDocType, stDocNum,
                               stPayType, stWorker, stExpenseItem];

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
  dtBegDate = '01.02.2017';
  idOnlyTotals = 'OnlyTotals';

  idVeryOldDay = 'VeryOldDay';
  idVeryOldVal = -10000;
  idOrderBy = 'ORDER BY';
  idOrderMark = '--<order by #%d>';

  idDisableExclusion = 'DisableExclusion';
  idDisableZeroSumAcn = 'DisableZeroSumAcn';
  idUseColnPrice = 'UseColnPrice';

  idDayNaklAttr = 'накладной';
  idDayOplAttr = 'оплаты';

  //Bisque  = FFE4C4: Exchange first and last byte
  clSumBackColor: TColor = $C4E4FF;
  clSelColumnColor: TColor = $00EEEEE3;

//  idBegDate = 'p_date_nakl_beg';
//  idEndDate = 'p_date_nakl_end';

  vk_Enter = 13;
  idLocalOwnerName = 'frmAnalyzeDebitDebt';
  idParamName = 'ParamName';
  idParamValue = 'ParamValue';
  idNull = 'NULL';

  idInsertExpansions = 'INSERT INTO #Expansions Values';
  idInsertSelections = 'INSERT INTO #Selections Values';
  idInsertAllTypes = 'INSERT INTO #AllTypes Values';
  idInsert_All_Types_Values = '(' +  '''a_OtdelNo'', ''a_VidNo'', ''a_SotrudNo'', ''a_Buh'', ''a_PostNo'', ''a_NaklNo'', ''a_AddressID'', ''a_DOC_TYPE_ID'', ''a_DayNakl'', ''a_DayOpl'', ''a_DayExp'', ''a_CurHd_ID'', ''a_CurAc_ID'''+')';
  idInsertAllTypesValues = '(' + '''Все отделы'', ''Все виды'', ''Все сотрудники'', '+
   '''Все бух. типы'', ''Все контрагенты'', ''Все ном. накл.'', ' +
   '''Все адреса'', ''Все док-ты'', ''Все даты накл.'', ''Все даты опл.'', ''Все пр.'', '+
   '''Все вал. опл.'', ''Все вал. уч.'''+')';

  NaklNo_Template = 'SELECT %s, %s FROM %s WHERE %s IN (%s) and (NomReturn is NULL)';
  SQL_Template = 'SELECT %s, %s FROM %s WHERE %s IN (%s)';
  SQL_Like = 'SELECT %s, %s FROM %s WHERE %s LIKE ''%%%s%%''';

  DefExpValues : array[Boolean] of TBoolStrValue = ('0', '1');
  DefSelValues : array[Boolean] of TBoolStrValue = ('-1', '0');
  DefPrefValues : array[Boolean] of TBoolStrValue = ('', ', ');
  BoolChecks: array[Boolean] of UINT = (MF_UNCHECKED, MF_CHECKED);

  
  idDefaultSortFields = 'Depart, DocType, DocDate';
  OrderDefStrings: array[ptOrderFirst..ptOrderSecond] of String = ('Agent', 'Depart, DocType, DocDate');

  BoolStrValues: array[Boolean] of TBoolStrValue =
  //('Нет', 'Да');
  (' ', '+');

  ColumnFilterDlgAsModal: Boolean = True;

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

procedure DequoteStringItems(Items: TStrings; Dequote: Char);
var i: Integer;
begin
for i := 0 to Items.Count-1 do
  begin
    Items[i]:= AnsiDequotedStr(Trim(Items[i]), Dequote);
  end;
end;

procedure PrepareStrValues(Variables: string; Keys: TStrings; Dequote: Char = '"');
begin
  Keys.Clear;
  ExtractStrings([','], [], PAnsiChar(Variables), Keys);
  if Dequote<>#0 then
     DequoteStringItems(Keys, Dequote);
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
    if (DefValue=MaxInt) then
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
         List, Keys: TStrings; SQL: string = '';
         AsInteger: Boolean = False; MaxLength: Integer = 20;
         InitValue: Integer = -1;
         UseKeyValues: Boolean = True;
         UseKeyField: Boolean = False;
         TextToKeys: Boolean = False): Integer;
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
    s := Trim(AnsiDequotedStr(Trim(List[i]), '"'));
    List[i]:= s;
//    if AsInteger then
//    begin
//      s:= Trim(s);
//      List[i]:= s;
//    end;
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
  if Result > 0 then
  begin
    if TextToKeys and (Keys<>nil) then
       begin
         Keys.Assign(List);
         Exit;
       end;  
    Delete(Values, Length(Values), 1);
    if (SQL<>'') then t := SQL
                 else t:= SQL_Template;
    if (not AsInteger) and (Result=1) and (SQL='') then
    aSQL := Format(SQL_Like, [KeyField, TextField, Table, TextField,
            AnsiDequotedStr(Values, '''')]) else
    if UseKeyField then
    aSQL := Format(t, [KeyField, TextField, Table, KeyField, Values]) else
    aSQL := Format(t, [KeyField, TextField, Table, TextField, Values]);
    dmDataModule.OpenSQL(aSQL);
    dmDataModule.QFO.First;
    Result := 0;
    while not dmDataModule.QFO.Eof do
    begin
      s := dmDataModule.QFO.FieldByName(TextField).AsString;
      if UseKeyField then i:= Result else
      begin
        i := List.IndexOf(S);
      end;
      if (i >= 0) then
      begin
        v := dmDataModule.QFO.FieldByName(KeyField).AsInteger;
        List.Objects[i] := Pointer(v);
        if (Keys<>nil) then
              if UseKeyValues then
                 if Keys.IndexOf(IntToStr(v))<0 then
                    Keys.Add(IntToStr(v)) else else
                 if Keys.IndexOf(s)<0 then
                    Keys.AddObject(s, Pointer(v));
        Inc(Result);
      end;
      dmDataModule.QFO.Next;
    end;
    dmDataModule.QFO.Close;
  end;
end;

procedure TfrmMoneyCompensation.DisableParams();
begin
  Inc(DisableCount);
end;

procedure TfrmMoneyCompensation.EnableParams();
begin
  Dec(DisableCount);
end;

procedure TfrmMoneyCompensation.ShowStatusMsg(Index: Integer; Msg: string);
begin
  sbStatus.Panels[Index].Text := Msg;
end;

procedure TfrmMoneyCompensation.ShowTotalSumValues();
var i: Integer; ColObj: TColumnObject;
begin
  for i:= 0 to ColObjs.GetAggregatedCount-1 do
  begin
    ColObj:= ColObjs.GetAggregatedObject(i);
    ColObj.Column.Footer.Value:= FormatFloat(
    ColObj.Column.Footer.DisplayFormat, ColObjs.GetAggregatedValue(i));
  end;
end;

procedure TfrmMoneyCompensation.ShowRecordCount(SetMaxCount: Boolean = False);
//var RowCount: Integer;
begin
  if (MaxRecordCount = 0) or (quDebt.Active and (quDebt.RecordCount>MaxRecordCount)) or
     SetMaxCount then
     MaxRecordCount := quDebt.RecordCount;
  if (MaxRecordCount > 0) then
  begin
//    if not FirstShown then RowCount:= quDebt.RecordCount else

//                           RowCount:= dbgDebts.RowCount-1;
    FirstShown:= True;
    //ShowStatusMsg(idCurRecordCount, Format('Записей: %d', [quDebt.RecordCount]));
    ShowStatusMsg(idCurRecordCount, Format('Записей: %d (Показ: %d)', [quDebt.RecordCount, VisibleRowCount]));
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
//  ShowTotalSumValues();
  ShowStatusMsg(idTime, Format(' %8.2f сек', [Tracer.LastTime]));
end;

procedure TfrmMoneyCompensation.SetParameter(Index: Integer; Key, Value: string);
begin
  ParamList[Index] := idParamPrefix + Key + idParamPostfix + Value;
end;

function TfrmMoneyCompensation.SetParameterByType(ParamType: TParamType; Value:
  string): string;
begin
  if not (ParamType in [ptOrderFirst, ptOrderSecond]) then
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

procedure GetKeyAndTextFields(sel: TSelectionType; var KeyField, TextField, Table: string);
(*
ID	name	code	control_code	control_class	data_type	key_field	txt_field	select_entity_class	description	data_type_code
1	DATE                	DATE                	EDDATE              	TCITDBCOMBOEDIT               	DATE                	NULL	NULL	NULL	Дата	DATE
2	VIDOTDEL	VIDOTDEL	EDSELECT            	TCITDBCOMBOEDIT               	INT                 	OTDELNO	OTDELNAME	TMLEKOSELECTOTDELDLG	Справочник отделов	INTEGER
3	TOVAR	TOVAR	EDSELECT            	TCITDBCOMBOEDIT               	INT                 	TOVARNO	NAMETOVAR	TMLEKOSELECTTOVARDLG	Справочник товаров	INTEGER
4	POST	POST	EDSELECT            	TCITDBCOMBOEDIT               	INT                 	POSTNO	NAME	TMLEKOSELECTFIRMDLG	Справочник фирм	INTEGER
5	SOTRUD	SOTRUD	EDSELECT            	TCITDBCOMBOEDIT               	INT                 	SOTRUDNO	SOTRUDNAME	TMLEKOSELECTSOTRUDDLG	Справочник сотрудников	INTEGER
6	ADDRESSPOST	ADDRESSPOST	EDSELECT            	TCITDBCOMBOEDIT               	INT                 	ID	ADDRESS	TMlekoSelectAddressDlg	Справочник адресов	INTEGER
8	NAKLR	NAKLR	EDSELECT            	TCITDBCOMBOEDIT               	INT                 	NAKLNO	NOM	TMLEKOSELECTNAKLRDLG	Расходные накладные	INTEGER
9	_DHEAD	_DHEAD	EDSELECT            	TCITDBCOMBOEDIT               	INT                 	ID	SUB_NUM	TMLEKOSELECTDHEADDLG	Список документов	INTEGER
10	USERS	USERS	EDSELECT            	TCITDBCOMBOEDIT               	INT                 	USERNO	USERNAME	TMLEKOSELECTUSERDLG	Справочник пользователей	INTEGER
12	BOOLEAN             	BOOLEAN             	EDBOOL              	TCHECKBOX                     	BOOL                	NULL	NULL	NULL	Логическое	BOOLEAN
13	D_SECTOR_RESPONSE	D_SECTOR_RESPONSE	EDSELECT            	TCITDBCOMBOEDIT               	INT                 	ID	SECTORNAME	TMLEKOSELECTSECTORDLG	Сектора ответственности	INTEGER
14	D_ENTITY_TYPE      	D_ENTITY_TYPE      	EDSELECT            	TCITDBCOMBOEDIT               	INT                 	ID	DESCRIPTION	TMLEKOSELECTENTITYTYPEDLG	Типы сущностей	INTEGER
15	D_BUH_TYPE	D_BUH_TYPE	EDSELECT            	TCITDBCOMBOEDIT               	INT                 	BUH	BUH_TYPE_NAME	TMLEKOSELECTBUHDLG	Формы бух. сущностей	INTEGER
16	D_ACTIVITY_TYPE	D_ACTIVITY_TYPE	EDSELECT            	TCITDBCOMBOEDIT               	INT                 	ID	NAME	TMLEKOSELECTACTIVITYDLG	Вид деятельности	INTEGER
17	VIDRASHOD	VIDRASHOD	EDSELECT            	TCITDBCOMBOEDIT               	INT                 	VIDRASHODNO	VIDRASHODNAME	TMLEKOSELECTVIDRASHDLG	Статьи расходов	INTEGER
18	D_PLAT_TYPE	D_PLAT_TYPE	EDSELECT            	TCITDBCOMBOEDIT               	INT                 	ID	NAME	TMLEKOSELECTPLATTYPEDLG	Типы платежей	INTEGER
19	D_REPORT	D_REPORT	EDSELECT            	TCITDBCOMBOEDIT               	INT	ID	NAME	TMLEKOSELECTREPORTDLG	Отчеты	INTEGER
21	PLATP	PLATP	EDSELECT	TCITDBCOMBOEDIT               	INT	PLATNO	NOM	TMLEKOSELECTPLATPDLG	Приходы денег	INTEGER
22	PLATR	PLATR	EDSELECT	TCITDBCOMBOEDIT	INT	PLATNO	NOM	TMLEKOSELECTPLATRDLG	Расходы денег	INTEGER
25	D_PROP_DLG	D_PROP_DLG	EDSELECT	TCITDBCOMBOEDIT	INT	ID	NAME	TMLEKOSELECTREPORTDLG	Диалоговые формы	INTEGER
26	TEXT	TEXT	EDEDIT	TCITDBCOMBOEDIT	VARCHAR	NULL	NULL	NULL	Текстовое поле	TEXT
29	FLOAT	FLOAT	EDSELECT	TCITDBCOMBOEDIT	FLOAT	FLOAT	Float	TMLEKOSELECTFLOATDLG	Числовое поле	FLOAT
31	D_PRICE_TYPE	D_PRICE_TYPE	EDSELECT	TCITDBCOMBOEDIT	INT	COLNPRICE	COLNAME	TMLEKOSELECTPRICETYPEDLG	Типы цен	INTEGER
32	D_RESPONSE_DEPT	D_RESPONSE_DEPT	EDSELECT	TCITDBCOMBOEDIT	INT	ID	NAME	TMLEKOSELECTRESPONSEDEPTDLG	Подразделение финансовой ответсвенности	INTEGER
33	D_FIRM_PROP	D_FIRM_PROP	EDSELECT	TCITDBCOMBOEDIT	INT	ID	NAME	TMLEKOSELECTFIRMPROPDLG	Свойства фирмы	INTEGER
34	D_BLANK_REASON	D_BLANK_REASON	EDSELECT	TCITDBCOMBOEDIT	INT	ID	REASONNAME	TMLEKOSELECTREASONDLG	Основание для заказа	INTEGER
36	REGIONS	REGIONS	EDSELECT	TCITDBCOMBOEDIT	INT	REGIONNO	REGIONNAME	TMLEKOSELECTREGIONDLG	Географические районы	INTEGER
37	POST	POST_FOR_BLANK	EDSELECT	TCITDBCOMBOEDIT	INT	POSTNO	NAME	TMLEKOSELECTFIRMFORBLANKDLG	Фирмы для заказов	INTEGER
38	NaklP	NAKLP	EDSELECT	TCITDBCOMBOEDIT	INT	NAKLNO	NOM	TMLEKOSELECTNAKLPDLG	Приходные накладные	INTEGER
39	INT	INT	EDSELECT	TCITDBCOMBOEDIT	INT	NULL	NULL	TMLEKOSELECTFLOATDLG	Число	INTEGER
40	NAKLR	NAKLR_	EDSELECT            	TCITDBCOMBOEDIT               	INT                 	NAKLNO	NAKLNO	TMLEKOSELECTRASHODDLG	Номер расходной накладной	INTEGER
41	NaklP	NaklP_	EDSELECT	TCITDBCOMBOEDIT               	INT	NAKLNO	NAKLNO	TMLEKOSELECTNAKLPDLG	Номер приходной накладной	INTEGER
42	D_SET_ARTICLE_GROUP	D_SET_ARTICLE_GROUP	EDSELECT	TCITDBCOMBOEDIT               	BIGINT	ID	Name	TMLEKOSELECTARTICLEGROUPDLG	Группа товара	INTEGER
43	TOVAR_	TOVAR_	EDSELECT	TCITDBCOMBOEDIT               	INT                 	TOVARNO	NAMETOVAR	TMLEKOSELECTTOVAR1DLG	Справочник товаров по "Тайфуну"	INTEGER
44	GOODSTANDARTS	GOODSTANDARTS	EDSELECT	TCITDBCOMBOEDIT               	INT	STANDARTNO	STANDARTNAME	TMLEKOSELECTSTANDARTSDLG	Стандарты	INTEGER
45	D_CATEGORYTT	D_CATEGORYTT	EDSELECT	TCITDBCOMBOEDIT               	INT	CATEGORYTTNO	CATEGORYTTNAME	TMLEKOSELECTCATEGORYTTDLG	Категории ТТ	INTEGER
46	VIDTOV	VIDTOV	EDSELECT	TCITDBCOMBOEDIT               	INT	VIDNO	VIDNAME	TMLEKOSELECTVIDTOVDLG	Вид товара	INTEGER
47	TipTovara	TipTovara	EDSELECT	TCITDBCOMBOEDIT               	INT	TipNo	TIPNAME	TMlekoSelectTipTovaraDlg	Тип товара	INTEGER
48	VidNakl	VidNakl	EDSELECT	TCITDBCOMBOEDIT               	INT	VidNaklNo	VidNaklName	TMlekoSelectVidNaklDlg	Тип Накладной	INTEGER
49	D_BANK_INVOICE	D_BANK_INVOICE	EDSELECT	TCITDBCOMBOEDIT               	INT	Id	Bank_Name	TMlekoSelectBankInvoiceDlg	Банковский счет	INTEGER
50	POST	TovarSupplier	EDSELECT	TCITDBCOMBOEDIT               	INT	POSTNO	NAME	TMlekoSelectFIrmSupplierDlg	Поставщики	INTEGER
51	TOVAR_1	TOVAR_1	EDSELECT	TCITDBCOMBOEDIT               	INT                 	TOVARNO	NAMETOVAR	TMLEKOSELECTTOVAR2DLG	Справочник товаров по "Укрпродукту"	INTEGER
52	ReasonForUnlocking	ReasonForUnlocking	EDSELECT	TCITDBCOMBOEDIT               	INT	ReasonNo	ReasonName	TMlekoSelectReasonForUnlockingDlg	Причины разблокировки	INTEGER
*)
begin
  KeyField:= ''; TextField:= ''; Table:= '';
//  TSelectionType = ( stOtdel, stVid, stSotrud, stBuh, stPost, stNakl, stAddress,
//                     stDoc, stDayNakl, stDayOpl, stDayExp);
  case sel of
  stDepart:
    begin
      KeyField:= 'OTDELNO'; TextField:= 'OTDELNAME';
    end;
  stWorker:
    begin
      KeyField:= 'SOTRUDNO'; TextField:= 'SOTRUDNAME';
    end;
  stAgent:
    begin
      KeyField:= 'POSTNO'; TextField:= 'NAME'; Table:= 'POST';
    end;
  end;
end;

function TfrmMoneyCompensation.VerifySelectedTextValuesEx(
         sel: TSelectionType;
         CheckDataType: TVarType = varAny;
         UseKeyValues: Boolean = True;
         TextToKeys: Boolean = False;
         IntArray: PDynIntegerArray = nil): string;
var Table, Variables, KeyField, TextField: string;
    Keys: TStrings; DataType: TVarType; n: Integer;
    UseKeyField, AsInteger: Boolean; sql: String;
begin
  if (IntArray=nil) then
  begin
    Variables:= GetSelectionStrByIndex(Ord(sel));
    //Variables:= AnsiDequotedStr(Variables, '"');
    //Result:= Trim(Variables);
    PrepareStrValues(Variables, Temp, '"');
    DataType:= DetectDataTypeOfItems(Temp);
    Result:= GetDelimText(Temp, ', ', '"');    
  end else
  begin
    Result:= '';
    DataType:= varInteger;
    IntArrayToStrings(IntArray^, Temp);
    Variables:= GetDelimText(Temp, ',');
  end;
  if (DataType = varInteger) or (DataType = varString) and
  ((CheckDataType=varAny) or (CheckDataType=DataType)) then
  if (Temp.Count>0) then
  begin
    UseKeyField:= (sel<>stNakl) and (DataType=varInteger);
    GetKeyAndTextFields(sel, KeyField, TextField, Table);
    if (sel=stDocNum) then
       begin
         Keys:= AList.GetChild(Ord(sel));
         if (Keys<>nil) then Keys.Assign(Temp);
         Exit;
       end;  
    if ((KeyField<>'') and (TextField<>'')) then
    begin
      if (Table='') then
      Table:= GetEntityTable(KeyField, TextField);
      if (Table<>'') then
         begin
           if (sel=stNakl) then
              sql:= NaklNo_Template else
              sql:= SQL_Template;
           Keys:= AList.GetChild(Ord(sel));
           if (Keys=nil) then Exit;
           AsInteger:= (DataType=varInteger);
           if (CheckDataType = varAny) then UseKeyValues:= not AsInteger;
           n:= VerifyTextValues(
            Variables, Table, KeyField, TextField, Temp,
            Keys, sql, AsInteger, 20, -1,
            UseKeyValues, UseKeyField, TextToKeys);
           Result:= GetDelimText(Keys, ', ', '"');
         end;
    end;
  end;
end;

procedure TfrmMoneyCompensation.VerifySelectedTextValues(sel: TSelectionType);
begin
  VerifyTextValues(
  GetSelectionStrByIndex(Ord(stNakl)), 'NaklR', 'NaklNo', 'Nom', Temp,
  AList.GetChild(Ord(stNakl)), NaklNo_Template, True, 20, -1, False);
end;

procedure TfrmMoneyCompensation.VerifyInvoiceNumbers();
begin
  VerifyTextValues(
  GetSelectionStrByIndex(Ord(stNakl)), 'NaklR', 'NaklNo', 'Nom', Temp,
  AList.GetChild(Ord(stNakl)), NaklNo_Template, True, 20, -1, False);
end;

procedure TfrmMoneyCompensation.VerifyIntValues(sel: TSelectionType; DefValue: Integer = MaxInt);
var Child: TStrings;
begin
  Child:= AList.GetChild(Ord(sel));
  VerifyIntKeys(
  GetSelectionStrByIndex(Ord(sel)), Child, DefValue);
  if (sel=stDocDate) and (Child.Count=0) then Child.Add(IntToStr(DefValue));
end;

procedure TfrmMoneyCompensation.VerifyDateValues(sel: TSelectionType);
begin
  VerifyDateKeys(
  GetSelectionStrByIndex(Ord(sel)), AList.GetChild(Ord(sel)), StrToDate(dtDateStart));
end;

procedure TfrmMoneyCompensation.VerifyNumberSelection(sel: TSelectionType);
var Vars: string; Keys: TStrings;
begin
  Vars:= Trim(GetSelectionStrByIndex(Ord(sel)));
  if (Vars<>'') then
    Vars:= VerifySelectedTextValuesEx(sel, varInteger, True, True);
  Keys:= AList.GetChild(Ord(sel));
  if (Vars='') then Keys.Clear;
end;

procedure TfrmMoneyCompensation.VerifyEmptySelections();
var i: Integer; sel: TSelectionType;
begin
for i := 0 to AList.Count-1 do
  if (TSelectionType(i) in AllowedIntSelectionTypes) then
     VerifyNumberSelection(TSelectionType(i)) else
     begin
       sel:= TSelectionType(i);
       case sel of
         stDocDate: VerifyDateValues(sel);
       end;
     end;
end;

procedure TfrmMoneyCompensation.SetParameterByTypeEx(pt: TParamType);
var s, p: string;
begin
  p:= '';
  case pt of
//    ptAllTypes:
//    if not TestMode then
//      S := idInsertAllTypes +  idInsertAllTypesValues else
//      S := idInsertAllTypes +  idInsert_All_Types_Values;
//    ptExpansion:
//    S := idInsertExpansions + CollectBitValuesToString(clbExpansions);
    ptSelection:
    begin
      if not DisableVerification then
        VerifyEmptySelections();
      AList.TransposeToStrings(Selections, False, True, True);
      S := Trim(Selections.Text);
    end;
  end;
  if (S<>'') then
 if (not DisableParamIndexes) and (ParamIndexes[pt] > 0) then
     ParamList[ParamIndexes[pt]]:= S else
       ParamList.Add(S);
end;

procedure TfrmMoneyCompensation.ResetGridState();
begin
  ClearAllSortMarkers;
  SetDefaultOrderFullStr;
  KeyField:= nil;
  EnableFiltering:= False;
  OldCol:= -1; OldTag:= -1;
  ColObjs.ClearItems;
  SortedKeys.Clear;
end;

procedure TfrmMoneyCompensation.ApplyTestMode();
begin
  quTest.Close;
  ParamList := quTest.SQL;
  ParamList.Assign(quDebt.SQL);
end;

procedure TfrmMoneyCompensation.ApplyChanges();
begin
  if TestMode then ApplyTestMode()
     else
     begin
       RecordKey:= -1;
       quDebt.DisableControls;
       quDebt.Close;
       ParamList := quDebt.SQL;
     end;
  ResetGridState;
  SetParameters;
end;

function TfrmMoneyCompensation.CreateSQLContainer(SetCaption: string; GetSQLText:
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

procedure TfrmMoneyCompensation.ShowScript();
begin
  quTest.Close;
  try
    ViewDatasetFast('Script to be executed', quTest, False);
  finally
    quTest.Close;
  end;
end;

procedure TfrmMoneyCompensation.ExecScript();
begin
  //ExecuteScript('Results of script execution', quDebt.SQL);
  quTest.Close;
  try
    ViewDatasetFast('Results of script execution', quTest, True);
  finally
    quTest.Close;
  end;
end;

procedure TfrmMoneyCompensation.RefreshResults(SetMaxCount: Boolean = False);
begin
  inherited;
  Tracer.Start;
  ColObjs.ClearAggregItems;
  VisibleRowCount:= 0;
  if quDebt.Active then
     begin
        quDebt.Refresh;
        dbgDebts.Refresh;
     end else
  quDebt.Open;
  if (RecordKey>=0) then
  quDebt.Locate('_key', RecordKey, []);
  Tracer.Stop;
  ShowRecordCount(SetMaxCount);
  quDebt.EnableControls;
end;

procedure TfrmMoneyCompensation.SetDefaultOrderFullStr();
begin
  OrderFullStr:= idOrderBy + ' ' + idDefaultSortFields;
end;

procedure TfrmMoneyCompensation.FindOrderMarks(MarkCount: Integer; Start: TParamType);
var i, k: Integer;
begin
for i := 1 to MarkCount do
  begin
     k:= GetStartPosIndex(ParamList, Format(idOrderMark, [i]));
     if (k>0) and (k<ParamList.Count-1) then
        begin
          Inc(k);
          if AnsiStartsText(idOrderBy, ParamList[k]) then
             begin
               //OrderFullStrings[Start]:= Trim(Copy(ParamList[k], Length(idOrderBy)+1, MaxInt));
               OrderFullStrings[Start]:= idOrderBy + ' ' + OrderDefStrings[Start];
               ParamIndexes[Start]:= k;
               Inc(Start);
             end;
        end;
  end;
end;

procedure TfrmMoneyCompensation.DetectParamIndexes();
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
  ParamKeys[ptOnlyTotals] := idOnlyTotals;
  ParamKeys[ptDisableExclusion] := idDisableExclusion;
  ParamKeys[ptUseColnPrice] := idUseColnPrice;
  ParamKeys[ptDisableZeroSumAcn] := idDisableZeroSumAcn;
  ParamKeys[ptOrderBy] := idOrderBy;
  ParamKeys[ptAllTypes] := idInsertAllTypes;
  //ParamKeys[ptEndDate] := idEndDate;
//  ParamKeys[ptOwnerName] := idOwnerName;
//  ParamKeys[ptExpansion] := idExpansions;
//  ParamKeys[ptSelection] := idSelections;
  ParamList := sthSource.Strings;
//  for pt := Low(TParamType) to High(TParamType) do
//    ParamIndexes[pt] := GetStartPosIndex(ParamList, idParamPrefix + ParamKeys[pt]);
//   for pt := ptDisableExclusion to ptVeryOld do
//   ParamIndexes[pt]:= GetStartPosIndex(ParamList, idParamPrefix + ParamKeys[pt]);
   for pt := ptFormDate to ptStartDate do
   ParamIndexes[pt]:= GetStartPosIndex(ParamList, idParamPrefix + ParamKeys[pt]);

   ParamIndexes[ptOnlyTotals]:=
   GetStartPosIndex(ParamList, idParamPrefix + idOnlyTotals);

   ParamIndexes[ptOrderBy]:= GetStartPosIndex(ParamList, ParamKeys[pt], 10, False);
   SetDefaultOrderFullStr;
   FindOrderMarks(2, ptOrderFirst);

//   ParamIndexes[ptExpansion]:= GetStartPosIndex(ParamList, idInsertExpansions);
   ParamIndexes[ptSelection]:= GetStartPosIndex(ParamList, idInsertSelections);
//   ParamIndexes[ptAllTypes]:= GetStartPosIndex(ParamList, idInsertAllTypes);
end;

procedure TfrmMoneyCompensation.SetParameters();
var
  pt, ptHigh, ptLow: TParamType;
begin
  if (UserParamType=ptNone) then
     begin
       ptLow:= Low(TParamType);
       ptHigh:= High(TParamType);
     end else
     begin
       ptLow:= UserParamType;
       ptHigh:= UserParamType;
     end;
  for pt := ptLow to ptHigh do
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
//      ptBegDate:
//          //SetParameterByType(pt, GetDateStrByIndex(1, True));
//          SetParameterByType(pt, QuotedStr(dtBegDate));
      ptStartDate:
          SetParameterByType(pt, QuotedStr(dtDateStart));
//      ptVeryOld:
//          SetParameterByType(pt, IntToStr(idVeryOldVal));
      ptOnlyTotals:
            SetParameterByType(pt, IntToStr(Ord(cbxOnlyTotals.Checked)));
//      ptDisableExclusion:
//          SetParameterByType(pt, IntToStr(Ord(DisableExclusion)));
//      ptUseColnPrice:
//          SetParameterByType(pt, IntToStr(Ord(UseColnPrice)));
//      ptDisableZeroSumAcn:
//          SetParameterByType(pt, IntToStr(Ord(DisableZeroSumAcn)));
        ptOrderFirst, ptOrderSecond:
      //ptOrderBy:
      begin
//        ParamIndexes[ptOrderBy]:= GetStartPosIndex(ParamList, ParamKeys[pt], 10, False);
        SetParameterByType(pt, OrderFullStrings[pt]);
      end;
//      ptEndDate:
//          SetParameterByType(pt, GetDateStrByIndex(2, True));
      ptExpansion, ptSelection, ptAllTypes:
        SetParameterByTypeEx(pt);
    end;
end;

procedure TfrmMoneyCompensation.ExecuteScript();
var
  Ctrl_Down, Shift_Down: Boolean;
begin
  if IsColumnFilterDlgVisible() then Exit;
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

function TfrmMoneyCompensation.EnableFieldFunc (Obj: TObject): Boolean;
begin
  Result:= TField(Obj).AsInteger = 0;
end;  

function TfrmMoneyCompensation.EnableExpansion(Index: Integer): Boolean;
begin
  Result:= (Index>=0) and (Index<clbExpansions.Items.Count) and
            clbExpansions.Checked[Index];
end;

function TfrmMoneyCompensation.GetSortField(const FieldName: String; Index: Integer): String;
var Field: TField;
begin
  Result:= FieldName;
  if EnableExpansion(Index) then
     begin
       Field:= quDebt.FindField('_' + FieldName);
       if (Field<>nil) then Result:= '_' + FieldName;
     end;
end;

function TfrmMoneyCompensation.GetOrderFields(
         var FieldName: String; Index: Integer; EnableSortField: Boolean = True): String;
begin
  Result:= idDefaultSortFields;
  if EnableSortField then
  FieldName:= GetSortField(FieldName, Index);
  PrepareStrValues(OrderDefStrings[ptOrderSecond], Temp);
  Index:= GetStartPosIndex(Temp, FieldName);
  //Index:= Temp.IndexOf(FieldName);
  if (Index>=0) then Temp.Delete(Index);
  //Temp.Insert(0, FieldName);
  //Result:= Temp.CommaText;
  Result:= GetDelimText(Temp, ', ');
end;

procedure TfrmMoneyCompensation.GetFieldValues(Items, Keys: TStrings; DataSet: TDataSet; MainFieldStr, KeyFieldStr: String);
var MainField: TField; SKey: String; i, v: Integer;
begin
  Items.Clear; Keys.Clear; SortedKeys.Clear;
  if (DataSet=nil) or (not DataSet.Active) then Exit;
  DataSet.DisableControls;
  try
    DataSet.First;
    MainField:= DataSet.FindField(MainFieldStr);
    KeyField:= DataSet.FindField(KeyFieldStr);
    if (MainField<>nil) and (KeyField<>nil) and
       (MainField.DataType in [ftString, ftWideString]) and
       (KeyField.DataType in [ftSmallint, ftInteger])  then
    while not DataSet.Eof do
    begin
      SKey:= KeyField.AsString;
      v:= KeyField.AsInteger;
      if (not SortedKeys.Find(v, i)) then
      begin
        Items.AddObject(MainField.AsString, Pointer(1));
        Keys.Add(SKey);
        SortedKeys.Insert(i, v);
      end;
      DataSet.Next;
    end;
    DataSet.First;
  finally
  DataSet.EnableControls;
  end;
end;

procedure TfrmMoneyCompensation.AcceptFilterValues(IntKeys: TSortedIntList; StrKeys: TStrings);
var i: Integer;
begin
//  for i := 0 to FieldVals.Count-1 do
//  begin
//    if (FieldVals.Objects[i]=nil) then
//      IntKeys.Delete(StrToInt(StrKeys[i]));
//  end;
  IntKeys.Clear;
  for i := 0 to FieldVals.Count-1 do
  begin
    if (FieldVals.Objects[i]<>nil) then
      IntKeys.Add(StrToInt(StrKeys[i]));
  end;
end;

procedure TfrmMoneyCompensation.SortRowsByAllowedColumn(Column: TColumnEh; Dir: Integer = 0);
var
  OrderFields, MainFieldStr, KeyFieldStr: String;
  Old_Dir, Old_Col, ACol: Integer; pt: TParamType;
begin
  //Column:= dbgDebts.Columns[ACol];
  RecordKey:= -1;
//  if quDebt.Active then
//     RecordKey:= quDebt_key.AsInteger;
  ACol:= Column.Index;
  if (not quDebt.Active) or cbxOnlyTotals.Checked then Exit;
    MainFieldStr:= Column.FieldName;
    if SameText(MainFieldStr, OrderDefStrings[ptOrderFirst])
    then
    begin
      OrderFields:= '';
      pt:= ptOrderFirst;
    end else
    begin
      OrderFields:= GetOrderFields( MainFieldStr, Column.Tag,
                                    Column.Tag in AllowedIntIndexes);
      pt:= ptOrderSecond;
    end;
    Old_Dir:= OldDir; Old_Col:= OldCol;
    if (Dir<>0) then
       begin
         Old_Dir:= Dir;
         Old_Col:= -2;
       end;
    OrderFullStrings[pt]:=
    SortMSQueryInEhGrid( Old_Col, Old_Dir, ACol, ParamIndexes[pt], Column,
                         quDebt.SQL, quDebt, MainFieldStr, OrderFields, False);
    if (Dir=0) then
       begin
         OldDir:= Old_Dir;
         OldCol:= Old_Col;
       end;
    RefreshResults;
end;

procedure TfrmMoneyCompensation.ClearAllSortMarkers();
var i: Integer;
begin
for i := 0 to dbgDebts.Columns.Count-1 do
  begin
    dbgDebts.Columns[i].Title.SortMarker:= smNoneEh;
  end;
end;

procedure TfrmMoneyCompensation.AcceptSelectedItems();
var Info: TColumnObjectInfo; Keys: TStrings;
begin
  Info:= ColObjs.GetColumnObjectInfo(-1, False);
  if (Info.SortKeys<>nil) then
     begin
       Keys:= AList.GetChild(Info.Column.Tag);
       if (Keys<>nil) then
          Info.SortKeys.CopyToStrings(Keys);
     end;
end;

procedure TfrmMoneyCompensation.AfterColumnFilterSelection(SelCount: Integer);
begin
  if (SelCount>0) then
       begin
         if ColObjs.AcceptFilterValues() then
         begin
           AcceptSelectedItems();
           EnableFiltering:= True;
           DisableVerification:= True;
           TestMode:= (EnteredSecretCode()<>0);
           ApplyChanges;
           if TestMode then
              ShowScript() else
              RefreshResults();
           DisableVerification:= False;
         end;
       end;
end;

procedure TfrmMoneyCompensation.RefreshFilterList(Column: TColumnEh);
var Rect: TRect; P: PRect; Ptr: Pointer;
    Info: TColumnObjectInfo; RootName: string;
begin
  if (Column<>nil) then
    Info:= ColObjs.GetColumnObjectInfo(Column.Tag, True) else
    Info:= ColObjs.GetColumnObjectInfo(-1, True);
    //SelKeys:= ColObjs.GetFieldValues(Column.Tag, False);
    if (Info.FieldVals<>nil) and (Info.Column<>nil) then
       begin
          if (Column<>nil) then
          begin
            Rect:= dbgDebts.CellRect(Column.Index+1, 1);
            Rect.TopLeft:= dbgDebts.ClientToScreen(Point(Rect.Left, Rect.Bottom));
            Rect.BottomRight:= dbgDebts.ClientToScreen(Point(Rect.Right, Rect.Bottom));
            Ptr:= @Rect;
            RootName:= Column.Title.Caption;
          end else
          begin
            Ptr:= nil; RootName:= Info.Column.Title.Caption;
          end;
          ColumnFilterDlg( nil, Info.FieldVals, Info.QtyList,
                                RootName, Ptr,
                                True, Self.FilteringEvent, ColumnFilterDlgAsModal);
          acRefresh.Enabled:= ColumnFilterDlgAsModal;
       end;
end;

procedure TfrmMoneyCompensation.FilteringEvent(Sender: TObject);
var Option: Integer;
begin
  Option:= Integer(Sender);
  if Option>0 then
  begin
    //CloseColumnFilterDlg;
    //ResetGridState;
    OldTag:= -1;
    case Option of
    ueResetFiltering:
      begin
        acRefresh.Enabled:= True;
        ResetGridState;
        RefreshResults();
        CloseColumnFilterDlg;
      end;
    ueSortUp:
    begin
      SortRowsByAllowedColumn(ColObjs.GetCurrentColumn, -1);
      //RefreshFilterList(nil);
    end;
    ueSortDown:
    begin
      SortRowsByAllowedColumn(ColObjs.GetCurrentColumn, 1);
      //RefreshFilterList(nil);
    end;
    ueRefreshList:
        RefreshFilterList(nil);
    end
  end else
       begin
         AfterColumnFilterSelection(-Option);
         acRefresh.Enabled:= True;
         CloseColumnFilterDlg;
       end;
end;

procedure TfrmMoneyCompensation.dbgDebtsTitleBtnClick(Sender: TObject; ACol:
  Integer; Column: TColumnEh);
var
  Rect: TRect;  P: TPoint; SelCount, Old_Col, Sel_Count: Integer;
  Info: TColumnObjectInfo;
  SelKeys: TStrings;
  NewValues: Boolean;
begin
  if (not quDebt.Active) or cbxOnlyTotals.Checked then Exit;
  if (Column.Tag in AllowedFilterIndexes) then
  begin
    if IsColumnFilterDlgVisible() then Exit;
    Info:= ColObjs.GetColumnObjectInfo(Column.Tag, True);
    if (Info.FieldVals<>nil) then
         RefreshFilterList(Column);
  end else
    SortRowsByAllowedColumn(Column);
end;

procedure TfrmMoneyCompensation.dbgDebtsKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmMoneyCompensation.dbgDebtsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_DOWN, VK_UP:
      SearchString := '';
  end;
end;

procedure TfrmMoneyCompensation.ExportToExcel;
var
  Settings: TFormatSettings;
  FName: string;
begin
  inherited;
  if (dlgSaveExportToExcel.FileName = '') then
  begin
    Settings.DateSeparator := '-';
    Settings.ShortDateFormat := 'yyyy-mm-dd';
    if cbxOnlyTotals.Checked then
       FName:=  'Комп_ДС_Итоги_' else
       FName:= 'Компенсация_ДС_';
    dlgSaveExportToExcel.FileName := ExtractFilePath(Application.ExeName) +
      FName + DateToStr(Date(), Settings);
  end;
  if dlgSaveExportToExcel.Execute then
  begin
    SaveDBGridToXLSFile(dbgDebts, dlgSaveExportToExcel.FileName, True);
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


procedure TfrmMoneyCompensation.FillSourceList();
begin
  quDebt.Close;
  Source.Assign(quDebt.SQL);
end;

procedure TfrmMoneyCompensation.SetDefaultSelections(sel: TSelectionType; SelIntArray: array of Integer);
var S: string; Values: TDynIntegerArray;
    Keys: TStrings;
begin
//       "АУП", "Прочий-ДДС"
//       s:= VerifySelectedTextValuesEx(
//       sel, varAny, sel=stNakl);

  StackToDynArray(SelIntArray, Values);
  S:= VerifySelectedTextValuesEx(sel, varAny, False, False, @Values);
  if (S<>'') then
  begin
    SetSelectionStrByIndex(Ord(sel), S);
    Keys:= AList.GetChild(Ord(sel));
    StringObjectsToDynArray(Keys, Values);
    IntArrayToStrings(Values, Keys);
  end;
end;

procedure TfrmMoneyCompensation.FillComponentLists();

  procedure FillExpansionList();
  begin

  end;

  procedure FillSelectionList();
  begin
    SetDefaultSelections(stDepart, [35]);
  end;

  procedure FillArrayList();
  var i: Integer; Items: TStrings;
  begin
    Items:= vleSelections.Strings;
    AList.Clear;
  for i := 0 to Items.Count-1 do
  AList.AddItem(Items.Names[i], nil);
  end;

  procedure FillColumnObjects();
  var Columns: TDBGridColumnsEh;
      Column: TColumnEh;
  function IndexOfColumnTag(ColumnTag: Integer): Integer;
  begin
  for Result := 0 to Columns.Count-1 do
    begin
      Column:= Columns[Result];
      if Column.Tag=ColumnTag then Exit;
    end;
    Result:= -1;
  end;
  var i, n, k: Integer;
  begin
    Columns:= dbgDebts.Columns;
//    n:= 0; k:= Columns.Count;
//    for  i:= 0 to k-1 do
//    begin
//      Column:= Columns[i];
//      if (Column.Tag>0) then
//        //if (IndexOfColumnTag(i)>=0) then
//        begin
//          ColObjs.AddColumnObject(Column);
//          Inc(n);
//        end;
//    end;
//    if (n<>k) then
//       raise Exception.Create('All Expansions items should be used');
    k:= Columns.Count;
    for  i:= 0 to k-1 do
      begin
        Column:= Columns[i];
        if (Column.Tag<0) then
           ColObjs.AddColumnObject(Column, fvtSum) else
        if (Column.Tag>0) then
           ColObjs.AddColumnObject(Column);
      end;
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
//  FillExpansionList;
//  FillFieldList;
  FillArrayList();
  FillSelectionList;
  FillColumnObjects();
end;

{$IFDEF SystemMenu}
const
  idCopySQLParams = $401;
  idCollectSQLParams = $402;
  idTransposeSelections = $403;
  id_DisableExclusion = $404;
  id_DisableZeroSumAcn = $405;
  id_UseColnPrice = $406;

procedure TfrmMoneyCompensation.InsertCommands();
var
  uIDShowItem: THandle;
begin
  SysMenu := GetSystemMenu(Handle, False);
  InsertMenu(SysMenu, Word(-1), MF_SEPARATOR, WM_USER, '');
  DisableExclusionItem := THandle(InsertMenu(SysMenu, Word(-1), MF_BYPOSITION,
    id_DisableExclusion, 'Disable Exclusion'));
  InsertMenu(SysMenu, Word(-1), MF_BYPOSITION,
    id_UseColnPrice, 'Use ColnPrice');
  InsertMenu(SysMenu, Word(-1), MF_BYPOSITION,
    id_DisableZeroSumAcn, 'Disable ZeroSumAcn');
  uIDShowItem := THandle(InsertMenu(SysMenu, Word(-1), MF_BYPOSITION,
    idCollectSQLParams, 'Collect SQL Params'));
  uIDShowItem := THandle(InsertMenu(SysMenu, Word(-1), MF_BYPOSITION,
    idTransposeSelections, 'Transpose Selections'));
end;

procedure TfrmMoneyCompensation.CollectSQLParams();
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

procedure TfrmMoneyCompensation.ToggleDisableExclusionItem();
begin
  DisableExclusion:= not DisableExclusion;
  // 8 means index of menu item
  CheckMenuItem(SysMenu, 8, MF_BYPOSITION + BoolChecks[DisableExclusion]);
end;

procedure TfrmMoneyCompensation.ToggleUseColnPrice();
const Checks: array[Boolean] of UINT = (MF_UNCHECKED, MF_CHECKED);
begin
  UseColnPrice:= not UseColnPrice;
  CheckMenuItem(SysMenu, 9, MF_BYPOSITION + BoolChecks[UseColnPrice]);
end;

procedure TfrmMoneyCompensation.InputValueForDisableZeroSumAcn();
var Value: string;
begin
  Value:= IntToStr(DisableZeroSumAcn);
  if InputQuery('Input value for DisableZeroSumAcn', 'DisableZeroSumAcn', Value) then
     DisableZeroSumAcn:= StrToIntDef(Value, 0);
end;

procedure TfrmMoneyCompensation.TransposeSelections();
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

procedure TfrmMoneyCompensation.wmSysCommand(var Message: TMessage);
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
    id_DisableExclusion:
      ToggleDisableExclusionItem();
    id_UseColnPrice:
      ToggleUseColnPrice();
    id_DisableZeroSumAcn:
      InputValueForDisableZeroSumAcn();
  end;
  inherited;
end;
{$ENDIF}

procedure TfrmMoneyCompensation.cbxExpansionClick(Sender: TObject);
begin
  //cbxExpansion.Checked:= not cbxExpansion.Checked;
  //SetBoolValueInObjects(vleExpansions.Strings, vleExpansions.Tag, Integer(cbxExpansion.Checked));
end;

procedure TfrmMoneyCompensation.FormCreate(Sender: TObject);
begin
  inherited;
  Tracer := TTimeTracer.Create;
  SelectionList := TList.Create;
  ExpansionList := TList.Create;
  Source := TStringList.Create;
  Fields := TStringList.Create;
  OldKeys := TStringList.Create;
  FieldKeys := TStringList.Create;
  FieldVals := TStringList.Create;
  Fields.Sorted:= True;
  Temp := TStringList.Create;
  Selections:= TStringList.Create;
  Selections.Add(''); // make Selections.Count = 1
  AList:= TStringListArray.Create;
  SortedKeys:= TSortedIntList.Create;
  ColObjs:= TColumnObjects.Create(
            quDebt, Self.EnableExpansion, Self.EnableFieldFunc, '_Count');
  FillSourceList();
  FillComponentLists();
  DetectParamIndexes;
  {$IFDEF SystemMenu}
  InsertCommands();
  {$ENDIF}
//  DisableParams;
//  EnableParams;
  ResetGridState;
  dtPicker:= TDateTimePicker.Create(Self);
  dtPicker.Parent:= vleDate;
  dtPicker.OnChange:= Self.OnChangeDate;
  InsertChildInStringGrid(dtPicker, vleDate, 1, 1);
//  SetDefaultExpansions;
  SetDefaultDates;
  SetDefaultTransposeParams;
  SetDefaultEditStyleForSelections;
  //dtPicker:= TDateTimePicker.Create(nil);
  //dtPicker:= TDateTimePicker.CreateParented(vleDate.Handle);
  
end;

procedure TfrmMoneyCompensation.FormDestroy(Sender: TObject);
begin
  inherited;
  //dtPicker.Free;
  ColObjs.Free;
  Selections.Free;
  AList.Free;
  SelectionList.Free;
  ExpansionList.Free;
  SortedKeys.Free;
  Temp.Free;
  OldKeys.Free;
  FieldKeys.Free;
  FieldVals.Free;
  Fields.Free;
  Source.Free;
  Tracer.Free;
end;

procedure TfrmMoneyCompensation.FormShow(Sender: TObject);
begin
  inherited;
  ShowRecordCount;
end;

procedure TfrmMoneyCompensation.SetParamsBeforeOpen();
begin

end;

procedure TfrmMoneyCompensation.EdDateAnalyzeEndPropertiesChange(Sender: TObject);
begin
  inherited;
//  if (DisableCount <> 0) then
//    Exit;
//  quDebt.Close;
//  quDebt.ParamByName('p_date_end').Value := EdDateAnalyzeEnd.Date;
//  quDebt.Open;
end;

procedure TfrmMoneyCompensation.CopySQLParams;
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

procedure TfrmMoneyCompensation.VerifyCitDBComboEditText(cit: TcitDBComboEdit; ShowInStatus: Boolean = True);
var
  n: Integer;
begin
  n := VerifyTextValues(cit.Text, cit.EntityCode, cit.KeyField, cit.TextField,
    Temp, nil, '', ItemIsInteger);
  if ShowInStatus then
  ShowStatusMsg(idTime, IntToStr(n) + ': ' + GetObjectsAsIntegerList(Temp, False, ',', -1));
end;

procedure TfrmMoneyCompensation.VerifyNaklNoEditText();
begin
end;

procedure TfrmMoneyCompensation.VerifyEditText(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = vk_Enter) and (ssCtrl in Shift) and
     (Sender is TcitDBComboEdit) then
     VerifyCitDBComboEditText(Sender as TcitDBComboEdit, True);
end;

procedure TfrmMoneyCompensation.fltNaklNoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  ItemIsInteger:= True;
  VerifyEditText(Sender, Key, Shift);
  ItemIsInteger:= False;
end;

procedure TfrmMoneyCompensation.fltOtdelExit(Sender: TObject);
begin
  inherited;
  ShowStatusMsg(idTime, '');
end;

procedure TfrmMoneyCompensation.fltBuhTypePushButton(Sender: TObject);
begin
  inherited;
  with Sender as TcitDBComboEdit do
  if (SelectMLKItemsByDialog(Self, Temp, Owner, Name, EntityCode, MultiSelect)>=0) then
     Text:= Temp.CommaText;
end;

procedure TfrmMoneyCompensation.SetAllExpansions(Value: Boolean);
var i: Integer; Items: TStrings;
begin
for i := 0 to clbExpansions.Count-1 do
  clbExpansions.Checked[i]:= Value;
 //SetBoolValueInObjects(vleExpansions.Strings, i, Integer(Odd(i)));
end;

procedure TfrmMoneyCompensation.SetDefaultExpansions();
begin
  SetAllExpansions(True);
end;

procedure TfrmMoneyCompensation.SetDefaultEditStyleForSelections();
var i: Integer; Prop: TItemProp; V: Variant;
begin
for i := 0 to vleSelections.RowCount-2 do
  begin
    if ((TSelectionType(i) in [stDocNum])) then Continue;
    Prop:= vleSelections.ItemProps[i];
    Prop.EditStyle:= esEllipsis;
  end;


end;


procedure TfrmMoneyCompensation.SetDateByIndex(ADate: TDate; Index: Integer);
var i: Integer; Items: TStrings;
begin
  Items:= vleDate.Strings;
  Items.ValueFromIndex[Index]:= GetNormalDateStr(ADate);
end;

function TfrmMoneyCompensation.GetDateStrByIndex(Index: Integer; IsQuoted: Boolean = False): String;
begin
  Result:= vleDate.Strings.ValueFromIndex[Index];
  if IsQuoted then Result:= QuotedStr(Result);
end;

function TfrmMoneyCompensation.GetSelectionStrByIndex(Index: Integer; IsQuoted: Boolean = False): String;
begin
  Result:= vleSelections.Strings.ValueFromIndex[Index];
  if IsQuoted then Result:= QuotedStr(Result);
end;

procedure TfrmMoneyCompensation.SetSelectionStrByIndex(Index: Integer; S: String);
begin
  vleSelections.Values[vleSelections.Keys[Index+1]]:= S;
end;

function TfrmMoneyCompensation.GetDateByIndex(Index: Integer): TDate;
begin
  Result:= StrToDate(GetDateStrByIndex(Index));
end;

procedure TfrmMoneyCompensation.SetDefaultDates();
begin
  SetDateByIndex(IncDay(Date(), 1), 0);
  dtPicker.Date:= GetDateByIndex(0);
end;

procedure TfrmMoneyCompensation.SetDefaultTransposeParams();
begin
  AList.SetTransposeParams(', ', idNull, DefSelValues[False], idInsertSelections + '(', ')');
end;

procedure TfrmMoneyCompensation.OnChangeDate(Sender: TObject);
begin
  SetDateByIndex(dtPicker.Date, vleDate.Tag);
end;

procedure TfrmMoneyCompensation.DeleteAllSelections();
var i: Integer;
begin
for i := 1 to vleSelections.RowCount-1 do
vleSelections.Values[vleSelections.Keys[i]]:= '';
end;

function TfrmMoneyCompensation.SelectMLKItems(
sel: TSelectionType; ParamName, ParamCode: string;
SQLFilter: string = ''): Integer;
begin
  Result:= SelectMLKItemsByDialog(
           Self, Temp, idLocalOwnerName, ParamName, ParamCode, True,
           AList.GetChild(Ord(sel)), SQLFilter);
end;

function TfrmMoneyCompensation.SelectDateItems(sel: TSelectionType): Integer;
var Child: TStrings; DateAttribute: String;
begin
  Child:= AList.GetChild(Ord(sel));
  PrepareStrValues(GetSelectionStrByIndex(Ord(sel)), Temp);
  DateAttribute:= 'документа';
  Result:= SelectDateItemsDlg(Temp, Child, StrToDate(dtDateStart), DateAttribute);
end;

procedure TfrmMoneyCompensation.PushEditButtonForSelection();
const
AQuote = '';
var i, z: Integer; Items: TStrings; S, Prev: String; R: TGridRect; P: PChar;
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
  TSelectionType = ( stDepart, stAgent, stDocType,
  stDocNum, stDocDate, stPayType, stWorker, stExpenseItem);
  }
  st:= TSelectionType(i);
  Prev:= GetSelectionStrByIndex(Ord(st)) ;
  case st of
  // first item is not important
  stDepart:
     z:= SelectMLKItems(st, 'fltOtdel', 'VIDOTDEL');
  stWorker:
     z:= SelectMLKItems(st, 'fltSotrud', 'SOTRUD');
  stAgent:
     z:= SelectMLKItems(st, 'fltAgent', 'Post');
  stDocType:
     z:= SelectMLKItems(st, 'ENTITY_TYPE', 'D_ENTITY_TYPE',
     'code in (''NAKLP'',''NAKLR'',''PLATP'',''PLATR'')');
  stPayType:
     z:= SelectMLKItems(st, 'PLAT_TYPE', 'D_PLAT_TYPE');
  stExpenseItem:
     z:= SelectMLKItems(st, 'VIDRASHOD', 'VIDRASHOD');
  stDocDate:
     z:= SelectDateItems(st);
  end;
  if (z>=0) then
  begin
    //Fields.Clear;
    S:= GetDelimText(Temp, ', ', '"');
//    S:= Trim(S);
//    P:= PChar(S);
//    if (S<>'') and (not (st in [stDocDate]))
//    and (AnsiExtractQuotedStr(P, '"')='') then S:= AnsiQuotedStr(S, '"');
    //Items.ValueFromIndex[i]:= S;
    vleSelections.Values[vleSelections.Keys[vleSelections.Row]]:= S;
  end else
  vleSelections.Values[vleSelections.Keys[vleSelections.Row]]:= Prev;
end;

procedure TfrmMoneyCompensation.vleDateSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  //Offset:= GetOffsetPoint(Self, vleDate);
  //vleDate.Tag:= ARow-1;
  dtPicker.Date:= GetDateByIndex(ARow-1);
  InsertChildInStringGrid(dtPicker, vleDate, ARow, ACol);
  vleDate.Selection:= TGridRect(Rect(ACol, ARow, ACol, ARow));
  vleDate.Refresh;
  ActiveControl:= dtPicker;
  
//  Rect:= GetCellRect(vleDate, ARow, ACol);
//  ShowStatusMsg(4, Format('C:X:%d;Y:%d', [Rect.Left, Rect.Top]));
end;

procedure TfrmMoneyCompensation.mnuSet_All_Exp_FalseClick(Sender: TObject);
begin
  inherited;
  SetAllExpansions(False);
end;

procedure TfrmMoneyCompensation.mnuSet_All_Exp_TrueClick(Sender: TObject);
begin
  inherited;
  SetAllExpansions(True);
end;

procedure TfrmMoneyCompensation.mnuSetDefaultDatesClick(Sender: TObject);
begin
  inherited;
  SetDefaultDates();
end;

procedure TfrmMoneyCompensation.vleSelectionsEditButtonClick(Sender: TObject);
begin
  inherited;
  PushEditButtonForSelection();
end;

procedure TfrmMoneyCompensation.vleSelectionsDblClick(Sender: TObject);
begin
  inherited;
  PushEditButtonForSelection();
end;


procedure TfrmMoneyCompensation.mnuDeleteAllSelectionsClick(
  Sender: TObject);
begin
  inherited;
  DeleteAllSelections();
end;

procedure TfrmMoneyCompensation.clbExpansionsClickCheck(Sender: TObject);
var i: Integer;
begin
  inherited;
  if IsColumnFilterDlgVisible() then Exit;
  i:= clbExpansions.ItemIndex;
  clbExpansions.Items.Objects[i]:= Pointer(clbExpansions.Checked[i]);
end;

procedure TfrmMoneyCompensation.acRefreshExecute(Sender: TObject);
begin
  inherited;
  ExecuteScript;
end;

procedure TfrmMoneyCompensation.acExportToExcelExecute(Sender: TObject);
begin
  inherited;
  ExportToExcel();
end;

procedure TfrmMoneyCompensation.GetSettingsDlg();
begin
  inherited;
  if (frmListMinusPostForDebit=nil) then
    frmListMinusPostForDebit:= TfrmListMinusPostForDebit.Create(Application);
    frmListMinusPostForDebit.ShowModal;
    FreeAndNil(frmListMinusPostForDebit);
end;


procedure TfrmMoneyCompensation.acGetSettingsDlgExecute(Sender: TObject);
begin
  inherited;
  GetSettingsDlg();
end;

function TfrmMoneyCompensation.MakeColumnVisible(Index: Integer; IsVisible: Boolean): Boolean;
begin
  Result:= False;
  Index:= IndexOfColumnByTag(dbgDebts, Index);
  if (Index>=0) then
  begin
    dbgDebts.Columns[Index].Visible:= IsVisible;
    Result:= True;
  end;
end;

procedure TfrmMoneyCompensation.ToggleShowHide();
var IsVisible: Boolean; Index: Integer;
begin
  inherited;
  if IsColumnFilterDlgVisible() then Exit;
  begin
    with clbExpansions do
    begin
      Index:= ItemIndex;
      if (Index<0) then Exit;
      IsVisible:= not ItemEnabled[Index];
      if MakeColumnVisible(Index, IsVisible) then
          ItemEnabled[Index]:= IsVisible;
    end;
  end;
end;

procedure TfrmMoneyCompensation.mnuShowHideClick(Sender: TObject);
begin
  ToggleShowHide();
end;

procedure TfrmMoneyCompensation.clbExpansionsDblClick(Sender: TObject);
begin
  inherited;
  ToggleShowHide();
end;

procedure TfrmMoneyCompensation.acToggleSettingsVisibilityExecute(
  Sender: TObject);
begin
  inherited;
  with btnSettings do
  Visible:= not Visible;
end;

function TfrmMoneyCompensation.EnableAgentKey(): Boolean;
var _Agent, _Count, Index: Integer;
begin
  Result:= False;
  _Count:= quDebt_Count.AsInteger;
  _Agent:= quDebt_Agent.AsInteger;
  if (_Count=0) then
     begin
       if ColObjs.ValuesExist(False) then
       begin
         if not SortedKeys.Find(_Agent, Index) then
            SortedKeys.Insert(Index, _Agent);
         Result:= True;
       end;
     end else
     Result:= (SortedKeys.IndexOf(_Agent)>=0)
end;

procedure TfrmMoneyCompensation.quDebtFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  //Accept:= (not EnableFiltering); // or EnableAgentKey();
//  if Accept and (quDebt_key.AsInteger>0) then ColObjs.AggregateMainValues;
  Inc(VisibleRowCount, Ord(Accept));
end;

procedure TfrmMoneyCompensation.vleSelectionsKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var s: string; sel: TSelectionType;
begin
  inherited;
  if (Key=13) and (ssShift in Shift) then
     begin
       sel:= TSelectionType(vleSelections.Row-1);
       s:= VerifySelectedTextValuesEx(
       sel, varAny, sel=stNakl);
       if (s<>'') then
          ShowMessage(s) else
          ShowMessage('<Error>');
     end;
end;

//Платежи не учитываемые в журнале расходов

procedure TfrmMoneyCompensation.ShowHelpWindow();
begin
  ViewUserStringItems(
  sthHelp.Strings, 'Компенсация денежных средств - Описание', 'Описание', True);
end;

procedure TfrmMoneyCompensation.btnHelpClick(Sender: TObject);
begin
  inherited;
  ShowHelpWindow();
end;

procedure TfrmMoneyCompensation.SetExcludedPayTypes();
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

procedure TfrmMoneyCompensation.btnSetExPayTypesClick(Sender: TObject);
begin
  inherited;
  SetExcludedPayTypes();
end;

procedure TfrmMoneyCompensation.dbgDebtsGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if (quDebt_Count.AsInteger>0) then
  begin
    Background:= clSumBackColor;
    AFont.Style:= AFont.Style + [fsBold];
  end;
end;

procedure TfrmMoneyCompensation.cbxOnlyTotalsClick(Sender: TObject);
begin
  inherited;
  ExecuteScript();
end;

end.
