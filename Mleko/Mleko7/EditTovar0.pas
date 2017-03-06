unit EditTovar0;

interface

uses
  SysUtils, Windows, Messages, Variants, Classes, Graphics, Controls, SdacVcl,
  StdCtrls, Forms, MlekoForm, DBCtrls, DB, Mask, ExtCtrls, Buttons, Dialogs,
  ActnList, MLKPropDb, cxPC, cxControls, MlekoDbDsMSSQL, MemDS, DBAccess, ComCtrls,
  MSAccess, data, citCtrls, citmask, citDBComboEdit, citDBCalendar, ToolWin,
  citDBCtrls,MlekoSelectFIrm, DBCtrlsEh, GridsEh, DBGridEh, DBLookupEh;

type
  TfmEditTovar = class(TMLKPropDbDlg)
    Label2: TLabel;
    EditNameTovar: TDBEdit;
    Label7: TLabel;
    deNameShort: TDBEdit;
    Label4: TLabel;
    lcNameCompany: TDBLookupComboBox;
    Label9: TLabel;
    lcTipTovara: TDBLookupComboBox;
    lcVidTov: TDBLookupComboBox;
    Label1: TLabel;
    lcOtdel: TDBLookupComboBox;
    Label11: TLabel;
    Label12: TLabel;
    lcTara: TDBLookupComboBox;
    Label8: TLabel;
    deWeight: TDBEdit;
    Label10: TLabel;
    deCodReport: TDBEdit;
    deSrokReal: TDBEdit;
    Label6: TLabel;
    Label3: TLabel;
    EditEdIzm: TDBEdit;
    EditKolPerPak: TDBEdit;
    Label5: TLabel;
    cbExport1C: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    BarCode: TDBEdit;
    Label13: TLabel;
    DBCheckBox3: TDBCheckBox;
    dsSocial_Tovar: TDataSource;
    quSocialTovar: TMSQuery;
    Social_Tovar: TDBCheckBox;
    quSocialTovarID: TIntegerField;
    quSocialTovarTovarNo: TSmallintField;
    quSocialTovarSocial: TBooleanField;
    dsTovarPost: TDataSource;
    quTovarPost: TMSQuery;
    Label15: TLabel;
    TovarNoPost: TDBEdit;
    dsPostForTovar: TDataSource;
    quPostForTovar: TMSQuery;
    quPostForTovarPostNo: TSmallintField;
    quPostForTovarNameLong: TStringField;
    quPostForTovarName: TStringField;
    cbPostForTovar: TDBLookupComboBox;
    Label14: TLabel;
    Label16: TLabel;
    quTovarPostid: TIntegerField;
    quTovarPostPostNo: TSmallintField;
    quTovarPostNameTovarPost: TStringField;
    quTovarPostNameTovar: TStringField;
    quTovarPostNameTovarShort: TStringField;
    quTovarPostBarCode: TLargeintField;
    NameTovarPost: TDBEdit;
    quTovarWIthNoNDS: TMSQuery;
    dsTovarWIthNoNDS: TDataSource;
    TovarWIthNoNDS: TDBCheckBox;
    quTovarWIthNoNDSID: TIntegerField;
    quTovarWIthNoNDSTovarNo: TSmallintField;
    quTovarWIthNoNDSWithNoNDS: TBooleanField;
    dePriceInInst: TDBEdit;
    dsPrice: TDataSource;
    quPrice: TMSQuery;
    quPriceTovarNo: TSmallintField;
    quPricePriceVeb: TFloatField;
    quPricePriceInInst: TFloatField;
    Label17: TLabel;
    quTovarExpirationDate: TMSQuery;
    dsTovarExpirationDate: TDataSource;
    deEhExpirationDate: TDBEditEh;
    Label18: TLabel;
    quTovarExpirationDateTovarNo: TSmallintField;
    quTovarExpirationDateExpirationDate: TIntegerField;
    DBGridEh1: TDBGridEh;
    quListGoodStandarts: TMSQuery;
    dsListGoodStandarts: TMSDataSource;
    quListGoodStandartsStandartName: TStringField;
    quListGoodStandartsis_chesk: TBooleanField;
    quListGoodStandartsStandartNo: TIntegerField;
    quListGoodStandartsTovarNo: TIntegerField;
    sp_SetGoodStandart: TMSStoredProc;
    bSetGoodStandarts: TButton;
    cxConformity: TcxTabSheet;
    dsTovarForReturn: TMSDataSource;
    quTovarForReturn: TMSQuery;
    DBGridEhTovarForReturn: TDBGridEh;
    quTovarForReturnTypeReturnName: TStringField;
    quTovarForReturnNameTovar: TStringField;
    quTovarForReturnTypeReturnNo: TIntegerField;
    quTovarForReturnTovarNo: TIntegerField;
    quTovarForReturnNameTovarReturn: TStringField;
    Button1: TButton;
    quTovarForReturnTovarNoReturn: TIntegerField;
    Button2: TButton;
    quDelLinkTovarForReturn: TMSQuery;
    Our_Tovar: TDBCheckBox;
    is_Service: TDBCheckBox;
    dsOurTovar: TMSDataSource;
    dsService: TMSDataSource;
    quOurTovar: TMSQuery;
    quService: TMSQuery;
    quServiceID: TIntegerField;
    quServiceTovarNo: TSmallintField;
    quServiceIs_Service: TBooleanField;
    quOurTovarID: TIntegerField;
    quOurTovarTovarNo: TSmallintField;
    quOurTovarNotOur: TBooleanField;
    quTovarNds: TMSQuery;
    gbNDS: TGroupBox;
    IsTovarNDS: TDBCheckBox;
    dsTovarNDS: TMSDataSource;
    deGroupNDS1: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    quTovarNdsId: TIntegerField;
    quTovarNdsTovarNo: TSmallintField;
    quTovarNdsStavNDS: TIntegerField;
    quTovarNdsGroupNDS: TStringField;
    quTovarNdsIsStavNDS: TBooleanField;
    DBNumberEditStavNDS: TDBNumberEditEh;
    Label21: TLabel;
    rbTovarWIthNoNDS: TRadioButton;
    rbIsTovarNDS: TRadioButton;
    Label22: TLabel;
    quTovarNOPP: TMSQuery;
    dsTovarNoPP: TMSDataSource;
    DBEditEhNo_pp: TDBEditEh;
    quTovarNOPPTovarNo: TSmallintField;
    quTovarNOPPNo_pp: TIntegerField;
    deNamePost: TDBEdit;
    Label23: TLabel;
    quTovarSupplier: TMSQuery;
    dsTovarSupplier: TMSDataSource;
    quTovarSupplierId: TLargeintField;
    quTovarSupplierTovarNo: TSmallintField;
    quTovarSupplierPostNo: TSmallintField;
    quTovarSupplierPostName: TStringField;
    Label24: TLabel;
    deDeliveryGoodsName: TDBEdit;
    quTovarFromDeliveryOfGoods: TMSQuery;
    dsTovarFromDeliveryOfGoods: TMSDataSource;
    quTovarFromDeliveryOfGoodsTovarNo: TSmallintField;
    quTovarFromDeliveryOfGoodsDeliveryTovarNo: TIntegerField;
    quTovarFromDeliveryOfGoodsDeliveryGoodsName: TStringField;
    leSelectFirm: TLabeledEdit;
    DBCheckBoxEh1: TDBCheckBoxEh;
    deGroupNDS: TDBEditEh;
    quTovarPostTovarNoPostText: TStringField;
    TovarNoPostText: TDBEdit;
    Label25: TLabel;
    TovarNoPostSecond: TDBEdit;
    Label26: TLabel;
    quTovarPostTovarNoPostSecondText: TStringField;
    Label27: TLabel;
    TovarNoPostSecondText: TDBEdit;
    Label28: TLabel;
    quPricePriceOld: TFloatField;
    deMinCarryover: TDBEdit;
    Label29: TLabel;
    DBUKT_ZED: TDBEdit;
    dsCurrency: TMSDataSource;
    quCurrency: TMSQuery;
    quCurrencyl_code: TStringField;
    quCurrencyName: TStringField;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label30: TLabel;
    quCurrencyTovar: TMSQuery;
    dsCurrencyTovar: TMSDataSource;
    quCurrencyTovarTovarNo: TIntegerField;
    quCurrencyTovarCurrency: TStringField;
    quTovarPostTovarNo: TLargeintField;
    quTovarPostTovarNoPost: TLargeintField;
    quTovarPostTovarNoPostSecond: TLargeintField;

    procedure ActionOKExecute(Sender: TObject);
    procedure quSocialTovarBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure ActionApplyExecute(Sender: TObject);
    procedure quTovarPostBeforePost(DataSet: TDataSet);
