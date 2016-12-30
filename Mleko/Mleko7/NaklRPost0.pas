unit NaklRPost0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MemDS, DBAccess, MSAccess, DB, DBTables, MlekoForm, GridsEh,
  DBGridEh, DBCtrlsEh, StdCtrls, Mask, DBLookupEh, ComCtrls, Grids, dbf, dbf_fields,
  DBGrids, RXDBCtrl, ShellApi, ExtCtrls, Excel2000, Registry, ActiveX, ComObj;

type
  TfmNaklRPost = class(TMlekoForm)
    TableDbf: TTable;
    dsNaklRPostExport: TDataSource;
    dsFilterPost: TDataSource;
    quFilterPost: TMSQuery;
    quFilterPostFirm: TStringField;
    quFilterPostPostNo: TSmallintField;
    RxdbgNaklRPost: TRxDBGrid;
    qu_NaklRPostExport: TMSQuery;
    ds_NaklRPostExport: TDataSource;
    quNaklRpostExport: TMSQuery;
    quNaklRpostExportTovarNoP: TIntegerField;
    quNaklRpostExportBarCode: TLargeintField;
    quNaklRpostExportNameTov: TStringField;
    quNaklRpostExportEdIzm: TStringField;
    quNaklRpostExportPrNoNDS: TFloatField;
    quNaklRpostExportPrice: TFloatField;
    quNaklRpostExportStavNDS: TStringField;
    quNaklRpostExportQTY: TFloatField;
    quNaklRpostExportSumNoNDS: TFloatField;
    quNaklRpostExportSumma: TFloatField;
    quNaklRpostExportNomNaklR: TIntegerField;
    quNaklRpostExportDate: TDateTimeField;
    quNaklRpostExportSumNaklR: TFloatField;
    quNaklRpostExportSNRNoNDS: TFloatField;
    quNaklRpostExportOurFirm: TStringField;
    quNaklRpostExportOurOKPO: TStringField;
    quNaklRpostExportFirm: TStringField;
    quNaklRpostExportAdrPost: TStringField;
    quNaklRpostExportPostNo: TSmallintField;
    Panel1: TPanel;
    SendDBF: TButton;
    SendDBFAll: TButton;
    Panel2: TPanel;
    lbFilterPost: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    cbFilterPost: TDBLookupComboboxEh;
    quExecuteExport: TMSQuery;
    quExecuteImport: TMSQuery;
    quNaklRpostExportAddresId: TIntegerField;
    MSQuery1: TMSQuery;
    SendDBFOneFile: TButton;
    od_ExportFile: TOpenDialog;
    sd_SaveFile: TSaveDialog;
    ExportNakl: TButton;
    ExportList: TButton;
    ImportList: TButton;
    ExpotrDBF: TButton;
    bDeskription: TButton;
    GroupBox1: TGroupBox;
    lbDateBeg: TLabel;
    dtDateBeg: TDateTimePicker;
    lbDateEnd: TLabel;
    dtDateEnd: TDateTimePicker;
    cbxDate: TCheckBox;
//    function DeleteDir(sDir : string) : Boolean;
    procedure makedir(value:string);
    procedure cbFilterPostExit(Sender: TObject);
    procedure dtDateBegExit(Sender: TObject);
//    procedure Button1Click(Sender: TObject);
    procedure dtDateEndExit(Sender: TObject);
    procedure SendDBFClick(Sender: TObject);
    procedure SendDBFAllClick(Sender: TObject);
    procedure cbxDateClick(Sender: TObject);
    procedure ExpotrDBFClick(Sender: TObject);
    procedure cbFilterPostChange(Sender: TObject);
    procedure dtDateBegChange(Sender: TObject);
    procedure dtDateEndChange(Sender: TObject);
    procedure ExportListClick(Sender: TObject);
    procedure ImportListClick(Sender: TObject);
    procedure SendDBFOneFileClick(Sender: TObject);
    procedure CreateAndSendExcelFile(PostNo : integer; DateBeg : TDateTime; DateEnd : TDateTime; Is_Period : boolean; Is_SendMail : boolean);
    procedure ExportNaklClick(Sender: TObject);
    procedure bDeskriptionClick(Sender: TObject);
   private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNaklRPost: TfmNaklRPost;

implementation

uses data, Main, NaklR0, ListPostForMail0, DescriptionNaklRPost0;

{$R *.dfm}

function ExecAndWait(const FileName,
                     Params: ShortString;
                     const WinState: Word): boolean; export;
var
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: ShortString;
begin
  { Помещаем имя файла между кавычками, с соблюдением всех пробелов в именах Win9x }
  CmdLine := '"' + Filename + '" ' + Params;
  FillChar(StartInfo, SizeOf(StartInfo), #0);
  with StartInfo do
  begin
    cb := SizeOf(StartInfo); 
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WinState;
  end;
  Result := CreateProcess(nil, PChar( String( CmdLine ) ), nil, nil, false,
                          CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
                          PChar(ExtractFilePath(Filename)),StartInfo,ProcInfo);
  { Ожидаем завершения приложения }
  if Result then
  begin
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    { Free the Handles }
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;

function DataTypeCodeToDataSetDataType(DataTypeCode: string): TFieldType;
begin
  result := ftUnknown;
  if DataTypeCode = 'VARCHAR' then result := ftString;
  if DataTypeCode = 'CHAR' then result := ftString;
  if DataTypeCode = 'CLOB' then result := ftMemo;
  if DataTypeCode = 'BLOB' then result := ftMemo;
  if DataTypeCode = 'FLOAT' then result := ftFloat;
  if DataTypeCode = 'SMALL_DATE' then result := ftDate;
  if DataTypeCode = 'DATE' then result := ftDateTime;
  if DataTypeCode = 'BOOL_Y_N' then result := ftBoolean;
  if DataTypeCode = 'BOOL_1_0' then result := ftBoolean;
  if DataTypeCode = 'INTEGER' then result := ftInteger;
  if DataTypeCode = 'BIGINT' then result := ftLargeint;
  if result = ftUnknown then raise Exception.Create('Неизвестный тип данных');
end;

function CreateDBFDataSet(FTable_ID: Int64; FilePath: string): TDbf;
var
  dbf: Tdbf;
  FldDef: TDbfFieldDef;
  FldDefs: TDbfFieldDefs;
  Size, precesion: Integer;
  DataType: TFieldType;
  required: boolean;
  FieldName, DbmsCode, STR_QUOTES: string;
  QuFAttributes : TMSQuery;
begin
  dbf := TDBF.Create(nil);
  dbf.TableLevel := 4;
  //dbf.LanguageID:=DbfLangId_RUS_866;
  FldDefs := TDbfFieldDefs.Create(nil);
  try

    DeleteFile(FilePath);
    ForceDirectories(ExtractFileDir(FilePath));
    Dbf.Close;
    dbf.TableName := FilePath;

    QuFAttributes:=TMSQuery.Create(nil);
    QuFAttributes.Connection:=dmDataModule.DB;
    QuFAttributes.SQL.Clear;
    QuFAttributes.SQL.Text:='select * from d_fattribute where FtableId=:FtableId';
    QuFAttributes.Prepare;
    QuFAttributes.ParamByName('FtableId').Value :=FTable_ID; //quExcFtableProcInfo.FieldByName('FTable_ID').Value;
    QuFAttributes.Open;
    QuFAttributes.First;

    while not QuFAttributes.Eof do
    begin
          //-------------------Наполнение структурой из d_fattribute--------------
      size := QuFAttributes.FieldByName('field_size').AsInteger;
      precesion := QuFAttributes.FieldByName('precession').AsInteger;
      DataType := DataTypeCodeToDataSetDataType(QuFAttributes.FieldByName('code').AsString);
      required := QuFAttributes.FieldByName('REQUIRED').AsString = 'Y';
      FieldName := QuFAttributes.FieldByName('Name').AsString;

      FldDef := FldDefs.AddFieldDef;
      FldDef.FieldType := DataType;
      FldDef.FieldName := FieldName;
      FldDef.Size := Size;
      FldDef.Precision := precesion;
      FldDef.Required := required;
          //-------------------Наполнение структурой из d_fattribute--------------
      QuFAttributes.Next;
    end;
    dbf.CreateTableEx(FldDefs);
    Result := dbf;
  finally
    QuFAttributes.Free;
    FldDefs.Free;
  end;
end;

procedure ExportToDBF(var DataSetFrom, DataSetTo: TdataSet;ToOem: Boolean);
var ln_str_value: string;
  FldValCount, i: Integer;
  ln_value: Real;
  Res_Stream: TStream;
  StreamWright: TStringStream;
  s : string;
  s2, s1: AnsiString;
  formattedDateTime : string;

begin
  FldValCount := DataSetFrom.FieldCount;
  DataSetFrom.First;
  if not DataSetTo.Active then DataSetTo.Open;
  while not DataSetFrom.eof do
  begin
    DataSetTo.Insert;
    for i := 0 to FldValCount - 1 do
    begin
      if DataSetFrom.Fields[i].AsString <> '' then
      begin
        case DataSetTo.Fields[i].DataType of
          ftString:
             if ToOEM then
             begin
              s := DataSetFrom.Fields[i].AsString; // Это - в кодировке 1251 из SQL Server
              AnsiToOem(PChar(s),PChar(s));  // Здесь происходит преобразование строки
              DataSetTo.Fields[i].AsString  := s;
             end
             else
              DataSetTo.Fields[i].AsString := DataSetFrom.Fields[i].AsString;
          ftFloat, ftCurrency, ftBCD:
            begin
              ln_str_value := DataSetFrom.Fields[i].AsString;
              ln_value := StrToFloat(StringReplace(StringReplace(ln_str_value, '.', DecimalSeparator, [rfReplaceAll,
                rfIgnoreCase])
                  , ',', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]));
              DataSetTo.Fields[i].AsFloat := ln_value;
            end;
          ftBoolean: DataSetTo.Fields[i].AsBoolean := (DataSetFrom.Fields[i].AsString = '1') or
            (DataSetFrom.Fields[i].AsString = 'Y');
          ftDate :
               begin
  //                date1 := strtodate(DataSetFrom.Fields[i].Value);


                  DateTimeToString(formattedDateTime,'dd/mm/yyyy',DataSetFrom.Fields[i].AsVariant);

                  DataSetTo.Fields[i].AsDateTime := strtodate(formattedDateTime);
               end;
          ftDateTime: DataSetTo.Fields[i].AsDateTime := DataSetFrom.Fields[i].AsDateTime;
          ftInteger: DataSetTO.Fields[i].AsInteger := DataSetFrom.Fields[i].AsInteger;
          ftMemo:
            begin
              StreamWright := TStringStream.Create(s2);
              Res_Stream := DataSetTo.CreateBlobStream(DataSetTo.Fields[i], bmReadWrite);
              try
                StreamWright.WriteString(DataSetFrom.Fields[i].AsString);
                s1 := DataSetFrom.Fields[i].AsString;
