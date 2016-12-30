unit MlekoBlankListWithKPK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, MemDS, DBAccess, MSAccess, GridsEh,
  DBGridEh, ExtCtrls, StdCtrls, ComCtrls, Mask, DBCtrlsEh;
  {, CFLMLKList,                         , Grids, DBGrids;
  citDbGrid;
   }
type
  TMlekoBlankListWithKPKForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEhOrders: TDBGridEh;
    dse_blank_head_online: TMSDataSource;
    que_blank_head_online: TMSQuery;
    Button1: TButton;
    cbxDate: TCheckBox;
    spEditBlankPosition: TMSStoredProc;
    dtDateEnd: TDBDateTimeEditEh;
    dtDateBeg: TDBDateTimeEditEh;
    Label2: TLabel;
    Label3: TLabel;
    que_blank_head_onlineid: TIntegerField;
    que_blank_head_onlineDateNakl: TDateTimeField;
    que_blank_head_onlineSumma: TFloatField;
    que_blank_head_onlineIdBlank: TIntegerField;
    que_blank_head_onlineSummaBlank: TFloatField;
    que_blank_head_onlineBuhname: TStringField;
    que_blank_head_onlineVidNakname: TStringField;
    que_blank_head_onlineSotrudName: TStringField;
    que_blank_head_onlinePostNo: TSmallintField;
    que_blank_head_onlineNameClientOnline: TStringField;
    que_blank_head_onlinePostName: TStringField;
    que_blank_head_onlineAddress: TStringField;
    que_blank_head_onlineAddressNo: TSmallintField;
    que_blank_head_onlineOtdelname: TStringField;
    que_blank_head_onlineweight: TFloatField;
    que_blank_head_onlineStatus: TSmallintField;
    que_blank_head_onlineStateBlank: TIntegerField;
    que_blank_head_onlineCntBlanks: TIntegerField;
    que_blank_head_onlineCntDelBlanks: TIntegerField;
    que_blank_head_onlineIsDelOrderBlank: TIntegerField;
    que_blank_head_onlineVidNaklNo: TSmallintField;
    que_blank_head_onlineBuh: TSmallintField;
    que_blank_head_onlineSotrudNo: TSmallintField;
    que_blank_head_onlineSotrudname_1: TStringField;
    que_blank_head_onlineOtdelNo: TSmallintField;
    que_blank_head_onlineColnPrice: TSmallintField;
    que_blank_head_onlineKolDayPlan: TSmallintField;
    que_blank_head_onlineSubNum: TIntegerField;
    que_blank_head_onlineCreateDate: TDateTimeField;
    que_blank_head_onlineDateCorrelation: TDateTimeField;
    que_blank_head_onlineEditUserNo: TSmallintField;
    que_blank_head_onlineReasonId: TSmallintField;
    que_blank_head_onlineReasonname: TStringField;
    que_blank_head_onlineVidtovGroupId: TLargeintField;
    que_blank_head_onlineVidtovGroupName: TStringField;
    que_blank_head_onlinedescription: TStringField;
    que_blank_head_onlinecontract_id: TIntegerField;
    que_blank_head_onlineOurFirmNo: TIntegerField;
    que_blank_head_onlineEmployeeNo: TSmallintField;
    que_blank_head_onlineHostName: TStringField;
    que_blank_head_onlineDSDesigner: TWideStringField;
    que_blank_head_onlineDSDesigner2: TWideStringField;
    que_blank_head_onlineTypeReturnNo: TIntegerField;
    que_blank_head_onlineTypeReturnName: TStringField;
    procedure DBGridEhOrdersDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dtDateBegChange(Sender: TObject);
    procedure dtDateEndChange(Sender: TObject);
    procedure cbxDateClick(Sender: TObject);
    procedure DBGridEhOrdersDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoBlankListWithKPKForm: TMlekoBlankListWithKPKForm;

implementation

uses data, MlekoBlankSpecWithKPK, MlekoBlankParam, MlekoBlankSpec, TypeReturn, MlekoBlankList,
     main, GetDate0;
{$R *.dfm}

procedure TMlekoBlankListWithKPKForm.DBGridEhOrdersDblClick(Sender: TObject);
begin
  inherited;
  TMlekoBlankSpecWithKPKForm.ShowForm(que_blank_head_online.FieldByName('Id').Value);
