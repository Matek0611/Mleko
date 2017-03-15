unit CreateBlankWithExel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, StdCtrls, ExtCtrls, Excel2000, ActiveX, Registry,
  DBAccess, MSAccess, ComObj, DB, MemDS;

type
  TCreateBlankWithExelForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    leSelectFirm: TLabeledEdit;
    leBuh: TLabeledEdit;
    leVidNakl: TLabeledEdit;
    lTypeReturn: TLabeledEdit;
    bLoadAndCreateOrders: TButton;
    od_InputOrderWithExcel: TOpenDialog;
    quInsInOrdersFromExcel: TMSQuery;
    quOrdersCNT: TMSQuery;
    quOrdersCNTAddressPost: TStringField;
    quOrdersCNTOrderDate: TDateTimeField;
    quOrdersCNTAddressNo: TSmallintField;
    quInsInAddressCorrespondence: TMSQuery;
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
    quColnPriceForOrder: TMSQuery;
    quColnPriceForOrderSET_ARTICLE_GROUP_ID_price: TLargeintField;
    quColnPriceForOrderCOLNPRICE: TSmallintField;
    quSpecBlank: TMSQuery;
    quSpecBlankOrderDate: TDateTimeField;
    quSpecBlankPostNo: TSmallintField;
    quSpecBlankAddressNo: TSmallintField;
    quSpecBlankKolTov: TIntegerField;
    quSpecBlankTovarNo: TIntegerField;
    quSpecBlankTovarNoPost: TLargeintField;
    cbIsVisebleStringOrder: TCheckBox;
    SpCheckBlank: TMSStoredProc;
    spEditBlankPosition: TMSStoredProc;
    procedure leSelectFirmChange(Sender: TObject);
    procedure leSelectFirmDblClick(Sender: TObject);
    procedure leSelectFirmEnter(Sender: TObject);
    procedure leBuhChange(Sender: TObject);
    procedure leBuhDblClick(Sender: TObject);
    procedure leBuhEnter(Sender: TObject);
    procedure leVidNaklChange(Sender: TObject);
    procedure leVidNaklDblClick(Sender: TObject);
    procedure leVidNaklEnter(Sender: TObject);
    procedure lTypeReturnChange(Sender: TObject);
    procedure lTypeReturnDblClick(Sender: TObject);
    procedure lTypeReturnEnter(Sender: TObject);
    procedure bLoadAndCreateOrdersClick(Sender: TObject);
  private
    FPostNo: Int64;
    FBuh: Integer;
    FVidNaklNo: Integer;
    FTypeReturnNo: Integer;
    procedure SetPostNo(const Value: Int64);
    procedure SetBuh(const Value: Integer);
    procedure SetVidNaklNo(const Value: Integer);
    procedure SetTypeReturnNo(const Value: Integer);
    function IsOLEObjectInstalled(Name:string):boolean;
    function CheckBlank(pPostno, pReason_id: Integer; pDateNakl: TDate;
      pOtdelNo: Integer; SET_ARTICLE_GROUP_ID: Int64; var err_message: string): Integer;
    procedure DelBlankHead (DocumentId : integer);
    procedure AddTovarInBlanks (DocumentId, TovarNo, UserNo, ColNPrice : integer; KolBeg, KolOrd, Boss_Price, Residue, Need : double);
    procedure InsInBlankForExcel(OrderDate : TDateTime; PostNo, AddressNo, DocumentId : integer);
    { Private declarations }
  public
    property PostNo: Int64 read FPostNo write SetPostNo;
    property Buh: Integer read FBuh write SetBuh;
    property VidNaklNo: Integer read FVidNaklNo write SetVidNaklNo;
    property TypeReturnNo: Integer read FTypeReturnNo write SetTypeReturnNo;
    { Public declarations }
  end;

var
  CreateBlankWithExelForm: TCreateBlankWithExelForm;

implementation
uses MlekoSelectFirmForBlank, MlekoSelectBuh, MlekoSelectVidNakl,
     MlekoSelectTypeReturn,MlekoBlankParam,data,MlekoBlankList,TemplateFileFromExcelOrders,
     MlekoSelectAddress;

{$R *.dfm}

function TCreateBlankWithExelForm.IsOLEObjectInstalled(Name:string):boolean;
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

procedure TCreateBlankWithExelForm.SetPostNo(const Value: Int64);
begin
  if FPostNo <> Value then FPostNo := Value;
end;

procedure TCreateBlankWithExelForm.SetBuh(const Value: Integer);
begin
  if FBuh <> Value then FBuh := Value;
end;

procedure TCreateBlankWithExelForm.SetVidNaklNo(const Value: Integer);
begin
  if FVidNaklNo <> Value then FVidNaklNo := Value;
end;

procedure TCreateBlankWithExelForm.SetTypeReturnNo(const Value: Integer);
begin
  if FTypeReturnNo <> Value then FTypeReturnNo := Value;
end;

procedure TCreateBlankWithExelForm.leSelectFirmChange(Sender: TObject);
begin
  inherited;
  ActiveControl := leBuh;
end;

procedure TCreateBlankWithExelForm.leSelectFirmDblClick(Sender: TObject);
var
  Dlg:TMlekoSelectFirmForBlankDlg;
begin
  inherited;
  Dlg := TMlekoSelectFirmForBlankDlg.Create(Application);
  try
    if Dlg.ShowModal = mrok Then
      begin
        PostNo := Dlg.Query.FieldByName('PostNo').Value;
        leSelectFirm.Text := Dlg.Query.FieldByName('nameshort').Value;
      end;
  finally
     Dlg.Query.Close;
     Dlg.Free;
  end;
end;

procedure TCreateBlankWithExelForm.leSelectFirmEnter(Sender: TObject);
var
  Dlg:TMlekoSelectFirmForBlankDlg;
begin
  inherited;
  Dlg := TMlekoSelectFirmForBlankDlg.Create(Application);
  try
    if Dlg.ShowModal = mrok Then
      begin
        PostNo := Dlg.Query.FieldByName('PostNo').Value;
        leSelectFirm.Text := Dlg.Query.FieldByName('nameshort').Value;
      end;
  finally
     Dlg.Query.Close;
     Dlg.Free;
  end;
end;

procedure TCreateBlankWithExelForm.leBuhChange(Sender: TObject);
begin
  inherited;
  ActiveControl := leVidNakl
