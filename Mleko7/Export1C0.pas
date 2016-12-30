unit Export1C0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, ExtCtrls, StdCtrls,
  GetDate0, CFLMLKCustom, MsAccess, DB, MemDS, DBAccess, ActnList;

type

  TFieldProp = class(TCollectionItem)
  private
    ffield_name: string;
    ffield_type: string;
    ffield_default: variant;
    fvalue: variant;
  public
    property field_name: string read ffield_name write ffield_name;
    property field_type: string read ffield_type write ffield_type;
    property field_default: variant read ffield_default write ffield_default;
    property value: variant read fvalue write fvalue;
  end;

  TFieldProps = class(TCollection)
  public
    function ItemByFieldName(const Value: string): TFieldProp;
    procedure AddValue(Field_name: string; value: variant);
  end;

  TDMLScript = class(TCollectionItem)
  private
    fins_sql: string;
    fupd_sql: string;  
    fdel_sql: string;
    ftable_name: string;
    ftable_key1: string;
    ftable_key2: string; 
    ftable_key3: string;
  public
    FieldProps: TFieldProps;
    constructor Create(Collection: TCollection); overload; override;
    property ins_sql: string read fins_sql write fins_sql;
    property upd_sql: string read fupd_sql write fupd_sql;
    property del_sql: string read fdel_sql write fdel_sql;
    property table_name: string read ftable_name write ftable_name;
    property table_key1: string read ftable_key1 write ftable_key1;
    property table_key2: string read ftable_key2 write ftable_key2;
    property table_key3: string read ftable_key3 write ftable_key3;
    function GetSqlByAction(Action: string): string;
  end;

  TDMLScripts = class(TCollection)
  public
    function ItemByTableName(const Value: string): TDMLScript;
  end;

  TfmExport1C = class(TCFLMLKCustomForm)
    quPostNew: TMSQuery;
    quRashod: TMSQuery;
    quPrihod: TMSQuery;
    quNaklRNew: TMSQuery;
    quNaklPNew: TMSQuery;
    quPlatPNew: TMSQuery;
    Image1: TImage;
    Image2: TImage;
    qu1CIDContragent: TMSQuery;
    qu1CContragentUpDate: TMSQuery;
    qu1CFindBank: TMSQuery;
    qu1CBankUpDate: TMSQuery;
    qu1CIDTMC: TMSQuery;
    qu1CTMCUpDate: TMSQuery;
    qu1CPlatUpDate: TMSQuery;
    qu1CTovarPUpDate: TMSQuery;
    qu1CTovarRUpDate: TMSQuery;
    qu1CNaklPUpDate: TMSQuery;
    qu1CNaklRUpDate: TMSQuery;
    qu1CTovarPReturnUpDate: TMSQuery;
    qu1CTovarRReturnUpDate: TMSQuery;
    qu1CNaklPReturnUpDate: TMSQuery;
    qu1CNaklRReturnUpDate: TMSQuery;
    qu_1SJOURN_Update: TMSQuery;
    qu1CFindDogovor: TMSQuery;
    quTovarNew: TMSQuery;
    Label1: TLabel;
    Label2: TLabel;
    quGetCurID1C: TMSQuery;
    pr_Add_L_1C_DbBase: TMSStoredProc;
    Qu1cOurFirm: TMSQuery;
    qu_1SJOURN: TMSQuery;
    qu_entity_1c_num: TMSQuery;
    sp_set_sub_num: TMSStoredProc;
    QFO1C: TMSQuery;
    qu1cTables: TMSQuery;
    qu1cTableKeys: TMSQuery;
    pr_perebros_tranzit: TMSStoredProc;
    Table1c: TMSQuery;
    procedure quPlatPNewBeforeOpen(DataSet: TDataSet);
    procedure quNaklRNewBeforeOpen(DataSet: TDataSet);
    procedure quNaklPNewBeforeOpen(DataSet: TDataSet);
    procedure quRashodBeforeOpen(DataSet: TDataSet);
    procedure quPrihodBeforeOpen(DataSet: TDataSet);
    procedure quPostNewBeforeOpen(DataSet: TDataSet);
    procedure quTovarNewBeforeOpen(DataSet: TDataSet);
  private
    DMLScripts: TDMLScripts;
  public
    DateExport: TDate;
    PartiaID, EdIzmID: string;
    Firma, Kassir, Otpustil, Sklad: string;
    KontragentGroup, TMCGroup, TMCTaraGroup, SP940, SP1029, SP958, SP1298, SP164, SP166: string;
    Period: TPeriodDate;

    s_ins_1SJOURN, s_upd_1SJOURN, s_del_1SJOURN: string;
    s_ins_naklp, s_upd_naklp, s_del_naklp: string;
    s_ins_prihod, s_upd_prihod, s_del_prihod: string;
    s_ins_naklp_r, s_upd_naklp_r, s_del_naklp_r: string;
    s_ins_prihod_r, s_upd_prihod_r, s_del_prihod_r: string;

    class procedure Export1C;
    procedure KontragentNew;
    procedure TMCNew(is_tara: boolean);
    procedure PKONew;
    procedure NaklR;
    procedure NaklP;
    function GetNextId(s: string): string;
    procedure SaveExport1cEntity(ID_1C, TABLE_1C, ID_FIELD_NAME_1C: string;
      pkey: Int64; table_name: string);

    function GetCurID1C(typeid: Integer): string;
    function GetDogovor1C(PostID: string): string;
    function Modify_1SJOURN(var IDDOC: string; Action: string; IDDOCDEF:
      Integer; p_date: Tdate; source: string; entityno: integer): string;
    function Set_1SUIDCTL_Next_ID(typeid: Integer): string;
    procedure SetDocOurFirm1c(ID1C: string);
    procedure Gen_table_sql(const table_name: string; DmlScript: TDMLScript);
    procedure Gen_update_sql(const table_name: string; param_values: TFieldProps);
    procedure ExecSql(table_name: string; param_values: TFieldProps; Action: string);
    procedure set_param_value(params: Tstrings; param_types: TStrings; pname: string; pvalue: Variant; ptype: string);
    function fill_dml_collection: TDMLScripts;
  end;

implementation

uses data, main;
{$R *.dfm}

class procedure TfmExport1C.Export1C;
var
  fmExport1C: TfmExport1C;
  our_firm_okpo: string;
begin
  {
  SC174 - Контрагенты
  _1SJOURN - Журналы все (Там же наша фирма)
  _1SUIDCTL - Последний вставленный ID для таблицы по typeid (int)
  DH1081- Банковские выиски DT1081  - спецификация
    type_id - table
    0 - журналы
  }

  Screen.Cursor := crHourGlass;
  fmExport1C := TfmExport1C.Create(Application);
  try
    with fmexport1c do
    begin
      fmExport1C.s_ins_1SJOURN := '';
      fmExport1C.s_upd_1SJOURN := '';
      fmExport1C.s_del_1SJOURN := '';
      s_ins_naklp := '';
      s_upd_naklp := '';
      s_del_naklp := '';
      s_ins_prihod := '';
      s_upd_prihod := '';
      s_del_prihod := '';

      s_ins_naklp_r := '';
      s_upd_naklp_r := '';
      s_del_naklp_r := '';
      s_ins_prihod_r := '';
      s_upd_prihod_r := '';
      s_del_prihod_r := '';
      DMLScripts := fill_dml_collection;
    end;
    fmExport1C.Show;
    fmExport1C.Period := ZapDate(3);
    if fmExport1C.Period[1] = 0 then Exit;
    fmExport1C.pr_perebros_tranzit.Close;
    fmExport1C.pr_perebros_tranzit.ParamByName('DateNaklBeg').AsDate := fmExport1C.Period[1];
    fmExport1C.pr_perebros_tranzit.ParamByName('DateNaklEnd').AsDate := fmExport1C.Period[2];
    fmExport1C.pr_perebros_tranzit.Execute;
    dmDataModule.OpenSQL('select p.okpo,o.* from Post p,d_our_firm o where o.PostNo=p.PostNo and p.PostNo=' + IntToStr(dmDataModule.FirmNo));
    our_firm_okpo := dmDataModule.QFO.FieldByName('okpo').AsString;
    fmExport1C.Qu1cOurFirm.Close;
    fmExport1C.Qu1cOurFirm.ParamByName('okpo').AsString := our_firm_okpo;
    fmExport1C.Qu1cOurFirm.Open;

    fmExport1C.Firma := fmExport1C.Qu1cOurFirm.FieldByName('id').AsString;

    fmExport1C.Kassir := dmDataModule.QFO.FieldByName('Kassir1C').AsString;
    fmExport1C.Otpustil := dmDataModule.QFO.FieldByName('Otpustil1C').AsString;
    fmExport1C.Sklad := dmDataModule.QFO.FieldByName('Sklad1C').AsString;
    fmExport1C.EdIzmID := dmDataModule.QFO.FieldByName('EdIzmID1C').AsString;
    fmExport1C.PartiaID := dmDataModule.QFO.FieldByName('PartiaID1C').AsString;
    fmExport1C.KontragentGroup :=
      dmDataModule.QFO.FieldByName('ContractorGroupName1c').AsString;
    fmExport1C.TMCGroup :=
      dmDataModule.QFO.FieldByName('TMCGroupName1c').AsString;
    fmExport1C.TMCTaraGroup :=
      dmDataModule.QFO.FieldByName('TMCTaraGroupName1C').AsString;
    fmExport1C.SP940 := dmDataModule.QFO.FieldByName('SP940').AsString;
    fmExport1C.SP1029 := dmDataModule.QFO.FieldByName('SP1029').AsString;
    fmExport1C.SP958 := dmDataModule.QFO.FieldByName('SP958').AsString;

    fmExport1C.SP1298 := dmDataModule.QFO.FieldByName('SP1298').AsString;
    fmExport1C.SP164 := dmDataModule.QFO.FieldByName('SP164').AsString;
    fmExport1C.SP166 := dmDataModule.QFO.FieldByName('SP166').AsString;
    fmExport1C.KontragentNew;
    fmExport1C.TMCNew(true);
    fmExport1C.TMCNew(false);
    fmExport1C.NaklP;
    fmExport1C.PKONew;
    fmExport1C.NaklR;
    MessageDlg('Обновление завершено. За период: ' +
      DateToStr(fmExport1C.Period[1]) + ' - ' + DateToStr(fmExport1C.Period[2]),
      mtInformation, [mbOk], 0);
  finally
    fmExport1C.DMLScripts.Free;
    fmExport1C.Free;
    Screen.Cursor := crDefault;
  end;
