unit MlekoBlankListOutSide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, StdCtrls, DB, MemDS, DBAccess, MSAccess,
  DBCtrls, Mask, DBCtrlsEh, DBGridEh, DBLookupEh, ExtCtrls, GridsEh,
  citCtrls, citmask, citDBCalendar, ComCtrls, ComObj;

type
  TMlekoBlankListOutSideForm = class(TMlekoForm)
    btExportPrice: TButton;
    quFilterPrice: TMSQuery;
    dsFilterPrice: TDataSource;
    spExportPiceForVeb: TMSStoredProc;
    cbDBLookupFilterPrice: TDBLookupComboboxEh;
    DBGridEhOrders: TDBGridEh;
    Panel1: TPanel;
    Panel2: TPanel;
    BtImportOrders: TButton;
    spImportOrderVebTmp: TMSStoredProc;
    quOrders: TMSQuery;
    dsOrders: TDataSource;
    BtCreateOrder: TButton;
    quOrdersOrderNo: TIntegerField;
    quOrdersOrderDate: TDateTimeField;
    quOrdersOrderSumma: TFloatField;
    quOrdersState: TStringField;
    quOrdersIsPay: TStringField;
    quOrdersBuh: TStringField;
    quOrdersTypeNakl: TStringField;
    quOrdersNoClient: TIntegerField;
    quOrdersNameClient: TStringField;
    quOrdersNoContractor: TIntegerField;
    quOrdersNameContractor: TStringField;
    quOrdersAdress: TStringField;
    quOrdersDateDelivery: TDateTimeField;
    quOrdersTimeDelivery: TStringField;
    quOrdersTelephon: TStringField;
    quOrdersEmail: TStringField;
    dtDateDelivery: TDateTimePicker;
    quOrdersNoAdress: TIntegerField;
    LbMessage: TLabel;
    quSpecBlank: TMSQuery;
    quColnPriceForOrder: TMSQuery;
    quColnPriceForOrderSET_ARTICLE_GROUP_ID_price: TLargeintField;
    quColnPriceForOrderCOLNPRICE: TSmallintField;
    SpCheckBlank: TMSStoredProc;
    quOrdersGroupClient: TStringField;
    quOrdersGroupClientName: TStringField;
    cb_SelecttedVid: TCheckBox;
    Button1: TButton;
    quOrdersRealOrderSumma: TFloatField;
    quOrdersKomplectacija: TFloatField;
    procedure btExportPriceClick(Sender: TObject);
    procedure BtImportOrdersClick(Sender: TObject);
    procedure DBGridEhOrdersDblClick(Sender: TObject);
    procedure DBGridEhOrdersKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtCreateOrderClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    FPostNo: Int64;
    function CheckBlank(pPostno, pReason_id: Integer; pDateNakl: TDate;
      pOtdelNo: Integer; SET_ARTICLE_GROUP_ID: Int64; var err_message: string): Integer;
    procedure SetPostNo(const Value: Int64);
    { Private declarations }
  public
    property PostNo: Int64 read FPostNo write SetPostNo;
    { Public declarations }
  end;

var
  MlekoBlankListOutSideForm: TMlekoBlankListOutSideForm;

implementation

uses data, MlekoBlankSpecOutSide, MlekoBlankParam, MlekoSelectFirmForBlank,
     PostForRashod0, main, MlekoBlankSpec, ShellApi, TypeReturn, VidTovForExportPrice;

{$R *.dfm}

function TMlekoBlankListOutSideForm.CheckBlank(pPostno, pReason_id: Integer; pDateNakl: TDate; pOtdelNo: Integer; SET_ARTICLE_GROUP_ID: Int64; var err_message: string): Integer;
begin
  inherited;
  SpCheckBlank.Close;
  SpCheckBlank.ParamByName('p_Postno').Value := pPostno;
  SpCheckBlank.ParamByName('p_Reason_id').Value := pReason_id;
  SpCheckBlank.ParamByName('DateNakl').AsDate := pDateNakl;
  SpCheckBlank.ParamByName('OtdelNo').Value := pOtdelNo;
  SpCheckBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SET_ARTICLE_GROUP_ID;
  SpCheckBlank.ExecProc;
  result := SpCheckBlank.ParamByName('err_level').AsInteger;
  err_message := SpCheckBlank.ParamByName('err_message').AsString;
end;

procedure TMlekoBlankListOutSideForm.btExportPriceClick(Sender: TObject);
var
  FileName : string;
begin
  inherited;
  spExportPiceForVeb.Close;
  spExportPiceForVeb.Prepare;
  spExportPiceForVeb.Params.ParamByName('Name').Value := cbDBLookupFilterPrice.Text;
  spExportPiceForVeb.Params.ParamByName('ExportSelectVidPrice').Value := cb_SelecttedVid.Checked;
  spExportPiceForVeb.ExecProc;

  if (GlobalOurFirmNo = 490) and cb_SelecttedVid.Checked then FileName := '\\SIRIUS\ExportOnlineForVeb\priceselectedvid.csv';
  if (GlobalOurFirmNo = 490) and not cb_SelecttedVid.Checked then FileName := '\\SIRIUS\ExportOnlineForVeb\price'+cbDBLookupFilterPrice.Text+'.csv';
  if (GlobalOurFirmNo = 7419) and cb_SelecttedVid.Checked then FileName := '\\SIRIUS\ExportOnlineForVebMarket\priceselectedvid.csv';
  if (GlobalOurFirmNo = 7419) and not cb_SelecttedVid.Checked then FileName := '\\SIRIUS\ExportOnlineForVebMarket\price'+cbDBLookupFilterPrice.Text+'.csv';

  if cbDBLookupFilterPrice.Text = '' then begin
                                            if (GlobalOurFirmNo = 490) and cb_SelecttedVid.Checked then if FileExists('\\SIRIUS\ExportOnlineForVeb\priceselectedvid.csv') then ShowMessage('Создан файл \\SIRIUS\ExportOnlineForVeb\priceselectedvid.csv')
                                                                                                                                                                          else ShowMessage('Файл \\SIRIUS\ExportOnlineForVeb\priceselectedvid.csv не создан!'+ #10#13 +
                                                                                                                                                                                           'Обратитесь к системному администратору!');
                                            if (GlobalOurFirmNo = 490) and not cb_SelecttedVid.Checked then if FileExists('\\SIRIUS\ExportOnlineForVeb\price.csv') then ShowMessage('Создан файл \\SIRIUS\ExportOnlineForVeb\price.csv')
                                                                                                                                                                   else ShowMessage('Файл \\SIRIUS\ExportOnlineForVeb\price.csv не создан!'+ #10#13 +
                                                                                                                                                                                    'Обратитесь к системному администратору!');

                                            if (GlobalOurFirmNo = 7419) and cb_SelecttedVid.Checked then if FileExists('\\SIRIUS\ExportOnlineForVebMarket\priceselectedvid.csv') then ShowMessage('Создан файл \\SIRIUS\ExportOnlineForVebMarket\priceselectedvid.csv')
                                                                                                                                                                                 else ShowMessage('Файл \\SIRIUS\ExportOnlineForVebMarket\priceselectedvid.csv не создан!'+ #10#13 +
                                                                                                                                                                                                  'Обратитесь к системному администратору!');
                                            if (GlobalOurFirmNo = 7419) and not cb_SelecttedVid.Checked then if FileExists('\\SIRIUS\ExportOnlineForVebMarket\price.csv') then ShowMessage('Создан файл \\SIRIUS\ExportOnlineForVebMarket\price.csv')
                                                                                                                                                                          else ShowMessage('Файл \\SIRIUS\ExportOnlineForVebMarket\price.csv не создан!'+ #10#13 +
                                                                                                                                                                                           'Обратитесь к системному администратору!');
                                          end
                                     else begin
                                            if FileExists(FileName) then ShowMessage('Создан файл'+FileName)
                                                                    else ShowMessage('Файл '+FileName+' не создан!'+ #10#13 +
                                                                                     'Обратитесь к системному администратору!');
                                          end;

end;



procedure TMlekoBlankListOutSideForm.BtImportOrdersClick(Sender: TObject);
var
  Rlst: LongBool;
  StartUpInfo: TStartUpInfo;
  ProcessInfo: TProcessInformation;
  Error: integer;
  ExitCode: Cardinal;
  Count: integer;
  StrHTTP : string;

begin
  inherited;

  LbMessage.Visible := false;
  Count:=0;

  if GlobalOurFirmNo = 490 then if FileExists('\\SIRIUS\ImportOrdersVeb\orders.csv') then DeleteFile('\\SIRIUS\ImportOrdersVeb\orders.csv');
  if GlobalOurFirmNo = 7419 then if FileExists('\\SIRIUS\ImportOrdersVebMarket\orders.csv') then DeleteFile('\\SIRIUS\ImportOrdersVebMarket\orders.csv');

  FillChar(StartUpInfo, SizeOf(TStartUpInfo), 0);
  with StartUpInfo do
  begin
    cb := SizeOf(TStartUpInfo);
    dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    wShowWindow := SW_SHOWNORMAL;
  end;

  StrHTTP :=  ' http://mlk-trade.com/sync/getcsvorders.php?action=viewnew';

  if GlobalDateNakl > strtodate('31.01.2014') then begin
                                                     if GlobalOurFirmNo = 490 then StrHTTP :=  ' http://mlk-trade.com/sync/getcsvorders.php?cp=cp1251&otype=2&action=viewall&ostatus=1&pn=500';
                                                     if GlobalOurFirmNo = 7419 then StrHTTP := ' http://mlk-trade.com/sync/getcsvorders.php?cp=cp1251&otype=1&action=viewall&ostatus=1&pn=500';
                                                   end;

  if GlobalOurFirmNo = 490 then ShowMessage('Вы зашли в базу МЛК Трейда папка для сохранения ImportOrdersVeb');
  if GlobalOurFirmNo = 7419 then ShowMessage('Вы зашли в базу МЛК Маркет папка для сохранения ImportOrdersVebMarket');


  Rlst := CreateProcess('C:\Program Files\Internet Explorer\iexplore.exe', Pchar(StrHTTP), nil, nil, false, NORMAL_PRIORITY_CLASS, nil, nil, StartUpInfo, ProcessInfo);
  if Rlst then
  with ProcessInfo do begin
    WaitForInputIdle(hProcess, INFINITE); // ждем завершения инициализации
    WaitforSingleObject(ProcessInfo.hProcess, INFINITE); // ждем завершения процесса
    GetExitCodeProcess(ProcessInfo.hProcess, ExitCode); // получаем код завершения
    CloseHandle(hThread); // закрываем дескриптор процесса
    CloseHandle(hProcess); // закрываем дескриптор потока
  end
else Error := GetLastError;


 //  ShellExecute (MlekoBlankListOutSideForm.Handle, nil, 'iexplore', 'http://mlk-trade.com/sync/getcsvorders.php?action=viewnew', nil, SW_RESTORE);



  if GlobalOurFirmNo = 490 then while (not (FileExists('\\SIRIUS\ImportOrdersVeb\orders.csv'))) do begin
                                                                                                     sleep(1000);
                                                                                                      Count:= Count +1;
                                                                                                      LbMessage.Visible:= true;
                                                                                                      LbMessage.Caption:= 'Ожидание загрузки файла в сек. '+ inttostr(Count);
                                                                                                      LbMessage.Refresh;
                                                                                                      if Count = 10 then Begin
                                                                                                                           LbMessage.Visible:= false;
                                                                                                                           raise Exception.Create('Запись файла не удалась, повторите попытку');
                                                                                                                         End;
                                                                                                   end;
  if GlobalOurFirmNo = 7419 then while (not (FileExists('\\SIRIUS\ImportOrdersVebMarket\orders.csv'))) do begin
                                                                                                            sleep(1000);
                                                                                                            Count:= Count +1;
                                                                                                            LbMessage.Visible:= true;
                                                                                                            LbMessage.Caption:= 'Ожидание загрузки файла в сек. '+ inttostr(Count);
                                                                                                            LbMessage.Refresh;
                                                                                                            if Count = 10 then Begin
                                                                                                                                 LbMessage.Visible:= false;
                                                                                                                                 raise Exception.Create('Запись файла не удалась, повторите попытку');
                                                                                                                               End;
                                                                                                          end;

  if GlobalOurFirmNo = 490 then if not (FileExists('\\SIRIUS\ImportOrdersVeb\orders.csv')) then raise Exception.Create('Файла d:\ImportOrdersVeb\orders.csv не существует на сервере!');
  if GlobalOurFirmNo = 7419 then if not (FileExists('\\SIRIUS\ImportOrdersVebMarket\orders.csv')) then raise Exception.Create('Файла d:\ImportOrdersVebMarket\orders.csv не существует на сервере!');

  spImportOrderVebTmp.Close;
  spImportOrderVebTmp.Prepare;
  spImportOrderVebTmp.ExecProc;
  quOrders.Refresh;
  DBGridEhOrders.Refresh;
end;




procedure TMlekoBlankListOutSideForm.DBGridEhOrdersDblClick(
  Sender: TObject);
begin
  inherited;
  TMlekoBlankSpecOutSideForm.ShowForm(quOrders.FieldByName('OrderNo').Value);
end;

procedure TMlekoBlankListOutSideForm.DBGridEhOrdersKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
    TMlekoBlankSpecOutSideForm.ShowForm(quOrders.FieldByName('OrderNo').Value);
  end;
end;


procedure TMlekoBlankListOutSideForm.BtCreateOrderClick(Sender: TObject);
var
  Dlg: TMlekoBlankParamForm;
  Dlg1:TMlekoSelectFirmForBlankDlg;
  Dlg3:TMlekoBlankSpecForm;
  Dlg4:TTypeReturnForm;
  RetPostForRashod: TRetPostForRashod;
  formattedDateTime : String;
  DeliveryDate : TDateTime;
  buttonSelected : Integer;
  ContractId : Integer;
  quPost : TMSQuery;
  quPostArtGroup : TMSQuery;
  quDelInputOrder : TMSQuery;
  quPrice : TMSQuery;
  quAdressPost : TMSQuery;
  quSotrudOtdel : TMSQuery;
  quSpecBlank : TMSQuery;
  quInsInl_BlankForVeb : TMSQuery;
  quInsInl_BlankForExite : TMSQuery;
  CheckOrderForVeb : TMSQuery;
  quCheckOrder : TMSQuery;
  quCheckOrderForKomplectacija : TMSQuery;
  quOrderSumma : TMSQuery;
  quSummaBlanksHead : TMSQuery;
  quListBlanksDocId : TMSQuery;
  quListTovarNo : TMSQuery;
  documentID : Integer;
  LdocumentID : Integer;
  OrderNo : Integer;
  OtdelNo : Integer;
  Buh : Integer;
  DescriptionBan : String;
  DescriptionBanPay : String;
  SArticleGroup : String;
  BuhStr : String;
  SArticleGroupDouble : Int64;
  isRun : boolean;
  Is_PostBan : boolean;
  Is_PostBanPay : boolean;
  Is_ControlPostBanPay : boolean;
  Is_KomplectacijaRun : boolean;
  ColNPrice : Integer;
  ColNPrice1 : Integer;
  ErrMsg : String;
  TypeReturnNo : Integer;
  NameContractor, Name, NameLong : String;
  Komplectacija : Double;
  LKomplectacija : Double;
  ListDocumentId : String;
  ListTovarNotBlanks : String;
begin
  inherited;
  Dlg := TMlekoBlankParamForm.Create(Application);

  ColNPrice := 0;
  ColNPrice1 := 0;

  Is_KomplectacijaRun := true;

  OrderNo := quOrders.FieldByName('OrderNo').Value;

  CheckOrderForVeb := TMSQuery.Create(nil);
  CheckOrderForVeb.Connection:= dmDataModule.DB;
  CheckOrderForVeb.SQL.Clear;
  CheckOrderForVeb.SQL.Text := 'select * from l_BlankForVeb where IdVeb = :IdVeb';
  CheckOrderForVeb.ParamByName('IdVeb').Value := OrderNo;
  CheckOrderForVeb.Open;
  if CheckOrderForVeb.RecordCount <> 0 then raise Exception.Create('Этот заказ уже создавался!'+ #10#13 +
                                                                   'Повторное создание заказа запрещено!');
  CheckOrderForVeb.Close;


  if (quOrders.FieldByName('DateDelivery').Value = '01.01.1900') or
     (quOrders.FieldByName('DateDelivery').Value <= GlobalDateNakl) Then dtDateDelivery.Date := GlobalDateNakl
                                                                    Else dtDateDelivery.Date := quOrders.FieldByName('DateDelivery').Value;

  if (quOrdersTypeNakl.asString = 'Товарная') Then Dlg.spAddInputOrder.ParamByName('ReasonId').Value := 10
                                              Else Dlg.spAddInputOrder.ParamByName('ReasonId').Value := 11;
                                              
  if quOrders.FieldByName('Buh').Value = 'Касса' Then begin
                                                        Dlg.spAddInputOrder.ParamByName('Buh').Value := 1;
                                                        Buh := 1;
                                                      end
                                                 Else begin
                                                        Dlg.spAddInputOrder.ParamByName('Buh').Value := 2;
                                                        Buh := 2;
                                                      end;
  Dlg.spAddInputOrder.ParamByName('Description').Value := datetostr(quOrders.FieldByName('DateDelivery').Value) +
                                                              ' ' + quOrders.FieldByName('TimeDelivery').Value  +
                                                              ' ' + quOrders.FieldByName('Telephon').Value      +
                                                              ' ' + quOrders.FieldByName('Email').Value;
  Dlg.quOurFirm.Open;
  Dlg.spAddInputOrder.ParamByName('OurFirmNo').Value := Dlg.quOurFirm.FieldByName('PostNo').AsInteger;
  Dlg.quOurFirm.Close;

  if (quOrdersTypeNakl.asString = 'Товарная') then Dlg.spAddInputOrder.ParamByName('VidNaklNo').Value := 1
                                              Else Dlg.spAddInputOrder.ParamByName('VidNaklNo').Value := 3;

  if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                       ShowMessage('Выберите тип возврата');
                                                       Dlg4 := TTypeReturnForm.Create(Application);
                                                       Dlg4.quTypeReturn.Open;
                                                       try
                                                       if Dlg4.ShowModal = mrok Then
                                                        begin
                                                          TypeReturnNo := Dlg4.quTypeReturnTypeReturnNo.value;
                                                          Dlg.spModifyLinkBlankReturn.Close;
                                                          Dlg.spModifyLinkBlankReturn.ParamByName('TypeReturnNo').Value := TypeReturnNo;
                                                        end
                                                       finally
                                                       Dlg4.Free;
                                                       end; 
                                                     end;


  if quOrders.FieldByName('GroupClient').Value = 1 Then
   begin // 1

     ShowMessage('Необходимо создать Контрагента или выбрать из списка');
     Dlg1 := TMlekoSelectFirmForBlankDlg.Create(Application);
     try
     if Dlg1.ShowModal = mrok Then
      begin
        Dlg.spAddInputOrder.ParamByName('PostNo').Value := Dlg1.Query.FieldByName('PostNo').Value;
        PostNo := Dlg1.Query.FieldByName('PostNo').Value;
      end;
     finally
     Dlg1.Query.Close;
     Dlg1.Free;
     end;

     if (quOrders.FieldByName('NoContractor').AsInteger <> PostNo) Then raise Exception.Create('Номер контрагента не совпадает с номером в заказе!'+#13#10+
                                                                                               'Заказ создан не будет!'+#13#10+
                                                                                               'Заказ создавался на '+quOrders.FieldByName('NameContractor').AsString+#13#10+
                                                                                               'с номером '+quOrders.FieldByName('NoContractor').AsString+#13#10+
                                                                                               'Если такого контрагента нет в списке создайте его или проверте правильность номера на сайте.');
{
     quPost:=TMSQuery.Create(nil);
     quPost.Connection:=dmDataModule.DB;
     quPost.SQL.Clear;
     quPost.SQL.Text:='select rtrim(ltrim(SUBSTRING(name,3,len(name)))) as name, rtrim(ltrim(SUBSTRING(NameLong,3,len(NameLong)))) as NameLong from Post where PostNo = :PostNo';
     quPost.Prepare;
     quPost.ParamByName('PostNo').Value := PostNo;
     quPost.Open;

     NameContractor := quOrders.FieldByName('NameContractor').Value;
     Name := quPost.FieldByName('Name').Value;
     NameLong := quOrders.FieldByName('NameContractor').Value;


     if ((quOrders.FieldByName('NameContractor').Value <> quPost.FieldByName('Name').Value)
      and(quOrders.FieldByName('NameContractor').Value <> quPost.FieldByName('NameLong').Value))
      Then raise Exception.Create('Имя контрагента не совпадает и именем в заказе!'+#13#10+
                                  'Заказ создан не будет!'+#13#10+
                                  'Заказ создавался на '+quOrders.FieldByName('NameContractor').Value+#13#10+
                                  'Если такого контрагента нет в списке создайте его.');
}

     Dlg.quContract.Close;
     Dlg.quContract.ParamByName('p_PostNo').Value := PostNo;
     Dlg.quContract.Open;
     Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg.quContract.FieldByName('id').Value;
     Dlg.quContract.Close;
//     quPost.Close;


     if  quOrders.FieldByName('DateDelivery').Value <> '01.01.1900'   then Begin
                                                                             if quOrders.FieldByName('DateDelivery').Value <= GlobalDateNakl
                                                                               then DeliveryDate := GlobalDateNakl
                                                                               else begin
                                                                                      DateTimeToString(formattedDateTime, 'c',quOrders.FieldByName('DateDelivery').Value);
                                                                                      DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                    end;
                                                                            End
                                                                       else Begin
                                                                              buttonSelected := MessageDlg('Не задана дата доставки!'+#13#10+ //'Установить дату доставки в ' +'?'
                                                                                                           'Дата доставки устанавливается в ' + datetostr(dtDateDelivery.Date) ,mtWarning, mbOKCancel, 0);
                                                                              if buttonSelected = mrOK then Begin
                                                                                                              DateTimeToString(formattedDateTime, 'c', dtDateDelivery.Date);
                                                                                                              DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                            End;
                                                                              if buttonSelected = mrCancel then Begin
                                                                                                                  DateTimeToString(formattedDateTime, 'c', dtDateDelivery.Date);
                                                                                                                  DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                              {
                                                                                                              DateTimeToString(formattedDateTime, 'c', quOrders.FieldByName('DateDelivery').Value);
                                                                                                              DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                              }
                                                                                                                End;
                                                                            End;

     Showmessage('Выберите сотрудника');
     RetPostForRashod := PostForRashod(DeliveryDate,PostNo);
     if RetPostForRashod.PostNo > 0 then Begin
                                           Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                           Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := RetPostForRashod.SotrudNo;
                                           Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
                                           Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                           Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := RetPostForRashod.OtdelNo;
                                           OtdelNo := RetPostForRashod.OtdelNo;
                                           Dlg.spAddInputOrder.ParamByName('Buh').Value := RetPostForRashod.Buh;
                                           Buh := RetPostForRashod.Buh;
                                           Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := RetPostForRashod.SET_ARTICLE_GROUP;
                                         End
                                    else raise Exception.Create('Необходимо выбрать сотрудника!'+#13#10+
                                                                'Возможно к контрагенту не сопоставлены сотрудники.'+#13#10+
                                                                'Для того чтобы выбрать сопоставте контрагенту сотрудников ');

     quPostArtGroup := TMSQuery.Create(nil);
     quPostArtGroup.Connection:= dmDataModule.DB;
     quPostArtGroup.SQL.Clear;
     quPostArtGroup.SQL.Text:='select distinct lag.ARTICLE_GROUP_ID '+
                              '               ,dag.NAME '+
                              '               ,lag.ARTICLE_ID '+
                              '               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID '+
                              '               ,dsag.NAME '+
                              '               ,lpsagd.POSTNO '+
                              '               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay '+
                              '               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY '+
                              '               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT '+
                              '               ,isnull(lpsagp.POSTNO,0) as POSTNOP '+
                              '               ,isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_price '+
                              '               ,isnull(lpsagp.COLNPRICE,0) as COLNPRICE '+
                              ' from L_ARTICLE_GROUP lag left join '+
                              '      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join '+
                              '      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                              '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join '+
                              '      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = :PostNo and lpsagd.BUH = :Buh left join '+
                              '      L_POST_SET_ARTGROUP_PRICE lpsagp on lsag.SET_ARTICLE_GROUP_ID = lpsagp.SET_ARTICLE_GROUP_ID and lpsagp.POSTNO = :PostNom left join '+
                              '      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '+
                              '  where convert(int,iov.OrderNo) = convert(int,:OrderNo)  '+
                              '    and lsag.SET_ARTICLE_GROUP_ID is not null '+
                              '    and convert(smallint,iov.Article) not in (select TovarNo '+
                              '                                               from e_blanks '+
                              '                                                where Document_id in (select idBlank '+
                              '                                                                       from l_BlankForVeb '+
                              '                                                                        where IdVeb = convert(bigint,:OrderNom))) '+
                              '    and LEN(cast(isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as varchar(50))+ cast(isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as varchar(50))) > 2'+
                              '    and lpsagd.POSTNO is not null';

     quPostArtGroup.Prepare;
     quPostArtGroup.ParamByName('OrderNo').Value := OrderNo;
     quPostArtGroup.ParamByName('OrderNom').Value := OrderNo;
     quPostArtGroup.ParamByName('PostNo').Value := PostNo;
     quPostArtGroup.ParamByName('PostNom').Value := PostNo;
     quPostArtGroup.ParamByName('Buh').Value := Buh;

     quPostArtGroup.Open;
     quPostArtGroup.First;

     if quPostArtGroup.RecordCount =0 then ShowMessage ('Нет записи в запросе! '+#13#10+
                                                        quPostArtGroup.SQL.Text+#13#10+
                                                        'Обратитесь к программисту');

     while not quPostArtGroup.Eof do
       begin //quPostArtGroup.Eof

         documentID := 0;
