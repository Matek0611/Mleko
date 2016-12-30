    unit MlekoBlankListOutSide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, StdCtrls, DB, MemDS, DBAccess, MSAccess,
  DBCtrls, Mask, DBCtrlsEh, DBGridEh, DBLookupEh, ExtCtrls, GridsEh,
  citCtrls, citmask, citDBCalendar, ComCtrls;

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
    quOrdersGroupClient: TStringField;
    dtDateDelivery: TDateTimePicker;
    quOrdersNoAdress: TIntegerField;
    procedure btExportPriceClick(Sender: TObject);
    procedure BtImportOrdersClick(Sender: TObject);
    procedure DBGridEhOrdersDblClick(Sender: TObject);
    procedure DBGridEhOrdersKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtCreateOrderClick(Sender: TObject);

  private
    FPostNo: Int64;
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
     PostForRashod0, main, MlekoBlankSpec;

{$R *.dfm}

procedure TMlekoBlankListOutSideForm.btExportPriceClick(Sender: TObject);
begin
  inherited;
  spExportPiceForVeb.Close;
  spExportPiceForVeb.Prepare;
  spExportPiceForVeb.Params.ParamByName('Name').Value := cbDBLookupFilterPrice.Text;
  spExportPiceForVeb.ExecProc;
end;



procedure TMlekoBlankListOutSideForm.BtImportOrdersClick(Sender: TObject);
begin
  inherited;
  if not (FileExists('\\SIRIUS\ImportOrdersVeb\orders.csv')) then raise Exception.Create('Файла d:\ImportOrdersVeb\orders.csv не существует на сервере!');

  spImportOrderVebTmp.Close;
  spImportOrderVebTmp.Prepare;
  spImportOrderVebTmp.ExecProc;
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
  CheckOrderForVeb : TMSQuery;
  documentID : Integer;
  OrderNo : Integer;
  Buh : Integer;
  SArticleGroup :Double;

  NameContractor, Name, NameLong : String;