end;

function TfmExport1C.fill_dml_collection: TDMLScripts;
var
  table_name, ins_sql, upd_sql, del_sql: string;
  i: integer;
  DMLScript: TDMLScript;
begin
  result := TDMLScripts.Create(TDMLScript);
  qu1cTables.Execute;
  qu1cTables.First;
  i := 0;
  while not qu1cTables.EOF do
  begin
    table_name := qu1cTables.FieldByName('TABLE_NAME').AsString;
    DMLScript := (result.Add as TDMLScript);
    DMLScript.table_name := table_name;
    Gen_table_sql(table_name, DMLScript);
    inc(i);
    qu1cTables.Next;
  end;
end;

procedure TfmExport1C.TMCNew(is_tara: boolean);
var
  TMCCode, ls_flt, ID1C: string;
  k, count: Integer;
  params: TFieldProps;
begin
  k := 0;
  Label1.Caption := 'Добавление "ТМЦ"';
  Label1.Refresh;
  TMC.UseParent('');
  if is_tara then
    TMC.НайтиПоНаименованию(TMCTaraGroup)
  else
    TMC.НайтиПоНаименованию(TMCGroup);
  if TMC.Выбран > 0 then
    TMC.UseParent(TMC.CurrentItem)
  else
  begin
    TMC.NewGroup;
    if is_tara then
      TMC.Description := TMCTaraGroup
    else
      TMC.Description := TMCGroup;
    TMC.Write;
    TMC.UseParent(TMC.CurrentItem);
  end;
  if is_tara then
    ls_flt := ' and (OtdelNo = 3) '
  else
    ls_flt := ' and (OtdelNo <> 3) ';
  quTovarNew.Close;
  quTovarNew.MacroByName('and').Value := ls_flt;
  quTovarNew.Open;
  quTovarNew.First;
  count := quTovarNew.RecordCount;
  while not quTovarNew.Eof do
  begin
    TMC.New;
    TMC.ИспользоватьДату(DateToStr(Now));
    TMC.ПолнНаименование := quTovarNew.FieldByName('NameTovar').AsString;
    TMC.Наименование := quTovarNew.FieldByName('NameTovar').AsString;
    TMC.Транспорт := 0; //1- транспортная услуга, 0 - нет
    TMC.Write;

    TMCCode := TMC.Код;

    case Length(TMCCode) of
      1: TMCCode := '    ' + TMCCode;
      2: TMCCode := '   ' + TMCCode;
      3: TMCCode := '  ' + TMCCode;
      4: TMCCode := ' ' + TMCCode;
    end;

    qu1CIDTMC.Close;
    qu1CIDTMC.Params.ParamValues['CODE'] := TMCCode;
    qu1CIDTMC.Open;
    ID1C := qu1CIDTMC.FieldByName('ID').AsString;

    params := TFieldProps.Create(TFieldProp);
    try
      params.AddValue('ID', ID1C);
      //ID object           |C   |9     |0
      if is_tara then
      begin
        params.AddValue('SP152', '    28');
        //(P)ВидТМЦ           |C   |9     |0
        params.AddValue('SP159', '    22');
        //(P)СтавкаНДС        |C   |9     |0
        params.AddValue('SP164', SP164);
        //(P)СчетЗатрат       |C   |13    |0
        params.AddValue('SP166', SP166);
        //(P)Счет             |C   |13    |0
      end
      else
      begin
        params.AddValue('SP152', '    26');
        //(P)ВидТМЦ           |C   |9     |0
        params.AddValue('SP159', '    24');
        //(P)СтавкаНДС        |C   |9     |0
        params.AddValue('SP164', '  9A    EN');
        //(P)СчетЗатрат       |C   |13    |0
        params.AddValue('SP166', '  9A    BP');
        //(P)Счет             |C   |13    |0
      end;
      params.AddValue('SP153', '     1');
      //(P)Валюта_Прод      |C   |9     |0
      params.AddValue('SP157', '     1');
      //(P)Валюта_Прих      |C   |9     |0
      params.AddValue('SP160', '    2O');
      //(P)БазЕдиница       |C   |9     |0
      params.AddValue('SP163', '     0');
      //(P)ВидЗатрат        |C   |9     |0
      params.AddValue('SP4304', '     1');
      //(P)ВидДеятельности  |C   |9     |0

      execsql('SC148', params, 'UPDATE');
    finally
      params.free;
    end;

    SaveExport1cEntity(ID1C, 'SC148', 'ID', quTovarNew.FieldByName('pkey').Value, 'TOVAR');
    inc(k);
    Label2.Caption := IntToStr(k) + ' из ' + IntToStr(count);
    Label2.Refresh;
    quTovarNew.Next;
  end;
end;

procedure TfmExport1C.Gen_table_sql(const table_name: string; DmlScript: TDMLScript);
var
  i, k, k1: integer;
  coma, coma1, fname, def_ins, ftype: string;
  key_field: string;
  sfields, sparams, supd: string;
  def_value: variant;

begin
  sfields := '';
  sparams := '';
  supd := '';
  ftype := '';
  if Copy(table_name, 0, 2) = 'SC' then
    key_field := 'ID'
  else
    key_field := 'IDDOC';

  Table1c.Close;
  Table1c.SQL.Clear;
  Table1c.SQL.ADD('select * from ' + Table_name + ' where 1=2');
  Table1c.Open;
  k := 0;
  k1 := 0;

  DMLScript.FieldProps.Clear;
  for i := 0 to Table1c.Fields.Count - 1 do
  begin

    fname := Table1c.Fields[i].FieldName;
    if (Table1c.Fields[i] is TStringField) then
    begin
      ftype := 'STRING';
      def_ins := '''''';
      def_value := '';
    end;
    if (Table1c.Fields[i] is TIntegerField) then
    begin
      ftype := 'INTEGER';
      def_ins := '0';
      def_value := 0;
    end;
    if (Table1c.Fields[i] is TBooleanField) then
    begin
      ftype := 'BOOLEAN';
      def_ins := '0';
      def_value := true;
    end;
    if (Table1c.Fields[i] is TFLOATField) or (Table1c.Fields[i] is TFloatField) then
    begin
      ftype := 'FLOAT';
      def_ins := '0';
      def_value := 0;
    end;

    DMLScript.FieldProps.Add;
    (DMLScript.FieldProps.Items[i] as TFieldProp).field_name := fname;
    (DMLScript.FieldProps.Items[i] as TFieldProp).field_type := ftype;
    (DMLScript.FieldProps.Items[i] as TFieldProp).field_default := def_value;
    if fname <> 'ROW_ID' then
    begin
      if k = 0 then
        coma := ''
      else
        coma := ',';

      inc(k);
      sfields := sfields + coma + fname;
      sparams := sparams + coma + ' :' + fname;
      if fname <> key_field then
      begin
        if k1 = 0 then
          coma1 := ''
        else
          coma1 := ',';
        inc(k1);
        supd := supd + coma1 + fname + ' = :' + fname;
      end;
    end;

  end;
  DMLScript.table_name := table_name;
  DMLScript.ins_sql := 'insert into ' + table_name + '(' + sfields + ') ' + 'values (' + sparams + ')';
  //  DMLScript.upd_sql := 'update ' + table_name + ' set ' + supd + ' where ' + key_field + '= :' + key_field;
  DMLScript.upd_sql := '';
  DMLScript.del_sql := 'delete from ' + table_name + ' where ' + key_field + '= :' + key_field;

