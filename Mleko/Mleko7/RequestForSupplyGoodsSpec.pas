unit RequestForSupplyGoodsSpec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, DBAccess, MSAccess, MemDS, GridsEh,
  DBGridEh, ExtCtrls, StdCtrls, Excel2000, Registry, ComObj, ActiveX, DateUtils;

type
  TRequestForSupplyGoodsSpecForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    quRequestForSupplyGoodsSpec: TMSQuery;
    dsRequestForSupplyGoodsSpec: TMSDataSource;
    quRequestForSupplyGoodsSpecId: TLargeintField;
    quRequestForSupplyGoodsSpecRequestForSupplyGoods_Id: TIntegerField;
    quRequestForSupplyGoodsSpecDateNakl: TDateTimeField;
    quRequestForSupplyGoodsSpecNaklNo: TIntegerField;
    quRequestForSupplyGoodsSpecTovarNo: TIntegerField;
    quRequestForSupplyGoodsSpecNameTovar: TStringField;
    quRequestForSupplyGoodsSpecQty: TFloatField;
    quRequestForSupplyGoodsSpecQtyFirst: TFloatField;
    quRequestForSupplyGoodsSpecPostNo: TIntegerField;
    quRequestForSupplyGoodsSpecPostName: TStringField;
    quRequestForSupplyGoodsSpecDateRequest: TDateTimeField;
    quRequestForSupplyGoodsSpecDeliveryGoodsName: TStringField;
    IsOnlyChange: TCheckBox;
    ExportInFile: TButton;
    sdRequestForSupply: TSaveDialog;
    Button1: TButton;
    quPostArtGroup: TMSQuery;
    quPostArtGroupARTICLE_GROUP_ID: TLargeintField;
    quPostArtGroupNAME: TStringField;
    quPostArtGroupARTICLE_ID: TLargeintField;
    quPostArtGroupSET_ARTICLE_GROUP_ID: TLargeintField;
    quPostArtGroupNAME_1: TStringField;
    quPostArtGroupPOSTNO: TLargeintField;
    quPostArtGroupSET_ARTICLE_GROUP_ID_delay: TLargeintField;
    quPostArtGroupDAY_DELAY: TIntegerField;
    quPostArtGroupDAY_DELAY_EXT: TIntegerField;
    quPostArtGroupPOSTNOP: TLargeintField;
    quPostArtGroupSET_ARTICLE_GROUP_ID_price: TLargeintField;
    quPostArtGroupCOLNPRICE: TSmallintField;
    quNaklR: TMSQuery;
    quSpec: TMSQuery;
    quSpecTovarNo: TIntegerField;
    quSpecQty: TFloatField;
    quSpecid: TIntegerField;
    quPostBan: TMSQuery;
    quPostBanPostBan: TIntegerField;
    quPostBanDescription: TStringField;
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure IsOnlyChangeClick(Sender: TObject);
    procedure ExportInFileClick(Sender: TObject);
    function IsOLEObjectInstalled(Name:string):boolean;
    procedure Button1Click(Sender: TObject);
    procedure ChangePost;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RequestForSupplyGoodsSpecForm: TRequestForSupplyGoodsSpecForm;

implementation

uses data, PostForNaklRUnit, MlekoSelectSetArticleGroup, MlekoSelectBuh, main,
     MlekoSelectVidNakl, MlekoSelectTypeReturn, MleckSelectColNPrice, MlekoDbDsMSSQL,
     Currency;

{$R *.dfm}

function TRequestForSupplyGoodsSpecForm.IsOLEObjectInstalled(Name:string):boolean;
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

procedure TRequestForSupplyGoodsSpecForm.DBGridEh1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if (quRequestForSupplyGoodsSpecQty.Value <> quRequestForSupplyGoodsSpecQtyFirst.Value) then
   DBGridEh1.Canvas.Font.Color := clRed;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TRequestForSupplyGoodsSpecForm.IsOnlyChangeClick(
  Sender: TObject);
begin
  inherited;
  quRequestForSupplyGoodsSpec.Close;
  quRequestForSupplyGoodsSpec.ParamByName('isOnlyChange').Value := IsOnlyChange.Checked;
  quRequestForSupplyGoodsSpec.Open;
end;

procedure TRequestForSupplyGoodsSpecForm.ExportInFileClick(
  Sender: TObject);