end;

procedure TMlekoBlankListWithKPKForm.Button1Click(Sender: TObject);
var
  Dlg: TMlekoBlankParamForm;
  Dlg2:TTypeReturnForm;
  Dlg3:TMlekoBlankListForm;
  quSpecBlank : TMSQuery;
  quPrice : TMSQuery;
  quPriceType : TMSQuery;
  quInsInl_BlankForBlankOnline : TMSQuery;
  quInsInd_d_ControlPriceWithKPK : TMSQuery;
  Checke_blank_head_online : TMSQuery;
  quAddress : TMSQuery;
  quOtdel : TMSQuery;
  quOrderSumma : TMSQuery;
  quSummaBlanksHead : TMSQuery;
  quListBlanksDocId : TMSQuery;
  quListTovarNo : TMSQuery;
  quDocum : TMSQuery;
  quSumDocum : TMSQuery;
  ListDocumentId : String;
  ListTovarNotBlanks : String;
  DescriptionBanPay : String;
  DocumentId : Integer;
  TypeReturnNo : Integer;
  SumDoc : Double;
  Is_ControlPostBanPay : Boolean;
  Period:TPeriodDate;
begin
  inherited;
  Checke_blank_head_online := TMSQuery.Create(nil);
  Checke_blank_head_online.Connection:= dmDataModule.DB;
  Checke_blank_head_online.SQL.Clear;
  Checke_blank_head_online.SQL.Text := 'select * from L_BlankForBlankOnline where IdBlankOnline = :IdBlankOnline';
  Checke_blank_head_online.ParamByName('IdBlankOnline').Value := que_blank_head_onlineID.Value;
  Checke_blank_head_online.Open;
  if Checke_blank_head_online.RecordCount <> 0 then
   if (que_blank_head_onlineCntBlanks.Value mod que_blank_head_onlineCntDelBlanks.Value) > 0 then raise Exception.Create(' Этот заказ уже создавался!'+ #10#13 +
                                                                                                                         'Для повторного создания заказа, '+ #10#13 +
                                                                                                                         'необходимо удалить все созданные заказы '+ #10#13 +
                                                                                                                         'в журнале заказов!');
  Checke_blank_head_online.Close;



  // Создаем шапку заказа

  quAddress := TMSQuery.Create(nil);
  quAddress.Connection := dmDataModule.DB;
  quAddress.SQL.Clear;
  quAddress.SQL.Text := 'select * from AddressPost where id = :id ';
  quAddress.ParamByName('id').Value := que_blank_head_onlineAddressNo.Value;
  quAddress.Open;


  quOtdel := TMSQuery.Create(nil);
  quOtdel.Connection := dmDataModule.DB;
  quOtdel.SQL.Clear;
  quOtdel.SQL.Text := 'select SotrudOtdel from Sotrud where SotrudNo = :SotrudNo ';
  quOtdel.ParamByName('SotrudNo').Value := que_blank_head_onlineSotrudNo.Value;
  quOtdel.Open;

  Dlg := TMlekoBlankParamForm.Create(Application);
  Dlg.spAddInputOrder.Close;
  Dlg.spAddInputOrder.ParamByName('PostNo').Value := que_blank_head_onlinePostNo.Value;
  if (que_blank_head_onlineDateNakl.Value < (GlobalDateNakl-1)) then begin
                                                                 ShowMessage('Дата заказа просрочена! '+ #10#13 +
                                                                             'Введите дату заказа.');
                                                                 Period:=ZapDate(1);
                                                                 if (Period[1] <= Date()) then raise Exception.Create('Дата заказа не верна!'+ #10#13 +
                                                                                                                      'Заказ создан не будет');
                                                                 Dlg.spAddInputOrder.ParamByName('DateNakl').Value := Period[1];
                                                               end
                                                          else Dlg.spAddInputOrder.ParamByName('DateNakl').Value := que_blank_head_onlineDateNakl.Value;
  Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := que_blank_head_onlineSotrudNo.Value;
  Dlg.spAddInputOrder.ParamByName('VidNaklNo').Value := que_blank_head_onlineVidNaklNo.Value;
  Dlg.spAddInputOrder.ParamByName('UserNo').Value := UserNo;
  Dlg.spAddInputOrder.ParamByName('AddressNo').Value := quAddress.FieldByName('AddressNo').Value;
  Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := que_blank_head_onlineOtdelNo.Value;
  Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := que_blank_head_onlineColnPrice.Value;
  Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := que_blank_head_onlineKolDayPlan.Value;
  Dlg.spAddInputOrder.ParamByName('ReasonId').Value := que_blank_head_onlineReasonId.Value;
  Dlg.spAddInputOrder.ParamByName('Contract_id').Value := que_blank_head_onlinecontract_id.Value;
  Dlg.spAddInputOrder.ParamByName('Buh').Value := que_blank_head_onlineBuh.Value;
  Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := que_blank_head_onlineVidtovGroupId.Value;
  Dlg.spAddInputOrder.ParamByName('Description').Value := que_blank_head_onlinedescription.Value;
  Dlg.spAddInputOrder.ParamByName('OurFirmNo').AsInteger := que_blank_head_onlineOurFirmNo.Value;
  Dlg.spAddInputOrder.ExecProc;

  DocumentId := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;

  // Если возврат, то привязываем тип возврата

  if (que_blank_head_onlineReasonId.Value = 13) then
  If ((que_blank_head_onlineReasonId.Value = 13) and (que_blank_head_onlineTypeReturnNo.Value = Null))
   Then begin
          ShowMessage('Выберите тип возврата');
          Dlg2 := TTypeReturnForm.Create(Application);
          try
           if Dlg2.ShowModal = mrok Then begin
                                           TypeReturnNo := Dlg2.quTypeReturnTypeReturnNo.value;
                                           Dlg.spModifyLinkBlankReturn.Close;
                                           Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                           Dlg.spModifyLinkBlankReturn.ParamByName('TypeReturnNo').Value := TypeReturnNo;
                                           Dlg.spModifyLinkBlankReturn.Execute;
                                         end;
          finally
          Dlg2.Free;
          end;
        end
   Else begin
          Dlg.spModifyLinkBlankReturn.Close;
          Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
          Dlg.spModifyLinkBlankReturn.ParamByName('TypeReturnNo').Value := que_blank_head_onlineTypeReturnNo.Value;
          Dlg.spModifyLinkBlankReturn.Execute;
        end;

  // Наполняем заказ


  quSpecBlank := TMSQuery.Create(nil);
  quSpecBlank.Connection := dmDataModule.DB;
  quSpecBlank.SQL.Clear;
  quSpecBlank.SQL.Text := 'select  TovarNo                   '
                        + '      , KolBegin                  '
                        + '      , KolOrd                    '
                        + '      , Boss_price                '
                        + ' from e_blanks_online             '
                        + '  where Document_Id = :DocumentId ';
  quSpecBlank.Prepare;
  quSpecBlank.ParamByName('DocumentId').Value := que_blank_head_onlineID.Value;
  quSpecBlank.Open;
  quSpecBlank.First;

  while not quSpecBlank.Eof do
   begin
     spEditBlankPosition.ParamByName('document_id').AsInteger := DocumentID;
     spEditBlankPosition.ParamByName('tovarNo').AsInteger := quSpecBlank.FieldByName('TovarNo').AsInteger;
     spEditBlankPosition.ParamByName('UserNo').AsInteger := UserNo;
     spEditBlankPosition.ParamByName('KolBeg').AsInteger := quSpecBlank.FieldByName('KolBegin').AsInteger;
     spEditBlankPosition.ParamByName('KolOrd').AsInteger := quSpecBlank.FieldByName('KolOrd').AsInteger;

     quPrice :=TMSQuery.Create(nil);
     quPrice.Connection:=dmDataModule.DB;
     quPrice.SQL.Clear;
     quPrice.SQL.Text:= 'select isnull(case when :ColnPrice = 1 then Isnull(Price,0)  '
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
     quPrice.ParamByName('TovarNo').Value := quSpecBlank.FieldByName('TovarNo').Value;
     quPrice.ParamByName('ColnPrice').Value := que_blank_head_onlineColnPrice.Value;
     quPrice.Open;

     // Проверяем соответствие цены на товар в заказе с КПК и цены в базе на текущий момент
     // Если нет совпадения, выводится сообщение и несоответствие заносится в базу

     if quPrice.FieldByName('Price').AsCurrency <> quSpecBlank.FieldByName('Boss_price').AsCurrency Then
      begin
        quPriceType := TMSQuery.Create(nil);
        quPriceType.Connection := dmDataModule.DB;
        quPriceType.SQL.Clear;
        quPriceType.SQL.Text := 'select *                       '
                              + ' from D_Price_type             '
                              + '  where ColNPrice = :ColNPrice ';
        quPriceType.Prepare;
        quPriceType.ParamByName('ColNPrice').Value := que_blank_head_onlineColnPrice.Value;
        quPriceType.Open;

        Showmessage ('Цена в заказе с КПК не совпадает с текущей ценой в базе'+ #10#13 +
                     'Заказ с КПК : '+ IntToStr(que_blank_head_onlineID.Value) + #10#13 +
                     'Отсрочка по : '+ que_blank_head_onlineVidtovGroupName.AsString + #10#13 +
                     'Код товара : '+ IntToStr(quSpecBlank.FieldByName('TovarNo').Value) + #10#13 +
                     'Колонка цены в заказе : '+ quPriceType.FieldByName('ColName').AsString + #10#13 +
                     'Цена в заказе : '+ quSpecBlank.FieldByName('Boss_price').AsString + #10#13 +
                     'Текущая цена : '+ quPrice.FieldByName('Price').AsString);

        quInsInd_d_ControlPriceWithKPK := TMSQuery.Create(nil);
        quInsInd_d_ControlPriceWithKPK.Connection := dmDataModule.DB;
        quInsInd_d_ControlPriceWithKPK.SQL.Clear;
        quInsInd_d_ControlPriceWithKPK.SQL.Text := 'insert into work.dbo.d_ControlPriceWithKPK (IdKPK,PostNo,DateCreate,Set_ArticleGroup_Id,Buh,'
                                                  +'                                            ColnPrice,TovarNo,PriceKPK,PriceReal) '
                                                  +'       values(:IdKPK,:PostNo,getdate(),:Set_ArticleGroup_Id,:Buh,:ColnPrice, '
                                                  +'              :TovarNo,:PriceKPK,:PriceReal) ';