end;

procedure TfmExport1C.Gen_update_sql(const table_name: string; param_values: TFieldProps);
var
  i, k, k1: integer;
  coma, coma1, fname, def_ins, ftype: string;
  key_field: string;
  sfields, sparams, supd: string;
  def_value: variant;
begin
  sfields := '';
  sparams := '';
  supd := '';
  ftype := '';
  if Copy(table_name, 0, 2) = 'SC' then
    key_field := 'ID'
  else
    key_field := 'IDDOC';

  for i := 0 to param_values.Count - 1 do
  begin
    fname := (param_values.Items[i] as TFieldProp).field_name;
    if fname <> 'ROW_ID' then
    begin
      if k = 0 then
        coma := ''
      else
        coma := ',';

      inc(k);
      sfields := sfields + coma + fname;
      sparams := sparams + coma + ':' + fname;
      if fname <> key_field then
      begin
        if k1 = 0 then
          coma1 := ''
        else
          coma1 := ',';
        inc(k1);
        supd := supd + coma1 + fname + ' = :' + fname;
      end;
    end;

  end;
  DMLScripts.ItemByTableName(table_name).upd_sql := 'update ' + table_name + ' set ' + supd + ' where ' + key_field + '= :' + key_field;
end;

procedure TfmExport1C.NaklP;
var
  is_return: boolean;
  PrihNaklObj: Olevariant;
  NaklNomPref, NaklNom, PostId, DogovorID, ID1C, table_1c: string;
  VidNaklNo, NaklNo, i, k, count, IDDOCDEF: Integer;
  SummaNakl, qty, price: Extended;
  params: TFieldProps;
begin
  Label1.Caption := 'Приходы';
  Label1.Refresh;
  quNaklPNew.Close;
  quNaklPNew.ParamByName('DateBegin').AsDate := Period[1];
  quNaklPNew.ParamByName('DateEnd').AsDate := Period[2];
  quNaklPNew.Open;
  quNaklPNew.First;
  count := quNaklPNew.RecordCount;
  k := 0;
  while not quNaklPNew.Eof do
  begin
    is_return := quNaklPNew.FieldByName('Summa').AsFloat < 0;
    NaklNom := quNaklPNew.FieldByName('Nom').AsString;
    VidNaklNo := quNaklPNew.FieldByName('VidNaklNo').AsInteger;
    NaklNo := quNaklPNew.FieldByName('NaklNo').AsInteger;
    PostId := quNaklPNew.FieldByName('Post_ID1C').AsString;
    SummaNakl := quNaklPNew.FieldByName('Summa').AsFloat;
    if is_return then
    begin
      IDDOCDEF := 2258;
    end
    else
    begin
      IDDOCDEF := 920;
    end;
    DogovorID := GetDogovor1C(PostID);
    Modify_1SJOURN(ID1C, 'INSERT', IDDOCDEF, quNaklPNew.FieldByName('DateNakl').AsDateTime, 'NAKLP', quNaklPNew.FieldByName('NaklNo').AsInteger);
    if is_return then
    begin
      params := TFieldProps.Create(TFieldProp);
      try
        params.AddValue('IDDOC', ID1C); //ID Document's       |C   |9     |0
        params.AddValue('SP2230', PostID); //(P)Контрагент       |C   |9     |0
        params.AddValue('SP2231', '     1'); //(P)Валюта           |C   |9     |0
        params.AddValue('SP2232', 1); //(P)Курс             |N   |11    |5
        params.AddValue('SP2233', Sklad); //(P)МестоХранения    |C   |9     |0
        params.AddValue('SP2234', '    2I'); //(P)ВидТорговли      |C   |9     |0
        params.AddValue('SP2235', '     2'); //(P)СубконтоВалИзд   |C   |9     |0
        params.AddValue('SP2236', '    24'); //(P)ВидНДС           |C   |9     |0
        params.AddValue('SP2237', '  9A    CT'); //(P)СчетКонтрагента  |C   |13    |0
        params.AddValue('SP2238', 0); //(P)УказанаПредварите|N   |2     |0
        params.AddValue('SP2239', 0); //(P)СуммаО           |N   |13    |2
        params.AddValue('SP2240', 0); //(P)НДСО             |N   |13    |2
        params.AddValue('SP2244', Otpustil); //(P)Отпустил         |C   |9     |0
        params.AddValue('SP2241', '          '); //(P)Отпустил         |C   |9     |0
        params.AddValue('SP2242', '          '); //(P)Отпустил         |C   |9     |0
        params.AddValue('SP2243', StrToDate('01.01.1753')); //(P)Отпустил         |C   |9     |0
        params.AddValue('SP2245', '                              '); //(P)Отпустил         |C   |9     |0
        params.AddValue('SP3679', '    F5'); //(P)СчетЗатрат       |C   |9     |0
        params.AddValue('SP3680', '     T'); //(P)ВидЗатрат        |C   |9     |0
        params.AddValue('SP2247', PostID); //(P)ОтборЗаказаКонтра|C   |9     |0
        params.AddValue('SP8890', '  98' + DogovorID); //(P)Заказ            |C   |13    |0
        params.AddValue('SP2254', ABS(SummaNakl / 120 * 100)); //(P)СуммаБезНДС      |N   |13    |2
        params.AddValue('SP2255', ABS(SummaNakl)); //(P)СуммаСНДС        |N   |14    |3
        params.AddValue('SP2256', ABS(SummaNakl / 120 * 20)); //(P)НДС              |N   |14    |3
        params.AddValue('SP11090', 5);
        params.AddValue('SP11101', NaklNom);
        params.AddValue('SP958', SP958); //(P)ПеревозкаВал     |N   |13    |2
        params.AddValue('SP13616', 0); //(P)ПеревозкаВал     |N   |13    |2

        execsql('DH2258', params, 'INSERT');
      finally
        params.Free
      end;
    end
    else
    begin
      params := TFieldProps.Create(TFieldProp);
      try
        params.AddValue('IDDOC', ID1C); //ID Document's       |C   |9     |0
        params.AddValue('SP923', '  4U' + PostID); //(P)Контрагент       |C   |13    |0
        params.AddValue('SP940', SP940); //(P)СчетКонтрагента  |C   |9     |0
        params.AddValue('SP924', '  98' + DogovorID); //(P)Заказ            |C   |13    |0
        params.AddValue('SP925', '     1'); //(P)Валюта           |C   |9     |0
        params.AddValue('SP1121', 1); //(P)Курс             |N   |11    |5
        params.AddValue('SP959', '    3K'); //(P)ЧтоПриходуем     |C   |9     |0
        params.AddValue('SP926', '    2I'); //(P)ВидТорговли      |C   |9     |0
        params.AddValue('SP927', Sklad); //(P)МестоХранения    |C   |9     |0
        params.AddValue('SP930', 0); //(P)СуммаО           |N   |13    |2
        params.AddValue('SP931', 0); //(P)НДСО             |N   |13    |2
        params.AddValue('SP932', 0); //(P)УказанаПредварите|N   |2     |0
        params.AddValue('SP933', 'Z141Z6'); //(P)СчетТаможни      |C   |9     |0
        params.AddValue('SP934', '     0'); //(P)Таможня          |C   |9     |0
        params.AddValue('SP935', '   0     0'); //(P)ЗаказТаможни     |C   |13    |0
        params.AddValue('SP936', 0); //(P)ДопНДС           |N   |13    |2
        params.AddValue('SP937', '     0'); //(P)Перевозчик       |C   |9     |0
        params.AddValue('SP938', '   0     0'); //(P)ЗаказПеревозчика |C   |13    |0
        params.AddValue('SP939', '     1'); //(P)ВалютаПеревозки  |C   |9     |0
        params.AddValue('SP941', 'Z141Z6'); //(P)СчетПеревозчика  |C   |9     |0
        params.AddValue('SP942', 0); //(P)ЧерезПодотчетноеЛ|N   |2     |0
        params.AddValue('SP943', 0); //(P)СуммаПодотчета   |N   |13    |2
        params.AddValue('SP1122', 0); //(P)СуммаВалПеревозки|N   |13    |2
        params.AddValue('SP1123', 0); //(P)СуммаГрнПеревозки|N   |13    |2
        params.AddValue('SP964', PostID); //(P)ОтборЗаказаКонтра|C   |9     |0
        params.AddValue('SP965', '     0'); //(P)ОтборЗаказаТаможн|C   |9     |0
        params.AddValue('SP966', '     0'); //(P)ОтборЗаказаПерево|C   |9     |0
        params.AddValue('SP968', 0); //(P)НДСНаЗатраты     |N   |2     |0
        params.AddValue('SP969', '     0'); //(P)ПодотчетноеЛицо  |C   |9     |0
        params.AddValue('SP1124', 1); //(P)КурсПеревозки    |N   |11    |5
        params.AddValue('SP952', SummaNakl); //(P)СуммаСНДС        |N   |14    |6
        params.AddValue('SP953', 0); //(P)Акциз            |N   |13    |2
        params.AddValue('SP954', 0); //(P)Пошлина          |N   |13    |2
        params.AddValue('SP955', 0); //(P)ТаможенныеУслуги |N   |13    |2
        params.AddValue('SP956', 0); //(P)Перевозка        |N   |13    |2
        params.AddValue('SP1158', 0); //(P)ПеревозкаВал     |N   |13    |2
        params.AddValue('SP1368', NaklNom); //(P)ПеревозкаВал     |N   |13    |2
        params.AddValue('SP958', SP958); //(P)ПеревозкаВал     |N   |13    |2

        if VidNaklNo = 4 then
        begin
          params.AddValue('SP928', '    22'); //(P)ВидНДС           |C   |9     |0
          params.AddValue('SP929', '    1C'); //(P)СубконтоВалРасх  |C   |9     |0
          params.AddValue('SP949', SummaNakl); //(P)СуммаБезНДСВал   |N   |13    |6
          params.AddValue('SP950', SummaNakl); //(P)СуммаБезНДС      |N   |13    |6
          params.AddValue('SP951', 0); //(P)НДС              |N   |13    |6
          params.AddValue('SP11091', 4); //(P)НДС              |N   |13    |6
        end
        else
        begin
          params.AddValue('SP928', '    24'); //(P)ВидНДС           |C   |9     |0
          params.AddValue('SP929', '     2'); //(P)СубконтоВалРасх  |C   |9     |0
          params.AddValue('SP949', SummaNakl / 120 * 100); //(P)СуммаБезНДСВал   |N   |13    |6
          params.AddValue('SP950', SummaNakl / 120 * 100); //(P)СуммаБезНДС      |N   |13    |6
          params.AddValue('SP951', SummaNakl / 120 * 20); //(P)НДС              |N   |13    |6
          params.AddValue('SP11091', 1); //(P)НДС              |N   |13    |6
        end;
        execsql('DH920', params, 'INSERT');
      finally
        params.Free
      end;
    end;

    quPrihod.Close;
    quPrihod.ParamByName('NaklNo').AsInteger := NaklNo;
    quPrihod.Open;
    quPrihod.First;
    i := 1;
    while not quPrihod.Eof do
    begin
      qty := ABS(quPrihod.FieldByName('Kol').AsFloat);
      price := quPrihod.FieldByName('Price').AsFloat;
      if is_return then
      begin
        params := TFieldProps.Create(TFieldProp);
        try
          params.AddValue('IDDOC', ID1C); //ID Document's       |C   |9     |0
          params.AddValue('LINENO_', i); //LineNo              |N   |4     |0
          params.AddValue('SP2248', quPrihod.FieldByName('Tovar_ID1C').AsString); //(P)ТМЦ              |C   |9     |0
          params.AddValue('SP2249', PartiaID); //(P)Партия           |C   |9     |0
          params.AddValue('SP2252', EdIzmID); //(P)Ед               |C   |9     |0
          params.AddValue('SP2253', price / 120 * 100); //(P)ЦенаБезНДС       |N   |13    |2
          params.AddValue('SP2254', (price / 120 * 100) * qty); //(P)СуммаБезНДС      |N   |13    |2
          params.AddValue('SP2255', price * qty); //(P)СуммаСНДС        |N   |14    |3
          params.AddValue('SP2256', (price / 120 * 20) * qty); //(P)НДС              |N   |14    |3
          params.AddValue('SP2251', 1);
          params.AddValue('SP2250', qty);
          execsql('DT2258', params, 'INSERT');
        finally
          params.Free;
        end;
      end
      else
      begin
        params := TFieldProps.Create(TFieldProp);
        try
          if VidNaklNo = 4 then
          begin
            params.AddValue('SP948', price); //(P)ЦенаБезНДС       |N   |13    |6
            params.AddValue('SP949', price * qty); //(P)СуммаБезНДСВал   |N   |13    |6
            params.AddValue('SP950', price * qty); //(P)СуммаБезНДС      |N   |13    |6
            params.AddValue('SP951', 0); //(P)НДС              |N   |13    |6
          end
          else
          begin
            params.AddValue('SP948', price / 120 * 100); //(P)ЦенаБезНДС       |N   |13    |6
            params.AddValue('SP949', (price / 120 * 100) * qty); //(P)СуммаБезНДСВал   |N   |13    |6
            params.AddValue('SP950', (price / 120 * 100) * qty); //(P)СуммаБезНДС      |N   |13    |6
            params.AddValue('SP951', (price / 120 * 20) * qty); //(P)НДС              |N   |13    |6
          end;
          params.AddValue('IDDOC', ID1C); //ID Document's       |C   |9     |0
          params.AddValue('LINENO_', i); //LineNo              |N   |4     |0
          params.AddValue('SP944', '  44' + quPrihod.FieldByName('Tovar_ID1C').AsString); //(P)ТМЦ              |C   |13    |0
          params.AddValue('SP946', EdIzmID); //(P)Ед               |C   |9     |0
          params.AddValue('SP952', price * qty); //(P)СуммаСНДС        |N   |14    |6
          params.AddValue('SP953', 0); //(P)Акциз            |N   |13    |2
          params.AddValue('SP954', 0); //(P)Пошлина          |N   |13    |2
          params.AddValue('SP955', 0); //(P)ТаможенныеУслуги |N   |13    |2
          params.AddValue('SP956', 0); //(P)Перевозка        |N   |13    |2
          params.AddValue('SP1158', 0); //(P)ПеревозкаВал     |N   |13    |2
          params.AddValue('SP945', qty); //(P)ПеревозкаВал     |N   |13    |2
          params.AddValue('SP947', 1); //(P)ПеревозкаВал     |N   |13    |2
          execsql('DT920', params, 'INSERT');
        finally
          params.Free;
        end;
      end;
      inc(i);
      quPrihod.Next;
    end;
    //   SetDocOurFirm1c(ID1C);
    if is_return then
      table_1c := 'DH2258'
    else
      table_1c := 'DH920';

    SaveExport1cEntity(ID1C, TABLE_1C, 'IDDOC', quNaklPNew.FieldByName('pkey').Value, 'NAKLP');
    inc(k);
    Label2.Caption := IntToStr(k) + ' из ' + IntToStr(count);
    Label2.Refresh;
    quNaklPNew.Next;

  end;