var
  cls_ExcelObject: string;
  WorkSheet: Variant;
  Excel: Variant;
  RegData: TRegistry;
  index, i : integer;
begin
  inherited;
  // Чтобы не применять локальные
  // для каждой версии
  // названия "Excel.Application.8", "Excel.Application.9".

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
//  Excel.ActiveSheet.DisplayPageBreaks := False;
  Excel.Application.DisplayStatusBar := False;
  Excel.Visible := false;


  // Создаем новую таблицу

  Excel.Workbooks.Add;

  WorkSheet := Excel.Workbooks[1].WorkSheets[1];

  index := 1;

  WorkSheet.Cells[index,1] := 'Номер запроса';
  WorkSheet.Cells[index,2] := 'Дата запроса';
  WorkSheet.Cells[index,3] := 'Номер накладной';
  WorkSheet.Cells[index,4] := 'Дата накладной';
  WorkSheet.Cells[index,5] := 'Поставка товара';
  WorkSheet.Cells[index,6] := 'Номер товара';
  WorkSheet.Cells[index,7] := 'Наименование товара';
  WorkSheet.Cells[index,8] := 'Кол-во';
  WorkSheet.Cells[index,9] := 'Начальное кол-во';
  WorkSheet.Cells[index,10] := 'Номер контрагента';
  WorkSheet.Cells[index,11] := 'Контрагент';

  if quRequestForSupplyGoodsSpec.RecordCount > 0 then
  while not quRequestForSupplyGoodsSpec.Eof do
    begin
      index := index + 1;

      WorkSheet.Cells[index,1] := quRequestForSupplyGoodsSpecRequestForSupplyGoods_Id.Value; // Номер запроса на поставку
      WorkSheet.Cells[index,2] := quRequestForSupplyGoodsSpecDateRequest.Value; // Дата запроса на поставку
      WorkSheet.Cells[index,3] := quRequestForSupplyGoodsSpecNaklNo.Value; // Номер накладной
      WorkSheet.Cells[index,4] := quRequestForSupplyGoodsSpecDateNakl.Value; // Дата накладной
      WorkSheet.Cells[index,5] := quRequestForSupplyGoodsSpecDeliveryGoodsName.Value; // Поставка товара
      WorkSheet.Cells[index,6] := quRequestForSupplyGoodsSpecTovarNo.Value; // Код товара
      WorkSheet.Cells[index,7] := quRequestForSupplyGoodsSpecNameTovar.Value; // Наименование товара
      WorkSheet.Cells[index,8] := quRequestForSupplyGoodsSpecQty.Value; // Кол-во
      WorkSheet.Cells[index,9] := quRequestForSupplyGoodsSpecQtyFirst.Value; // Кол-во изначальное
      WorkSheet.Cells[index,10] := quRequestForSupplyGoodsSpecPostNo.Value; // Номер контрагента
      WorkSheet.Cells[index,11] := quRequestForSupplyGoodsSpecPostName.Value; // Контрагент
      quRequestForSupplyGoodsSpec.Next;

    end;




  sdRequestForSupply.DefaultExt := '.xls';   // Выбираем файл для импорта данных
  sdRequestForSupply.Filter := 'Excel (*.xls)|*.xls'; // Устанавливаем фильтер