end;

procedure TCreateBlankWithExelForm.leBuhDblClick(Sender: TObject);
var
  Dlg:TMlekoSelectBuhDlg;
begin
  inherited;
  Dlg := TMlekoSelectBuhDlg.Create(Application);
  try
    if Dlg.ShowModal = mrok Then
      begin
        Buh := Dlg.Query.FieldByName('Buh').Value;
        leBuh.Text := Dlg.Query.FieldByName('buh_type_name').Value;
      end;
  finally
     Dlg.Query.Close;
     Dlg.Free;
  end;
end;

procedure TCreateBlankWithExelForm.leBuhEnter(Sender: TObject);
var
  Dlg:TMlekoSelectBuhDlg;
begin
  inherited;
  Dlg := TMlekoSelectBuhDlg.Create(Application);
  try
    if Dlg.ShowModal = mrok Then
      begin
        Buh := Dlg.Query.FieldByName('Buh').Value;
        leBuh.Text := Dlg.Query.FieldByName('buh_type_name').Value;
      end;
  finally
     Dlg.Query.Close;
     Dlg.Free;
  end;
end;

procedure TCreateBlankWithExelForm.leVidNaklChange(Sender: TObject);
begin
  inherited;
  if VidNaklNo = 3 then begin
                          lTypeReturn.Visible := true;
                          ActiveControl := lTypeReturn;
                        end
                   else if ((leSelectFirm.Text<>'')and(leBuh.Text<>'')and(leVidNakl.Text<>'')) then bLoadAndCreateOrders.Click;
end;

procedure TCreateBlankWithExelForm.leVidNaklDblClick(Sender: TObject);
var
  Dlg:TMlekoSelectVidNaklDlg;
begin
  inherited;
  Dlg := TMlekoSelectVidNaklDlg.Create(Application);
  try
    if Dlg.ShowModal = mrok Then
      begin
        VidNaklNo := Dlg.Query.FieldByName('VidNaklNo').Value;
        leVidNakl.Text := Dlg.Query.FieldByName('VidNaklName').Value;
        if VidNaklNo = 3 then lTypeReturn.Visible := true else begin
                                                                 lTypeReturn.Text := '';
                                                                 TypeReturnNo := 0;
                                                                 lTypeReturn.Visible := false;
                                                               end;
      end;
  finally
     Dlg.Query.Close;
     Dlg.Free;
  end;
end;

procedure TCreateBlankWithExelForm.leVidNaklEnter(Sender: TObject);
var
  Dlg:TMlekoSelectVidNaklDlg;
begin
  inherited;
  Dlg := TMlekoSelectVidNaklDlg.Create(Application);
  try
    if Dlg.ShowModal = mrok Then
      begin
        VidNaklNo := Dlg.Query.FieldByName('VidNaklNo').Value;
        leVidNakl.Text := Dlg.Query.FieldByName('VidNaklName').Value;
        if (VidNaklNo = 3) or (VidNaklNo = 5) then lTypeReturn.Visible := true else begin
                                                                                      lTypeReturn.Text := '';
                                                                                      TypeReturnNo := 0;
                                                                                      lTypeReturn.Visible := false;
                                                                                     end;
      end;
  finally
     Dlg.Query.Close;
     Dlg.Free;
  end;
end;

procedure TCreateBlankWithExelForm.lTypeReturnChange(Sender: TObject);
begin
  inherited;
  if ((leSelectFirm.Text<>'')and(leBuh.Text<>'')and(leVidNakl.Text<>'')and(lTypeReturn.Text<>'')) then bLoadAndCreateOrders.Click;
end;

procedure TCreateBlankWithExelForm.lTypeReturnDblClick(Sender: TObject);
var
  Dlg:TMlekoSelectTypeReturnDlg;
begin
  inherited;
  Dlg := TMlekoSelectTypeReturnDlg.Create(Application);
  try
    if Dlg.ShowModal = mrok Then
      begin
        TypeReturnNo := Dlg.Query.FieldByName('TypeReturnNo').Value;
        lTypeReturn.Text := Dlg.Query.FieldByName('TypeReturnName').Value;
      end;
  finally
     Dlg.Query.Close;
     Dlg.Free;
  end;
end;

procedure TCreateBlankWithExelForm.lTypeReturnEnter(Sender: TObject);
var
  Dlg:TMlekoSelectTypeReturnDlg;
begin
  inherited;
  Dlg := TMlekoSelectTypeReturnDlg.Create(Application);
  try
    if Dlg.ShowModal = mrok Then
      begin
        TypeReturnNo := Dlg.Query.FieldByName('TypeReturnNo').Value;
        lTypeReturn.Text := Dlg.Query.FieldByName('TypeReturnName').Value;
      end;
  finally
     Dlg.Query.Close;
     Dlg.Free;
  end;
end;

procedure TCreateBlankWithExelForm.bLoadAndCreateOrdersClick(
  Sender: TObject);
const
  xlValues = -4163;
  xlWhole = 1;
var
  Dlg: TMlekoBlankParamForm;
  Dlg1: TMlekoBlankListForm;
  Dlg2: TMlekoSelectAddressDlg;
  cls_ExcelObject: string;
  RegData: TRegistry;
  WorkSheet: Variant;
  Excel: Variant;
  ExURng: variant;
  i, index : Integer;
  ListFieldName: TMSQuery;
  PrepareTovarNo: TMSQuery;
  FindStr, l_str : String;
  isKodCol, isNameCol, isDateCol, isKolCol, IsAddressCol : Boolean;
  Row, KodCol, NameCol, DateCol, KolCol, AddressCol: Integer;
  ListFieldError : String;
  FindCell : Variant;
  OldSeparator : char;
  Qty : Double;
  QtyS : string;
  documentID : Integer;
  LdocumentID : Integer;
  AddressNo : Integer;
  ColNPrice : Integer;
  OrdersCNT : integer;
  SArticleGroupDouble : Int64;
  SArticleGroupDoublePred : Int64;
  ArticleGroupDouble : Int64;
  SArticleGroup : string;
  DescriptionBan : string;
  DescriptionBanPay : string;
  ErrMsg : String;
  isRun : boolean;
  isStop : boolean;
  Is_PostBan : boolean;
  Is_ControlPostBanPay : boolean;
  SumDoc : Double;
  CheckOrderForExcel : TMSQuery;
  quCheckOrder : TMSQuery;
  Residue, Need : double;
  quSummaBlanksHead : TMSQuery;
  quListBlanksDocId : TMSQuery;
  quDocum : TMSQuery;
  quSumDocum : TMSQuery;
  quOrderSumma : TMSQuery;