end;

function TfmExport1C.GetNextId(s: string): string;
var
  i, offset, symb_in, symb_out, inc: integer;
  string_out: string;
  value: string;
begin
  value := trim(s);
  string_out := '0' + value;
  symb_in := Ord(value[Length(value)]);
  case symb_in of
    48..56, 65..89:
      begin
        offset := 0;
        symb_out := symb_in + 1;
      end;
    90:
      begin
        offset := 1;
        symb_out := 48;
      end;
    57:
      begin
        offset := 0;
        symb_out := 65;
      end;
  end;
  string_out[Length(string_out)] := chr(symb_out);

  for i := Length(value) downto 1 do
  begin
    symb_in := Ord(string_out[i]);
    if offset = 1 then
    begin
      case symb_in of
        48..56, 65..89:
          begin
            offset := 0;
            symb_out := symb_in + 1;
          end;
        90:
          begin
            offset := 1;
            symb_out := 48;
          end;
        57:
          begin
            offset := 0;
            symb_out := 65;
          end;
      end;
      string_out[i] := chr(symb_out);
    end;
  end;
  if string_out[1] = '0' then
    string_out[1] := ' ';
  result := StringOfChar(' ', 6 - Length(trim(string_out))) + trim(string_out);
end;

procedure TfmExport1C.SaveExport1cEntity(ID_1C, TABLE_1C, ID_FIELD_NAME_1C: string;
  pkey: Int64; table_name: string);
begin
  pr_Add_L_1C_DbBase.Close;
  pr_Add_L_1C_DbBase.ParamByName('ID_1C').AsString := ID_1C;
  pr_Add_L_1C_DbBase.ParamByName('TABLE_1C').AsString := TABLE_1C;
  pr_Add_L_1C_DbBase.ParamByName('ID_FIELD_NAME_1C').AsString := ID_FIELD_NAME_1C;
  pr_Add_L_1C_DbBase.ParamByName('OurFirmNo').AsInteger := dmDataModule.FirmNo;
  pr_Add_L_1C_DbBase.ParamByName('pkey').Value := pkey;
  pr_Add_L_1C_DbBase.ParamByName('table_name').AsString := table_name;
  pr_Add_L_1C_DbBase.Execute;