//    procedure EdTovarPostSelectOk(Sender: TObject);
    procedure cbPostForTovarExit(Sender: TObject);
    procedure quTovarWIthNoNDSBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure quPriceBeforePost(DataSet: TDataSet);
    procedure quTovarExpirationDateBeforePost(DataSet: TDataSet);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure DBGridEh1Columns1UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure bSetGoodStandartsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure quOurTovarBeforePost(DataSet: TDataSet);
    procedure quServiceBeforePost(DataSet: TDataSet);
    procedure quTovarNdsBeforePost(DataSet: TDataSet);
    procedure TovarWIthNoNDSClick(Sender: TObject);
    procedure IsTovarNDSClick(Sender: TObject);
    procedure TovarWIthNoNDSExit(Sender: TObject);
    procedure IsTovarNDSExit(Sender: TObject);
    procedure rbIsTovarNDSClick(Sender: TObject);
    procedure rbTovarWIthNoNDSClick(Sender: TObject);
    procedure deGroupNDS1DblClick(Sender: TObject);
    procedure quTovarNOPPBeforePost(DataSet: TDataSet);
    procedure deNamePostDblClick(Sender: TObject);
    procedure quTovarSupplierBeforePost(DataSet: TDataSet);
    procedure deNamePostChange(Sender: TObject);
    procedure deDeliveryGoodsNameDblClick(Sender: TObject);
    procedure quTovarFromDeliveryOfGoodsBeforePost(DataSet: TDataSet);
    procedure leSelectFirmExit(Sender: TObject);
    procedure leSelectFirmDblClick(Sender: TObject);


  private

      FPostNo: Int64;
      FTovarNo: Int64;
      FDeliveryTovarNo: Int64;
      procedure SetPostNo(const Value: Int64);
      procedure SetTovarNo(const Value: Int64);
      procedure SetDeliveryTovarNo(const Value: Int64);
    { private declarations }
  protected
    function CheckBeforeApply(var ErrMsg: string): Boolean; override;
  public
    property PostNo: Int64 read FPostNo write SetPostNo;
    property TovarNo: Int64 read FTovarNo write SetTovarNo;
    property DeliveryTovarNo: Int64 read FDeliveryTovarNo write SetDeliveryTovarNo;
  end;

implementation

uses MlekoSelectFirmForBlank, ListGoodStandart, EditLinkTovarFromReturn,
     MlekoSelectMarijaGroupTax, DeliveryOfGoods0;


{$R *.DFM}


procedure TfmEditTovar.SetPostNo(const Value: Int64);
begin
  if FPostNo <> Value then
  FPostNo := Value;
end;

procedure TfmEditTovar.SetTovarNo(const Value: Int64);
begin
  if FTovarNo <> Value then
  FTovarNo := Value;
end;

procedure TfmEditTovar.SetDeliveryTovarNo(const Value: Int64);
begin
  if FDeliveryTovarNo <> Value then
  FDeliveryTovarNo := Value;
end;

function TfmEditTovar.CheckBeforeApply(var ErrMsg: string): Boolean;
var
  KolTov : Integer;