begin
  inherited;
  Dlg := TMlekoBlankParamForm.Create(Application);

  OrderNo := quOrders.FieldByName('OrderNo').Value;

  CheckOrderForVeb := TMSQuery.Create(nil);
  CheckOrderForVeb.Connection:= dmDataModule.DB;
  CheckOrderForVeb.SQL.Clear;
  CheckOrderForVeb.SQL.Text := 'select * from l_BlankForVeb where IdVeb = :IdVeb';
  CheckOrderForVeb.ParamByName('IdVeb').Value := OrderNo;
  CheckOrderForVeb.Open;
  if CheckOrderForVeb.RecordCount <> 0 then raise Exception.Create('Этот заказ уже создавался!'+ #10#13 +
                                                                   'Повторное создание заказа запрещено!');


  if quOrders.FieldByName('DateDelivery').Value = '01.01.1900' Then dtDateDelivery.Date := GlobalDateNakl
                                                               Else dtDateDelivery.Date := quOrders.FieldByName('DateDelivery').Value;

  if (quOrdersTypeNakl.asString = 'Товарная') Then Dlg.spAddInputOrder.ParamByName('ReasonId').Value := 10
                                              Else Dlg.spAddInputOrder.ParamByName('ReasonId').Value := 11;
  if quOrders.FieldByName('Buh').Value = 'Касса' Then begin
                                                        Dlg.spAddInputOrder.ParamByName('Buh').Value := 1;
                                                        Buh := 1;
                                                      end
                                                 Else begin
                                                        Dlg.spAddInputOrder.ParamByName('Buh').Value := 0;
                                                        Buh := 0;
                                                      end;
  Dlg.spAddInputOrder.ParamByName('Description').Value := datetostr(quOrders.FieldByName('DateDelivery').Value) +
                                                              ' ' + quOrders.FieldByName('TimeDelivery').Value  +
                                                              ' ' + quOrders.FieldByName('Telephon').Value      +
                                                              ' ' + quOrders.FieldByName('Email').Value         +
                                                              ' НЕ СВОДИТЬ !!!!!!!!';
  Dlg.quOurFirm.Open;
  Dlg.spAddInputOrder.ParamByName('OurFirmNo').Value := Dlg.quOurFirm.FieldByName('PostNo').AsInteger;
  Dlg.quOurFirm.Close;

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




     quPost:=TMSQuery.Create(nil);
     quPost.Connection:=dmDataModule.DB;
     quPost.SQL.Clear;
     quPost.SQL.Text:='select Name, NameLong from Post where PostNo = :PostNo';
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

     Dlg.quContract.Close;
     Dlg.quContract.ParamByName('p_PostNo').Value := PostNo;
     Dlg.quContract.Open;
     Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg.quContract.FieldByName('id').Value;
     Dlg.quContract.Close;
     quPost.Close;




     if quOrders.FieldByName('DateDelivery').Value <> '01.01.1900' then Begin
                                                                          DateTimeToString(formattedDateTime, 'c',quOrders.FieldByName('DateDelivery').Value);
                                                                          DeliveryDate := StrToDateTime(formattedDateTime);
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
     quPostArtGroup := TMSQuery.Create(nil);
     quPostArtGroup.Connection:= dmDataModule.DB;
     quPostArtGroup.SQL.Clear;
     quPostArtGroup.SQL.Text:= 'declare'+
                               '         @PostNo int '+
                               '        ,@OrderNo int '+
                               'set @OrderNo = convert(int,:OrderNo) '+
                               'set @PostNo = convert(int,:PostNo) '+
                               'select lpsagd.POSTNO '+
                               '      ,lpsagd.DAY_DELAY '+
                               '      ,lpsagd.DAY_DELAY_EXT '+
                               '      ,lpsagd.BUH '+
                               '      ,lpsagd.SET_ARTICLE_GROUP_ID '+
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
                               '      ,7718234909260420228 '+
                               '      ,2 ';
     quPostArtGroup.Prepare;
     quPostArtGroup.ParamByName('OrderNo').Value := OrderNo;
     quPostArtGroup.ParamByName('PostNo').Value := PostNo;
     quPostArtGroup.ParamByName('Buh').Value := Buh;

     quPostArtGroup.Open;
     quPostArtGroup.First;

     if quPostArtGroup.RecordCount =0 then ShowMessage ('Нет записи в запросе! '+#13#10+
                                                        quPostArtGroup.SQL.Text+#13#10+
                                                        'Обратитесь к программисту');

     while not quPostArtGroup.Eof do
       begin //quPostArtGroup.Eof

       SArticleGroup := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID').Value;
       Dlg.SARTICLE_GROUP := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID').Value;

 //      showmessage(inttostr(quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID').Value));

       Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := quPostArtGroup.FieldByName('SET_ARTICLE_GROUP_ID').Value;
       If quPostArtGroup.FieldByName('COLNPRICE').Value = 0 Then Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := 17
                                                            Else Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quPostArtGroup.FieldByName('COLNPRICE').Value;
       Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := quPostArtGroup.FieldByName('DAY_DELAY').Value;

     Showmessage('Выберите сотрудника');
     RetPostForRashod := PostForRashod(DeliveryDate,PostNo);
     if RetPostForRashod.PostNo > 0 then Begin
                                           Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                           Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := RetPostForRashod.SotrudNo;
                                           Dlg.spAddInputOrder.ParamByName('VidNaklNo').Value := 1;
                                           Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
                                           Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                           Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := RetPostForRashod.OtdelNo;
                                         End
                                    else raise Exception.Create('Необходимо выбрать сотрудника!'+#13#10+
                                                                'Возможно к контрагенту не сопоставлены сотрудники.'+#13#10+
                                                                'Для того чтобы выбрать сопоставте контрагенту сотрудников ');
     Dlg.spAddInputOrder.ExecProc;
     documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;



     quSpecBlank :=TMSQuery.Create(nil);
     quSpecBlank.Connection:=dmDataModule.DB;
     quSpecBlank.SQL.Clear;
     quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                          +'     ,convert(int,KolTov) as KolTov '
                          +'     ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                          +' from ImportOrderVebTmp ivt '
                          +'  where ivt.OrderNo = :OrderNo '
                          +'    and convert(smallint,Article) not in (select TovarNo '
                          +'                                                  from e_blanks '
                          +'                                                   where Document_id in (select idBlank '
                          +'                                                                          from l_BlankForVeb '
                          +'                                                                           where IdVeb = :OrderNom)) '
                          +'    and convert(int,Article) in (select lag.ARTICLE_ID '
                          +'                                  from L_SET_ARTICLE_GROUP lsag left join '
                          +'                                       L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                          +'                                   where lsag.SET_ARTICLE_GROUP_ID = :SET_ARTICLE_GROUP_ID) ';

     quSpecBlank.Prepare;
     quSpecBlank.ParamByName('OrderNo').Value := OrderNo;
     quSpecBlank.ParamByName('OrderNom').Value := OrderNo;
     quSpecBlank.ParamByName('SET_ARTICLE_GROUP_ID').Value := Dlg.SARTICLE_GROUP;

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
                                          quPostArtGroup.Close;
                                          raise Exception.Create('Нет записи в запросе!'+ #10#13 +
                                                                  quSpecBlank.SQL.Text+ #10#13 +
                                                                  'Обратитесь к программисту');
                                        end;

       while not quSpecBlank.Eof do
       begin
         Dlg3 := TMlekoBlankSpecForm.Create(Application);
         Dlg3.spEditBlankPosition.ParamByName('document_id').Value := documentID;
         Dlg3.spEditBlankPosition.ParamByName('tovarNo').Value := quSpecBlank.FieldByName('Article').Value;
         Dlg3.spEditBlankPosition.ParamByName('UserNo').Value := data.UserNo;
         Dlg3.spEditBlankPosition.ParamByName('KolBeg').Value := quSpecBlank.FieldByName('KolTov').Value;
         Dlg3.spEditBlankPosition.ParamByName('KolOrd').Value := quSpecBlank.FieldByName('KolTov').Value;

         if quPostArtGroup.FieldByName('COLNPRICE').Value = 0 Then Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quSpecBlank.FieldByName('PriceTov').Value
                                                              Else Begin
                                                                     quPrice :=TMSQuery.Create(nil);
                                                                     quPrice.Connection:=dmDataModule.DB;
                                                                     quPrice.SQL.Clear;
                                                                     quPrice.SQL.Text:= 'select case when :ColnPrice = 1 then Price '
                                                                                       +'            when :ColnPrice = 2 then Price1 '
                                                                                       +'            when :ColnPrice = 3 then Price2 '
                                                                                       +'            when :ColnPrice = 4 then Price3 '
                                                                                       +'            when :ColnPrice = 5 then Price4 '
                                                                                       +'            when :ColnPrice = 6 then Price5 '
                                                                                       +'            when :ColnPrice = 7 then Price6 '
                                                                                       +'            when :ColnPrice = 8 then Price7 '
                                                                                       +'            when :ColnPrice = 10 then Price8 '
                                                                                       +'            when :ColnPrice = 11 then Price9 '
                                                                                       +'            when :ColnPrice = 12 then Price10 '
                                                                                       +'            when :ColnPrice = 13 then Price13 '
                                                                                       +'            when :ColnPrice = 14 then Price14 '
                                                                                       +'            when :ColnPrice = 15 then Price15 '
                                                                                       +'            when :ColnPrice = 9 then AvgPriceIn '
                                                                                       +'       end as Price '
                                                                                       +' from Ostatok o '
                                                                                       +'  where TovarNo = :TovarNo ';
                                                                     quPrice.Prepare;
                                                                     quPrice.ParamByName('TovarNo').Value := quSpecBlank.FieldByName('Article').Value;
                                                                     quPrice.ParamByName('ColnPrice').Value := quPostArtGroup.FieldByName('COLNPRICE').Value;
                                                                     quPrice.Open;
                                                                     Dlg3.spEditBlankPosition.ParamByName('Boss_Price').Value := quPrice.FieldByName('Price').Value;
                                                                   End;
         Dlg3.spEditBlankPosition.ExecProc;

         quSpecBlank.Next;

       end;

     quInsInl_BlankForVeb :=TMSQuery.Create(nil);
     quInsInl_BlankForVeb.Connection:=dmDataModule.DB;
     quInsInl_BlankForVeb.SQL.Clear;
     quInsInl_BlankForVeb.SQL.Text:='insert into l_BlankForVeb (IdVeb,idBlank) '
                                   +'     values (:IdVeb,:idBlank)';
     quInsInl_BlankForVeb.ParamByName('IdVeb').Value := OrderNo;
     quInsInl_BlankForVeb.ParamByName('idBlank').Value := documentID;
     quInsInl_BlankForVeb.Execute;
     Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
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

        quPost:=TMSQuery.Create(nil);
        quPost.Connection:=dmDataModule.DB;
        quPost.SQL.Clear;
        quPost.SQL.Text:='select Name, NameLong from Post where PostNo = :PostNo';
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
        Dlg.quContract.Close;
        Dlg.quContract.ParamByName('p_PostNo').Value := PostNo;
        Dlg.quContract.Open;
        Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg.quContract.FieldByName('id').Value;
        Dlg.quContract.Close;
        quPost.Close;
      End
      Else Begin
             Dlg.quContract.Close;
             Dlg.quContract.ParamByName('p_PostNo').Value := PostNo;
             Dlg.quContract.Open;
             Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg.quContract.FieldByName('id').Value;
             Dlg.quContract.Close;
             quPost.Close;
             Dlg.spAddInputOrder.ParamByName('PostNo').Value := quOrders.FieldByName('NoContractor').Value;
           End;

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
     Showmessage('Выберите сотрудника');
     RetPostForRashod := PostForRashod(DeliveryDate,PostNo);
     if RetPostForRashod.PostNo > 0 then Begin
                                           Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                           Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := RetPostForRashod.SotrudNo;
                                           Dlg.spAddInputOrder.ParamByName('VidNaklNo').Value := 1;
                                           Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
                                           Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                           Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := RetPostForRashod.OtdelNo;
                                           Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := 17;
                                           Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := 0;
                                         End
                                    else raise Exception.Create('Необходимо выбрать сотрудника!'+#13#10+
                                                                'Возможно к контрагенту не сопоставлены сотрудники.'+#13#10+
                                                                'Для того чтобы выбрать сопоставте контрагенту сотрудников ');
     Dlg.spAddInputOrder.ExecProc;
     documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;


     quSpecBlank :=TMSQuery.Create(nil);
     quSpecBlank.Connection:=dmDataModule.DB;
     quSpecBlank.SQL.Clear;
     quSpecBlank.SQL.Text:='select convert(int,Article) as Article '
                          +'     ,convert(int,KolTov) as KolTov '
                          +'     ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
                          +' from ImportOrderVebTmp ivt left join '
                          +'      Tovar t on ivt.Article = t.TovarNo '
                          +'  where convert(int,ivt.OrderNo) = :OrderNo ';
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
     quInsInl_BlankForVeb.SQL.Text:='insert into l_BlankForVeb (IdVeb,idBlank) '
                                   +'     values (:IdVeb,:idBlank)';
     quInsInl_BlankForVeb.ParamByName('IdVeb').Value := OrderNo;
     quInsInl_BlankForVeb.ParamByName('idBlank').Value := documentID;
     quInsInl_BlankForVeb.Execute;
     Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
     quInsInl_BlankForVeb.Close;

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

                     quPost:=TMSQuery.Create(nil);
                     quPost.Connection:=dmDataModule.DB;
                     quPost.SQL.Clear;
                     quPost.SQL.Text:='select Name, NameLong from Post where PostNo = :PostNo';
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

                     Dlg.quContract.Close;
                     Dlg.quContract.ParamByName('p_PostNo').Value := PostNo;
                     Dlg.quContract.Open;
                     Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg.quContract.FieldByName('id').Value;
                     Dlg.quContract.Close;
                     quPost.Close;
					 
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
                    Showmessage('Выберите сотрудника');
                    RetPostForRashod := PostForRashod(DeliveryDate,PostNo);
                    if RetPostForRashod.PostNo > 0 then Begin
                                                          Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                                          Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := RetPostForRashod.SotrudNo;
                                                          Dlg.spAddInputOrder.ParamByName('VidNaklNo').Value := 1;
                                                          Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
                                                          Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                                          Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := RetPostForRashod.OtdelNo;
                                                          Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := 17;
                                                          Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := 0;
                                                        End
                                                   else raise Exception.Create('Необходимо выбрать сотрудника!'+#13#10+
                                                                               'Возможно к контрагенту не сопоставлены сотрудники.'+#13#10+
                                                                               'Для того чтобы выбрать сопоставте контрагенту сотрудников ');
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
                    quInsInl_BlankForVeb.Close;
                   End // quOrders.FieldByName('NoContractor').Value = 0 then
              Else Begin // quOrders.FieldByName('NoContractor').Value = 0  else
                     Dlg.spAddInputOrder.ParamByName('PostNo').Value := quOrders.FieldByName('NoContractor').Value;
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
                     Showmessage('Выберите сотрудника');
                     RetPostForRashod := PostForRashod(DeliveryDate,PostNo);
                     if RetPostForRashod.PostNo > 0 then Begin
                                                           Dlg.spAddInputOrder.ParamByName('DateNakl').Value := DeliveryDate;
                                                           Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := RetPostForRashod.SotrudNo;
                                                           Dlg.spAddInputOrder.ParamByName('VidNaklNo').Value := 1;
                                                           Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
                                                           Dlg.spAddInputOrder.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                                           Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := RetPostForRashod.OtdelNo;
                                                           Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := 17;
                                                           Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := 0;
                                                         End
                                                    else raise Exception.Create('Необходимо выбрать сотрудника!'+#13#10+
                                                                                'Возможно к контрагенту не сопоставлены сотрудники.'+#13#10+
                                                                                'Для того чтобы выбрать сопоставте контрагенту сотрудников ');
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
                     quInsInl_BlankForVeb.Close;
                   End; // quOrders.FieldByName('NoContractor').Value = 0  else
           End // quOrders.FieldByName('NoClient').Value = 0 then
      Else Begin // quOrders.FieldByName('NoClient').Value = 0 else

             Dlg.spAddInputOrder.ParamByName('PostNo').Value := quOrders.FieldByName('NoContractor').Value;
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
              quInsInl_BlankForVeb.Close;

           End;

   end; // 4
   Dlg.Free;
   Dlg1.Free;
   Dlg3.Free;
end;

procedure TMlekoBlankListOutSideForm.SetPostNo(const Value: Int64);
begin
  if FPostNo <> Value then FPostNo := Value;
end;


end.