//                Res_Stream.WriteBuffer(s1,Length(s1));
                Res_Stream.CopyFrom(StreamWright, 0);
                DataSetTo.Post;
              finally
                Res_Stream.Free;
                StreamWright.Free;
              end;
            end;
        end;
      end;
    end;
    if DataSetTo.State in [dsEdit, dsInsert] then DataSetTo.Post;
    DataSetFrom.Next;
  end;
  DataSetTo.Active:= false;
  DataSetTo.Close;
end;

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

procedure TfmNaklRPost.makedir(value:string);
var i,x:integer;
    cur_dir:string;
    RootDir:String;
begin
  RootDir:=value[1]+value[2]+value[3];
  SetCurrentDirectory(pchar(RootDir));
  x:=1;
  cur_dir:='';
  if (value[1]='\') then x:=2;
  for i:=x to Length(value) do
   begin
    if not (value[i]='\')then
      cur_dir:=cur_dir+value[i];
    if (value[i]='\')or (i=length(value)) then
     begin
      if not DirectoryExists(cur_dir) then
       CreateDirectory(pchar(cur_dir),0);
      SetCurrentDirectory(pchar(cur_dir));
      cur_dir:='';
     end;
   end;
end;


function DeleteDir(sDir : string) : Boolean;
var
  iIndex: Integer;
  SearchRec: TSearchRec;
  sFileName: string;
  cnt: integer;
  dir2: string;
begin
  dir2:= sDir;
  Result := False;
  iIndex := FindFirst(sDir+ '\*.*', faAnyFile, SearchRec);

  while iIndex = 0 do
  begin
    sFileName := ExtractFileDir(sDir)+'\'+SearchRec.name;
    if SearchRec.Attr = faDirectory then
    begin
      if (SearchRec.name <> '' ) and (SearchRec.name <> '.') and
      (SearchRec.name <> '..') then
        DeleteDir(sFileName);
    end
    else
    begin
      if SearchRec.Attr <> faArchive then
        FileSetAttr(sFileName, faArchive);
//      if not DeleteFile(sFileName) then
      if not DeleteFile(sDir+'\'+SearchRec.name) then
        ShowMessage('Не могу удалить ' + sDir+'\'+SearchRec.name +'! Возможно он занят другой программой.'
                     + #10#13 +'Закройте программу или перезагрузите компьютер!');
      cnt:= 0;
      repeat
        inc(cnt);
        DeleteFile(sDir+'\'+SearchRec.name);
        sleep(100);
      until ((not (FileExists(sDir+'\'+SearchRec.name)  )) or (cnt > 20));
    end;

    iIndex := FindNext(SearchRec);
  end;

  FindClose(SearchRec);
  RemoveDir(sDir);
  Result := True;
end;

function DelDir(dir: string): Boolean;
var
  fos: TSHFileOpStruct;
begin
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc  := FO_DELETE;
    fFlags := FOF_SILENT or FOF_NOCONFIRMATION;
    pFrom  := PChar(dir + #0);
  end;
  Result := (0 = ShFileOperation(fos));
end;

procedure TfmNaklRPost.CreateAndSendExcelFile(PostNo : integer; DateBeg : TDateTime; DateEnd : TDateTime; Is_Period : boolean; Is_SendMail : boolean);
 var
   cls_ExcelObject: string;
   RegData: TRegistry;
   Workbook, WorkSheet, ArrayData, Excel, Range, Cell1, Cell2 : Variant;

   QuPreparationSQL: TMSQuery;
   QuExportExcelFile: TMSQuery;
   QuSendXLSA: TMSQuery;
   QuSendXLS: TMSQuery;
   QuSendXLSN: TMSQuery;
   Select, Select1, fname, fname1, xls_name, dbf_name1 : String;
   Topic, Message, Mail1, Mail2, Mail3 : String;
   ExecString, s, FilePath  : String;
   AddressNo : Integer;
   BeginCol, BeginRow, RowCount, ColCount, j: integer;
   ErrorCode : Integer;
begin
   BeginCol := 1;
   BeginRow := 1;

  QuPreparationSQL := TMSQuery.Create(nil);
  QuPreparationSQL.Connection:=dmDataModule.DB;
  QuPreparationSQL.SQL.Clear;
  QuPreparationSQL.SQL.Text :=  'select Column_Name '
                               +'  from L_VidExportExelFile '
                               +'   where Is_Checked = 1 '
                               +'     and PostNo = :PostNo '
                               +'order by N_pp';
  QuPreparationSQL.ParamByName('PostNo').AsInteger := PostNo;
  QuPreparationSQL.Open;

  if QuPreparationSQL.RecordCount = 0 then raise Exception.Create('Для фирмы № ' + IntToStr(PostNo) + #10#13 +
                                                                  'Не настроен формат файла.');
  QuPreparationSQL.First;
  Select := '';

  while not QuPreparationSQL.Eof do
   begin
     if Is_SendMail then begin
     {
                           if QuPreparationSQL.FieldByName('Column_Name').AsString = 'BarCode'
                            then Select := Select + ' '''''''' + cast('+QuPreparationSQL.FieldByName('Column_Name').AsString+' as varchar) + '''''''' ' + ', '
                            else
      }
                            Select := Select + QuPreparationSQL.FieldByName('Column_Name').AsString + ', ';
                         end
                    else begin
      {
                           if QuPreparationSQL.FieldByName('Column_Name').AsString = 'BarCode'
                            then Select := Select + ' '''''''' + cast('+QuPreparationSQL.FieldByName('Column_Name').AsString+' as varchar) + '''''''' ' + ', '
                            else
       }
                            Select := Select + 'cast('+QuPreparationSQL.FieldByName('Column_Name').AsString+' as varchar), ';
                         end;
     Select1 := Select1 + '''' + QuPreparationSQL.FieldByName('Column_Name').AsString +''''+ ', ';
     QuPreparationSQL.Next;
   end;
  delete (Select,Length(Select)-1,Length(Select));
  delete (Select1,Length(Select1)-1,Length(Select1));
   //////////////////

  QuSendXLSA:=TMSQuery.Create(nil);
  QuSendXLSA.Connection:=dmDataModule.DB;
  QuSendXLSA.SQL.Clear;
  QuSendXLSA.SQL.Text:='select distinct AddressNo  '
                     +'        ,AdrPost            '
                     +'  from v_NaklRPost_Export v '
                     +'   where v.PostNo = :PostNo '
                     +'    and Isnull (:date1,cast(v.date as date)) <= cast(v.date as date)'
                     +'    and Isnull (:date2,cast(v.date as date)) >= cast(v.date as date)';
  QuSendXLSA.Prepare;
  QuSendXLSA.ParamByName('PostNo').Value := PostNo;

  if Is_period then begin
                      QuSendXLSA.ParamByName('Date1').AsDate := DateBeg;
                      QuSendXLSA.ParamByName('Date2').AsDate := DateEnd;
                    end;

  QuSendXLSA.Open;

  if QuSendXLSA.RecordCount = 0 then raise Exception.Create('Не верно заданы фильтры!'+ #10#13 +QuSendXLSA.SQL.Text);

  QuSendXLSA.First;

  while not QuSendXLSA.Eof do

  begin // 2

     AddressNo := QuSendXLSA.FieldByName('AddressNo').AsInteger;
     fname := 'd:\\Temp_send_MAIL\\' + IntToStr(PostNo)+'\\'+QuSendXLSA.FieldByName('AddressNo').AsString;
     fname1 := 'd:\Temp_send_MAIL\' + IntToStr(PostNo)+'\'+QuSendXLSA.FieldByName('AddressNo').AsString;


     DelDir(fname1);
     makedir(fname);

     ExecString := '';
     s := '''0''';


     QuSendXLS:=TMSQuery.Create(nil);
     QuSendXLS.Connection:=dmDataModule.DB;
     QuSendXLS.SQL.Clear;
     QuSendXLS.SQL.Text:='select PostNo'
                        +'       ,isnull(case when LEN(Topic)<1 then '+s+' else Topic end,'+s+') Topic'
                        +'       ,isnull(case when LEN(Message)<1 then '+s+' else Message end,'+s+') Message'
                        +'       ,isnull(case when LEN(Mail1)<1 then '+s+' else Mail1 end,'+s+') Mail1'
                        +'       ,isnull(case when LEN(Mail2)<1 then '+s+' else Mail2 end,'+s+') Mail2'
                        +'       ,isnull(case when LEN(Mail3)<1 then '+s+' else Mail3 end,'+s+') Mail3'
                        +'  from Post_Mail where PostNo = :PostNo and AddressNo = :AddressNo'
                        +'   ';
     QuSendXLS.Prepare;
     QuSendXLS.ParamByName('PostNo').Value := cbFilterPost.KeyValue;
     QuSendXLS.ParamByName('AddressNo').Value := AddressNo;
     QuSendXLS.Open;

     if QuSendXLS.RecordCount =0 then raise Exception.Create('Проверьте наличие электронного адреса у контрагента! '+ #10#13+'По адресу доставки: '+QuSendXLSA.FieldByName('AdrPost').AsString+'. Нет электронного адреса'+  #10#13 +QuSendXLS.SQL.Text);

     Topic := QuSendXLS.FieldByName('Topic').AsString;
     Message := QuSendXLS.FieldByName('Message').AsString;
     Mail1 := QuSendXLS.FieldByName('Mail1').AsString;
     Mail2 := QuSendXLS.FieldByName('Mail2').AsString;
     Mail3 := QuSendXLS.FieldByName('Mail3').AsString;

     QuSendXLS.Close;

     ExecString := Mail1 +' '+ Mail2 +' '+ Mail3 +' '+'"'+ Topic+'"' +' '+'"'+ Message+'"'  +' '+  fname+'\\';

     QuSendXLSN:=TMSQuery.Create(nil);
     QuSendXLSN.Connection:=dmDataModule.DB;
     QuSendXLSN.SQL.Clear;
     QuSendXLSN.SQL.Text:='select distinct NomNaklR '
                         +'               ,Date '
                         +' from v_NaklRPost_Export v '
                         +'  where v.PostNo = Isnull(:PostNo ,v.PostNo) '
                         +'    and v.AddressNo = Isnull(:AddressNo ,v.AddressNo)'
                         +'    and Isnull (:date1,cast(v.date as date)) <= cast(v.date as date)'
                         +'    and Isnull (:date2,cast(v.date as date)) >= cast(v.date as date)';
     QuSendXLSN.Prepare;
     QuSendXLSN.ParamByName('PostNo').Value := cbFilterPost.KeyValue;
     QuSendXLSN.ParamByName('AddressNo').Value := AddressNo;

     if not Is_period then begin
                             QuSendXLSN.ParamByName('Date1').Clear;
                             QuSendXLSN.ParamByName('Date2').Clear;
                           end;
     if Is_period then begin
                         QuSendXLSN.ParamByName('Date1').AsDate := DateBeg;
                         QuSendXLSN.ParamByName('Date2').AsDate := DateEnd;
                       end;
     QuSendXLSN.Open;
     QuSendXLSN.First;

     if QuSendXLSN.RecordCount =0 then raise Exception.Create('Нет записи в запросе! Проверьте условия фильтров!!!'+ #10#13 +QuSendXLSN.SQL.Text);

     while not QuSendXLSN.Eof do
       begin // QuSendXLSN
         xls_name := fname1 + '\'+QuSendXLSN.FieldByName('Date').AsString+'_'+QuSendXLSN.FieldByName('NomNaklR').AsString+'.xls';

         QuExportExcelFile := TMSQuery.Create(nil);
         QuExportExcelFile.Connection:=dmDataModule.DB;
         QuExportExcelFile.SQL.Clear;
         if Is_SendMail then begin
                               QuExportExcelFile.SQL.Text :=  'select ' + Select
                                                             +' from V_NaklRPost_Export '
                                                             +'  where PostNo = :PostNo '
                                                             +'    and Isnull (:DateBeg,cast(date as date)) <= cast(date as date) '
                                                             +'    and Isnull (:DateEnd,cast(date as date)) >= cast(date as date) '
                                                             +'    and NomNaklR = isnull(:NomNaklR,NomNaklR) '
                                                             +'order by VidName, NameTovar ';
                             end
                        else begin
                               QuExportExcelFile.SQL.Text :=  'select ' + Select1
                                                             +'union all '
                                                             +'select ' + Select
                                                             +' from V_NaklRPost_Export '
                                                             +'  where PostNo = :PostNo '
                                                             +'    and Isnull (:DateBeg,cast(date as date)) <= cast(date as date) '
                                                             +'    and Isnull (:DateEnd,cast(date as date)) >= cast(date as date) '
                                                             +'    and NomNaklR = isnull(:NomNaklR,NomNaklR) ';
//                                                             +'order by VidName, NameTovar ';
                             end;
         QuExportExcelFile.ParamByName('PostNo').AsInteger := PostNo;
         QuExportExcelFile.ParamByName('NomNaklR').AsInteger := QuSendXLSN.FieldByName('NomNaklR').AsInteger;

         if Is_period then begin
                             QuExportExcelFile.ParamByName('DateBeg').AsDate := DateBeg;
                             QuExportExcelFile.ParamByName('DateEnd').AsDate := DateEnd;
                           end;
         QuExportExcelFile.Open;

         if QuExportExcelFile.RecordCount = 0 then raise Exception.Create('Для фирмы № ' + IntToStr(PostNo) + #10#13 +
                                                                          'за период с ' + datetostr(DateBeg) + ' по '+ datetostr(DateEnd) + #10#13 +
                                                                          'продаж не было!');
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

//         Excel.Application.EnableEvents := true;
//         Excel.Application.Interactive := true;
//         Excel.Application.DisplayAlerts := true;
         Excel.ActiveWorkBook.SaveAs(xls_name);
//         Excel.ActiveWorkBook.Close(0); // xlDontSaveChanges
         Excel.Quit;
         Excel := Unassigned;

         QuSendXLSN.Next;
       end; // QuSendDBFN

     FilePath := ExtractFilePath(Application.ExeName)+'Send_Mail.exe';
     if Is_SendMail then
         if ShellExecute(0,
                         'open',
                         pAnsiChar(FilePath),
                         pAnsiChar(ExecString),
                         pAnsiChar(ExtractFilePath(Application.ExeName)),
                         SW_MINIMIZE ) < 32
         then Begin
                ErrorCode := ShellExecute(0,'open',pAnsiChar(FilePath),pAnsiChar(ExecString),pAnsiChar(ExtractFilePath(Application.ExeName)),SW_MINIMIZE);
                ShowMessage(' Не запустилась программа ' + FilePath + '! (Модуль отправки письма).'+ #10#13 +
                            'Сообщите системному администратору!'+ #10#13 +
                            'Код ошибки '+ IntToStr(ErrorCode));
              End;
     if not Is_SendMail then showmessage ('Выгрузка накладных в' + fname1 + ' завершена');
     QuSendXLSA.Next;
   end;
   QuPreparationSQL.Close;
   if Is_SendMail then showmessage ('Отправка писем завершена');
//                  else showmessage ('Выгрузка накладных в'+''+' завершена');
end;





procedure TfmNaklRPost.cbFilterPostExit(Sender: TObject);
begin
  quNaklRPostExport.Close;
  if cbFilterPost.Text = '' then quNaklRPostExport.ParamByName('PostNo').Clear
                            else quNaklRPostExport.ParamByName('PostNo').AsString := cbFilterPost.KeyValue;
  quNaklRPostExport.Open;
  RxdbgNaklRPost.Refresh;
end;

procedure TfmNaklRPost.dtDateBegExit(Sender: TObject);
var
  formattedDateTime : String;
begin
  quNaklRPostExport.Close;

  DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
  quNaklRPostExport.ParamByName('Date1').AsDate := strtodate(formattedDateTime);

  quNaklRPostExport.Open;
  RxdbgNaklRPost.Refresh;
end;

procedure TfmNaklRPost.dtDateEndExit(Sender: TObject);
var
  formattedDateTime : String;
begin
  quNaklRPostExport.Close;

  DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateEnd.Date);
  quNaklRPostExport.ParamByName('Date2').AsDate := strtodate(formattedDateTime);

  quNaklRPostExport.Open;
  RxdbgNaklRPost.Refresh;
end;

{
procedure TfmNaklRPost.Button1Click(Sender: TObject);
 var
   fname, dbf_name :string;
begin
fname := 'd:\Send_mail\' + IntToStr(cbFilterPost.KeyValue);

makedir(fname);
{  if not SaveDialog.execute then
    raise Exception.Create('Не задано имя файла!');
 }
{
  fname := SaveDialog.FileName; }
{
   dbf_name := fname + '\NaklR.dbf';

  if FileExists(dbf_name) then
    DeleteFile(dbf_name);




  with TableDBF do
  begin
    DatabaseName := extractfilepath(fname); (* alias *)
    TableName := dbf_name;
    TableType := ttFoxPro;

    with FieldDefs do
    begin
      Clear;
      with AddFieldDef do
      begin
        Name := 'TovarNoP';
        DataType := ftInteger;
      end;

      with AddFieldDef do
      begin
        Name := 'BarCode';
        DataType := ftString;
      end;

      with AddFieldDef do
      begin
        Name := 'NameTov';
        DataType := ftString;
      end;

      with AddFieldDef do
      begin
        Name := 'EdIzm';
        DataType := ftString;
      end;

      with AddFieldDef do
      begin
        Name := 'PrNoNDS';
        DataType := ftFloat;
      end;

      with AddFieldDef do
      begin
        Name := 'Price';
        DataType := ftFloat;
      end;

      with AddFieldDef do
      begin
        Name := 'StavNDS';
        DataType := ftString;
      end;

      with AddFieldDef do
      begin
        Name := 'QTY';
        DataType := ftFloat;
      end;
      with AddFieldDef do
      begin
        Name := 'SumNoNDS';
        DataType := ftFloat;
      end;
      with AddFieldDef do
      begin
        Name := 'Summa';
        DataType := ftFloat;
      end;
      with AddFieldDef do
      begin
        Name := 'NomNaklR';
        DataType := ftInteger;
      end;
      with AddFieldDef do
      begin
        Name := 'Date';
        DataType := ftString;
      end;
      with AddFieldDef do
      begin
        Name := 'SumNaklR';
        DataType := ftFloat;
      end;
      with AddFieldDef do
      begin
        Name := 'OurFirm';
        DataType := ftString;
      end;
      with AddFieldDef do
      begin
        Name := 'OurOKPO';
        DataType := ftString;
      end;
      with AddFieldDef do
      begin
        Name := 'Firm';
        DataType := ftString;
      end;
      with AddFieldDef do
      begin
        Name := 'AdrPost';
        DataType := ftString;
      end;

    end;
    CreateTable;
    Open;
  end;
 }
{
  dmDataModule.QFO.Close;
  dmDataModule.QFO.SQL.Add('select * from v_NaklRPost_Export where PostNo= ' + IntToStr(cbFilterPost.KeyValue));
  dmDataModule.QFO.Open;
  dmDataModule.QFO.First;
}
{
  quNaklRPostExport.Close;
  quNaklRPostExport.ParamByName('PostNo').AsString := cbFilterPost.KeyValue;
  quNaklRPostExport.ParamByName('Date1').AsDate := dtDateBeg.Date;
  quNaklRPostExport.ParamByName('Date2').AsDate := dtDateEnd.Date;
  quNaklRPostExport.Open;

  if quNaklRPostExport.RecordCount =0 then raise Exception.Create('Не верные условия фильтров.');

  quNaklRPostExport.First;


  while not quNaklRPostExport.Eof do
  begin
    TableDbf.Insert;
    TableDBF.FieldByName('TovarNoP').AsInteger := quNaklRPostExport.FieldByName('TovarNoPost').AsInteger;
    TableDBF.FieldByName('BarCode').AsString := IntToStr(quNaklRPostExport.FieldByName('BarCode').AsInteger);
    TableDBF.FieldByName('NameTov').AsString := quNaklRPostExport.FieldByName('NameTovar').AsString;
    TableDBF.FieldByName('EdIzm').AsString := quNaklRPostExport.FieldByName('EdIzm').AsString;
    TableDBF.FieldByName('PrNoNDS').AsFloat := quNaklRPostExport.FieldByName('PriceNoNDS').AsFloat;
    TableDBF.FieldByName('Price').AsFloat := quNaklRPostExport.FieldByName('Price').AsFloat;
    TableDBF.FieldByName('StavNDS').AsString := quNaklRPostExport.FieldByName('StavkaNDS').AsString;
    TableDBF.FieldByName('QTY').AsFloat := quNaklRPostExport.FieldByName('QTY').AsFloat;
    TableDBF.FieldByName('SumNoNDS').AsFloat := quNaklRPostExport.FieldByName('SummaNoNDS').AsFloat;
    TableDBF.FieldByName('Summa').AsFloat := quNaklRPostExport.FieldByName('Summa').AsFloat;
    TableDBF.FieldByName('NomNaklR').AsInteger := quNaklRPostExport.FieldByName('NomNaklR').AsInteger;
    TableDBF.FieldByName('Date').AsString := quNaklRPostExport.FieldByName('Date').AsString;
    TableDBF.FieldByName('SumNaklR').AsFloat := quNaklRPostExport.FieldByName('SummaNaklR').AsFloat;
    TableDBF.FieldByName('OurFirm').AsString := quNaklRPostExport.FieldByName('OurFirm').AsString;
    TableDBF.FieldByName('OurOKPO').AsString := quNaklRPostExport.FieldByName('OurOKPO').AsString;
    TableDBF.FieldByName('Firm').AsString := quNaklRPostExport.FieldByName('Firm').AsString;
    TableDBF.FieldByName('AdrPost').AsString := quNaklRPostExport.FieldByName('AddesPost').AsString;

    TableDBF.Post;
    quNaklRPostExport.Next;
  end;
  TableDBF.FlushBuffers;
  TableDBF.Active := false;
  showmessage('Сформирован файл ' + dbf_name);

end;
}


procedure TfmNaklRPost.SendDBFClick(Sender: TObject);
var DataSetFrom,DataSetTo : TDataSet;
    formattedDateTime, formattedDateTime1 : String;
    FTable_ID : int64;
    fname     : String;
    fname1    : String;
    dbf_name  : String;
    dbf_name1 : String;
    Topic     : String;
    Message   : String;
    Mail1     : String;
    Mail2     : String;
    Mail3     : String;
    QuSendDBF : TMSQuery;
    QuSendDBFA: TMSQuery;
    QuSendDBFN: TMSQuery;
    QuCheck   : TMSQuery;
    ExecString: String;
    s         : String;
    FilePath  : String;
    AddressNo : Integer;
begin  //1
  inherited;

  QuCheck:=TMSQuery.Create(nil);
  QuCheck.Connection:=dmDataModule.DB;
  QuCheck.SQL.Clear;
  QuCheck.SQL.Text := 'select * '
                     +' from L_ExportInExcelFile '
                     +'  where PostNo = :PostNo ';
  QuCheck.Prepare;
  QuCheck.ParamByName('PostNo').Value := cbFilterPost.KeyValue;
  QuCheck.Open;

  if cbFilterPost.Text = '' then raise Exception.Create('Не задан контрагент.');

  if QuCheck.RecordCount <> 0 and QuCheck.FieldByName('Check1').Value = true then begin
                                                                                 DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                                                                                 DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);

                                                                                 CreateAndSendExcelFile(cbFilterPost.KeyValue,strtodate(formattedDateTime),strtodate(formattedDateTime1),cbxDate.Checked,True);
                                                                                 QuCheck.Close;
                                                                                 Exit;
                                                                               end;

  QuCheck.Close;

  QuSendDBFA:=TMSQuery.Create(nil);
  QuSendDBFA.Connection:=dmDataModule.DB;
  QuSendDBFA.SQL.Clear;
  QuSendDBFA.SQL.Text:='select distinct AddressNo  '
                     +'        ,AdrPost            '
                     +'  from v_NaklRPost_Export v '
                     +'   where v.PostNo = :PostNo '
                     +'    and Isnull (:date1,cast(v.date as date)) <= cast(v.date as date)'
                     +'    and Isnull (:date2,cast(v.date as date)) >= cast(v.date as date)';
  QuSendDBFA.Prepare;
  QuSendDBFA.ParamByName('PostNo').Value := cbFilterPost.KeyValue;

  if not cbxDate.Checked then begin
                                QuSendDBFA.ParamByName('Date1').Clear;
                                QuSendDBFA.ParamByName('Date2').Clear;
                              end;
  if cbxDate.Checked then begin
                             DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                             DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);
                             QuSendDBFA.ParamByName('Date1').AsDate := strtodate(formattedDateTime);
                             QuSendDBFA.ParamByName('Date2').AsDate := strtodate(formattedDateTime1);
                           end;

  QuSendDBFA.Open;

  if QuSendDBFA.RecordCount =0 then raise Exception.Create('Не верно заданы фильтры!'+ #10#13 +QuSendDBFA.SQL.Text);

  QuSendDBFA.First;

  while not QuSendDBFA.Eof do

  begin // 2

  AddressNo := QuSendDBFA.FieldByName('AddressNo').AsInteger;
  fname := 'd:\\Temp_send_MAIL\\' + IntToStr(cbFilterPost.KeyValue)+'\\'+QuSendDBFA.FieldByName('AddressNo').AsString;
  fname1 := 'd:\Temp_send_MAIL\' + IntToStr(cbFilterPost.KeyValue)+'\'+QuSendDBFA.FieldByName('AddressNo').AsString;

{
  dbf_name := fname + '*.dbf';
  dbf_name1 := fname + '*.rar';


  if (FileExists(dbf_name) or FileExists(dbf_name1)) then begin
                                 if not DeleteFile(dbf_name) then raise Exception.Create('Не могу удалить '+dbf_name+'! Возможно он занят другой программой.'
                                                                                         + #10#13 +'Закройте программу или перезагрузите компьютер!');
                                 DelDir(fname1);
                               end;
}

  DelDir(fname1);
  makedir(fname);

  ExecString := '';
  s := '''0''';


  QuSendDBF:=TMSQuery.Create(nil);
  QuSendDBF.Connection:=dmDataModule.DB;
  QuSendDBF.SQL.Clear;
  QuSendDBF.SQL.Text:='select PostNo'
                     +'       ,isnull(case when LEN(Topic)<1 then '+s+' else Topic end,'+s+') Topic'
                     +'       ,isnull(case when LEN(Message)<1 then '+s+' else Message end,'+s+') Message'
                     +'       ,isnull(case when LEN(Mail1)<1 then '+s+' else Mail1 end,'+s+') Mail1'
                     +'       ,isnull(case when LEN(Mail2)<1 then '+s+' else Mail2 end,'+s+') Mail2'
                     +'       ,isnull(case when LEN(Mail3)<1 then '+s+' else Mail3 end,'+s+') Mail3'
                     +'  from Post_Mail where PostNo = :PostNo and AddressNo = :AddressNo'
                     +'   ';
  QuSendDBF.Prepare;
  QuSendDBF.ParamByName('PostNo').Value := cbFilterPost.KeyValue;
  QuSendDBF.ParamByName('AddressNo').Value := AddressNo;
  QuSendDBF.Open;

  if QuSendDBF.RecordCount =0 then raise Exception.Create('Проверьте наличие электронного адреса у контрагента! '+ #10#13+'По адресу доставки: '+QuSendDBFA.FieldByName('AdrPost').AsString+'. Нет электронного адреса'+  #10#13 +QuSendDBF.SQL.Text);

  Topic := QuSendDBF.FieldByName('Topic').AsString;
  Message := QuSendDBF.FieldByName('Message').AsString;
  Mail1 := QuSendDBF.FieldByName('Mail1').AsString;
  Mail2 := QuSendDBF.FieldByName('Mail2').AsString;
  Mail3 := QuSendDBF.FieldByName('Mail3').AsString;

  QuSendDBF.Close;

  ExecString := Mail1 +' '+ Mail2 +' '+ Mail3 +' '+'"'+ Topic+'"' +' '+'"'+ Message+'"'  +' '+  fname+'\\';


     try
////////////


       QuSendDBFN:=TMSQuery.Create(nil);
       QuSendDBFN.Connection:=dmDataModule.DB;
       QuSendDBFN.SQL.Clear;
       QuSendDBFN.SQL.Text:='select distinct NomNaklR '
                           +' from v_NaklRPost_Export v '
                           +'  where v.PostNo = Isnull(:PostNo ,v.PostNo) '
                           +'    and v.AddressNo = Isnull(:AddressNo ,v.AddressNo)'
                           +'    and Isnull (:date1,cast(v.date as date)) <= cast(v.date as date)'
                           +'    and Isnull (:date2,cast(v.date as date)) >= cast(v.date as date)';
       QuSendDBFN.Prepare;
       QuSendDBFN.ParamByName('PostNo').Value := cbFilterPost.KeyValue;
       QuSendDBFN.ParamByName('AddressNo').Value := AddressNo;
       if not cbxDate.Checked then begin
                                       QuSendDBFN.ParamByName('Date1').Clear;
                                       QuSendDBFN.ParamByName('Date2').Clear;
                                     end;
         if cbxDate.Checked then begin
                                   DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                                   DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);
                                   QuSendDBFN.ParamByName('Date1').AsDate := strtodate(formattedDateTime);
                                   QuSendDBFN.ParamByName('Date2').AsDate := strtodate(formattedDateTime1);
                                 end;
       QuSendDBFN.Open;
       QuSendDBFN.First;

       if QuSendDBFN.RecordCount =0 then raise Exception.Create('Нет записи в запросе! Проверьте условия фильтров!!!'+ #10#13 +QuSendDBF.SQL.Text);

//       showmessage(inttostr(QuSendDBFN.RecordCount));

       while not QuSendDBFN.Eof do
       begin
       dbf_name := fname + '\\'+QuSendDBFN.FieldByName('NomNaklR').AsString+'.dbf';
//      showmessage (dbf_name);

         quNaklRPostExport.Close;
         quNaklRPostExport.ParamByName('PostNo').AsString := cbFilterPost.KeyValue;
         if not cbxDate.Checked then begin
                                       quNaklRPostExport.ParamByName('Date1').Clear;
                                       quNaklRPostExport.ParamByName('Date2').Clear;
                                     end;
         if cbxDate.Checked then begin
                                   DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                                   DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);
                                   quNaklRPostExport.ParamByName('Date1').AsDate := strtodate(formattedDateTime);
                                   quNaklRPostExport.ParamByName('Date2').AsDate := strtodate(formattedDateTime1);
                                 end;
         quNaklRPostExport.ParamByName('AddressNo').AsInteger := QuSendDBFA.FieldByName('AddressNo').AsInteger;
         quNaklRPostExport.ParamByName('NomNaklR').AsInteger := QuSendDBFN.FieldByName('NomNaklR').AsInteger;
         quNaklRPostExport.Open;

         if quNaklRPostExport.RecordCount =0 then raise Exception.Create('Не верные условия фильтров.');

         FTable_ID:=99;
         DataSetFrom := quNaklRPostExport as TDataset;
         DataSetTo:= CreateDBFDataSet(FTable_ID,dbf_name) as TDataset;
         ExportTODBF(DataSetFrom,DataSetTo,True);
         QuSendDBFN.Next;
       end;

     except
        ShowMessage('Ошибка экспорта в dbf' + #10#13 + dbf_name);
     end;


//  showmessage(ExecString);
         FilePath := ExtractFilePath(Application.ExeName)+'Send_Mail.exe';
         if ShellExecute(0,
                         'open',
                         pAnsiChar(FilePath),
                         pAnsiChar(ExecString),
                         pAnsiChar(ExtractFilePath(Application.ExeName)),
                         SW_MINIMIZE ) < 32
         then
           ShowMessage('Не запустилась программа Send_Mail.exe! (Модуль отправки письма).'+ #10#13 +' Сообщите системному администратору!');

//  ShowMessage(fname);

  QuSendDBFA.Next;
  end; // 2
  quNaklRPostExport.Close;
  quNaklRPostExport.ParamByName('PostNo').AsString := cbFilterPost.KeyValue;
  if not cbxDate.Checked then begin
                                quNaklRPostExport.ParamByName('Date1').Clear;
                                quNaklRPostExport.ParamByName('Date2').Clear;
                              end;
  if cbxDate.Checked then begin
                            DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                            DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);
                            quNaklRPostExport.ParamByName('Date1').AsDate := strtodate(formattedDateTime);
                            quNaklRPostExport.ParamByName('Date2').AsDate := strtodate(formattedDateTime1);
                          end;
  quNaklRPostExport.ParamByName('AddressNo').Clear;
  quNaklRPostExport.ParamByName('NomNaklR').Clear;
  quNaklRPostExport.Open;
  RxdbgNaklRPost.Refresh;
  QuSendDBFA.Close;
  QuSendDBFN.Close;
  showmessage ('Отправка писем завершена');
end; //1


procedure TfmNaklRPost.SendDBFAllClick(Sender: TObject);
var
  QuUpdate : TMSQuery;
  QuExecProg : TMSQuery;
  formattedDateTime : String;
  formattedDateTime1 : String;
  FilePath  : String;
  ExecString: String;
  Dlg : TListPostForMail;
begin
  inherited;
  DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
  DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);

  QuUpdate:=TMSQuery.Create(nil);
  QuUpdate.Connection:=dmDataModule.DB;
  QuUpdate.SQL.Clear;
  QuUpdate.SQL.Text:= 'update ListPostMail'
                     +'  set DateBeg = :DateBeg '
                     +'     ,DateEnd = :DateEnd '
                     +'   ';
//  QuUpdate.Prepare;
  QuUpdate.ParamByName('DateBeg').AsDate := strtodate(formattedDateTime);
  QuUpdate.ParamByName('DateEnd').AsDate := strtodate(formattedDateTime1);
  QuUpdate.Execute;
  QuUpdate.Close;

  Dlg := TListPostForMail.Create(Application);
  Dlg.quListPostForMail.Open;
  try
   if Dlg.ShowModal = mrok Then begin
   {
                                  QuExecProg := TMSQuery.Create(nil);
                                  QuExecProg.Connection:=dmDataModule.DB;
                                  QuExecProg.SQL.Clear;
                                  QuExecProg.SQL.Text := 'exec dbo.sp_SendMailAll';
                                  QuExecProg.Execute;
                                  QuExecProg.Close;
    }
                                  FilePath := ExtractFilePath(Application.ExeName)+'CreateDBFForMail.exe';
                                  ExecAndWait(FilePath, '', SW_HIDE);
                                  ShowMessage ('Отправка писем завершена');
{
                                  if ShellExecute(0,
                                                  'open',
                                                  pAnsiChar(FilePath),
                                                  pAnsiChar(ExecString),
                                                  pAnsiChar(ExtractFilePath(Application.ExeName)),
                                                  SW_MINIMIZE ) < 32
                                   then ShowMessage('Не запустилась программа CreateDBFForMail.exe! (Можуль отправки письем).'+ #10#13 +' Сообщите системному администратору!')
                                   else ShowMessage ('Отправка писем завершена');
}
                                end
                           Else showmessage ('Отправка отменена пользователем!');
  finally
  Dlg.quListPostForMail.Close;
  Dlg.Free;
  end;
//-----------------

end;



procedure TfmNaklRPost.cbxDateClick(Sender: TObject);
var
  formattedDateTime : String;
  formattedDateTime1 : String;
begin
  inherited;
  quNaklRPostExport.Close;
  dtDateBeg.Enabled := cbxDate.Checked;
  dtDateEnd.Enabled := cbxDate.Checked;
  if not cbxDate.Checked then begin
                                quNaklRPostExport.ParamByName('Date1').Clear;
                                quNaklRPostExport.ParamByName('Date2').Clear;
                              end;
  if cbxDate.Checked then begin
                            DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                            DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);
                            quNaklRPostExport.ParamByName('Date1').AsDate := strtodate(formattedDateTime);
                            quNaklRPostExport.ParamByName('Date2').AsDate := strtodate(formattedDateTime1);
                          end;
  quNaklRPostExport.Open;
  RxdbgNaklRPost.Refresh;
end;




procedure TfmNaklRPost.ExpotrDBFClick(Sender: TObject);
var DataSetFrom,DataSetTo : TDataSet;
    formattedDateTime, formattedDateTime1 : String;
    FTable_ID : int64;
    fname     : String;
    fname1    : String;
    dbf_name  : String;
    QuSendDBF : TMSQuery;
    QuSendDBFA: TMSQuery;
    QuSendDBFN: TMSQuery;
    QuCheck   : TMSQuery;
    ExecString: String;
    s         : String;
    FilePath  : String;
    AddressNo : Integer;
begin  //1
  inherited;

  QuCheck:=TMSQuery.Create(nil);
  QuCheck.Connection:=dmDataModule.DB;
  QuCheck.SQL.Clear;
  QuCheck.SQL.Text := 'select * '
                     +' from L_ExportInExcelFile '
                     +'  where PostNo = :PostNo ';
  QuCheck.Prepare;
  QuCheck.ParamByName('PostNo').Value := cbFilterPost.KeyValue;
  QuCheck.Open;

  if cbFilterPost.Text = '' then raise Exception.Create('Не задан контрагент.');

  if QuCheck.RecordCount <> 0 and QuCheck.FieldByName('Check1').Value = true then begin
                                                                                 DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                                                                                 DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);

                                                                                 CreateAndSendExcelFile(cbFilterPost.KeyValue,strtodate(formattedDateTime),strtodate(formattedDateTime1),cbxDate.Checked,False);
                                                                                 QuCheck.Close;
                                                                                 Exit;
                                                                               end;

  QuCheck.Close;

  QuSendDBFA:=TMSQuery.Create(nil);
  QuSendDBFA.Connection:=dmDataModule.DB;
  QuSendDBFA.SQL.Clear;
  QuSendDBFA.SQL.Text:='select distinct AddressNo '
                     +'        ,AdrPost           '
                     +'  from v_NaklRPost_Export v'
                     +'   where v.PostNo = :PostNo'
                     +'    and Isnull (:date1,cast(v.date as date)) <= cast(v.date as date)'
                     +'    and Isnull (:date2,cast(v.date as date)) >= cast(v.date as date)';
  QuSendDBFA.Prepare;
  QuSendDBFA.ParamByName('PostNo').Value := cbFilterPost.KeyValue;


  if not cbxDate.Checked then begin
                                QuSendDBFA.ParamByName('Date1').Clear;
                                QuSendDBFA.ParamByName('Date2').Clear;
                              end;
  if cbxDate.Checked then begin
                             DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                             DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);
                             QuSendDBFA.ParamByName('Date1').AsDate := strtodate(formattedDateTime);
                             QuSendDBFA.ParamByName('Date2').AsDate := strtodate(formattedDateTime1);
                           end;
  QuSendDBFA.Open;

  if QuSendDBFA.RecordCount =0 then raise Exception.Create('Не верные значения фильтров!');



  QuSendDBFA.First;

  while not QuSendDBFA.Eof do

  begin // 2

  AddressNo := QuSendDBFA.FieldByName('AddressNo').AsInteger;
  fname := 'd:\\Temp_send_MAIL\\' + IntToStr(cbFilterPost.KeyValue)+'\\'+QuSendDBFA.FieldByName('AddressNo').AsString;
  fname1 := 'd:\Temp_send_MAIL\' + IntToStr(cbFilterPost.KeyValue)+'\'+QuSendDBFA.FieldByName('AddressNo').AsString;
//  dbf_name := fname + '\\*.dbf';

  if FileExists(dbf_name) then begin
                                 DelDir(fname1);
                               end;


  makedir(fname);

  ExecString := '';
  s := '''0''';


  QuSendDBF:=TMSQuery.Create(nil);
  QuSendDBF.Connection:=dmDataModule.DB;
  QuSendDBF.SQL.Clear;
  QuSendDBF.SQL.Text:='select PostNo'
                     +'       ,isnull(case when LEN(Topic)<1 then '+s+' else Topic end,'+s+') Topic'
                     +'       ,isnull(case when LEN(Message)<1 then '+s+' else Message end,'+s+') Message'
                     +'       ,isnull(case when LEN(Mail1)<1 then '+s+' else Mail1 end,'+s+') Mail1'
                     +'       ,isnull(case when LEN(Mail2)<1 then '+s+' else Mail2 end,'+s+') Mail2'
                     +'       ,isnull(case when LEN(Mail3)<1 then '+s+' else Mail3 end,'+s+') Mail3'
                     +'  from Post_Mail where PostNo = :PostNo and AddressNo = :AddressNo';
  QuSendDBF.Prepare;
  QuSendDBF.ParamByName('PostNo').Value := cbFilterPost.KeyValue;
  QuSendDBF.ParamByName('AddressNo').Value := AddressNo;
  QuSendDBF.Open;

  if QuSendDBF.RecordCount =0 then raise Exception.Create('Проверьте наличие электронного адреса у контрагента! '+ #10#13+'По адресу доставки: '+QuSendDBFA.FieldByName('AdrPost').AsString+'. Нет электронного адреса');

  QuSendDBF.Close;


     try
       QuSendDBFN:=TMSQuery.Create(nil);
       QuSendDBFN.Connection:=dmDataModule.DB;
       QuSendDBFN.SQL.Clear;
       QuSendDBFN.SQL.Text:='select distinct NomNaklR '
                           +' from v_NaklRPost_Export v '
                           +'  where v.PostNo = Isnull(:PostNo ,v.PostNo) '
                           +'    and v.AddressNo = Isnull(:AddressNo ,v.AddressNo)'
                           +'    and Isnull (:date1,cast(v.date as date)) <= cast(v.date as date)'
                           +'    and Isnull (:date2,cast(v.date as date)) >= cast(v.date as date)';
       QuSendDBFN.Prepare;
       QuSendDBFN.ParamByName('PostNo').Value := cbFilterPost.KeyValue;
       QuSendDBFN.ParamByName('AddressNo').Value := AddressNo;
       if not cbxDate.Checked then begin
                                       QuSendDBFN.ParamByName('Date1').Clear;
                                       QuSendDBFN.ParamByName('Date2').Clear;
                                     end;
         if cbxDate.Checked then begin
                                   DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                                   DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);
                                   QuSendDBFN.ParamByName('Date1').AsDate := strtodate(formattedDateTime);
                                   QuSendDBFN.ParamByName('Date2').AsDate := strtodate(formattedDateTime1);
                                 end;
       QuSendDBFN.Open;
       QuSendDBFN.First;

       if QuSendDBFN.RecordCount =0 then raise Exception.Create('Нет записи в запросе! Проверьте условия фильтров!!!'+ #10#13 +QuSendDBF.SQL.Text);

       while not QuSendDBFN.Eof do
       begin
         dbf_name := fname + '\\'+QuSendDBFN.FieldByName('NomNaklR').AsString+'.dbf';

         quNaklRPostExport.Close;
         quNaklRPostExport.ParamByName('PostNo').AsString := cbFilterPost.KeyValue;
         if not cbxDate.Checked then begin
                                       quNaklRPostExport.ParamByName('Date1').Clear;
                                       quNaklRPostExport.ParamByName('Date2').Clear;
                                     end;
         if cbxDate.Checked then begin
                                   DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                                   DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);
                                   quNaklRPostExport.ParamByName('Date1').AsDate := strtodate(formattedDateTime);
                                   quNaklRPostExport.ParamByName('Date2').AsDate := strtodate(formattedDateTime1);
                                 end;
         quNaklRPostExport.ParamByName('AddressNo').AsInteger := QuSendDBFA.FieldByName('AddressNo').AsInteger;
         quNaklRPostExport.ParamByName('NomNaklR').AsInteger := QuSendDBFN.FieldByName('NomNaklR').AsInteger;
         quNaklRPostExport.Open;

         if quNaklRPostExport.RecordCount =0 then raise Exception.Create('Не верные условия фильтров.');

         FTable_ID:=99;
         DataSetFrom := quNaklRPostExport as TDataset;
         DataSetTo:= CreateDBFDataSet(FTable_ID,dbf_name) as TDataset;
         ExportTODBF(DataSetFrom,DataSetTo,True);
         QuSendDBFN.Next;
       end;

     except
        ShowMessage('Ошибка экспорта в dbf' + #10#13 + dbf_name);
     end;

  QuSendDBFA.Next;
  end; // 2


  quNaklRPostExport.Close;
  quNaklRPostExport.ParamByName('PostNo').AsString := cbFilterPost.KeyValue;
  if not cbxDate.Checked then begin
                                quNaklRPostExport.ParamByName('Date1').Clear;
                                quNaklRPostExport.ParamByName('Date2').Clear;
                              end;
  if cbxDate.Checked then begin
                            DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                            DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);
                            quNaklRPostExport.ParamByName('Date1').AsDate := strtodate(formattedDateTime);
                            quNaklRPostExport.ParamByName('Date2').AsDate := strtodate(formattedDateTime1);
                          end;
   quNaklRPostExport.ParamByName('AddressNo').Clear;
   quNaklRPostExport.ParamByName('NomNaklR').Clear;
  quNaklRPostExport.Open;

  RxdbgNaklRPost.Refresh;
  QuSendDBFA.Close;
  QuSendDBFN.Close;
  ShowMessage('Выгрузка завершена');
end; //1


procedure TfmNaklRPost.cbFilterPostChange(Sender: TObject);
begin
  inherited;
  quNaklRPostExport.Close;
  if cbFilterPost.Text = '' then quNaklRPostExport.ParamByName('PostNo').Clear
                            else quNaklRPostExport.ParamByName('PostNo').AsString := cbFilterPost.KeyValue;
  quNaklRPostExport.Open;
  RxdbgNaklRPost.Refresh;
end;

procedure TfmNaklRPost.dtDateBegChange(Sender: TObject);
var
  formattedDateTime : String;
begin
  inherited;
  quNaklRPostExport.Close;

  DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
  quNaklRPostExport.ParamByName('Date1').AsDate := strtodate(formattedDateTime);

  quNaklRPostExport.Open;
  RxdbgNaklRPost.Refresh;
end;

procedure TfmNaklRPost.dtDateEndChange(Sender: TObject);
 var
  formattedDateTime : String;
begin
  inherited;
  quNaklRPostExport.Close;

  DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateEnd.Date);
  quNaklRPostExport.ParamByName('Date2').AsDate := strtodate(formattedDateTime);

  quNaklRPostExport.Open;
  RxdbgNaklRPost.Refresh;
end;

procedure TfmNaklRPost.ExportListClick(Sender: TObject);
 var
  formattedDateTime : String;
  formattedDateTime1: String;
  fpath             : String;
  fname             : String;
begin
  inherited;
  if cbFilterPost.Text = '' then raise Exception.Create('Не задан контрагент.');
  if not cbxDate.Checked then raise Exception.Create('Нужно выбрать период!');
  fname := 'TovarPost'+IntToStr(cbFilterPost.KeyValue)+'.csv';
  fpath := '\\192.168.0.14\Документы\ExportTovarPost\';
  makedir(fpath);
  DeleteFile(fpath+fname);
  DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
  DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);

  quExecuteExport.Close;
  quExecuteExport.ParamByName('PostNo').Value := cbFilterPost.KeyValue;
  quExecuteExport.ParamByName('DateBegin').Value := strtodate(formattedDateTime);
  quExecuteExport.ParamByName('DateEnd').Value := strtodate(formattedDateTime1);
  quExecuteExport.Execute;

  if not FileExists(fpath+fname) then raise Exception.Create('Файл '+fpath+fname+' не создан!'+ #10#13 +'Нет связи с сервером!'+ #10#13 +'Сообщите системному администратору!')
                                 else ShowMessage('Выгрузка завершена');

  end;

procedure TfmNaklRPost.ImportListClick(Sender: TObject);
 var
  fname     : String;
  fpath     : String;
begin
  inherited;
  if cbFilterPost.Text = '' then raise Exception.Create('Не задан контрагент.');
  fname := 'TovarPost'+IntToStr(cbFilterPost.KeyValue)+'.csv';
  fpath := '\\192.168.0.14\Документы\ExportTovarPost\';
  if not FileExists(fpath+fname) then raise Exception.Create('Файл '+fpath+fname+' не существует!'+ #10#13 +'Загрузка не возможна!'+ #10#13 +'Проверьте правильность выбора контрагента! Или наличие файла');

  quExecuteImport.Close;
  quExecuteImport.ParamByName('PostNo').Value := cbFilterPost.KeyValue;
  quExecuteImport.Execute;

  ShowMessage('Загрузка завершена');

end;

procedure TfmNaklRPost.SendDBFOneFileClick(Sender: TObject);
  var
    DataSetFrom,DataSetTo : TDataSet;
    QuSendDBFA: TMSQuery;
    FTable_ID : int64;
    formattedDateTime, formattedDateTime1 : String;
    fname     : String;
    fname1    : String;
    dbf_name  : String;
    Topic     : String;
    Message   : String;
    Mail1     : String;
    Mail2     : String;
    Mail3     : String;
    ExecString: String;
    FilePath  : String;
begin // 1
  inherited;

  if cbFilterPost.Text = '' then raise Exception.Create('Не задан контрагент.');

  QuSendDBFA:=TMSQuery.Create(nil);
  QuSendDBFA.Connection:=dmDataModule.DB;
  QuSendDBFA.SQL.Clear;
  QuSendDBFA.SQL.Text:='declare  @PostNo smallint  '
                     +'  set @PostNo = cast(:PostNo as smallint) '
                     +'select mail '
                     +' from (select distinct mail1 as mail '
                     +'        from Post_Mail'
                     +'         where PostNo = @PostNo '
                     +'       union '
                     +'       select distinct Mail2 as mail '
                     +'        from Post_Mail '
                     +'         where PostNo = @PostNo '
                     +'       union '
                     +'       select distinct Mail3 as mail '
                     +'        from Post_Mail '
                     +'         where PostNo = @PostNo) u '
                     +'  where u.mail is not null '
                     +'    and len(rtrim(ltrim(u.mail))) > 1';
  QuSendDBFA.Prepare;
  QuSendDBFA.ParamByName('PostNo').AsInteger := cbFilterPost.KeyValue;

  QuSendDBFA.Open;

  if QuSendDBFA.RecordCount =0 then raise Exception.Create('Нет записи в запросе!'+ #10#13 +QuSendDBFA.SQL.Text+ #10#13 +'Обратитесь к программисту');

  if cbxDate.Checked then begin
                             DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                             DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);
                          end;

  QuSendDBFA.First;

  while not QuSendDBFA.Eof do

  begin // 2

    fname := 'd:\\Temp_send_MAIL_OneFile\\' + IntToStr(cbFilterPost.KeyValue);
    fname1 := 'd:\Temp_send_MAIL_OneFile\' + IntToStr(cbFilterPost.KeyValue);

    DelDir(fname1);
    makedir(fname);

    ExecString := '';

    if not cbxDate.Checked then Topic :=  'Накладные за весь период'
                           else Topic := 'Расходные накладные';
    if not cbxDate.Checked then Message := 'Расходные накладные за весь период '
                           else Message := 'Расходные накладные с '+formattedDateTime+' по '+formattedDateTime1;
    Mail1 := QuSendDBFA.FieldByName('mail').AsString;
    Mail2 := '0';
    Mail3 := '0';

    ExecString := Mail1 +' '+ Mail2 +' '+ Mail3 +' '+'"'+ Topic+'"' +' '+'"'+ Message+'"'  +' '+  fname+'\\';

    dbf_name := fname + '\\'+IntToStr(cbFilterPost.KeyValue)+'.dbf';
//      showmessage (dbf_name);

    try // 3

    quNaklRPostExport.Close;
    quNaklRPostExport.ParamByName('PostNo').AsString := cbFilterPost.KeyValue;
    if not cbxDate.Checked then begin
                                  quNaklRPostExport.ParamByName('Date1').Clear;
                                  quNaklRPostExport.ParamByName('Date2').Clear;
                                end;
    if cbxDate.Checked then begin
                              DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                              DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);
                              quNaklRPostExport.ParamByName('Date1').AsDate := strtodate(formattedDateTime);
                              quNaklRPostExport.ParamByName('Date2').AsDate := strtodate(formattedDateTime1);
                            end;
    quNaklRPostExport.ParamByName('AddressNo').Clear;
    quNaklRPostExport.ParamByName('NomNaklR').Clear;
    quNaklRPostExport.Open;

    if quNaklRPostExport.RecordCount =0 then raise Exception.Create('Не верные условия фильтров.');

    FTable_ID:=99;
    DataSetFrom := quNaklRPostExport as TDataset;
    DataSetTo:= CreateDBFDataSet(FTable_ID,dbf_name) as TDataset;
    ExportTODBF(DataSetFrom,DataSetTo,True);

    except
       ShowMessage('Ошибка экспорта в dbf' + #10#13 + dbf_name);
    end; // 3

    //  showmessage(ExecString);
    FilePath := ExtractFilePath(Application.ExeName)+'Send_Mail.exe';
    if ShellExecute(0,
                    'open',
                    pAnsiChar(FilePath),
                    pAnsiChar(ExecString),
                    pAnsiChar(ExtractFilePath(Application.ExeName)),
                    SW_MINIMIZE ) < 32
    then
      ShowMessage('Не запустилась программа Send_Mail.exe! (Можуль отправки письма).'+ #10#13 +' Сообщите системному администратору!');

//  ShowMessage(fname);

    sleep(5000);
    QuSendDBFA.Next;
  end; // 2
  showmessage ('Отправка писем завершена');
end; // 1

procedure TfmNaklRPost.ExportNaklClick(Sender: TObject);
var QuCheck   : TMSQuery;
    cls_ExcelObject: string;
    RegData: TRegistry;
    Workbook, WorkSheet, ArrayData, Excel, Range, Cell1, Cell2 : Variant;

    QuPreparationSQL: TMSQuery;
    QuExportExcelFile, QuExportExcelFileSeparation: TMSQuery;
    Select, Select1, fname, fname1, xls_name, dbf_name : String;
    Topic, Message, Mail1, Mail2, Mail3 : String;
    ExecString, s, FilePath  : String;
    AddressNo : Integer;
    BeginCol, BeginRow, RowCount, ColCount, j: integer;

    DataSetFrom,DataSetTo : TDataSet;
    formattedDateTime, formattedDateTime1 : String;
    FTable_ID : int64;

begin
  inherited;

  if cbFilterPost.Text = '' then raise Exception.Create('Не задан контрагент.');

  QuCheck:=TMSQuery.Create(nil);
  QuCheck.Connection:=dmDataModule.DB;
  QuCheck.SQL.Clear;
  QuCheck.SQL.Text := 'select * '
                     +' from L_ExportInExcelFile '
                     +'  where PostNo = :PostNo ';
  QuCheck.Prepare;
  QuCheck.ParamByName('PostNo').Value := cbFilterPost.KeyValue;
  QuCheck.Open;

  if QuCheck.RecordCount <> 0 and
     QuCheck.FieldByName('Check1').Value = true
   then begin
          if QuCheck.FieldByName('CheckSeparationFile').Value = true
           then begin
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


          BeginCol := 1;
          BeginRow := 1;

          QuPreparationSQL := TMSQuery.Create(nil);
          QuPreparationSQL.Connection:=dmDataModule.DB;
          QuPreparationSQL.SQL.Clear;
          QuPreparationSQL.SQL.Text :=  'select Column_Name '
                                       +'  from L_VidExportExelFile '
                                       +'   where Is_Checked = 1 '
                                       +'     and PostNo = :PostNo '
                                       +'order by N_pp';
          QuPreparationSQL.ParamByName('PostNo').AsInteger := cbFilterPost.KeyValue;
          QuPreparationSQL.Open;

          if QuPreparationSQL.RecordCount = 0 then raise Exception.Create('Для фирмы № ' + IntToStr(cbFilterPost.KeyValue) + #10#13 +
                                                                          'Не настроен формат файла.');
          QuPreparationSQL.First;
          Select := '';
          Select1 := '';
          while not QuPreparationSQL.Eof do
             begin
               Select := Select + 'cast('+QuPreparationSQL.FieldByName('Column_Name').AsString+' as varchar), ';
               Select1 := Select1 + '''' + QuPreparationSQL.FieldByName('Column_Name').AsString +''''+ ', ';
               QuPreparationSQL.Next;
             end;
          delete (Select,Length(Select)-1,Length(Select));
          delete (Select1,Length(Select1)-1,Length(Select1));

                  QuExportExcelFileSeparation := TMSQuery.Create(nil);
                  QuExportExcelFileSeparation.Connection := dmDataModule.DB;
                  QuExportExcelFileSeparation.SQL.Clear;
                  QuExportExcelFileSeparation.SQL.Text :=  'select distinct OtdelNo, (select OtdelName from VidOtdel v where v.OtdelNo = r.OtdelNo) as OtdelName '
                                                          +' from NaklR r '
                                                          +'  where r.PostNo = :PostNo '
                                                          +'    and isnull (:DateBeg,r.DateNakl) <= r.DateNakl '
                                                          +'    and isnull (:DateEnd,r.DateNakl) >= r.DateNakl ';

                  QuExportExcelFileSeparation.ParamByName('PostNo').AsInteger := cbFilterPost.KeyValue;

                  if cbxDate.Checked then begin
                                            DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                                            DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);
                                            QuExportExcelFileSeparation.ParamByName('DateBeg').AsDate := strtodate(formattedDateTime);
                                            QuExportExcelFileSeparation.ParamByName('DateEnd').AsDate := strtodate(formattedDateTime1);
                                          end;

                  if not cbxDate.Checked then begin
                                                QuExportExcelFileSeparation.ParamByName('DateBeg').Clear;
                                                QuExportExcelFileSeparation.ParamByName('DateEnd').Clear;
                                              end;

                  QuExportExcelFileSeparation.Open;

//                  if (QuExportExcelFileSeparation.RecordCount > 1) then s:='1';

                  if QuExportExcelFileSeparation.RecordCount = 0 then raise Exception.Create('Для фирмы № ' + IntToStr(cbFilterPost.KeyValue) + #10#13 +
                                                                                             'за период с ' + formattedDateTime + ' по '+ formattedDateTime1 + #10#13 +
                                                                                             'продаж не было!');
                  QuExportExcelFileSeparation.First;


                  while not QuExportExcelFileSeparation.Eof do
                   begin
                     if cbxDate.Checked then xls_name := formattedDateTime+'-'+formattedDateTime1+'_'+IntToStr(cbFilterPost.KeyValue)+'_'+ QuExportExcelFileSeparation.FieldByName('OtdelName').AsString
                                        else xls_name := 'Весь период'+'_'+IntToStr(cbFilterPost.KeyValue)+'_'+ QuExportExcelFileSeparation.FieldByName('OtdelName').AsString;


                     QuExportExcelFile := TMSQuery.Create(nil);
                     QuExportExcelFile.Connection:=dmDataModule.DB;
                     QuExportExcelFile.SQL.Clear;
                     QuExportExcelFile.SQL.Text :=  'select ' + Select1
//                                                   +' order by NameTov '
                                                   +'union all '
                                                   +'select ' + Select
                                                   +' from V_NaklRPost_Export '
                                                   +'  where PostNo = :PostNo '
                                                   +'    and Isnull (:DateBeg,cast(date as date)) <= cast(date as date) '
                                                   +'    and Isnull (:DateEnd,cast(date as date)) >= cast(date as date) '
                                                   +'    and OtdelNo = :OtdelNo ';
//                                                   +'order by NameTov';

                     QuExportExcelFile.ParamByName('PostNo').AsInteger := cbFilterPost.KeyValue;
                     QuExportExcelFile.ParamByName('OtdelNo').AsInteger := QuExportExcelFileSeparation.FieldByName('OtdelNo').AsInteger;

                     if cbxDate.Checked then begin
                                               DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                                               DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);
                                               QuExportExcelFile.ParamByName('DateBeg').AsDate := strtodate(formattedDateTime);
                                               QuExportExcelFile.ParamByName('DateEnd').AsDate := strtodate(formattedDateTime1);
                                             end;

                     if not cbxDate.Checked then begin
                                                   QuExportExcelFile.ParamByName('DateBeg').Clear;
                                                   QuExportExcelFile.ParamByName('DateEnd').Clear;
                                                 end;

                     QuExportExcelFile.Open;

                     RowCount := QuExportExcelFile.RecordCount;
                     ColCount := QuPreparationSQL.RecordCount;

                     Excel := CreateOleObject(cls_ExcelObject);

                     Excel.Application.ScreenUpdating := False;
                     Excel.Application.EnableEvents := false;
                     Excel.Application.Interactive := False;
                     Excel.Application.DisplayAlerts := False;
                     Excel.Application.DisplayStatusBar := False;
                     Excel.Visible := false;

                     Workbook := Excel.Workbooks.Add;
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

                     Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];
                     Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount - 1, BeginCol + ColCount - 1];
                     Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];

                     Range.Value := ArrayData;

                     QuExportExcelFile.Close;

                     sd_SaveFile := TSaveDialog.Create(self);

                     sd_SaveFile.FileName := xls_name;
                     sd_SaveFile.DefaultExt := '.xls';
                     sd_SaveFile.Filter := 'Excel (*.xls)|*.xls';

                     if sd_SaveFile.Execute then Excel.ActiveWorkBook.SaveAs(sd_SaveFile.FileName);

                     ShowMessage('Создан файл '+sd_SaveFile.FileName);

                     sd_SaveFile.Free;

                     Excel.Quit;
                     Excel := Unassigned;

                     QuExportExcelFileSeparation.Next;
                   end;

                end
           else begin

                  ////////////////////
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


          BeginCol := 1;
          BeginRow := 1;

          QuPreparationSQL := TMSQuery.Create(nil);
          QuPreparationSQL.Connection:=dmDataModule.DB;
          QuPreparationSQL.SQL.Clear;
          QuPreparationSQL.SQL.Text :=  'select Column_Name '
                                       +'  from L_VidExportExelFile '
                                       +'   where Is_Checked = 1 '
                                       +'     and PostNo = :PostNo '
                                       +'order by N_pp';
          QuPreparationSQL.ParamByName('PostNo').AsInteger := cbFilterPost.KeyValue;
          QuPreparationSQL.Open;

          if QuPreparationSQL.RecordCount = 0 then raise Exception.Create('Для фирмы № ' + IntToStr(cbFilterPost.KeyValue) + #10#13 +
                                                                          'Не настроен формат файла.');
          QuPreparationSQL.First;
          Select := '';
          Select1 := '';
          while not QuPreparationSQL.Eof do
             begin
               Select := Select + 'cast('+QuPreparationSQL.FieldByName('Column_Name').AsString+' as varchar), ';
               Select1 := Select1 + '''' + QuPreparationSQL.FieldByName('Column_Name').AsString +''''+ ', ';
               QuPreparationSQL.Next;
             end;
          delete (Select,Length(Select)-1,Length(Select));
          delete (Select1,Length(Select1)-1,Length(Select1));

                  ////////////////////

                  QuExportExcelFile := TMSQuery.Create(nil);
                  QuExportExcelFile.Connection:=dmDataModule.DB;
                  QuExportExcelFile.SQL.Clear;
                  QuExportExcelFile.SQL.Text :=  'select ' + Select1
                                                +'union all '
                                                +'select ' + Select
                                                +' from V_NaklRPost_Export '
                                                +'  where PostNo = :PostNo '
                                                +'    and Isnull (:DateBeg,cast(date as date)) <= cast(date as date) '
                                                +'    and Isnull (:DateEnd,cast(date as date)) >= cast(date as date) ';

                  QuExportExcelFile.ParamByName('PostNo').AsInteger := cbFilterPost.KeyValue;

                  if cbxDate.Checked then begin
                                            DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                                            DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);
                                            QuExportExcelFile.ParamByName('DateBeg').AsDate := strtodate(formattedDateTime);
                                            QuExportExcelFile.ParamByName('DateEnd').AsDate := strtodate(formattedDateTime1);
                                          end;

                  if not cbxDate.Checked then begin
                                                QuExportExcelFile.ParamByName('DateBeg').Clear;
                                                QuExportExcelFile.ParamByName('DateEnd').Clear;
                                              end;

                  if cbxDate.Checked then xls_name := formattedDateTime+'-'+formattedDateTime1+'_'+IntToStr(cbFilterPost.KeyValue)
                                     else xls_name := 'Весь период'+'_'+IntToStr(cbFilterPost.KeyValue);

                  QuExportExcelFile.Open;

                  if QuExportExcelFile.RecordCount = 0 then raise Exception.Create('Для фирмы № ' + IntToStr(cbFilterPost.KeyValue) + #10#13 +
                                                                                   'за период с ' + formattedDateTime + ' по '+ formattedDateTime1 + #10#13 +
                                                                                  'продаж не было!');
                  RowCount := QuExportExcelFile.RecordCount;
                  ColCount := QuPreparationSQL.RecordCount;

                  Excel := CreateOleObject(cls_ExcelObject);

                  Excel.Application.ScreenUpdating := False;
                  Excel.Application.EnableEvents := false;
                  Excel.Application.Interactive := False;
                  Excel.Application.DisplayAlerts := False;
                  Excel.Application.DisplayStatusBar := False;
                  Excel.Visible := false;

                  Workbook := Excel.Workbooks.Add;
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

                  Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];
                  Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + RowCount - 1, BeginCol + ColCount - 1];
                  Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];

                  Range.Value := ArrayData;

                  QuExportExcelFile.Close;

                  sd_SaveFile := TSaveDialog.Create(self);

                  sd_SaveFile.FileName := xls_name;
                  sd_SaveFile.DefaultExt := '.xls';
                  sd_SaveFile.Filter := 'Excel (*.xls)|*.xls';

                  if sd_SaveFile.Execute then Excel.ActiveWorkBook.SaveAs(sd_SaveFile.FileName);

                  ShowMessage('Создан файл '+sd_SaveFile.FileName);

                  sd_SaveFile.Free;

                  Excel.Quit;
                  Excel := Unassigned

               end;
          QuCheck.Close;
          Exit;
        end;

  QuCheck.Close;
  try

    quNaklRPostExport.Close;
    quNaklRPostExport.ParamByName('PostNo').AsString := cbFilterPost.KeyValue;
    if not cbxDate.Checked then begin
                                  quNaklRPostExport.ParamByName('Date1').Clear;
                                  quNaklRPostExport.ParamByName('Date2').Clear;
                                end;
    if cbxDate.Checked then begin
                              DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Date);
                              DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Date);
                              quNaklRPostExport.ParamByName('Date1').AsDate := strtodate(formattedDateTime);
                              quNaklRPostExport.ParamByName('Date2').AsDate := strtodate(formattedDateTime1);
                            end;
    quNaklRPostExport.ParamByName('AddressNo').Clear;
    quNaklRPostExport.ParamByName('NomNaklR').Clear;
    quNaklRPostExport.Open;

    if quNaklRPostExport.RecordCount =0 then raise Exception.Create('Не верные условия фильтров.');

    sd_SaveFile := TSaveDialog.Create(self);

    if cbxDate.Checked then sd_SaveFile.FileName := formattedDateTime+'-'+formattedDateTime1+'_'+IntToStr(cbFilterPost.KeyValue)
                       else sd_SaveFile.FileName := 'Весь период'+'_'+IntToStr(cbFilterPost.KeyValue) ;
    sd_SaveFile.DefaultExt := '.dbf';
    sd_SaveFile.Filter := '*.dbf|*.dbf';

    if sd_SaveFile.Execute then begin
                                  FTable_ID := 99;
                                  DataSetFrom := quNaklRPostExport as TDataset;
                                  DataSetTo:= CreateDBFDataSet(FTable_ID,sd_SaveFile.FileName) as TDataset;
                                  ExportTODBF(DataSetFrom,DataSetTo,True);
                                end;
    ShowMessage('Создан файл '+sd_SaveFile.FileName);

    sd_SaveFile.Free;
  except
       ShowMessage('Ошибка экспорта в dbf' + #10#13 + dbf_name);
  end;














end;

procedure TfmNaklRPost.bDeskriptionClick(Sender: TObject);
begin
  inherited;
  with TDescriptionNaklRPost0Form.Create(Application) do
      try
       ShowModal;
      finally
       Free;
      end;
end;

end.