begin
  result:=inherited CheckBeforeApply(ErrMsg);

  if Length(EditNameTovar.Text) = 0 then
    ErrMsg := ErrMsg + 'Не заполнено поле "Наименование".';

  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select cast(count(NameTovar) as int) as KolTov  from Tovar where NameTovar = :NameTovar');
  dmDataModule.quWork.ParamByName('NameTovar').AsString := EditNameTovar.Text;
  dmDataModule.quWork.Open;
  KolTov := dmDataModule.quWork.FieldByName('KolTov').AsInteger;
  dmDataModule.quWork.Close;


  if (KolTov > 0) and (PropDataSet.State = dsInsert) then
    ErrMsg := ErrMsg + 'Товар с таким наименованием уже существует.' +#13#10+ 'Обратитесь к начальнику отдела.' +#13#10+ 'Светлана Чалая.';

  if (Length(deNameShort.Text) = 0) then
    ErrMsg := ErrMsg + 'Не заполнено поле "Наименование для кассы".';

  if (Length(lcNameCompany.Text) = 0) then
    ErrMsg := ErrMsg + 'Не заполнено поле "Производитель".';

  if (Length(lcVidTov.Text) = 0) then
    ErrMsg := ErrMsg + 'Не заполнено поле "Вид товара".';

  if (Length(lcTipTovara.Text) = 0) then
    ErrMsg := ErrMsg + 'Не заполнено поле "Тип товара".';

  if (Length(lcOtdel.Text) = 0) then
    ErrMsg := ErrMsg + 'Не заполнено поле "Отдел".';

  if (Length(EditKolPerPak.Text) = 0) then
    ErrMsg := ErrMsg + 'Не заполнено поле "В упаковке".';

  if (Length(EditEdIzm.Text) = 0) then
    ErrMsg := ErrMsg + 'Не заполнено поле "Ед.изм.".';
end;

procedure TfmEditTovar.ActionOKExecute(Sender: TObject);
begin
  inherited;
  if quPrice.State in [dsInsert, dsEdit] then quPrice.Post;
  if quSocialTovar.State in [dsInsert, dsEdit] then quSocialTovar.Post;
  if quTovarPost.State in [dsInsert, dsEdit] then quTovarPost.Post;
  if quTovarWIthNoNDS.State in [dsInsert, dsEdit] then quTovarWIthNoNDS.Post;
  if quTovarNDS.State in [dsInsert, dsEdit] then quTovarNDS.Post;
  if quTovarExpirationDate.State in [dsInsert, dsEdit] then quTovarExpirationDate.Post;
  if quOurTovar.State in [dsInsert, dsEdit] then quOurTovar.Post;
  if quService.State in [dsInsert, dsEdit] then quService.Post;
  if quTovarNOPP.State in [dsInsert, dsEdit] then quTovarNOPP.Post;
  if quTovarSupplier.State in [dsInsert, dsEdit]  then quTovarSupplier.Post;
  if quTovarFromDeliveryOfGoods.State in [dsInsert, dsEdit]  then quTovarFromDeliveryOfGoods.Post;
  if quCurrencyTovar.State in [dsInsert, dsEdit]  then quCurrencyTovar.Post;  
  end;

procedure TfmEditTovar.quSocialTovarBeforePost(DataSet: TDataSet);
var
  TovarNom : Integer;
begin
  inherited;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select * from Tovar where NameTovar = :NameTovar');
  dmDataModule.quWork.ParamByName('NameTovar').AsString := EditNameTovar.Text;
  dmDataModule.quWork.Open;
  TovarNom := dmDataModule.quWork.FieldByName('TovarNo').AsInteger;
  dmDataModule.quWork.Close;

  if quSocialTovar.State = dsInsert then
  begin

    quSocialTovarTovarNo.AsInteger := TovarNom;
    quSocialTovarSocial.AsBoolean := Social_Tovar.Checked;

  end;

  if quSocialTovar.State = dsEdit then
   begin



    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select id from Social_Tovar where TovarNo = :TovarNo');
    dmDataModule.quWork.ParamByName('TovarNo').AsInteger := TovarNom;
    dmDataModule.quWork.Open;

    quSocialTovarID.AsInteger := dmDataModule.quWork.FieldByName('ID').AsInteger;
    quSocialTovarTovarNo.AsInteger := TovarNom;
    quSocialTovarSocial.AsBoolean := Social_Tovar.Checked;


   end;
end;

procedure TfmEditTovar.quTovarPostBeforePost(DataSet: TDataSet);
var
  TovarNom : Integer;
begin
  inherited; {POST_FOR_BLANK}
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select * from Tovar where NameTovar = :NameTovar');
  dmDataModule.quWork.ParamByName('NameTovar').AsString := EditNameTovar.Text;
  dmDataModule.quWork.Open;
  TovarNom := dmDataModule.quWork.FieldByName('TovarNo').AsInteger;
  dmDataModule.quWork.Close;
{
  quTovarPostPostNo.AsInteger := StrToInt64(EdTovarPost.KeyFieldValue);
  quTovarPostTovarNo.AsInteger := TovarNom;

  quTovarPostNameTovar.AsString := EditNameTovar.Text;
  quTovarPostNameTovarShort.AsString := deNameShort.Text;
  quTovarPostBarCode.AsInteger := BarCode.Field.AsInteger;
}

  quTovarPostPostNo.AsInteger := PostNo; //StrToInt64(cbPostForTovar.KeyValue);
  quTovarPostTovarNo.AsInteger := TovarNom;

  quTovarPostNameTovar.AsString := EditNameTovar.Text;
  quTovarPostNameTovarShort.AsString := deNameShort.Text;
  if BarCode.Field.AsString = '' then quTovarPostBarCode.AsLargeInt := 0
                                 else quTovarPostBarCode.AsLargeInt := strtoint64(BarCode.Field.AsString);

  quTovarPostNameTovarPost.AsString := NameTovarPost.Text;

end;




procedure TfmEditTovar.FormShow(Sender: TObject);

begin
  inherited;



