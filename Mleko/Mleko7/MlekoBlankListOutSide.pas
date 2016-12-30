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
    dtDateDelivery: TDateTimePicker;
    LbMessage: TLabel;
    quSpecBlank: TMSQuery;
    quColnPriceForOrder: TMSQuery;
    quColnPriceForOrderSET_ARTICLE_GROUP_ID_price: TLargeintField;
    quColnPriceForOrderCOLNPRICE: TSmallintField;
    SpCheckBlank: TMSStoredProc;
    cb_SelecttedVid: TCheckBox;
    Button1: TButton;
    spEditBlankPosition: TMSStoredProc;
    quOrdersOrderNo: TIntegerField;
    quOrdersOrderDate: TDateTimeField;
    quOrdersStateBlank: TIntegerField;
    quOrdersCntBlanks: TIntegerField;
    quOrdersCntDelBlanks: TIntegerField;
    quOrdersBlankSumma: TFloatField;
    quOrdersIdBlank: TIntegerField;
    quOrdersIsDelOrderBlank: TIntegerField;
    quOrdersOrderSumma: TFloatField;
    quOrdersState: TStringField;
    quOrdersIsPay: TStringField;
    quOrdersBuh: TStringField;
    quOrdersTypeNakl: TStringField;
    quOrdersNoClient: TIntegerField;
    quOrdersNameClient: TStringField;
    quOrdersNoContractor: TIntegerField;
    quOrdersNameContractor: TStringField;
    quOrdersNoAdress: TIntegerField;
    quOrdersAdress: TStringField;
    quOrdersDateDelivery: TDateTimeField;
    quOrdersTimeDelivery: TStringField;
    quOrdersTelephon: TStringField;
    quOrdersEmail: TStringField;
    quOrdersGroupClient: TStringField;
    quOrdersGroupClientName: TStringField;
    quOrdersRealOrderSumma: TFloatField;
    quOrdersKomplectacija: TFloatField;
    quOrdersDescriptionFromOrders: TStringField;
    quOrdersDescriptionFromManager: TStringField;
    quPost1: TMSQuery;
    Button2: TButton;
    quTempTableForCreateBlank: TMSQuery;
    Button3: TButton;
    Button4: TButton;
    quOrdersTimeCreate: TFloatField;
    quOrdersTypeReturn: TStringField;
    procedure btExportPriceClick(Sender: TObject);
    procedure BtImportOrdersClick(Sender: TObject);
    procedure DBGridEhOrdersDblClick(Sender: TObject);
    procedure DBGridEhOrdersKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtCreateOrderClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEhOrdersDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure DBGridEhOrdersDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure DBGridEhOrdersTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    FPostNo: Int64;
    function CheckBlank(pPostno, pReason_id: Integer; pDateNakl: TDate;
      pOtdelNo: Integer; SET_ARTICLE_GROUP_ID: Int64; var err_message: string): Integer;
    procedure SetPostNo(const Value: Int64);
    procedure DelBlankHead (DocumentId : integer);
    procedure InsInBlankForVeb(OrderNo, DocumentId : integer);
    procedure AddTovarInBlanks (DocumentId, TovarNo, UserNo, ColNPrice : integer; KolBeg, KolOrd, Boss_Price, Residue, Need : double);
    { Private declarations }
  public
    property PostNo: Int64 read FPostNo write SetPostNo;
    { Public declarations }
  end;

var
  MlekoBlankListOutSideForm: TMlekoBlankListOutSideForm;

implementation

uses data, MlekoBlankSpecOutSide, MlekoBlankParam, MlekoSelectFirmForBlank,
     PostForRashod0, main, MlekoBlankSpec, ShellApi, TypeReturn, VidTovForExportPrice,
     MlekoBlankList, TempTableForCreateBlank;

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
  Dlg3:TMlekoBlankListForm;
  Dlg4:TTypeReturnForm;
  Dlg5:TTempTableForCreateBlankForm;
//  Dlg5:TfmPostForRashod;
  RetPostForRashod: TRetPostForRashod;
  formattedDateTime : String;
  DeliveryDate : TDateTime;
  DateNakl : TDateTime;
  OrderDate : TDateTime;
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
  quDocum : TMSQuery;
  quSumDocum : TMSQuery;
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
  SArticleGroupDoublePred : Int64;
  ArticleGroupDouble : Int64;
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
  Residue, Need : Double;
  ListDocumentId : String;
  ListTovarNotBlanks : String;
  SumDoc : Double;
  cnt : integer;
  CountTovarNotBlanks : integer;
  isChangeSArticleGroupDoublePred : boolean;
  TimeNow, Time : TTime;
  C1, C2: TLargeInteger;
  iCounterPerSec: TLargeInteger;
  DescriptionErrorForOpt : String;

  CreateOrderTime : TTime;
  is_NotCreate : Boolean;
  VidNo : integer;

begin
  inherited;

  Dlg := TMlekoBlankParamForm.Create(Application);

  is_NotCreate := False;

  ColNPrice := 0;
  ColNPrice1 := 0;

  Is_KomplectacijaRun := true;

  Komplectacija := 0;

  DescriptionErrorForOpt := '';

  OrderNo := quOrders.FieldByName('OrderNo').Value;
  OrderDate := quOrders.FieldByName('OrderDate').Value;

  CheckOrderForVeb := TMSQuery.Create(nil);
  CheckOrderForVeb.Connection:= dmDataModule.DB;
  CheckOrderForVeb.SQL.Clear;
  CheckOrderForVeb.SQL.Text := 'select * from l_BlankForVeb where IdVeb = :IdVeb';
  CheckOrderForVeb.ParamByName('IdVeb').Value := OrderNo;
  CheckOrderForVeb.Open;
  if CheckOrderForVeb.RecordCount <> 0 then
   if (quOrdersCntBlanks.Value mod quOrdersCntDelBlanks.Value) > 0 then  raise Exception.Create(' Этот заказ уже создавался!'+ #10#13 +
                                                                                                'Для повторного создания заказа, '+ #10#13 +
                                                                                                'необходимо удалить все созданные заказы '+ #10#13 +
                                                                                                'в журнале заказов!');
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

  Dlg.spAddInputOrder.ParamByName('IsVeb').Value := 1;

  Dlg.quOurFirm.Open;
  Dlg.spAddInputOrder.ParamByName('OurFirmNo').Value := Dlg.quOurFirm.FieldByName('PostNo').AsInteger;
  Dlg.quOurFirm.Close;

  if (quOrdersTypeNakl.asString = 'Товарная') then Dlg.spAddInputOrder.ParamByName('VidNaklNo').Value := 1
                                              Else Dlg.spAddInputOrder.ParamByName('VidNaklNo').Value := 3;

  if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                       if quOrdersTypeReturn.Value = '0' then begin
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
                                                                                              end
                                                                                         else  Dlg.spModifyLinkBlankReturn.ParamByName('TypeReturnNo').Value := quOrdersTypeReturn.AsInteger;
                                                     end
                                                else TypeReturnNo := 0;


  Dlg.spAddInputOrder.ParamByName('descriptionOrderVeb').Value := quOrdersDescriptionFromManager.Value;

  if quOrders.FieldByName('GroupClient').Value = 1 Then
   begin // 1

//     dmDataModule.OpenSQL('select distinct DATEDIFF (hour, CreateDate , getdate()) as CheckOwerTime from TempTableForCreateBlank');

     dmDataModule.OpenSQL('select distinct case when dateadd(hour,1,CreateDate) < getdate() then 1 else 0 end as CheckOwerTime from TempTableForCreateBlank');

     if dmDataModule.QFO.FieldByName('CheckOwerTime').Value >= 1 then raise Exception.Create(' С момента создания таблицы для создания заказов, прошло более одного часа!' +#13#10+
                                                                                             'Пересоздайте таблицу для создания заказов и повторите попытку!');




     QueryPerformanceFrequency(iCounterPerSec);
     QueryPerformanceCounter(C1);


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
                                                                                                                End;
                                                                            End;

     ShowMessage('Необходимо выбрать Контрагента, сотрудника и адрес из списка');
     Dlg5 := TTempTableForCreateBlankForm.Create(Application);
     try
      Dlg5.quTempTableForCreateBlank.Close;
      Dlg5.quTempTableForCreateBlank.ParamByName('PostNo').Value := quOrdersNoContractor.Value;
      Dlg5.quTempTableForCreateBlank.Open;
     if Dlg5.ShowModal = mrok Then
      begin
        Dlg.spAddInputOrder.ParamByName('PostNo').Value := Dlg5.quTempTableForCreateBlankpostno.Value;
        PostNo := Dlg5.quTempTableForCreateBlankpostno.Value;

        Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
        Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := Dlg5.quTempTableForCreateBlankSotrudNo.Value;
        Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
        Dlg.spAddInputOrder.ParamByName('AddressNo').Value := Dlg5.quTempTableForCreateBlankAddressNo.Value;
        Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := Dlg5.quTempTableForCreateBlankOtdelNo.Value;
        OtdelNo := Dlg5.quTempTableForCreateBlankOtdelNo.Value;
        Dlg.spAddInputOrder.ParamByName('Buh').Value := Dlg5.quTempTableForCreateBlankBuh.Value;
        Buh := Dlg5.quTempTableForCreateBlankBuh.Value;
        Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := Dlg5.quTempTableForCreateBlankSet_Article_Group_id.Value;
       end
                              Else
       begin
         raise Exception.Create(' Необходимо выбрать соответствующую запись!'+#13#10+
                                'Без выбора записи заказ создан не будет!'+#13#10+
                                'Возможно к контрагенту не сопоставлены сотрудники.'+#13#10+
                                'Для того чтобы выбрать сопоставте контрагенту сотрудников ');
       end;
     finally
      Dlg5.quTempTableForCreateBlank.Close;
      Dlg5.Free;
     end;

     if (quOrders.FieldByName('NoContractor').AsInteger <> PostNo) Then raise Exception.Create('Номер контрагента не совпадает с номером в заказе!'+#13#10+
                                                                                               'Заказ создан не будет!'+#13#10+
                                                                                               'Заказ создавался на '+quOrders.FieldByName('NameContractor').AsString+#13#10+
                                                                                               'с номером '+quOrders.FieldByName('NoContractor').AsString+#13#10+
                                                                                               'Если такого контрагента нет в списке создайте его или проверте правильность номера на сайте.');

     Dlg.quContract.Close;
     Dlg.quContract.ParamByName('p_PostNo').Value := PostNo;
     Dlg.quContract.Open;
     Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg.quContract.FieldByName('id').Value;
     Dlg.quContract.Close;

     quPostArtGroup := TMSQuery.Create(nil);
     quPostArtGroup.Connection:= dmDataModule.DB;
     quPostArtGroup.SQL.Clear;
     quPostArtGroup.SQL.Text:='select distinct lag.ARTICLE_GROUP_ID '+
                              '               ,dag.NAME '+
                              '               ,lag.ARTICLE_ID '+
                              '               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID '+
                              '               ,dsag.NAME as Set_Article_Group_Name '+
                              '               ,lpsagd.POSTNO '+
                              '               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay '+
                              '               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY '+
                              '               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT '+
                              '               ,(select distinct COLNPRICE '+
                              '                  from L_SET_ARTICLE_GROUP lsag left join '+
                              '                       L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                              '                       L_POST_SET_ARTGROUP_PRICE lpsap on lpsap.SET_ARTICLE_GROUP_ID = lsag.SET_ARTICLE_GROUP_ID and POSTNO = :PostNom '+
                              '                   where COLNPRICE is not null '+
                              '                     and ARTICLE_ID = iov.Article '+
                              '	                    and ACTIVE = ''Y'') as ColNPrice '+
                              ' from L_ARTICLE_GROUP lag left join '+
                              '      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join '+
                              '      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                              '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join '+
                              '      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = :PostNo and lpsagd.BUH = :Buh left join '+
                              '      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '+
                              '  where convert(int,iov.OrderNo) = convert(int,:OrderNo)  '+
                              '    and lsag.SET_ARTICLE_GROUP_ID is not null '+
                              '    and convert(smallint,iov.Article) not in (select TovarNo '+
                              '                                               from e_blanks '+
                              '                                                where Document_id in (select idBlank '+
                              '                                                                       from l_BlankForVeb '+
                              '                                                                        where IdVeb = convert(bigint,:OrderNom) '+
                              '                                                                          and idBlank not in (select id '+
                              '                                     																		                      from e_blank_head '+
                              '                                               																							   where Status = -1))) '+
                              '    and lpsagd.POSTNO is not null '+
                              'order by lpsagd.DAY_DELAY, ColNPrice ';
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

         SArticleGroup := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;

         SArticleGroupDouble := quPostArtGroup.FieldByName('DAY_DELAY').AsVariant; //quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').AsVariant;
         ArticleGroupDouble := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').AsVariant;

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
                               +'                                                                           where IdVeb = convert(bigint,:OrderNom) '
                               +'                                                                             and idBlank not in (select id '
                               +'                                     																		                      from e_blank_head '
                               +'                                               																							   where Status = -1))) '
                               +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                               +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                               +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                               +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                               +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                               +'    and (convert(decimal(18,3),ivt.KolTov) > 0 ) ';
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

         if (Dlg.quPostBanPostBan.Value = 1) and (quOrdersTypeNakl.asString = 'Возвратная') then
          begin
            DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
            raise Exception.Create(DescriptionBan);
            Is_PostBan := true;
          end;

         Dlg.quPostBan.Close;

         if CheckBlank(PostNo, Dlg.spAddInputOrder.ParamByName('ReasonId').Value, DeliveryDate, OtdelNo, SArticleGroupDouble, ErrMsg) >= 10 then
          begin
            //Не Успешно
            raise Exception.Create(ErrMsg);
          end;

         Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := SArticleGroup ;
         Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := quPostArtGroup.FieldByName('DAY_DELAY').Value; // + quPostArtGroup.FieldByName('DAY_DELAY_EXT').Value;

         quColnPriceForOrder.ParamByName('OrderNo').Value := OrderNo;
         quColnPriceForOrder.ParamByName('OrderNom').Value := OrderNo;
         quColnPriceForOrder.ParamByName('PostNo').Value := PostNo;
         quColnPriceForOrder.ParamByName('PostNom').Value := PostNo;
         quColnPriceForOrder.ParamByName('Buh').Value := Buh;
         quColnPriceForOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Text;

         quColnPriceForOrder.Open;

         if quColnPriceForOrder.RecordCount > 0 then isChangeSArticleGroupDoublePred := true
                                                else isChangeSArticleGroupDoublePred := false;

         quColnPriceForOrder.First;

         while not quColnPriceForOrder.Eof do
          begin
            if quColnPriceForOrder.FieldByName('COLNPRICE').Value > 0
             then Begin
                    Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                    if (ColNPrice <> quColnPriceForOrder.FieldByName('COLNPRICE').Value)
                    or (SArticleGroupDoublePred <> SArticleGroupDouble)
                     then begin
                            ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                            Dlg.spAddInputOrder.ExecProc;
                            documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                            LdocumentID := documentID;
                          end;

                    if documentID = 0 then begin
                                             documentID := LdocumentID;
                                           end;

                    quSpecBlank :=TMSQuery.Create(nil);
                    quSpecBlank.Connection:=dmDataModule.DB;
                    quSpecBlank.SQL.Clear;
                    quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                         +'      ,convert(decimal(18,3),ivt.KolTov) as KolTov '
                                         +'      ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                         +'     ,convert(numeric(18,2),ltrim(rtrim(KomplectacijaOne))) as  KomplectacijaOne '
                                         +'     ,convert(numeric(18,2),ltrim(rtrim(Komplectacija))) as  Komplectacija '
                                         +'     ,convert(numeric(18,2),ltrim(rtrim(Residue))) as Residue '
                                         +'     ,convert(numeric(18,2),ltrim(rtrim(Need))) as Need '
                                         +' from ImportOrderVebTmp ivt '
                                         +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                         +'    and convert(smallint,Article) not in (select TovarNo '
                                         +'                                                  from e_blanks '
                                         +'                                                   where Document_id in (select idBlank '
                                         +'                                                                          from l_BlankForVeb '
                                         +'                                                                           where IdVeb = convert(bigint,:OrderNom) '
                                         +'                                                                             and idBlank not in (select id '
                                         +'																		                                                               from e_blank_head '
                                         +'																							                                                      where Status = -1))) '
                                         +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                         +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                         +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                         +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                         +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                         +'    and convert(decimal(18,3),ivt.KolTov) > 0 ';
                    quSpecBlank.Prepare;
                    quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                    quSpecBlank.ParamByName('OrderNom').Value := OrderNo;
                    quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                    quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := ArticleGroupDouble;

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

                    Residue := quSpecBlank.FieldByName('Residue').AsFloat;
                    Need := quSpecBlank.FieldByName('Need').AsFloat;

                    if (quSpecBlank.RecordCount = 0) and (CheckOrderForVeb.RecordCount = 0) then begin
                                                                                                   DelBlankHead (documentId);
                                                                                                   quSpecBlank.Close;
                                                                                                 end;
                    CheckOrderForVeb.Close;
                    while not quSpecBlank.Eof do
                     begin
                       if (quSpecBlank.FieldByName('KomplectacijaOne').Value > 0) and not (quOrdersTypeNakl.asString = 'Возвратная')
                        then begin
                               Komplectacija :=  Komplectacija + quSpecBlank.FieldByName('KomplectacijaOne').Value;
                               AddTovarInBlanks(DocumentId, 10815, data.UserNo, -1, 1, 1, Komplectacija, Residue, Need);
                             end;

                       AddTovarInBlanks(documentID,quSpecBlank.FieldByName('Article').Value,data.UserNo,ColNPrice,quSpecBlank.FieldByName('KolTov').Value,quSpecBlank.FieldByName('KolTov').Value,0, Residue, Need);

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

                     if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                                InsInBlankForVeb(OrderNo, DocumentId);
                                                                                if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                                                                                                     Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                                                                                                                     Dlg.spModifyLinkBlankReturn.Execute;
                                                                                                                                   end;
                                                                                Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                              end
                                                                         else begin
                                                                                if documentID > 0 then Showmessage ('Заказ document_id = '+ IntToStr(documentID)+ ' дополнен');
                                                                              end;
                  End;
            quColnPriceForOrder.Next;
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

         if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                    InsInBlankForVeb(OrderNo, documentId);
                                                                    if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                                                                                         Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                                                                                                         Dlg.spModifyLinkBlankReturn.Execute;
                                                                                                                       end;
                                                                    Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                  end
                                                             else begin
                                                                    if documentID > 0 then Showmessage ('Заказ document_id = '+ IntToStr(documentID)+ ' дополнен');
                                                                  end;
         if isChangeSArticleGroupDoublePred = true then SArticleGroupDoublePred := SArticleGroupDouble;
         quPostArtGroup.Next;
       end;//quPostArtGroup.Eof
       quPostArtGroup.Close;

     QueryPerformanceCounter(C2);