end;

function TfmExport1C.GetCurID1C(typeid: Integer): string;
var
  maxid: string;
begin
  quGetCurID1C.Close;
  quGetCurID1C.ParaMByName('p_typeid').asInteger := typeid;
  quGetCurID1C.Open;
  if (typeid = 0) and quGetCurID1C.fieldByName('MAXID').IsNull then
  begin
    QFO1C.Close;
    QFO1C.SQL.Clear;
    QFO1C.SQL.Add('select max(iddoc) as maxid from _1SJOURN');
    QFO1C.Open;
    maxid := qfo1c.fieldbyname('maxid').AsString;
    QFO1C.Close;
    QFO1C.SQL.Clear;
    QFO1C.SQL.Add('INSERT INTO _1SUIDCTL (TYPEID, MAXID) VALUES (0, ''' + maxid + ''')');
    QFO1C.Execute;
    result := maxid;
  end
  else
    Result := quGetCurID1C.fieldByName('MAXID').ASString;
end;

function TfmExport1C.GetDogovor1C(PostID: string): string;
begin
  qu1CFindDogovor.Close;
  qu1CFindDogovor.Params.ParamValues['SP1067'] := PostID;
  qu1CFindDogovor.Open;
  Result := qu1CFindDogovor.FieldByName('IDDOC').AsString;
  if Result = '' then
    Result := '     0';
end;

procedure TfmExport1C.SetDocOurFirm1c(ID1C: string);
begin
  qu_1SJOURN_Update.Params.ParamValues['IDDOC'] := ID1C; //RashNaklCod;
  qu_1SJOURN_Update.Params.ParamValues['SP4359'] := Firma; //Наша фирма;
  qu_1SJOURN_Update.Execute;
end;

procedure TfmExport1C.quPlatPNewBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quPlatPNew.ParamByName('OurFIrmNo').AsInteger := dmDataModule.FirmNo;
end;

procedure TfmExport1C.quNaklRNewBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quNaklRNew.ParamByName('OurFIrmNo').AsInteger := dmDataModule.FirmNo;
end;

procedure TfmExport1C.quNaklPNewBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quNaklPNew.ParamByName('OurFIrmNo').AsInteger := dmDataModule.FirmNo;
end;

procedure TfmExport1C.quRashodBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quRashod.ParamByName('OurFIrmNo').AsInteger := dmDataModule.FirmNo;
end;

procedure TfmExport1C.quPrihodBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quPrihod.ParamByName('OurFIrmNo').AsInteger := dmDataModule.FirmNo;
end;

procedure TfmExport1C.quPostNewBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quPostNew.ParamByName('OurFIrmNo').AsInteger := dmDataModule.FirmNo;
end;

procedure TfmExport1C.quTovarNewBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quTovarNew.ParamByName('OurFIrmNo').AsInteger := dmDataModule.FirmNo;
end;

function TfmExport1C.Set_1SUIDCTL_Next_ID(typeid: Integer): string;
var
  current_id, Next_id: string;
begin
  current_id := GetCurID1C(typeid);
  Next_id := GetNextId(current_id);
  quGetCurID1C.Close;
  quGetCurID1C.ParamByName('p_typeid').AsInteger := typeid;
  quGetCurID1C.Open;
  quGetCurID1C.Edit;
  quGetCurID1C.FIeldByName('typeid').AsInteger := typeid;
  quGetCurID1C.FIeldByName('maxid').AsString := Next_id;
  quGetCurID1C.Post;
  result := Next_id;
end;

function TfmExport1C.Modify_1SJOURN(var IDDOC: string; Action: string; IDDOCDEF:
  Integer; p_date: Tdate; source: string; entityno: integer): string;
var
  DATE_TIME_IDDOC, DNPREFIX, DOCNO, SP4359, sql_string, field_list, param_list, coma, param_name: string;
  IDJOURNAL, APPCODE, CLOSED, ACTCNT, VERSTAMP, DS2486, DS5339, DS12351,
    DS13591, i: Integer;
  l_year, l_month, l_day: Word;
  ls_year, ls_month, ls_day: string;
  ISMARK: boolean;
  params: TFieldProps;
  param: TFieldProp;
begin
  params := TFieldProps.Create(TFieldProp);
  try

    case IDDOCDEF of
      920: IDJOURNAL := 921;
      4416: IDJOURNAL := 921;
      1388: IDJOURNAL := 1407;
      1645: IDJOURNAL := 1646;
      1850: IDJOURNAL := 2160;
      2101: IDJOURNAL := 2160;
      2120: IDJOURNAL := 2166;
      2134: IDJOURNAL := 2166;
      1597: IDJOURNAL := 2169;
      1766: IDJOURNAL := 2169;
      2143: IDJOURNAL := 2169;
      1721: IDJOURNAL := 2380;
      1768: IDJOURNAL := 2380;
      2295: IDJOURNAL := 2380;
      2361: IDJOURNAL := 2380;
      1688: IDJOURNAL := 2388;
      2057: IDJOURNAL := 2388;
      1081: IDJOURNAL := 2410;
      1011: IDJOURNAL := 2438;
      1545: IDJOURNAL := 2455;
      2258: IDJOURNAL := 2455;
      1785: IDJOURNAL := 2460;
      1297: IDJOURNAL := 2470;
      1318: IDJOURNAL := 2470;
      981: IDJOURNAL := 2855;
      332: IDJOURNAL := 2861;
      1134: IDJOURNAL := 2911;
      2903: IDJOURNAL := 2911;
      4347: IDJOURNAL := 2911;
      3707: IDJOURNAL := 3714;
      4546: IDJOURNAL := 4547;
      4562: IDJOURNAL := 5113;
      4465: IDJOURNAL := 5120;
      4436: IDJOURNAL := 5136;
      8918: IDJOURNAL := 8922;
      2110: IDJOURNAL := 13684;
    end;

    DecodeDate(p_date, l_Year, l_Month, l_Day);
    ls_year := IntToStr(l_year);
    ls_Month := IntToStr(l_Month);
    ls_Day := IntToStr(l_Day);
    APPCODE := 20;
    DNPREFIX := '      ' + IntToStr(IDDOCDEF) + IntToStr(l_Year) + '    ';

    if Action = 'INSERT' then
    begin
      sp_set_sub_num.close;
      sp_set_sub_num.parambyname('source').asString := source;
      sp_set_sub_num.parambyname('entityno').asinteger := entityno;
      sp_set_sub_num.Execute;

      qu_entity_1c_num.close;
      qu_entity_1c_num.parambyname('source').asString := source;
      qu_entity_1c_num.parambyname('entityno').asinteger := entityno;
      qu_entity_1c_num.Open;

      DOCNO := qu_entity_1c_num.fieldbyname('num_1c').asString;
      IDDOC := Set_1SUIDCTL_Next_ID(0);
      DATE_TIME_IDDOC := ls_Year + StringofChar('0', 2 - Length(ls_Month)) + ls_Month + StringofChar('0', 2 - Length(ls_Day)) + ls_Day + 'AIIYZK' +
        IDDOC;
      ISMARK := false;
      CLOSED := 4;
      ACTCNT := 0;
      VERSTAMP := 0;
      SP4359 := Firma;
      DS2486 := 0;
      DS5339 := 0;
      DS12351 := 0;
      DS13591 := 0;

      params.AddValue('IDJOURNAL', IDJOURNAL);
      params.AddValue('IDDOC', IDDOC);
      params.AddValue('IDDOCDEF', IDDOCDEF);
      params.AddValue('APPCODE', APPCODE);
      params.AddValue('DATE_TIME_IDDOC', DATE_TIME_IDDOC);
      params.AddValue('DNPREFIX', DNPREFIX);
      params.AddValue('DOCNO', DOCNO);
      params.AddValue('ACTCNT', ACTCNT);
      params.AddValue('CLOSED', CLOSED);
      params.AddValue('ISMARK', ISMARK);
      params.AddValue('VERSTAMP', VERSTAMP);
      params.AddValue('SP4359', SP4359);
      params.AddValue('DS2486', DS2486);
      params.AddValue('DS5339', DS5339);
      params.AddValue('DS12351', DS12351);
      params.AddValue('DS13591', DS13591);
      params.AddValue('DS13570', 1);

    end;

    if Action = 'UPDATE' then
    begin

    end;

    if Action = 'DELETE' then
    begin

    end;
    execsql('_1SJOURN', params, 'INSERT');
    result := IDDOC;
  finally
    params.Free;
  end;

end;

procedure TfmExport1C.ExecSql(table_name: string; param_values: TFieldProps; Action: string);
var
  pname, ptype: string;
  i: integer;
  DMLScript: TDMLScript;
  param_value: TFieldProp;
  field_prop: TFieldProp;
begin
  QFO1C.Close;
  QFO1C.SQL.Clear;
  DMLScript := DMLScripts.ItemByTableName(table_name);
  if DMLScript.upd_sql = '' then Gen_update_sql(table_name, param_values);
  QFO1C.SQL.Add(DMLScript.GetSqlByAction(Action));
  for i := 0 to DMLScript.FieldProps.count - 1 do
  begin
    field_prop := (DMLScript.FieldProps.Items[i] as TFieldProp);
    pname := field_prop.field_name;
    param_value := param_values.ItemByFieldName(pname);

    if QFO1C.Params.FindParam(pname) <> nil then
    begin
      if field_prop.field_type = 'STRING' then
      begin
        if param_value <> nil then
          QFO1C.ParamByName(pname).AsString := VarToStr(param_value.value)
        else
          QFO1C.ParamByName(pname).AsString := VarToStr(field_prop.field_default);
      end;
      if (field_prop.field_type = 'INTEGER') or (field_prop.field_type = 'FLOAT') or (field_prop.field_type = 'BOOLEAN') then
      begin
          if param_value <> nil then
            QFO1C.ParamByName(pname).Value := param_value.value
          else
            QFO1C.ParamByName(pname).value := field_prop.field_default;
      end;
    end;
  end;
  QFO1C.Execute;
end;

procedure TfmExport1C.set_param_value(params: Tstrings; param_types: TStrings; pname: string; pvalue: Variant; ptype: string);
begin
  params.values[pname] := vartostr(pvalue);
  param_types.values[pname] := ptype;
end;

constructor TDMLScript.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  Self.FieldProps := TFieldProps.Create(TFieldProp);
end;

function TFieldProps.ItemByFieldName(const Value: string): TFieldProp;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    Result := TFieldProp(inherited Items[I]);
    if AnsiCompareText(Result.Field_Name, Value) = 0 then Exit;
  end;
  Result := nil;
end;

procedure TFieldProps.AddValue(Field_name: string; value: variant);
var
  I: Integer;
  param: TFieldProp;
begin
  param := (Self.add as TFieldProp);
  param.field_name := Field_name;
  param.value := value;
end;

function TDMLScript.GetSqlByAction(Action: string): string;
begin
  if Action = 'INSERT' then result := Self.ins_sql;
  if Action = 'UPDATE' then result := Self.upd_sql;
  if Action = 'DELETE' then result := Self.del_sql;
end;

function TDMLScripts.ItemByTableName(const Value: string): TDMLScript;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    Result := TDMLScript(inherited Items[I]);
    if AnsiCompareText(Result.Table_Name, Value) = 0 then Exit;
  end;
  Result := nil;
end;

{function TDMLScripts.GetItem(Index: Integer): TDMLScript;
begin
  Result := TDMLScript(inherited Items[Index]);
  Result := Result.ParamRef;
end;

procedure TDMLScripts.SetItem(Index: Integer; Value: TDMLScript);
begin
  inherited SetItem(Index, TCollectionItem(Value));
end;}

procedure TfmExport1C.KontragentNew;
var
  KontragentCode, KontragentID, BankCode, BankID: string;
  i, count, k: Integer;
begin
  k := 0;
  Label1.Caption := 'Добавление "Контрагентов"';
  Label1.Refresh;
  Kontragent.UseParent('');
  Kontragent.НайтиПоНаименованию(KontragentGroup);
  if Kontragent.Выбран > 0 then
    Kontragent.UseParent(Kontragent.CurrentItem)
  else
  begin
    Kontragent.NewGroup;
    Kontragent.Description := KontragentGroup;
    Kontragent.Write;
    Kontragent.UseParent(Kontragent.CurrentItem);
  end;
  quPostNew.Close;
  quPostNew.Open;
  quPostNew.First;
  count := quPostNew.RecordCount;
  while not quPostNew.Eof do
  begin
    Kontragent.New;
    Kontragent.ПлательщикНалогаНаПрибыль := 1;
    Kontragent.ИспользоватьДату(DateToStr(Now));
    Kontragent.ПолнНаименование := quPostNew.FieldByName('NameLong').AsString;
    Kontragent.Наименование := quPostNew.FieldByName('Name').AsString;
    Kontragent.Адрес := quPostNew.FieldByName('Address').AsString;
    Kontragent.ФизАдрес := quPostNew.FieldByName('AddressFact').AsString;
    Kontragent.Телефоны := quPostNew.FieldByName('Phone').AsString;
    Kontragent.ЕДРПОУ := quPostNew.FieldByName('OKPO').AsString;
    Kontragent.ИНН := quPostNew.FieldByName('CodeNDS').AsString;
    Kontragent.НомерСвидетельства :=
      quPostNew.FieldByName('NoSvidNDS').AsString;
    Kontragent.Write;

    KontragentCode := Kontragent.Код;
    case Length(KontragentCode) of
      1: KontragentCode := '    ' + KontragentCode;
      2: KontragentCode := '   ' + KontragentCode;
      3: KontragentCode := '  ' + KontragentCode;
      4: KontragentCode := ' ' + KontragentCode;
    end;

    qu1CIDContragent.Params.ParamValues['CODE'] := KontragentCode;
    qu1CIDContragent.Open;
    KontragentID := qu1CIDContragent.FieldByName('ID').AsString;
    qu1CIDContragent.Close;
    BankCode := '';
    BankID := '';

    if quPostNew.FieldByName('MFO').AsString <> '' then
    begin
      DenSchet.ИспользоватьВладельца(Kontragent.ТекущийЭлемент);
      DenSchet.ВыбратьЭлементы;
      DenSchet.Новый;
      DenSchet.НомерСчета := quPostNew.FieldByName('RS').AsString;
      DenSchet.Наименование := 'Основной р/с';
      DenSchet.Записать;
      BankCode := DenSchet.Код;

      case Length(BankCode) of
        0: BankCode := '';
        1: BankCode := '         ' + BankCode;
        2: BankCode := '        ' + BankCode;
        3: BankCode := '       ' + BankCode;
        4: BankCode := '      ' + BankCode;
        5: BankCode := '     ' + BankCode;
        6: BankCode := '    ' + BankCode;
        7: BankCode := '   ' + BankCode;
        8: BankCode := '  ' + BankCode;
        9: BankCode := ' ' + BankCode;
      end;

      qu1CFindBank.Params.ParamValues['CODE'] :=
        quPostNew.FieldByName('MFO').AsString;
      qu1CFindBank.Open;
      BankID := qu1CFindBank.FieldByName('ID').AsString;
      qu1CFindBank.Close;

      if BankID <> '' then
      begin
        qu1CBankUpDate.Params.ParamValues['CODE'] := BankCode;
        //object code         |C   |10    |0
        qu1CBankUpDate.Params.ParamValues['PARENTEXT'] := KontragentID;
        //Parent in other tabl|C   |9     |0
        qu1CBankUpDate.Params.ParamValues['SP247'] := '     1';
        //(P)Валюта           |C   |9     |0
        qu1CBankUpDate.Params.ParamValues['SP251'] := BankID;
        //(P)Банк             |C   |9     |0
        qu1CBankUpDate.Execute;
      end;

    end;

    qu1CContragentUpDate.Params.ParamValues['ID'] := KontragentID;
    //ID object           |C   |9     |0
    qu1CContragentUpDate.Params.ParamValues['SP245'] := '    6R';
    //(P)ВидКонтрагента   |C   |9     |0
    qu1CContragentUpDate.Params.ParamValues['SP187'] := '    2I';
    //(P)ВидТорговли      |C   |9     |0
    qu1CContragentUpDate.Params.ParamValues['SP918'] := '    PG';
    //(P)ВидВзаиморасчетов|C   |9     |0
    qu1CContragentUpDate.Execute;

    SaveExport1cEntity(KontragentID, 'SC174', 'ID',
      quPostNew.FieldByName('pkey').Value, 'POST');
    quPostNew.Next;

    inc(k);
    Label2.Caption := IntToStr(k) + ' из ' + IntToStr(count);
    Label2.Refresh;

  end;
end;

procedure TfmExport1C.NaklR;
var
  NaklNom, ID1C, PostID, DogovorID: string;
  NaklNo, i, VidNaklNo, k, count: Integer;
  SummaNakl: Extended;
  RashNaklObj: Olevariant;
  is_return: boolean;
begin
  Label1.Caption := 'Добавление "Расходные накладные"';
  Label1.Refresh;
  quNaklRNew.Close;
  quNaklRNew.ParamByName('DateBegin').AsDate := Period[1];
  quNaklRNew.ParamByName('DateEnd').AsDate := Period[2];
  quNaklRNew.Open;
  quNaklRNew.First;
  count := quNaklRNew.RecordCount;
  k := 0;
  while not quNaklRNew.Eof do
  begin

    if ((quNaklRNew.FieldByName('VidNaklNo').AsInteger = 3) or (quNaklRNew.FieldByName('VidNaklNo').AsInteger = 5)) then is_return := true
                                                                                                                    else is_return := false;
{
    is_return := quNaklRNew.FieldByName('VidNaklNo').AsInteger = 3;
    is_return := quNaklRNew.FieldByName('VidNaklNo').AsInteger = 5;
 }
    Label2.Caption := IntToStr(k) + ' из ' + IntToStr(count);
    Label2.Refresh;
    inc(k);
    NaklNom := quNaklRNew.FieldByName('Nom').AsString;
    NaklNo := quNaklRNew.FieldByName('NaklNo').AsInteger;
    PostID := quNaklRNew.FieldByName('Post_ID1C').AsString;
    SummaNakl := quNaklRNew.FieldByName('Summa').AsFloat;
    DogovorId := GetDogovor1C(PostID);

    if is_return then
    begin
      RashNaklObj := RashNaklReturn;
    end
    else
    begin
      RashNaklObj := RashNakl;
    end;

    RashNaklObj.Новый;
    RashNaklObj.СчетКонтрагента := '361';
    RashNaklObj.КодТП := NaklNom;
    RashNaklObj.ДатаДок :=
      DateToStr(quNaklRNew.FieldByName('DateNakl').AsDateTime);
    RashNaklObj.Курс := 1;
    RashNaklObj.УказанаПредварительнаяОплата := 0;

    if is_return then
    begin
      RashNaklObj.УстановитьНовыйНомер('ВНн-');
      RashNaklObj.ТП := 5;
      RashNaklObj.Записать;
      ID1C := GetCurID1C(0);
      qu1CNaklRReturnUpDate.Params.ParamValues['IDDOC'] := ID1C;
      //ID Document's       |C   |9     |0
      qu1CNaklRReturnUpDate.Params.ParamValues['SP1546'] := PostID;
      //(P)Контрагент       |C   |9     |0
      qu1CNaklRReturnUpDate.Params.ParamValues['SP1573'] := SP1029;
      //(P)СчетКонтрагента  |C   |13    |0
      qu1CNaklRReturnUpDate.Params.ParamValues['SP1549'] := Sklad;
      //(P)МестоХранения    |C   |9     |0
      qu1CNaklRReturnUpDate.Params.ParamValues['SP1547'] := '     1';
      //(P)Валюта           |C   |9     |0
      qu1CNaklRReturnUpDate.Params.ParamValues['SP1548'] := 1;
      //(P)Курс             |N   |11    |5
      qu1CNaklRReturnUpDate.Params.ParamValues['SP1554'] := '    2I';
      //(P)ВидТорговли      |C   |9     |0
      qu1CNaklRReturnUpDate.Params.ParamValues['SP1555'] := '  O5    24';
      //(P)ВидНДС           |C   |13    |0
      qu1CNaklRReturnUpDate.Params.ParamValues['SP1550'] := '     2';
      //(P)СубконтоВалДох   |C   |9     |0
      qu1CNaklRReturnUpDate.Params.ParamValues['SP1574'] := '     0';
      //(P)Касса            |C   |9     |0
      qu1CNaklRReturnUpDate.Params.ParamValues['SP1572'] := '   29C';
      //(P)ОтборЗаказаКонтра|C   |9     |0
      qu1CNaklRReturnUpDate.Params.ParamValues['SP8888'] := '  98' + DogovorID;
      //(P)Заказ            |C   |13    |0
      qu1CNaklRReturnUpDate.Params.ParamValues['SP1562'] := ABS(SummaNakl / 120
        * 100); //(P)СуммаБезНДС      |N   |13    |2
      qu1CNaklRReturnUpDate.Params.ParamValues['SP1563'] := ABS(SummaNakl);
      //(P)СуммаСНДС        |N   |14    |3
      qu1CNaklRReturnUpDate.Params.ParamValues['SP1564'] := ABS(SummaNakl / 120
        * 20); //(P)НДС              |N   |14    |3
      qu1CNaklRReturnUpDate.Params.ParamValues['SP1567'] := ABS(SummaNakl / 120
        * 100); //(P)СуммаУчБезНДС    |N   |13    |2
      qu1CNaklRReturnUpDate.Execute;
    end
    else
    begin
      RashNaklObj.УстановитьНовыйНомер('РНн-');
      if VidNaklNo = 4 then
        RashNaklObj.ТП := 3
      else
        RashNaklObj.ТП := 2;
      RashNaklObj.Записать;
      ID1C := GetCurID1C(0);
      qu1CNaklRUpDate.Params.ParamValues['IDDOC'] := ID1C;
      qu1CNaklRUpDate.Params.ParamValues['SP1015'] := '  98' + DogovorID;
      qu1CNaklRUpDate.Params.ParamValues['SP11103'] :=
        quNaklRNew.FieldByName('Nom').asString;
      qu1CNaklRUpDate.Params.ParamValues['SP1012'] := PostID;
      qu1CNaklRUpDate.Params.ParamValues['SP1016'] := Sklad;
      qu1CNaklRUpDate.Params.ParamValues['SP1024'] := Otpustil;
      qu1CNaklRUpDate.Params.ParamValues['SP1037'] := SummaNakl;
      qu1CNaklRUpDate.Params.ParamValues['SP1040'] := SummaNakl;
      qu1CNaklRUpDate.Params.ParamValues['SP1029'] := SP1029;
      qu1CNaklRUpDate.Params.ParamValues['SP958'] := SP958;
      if VidNaklNo = 4 then
      begin
        qu1CNaklRUpDate.Params.ParamValues['SP1028'] := '    22';
        qu1CNaklRUpDate.Params.ParamValues['SP1017'] := '    1C';
        qu1CNaklRUpDate.Params.ParamValues['SP1039'] := SummaNakl;
        qu1CNaklRUpDate.Params.ParamValues['SP1041'] := 0;
        qu1CNaklRUpDate.Params.ParamValues['SP11093'] := 3
      end
      else
      begin
        qu1CNaklRUpDate.Params.ParamValues['SP1028'] := '    24';
        qu1CNaklRUpDate.Params.ParamValues['SP1017'] := '     2';
        qu1CNaklRUpDate.Params.ParamValues['SP1039'] := SummaNakl - (SummaNakl / 120 * 20);
        qu1CNaklRUpDate.Params.ParamValues['SP1041'] := SummaNakl / 120 * 20;
        qu1CNaklRUpDate.Params.ParamValues['SP11093'] := 2;
      end;
      qu1CNaklRUpDate.Execute;
    end;

    quRashod.Close;
    quRashod.ParamByName('NaklNo').AsInteger := NaklNo;
    quRashod.Open;
    quRashod.First;
    i := 1;
    while not quRashod.Eof do
    begin
      RashNaklObj.НоваяСтрока;
      RashNaklObj.Кво := ABS(quRashod.FieldByName('Kol').AsFloat);
      RashNaklObj.Коэффициент := 1;
      RashNaklObj.Записать;
      if is_return then
      begin
        qu1CTovarRReturnUpDate.Params.ParamValues['IDDOC'] := ID1C;
        //ID Document's       |C   |9     |0
        qu1CTovarRReturnUpDate.Params.ParamValues['LINENO'] := i;
        //LineNo              |N   |4     |0
        qu1CTovarRReturnUpDate.Params.ParamValues['SP1556'] :=
          quRashod.FieldByName('Tovar_ID1C').AsString;
        //(P)ТМЦ              |C   |9     |0
        qu1CTovarRReturnUpDate.Params.ParamValues['SP1557'] := PartiaID;
        //(P)Партия           |C   |9     |0
        qu1CTovarRReturnUpDate.Params.ParamValues['SP1560'] := EdIzmID;
        //(P)Ед               |C   |9     |0
        qu1CTovarRReturnUpDate.Params.ParamValues['SP1561'] :=
          quRashod.FieldByName('PriceOut').AsFloat / 120 * 100;
        //(P)ЦенаБезНДС       |N   |13    |2
        qu1CTovarRReturnUpDate.Params.ParamValues['SP1562'] :=
          (quRashod.FieldByName('PriceOut').AsFloat *
          ABS(quRashod.FieldByName('Kol').AsFloat)) -
          (((quRashod.FieldByName('PriceOut').AsFloat *
          ABS(quRashod.FieldByName('Kol').AsFloat)) / 120 * 20));
        //(P)СуммаБезНДС      |N   |13    |2
        qu1CTovarRReturnUpDate.Params.ParamValues['SP1563'] :=
          quRashod.FieldByName('PriceOut').AsFloat *
          ABS(quRashod.FieldByName('Kol').AsFloat);
        //(P)СуммаСНДС        |N   |14    |3
        qu1CTovarRReturnUpDate.Params.ParamValues['SP1564'] :=
          quRashod.FieldByName('PriceOut').AsFloat *
          ABS(quRashod.FieldByName('Kol').AsFloat) / 120 * 20;
        //(P)НДС              |N   |14    |3
        qu1CTovarRReturnUpDate.Params.ParamValues['SP1565'] := '     0';
        //(P)ДокПродажи       |C   |9     |0
        qu1CTovarRReturnUpDate.Params.ParamValues['SP1566'] :=
          quRashod.FieldByName('PriceOut').AsFloat / 120 * 100;
        //(P)ЦенаУчБезНДС     |N   |13    |2
        qu1CTovarRReturnUpDate.Params.ParamValues['SP1567'] :=
          (quRashod.FieldByName('PriceOut').AsFloat *
          ABS(quRashod.FieldByName('Kol').AsFloat)) -
          (((quRashod.FieldByName('PriceOut').AsFloat *
          ABS(quRashod.FieldByName('Kol').AsFloat)) / 120 * 20));
        //(P)СуммаУчБезНДС    |N   |13    |2
        qu1CTovarRReturnUpDate.Execute;
      end
      else
      begin
        qu1CTovarRUpDate.Params.ParamValues['IDDOC'] := ID1C;
        qu1CTovarRUpDate.Params.ParamValues['LINENO'] := i;
        qu1CTovarRUpDate.Params.ParamValues['SP1033'] :=
          quRashod.FieldByName('Kol').AsFloat;
        qu1CTovarRUpDate.Params.ParamValues['SP1031'] :=
          quRashod.FieldByName('Tovar_ID1C').AsString;
        qu1CTovarRUpDate.Params.ParamValues['SP1032'] := PartiaID;
        qu1CTovarRUpDate.Params.ParamValues['SP1035'] := EdIzmID;
        qu1CTovarRUpDate.Params.ParamValues['SP1038'] := 0;
        if VidNaklNo = 4 then
        begin
          qu1CTovarRUpDate.Params.ParamValues['SP1036'] :=
            quRashod.FieldByName('PriceOut').AsFloat;
          qu1CTovarRUpDate.Params.ParamValues['SP1037'] :=
            quRashod.FieldByName('PriceOut').AsFloat *
            quRashod.FieldByName('Kol').AsFloat;
          qu1CTovarRUpDate.Params.ParamValues['SP1039'] :=
            quRashod.FieldByName('PriceOut').AsFloat *
            quRashod.FieldByName('Kol').AsFloat;
          qu1CTovarRUpDate.Params.ParamValues['SP1040'] :=
            quRashod.FieldByName('PriceOut').AsFloat *
            quRashod.FieldByName('Kol').AsFloat;
          qu1CTovarRUpDate.Params.ParamValues['SP1041'] := 0;
        end
        else
        begin
          qu1CTovarRUpDate.Params.ParamValues['SP1036'] :=
            quRashod.FieldByName('PriceOut').AsFloat / 120 * 100;
          qu1CTovarRUpDate.Params.ParamValues['SP1037'] :=
            (quRashod.FieldByName('PriceOut').AsFloat *
            quRashod.FieldByName('Kol').AsFloat) -
            (((quRashod.FieldByName('PriceOut').AsFloat *
            quRashod.FieldByName('Kol').AsFloat) / 120 * 20));
          qu1CTovarRUpDate.Params.ParamValues['SP1039'] :=
            (quRashod.FieldByName('PriceOut').AsFloat *
            quRashod.FieldByName('Kol').AsFloat) -
            (((quRashod.FieldByName('PriceOut').AsFloat *
            quRashod.FieldByName('Kol').AsFloat) / 120 * 20));
          qu1CTovarRUpDate.Params.ParamValues['SP1040'] :=
            quRashod.FieldByName('PriceOut').AsFloat *
            quRashod.FieldByName('Kol').AsFloat;
          qu1CTovarRUpDate.Params.ParamValues['SP1041'] :=
            quRashod.FieldByName('PriceOut').AsFloat *
            quRashod.FieldByName('Kol').AsFloat / 120 * 20;
        end;
        qu1CTovarRUpDate.Execute;
      end;
      inc(i);
      quRashod.Next;
    end;
    SetDocOurFirm1c(ID1C);
    if is_return then
      SaveExport1cEntity(ID1C, 'DH1545', 'IDDOC',
        quNaklRNew.FieldByName('pkey').Value, 'NAKLR')
    else
      SaveExport1cEntity(ID1C, 'DH1011', 'IDDOC',
        quNaklRNew.FieldByName('pkey').Value, 'NAKLR');
    quNaklRNew.Next;
  end;
end;

procedure TfmExport1C.PKONew;
var
  DogovorID, IDDOC: string;
  k, count: Integer;
  PKO_1: Olevariant;
begin
  k := 0;
  Label1.Caption := 'Добавление "ПКО"';
  Label1.Refresh;
  quPlatPNew.Close;
  quPlatPNew.ParamByName('DateBegin').AsDate := Period[1];
  quPlatPNew.ParamByName('DateEnd').AsDate := Period[2];
  quPlatPNew.Open;
  quPlatPNew.First;
  count := quPlatPNew.RecordCount;
  while not quPlatPNew.Eof do
  begin
    PKO.Новый;
    PKO.НомерПО := quPlatPNew.FieldByName('Nom').AsInteger;
    PKO.СуммаВал := quPlatPNew.FieldByName('Summa').AsFloat;
    PKO.НДС := quPlatPNew.FieldByName('Summa').AsFloat / 120 * 20;
    PKO.ПоДокументу := Copy(quPlatPNew.FieldByName('Spravka').AsString, 1, 100);
    PKO.ТП := 6;
    PKO.ДатаДок := DateToStr(quPlatPNew.FieldByName('DatePlat').AsDateTime);
    PKO.УстановитьНовыйНомер('ПКО-');
    
    PKO_1 := onesobj.createobject('Документ.ПриходныйКассовый');
    if PKO_1.НайтиПоНомеру(PKO.НомерДок, PKO.ДатаДок) = 1 then begin
      ShowMessage('Номер не уникальный: ' + PKO.НомерДок);
      PKO_1 := UnAssigned;
    end;
    PKO_1 := UnAssigned;
    
    PKO.Записать;

    IDDOC := GetCurID1C(0);

    qu1CPlatUpDate.Params.ParamValues['IDDOC'] := IDDOC;
    //ID Document's       |C   |9     |0
    qu1CPlatUpDate.Params.ParamValues['SP1298'] := SP1298;
    //(P)РСчет            |C   |9     |0
    qu1CPlatUpDate.Params.ParamValues['SP1307'] := SP1029;
    //(P)Счет             |C   |13    |0
    qu1CPlatUpDate.Params.ParamValues['SP1302'] := 'B1  4U' +
      quPlatPNew.FieldByName('Post_ID1C').AsString;
    //+IDDOC;//(P)Субконто         |C   |23    |0
    qu1CPlatUpDate.Params.ParamValues['TSP1302'] := '1';
    //                    |C   |3     |0
     
    DogovorId := GetDogovor1C(quPlatPNew.FieldByName('Post_ID1C').AsString);

    qu1CPlatUpDate.Params.ParamValues['SP1303'] := 'O1  98' + DogovorID;
    //(P)Заказ            |C   |23    |0
    qu1CPlatUpDate.Params.ParamValues['TSP1303'] := '0';
    //                    |C   |3     |0
    qu1CPlatUpDate.Params.ParamValues['SP1311'] := '    24';
    //(P)ВидНДС           |C   |9     |0
    qu1CPlatUpDate.Params.ParamValues['SP1317'] := 0;
    //(P)УказанаОтгрузка  |N   |2     |0
    qu1CPlatUpDate.Params.ParamValues['SP1312'] := '    3C';
    //(P)ДоходИздержка    |C   |9     |0
    qu1CPlatUpDate.Params.ParamValues['SP1310'] := '     2';
    //(P)СубконтоВалДохРас|C   |9     |0
    qu1CPlatUpDate.Params.ParamValues['SP1313'] := Kassir;
    //Kassir;//(P)Кассир           |C   |9     |0
    qu1CPlatUpDate.Params.ParamValues['SP1314'] := 0;
    //(P)НеПроводить      |N   |2     |0
    qu1CPlatUpDate.Params.ParamValues['SP2919'] := '   298';
    //(P)ВидПриходаДенег  |C   |9     |0
    qu1CPlatUpDate.Params.ParamValues['SP3759'] := '  98     0';
    //(P)ДокументЗаказ    |C   |13    |0
    qu1CPlatUpDate.Params.ParamValues['SP5066'] := 1;
    //(P)ОперационнаяКР   |N   |2     |0
    qu1CPlatUpDate.Execute;

    SetDocOurFirm1c(IDDOC);
    SaveExport1cEntity(IDDOC, 'DH1297', 'IDDOC',
      quPlatPNew.FieldByName('pkey').Value, 'PLATP');
    quPlatPNew.Next;
    inc(k);
    Label2.Caption := IntToStr(k) + ' из ' + IntToStr(count);
    Label2.Refresh;

  end;
end;

end.