//        quInsInd_d_ControlPriceWithKPK.Prepare;
        quInsInd_d_ControlPriceWithKPK.ParamByName('IdKPK').AsInteger := que_blank_head_onlineID.AsInteger;
        quInsInd_d_ControlPriceWithKPK.ParamByName('PostNo').AsInteger := que_blank_head_onlinePostNo.AsInteger;
        quInsInd_d_ControlPriceWithKPK.ParamByName('Set_ArticleGroup_Id').Value := que_blank_head_onlineVidtovGroupId.Value;
        quInsInd_d_ControlPriceWithKPK.ParamByName('Buh').AsInteger := que_blank_head_onlineBuh.AsInteger;
        quInsInd_d_ControlPriceWithKPK.ParamByName('ColnPrice').AsInteger := que_blank_head_onlineColnPrice.AsInteger;
        quInsInd_d_ControlPriceWithKPK.ParamByName('TovarNo').AsInteger := quSpecBlank.FieldByName('TovarNo').AsInteger;
        quInsInd_d_ControlPriceWithKPK.ParamByName('PriceKPK').Value := quSpecBlank.FieldByName('Boss_price').Value;
        quInsInd_d_ControlPriceWithKPK.ParamByName('PriceReal').Value := quPrice.FieldByName('Price').Value;
        quInsInd_d_ControlPriceWithKPK.Execute;
        quInsInd_d_ControlPriceWithKPK.Close;

        quPriceType.Close;
      end;


     spEditBlankPosition.ParamByName('Boss_Price').Value := quPrice.FieldByName('Price').Value;

     spEditBlankPosition.ExecProc;

     quPrice.Close;
     quSpecBlank.Next;
   end;

  // Выполняем привязку созданного заказа с заказом с КПК

  quInsInl_BlankForBlankOnline := TMSQuery.Create(nil);
  quInsInl_BlankForBlankOnline.Connection := dmDataModule.DB;
  quInsInl_BlankForBlankOnline.SQL.Clear;
  quInsInl_BlankForBlankOnline.SQL.Text := 'insert into L_BlankForBlankOnline (IdBlankOnline,IdBlank) '
                                          +'       values (:IdBlankOnline,:IdBlank)';
  quInsInl_BlankForBlankOnline.ParamByName('IdBlankOnline').Value := que_blank_head_onlineID.Value;
  quInsInl_BlankForBlankOnline.ParamByName('idBlank').Value := DocumentID;
  quInsInl_BlankForBlankOnline.Execute;

  Showmessage ('Создан заказ document_id = '+ IntToStr(DocumentID));

  // Выполняем проверку

  quOrderSumma := TMSQuery.Create(nil);
  quOrderSumma.Connection := dmDataModule.DB;
  quOrderSumma.SQL.Clear;
  quOrderSumma.SQL.Text := 'select distinct convert(decimal(18,2),Summa) as OrderSumma '
                          +'from e_blank_head_online '
                          +' where Id = :Id';
  quOrderSumma.ParamByName('Id').Value := que_blank_head_onlineid.Value;
  quOrderSumma.Open;

  quSummaBlanksHead := TMSQuery.Create(nil);
  quSummaBlanksHead.Connection := dmDataModule.DB;
  quSummaBlanksHead.SQL.Clear;
  quSummaBlanksHead.SQL.Text := 'select sum(summa) as SummaBlanks '
                               +' from e_blank_head '
                               +'  where ID in (select idBlank '
                               +'                from L_BlankForBlankOnline '
                               +'         				 where IdBlankOnline = :IdBlankOnline) ';
  quSummaBlanksHead.ParamByName('IdBlankOnline').Value := que_blank_head_onlineid.Value;
  quSummaBlanksHead.Open;

  quListBlanksDocId := TMSQuery.Create(nil);
  quListBlanksDocId.Connection := dmDataModule.DB;
  quListBlanksDocId.SQL.Clear;
  quListBlanksDocId.SQL.Text := 'select id as Id '
                               +' from e_blank_head '
                               +'  where ID in (select idBlank '
                               +'                from L_BlankForBlankOnline '
                               +'		        		 where IdBlankOnline = :IdBlankOnline) ';
  quListBlanksDocId.ParamByName('IdBlankOnline').Value := que_blank_head_onlineid.Value;
  quListBlanksDocId.Open;
  quListBlanksDocId.First;

  quListTovarNo := TMSQuery.Create(nil);
  quListTovarNo.Connection :=  dmDataModule.DB;
  quListTovarNo.SQL.Clear;
  quListTovarNo.SQL.Text := 'select str(t.TovarNo) + '' '' + NameTovar as ListTovarNo '
                           +' from e_blanks_online e left join '
                           +'      Tovar t on t.TovarNo = e.TovarNo '
                           +'  where e.TovarNo not in (select convert(smallint,TovarNo) as TovarNo '
                           +'                           from e_blanks '
                           +'                            where Document_id in (select idBlank '
                           +'                                                   from L_BlankForBlankOnline '
                           +'                                                    where IdBlankOnline = :IdBlankOnline))'
                           +'    and e.Document_Id = :Id ';

  quListTovarNo.ParamByName('IdBlankOnline').Value := que_blank_head_onlineid.Value;
  quListTovarNo.ParamByName('Id').Value := que_blank_head_onlineid.Value;
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
                  'Сумма заказа с КПК не совпадает с суммой заказов в базе!' +#13#10+
                  'Сумма заказа с КПК : '+ quOrderSumma.FieldByName('OrderSumma').AsString +#13#10+
                  'Сумма заказов в базе : ' + quSummaBlanksHead.FieldByName('SummaBlanks').AsString +#13#10+
                  'Проверте заказ с КПК!' +#13#10+
                  'Номер заказа КПК ' +  inttostr(que_blank_head_onlineid.Value) +#13#10+
                  'Список заказов в базе : ' +#13#10+ ListDocumentId);
      ShowMessage('Список товаров не распределенных в базу с сайта : ' +#13#10+ ListTovarNotBlanks);
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
       end;
      quListBlanksDocId.Next;
    end;


  Dlg.Free;
end;

procedure TMlekoBlankListWithKPKForm.dtDateBegChange(Sender: TObject);
var
  formattedDateTime : String;
begin
  inherited;
  que_blank_head_online.Close;

  DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Value);
  que_blank_head_online.ParamByName('Date1').AsDate := strtodate(formattedDateTime);

  que_blank_head_online.Open;
  DBGridEhOrders.Refresh;