//     CreateOrderTime := StrToFloat(FormatFloat('0.000', ((C2 - C1) / (iCounterPerSec))));
     CreateOrderTime := StrToFloat(FormatFloat('0', ((C2 - C1) / (iCounterPerSec))));

     dmDataModule.ExecSQL('declare @cnt int select @cnt = count(*) from CreateBlancWithSite where OrderVeb = :p1_OrderVeb if @cnt = 0 insert into CreateBlancWithSite (OrderVeb, TimeCreate)  values (:p2_OrderVeb, convert(decimal(5,3),:p3_TimeCreate))', [OrderNo,OrderNo,CreateOrderTime]);

     ShowMessage(' Внешний заказ создавался:'+#13#10+
                 ' По рознице' +#13#10+
                 FormatFloat('0', ((C2 - C1) / (iCounterPerSec))) + ' сек.');

   end; // 1

   if (quOrders.FieldByName('GroupClient').Value = 2) or (quOrders.FieldByName('GroupClient').Value = 3) Then
   begin // 2,3

     dmDataModule.OpenSQL('select distinct case when dateadd(hour,1,CreateDate) < getdate() then 1 else 0 end as CheckOwerTime from TempTableForCreateBlank');

     if dmDataModule.QFO.FieldByName('CheckOwerTime').Value >= 1 then raise Exception.Create(' С момента создания таблицы для создания заказов, прошло более одного часа!' +#13#10+
                                                                                             'Пересоздайте таблицу для создания заказов и повторите попытку!');

     QueryPerformanceFrequency(iCounterPerSec);
     QueryPerformanceCounter(C1);