//  tsExtendedProp.Visible := true;
  tsExtendedProp.Enabled := true;
  tsExtendedProp.TabVisible := true;

  PageControl.ActivePage := tsMainProp;
  tsMainProp.Visible := true;
  tsMainProp.TabVisible := true;


  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select TovarNo as Tovar from Tovar where NameTovar = :NameTovar');
  dmDataModule.quWork.ParamByName('NameTovar').AsString := EditNameTovar.Text;
  dmDataModule.quWork.Open;

  TovarNo := dmDataModule.quWork.FieldByName('Tovar').AsInteger;

  quTovarFromDeliveryOfGoods.Close;
  quTovarFromDeliveryOfGoods.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarFromDeliveryOfGoods.Open;

  quTovarSupplier.Close;
  quTovarSupplier.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarSupplier.Open;

  quListGoodStandarts.Close;
  quListGoodStandarts.ParamByName('p_TovarNo').AsInteger := TovarNo;
  quListGoodStandarts.ParamByName('p_TovarNo1').AsInteger := TovarNo;
  quListGoodStandarts.Open;

  quSocialTovar.Close;
  quSocialTovar.ParamByName('TovarNo').AsInteger := TovarNo;
  quSocialTovar.Open;

  quTovarForReturn.Close;
  quTovarForReturn.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarForReturn.Open;

  quTovarNOPP.Close;
  quTovarNOPP.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarNOPP.Open;

  cbPostForTovar.KeyValue := 0;

  quTovarPost.Close;
  quTovarPost.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarPost.ParamByName('PostNo').Value := cbPostForTovar.KeyValue;
  quTovarPost.Open;

  quPostForTovar.Close;
  quPostForTovar.ParamByName('PostNo').AsInteger := cbPostForTovar.KeyValue;
  quPostForTovar.Open;

  quTovarNDS.Close;
  quTovarNDS.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarNDS.Open;

  if quTovarNDS.RecordCount > 0 then quTovarNDS.Edit else quTovarNDS.Insert;

  if quTovarNdsIsStavNDS.Value = true then rbIsTovarNDS.Checked := true;

  quTovarWIthNoNDS.Close;
  quTovarWIthNoNDS.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarWIthNoNDS.Open;

  if quTovarWIthNoNDSWIthNoNDS.Value = true then rbTovarWIthNoNDS.Checked := true;

  quTovarExpirationDate.Close;
  quTovarExpirationDate.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarExpirationDate.Open;

  quOurTovar.Close;
  quOurTovar.ParamByName('TovarNo').AsInteger := TovarNo;
  quOurTovar.Open;

  quService.Close;
  quService.ParamByName('TovarNo').AsInteger := TovarNo;
  quService.Open;

  quPrice.Close;
  quPrice.ParamByName('TovarNo').AsInteger := TovarNo;
  quPrice.Open;

  quCurrencyTovar.Close;
  quCurrencyTovar.ParamByName('TovarNo').AsInteger := TovarNo;
  quCurrencyTovar.Open;

  quCurrency.Open;

  ActiveControl := EditNameTovar;

 //   GoodStandart := dmDataModule.quWork.FieldByName('TovarNo').AsInteger;
 { EdTovarPost.KeyFieldValue := '490';


  //MlekoDbDsMSSQLDm.dsPost.Close;

  EdTovarPost.Text := 'ТОВ "МЛК ТРЕЙД"'
}
end;

procedure TfmEditTovar.ActionApplyExecute(Sender: TObject);
begin
  inherited;
  if quPrice.State in [dsInsert, dsEdit] then quPrice.Post;
  if quTovarExpirationDate.State in [dsInsert, dsEdit] then quTovarExpirationDate.Post;
  if quTovarWIthNoNDS.State in [dsInsert, dsEdit] then quTovarWIthNoNDS.Post;
  if quTovarNDS.State in [dsInsert, dsEdit] then quTovarNDS.Post;
  if quSocialTovar.State in [dsInsert, dsEdit] then quSocialTovar.Post;
  if quTovarPost.State in [dsInsert, dsEdit] then quTovarPost.Post;
  if quOurTovar.State in [dsInsert, dsEdit] then quOurTovar.Post;
  if quService.State in [dsInsert, dsEdit] then quService.Post;
  if quTovarNOPP.State in [dsInsert, dsEdit] then quTovarNOPP.Post;
  if ((quTovarSupplier.State in [dsInsert, dsEdit]) and (deNamePost.Text <> ''))  then quTovarSupplier.Post;
  if quTovarFromDeliveryOfGoods.State in [dsInsert, dsEdit]  then quTovarFromDeliveryOfGoods.Post;
  if quCurrencyTovar.State in [dsInsert, dsEdit]  then quCurrencyTovar.Post; 
end;



procedure TfmEditTovar.cbPostForTovarExit(Sender: TObject);
var
  TovarNom : Integer;
begin
  inherited;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select * from Tovar where NameTovar = :NameTovar');
  dmDataModule.quWork.ParamByName('NameTovar').AsString := EditNameTovar.Text;
  dmDataModule.quWork.Open;
  TovarNom := dmDataModule.quWork.FieldByName('TovarNo').AsInteger;
  dmDataModule.quWork.Close;

  quTovarPost.Close;
  quTovarPost.ParamByName('TovarNo').AsInteger := TovarNom;
  quTovarPost.ParamByName('PostNo').AsInteger := cbPostForTovar.KeyValue;
  quTovarPost.Open;


  TovarNoPost.Refresh;
  NameTovarPost.Refresh;
//  TovarNoPost.DataField := quTovarPost.FieldByName('TovarNoPost').AsString;
  TovarNoPost.SetFocus;

end;




procedure TfmEditTovar.quTovarWIthNoNDSBeforePost(DataSet: TDataSet);
var
  TovarNom : Integer;