end;

procedure TMlekoBlankListWithKPKForm.dtDateEndChange(Sender: TObject);
 var
  formattedDateTime : String;
begin
  inherited;
  que_blank_head_online.Close;

  DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateEnd.Value);
  que_blank_head_online.ParamByName('Date2').AsDate := strtodate(formattedDateTime);

  que_blank_head_online.Open;
  DBGridEhOrders.Refresh;
end;

procedure TMlekoBlankListWithKPKForm.cbxDateClick(Sender: TObject);
var
  formattedDateTime : String;
  formattedDateTime1 : String;
begin
  inherited;
  que_blank_head_online.Close;
  dtDateBeg.Enabled := cbxDate.Checked;
  dtDateEnd.Enabled := cbxDate.Checked;
  if not cbxDate.Checked then begin
                                que_blank_head_online.ParamByName('Date1').Clear;
                                que_blank_head_online.ParamByName('Date2').Clear;
                              end;
  if cbxDate.Checked then begin
                            DateTimeToString(formattedDateTime,'dd/mm/yyyy',dtDateBeg.Value);
                            DateTimeToString(formattedDateTime1,'dd/mm/yyyy',dtDateEnd.Value);
                            que_blank_head_online.ParamByName('Date1').AsDate := strtodate(formattedDateTime);
                            que_blank_head_online.ParamByName('Date2').AsDate := strtodate(formattedDateTime1);
                          end;
  que_blank_head_online.Open;
  DBGridEhOrders.Refresh;