// Новый алгоритм создания шапки заказа

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
                                                                                                                End;
                                                                            End;

      if quOrders.FieldByName('NoContractor').AsInteger  = 0 then DescriptionErrorForOpt := ' Не указан код контрагента на сайте!'+ #10#13 +
                                                                                            'Задайте номер контрагента ' + quOrders.FieldByName('NameContractor').Value + ' на сайте!';
      if quOrders.FieldByName('NoClient').Value = 0 then DescriptionErrorForOpt := DescriptionErrorForOpt + #10#13 +
                                                                                   ' Не указан сотрудник на сайте!';
      if quOrders.FieldByName('NoAdress').Value = 0 then DescriptionErrorForOpt := DescriptionErrorForOpt + #10#13 +
                                                                                   ' На сайте не указан номер адреса!'+#13#10+
                                                                                   'Установите номер адреса на сайте что бы это сообщение не появлялось в дальнейшем';
      if DescriptionErrorForOpt <> '' then begin
                                             ShowMessage(DescriptionErrorForOpt+ #10#13 +'Необходимо выбрать Контрагента, сотрудника и адрес из списка');
                                             Dlg5 := TTempTableForCreateBlankForm.Create(Application);
                                             try
                                              Dlg5.quTempTableForCreateBlank.Close;
                                              if (quOrders.FieldByName('NoContractor').AsInteger  <> 0) then Dlg5.quTempTableForCreateBlank.ParamByName('PostNo').Value := quOrdersNoContractor.Value;
                                              Dlg5.quTempTableForCreateBlank.ParamByName('Buh').Value := Buh;
                                              if (quOrders.FieldByName('NoAdress').Value <> 0) then Dlg5.quTempTableForCreateBlank.ParamByName('AddressPost_ID').Value := quOrdersNoAdress.Value;
                                              if (quOrders.FieldByName('NoClient').Value <> 0) then Dlg5.quTempTableForCreateBlank.ParamByName('SOtrudNo').Value := quOrders.FieldByName('NoClient').Value;
                                              Dlg5.quTempTableForCreateBlank.Open;
                                              if Dlg5.ShowModal = mrok Then begin
                                                                              Dlg.spAddInputOrder.ParamByName('PostNo').Value := Dlg5.quTempTableForCreateBlankpostno.Value;
                                                                              PostNo := Dlg5.quTempTableForCreateBlankpostno.Value;

                                                                              Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                                                              Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := Dlg5.quTempTableForCreateBlankSotrudNo.Value;
                                                                              Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
                                                                              Dlg.spAddInputOrder.ParamByName('AddressNo').Value := Dlg5.quTempTableForCreateBlankAddressNo.Value;
                                                                              Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := Dlg5.quTempTableForCreateBlankOtdelNo.Value;
                                                                              OtdelNo := Dlg5.quTempTableForCreateBlankOtdelNo.Value;
                                                                              Dlg.spAddInputOrder.ParamByName('Buh').Value := Dlg5.quTempTableForCreateBlankBuh.Value;
                                                                              Buh := Dlg5.quTempTableForCreateBlankBuh.Value;
                                                                              Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg5.quTempTableForCreateBlankD_Firm_Contract_id.Value;
                                                                            end
                                                                       Else begin
                                                                              raise Exception.Create(' Необходимо выбрать соответствующую запись!'+#13#10+
                                                                                                     'Без выбора записи заказ создан не будет!'+#13#10+
                                                                                                     'Возможно к контрагенту не сопоставлены сотрудники.'+#13#10+
                                                                                                     'Для того чтобы выбрать сопоставте контрагенту сотрудников ');
                                                                            end;
                                             finally
                                              Dlg5.quTempTableForCreateBlank.Close;
                                              Dlg5.Free;
                                             end;
                                             if (quOrders.FieldByName('NoContractor').AsInteger <> PostNo) Then raise Exception.Create(' Номер контрагента не совпадает с номером в заказе!'+#13#10+
                                                                                                                                       'Заказ создан не будет!'+#13#10+
                                                                                                                                       'Заказ создавался на '+quOrders.FieldByName('NameContractor').AsString+#13#10+
                                                                                                                                       'с номером '+quOrders.FieldByName('NoContractor').AsString+#13#10+
                                                                                                                                       'Если такого контрагента нет в списке создайте его или проверте правильность номера на сайте.');
                                           end
                                      else begin
                                             Dlg.spAddInputOrder.ParamByName('PostNo').Value := quOrders.FieldByName('NoContractor').AsInteger;
                                             PostNo := quOrders.FieldByName('NoContractor').AsInteger;

                                             Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                             Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := quOrders.FieldByName('NoClient').Value;
                                             Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;

                                             quSotrudOtdel:=TMSQuery.Create(nil);
                                             quSotrudOtdel.Connection:=dmDataModule.DB;
                                             quSotrudOtdel.SQL.Clear;
                                             quSotrudOtdel.SQL.Text:='select SotrudOtdel from Sotrud where SotrudNo = :SotrudNo';
                                             quSotrudOtdel.Prepare;
                                             quSotrudOtdel.ParamByName('SotrudNo').Value := quOrders.FieldByName('NoClient').Value;
                                             quSotrudOtdel.Open;
                                             Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := quSotrudOtdel.FieldByName('SotrudOtdel').Value;
                                             OtdelNo := quSotrudOtdel.FieldByName('SotrudOtdel').Value;
                                             quSotrudOtdel.Close;

                                             dmDataModule.OpenSQL('select AddressNo from AddressPost where id = :p1_id',[quOrdersNoAdress.Value]);

                                             Dlg.spAddInputOrder.ParamByName('AddressNo').Value := dmDataModule.QFO.FieldByName('AddressNo').Value;

                                             Dlg.spAddInputOrder.ParamByName('Buh').Value := Buh;

                                             Dlg.quContract.Close;
                                             Dlg.quContract.ParamByName('p_PostNo').Value := PostNo;
                                             Dlg.quContract.Open;
                                             Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg.quContract.FieldByName('id').Value;
                                             Dlg.quContract.Close;
                                           end;


// Конец нового алгоритма создания шапки заказа


     quPostArtGroup := TMSQuery.Create(nil);
     quPostArtGroup.Connection:= dmDataModule.DB;
     quPostArtGroup.SQL.Clear;
     quPostArtGroup.SQL.Text:='select distinct lag.ARTICLE_GROUP_ID '+
                              '               ,dag.NAME '+
                              '               ,lag.ARTICLE_ID '+
                              '               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID '+
                              '               ,dsag.NAME as Set_Article_Group_Name '+
                              '               ,lpsagd.POSTNO '+
                              '               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay '+
                              '               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY '+
                              '               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT '+
                              '               ,(select COLNPRICE '+
                              '                  from L_SET_ARTICLE_GROUP lsag1 left join '+
                              '                       L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                              '                       L_POST_SET_ARTGROUP_PRICE lpsap on lpsap.SET_ARTICLE_GROUP_ID = lsag.SET_ARTICLE_GROUP_ID and POSTNO = :PostNom '+
                              '                   where COLNPRICE is not null '+
                              '                     and ARTICLE_ID = iov.Article '+
                              '                     and lsag1.SET_ARTICLE_GROUP_ID = lsag.SET_ARTICLE_GROUP_ID '+
                              '	                 and ACTIVE = ''Y'') as ColNPrice '+

                              ' from L_ARTICLE_GROUP lag left join '+
                              '      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join '+
                              '      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                              '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join '+
                              '      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = :PostNo and lpsagd.BUH = :Buh left join '+
                              '      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '+
                              '  where convert(int,iov.OrderNo) = convert(int,:OrderNo)  '+
                              '    and lsag.SET_ARTICLE_GROUP_ID is not null '+
                              '    and convert(smallint,iov.Article) not in (select TovarNo '+
                              '                                               from e_blanks '+
                              '                                                where Document_id in (select idBlank '+
                              '                                                                       from l_BlankForVeb '+
                              '                                                                        where IdVeb = convert(bigint,:OrderNom) '+
                              '                                                                          and idBlank not in (select id '+
                              '                                     																		                      from e_blank_head '+
                              '                                               																							   where Status = -1))) '+
                              '    and lpsagd.POSTNO is not null '+
                              'order by lpsagd.DAY_DELAY, ColNPrice ';
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
          SArticleGroup := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;

          SArticleGroupDouble := quPostArtGroup.FieldByName('DAY_DELAY').AsVariant; //quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').AsVariant;
          ArticleGroupDouble := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').AsVariant;

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
                                +'                                                                           where IdVeb = convert(bigint,:OrderNom) '
                                +'                                                                             and idBlank not in (select id '
                                +'                                     																		                      from e_blank_head '
                                +'                                               																							   where Status = -1))) '
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

          if (Dlg.quPostBanPostBan.Value = 1) and (quOrdersTypeNakl.asString = 'Возвратная') then
           begin
             DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
             raise Exception.Create(DescriptionBan);
             Is_PostBan := true;
           end;

          Dlg.quPostBan.Close;           

          if CheckBlank(PostNo, Dlg.spAddInputOrder.ParamByName('ReasonId').Value, DeliveryDate, OtdelNo, SArticleGroupDouble, ErrMsg) >= 10 then
           begin
             //Не Успешно
             raise Exception.Create(ErrMsg);
           end;

 ////////


          Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := SArticleGroup;
          Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := quPostArtGroup.FieldByName('DAY_DELAY').Value; // + quPostArtGroup.FieldByName('DAY_DELAY_EXT').Value;

          quColnPriceForOrder.ParamByName('OrderNo').Value := OrderNo;
          quColnPriceForOrder.ParamByName('OrderNom').Value := OrderNo;
          quColnPriceForOrder.ParamByName('PostNo').Value := PostNo;
          quColnPriceForOrder.ParamByName('PostNom').Value := PostNo;
          quColnPriceForOrder.ParamByName('Buh').Value := Buh;
          quColnPriceForOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Text;
          quColnPriceForOrder.Open;

          if quColnPriceForOrder.RecordCount > 0 then isChangeSArticleGroupDoublePred := true
                                                 else isChangeSArticleGroupDoublePred := false;

          quColnPriceForOrder.First;

          while not quColnPriceForOrder.Eof do
           begin
             if quColnPriceForOrder.FieldByName('COLNPRICE').Value > 0
              then Begin
                     Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                     if (ColNPrice <> quColnPriceForOrder.FieldByName('COLNPRICE').Value)
                     or (SArticleGroupDoublePred <> SArticleGroupDouble)
                      then begin
                             ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                             Dlg.spAddInputOrder.ExecProc;
                             documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                             LdocumentID := documentID;
                           end;

                     if documentID = 0 then begin
                                              documentID := LdocumentID;
                                            end;

                     quSpecBlank :=TMSQuery.Create(nil);
                     quSpecBlank.Connection:=dmDataModule.DB;
                     quSpecBlank.SQL.Clear;
                     quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                          +'      ,convert(decimal(18,3),ivt.KolTov) as KolTov '
                                          +'      ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                          +'     ,convert(numeric(18,2),ltrim(rtrim(KomplectacijaOne))) as  KomplectacijaOne '
                                          +'     ,convert(numeric(18,2),ltrim(rtrim(Komplectacija))) as  Komplectacija '
                                          +'     ,convert(numeric(18,2),ltrim(rtrim(Residue))) as Residue '
                                          +'     ,convert(numeric(18,2),ltrim(rtrim(Need))) as Need '
                                          +' from ImportOrderVebTmp ivt '
                                          +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                          +'    and convert(smallint,Article) not in (select TovarNo '
                                          +'                                                  from e_blanks '
                                          +'                                                   where Document_id in (select idBlank '
                                          +'                                                                          from l_BlankForVeb '
                                          +'                                                                           where IdVeb = convert(bigint,:OrderNom) '
                                          +'                                                                             and idBlank not in (select id '
                                          +'																		                                                               from e_blank_head '
                                          +'																							                                                      where Status = -1))) '
                                          +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                          +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                          +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID  '
                                          +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                          +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                          +'    and ivt.KolTov >0 ';
                     quSpecBlank.Prepare;
                     quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                     quSpecBlank.ParamByName('OrderNom').Value := OrderNo;

                     quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                     quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := ArticleGroupDouble;

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
                     Residue := quSpecBlank.FieldByName('Residue').AsFloat;
                     Need := quSpecBlank.FieldByName('Need').AsFloat;

                     if (quSpecBlank.RecordCount = 0) and (CheckOrderForVeb.RecordCount = 0) then begin
                                                                                                    DelBlankHead (documentId);
                                                                                                    quSpecBlank.Close;
                                                                                                  end;
                     CheckOrderForVeb.Close;
                     while not quSpecBlank.Eof do
                      begin
                        if (quSpecBlank.FieldByName('KomplectacijaOne').Value > 0) and not (quOrdersTypeNakl.asString = 'Возвратная')
                         then begin
                                Komplectacija :=  Komplectacija + quSpecBlank.FieldByName('KomplectacijaOne').Value;
                                AddTovarInBlanks(DocumentId, 10815, data.UserNo, -1, 1, 1, Komplectacija, Residue, Need);
                              end;

                        AddTovarInBlanks(documentID,quSpecBlank.FieldByName('Article').Value,data.UserNo,ColNPrice,quSpecBlank.FieldByName('KolTov').Value,quSpecBlank.FieldByName('KolTov').Value,0, Residue, Need);

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

                     if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                                InsInBlankForVeb(OrderNo, DocumentId);
                                                                                if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                                                                                                     Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                                                                                                                     Dlg.spModifyLinkBlankReturn.Execute;
                                                                                                                                   end;
                                                                                Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                              end
                                                                         else begin
                                                                                if documentID > 0 then Showmessage ('Заказ document_id = '+ IntToStr(documentID)+ ' дополнен');
                                                                              end;
                   End;
             quColnPriceForOrder.Next;
           end;
          quColnPriceForOrder.Close;
          if isChangeSArticleGroupDoublePred = true then SArticleGroupDoublePred := SArticleGroupDouble;
          quPostArtGroup.Next;
       end;//quPostArtGroup.Eof
    quPostArtGroup.Close;

     QueryPerformanceCounter(C2);
     
     CreateOrderTime := StrToFloat(FormatFloat('0.000', ((C2 - C1) / (iCounterPerSec))));

     dmDataModule.ExecSQL('declare @cnt int select @cnt = count(*) from CreateBlancWithSite where OrderVeb = :p1_OrderVeb if @cnt = 0 insert into CreateBlancWithSite (OrderVeb, TimeCreate)  values (:p2_OrderVeb, convert(decimal(5,3),:p3_TimeCreate))', [OrderNo,OrderNo,CreateOrderTime]);

     ShowMessage(' Внешний заказ создавался:'+#13#10+
                 FormatFloat('0.000', ((C2 - C1) / (iCounterPerSec))) + ' сек.'+#13#10+
                 ' По ветке 2,3');
   end; // 2,3
  if quOrders.FieldByName('GroupClient').Value = 4 Then
   begin // 4

//     dmDataModule.OpenSQL('select distinct DATEDIFF (hour, CreateDate , getdate()) as CheckOwerTime from TempTableForCreateBlank');

     dmDataModule.OpenSQL('select distinct case when dateadd(hour,1,CreateDate) < getdate() then 1 else 0 end as CheckOwerTime from TempTableForCreateBlank');

     if dmDataModule.QFO.FieldByName('CheckOwerTime').Value >= 1 then raise Exception.Create(' С момента создания таблицы для создания заказов, прошло более одного часа!' +#13#10+
                                                                                             'Пересоздайте таблицу для создания заказов и повторите попытку!');


     QueryPerformanceFrequency(iCounterPerSec);
     QueryPerformanceCounter(C1);

// новый алгоритм создания заказа для сотрудника
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
                                                                                                                End;
                                                                            End;

      if quOrders.FieldByName('NoContractor').AsInteger  = 0 then DescriptionErrorForOpt := ' Не указан код контрагента на сайте!'+ #10#13 +
                                                                                            'Задайте номер контрагента ' + quOrders.FieldByName('NameContractor').Value + ' на сайте!';
      if quOrders.FieldByName('NoClient').Value = 0 then DescriptionErrorForOpt := DescriptionErrorForOpt + #10#13 +
                                                                                   ' Не указан сотрудник на сайте!';
      if quOrders.FieldByName('NoAdress').Value = 0 then DescriptionErrorForOpt := DescriptionErrorForOpt + #10#13 +
                                                                                   ' На сайте не указан номер адреса!'+#13#10+
                                                                                   'Установите номер адреса на сайте что бы это сообщение не появлялось в дальнейшем';
      DmDataModule.OpenSQL('select count(*) as Cnt from d_sotrud_address where AddressPost_id = :p1_AddressPost_id and SotrudNo = :p2_SotrudNo and Active = 1',[quOrders.FieldByName('NoAdress').Value,quOrders.FieldByName('NoClient').Value]);

      if DmDataModule.QFO.FieldByName('Cnt').AsInteger = 0 then begin
                                                                  raise Exception.Create(' Сотрудник: ' + quOrders.FieldByName('NameClient').AsString + #10#13 +
                                                                                         'Не может создавать заказ по адресу: ' + quOrders.FieldByName('Adress').AsString + #10#13 +
                                                                                         'На контрагента: ' + quOrders.FieldByName('NameContractor').AsString);
                                                                end;

      if DescriptionErrorForOpt <> '' then begin
                                             ShowMessage(DescriptionErrorForOpt+ #10#13 +'Необходимо выбрать Контрагента, сотрудника и адрес из списка');
                                             Dlg5 := TTempTableForCreateBlankForm.Create(Application);
                                             try
                                              Dlg5.quTempTableForCreateBlank.Close;
                                              if (quOrders.FieldByName('NoContractor').AsInteger  <> 0) then Dlg5.quTempTableForCreateBlank.ParamByName('PostNo').Value := quOrdersNoContractor.Value;
                                              Dlg5.quTempTableForCreateBlank.ParamByName('Buh').Value := Buh;
                                              if (quOrders.FieldByName('NoAdress').Value <> 0) then Dlg5.quTempTableForCreateBlank.ParamByName('AddressPost_ID').Value := quOrdersNoAdress.Value;
                                              if (quOrders.FieldByName('NoClient').Value <> 0) then Dlg5.quTempTableForCreateBlank.ParamByName('SOtrudNo').Value := quOrders.FieldByName('NoClient').Value;
                                              Dlg5.quTempTableForCreateBlank.Open;
                                              if Dlg5.ShowModal = mrok Then begin
                                                                              Dlg.spAddInputOrder.ParamByName('PostNo').Value := Dlg5.quTempTableForCreateBlankpostno.Value;
                                                                              PostNo := Dlg5.quTempTableForCreateBlankpostno.Value;

                                                                              Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                                                              Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := Dlg5.quTempTableForCreateBlankSotrudNo.Value;
                                                                              Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
                                                                              Dlg.spAddInputOrder.ParamByName('AddressNo').Value := Dlg5.quTempTableForCreateBlankAddressNo.Value;
                                                                              Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := Dlg5.quTempTableForCreateBlankOtdelNo.Value;
                                                                              OtdelNo := Dlg5.quTempTableForCreateBlankOtdelNo.Value;
                                                                              Dlg.spAddInputOrder.ParamByName('Buh').Value := Dlg5.quTempTableForCreateBlankBuh.Value;
                                                                              Buh := Dlg5.quTempTableForCreateBlankBuh.Value;
                                                                              Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg5.quTempTableForCreateBlankD_Firm_Contract_id.Value;
                                                                            end
                                                                       Else begin
                                                                              raise Exception.Create(' Необходимо выбрать соответствующую запись!'+#13#10+
                                                                                                     'Без выбора записи заказ создан не будет!'+#13#10+
                                                                                                     'Возможно к контрагенту не сопоставлены сотрудники.'+#13#10+
                                                                                                     'Для того чтобы выбрать сопоставте контрагенту сотрудников ');
                                                                            end;
                                             finally
                                              Dlg5.quTempTableForCreateBlank.Close;
                                              Dlg5.Free;
                                             end;
                                             if (quOrders.FieldByName('NoContractor').AsInteger <> PostNo) Then raise Exception.Create(' Номер контрагента не совпадает с номером в заказе!'+#13#10+
                                                                                                                                       'Заказ создан не будет!'+#13#10+
                                                                                                                                       'Заказ создавался на '+quOrders.FieldByName('NameContractor').AsString+#13#10+
                                                                                                                                       'с номером '+quOrders.FieldByName('NoContractor').AsString+#13#10+
                                                                                                                                       'Если такого контрагента нет в списке создайте его или проверте правильность номера на сайте.');
                                           end
                                      else begin
                                             Dlg.spAddInputOrder.ParamByName('PostNo').Value := quOrders.FieldByName('NoContractor').AsInteger;
                                             PostNo := quOrders.FieldByName('NoContractor').AsInteger;

                                             Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                             Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := quOrders.FieldByName('NoClient').Value;
                                             Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;

                                             quSotrudOtdel:=TMSQuery.Create(nil);
                                             quSotrudOtdel.Connection:=dmDataModule.DB;
                                             quSotrudOtdel.SQL.Clear;
                                             quSotrudOtdel.SQL.Text:='select SotrudOtdel from Sotrud where SotrudNo = :SotrudNo';
                                             quSotrudOtdel.Prepare;
                                             quSotrudOtdel.ParamByName('SotrudNo').Value := quOrders.FieldByName('NoClient').Value;
                                             quSotrudOtdel.Open;
                                             Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := quSotrudOtdel.FieldByName('SotrudOtdel').Value;
                                             OtdelNo := quSotrudOtdel.FieldByName('SotrudOtdel').Value;
                                             quSotrudOtdel.Close;

                                             dmDataModule.OpenSQL('select AddressNo from AddressPost where id = :p1_id',[quOrdersNoAdress.Value]);

                                             Dlg.spAddInputOrder.ParamByName('AddressNo').Value := dmDataModule.QFO.FieldByName('AddressNo').Value;

                                             Dlg.spAddInputOrder.ParamByName('Buh').Value := Buh;

                                             Dlg.quContract.Close;
                                             Dlg.quContract.ParamByName('p_PostNo').Value := PostNo;
                                             Dlg.quContract.Open;
                                             Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg.quContract.FieldByName('id').Value;
                                             Dlg.quContract.Close;
                                           end;

      quPostArtGroup := TMSQuery.Create(nil);
      quPostArtGroup.Connection:= dmDataModule.DB;
      quPostArtGroup.SQL.Clear;
      quPostArtGroup.SQL.Text:='select distinct lag.ARTICLE_GROUP_ID '+
                               '               ,dag.NAME '+
                               '               ,lag.ARTICLE_ID '+
                               '               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID '+
                               '               ,dsag.NAME as Set_Article_Group_Name '+
                               '               ,lpsagd.POSTNO '+
                               '               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay '+
                               '               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY '+
                               '               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT '+
                               '               ,(select distinct COLNPRICE '+
                               '                  from L_SET_ARTICLE_GROUP lsag1 left join '+
                               '                       L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                               '                       L_POST_SET_ARTGROUP_PRICE lpsap on lpsap.SET_ARTICLE_GROUP_ID = lsag.SET_ARTICLE_GROUP_ID and POSTNO = :PostNom '+
                               '                   where COLNPRICE is not null '+
                               '                     and ARTICLE_ID = iov.Article '+
                               '                     and lsag1.SET_ARTICLE_GROUP_ID = lsag.SET_ARTICLE_GROUP_ID '+
                               '	                   and ACTIVE = ''Y'') as ColNPrice '+
                               ' from L_ARTICLE_GROUP lag left join '+
                               '      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join '+
                               '      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                               '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join '+
                               '      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = :PostNo and lpsagd.BUH = :Buh left join '+
                               '      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '+
                               '  where convert(bigint,iov.OrderNo) = convert(bigint,:OrderNo)  '+
                               '    and lsag.SET_ARTICLE_GROUP_ID is not null '+
                               '    and convert(smallint,iov.Article) not in (select TovarNo '+
                               '                                               from e_blanks '+
                               '                                                where Document_id in (select idBlank '+
                               '                                                                       from l_BlankForVeb '+
                               '                                                                        where IdVeb = convert(bigint,:OrderNom) '+
                               '                                                                          and idBlank not in (select id '+
                               '                                     																		                      from e_blank_head '+
                               '                                               																							   where Status = -1))) '+
                               '    and lpsagd.POSTNO is not null '+
                               'order by lpsagd.DAY_DELAY, ColNPrice';
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
         SArticleGroup := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;

         SArticleGroupDouble := quPostArtGroup.FieldByName('DAY_DELAY').AsVariant; //quPostArtGroup.FieldByName('DAY_DELAY').AsVariant; //quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').AsVariant;
         ArticleGroupDouble := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').AsVariant;

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
                               +'                                                                           where IdVeb = convert(bigint,:OrderNom) '
                               +'                                                                             and idBlank not in (select id '
                               +'                                     																		                      from e_blank_head '
                               +'                                               																							   where Status = -1))) '
                               +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                               +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                               +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                               +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                               +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                               +'    and (convert(decimal(18,3),ivt.KolTov) > 0 ) ';
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

         if (Dlg.quPostBanPostBan.Value = 1) and (quOrdersTypeNakl.asString = 'Возвратная') then
          begin
            DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
            raise Exception.Create(DescriptionBan);
            Is_PostBan := true;
          end;

         if CheckBlank(PostNo, Dlg.spAddInputOrder.ParamByName('ReasonId').Value, DeliveryDate, OtdelNo, SArticleGroupDouble, ErrMsg) >= 10 then
          begin
            // Не Успешно
            raise Exception.Create(ErrMsg);
          end;

         Dlg.quPostBan.Close;

         Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := SArticleGroup ;
         Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := quPostArtGroup.FieldByName('DAY_DELAY').Value; // + quPostArtGroup.FieldByName('DAY_DELAY_EXT').Value;

         quColnPriceForOrder.ParamByName('OrderNo').Value := OrderNo;
         quColnPriceForOrder.ParamByName('OrderNom').Value := OrderNo;
         quColnPriceForOrder.ParamByName('PostNo').Value := PostNo;
         quColnPriceForOrder.ParamByName('PostNom').Value := PostNo;
         quColnPriceForOrder.ParamByName('Buh').Value := Buh;
         quColnPriceForOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Text;
//                         quColnPriceForOrder.ParamByName('SET_ARTICLE_GROUP_ID_DELAY').Value := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;
         quColnPriceForOrder.Open;

         if quColnPriceForOrder.RecordCount > 0 then isChangeSArticleGroupDoublePred := true
                                                else isChangeSArticleGroupDoublePred := false;

         quColnPriceForOrder.First;

         while not quColnPriceForOrder.Eof do
           begin
             if quColnPriceForOrder.FieldByName('COLNPRICE').Value = 0 then quColnPriceForOrder.Next
                                                                       else Begin
                                                                              Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quColnPriceForOrder.FieldByName('COLNPRICE').Value;

                                                                              if (ColNPrice <> quColnPriceForOrder.FieldByName('COLNPRICE').Value) or (SArticleGroupDoublePred <> SArticleGroupDouble)
                                                                               then begin
                                                                                      ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                                                                                      Dlg.spAddInputOrder.ExecProc;
                                                                                      documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                                                                                      LdocumentID := documentID;
                                                                                    end;
                                                                              if documentID = 0 then begin
                                                                                                       documentID := LdocumentID;
                                                                                                     end;
                                                                              quSpecBlank :=TMSQuery.Create(nil);
                                                                              quSpecBlank.Connection:=dmDataModule.DB;
                                                                              quSpecBlank.SQL.Clear;
                                                                              quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                                                                                   +'      ,convert(decimal(18,3),ivt.KolTov) as KolTov '
                                                                                                   +'      ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                                                                                   +'     ,convert(numeric(18,2),ltrim(rtrim(KomplectacijaOne))) as  KomplectacijaOne '
                                                                                                   +'     ,convert(numeric(18,2),ltrim(rtrim(Komplectacija))) as  Komplectacija '
                                                                                                   +'     ,convert(numeric(18,2),ltrim(rtrim(Residue))) as Residue '
                                                                                                   +'     ,convert(numeric(18,2),ltrim(rtrim(Need))) as Need '
                                                                                                   +' from ImportOrderVebTmp ivt '
                                                                                                   +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                                                                                   +'    and convert(smallint,Article) not in (select TovarNo '
                                                                                                   +'                                                  from e_blanks '
                                                                                                   +'                                                   where Document_id in (select idBlank '
                                                                                                   +'                                                                          from l_BlankForVeb '
                                                                                                   +'                                                                           where IdVeb = convert(bigint,:OrderNom) '
                                                                                                   +'                                                                             and idBlank not in (select id '
                                                                                                   +'																		                                                               from e_blank_head '
                                                                                                   +'																							                                                      where Status = -1))) '
                                                                                                   +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                                                                                   +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                                                                                   +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                                                                                   +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                                                                                   +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                                                                                   +'    and (convert(decimal(18,3),ivt.KolTov) > 0) ';

                                                                              quSpecBlank.Prepare;
                                                                              quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                                                                              quSpecBlank.ParamByName('OrderNom').Value := OrderNo;
                                                                              quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                                                                              quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := ArticleGroupDouble;
                                                                              quSpecBlank.Open;
 //    showmessage(quSpecBlank.SQL.Text);
                                                                              quAdressPost:=TMSQuery.Create(nil);
                                                                              quAdressPost.Connection:=dmDataModule.DB;
                                                                              quAdressPost.SQL.Clear;
                                                                              quAdressPost.SQL.Text:='select AddressNo from AddressPost ap inner join d_sotrud_address dsa on dsa.AddressPost_id = ap.ID where ap.id = :Id and ap.PostNo = :PostNo and dsa.SotrudNo = :SotrudNo ';
                                                                              quAdressPost.Prepare;
                                                                              quAdressPost.ParamByName('Id').Value := quOrders.FieldByName('NoAdress').Value;
                                                                              quAdressPost.ParamByName('PostNo').Value := PostNo;
                                                                              quAdressPost.ParamByName('SotrudNo').Value := quOrders.FieldByName('NoClient').Value;
                                                                              quAdressPost.Open;
                                                                              if (quAdressPost.RecordCount > 0) then Dlg.spAddInputOrder.ParamByName('AddressNo').Value := quAdressPost.FieldByName('AddressNo').Value
                                                                                                                else begin
                                                                                                                       if (documentID = 0) then begin
                                                                                                                                                  quPost := TMSQuery.Create(nil);
                                                                                                                                                  quPost.Connection:=dmDataModule.DB;
                                                                                                                                                  quPost.SQL.Clear;
                                                                                                                                                  quPost.SQL.Text :=  ' DECLARE  @DateNakl SMALLDATETIME'
                                                                                                                                                                     +' DECLARE  @IS_ALL SMALLINT'
                                                                                                                                                                     +' DECLARE  @POSTNO DTFkey'
                                                                                                                                                                     +' DECLARE  @SotrudNo SMALLINT'
                                                                                                                                                                     +' DECLARE  @SET_ARTICLE_GROUP_ID bigint'
                                                                                                                                                                     +' SET @DateNakl = convert(smalldatetime,:DateNakl)'
                                                                                                                                                                     +' SET @IS_ALL = convert(SMALLINT,:IS_ALL)'
                                                                                                                                                                     +' SET @POSTNO = convert(bigint,:POSTNO)'
                                                                                                                                                                     +' SET @SotrudNo = convert(smallint,:SotrudNo)'
                                                                                                                                                                     +' SET @SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID)'
                                                                                                                                                                     +' SELECT   u.postno'
                                                                                                                                                                     +'          ,u.name'
                                                                                                                                                                     +'          ,u.namelong'
                                                                                                                                                                     +'          ,u.addressno'
                                                                                                                                                                     +'          ,u.address'
                                                                                                                                                                     +'          ,u.sotrudno'
                                                                                                                                                                     +'          ,u.sotrudname'
                                                                                                                                                                     +'          ,u.otdelname'
                                                                                                                                                                     +'          ,u.otdelno'
                                                                                                                                                                     +'          ,u.contract_num'
                                                                                                                                                                     +'          ,u.realdaydelay'
                                                                                                                                                                     +'          ,u.postdaydelay'
                                                                                                                                                                     +'          ,CASE when u.realdaydelay > u.postdaydelay THEN ''Y'''
                                                                                                                                                                     +'                when ((u.datenakl is not null) and (select isnull(max(1),0) from l_firm_prop where postNo=u.PostNo and prop_id=22)=1)'
                                                                                                                                                                     +'                                               and (u.is_enable_stop_period = 0) THEN ''Y'''
                                                                                                                                                                     +'                                                     else ''N'''
                                                                                                                                                                     +'           end  as is_stop'
                                                                                                                                                                     +'          ,SET_ARTICLE_GROUP_NAME'
                                                                                                                                                                     +'          ,SET_ARTICLE_GROUP_ID'
                                                                                                                                                                     +'          ,BUH'
                                                                                                                                                                     +'          ,DAY_DELAY'
                                                                                                                                                                     +'          ,DAY_DELAY_EXT'
                                                                                                                                                                     +'          ,Buh_type_name'
                                                                                                                                                                     +'          ,AddressID'
                                                                                                                                                                     +' FROM     (SELECT p.postno'
                                                                                                                                                                     +'                  ,p.name'
                                                                                                                                                                     +'                  ,p.namelong'
                                                                                                                                                                     +'                  ,ap.addressno'
                                                                                                                                                                     +'                  ,ap.address'
                                                                                                                                                                     +'                  ,s.sotrudno'
                                                                                                                                                                     +'                  ,s.sotrudname'
                                                                                                                                                                     +'                  ,o.otdelname'
                                                                                                                                                                     +'                  ,o.otdelno'
                                                                                                                                                                     +'                  ,(SELECT Max(num)'
                                                                                                                                                                     +'                     FROM   d_firm_contract c'
                                                                                                                                                                     +'                      WHERE  type_id = 1'
                                                                                                                                                                     +'                        AND ourfirmno = (select PostNo from d_our_firm)'
                                                                                                                                                                     +'                        AND postno = p.postno'
                                                                                                                                                                     +'                        AND (@DateNakl BETWEEN c.create_date AND c.expire_date)) AS contract_num'
                                                                                                                                                                     +'                  ,Datediff(dd,isnull(pdel.DateNakl,@DateNakl),@DateNakl) AS realdaydelay'
                                                                                                                                                                     +'                  ,Isnull(pdel.DAY_DELAY,0)+isnull(pdel.DAY_DELAY_EXT,0) AS postdaydelay'
                                                                                                                                                                     +'                  ,pdel.SET_ARTICLE_GROUP_NAME'
                                                                                                                                                                     +'                  ,pdel.SET_ARTICLE_GROUP_ID'
                                                                                                                                                                     +'                  ,pdel.BUH'
                                                                                                                                                                     +'                  ,pdel.DAY_DELAY'
                                                                                                                                                                     +'                  ,pdel.DAY_DELAY_EXT'
                                                                                                                                                                     +'                  ,pdel.datenakl'
                                                                                                                                                                     +'                  ,(select Buh_type_name from d_buh_type where buh=pdel.BUH) as Buh_type_name'
                                                                                                                                                                     +'                  ,ap.id as AddressID'
                                                                                                                                                                     +'                  ,pdel.is_stop'
                                                                                                                                                                     +'                  ,pdel.is_start'
                                                                                                                                                                     +'                  ,pdel.is_enable_stop_period'
                                                                                                                                                                     +'           FROM   post p'
                                                                                                                                                                     +'                  INNER JOIN dbo.fu_first_free_nakl(@DateNakl,@PostNo,-1) pdel on pdel.PostNo=p.PostNo'
                                                                                                                                                                     +'                  INNER JOIN addresspost ap'
                                                                                                                                                                     +'                    ON p.postno = ap.postno'
                                                                                                                                                                     +'                  LEFT OUTER JOIN d_sotrud_address a'
                                                                                                                                                                     +'                    ON a.addresspost_id = ap.id'
                                                                                                                                                                     +'                  LEFT OUTER JOIN sotrud s'
                                                                                                                                                                     +'                    ON a.sotrudno = s.sotrudno'
                                                                                                                                                                     +'                  LEFT OUTER JOIN vidotdel o'
                                                                                                                                                                     +'                    ON s.sotrudotdel = o.otdelno'
                                                                                                                                                                     +'           WHERE  (p.PostNo=@POSTNO or @POSTNO=0)'
                                                                                                                                                                     +'           AND (s.SotrudNo = @SotrudNo or @SotrudNo = 0)'
                                                                                                                                                                     +'           AND (pdel.SET_ARTICLE_GROUP_ID = @SET_ARTICLE_GROUP_ID or @SET_ARTICLE_GROUP_ID = 0)'
                                                                                                                                                                     +'           AND o.otdelno IS NOT NULL'
                                                                                                                                                                     +'           AND ap.address IS NOT NULL'
                                                                                                                                                                     +'           AND p.trash = 0  '
                                                                                                                                                                     +'           AND a.Active = 1 '
                                                                                                                                                                     +'           AND ap.Active = 1) u '
                                                                                                                                                                     +' WHERE    (u.contract_num IS NOT NULL OR @IS_ALL = 1)';

                                                                                                                                                  quPost.Prepare;
                                                                                                                                                  quPost.ParamByName('is_all').AsInteger := 0;
                                                                                                                                                  quPost.ParamByName('DateNakl').AsDateTime := DeliveryDate;
                                                                                                                                                  quPost.ParamByName('PostNo').Value:= PostNo;
                                                                                                                                                  quPost.ParamByName('SotrudNo').Value:= quOrders.FieldByName('NoClient').Value;
                                                                                                                                                  quPost.ParamByName('SET_ARTICLE_GROUP_ID').Value:= SArticleGroupDouble;
                                                                                                                                                  quPost.Open;

                                                                                                                                                  if quPost.RecordCount = 0 then begin
                                                                                                                                                                                   quPost.Close;
                                                                                                                                                                                   raise Exception.Create(' Нельзя создавать заказ! '+#13#10+
                                                                                                                                                                                                          'Сотрудник '+quOrders.FieldByName('NameClient').Value+#13#10+
                                                                                                                                                                                                          'Не может создать заказ для партнера '+quOrders.FieldByName('NameContractor').Value+#13#10+
                                                                                                                                                                                                          'по адресу: '+quOrders.FieldByName('Adress').Value+#13#10+
                                                                                                                                                                                                          'и набору отсрочки '+quPostArtGroup.FieldByName('Set_Article_Group_Name').AsString+'!'+#13#10+
                                                                                                                                                                                                          'Необходимо исправить заказ на сайте, перевтянуть его и повторить попытку!');
                                                                                                                                                                                 end;
                                                                                                                                                  if quPost.RecordCount = 1 then begin
                                                                                                                                                                                   Dlg.spAddInputOrder.ParamByName('AddressNo').Value := quPost.FieldByName('AddressNo').AsInteger;
                                                                                                                                                                                 end;

                                                                                                                                                  if quPost.RecordCount > 1 then begin
                                                                                                                                                                                   Showmessage(' На сайте не верно указан номер адреса!'+#13#10+
                                                                                                                                                                                               'Установите правильный номер адреса на сайте что бы это сообщение не появлялось в дальнейшем');
                                                                                                                                                                                   Showmessage('Выберите адрес доставки по сотруднику: ' + quOrders.FieldByName('NameClient').Value + ' и группе: ' + quPostArtGroup.FieldByName('Set_Article_Group_Name').AsString);
                                                                                                                                                                                   RetPostForRashod := PostForRashod(DeliveryDate,PostNo,quOrders.FieldByName('NoClient').Value,SArticleGroupDouble);
                                                                                                                                                                                   if RetPostForRashod.PostNo > 0 then Begin
                                                                                                                                                                                                                         Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                                                                                                                                                                                                       End
                                                                                                                                                                                                                  else raise Exception.Create(' Необходимо выбрать адрес доставки по сотруднику!'+#13#10+
                                                                                                                                                                                                                                              'Возможно к контрагенту не сопоставлен адрес доставки по сотрудникиу.'+#13#10+
                                                                                                                                                                                                                                              'Для того чтобы выбрать сопоставте контрагенту адрес доставки по сотруднику.');
                                                                                                                                                                                 end;
                                                                                                                                                  quPost.Close;
                                                                                                                                                end;
                                                                                                                     end;
                                                                              if quSpecBlank.FieldByName('Komplectacija').Value = 0 then Komplectacija := 0;

                                                                              quSpecBlank.First;

                                                                              CheckOrderForVeb := TMSQuery.Create(nil);
                                                                              CheckOrderForVeb.Connection:= dmDataModule.DB;
                                                                              CheckOrderForVeb.SQL.Clear;
                                                                              CheckOrderForVeb.SQL.Text := 'select * from e_blanks where Document_id = :Document_id';
                                                                              CheckOrderForVeb.ParamByName('Document_id').Value := documentID;
                                                                              CheckOrderForVeb.Open;
                                                                              Residue := quSpecBlank.FieldByName('Residue').AsFloat;
                                                                              Need := quSpecBlank.FieldByName('Need').AsFloat;

                                                                              if (quSpecBlank.RecordCount = 0) and (CheckOrderForVeb.RecordCount = 0) then begin
                                                                                                                                                             DelBlankHead (documentId);
                                                                                                                                                             quSpecBlank.Close;
                                                                                                                                                           end;
                                                                              CheckOrderForVeb.Close;

                                                                              while not quSpecBlank.Eof do
                                                                               begin
                                                                                 if (quSpecBlank.FieldByName('KomplectacijaOne').Value > 0) and not (quOrdersTypeNakl.asString = 'Возвратная') then
                                                                                  begin
                                                                                    Komplectacija :=  Komplectacija + quSpecBlank.FieldByName('KomplectacijaOne').Value;
                                                                                    AddTovarInBlanks(DocumentId, 10815, data.UserNo, -1, 1, 1, Komplectacija, Residue, Need);
                                                                                  end;

                                                                                 AddTovarInBlanks(documentID,quSpecBlank.FieldByName('Article').Value,data.UserNo,ColNPrice,quSpecBlank.FieldByName('KolTov').Value,quSpecBlank.FieldByName('KolTov').Value,0, Residue, Need);

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

                                                                              if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                                                                                         InsInBlankForVeb(OrderNo, documentId);
                                                                                                                                         if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                                                                                                                                                              Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                                                                                                                                                                              Dlg.spModifyLinkBlankReturn.Execute;
                                                                                                                                                                                            end;
                                                                                                                                         Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                                                                                       end
                                                                                                                                  else begin
//                                                                                                                                         if documentID > 0 then Showmessage ('Заказ document_id = '+ IntToStr(documentID)+ ' дополнен');
                                                                                                                                       end;
                                                                              quColnPriceForOrder.Next;
                                                                            End;
           end;
          quColnPriceForOrder.Close;
         if isChangeSArticleGroupDoublePred = true then SArticleGroupDoublePred := SArticleGroupDouble;
         quPostArtGroup.Next;
       end;//quPostArtGroup.Eof
       quPostArtGroup.Close;
// окончание нового алгоритма


{





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
                     Dlg.quContract.Close;
                     Dlg.quContract.ParamByName('p_PostNo').Value := PostNo;
                     Dlg.quContract.Open;
                     Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg.quContract.FieldByName('id').Value;
                     Dlg.quContract.Close;

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
                                              '               ,dsag.NAME as Set_Article_Group_Name '+
                                              '               ,lpsagd.POSTNO '+
                                              '               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay '+
                                              '               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY '+
                                              '               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT '+
                                              '               ,(select distinct COLNPRICE '+
                                              '                  from L_SET_ARTICLE_GROUP lsag left join '+
                                              '                       L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                                              '                       L_POST_SET_ARTGROUP_PRICE lpsap on lpsap.SET_ARTICLE_GROUP_ID = lsag.SET_ARTICLE_GROUP_ID and POSTNO = :PostNom '+
                                              '                   where COLNPRICE is not null '+
                                              '                     and ARTICLE_ID = iov.Article '+
                                              '	                 and ACTIVE = ''Y'') as ColNPrice '+
                                              ' from L_ARTICLE_GROUP lag left join '+
                                              '      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join '+
                                              '      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                                              '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join '+
                                              '      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = :PostNo and lpsagd.BUH = :Buh left join '+
                                              '      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '+
                                              '  where convert(bigint,iov.OrderNo) = convert(bigint,:OrderNo)  '+
                                              '    and lsag.SET_ARTICLE_GROUP_ID is not null '+
                                              '    and convert(smallint,iov.Article) not in (select TovarNo '+
                                              '                                               from e_blanks '+
                                              '                                                where Document_id in (select idBlank '+
                                              '                                                                       from l_BlankForVeb '+
                                              '                                                                        where IdVeb = convert(bigint,:OrderNom) '+
                                              '                                                                          and idBlank not in (select id '+
                                              '                                     																		                      from e_blank_head '+
                                              '                                               																							   where Status = -1))) '+
                                              '    and lpsagd.POSTNO is not null '+
                                              'order by lpsagd.SET_ARTICLE_GROUP_ID, ColNPrice';
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
                         SArticleGroup := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;

                         SArticleGroupDouble := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').AsVariant;
                         ArticleGroupDouble := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').AsVariant;

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
                                               +'                                                                           where IdVeb = convert(bigint,:OrderNom) '
                                               +'                                                                             and idBlank not in (select id '
                                               +'                                     																		                      from e_blank_head '
                                               +'                                               																							   where Status = -1))) '
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

                         Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := SArticleGroup ;
                         Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := quPostArtGroup.FieldByName('DAY_DELAY').Value + quPostArtGroup.FieldByName('DAY_DELAY_EXT').Value;

                         quColnPriceForOrder.ParamByName('OrderNo').Value := OrderNo;
                         quColnPriceForOrder.ParamByName('OrderNom').Value := OrderNo;
                         quColnPriceForOrder.ParamByName('PostNo').Value := PostNo;
                         quColnPriceForOrder.ParamByName('PostNom').Value := PostNo;
                         quColnPriceForOrder.ParamByName('Buh').Value := Buh;
                         quColnPriceForOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Text;
//                         quColnPriceForOrder.ParamByName('SET_ARTICLE_GROUP_ID_DELAY').Value := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;
                         quColnPriceForOrder.Open;

                         if quColnPriceForOrder.RecordCount > 0 then isChangeSArticleGroupDoublePred := true
                                                                else isChangeSArticleGroupDoublePred := false;

                         quColnPriceForOrder.First;

                         while not quColnPriceForOrder.Eof do
                           begin
                             if quColnPriceForOrder.FieldByName('COLNPRICE').Value = 0 then quColnPriceForOrder.Next
                                                                                       else
                                                                                          Begin
                                                                                            Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quColnPriceForOrder.FieldByName('COLNPRICE').Value;

                                                                                            if (ColNPrice <> quColnPriceForOrder.FieldByName('COLNPRICE').Value) or (SArticleGroupDoublePred <> SArticleGroupDouble)
                                                                                             then begin
                                                                                                    ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                                                                                                    Dlg.spAddInputOrder.ExecProc;
                                                                                                    documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                                                                                                    LdocumentID := documentID;
                                                                                                  end;
                                                                                            if documentID = 0 then begin
                                                                                                                     documentID := LdocumentID;
                                                                                                                   end;
                                                                                            quSpecBlank :=TMSQuery.Create(nil);
                                                                                            quSpecBlank.Connection:=dmDataModule.DB;
                                                                                            quSpecBlank.SQL.Clear;
                                                                                            quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                                                                                                 +'     ,convert(int,KolTov) as KolTov '
                                                                                                                 +'     ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                                                                                                 +'     ,convert(numeric(18,2),ltrim(rtrim(KomplectacijaOne))) as  KomplectacijaOne '
                                                                                                                 +'     ,convert(numeric(18,2),ltrim(rtrim(Komplectacija))) as  Komplectacija '
                                                                                                                 +'     ,convert(numeric(18,2),ltrim(rtrim(Residue))) as Residue '
                                                                                                                 +'     ,convert(numeric(18,2),ltrim(rtrim(Need))) as Need '
                                                                                                                 +' from ImportOrderVebTmp ivt '
                                                                                                                 +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                                                                                                 +'    and convert(smallint,Article) not in (select TovarNo '
                                                                                                                 +'                                                  from e_blanks '
                                                                                                                 +'                                                   where Document_id in (select idBlank '
                                                                                                                 +'                                                                          from l_BlankForVeb '
                                                                                                                 +'                                                                           where IdVeb = convert(bigint,:OrderNom) '
                                                                                                                 +'                                                                             and idBlank not in (select id '
                                                                                                                 +'																		                                                               from e_blank_head '
                                                                                                                 +'																							                                                      where Status = -1))) '
                                                                                                                 +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                                                                                                 +'                                     from L_SET_ARTICLE_GROUP lsag  '
                                                                                                                 +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '
                                                                                                                 +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                                                                                                 +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '

                                                                                                                 +'    and ivt.KolTov >0 ';

                                                                                            quSpecBlank.Prepare;
                                                                                            quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                                                                                            quSpecBlank.ParamByName('OrderNom').Value := OrderNo;
                                                                                            quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                                                                                            quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := ArticleGroupDouble;

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
                                                                                            Residue := quSpecBlank.FieldByName('Residue').AsFloat;
                                                                                            Need := quSpecBlank.FieldByName('Need').AsFloat;

                                                                                            if (quSpecBlank.RecordCount = 0) and (CheckOrderForVeb.RecordCount = 0) then begin
                                                                                                                                                                           DelBlankHead (documentId);
                                                                                                                                                                           quSpecBlank.Close;
                                                                                                                                                                         end;
                                                                                            CheckOrderForVeb.Close;

                                                                                            while not quSpecBlank.Eof do
                                                                                               begin
                                                                                                 if (quSpecBlank.FieldByName('KomplectacijaOne').Value > 0) and not (quOrdersTypeNakl.asString = 'Возвратная') then
                                                                                                  begin
                                                                                                    Komplectacija :=  Komplectacija + quSpecBlank.FieldByName('KomplectacijaOne').Value;
                                                                                                    AddTovarInBlanks(DocumentId, 10815, data.UserNo, -1, 1, 1, Komplectacija, Residue, Need);
                                                                                                  end;

                                                                                                 AddTovarInBlanks(documentID,quSpecBlank.FieldByName('Article').Value,data.UserNo,ColNPrice,quSpecBlank.FieldByName('KolTov').Value,quSpecBlank.FieldByName('KolTov').Value,0, Residue, Need);

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

                                                                                            if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                                                                                                       InsInBlankForVeb(OrderNo, documentId);
                                                                                                                                                       if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                                                                                                                                                                            Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                                                                                                                                                                                            Dlg.spModifyLinkBlankReturn.Execute;
                                                                                                                                                                                                          end;
                                                                                                                                                       Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                                                                                                     end
                                                                                                                                                else begin
                                                                                                                                                       if documentID > 0 then Showmessage ('Заказ document_id = '+ IntToStr(documentID)+ ' дополнен');
                                                                                                                                                     end;
                                                                                            quColnPriceForOrder.Next;
                                                                                          End;
                           end;
                         quColnPriceForOrder.Close;

                         if isChangeSArticleGroupDoublePred = true then SArticleGroupDoublePred := SArticleGroupDouble;
                         quPostArtGroup.Next;
                       end;//quPostArtGroup.Eof
                      quPostArtGroup.Close;
                   End // quOrders.FieldByName('NoContractor').Value = 0 then
              Else Begin // quOrders.FieldByName('NoContractor').Value = 0  else
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
                                              '               ,dsag.NAME as Set_Article_Group_Name '+
                                              '               ,lpsagd.POSTNO '+
                                              '               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay '+
                                              '               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY '+
                                              '               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT '+
                                              '               ,(select distinct COLNPRICE '+
                                              '                  from L_SET_ARTICLE_GROUP lsag left join '+
                                              '                       L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                                              '                       L_POST_SET_ARTGROUP_PRICE lpsap on lpsap.SET_ARTICLE_GROUP_ID = lsag.SET_ARTICLE_GROUP_ID and POSTNO = :PostNom '+
                                              '                   where COLNPRICE is not null '+
                                              '                     and ARTICLE_ID = iov.Article '+
                                              '	                 and ACTIVE = ''Y'') as ColNPrice '+
                                              ' from L_ARTICLE_GROUP lag left join '+
                                              '      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join '+
                                              '      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                                              '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join '+
                                              '      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = :PostNo and lpsagd.BUH = :Buh left join '+
                                              '      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '+
                                              '  where convert(bigint,iov.OrderNo) = convert(bigint,:OrderNo)  '+
                                              '    and lsag.SET_ARTICLE_GROUP_ID is not null '+
                                              '    and convert(smallint,iov.Article) not in (select TovarNo '+
                                              '                                               from e_blanks '+
                                              '                                                where Document_id in (select idBlank '+
                                              '                                                                       from l_BlankForVeb '+
                                              '                                                                        where IdVeb = convert(bigint,:OrderNom) '+
                                              '                                                                          and idBlank not in (select id '+
                                              '                                     																		                      from e_blank_head '+
                                              '                                               																							   where Status = -1))) '+
                                              '    and lpsagd.POSTNO is not null '+
                                              'order by lpsagd.SET_ARTICLE_GROUP_ID, ColNPrice';
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
                         SArticleGroup := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;

                         SArticleGroupDouble := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').AsVariant;
                         ArticleGroupDouble := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').AsVariant;

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
                                               +'                                                                             and idBlank not in (select id '
                                               +'                                     																		                      from e_blank_head '
                                               +'                                               																							   where Status = -1))) '
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

                         if (Dlg.quPostBanPostBan.Value = 1) and (quOrdersTypeNakl.asString = 'Возвратная') then
                          begin
                            DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
                            raise Exception.Create(DescriptionBan);
                            Is_PostBan := true;
                          end;

                         Dlg.quPostBan.Close;                          

                         if CheckBlank(PostNo, Dlg.spAddInputOrder.ParamByName('ReasonId').Value, DeliveryDate, OtdelNo, SArticleGroupDouble, ErrMsg) >= 10 then
                          begin
                            //Не Успешно
                            raise Exception.Create(ErrMsg);
                          end; 

                         Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := SArticleGroup ;
                         Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := quPostArtGroup.FieldByName('DAY_DELAY').Value + quPostArtGroup.FieldByName('DAY_DELAY_EXT').Value;

                         quColnPriceForOrder.ParamByName('OrderNo').Value := OrderNo;
                         quColnPriceForOrder.ParamByName('OrderNom').Value := OrderNo;
                         quColnPriceForOrder.ParamByName('PostNo').Value := PostNo;
                         quColnPriceForOrder.ParamByName('PostNom').Value := PostNo;
                         quColnPriceForOrder.ParamByName('Buh').Value := Buh;
                         quColnPriceForOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Text;
//                         quColnPriceForOrder.ParamByName('SET_ARTICLE_GROUP_ID_DELAY').Value := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;
                         quColnPriceForOrder.Open;

                         if quColnPriceForOrder.RecordCount > 0 then isChangeSArticleGroupDoublePred := true
                                                                else isChangeSArticleGroupDoublePred := false;

                         quColnPriceForOrder.First;

                         while not quColnPriceForOrder.Eof do
                           begin
                             if quColnPriceForOrder.FieldByName('COLNPRICE').Value = 0 then quColnPriceForOrder.Next
                                                                                       else
                                                                                         Begin
                                                                                           Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quColnPriceForOrder.FieldByName('COLNPRICE').Value;

                                                                                           if (ColNPrice <> quColnPriceForOrder.FieldByName('COLNPRICE').Value) or (SArticleGroupDoublePred <> SArticleGroupDouble)
                                                                                            then begin
                                                                                                   ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                                                                                                   Dlg.spAddInputOrder.ExecProc;
                                                                                                   documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                                                                                                   LdocumentID := documentID;
                                                                                                 end;
                                                                                           if documentID = 0 then begin
                                                                                                                    documentID := LdocumentID;
                                                                                                                  end;

                                                                                           quSpecBlank :=TMSQuery.Create(nil);
                                                                                           quSpecBlank.Connection:=dmDataModule.DB;
                                                                                           quSpecBlank.SQL.Clear;
                                                                                           quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                                                                                                +'     ,convert(int,KolTov) as KolTov '
                                                                                                                +'     ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                                                                                                +'     ,convert(numeric(18,2),ltrim(rtrim(KomplectacijaOne))) as  KomplectacijaOne '
                                                                                                                +'     ,convert(numeric(18,2),ltrim(rtrim(Komplectacija))) as  Komplectacija '
                                                                                                                +'     ,convert(numeric(18,2),ltrim(rtrim(Residue))) as Residue '
                                                                                                                +'     ,convert(numeric(18,2),ltrim(rtrim(Need))) as Need '
                                                                                                                +' from ImportOrderVebTmp ivt '
                                                                                                                +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                                                                                                +'    and convert(smallint,Article) not in (select TovarNo '
                                                                                                                +'                                                  from e_blanks '
                                                                                                                +'                                                   where Document_id in (select idBlank '
                                                                                                                +'                                                                          from l_BlankForVeb '
                                                                                                                +'                                                                           where IdVeb = convert(bigint,:OrderNom) '
                                                                                                                +'                                                                             and idBlank not in (select id '
                                                                                                                +'																		                                                               from e_blank_head '
                                                                                                                +'																							                                                      where Status = -1))) '
                                                                                                                +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                                                                                                +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                                                                                                +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID  '
                                                                                                                +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                                                                                                +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                                                                                                +'    and ivt.KolTov >0 ';
                                                                                           quSpecBlank.Prepare;
                                                                                           quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                                                                                           quSpecBlank.ParamByName('OrderNom').Value := OrderNo;

                                                                                           quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                                                                                           quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := ArticleGroupDouble;

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
                                                                                           Residue := quSpecBlank.FieldByName('Residue').AsFloat;
                                                                                           Need := quSpecBlank.FieldByName('Need').AsFloat;

                                                                                           if (quSpecBlank.RecordCount = 0) and (CheckOrderForVeb.RecordCount = 0) then begin
                                                                                                                                                                          DelBlankHead (documentId);
                                                                                                                                                                          quSpecBlank.Close;
                                                                                                                                                                        end;
                                                                                           CheckOrderForVeb.Close;

                                                                                           while not quSpecBlank.Eof do
                                                                                               begin
                                                                                                 if (quSpecBlank.FieldByName('KomplectacijaOne').Value > 0) and not (quOrdersTypeNakl.asString = 'Возвратная') then
                                                                                                  begin
                                                                                                    Komplectacija :=  Komplectacija + quSpecBlank.FieldByName('KomplectacijaOne').Value;
                                                                                                    AddTovarInBlanks(DocumentId, 10815, data.UserNo, -1, 1, 1, Komplectacija, Residue, Need);
                                                                                                  end;

                                                                                                 AddTovarInBlanks(documentID,quSpecBlank.FieldByName('Article').Value,data.UserNo,ColNPrice,quSpecBlank.FieldByName('KolTov').Value,quSpecBlank.FieldByName('KolTov').Value,0, Residue, Need);

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

                                                                                           if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                                                                                                      InsInBlankForVeb(OrderNo, documentId);
                                                                                                                                                      if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                                                                                                                                                                           Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                                                                                                                                                                                           Dlg.spModifyLinkBlankReturn.Execute;
                                                                                                                                                                                                         end;
                                                                                                                                                      Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                                                                                                    end
                                                                                                                                               else begin
                                                                                                                                                      if documentID > 0 then Showmessage ('Заказ document_id = '+ IntToStr(documentID)+ ' дополнен');
                                                                                                                                                    end;
                                                                                           quColnPriceForOrder.Next;
                                                                                         End;
                           end;
                         quColnPriceForOrder.Close;

                         if isChangeSArticleGroupDoublePred = true then SArticleGroupDoublePred := SArticleGroupDouble;
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
                                                                                                                        End;
                                                                                    End;

             quPostArtGroup := TMSQuery.Create(nil);
             quPostArtGroup.Connection:= dmDataModule.DB;
             quPostArtGroup.SQL.Clear;
             quPostArtGroup.SQL.Text:='select distinct lag.ARTICLE_GROUP_ID '+
                                      '               ,dag.NAME '+
                                      '               ,lag.ARTICLE_ID '+
                                      '               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID '+
                                      '               ,dsag.NAME as Set_Article_Group_Name '+
                                      '               ,lpsagd.POSTNO '+
                                      '               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay '+
                                      '               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY '+
                                      '               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT '+
                                      '               ,(select distinct COLNPRICE '+
                                      '                  from L_SET_ARTICLE_GROUP lsag left join '+
                                      '                       L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                                      '                       L_POST_SET_ARTGROUP_PRICE lpsap on lpsap.SET_ARTICLE_GROUP_ID = lsag.SET_ARTICLE_GROUP_ID and POSTNO = :PostNom '+
                                      '                   where COLNPRICE is not null '+
                                      '                     and ARTICLE_ID = iov.Article '+
                                      '	                    and ACTIVE = ''Y'') as ColNPrice '+
                                      ' from L_ARTICLE_GROUP lag left join '+
                                      '      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join '+
                                      '      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                                      '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join '+
                                      '      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = :PostNo and lpsagd.BUH = :Buh left join '+
                                      '      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '+
                                      '  where convert(int,iov.OrderNo) = convert(int,:OrderNo)  '+
                                      '    and lsag.SET_ARTICLE_GROUP_ID is not null '+
                                      '    and convert(smallint,iov.Article) not in (select TovarNo '+
                                      '                                               from e_blanks '+
                                      '                                                where Document_id in (select idBlank '+
                                      '                                                                       from l_BlankForVeb '+
                                      '                                                                        where IdVeb = convert(bigint,:OrderNom) '+
                                      '                                                                          and idBlank not in (select id '+
                                      '                                     																		                      from e_blank_head '+
                                      '                                               																							   where Status = -1))) '+
                                      '    and lpsagd.POSTNO is not null '+
                                      'order by lpsagd.SET_ARTICLE_GROUP_ID, ColNPrice ';


// ShowMessage(quPostArtGroup.SQL.Text);
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

               cnt := cnt+1;


                 documentID := 0;
                 SArticleGroup := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;
                 SArticleGroupDouble := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').AsVariant;
                 ArticleGroupDouble := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').AsVariant;

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
                                       +'                                                                           where IdVeb = convert(bigint,:OrderNom) '
                                       +'                                                                             and idBlank not in (select id '
                                       +'                                     																		                      from e_blank_head '
                                       +'                                               																							   where Status = -1))) '
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

                 if (Dlg.quPostBanPostBan.Value = 1) and (quOrdersTypeNakl.asString = 'Возвратная') then
                  begin
                    DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
                    raise Exception.Create(DescriptionBan);
                    Is_PostBan := true;
                  end;

                 Dlg.quPostBan.Close;

                 if CheckBlank(PostNo, Dlg.spAddInputOrder.ParamByName('ReasonId').Value, DeliveryDate, OtdelNo, SArticleGroupDouble, ErrMsg) >= 10 then
                  begin
                    //Не Успешно
                    raise Exception.Create(ErrMsg);
                  end;

                 Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := SArticleGroup ;
                 Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := quPostArtGroup.FieldByName('DAY_DELAY').Value + quPostArtGroup.FieldByName('DAY_DELAY_EXT').Value;
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
                          quAdressPost.SQL.Text:='select AddressNo from AddressPost ap inner join d_sotrud_address dsa on dsa.AddressPost_id = ap.ID where ap.id = :Id and ap.PostNo = :PostNo and dsa.SotrudNo = :SotrudNo ';
                          quAdressPost.Prepare;
                          quAdressPost.ParamByName('Id').Value := quOrders.FieldByName('NoAdress').Value;
                          quAdressPost.ParamByName('PostNo').Value := PostNo;
                          quAdressPost.ParamByName('SotrudNo').Value := quOrders.FieldByName('NoClient').Value;
                          quAdressPost.Open;
                          if (quAdressPost.RecordCount > 0) then Dlg.spAddInputOrder.ParamByName('AddressNo').Value := quAdressPost.FieldByName('AddressNo').Value
                                                            else begin
                                                                   if (documentID = 0) then begin
                                                                                              quSpecBlank :=TMSQuery.Create(nil);
                                                                                              quSpecBlank.Connection:=dmDataModule.DB;
                                                                                              quSpecBlank.SQL.Clear;
                                                                                              quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                                                                                                   +'      ,convert(int,KolTov) as KolTov '
                                                                                                                   +'      ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                                                                                                   +'     ,convert(numeric(18,2),ltrim(rtrim(KomplectacijaOne))) as  KomplectacijaOne '
                                                                                                                   +'     ,convert(numeric(18,2),ltrim(rtrim(Komplectacija))) as  Komplectacija '
                                                                                                                   +'     ,convert(numeric(18,2),ltrim(rtrim(Residue))) as Residue '
                                                                                                                   +'     ,convert(numeric(18,2),ltrim(rtrim(Need))) as Need '
                                                                                                                   +' from ImportOrderVebTmp ivt '
                                                                                                                   +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                                                                                                   +'    and convert(smallint,Article) not in (select TovarNo '
                                                                                                                   +'                                                  from e_blanks '
                                                                                                                   +'                                                   where Document_id in (select idBlank '
                                                                                                                   +'                                                                          from l_BlankForVeb '
                                                                                                                   +'                                                                           where IdVeb = convert(bigint,:OrderNom) '
                                                                                                                   +'                                                                             and idBlank not in (select id '
                                                                                                                   +'																		                                                               from e_blank_head '
                                                                                                                   +'																							                                                      where Status = -1))) '
                                                                                                                   +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                                                                                                   +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                                                                                                   +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID  '
                                                                                                                   +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                                                                                                   +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                                                                                                   +'    and ivt.KolTov >0 ';
                                                                                              quSpecBlank.Prepare;
                                                                                              quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                                                                                              quSpecBlank.ParamByName('OrderNom').Value := OrderNo;
                                                                                              quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                                                                                              quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := ArticleGroupDouble;

                                                                                            //    showmessage(quSpecBlank.SQL.Text);
                                                                                              quSpecBlank.Open;

                                                                                              if quSpecBlank.RecordCount > 0 then
                                                                                               begin

                                                                                                 quPost := TMSQuery.Create(nil);
                                                                                                 quPost.Connection:=dmDataModule.DB;
                                                                                                 quPost.SQL.Clear;
                                                                                                 quPost.SQL.Text :=  ' DECLARE  @DateNakl SMALLDATETIME'
                                                                                                                    +' DECLARE  @IS_ALL SMALLINT'
                                                                                                                    +' DECLARE  @POSTNO DTFkey'
                                                                                                                    +' DECLARE  @SotrudNo SMALLINT'
                                                                                                                    +' DECLARE  @SET_ARTICLE_GROUP_ID bigint'
                                                                                                                    +' SET @DateNakl = convert(smalldatetime,:DateNakl)'
                                                                                                                    +' SET @IS_ALL = convert(SMALLINT,:IS_ALL)'
                                                                                                                    +' SET @POSTNO = convert(bigint,:POSTNO)'
                                                                                                                    +' SET @SotrudNo = convert(smallint,:SotrudNo)'
                                                                                                                    +' SET @SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID)'
                                                                                                                    +' SELECT   u.postno'
                                                                                                                    +'          ,u.name'
                                                                                                                    +'          ,u.namelong'
                                                                                                                    +'          ,u.addressno'
                                                                                                                    +'          ,u.address'
                                                                                                                    +'          ,u.sotrudno'
                                                                                                                    +'          ,u.sotrudname'
                                                                                                                    +'          ,u.otdelname'
                                                                                                                    +'          ,u.otdelno'
                                                                                                                    +'          ,u.contract_num'
                                                                                                                    +'          ,u.realdaydelay'
                                                                                                                    +'          ,u.postdaydelay'
                                                                                                                    +'          ,CASE when u.realdaydelay > u.postdaydelay THEN ''Y'''
                                                                                                                    +'                when ((u.datenakl is not null) and (select isnull(max(1),0) from l_firm_prop where postNo=u.PostNo and prop_id=22)=1)'
                                                                                                                    +'                                               and (u.is_enable_stop_period = 0) THEN ''Y'''
                                                                                                                    +'                                                     else ''N'''
                                                                                                                    +'           end  as is_stop'
                                                                                                                    +'          ,SET_ARTICLE_GROUP_NAME'
                                                                                                                    +'          ,SET_ARTICLE_GROUP_ID'
                                                                                                                    +'          ,BUH'
                                                                                                                    +'          ,DAY_DELAY'
                                                                                                                    +'          ,DAY_DELAY_EXT'
                                                                                                                    +'          ,Buh_type_name'
                                                                                                                    +'          ,AddressID'
                                                                                                                    +' FROM     (SELECT p.postno'
                                                                                                                    +'                  ,p.name'
                                                                                                                    +'                  ,p.namelong'
                                                                                                                    +'                  ,ap.addressno'
                                                                                                                    +'                  ,ap.address'
                                                                                                                    +'                  ,s.sotrudno'
                                                                                                                    +'                  ,s.sotrudname'
                                                                                                                    +'                  ,o.otdelname'
                                                                                                                    +'                  ,o.otdelno'
                                                                                                                    +'                  ,(SELECT Max(num)'
                                                                                                                    +'                     FROM   d_firm_contract c'
                                                                                                                    +'                      WHERE  type_id = 1'
                                                                                                                    +'                        AND ourfirmno = (select PostNo from d_our_firm)'
                                                                                                                    +'                        AND postno = p.postno'
                                                                                                                    +'                        AND (@DateNakl BETWEEN c.create_date AND c.expire_date)) AS contract_num'
                                                                                                                    +'                  ,Datediff(dd,isnull(pdel.DateNakl,@DateNakl),@DateNakl) AS realdaydelay'
                                                                                                                    +'                  ,Isnull(pdel.DAY_DELAY,0)+isnull(pdel.DAY_DELAY_EXT,0) AS postdaydelay'
                                                                                                                    +'                  ,pdel.SET_ARTICLE_GROUP_NAME'
                                                                                                                    +'                  ,pdel.SET_ARTICLE_GROUP_ID'
                                                                                                                    +'                  ,pdel.BUH'
                                                                                                                    +'                  ,pdel.DAY_DELAY'
                                                                                                                    +'                  ,pdel.DAY_DELAY_EXT'
                                                                                                                    +'                  ,pdel.datenakl'
                                                                                                                    +'                  ,(select Buh_type_name from d_buh_type where buh=pdel.BUH) as Buh_type_name'
                                                                                                                    +'                  ,ap.id as AddressID'
                                                                                                                    +'                  ,pdel.is_stop'
                                                                                                                    +'                  ,pdel.is_start'
                                                                                                                    +'                  ,pdel.is_enable_stop_period'
                                                                                                                    +'           FROM   post p'
                                                                                                                    +'                  INNER JOIN dbo.fu_first_free_nakl(@DateNakl,@PostNo,-1) pdel on pdel.PostNo=p.PostNo'
                                                                                                                    +'                  INNER JOIN addresspost ap'
                                                                                                                    +'                    ON p.postno = ap.postno'
                                                                                                                    +'                  LEFT OUTER JOIN d_sotrud_address a'
                                                                                                                    +'                    ON a.addresspost_id = ap.id'
                                                                                                                    +'                  LEFT OUTER JOIN sotrud s'
                                                                                                                    +'                    ON a.sotrudno = s.sotrudno'
                                                                                                                    +'                  LEFT OUTER JOIN vidotdel o'
                                                                                                                    +'                    ON s.sotrudotdel = o.otdelno'
                                                                                                                    +'           WHERE  (p.PostNo=@POSTNO or @POSTNO=0)'
                                                                                                                    +'           AND (s.SotrudNo = @SotrudNo or @SotrudNo = 0)'
                                                                                                                    +'           AND (pdel.SET_ARTICLE_GROUP_ID = @SET_ARTICLE_GROUP_ID or @SET_ARTICLE_GROUP_ID = 0)'
                                                                                                                    +'           AND o.otdelno IS NOT NULL'
                                                                                                                    +'           AND ap.address IS NOT NULL'
                                                                                                                    +'           AND p.trash = 0) u'
                                                                                                                    +' WHERE    (u.contract_num IS NOT NULL OR @IS_ALL = 1)';

                                                                                                 quPost.Prepare;
                                                                                                 quPost.ParamByName('is_all').AsInteger := 0;
                                                                                                 quPost.ParamByName('DateNakl').AsDateTime := DeliveryDate;
                                                                                                 quPost.ParamByName('PostNo').Value:= PostNo;
                                                                                                 quPost.ParamByName('SotrudNo').Value:= quOrders.FieldByName('NoClient').Value;
                                                                                                 quPost.ParamByName('SET_ARTICLE_GROUP_ID').Value:= SArticleGroupDouble;
                                                                                                 quPost.Open;

                                                                                                 if quPost.RecordCount = 0 then begin
                                                                                                                                  quPost.Close;
                                                                                                                                  raise Exception.Create(' Нельзя создавать заказ! '+#13#10+
                                                                                                                                                         'Сотрудник '+quOrders.FieldByName('NameClient').Value+#13#10+
                                                                                                                                                         'Не может создать заказ для партнера '+quOrders.FieldByName('NameContractor').Value+#13#10+
                                                                                                                                                         'по адресу: '+quOrders.FieldByName('Adress').Value+#13#10+
                                                                                                                                                         'и набору отсрочки '+quPostArtGroup.FieldByName('Set_Article_Group_Name').AsString+'!'+#13#10+
                                                                                                                                                         'Необходимо исправить заказ на сайте, перевтянуть его и повторить попытку!');
                                                                                                                                end;
                                                                                                 if quPost.RecordCount = 1 then begin
                                                                                                                                  Dlg.spAddInputOrder.ParamByName('AddressNo').Value := quPost.FieldByName('AddressNo').AsInteger;
                                                                                                                                end;

                                                                                                 if quPost.RecordCount > 1 then begin
                                                                                                                                  Showmessage('На сайте не верно указан номер адреса!'+#13#10+
                                                                                                                                              'Установите правильный номер адреса на сайте что бы это сообщение не появлялось в дальнейшем');
                                                                                                                                  Showmessage('Выберите адрес доставки по сотруднику: ' + quOrders.FieldByName('NameClient').Value + ' и группе: ' + quPostArtGroup.FieldByName('Set_Article_Group_Name').AsString);
                                                                                                                                  RetPostForRashod := PostForRashod(DeliveryDate,PostNo,quOrders.FieldByName('NoClient').Value,SArticleGroupDouble);
                                                                                                                                  if RetPostForRashod.PostNo > 0 then Begin
                                                                                                                                                                        Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                                                                                                                                                      End
                                                                                                                                                                  else raise Exception.Create(' Необходимо выбрать адрес доставки по сотруднику!'+#13#10+
                                                                                                                                                                                              'Возможно к контрагенту не сопоставлен адрес доставки по сотрудникиу.'+#13#10+
                                                                                                                                                                                              'Для того чтобы выбрать сопоставте контрагенту адрес доставки по сотруднику.');
                                                                                                                                end;
                                                                                                 quPost.Close;

                                                                                               end;
                                                                                              quSpecBlank.Close;
                                                                                            end;
                                                                 end;
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
//                 quColnPriceForOrder.ParamByName('SET_ARTICLE_GROUP_ID_DELAY').Value := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;
                 quColnPriceForOrder.Open;

                 if quColnPriceForOrder.RecordCount > 0 then isChangeSArticleGroupDoublePred := true
                                                        else isChangeSArticleGroupDoublePred := false;

                 quColnPriceForOrder.First;

                 while not quColnPriceForOrder.Eof do
                    begin
                      if quColnPriceForOrder.FieldByName('COLNPRICE').Value > 0
                       then Begin
                              Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                              if (ColNPrice <> quColnPriceForOrder.FieldByName('COLNPRICE').Value)
                              or (SArticleGroupDoublePred <> SArticleGroupDouble)
                               then begin
                                      ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                                      Dlg.spAddInputOrder.ExecProc;
                                      documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                                      LdocumentID := documentID;
                                    end;

                              if documentID = 0 then begin
                                                       documentID := LdocumentID;
                                                     end;

                              quSpecBlank :=TMSQuery.Create(nil);
                              quSpecBlank.Connection:=dmDataModule.DB;
                              quSpecBlank.SQL.Clear;
                              quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                                   +'      ,convert(int,KolTov) as KolTov '
                                                   +'      ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                                   +'     ,convert(numeric(18,2),ltrim(rtrim(KomplectacijaOne))) as  KomplectacijaOne '
                                                   +'     ,convert(numeric(18,2),ltrim(rtrim(Komplectacija))) as  Komplectacija '
                                                   +'     ,convert(numeric(18,2),ltrim(rtrim(Residue))) as Residue '
                                                   +'     ,convert(numeric(18,2),ltrim(rtrim(Need))) as Need '
                                                   +' from ImportOrderVebTmp ivt '
                                                   +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                                   +'    and convert(smallint,Article) not in (select TovarNo '
                                                   +'                                                  from e_blanks '
                                                   +'                                                   where Document_id in (select idBlank '
                                                   +'                                                                          from l_BlankForVeb '
                                                   +'                                                                           where IdVeb = convert(bigint,:OrderNom) '
                                                   +'                                                                             and idBlank not in (select id '
                                                   +'																		                                                               from e_blank_head '
                                                   +'																							                                                      where Status = -1))) '
                                                   +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                                   +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                                   +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID  '
                                                   +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                                   +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                                   +'    and ivt.KolTov >0 ';
                              quSpecBlank.Prepare;
                              quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                              quSpecBlank.ParamByName('OrderNom').Value := OrderNo;
                              quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                              quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := ArticleGroupDouble;

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
                              Residue := quSpecBlank.FieldByName('Residue').AsFloat;
                              Need := quSpecBlank.FieldByName('Need').AsFloat;

                              if (quSpecBlank.RecordCount = 0) and (CheckOrderForVeb.RecordCount = 0) then begin
                                                                                                             DelBlankHead (documentId);
                                                                                                             quSpecBlank.Close;
                                                                                                           end;
                              CheckOrderForVeb.Close;
                              while not quSpecBlank.Eof do
                               begin
                                 if (quSpecBlank.FieldByName('KomplectacijaOne').Value > 0) and not (quOrdersTypeNakl.asString = 'Возвратная')
                                  then begin
                                         Komplectacija :=  Komplectacija + quSpecBlank.FieldByName('KomplectacijaOne').Value;
                                         AddTovarInBlanks(DocumentId, 10815, data.UserNo, -1, 1, 1, Komplectacija, Residue, Need);
                                       end;

                                 AddTovarInBlanks(documentID,quSpecBlank.FieldByName('Article').Value,data.UserNo,ColNPrice,quSpecBlank.FieldByName('KolTov').Value,quSpecBlank.FieldByName('KolTov').Value,0, Residue, Need);

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

                              if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                                         InsInBlankForVeb(OrderNo, DocumentId);
                                                                                         if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                                                                                                              Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                                                                                                                              Dlg.spModifyLinkBlankReturn.Execute;
                                                                                                                                            end;
                                                                                         Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                                       end
                                                                                  else begin
                                                                                         if documentID > 0 then Showmessage ('Заказ document_id = '+ IntToStr(documentID)+ ' дополнен');
                                                                                       end;
                            End;
                      quColnPriceForOrder.Next;
                    end;
                 quColnPriceForOrder.Close;

                 if isChangeSArticleGroupDoublePred = true then SArticleGroupDoublePred := SArticleGroupDouble;
                 quPostArtGroup.Next;
               end;//quPostArtGroup.Eof
               quPostArtGroup.Close;

           End;
 }

     QueryPerformanceCounter(C2);

     CreateOrderTime := StrToFloat(FormatFloat('0.000', ((C2 - C1) / (iCounterPerSec))));

     dmDataModule.ExecSQL('declare @cnt int select @cnt = count(*) from CreateBlancWithSite where OrderVeb = :p1_OrderVeb if @cnt = 0 insert into CreateBlancWithSite (OrderVeb, TimeCreate)  values (:p2_OrderVeb, convert(decimal(5,3),:p3_TimeCreate))', [OrderNo,OrderNo,CreateOrderTime]);

     ShowMessage(' Внешний заказ создавался:'+#13#10+
                 FormatFloat('0.000', ((C2 - C1) / (iCounterPerSec))) + ' сек.'+#13#10+
                 ' По ветке 4');
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
                              '               ,dsag.NAME as Set_Article_Group_Name '+
                              '               ,lpsagd.POSTNO '+
                              '               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay '+
                              '               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY '+
                              '               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT '+
                              '               ,(select distinct COLNPRICE '+
                              '                  from L_SET_ARTICLE_GROUP lsag left join '+
                              '                       L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                              '                       L_POST_SET_ARTGROUP_PRICE lpsap on lpsap.SET_ARTICLE_GROUP_ID = lsag.SET_ARTICLE_GROUP_ID and POSTNO = :PostNom '+
                              '                   where COLNPRICE is not null '+
                              '                     and ARTICLE_ID = iov.Article '+
                              '	                 and ACTIVE = ''Y'') as ColNPrice '+
                              ' from L_ARTICLE_GROUP lag left join '+
                              '      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join '+
                              '      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join '+
                              '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join '+
                              '      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = :PostNo and lpsagd.BUH = :Buh left join '+
                              '      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '+
                              '  where convert(int,iov.OrderNo) = convert(int,:OrderNo)  '+
                              '    and lsag.SET_ARTICLE_GROUP_ID is not null '+
                              '    and convert(smallint,iov.Article) not in (select TovarNo '+
                              '                                               from e_blanks '+
                              '                                                where Document_id in (select idBlank '+
                              '                                                                       from l_BlankForExite '+
                              '                                                                        where IdExite = convert(bigint,:OrderNom) '+
                              '                                                                          and idBlank not in (select id '+
                              '                                     																		                      from e_blank_head '+
                              '                                               																							   where Status = -1))) '+
                              '    and lpsagd.POSTNO is not null '+
                              'order by lpsagd.DAY_DELAY, ColNPrice';

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

         SArticleGroupDouble := quPostArtGroup.FieldByName('DAY_DELAY').AsVariant; //quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').AsVariant;
         ArticleGroupDouble := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').AsVariant;

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
                               +'                                                                           where IdExite = convert(bigint,:OrderNom) '
                               +'                                                                             and idBlank not in (select id '
                               +'                                     														    				                      from e_blank_head '
                               +'                                               											    												   where Status = -1))) '
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

         if (Dlg.quPostBanPostBan.Value = 1) and (quOrdersTypeNakl.asString = 'Возвратная') then
          begin
            DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
            raise Exception.Create(DescriptionBan);
            Is_PostBan := true;
          end;

         Dlg.quPostBan.Close;          

         if CheckBlank(PostNo, Dlg.spAddInputOrder.ParamByName('ReasonId').Value, DeliveryDate, OtdelNo, SArticleGroupDouble, ErrMsg) >= 10 then
          begin
            //Не Успешно
            raise Exception.Create(ErrMsg);
          end;

         Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := SArticleGroup ;
         Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := quPostArtGroup.FieldByName('DAY_DELAY').Value; // + quPostArtGroup.FieldByName('DAY_DELAY_EXT').Value;

         quColnPriceForOrder.ParamByName('OrderNo').Value := OrderNo;
         quColnPriceForOrder.ParamByName('OrderNom').Value := OrderNo;
         quColnPriceForOrder.ParamByName('PostNo').Value := PostNo;
         quColnPriceForOrder.ParamByName('PostNom').Value := PostNo;
         quColnPriceForOrder.ParamByName('Buh').Value := Buh;
         quColnPriceForOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Text;
//         quColnPriceForOrder.ParamByName('SET_ARTICLE_GROUP_ID_DELAY').Value := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID_delay').Text;

         quColnPriceForOrder.Open;

         if quColnPriceForOrder.RecordCount > 0 then isChangeSArticleGroupDoublePred := true
                                                else isChangeSArticleGroupDoublePred := false;

         quColnPriceForOrder.First;

         while not quColnPriceForOrder.Eof do
          begin
            if quColnPriceForOrder.FieldByName('COLNPRICE').Value > 0
             then Begin
                    Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                    if (ColNPrice <> quColnPriceForOrder.FieldByName('COLNPRICE').Value)
                    or (SArticleGroupDoublePred <> SArticleGroupDouble)
                     then begin
                            ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                            Dlg.spAddInputOrder.ExecProc;
                            documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                            LdocumentID := documentID;
                          end;

                    if documentID = 0 then begin
                                             documentID := LdocumentID;
                                           end;

                    quSpecBlank :=TMSQuery.Create(nil);
                    quSpecBlank.Connection:=dmDataModule.DB;
                    quSpecBlank.SQL.Clear;
                    quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                                         +'      ,convert(decimal(18,3),ivt.KolTov) as KolTov'
                                         +'      ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                                         +'     ,convert(numeric(18,2),ltrim(rtrim(KomplectacijaOne))) as  KomplectacijaOne '
                                         +'     ,convert(numeric(18,2),ltrim(rtrim(Komplectacija))) as  Komplectacija '
                                         +'     ,convert(numeric(18,2),ltrim(rtrim(Residue))) as Residue '
                                         +'     ,convert(numeric(18,2),ltrim(rtrim(Need))) as Need '
                                         +' from ImportOrderVebTmp ivt '
                                         +'  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
                                         +'    and convert(smallint,Article) not in (select TovarNo '
                                         +'                                                  from e_blanks '
                                         +'                                                   where Document_id in (select idBlank '
                                         +'                                                                          from l_BlankForExite '
                                         +'                                                                           where IdExite = convert(bigint,:OrderNom) '
                                         +'                                                                             and idBlank not in (select id '
                                         +'																		                                                               from e_blank_head '
                                         +'																							                                                      where Status = -1))) '
                                         +'    and convert(bigint,Article) in (select lag.ARTICLE_ID '
                                         +'                                     from L_SET_ARTICLE_GROUP lsag left join '
                                         +'                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID  '
                                         +'                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                         +'                                        and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                         +'    and ivt.KolTov >0 ';
                    quSpecBlank.Prepare;
                    quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
                    quSpecBlank.ParamByName('OrderNom').Value := OrderNo;

                    quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
                    quSpecBlank.ParamByName('ARTICLE_GROUP_ID').Value := ArticleGroupDouble;

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
                    Residue := quSpecBlank.FieldByName('Residue').AsFloat;
                    Need := quSpecBlank.FieldByName('Need').AsFloat;

                    if (quSpecBlank.RecordCount = 0) and (CheckOrderForVeb.RecordCount = 0) then begin
                                                                                                   DelBlankHead (documentId);
                                                                                                   quSpecBlank.Close;
                                                                                                 end;
                    CheckOrderForVeb.Close;
                    while not quSpecBlank.Eof do
                     begin
                       if (quSpecBlank.FieldByName('KomplectacijaOne').Value > 0) and not (quOrdersTypeNakl.asString = 'Возвратная')
                        then begin
                               Komplectacija :=  Komplectacija + quSpecBlank.FieldByName('KomplectacijaOne').Value;
                               AddTovarInBlanks(DocumentId, 10815, data.UserNo, -1, 1, 1, Komplectacija, Residue, Need);
                             end;

                       AddTovarInBlanks(documentID,quSpecBlank.FieldByName('Article').Value,data.UserNo,ColNPrice,quSpecBlank.FieldByName('KolTov').Value,quSpecBlank.FieldByName('KolTov').Value,0, Residue, Need);

                       quSpecBlank.Next;
                     end;

                    CheckOrderForVeb := TMSQuery.Create(nil);
                    CheckOrderForVeb.Connection:= dmDataModule.DB;
                    CheckOrderForVeb.SQL.Clear;
                    CheckOrderForVeb.SQL.Text := 'select * from l_BlankForExit where IdVeb = :IdVeb and IdBlank = :IdBlank';
                    CheckOrderForVeb.ParamByName('IdVeb').Value := OrderNo;
                    CheckOrderForVeb.ParamByName('IdBlank').Value := documentID;
                    CheckOrderForVeb.Open;
                    if CheckOrderForVeb.RecordCount > 0 then isRun := false;

                    if (isRun = true) and (quSpecBlank.RecordCount > 0) then begin
                                                                               InsInBlankForVeb(OrderNo, DocumentId);
                                                                               if (quOrdersTypeNakl.asString = 'Возвратная') then begin
                                                                                                                                    Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                                                                                                                    Dlg.spModifyLinkBlankReturn.Execute;
                                                                                                                                  end;
                                                                               Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                             end
                                                                        else begin
                                                                               if documentID > 0 then Showmessage ('Заказ document_id = '+ IntToStr(documentID)+ ' дополнен');
                                                                             end;
                  End;
            quColnPriceForOrder.Next;
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
         quInsInl_BlankForExite.SQL.Text:='insert into l_BlankForExite (IdExite,IdBlank,OrderDate) '
                                       +'     values (:IdExite,:IdBlank,:OrderDate)';
         quInsInl_BlankForExite.ParamByName('IdExite').Value := OrderNo;
         quInsInl_BlankForExite.ParamByName('idBlank').Value := documentID;
         quInsInl_BlankForExite.ParamByName('OrderDate').Value := OrderDate;
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




         if isChangeSArticleGroupDoublePred = true then SArticleGroupDoublePred := SArticleGroupDouble;
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
                                +'         				 where IdVeb = :OrderNo) '
                                +'    and Status <> -1 ';
   quSummaBlanksHead.ParamByName('OrderNo').Value := OrderNo;
   quSummaBlanksHead.Open;

   quListBlanksDocId := TMSQuery.Create(nil);
   quListBlanksDocId.Connection := dmDataModule.DB;
   quListBlanksDocId.SQL.Clear;
   quListBlanksDocId.SQL.Text := 'select id as Id '
                                +'     , VidNaklNo as VidNaklNo '
                                +'     , DateNakl as DateNakl '
                                +' from e_blank_head '
                                +'  where ID in (select idBlank '
                                +'                from l_BlankForVeb '
                                +'		        		 where IdVeb = :OrderNo) '
                                +'    and Status <> -1 ';
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

    CountTovarNotBlanks := 0;

   if (quListBlanksDocId.RecordCount = 1) then
                                          begin
                                            ListDocumentId := quListBlanksDocId.FieldByName('Id').AsString;
                                            while not quListTovarNo.Eof do
                                             begin
                                               ListTovarNotBlanks := ListTovarNotBlanks +#13#10+ quListTovarNo.FieldByName('ListTovarNo').AsString;
                                               CountTovarNotBlanks := CountTovarNotBlanks +1;
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
                                                   CountTovarNotBlanks := CountTovarNotBlanks +1;
                                                   quListTovarNo.Next;
                                                 end;
                                                end;


   if (quOrderSumma.FieldByName('OrderSumma').AsFloat <> quSummaBlanksHead.FieldByName('SummaBlanks').AsFloat) then
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

    if (quOrderSumma.FieldByName('OrderSumma').AsFloat = quSummaBlanksHead.FieldByName('SummaBlanks').AsFloat) and (CountTovarNotBlanks > 0) then
     begin
       ShowMessage(' Проверте заказ на сайте!' +#13#10+
                   'Номер заказа на сайте ' +  inttostr(OrderNo) +#13#10+
                   'Список заказов в базе: ' +#13#10+ ListDocumentId);
       ShowMessage(' Список товаров не распределенных в базу с сайта:' +#13#10+ ListTovarNotBlanks);
     end;
     
   quListBlanksDocId.First;
   while not quListBlanksDocId.Eof do
    begin
      quDocum := TMSQuery.Create(nil);
      quDocum.Connection:= dmDataModule.DB;
      quDocum.SQL.Clear;
      quDocum.SQL.Text:='select PostNo, Buh, VidtovGroupId, DateNakl from e_blank_head where id = :Document_id';
      quDocum.ParamByName('Document_id').Value := quListBlanksDocId.FieldByName('Id').AsInteger;
      quDocum.Open;

      Dlg.quPostBanPay.Close;
      Dlg.quPostBanPay.Params.ParamByName('PostNo').Value := quDocum.FieldByName('PostNo').Value;
      Dlg.quPostBanPay.Params.ParamByName('set_article_group_id').Value := quDocum.FieldByName('VidtovGroupId').Value;
      Dlg.quPostBanPay.Params.ParamByName('Buh').Value := quDocum.FieldByName('Buh').Value;
      Dlg.quPostBanPay.Open;

      Dlg.quSummaDolga.Close;
      Dlg.quSummaDolga.Params.ParamByName('PostNo').Value := quDocum.FieldByName('PostNo').Value;
      Dlg.quSummaDolga.Params.ParamByName('set_article_group_id').Value := quDocum.FieldByName('VidtovGroupId').Value;
      dlg.quSummaDolga.Params.ParamByName('Buh').Value := quDocum.FieldByName('Buh').Value;
      Dlg.quSummaDolga.Open;

      Dlg.quControlPayBan.Close;
      Dlg.quControlPayBan.Params.ParamByName('PostNo').Value := quDocum.FieldByName('PostNo').Value;
      Dlg.quControlPayBan.Params.ParamByName('set_article_group_id').Value := quDocum.FieldByName('VidtovGroupId').Value;;
      Dlg.quControlPayBan.Params.ParamByName('Buh').Value := quDocum.FieldByName('Buh').Value;
      Dlg.quControlPayBan.Params.ParamByName('DateNakl').Value := quDocum.FieldByName('DateNakl').Value;
      Dlg.quControlPayBan.Open;

      quSumDocum := TMSQuery.Create(nil);
      quSumDocum.Connection:= dmDataModule.DB;
      quSumDocum.SQL.Clear;
      quSumDocum.SQL.Text:='select isnull(SUM(isnull(KolOrd,0) * isnull(Boss_price,0)),0) as summ from e_blanks where Document_id = :Document_id';
      quSumDocum.ParamByName('Document_id').Value := quListBlanksDocId.FieldByName('Id').AsInteger;
      quSumDocum.Open;

      SumDoc := quSumDocum.FieldByName('summ').Value;

      if dlg.quControlPayBan.RecordCount > 0 then Is_ControlPostBanPay := false else Is_ControlPostBanPay := true;

      if (((Dlg.quSummaDolgaSUMMA_ECO.Value + SumDoc) > Dlg.quPostBanPayPayBan.Value) and (Dlg.quPostBanPayPayBan.Value <>0)
                                                                                      and (Is_ControlPostBanPay = True)) then
       begin
         DescriptionBanPay := 'Превышен лимит! ' +#13#10+ 'Сумма дебиторской задолженности с учетом текущего заказа ' + FloatToStr(Dlg.quSummaDolgaSUMMA_ECO.Value + quSumDocum.FieldByName('summ').Value)
                                                 +#13#10+ 'Допустимый лимит '+ FloatToStr(Dlg.quPostBanPayPayBan.Value)
                                                 +#13#10+ 'Заказ будет помечен как удаленный!'
                                                 +#13#10+ 'Номер заказа ' + quListBlanksDocId.FieldByName('Id').AsString;
         ShowMessage(DescriptionBanPay);
         Dlg3 := TMlekoBlankListForm.Create(Application);
         Dlg3.spDelInputOrder.Close;
         Dlg3.spDelInputOrder.Params.ParamByName('document_id').Value := quListBlanksDocId.FieldByName('Id').AsInteger;
         Dlg3.spDelInputOrder.ExecProc;
         Dlg3.Free;
         is_NotCreate := True;
       end;

      VidNo:= quListBlanksDocId.FieldByName('VidNaklNo').AsInteger;

      if ((VidNo = 3) and (not is_NotCreate)) then begin
                                                     Dlg3 := TMlekoBlankListForm.Create(Application);
                                                     Dlg3.spBlankCorrelation.Close;
                                                     Dlg3.spBlankCorrelation.Params.ParamByName('p_document_id').Value := quListBlanksDocId.FieldByName('Id').AsInteger;
                                                     Dlg3.spBlankCorrelation.Params.ParamByName('p_dateNakl').Value := quListBlanksDocId.FieldByName('DateNakl').AsDateTime;
                                                     Dlg3.spBlankCorrelation.ExecProc;
                                                     Dlg3.Free;
                                                   end;

      is_NotCreate := False;
      quListBlanksDocId.Next;
    end;



   quDocum.Close;
   quSumDocum.Close;
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

procedure TMlekoBlankListOutSideForm.DelBlankHead (DocumentId : integer);
var
  quDelInputOrder : TMSQuery;
begin
  quDelInputOrder := TMSQuery.Create(nil);
  quDelInputOrder.Connection:=dmDataModule.DB;
  quDelInputOrder.SQL.Clear;
  quDelInputOrder.SQL.Text:= 'delete e_blank_head '+
                             ' where id = :id';
  quDelInputOrder.Prepare;
  quDelInputOrder.ParamByName('id').Value := DocumentId;
  quDelInputOrder.Execute;
end;

procedure TMlekoBlankListOutSideForm.InsInBlankForVeb(OrderNo, DocumentId : integer);
var
  quInsInl_BlankForVeb : TMSQuery;
begin
  quInsInl_BlankForVeb :=TMSQuery.Create(nil);
  quInsInl_BlankForVeb.Connection:=dmDataModule.DB;
  quInsInl_BlankForVeb.SQL.Clear;
  quInsInl_BlankForVeb.SQL.Text:='insert into l_BlankForVeb (IdVeb,IdBlank,OrderDate) '
                                +'     values (:IdVeb,:IdBlank,:OrderDate)';
  quInsInl_BlankForVeb.ParamByName('IdVeb').Value := OrderNo;
  quInsInl_BlankForVeb.ParamByName('idBlank').Value := DocumentID;
  quInsInl_BlankForVeb.ParamByName('OrderDate').Value := quOrdersOrderDate.Value;
  quInsInl_BlankForVeb.Execute;
  quInsInl_BlankForVeb.Close;
end;

procedure TMlekoBlankListOutSideForm.AddTovarInBlanks (DocumentId, TovarNo, UserNo, ColNPrice : integer; KolBeg, KolOrd, Boss_Price, Residue, Need : double);
var
  quPrice : TMSQuery;
  ErrMsg : String;
  isRun : boolean;
begin
  isRun := true;

  spEditBlankPosition.ParamByName('document_id').Value := DocumentID;
  spEditBlankPosition.ParamByName('tovarNo').Value := TovarNo;
  spEditBlankPosition.ParamByName('UserNo').Value := UserNo;
  spEditBlankPosition.ParamByName('KolBeg').Value := KolBeg;
  spEditBlankPosition.ParamByName('KolOrd').Value := KolOrd;
  spEditBlankPosition.ParamByName('Residue').Value := Residue;
  spEditBlankPosition.ParamByName('Need').Value := Need;

  if ColNPrice > 0 then begin
                          quPrice :=TMSQuery.Create(nil);
                          quPrice.Connection:=dmDataModule.DB;
                          quPrice.SQL.Clear;
                          quPrice.SQL.Text:= 'select isnull(case when :ColnPrice = 1 then Isnull(Price,0)             '
                                            +'                   when :ColnPrice = 2 then Isnull(Price1,0)            '
                                            +'                   when :ColnPrice = 3 then Isnull(Price2,0)            '
                                            +'                   when :ColnPrice = 4 then Isnull(Price3,0)            '
                                            +'                   when :ColnPrice = 5 then Isnull(Price4,0)            '
                                            +'                   when :ColnPrice = 6 then Isnull(Price5,0)            '
                                            +'                   when :ColnPrice = 7 then Isnull(Price6,0)            '
                                            +'                   when :ColnPrice = 8 then Isnull(Price7,0)            '
                                            +'                   when :ColnPrice = 10 then Isnull(Price8,0)           '
                                            +'                   when :ColnPrice = 11 then Isnull(Price9,0)           '
                                            +'                   when :ColnPrice = 12 then Isnull(Price10,0)          '
                                            +'                   when :ColnPrice = 13 then Isnull(Price13,0)          '
                                            +'                   when :ColnPrice = 14 then Isnull(Price14,0)          '
                                            +'                   when :ColnPrice = 15 then Isnull(Price15,0)          '
                                            +'                   when :ColnPrice = 9 then Isnull(AvgPriceIn,0)        '
                                            +'                   when :ColnPrice = 17 then Isnull(pfv.PriceVeb, 0)    '
                                            +'                   when :ColnPrice = 18 then Isnull(pfv.PriceInInst, 0) '
                                            +'              end,0) as Price                                           '
                                            +' from Ostatok o                                                         '
                                            +'     ,PriceForVeb pfv                                                   '
                                            +'  where o.TovarNo = :TovarNo                                            '
                                            +'    and o.TovarNo = pfv.TovarNo                                         ';
                          quPrice.Prepare;
                          quPrice.ParamByName('TovarNo').Value := TovarNo;
                          quPrice.ParamByName('ColnPrice').Value := ColNPrice;
                          quPrice.Open;
                          if ((quPrice.FieldByName('Price').Value = 0) or (quPrice.FieldByName('Price').Value = Null)) then begin
                                                                                                                              isRun := false;
                                                                                                                              ErrMsg := 'Не расцененный товар!' +#13#10+
                                                                                                                              //          'Создание заказа остановлено! Сообщите программисту!' +#13#10+
                                                                                                                                        'Код товара ' + IntToStr(TovarNo) +#13#10+
                                                                                                                                        'Номер заказа на сайте '+ IntToStr(quOrdersOrderNo.Value);
                                                                                                                              ShowMessage(ErrMsg);
                                                                                                                              //raise Exception.Create(ErrMsg);
                                                                                                                            end
                                                                                                                       else spEditBlankPosition.ParamByName('Boss_Price').Value := quPrice.FieldByName('Price').Value;
//                          ShowMessage(quPrice.FieldByName('Price').AsString);
                          quPrice.Close;
                        end
                   else spEditBlankPosition.ParamByName('Boss_Price').Value := Boss_Price;
  if isRun = true then spEditBlankPosition.ExecProc else spEditBlankPosition.Cancel;
end;

procedure TMlekoBlankListOutSideForm.DBGridEhOrdersDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField;
  State: TGridDrawState);
begin
  inherited;
  if dsOrders.DataSet.FieldByName('StateBlank').Value = 3 then
   begin
      DBGridEhOrders.Canvas.Brush.Color := $00C4FF88;;
      DBGridEhOrders.Canvas.Font.Color := ClBlack;
    end;
  if dsOrders.DataSet.FieldByName('StateBlank').Value = 2 then
   begin
      DBGridEhOrders.Canvas.Brush.Color := clInactiveCaptionText;
      DBGridEhOrders.Canvas.Font.Color := ClBlack;
    end;
  if dsOrders.DataSet.FieldByName('StateBlank').Value = 1 then
   begin
      DBGridEhOrders.Canvas.Brush.Color := clAqua;
      DBGridEhOrders.Canvas.Font.Color := ClBlack;
    end;
  DBGridEhOrders.DefaultDrawDataCell(Rect,Field,State);
end;

procedure TMlekoBlankListOutSideForm.DBGridEhOrdersDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if dsOrders.DataSet.FieldByName('StateBlank').Value = 3 then
   begin
      DBGridEhOrders.Canvas.Brush.Color := $00C4FF88;;
      DBGridEhOrders.Canvas.Font.Color := ClBlack;
    end;
  if dsOrders.DataSet.FieldByName('StateBlank').Value = 2 then
   begin
      DBGridEhOrders.Canvas.Brush.Color := clInactiveCaptionText;
      DBGridEhOrders.Canvas.Font.Color := ClBlack;
    end;
  if dsOrders.DataSet.FieldByName('StateBlank').Value = 1 then
   begin
      DBGridEhOrders.Canvas.Brush.Color := clAqua;
      DBGridEhOrders.Canvas.Font.Color := ClBlack;
    end;

  if (dsOrders.DataSet.FieldByName('StateBlank').Value = 1) and
     (dsOrders.DataSet.FieldByName('IsDelOrderBlank').Value = 1) and
     ((quOrdersCntBlanks.Value mod quOrdersCntDelBlanks.Value) > 0) then
   begin
      DBGridEhOrders.Canvas.Brush.Color := clRed;
      DBGridEhOrders.Canvas.Font.Color := ClBlack;
    end;
  if (dsOrders.DataSet.FieldByName('StateBlank').Value = 3) and
     (dsOrders.DataSet.FieldByName('IsDelOrderBlank').Value = 1) and
     ((quOrdersCntBlanks.Value mod quOrdersCntDelBlanks.Value) > 0) then
   begin
      DBGridEhOrders.Canvas.Brush.Color := clRed;
      DBGridEhOrders.Canvas.Font.Color := ClBlack;
    end;
  DBGridEhOrders.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TMlekoBlankListOutSideForm.DBGridEhOrdersTitleBtnClick(
  Sender: TObject; ACol: Integer; Column: TColumnEh);
var OrderNo : integer;
begin
  inherited;
  Screen.Cursor:=crHourGlass;
  OrderNo := quOrdersOrderNo.AsInteger;
  quOrders.Close;
  case ACol of
    8 : quOrders.MacroByName('_OrderBy').Value:=' NameClient, OrderNo, IdBlank ';
    10 : quOrders.MacroByName('_OrderBy').Value:=' NameContractor, OrderNo, IdBlank ';
  end;
  quOrders.Open;
  quOrders.Locate('OrderNo',OrderNo,[]);
  Screen.Cursor:=crDefault;
end;

procedure TMlekoBlankListOutSideForm.Button2Click(Sender: TObject);
begin
  inherited;
  quTempTableForCreateBlank.Execute;
  ShowMessage('Создана временная таблица для наполнения заказа');
{
  with TTempTableForCreateBlankForm.Create(Application) do
   try
     quTempTableForCreateBlank.Open;
     ShowModal;
   finally
     quTempTableForCreateBlank.Close;
     Free;
   end;
}
end;

procedure TMlekoBlankListOutSideForm.Button3Click(Sender: TObject);
begin
  inherited;
  with TTempTableForCreateBlankForm.Create(Application) do
   try
     quTempTableForCreateBlank.Open;
     ShowModal;
   finally
     quTempTableForCreateBlank.Close;
     Free;
   end;
end;

procedure TMlekoBlankListOutSideForm.Button4Click(Sender: TObject);
begin
  inherited;
  with TTempTableForCreateBlankForm.Create(Application) do
   try
     quTempTableForCreateBlank.Close;
     quTempTableForCreateBlank.ParamByName('PostNo').Value := quOrdersNoContractor.Value;
     quTempTableForCreateBlank.Open;
     ShowModal;
   finally
     quTempTableForCreateBlank.Close;
     Free;
   end;
end;

procedure TMlekoBlankListOutSideForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
 var ExecStr : String;
begin
  inherited;
  ExecStr := 'update e_blank_head '+
             ' set status = -1 '+
             'where isVeb = 1 '+
             '  and id not in (select idBlank from l_BlankForVeb)';
  dmDataModule.ExecSQL(ExecStr);
end;

end.