begin
  inherited;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select * from Tovar where NameTovar = :NameTovar');
  dmDataModule.quWork.ParamByName('NameTovar').AsString := EditNameTovar.Text;
  dmDataModule.quWork.Open;
  TovarNom := dmDataModule.quWork.FieldByName('TovarNo').AsInteger;
  dmDataModule.quWork.Close;

  if quTovarWIthNoNDS.State = dsInsert then
  begin

    quTovarWIthNoNDSTovarNo.AsInteger := TovarNom;
    quTovarWIthNoNDSWIthNoNDS.AsBoolean := not rbIsTovarNDS.Checked;

  end;

  if quTovarWIthNoNDS.State = dsEdit then
   begin
     dmDataModule.quWork.SQL.Clear;
     dmDataModule.quWork.SQL.Add('select id from TovarWIthNoNDS where TovarNo = :TovarNo');
     dmDataModule.quWork.ParamByName('TovarNo').AsInteger := TovarNom;
     dmDataModule.quWork.Open;

     quTovarWIthNoNDSID.AsInteger := dmDataModule.quWork.FieldByName('ID').AsInteger;
     quTovarWIthNoNDSTovarNo.AsInteger := TovarNom;
     quTovarWIthNoNDSWIthNoNDS.AsBoolean := not rbIsTovarNDS.Checked;
   end
end;

procedure TfmEditTovar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  quSocialTovar.Close;
  quTovarPost.Close;
  quTovarNOPP.Close;
  quPostForTovar.Close;
  quTovarWIthNoNDS.Close;
  quTovarExpirationDate.Close;
  quTovarForReturn.Close;
  quOurTovar.Close;
  quService.Close;
  quCurrency.Close;
end;

procedure TfmEditTovar.quPriceBeforePost(DataSet: TDataSet);
var
  TovarNom : Integer;
begin
  inherited;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select * from Tovar where NameTovar = :NameTovar');
  dmDataModule.quWork.ParamByName('NameTovar').AsString := EditNameTovar.Text;
  dmDataModule.quWork.Open;
  TovarNom := dmDataModule.quWork.FieldByName('TovarNo').AsInteger;
  dmDataModule.quWork.Close;

  if quPrice.State in [dsInsert, dsEdit] then
  begin

    quPriceTovarNo.AsInteger := TovarNom;
//    quPricePriceInInst.AsFloat := dePriceInInst.Field.AsFloat;

  end;


end;



procedure TfmEditTovar.quTovarExpirationDateBeforePost(DataSet: TDataSet);
var
  TovarNom : Integer;
begin
  inherited;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select * from Tovar where NameTovar = :NameTovar');
  dmDataModule.quWork.ParamByName('NameTovar').AsString := EditNameTovar.Text;
  dmDataModule.quWork.Open;
  TovarNom := dmDataModule.quWork.FieldByName('TovarNo').AsInteger;
  dmDataModule.quWork.Close;

  if quTovarExpirationDate.State in [dsInsert, dsEdit] then
  begin

    quTovarExpirationDateTovarNo.AsInteger := TovarNom;
    quTovarExpirationDateExpirationDate.AsInteger := deEhExpirationDate.Field.AsInteger;

  end;

end;

procedure TfmEditTovar.DBGridEh1Exit(Sender: TObject);
begin
  inherited;




  if quListGoodStandarts.State in [dsInsert, dsEdit] then quListGoodStandarts.Post;
  {
  quListGoodStandarts.Edit;
  showmessage('quListGoodStandartsStandartName '+quListGoodStandartsStandartName.AsString);
  if quListGoodStandartsis_chesk.Value = true then showmessage('quListGoodStandartsis_chesk = 1')
                                              else showmessage('quListGoodStandartsis_chesk = 0');
  showmessage('quListGoodStandartsStandartNo: TIntegerField; '+    quListGoodStandartsStandartNo.AsString);
  showmessage('quListGoodStandartsTovarNo: TIntegerField; '+quListGoodStandartsTovarNo.AsString);

   quListGoodStandartsStandartName: TStringField;
    quListGoodStandartsis_chesk: TBooleanField;
    quListGoodStandartsStandartNo: TIntegerField;
    quListGoodStandartsTovarNo: TIntegerField;


  if quListGoodStandarts.State in [dsInsert, dsEdit] then quListGoodStandarts.Post;
//  quListGoodStandarts.Refresh;
//  DBGridEh1.Refresh;
}
end;




procedure TfmEditTovar.DBGridEh1Columns1UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var
  prop: Integer;
begin
  inherited;
  if Value then
    prop := 1
  else
    prop := 0;
  sp_SetGoodStandart.Close;
  sp_SetGoodStandart.ParamByName('p_TovarNo').Value := quListGoodStandartsTovarNo.Value;
  sp_SetGoodStandart.ParamByName('p_Standart_id').Value := quListGoodStandartsStandartNo.Value;
  sp_SetGoodStandart.ParamByName('p_Check').Value := prop;
  sp_SetGoodStandart.ExecProc;

  quListGoodStandarts.edit;
//  quListGoodStandarts.Close;

{
  quListGoodStandarts.Close;
  quListGoodStandarts.ParamByName('p_TovarNo').Value := dmDataModule.quWork.FieldByName('Tovar').AsInteger;
  quListGoodStandarts.Open;
  quListGoodStandarts.Refresh;
 }

end;




procedure TfmEditTovar.bSetGoodStandartsClick(Sender: TObject);
var
  TovarNo : integer;
begin
  inherited;
  with TListGoodStandartForm.Create(Application) do
        try

          ListGoodStandartForm.Caption := 'Привязка к стандартам товара '+ EditNameTovar.Text;
          dmDataModule.quWork.SQL.Clear;
          dmDataModule.quWork.SQL.Add('select * from Tovar where NameTovar = :NameTovar');
          dmDataModule.quWork.ParamByName('NameTovar').AsString := EditNameTovar.Text;
          dmDataModule.quWork.Open;

          TovarNo := dmDataModule.quWork.FieldByName('TovarNo').AsInteger;

          quSetGoodStandartes.Close;
          quSetGoodStandartes.ParamByName('p_TovarNo').Value := TovarNo;
          quSetGoodStandartes.ParamByName('p_TovarNo1').Value := TovarNo;
          quSetGoodStandartes.Open;

          DBGridEh.Columns[1].ReadOnly := false;
          DBGridEh.Refresh;



          ShowModal;
        finally
          dmDataModule.quWork.Close;
          quSetGoodStandartes.Close;
          Free;
        end;