begin
  inherited;
  
        Dlg2 := TMlekoSelectAddressDlg.Create(Application);
                                            Dlg2.PostNo := PostNo;
                                            Dlg2.Query.ParamByName('PostNo').Value := PostNo;
                                            Dlg2.Query.Open;
                                            try
                                              if Dlg2.ShowModal = mrok Then
                                                begin
                                                  AddressNo := Dlg2.Query.FieldByName('AddressNo').Value;

                                                  quInsInAddressCorrespondence.Close;
                                                  quInsInAddressCorrespondence.ParamByName('PostNo').Value := PostNo;
                                                  quInsInAddressCorrespondence.ParamByName('AddressNo').Value := AddressNo;
                                                  quInsInAddressCorrespondence.ParamByName('AddressPost').Value := Dlg2.Query.FieldByName('Address').Value;
                                                  quInsInAddressCorrespondence.Execute;

                                                end;
                                            finally
                                                Dlg2.Query.Close;
                                                Dlg2.Free;
                                            end;
// Проверяем заполненность обязательных полей
  if leSelectFirm.Text = '' then begin
                                   ActiveControl := leSelectFirm;
                                   raise Exception.Create('Не заполнено обязательное поле Фирма!'+ #10#13 +
                                                          'Создание заказа невозможно!'+ #10#13 +
                                                          'Заполните поле Фирма и повторите попытку!');
                                 end;
  if leBuh.Text = '' then begin
                            ActiveControl := leBuh;
                            raise Exception.Create('Не заполнено обязательное поле Бухгалтерский тип!'+ #10#13 +
                                                   'Создание заказа невозможно!'+ #10#13 +
                                                   'Заполните поле Вид накладной и повторите попытку!');
                          end;
  if leVidNakl.Text = '' then begin
                                 ActiveControl := leVidNakl;
                                 raise Exception.Create('Не заполнено обязательное поле Вид накладной!'+ #10#13 +
                                                        'Создание заказа невозможно!'+ #10#13 +
                                                        'Заполните поле Вид накладной и повторите попытку!');
                               end;
  if VidNaklNo = 3 then
   if lTypeReturn.Text = '' then begin
                                   ActiveControl := lTypeReturn;
                                   raise Exception.Create('Не заполнено обязательное поле Тип возврата!'+ #10#13 +
                                                          'Создание заказа невозможно!'+ #10#13 +
                                                          'Заполните поле Вид накладной и повторите попытку!');
                                 end;
// Конец проверки


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

  od_InputOrderWithExcel.DefaultExt := '.xls';   // Выбираем файл для импорта данных
  od_InputOrderWithExcel.Filter := 'Excel (*.xls)|*.xls'; // Устанавливаем фильтер

  if od_InputOrderWithExcel.Execute then
   begin
     Excel.Workbooks.Open(od_InputOrderWithExcel.FileName);
     WorkSheet := Excel.Workbooks[1].WorkSheets[1];
     WorkSheet.Columns.AutoFit;
     i := Excel.ActiveSheet.UsedRange.Rows.Count;
     ExURng := WorkSheet.UsedRange;

     ListFieldName := TMSQuery.Create(nil);
     ListFieldName.Connection:= dmDataModule.DB;
     ListFieldName.SQL.Clear;
     ListFieldName.SQL.Text := 'declare @PostNo int '
                              +' set @PostNo = :PostNo '
                              +' select  dviefb.ID '
                              +'       , dviefb.Name '
                              +'       , lviefb.Column_Name_Post '
                              +'       , isnull(lviefb.PostNo,@PostNo) as PostNo '
                              +'  from d_VidImportExelFileForBlanks dviefb left join '
                              +'       L_VidImportExelFileForBlanks lviefb on lviefb.d_VidImportExelFileForBlanks_id = dviefb.ID and lviefb.PostNo = @PostNo ';
//                              +'   where lviefnp.Column_Name_Post is not null ';
     ListFieldName.ParamByName('PostNo').Value := PostNo;
     ListFieldName.Open;

     if ListFieldName.RecordCount = 0 then raise Exception.Create(' По этому контрагентуагенту не настроина таблица соответствия загрузки из екселя! '+ #10#13 +
                                                                  'Заполните таблицу и повторите попытку.');

     ListFieldName.First;