end;

procedure TMlekoBlankListWithKPKForm.DBGridEhOrdersDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if dse_blank_head_online.DataSet.FieldByName('StateBlank').Value = 3 then
   begin
      DBGridEhOrders.Canvas.Brush.Color := $00C4FF88;;
      DBGridEhOrders.Canvas.Font.Color := ClBlack;
    end;
  if dse_blank_head_online.DataSet.FieldByName('StateBlank').Value = 2 then
   begin
      DBGridEhOrders.Canvas.Brush.Color := clInactiveCaptionText;
      DBGridEhOrders.Canvas.Font.Color := ClBlack;
    end;
  if dse_blank_head_online.DataSet.FieldByName('StateBlank').Value = 1 then
   begin
      DBGridEhOrders.Canvas.Brush.Color := clAqua;
      DBGridEhOrders.Canvas.Font.Color := ClBlack;
    end;

  if (dse_blank_head_online.DataSet.FieldByName('StateBlank').Value = 1) and
     (dse_blank_head_online.DataSet.FieldByName('IsDelOrderBlank').Value = 1) and
     ((que_blank_head_onlineCntBlanks.Value mod que_blank_head_onlineCntDelBlanks.Value) > 0) then
   begin
      DBGridEhOrders.Canvas.Brush.Color := clRed;
      DBGridEhOrders.Canvas.Font.Color := ClBlack;
    end;
  if (dse_blank_head_online.DataSet.FieldByName('StateBlank').Value = 3) and
     (dse_blank_head_online.DataSet.FieldByName('IsDelOrderBlank').Value = 1) and
     ((que_blank_head_onlineCntBlanks.Value mod que_blank_head_onlineCntDelBlanks.Value) > 0) then
   begin
      DBGridEhOrders.Canvas.Brush.Color := clRed;
      DBGridEhOrders.Canvas.Font.Color := ClBlack;
    end;

  DBGridEhOrders.DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

procedure TMlekoBlankListWithKPKForm.Button2Click(Sender: TObject);
begin
  inherited;
{
  DBGrid.ChangeLayout;
  ComponentProps.DefaultUser := IntToStr(data.UserNo);
  DBGrid.SaveFormatToStorage;
}
end;

end.