end;



procedure TfmEditTovar.Button1Click(Sender: TObject);
var
  TovarNo : integer;
begin
//  inherited;
  with TEditLinkTovarFromReturnForm.Create(Application) do
        try

          EditLinkTovarFromReturnForm.Caption := 'Привязка к возврату товара '+ EditNameTovar.Text;
          dmDataModule.quWork.SQL.Clear;
          dmDataModule.quWork.SQL.Add('select * from Tovar where NameTovar = :NameTovar');
          dmDataModule.quWork.ParamByName('NameTovar').AsString := EditNameTovar.Text;
          dmDataModule.quWork.Open;

          TovarNo := dmDataModule.quWork.FieldByName('TovarNo').AsInteger;

          dmDataModule.quWork.Close;

          dmDataModule.quWork.SQL.Clear;
          dmDataModule.quWork.SQL.Add('select * from l_TovarForReturn l  where TovarNo = :TovarNo and TovarNoReturn = :TovarNoReturn and TypeReturnNo = :TypeReturnNo');

          dmDataModule.quWork.ParamByName('TovarNo').AsInteger := TovarNo;
          dmDataModule.quWork.ParamByName('TovarNoReturn').AsInteger := quTovarForReturnTovarNoReturn.Value;
          dmDataModule.quWork.ParamByName('TypeReturnNo').AsInteger := quTovarForReturnTypeReturnNo.Value;

          dmDataModule.quWork.Open;
{
          quLinkTovarForReturn.Close;

          quLinkTovarForReturn.ParamByName('TovarNo').AsInteger := TovarNo;
          quLinkTovarForReturn.ParamByName('TovarNoReturn').AsInteger := dmDataModule.quWork.FieldByName('TovarNoReturn').AsInteger;
          quLinkTovarForReturn.ParamByName('TypeReturnNo').AsInteger := dmDataModule.quWork.FieldByName('TovarNoReturn').AsInteger;

          quLinkTovarForReturn.Open;
 }
          DBLookupComboboxEhTypeReturn.KeyValue := quTovarForReturnTypeReturnNo.Value;
          DBLookupComboboxEhTovarForReturn.KeyValue := quTovarForReturnTovarNoReturn.Value;

          TovarFromReturn := TovarNo;
{
          quLinkTovarForReturnTovarNo.Value := TovarNo;
          quLinkTovarForReturnTovarNoReturn.Value := quTovarForReturnTovarNoReturn.Value;
          quLinkTovarForReturnTypeReturnNo.Value := quTovarForReturnTypeReturnNo.Value;
}
          quTypeReturn.Open;
          quSelectTovarForReturn.Open;

          DBGridEhTovarForReturn.Refresh;

          ShowModal;
        finally
          dmDataModule.quWork.Close;
          quTypeReturn.Close;
          quSelectTovarForReturn.Close;
          quLinkTovarForReturn.Close;
          DBGridEhTovarForReturn.Refresh;
          quTovarForReturn.Refresh;
          Free;
        end;
end;

procedure TfmEditTovar.Button2Click(Sender: TObject);
begin
  inherited;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select * from Tovar where NameTovar = :NameTovar');
  dmDataModule.quWork.ParamByName('NameTovar').AsString := EditNameTovar.Text;
  dmDataModule.quWork.Open;

  quDelLinkTovarForReturn.ParamByName('TovarNo').Value := dmDataModule.quWork.FieldByName('TovarNo').AsInteger;
  quDelLinkTovarForReturn.ParamByName('TovarNoReturn').Value := quTovarForReturnTovarNoReturn.Value;
  quDelLinkTovarForReturn.ParamByName('TypeReturnNo').Value := quTovarForReturnTypeReturnNo.Value;

  quDelLinkTovarForReturn.Execute;
  quTovarForReturn.Refresh;
  DBGridEhTovarForReturn.Refresh;

end;

procedure TfmEditTovar.quOurTovarBeforePost(DataSet: TDataSet);
var
  TovarNom : Integer;
begin
  inherited;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select * from Tovar where NameTovar = :NameTovar');
  dmDataModule.quWork.ParamByName('NameTovar').AsString := EditNameTovar.Text;
  dmDataModule.quWork.Open;
  TovarNom := dmDataModule.quWork.FieldByName('TovarNo').AsInteger;
  dmDataModule.quWork.Close;

  if quOurTovar.State = dsInsert then
  begin

    quOurTovarTovarNo.AsInteger := TovarNom;
    quOurTovarNotOur.AsBoolean := Our_Tovar.Checked;

  end;

  if quOurTovar.State = dsEdit then
   begin



    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select id from Our_Tovar where TovarNo = :TovarNo');
    dmDataModule.quWork.ParamByName('TovarNo').AsInteger := TovarNom;
    dmDataModule.quWork.Open;

    quOurTovarID.AsInteger := dmDataModule.quWork.FieldByName('ID').AsInteger;
    quOurTovarTovarNo.AsInteger := TovarNom;
    quOurTovarNotOur.AsBoolean := Our_Tovar.Checked;


   end;
end;



procedure TfmEditTovar.quServiceBeforePost(DataSet: TDataSet);
var
 TovarNom : integer;