// Цикл проверки нахождения номеров столбцов в файле
     ListFieldError := '';
     while not ListFieldName.Eof do
      begin
        if ListFieldName.FieldByName('Name').Value = 'Код товара' then
         begin
           if (ListFieldName.FieldByName('Column_Name_Post').AsString = '') then FindStr := 'Не задано'
                                                                            else FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
           isKodCol := True;

           FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);

           if Pointer(IDispatch(FindCell))=nil then
            begin
              isKodCol := False;
              FindStr := ListFieldName.FieldByName('Name').Value +' --- '+FindStr;
              ListFieldError := ListFieldError + ' '+FindStr+' '+ #10#13;
            end;
         end;
        if ListFieldName.FieldByName('Name').Value = 'Наименование товара' then
         begin
           if (ListFieldName.FieldByName('Column_Name_Post').AsString = '') then FindStr := 'Не задано'
                                                                            else FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
           isNameCol := True;

           FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);

           if Pointer(IDispatch(FindCell))=nil then
            begin
              isNameCol := False;
              FindStr := ListFieldName.FieldByName('Name').Value +' --- '+FindStr;
              ListFieldError := ListFieldError + ' '+FindStr+' '+ #10#13;
            end;
         end;
        if ListFieldName.FieldByName('Name').Value = 'Дата формирования заказа' then
         begin
           if (ListFieldName.FieldByName('Column_Name_Post').AsString = '') then FindStr := 'Не задано'
                                                                            else FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
           isDateCol := True;

           FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);

           if Pointer(IDispatch(FindCell))=nil then
            begin
              isDateCol := False;
              FindStr := ListFieldName.FieldByName('Name').Value +' --- '+FindStr;
              ListFieldError := ListFieldError + ' '+FindStr+' '+ #10#13;
            end;
         end;
        if ListFieldName.FieldByName('Name').Value = 'Количество' then
         begin
           if (ListFieldName.FieldByName('Column_Name_Post').AsString = '') then FindStr := 'Не задано'
                                                                            else FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
           isKolCol := True;

           FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);

           if Pointer(IDispatch(FindCell))=nil then
            begin
              isKolCol := False;
              FindStr := ListFieldName.FieldByName('Name').Value +' --- '+FindStr;
              ListFieldError := ListFieldError + ' '+FindStr+' '+ #10#13;
            end;
         end;
        if ListFieldName.FieldByName('Name').Value = 'Адрес доставки' then
         begin
           if (ListFieldName.FieldByName('Column_Name_Post').AsString = '') then FindStr := 'Не задано'
                                                                            else FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
           IsAddressCol := True;

           FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);

           if Pointer(IDispatch(FindCell))=nil then
            begin
              IsAddressCol := False;
              FindStr := ListFieldName.FieldByName('Name').Value +' --- '+FindStr;
              ListFieldError := ListFieldError + ' '+FindStr+' '+ #10#13;
            end;
         end;
        ListFieldName.Next;
      end;

     if ListFieldError <> '' then
      begin
        if (IsAddressCol = false) or (isKolCol = false) or (isKodCol = false) then
         begin
           raise Exception.Create(' В файле: '+od_InputOrderWithExcel.FileName+ #10#13+
                                  'Отсутствуют обязательные наименования столбцов: '+ #10#13 +ListFieldError+
                                  'Проверте нахождение этих столбцов в файле, или приведите в соответствие таблицу настройки!');
         end;
      end;

     ListFieldName.First;

     FindStr := '';

// Цикл по получению данных для номера первой строки и номеров столбцов

     while not ListFieldName.Eof do
      begin
        if ListFieldName.FieldByName('Name').Value = 'Код товара' then
         begin
           if isKodCol then
            begin
              FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
              FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);
              Row := FindCell.Row +1;
              KodCol := FindCell.Column;
            end;
         end;

        if ListFieldName.FieldByName('Name').Value = 'Наименование товара' then
         begin
           if isNameCol then
            begin
              FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
              FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);
              Row := FindCell.Row +1;
              NameCol := FindCell.Column;
            end;
         end;

        if ListFieldName.FieldByName('Name').Value = 'Количество' then
         begin
           if isKolCol then
            begin
              FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
              FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);
              Row := FindCell.Row +1;
              KolCol := FindCell.Column;
            end;
         end;

        if ListFieldName.FieldByName('Name').Value = 'Дата формирования заказа' then
         begin
           if isDateCol then
            begin
              FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
              FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);
              Row := FindCell.Row +1;
              DateCol := FindCell.Column;
            end;
         end;

        if ListFieldName.FieldByName('Name').Value = 'Адрес доставки' then
         begin
           if isAddressCol then
            begin
              FindStr := ListFieldName.FieldByName('Column_Name_Post').Value;
              FindCell := ExURng.Find(What:=FindStr, LookIn:=xlValues, LookAt:=xlWhole, MatchCase:=False);
              Row := FindCell.Row +1;
              AddressCol := FindCell.Column;
            end;
         end;

//        showmessage('Row -'+inttostr(Row)+' '+'KodCol -'+inttostr(KodCol)+' '+'NameCol -'+inttostr(NameCol)+' '+'KolCol -'+inttostr(KolCol)+' '+'PriceNDSCol -'+inttostr(PriceNDSCol)+' '+'PriceNoNDSCol -'+inttostr(PriceNoNDSCol) );

        ListFieldName.Next;
      end;