if sdRequestForSupply.Execute then
   begin
     Excel.Application.EnableEvents := true;
     Excel.Application.Interactive := true;
     Excel.Application.DisplayAlerts := true;
     Excel.ActiveWorkBook.SaveCopyAs(sdRequestForSupply.FileName);
     Excel.ActiveWorkBook.Close(0); // xlDontSaveChanges
     Excel.Quit;
     Excel := Unassigned;
     ShowMessage('Выгрузка поставок завершено'+ #10#13 +'Выгружено ' + IntToStr(index)+' позиций.');
   end;


end;

procedure TRequestForSupplyGoodsSpecForm.ChangePost;
var
  // RetPostForNaklR:TRetPostForNaklR;
  Buh, VidNaklNo, TypeReturnNo, ColNPrice, NewNaklNo, MainDelay : integer;
  Nom, CurrencyId : integer;
  RetPostForNaklR: TRetPostForNaklR;
  CaseRecalculation : word;
  isAction : boolean;
  SArticleGroupDouble, pKey : Int64;
  ErrMsg, DescriptionBan, Currency, CurrencyAccounting : String;
  RateCurrencyAccounting, Rate : Real;
  Dlg  : TMlekoSelectBuhDlg;
  Dlg1 : TMlekoSelectVidNaklDlg;
  Dlg2 : TMlekoSelectTypeReturnDlg;
  Dlg3 : TMlekoSelectSetArticleGroupForm;
  Dlg4 : TMleckSelectColNPriceForm;
  quNewNaklNo,quPrice : TMSQuery;
begin
  RetPostForNaklR := PostForNaklR(Date());
  // RetPost:=Post(True, True);
  isAction := True;
  Buh := 0;
  VidNaklNo := 0;
  TypeReturnNo := 0;
  if RetPostForNaklR.PostNo > 0 then
  begin
     if isAction = True then
      begin
        if not (quNaklR.State in [dsInsert, dsEdit]) then quNaklR.Edit;
        quNaklR.FieldByName('PostNo').AsInteger := RetPostForNaklR.PostNo;
        quNaklR.FieldByName('PostNoFirst').AsInteger := RetPostForNaklR.PostNo;
        quNaklR.FieldByName('SotrudNo').AsInteger := RetPostForNaklR.SotrudNo;
        quNaklR.FieldByName('AddressNo').AsInteger := RetPostForNaklR.AddressNo;
        quNaklR.FieldByName('OtdelNo').AsInteger := RetPostForNaklR.OtdelNo;

        ShowMessage('Укажите бухгалтерский тип:');

        Dlg := TMlekoSelectBuhDlg.Create(Application);
        try
         if Dlg.ShowModal = mrok Then
          begin
            Buh := Dlg.Query.FieldByName('Buh').Value;
          end;
        finally
          Dlg.Query.Close;
          Dlg.Free;
        end;


        if Buh = 0 then raise Exception.Create(' Не указан бухгалтерский тип!'+ #10#13 +
                                               'Накладная создана не будет!');

        ShowMessage('Укажите вид накладной:');

        Dlg1 := TMlekoSelectVidNaklDlg.Create(Application);
        try
         if Dlg1.ShowModal = mrok Then
          begin
            VidNaklNo := Dlg1.Query.FieldByName('VidNaklNo').Value;
            if (VidNaklNo = 3) or (VidNaklNo = 5) then begin
                                                         ShowMessage('Укажите тип возврата:');

                                                         Dlg2 := TMlekoSelectTypeReturnDlg.Create(Application);
                                                         try
                                                          if Dlg2.ShowModal = mrok Then
                                                           begin
                                                             TypeReturnNo := Dlg2.Query.FieldByName('TypeReturnNo').Value;
                                                           end;
                                                         finally
                                                          Dlg2.Query.Close;
                                                          Dlg2.Free;
                                                         end;
                                                       end;
          end;
        finally
         Dlg1.Query.Close;
         Dlg1.Free;
        end;

        if ((VidNaklNo = 3) or (VidNaklNo = 5)) and (TypeReturnNo = 0) then raise Exception.Create(' Не заполнен тип возврата!'+ #10#13 +
                                                                                                   'Накладная создана не будет!');
        if VidNaklNo = 0 then raise Exception.Create(' Не указан вид накладной!'+ #10#13 +
                                                     'Накладная создана не будет!');


        ShowMessage('Укажите набор отсрочки по накладной:');

        Dlg3 := TMlekoSelectSetArticleGroupForm.Create(Application);
        Dlg3.quSetArtGroupDelay.ParamByName('Buh').Value := Buh;
        Dlg3.quSetArtGroupDelay.ParamByName('PostNo').Value := RetPostForNaklR.PostNo;
        Dlg3.quSetArtGroupDelay.Open;
        try
         if Dlg3.ShowModal = mrok then
          begin
            SArticleGroupDouble := Dlg3.quSetArtGroupDelay.FieldByName('id').Value;
            MainDelay := Dlg3.quSetArtGroupDelay.FieldByName('MainDayDelay').Value;
          end;
        finally
         Dlg3.quSetArtGroupDelay.Close;
         Dlg3.Free;
        end;

        if (SArticleGroupDouble = 0) then raise Exception.Create(' Не указан набор отсрочки по накладной!'+ #10#13 +
                                                                 'Накладная создана не будет!');

        ShowMessage('Укажите колонку цены по накладной:');

        Dlg4 := TMleckSelectColNPriceForm.Create(Application);
        Dlg4.quSelectColNPrice.ParamByName('PostNo').Value := RetPostForNaklR.PostNo;
        Dlg4.quSelectColNPrice.Open;
        try
         if Dlg4.ShowModal = mrok then
          begin
            ColNPrice := Dlg4.quSelectColNPrice.fieldByName('COLNPRICE').Value;
          end;
        finally
         Dlg4.quSelectColNPrice.Close;
         Dlg4.Free;
        end;

        if (ColNPrice = 0) then raise Exception.Create(' Не указана колонка цены по накладной!'+ #10#13 +
                                                       'Накладная создана не будет!');

        ShowMessage('Выберите валюту накладной:');

        CurrencyId := ShowCurrency(false);

        dmDataModule.OpenSQL('select l_code from d_currency where id = :p1_id',[CurrencyId]);
        Currency := dmDataModule.QFO.FieldByName('l_code').Value;

        dmDataModule.OpenSQL('select Rate from d_currency dc left join CurrencyExchange ce on ce.CurrencyId = dc.ID and ce.IsActive = 1 where dc.L_CODE =  :p1_Currency',[Currency]);
        Rate := dmDataModule.QFO.FieldByName('Rate').Value;

        dmDataModule.OpenSQL('select c.l_code from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0');
        CurrencyAccounting := dmDataModule.QFO.FieldByName('l_code').Value;

        dmDataModule.OpenSQL('select ce.Rate from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0');
        RateCurrencyAccounting := dmDataModule.QFO.FieldByName('Rate').Value;

        dmDataModule.OpenSQL('select ce.Rate from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0');

//        showmessage (IntToStr(CurrencyId)+' - '+Currency+' - '+ CurrencyAccounting+' - '+FloatToStr(RateCurrencyAccounting)+' - '+FloatToStr(Rate));

        quNaklR.FieldByName('VidNaklNo').AsInteger := VidNaklNo;
        quNaklR.FieldByName('TypeReturnNo').AsInteger := TypeReturnNo;
        quNaklR.FieldByName('Buh').AsInteger := Buh;
        quNaklR.FieldByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroupDouble;
        quNaklR.FieldByName('ColnPrice').AsInteger := ColNPrice;
        quNaklR.FieldByName('DateOpl').AsDateTime := IncDay(Date(), MainDelay);

        dmDataModule.OpenSQL('select -1*cast(cast(newid() as binary(16)) as bigint) as new_id ');
        pKey := dmDataModule.QFO.FieldByName('new_id').Value;

        dmDataModule.OpenSQL('Select max(NaklNo)+1 as NaklNo from Naklr');
        NewNaklNo := dmDataModule.QFO.FieldByName('NaklNo').AsInteger;

        dmDataModule.OpenSQL('Select max(Nom)+1 as Nom from Naklr');
        Nom := dmDataModule.QFO.FieldByName('Nom').AsInteger;

        quNaklR.FieldByName('Nom').Value := Nom;
        quNaklR.FieldByName('NomFirst').Value := Nom;
        quNaklR.FieldByName('DateNakl').AsDateTime := Date();
        quNaklR.FieldByName('DateNaklFirst').AsDateTime := Date();
        quNaklR.FieldByName('NaklNo').AsInteger := NewNaklNo;
        quNaklR.FieldByName('pkey').Value := pKey;
        quNaklR.FieldByName('UserNo').Value := data.UserNo;
        quNaklR.FieldByName('description').Value := 'Создано на основании Запроса на поставку товара № '+quRequestForSupplyGoodsSpecRequestForSupplyGoods_Id.AsString;
        quNaklR.FieldByName('CurrencyHead').Value := Currency;
        quNaklR.FieldByName('CurrencyAccounting').Value := CurrencyAccounting;
        quNaklR.FieldByName('RateCurrencyAccounting').Value := RateCurrencyAccounting;

        quPostBan.ParamByName('p_PostNo').Value := RetPostForNaklR.PostNo;
        quPostBan.Open;

        if (quPostBanPostBan.Value = 1) and ((VidNaklNo = 3) or (VidNaklNo = 5)) then
         begin
            DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ quPostBanDescription.Value;
            raise Exception.Create(DescriptionBan);
          end;

        quNaklR.Post;

        quSpec.Close;
        quSpec.ParamByName('Id').Value := quRequestForSupplyGoodsSpecRequestForSupplyGoods_Id.Value;
        quSpec.Open;

        if quSpec.RecordCount > 0 then begin
                                         if ColNPrice > 0 then begin
                                                                 quSpec.First;
                                                                 while not quSpec.Eof do begin


                                                                                           quPrice :=TMSQuery.Create(nil);
                                                                                           quPrice.Connection:=dmDataModule.DB;
                                                                                           quPrice.SQL.Clear;
                                                                                           quPrice.SQL.Text:= ' declare @Rate decimal(18,2) '
                                                                                                             +' set @Rate = convert(decimal(18,2),:Rate) '
                                                                                                             +'select isnull(case when :ColnPrice = 1 then Isnull(Price,0) '
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
                                                                                                             +'              end,0) * (select Rate '
                                                                                                             +'                         from d_currency dc left join '
                                                                                                             +'                              CurrencyExchange ce on ce.CurrencyId = dc.ID and ce.IsActive = 1 '
                                                                                                             +'            						   where dc.L_CODE = pfv.Currency) / @Rate as Price '
                                                                                                             +' from Ostatok o '
                                                                                                             +'     ,PriceForVeb pfv '
                                                                                                             +'  where o.TovarNo = :TovarNo '
                                                                                                             +'    and o.TovarNo = pfv.TovarNo';
                                                                                           quPrice.Prepare;
                                                                                           quPrice.ParamByName('TovarNo').Value := quSpecTovarNo.Value;
                                                                                           quPrice.ParamByName('ColnPrice').Value := ColNPrice;
                                                                                           quPrice.ParamByName('Rate').AsFloat := Rate;
                                                                                           quPrice.Open;
                                                                                           if ((quPrice.FieldByName('Price').Value = 0) or (quPrice.FieldByName('Price').Value = Null)) then begin
                                                                                                                                                                                               ErrMsg := 'Не расцененный товар!' +#13#10+
                                                                                                                                                                                                         'Создание накладной остановлено! Сообщите программисту!' +#13#10+
                                                                                                                                                                                                         'Код товара ' + quSpecTovarNo.AsString;
                                                                                                                                                                                               raise Exception.Create(ErrMsg);
                                                                                                                                                                                             end;

                                                                                           TMlekoDbDsMSSQLDm(CustomDm).quDspec.Open;
                                                                                           TMlekoDbDsMSSQLDm(CustomDm).quDspec.Insert;
                                                                                           TMlekoDbDsMSSQLDm(CustomDm).quDspec.FieldByName('article_id').AsInteger := quSpecTovarNo.Value;
                                                                                           TMlekoDbDsMSSQLDm(CustomDm).quDspec.FieldByName('qty').AsFloat := quSpecQty.Value;
                                                                                           TMlekoDbDsMSSQLDm(CustomDm).quDspec.FieldByName('Price_eco').AsFloat := quPrice.FieldByName('Price').Value;
                                                                                           TMlekoDbDsMSSQLDm(CustomDm).quDspec.FieldByName('dhead_id').Value := pKey;
                                                                                           TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('DateOfManufacture').Value := DateOfManufacture;
                                                                                           TMlekoDbDsMSSQLDm(CustomDm).quDspec.Post;
                                                                                           TMlekoDbDsMSSQLDm(CustomDm).quDspec.Close;





                                                                                           quSpec.Next;
                                                                                         end;
                                                                 ShowMessage (' Создана накладная NaklNo = '+ IntToStr(NewNaklNo)+#13#10+
                                                                              'Ключ pkey = '+FloatToStr(pKey));
                                                               end
                                                          else begin
                                                                 dmDataModule.ExecSQL('delete NaklR where pkey = :p1_key ',[pKey]);
                                                                 ShowMessage (' Не выбрана колонка цены! '+#13#10+
                                                                              'Накладная не создана!');
                                                               end;
                                       end
                                  else begin
                                         dmDataModule.ExecSQL('delete NaklR where pkey = :p1_key ',[pKey]);
                                         ShowMessage (' В запросе на поставку товара отсутствуют позиции с кол-вом > 0! '+#13#10+
                                                      'Накладная не создана!');
                                       end;
      end;

  end;


end;


procedure TRequestForSupplyGoodsSpecForm.Button1Click(Sender: TObject);
begin
  inherited;
  quNaklR.Open;
  ChangePost;
end;

end.