//         Komplectacija := 0;
         SArticleGroup := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;

         SArticleGroupDouble := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').AsVariant;

         quCheckOrder :=TMSQuery.Create(nil);
         quCheckOrder.Connection:=dmDataModule.DB;
         quCheckOrder.SQL.Clear;
         quCheckOrder.SQL.Text:='select * '
                               +' from ImportOrderVebTmp ivt '
                               +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                               +'    and convert(smallint,Article) not in (select TovarNo '
                               +'                                                  from e_blanks '
                               +'                                                   where Document_id in (select idBlank '
                               +'                                                                          from l_BlankForVeb '
                               +'                                                                           where IdVeb = convert(bigint,:OrderNom))) '
                               +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                               +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                               +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                               +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                               +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                               +'    and ivt.KolTov >0 ';

         quCheckOrder.Prepare;
         quCheckOrder.ParamByName('OrderNo').Value := OrderNo;
         quCheckOrder.ParamByName('OrderNom').Value := OrderNo;
         quCheckOrder.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
         quCheckOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;
         quCheckOrder.Open;
         if quCheckOrder.RecordCount > 0 Then isRun := true else isRun := false;
         quCheckOrder.Close;


         Dlg.quPostBan.Close;
         Dlg.quPostBan.Params.ParamByName('p_PostNo').Value := PostNo;
         Dlg.quPostBan.Open;
         Is_PostBan := false;
         Is_PostBanPay := false;

         Dlg.quPostBanPay.Close;
         Dlg.quPostBanPay.Params.ParamByName('PostNo').Value := PostNo;
         Dlg.quPostBanPay.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
         Dlg.quPostBanPay.Params.ParamByName('Buh').Value := Buh;
         Dlg.quPostBanPay.Open;

         Dlg.quControlPayBan.Close;
         Dlg.quControlPayBan.Params.ParamByName('PostNo').Value := PostNo;
         Dlg.quControlPayBan.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
         Dlg.quControlPayBan.Params.ParamByName('Buh').Value := Buh;
         Dlg.quControlPayBan.Params.ParamByName('DateNakl').Value := DeliveryDate;
         Dlg.quControlPayBan.Open;

         Dlg.quSummaDolga.Close;
         Dlg.quSummaDolga.Params.ParamByName('PostNo').Value := PostNo;
         Dlg.quSummaDolga.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
         Dlg.quSummaDolga.Params.ParamByName('Buh').Value := Buh;
         Dlg.quSummaDolga.Open;

         if dlg.quControlPayBan.RecordCount > 0 then Is_ControlPostBanPay := false else Is_ControlPostBanPay := true;

         if ((Dlg.quSummaDolgaSUMMA_ECO.Value > Dlg.quPostBanPayPayBan.Value) and (Dlg.quPostBanPayPayBan.Value <>0)
                                                                              and (Is_ControlPostBanPay = True)) then
          begin
            DescriptionBanPay := 'Превышен лимит ' +#13#10+ 'Сумма дебиторской задолженности ' + FloatToStr(Dlg.quSummaDolgaSUMMA_ECO.Value) +#13#10+ 'Допустимый лимит '+ FloatToStr(Dlg.quPostBanPayPayBan.Value);
            if is_postBanPay = false then raise Exception.Create(DescriptionBanPay);
            Is_postBanPay := true;
          end;

         if (Dlg.quPostBanPostBan.Value = 1) and (quOrdersTypeNakl.asString = 'Возвратная') then
          begin
            DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
            raise Exception.Create(DescriptionBan);
            Is_PostBan := true;
          end;

         if CheckBlank(PostNo, Dlg.spAddInputOrder.ParamByName('ReasonId').Value, DeliveryDate, OtdelNo, SArticleGroupDouble, ErrMsg) >= 10 then
          begin
            //Не Успешно
            raise Exception.Create(ErrMsg);
          end;

         Dlg.quPostBan.Close;
         Dlg.quPostBanPay.Close;
         Dlg.quSummaDolga.Close;
         Dlg.quControlPayBan.Close;


         Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := SArticleGroup ;
         Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := quPostArtGroup.FieldByName('DAY_DELAY').Value;

         quColnPriceForOrder.ParamByName('OrderNo').Value := OrderNo;
         quColnPriceForOrder.ParamByName('OrderNom').Value := OrderNo;
         quColnPriceForOrder.ParamByName('PostNo').Value := PostNo;
         quColnPriceForOrder.ParamByName('PostNom').Value := PostNo;
         quColnPriceForOrder.ParamByName('Buh').Value := Buh;
         quColnPriceForOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Text;
         

         quColnPriceForOrder.Open;
         quColnPriceForOrder.First;

         if quColnPriceForOrder.RecordCount = 0 then quPostArtGroup.Next;

         while not quColnPriceForOrder.Eof do
           begin
             if quColnPriceForOrder.FieldByName('COLNPRICE').Value = 0 then quColnPriceForOrder.Next
                                                                       else
                                                                         Begin
                                                                           Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quColnPriceForOrder.FieldByName('COLNPRICE').Value;

                                                                           if ColNPrice <> quColnPriceForOrder.FieldByName('COLNPRICE').Value then begin
                                                                                                                                                     ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                                                                                                                                                     Dlg.spAddInputOrder.ExecProc;
                                                                                                                                                     documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                                                                                                                                                     LdocumentID := documentID;
                                                                                                                                                     //LKomplectacija := Komplectacija;
                                                                                                                                                   end;
                                                                           if documentID = 0 then begin
                                                                                                    documentID := LdocumentID;
                                                                                                    //Komplectacija := LKomplectacija;
                                                                                                  end;

                                                                           quSpecBlank :=TMSQuery.Create(nil);
                                                                           quSpecBlank.Connection:=dmDataModule.DB;
                                                                           quSpecBlank.SQL.Clear;
                                                                           quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                                                                                +'     ,convert(int,KolTov) as KolTov '
                                                                                                +'     ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                                                                                +'     ,convert(numeric(18,2),ltrim(rtrim(KomplectacijaOne))) as  KomplectacijaOne '
                                                                                                +'     ,convert(numeric(18,2),ltrim(rtrim(Komplectacija))) as  Komplectacija '
                                                                                                +' from ImportOrderVebTmp ivt '
                                                                                                +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                                                                                +'    and convert(smallint,Article) not in (select TovarNo '
                                                                                                +'                                                  from e_blanks '
                                                                                                +'                                                   where Document_id in (select idBlank '
                                                                                                +'                                                                          from l_BlankForVeb '
                                                                                                +'                                                                           where IdVeb = convert(bigint,:OrderNom))) '
                                                                                                +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                                                                                +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                                                                                +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                                                                                +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                                                                                +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                                                                                +'    and ivt.KolTov >0 ';

                                                                           quSpecBlank.Prepare;
                                                                           quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                                                                           quSpecBlank.ParamByName('OrderNom').Value := OrderNo;
                                                                           quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                                                                           quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;

                                                                           quSpecBlank.Open;

                                                                           if quSpecBlank.FieldByName('Komplectacija').Value = 0 then Komplectacija := 0;

                                                                           quSpecBlank.First;

                                                                           CheckOrderForVeb := TMSQuery.Create(nil);
                                                                           CheckOrderForVeb.Connection:= dmDataModule.DB;
                                                                           CheckOrderForVeb.SQL.Clear;
                                                                           CheckOrderForVeb.SQL.Text := 'select * from e_blanks where Document_id = :Document_id';
                                                                           CheckOrderForVeb.ParamByName('Document_id').Value := documentID;
                                                                           CheckOrderForVeb.Open;

                                                                           if (quSpecBlank.RecordCount = 0) and (CheckOrderForVeb.RecordCount = 0) then begin
                                                                                                                                                          quDelInputOrder := TMSQuery.Create(nil);
                                                                                                                                                          quDelInputOrder.Connection:=dmDataModule.DB;
                                                                                                                                                          quDelInputOrder.SQL.Clear;
                                                                                                                                                          quDelInputOrder.SQL.Text:= 'delete e_blank_head '+
                                                                                                                                                                                     ' where id = :id';
                                                                                                                                                          quDelInputOrder.Prepare;
                                                                                                                                                          quDelInputOrder.ParamByName('id').Value := documentID;
                                                                                                                                                          quDelInputOrder.Execute;
                                                                                                                                                          quSpecBlank.Close;
                                                                                                                                                        end;
                                                                           CheckOrderForVeb.Close;

                                                                           while not quSpecBlank.Eof do
                                                                             begin
                                                                               Dlg3 := TMlekoBlankSpecForm.Create(Application);

                                                                               if (quSpecBlank.FieldByName('KomplectacijaOne').Value > 0) and not (quOrdersTypeNakl.asString = 'Возвратная') then
                                                                                begin
                                                                                  Komplectacija :=  Komplectacija + quSpecBlank.FieldByName('KomplectacijaOne').Value;
                                                                                  Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                                  Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value :=  10815; // !!!!!!! Артикул "Услуга комплектации" проставлен хардкодом из-за не определенности с выбором
                                                                                  Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                                  Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := 1;
                                                                                  Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := 1;
                                                                                  Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := Komplectacija;
                                                                                  Dlg3.spEditBlankPosition.ExecProc;
                                                                                end;

                                                                               Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                               Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                                                               Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                               Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := quSpecBlank.FieldByName('KolTov').Value;
                                                                               Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := quSpecBlank.FieldByName('KolTov').Value;

                                                                               if ColNPrice = 0 Then Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quSpecBlank.FieldByName('PriceTov').Value
                                                                                                Else Begin
                                                                                                       quPrice :=TMSQuery.Create(nil);
                                                                                                       quPrice.Connection:=dmDataModule.DB;
                                                                                                       quPrice.SQL.Clear;
                                                                                                       quPrice.SQL.Text:= 'select isnull(case when :ColnPrice = 1 then Isnull(Price,0) '
                                                                                                                         +'                   when :ColnPrice = 2 then Isnull(Price1,0) '
                                                                                                                         +'                   when :ColnPrice = 3 then Isnull(Price2,0) '
                                                                                                                         +'                   when :ColnPrice = 4 then Isnull(Price3,0) '
                                                                                                                         +'                   when :ColnPrice = 5 then Isnull(Price4,0) '
                                                                                                                         +'                   when :ColnPrice = 6 then Isnull(Price5,0) '
                                                                                                                         +'                   when :ColnPrice = 7 then Isnull(Price6,0) '
                                                                                                                         +'                   when :ColnPrice = 8 then Isnull(Price7,0) '
                                                                                                                         +'                   when :ColnPrice = 10 then Isnull(Price8,0) '
                                                                                                                         +'                   when :ColnPrice = 11 then Isnull(Price9,0) '
                                                                                                                         +'                   when :ColnPrice = 12 then Isnull(Price10,0) '
                                                                                                                         +'                   when :ColnPrice = 13 then Isnull(Price13,0) '
                                                                                                                         +'                   when :ColnPrice = 14 then Isnull(Price14,0) '
                                                                                                                         +'                   when :ColnPrice = 15 then Isnull(Price15,0) '
                                                                                                                         +'                   when :ColnPrice = 9 then Isnull(AvgPriceIn,0) '
                                                                                                                         +'                   when :ColnPrice = 17 then Isnull(pfv.PriceVeb, 0) '
                                                                                                                         +'                   when :ColnPrice = 18 then Isnull(pfv.PriceInInst, 0) '
                                                                                                                         +'              end,0) as Price '
                                                                                                                         +' from Ostatok o '
                                                                                                                         +'     ,PriceForVeb pfv '
                                                                                                                         +'  where o.TovarNo = :TovarNo '
                                                                                                                         +'    and o.TovarNo = pfv.TovarNo';
                                                                                                       quPrice.Prepare;
                                                                                                       quPrice.ParamByName('TovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                                                                                       quPrice.ParamByName('ColnPrice').Value := ColNPrice;
                                                                                                       quPrice.Open;
                                                                                                       if ((quPrice.FieldByName('Price').Value = 0) or (quPrice.FieldByName('Price').Value = Null)) then begin
                                                                                                                                                                                                           ErrMsg := 'Не расцененный товар!' +#13#10+
                                                                                                                                                                                                                     'Создание заказа остановлено! Сообщите программисту!' +#13#10+
                                                                                                                                                                                                                     'Код товара ' + quSpecBlank.FieldByName('Article').AsString +#13#10+
                                                                                                                                                                                                                     'Номер заказа на сайте '+ IntToStr(OrderNo);
                                                                                                                                                                                                           raise Exception.Create(ErrMsg);
                                                                                                                                                                                                         end;

                                                                                                       Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quPrice.FieldByName('Price').Value;
                                                                                                       quPrice.Close;
                                                                                                     End;
                                                                               Dlg3.spEditBlankPosition.ExecProc;
                                                                               Dlg3.Free;
                                                                               quSpecBlank.Next;

                                                                             end;


                                                                           quColnPriceForOrder.Next
                                                                         End;
           end;
         quColnPriceForOrder.Close;

         CheckOrderForVeb := TMSQuery.Create(nil);
         CheckOrderForVeb.Connection:= dmDataModule.DB;
         CheckOrderForVeb.SQL.Clear;
         CheckOrderForVeb.SQL.Text := 'select * from l_BlankForVeb where IdVeb = :IdVeb and IdBlank = :IdBlank';
         CheckOrderForVeb.ParamByName('IdVeb').Value := OrderNo;
         CheckOrderForVeb.ParamByName('IdBlank').Value := documentID;
         CheckOrderForVeb.Open;
         if CheckOrderForVeb.RecordCount > 0 then isRun := false;

         quInsInl_BlankForVeb :=TMSQuery.Create(nil);
         quInsInl_BlankForVeb.Connection:=dmDataModule.DB;
         quInsInl_BlankForVeb.SQL.Clear;
         quInsInl_BlankForVeb.SQL.Text:='insert into l_BlankForVeb (IdVeb,IdBlank) '
                                       +'     values (:IdVeb,:IdBlank)';
         quInsInl_BlankForVeb.ParamByName('IdVeb').Value := OrderNo;
         quInsInl_BlankForVeb.ParamByName('idBlank').Value := documentID;

{
         quCheckOrderForKomplectacija := TMSQuery.Create(nil);
         quCheckOrderForKomplectacija.Connection := dmDataModule.DB;
         quCheckOrderForKomplectacija.SQL.Clear;
         quCheckOrderForKomplectacija.SQL.Text := 'select distinct convert(decimal(18,2),Komplectacija) as Komplectacija from work.dbo.ImportOrderVebTmp where OrderNo = :OrderNo';
         quCheckOrderForKomplectacija.ParamByName('OrderNo').Value := OrderNo;
         quCheckOrderForKomplectacija.Open;
}

         if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                    quInsInl_BlankForVeb.Execute;
                                                                    if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                                                                                         Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                                                                                                         Dlg.spModifyLinkBlankReturn.Execute;
                                                                                                                       end;
                                                                    {
                                                                    if (quCheckOrderForKomplectacija.FieldByName('Komplectacija').Value > 0) and (Is_KomplectacijaRun = true)
                                                                     then begin
                                                                            Dlg3 := TMlekoBlankSpecForm.Create(Application);
                                                                            Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                            Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := 10815; // !!!!!!! Артикул "Услуга комплектации" проставлен хардкодом из-за не определенности с выбором
                                                                            Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                            Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := 1;
                                                                            Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := 1;
                                                                            Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quCheckOrderForKomplectacija.FieldByName('Komplectacija').Value;
                                                                            Dlg3.spEditBlankPosition.ExecProc;
                                                                            Dlg3.Free;
                                                                            Is_KomplectacijaRun := false;
                                                                          end;
                                                                    }
                                                                    Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                  end
                                                             else begin
                                                                    if documentID > 0 then Showmessage ('Заказ document_id = '+ IntToStr(documentID)+ ' дополнен');
                                                                  end;
//         quCheckOrderForKomplectacija.Close;
         quInsInl_BlankForVeb.Close;
         quPostArtGroup.Next;
       end;//quPostArtGroup.Eof
       quPostArtGroup.Close;
   end; // 1

   if (quOrders.FieldByName('GroupClient').Value = 2) or (quOrders.FieldByName('GroupClient').Value = 3) Then
   begin // 2,3
     if quOrders.FieldByName('NoContractor').Value = 0
      Then Begin
        Showmessage('Не указан код контрагента на сайте!'+ #10#13 +
                    'Задайте номер контрагента ' + quOrders.FieldByName('NameContractor').Value + ' на сайте!');
        ShowMessage('Необходимо создать Контрагента или выбрать из списка');
        Dlg1 := TMlekoSelectFirmForBlankDlg.Create(Application);
        try
        if Dlg1.ShowModal = mrok Then
         begin
           Dlg.spAddInputOrder.ParamByName('PostNo').Value := Dlg1.Query.FieldByName('PostNo').Value;
           PostNo := Dlg1.Query.FieldByName('PostNo').Value;
         end;
        finally
        Dlg1.Query.Close;
        Dlg1.Free;
        end;

     if (quOrders.FieldByName('NoContractor').AsInteger <> PostNo) Then raise Exception.Create('Номер контрагента не совпадает и номером в заказе!'+#13#10+
                                                                                               'Заказ создан не будет!'+#13#10+
                                                                                               'Заказ создавался на '+quOrders.FieldByName('NameContractor').AsString+#13#10+
                                                                                               'с номером '+quOrders.FieldByName('NoContractor').AsString+#13#10+
                                                                                               'Если такого контрагента нет в списке создайте его или проверте правильность номера на сайте.');

{
        quPost:=TMSQuery.Create(nil);
        quPost.Connection:=dmDataModule.DB;
        quPost.SQL.Clear;
        quPost.SQL.Text:='select rtrim(ltrim(SUBSTRING(name,1,len(name)))) as name, rtrim(ltrim(SUBSTRING(NameLong,1,len(NameLong)))) as NameLong from Post where PostNo = :PostNo';
        quPost.Prepare;
        quPost.ParamByName('PostNo').Value := PostNo;
        quPost.Open;

        if ((quOrders.FieldByName('NameContractor').Value <> quPost.FieldByName('Name').Value)
         and(quOrders.FieldByName('NameContractor').Value <> quPost.FieldByName('NameLong').Value))
        Then begin
               quPost.Close;
               raise Exception.Create('Имя контрагента не совпадает и именем в заказе!'+#13#10+
                                      'Заказ создан не будет!'+#13#10+
                                      'Заказ создавался на '+quOrders.FieldByName('NameContractor').Value+#13#10+
                                      'Если такого контрагента нет в списке создайте его.');
             end;
}
        Dlg.quContract.Close;
        Dlg.quContract.ParamByName('p_PostNo').Value := PostNo;
        Dlg.quContract.Open;
        Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg.quContract.FieldByName('id').Value;
        Dlg.quContract.Close;
//        quPost.Close;
      End
      Else Begin
             PostNo:=quOrders.FieldByName('NoContractor').Value;
             Dlg.quContract.Close;
             Dlg.quContract.ParamByName('p_PostNo').Value := quOrders.FieldByName('NoContractor').Value;
             Dlg.quContract.Open;
             Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg.quContract.FieldByName('id').Value;
             Dlg.quContract.Close;
             Dlg.spAddInputOrder.ParamByName('PostNo').Value := quOrders.FieldByName('NoContractor').Value;
           End;

     if quOrders.FieldByName('DateDelivery').Value <> '01.01.1900'     then Begin
                                                                              if quOrders.FieldByName('DateDelivery').Value <= GlobalDateNakl
                                                                               then DeliveryDate := GlobalDateNakl
                                                                               else begin
                                                                                      DateTimeToString(formattedDateTime, 'c',quOrders.FieldByName('DateDelivery').Value);
                                                                                      DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                    end;
                                                                            End
                                                                       else Begin
                                                                              buttonSelected := MessageDlg('Не задана дата доставки!'+#13#10+ //'Установить дату доставки в ' +'?'
                                                                                                           'Дата доставки устанавливается в ' + datetostr(dtDateDelivery.Date) ,mtWarning, mbOKCancel, 0);
                                                                              if buttonSelected = mrOK then Begin
                                                                                                              DateTimeToString(formattedDateTime, 'c', dtDateDelivery.Date);
                                                                                                              DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                            End;
                                                                              if buttonSelected = mrCancel then Begin
                                                                                                                  DateTimeToString(formattedDateTime, 'c', dtDateDelivery.Date);
                                                                                                                  DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                              {
                                                                                                              DateTimeToString(formattedDateTime, 'c', quOrders.FieldByName('DateDelivery').Value);
                                                                                                              DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                              }
                                                                                                                End;
                                                                            End;

     Showmessage('Выберите сотрудника');
     RetPostForRashod := PostForRashod(DeliveryDate,PostNo);
     if RetPostForRashod.PostNo > 0 then Begin
                                           Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                           Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := RetPostForRashod.SotrudNo;
                                           Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
                                           Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                           Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := RetPostForRashod.OtdelNo;
                                           OtdelNo := RetPostForRashod.OtdelNo;
                                           Dlg.spAddInputOrder.ParamByName('Buh').Value := RetPostForRashod.Buh;
                                           Buh := RetPostForRashod.Buh;
                                           Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := RetPostForRashod.SET_ARTICLE_GROUP;
                                         End
                                    else raise Exception.Create('Необходимо выбрать сотрудника!'+#13#10+
                                                                'Возможно к контрагенту не сопоставлены сотрудники.'+#13#10+
                                                                'Для того чтобы выбрать сопоставте контрагенту сотрудников ');

     quPostArtGroup := TMSQuery.Create(nil);
     quPostArtGroup.Connection:= dmDataModule.DB;
     quPostArtGroup.SQL.Clear;
     quPostArtGroup.SQL.Text:='select distinct lag.ARTICLE_GROUP_ID '+
                              '               ,dag.NAME '+
                              '               ,lag.ARTICLE_ID '+
                              '               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID '+
                              '               ,dsag.NAME '+
                              '               ,lpsagd.POSTNO '+
                              '               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay '+
                              '               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY '+
                              '               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT '+
                              '               ,isnull(lpsagp.POSTNO,0) as POSTNOP '+
                              '               ,isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_price '+
                              '               ,isnull(lpsagp.COLNPRICE,0) as COLNPRICE '+
                              ' from L_ARTICLE_GROUP lag left join '+
                              '      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join '+
                              '      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                              '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join '+
                              '      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = :PostNo and lpsagd.BUH = :Buh left join '+
                              '      L_POST_SET_ARTGROUP_PRICE lpsagp on lsag.SET_ARTICLE_GROUP_ID = lpsagp.SET_ARTICLE_GROUP_ID and lpsagp.POSTNO = :PostNom left join '+
                              '      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '+
                              '  where convert(int,iov.OrderNo) = convert(int,:OrderNo)  '+
                              '    and lsag.SET_ARTICLE_GROUP_ID is not null '+
                              '    and convert(smallint,iov.Article) not in (select TovarNo '+
                              '                                               from e_blanks '+
                              '                                                where Document_id in (select idBlank '+
                              '                                                                       from l_BlankForVeb '+
                              '                                                                        where IdVeb = convert(bigint,:OrderNom))) '+
                              '    and LEN(cast(isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as varchar(50))+ cast(isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as varchar(50))) > 2'+
                              '    and lpsagd.POSTNO is not null';


     quPostArtGroup.Prepare;
     quPostArtGroup.ParamByName('OrderNo').Value := OrderNo;
     quPostArtGroup.ParamByName('OrderNom').Value := OrderNo;
     quPostArtGroup.ParamByName('PostNo').Value := PostNo;
     quPostArtGroup.ParamByName('PostNom').Value := PostNo;
     quPostArtGroup.ParamByName('Buh').Value := Buh;

     quPostArtGroup.Open;
     quPostArtGroup.First;

     if quPostArtGroup.RecordCount =0 then ShowMessage ('Нет записи в запросе! '+#13#10+
                                                        quPostArtGroup.SQL.Text+#13#10+
                                                        'Обратитесь к программисту');

     while not quPostArtGroup.Eof do
       begin //quPostArtGroup.Eof


          documentID := 0;
//          Komplectacija := 0;
          SArticleGroup := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;

          SArticleGroupDouble := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').AsVariant;

          quCheckOrder :=TMSQuery.Create(nil);
          quCheckOrder.Connection:=dmDataModule.DB;
          quCheckOrder.SQL.Clear;
          quCheckOrder.SQL.Text:='select * '
                                +' from ImportOrderVebTmp ivt '
                                +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                +'    and convert(smallint,Article) not in (select TovarNo '
                                +'                                                  from e_blanks '
                                +'                                                   where Document_id in (select idBlank '
                                +'                                                                          from l_BlankForVeb '
                                +'                                                                           where IdVeb = convert(bigint,:OrderNom))) '
                                +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                +'    and ivt.KolTov >0 ';

          quCheckOrder.Prepare;
          quCheckOrder.ParamByName('OrderNo').Value := OrderNo;
          quCheckOrder.ParamByName('OrderNom').Value := OrderNo;
          quCheckOrder.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
          quCheckOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;
          quCheckOrder.Open;
          if quCheckOrder.RecordCount > 0 Then isRun := true else isRun := false;
          quCheckOrder.Close;

          Dlg.quPostBan.Close;
          Dlg.quPostBan.Params.ParamByName('p_PostNo').Value := PostNo;
          Dlg.quPostBan.Open;
          Is_PostBan := false;
          Is_PostBanPay := false;

          Dlg.quPostBanPay.Close;
          Dlg.quPostBanPay.Params.ParamByName('PostNo').Value := PostNo;
          Dlg.quPostBanPay.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
          Dlg.quPostBanPay.Params.ParamByName('Buh').Value := Buh;
          Dlg.quPostBanPay.Open;

          Dlg.quControlPayBan.Close;
          Dlg.quControlPayBan.Params.ParamByName('PostNo').Value := PostNo;
          Dlg.quControlPayBan.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
          Dlg.quControlPayBan.Params.ParamByName('Buh').Value := Buh;
          Dlg.quControlPayBan.Params.ParamByName('DateNakl').Value := DeliveryDate;
          Dlg.quControlPayBan.Open;

          Dlg.quSummaDolga.Close;
          Dlg.quSummaDolga.Params.ParamByName('PostNo').Value := PostNo;
          Dlg.quSummaDolga.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
          Dlg.quSummaDolga.Params.ParamByName('Buh').Value := Buh;
          Dlg.quSummaDolga.Open;

          if dlg.quControlPayBan.RecordCount > 0 then Is_ControlPostBanPay := false else Is_ControlPostBanPay := true;

          if ((Dlg.quSummaDolgaSUMMA_ECO.Value > Dlg.quPostBanPayPayBan.Value) and (Dlg.quPostBanPayPayBan.Value <>0)
                                                                               and (Is_ControlPostBanPay = True)) then
           begin
             DescriptionBanPay := 'Превышен лимит ' +#13#10+ 'Сумма дебиторской задолженности ' + FloatToStr(Dlg.quSummaDolgaSUMMA_ECO.Value) +#13#10+ 'Допустимый лимит '+ FloatToStr(Dlg.quPostBanPayPayBan.Value);
             if is_postBanPay = false then raise Exception.Create(DescriptionBanPay);
             Is_postBanPay := true;
           end;

          if (Dlg.quPostBanPostBan.Value = 1) and (quOrdersTypeNakl.asString = 'Возвратная') then
           begin
             DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
             raise Exception.Create(DescriptionBan);
             Is_PostBan := true;
           end;

          if CheckBlank(PostNo, Dlg.spAddInputOrder.ParamByName('ReasonId').Value, DeliveryDate, OtdelNo, SArticleGroupDouble, ErrMsg) >= 10 then
           begin
             //Не Успешно
             raise Exception.Create(ErrMsg);
           end;

          Dlg.quPostBan.Close;
          Dlg.quPostBanPay.Close;
          Dlg.quSummaDolga.Close;
          Dlg.quControlPayBan.Close;

 ////////


          Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := SArticleGroup;
          Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := quPostArtGroup.FieldByName('DAY_DELAY').Value;

          quColnPriceForOrder.ParamByName('OrderNo').Value := OrderNo;
          quColnPriceForOrder.ParamByName('OrderNom').Value := OrderNo;
          quColnPriceForOrder.ParamByName('PostNo').Value := PostNo;
          quColnPriceForOrder.ParamByName('PostNom').Value := PostNo;
          quColnPriceForOrder.ParamByName('Buh').Value := Buh;
          quColnPriceForOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Text;
          quColnPriceForOrder.Open;
          quColnPriceForOrder.First;
{
          if quColnPriceForOrder.RecordCount =0 then ShowMessage ('Нет записи в запросе! '+#13#10+
                                                                   quPostArtGroup.SQL.Text+#13#10+
                                                                  'Обратитесь к программисту');
}


          while not quColnPriceForOrder.Eof do
            begin
//              showmessage(inttostr(quColnPriceForOrder.FieldByName('COLNPRICE').Value));
              if (quColnPriceForOrder.FieldByName('COLNPRICE').Value = 0) then quColnPriceForOrder.Next
                                                                          else
                                                                            Begin
                                                                              Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                                                                              if ColNPrice <> quColnPriceForOrder.FieldByName('COLNPRICE').Value then begin
                                                                                                                                                        ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                                                                                                                                                        Dlg.spAddInputOrder.ExecProc;
                                                                                                                                                        documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                                                                                                                                                        LdocumentID := documentID;
                                                                                                                                                        //LKomplectacija := Komplectacija;
                                                                                                                                                      end;
                                                                              if documentID = 0 then begin
                                                                                                       documentID := LdocumentID;
                                                                                                       //Komplectacija := LKomplectacija;
                                                                                                     end;  
                                                                              
                                                                              quSpecBlank :=TMSQuery.Create(nil);
                                                                              quSpecBlank.Connection:=dmDataModule.DB;
                                                                              quSpecBlank.SQL.Clear;
                                                                              quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                                                                                   +'     ,convert(int,KolTov) as KolTov '
                                                                                                   +'     ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                                                                                   +'     ,convert(numeric(18,2),ltrim(rtrim(KomplectacijaOne))) as  KomplectacijaOne '
                                                                                                   +'     ,convert(numeric(18,2),ltrim(rtrim(Komplectacija))) as  Komplectacija '
                                                                                                   +' from ImportOrderVebTmp ivt '
                                                                                                   +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                                                                                   +'    and convert(smallint,Article) not in (select TovarNo '
                                                                                                   +'                                                  from e_blanks '
                                                                                                   +'                                                   where Document_id in (select idBlank '
                                                                                                   +'                                                                          from l_BlankForVeb '
                                                                                                   +'                                                                           where IdVeb = convert(bigint,:OrderNom))) '
                                                                                                   +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                                                                                   +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                                                                                   +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                                                                                   +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                                                                                   +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                                                                                   +'    and ivt.KolTov >0 ';

                                                                              quSpecBlank.Prepare;
                                                                              quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                                                                              quSpecBlank.ParamByName('OrderNom').Value := OrderNo;
                                                                              quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                                                                              quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;

 //    showmessage(quSpecBlank.SQL.Text);

                                                                              quSpecBlank.Open;

                                                                              if quSpecBlank.FieldByName('Komplectacija').Value = 0 then Komplectacija := 0;

                                                                              quSpecBlank.First;

                                                                              CheckOrderForVeb := TMSQuery.Create(nil);
                                                                              CheckOrderForVeb.Connection:= dmDataModule.DB;
                                                                              CheckOrderForVeb.SQL.Clear;
                                                                              CheckOrderForVeb.SQL.Text := 'select * from e_blanks where Document_id = :Document_id';
                                                                              CheckOrderForVeb.ParamByName('Document_id').Value := documentID;
                                                                              CheckOrderForVeb.Open;

                                                                              if (quSpecBlank.RecordCount = 0) and (CheckOrderForVeb.RecordCount = 0) then begin
                                                                                                                                                             quDelInputOrder := TMSQuery.Create(nil);
                                                                                                                                                             quDelInputOrder.Connection:=dmDataModule.DB;
                                                                                                                                                             quDelInputOrder.SQL.Clear;
                                                                                                                                                             quDelInputOrder.SQL.Text:= 'delete e_blank_head '+
                                                                                                                                                                                        ' where id = :id';
                                                                                                                                                             quDelInputOrder.Prepare;
                                                                                                                                                             quDelInputOrder.ParamByName('id').Value := documentID;
                                                                                                                                                             quDelInputOrder.Execute;
                                                                                                                                                             quSpecBlank.Close;
                                                                                                                                                           end;
                                                                             CheckOrderForVeb.Close;

                                                                              while not quSpecBlank.Eof do
                                                                                begin
                                                                                  Dlg3 := TMlekoBlankSpecForm.Create(Application);

                                                                                  if (quSpecBlank.FieldByName('KomplectacijaOne').Value > 0) and not (quOrdersTypeNakl.asString = 'Возвратная') then
                                                                                   begin
                                                                                      Komplectacija :=  Komplectacija + quSpecBlank.FieldByName('KomplectacijaOne').Value;
                                                                                      Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                                      Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value :=  10815; // !!!!!!! Артикул "Услуга комплектации" проставлен хардкодом из-за не определенности с выбором
                                                                                      Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                                      Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := 1;
                                                                                      Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := 1;
                                                                                      Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := Komplectacija;
                                                                                      Dlg3.spEditBlankPosition.ExecProc;
                                                                                   end;

                                                                                  Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                                  Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                                                                  Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                                  Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := quSpecBlank.FieldByName('KolTov').Value;
                                                                                  Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := quSpecBlank.FieldByName('KolTov').Value;

                                                                                  if ColNPrice = 0 Then Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quSpecBlank.FieldByName('PriceTov').Value
                                                                                                   Else Begin
                                                                                                          quPrice :=TMSQuery.Create(nil);
                                                                                                          quPrice.Connection:=dmDataModule.DB;
                                                                                                          quPrice.SQL.Clear;
                                                                                                          quPrice.SQL.Text:= 'select isnull(case when :ColnPrice = 1 then Isnull(Price,0) '
                                                                                                                            +'                   when :ColnPrice = 2 then Isnull(Price1,0) '
                                                                                                                            +'                   when :ColnPrice = 3 then Isnull(Price2,0) '
                                                                                                                            +'                   when :ColnPrice = 4 then Isnull(Price3,0) '
                                                                                                                            +'                   when :ColnPrice = 5 then Isnull(Price4,0) '
                                                                                                                            +'                   when :ColnPrice = 6 then Isnull(Price5,0) '
                                                                                                                            +'                   when :ColnPrice = 7 then Isnull(Price6,0) '
                                                                                                                            +'                   when :ColnPrice = 8 then Isnull(Price7,0) '
                                                                                                                            +'                   when :ColnPrice = 10 then Isnull(Price8,0) '
                                                                                                                            +'                   when :ColnPrice = 11 then Isnull(Price9,0) '
                                                                                                                            +'                   when :ColnPrice = 12 then Isnull(Price10,0) '
                                                                                                                            +'                   when :ColnPrice = 13 then Isnull(Price13,0) '
                                                                                                                            +'                   when :ColnPrice = 14 then Isnull(Price14,0) '
                                                                                                                            +'                   when :ColnPrice = 15 then Isnull(Price15,0) '
                                                                                                                            +'                   when :ColnPrice = 9 then Isnull(AvgPriceIn,0) '
                                                                                                                            +'                   when :ColnPrice = 17 then Isnull(pfv.PriceVeb, 0) '
                                                                                                                            +'                   when :ColnPrice = 18 then Isnull(pfv.PriceInInst, 0) '
                                                                                                                            +'              end,0) as Price '
                                                                                                                            +' from Ostatok o '
                                                                                                                            +'     ,PriceForVeb pfv '
                                                                                                                            +'  where o.TovarNo = :TovarNo '
                                                                                                                            +'    and o.TovarNo = pfv.TovarNo';
                                                                                                          quPrice.Prepare;
                                                                                                          quPrice.ParamByName('TovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                                                                                          quPrice.ParamByName('ColnPrice').Value := ColNPrice;
                                                                                                          quPrice.Open;
                                                                                                          if ((quPrice.FieldByName('Price').Value = 0) or (quPrice.FieldByName('Price').Value = Null)) then begin
                                                                                                                                                                                                              ErrMsg := 'Не расцененный товар!' +#13#10+
                                                                                                                                                                                                                        'Создание заказа остановлено! Сообщите программисту!' +#13#10+
                                                                                                                                                                                                                        'Код товара ' + quSpecBlank.FieldByName('Article').AsString +#13#10+
                                                                                                                                                                                                                        'Номер заказа на сайте '+ IntToStr(OrderNo);
                                                                                                                                                                                                              raise Exception.Create(ErrMsg);
                                                                                                                                                                                                            end;

                                                                                                          Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quPrice.FieldByName('Price').Value;
                                                                                                          quPrice.Close;
                                                                                                        End;
                                                                                  Dlg3.spEditBlankPosition.ExecProc;
                                                                                  Dlg3.Free;
                                                                                  quSpecBlank.Next;

                                                                                end;

                                                                              CheckOrderForVeb := TMSQuery.Create(nil);
                                                                              CheckOrderForVeb.Connection:= dmDataModule.DB;
                                                                              CheckOrderForVeb.SQL.Clear;
                                                                              CheckOrderForVeb.SQL.Text := 'select * from l_BlankForVeb where IdVeb = :IdVeb and IdBlank = :IdBlank';
                                                                              CheckOrderForVeb.ParamByName('IdVeb').Value := OrderNo;
                                                                              CheckOrderForVeb.ParamByName('IdBlank').Value := documentID;
                                                                              CheckOrderForVeb.Open;
                                                                              if CheckOrderForVeb.RecordCount > 0 then isRun := false;

                                                                              quInsInl_BlankForVeb :=TMSQuery.Create(nil);
                                                                              quInsInl_BlankForVeb.Connection:=dmDataModule.DB;
                                                                              quInsInl_BlankForVeb.SQL.Clear;
                                                                              quInsInl_BlankForVeb.SQL.Text:='insert into l_BlankForVeb (IdVeb,IdBlank) '
                                                                                                            +'     values (:IdVeb,:IdBlank)';
                                                                              quInsInl_BlankForVeb.ParamByName('IdVeb').Value := OrderNo;
                                                                              quInsInl_BlankForVeb.ParamByName('idBlank').Value := documentID;

{
                                                                              quCheckOrderForKomplectacija := TMSQuery.Create(nil);
                                                                              quCheckOrderForKomplectacija.Connection := dmDataModule.DB;
                                                                              quCheckOrderForKomplectacija.SQL.Clear;
                                                                              quCheckOrderForKomplectacija.SQL.Text := 'select distinct convert(decimal(18,2),Komplectacija) as Komplectacija from work.dbo.ImportOrderVebTmp where OrderNo = :OrderNo';
                                                                              quCheckOrderForKomplectacija.ParamByName('OrderNo').Value := OrderNo;
                                                                              quCheckOrderForKomplectacija.Open;
}

                                                                              if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                                                                                         quInsInl_BlankForVeb.Execute;
                                                                                                                                         if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                                                                                                                                                              Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                                                                                                                                                                              Dlg.spModifyLinkBlankReturn.Execute;
                                                                                                                                                                                            end;
                                                                                                                                         {
                                                                                                                                         if (quCheckOrderForKomplectacija.FieldByName('Komplectacija').Value > 0) and (Is_KomplectacijaRun = true)
                                                                                                                                          then begin
                                                                                                                                                 Dlg3 := TMlekoBlankSpecForm.Create(Application);
                                                                                                                                                 Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                                                                                                 Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := 10815; // !!!!!!! Артикул "Услуга комплектации" проставлен хардкодом из-за не определенности с выбором
                                                                                                                                                 Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                                                                                                 Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := 1;
                                                                                                                                                 Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := 1;
                                                                                                                                                 Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quCheckOrderForKomplectacija.FieldByName('Komplectacija').Value;
                                                                                                                                                 Dlg3.spEditBlankPosition.ExecProc;
                                                                                                                                                 Dlg3.Free;
                                                                                                                                                 Is_KomplectacijaRun := false;
                                                                                                                                               end;
                                                                                                                                         }
                                                                                                                                         Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                                                                                       end
                                                                                                                                  else begin
                                                                                                                                         if documentID > 0 then Showmessage ('Заказ document_id = '+ IntToStr(documentID)+ ' дополнен');
                                                                                                                                       end;
//                                                                              quCheckOrderForKomplectacija.Close;
                                                                              quInsInl_BlankForVeb.Close;

                                                                              quColnPriceForOrder.Next;
                                                                            End;
            end;
          quColnPriceForOrder.Close;

          quPostArtGroup.Next;
       end;//quPostArtGroup.Eof
    quPostArtGroup.Close;

   end; // 2,3
  if quOrders.FieldByName('GroupClient').Value = 4 Then
   begin // 4
     if quOrders.FieldByName('NoClient').Value = 0
      Then Begin // quOrders.FieldByName('NoClient').Value = 0 then
             if quOrders.FieldByName('NoContractor').Value = 0
              Then Begin // quOrders.FieldByName('NoContractor').Value = 0  then
                     Showmessage('Не указан код контрагента на сайте!'+ #10#13 +
                                 'Задайте номер контрагента ' + quOrders.FieldByName('NameContractor').Value + ' на сайте!');
                     ShowMessage('Необходимо создать Контрагента или выбрать из списка');
                     Dlg1 := TMlekoSelectFirmForBlankDlg.Create(Application);
                     try
                     if Dlg1.ShowModal = mrok Then
                      begin // Dlg1.ShowModal = mrok
                        Dlg.spAddInputOrder.ParamByName('PostNo').Value := Dlg1.Query.FieldByName('PostNo').Value;
                        PostNo := Dlg1.Query.FieldByName('PostNo').Value;
                      end; // Dlg1.ShowModal = mrok
                     finally
                     Dlg1.Query.Close;
                     Dlg1.Free;
                     end; // try

     if (quOrders.FieldByName('NoContractor').AsInteger <> PostNo) Then raise Exception.Create('Номер контрагента не совпадает с номером в заказе!'+#13#10+
                                                                                               'Заказ создан не будет!'+#13#10+
                                                                                               'Заказ создавался на '+quOrders.FieldByName('NameContractor').AsString+#13#10+
                                                                                               'с номером '+quOrders.FieldByName('NoContractor').AsString+#13#10+
                                                                                               'Если такого контрагента нет в списке создайте его или проверте правильность номера на сайте.');
{
                     quPost:=TMSQuery.Create(nil);
                     quPost.Connection:=dmDataModule.DB;
                     quPost.SQL.Clear;
                     quPost.SQL.Text:='select rtrim(ltrim(name)) as name, rtrim(ltrim(NameLong)) as NameLong from Post where PostNo = :PostNo';
                     quPost.Prepare;
                     quPost.ParamByName('PostNo').Value := PostNo;
                     quPost.Open;

                     if ((quOrders.FieldByName('NameContractor').Value <> quPost.FieldByName('Name').Value)
                      and(quOrders.FieldByName('NameContractor').Value <> quPost.FieldByName('NameLong').Value))
                     Then begin
                            quPost.Close;
                            raise Exception.Create('Имя контрагента не совпадает и именем в заказе!'+#13#10+
                                                   'Заказ создан не будет!'+#13#10+
                                                   'Заказ создавался на '+quOrders.FieldByName('NameContractor').Value+#13#10+
                                                   'Если такого контрагента нет в списке создайте его.');
                          end;
}
                     Dlg.quContract.Close;
                     Dlg.quContract.ParamByName('p_PostNo').Value := PostNo;
                     Dlg.quContract.Open;
                     Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg.quContract.FieldByName('id').Value;
                     Dlg.quContract.Close;
//                     quPost.Close;


                     if quOrders.FieldByName('DateDelivery').Value <> '01.01.1900'     then Begin
                                                                                              if quOrders.FieldByName('DateDelivery').Value <= GlobalDateNakl
                                                                                               then DeliveryDate := GlobalDateNakl
                                                                                               else begin
                                                                                                      DateTimeToString(formattedDateTime, 'c',quOrders.FieldByName('DateDelivery').Value);
                                                                                                      DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                    end;
                                                                                            End
                                                                                       else Begin
                                                                                              buttonSelected := MessageDlg('Не задана дата доставки!'+#13#10+ //'Установить дату доставки в ' +'?'
                                                                                                                           'Дата доставки устанавливается в ' + datetostr(dtDateDelivery.Date) ,mtWarning, mbOKCancel, 0);
                                                                                              if buttonSelected = mrOK then Begin
                                                                                                                              DateTimeToString(formattedDateTime, 'c', dtDateDelivery.Date);
                                                                                                                              DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                                            End;
                                                                                              if buttonSelected = mrCancel then Begin
                                                                                                                                  DateTimeToString(formattedDateTime, 'c', dtDateDelivery.Date);
                                                                                                                                  DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                              {
                                                                                                              DateTimeToString(formattedDateTime, 'c', quOrders.FieldByName('DateDelivery').Value);
                                                                                                              DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                              }
                                                                                                                                End;
                                                                                            End;

                     Showmessage('Выберите сотрудника');
                     RetPostForRashod := PostForRashod(DeliveryDate,PostNo);
                     if RetPostForRashod.PostNo > 0 then Begin
                                                           Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                                           Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := RetPostForRashod.SotrudNo;
                                                           Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
                                                           Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                                           Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := RetPostForRashod.OtdelNo;
                                                           OtdelNo := RetPostForRashod.OtdelNo;
                                                           Dlg.spAddInputOrder.ParamByName('Buh').Value := RetPostForRashod.Buh;
                                                           Buh := RetPostForRashod.Buh;
                                                           Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := RetPostForRashod.SET_ARTICLE_GROUP;
                                                         End
                                                    else raise Exception.Create('Необходимо выбрать сотрудника!'+#13#10+
                                                                                'Возможно к контрагенту не сопоставлены сотрудники.'+#13#10+
                                                                                'Для того чтобы выбрать сопоставте контрагенту сотрудников ');

                     quPostArtGroup := TMSQuery.Create(nil);
                     quPostArtGroup.Connection:= dmDataModule.DB;
                     quPostArtGroup.SQL.Clear;
                     quPostArtGroup.SQL.Text:='select distinct lag.ARTICLE_GROUP_ID '+
                                              '               ,dag.NAME '+
                                              '               ,lag.ARTICLE_ID '+
                                              '               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID '+
                                              '               ,dsag.NAME '+
                                              '               ,lpsagd.POSTNO '+
                                              '               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay '+
                                              '               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY '+
                                              '               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT '+
                                              '               ,isnull(lpsagp.POSTNO,0) as POSTNOP '+
                                              '               ,isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_price '+
                                              '               ,isnull(lpsagp.COLNPRICE,0) as COLNPRICE '+
                                              ' from L_ARTICLE_GROUP lag left join '+
                                              '      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join '+
                                              '      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                                              '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join '+
                                              '      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = :PostNo and lpsagd.BUH = :Buh left join '+
                                              '      L_POST_SET_ARTGROUP_PRICE lpsagp on lsag.SET_ARTICLE_GROUP_ID = lpsagp.SET_ARTICLE_GROUP_ID and lpsagp.POSTNO = :PostNom left join '+
                                              '      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '+
                                              '  where convert(bigint,iov.OrderNo) = convert(bigint,:OrderNo)  '+
                                              '    and lsag.SET_ARTICLE_GROUP_ID is not null '+
                                              '    and convert(smallint,iov.Article) not in (select TovarNo '+
                                              '                                               from e_blanks '+
                                              '                                                where Document_id in (select idBlank '+
                                              '                                                                       from l_BlankForVeb '+
                                              '                                                                        where IdVeb = convert(bigint,:OrderNom))) '+
                                              '    and LEN(cast(isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as varchar(50))+ cast(isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as varchar(50))) > 2'+
                                              '    and lpsagd.POSTNO is not null';


                     quPostArtGroup.Prepare;
                     quPostArtGroup.ParamByName('OrderNo').Value := OrderNo;
                     quPostArtGroup.ParamByName('OrderNom').Value := OrderNo;
                     quPostArtGroup.ParamByName('PostNo').Value := PostNo;
                     quPostArtGroup.ParamByName('PostNom').Value := PostNo;
                     quPostArtGroup.ParamByName('Buh').Value := Buh;

                     quPostArtGroup.Open;
                     quPostArtGroup.First;

                     if quPostArtGroup.RecordCount =0 then ShowMessage ('Нет записи в запросе! '+#13#10+
                                                                        quPostArtGroup.SQL.Text+#13#10+
                                                                        'Обратитесь к программисту');

                     while not quPostArtGroup.Eof do
                       begin //quPostArtGroup.Eof

                         documentID := 0;
//                         Komplectacija := 0;
                         SArticleGroup := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;

                         SArticleGroupDouble := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').AsVariant;

                         quCheckOrder :=TMSQuery.Create(nil);
                         quCheckOrder.Connection:=dmDataModule.DB;
                         quCheckOrder.SQL.Clear;
                         quCheckOrder.SQL.Text:='select * '
                                               +' from ImportOrderVebTmp ivt '
                                               +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                               +'    and convert(smallint,Article) not in (select TovarNo '
                                               +'                                                  from e_blanks '
                                               +'                                                   where Document_id in (select idBlank '
                                               +'                                                                          from l_BlankForVeb '
                                               +'                                                                           where IdVeb = convert(bigint,:OrderNom))) '
                                               +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                               +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                               +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                               +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                               +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                               +'    and ivt.KolTov >0 ';

                         quCheckOrder.Prepare;
                         quCheckOrder.ParamByName('OrderNo').Value := OrderNo;
                         quCheckOrder.ParamByName('OrderNom').Value := OrderNo;
                         quCheckOrder.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                         quCheckOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;
                         quCheckOrder.Open;
                         if quCheckOrder.RecordCount > 0 Then isRun := true else isRun := false;
                         quCheckOrder.Close;

                         Dlg.quPostBan.Close;
                         Dlg.quPostBan.Params.ParamByName('p_PostNo').Value := PostNo;
                         Dlg.quPostBan.Open;
                         Is_PostBan := false;
                         Is_PostBanPay := false;

                         Dlg.quPostBanPay.Close;
                         Dlg.quPostBanPay.Params.ParamByName('PostNo').Value := PostNo;
                         Dlg.quPostBanPay.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
                         Dlg.quPostBanPay.Params.ParamByName('Buh').Value := Buh;
                         Dlg.quPostBanPay.Open;

                         Dlg.quControlPayBan.Close;
                         Dlg.quControlPayBan.Params.ParamByName('PostNo').Value := PostNo;
                         Dlg.quControlPayBan.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
                         Dlg.quControlPayBan.Params.ParamByName('Buh').Value := Buh;
                         Dlg.quControlPayBan.Params.ParamByName('DateNakl').Value := DeliveryDate;
                         Dlg.quControlPayBan.Open;

                         Dlg.quSummaDolga.Close;
                         Dlg.quSummaDolga.Params.ParamByName('PostNo').Value := PostNo;
                         Dlg.quSummaDolga.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
                         Dlg.quSummaDolga.Params.ParamByName('Buh').Value := Buh;
                         Dlg.quSummaDolga.Open;

                         if dlg.quControlPayBan.RecordCount > 0 then Is_ControlPostBanPay := false else Is_ControlPostBanPay := true;

                         if ((Dlg.quSummaDolgaSUMMA_ECO.Value > Dlg.quPostBanPayPayBan.Value) and (Dlg.quPostBanPayPayBan.Value <>0)
                                                                                              and (Is_ControlPostBanPay = True)) then
                          begin
                            DescriptionBanPay := 'Превышен лимит ' +#13#10+ 'Сумма дебиторской задолженности ' + FloatToStr(Dlg.quSummaDolgaSUMMA_ECO.Value) +#13#10+ 'Допустимый лимит '+ FloatToStr(Dlg.quPostBanPayPayBan.Value);
                            if is_postBanPay = false then raise Exception.Create(DescriptionBanPay);
                            Is_postBanPay := true;
                          end;

                         if (Dlg.quPostBanPostBan.Value = 1) and (quOrdersTypeNakl.asString = 'Возвратная') then
                          begin
                            DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
                            raise Exception.Create(DescriptionBan);
                            Is_PostBan := true;
                          end;

                         if CheckBlank(PostNo, Dlg.spAddInputOrder.ParamByName('ReasonId').Value, DeliveryDate, OtdelNo, SArticleGroupDouble, ErrMsg) >= 10 then
                          begin
                            //Не Успешно
                            raise Exception.Create(ErrMsg);
                          end;

                         Dlg.quPostBan.Close;
                         Dlg.quPostBanPay.Close;
                         Dlg.quSummaDolga.Close;
                         Dlg.quControlPayBan.Close;




                         Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := SArticleGroup ;
                         Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := quPostArtGroup.FieldByName('DAY_DELAY').Value;

                         quColnPriceForOrder.ParamByName('OrderNo').Value := OrderNo;
                         quColnPriceForOrder.ParamByName('OrderNom').Value := OrderNo;
                         quColnPriceForOrder.ParamByName('PostNo').Value := PostNo;
                         quColnPriceForOrder.ParamByName('PostNom').Value := PostNo;
                         quColnPriceForOrder.ParamByName('Buh').Value := Buh;
                         quColnPriceForOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Text;
                         quColnPriceForOrder.Open;
                         quColnPriceForOrder.First;
{
                         if quColnPriceForOrder.RecordCount =0 then ShowMessage ('Нет записи в запросе! '+#13#10+
                                                                                  quPostArtGroup.SQL.Text+#13#10+
                                                                                 'Обратитесь к программисту');
}
                         while not quColnPriceForOrder.Eof do
                           begin
                             if quColnPriceForOrder.FieldByName('COLNPRICE').Value = 0 then quColnPriceForOrder.Next
                                                                                       else
                                                                                          Begin
                                                                                            Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quColnPriceForOrder.FieldByName('COLNPRICE').Value;

                                                                                            if ColNPrice <> quColnPriceForOrder.FieldByName('COLNPRICE').Value then begin
                                                                                                                                                                      ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                                                                                                                                                                      Dlg.spAddInputOrder.ExecProc;
                                                                                                                                                                      documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                                                                                                                                                                      LdocumentID := documentID;
                                                                                                                                                                      //LKomplectacija := Komplectacija;
                                                                                                                                                                    end;
                                                                                            if documentID = 0 then begin
                                                                                                                     documentID := LdocumentID;
                                                                                                                     //Komplectacija := LKomplectacija;
                                                                                                                   end;  
{
                                                                                            ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                                                                                            Dlg.spAddInputOrder.ExecProc;
                                                                                            documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
 }
                                                                                            quSpecBlank :=TMSQuery.Create(nil);
                                                                                            quSpecBlank.Connection:=dmDataModule.DB;
                                                                                            quSpecBlank.SQL.Clear;
                                                                                            quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                                                                                                 +'     ,convert(int,KolTov) as KolTov '
                                                                                                                 +'     ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                                                                                                 +'     ,convert(numeric(18,2),ltrim(rtrim(KomplectacijaOne))) as  KomplectacijaOne '
                                                                                                                 +'     ,convert(numeric(18,2),ltrim(rtrim(Komplectacija))) as  Komplectacija '
                                                                                                                 +' from ImportOrderVebTmp ivt '
                                                                                                                 +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                                                                                                 +'    and convert(smallint,Article) not in (select TovarNo '
                                                                                                                 +'                                                  from e_blanks '
                                                                                                                 +'                                                   where Document_id in (select idBlank '
                                                                                                                 +'                                                                          from l_BlankForVeb '
                                                                                                                 +'                                                                           where IdVeb = convert(bigint,:OrderNom))) '
                                                                                                                 +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                                                                                                 +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                                                                                                 +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                                                                                                 +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                                                                                                 +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                                                                                                 +'    and ivt.KolTov >0 ';

                                                                                            quSpecBlank.Prepare;
                                                                                            quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                                                                                            quSpecBlank.ParamByName('OrderNom').Value := OrderNo;
                                                                                            quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                                                                                            quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;

 //    showmessage(quSpecBlank.SQL.Text);

                                                                                            quSpecBlank.Open;

                                                                                            if quSpecBlank.FieldByName('Komplectacija').Value = 0 then Komplectacija := 0;

                                                                                            quSpecBlank.First;

                                                                                            CheckOrderForVeb := TMSQuery.Create(nil);
                                                                                            CheckOrderForVeb.Connection:= dmDataModule.DB;
                                                                                            CheckOrderForVeb.SQL.Clear;
                                                                                            CheckOrderForVeb.SQL.Text := 'select * from e_blanks where Document_id = :Document_id';
                                                                                            CheckOrderForVeb.ParamByName('Document_id').Value := documentID;
                                                                                            CheckOrderForVeb.Open;

                                                                                            if (quSpecBlank.RecordCount = 0) and (CheckOrderForVeb.RecordCount = 0) then begin
                                                                                                                                                                           quDelInputOrder := TMSQuery.Create(nil);
                                                                                                                                                                           quDelInputOrder.Connection:=dmDataModule.DB;
                                                                                                                                                                           quDelInputOrder.SQL.Clear;
                                                                                                                                                                           quDelInputOrder.SQL.Text:= 'delete e_blank_head '+
                                                                                                                                                                                                      ' where id = :id';
                                                                                                                                                                           quDelInputOrder.Prepare;
                                                                                                                                                                           quDelInputOrder.ParamByName('id').Value := documentID;
                                                                                                                                                                           quDelInputOrder.Execute;
                                                                                                                                                                           quSpecBlank.Close;
                                                                                                                                                                         end;
                                                                                            CheckOrderForVeb.Close;

                                                                                            while not quSpecBlank.Eof do
                                                                                               begin
                                                                                                 Dlg3 := TMlekoBlankSpecForm.Create(Application);

                                                                                                 if (quSpecBlank.FieldByName('KomplectacijaOne').Value > 0) and not (quOrdersTypeNakl.asString = 'Возвратная') then
                                                                                                  begin
                                                                                                    Komplectacija :=  Komplectacija + quSpecBlank.FieldByName('KomplectacijaOne').Value;
                                                                                                    Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                                                    Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value :=  10815; // !!!!!!! Артикул "Услуга комплектации" проставлен хардкодом из-за не определенности с выбором
                                                                                                    Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                                                    Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := 1;
                                                                                                    Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := 1;
                                                                                                    Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := Komplectacija;
                                                                                                    Dlg3.spEditBlankPosition.ExecProc;
                                                                                                  end;
                                                                                                  
                                                                                                 Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                                                 Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                                                                                 Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                                                 Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := quSpecBlank.FieldByName('KolTov').Value;
                                                                                                 Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := quSpecBlank.FieldByName('KolTov').Value;

                                                                                                 if ColNPrice = 0 Then Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quSpecBlank.FieldByName('PriceTov').Value
                                                                                                                  Else Begin
                                                                                                                         quPrice :=TMSQuery.Create(nil);
                                                                                                                         quPrice.Connection:=dmDataModule.DB;
                                                                                                                         quPrice.SQL.Clear;
                                                                                                                         quPrice.SQL.Text:= 'select isnull(case when :ColnPrice = 1 then Isnull(Price,0) '
                                                                                                                                           +'                   when :ColnPrice = 2 then Isnull(Price1,0) '
                                                                                                                                           +'                   when :ColnPrice = 3 then Isnull(Price2,0) '
                                                                                                                                           +'                   when :ColnPrice = 4 then Isnull(Price3,0) '
                                                                                                                                           +'                   when :ColnPrice = 5 then Isnull(Price4,0) '
                                                                                                                                           +'                   when :ColnPrice = 6 then Isnull(Price5,0) '
                                                                                                                                           +'                   when :ColnPrice = 7 then Isnull(Price6,0) '
                                                                                                                                           +'                   when :ColnPrice = 8 then Isnull(Price7,0) '
                                                                                                                                           +'                   when :ColnPrice = 10 then Isnull(Price8,0) '
                                                                                                                                           +'                   when :ColnPrice = 11 then Isnull(Price9,0) '
                                                                                                                                           +'                   when :ColnPrice = 12 then Isnull(Price10,0) '
                                                                                                                                           +'                   when :ColnPrice = 13 then Isnull(Price13,0) '
                                                                                                                                           +'                   when :ColnPrice = 14 then Isnull(Price14,0) '
                                                                                                                                           +'                   when :ColnPrice = 15 then Isnull(Price15,0) '
                                                                                                                                           +'                   when :ColnPrice = 9 then Isnull(AvgPriceIn,0) '
                                                                                                                                           +'                   when :ColnPrice = 17 then Isnull(pfv.PriceVeb, 0) '
                                                                                                                                           +'                   when :ColnPrice = 18 then Isnull(pfv.PriceInInst, 0) '
                                                                                                                                           +'              end,0) as Price '
                                                                                                                                           +' from Ostatok o '
                                                                                                                                           +'     ,PriceForVeb pfv '
                                                                                                                                           +'  where o.TovarNo = :TovarNo '
                                                                                                                                           +'    and o.TovarNo = pfv.TovarNo';
                                                                                                                         quPrice.Prepare;
                                                                                                                         quPrice.ParamByName('TovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                                                                                                         quPrice.ParamByName('ColnPrice').Value := ColNPrice;
                                                                                                                         quPrice.Open;
                                                                                                                         if ((quPrice.FieldByName('Price').Value = 0) or (quPrice.FieldByName('Price').Value = Null)) then begin
                                                                                                                                                                                                                             ErrMsg := 'Не расцененный товар!' +#13#10+
                                                                                                                                                                                                                                       'Создание заказа остановлено! Сообщите программисту!' +#13#10+
                                                                                                                                                                                                                                       'Код товара ' + quSpecBlank.FieldByName('Article').AsString +#13#10+
                                                                                                                                                                                                                                       'Номер заказа на сайте '+ IntToStr(OrderNo);
                                                                                                                                                                                                                             raise Exception.Create(ErrMsg);
                                                                                                                                                                                                                           end;
                                                                                                                         Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quPrice.FieldByName('Price').Value;
                                                                                                                         quPrice.Close;
                                                                                                                       End;
                                                                                                 Dlg3.spEditBlankPosition.ExecProc;
                                                                                                 Dlg3.Free;
                                                                                                 quSpecBlank.Next;

                                                                                               end;

                                                                                            CheckOrderForVeb := TMSQuery.Create(nil);
                                                                                            CheckOrderForVeb.Connection:= dmDataModule.DB;
                                                                                            CheckOrderForVeb.SQL.Clear;
                                                                                            CheckOrderForVeb.SQL.Text := 'select * from l_BlankForVeb where IdVeb = :IdVeb and IdBlank = :IdBlank';
                                                                                            CheckOrderForVeb.ParamByName('IdVeb').Value := OrderNo;
                                                                                            CheckOrderForVeb.ParamByName('IdBlank').Value := documentID;
                                                                                            CheckOrderForVeb.Open;
                                                                                            if CheckOrderForVeb.RecordCount > 0 then isRun := false;

                                                                                            quInsInl_BlankForVeb :=TMSQuery.Create(nil);
                                                                                            quInsInl_BlankForVeb.Connection:=dmDataModule.DB;
                                                                                            quInsInl_BlankForVeb.SQL.Clear;
                                                                                            quInsInl_BlankForVeb.SQL.Text:='insert into l_BlankForVeb (IdVeb,IdBlank) '
                                                                                                                          +'     values (:IdVeb,:IdBlank)';
                                                                                            quInsInl_BlankForVeb.ParamByName('IdVeb').Value := OrderNo;
                                                                                            quInsInl_BlankForVeb.ParamByName('idBlank').Value := documentID;

{
                                                                                            quCheckOrderForKomplectacija := TMSQuery.Create(nil);
                                                                                            quCheckOrderForKomplectacija.Connection := dmDataModule.DB;
                                                                                            quCheckOrderForKomplectacija.SQL.Clear;
                                                                                            quCheckOrderForKomplectacija.SQL.Text := 'select distinct convert(decimal(18,2),Komplectacija) as Komplectacija from work.dbo.ImportOrderVebTmp where OrderNo = :OrderNo';
                                                                                            quCheckOrderForKomplectacija.ParamByName('OrderNo').Value := OrderNo;
                                                                                            quCheckOrderForKomplectacija.Open;
}

                                                                                            if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                                                                                                       quInsInl_BlankForVeb.Execute;
                                                                                                                                                       if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                                                                                                                                                                            Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                                                                                                                                                                                            Dlg.spModifyLinkBlankReturn.Execute;
                                                                                                                                                                                                          end;
                                                                                                                                                       {
                                                                                                                                                       if (quCheckOrderForKomplectacija.FieldByName('Komplectacija').Value > 0) and (Is_KomplectacijaRun = true)
                                                                                                                                                        then begin
                                                                                                                                                               Dlg3 := TMlekoBlankSpecForm.Create(Application);
                                                                                                                                                               Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                                                                                                               Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := 10815; // !!!!!!! Артикул "Услуга комплектации" проставлен хардкодом из-за не определенности с выбором
                                                                                                                                                               Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                                                                                                               Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := 1;
                                                                                                                                                               Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := 1;
                                                                                                                                                               Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quCheckOrderForKomplectacija.FieldByName('Komplectacija').Value;
                                                                                                                                                               Dlg3.spEditBlankPosition.ExecProc;
                                                                                                                                                               Dlg3.Free;
                                                                                                                                                               Is_KomplectacijaRun := false;
                                                                                                                                                             end;
                                                                                                                                                       }      
                                                                                                                                                       Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                                                                                                     end
                                                                                                                                                else begin
                                                                                                                                                       if documentID > 0 then Showmessage ('Заказ document_id = '+ IntToStr(documentID)+ ' дополнен');
                                                                                                                                                     end;
//                                                                                            quCheckOrderForKomplectacija.Close;
                                                                                            quInsInl_BlankForVeb.Close;
                                                                                            quColnPriceForOrder.Next;
                                                                                          End;
                           end;
                         quColnPriceForOrder.Close;

{
                         If quPostArtGroup.FieldByName('COLNPRICE').Value = 0 Then Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := 17
                                                                              Else Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quPostArtGroup.FieldByName('COLNPRICE').Value;
}


{
                         if (isRun = true) and (ColNPrice > 0) then begin
                                                                                            Showmessage('Выберите сотрудника');
                                                                                            RetPostForRashod := PostForRashod(DeliveryDate,PostNo);
                                                                                            if RetPostForRashod.PostNo > 0 then Begin
                                                                                                                                  Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                                                                                                                  Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := RetPostForRashod.SotrudNo;
                                                                                                                                  Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
                                                                                                                                  Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                                                                                                                  Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := RetPostForRashod.OtdelNo;
                                                                                                                                End
                                                                                                                           else raise Exception.Create('Необходимо выбрать сотрудника!'+#13#10+
                                                                                                                                                       'Возможно к контрагенту не сопоставлены сотрудники.'+#13#10+
                                                                                                                                                       'Для того чтобы выбрать сопоставте контрагенту сотрудников ');
                                                                                          end;
}
{
                         if (isRun = true) and (ColNPrice > 0) then begin
                                                                      Dlg.spAddInputOrder.ExecProc;
                                                                      documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                                                                    end;


                         quSpecBlank :=TMSQuery.Create(nil);
                         quSpecBlank.Connection:=dmDataModule.DB;
                         quSpecBlank.SQL.Clear;
                         quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                              +'     ,convert(int,KolTov) as KolTov '
                                              +'     ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                              +' from ImportOrderVebTmp ivt '
                                              +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                              +'    and convert(smallint,Article) not in (select TovarNo '
                                              +'                                                  from e_blanks '
                                              +'                                                   where Document_id in (select idBlank '
                                              +'                                                                          from l_BlankForVeb '
                                              +'                                                                           where IdVeb = convert(bigint,:OrderNom))) '
                                              +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                              +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                              +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                              +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                              +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                              +'    and ivt.KolTov >0 ';
                         quSpecBlank.Prepare;
                         quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                         quSpecBlank.ParamByName('OrderNom').Value := OrderNo;
                         quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                         quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;

 //    showmessage(quSpecBlank.SQL.Text);

                         quSpecBlank.Open;
                         quSpecBlank.First;

                         if quSpecBlank.RecordCount =0 then begin
                                                              quDelInputOrder := TMSQuery.Create(nil);
                                                              quDelInputOrder.Connection:=dmDataModule.DB;
                                                              quDelInputOrder.SQL.Clear;
                                                              quDelInputOrder.SQL.Text:= 'delete e_blank_head '+
                                                                                         ' where id = :id';
                                                              quDelInputOrder.Prepare;
                                                              quDelInputOrder.ParamByName('id').Value := documentID;
                                                              quDelInputOrder.Execute;
                                                              quSpecBlank.Close;
                                                        //      quPostArtGroup.Close;
                                                        //  raise Exception.Create('Нет записи в запросе!'+ #10#13 +
                                                        //                   quSpecBlank.SQL.Text+ #10#13 +
                                                        //                  'Обратитесь к программисту');
                                                            end;

                         while not quSpecBlank.Eof do
                            begin
                              Dlg3 := TMlekoBlankSpecForm.Create(Application);
                              Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                              Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                              Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                              Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := quSpecBlank.FieldByName('KolTov').Value;
                              Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := quSpecBlank.FieldByName('KolTov').Value;

                              if ColNPrice = 0 Then Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quSpecBlank.FieldByName('PriceTov').Value
                                               Else Begin
                                                      quPrice :=TMSQuery.Create(nil);
                                                      quPrice.Connection:=dmDataModule.DB;
                                                      quPrice.SQL.Clear;
                                                      quPrice.SQL.Text:= 'select case when :ColnPrice = 1 then Isnull(Price,0) '
                                                                        +'            when :ColnPrice = 2 then Isnull(Price1,0) '
                                                                        +'            when :ColnPrice = 3 then Isnull(Price2,0) '
                                                                        +'            when :ColnPrice = 4 then Isnull(Price3,0) '
                                                                        +'            when :ColnPrice = 5 then Isnull(Price4,0) '
                                                                        +'            when :ColnPrice = 6 then Isnull(Price5,0) '
                                                                        +'            when :ColnPrice = 7 then Isnull(Price6,0) '
                                                                        +'            when :ColnPrice = 8 then Isnull(Price7,0) '
                                                                        +'            when :ColnPrice = 10 then Isnull(Price8,0) '
                                                                        +'            when :ColnPrice = 11 then Isnull(Price9,0) '
                                                                        +'            when :ColnPrice = 12 then Isnull(Price10,0) '
                                                                        +'            when :ColnPrice = 13 then Isnull(Price13,0) '
                                                                        +'            when :ColnPrice = 14 then Isnull(Price14,0) '
                                                                        +'            when :ColnPrice = 15 then Isnull(Price15,0) '
                                                                        +'            when :ColnPrice = 9 then Isnull(AvgPriceIn,0) '
                                                                        +'            when :ColnPrice = 17 then Isnull(pfv.PriceVeb, 0) '
                                                                        +'       end as Price '
                                                                        +' from Ostatok o '
                                                                        +'     ,PriceForVeb pfv '
                                                                        +'  where o.TovarNo = :TovarNo '
                                                                        +'    and o.TovarNo = pfv.TovarNo';
                                                      quPrice.Prepare;
                                                      quPrice.ParamByName('TovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                                      quPrice.ParamByName('ColnPrice').Value := ColNPrice;
                                                      quPrice.Open;
                                                      Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quPrice.FieldByName('Price').Value;
                                                    End;
                              Dlg3.spEditBlankPosition.ExecProc;
                              Dlg3.Free;
                              quSpecBlank.Next;

                            end;

                         quInsInl_BlankForVeb :=TMSQuery.Create(nil);
                         quInsInl_BlankForVeb.Connection:=dmDataModule.DB;
                         quInsInl_BlankForVeb.SQL.Clear;
                         quInsInl_BlankForVeb.SQL.Text:='insert into l_BlankForVeb (IdVeb,idBlank) '
                                                       +'     values (:IdVeb,:idBlank)';
                         quInsInl_BlankForVeb.ParamByName('IdVeb').Value := OrderNo;
                         quInsInl_BlankForVeb.ParamByName('idBlank').Value := documentID;
                         if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                                    quInsInl_BlankForVeb.Execute;
                                                                                    Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                                  end;
                         quInsInl_BlankForVeb.Close;
}
                         quPostArtGroup.Next;
                       end;//quPostArtGroup.Eof
                      quPostArtGroup.Close;
                   End // quOrders.FieldByName('NoContractor').Value = 0 then
              Else Begin // quOrders.FieldByName('NoContractor').Value = 0  else
                     Dlg.spAddInputOrder.ParamByName('PostNo').Value := quOrders.FieldByName('NoContractor').Value;
                     PostNo := quOrders.FieldByName('NoContractor').Value;
 //                    Dlg.spAddInputOrder.ParamByName('PostNo').Value := quOrders.FieldByName('NoClient').Value;
                     if quOrders.FieldByName('DateDelivery').Value <> '01.01.1900'     then Begin
                                                                                              if quOrders.FieldByName('DateDelivery').Value <= GlobalDateNakl
                                                                                               then DeliveryDate := GlobalDateNakl
                                                                                               else begin
                                                                                                      DateTimeToString(formattedDateTime, 'c',quOrders.FieldByName('DateDelivery').Value);
                                                                                                      DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                     end;
                                                                                            End
                                                                                       else Begin
                                                                                              buttonSelected := MessageDlg('Не задана дата доставки!'+#13#10+ //'Установить дату доставки в ' +'?'
                                                                                                                           'Дата доставки устанавливается в ' + datetostr(dtDateDelivery.Date) ,mtWarning, mbOKCancel, 0);
                                                                                              if buttonSelected = mrOK then Begin
                                                                                                                              DateTimeToString(formattedDateTime, 'c', dtDateDelivery.Date);
                                                                                                                              DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                                            End;
                                                                                              if buttonSelected = mrCancel then Begin
                                                                                                                                  DateTimeToString(formattedDateTime, 'c', dtDateDelivery.Date);
                                                                                                                                  DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                             {
                                                                                                              DateTimeToString(formattedDateTime, 'c', quOrders.FieldByName('DateDelivery').Value);
                                                                                                              DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                               }
                                                                                                                                End;
                                                                                            End;

                     Showmessage('Выберите сотрудника');
                     RetPostForRashod := PostForRashod(DeliveryDate,PostNo);
                     if RetPostForRashod.PostNo > 0 then Begin
                                                           Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                                           Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := RetPostForRashod.SotrudNo;
                                                           Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
                                                           Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                                           Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := RetPostForRashod.OtdelNo;
                                                           OtdelNo := RetPostForRashod.OtdelNo;
                                                           Dlg.spAddInputOrder.ParamByName('Buh').Value := RetPostForRashod.Buh;
                                                           Buh := RetPostForRashod.Buh;
                                                           Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := RetPostForRashod.SET_ARTICLE_GROUP;
                                                        End
                                                   else raise Exception.Create('Необходимо выбрать сотрудника!'+#13#10+
                                                                'Возможно к контрагенту не сопоставлены сотрудники.'+#13#10+
                                                                'Для того чтобы выбрать сопоставте контрагенту сотрудников ');

                     quPostArtGroup := TMSQuery.Create(nil);
                     quPostArtGroup.Connection:= dmDataModule.DB;
                     quPostArtGroup.SQL.Clear;
                     quPostArtGroup.SQL.Text:='select distinct lag.ARTICLE_GROUP_ID '+
                                              '               ,dag.NAME '+
                                              '               ,lag.ARTICLE_ID '+
                                              '               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID '+
                                              '               ,dsag.NAME '+
                                              '               ,lpsagd.POSTNO '+
                                              '               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay '+
                                              '               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY '+
                                              '               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT '+
                                              '               ,isnull(lpsagp.POSTNO,0) as POSTNOP '+
                                              '               ,isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_price '+
                                              '               ,isnull(lpsagp.COLNPRICE,0) as COLNPRICE '+
                                              ' from L_ARTICLE_GROUP lag left join '+
                                              '      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join '+
                                              '      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                                              '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join '+
                                              '      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = :PostNo and lpsagd.BUH = :Buh left join '+
                                              '      L_POST_SET_ARTGROUP_PRICE lpsagp on lsag.SET_ARTICLE_GROUP_ID = lpsagp.SET_ARTICLE_GROUP_ID and lpsagp.POSTNO = :PostNom left join '+
                                              '      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '+
                                              '  where convert(bigint,iov.OrderNo) = convert(bigint,:OrderNo)  '+
                                              '    and lsag.SET_ARTICLE_GROUP_ID is not null '+
                                              '    and convert(smallint,iov.Article) not in (select TovarNo '+
                                              '                                               from e_blanks '+
                                              '                                                where Document_id in (select idBlank '+
                                              '                                                                       from l_BlankForVeb '+
                                              '                                                                        where IdVeb = convert(bigint,:OrderNom))) '+
                                              '    and LEN(cast(isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as varchar(50))+ cast(isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as varchar(50))) > 2'+
                                              '    and lpsagd.POSTNO is not null';


{
                               'declare'+
                               '         @PostNo int '+
                               '        ,@OrderNo int '+
                               'set @OrderNo = convert(int,:OrderNo) '+
                               'set @PostNo = convert(int,:PostNo) '+
                               'select lpsagd.POSTNO '+
                               '      ,lpsagd.DAY_DELAY '+
                               '      ,lpsagd.DAY_DELAY_EXT '+
                               '      ,lpsagd.BUH '+
                               '      ,convert(varchar(25),lpsagd.SET_ARTICLE_GROUP_ID) as SET_ARTICLE_GROUP_ID '+
                               '      ,isnull(lpsagp.COLNPRICE,0) as COLNPRICE '+
                               ' from L_POST_SET_ARTGROUP_DELAY lpsagd left join '+
                               '      L_POST_SET_ARTGROUP_PRICE lpsagp on lpsagp.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagp.POSTNO = lpsagd.POSTNO '+
                               '  where convert(int,lpsagd.POSTNO) = convert(int,@PostNo) '+
                               '    and lpsagd.SET_ARTICLE_GROUP_ID in (select distinct lsag.SET_ARTICLE_GROUP_ID '+
                               '                                         from L_ARTICLE_GROUP lag inner join '+
                               '                                              L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID inner join '+
                               '                                              ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '+
                               '                                          where convert(int,iov.OrderNo) = convert(int,@OrderNo)) '+
                               '    and convert(int,lpsagd.BUH) = convert(int,:Buh) '+
                               'union all '+
                               'select convert(int,@PostNo) '+
                               '      ,0 '+
                               '      ,0 '+
                               '      ,1 '+
                               '      ,''7718234909260420228'' '+
                               '      ,2 ';
}
                     quPostArtGroup.Prepare;
                     quPostArtGroup.ParamByName('OrderNo').Value := OrderNo;
                     quPostArtGroup.ParamByName('OrderNom').Value := OrderNo;
                     quPostArtGroup.ParamByName('PostNo').Value := PostNo;
                     quPostArtGroup.ParamByName('PostNom').Value := PostNo;
                     quPostArtGroup.ParamByName('Buh').Value := Buh;

                     quPostArtGroup.Open;
                     quPostArtGroup.First;

                     if quPostArtGroup.RecordCount =0 then ShowMessage ('Нет записи в запросе! '+#13#10+
                                                                        quPostArtGroup.SQL.Text+#13#10+
                                                                        'Обратитесь к программисту');

                     while not quPostArtGroup.Eof do
                       begin //quPostArtGroup.Eof

                         documentID := 0;
//                         Komplectacija := 0;
                         SArticleGroup := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;

                         SArticleGroupDouble := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').AsVariant;

                         quCheckOrder :=TMSQuery.Create(nil);
                         quCheckOrder.Connection:=dmDataModule.DB;
                         quCheckOrder.SQL.Clear;
                         quCheckOrder.SQL.Text:='select * '
                                               +' from ImportOrderVebTmp ivt '
                                               +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                               +'    and convert(smallint,Article) not in (select TovarNo '
                                               +'                                                  from e_blanks '
                                               +'                                                   where Document_id in (select idBlank '
                                               +'                                                                          from l_BlankForVeb '
                                               +'                                                                           where IdVeb = convert(bigint,:OrderNom))) '
                                               +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                               +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                               +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                               +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                               +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                               +'    and ivt.KolTov >0 ';

                         quCheckOrder.Prepare;
                         quCheckOrder.ParamByName('OrderNo').Value := OrderNo;
                         quCheckOrder.ParamByName('OrderNom').Value := OrderNo;
                         quCheckOrder.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                         quCheckOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;
                         quCheckOrder.Open;
                         if quCheckOrder.RecordCount > 0 Then isRun := true else isRun := false;
                         quCheckOrder.Close;
                         
                         Dlg.quPostBan.Close;
                         Dlg.quPostBan.Params.ParamByName('p_PostNo').Value := PostNo;
                         Dlg.quPostBan.Open;
                         Is_PostBan := false;
                         Is_PostBanPay := false;

                         Dlg.quPostBanPay.Close;
                         Dlg.quPostBanPay.Params.ParamByName('PostNo').Value := PostNo;
                         Dlg.quPostBanPay.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
                         Dlg.quPostBanPay.Params.ParamByName('Buh').Value := Buh;
                         Dlg.quPostBanPay.Open;

                         Dlg.quControlPayBan.Close;
                         Dlg.quControlPayBan.Params.ParamByName('PostNo').Value := PostNo;
                         Dlg.quControlPayBan.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
                         Dlg.quControlPayBan.Params.ParamByName('Buh').Value := Buh;
                         Dlg.quControlPayBan.Params.ParamByName('DateNakl').Value := DeliveryDate;
                         Dlg.quControlPayBan.Open;

                         Dlg.quSummaDolga.Close;
                         Dlg.quSummaDolga.Params.ParamByName('PostNo').Value := PostNo;
                         Dlg.quSummaDolga.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
                         Dlg.quSummaDolga.Params.ParamByName('Buh').Value := Buh;
                         Dlg.quSummaDolga.Open;

                         if dlg.quControlPayBan.RecordCount > 0 then Is_ControlPostBanPay := false else Is_ControlPostBanPay := true;


                         if ((Dlg.quSummaDolgaSUMMA_ECO.Value > Dlg.quPostBanPayPayBan.Value) and (Dlg.quPostBanPayPayBan.Value <>0)
                                                                                              and (Is_ControlPostBanPay = True)) then
                           begin
                             DescriptionBanPay := 'Превышен лимит ' +#13#10+ 'Сумма дебиторской задолженности ' + FloatToStr(Dlg.quSummaDolgaSUMMA_ECO.Value) +#13#10+ 'Допустимый лимит '+ FloatToStr(Dlg.quPostBanPayPayBan.Value);
                             if is_postBanPay = false then raise Exception.Create(DescriptionBanPay);
                             Is_postBanPay := true;
                           end;

                         if (Dlg.quPostBanPostBan.Value = 1) and (quOrdersTypeNakl.asString = 'Возвратная') then
                          begin
                            DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
                            raise Exception.Create(DescriptionBan);
                            Is_PostBan := true;
                          end;

                         if CheckBlank(PostNo, Dlg.spAddInputOrder.ParamByName('ReasonId').Value, DeliveryDate, OtdelNo, SArticleGroupDouble, ErrMsg) >= 10 then
                          begin
                            //Не Успешно
                            raise Exception.Create(ErrMsg);
                          end; 

                         Dlg.quPostBan.Close;
                         Dlg.quPostBanPay.Close;
                         Dlg.quSummaDolga.Close;
                         Dlg.quControlPayBan.Close;




                         Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := SArticleGroup ;
                         Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := quPostArtGroup.FieldByName('DAY_DELAY').Value;

                         quColnPriceForOrder.ParamByName('OrderNo').Value := OrderNo;
                         quColnPriceForOrder.ParamByName('OrderNom').Value := OrderNo;
                         quColnPriceForOrder.ParamByName('PostNo').Value := PostNo;
                         quColnPriceForOrder.ParamByName('PostNom').Value := PostNo;
                         quColnPriceForOrder.ParamByName('Buh').Value := Buh;
                         quColnPriceForOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Text;
                         quColnPriceForOrder.Open;
                         quColnPriceForOrder.First;
{
                         if quColnPriceForOrder.RecordCount =0 then ShowMessage ('Нет записи в запросе! '+#13#10+
                                                                                 quPostArtGroup.SQL.Text+#13#10+
                                                                                 'Обратитесь к программисту');
}

                         while not quColnPriceForOrder.Eof do
                           begin
                             if quColnPriceForOrder.FieldByName('COLNPRICE').Value = 0 then quColnPriceForOrder.Next
                                                                                       else
                                                                                         Begin
                                                                                           Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quColnPriceForOrder.FieldByName('COLNPRICE').Value;

                                                                                           if ColNPrice <> quColnPriceForOrder.FieldByName('COLNPRICE').Value then begin
                                                                                                                                                                     ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                                                                                                                                                                     Dlg.spAddInputOrder.ExecProc;
                                                                                                                                                                     documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                                                                                                                                                                     LdocumentID := documentID;
                                                                                                                                                                     //LKomplectacija := Komplectacija;
                                                                                                                                                                   end;
                                                                                           if documentID = 0 then begin
                                                                                                                    documentID := LdocumentID;
                                                                                                                    //Komplectacija := LKomplectacija;
                                                                                                                  end;  
{
                                                                                           ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                                                                                           Dlg.spAddInputOrder.ExecProc;
                                                                                           documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
 }
                                                                                           quSpecBlank :=TMSQuery.Create(nil);
                                                                                           quSpecBlank.Connection:=dmDataModule.DB;
                                                                                           quSpecBlank.SQL.Clear;
                                                                                           quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                                                                                                +'     ,convert(int,KolTov) as KolTov '
                                                                                                                +'     ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                                                                                                +'     ,convert(numeric(18,2),ltrim(rtrim(KomplectacijaOne))) as  KomplectacijaOne '
                                                                                                                +'     ,convert(numeric(18,2),ltrim(rtrim(Komplectacija))) as  Komplectacija '
                                                                                                                +' from ImportOrderVebTmp ivt '
                                                                                                                +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                                                                                                +'    and convert(smallint,Article) not in (select TovarNo '
                                                                                                                +'                                                  from e_blanks '
                                                                                                                +'                                                   where Document_id in (select idBlank '
                                                                                                                +'                                                                          from l_BlankForVeb '
                                                                                                                +'                                                                           where IdVeb = convert(bigint,:OrderNom))) '
                                                                                                                +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                                                                                                +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                                                                                                +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                                                                                                +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                                                                                                +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                                                                                                +'    and ivt.KolTov >0 ';
                                                                                                                                                                                       quSpecBlank.Prepare;
                                                                                           quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                                                                                           quSpecBlank.ParamByName('OrderNom').Value := OrderNo;
                                                                                           quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                                                                                           quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;
                                                                                            //    showmessage(quSpecBlank.SQL.Text);
                                                                                           quSpecBlank.Open;

                                                                                           if quSpecBlank.FieldByName('Komplectacija').Value = 0 then Komplectacija := 0;

                                                                                           quSpecBlank.First;

                                                                                           CheckOrderForVeb := TMSQuery.Create(nil);
                                                                                           CheckOrderForVeb.Connection:= dmDataModule.DB;
                                                                                           CheckOrderForVeb.SQL.Clear;
                                                                                           CheckOrderForVeb.SQL.Text := 'select * from e_blanks where Document_id = :Document_id';
                                                                                           CheckOrderForVeb.ParamByName('Document_id').Value := documentID;
                                                                                           CheckOrderForVeb.Open;

                                                                                           if (quSpecBlank.RecordCount = 0) and (CheckOrderForVeb.RecordCount = 0) then begin
                                                                                                                                                                          quDelInputOrder := TMSQuery.Create(nil);
                                                                                                                                                                          quDelInputOrder.Connection:=dmDataModule.DB;
                                                                                                                                                                          quDelInputOrder.SQL.Clear;
                                                                                                                                                                          quDelInputOrder.SQL.Text:= 'delete e_blank_head '+
                                                                                                                                                                                                     ' where id = :id';
                                                                                                                                                                          quDelInputOrder.Prepare;
                                                                                                                                                                          quDelInputOrder.ParamByName('id').Value := documentID;
                                                                                                                                                                          quDelInputOrder.Execute;
                                                                                                                                                                          quSpecBlank.Close;
                                                                                                                                                                        end;
                                                                                           CheckOrderForVeb.Close;

                                                                                           while not quSpecBlank.Eof do
                                                                                               begin
                                                                                                 Dlg3 := TMlekoBlankSpecForm.Create(Application);

                                                                                                 if (quSpecBlank.FieldByName('KomplectacijaOne').Value > 0) and not (quOrdersTypeNakl.asString = 'Возвратная') then
                                                                                                  begin
                                                                                                    Komplectacija :=  Komplectacija + quSpecBlank.FieldByName('KomplectacijaOne').Value;
                                                                                                    Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                                                    Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value :=  10815; // !!!!!!! Артикул "Услуга комплектации" проставлен хардкодом из-за не определенности с выбором
                                                                                                    Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                                                    Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := 1;
                                                                                                    Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := 1;
                                                                                                    Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := Komplectacija;
                                                                                                    Dlg3.spEditBlankPosition.ExecProc;
                                                                                                  end;

                                                                                                 Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                                                 Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                                                                                 Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                                                 Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := quSpecBlank.FieldByName('KolTov').Value;
                                                                                                 Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := quSpecBlank.FieldByName('KolTov').Value;

                                                                                                 if ColNPrice = 0 Then Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quSpecBlank.FieldByName('PriceTov').Value
                                                                                                                  Else Begin
                                                                                                                         quPrice :=TMSQuery.Create(nil);
                                                                                                                         quPrice.Connection:=dmDataModule.DB;
                                                                                                                         quPrice.SQL.Clear;
                                                                                                                         quPrice.SQL.Text:= 'select isnull(case when :ColnPrice = 1 then Isnull(Price,0) '
                                                                                                                                           +'                   when :ColnPrice = 2 then Isnull(Price1,0) '
                                                                                                                                           +'                   when :ColnPrice = 3 then Isnull(Price2,0) '
                                                                                                                                           +'                   when :ColnPrice = 4 then Isnull(Price3,0) '
                                                                                                                                           +'                   when :ColnPrice = 5 then Isnull(Price4,0) '
                                                                                                                                           +'                   when :ColnPrice = 6 then Isnull(Price5,0) '
                                                                                                                                           +'                   when :ColnPrice = 7 then Isnull(Price6,0) '
                                                                                                                                           +'                   when :ColnPrice = 8 then Isnull(Price7,0) '
                                                                                                                                           +'                   when :ColnPrice = 10 then Isnull(Price8,0) '
                                                                                                                                           +'                   when :ColnPrice = 11 then Isnull(Price9,0) '
                                                                                                                                           +'                   when :ColnPrice = 12 then Isnull(Price10,0) '
                                                                                                                                           +'                   when :ColnPrice = 13 then Isnull(Price13,0) '
                                                                                                                                           +'                   when :ColnPrice = 14 then Isnull(Price14,0) '
                                                                                                                                           +'                   when :ColnPrice = 15 then Isnull(Price15,0) '
                                                                                                                                           +'                   when :ColnPrice = 9 then Isnull(AvgPriceIn,0) '
                                                                                                                                           +'                   when :ColnPrice = 17 then Isnull(pfv.PriceVeb, 0) '
                                                                                                                                           +'                   when :ColnPrice = 18 then Isnull(pfv.PriceInInst, 0) '
                                                                                                                                           +'              end,0) as Price '
                                                                                                                                           +' from Ostatok o '
                                                                                                                                           +'     ,PriceForVeb pfv '
                                                                                                                                           +'  where o.TovarNo = :TovarNo '
                                                                                                                                           +'    and o.TovarNo = pfv.TovarNo';
                                                                                                                         quPrice.Prepare;
                                                                                                                         quPrice.ParamByName('TovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                                                                                                         quPrice.ParamByName('ColnPrice').Value := ColNPrice;
                                                                                                                         quPrice.Open;
                                                                                                                         if ((quPrice.FieldByName('Price').Value = 0) or (quPrice.FieldByName('Price').Value = Null)) then begin
                                                                                                                                                                                                                             ErrMsg := 'Не расцененный товар!' +#13#10+
                                                                                                                                                                                                                                       'Создание заказа остановлено! Сообщите программисту!' +#13#10+
                                                                                                                                                                                                                                       'Код товара ' + quSpecBlank.FieldByName('Article').AsString +#13#10+
                                                                                                                                                                                                                                       'Номер заказа на сайте '+ IntToStr(OrderNo);
                                                                                                                                                                                                                             raise Exception.Create(ErrMsg);
                                                                                                                                                                                                                           end;
                                                                                                                         Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quPrice.FieldByName('Price').Value;
                                                                                                                         quPrice.Close;
                                                                                                                       End;
                                                                                                 Dlg3.spEditBlankPosition.ExecProc;
                                                                                                 Dlg3.Free;
                                                                                                 quSpecBlank.Next;

                                                                                               end;

                                                                                           CheckOrderForVeb := TMSQuery.Create(nil);
                                                                                           CheckOrderForVeb.Connection:= dmDataModule.DB;
                                                                                           CheckOrderForVeb.SQL.Clear;
                                                                                           CheckOrderForVeb.SQL.Text := 'select * from l_BlankForVeb where IdVeb = :IdVeb and IdBlank = :IdBlank';
                                                                                           CheckOrderForVeb.ParamByName('IdVeb').Value := OrderNo;
                                                                                           CheckOrderForVeb.ParamByName('IdBlank').Value := documentID;
                                                                                           CheckOrderForVeb.Open;
                                                                                           if CheckOrderForVeb.RecordCount > 0 then isRun := false;

                                                                                           quInsInl_BlankForVeb :=TMSQuery.Create(nil);
                                                                                           quInsInl_BlankForVeb.Connection:=dmDataModule.DB;
                                                                                           quInsInl_BlankForVeb.SQL.Clear;
                                                                                           quInsInl_BlankForVeb.SQL.Text:='insert into l_BlankForVeb (IdVeb,IdBlank) '
                                                                                                                         +'     values (:IdVeb,:IdBlank)';
                                                                                           quInsInl_BlankForVeb.ParamByName('IdVeb').Value := OrderNo;
                                                                                           quInsInl_BlankForVeb.ParamByName('idBlank').Value := documentID;

{
                                                                                           quCheckOrderForKomplectacija := TMSQuery.Create(nil);
                                                                                           quCheckOrderForKomplectacija.Connection := dmDataModule.DB;
                                                                                           quCheckOrderForKomplectacija.SQL.Clear;
                                                                                           quCheckOrderForKomplectacija.SQL.Text := 'select distinct convert(decimal(18,2),Komplectacija) as Komplectacija from work.dbo.ImportOrderVebTmp where OrderNo = :OrderNo';
                                                                                           quCheckOrderForKomplectacija.ParamByName('OrderNo').Value := OrderNo;
                                                                                           quCheckOrderForKomplectacija.Open;
}

                                                                                           if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                                                                                                      quInsInl_BlankForVeb.Execute;
                                                                                                                                                      if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                                                                                                                                                                           Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                                                                                                                                                                                           Dlg.spModifyLinkBlankReturn.Execute;
                                                                                                                                                                                                         end;
                                                                                                                                                      {
                                                                                                                                                      if (quCheckOrderForKomplectacija.FieldByName('Komplectacija').Value > 0) and (Is_KomplectacijaRun = true)
                                                                                                                                                       then begin
                                                                                                                                                              Dlg3 := TMlekoBlankSpecForm.Create(Application);
                                                                                                                                                              Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                                                                                                              Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := 10815; // !!!!!!! Артикул "Услуга комплектации" проставлен хардкодом из-за не определенности с выбором
                                                                                                                                                              Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                                                                                                              Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := 1;
                                                                                                                                                              Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := 1;
                                                                                                                                                              Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quCheckOrderForKomplectacija.FieldByName('Komplectacija').Value;
                                                                                                                                                              Dlg3.spEditBlankPosition.ExecProc;
                                                                                                                                                              Dlg3.Free;
                                                                                                                                                              Is_KomplectacijaRun := false;
                                                                                                                                                            end;
                                                                                                                                                      }
                                                                                                                                                      Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                                                                                                    end
                                                                                                                                               else begin
                                                                                                                                                      if documentID > 0 then Showmessage ('Заказ document_id = '+ IntToStr(documentID)+ ' дополнен');
                                                                                                                                                    end;
//                                                                                           quCheckOrderForKomplectacija.Close;
                                                                                           quInsInl_BlankForVeb.Close;
                                                                                           quColnPriceForOrder.Next;
                                                                                         End;
                           end;
                         quColnPriceForOrder.Close;

{
                         If quPostArtGroup.FieldByName('COLNPRICE').Value = 0 Then Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := 17
                                                                              Else Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quPostArtGroup.FieldByName('COLNPRICE').Value;
}

{
                         if (isRun = true) and (ColNPrice > 0) then begin
                                                                      Showmessage('Выберите сотрудника');
                                                                      RetPostForRashod := PostForRashod(DeliveryDate,PostNo);
                                                                      if RetPostForRashod.PostNo > 0 then Begin
                                                                                                            Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                                                                                            Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := RetPostForRashod.SotrudNo;
                                                                                                            Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
                                                                                                            Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                                                                                            Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := RetPostForRashod.OtdelNo;
                                                                                                          End
                                                                                                     else raise Exception.Create('Необходимо выбрать сотрудника!'+#13#10+
                                                                                                                                                      'Возможно к контрагенту не сопоставлены сотрудники.'+#13#10+
                                                                                                                                                      'Для того чтобы выбрать сопоставте контрагенту сотрудников ');
                                                                    end;
}
{
                         if (isRun = true) and (ColNPrice > 0) then begin
                                                                      Dlg.spAddInputOrder.ExecProc;
                                                                      documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                                                                    end;

 }

{
                         quSpecBlank :=TMSQuery.Create(nil);
                         quSpecBlank.Connection:=dmDataModule.DB;
                         quSpecBlank.SQL.Clear;
                         quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                              +'     ,convert(int,KolTov) as KolTov '
                                              +'     ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                              +' from ImportOrderVebTmp ivt '
                                              +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                              +'    and convert(smallint,Article) not in (select TovarNo '
                                              +'                                                  from e_blanks '
                                              +'                                                   where Document_id in (select idBlank '
                                              +'                                                                          from l_BlankForVeb '
                                              +'                                                                           where IdVeb = convert(bigint,:OrderNom))) '
                                              +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                              +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                              +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                              +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                              +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                              +'    and ivt.KolTov >0 ';

                         quSpecBlank.Prepare;
                         quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                         quSpecBlank.ParamByName('OrderNom').Value := OrderNo;
                         quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                         quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;

 //    showmessage(quSpecBlank.SQL.Text);

                         quSpecBlank.Open;
                         quSpecBlank.First;

                         if quSpecBlank.RecordCount =0 then begin
                                                              quDelInputOrder := TMSQuery.Create(nil);
                                                              quDelInputOrder.Connection:=dmDataModule.DB;
                                                              quDelInputOrder.SQL.Clear;
                                                              quDelInputOrder.SQL.Text:= 'delete e_blank_head '+
                                                                                         ' where id = :id';
                                                              quDelInputOrder.Prepare;
                                                              quDelInputOrder.ParamByName('id').Value := documentID;
                                                              quDelInputOrder.Execute;
                                                              quSpecBlank.Close;
                                                    //          quPostArtGroup.Close;
                    //                      raise Exception.Create('Нет записи в запросе!'+ #10#13 +
                    //                                              quSpecBlank.SQL.Text+ #10#13 +
                    //                                              'Обратитесь к программисту');
                                                            end;

                         while not quSpecBlank.Eof do
                           begin
                             Dlg3 := TMlekoBlankSpecForm.Create(Application);
                             Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                             Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                             Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                             Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := quSpecBlank.FieldByName('KolTov').Value;
                             Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := quSpecBlank.FieldByName('KolTov').Value;

                             if ColNPrice = 0 Then Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quSpecBlank.FieldByName('PriceTov').Value
                                              Else Begin
                                                     quPrice :=TMSQuery.Create(nil);
                                                     quPrice.Connection:=dmDataModule.DB;
                                                     quPrice.SQL.Clear;
                                                     quPrice.SQL.Text:= 'select case when :ColnPrice = 1 then Isnull(Price,0) '
                                                                       +'            when :ColnPrice = 2 then Isnull(Price1,0) '
                                                                       +'            when :ColnPrice = 3 then Isnull(Price2,0) '
                                                                       +'            when :ColnPrice = 4 then Isnull(Price3,0) '
                                                                       +'            when :ColnPrice = 5 then Isnull(Price4,0) '
                                                                       +'            when :ColnPrice = 6 then Isnull(Price5,0) '
                                                                       +'            when :ColnPrice = 7 then Isnull(Price6,0) '
                                                                       +'            when :ColnPrice = 8 then Isnull(Price7,0) '
                                                                       +'            when :ColnPrice = 10 then Isnull(Price8,0) '
                                                                       +'            when :ColnPrice = 11 then Isnull(Price9,0) '
                                                                       +'            when :ColnPrice = 12 then Isnull(Price10,0) '
                                                                       +'            when :ColnPrice = 13 then Isnull(Price13,0) '
                                                                       +'            when :ColnPrice = 14 then Isnull(Price14,0) '
                                                                       +'            when :ColnPrice = 15 then Isnull(Price15,0) '
                                                                       +'            when :ColnPrice = 9 then Isnull(AvgPriceIn,0) '
                                                                       +'            when :ColnPrice = 17 then Isnull(pfv.PriceVeb, 0) '
                                                                       +'       end as Price '
                                                                       +' from Ostatok o '
                                                                       +'     ,PriceForVeb pfv '
                                                                       +'  where o.TovarNo = :TovarNo '
                                                                       +'    and o.TovarNo = pfv.TovarNo';
                                                     quPrice.Prepare;
                                                     quPrice.ParamByName('TovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                                     quPrice.ParamByName('ColnPrice').Value := ColNPrice;
                                                     quPrice.Open;
                                                     Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quPrice.FieldByName('Price').Value;
                                                   End;
                             Dlg3.spEditBlankPosition.ExecProc;
                             Dlg3.Free;
                             quSpecBlank.Next;

                           end;

                         quInsInl_BlankForVeb :=TMSQuery.Create(nil);
                         quInsInl_BlankForVeb.Connection:=dmDataModule.DB;
                         quInsInl_BlankForVeb.SQL.Clear;
                         quInsInl_BlankForVeb.SQL.Text:='insert into l_BlankForVeb (IdVeb,idBlank) '
                                                       +'     values (:IdVeb,:idBlank)';
                         quInsInl_BlankForVeb.ParamByName('IdVeb').Value := OrderNo;
                         quInsInl_BlankForVeb.ParamByName('idBlank').Value := documentID;
                         if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                                    quInsInl_BlankForVeb.Execute;
                                                                                    Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                                  end;
                         quInsInl_BlankForVeb.Close;
}
                         quPostArtGroup.Next;
                       end;//quPostArtGroup.Eof
                       quPostArtGroup.Close;
                   End; // quOrders.FieldByName('NoContractor').Value = 0  else
           End // quOrders.FieldByName('NoClient').Value = 0 then
      Else Begin // quOrders.FieldByName('NoClient').Value = 0 else

             Dlg.spAddInputOrder.ParamByName('PostNo').Value := quOrders.FieldByName('NoContractor').Value;
             PostNo := quOrders.FieldByName('NoContractor').Value;
             if quOrders.FieldByName('DateDelivery').Value <> '01.01.1900'     then Begin
                                                                                      if quOrders.FieldByName('DateDelivery').Value <= GlobalDateNakl
                                                                                       then DeliveryDate := GlobalDateNakl
                                                                                       else begin
                                                                                              DateTimeToString(formattedDateTime, 'c',quOrders.FieldByName('DateDelivery').Value);
                                                                                              DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                            end;
                                                                                    End
                                                                               else Begin
                                                                                      buttonSelected := MessageDlg('Не задана дата доставки!'+#13#10+ //'Установить дату доставки в ' +'?'
                                                                                                                   'Дата доставки устанавливается в ' + datetostr(dtDateDelivery.Date) ,mtWarning, mbOKCancel, 0);
                                                                                      if buttonSelected = mrOK then Begin
                                                                                                                      DateTimeToString(formattedDateTime, 'c', dtDateDelivery.Date);
                                                                                                                      DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                                    End;
                                                                                      if buttonSelected = mrCancel then Begin
                                                                                                                          DateTimeToString(formattedDateTime, 'c', dtDateDelivery.Date);
                                                                                                                          DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                              {
                                                                                                              DateTimeToString(formattedDateTime, 'c', quOrders.FieldByName('DateDelivery').Value);
                                                                                                              DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                              }
                                                                                                                        End;
                                                                                    End;
{
             Showmessage('Выберите сотрудника');
             RetPostForRashod := PostForRashod(DeliveryDate,PostNo);
             if RetPostForRashod.PostNo > 0 then Begin
                                                   Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                                   Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := RetPostForRashod.SotrudNo;
                                                   Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
                                                   Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                                   Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := RetPostForRashod.OtdelNo;
                                                   Dlg.spAddInputOrder.ParamByName('Buh').Value := RetPostForRashod.Buh;
                                                   Buh := RetPostForRashod.Buh;
                                                   Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := RetPostForRashod.SET_ARTICLE_GROUP;
                                                 End
                                            else raise Exception.Create('Необходимо выбрать сотрудника!'+#13#10+
                                                                'Возможно к контрагенту не сопоставлены сотрудники.'+#13#10+
                                                                'Для того чтобы выбрать сопоставте контрагенту сотрудников ');
}
             quPostArtGroup := TMSQuery.Create(nil);
             quPostArtGroup.Connection:= dmDataModule.DB;
             quPostArtGroup.SQL.Clear;
             quPostArtGroup.SQL.Text:='select distinct lag.ARTICLE_GROUP_ID '+
                                      '               ,dag.NAME '+
                                      '               ,lag.ARTICLE_ID '+
                                      '               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID '+
                                      '               ,dsag.NAME '+
                                      '               ,lpsagd.POSTNO '+
                                      '               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay '+
                                      '               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY '+
                                      '               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT '+
                                      '               ,isnull(lpsagp.POSTNO,0) as POSTNOP '+
                                      '               ,isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_price '+
                                      '               ,isnull(lpsagp.COLNPRICE,0) as COLNPRICE '+
                                      ' from L_ARTICLE_GROUP lag left join '+
                                      '      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join '+
                                      '      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                                      '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join '+
                                      '      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = :PostNo and lpsagd.BUH = :Buh left join '+
                                      '      L_POST_SET_ARTGROUP_PRICE lpsagp on lsag.SET_ARTICLE_GROUP_ID = lpsagp.SET_ARTICLE_GROUP_ID and lpsagp.POSTNO = :PostNom left join '+
                                      '      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '+
                                      '  where convert(int,iov.OrderNo) = convert(int,:OrderNo)  '+
                                      '    and lsag.SET_ARTICLE_GROUP_ID is not null '+
                                      '    and convert(smallint,iov.Article) not in (select TovarNo '+
                                      '                                               from e_blanks '+
                                      '                                                where Document_id in (select idBlank '+
                                      '                                                                       from l_BlankForExite '+
                                      '                                                                        where IdExite = convert(bigint,:OrderNom))) '+
                                      '    and LEN(cast(isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as varchar(50))+ cast(isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as varchar(50))) > 2'+
                                      '    and lpsagd.POSTNO is not null';


{
                               'declare'+
                               '         @PostNo int '+
                               '        ,@OrderNo int '+
                               'set @OrderNo = convert(int,:OrderNo) '+
                               'set @PostNo = convert(int,:PostNo) '+
                               'select lpsagd.POSTNO '+
                               '      ,lpsagd.DAY_DELAY '+
                               '      ,lpsagd.DAY_DELAY_EXT '+
                               '      ,lpsagd.BUH '+
                               '      ,convert(varchar(25),lpsagd.SET_ARTICLE_GROUP_ID) as SET_ARTICLE_GROUP_ID '+
                               '      ,isnull(lpsagp.COLNPRICE,0) as COLNPRICE '+
                               ' from L_POST_SET_ARTGROUP_DELAY lpsagd left join '+
                               '      L_POST_SET_ARTGROUP_PRICE lpsagp on lpsagp.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagp.POSTNO = lpsagd.POSTNO '+
                               '  where convert(int,lpsagd.POSTNO) = convert(int,@PostNo) '+
                               '    and lpsagd.SET_ARTICLE_GROUP_ID in (select distinct lsag.SET_ARTICLE_GROUP_ID '+
                               '                                         from L_ARTICLE_GROUP lag inner join '+
                               '                                              L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID inner join '+
                               '                                              ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '+
                               '                                          where convert(int,iov.OrderNo) = convert(int,@OrderNo)) '+
                               '    and convert(int,lpsagd.BUH) = convert(int,:Buh) '+
                               'union all '+
                               'select convert(int,@PostNo) '+
                               '      ,0 '+
                               '      ,0 '+
                               '      ,1 '+
                               '      ,''7718234909260420228'' '+
                               '      ,2 ';
}
             quPostArtGroup.Prepare;
             quPostArtGroup.ParamByName('OrderNo').Value := OrderNo;
             quPostArtGroup.ParamByName('OrderNom').Value := OrderNo;
             quPostArtGroup.ParamByName('PostNo').Value := PostNo;
             quPostArtGroup.ParamByName('PostNom').Value := PostNo;
             quPostArtGroup.ParamByName('Buh').Value := Buh;

             quPostArtGroup.Open;
             quPostArtGroup.First;

             if quPostArtGroup.RecordCount =0 then ShowMessage ('Проверте правильность создания заказа! '+#13#10+
                                                                'Возможно неверно указан бухгалтерский тип.'+#13#10+
                                                                'Если бухгалтерский тип документа верный, обратитесь к программисту');

             while not quPostArtGroup.Eof do
               begin //quPostArtGroup.Eof

                 documentID := 0;
//                 Komplectacija := 0;
                 SArticleGroup := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;
                 SArticleGroupDouble := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').AsVariant;

                 quCheckOrder :=TMSQuery.Create(nil);
                 quCheckOrder.Connection:=dmDataModule.DB;
                 quCheckOrder.SQL.Clear;
                 quCheckOrder.SQL.Text:='select * '
                                       +' from ImportOrderVebTmp ivt '
                                       +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                       +'    and convert(smallint,Article) not in (select TovarNo '
                                       +'                                                  from e_blanks '
                                       +'                                                   where Document_id in (select idBlank '
                                       +'                                                                          from l_BlankForVeb '
                                       +'                                                                           where IdVeb = convert(bigint,:OrderNom))) '
                                       +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                       +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                       +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                       +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                       +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                       +'    and ivt.KolTov >0 ';

                 quCheckOrder.Prepare;
                 quCheckOrder.ParamByName('OrderNo').Value := OrderNo;
                 quCheckOrder.ParamByName('OrderNom').Value := OrderNo;
                 quCheckOrder.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                 quCheckOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;
                 quCheckOrder.Open;
                 if quCheckOrder.RecordCount > 0 Then isRun := true else isRun := false;
                 quCheckOrder.Close;

                 
                 Dlg.quPostBan.Close;
                 Dlg.quPostBan.Params.ParamByName('p_PostNo').Value := PostNo;
                 Dlg.quPostBan.Open;
                 Is_PostBan := false;
                 Is_PostBanPay := false;

                 Dlg.quPostBanPay.Close;
                 Dlg.quPostBanPay.Params.ParamByName('PostNo').Value := PostNo;
                 Dlg.quPostBanPay.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
                 Dlg.quPostBanPay.Params.ParamByName('Buh').Value := Buh;
                 Dlg.quPostBanPay.Open;

                 Dlg.quControlPayBan.Close;
                 Dlg.quControlPayBan.Params.ParamByName('PostNo').Value := PostNo;
                 Dlg.quControlPayBan.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
                 Dlg.quControlPayBan.Params.ParamByName('Buh').Value := Buh;
                 Dlg.quControlPayBan.Params.ParamByName('DateNakl').Value := DeliveryDate;
                 Dlg.quControlPayBan.Open;

                 Dlg.quSummaDolga.Close;
                 Dlg.quSummaDolga.Params.ParamByName('PostNo').Value := PostNo;
                 Dlg.quSummaDolga.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
                 Dlg.quSummaDolga.Params.ParamByName('Buh').Value := Buh;
                 Dlg.quSummaDolga.Open;

                 if dlg.quControlPayBan.RecordCount > 0 then Is_ControlPostBanPay := false else Is_ControlPostBanPay := true;


                 if ((Dlg.quSummaDolgaSUMMA_ECO.Value > Dlg.quPostBanPayPayBan.Value) and (Dlg.quPostBanPayPayBan.Value <>0)
                                                                                      and (Is_ControlPostBanPay = True)) then
                   begin
                     DescriptionBanPay := 'Превышен лимит ' +#13#10+ 'Сумма дебиторской задолженности ' + FloatToStr(Dlg.quSummaDolgaSUMMA_ECO.Value) +#13#10+ 'Допустимый лимит '+ FloatToStr(Dlg.quPostBanPayPayBan.Value);
                     if is_postBanPay = false then raise Exception.Create(DescriptionBanPay);
                     Is_postBanPay := true;
                   end;

                 if (Dlg.quPostBanPostBan.Value = 1) and (quOrdersTypeNakl.asString = 'Возвратная') then
                  begin
                    DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
                    raise Exception.Create(DescriptionBan);
                    Is_PostBan := true;
                  end;

                 if CheckBlank(PostNo, Dlg.spAddInputOrder.ParamByName('ReasonId').Value, DeliveryDate, OtdelNo, SArticleGroupDouble, ErrMsg) >= 10 then
                  begin
                    //Не Успешно
                    raise Exception.Create(ErrMsg);
                  end;

                 Dlg.quPostBan.Close;
                 Dlg.quPostBanPay.Close;
                 Dlg.quSummaDolga.Close;
                 Dlg.quControlPayBan.Close;



                 Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := SArticleGroup ;
                 Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := quPostArtGroup.FieldByName('DAY_DELAY').Value;
                 Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                 Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := quOrders.FieldByName('NoClient').Value;
                 Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
                 if (quOrders.FieldByName('NoAdress').Value = 0) and (isRun = true)
                   Then Begin
                          Showmessage('На сайте не указан номер адреса!'+#13#10+
                                      'Установите номер адреса на сайте что бы это сообщение не появлялось в дальнейшем');
                          Showmessage('Выберите адрес доставки по сотруднику ' + quOrders.FieldByName('NameClient').Value);
                          RetPostForRashod := PostForRashod(DeliveryDate,PostNo);
                          if RetPostForRashod.PostNo > 0 then Begin
                                                                Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                                              End
                                                         else raise Exception.Create('Необходимо выбрать адрес доставки сотрудника!'+#13#10+
                                                                                     'Возможно к контрагенту не сопоставлен адрес доставки по сотрудникиу.'+#13#10+
                                                                                     'Для того чтобы выбрать сопоставте контрагенту адрес доставки по сотруднику.');
                        End
                   Else Begin
                          quAdressPost:=TMSQuery.Create(nil);
                          quAdressPost.Connection:=dmDataModule.DB;
                          quAdressPost.SQL.Clear;
                          quAdressPost.SQL.Text:='select AddressNo from AddressPost where Id = :Id';
                          quAdressPost.Prepare;
                          quAdressPost.ParamByName('Id').Value := quOrders.FieldByName('NoAdress').Value;
                          quAdressPost.Open;
                          Dlg.spAddInputOrder.ParamByName('AddressNo').Value := quAdressPost.FieldByName('AddressNo').Value;
                          quAdressPost.Close;
                        End;
                 quSotrudOtdel:=TMSQuery.Create(nil);
                 quSotrudOtdel.Connection:=dmDataModule.DB;
                 quSotrudOtdel.SQL.Clear;
                 quSotrudOtdel.SQL.Text:='select SotrudOtdel from Sotrud where SotrudNo = :SotrudNo';
                 quSotrudOtdel.Prepare;
                 quSotrudOtdel.ParamByName('SotrudNo').Value := quOrders.FieldByName('NoClient').Value;
                 quSotrudOtdel.Open;
                 Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := quSotrudOtdel.FieldByName('SotrudOtdel').Value;
                 quSotrudOtdel.Close;

                 Dlg.quContract.Close;
                 Dlg.quContract.ParamByName('p_PostNo').Value := PostNo;
                 Dlg.quContract.Open;
                 Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg.quContract.FieldByName('id').Value;
                 Dlg.quContract.Close;





                 quColnPriceForOrder.ParamByName('OrderNo').Value := OrderNo;
                 quColnPriceForOrder.ParamByName('OrderNom').Value := OrderNo;
                 quColnPriceForOrder.ParamByName('PostNo').Value := PostNo;
                 quColnPriceForOrder.ParamByName('PostNom').Value := PostNo;
                 quColnPriceForOrder.ParamByName('Buh').Value := Buh;
                 quColnPriceForOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Text;
                 quColnPriceForOrder.Open;
                 quColnPriceForOrder.First;
{
                 if quColnPriceForOrder.RecordCount =0 then ShowMessage ('Нет записи в запросе! '+#13#10+
                                                                          quPostArtGroup.SQL.Text+#13#10+
                                                                         'Обратитесь к программисту');
}

                 while not quColnPriceForOrder.Eof do
                    begin
                      if quColnPriceForOrder.FieldByName('COLNPRICE').Value = 0 then quColnPriceForOrder.Next
                                                                                else
                                                                                  Begin
                                                                                    Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quColnPriceForOrder.FieldByName('COLNPRICE').Value;

                                                                                    if ColNPrice <> quColnPriceForOrder.FieldByName('COLNPRICE').Value then begin
                                                                                                                                                              ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                                                                                                                                                              Dlg.spAddInputOrder.ExecProc;
                                                                                                                                                              documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                                                                                                                                                              LdocumentID := documentID;
                                                                                                                                                              //LKomplectacija := Komplectacija;
                                                                                                                                                            end;
                                                                                    if documentID = 0 then begin
                                                                                                             documentID := LdocumentID;
                                                                                                             //Komplectacija := LKomplectacija;
                                                                                                           end;  
{
                                                                                    ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                                                                                    Dlg.spAddInputOrder.ExecProc;
                                                                                    documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
 }
                                                                                    quSpecBlank :=TMSQuery.Create(nil);
                                                                                    quSpecBlank.Connection:=dmDataModule.DB;
                                                                                    quSpecBlank.SQL.Clear;
                                                                                    quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                                                                                         +'      ,convert(int,KolTov) as KolTov '
                                                                                                         +'      ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                                                                                         +'     ,convert(numeric(18,2),ltrim(rtrim(KomplectacijaOne))) as  KomplectacijaOne '
                                                                                                         +'     ,convert(numeric(18,2),ltrim(rtrim(Komplectacija))) as  Komplectacija '
                                                                                                         +' from ImportOrderVebTmp ivt '
                                                                                                         +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                                                                                         +'    and convert(smallint,Article) not in (select TovarNo '
                                                                                                         +'                                                  from e_blanks '
                                                                                                         +'                                                   where Document_id in (select idBlank '
                                                                                                         +'                                                                          from l_BlankForVeb '
                                                                                                         +'                                                                           where IdVeb = convert(bigint,:OrderNom))) '
                                                                                                         +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                                                                                         +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                                                                                         +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                                                                                         +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                                                                                         +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                                                                                         +'    and ivt.KolTov >0 ';
                                                                                    quSpecBlank.Prepare;
                                                                                    quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                                                                                    quSpecBlank.ParamByName('OrderNom').Value := OrderNo;
                                                                                    quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                                                                                    quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;
                                                                                            //    showmessage(quSpecBlank.SQL.Text);
                                                                                    quSpecBlank.Open;

                                                                                    if quSpecBlank.FieldByName('Komplectacija').Value = 0 then Komplectacija := 0;

                                                                                    quSpecBlank.First;

                                                                                    CheckOrderForVeb := TMSQuery.Create(nil);
                                                                                    CheckOrderForVeb.Connection:= dmDataModule.DB;
                                                                                    CheckOrderForVeb.SQL.Clear;
                                                                                    CheckOrderForVeb.SQL.Text := 'select * from e_blanks where Document_id = :Document_id';
                                                                                    CheckOrderForVeb.ParamByName('Document_id').Value := documentID;
                                                                                    CheckOrderForVeb.Open;

                                                                                    if (quSpecBlank.RecordCount = 0) and (CheckOrderForVeb.RecordCount = 0) then begin
                                                                                                                                                                   quDelInputOrder := TMSQuery.Create(nil);
                                                                                                                                                                   quDelInputOrder.Connection:=dmDataModule.DB;
                                                                                                                                                                   quDelInputOrder.SQL.Clear;
                                                                                                                                                                   quDelInputOrder.SQL.Text:= 'delete e_blank_head '+
                                                                                                                                                                                              ' where id = :id';
                                                                                                                                                                   quDelInputOrder.Prepare;
                                                                                                                                                                   quDelInputOrder.ParamByName('id').Value := documentID;
                                                                                                                                                                   quDelInputOrder.Execute;
                                                                                                                                                                   quSpecBlank.Close;

                                                                                                                                                                 end;
                                                                                    CheckOrderForVeb.Close;
                                                                                    while not quSpecBlank.Eof do
                                                                                       begin
                                                                                         Dlg3 := TMlekoBlankSpecForm.Create(Application);

                                                                                         if (quSpecBlank.FieldByName('KomplectacijaOne').Value > 0) and not (quOrdersTypeNakl.asString = 'Возвратная') then
                                                                                          begin
                                                                                            Komplectacija :=  Komplectacija + quSpecBlank.FieldByName('KomplectacijaOne').Value;
                                                                                            Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                                            Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value :=  10815; // !!!!!!! Артикул "Услуга комплектации" проставлен хардкодом из-за не определенности с выбором
                                                                                            Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                                            Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := 1;
                                                                                            Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := 1;
                                                                                            Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := Komplectacija;
                                                                                            Dlg3.spEditBlankPosition.ExecProc;
                                                                                          end;

                                                                                         Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                                         Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                                                                         Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                                         Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := quSpecBlank.FieldByName('KolTov').Value;
                                                                                         Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := quSpecBlank.FieldByName('KolTov').Value;

                                                                                         if ColNPrice = 0 Then Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quSpecBlank.FieldByName('PriceTov').Value
                                                                                                           Else Begin
                                                                                                                  quPrice :=TMSQuery.Create(nil);
                                                                                                                  quPrice.Connection:=dmDataModule.DB;
                                                                                                                  quPrice.SQL.Clear;
                                                                                                                  quPrice.SQL.Text:= 'select isnull(case when :ColnPrice = 1 then Isnull(Price,0) '
                                                                                                                                    +'                   when :ColnPrice = 2 then Isnull(Price1,0) '
                                                                                                                                    +'                   when :ColnPrice = 3 then Isnull(Price2,0) '
                                                                                                                                    +'                   when :ColnPrice = 4 then Isnull(Price3,0) '
                                                                                                                                    +'                   when :ColnPrice = 5 then Isnull(Price4,0) '
                                                                                                                                    +'                   when :ColnPrice = 6 then Isnull(Price5,0) '
                                                                                                                                    +'                   when :ColnPrice = 7 then Isnull(Price6,0) '
                                                                                                                                    +'                   when :ColnPrice = 8 then Isnull(Price7,0) '
                                                                                                                                    +'                   when :ColnPrice = 10 then Isnull(Price8,0) '
                                                                                                                                    +'                   when :ColnPrice = 11 then Isnull(Price9,0) '
                                                                                                                                    +'                   when :ColnPrice = 12 then Isnull(Price10,0) '
                                                                                                                                    +'                   when :ColnPrice = 13 then Isnull(Price13,0) '
                                                                                                                                    +'                   when :ColnPrice = 14 then Isnull(Price14,0) '
                                                                                                                                    +'                   when :ColnPrice = 15 then Isnull(Price15,0) '
                                                                                                                                    +'                   when :ColnPrice = 9 then Isnull(AvgPriceIn,0) '
                                                                                                                                    +'                   when :ColnPrice = 17 then Isnull(pfv.PriceVeb, 0) '
                                                                                                                                    +'                   when :ColnPrice = 18 then Isnull(pfv.PriceInInst, 0) '
                                                                                                                                    +'              end,0) as Price '
                                                                                                                                    +' from Ostatok o '
                                                                                                                                    +'     ,PriceForVeb pfv '
                                                                                                                                    +'  where o.TovarNo = :TovarNo '
                                                                                                                                    +'    and o.TovarNo = pfv.TovarNo';
                                                                                                                  quPrice.Prepare;
                                                                                                                  quPrice.ParamByName('TovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                                                                                                  quPrice.ParamByName('ColnPrice').Value := ColNPrice;
                                                                                                                  quPrice.Open;
                                                                                                                  if ((quPrice.FieldByName('Price').Value = 0) or (quPrice.FieldByName('Price').Value = Null)) then begin
                                                                                                                                                                                                                      ErrMsg := 'Не расцененный товар!' +#13#10+
                                                                                                                                                                                                                                'Создание заказа остановлено! Сообщите программисту!' +#13#10+
                                                                                                                                                                                                                                'Код товара ' + quSpecBlank.FieldByName('Article').AsString +#13#10+
                                                                                                                                                                                                                                'Номер заказа на сайте '+ IntToStr(OrderNo);
                                                                                                                                                                                                                      raise Exception.Create(ErrMsg);
                                                                                                                                                                                                                    end;
                                                                                                                  Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quPrice.FieldByName('Price').Value;
                                                                                                                  quPrice.Close;
                                                                                                                End;
                                                                                         Dlg3.spEditBlankPosition.ExecProc;

                                                                                         Dlg3.Free;
                                                                                         quSpecBlank.Next;
                                                                                       end;

                                                                                    CheckOrderForVeb := TMSQuery.Create(nil);
                                                                                    CheckOrderForVeb.Connection:= dmDataModule.DB;
                                                                                    CheckOrderForVeb.SQL.Clear;
                                                                                    CheckOrderForVeb.SQL.Text := 'select * from l_BlankForVeb where IdVeb = :IdVeb and IdBlank = :IdBlank';
                                                                                    CheckOrderForVeb.ParamByName('IdVeb').Value := OrderNo;
                                                                                    CheckOrderForVeb.ParamByName('IdBlank').Value := documentID;
                                                                                    CheckOrderForVeb.Open;
                                                                                    if CheckOrderForVeb.RecordCount > 0 then isRun := false;

                                                                                    quInsInl_BlankForVeb :=TMSQuery.Create(nil);
                                                                                    quInsInl_BlankForVeb.Connection:=dmDataModule.DB;
                                                                                    quInsInl_BlankForVeb.SQL.Clear;
                                                                                    quInsInl_BlankForVeb.SQL.Text:='insert into l_BlankForVeb (IdVeb,IdBlank) '
                                                                                                                  +'     values (:IdVeb,:IdBlank)';
                                                                                    quInsInl_BlankForVeb.ParamByName('IdVeb').Value := OrderNo;
                                                                                    quInsInl_BlankForVeb.ParamByName('idBlank').Value := documentID;

{
                                                                                    quCheckOrderForKomplectacija := TMSQuery.Create(nil);
                                                                                    quCheckOrderForKomplectacija.Connection := dmDataModule.DB;
                                                                                    quCheckOrderForKomplectacija.SQL.Clear;
                                                                                    quCheckOrderForKomplectacija.SQL.Text := 'select distinct convert(decimal(18,2),Komplectacija) as Komplectacija from work.dbo.ImportOrderVebTmp where OrderNo = :OrderNo';
                                                                                    quCheckOrderForKomplectacija.ParamByName('OrderNo').Value := OrderNo;
                                                                                    quCheckOrderForKomplectacija.Open;
}

                                                                                    if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                                                                                               quInsInl_BlankForVeb.Execute;
                                                                                                                                               if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                                                                                                                                                                    Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                                                                                                                                                                                    Dlg.spModifyLinkBlankReturn.Execute;
                                                                                                                                                                                                  end;
                                                                                                                                               {
                                                                                                                                               if (quCheckOrderForKomplectacija.FieldByName('Komplectacija').Value > 0) and (Is_KomplectacijaRun = true)
                                                                                                                                                then begin
                                                                                                                                                       Dlg3 := TMlekoBlankSpecForm.Create(Application);
                                                                                                                                                       Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                                                                                                       Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := 10815; // !!!!!!! Артикул "Услуга комплектации" проставлен хардкодом из-за не определенности с выбором
                                                                                                                                                       Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                                                                                                       Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := 1;
                                                                                                                                                       Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := 1;
                                                                                                                                                       Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quCheckOrderForKomplectacija.FieldByName('Komplectacija').Value;
                                                                                                                                                       Dlg3.spEditBlankPosition.ExecProc;
                                                                                                                                                       Dlg3.Free;
                                                                                                                                                       Is_KomplectacijaRun := false;
                                                                                                                                                     end;
                                                                                                                                               }      
                                                                                                                                               Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                                                                                             end
                                                                                                                                        else begin
                                                                                                                                               if documentID > 0 then Showmessage ('Заказ document_id = '+ IntToStr(documentID)+ ' дополнен');
                                                                                                                                             end;
//                                                                                    quCheckOrderForKomplectacija.Close;
                                                                                    quInsInl_BlankForVeb.Close;

                                                                                    quColnPriceForOrder.Next;
                                                                                  End;
                    end;
                 quColnPriceForOrder.Close;

{
                 If quPostArtGroup.FieldByName('COLNPRICE').Value = 0 Then Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := 17
                                                                      Else Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quPostArtGroup.FieldByName('COLNPRICE').Value;
}

{


                 if (isRun = true) and (ColNPrice > 0) then begin
                                                              Dlg.spAddInputOrder.ExecProc;
                                                              documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                                                            end;



                 quSpecBlank :=TMSQuery.Create(nil);
                 quSpecBlank.Connection:=dmDataModule.DB;
                 quSpecBlank.SQL.Clear;
                 quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                      +'     ,convert(int,KolTov) as KolTov '
                                      +'     ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                      +' from ImportOrderVebTmp ivt '
                                      +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                      +'    and convert(smallint,Article) not in (select TovarNo '
                                      +'                                                  from e_blanks '
                                      +'                                                   where Document_id in (select idBlank '
                                      +'                                                                          from l_BlankForVeb '
                                      +'                                                                           where IdVeb = convert(bigint,:OrderNom))) '
                                      +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                      +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                      +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                      +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                      +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                      +'    and ivt.KolTov >0 ';
                 quSpecBlank.Prepare;
                 quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                 quSpecBlank.ParamByName('OrderNom').Value := OrderNo;
                 quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                 quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;

//    showmessage(quSpecBlank.SQL.Text);

                 quSpecBlank.Open;
                 quSpecBlank.First;

                 if quSpecBlank.RecordCount =0 then begin
                                                      quDelInputOrder := TMSQuery.Create(nil);
                                                      quDelInputOrder.Connection:=dmDataModule.DB;
                                                      quDelInputOrder.SQL.Clear;
                                                      quDelInputOrder.SQL.Text:= 'delete e_blank_head '+
                                                                                 ' where id = :id';
                                                      quDelInputOrder.Prepare;
                                                      quDelInputOrder.ParamByName('id').Value := documentID;
                                                      quDelInputOrder.Execute;
                                                      quSpecBlank.Close;
                                                   //   quPostArtGroup.Close;
                                                   //   raise Exception.Create('Нет записи в запросе!'+ #10#13 +
                                                   //               quSpecBlank.SQL.Text+ #10#13 +
                                                   //               'Обратитесь к программисту');
                                                    end;

                 while not quSpecBlank.Eof do
                   begin
                     Dlg3 := TMlekoBlankSpecForm.Create(Application);
                     Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                     Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                     Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                     Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := quSpecBlank.FieldByName('KolTov').Value;
                     Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := quSpecBlank.FieldByName('KolTov').Value;

                     if ColNPrice = 0 Then Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quSpecBlank.FieldByName('PriceTov').Value
                                      Else Begin
                                             quPrice :=TMSQuery.Create(nil);
                                             quPrice.Connection:=dmDataModule.DB;
                                             quPrice.SQL.Clear;
                                             quPrice.SQL.Text:= 'select case when :ColnPrice = 1 then Isnull(Price,0) '
                                                               +'            when :ColnPrice = 2 then Isnull(Price1,0) '
                                                               +'            when :ColnPrice = 3 then Isnull(Price2,0) '
                                                               +'            when :ColnPrice = 4 then Isnull(Price3,0) '
                                                               +'            when :ColnPrice = 5 then Isnull(Price4,0) '
                                                               +'            when :ColnPrice = 6 then Isnull(Price5,0) '
                                                               +'            when :ColnPrice = 7 then Isnull(Price6,0) '
                                                               +'            when :ColnPrice = 8 then Isnull(Price7,0) '
                                                               +'            when :ColnPrice = 10 then Isnull(Price8,0) '
                                                               +'            when :ColnPrice = 11 then Isnull(Price9,0) '
                                                               +'            when :ColnPrice = 12 then Isnull(Price10,0) '
                                                               +'            when :ColnPrice = 13 then Isnull(Price13,0) '
                                                               +'            when :ColnPrice = 14 then Isnull(Price14,0) '
                                                               +'            when :ColnPrice = 15 then Isnull(Price15,0) '
                                                               +'            when :ColnPrice = 9 then Isnull(AvgPriceIn,0) '
                                                               +'            when :ColnPrice = 17 then Isnull(pfv.PriceVeb, 0) '
                                                               +'       end as Price '
                                                               +' from Ostatok o '
                                                               +'     ,PriceForVeb pfv '
                                                               +'  where o.TovarNo = :TovarNo '
                                                               +'    and o.TovarNo = pfv.TovarNo';
                                             quPrice.Prepare;
                                             quPrice.ParamByName('TovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                             quPrice.ParamByName('ColnPrice').Value := ColNPrice;
                                             quPrice.Open;
                                             Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quPrice.FieldByName('Price').Value;
                                           End;
                     Dlg3.spEditBlankPosition.ExecProc;
                     Dlg3.Free;
                     quSpecBlank.Next;

                   end;

                 quInsInl_BlankForVeb :=TMSQuery.Create(nil);
                 quInsInl_BlankForVeb.Connection:=dmDataModule.DB;
                 quInsInl_BlankForVeb.SQL.Clear;
                 quInsInl_BlankForVeb.SQL.Text:='insert into l_BlankForVeb (IdVeb,idBlank) '
                                               +'     values (:IdVeb,:idBlank)';
                 quInsInl_BlankForVeb.ParamByName('IdVeb').Value := OrderNo;
                 quInsInl_BlankForVeb.ParamByName('idBlank').Value := documentID;
                 if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                            quInsInl_BlankForVeb.Execute;
                                                                            Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                          end;
                 quInsInl_BlankForVeb.Close;
}
                 quPostArtGroup.Next;
               end;//quPostArtGroup.Eof
               quPostArtGroup.Close;
{

             if quOrders.FieldByName('DateDelivery').Value <> '01.01.1900' then Begin
                                                                                  DateTimeToString(formattedDateTime, 'c',quOrders.FieldByName('DateDelivery').Value);
                                                                                  DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                End
                                                                           else Begin
                                                                                  buttonSelected := MessageDlg('Не задана дата доставки!'+#13#10+
                                                                                                               'Установить дату доставки в ' + datetostr(dtDateDelivery.Date) +'?',mtWarning, mbOKCancel, 0);
                                                                                  if buttonSelected = mrOK then Begin
                                                                                                                  DateTimeToString(formattedDateTime, 'c', dtDateDelivery.Date);
                                                                                                                  DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                                End;
                                                                                  if buttonSelected = mrCancel then Begin
                                                                                                                      DateTimeToString(formattedDateTime, 'c', quOrders.FieldByName('DateDelivery').Value);
                                                                                                                      DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                                    End;
                                                                                End;
             Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
             Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := quOrders.FieldByName('NoClient').Value;
             Dlg.spAddInputOrder.ParamByName('VidNaklNo').Value := 1;
             Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;

             if quOrders.FieldByName('NoAdress').Value = 0
              Then Begin
                     Showmessage('На сайте не указан номер адреса!'+#13#10+
                                 'Установите номер адреса на сайте что бы это сообщение не появлялось в дальнейшем');
                     Showmessage('Выберите адрес доставки по сотруднику ' + quOrders.FieldByName('NameClient').Value);
                     RetPostForRashod := PostForRashod(DeliveryDate,PostNo);
                     if RetPostForRashod.PostNo > 0 then Begin
                                                           Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                                         End
                                                    else raise Exception.Create('Необходимо выбрать адрес доставки сотрудника!'+#13#10+
                                                                                'Возможно к контрагенту не сопоставлен адрес доставки по сотрудникиу.'+#13#10+
                                                                                'Для того чтобы выбрать сопоставте контрагенту адрес доставки по сотруднику.');
                   End
              Else Begin
                     quAdressPost:=TMSQuery.Create(nil);
                     quAdressPost.Connection:=dmDataModule.DB;
                     quAdressPost.SQL.Clear;
                     quAdressPost.SQL.Text:='select AddressNo from AddressPost where Id = :Id';
                     quAdressPost.Prepare;
                     quAdressPost.ParamByName('Id').Value := quOrders.FieldByName('NoAdress').Value;
                     quAdressPost.Open;
                     Dlg.spAddInputOrder.ParamByName('AddressNo').Value := quAdressPost.FieldByName('AddressNo').Value;
                     quAdressPost.Close;
                   End;
              quSotrudOtdel:=TMSQuery.Create(nil);
              quSotrudOtdel.Connection:=dmDataModule.DB;
              quSotrudOtdel.SQL.Clear;
              quSotrudOtdel.SQL.Text:='select SotrudOtdel from Sotrud where SotrudNo = :SotrudNo';
              quSotrudOtdel.Prepare;
              quSotrudOtdel.ParamByName('SotrudNo').Value := quOrders.FieldByName('NoClient').Value;
              quSotrudOtdel.Open;
              Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := quSotrudOtdel.FieldByName('SotrudOtdel').Value;
              quSotrudOtdel.Close;
              Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := 17;
              Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := 0;

              Dlg.spAddInputOrder.ExecProc;
              documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;


              quSpecBlank :=TMSQuery.Create(nil);
              quSpecBlank.Connection:=dmDataModule.DB;
              quSpecBlank.SQL.Clear;
              quSpecBlank.SQL.Text:='select convert(int,Article) as Article'
                                   +'     ,convert(int,KolTov) as KolTov '
                                   +'     ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                   +' from ImportOrderVebTmp ivt left join'
                                   +'      Tovar t on ivt.Article = t.TovarNo'
                                   +'  where convert(int,ivt.OrderNo) = :OrderNo';
              quSpecBlank.Prepare;
              quSpecBlank.ParamByName('OrderNo').Value := OrderNo;

              quSpecBlank.Open;
              quSpecBlank.First;

              if quSpecBlank.RecordCount =0 then raise Exception.Create('Нет записи в запросе! Проверьте наполнение заказа!!!'+ #10#13 +quSpecBlank.SQL.Text);

              while not quSpecBlank.Eof do
                begin
                  Dlg3 := TMlekoBlankSpecForm.Create(Application);
                  Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                  Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                  Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                  Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := quSpecBlank.FieldByName('KolTov').Value;
                  Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := quSpecBlank.FieldByName('KolTov').Value;
                  Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quSpecBlank.FieldByName('PriceTov').Value;
                  Dlg3.spEditBlankPosition.ExecProc;
                  quSpecBlank.Next;
                end;

              quInsInl_BlankForVeb :=TMSQuery.Create(nil);
              quInsInl_BlankForVeb.Connection:=dmDataModule.DB;
              quInsInl_BlankForVeb.SQL.Clear;
              quInsInl_BlankForVeb.SQL.Text:='insert into l_BlankForVeb (IdVeb,idBlank)'
                                            +'     values (:IdVeb,:idBlank)';
              quInsInl_BlankForVeb.ParamByName('IdVeb').Value := OrderNo;
              quInsInl_BlankForVeb.ParamByName('idBlank').Value := documentID;
              quInsInl_BlankForVeb.Execute;
              Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
              quInsInl_BlankForVeb.Close;}

           End;

   end; // 4
  if quOrders.FieldByName('GroupClient').Value = 5 Then
   begin // 5

     PostNo := quOrders.FieldByName('NoContractor').AsInteger;
     Dlg.spAddInputOrder.ParamByName('ReasonId').Value := 1;
     Dlg.spAddInputOrder.ParamByName('PostNo').Value := PostNo;
     Dlg.spAddInputOrder.ParamByName('Description').Value := 'Заказ сформирован на основе файла из системы Exite';
     
     Dlg.quContract.Close;
     Dlg.quContract.ParamByName('p_PostNo').Value := PostNo;
     Dlg.quContract.Open;
     Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg.quContract.FieldByName('id').Value;
     Dlg.quContract.Close;


     if  quOrders.FieldByName('DateDelivery').Value <> '01.01.1900'   then Begin
                                                                              if quOrders.FieldByName('DateDelivery').Value <= GlobalDateNakl
                                                                               then DeliveryDate := GlobalDateNakl
                                                                               else begin
                                                                                      DateTimeToString(formattedDateTime, 'c',quOrders.FieldByName('DateDelivery').Value);
                                                                                      DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                    end;
                                                                            End
                                                                       else Begin
                                                                              buttonSelected := MessageDlg('Не задана дата доставки!'+#13#10+ //'Установить дату доставки в ' +'?'
                                                                                                           'Дата доставки устанавливается в ' + datetostr(dtDateDelivery.Date) ,mtWarning, mbOKCancel, 0);
                                                                              if buttonSelected = mrOK then Begin
                                                                                                              DateTimeToString(formattedDateTime, 'c', dtDateDelivery.Date);
                                                                                                              DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                            End;
                                                                              if buttonSelected = mrCancel then Begin
                                                                                                                  DateTimeToString(formattedDateTime, 'c', dtDateDelivery.Date);
                                                                                                                  DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                              {
                                                                                                              DateTimeToString(formattedDateTime, 'c', quOrders.FieldByName('DateDelivery').Value);
                                                                                                              DeliveryDate := StrToDateTime(formattedDateTime);
                                                                                                              }
                                                                                                                End;
                                                                            End;

     Showmessage('Выберите сотрудника');
     RetPostForRashod := PostForRashod(DeliveryDate,PostNo);
     if RetPostForRashod.PostNo > 0 then Begin
                                           Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                           Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := RetPostForRashod.SotrudNo;
                                           Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
                                           Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                           Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := RetPostForRashod.OtdelNo;
                                           OtdelNo := RetPostForRashod.OtdelNo;
                                           Dlg.spAddInputOrder.ParamByName('Buh').Value := RetPostForRashod.Buh;
                                           Buh := RetPostForRashod.Buh;
                                           Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := RetPostForRashod.SET_ARTICLE_GROUP;
                                         End
                                    else raise Exception.Create('Необходимо выбрать сотрудника!'+#13#10+
                                                                'Возможно к контрагенту не сопоставлены сотрудники.'+#13#10+
                                                                'Для того чтобы выбрать сопоставте контрагенту сотрудников ');

     quPostArtGroup := TMSQuery.Create(nil);
     quPostArtGroup.Connection:= dmDataModule.DB;
     quPostArtGroup.SQL.Clear;
     quPostArtGroup.SQL.Text:='select distinct lag.ARTICLE_GROUP_ID '+
                              '               ,dag.NAME '+
                              '               ,lag.ARTICLE_ID '+
                              '               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID '+
                              '               ,dsag.NAME '+
                              '               ,lpsagd.POSTNO '+
                              '               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay '+
                              '               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY '+
                              '               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT '+
                              '               ,isnull(lpsagp.POSTNO,0) as POSTNOP '+
                              '               ,isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_price '+
                              '               ,isnull(lpsagp.COLNPRICE,0) as COLNPRICE '+
                              ' from L_ARTICLE_GROUP lag left join '+
                              '      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join '+
                              '      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                              '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join '+
                              '      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = :PostNo and lpsagd.BUH = :Buh left join '+
                              '      L_POST_SET_ARTGROUP_PRICE lpsagp on lsag.SET_ARTICLE_GROUP_ID = lpsagp.SET_ARTICLE_GROUP_ID and lpsagp.POSTNO = :PostNom left join '+
                              '      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '+
                              '  where convert(int,iov.OrderNo) = convert(int,:OrderNo)  '+
                              '    and lsag.SET_ARTICLE_GROUP_ID is not null '+
                              '    and convert(smallint,iov.Article) not in (select TovarNo '+
                              '                                               from e_blanks '+
                              '                                                where Document_id in (select idBlank '+
                              '                                                                       from l_BlankForExite '+
                              '                                                                        where IdExite = convert(bigint,:OrderNom))) '+
                              '    and LEN(cast(isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as varchar(50))+ cast(isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as varchar(50))) > 2'+
                              '    and lpsagd.POSTNO is not null';

     quPostArtGroup.Prepare;
     quPostArtGroup.ParamByName('OrderNo').Value := OrderNo;
     quPostArtGroup.ParamByName('OrderNom').Value := OrderNo;
     quPostArtGroup.ParamByName('PostNo').Value := PostNo;
     quPostArtGroup.ParamByName('PostNom').Value := PostNo;
     quPostArtGroup.ParamByName('Buh').Value := Buh;

     quPostArtGroup.Open;
     quPostArtGroup.First;

     if quPostArtGroup.RecordCount =0 then ShowMessage ('Нет записи в запросе! '+#13#10+
                                                        quPostArtGroup.SQL.Text+#13#10+
                                                        'Обратитесь к программисту');

     while not quPostArtGroup.Eof do
       begin //quPostArtGroup.Eof

         documentID := 0;
//         Komplectacija := 0;
         SArticleGroup := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;

         SArticleGroupDouble := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').AsVariant;

         quCheckOrder :=TMSQuery.Create(nil);
         quCheckOrder.Connection:=dmDataModule.DB;
         quCheckOrder.SQL.Clear;
         quCheckOrder.SQL.Text:='select * '
                               +' from ImportOrderVebTmp ivt '
                               +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                               +'    and convert(smallint,Article) not in (select TovarNo '
                               +'                                                  from e_blanks '
                               +'                                                   where Document_id in (select idBlank '
                               +'                                                                          from l_BlankForExite '
                               +'                                                                           where IdExite = convert(bigint,:OrderNom))) '
                               +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                               +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                               +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                               +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                               +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                               +'    and ivt.KolTov >0 ';

         quCheckOrder.Prepare;
         quCheckOrder.ParamByName('OrderNo').Value := OrderNo;
         quCheckOrder.ParamByName('OrderNom').Value := OrderNo;
         quCheckOrder.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
         quCheckOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;
         quCheckOrder.Open;
         if quCheckOrder.RecordCount > 0 Then isRun := true else isRun := false;
         quCheckOrder.Close;


         Dlg.quPostBan.Close;
         Dlg.quPostBan.Params.ParamByName('p_PostNo').Value := PostNo;
         Dlg.quPostBan.Open;
         Is_PostBan := false;
         Is_PostBanPay := false;

         Dlg.quPostBanPay.Close;
         Dlg.quPostBanPay.Params.ParamByName('PostNo').Value := PostNo;
         Dlg.quPostBanPay.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
         Dlg.quPostBanPay.Params.ParamByName('Buh').Value := Buh;
         Dlg.quPostBanPay.Open;

         Dlg.quControlPayBan.Close;
         Dlg.quControlPayBan.Params.ParamByName('PostNo').Value := PostNo;
         Dlg.quControlPayBan.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
         Dlg.quControlPayBan.Params.ParamByName('Buh').Value := Buh;
         Dlg.quControlPayBan.Params.ParamByName('DateNakl').Value := DeliveryDate;
         Dlg.quControlPayBan.Open;

         Dlg.quSummaDolga.Close;
         Dlg.quSummaDolga.Params.ParamByName('PostNo').Value := PostNo;
         Dlg.quSummaDolga.Params.ParamByName('set_article_group_id').Value := SArticleGroupDouble;
         Dlg.quSummaDolga.Params.ParamByName('Buh').Value := Buh;
         Dlg.quSummaDolga.Open;

         if dlg.quControlPayBan.RecordCount > 0 then Is_ControlPostBanPay := false else Is_ControlPostBanPay := true;

         if ((Dlg.quSummaDolgaSUMMA_ECO.Value > Dlg.quPostBanPayPayBan.Value) and (Dlg.quPostBanPayPayBan.Value <>0)
                                                                                      and (Is_ControlPostBanPay = True)) then
          begin
            DescriptionBanPay := 'Превышен лимит ' +#13#10+ 'Сумма дебиторской задолженности ' + FloatToStr(Dlg.quSummaDolgaSUMMA_ECO.Value) +#13#10+ 'Допустимый лимит '+ FloatToStr(Dlg.quPostBanPayPayBan.Value);
            if is_postBanPay = false then raise Exception.Create(DescriptionBanPay);
            Is_postBanPay := true;
          end;

         if (Dlg.quPostBanPostBan.Value = 1) and (quOrdersTypeNakl.asString = 'Возвратная') then
          begin
            DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
            raise Exception.Create(DescriptionBan);
            Is_PostBan := true;
          end;

         if CheckBlank(PostNo, Dlg.spAddInputOrder.ParamByName('ReasonId').Value, DeliveryDate, OtdelNo, SArticleGroupDouble, ErrMsg) >= 10 then
          begin
            //Не Успешно
            raise Exception.Create(ErrMsg);
          end;

         Dlg.quPostBan.Close;
         Dlg.quPostBanPay.Close;
         Dlg.quSummaDolga.Close;
         Dlg.quControlPayBan.Close;


         Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := SArticleGroup ;
         Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := quPostArtGroup.FieldByName('DAY_DELAY').Value;

         quColnPriceForOrder.ParamByName('OrderNo').Value := OrderNo;
         quColnPriceForOrder.ParamByName('OrderNom').Value := OrderNo;
         quColnPriceForOrder.ParamByName('PostNo').Value := PostNo;
         quColnPriceForOrder.ParamByName('PostNom').Value := PostNo;
         quColnPriceForOrder.ParamByName('Buh').Value := Buh;
         quColnPriceForOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Text;

         quColnPriceForOrder.Open;
         quColnPriceForOrder.First;

         while not quColnPriceForOrder.Eof do
           begin
             if quColnPriceForOrder.FieldByName('COLNPRICE').Value = 0 then quColnPriceForOrder.Next
                                                                       else
                                                                         Begin
                                                                           Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quColnPriceForOrder.FieldByName('COLNPRICE').Value;

                                                                           if ColNPrice <> quColnPriceForOrder.FieldByName('COLNPRICE').Value then begin
                                                                                                                                                     ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                                                                                                                                                     Dlg.spAddInputOrder.ExecProc;
                                                                                                                                                     documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                                                                                                                                                     LdocumentID := documentID;
                                                                                                                                                     //LKomplectacija := Komplectacija;
                                                                                                                                                   end;
                                                                           if documentID = 0 then begin
                                                                                                    documentID := LdocumentID;
                                                                                                    //Komplectacija := LKomplectacija;
                                                                                                  end;

                                                                           quSpecBlank :=TMSQuery.Create(nil);
                                                                           quSpecBlank.Connection:=dmDataModule.DB;
                                                                           quSpecBlank.SQL.Clear;
                                                                           quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                                                                                +'     ,convert(int,KolTov) as KolTov '
                                                                                                +'     ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                                                                                +'     ,convert(numeric(18,2),ltrim(rtrim(KomplectacijaOne))) as  KomplectacijaOne '
                                                                                                +'     ,convert(numeric(18,2),ltrim(rtrim(Komplectacija))) as  Komplectacija '
                                                                                                +' from ImportOrderVebTmp ivt '
                                                                                                +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                                                                                +'    and convert(smallint,Article) not in (select TovarNo '
                                                                                                +'                                                  from e_blanks '
                                                                                                +'                                                   where Document_id in (select idBlank '
                                                                                                +'                                                                          from l_BlankForExite '
                                                                                                +'                                                                           where IdExite = convert(bigint,:OrderNom))) '
                                                                                                +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                                                                                +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                                                                                +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                                                                                +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                                                                                +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                                                                                +'    and ivt.KolTov >0 ';

                                                                           quSpecBlank.Prepare;
                                                                           quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                                                                           quSpecBlank.ParamByName('OrderNom').Value := OrderNo;
                                                                           quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                                                                           quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;

                                                                           quSpecBlank.Open;

                                                                           if quSpecBlank.FieldByName('Komplectacija').Value = 0 then Komplectacija := 0;

                                                                           quSpecBlank.First;

                                                                           CheckOrderForVeb := TMSQuery.Create(nil);
                                                                           CheckOrderForVeb.Connection:= dmDataModule.DB;
                                                                           CheckOrderForVeb.SQL.Clear;
                                                                           CheckOrderForVeb.SQL.Text := 'select * from e_blanks where Document_id = :Document_id';
                                                                           CheckOrderForVeb.ParamByName('Document_id').Value := documentID;
                                                                           CheckOrderForVeb.Open;

                                                                           if (quSpecBlank.RecordCount = 0) and (CheckOrderForVeb.RecordCount = 0) then begin
                                                                                                                                                          quDelInputOrder := TMSQuery.Create(nil);
                                                                                                                                                          quDelInputOrder.Connection:=dmDataModule.DB;
                                                                                                                                                          quDelInputOrder.SQL.Clear;
                                                                                                                                                          quDelInputOrder.SQL.Text:= 'delete e_blank_head '+
                                                                                                                                                                                     ' where id = :id';
                                                                                                                                                          quDelInputOrder.Prepare;
                                                                                                                                                          quDelInputOrder.ParamByName('id').Value := documentID;
                                                                                                                                                          quDelInputOrder.Execute;
                                                                                                                                                          quSpecBlank.Close;
                                                                                                                                                        end;
                                                                           CheckOrderForVeb.Close;

                                                                           while not quSpecBlank.Eof do
                                                                             begin
                                                                               Dlg3 := TMlekoBlankSpecForm.Create(Application);

                                                                               if (quSpecBlank.FieldByName('KomplectacijaOne').Value > 0) and not (quOrdersTypeNakl.asString = 'Возвратная') then
                                                                                begin
                                                                                  Komplectacija :=  Komplectacija + quSpecBlank.FieldByName('KomplectacijaOne').Value;
                                                                                  Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                                  Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value :=  10815; // !!!!!!! Артикул "Услуга комплектации" проставлен хардкодом из-за не определенности с выбором
                                                                                  Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                                  Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := 1;
                                                                                  Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := 1;
                                                                                  Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := Komplectacija;
                                                                                  Dlg3.spEditBlankPosition.ExecProc;
                                                                                end;

                                                                               Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
                                                                               Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                                                               Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
                                                                               Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := quSpecBlank.FieldByName('KolTov').Value;
                                                                               Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := quSpecBlank.FieldByName('KolTov').Value;

                                                                               if ColNPrice = 0 Then Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quSpecBlank.FieldByName('PriceTov').Value
                                                                                                Else Begin
                                                                                                       quPrice :=TMSQuery.Create(nil);
                                                                                                       quPrice.Connection:=dmDataModule.DB;
                                                                                                       quPrice.SQL.Clear;
                                                                                                       quPrice.SQL.Text:= 'select isnull(case when :ColnPrice = 1 then Isnull(Price,0) '
                                                                                                                         +'                   when :ColnPrice = 2 then Isnull(Price1,0) '
                                                                                                                         +'                   when :ColnPrice = 3 then Isnull(Price2,0) '
                                                                                                                         +'                   when :ColnPrice = 4 then Isnull(Price3,0) '
                                                                                                                         +'                   when :ColnPrice = 5 then Isnull(Price4,0) '
                                                                                                                         +'                   when :ColnPrice = 6 then Isnull(Price5,0) '
                                                                                                                         +'                   when :ColnPrice = 7 then Isnull(Price6,0) '
                                                                                                                         +'                   when :ColnPrice = 8 then Isnull(Price7,0) '
                                                                                                                         +'                   when :ColnPrice = 10 then Isnull(Price8,0) '
                                                                                                                         +'                   when :ColnPrice = 11 then Isnull(Price9,0) '
                                                                                                                         +'                   when :ColnPrice = 12 then Isnull(Price10,0) '
                                                                                                                         +'                   when :ColnPrice = 13 then Isnull(Price13,0) '
                                                                                                                         +'                   when :ColnPrice = 14 then Isnull(Price14,0) '
                                                                                                                         +'                   when :ColnPrice = 15 then Isnull(Price15,0) '
                                                                                                                         +'                   when :ColnPrice = 9 then Isnull(AvgPriceIn,0) '
                                                                                                                         +'                   when :ColnPrice = 17 then Isnull(pfv.PriceVeb, 0) '
                                                                                                                         +'                   when :ColnPrice = 18 then Isnull(pfv.PriceInInst, 0) '
                                                                                                                         +'              end,0) as Price '
                                                                                                                         +' from Ostatok o '
                                                                                                                         +'     ,PriceForVeb pfv '
                                                                                                                         +'  where o.TovarNo = :TovarNo '
                                                                                                                         +'    and o.TovarNo = pfv.TovarNo';
                                                                                                       quPrice.Prepare;
                                                                                                       quPrice.ParamByName('TovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                                                                                       quPrice.ParamByName('ColnPrice').Value := ColNPrice;
                                                                                                       quPrice.Open;
                                                                                                       if ((quPrice.FieldByName('Price').Value = 0) or (quPrice.FieldByName('Price').Value = Null)) then begin
                                                                                                                                                                                                           ErrMsg := 'Не расцененный товар!' +#13#10+
                                                                                                                                                                                                                     'Создание заказа остановлено! Сообщите программисту!' +#13#10+
                                                                                                                                                                                                                     'Код товара ' + quSpecBlank.FieldByName('Article').AsString +#13#10+
                                                                                                                                                                                                                     'Номер заказа на сайте '+ IntToStr(OrderNo);
                                                                                                                                                                                                           raise Exception.Create(ErrMsg);
                                                                                                                                                                                                         end;

                                                                                                       Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quPrice.FieldByName('Price').Value;
                                                                                                       quPrice.Close;
                                                                                                     End;
                                                                               Dlg3.spEditBlankPosition.ExecProc;
                                                                               Dlg3.Free;
                                                                               quSpecBlank.Next;

                                                                             end;


                                                                           quColnPriceForOrder.Next
                                                                         End;
           end;
         quColnPriceForOrder.Close;

         CheckOrderForVeb := TMSQuery.Create(nil);
         CheckOrderForVeb.Connection:= dmDataModule.DB;
         CheckOrderForVeb.SQL.Clear;
         CheckOrderForVeb.SQL.Text := 'select * from l_BlankForExite where IdExite = :IdExite and IdBlank = :IdBlank';
         CheckOrderForVeb.ParamByName('IdExite').Value := OrderNo;
         CheckOrderForVeb.ParamByName('IdBlank').Value := documentID;
         CheckOrderForVeb.Open;
         if CheckOrderForVeb.RecordCount > 0 then isRun := false;

         quInsInl_BlankForExite :=TMSQuery.Create(nil);
         quInsInl_BlankForExite.Connection:=dmDataModule.DB;
         quInsInl_BlankForExite.SQL.Clear;
         quInsInl_BlankForExite.SQL.Text:='insert into l_BlankForExite (IdExite,IdBlank) '
                                       +'     values (:IdExite,:IdBlank)';
         quInsInl_BlankForExite.ParamByName('IdExite').Value := OrderNo;
         quInsInl_BlankForExite.ParamByName('idBlank').Value := documentID;
         if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                    quInsInl_BlankForExite.Execute;
                                                                    if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                                                                                         Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                                                                                                         Dlg.spModifyLinkBlankReturn.Execute;
                                                                                                                       end;
                                                                    Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                  end
                                                             else begin
                                                                    if documentID > 0 then Showmessage ('Заказ document_id = '+ IntToStr(documentID)+ ' дополнен');
                                                                  end;
         quInsInl_BlankForExite.Close;
         quPostArtGroup.Next;
       end;//quPostArtGroup.Eof
       quPostArtGroup.Close;
   end; // 5

   quOrderSumma := TMSQuery.Create(nil);
   quOrderSumma.Connection := dmDataModule.DB;
   quOrderSumma.SQL.Clear;
   quOrderSumma.SQL.Text := 'select distinct convert(decimal(18,2),OrderSumma) as OrderSumma '
                           +'from ImportOrderVebTmp '
                           +' where OrderNo = :OrderNo';
   quOrderSumma.ParamByName('OrderNo').Value := OrderNo;
   quOrderSumma.Open;

   quSummaBlanksHead := TMSQuery.Create(nil);
   quSummaBlanksHead.Connection := dmDataModule.DB;
   quSummaBlanksHead.SQL.Clear;
   quSummaBlanksHead.SQL.Text := 'select sum(summa) as SummaBlanks '
                                +' from e_blank_head '
                                +'  where ID in (select idBlank '
                                +'                from l_BlankForVeb '
                                +'         				 where IdVeb = :OrderNo) ';
   quSummaBlanksHead.ParamByName('OrderNo').Value := OrderNo;
   quSummaBlanksHead.Open;

   quListBlanksDocId := TMSQuery.Create(nil);
   quListBlanksDocId.Connection := dmDataModule.DB;
   quListBlanksDocId.SQL.Clear;
   quListBlanksDocId.SQL.Text := 'select id as Id '
                                +' from e_blank_head '
                                +'  where ID in (select idBlank '
                                +'                from l_BlankForVeb '
                                +'		        		 where IdVeb = :OrderNo) ';
   quListBlanksDocId.ParamByName('OrderNo').Value := OrderNo;
   quListBlanksDocId.Open;
   quListBlanksDocId.First;

   quListTovarNo := TMSQuery.Create(nil);
   quListTovarNo.Connection :=  dmDataModule.DB;
   quListTovarNo.SQL.Clear;
   quListTovarNo.SQL.Text := 'select Article + '' '' + NameTov as ListTovarNo '
                            +' from ImportOrderVebTmp '
                            +'  where Article not in (select convert(smallint,TovarNo) as TovarNo '
                            +'                         from e_blanks '
                            +'                          where Document_id in (select idBlank '
                            +'                                                 from l_BlankForVeb '
                            +'                                                  where IdVeb = :OrderNo))'
                            +'    and OrderNo = :OrderNo1 ';

    quListTovarNo.ParamByName('OrderNo').Value := OrderNo;
    quListTovarNo.ParamByName('OrderNo1').Value := OrderNo;
    quListTovarNo.Open;
    quListTovarNo.First;



   if (quListBlanksDocId.RecordCount = 1) then
                                          begin
                                            ListDocumentId := quListBlanksDocId.FieldByName('Id').AsString;
                                            while not quListTovarNo.Eof do
                                             begin
                                               ListTovarNotBlanks := ListTovarNotBlanks +#13#10+ quListTovarNo.FieldByName('ListTovarNo').AsString;
                                               quListTovarNo.Next;
                                             end;
                                          end
                                          else begin
                                                while not quListBlanksDocId.Eof do
                                                 begin
                                                   ListDocumentId := ListDocumentId + ', ' + quListBlanksDocId.FieldByName('Id').AsString;
                                                   quListBlanksDocId.Next;
                                                 end;
                                                while not quListTovarNo.Eof do
                                                 begin
                                                   ListTovarNotBlanks := ListTovarNotBlanks +#13#10+ quListTovarNo.FieldByName('ListTovarNo').AsString;
                                                   quListTovarNo.Next;
                                                 end;
                                                end;


   if quOrderSumma.FieldByName('OrderSumma').AsFloat <> quSummaBlanksHead.FieldByName('SummaBlanks').AsFloat then
    begin
      ShowMessage('Внимание!!!' +#13#10+
                  'Сумма заказа на сайте не совпадает с суммой заказов в базе!' +#13#10+
                  'Сумма заказа на сайте: '+ quOrderSumma.FieldByName('OrderSumma').AsString +#13#10+
                  'Сумма заказов в базе: ' + quSummaBlanksHead.FieldByName('SummaBlanks').AsString +#13#10+
                  'Проверте заказ на сайте!' +#13#10+
                  'Номер заказа на сайте ' +  inttostr(OrderNo) +#13#10+
                  'Список заказов в базе: ' +#13#10+ ListDocumentId);
      ShowMessage('Список товаров не распределенных в базу с сайта:' +#13#10+ ListTovarNotBlanks);
    end;

   quSummaBlanksHead.Close;
   quOrderSumma.Close;
   quListBlanksDocId.Close;
   quListTovarNo.Close;
   quOrders.Refresh;
   DBGridEhOrders.Refresh;
   Dlg.Free;
end;

procedure TMlekoBlankListOutSideForm.SetPostNo(const Value: Int64);
begin
  if FPostNo <> Value then FPostNo := Value;
end;


procedure TMlekoBlankListOutSideForm.Button1Click(Sender: TObject);
begin
  inherited;
  begin
      with TVidTovForExportPriceForm.Create(Application) do
        try
          qu_VidTovForExportPrice.Open;

          ShowModal;
        finally
          qu_VidTovForExportPrice.Close;
          Free;
        end;
  end;
end;

end.