// Очищаем табличку truncate table OrdersFromExcel
     dmDataModule.QFO.Close;
     dmDataModule.QFO.SQL.Clear;
     dmDataModule.QFO.SQL.Add('truncate table OrdersFromExcel ');
     dmDataModule.QFO.Execute;

     for index := Row to i do
      begin
        if (WorkSheet.Cells[index,KodCol].Text <> '') then
         begin
           OldSeparator := SysUtils.DecimalSeparator;
           SysUtils.DecimalSeparator := '.';

           QtyS := StringReplace(WorkSheet.Cells[index,KolCol].Text, '''', '',[rfReplaceAll, rfIgnoreCase]);
           QtyS := StringReplace(WorkSheet.Cells[index,KolCol].Text, ' ', '',[rfReplaceAll, rfIgnoreCase]);
           QtyS := StringReplace(QtyS, ',', '.',[rfReplaceAll, rfIgnoreCase]);
           Qty := StrToFloat(QtyS);

           SysUtils.DecimalSeparator := OldSeparator;

           PrepareTovarNo := TMSQuery.Create(nil);
           PrepareTovarNo.Connection:= dmDataModule.DB;
           PrepareTovarNo.SQL.Clear;
           PrepareTovarNo.SQL.Text := 'declare @PostNo int '
                                     +' set @PostNo = :PostNo '
                                     +'select   PostNo '
                                     +'       , TovarNo '
                                     +'  	    , NameTovar '
                                     +' from TovarPost '
                                     +'  where PostNo = @PostNo '
                                     +'    and TovarNoPostText = :TovarNoPost ';
           PrepareTovarNo.ParamByName('PostNo').Value := PostNo;
           PrepareTovarNo.ParamByName('TovarNoPost').Value := WorkSheet.Cells[index,KodCol].Text;
           PrepareTovarNo.Open;

           if PrepareTovarNo.RecordCount = 0 then begin
                                                    bLoadAndCreateOrders.Enabled := False;
                                                    ActiveControl := Panel2;
                                                    raise Exception.Create(' По этому контрагентуагенту нет привязки соответствия товара! '+ #10#13 +
                                                                           'Товар : '+ WorkSheet.Cells[index,KodCol].Text +' '+ WorkSheet.Cells[index,NameCol].Text + #10#13 +
                                                                           'Заполните таблицу и повторите попытку.');
                                                  end;

           quInsInOrdersFromExcel.Close;
           quInsInOrdersFromExcel.ParamByName('TovarNoPostText').Value := WorkSheet.Cells[index,KodCol].Text;
           quInsInOrdersFromExcel.ParamByName('TovarNamePost').Value := WorkSheet.Cells[index,NameCol].Text;
           quInsInOrdersFromExcel.ParamByName('OrderDate').Value := StrToDate(WorkSheet.Cells[index,DateCol].Text);
           quInsInOrdersFromExcel.ParamByName('KolTov').Value := Qty; //StrToInt(WorkSheet.Cells[index,4].Text);
           quInsInOrdersFromExcel.ParamByName('AddressPost').Value := WorkSheet.Cells[index,AddressCol].Text;
           quInsInOrdersFromExcel.Execute;

         end;

      end;

     Excel.Quit;
     Excel := UnAssigned;
     Excel := Null;

     ShowMessage('Загрузка данных завершена'+ #10#13 +'Обработано ' + IntToStr(index-2)+' записей.');


// Формируем бланк заказа двигаясь по списку адресов в файле заказа

     quOrdersCNT.Close;
     quOrdersCNT.ParamByName('PostNo').Value := PostNo;
     quOrdersCNT.Open;
     quOrdersCNT.First;

     OrdersCNT := 0;

     while not quOrdersCNT.Eof do
      begin // quOrdersCNT.Eof

// Проверяем на наличие соответствия наименования адреса доставки

        AddressNo := quOrdersCNTAddressNo.Value;



        if quOrdersCNTAddressNo.IsNull then begin
                                              ShowMessage ('Для адреса '+quOrdersCNTAddressPost.AsString+ #10#13
                                                          +'Нет соответствия в базе'+ #10#13
                                                          +'Необходимо выбрать адрес из списка!');
                                              Dlg2 := TMlekoSelectAddressDlg.Create(Application);
                                              Dlg2.PostNo := PostNo;
                                              Dlg2.Query.Open;
                                              try
                                                if Dlg2.ShowModal = mrok Then
                                                 begin
                                                   AddressNo := Dlg2.Query.FieldByName('AddressNo').Value;

                                                   quInsInAddressCorrespondence.Close;
                                                   quInsInAddressCorrespondence.ParamByName('PostNo').Value := PostNo;
                                                   quInsInAddressCorrespondence.ParamByName('AddressNo').Value := AddressNo;
                                                   quInsInAddressCorrespondence.ParamByName('AddressPost').Value := quOrdersCNTAddressPost.Value;
                                                   quInsInAddressCorrespondence.Execute;

                                                 end;
                                              finally
                                                 Dlg2.Query.Close;
                                                 Dlg2.Free;
                                              end;
                                            end;

// Проверяем создавался ли заказ ранее

        isStop := false;

        CheckOrderForExcel := TMSQuery.Create(nil);
        CheckOrderForExcel.Connection:= dmDataModule.DB;
        CheckOrderForExcel.SQL.Clear;
        CheckOrderForExcel.SQL.Text := 'select * '
                                      +' from l_BlankForExcel '
                                      +'  where PostNo = :PostNo '
                                      +'    and AddressNo = :AddressNo '
                                      +'    and OrderDate = :OrderDate ';
        CheckOrderForExcel.ParamByName('PostNo').Value := PostNo;
        CheckOrderForExcel.ParamByName('AddressNo').Value := AddressNo;
        CheckOrderForExcel.ParamByName('OrderDate').Value := quOrdersCNTOrderDate.Value;
        CheckOrderForExcel.Open;
        if CheckOrderForExcel.RecordCount > 0 then begin
                                                     ShowMessage('Заказ '+quOrdersCNTOrderDate.AsString+'  '+quOrdersCNTAddressPost.AsString+' уже создавался!'+ #10#13 +
                                                                        'Повторное создание заказа запрещено!');
                                                     isStop := true;
                                                   end;
        Dlg := TMlekoBlankParamForm.Create(Application);

        ColNPrice := 0;

//:PostNo, :DateNakl, :SotrudNo, :VidNaklNo, :UserNo, :AddressNo, :OtdelNo, :ColnPrice, :KolDayPlan, :Buh, :ReasonId, :VidTovGroupId,
//:description, :contract_id, :ln_document_id, :OurFirmNo, :descriptionOrderVeb

        Dlg.spAddInputOrder.ParamByName('PostNo').Value := PostNo;
        Dlg.spAddInputOrder.ParamByName('DateNakl').Value := quOrdersCNTOrderDate.Value;
        Dlg.spAddInputOrder.ParamByName('SotrudNo').Value := 152;
        Dlg.spAddInputOrder.ParamByName('VidNaklNo').Value := VidNaklNo;
        Dlg.spAddInputOrder.ParamByName('UserNo').Value := data.UserNo;
        Dlg.spAddInputOrder.ParamByName('AddressNo').Value := AddressNo;
        Dlg.spAddInputOrder.ParamByName('OtdelNo').Value := 4;

        Dlg.spAddInputOrder.ParamByName('Buh').Value := Buh;
        if VidNaklNo = 3 then Dlg.spAddInputOrder.ParamByName('ReasonId').Value := 15
                         else Dlg.spAddInputOrder.ParamByName('ReasonId').Value := 14;

        Dlg.spAddInputOrder.ParamByName('Description').Value := 'Заказ из Excel файла';
        Dlg.quContract.Close;
        Dlg.quContract.ParamByName('p_PostNo').Value := PostNo;
        Dlg.quContract.Open;
        Dlg.spAddInputOrder.ParamByName('Contract_id').Value := Dlg.quContract.FieldByName('id').Value;
        Dlg.quContract.Close;
        Dlg.quOurFirm.Open;
        Dlg.spAddInputOrder.ParamByName('OurFirmNo').Value := Dlg.quOurFirm.FieldByName('PostNo').AsInteger;
        Dlg.quOurFirm.Close;

        Dlg.spAddInputOrder.ParamByName('descriptionOrderVeb').Clear;
        if VidNaklNo = 3 then Dlg.spModifyLinkBlankReturn.ParamByName('TypeReturnNo').Value := TypeReturnNo;

        quPostArtGroup.Close;
        quPostArtGroup.ParamByName('PostNo').Value := PostNo;
        quPostArtGroup.ParamByName('PostNo1').Value := PostNo;
        quPostArtGroup.ParamByName('PostNom').Value := PostNo;
        quPostArtGroup.ParamByName('Buh').Value := Buh;
        quPostArtGroup.ParamByName('OrderDate').Value := quOrdersCNTOrderDate.Value;
        quPostArtGroup.ParamByName('OrderDate1').Value := quOrdersCNTOrderDate.Value;
        quPostArtGroup.ParamByName('AddressNo').Value := AddressNo;
        quPostArtGroup.ParamByName('AddressNo1').Value := AddressNo;
        quPostArtGroup.Open;
        quPostArtGroup.First;

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
                                 +' from (select tp.TovarNo, tp.TovarNoPost, ofe.OrderDate, tp.PostNo, AddressNo, KolTov '
                                 +'        from OrdersFromExcel ofe left join '
                                 +'             AddressCorrespondence ac on rtrim(ltrim(ac.AddressPost)) = rtrim(ltrim(ofe.AddressPost)) left join '
//                               +'             TovarPost tp on tp.TovarNoPost = ofe.TovarNoPost and tp.PostNo = ac.PostNo) a '
                                 +'             TovarPost tp on (convert(varchar(20),tp.TovarNoPost) = convert(varchar(20),ofe.TovarNoPostText) '
                                 +'			                         or convert(varchar(20),tp.TovarNoPostText) = convert(varchar(20),ofe.TovarNoPostText) '
                                 +'                 					   or convert(varchar(20),tp.TovarNoPostSecondText) = convert(varchar(20),ofe.TovarNoPostText) '
                                 +'							                 or convert(varchar(20),tp.TovarNoPostSecond) = convert(varchar(20),ofe.TovarNoPostText)) and tp.PostNo = ac.PostNo) a '
                                 +'  where a.PostNo = :PostNo '
                                 +'    and a.AddressNo = :AddressNo '
                                 +'    and convert(smallint,a.TovarNo) not in (select TovarNo '
                                 +'                                             from e_blanks '
                                 +'                                              where Document_id in (select idBlank '
                                 +'                                                                     from l_BlankForExcel '
                                 +'                                                                      where ((OrderDate = :OrderDate)and(AddressNo = :AddressNo1)and(PostNo = :PostNo1)))) '
                                 +'    and convert(bigint,a.TovarNo) in (select lag.ARTICLE_ID '
                                 +'                                       from L_SET_ARTICLE_GROUP lsag left join '
                                 +'                                            L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
                                 +'                                        where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID) '
                                 +'                                          and lag.ARTICLE_GROUP_ID = :ARTICLE_GROUP_ID) '
                                 +'   and KolTov > 0 ';
           quCheckOrder.Prepare;
           quCheckOrder.ParamByName('SET_ARTICLE_GROUP_ID').Value := SArticleGroup;
           quCheckOrder.ParamByName('ARTICLE_GROUP_ID').Value := quPostArtGroup.FieldByName('ARTICLE_GROUP_ID').Value;
           quCheckOrder.ParamByName('PostNo').Value := PostNo;
           quCheckOrder.ParamByName('PostNo1').Value := PostNo;
           quCheckOrder.ParamByName('AddressNo').Value := AddressNo;
           quCheckOrder.ParamByName('AddressNo1').Value := AddressNo;
           quCheckOrder.ParamByName('OrderDate').Value := quOrdersCNTOrderDate.Value;
           quCheckOrder.Open;
           if ((quCheckOrder.RecordCount > 0) and (isStop = false)) Then isRun := true else isRun := false;
           quCheckOrder.Close;

           Dlg.quPostBan.Close;
           Dlg.quPostBan.Params.ParamByName('p_PostNo').Value := PostNo;
           Dlg.quPostBan.Open;
           Is_PostBan := false;

           if (Dlg.quPostBanPostBan.Value = 1) and (VidNaklNo = 3) then
            begin
              DescriptionBan := 'Для этой фирмы запрещено делать возврат товара' +#13#10+ Dlg.quPostBanDescription.Value;
              raise Exception.Create(DescriptionBan);
              Is_PostBan := true;
            end;

           if CheckBlank(PostNo, 14, quOrdersCNTOrderDate.Value, 4, SArticleGroupDouble, ErrMsg) >= 10 then
            begin
             //Не Успешно
              raise Exception.Create(ErrMsg);
            end;

           Dlg.quPostBan.Close;

           Dlg.spAddInputOrder.ParamByName('VidTovGroupId').Value := SArticleGroupDouble ;
           Dlg.spAddInputOrder.ParamByName('KolDayPlan').Value := quPostArtGroupDAY_DELAY.Value;

           quColnPriceForOrder.Close;
           quColnPriceForOrder.ParamByName('PostNo').Value := PostNo;
           quColnPriceForOrder.ParamByName('PostNo1').Value := PostNo;
           quColnPriceForOrder.ParamByName('PostNom').Value := PostNo;
           quColnPriceForOrder.ParamByName('Buh').Value := Buh;
           quColnPriceForOrder.ParamByName('OrderDate').Value := quOrdersCNTOrderDate.Value;
           quColnPriceForOrder.ParamByName('OrderDate1').Value := quOrdersCNTOrderDate.Value;
           quColnPriceForOrder.ParamByName('AddressNo').Value := AddressNo;
           quColnPriceForOrder.ParamByName('AddressNo1').Value := AddressNo;
           quColnPriceForOrder.ParamByName('ARTICLE_GROUP_ID').Value := ArticleGroupDouble;
           quColnPriceForOrder.Open;
           quColnPriceForOrder.First;

//         Residue, Need

           while not quColnPriceForOrder.Eof do
            begin // quColnPriceForOrder.Eof
              if quColnPriceForOrder.FieldByName('COLNPRICE').Value > 0
               then begin
                      Dlg.spAddInputOrder.ParamByName('ColnPrice').Value := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                      if (ColNPrice <> quColnPriceForOrder.FieldByName('COLNPRICE').Value)
                      or (SArticleGroupDoublePred <> SArticleGroupDouble)
                      then begin
                             if isStop = false then begin
                                                      ColNPrice := quColnPriceForOrder.FieldByName('COLNPRICE').Value;
                                                      Dlg.spAddInputOrder.ExecProc;
                                                      documentID := Dlg.spAddInputOrder.ParamByName('ln_document_id').Value;
                                                      LdocumentID := documentID;
                                                    end;

                           end;
                      if documentID = 0 then begin
                                               documentID := LdocumentID;
                                             end;
                      quSpecBlank.Close;
                      quSpecBlank.ParamByName('PostNo').Value := PostNo;
                      quSpecBlank.ParamByName('AddressNo').Value := AddressNo;
                      quSpecBlank.ParamByName('OrderDate').Value := quOrdersCNTOrderDate.Value;
                      quSpecBlank.Open;
                      quSpecBlank.First;

                      CheckOrderForExcel := TMSQuery.Create(nil);
                      CheckOrderForExcel.Connection:= dmDataModule.DB;
                      CheckOrderForExcel.SQL.Clear;
                      CheckOrderForExcel.SQL.Text := 'select * from e_blanks where Document_id = :Document_id';
                      CheckOrderForExcel.ParamByName('Document_id').Value := documentID;
                      CheckOrderForExcel.Open;

                      Residue:= 0;
                      Need:= 0;



                      if (quSpecBlank.RecordCount = 0) and (CheckOrderForExcel.RecordCount = 0) then begin
                                                                                                       DelBlankHead (documentId);
                                                                                                       quSpecBlank.Close;
                                                                                                     end;
                      CheckOrderForExcel.Close;

                      while not quSpecBlank.Eof do
                       begin // quSpecBlank.Eof
                         if isStop = false then AddTovarInBlanks(documentID,quSpecBlank.FieldByName('TovarNo').Value,data.UserNo,ColNPrice,quSpecBlank.FieldByName('KolTov').Value,quSpecBlank.FieldByName('KolTov').Value,0, Residue, Need);
                         quSpecBlank.Next;
                       end; // quSpecBlank.Eof

                      CheckOrderForExcel := TMSQuery.Create(nil);
                      CheckOrderForExcel.Connection:= dmDataModule.DB;
                      CheckOrderForExcel.SQL.Clear;
                      CheckOrderForExcel.SQL.Text := 'select * '
                                                    +' from l_BlankForExcel '
                                                    +'  where PostNo = :PostNo '
                                                    +'    and AddressNo = :AddressNo '
                                                    +'    and OrderDate = :OrderDate '
                                                    +'    and IdBlank = :IdBlank ';
                      CheckOrderForExcel.ParamByName('PostNo').Value := PostNo;
                      CheckOrderForExcel.ParamByName('AddressNo').Value := AddressNo;
                      CheckOrderForExcel.ParamByName('OrderDate').Value := quOrdersCNTOrderDate.Value;
                      CheckOrderForExcel.ParamByName('IdBlank').Value := documentID;
                      CheckOrderForExcel.Open;
                      if CheckOrderForExcel.RecordCount > 0 then isRun := false;

                      if (isRun = true) and (quSpecBlank.RecordCount > 0) and (isStop = false) then begin
                                                                                                      InsInBlankForExcel(quOrdersCNTOrderDate.Value,PostNo,AddressNo,DocumentId);
                                                                                                      if VidNaklNo = 3 then begin
                                                                                                                              Dlg.spModifyLinkBlankReturn.ParamByName('Document_id').Value := DocumentId;
                                                                                                                              Dlg.spModifyLinkBlankReturn.Execute;
                                                                                                                            end;
                                                                                                      if cbIsVisebleStringOrder.Checked then Showmessage ('Создан заказ document_id = '+ IntToStr(documentID));
                                                                                                      OrdersCNT := OrdersCNT + 1;
                                                                                                    end
                                                                                               else begin
                                                                                                      if isStop = false then if documentID > 0 then if cbIsVisebleStringOrder.Checked then Showmessage ('Заказ document_id = '+ IntToStr(documentID)+ ' дополнен');
                                                                                                    end;

                    end;
              quColnPriceForOrder.Next;
            end; // quColnPriceForOrder.Eof

           SArticleGroupDoublePred := SArticleGroupDouble;
           quPostArtGroup.Next;
         end; //quPostArtGroup.Eof

        Dlg.Free;
        quOrdersCNT.Next;
      end; // quOrdersCNT.Eof
    ShowMessage('Создано '+IntToStr(OrdersCNT)+' заказов');

// Окончательные проверки

   quOrdersCNT.Close;
   quOrdersCNT.Open;
   quOrdersCNT.First;

   while not quOrdersCNT.Eof do
    begin // quOrdersCNT.Eof
      Dlg := TMlekoBlankParamForm.Create(Application);

      quSummaBlanksHead := TMSQuery.Create(nil);
      quSummaBlanksHead.Connection := dmDataModule.DB;
      quSummaBlanksHead.SQL.Clear;
      quSummaBlanksHead.SQL.Text := 'select sum(summa) as SummaBlanks '
                                   +' from e_blank_head '
                                   +'  where ID in (select idBlank '
                                   +'                from l_BlankForExcel '
                                   +'         				 where PostNo = :PostNo '
                                   +'                   and AddressNo = :AddressNo '
                                   +'                   and OrderDate = :OrderDate) ';
      quSummaBlanksHead.ParamByName('PostNo').Value := PostNo;
      quSummaBlanksHead.ParamByName('AddressNo').Value := AddressNo;
      quSummaBlanksHead.ParamByName('OrderDate').Value := quOrdersCNTOrderDate.Value;
      quSummaBlanksHead.Open;

      quListBlanksDocId := TMSQuery.Create(nil);
      quListBlanksDocId.Connection := dmDataModule.DB;
      quListBlanksDocId.SQL.Clear;
      quListBlanksDocId.SQL.Text := 'select id as Id '
                                   +' from e_blank_head '
                                   +'  where ID in (select idBlank '
                                   +'                from l_BlankForExcel '
                                   +'         				 where PostNo = :PostNo '
                                   +'                   and AddressNo = :AddressNo '
                                   +'                   and OrderDate = :OrderDate) ';
      quListBlanksDocId.ParamByName('PostNo').Value := PostNo;
      quListBlanksDocId.ParamByName('AddressNo').Value := AddressNo;
      quListBlanksDocId.ParamByName('OrderDate').Value := quOrdersCNTOrderDate.Value;
      quListBlanksDocId.Open;
      quListBlanksDocId.First;

      while not quListBlanksDocId.Eof do
       begin // quListBlanksDocId.Eof
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
            Dlg1 := TMlekoBlankListForm.Create(Application);
            Dlg1.spDelInputOrder.Close;
            Dlg1.spDelInputOrder.Params.ParamByName('document_id').Value := quListBlanksDocId.FieldByName('Id').AsInteger;
            Dlg1.spDelInputOrder.ExecProc;
            Dlg1.Free;
          end;
         quListBlanksDocId.Next;
       end; // quListBlanksDocId.Eof


      quDocum.Close;
      quSumDocum.Close;
      quSummaBlanksHead.Close;
      quListBlanksDocId.Close;
      Dlg.Free;
      quOrdersCNT.Next;
    end; // quOrdersCNT.Eof
    ShowMessage('Проверки завершены');
    CreateBlankWithExelForm.Close;

   end;
end;

function TCreateBlankWithExelForm.CheckBlank(pPostno, pReason_id: Integer; pDateNakl: TDate; pOtdelNo: Integer; SET_ARTICLE_GROUP_ID: Int64; var err_message: string): Integer;
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

procedure TCreateBlankWithExelForm.DelBlankHead (DocumentId : integer);
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

procedure TCreateBlankWithExelForm.AddTovarInBlanks (DocumentId, TovarNo, UserNo, ColNPrice : integer; KolBeg, KolOrd, Boss_Price, Residue, Need : double);
var
  quPrice : TMSQuery;
  ErrMsg : String;
begin
  spEditBlankPosition.ParamByName('document_id').Value := DocumentID;
  spEditBlankPosition.ParamByName('tovarNo').Value := TovarNo;
  spEditBlankPosition.ParamByName('UserNo').Value := UserNo;
  spEditBlankPosition.ParamByName('KolBeg').Value := KolBeg;
  spEditBlankPosition.ParamByName('KolOrd').Value := KolOrd;
  spEditBlankPosition.ParamByName('Residue').Value := Residue;    // Residue, Need
  spEditBlankPosition.ParamByName('Need').Value := Need;

  if ColNPrice > 0 then begin
                          quPrice :=TMSQuery.Create(nil);
                          quPrice.Connection:=dmDataModule.DB;
                          quPrice.SQL.Clear;
                          quPrice.SQL.Text:= 'select isnull(case when :ColnPrice = 1 then Isnull(convert(float,Price),0) '
                                            +'                   when :ColnPrice = 2 then Isnull(convert(float,Price1),0) '
                                            +'                   when :ColnPrice = 3 then Isnull(convert(float,Price2),0) '
                                            +'                   when :ColnPrice = 4 then Isnull(convert(float,Price3),0) '
                                            +'                   when :ColnPrice = 5 then Isnull(convert(float,Price4),0) '
                                            +'                   when :ColnPrice = 6 then Isnull(convert(float,Price5),0) '
                                            +'                   when :ColnPrice = 7 then Isnull(convert(float,Price6),0) '
                                            +'                   when :ColnPrice = 8 then Isnull(convert(float,Price7),0) '
                                            +'                   when :ColnPrice = 10 then Isnull(convert(float,Price8),0) '
                                            +'                   when :ColnPrice = 11 then Isnull(convert(float,Price9),0) '
                                            +'                   when :ColnPrice = 12 then Isnull(convert(float,Price10),0) '
                                            +'                   when :ColnPrice = 13 then Isnull(convert(float,Price13),0) '
                                            +'                   when :ColnPrice = 14 then Isnull(convert(float,Price14),0) '
                                            +'                   when :ColnPrice = 15 then Isnull(convert(float,Price15),0) '
                                            +'                   when :ColnPrice = 9 then Isnull(convert(float,AvgPriceIn),0) '
                                            +'                   when :ColnPrice = 17 then Isnull(convert(float,pfv.PriceVeb), 0) '
                                            +'                   when :ColnPrice = 18 then Isnull(convert(float,pfv.PriceInInst), 0) '
                                            +'              end,0) as Price '
                                            +' from Ostatok o '
                                            +'     ,PriceForVeb pfv '
                                            +'  where o.TovarNo = :TovarNo '
                                            +'    and o.TovarNo = pfv.TovarNo';
                          quPrice.Prepare;
                          quPrice.ParamByName('TovarNo').Value := TovarNo;
                          quPrice.ParamByName('ColnPrice').Value := ColNPrice;
                          quPrice.Open;
                          if ((quPrice.FieldByName('Price').Value = 0) or (quPrice.FieldByName('Price').Value = Null)) then begin
                                                                                                                              ErrMsg := 'Не расцененный товар!' +#13#10+
                                                                                                                                        'Создание заказа остановлено! Сообщите программисту!' +#13#10+
                                                                                                                                        'Код товара ' + IntToStr(TovarNo) +#13#10+
                                                                                                                                        'Заказ в файле '+ quOrdersCNTOrderDate.AsString +' '+quOrdersCNTAddressPost.AsString;
                                                                                                                              raise Exception.Create(ErrMsg);
                                                                                                                            end;
                          spEditBlankPosition.ParamByName('Boss_Price').Value := quPrice.FieldByName('Price').Value;
                          quPrice.Close;
                        end
                   else spEditBlankPosition.ParamByName('Boss_Price').Value := Boss_Price;
  spEditBlankPosition.ExecProc;
end;

procedure TCreateBlankWithExelForm.InsInBlankForExcel(OrderDate : TDateTime; PostNo, AddressNo, DocumentId : integer);
var
  quInsInl_BlankForExcel : TMSQuery;
begin
  quInsInl_BlankForExcel :=TMSQuery.Create(nil);
  quInsInl_BlankForExcel.Connection:=dmDataModule.DB;
  quInsInl_BlankForExcel.SQL.Clear;
  quInsInl_BlankForExcel.SQL.Text:='insert into l_BlankForExcel (PostNo,AddressNo,OrderDate,IdBlank) '
                                  +'     values (:PostNo,:AddressNo,:OrderDate,:IdBlank)';
  quInsInl_BlankForExcel.ParamByName('PostNo').Value := PostNo;
  quInsInl_BlankForExcel.ParamByName('AddressNo').Value := AddressNo;
  quInsInl_BlankForExcel.ParamByName('OrderDate').Value := OrderDate;
  quInsInl_BlankForExcel.ParamByName('idBlank').Value := DocumentID;
  quInsInl_BlankForExcel.Execute;
  quInsInl_BlankForExcel.Close;
end;

end.
