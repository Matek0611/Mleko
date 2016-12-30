unit CreateDbfForMail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, MSAccess, MemDS, DBTables;

type
  TCreateDbfForMail0 = class(TForm)
    DB: TMSConnection;
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
    dsNaklRPostExport: TDataSource;
    TableDbf: TTable;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreateDbfForMail0: TCreateDbfForMail0;

implementation

{$R *.dfm}

procedure TCreateDbfForMail0.FormCreate(Sender: TObject);
begin
  Left:= -2000;
  //// тут работа
  SendDBF;




end;

procedure TCreateDbfForMail0.FormShow(Sender: TObject);
begin
// или тут рабоат
 Close;
end;



procedure SendDBF;
var
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
    ExecString: String;
    s         : String;
    FilePath  : String;
    AddressNo : Integer;
begin  //1

  QuSendDBFA:=TMSQuery.Create(nil);
  QuSendDBFA.Connection:=DB;
  QuSendDBFA.SQL.Clear;
  QuSendDBFA.SQL.Text:='select  PostNo      '
                      +'        ,AddresNo   '
                      +'        ,DateBeg    '
                      +'        ,DateEnd    '
                      +' from ListPostMail  '
                      +'  where Check1 = 1  ';
  QuSendDBFA.Prepare;
  QuSendDBFA.Open;
  QuSendDBFA.First;

  while not QuSendDBFA.Eof do

  begin // 2

  AddressNo := QuSendDBFA.FieldByName('AddressNo').AsInteger;
  fname := 'd:\\Temp_send_MAIL1\\' + QuSendDBFA.FieldByName('PostNo').AsString +'\\'+QuSendDBFA.FieldByName('AddressNo').AsString;
  fname1 := 'd:\Temp_send_MAIL1\' + QuSendDBFA.FieldByName('PostNo').AsString+'\'+QuSendDBFA.FieldByName('AddressNo').AsString;

  DelDir(fname1);
  makedir(fname);

  ExecString := '';
  s := '''0''';


  QuSendDBF:=TMSQuery.Create(nil);
  QuSendDBF.Connection:=DB;
  QuSendDBF.SQL.Clear;
  QuSendDBF.SQL.Text:='select PostNo'
                     +'      ,isnull(case when LEN(Topic)<1 then '+s+' else Topic end,'+s+') Topic'
                     +'      ,isnull(case when LEN(Message)<1 then '+s+' else Message end,'+s+') Message'
                     +'      ,isnull(case when LEN(Mail1)<1 then '+s+' else Mail1 end,'+s+') Mail1'
                     +'      ,isnull(case when LEN(Mail2)<1 then '+s+' else Mail2 end,'+s+') Mail2'
                     +'      ,isnull(case when LEN(Mail3)<1 then '+s+' else Mail3 end,'+s+') Mail3'
                     +' from Post_Mail where PostNo = :PostNo and AddressNo = :AddressNo'
                     +'   ';
  QuSendDBF.Prepare;
  QuSendDBF.ParamByName('PostNo').Value := QuSendDBFA.FieldByName('PostNo').AsInteger ;
  QuSendDBF.ParamByName('AddressNo').Value := AddressNo;
  QuSendDBF.Open;

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
       QuSendDBFN.Connection:=DB;
       QuSendDBFN.SQL.Clear;
       QuSendDBFN.SQL.Text:='select distinct NomNaklR '
                           +' from v_NaklRPost_Export v '
                           +'  where v.PostNo = Isnull(:PostNo ,v.PostNo) '
                           +'    and v.AddressNo = Isnull(:AddressNo ,v.AddressNo)'
                           +'    and Isnull (:date1,cast(v.date as date)) <= cast(v.date as date)'
                           +'    and Isnull (:date2,cast(v.date as date)) >= cast(v.date as date)';
       QuSendDBFN.Prepare;
       QuSendDBFN.ParamByName('PostNo').Value := QuSendDBFA.FieldByName('PostNo').AsInteger;
       QuSendDBFN.ParamByName('AddressNo').Value := AddressNo;
       QuSendDBFN.ParamByName('date1').Value := QuSendDBFA.FieldByName('DateBeg').AsDate;
       QuSendDBFN.ParamByName('date2').Value := QuSendDBFA.FieldByName('DateEnd').AsDate;
       QuSendDBFN.Open;
       QuSendDBFN.First;

       if QuSendDBFN.RecordCount =0 then raise Exception.Create('Нет записи в запросе! Проверьте условия фильтров!!!'+ #10#13 +QuSendDBF.SQL.Text);

//       showmessage(inttostr(QuSendDBFN.RecordCount));

       while not QuSendDBFN.Eof do
       begin
       dbf_name := fname + '\\'+QuSendDBFN.FieldByName('NomNaklR').AsString+'.dbf';
//      showmessage (dbf_name);

         quNaklRPostExport.Close;
         quNaklRPostExport.ParamByName('PostNo').AsString := QuSendDBFA.FieldByName('PostNo').AsInteger;
         quNaklRPostExport.ParamByName('Date1').AsDate := QuSendDBFA.FieldByName('DateBeg').AsDate;
         quNaklRPostExport.ParamByName('Date2').AsDate := QuSendDBFA.FieldByName('DateEnd').AsDate;
         quNaklRPostExport.ParamByName('AddressNo').AsInteger := QuSendDBFA.FieldByName('AddressNo').AsInteger;
         quNaklRPostExport.ParamByName('NomNaklR').AsInteger := QuSendDBFN.FieldByName('NomNaklR').AsInteger;
         quNaklRPostExport.Open;

         if quNaklRPostExport.RecordCount =0 then raise Exception.Create('Не верные условия фильтров.');

         quNaklRPostExport.First;

{
         FTable_ID:=99;
         DataSetFrom := quNaklRPostExport as TDataset;
         DataSetTo:= CreateDBFDataSet(FTable_ID,dbf_name) as TDataset;
         ExportTODBF(DataSetFrom,DataSetTo,True);
}
// -------------------------------

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
               Name := 'TovNPost';
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
               Name := 'PricNoNDS';
               DataType := ftFloat;
               Precession := 3;
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
               Precession := 3;
             end;
             with AddFieldDef do
             begin
               Name := 'SumNoNDS';
               DataType := ftFloat;
               Precession := 3;
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
               Name := 'SNRNoNDS';
               DataType := ftFloat;
               Precession := 3;
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
             with AddFieldDef do
             begin
               Name := 'PostNo';
               DataType := ftString;
             end;


           end;
           CreateTable;
           Open;
         end;


    while not quNaklRPostExport.Eof do
  begin
    TableDbf.Insert;
    TableDBF.FieldByName('TovNPost').AsInteger := quNaklRPostExport.FieldByName('TovarNoPost').AsInteger;
    TableDBF.FieldByName('BarCode').AsString := IntToStr(quNaklRPostExport.FieldByName('BarCode').AsInteger);
    TableDBF.FieldByName('NameTov').AsString := quNaklRPostExport.FieldByName('NameTovar').AsString;
    TableDBF.FieldByName('EdIzm').AsString := quNaklRPostExport.FieldByName('EdIzm').AsString;
    TableDBF.FieldByName('PricNoNDS').AsFloat := quNaklRPostExport.FieldByName('PriceNoNDS').AsFloat;
    TableDBF.FieldByName('Price').AsFloat := quNaklRPostExport.FieldByName('Price').AsFloat;
    TableDBF.FieldByName('StavNDS').AsString := quNaklRPostExport.FieldByName('StavkaNDS').AsString;
    TableDBF.FieldByName('QTY').AsFloat := quNaklRPostExport.FieldByName('QTY').AsFloat;
    TableDBF.FieldByName('SumNoNDS').AsFloat := quNaklRPostExport.FieldByName('SummaNoNDS').AsFloat;
    TableDBF.FieldByName('Summa').AsFloat := quNaklRPostExport.FieldByName('Summa').AsFloat;
    TableDBF.FieldByName('NomNaklR').AsInteger := quNaklRPostExport.FieldByName('NomNaklR').AsInteger;
    TableDBF.FieldByName('Date').AsString := quNaklRPostExport.FieldByName('Date').AsString;
    TableDBF.FieldByName('SumNaklR').AsFloat := quNaklRPostExport.FieldByName('SummaNaklR').AsFloat;
    TableDBF.FieldByName('SNRNoNDS').AsFloat := quNaklRPostExport.FieldByName('SNRNoNDS').AsFloat;
    TableDBF.FieldByName('OurFirm').AsString := quNaklRPostExport.FieldByName('OurFirm').AsString;
    TableDBF.FieldByName('OurOKPO').AsString := quNaklRPostExport.FieldByName('OurOKPO').AsString;
    TableDBF.FieldByName('Firm').AsString := quNaklRPostExport.FieldByName('Firm').AsString;
    TableDBF.FieldByName('AdrPost').AsString := quNaklRPostExport.FieldByName('AddesPost').AsString;
    TableDBF.FieldByName('PostNo').AsString := quNaklRPostExport.FieldByName('PostNo').AsString;

    TableDBF.Post;
    quNaklRPostExport.Next;
  end;

// -------------------------------




         QuSendDBFN.Next;
       end;

     except
        ShowMessage('Ошибка экспорта в dbf' + #10#13 + dbf_name);
     end;


//  showmessage(ExecString);
         FilePath := 'd:\Send_Mail\Send_Mail.exe';
         if ShellExecute(0,
                         'open',
                         pAnsiChar(FilePath),
                         pAnsiChar(ExecString),
                         pAnsiChar(ExtractFilePath(Application.ExeName)),
                         SW_MINIMIZE ) < 32
         then
           ShowMessage('Не запустилась программа Send_Mail.exe! (Можуль отправки письма).'+ #10#13 +' Сообщите системному администратору!');

//  ShowMessage(fname);

  QuSendDBFA.Next;
  end; // 2

end; //1


end.