begin
  inherited;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select * from Tovar where NameTovar = :NameTovar');
  dmDataModule.quWork.ParamByName('NameTovar').AsString := EditNameTovar.Text;
  dmDataModule.quWork.Open;
  TovarNom := dmDataModule.quWork.FieldByName('TovarNo').AsInteger;
  dmDataModule.quWork.Close;

  if quService.State = dsInsert then
  begin

    quServiceTovarNo.AsInteger := TovarNom;
    quServiceIs_Service.AsBoolean := is_Service.Checked;

  end;

  if quService.State = dsEdit then
   begin



    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select id from Service where TovarNo = :TovarNo');
    dmDataModule.quWork.ParamByName('TovarNo').AsInteger := TovarNom;
    dmDataModule.quWork.Open;

    quServiceID.AsInteger := dmDataModule.quWork.FieldByName('ID').AsInteger;
    quServiceTovarNo.AsInteger := TovarNom;
    quServiceIs_Service.AsBoolean := is_Service.Checked;


   end;
end;

procedure TfmEditTovar.quTovarNdsBeforePost(DataSet: TDataSet);
var
 TovarNom : integer;
begin
  inherited;

  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select * from Tovar where NameTovar = :NameTovar');
  dmDataModule.quWork.ParamByName('NameTovar').AsString := EditNameTovar.Text;
  dmDataModule.quWork.Open;
  TovarNom := dmDataModule.quWork.FieldByName('TovarNo').AsInteger;
  dmDataModule.quWork.Close;
                                                                   
  if quTovarNds.State = dsInsert then
   begin
     quTovarNdsTovarNo.AsInteger := TovarNom;
     if DBNumberEditStavNDS.Text = '' then quTovarNdsStavNDS.AsInteger := 0
                                      else quTovarNdsStavNDS.AsInteger := DBNumberEditStavNDS.Value;
     quTovarNdsGroupNDS.AsString := deGroupNDS.Text;
     if DBNumberEditStavNDS.Text = '' then quTovarNdsIsStavNDS.AsBoolean := false
                                      else quTovarNdsIsStavNDS.AsBoolean := rbIsTovarNDS.Checked;
   end;

  if quTovarNds.State = dsEdit then
   begin
     dmDataModule.quWork.SQL.Clear;
     dmDataModule.quWork.SQL.Add('select id from TovarNDS where TovarNo = :TovarNo');
     dmDataModule.quWork.ParamByName('TovarNo').AsInteger := TovarNom;
     dmDataModule.quWork.Open;

     quTovarNdsId.AsInteger := dmDataModule.quWork.FieldByName('ID').AsInteger;
     quTovarNdsTovarNo.AsInteger := TovarNom;
     if DBNumberEditStavNDS.Text = '' then quTovarNdsStavNDS.AsInteger := 0
                                      else quTovarNdsStavNDS.AsInteger := DBNumberEditStavNDS.Value;
     quTovarNdsGroupNDS.AsString := deGroupNDS.Text;
     if ((DBNumberEditStavNDS.Text = '') or (DBNumberEditStavNDS.Value = 0)) then quTovarNdsIsStavNDS.AsBoolean := false
                                                                             else quTovarNdsIsStavNDS.AsBoolean := not rbTovarWIthNoNDS.Checked;

   end;
end;

procedure TfmEditTovar.TovarWIthNoNDSClick(Sender: TObject);
var
 isChecked : boolean;
begin
  inherited;
  if TovarWIthNoNDS.Checked then isChecked := true else isChecked := false;
  IsTovarNDS.Checked := not isChecked;
  quTovarNds.Edit;
  quTovarNdsIsStavNDS.AsBoolean := not TovarWIthNoNDS.Checked;
  quTovarNds.Post;
  DBNumberEditStavNDS.Enabled := not isChecked;
  deGroupNDS.Enabled := not isChecked;
end;

procedure TfmEditTovar.IsTovarNDSClick(Sender: TObject);
var
 isChecked : boolean;
begin
  inherited;
  if IsTovarNDS.Checked then isChecked := true else isChecked := false;
  TovarWIthNoNDS.Checked := not IsChecked;
  quTovarWIthNoNDS.Close;
  quTovarWIthNoNDS.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarWIthNoNDS.Open;
  quTovarWIthNoNDS.Edit;
  quTovarWIthNoNDSWIthNoNDS.AsBoolean := not IsTovarNDS.Checked;
  quTovarWIthNoNDS.Post;
  DBNumberEditStavNDS.Enabled := IsChecked;
  deGroupNDS.Enabled := IsChecked;
end;

procedure TfmEditTovar.TovarWIthNoNDSExit(Sender: TObject);
begin
  inherited;
{
  quTovarNds.Close;
  quTovarNds.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarNds.Open;
}
  quTovarNds.Edit;
  quTovarNdsIsStavNDS.AsBoolean := not TovarWIthNoNDS.Checked;
  quTovarNds.Post;
{
  quTovarWIthNoNDS.Close;
  quTovarWIthNoNDS.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarWIthNoNDS.Open;
}
  quTovarWIthNoNDS.Edit;
  quTovarWIthNoNDSWIthNoNDS.AsBoolean := not IsTovarNDS.Checked;
  quTovarWIthNoNDS.Post;
end;

procedure TfmEditTovar.IsTovarNDSExit(Sender: TObject);
begin
  inherited;
{
  quTovarWIthNoNDS.Close;
  quTovarWIthNoNDS.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarWIthNoNDS.Open;
}
  quTovarWIthNoNDS.Edit;
  quTovarWIthNoNDSWIthNoNDS.AsBoolean := not IsTovarNDS.Checked;
  quTovarWIthNoNDS.Post;
{
  quTovarNds.Close;
  quTovarNds.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarNds.Open;
}
  quTovarNds.Edit;
  quTovarNdsIsStavNDS.AsBoolean := not TovarWIthNoNDS.Checked;
  quTovarNds.Post;
end;

procedure TfmEditTovar.rbIsTovarNDSClick(Sender: TObject);
begin
  inherited;

  quTovarWIthNoNDS.Close;
  quTovarWIthNoNDS.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarWIthNoNDS.Open;
  if quTovarWIthNoNDS.RecordCount > 0 then quTovarWIthNoNDS.Edit else quTovarWIthNoNDS.Insert;
  quTovarWIthNoNDSWIthNoNDS.AsBoolean := not rbIsTovarNDS.Checked;
  quTovarWIthNoNDS.Post;

  quTovarNds.Close;
  quTovarNds.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarNds.Open;
  if quTovarNds.RecordCount > 0 then quTovarNds.Edit else quTovarNds.Insert;
  quTovarNdsIsStavNDS.AsBoolean := not rbTovarWIthNoNDS.Checked;
  quTovarNds.Post;

  DBNumberEditStavNDS.Enabled := rbIsTovarNDS.Checked;
  deGroupNDS.Enabled := rbIsTovarNDS.Checked;

end;

procedure TfmEditTovar.rbTovarWIthNoNDSClick(Sender: TObject);
begin
  inherited;

  quTovarNds.Close;
  quTovarNds.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarNds.Open;
  if quTovarNds.RecordCount > 0 then quTovarNds.Edit else quTovarNds.Insert;
  quTovarNdsIsStavNDS.AsBoolean := not rbTovarWIthNoNDS.Checked;
  quTovarNds.Post;

  quTovarWIthNoNDS.Close;
  quTovarWIthNoNDS.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarWIthNoNDS.Open;
  if quTovarWIthNoNDS.RecordCount > 0 then quTovarWIthNoNDS.Edit else quTovarWIthNoNDS.Insert;
  quTovarWIthNoNDSWIthNoNDS.AsBoolean := not rbIsTovarNDS.Checked;
  quTovarWIthNoNDS.Post;

  DBNumberEditStavNDS.Enabled := not rbTovarWIthNoNDS.Checked;
  deGroupNDS.Enabled := not rbTovarWIthNoNDS.Checked;
end;

procedure TfmEditTovar.deGroupNDS1DblClick(Sender: TObject);
var
  Dlg:TMlekoSelectMarijaGroupTaxDlg;
begin
  inherited;
  Dlg := TMlekoSelectMarijaGroupTaxDlg.Create(Application);
  try
    if Dlg.ShowModal = mrok Then
      begin
        deGroupNDS.Text := Dlg.Query.FieldByName('NameGroup').Value;
      end;
  finally
     Dlg.Query.Close;
     Dlg.Free;
  end;

end;

procedure TfmEditTovar.quTovarNOPPBeforePost(DataSet: TDataSet);
begin
  inherited;
  {
  quTovarNOPP.Close;
  quTovarNOPP.ParamByName('TovarNo').AsInteger := TovarNo;
  quTovarNOPP.Open;
  if quTovarNOPP.RecordCount > 0 then quTovarNOPP.Edit else quTovarNOPP.Insert;
}  
  quTovarNOPPTovarNo.Value := TovarNo;
//  quTovarNOPPNo_pp.Value := StrToInt(DBEditEh1.text);
end;

procedure TfmEditTovar.deNamePostDblClick(Sender: TObject);
 var
  Dlg:TMlekoSelectFIrmDlg;
begin
  inherited;
  Dlg := TMlekoSelectFirmDlg.Create(Application);
     try
     if Dlg.ShowModal = mrok Then
      begin
        quTovarSupplier.Edit;
        quTovarSupplierPostno.Value := Dlg.Query.FieldByName('PostNo').Value;
        deNamePost.Text := Dlg.Query.FieldByName('shortname').Value;
      end;
     finally
     Dlg.Query.Close;
     Dlg.Free;
     end;

end;

procedure TfmEditTovar.quTovarSupplierBeforePost(DataSet: TDataSet);
begin
  inherited;
  quTovarSupplierTovarNo.Value := TovarNo;
  if deNamePost.Text = '' then quTovarSupplier.Delete;
end;

procedure TfmEditTovar.deNamePostChange(Sender: TObject);
begin
  inherited;
  if deNamePost.Text = '' then quTovarSupplier.Delete;
end;

procedure TfmEditTovar.deDeliveryGoodsNameDblClick(Sender: TObject);
 var
  Dlg : TfmDeliveryOfGoods;
begin
  inherited;
  Dlg := TfmDeliveryOfGoods.Create(Application);
  dmDataModule.quDeliveryOfGoods.Open;
  Dlg.CoolBar1.Visible := false;
 // Dlg.RxDBGrid1.Enabled := false ;
  try
   if Dlg.ShowModal = mrok then begin
                                  quTovarFromDeliveryOfGoods.Edit;
                                  DeliveryTovarNo := data.dmDataModule.quDeliveryOfGoodsDeliveryTovarNo.Value;
                                  deDeliveryGoodsName.Text := data.dmDataModule.quDeliveryOfGoodsDeliveryGoodsName.Value;
                                end;
  finally
   dmDataModule.quDeliveryOfGoods.Close;
   Dlg.Free;
  end;

end;

procedure TfmEditTovar.quTovarFromDeliveryOfGoodsBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  quTovarFromDeliveryOfGoodsTovarNo.Value := TovarNo;
  quTovarFromDeliveryOfGoodsDeliveryTovarNo.Value := DeliveryTovarNo;
end;

procedure TfmEditTovar.leSelectFirmExit(Sender: TObject);
var
  TovarNom : Integer;
begin
  inherited;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select * from Tovar where NameTovar = :NameTovar');
  dmDataModule.quWork.ParamByName('NameTovar').AsString := EditNameTovar.Text;
  dmDataModule.quWork.Open;
  TovarNom := dmDataModule.quWork.FieldByName('TovarNo').AsInteger;
  dmDataModule.quWork.Close;

  quTovarPost.Close;
  quTovarPost.ParamByName('TovarNo').AsInteger := TovarNom;
  quTovarPost.ParamByName('PostNo').AsInteger := PostNo;
  quTovarPost.Open;


  TovarNoPost.Refresh;
  NameTovarPost.Refresh;
//  TovarNoPost.DataField := quTovarPost.FieldByName('TovarNoPost').AsString;
  TovarNoPost.SetFocus;
end;

procedure TfmEditTovar.leSelectFirmDblClick(Sender: TObject);
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

initialization
  RegisterClass(TfmEditTovar);


finalization
  UnRegisterClass(TfmEditTovar);

end.




