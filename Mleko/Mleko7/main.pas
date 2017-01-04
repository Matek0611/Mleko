unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus, ComCtrls, ExtCtrls, IniFiles, DB, Variants, ComObj, DBAccess, MSAccess, DBCtrls, ActnList, StdCtrls, rxFileUtil, DateUtils, Math, BCMain, dxBar, AppEvnts, dxBarExtItems, cxClasses, data, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, MemDS;

type
  TExport_Finance = function(DateExport: TDate): Boolean;

type
  TfmMain = class(TBCMainForm)
    mmMenu: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N38: TMenuItem;
    N210: TMenuItem;
    N58: TMenuItem;
    N59: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N60: TMenuItem;
    N61: TMenuItem;
    N70: TMenuItem;
    N71: TMenuItem;
    N72: TMenuItem;
    N73: TMenuItem;
    N211: TMenuItem;
    N310: TMenuItem;
    N42: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N36: TMenuItem;
    N49: TMenuItem;
    NaklPCur: TMenuItem;
    NaklPPrev: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N54: TMenuItem;
    NaklRCur: TMenuItem;
    NaklRPrev: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    OrderPrihCur: TMenuItem;
    OrderPrihPrev: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    OrderRasCurr1: TMenuItem;
    OrderRasPrev1: TMenuItem;
    N44: TMenuItem;
    NS1: TMenuItem;
    N41: TMenuItem;
    N46: TMenuItem;
    N57: TMenuItem;
    N62: TMenuItem;
    N64: TMenuItem;
    N65: TMenuItem;
    N66: TMenuItem;
    N67: TMenuItem;
    N68: TMenuItem;
    N29: TMenuItem;
    N74: TMenuItem;
    N75: TMenuItem;
    N76: TMenuItem;
    N77: TMenuItem;
    N78: TMenuItem;
    N79: TMenuItem;
    N11111: TMenuItem;
    N80: TMenuItem;
    N81: TMenuItem;
    ExpeditionCur1: TMenuItem;
    ExpeditionPrev1: TMenuItem;
    N82: TMenuItem;
    N83: TMenuItem;
    N84: TMenuItem;
    N85: TMenuItem;
    N86: TMenuItem;
    N87: TMenuItem;
    Exell1: TMenuItem;
    N88: TMenuItem;
    N90: TMenuItem;
    N92: TMenuItem;
    N93: TMenuItem;
    N96: TMenuItem;
    N1111: TMenuItem;
    N112: TMenuItem;
    N212: TMenuItem;
    N103: TMenuItem;
    Excel2: TMenuItem;
    N104: TMenuItem;
    N113: TMenuItem;
    N105: TMenuItem;
    Excel3: TMenuItem;
    N106: TMenuItem;
    N107: TMenuItem;
    N108: TMenuItem;
    N109: TMenuItem;
    N114: TMenuItem;
    N115: TMenuItem;
    N116: TMenuItem;
    N117: TMenuItem;
    N118: TMenuItem;
    NaklPCur1: TMenuItem;
    NaklPPrev1: TMenuItem;
    N119: TMenuItem;
    N120: TMenuItem;
    NaklRCur1: TMenuItem;
    NaklRPrev1: TMenuItem;
    N121: TMenuItem;
    N125: TMenuItem;
    Excel4: TMenuItem;
    N126: TMenuItem;
    N127: TMenuItem;
    N128: TMenuItem;
    NaklRetCur: TMenuItem;
    NaklRetPrev: TMenuItem;
    N129: TMenuItem;
    N130: TMenuItem;
    N133: TMenuItem;
    N134: TMenuItem;
    N135: TMenuItem;
    N136: TMenuItem;
    N137: TMenuItem;
    N142: TMenuItem;
    N138: TMenuItem;
    N139: TMenuItem;
    N143: TMenuItem;
    Z1: TMenuItem;
    X1: TMenuItem;
    N144: TMenuItem;
    N145: TMenuItem;
    N146: TMenuItem;
    N147: TMenuItem;
    N148: TMenuItem;
    N1C1: TMenuItem;
    N150: TMenuItem;
    N89: TMenuItem;
    N91: TMenuItem;
    N94: TMenuItem;
    N95: TMenuItem;
    Excel5: TMenuItem;
    Excel6: TMenuItem;
    N97: TMenuItem;
    N98: TMenuItem;
    N99: TMenuItem;
    N100: TMenuItem;
    N101: TMenuItem;
    N102: TMenuItem;
    N110: TMenuItem;
    N111: TMenuItem;
    N156: TMenuItem;
    N158: TMenuItem;
    N159: TMenuItem;
    N160: TMenuItem;
    N162: TMenuItem;
    N163: TMenuItem;
    N164: TMenuItem;
    N165: TMenuItem;
    N166: TMenuItem;
    N167: TMenuItem;
    N168: TMenuItem;
    N169: TMenuItem;
    N170: TMenuItem;
    N172: TMenuItem;
    N173: TMenuItem;
    N174: TMenuItem;
    N175: TMenuItem;
    N176: TMenuItem;
    N178: TMenuItem;
    N179: TMenuItem;
    N181: TMenuItem;
    UMC1: TMenuItem;
    N182: TMenuItem;
    N186: TMenuItem;
    N187: TMenuItem;
    N188: TMenuItem;
    N189: TMenuItem;
    N190: TMenuItem;
    Label1: TLabel;
    N198: TMenuItem;
    N199: TMenuItem;
    est1: TMenuItem;
    N122: TMenuItem;
    N131: TMenuItem;
    N200: TMenuItem;
    N39: TMenuItem;
    N63: TMenuItem;
    N151: TMenuItem;
    N183: TMenuItem;
    N201: TMenuItem;
    N202: TMenuItem;
    N203: TMenuItem;
    N204: TMenuItem;
    N205: TMenuItem;
    route: TMenuItem;
    MnTestForm: TMenuItem;
    mniTreeClass: TMenuItem;
    Label2: TLabel;
    ActionBlockMainForm: TAction;
    N33: TMenuItem;
    N37: TMenuItem;
    N40: TMenuItem;
    N43: TMenuItem;
    N45: TMenuItem;
    N53: TMenuItem;
    N69: TMenuItem;
    N123: TMenuItem;
    N124: TMenuItem;
    J1: TMenuItem;
    N132: TMenuItem;
    N140: TMenuItem;
    N141: TMenuItem;
    N149: TMenuItem;
    N152: TMenuItem;
    N153_CangePriceList: TMenuItem;
    NCrosPaymentFromPost: TMenuItem;
    StandartsOfGoods: TMenuItem;
    TypeReturn: TMenuItem;
    CategoryTT: TMenuItem;
    MlekoBlankListWisKPK: TMenuItem;
    RestContainer: TMenuItem;
    IndentOrders: TMenuItem;
    ExpotrTovForScales: TMenuItem;
    InputOrderExcel: TMenuItem;
    MarijaGroupTax: TMenuItem;
    ReceiptOrder: TMenuItem;
    ReceiptOrders: TMenuItem;
    ReceiptOrdersTodey: TMenuItem;
    ReceiptOrdersCur: TMenuItem;
    ReceiptOrdersPrev: TMenuItem;
    ReceiptOrdersDop: TMenuItem;
    N153: TMenuItem;
    TmDeliveryOfGoods: TMenuItem;
    NOstatokZero: TMenuItem;
    NMinusVidRashod: TMenuItem;
    NClearBase: TMenuItem;
    NCorrectRestOfVPrih: TMenuItem;
    NPostMinusClearBase: TMenuItem;
    NMinusVidTovar: TMenuItem;
    NMinVidTovForClBase: TMenuItem;
    sp_ClearBaseTrunc: TMSStoredProc;
    NWriteOffCosts: TMenuItem;
    ABCDZ1: TMenuItem;
    NBanks: TMenuItem;
    NKassa: TMenuItem;
    NBDDS: TMenuItem;
    NPepsico: TMenuItem;
    NSalesChannelsPepsi: TMenuItem;
    NKOATUU: TMenuItem;
    NRequestForSupply: TMenuItem;
    NCommerceNetwork: TMenuItem;
    NExportFromSandora: TMenuItem;
    NExportRestSand: TMenuItem;
    NExportSotrud: TMenuItem;
    NExportAdrPost: TMenuItem;
    NExportSales: TMenuItem;
    NExportOtchetSand: TMenuItem;
    NRest1: TMenuItem;
    NUP: TMenuItem;
    NReasonForUnlocking: TMenuItem;
    NPlanningOrder: TMenuItem;
    NNewPlanningOrder: TMenuItem;
    NPlanningToday: TMenuItem;
    PlanningOrderCur: TMenuItem;
    PlanningOrderPrev: TMenuItem;
    PlanningOrderDop: TMenuItem;
    AnalisPlanProdag: TMenuItem;
    AnalizReturnOrder: TMenuItem;
    InfarmAnalysis: TMenuItem;
    ListAdrInfoNew: TMenuItem;
    PricingList: TMenuItem;
    RestOfDateManuf: TMenuItem;
    ControlRestDOM: TMenuItem;
    CheckPriceInInst: TMenuItem;
    NOtdel: TMenuItem;
    NTovar: TMenuItem;
    NAuto: TMenuItem;
    NUnlocking: TMenuItem;
    NFinance: TMenuItem;
    NOutlets: TMenuItem;
    CreatWithExel: TMenuItem;
    N154: TMenuItem;
    NewClientCard: TMenuItem;
    CardsClients: TMenuItem;
    NotAppCardsClients: TMenuItem;
    AppliedCardsClients: TMenuItem;
    VidDoc: TMenuItem;
    ContVidRashod: TMenuItem;
    GroupCutting: TMenuItem;
    ListVidTovForGrCut: TMenuItem;
    CheckMeshCutting: TMenuItem;
    PostFromGroupCutting: TMenuItem;
    AnalisCuttingMesh: TMenuItem;
    Currency: TMenuItem;
    ExchangeRates: TMenuItem;
    VidRashGroup: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure N210Click(Sender: TObject);
    procedure N59Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N70Click(Sender: TObject);
    procedure N72Click(Sender: TObject);
    procedure N73Click(Sender: TObject);
    procedure N211Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N310Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure NaklPCurClick(Sender: TObject);
    procedure NaklPPrevClick(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N54Click(Sender: TObject);
    procedure NaklRCurClick(Sender: TObject);
    procedure NaklRPrevClick(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure OrderPrihCurClick(Sender: TObject);
    procedure OrderPrihPrevClick(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure OrderRasCurr1Click(Sender: TObject);
    procedure OrderRasPrev1Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure NS1Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N64Click(Sender: TObject);
    procedure N65Click(Sender: TObject);
    procedure N66Click(Sender: TObject);
    procedure N67Click(Sender: TObject);
    procedure N68Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N74Click(Sender: TObject);
    procedure N75Click(Sender: TObject);
    procedure N76Click(Sender: TObject);
    procedure N77Click(Sender: TObject);
    procedure N78Click(Sender: TObject);
    procedure N79Click(Sender: TObject);
    procedure N11111Click(Sender: TObject);
    procedure N83Click(Sender: TObject);
    procedure N84Click(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure N85Click(Sender: TObject);
    procedure N82Click(Sender: TObject);
    procedure ExpeditionCur1Click(Sender: TObject);
    procedure ExpeditionPrev1Click(Sender: TObject);
    procedure N86Click(Sender: TObject);
    procedure Exell1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N92Click(Sender: TObject);
    procedure N93Click(Sender: TObject);
    procedure N96Click(Sender: TObject);
    procedure N94Click(Sender: TObject);
    procedure N95Click(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure N112Click(Sender: TObject);
    procedure N212Click(Sender: TObject);
    procedure N1111Click(Sender: TObject);
    procedure Excel2Click(Sender: TObject);
    procedure N103Click(Sender: TObject);
    procedure N113Click(Sender: TObject);
    procedure N105Click(Sender: TObject);
    procedure Excel3Click(Sender: TObject);
    procedure N106Click(Sender: TObject);
    procedure N107Click(Sender: TObject);
    procedure N108Click(Sender: TObject);
    procedure N120Click(Sender: TObject);
    procedure NaklRCur1Click(Sender: TObject);
    procedure NaklRPrev1Click(Sender: TObject);
    procedure N121Click(Sender: TObject);
    procedure N118Click(Sender: TObject);
    procedure NaklPCur1Click(Sender: TObject);
    procedure NaklPPrev1Click(Sender: TObject);
    procedure N119Click(Sender: TObject);
    procedure N125Click(Sender: TObject);
    procedure Excel4Click(Sender: TObject);
    procedure N128Click(Sender: TObject);
    procedure NaklRetCurClick(Sender: TObject);
    procedure NaklRetPrevClick(Sender: TObject);
    procedure N129Click(Sender: TObject);
    procedure N126Click(Sender: TObject);
    procedure N130Click(Sender: TObject);
    procedure N132Click(Sender: TObject);
    procedure N138Click(Sender: TObject);
    procedure N134Click(Sender: TObject);
    procedure N140Click(Sender: TObject);
    procedure N135Click(Sender: TObject);
    procedure N142Click(Sender: TObject);
    procedure N136Click(Sender: TObject);
    procedure N137Click(Sender: TObject);
    procedure Z1Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure N144Click(Sender: TObject);
    procedure N145Click(Sender: TObject);
    procedure N146Click(Sender: TObject);
    procedure N147Click(Sender: TObject);
    procedure N148Click(Sender: TObject);
    procedure N1C1Click(Sender: TObject);
    procedure N150Click(Sender: TObject);
//    procedure N154Click(Sender: TObject);
    procedure Excel5Click(Sender: TObject);
    procedure Excel6Click(Sender: TObject);
    procedure N97Click(Sender: TObject);
    procedure N102Click(Sender: TObject);
    procedure N178Click(Sender: TObject);
    procedure N115Click(Sender: TObject);
    procedure N182Click(Sender: TObject);
    procedure N186Click(Sender: TObject);
    procedure N124Click(Sender: TObject);
    procedure N187Click(Sender: TObject);
    procedure N188Click(Sender: TObject);
    procedure N189Click(Sender: TObject);
    procedure N190Click(Sender: TObject);
    procedure N198Click(Sender: TObject);
    procedure N199Click(Sender: TObject);
    procedure N122Click(Sender: TObject);
    procedure N131Click(Sender: TObject);
    procedure N200Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N183Click(Sender: TObject);
    procedure N202Click(Sender: TObject);
    procedure N203Click(Sender: TObject);
    procedure N204Click(Sender: TObject);
    procedure routeClick(Sender: TObject);
    procedure MnTestFormClick(Sender: TObject);
    procedure ActionServerInfo1Execute(Sender: TObject);
    procedure ActionBlockMainFormExecute(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure N69Click(Sender: TObject);
    procedure N123Click(Sender: TObject);
    procedure J1Click(Sender: TObject);
    procedure N141Click(Sender: TObject);
    procedure N149Click(Sender: TObject);
    procedure N152Click(Sender: TObject);
    procedure N153_CangePriceListClick(Sender: TObject);
    procedure NCrosPaymentFromPostClick(Sender: TObject);
    procedure StandartsOfGoodsClick(Sender: TObject);
    procedure TypeReturnClick(Sender: TObject);
    procedure CategoryTTClick(Sender: TObject);
    procedure MlekoBlankListWisKPKClick(Sender: TObject);
    procedure RestContainerClick(Sender: TObject);
    procedure IndentOrdersClick(Sender: TObject);
    procedure ExpotrTovForScalesClick(Sender: TObject);
    procedure InputOrderExcelClick(Sender: TObject);
    procedure MarijaGroupTaxClick(Sender: TObject);
    procedure ReceiptOrdersTodeyClick(Sender: TObject);
    procedure ReceiptOrdersCurClick(Sender: TObject);
    procedure ReceiptOrdersPrevClick(Sender: TObject);
    procedure ReceiptOrdersDopClick(Sender: TObject);
    procedure ReceiptOrderClick(Sender: TObject);
    procedure N153Click(Sender: TObject);
    procedure TmDeliveryOfGoodsClick(Sender: TObject);
    procedure N01Click(Sender: TObject);
    procedure NOstatokZeroClick(Sender: TObject);
    procedure NMinusVidRashodClick(Sender: TObject);
    procedure NClearBaseClick(Sender: TObject);
    procedure NCorrectRestOfVPrihClick(Sender: TObject);
    procedure NPostMinusClearBaseClick(Sender: TObject);
    procedure NMinusVidTovarClick(Sender: TObject);
    procedure NMinVidTovForClBaseClick(Sender: TObject);
    procedure NWriteOffCostsClick(Sender: TObject);
    procedure ABCDZ1Click(Sender: TObject);
    procedure NBanksClick(Sender: TObject);
    procedure NKassaClick(Sender: TObject);
    procedure NBDDSClick(Sender: TObject);
    procedure NPepsicoClick(Sender: TObject);
    procedure NSalesChannelsPepsiClick(Sender: TObject);
    procedure NKOATUUClick(Sender: TObject);
    procedure NRequestForSupplyClick(Sender: TObject);
    procedure NCommerceNetworkClick(Sender: TObject);
    procedure NExportSotrudClick(Sender: TObject);
    procedure NExportAdrPostClick(Sender: TObject);
    procedure NExportSalesClick(Sender: TObject);
    procedure NExportRestSandClick(Sender: TObject);
    procedure NRest1Click(Sender: TObject);
    procedure NUPClick(Sender: TObject);
    procedure NReasonForUnlockingClick(Sender: TObject);
    procedure NPlanningOrderClick(Sender: TObject);
    procedure NNewPlanningOrderClick(Sender: TObject);
    procedure NPlanningTodayClick(Sender: TObject);
    procedure PlanningOrderCurClick(Sender: TObject);
    procedure PlanningOrderPrevClick(Sender: TObject);
    procedure PlanningOrderDopClick(Sender: TObject);
    procedure AnalisPlanProdagClick(Sender: TObject);
    procedure AnalizReturnOrderClick(Sender: TObject);
    procedure InfarmAnalysisClick(Sender: TObject);
    procedure ListAdrInfoNewClick(Sender: TObject);
    procedure PricingListClick(Sender: TObject);
    procedure RestOfDateManufClick(Sender: TObject);
    procedure NExportOtchetSandClick(Sender: TObject);
    procedure ControlRestDOMClick(Sender: TObject);
    procedure CheckPriceInInstClick(Sender: TObject);
    procedure NOtdelClick(Sender: TObject);
    procedure CreatWithExelClick(Sender: TObject);
    procedure NewClientCardClick(Sender: TObject);
    procedure VidDocClick(Sender: TObject);
    procedure NotAppCardsClientsClick(Sender: TObject);
    procedure AppliedCardsClientsClick(Sender: TObject);
    procedure ContVidRashodClick(Sender: TObject);
    procedure GroupCuttingClick(Sender: TObject);
    procedure ListVidTovForGrCutClick(Sender: TObject);
    procedure CheckMeshCuttingClick(Sender: TObject);
    procedure PostFromGroupCuttingClick(Sender: TObject);
    procedure AnalisCuttingMeshClick(Sender: TObject);
    procedure CurrencyClick(Sender: TObject);
    procedure ExchangeRatesClick(Sender: TObject);
    procedure VidRashGroupClick(Sender: TObject);
  private
    { Private declarations }
    FFileName: string;
    PatchLocal, PatchUpDate: string;
    procedure ReadMenuForUser(MI: TMenuItem);
    function GetDirectoryName(Dir: string): string;
    procedure export_txt(p_head: string = 'V_tavria_head'; p_spec: string = 'v_tavria_spec');
  protected
    procedure OnSetModule; override;
  end;

var
  fmMain: TfmMain;
  Connect1C, EditPostUser, EditPriceInInst: Boolean;
  DeltaPriceInInst: Real;
  onesobj: Olevariant;
  FiscPrinter: Olevariant;
  PKO, RashNaklReturn, PrihNaklReturn, PrihNakl, RashNakl: Olevariant;
  Kontragent, DenSchet, TMC: Olevariant;
  Path1C, User1C, Pass1C, DataBase1C, Server1C: string;
  PrinterOpenCashBox, PrinterCash: Boolean;
  GlobalOtdelNo: Integer;
  GlobalDateNakl: TDate;
  GlobalOurFirmNo: Integer;
  day_of_week: integer;
  Edit_CrossBlankOrder: Boolean;
  IsSelectItemTTN: Boolean;
  isPrintTTNForNight: Boolean;
  DateOfManufacture: TDate;
  //  PrinterOpenCashBox, FiscPrinterConnect, PrinterCash: Boolean;

implementation

uses
  Post0, NaklP0, Tovar0, Ostatok2, About, PrihodTov, DolgNash, InPlatTov, Sotrud0, fmrOtchet1, fmrOtchet2, VidTov0, fmrPrice, qrOtchet4, HotKey, RasPlatTov, Setup0, qrSotrudPlat0, Users, BCDb, SotrudSalary0, Zakupka0, Company0, SelNakl0, UtilsDataConvert, NaklR0, SelPlat, OrdersPrih0, OrdersRash0, OtchetKassa0, Password, Regions0, Otchets0, TopTovars0, BadTovars0, CloseReturn0, CrossPostNaklR0, CrossPostNaklP0, InputPlan0, uAccountCashRashod, CrossReturne0, VidRashoda, TipTovara0, Cars0, Shipping_Agent0,
  SelExpedition0, Expedition0, OtchetSale0, PodotchetR0, SelectPodotchet0, Podotchet0, Export1C0, OthetBuh0, SelOtdel, SelTip, KartData, KartVerife0, SvedenieNaklNotCar0, BlockDate0, NaklChange0, TovarSvedenie0, NaklNotSvedenie0, InOutCash0, GetDate0, SelectRas0, MlekoBlankList, MlekoSelectDayDept, MlekoSelectReport, CFLMLKCustomRep, CFLMLKEditReport, MlekoListTovarWieght, MlekoClosePlatR, MLekoListAdrInfo, MLekoListAdrInfoPayBan, MLekoListRestAudit, MlekoListLogist, MlekoListPrice, MlekoCrossBlankOrder,
  CFLMLKSelect, CFLMLKPropDb, StrUtils, MlekoListRoute, MlekoTest, UtilsCommon, EditNaklR0, MlekoPropDbBlockApp, MlekoListActivity, MlekoListCFO, DolgNam, MlekoListColumns, BCCommon, MlekoBlkParamPrivyazka, Meko_Blanc_Price, TovarPost0, NaklRPost0, MlekoSelectNaklR, Employee, MlekoBlankListOutSide, ChangePrice0, TimetableForDriver, ChangePriceList0, CrossPaymentsFromPost0, StandartsOfGoods, TypeReturn, CategoryTT, MlekoSelectFloat, MlekoBlankListWithKPK, ExportTovarForScales, InputOrderWithExcel,
  MlekoSelectMarijaGroupTax, PrihodOrderHead, PrihodOrder, BlockDateExpedition0, DeliveryOfGoods0, ListMinusVidTovar, ListMinusPostForOstatokZero, ListMinusVidRashForOstatokZero, ListMinusPostForClearBase, ListMinusVidRashForClearBase, ListPlusPostForDolg, ListControlRequiredData, VidRashod, WriteOffCosts, SelectPostForWriteOffCosts, ClassifierABCDZ, BankAndInvoice, Kassa, BDDS, VidSotrudInPepsico, SalesChannelsOfPepsico, KOATUU, MlekoSelectBankInvoice, RequestForSupplyGoodsHead,
  AddressPost_CODE_Commerce_Network, MlekoSelectFIrmSupplier, Ostatok1Head, ListMinusPostForAnalizPrihod, ReasonForUnlocking0, ListMinusPostForAnalizOstatka, PlanningOrder, PlanningOrderHead, AnalisPlanningOrder, AnalisReturnOrder, Infarmatsionny_Analysis, ListMinusPostForAnalizPrihodNew, MLekoListAdrInfoNew, PricingList, RestTovarOfDateManufacture, ControlRestTovarOfDateManufacture, ReconciliationReceiptPriceInInst, OtdelForm0, ListMinusPostForDolg, PrihodTovWithExel, MlekoSelectFIrm, EditClientCard,
  VidDoc, DocClientCardHead, ControlVidRashodForPlat, GroupCutting, ListVidTovForGroupCutting, CheckMeshCutting, PostFromGroupCutting, AnalisCuttingMesh, Currency, CurrencyExchange, VidRashodGroup;

{$R *.DFM}

function TFmMain.GetDirectoryName(Dir: string): string;
{ This function formats the directory name so that it is a valid
  directory containing the back-slash (\) as the last character. }
begin

  if Dir[Length(Dir)] <> '\' then
    Result := Dir + '\'
  else
    Result := Dir;
end;

procedure TFmMain.ReadMenuForUser(MI: TMenuItem);
var
  i: integer;
begin
  dmDataModule.quMenu.ParamByName('UserNo').AsInteger := Data.UserNo;
  dmDataModule.quMenu.Open;
  for i := 0 to MI.Count - 1 do
  begin
    if dmDataModule.quMenu.Locate('UserNo;ItemName', VarArrayOf([Data.UserNo, Trim(MI[i].Name)]), []) and dmDataModule.quMenuEnabled.AsBoolean then
    begin
      MI[i].Enabled := True;
      MI[i].Visible := True;
    end
    else
    begin
      MI[i].Enabled := False;
      MI[i].Visible := False;
    end;
    ReadMenuForUser(MI[i]);
  end;
end;

procedure TfmMain.N3Click(Sender: TObject);
begin
  Post(False, False);
end;

procedure TfmMain.N8Click(Sender: TObject);
begin
  fmMain.Close;
end;

procedure TfmMain.N4Click(Sender: TObject);
var
  Params: TParams;
begin
  inherited;
  Params := TParams.Create;
  try
    BCCommon.OpenForm(Sender, nil, 'TMlkChildArticleForm', Params);
  finally
    Params.Free;
  end;
end;

procedure TfmMain.N9Click(Sender: TObject);
begin
  ShowOstatki(0);
end;

procedure TfmMain.N10Click(Sender: TObject);
var
  Pkey: Int64;
begin
  //                    TfmEditNaklR.AddNaklR(l_naklNo);
  TfmEditNaklR.EditNaklR(Pkey, 'ADD', false, false);
end;

procedure TfmMain.N7Click(Sender: TObject);
begin
  with TAboutBox.Create(Application) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfmMain.N5Click(Sender: TObject);
var
  i: integer;
  Pkey: Int64;
begin
  Pkey := -1;
  PrihodTovar(1, Pkey);
end;

procedure TfmMain.N15Click(Sender: TObject);
begin
  ShowDolgNash;
end;

procedure TfmMain.N19Click(Sender: TObject);
begin
  PrihodManyTov(False);
end;

procedure TfmMain.N20Click(Sender: TObject);
begin
  Sotrud(False);
end;

procedure TfmMain.N22Click(Sender: TObject);
begin
  OtchetNaklR;
end;

procedure TfmMain.N23Click(Sender: TObject);
begin
  OtchetRashod;
end;

procedure TfmMain.N24Click(Sender: TObject);
begin
  VidTov(False, False);
end;

procedure TfmMain.N25Click(Sender: TObject);
begin
  Price;
end;

procedure TfmMain.N26Click(Sender: TObject);
begin
  OtchetKassa(1);
end;

procedure TfmMain.N28Click(Sender: TObject);
begin
  if (Application.MessageBox('Вы уверены, что хотите закрыть безнальную накладную наличными ?', 'Приход денег', MB_YESNO) = IDYES) then
  begin
    PrihodManyTov(True);
  end;
end;

procedure TfmMain.FormShow(Sender: TObject);
var
  Year, Month, Day: word;
  f1, f2: string;
  Ini: TIniFile;
  i, j, Port: Integer;
  Path1C, ServerType: string;
  Connect1C: Boolean;
begin
  inherited;
  OnSetModule;
  if not TMlekoSelectDayDeptDlg.SelectDayDept then
  begin
    MessageDlg('Для входа в программу необходимо выбрать подразделение и рабочую дату', mtInformation, [mbOk], 0);
    Close;
  end;
  fmMain.Caption := 'Склад- Фирма: ' + UpperCase(dmDataModule.OurFirmName);
  fmMain.Width := data.FormWight;
  fmMain.Height := data.FormHeight;
  fmMain.Left := data.FormLeft;
  fmMain.Top := data.FormTop;

  LoadKeyboardLayout('00000419', KLF_ACTIVATE);
  DecodeDate(Date(), Year, Month, Day);

  NaklPCur.Caption := 'За ' + MonthToString(Month, False);
  NaklRCur.Caption := 'За ' + MonthToString(Month, False);
  NaklPCur1.Caption := 'За ' + MonthToString(Month, False);
  NaklRCur1.Caption := 'За ' + MonthToString(Month, False);
  NaklRetCur.Caption := 'За ' + MonthToString(Month, False);
  OrderPrihCur.Caption := 'За ' + MonthToString(Month, False);
  OrderRasCurr1.Caption := 'За ' + MonthToString(Month, False);
  ExpeditionCur1.Caption := 'За ' + MonthToString(Month, False);
  ReceiptOrdersCur.Caption := 'За ' + MonthToString(Month, False);
  PlanningOrderCur.Caption := 'За ' + MonthToString(Month, False);

  if Month = 1 then
    Month := 12
  else
    Month := Month - 1;

  NaklPPrev.Caption := 'За ' + MonthToString(Month, False);
  NaklRPrev.Caption := 'За ' + MonthToString(Month, False);
  NaklPPrev1.Caption := 'За ' + MonthToString(Month, False);
  NaklRPrev1.Caption := 'За ' + MonthToString(Month, False);
  NaklRetPrev.Caption := 'За ' + MonthToString(Month, False);
  OrderPrihPrev.Caption := 'За ' + MonthToString(Month, False);
  OrderRasPrev1.Caption := 'За ' + MonthToString(Month, False);
  ExpeditionPrev1.Caption := 'За ' + MonthToString(Month, False);
  ReceiptOrdersPrev.Caption := 'За ' + MonthToString(Month, False);
  PlanningOrderPrev.Caption := 'За ' + MonthToString(Month, False);
  Label1.Caption := dmDataModule.OurFirmName;

  dmDataModule.OpenSQL('select EditPost, rtrim(UserName) as UserName, @@SERVERNAME as ServerName from Users where UserNo = :p1_id', [Data.UserNo]);
  EditPostUser := (not dmDataModule.QFO.FieldByName('EditPost').AsBoolean);
  fmMain.StatusBar.Panels[0].Text := 'Пользователь : ' + dmDataModule.QFO.FieldByName('UserName').AsString;
  fmMain.StatusBar.Panels[0].Width := 250;

  fmMain.StatusBar.Panels[1].Text := 'Сервер : ' + dmDataModule.QFO.FieldByName('ServerName').AsString;
  fmMain.StatusBar.Panels[1].Width := 200;

  fmMain.StatusBar.Panels[2].Text := 'Дата : ' + DateToStr(GlobalDateNakl);
  fmMain.StatusBar.Panels[2].Width := 150;
  ReadMenuForUser(mmMenu.Items);

  dmDataModule.qfo.SQL.Clear;
  dmDataModule.qfo.SQL.Add('select OtdelName from vidotdel where otdelNo=' + IntTOStr(GlobalOtdelNo));
  dmDataModule.qfo.Open;
  fmMain.StatusBar.Panels[3].Text := 'Подразделение: ' + dmDataModule.qfo.FieldByName('OtdelName').AsString;
  fmMain.StatusBar.Panels[3].Width := 200;
  ServerType := data.ServSection;

  isPrintTTNForNight := False;

  dmDataModule.OpenSQL('select UserName,EditPost from Users where EditPost = 1 and UserNo = :p1_id', [Data.UserNo]);
  if (dmDataModule.QFO.RecordCount > 0) then
    UserAccessToEditingPublishers := true
  else
    UserAccessToEditingPublishers := false;

  dmDataModule.OpenSQL('select ChangePriceInInst from ListUsersForChange where UserNo = :p1_id', [Data.UserNo]);
  if (dmDataModule.QFO.RecordCount > 0) then
    EditPriceInInst := (dmDataModule.QFO.FieldByName('ChangePriceInInst').AsBoolean)
  else
    EditPriceInInst := false;

  dmDataModule.OpenSQL('select DeltaPriceInInst from DeltaPrice');
  if (dmDataModule.QFO.RecordCount > 0) then
    DeltaPriceInInst := (dmDataModule.QFO.FieldByName('DeltaPriceInInst').AsFloat)
  else
    DeltaPriceInInst := 0;


  //Проверка кассового аппарата (начало)
  dmDataModule.quWork.Close;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('SELECT PrinterCash FROM Setup');
  try
    dmDataModule.quWork.Open;
  except
    begin
      dmDataModule.quWork.SQL.Clear;
      dmDataModule.quWork.SQL.Add('ALTER TABLE Setup ADD PrinterCash INT ' + 'CONSTRAINT  DF_Setup_PrinterCash NOT NULL DEFAULT 0 WITH VALUES');
      dmDataModule.quWork.Execute;

      dmDataModule.quWork.SQL.Clear;
      dmDataModule.quWork.SQL.Add('UPDATE Setup SET PrinterCash = 0');
      dmDataModule.quWork.Execute;
    end;
  end;
  dmDataModule.quWork.Close;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('SELECT OpenCashBox FROM Setup');
  try
    dmDataModule.quWork.Open;
  except
    begin
      dmDataModule.quWork.SQL.Clear;
      dmDataModule.quWork.SQL.Add('ALTER TABLE Setup ADD OpenCashBox INT ' + 'CONSTRAINT  DF_Setup_PrinterCash NOT NULL DEFAULT 0 WITH VALUES');
      dmDataModule.quWork.Execute;

      dmDataModule.quWork.SQL.Clear;
      dmDataModule.quWork.SQL.Add('UPDATE Setup SET OpenCashBox = 0');
      dmDataModule.quWork.Execute;
    end;
  end;
  dmDataModule.quWork.Close;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('SELECT PrinterCash, OpenCashBox FROM Setup');
  dmDataModule.quWork.Open;
  if dmDataModule.quWork.FieldByName('OpenCashBox').AsInteger = 0 then
  begin
    PrinterOpenCashBox := False;
    fmMain.N100.Checked := True;
    fmMain.N99.Checked := False;
  end
  else
  begin
    PrinterOpenCashBox := True;
    fmMain.N100.Checked := False;
    fmMain.N99.Checked := True;
  end;
  if dmDataModule.quWork.FieldByName('PrinterCash').AsInteger = 0 then
  begin
    fmMain.N147.Checked := True;
    fmMain.N148.Checked := False;
  end
  else
  begin
    //Подключение фискального принтера
    fmMain.N147.Checked := False;
    fmMain.N148.Checked := True;
  end;
  dmDataModule.quWork.Close;

  //Проверка кассового аппарата (конец)

  dmDataModule.quTipNakl.Open;
  if dmDataModule.quTipNakl.Locate('TipNo', 1, []) then
    fmMain.N26.Caption := dmDataModule.quTipNaklTipName.AsString;
  if dmDataModule.quTipNakl.Locate('TipNo', 3, []) then
    fmMain.N211.Caption := dmDataModule.quTipNaklTipName.AsString;
  if dmDataModule.quTipNakl.Locate('TipNo', 2, []) then
    fmMain.N38.Caption := dmDataModule.quTipNaklTipName.AsString;
  dmDataModule.quTipNakl.Close;

  //***********Читаю функ-е клавиши************
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  for j := 0 to fmMain.mmMenu.Items.Count - 1 do
    for i := 0 to fmMain.mmMenu.Items[j].Count - 1 do
    begin
      fmMain.mmMenu.Items[j].Items[i].ShortCut := TextToShortCut(Ini.ReadString('Menu', fmMain.mmMenu.Items[j].Items[i].Name, ''));
    end;
  Ini.Free;

end;

procedure TfmMain.N30Click(Sender: TObject);
var
  i, j, k: integer;
  NewItem: TListItem;
  ShortCutStr: string;
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  with TfmHKey.Create(Self) do
  try
    for j := 0 to fmMain.mmMenu.Items.Count - 1 do
      for i := 0 to fmMain.mmMenu.Items[j].Count - 1 do
        if fmMain.mmMenu.Items[j].Items[i].Visible then
        begin
          NewItem := ListView1.Items.Add;
          NewItem.Caption := fmMain.mmMenu.Items[j].Items[i].Caption;
          ShortCutStr := ShortCutToText(fmMain.mmMenu.Items[j].Items[i].ShortCut);
          NewItem.SubItems.Add(ShortCutStr);
        end;
    ListView1.Items[0].Selected := True;
    if ShowModal = mrOk then
    begin
      k := 0;
      for j := 0 to fmMain.mmMenu.Items.Count - 1 do
        for i := 0 to fmMain.mmMenu.Items[j].Count - 1 do
          if fmMain.mmMenu.Items[j].Items[i].Visible then
          begin
            fmMain.mmMenu.Items[j].Items[i].ShortCut := TextToShortCut(ListView1.Items[k].SubItems[0]);
            Ini.WriteString('Menu', fmMain.mmMenu.Items[j].Items[i].Name, ListView1.Items[k].SubItems[0]);
            Inc(k);
          end;
    end;
  finally
    Free;
  end;
  Ini.Free;
end;

procedure TfmMain.N31Click(Sender: TObject);
begin
  RashodManyTov(False);
end;

procedure TfmMain.N32Click(Sender: TObject);
begin
  RashodManyTov(True);
end;

procedure TfmMain.N38Click(Sender: TObject);
begin
  OtchetKassa(2);
end;

procedure TfmMain.N210Click(Sender: TObject);
var
  params: TParams;
begin
  Params := TParams.Create;
  try
    UtilsCommon.SetParamValue(Params, 'p_date_beg', 'GlobalDateNakl - 1');
    TCFLMLKCustomRepDlg.ShowRep(25, Params);
  finally
    Params.Free;
  end;
end;

procedure TfmMain.N59Click(Sender: TObject);
begin
  Setup;
end;

procedure TfmMain.N34Click(Sender: TObject);
begin
  OtchetSotrud;
end;

procedure TfmMain.N35Click(Sender: TObject);
begin
  SotrudPlat;
end;

procedure TfmMain.N61Click(Sender: TObject);
begin
  dmDataModule.TestCash;
end;

procedure TfmMain.N70Click(Sender: TObject);
var
  l_Password, l_AliasName, l_ServerSource, l_AdoDataBase: string;
  l_Firma: Integer;
begin
  if TfmPassword.GetPassword(l_Password, l_AliasName, l_ServerSource, l_AdoDataBase, l_firma) then
    if 1 = 1 then
    begin
      ShowUsers;
    end;
end;

procedure TfmMain.N72Click(Sender: TObject);
begin
  dmDataModule.SetModeCash(1);
end;

procedure TfmMain.N73Click(Sender: TObject);
begin
  dmDataModule.SetModeCash(6);
end;

procedure TfmMain.N211Click(Sender: TObject);
begin
  OtchetKassa(3);
end;

procedure TfmMain.N40Click(Sender: TObject);
begin
  TMlekoListColumnsForm.ShowForm;
end;

procedure TfmMain.N310Click(Sender: TObject);
begin
  SotrudSalary3;
end;

procedure TfmMain.N47Click(Sender: TObject);
begin
  Zakupka;
end;

procedure TfmMain.N48Click(Sender: TObject);
begin
  Company(False, False);
end;

procedure TfmMain.N49Click(Sender: TObject);
var
  RetSelNakl: TRetSelNakl;
begin
  RetSelNakl.PostNo := 0;
  RetSelNakl.DateBegin := Date();
  RetSelNakl.DateEnd := Date();
  RetSelNakl.OtdelNo := '';
  RetSelNakl.Return := False;
  NaklP(RetSelNakl);
end;

procedure TfmMain.N50Click(Sender: TObject);
var
  RetSelNakl: TRetSelNakl;
begin
  RetSelNakl := SelectNakl('', False);
  RetSelNakl.Return := False;
  if RetSelNakl.PostNo <> -1 then
    NaklP(RetSelNakl);
end;

procedure TfmMain.NaklPCurClick(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelNakl: TRetSelNakl;
begin
  DecodeDate(Date(), Year, Month, Day);
  RetSelNakl.PostNo := 0;
  RetSelNakl.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelNakl.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelNakl.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  RetSelNakl.OtdelNo := '';
  RetSelNakl.Return := False;
  NaklP(RetSelNakl);
end;

procedure TfmMain.NaklPPrevClick(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelNakl: TRetSelNakl;
begin
  DecodeDate(Date(), Year, Month, Day);
  RetSelNakl.PostNo := 0;
  if Month = 1 then
  begin
    Year := Year - 1;
    Month := 12;
  end
  else
    Month := Month - 1;

  RetSelNakl.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelNakl.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelNakl.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  RetSelNakl.OtdelNo := '';
  RetSelNakl.Return := False;
  NaklP(RetSelNakl);

end;

procedure TfmMain.N52Click(Sender: TObject);
var
  RetSelNakl: TRetSelNakl;
begin
  RetSelNakl := SelectNakl('', True);
  RetSelNakl.Return := False;
  if RetSelNakl.PostNo <> -1 then
    NaklR0.NaklR(RetSelNakl);
end;

procedure TfmMain.N54Click(Sender: TObject);
var
  RetSelNakl: TRetSelNakl;
  i: string;
begin
  i := SelectOtdel;
  if i <> '' then
  begin
    RetSelNakl.PostNo := 0;
    RetSelNakl.DateBegin := Date();
    RetSelNakl.DateEnd := Date();
    RetSelNakl.OtdelNo := i;
    RetSelNakl.Return := False;
    NaklR0.NaklR(RetSelNakl);
  end;
end;

procedure TfmMain.NaklRCurClick(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelNakl: TRetSelNakl;
  i: string;
begin
  i := SelectOtdel;
  if i <> '' then
  begin
    DecodeDate(Date(), Year, Month, Day);
    RetSelNakl.PostNo := 0;
    RetSelNakl.DateBegin := EncodeDate(Year, Month, 01);
    if Month = 12 then
      RetSelNakl.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
    else
      RetSelNakl.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
    RetSelNakl.OtdelNo := i;
    RetSelNakl.Return := False;
    NaklR(RetSelNakl);
  end;
end;

procedure TfmMain.NaklRPrevClick(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelNakl: TRetSelNakl;
  i: string;
begin
  i := SelectOtdel;
  if i <> '' then
  begin
    DecodeDate(Date(), Year, Month, Day);
    RetSelNakl.PostNo := 0;
    if Month = 1 then
    begin
      Year := Year - 1;
      Month := 12;
    end
    else
      Month := Month - 1;

    RetSelNakl.DateBegin := EncodeDate(Year, Month, 01);
    if Month = 12 then
      RetSelNakl.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
    else
      RetSelNakl.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
    RetSelNakl.OtdelNo := i;
    RetSelNakl.Return := False;
    NaklR(RetSelNakl);
  end;
end;

procedure TfmMain.N14Click(Sender: TObject);
var
  RetSelPlat: TRetSelPlat;
begin
  { RetSelPlat.BuhTip:=SelectTip;
   if RetSelPlat.BuhTip='' then exit;}
  RetSelPlat.BuhTip := '(1,2,3)';
  RetSelPlat := SelectPlat;
  if RetSelPlat.PostNo <> -1 then
    OrdersPrih(RetSelPlat);
end;

procedure TfmMain.N13Click(Sender: TObject);
var
  RetSelPlat: TRetSelPlat;
begin
  RetSelPlat.BuhTip := SelectTip;
  if RetSelPlat.BuhTip = '' then
    exit;
  RetSelPlat.PostNo := 0;
  RetSelPlat.DateBegin := Date();
  RetSelPlat.DateEnd := Date();
  OrdersPrih(RetSelPlat);
end;

procedure TfmMain.OrderPrihCurClick(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelPlat: TRetSelPlat;
begin
  RetSelPlat.BuhTip := SelectTip;
  if RetSelPlat.BuhTip = '' then
    exit;
  DecodeDate(Date(), Year, Month, Day);
  RetSelPlat.PostNo := 0;
  RetSelPlat.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelPlat.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelPlat.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  OrdersPrih(RetSelPlat);
end;

procedure TfmMain.OrderPrihPrevClick(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelPlat: TRetSelPlat;
begin
  RetSelPlat.BuhTip := SelectTip;
  if RetSelPlat.BuhTip = '' then
    exit;
  DecodeDate(Date(), Year, Month, Day);
  RetSelPlat.PostNo := 0;
  if Month = 1 then
  begin
    Year := Year - 1;
    Month := 12;
  end
  else
    Month := Month - 1;

  RetSelPlat.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelPlat.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelPlat.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  OrdersPrih(RetSelPlat);
end;

procedure TfmMain.N55Click(Sender: TObject);
var
  RetSelPlat: TRetSelPlat;
begin
  RetSelPlat.BuhTip := SelectTip;
  if RetSelPlat.BuhTip = '' then
    exit;
  RetSelPlat.PostNo := 0;
  RetSelPlat.DateBegin := Date();
  RetSelPlat.DateEnd := Date();
  OrdersRash(RetSelPlat);
end;

procedure TfmMain.OrderRasCurr1Click(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelPlat: TRetSelPlat;
begin
  RetSelPlat.BuhTip := SelectTip;
  if RetSelPlat.BuhTip = '' then
    exit;
  DecodeDate(Date(), Year, Month, Day);
  RetSelPlat.PostNo := 0;
  RetSelPlat.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelPlat.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelPlat.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  OrdersRash(RetSelPlat);
end;

procedure TfmMain.OrderRasPrev1Click(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelPlat: TRetSelPlat;
begin
  RetSelPlat.BuhTip := SelectTip;
  if RetSelPlat.BuhTip = '' then
    exit;
  DecodeDate(Date(), Year, Month, Day);
  RetSelPlat.PostNo := 0;
  if Month = 1 then
  begin
    Year := Year - 1;
    Month := 12;
  end
  else
    Month := Month - 1;

  RetSelPlat.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelPlat.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelPlat.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  OrdersRash(RetSelPlat);
end;

procedure TfmMain.N56Click(Sender: TObject);
var
  RetSelPlat: TRetSelPlat;
begin
  { RetSelPlat.BuhTip:=SelectTip;
   if RetSelPlat.BuhTip='' then exit;}
  RetSelPlat.BuhTip := '(1,2,3)';
  RetSelPlat := SelectPlat;
  if RetSelPlat.PostNo <> -1 then
    OrdersRash(RetSelPlat);
end;

procedure TfmMain.N44Click(Sender: TObject);
var
  i: string;
begin
  i := SelectOtdel;
  if i <> '' then
    SaleGroupVid(i);
end;

procedure TfmMain.NS1Click(Sender: TObject);
begin
  ZPSotrudPercent;
  // SalarySotrudPercent;
  // SalarySotrudPercentNew;
end;

procedure TfmMain.N41Click(Sender: TObject);
begin
  Regions(False);
end;

procedure TfmMain.N64Click(Sender: TObject);
begin
  TopTovars;
end;

procedure TfmMain.N65Click(Sender: TObject);
begin
  BadTovars;
end;

procedure TfmMain.N66Click(Sender: TObject);
begin
  CloseReturn;
end;

procedure TfmMain.N67Click(Sender: TObject);
begin
  CrossPostNaklR;
end;

procedure TfmMain.N68Click(Sender: TObject);
begin
  CrossPostNaklP;
end;

procedure TfmMain.N29Click(Sender: TObject);
begin
  InpuntPlan;
end;

procedure TfmMain.N74Click(Sender: TObject);
begin
  FAccountCashRashod;
end;

procedure TfmMain.N75Click(Sender: TObject);
begin
  CrossReturne;
end;

procedure TfmMain.N76Click(Sender: TObject);
begin
  VidRashoda.VidRashod(False);
end;

procedure TfmMain.N77Click(Sender: TObject);
begin
  TipTovara(True);
end;

procedure TfmMain.N78Click(Sender: TObject);
begin
  PrintSaleSotrudTipTovar;
end;

procedure TfmMain.N79Click(Sender: TObject);
begin
  ExcelDanon;
end;

procedure TfmMain.N11111Click(Sender: TObject);
begin
  SotrudDolgPodotchet;
end;

procedure TfmMain.N83Click(Sender: TObject);
begin
  Cars(False, True, True);
end;

procedure TfmMain.N84Click(Sender: TObject);
begin
  Shipping_Agent(False, False);
end;

procedure TfmMain.N81Click(Sender: TObject);
var
  RetSelExpedition: TRetSelExpedition;
begin
  RetSelExpedition.CarsNo := 0;
  RetSelExpedition.Shipping_AgentNo := 0;
  RetSelExpedition.DateBegin := Date();
  RetSelExpedition.DateEnd := Date();
  Expedition(RetSelExpedition, True);
end;

procedure TfmMain.N85Click(Sender: TObject);
var
  RetSelExpedition: TRetSelExpedition;
begin
  RetSelExpedition.CarsNo := 0;
  RetSelExpedition.Shipping_AgentNo := 0;
  RetSelExpedition.DateBegin := Date + 1;
  RetSelExpedition.DateEnd := Date + 1;
  // RetSelExpedition:=SelExpedition;
  Expedition(RetSelExpedition, True);
  // NaklR0.NaklR(RetSelNakl);
end;

procedure TfmMain.N82Click(Sender: TObject);
var
  RetSelExpedition: TRetSelExpedition;
begin
  RetSelExpedition.CarsNo := 0;
  RetSelExpedition.Shipping_AgentNo := 0;
  RetSelExpedition.DateBegin := Date();
  RetSelExpedition.DateEnd := Date();
  RetSelExpedition := SelExpedition;
  if RetSelExpedition.CarsNo <> -1 then
    Expedition(RetSelExpedition, True);
end;

procedure TfmMain.ExpeditionCur1Click(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelExpedition: TRetSelExpedition;
begin
  DecodeDate(Date(), Year, Month, Day);
  RetSelExpedition.CarsNo := 0;
  RetSelExpedition.Shipping_AgentNo := 0;
  RetSelExpedition.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelExpedition.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelExpedition.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  Expedition(RetSelExpedition, True);
end;

procedure TfmMain.ExpeditionPrev1Click(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelExpedition: TRetSelExpedition;
begin
  DecodeDate(Date(), Year, Month, Day);
  RetSelExpedition.CarsNo := 0;
  RetSelExpedition.Shipping_AgentNo := 0;
  if Month = 1 then
  begin
    Year := Year - 1;
    Month := 12;
  end
  else
    Month := Month - 1;
  RetSelExpedition.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelExpedition.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelExpedition.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  Expedition(RetSelExpedition, True);
end;

procedure TfmMain.N86Click(Sender: TObject);
var
  VidTovTemp, VidTovNoTemp, VidTovNameTemp: string;
begin
  VidTovTemp := VidTov(True, True);
  if VidTovTemp <> '' then
  begin
    VidTovNoTemp := Copy(VidTovTemp, 1, Pos('~', VidTovTemp) - 1);
    VidTovNameTemp := Copy(VidTovTemp, Pos('~', VidTovTemp) + 1, Length(VidTovTemp));
    OtchetSale(VidTovNoTemp, VidTovNameTemp);
  end;
  // ExcelPresident;
end;

procedure TfmMain.Exell1Click(Sender: TObject);
begin
  ExcelTara;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  hPackHandle: HMODULE;
begin
  inherited;
  try
    if dmDataModule.db.Connected then
    begin
      dmDataModule.quWork.Close;
      dmDataModule.quWork.SQL.Clear;
      dmDataModule.quWork.SQL.Add('UPDATE Users ');
      dmDataModule.quWork.SQL.Append('SET FormWight = :FormWight, FormHeight = :FormHeight, FormLeft = :FormLeft, FormTop = :FormTop');
      dmDataModule.quWork.SQL.Append('WHERE (UserNo = :UserNo)');
      dmDataModule.quWork.ParamByName('FormWight').AsInteger := fmMain.Width;
      dmDataModule.quWork.ParamByName('FormHeight').AsInteger := fmMain.Height;
      dmDataModule.quWork.ParamByName('FormLeft').AsInteger := fmMain.Left;
      dmDataModule.quWork.ParamByName('FormTop').AsInteger := fmMain.Top;
      dmDataModule.quWork.ParamByName('UserNo').AsInteger := UserNo;
      dmDataModule.quWork.Execute;
    end;
  finally
    if dmDataModule.FiscPrinterConnect(False) then
    begin
      FiscPrinter.Done;
      FiscPrinter := UnAssigned;
    end;

    if Connect1C then
    begin
      onesobj := UnAssigned;
      Kontragent := UnAssigned;
      DenSchet := UnAssigned;
      TMC := UnAssigned;
      RashNakl := UnAssigned;
      PrihNakl := UnAssigned;
      RashNaklReturn := UnAssigned;
      PrihNaklReturn := UnAssigned;
      PKO := UnAssigned;
      Connect1C := False;
    end;
  end;
end;

procedure TfmMain.N92Click(Sender: TObject);
var
  RetSelectPodotchet: TRetSelectPodotchet;
begin
  RetSelectPodotchet.PostNo := 0;
  RetSelectPodotchet.SotrudNo := 0;
  RetSelectPodotchet.DateBegin := Date();
  RetSelectPodotchet.DateEnd := Date();
  //RetSelectPodotchet:=SelectPodotchet;
  PodotchetR(RetSelectPodotchet);
end;

procedure TfmMain.N93Click(Sender: TObject);
var
  RetSelectPodotchet: TRetSelectPodotchet;
begin
  RetSelectPodotchet.PostNo := 0;
  RetSelectPodotchet.SotrudNo := 0;
  RetSelectPodotchet.DateBegin := Date();
  RetSelectPodotchet.DateEnd := Date();
  RetSelectPodotchet := SelectPodotchet;
  if RetSelectPodotchet.SotrudNo <> -1 then
    PodotchetR(RetSelectPodotchet);

  { RetSelExpedition:=SelExpedition;
   if RetSelExpedition.CarsNo<>-1 then
    Expedition(RetSelExpedition);}
end;

procedure TfmMain.N96Click(Sender: TObject);
begin
  PrihodPodotchet(False);
end;

procedure TfmMain.N94Click(Sender: TObject);
begin
  CrossPostCompany(False);
end;

procedure TfmMain.N95Click(Sender: TObject);
begin
  CrossPostCompany(True);
end;

procedure TfmMain.N101Click(Sender: TObject);
var
  CurTime: TDateTime;
  CheckResultStr: string;
  TempStr, KolPrint, PricePrint: string;
  Divided, DelChar, Cycle: integer;

  // OldSeparator:Char;

  SummaCash, SummaOplat, KolOpl: double;
  PodotchetRNoNew: integer;
  Proba: integer;
begin

  Screen.Cursor := crHourGlass;
  //Установить приветствия на чеке
//          FiscPrinter.SetCheckHeadLine('ТОВ "Млеко" вул. Б.Чичибабіна,2-114А');//36
  FiscPrinter.SetCheckBottomLine('          "Дякуємо за покупку!"');
  //Установить режим рассчета наложенных налогов на сумму чека
  {Переключает режим расчета наложенных налогов
  (разница в способе округления). Если SaleTaxesOnTotal = 1
  (установка по умолчанию), то наложенные налоги исчисляются
  со всей суммы чека. Иначе (SaleTaxesOnTotal = 0) наложенные
  налоги начисляются на каждый товар в отдельности, а затем суммируются.}
  FiscPrinter.SetTaxesCalcMode(1);
  //Установить табличный режим печати чеков
  {Устанавливает/выключает режим табличного вывода при печати чека.
  ВОЗВРАЩАЕТ: 1 в случае успеха, 0 в случае неудачи.
  TableMode - 1 - установить табличный режим вывода информации в чеке,
  0 - выключить табличный режим.}
  FiscPrinter.SetTableMode(0);
  //Открыть чек
  {Открытие фискального чека.
  ВОЗВРАЩАЕТ: 1 в случае успеха, 0 в случае неудачи.
  Department - идентификатор отдела, не более 2-х символов длиной
  (для версии аппарата M301-MTM допустимая длина 15 символов).}
  FiscPrinter.SetReturnCheckNumber(177);
  if FiscPrinter.OpenReturnCheck('Опер. каса') = 1 then
  begin
    //                FiscPrinter.FreeTextLine(1, 1, 0, 'Накл. № '+IntToStr(quDolgNom.AsInteger)+
    //                                     ' от '+DateToStr(quDolgDateNakl.AsDateTime));
                    {Печать и запоминание свободной текстовой информации, которая
                    может печататься внутри чека (команда TEXT)
                    ВОЗВРАЩАЕТ: 1 в случае успеха, 0 в случае неудачи.
                    PlaceBeforFiscalPart - размещать данную строку до (1) или
                    после (0) фискальной части чека;
                    PrintOnJornal - копировать (1) или не копировать (0) данную
                    строку на контрольной ленте;
                    UseBoldStyle - печатать эту строку двойной (1) или обычной
                    (0) яркостью;
                    Text - до 18 символов текста (для версии принтера М301-МТМ
                    допускается длина строки в 36 символов)}

                        //ShowMessage(format('Кол=%.6f Цена=%.3f Осталось=%.6f',[KolOpl,quRashodPrice.AsFloat,SummaOplat]));
                        //OldSeparator:=SysUtils.DecimalSeparator;
                        //SysUtils.DecimalSeparator:='.';
                        //Вывести товарные строки на печать
                        {LONG FiscalLine([in] BSTR GoodName, [in] LONG Qty, [in] LONG Price,
                        [in] LONG GoodsDividual, [in] LONG Tax1Index, [in] LONG Tax2Index,
                        [in] LONG Article)
                        Печать очередной товарной строки
                        ВОЗВРАЩАЕТ: сумму по данной строке чека в случае успеха, 0 в случае
                        неудачи.
                        GoodName - наименование товара (до 12 символов). Для версии МТМ-T1
                        аппарата длина наименования товара ограничена 36 символами.
                        Для версии MTM-T3 и MTM-T4 длина наименования может составлять
                        43 символа;
                        Qty - количество товара: штуки, если Divided == 0 или граммы,
                        если Divided == 1;
                        Price - цена единицы товара, если Divided == 0 или цена килограмма
                        товара если Divided == 1;
                        GoodsDividual - признак делимости товара. Для неделимых товаров
                        имеет значение 0, и 1 - для делимых товаров;
                        Tax1Index, Tax2index - номера ставок налогов, которыми облагается
                        данный товар. принимают значения от 1 до 8, если товар облагается
                        данным налогом и 0, если не нужно облагать;
                        Article - номер артикула, 0, если нет необходимости учета по
                        артикулам. В версии принтера MTM T3-T4 учет по артикулам обязателен;

                        LONG FiscalLineEx([in] BSTR GoodName, [in] LONG Qty, [in] LONG Price,
                        [in] LONG GoodsDividual, [in] LONG Tax1Index, [in] LONG Tax2Index,
                        [in] LONG Article, [in] LONG DiscountDirection, [in] BSTR DiscountName,
                        [in] LONG)
                        Печать очередной товарной строки с возможностью учета по артикулам и
                        возможностью использования скидок/надбавок.
                        ВОЗВРАЩАЕТ: сумму по данной строке чека в случае успеха, 0 в случае
                        неудачи.
                        GoodName - наименование товара (до 12 символов). Для версии МТМ-T1
                        аппарата длина наименования товара ограничена 36 символами. Для
                        версии MTM-T3 и MTM-T4 длина наименования может составлять 43 символа;
                        Qty - количество товара: штуки, если Divided == 0 или граммы, если
                        Divided == 1;
                        Price - цена единицы товара, если Divided == 0 или цена килограмма
                        товара если Divided == 1;
                        GoodsDividual - признак делимости товара. Для неделимых товаров имеет
                        значение 0, и 1 - для делимых товаров;
                        Tax1Index, Tax2index - номера ставок налогов, которыми облагается
                        данный товар. принимают значения от 1 до 8, если товар облагается
                        данным налогом и 0, если не нужно облагать;
                        Article - номер артикула, 0, если нет необходимости учета по
                        артикулам. В версии принтера MTM T3-T4 учет по артикулам обязателен;
                        DiscountDirection - тип скидки надбавки: -1 - нет скидок/надбавок,
                        0 - скидка, 1 - надбавка;
                        DiscountName - название скидки/надбавки;
                        Discount - сумма скидки/надбавки (всегда положительная), 0 - если
                        скидка/надбавка не применяется;}
    //1
    Divided := 0;
    TempStr := FloatToStr(0.756);
    DelChar := 0;
    for Cycle := 1 to Length(TempStr) do
    begin
      if Pos(',', TempStr) > 0 then
        DelChar := Pos(',', TempStr);
    end;
    if DelChar = 0 then
    begin
      Divided := 0;
      KolPrint := TempStr;
    end
    else
    begin
      Divided := 1;
      case (Length(TempStr) - DelChar) of
        1:
          KolPrint := Copy(TempStr, 0, DelChar - 1) + Copy(TempStr, DelChar + 1, Length(TempStr)) + '00';
        2:
          KolPrint := Copy(TempStr, 0, DelChar - 1) + Copy(TempStr, DelChar + 1, Length(TempStr)) + '0';
      else
        KolPrint := Copy(TempStr, 0, DelChar - 1) + Copy(TempStr, DelChar + 1, Length(TempStr));
      end;
    end;
    TempStr := FloatToStr(RoundTo(17.45, -2));
    DelChar := 0;
    for Cycle := 1 to Length(TempStr) do
    begin
      if Pos(',', TempStr) > 0 then
        DelChar := Pos(',', TempStr);
    end;
    if DelChar = 0 then
      PricePrint := TempStr + '00'
    else
    begin
      case (Length(TempStr) - DelChar) of
        1:
          PricePrint := Copy(TempStr, 0, DelChar - 1) + Copy(TempStr, DelChar + 1, Length(TempStr)) + '0';
      else
        PricePrint := Copy(TempStr, 0, DelChar - 1) + Copy(TempStr, DelChar + 1, Length(TempStr));
      end;
    end;
    SummaCash := 0;
    SummaCash := 0.756 * 17.45;
    if SummaCash > 0.01 then
    begin
      MessageDlg('Товар: ' + 'КУРИНЫЕ КРЫЛЫШКИ' + ', Кол-во: ' + KolPrint + ', Цена: ' + PricePrint + ', Делимость: ' + IntToStr(Divided) + ' Сумма:' + FloatToStr(SummaCash), mtInformation, [mbOk], 0);
      if FiscPrinter.FiscalLine('КУРИНЫЕ КРЫЛЫШКИ', StrToInt(KolPrint), StrToInt(PricePrint), Divided, 1, 0, 101) <> 0 then
      begin

      end;
    end;
    //2
    Divided := 0;
    TempStr := FloatToStr(0.75);
    DelChar := 0;
    for Cycle := 1 to Length(TempStr) do
    begin
      if Pos(',', TempStr) > 0 then
        DelChar := Pos(',', TempStr);
    end;
    if DelChar = 0 then
    begin
      Divided := 0;
      KolPrint := TempStr;
    end
    else
    begin
      Divided := 1;
      case (Length(TempStr) - DelChar) of
        1:
          KolPrint := Copy(TempStr, 0, DelChar - 1) + Copy(TempStr, DelChar + 1, Length(TempStr)) + '00';
        2:
          KolPrint := Copy(TempStr, 0, DelChar - 1) + Copy(TempStr, DelChar + 1, Length(TempStr)) + '0';
      else
        KolPrint := Copy(TempStr, 0, DelChar - 1) + Copy(TempStr, DelChar + 1, Length(TempStr));
      end;
    end;
    TempStr := FloatToStr(RoundTo(22.58, -2));
    DelChar := 0;
    for Cycle := 1 to Length(TempStr) do
    begin
      if Pos(',', TempStr) > 0 then
        DelChar := Pos(',', TempStr);
    end;
    if DelChar = 0 then
      PricePrint := TempStr + '00'
    else
    begin
      case (Length(TempStr) - DelChar) of
        1:
          PricePrint := Copy(TempStr, 0, DelChar - 1) + Copy(TempStr, DelChar + 1, Length(TempStr)) + '0';
      else
        PricePrint := Copy(TempStr, 0, DelChar - 1) + Copy(TempStr, DelChar + 1, Length(TempStr));
      end;
    end;
    SummaCash := 0;
    SummaCash := 1.25 * 22.58;
    if SummaCash > 0.01 then
    begin
      MessageDlg('Товар: ' + 'КОЛБАСКА' + ', Кол-во: ' + KolPrint + ', Цена: ' + PricePrint + ', Делимость: ' + IntToStr(Divided) + ' Сумма:' + FloatToStr(SummaCash), mtInformation, [mbOk], 0);
      if FiscPrinter.FiscalLine('КОЛБАСКА', StrToInt(KolPrint), StrToInt(PricePrint), Divided, 1, 0, 102) <> 0 then
      begin

      end;
    end;
    //3
    Divided := 0;
    TempStr := FloatToStr(1);
    DelChar := 0;
    for Cycle := 1 to Length(TempStr) do
    begin
      if Pos(',', TempStr) > 0 then
        DelChar := Pos(',', TempStr);
    end;
    if DelChar = 0 then
    begin
      Divided := 0;
      KolPrint := TempStr;
    end
    else
    begin
      Divided := 1;
      case (Length(TempStr) - DelChar) of
        1:
          KolPrint := Copy(TempStr, 0, DelChar - 1) + Copy(TempStr, DelChar + 1, Length(TempStr)) + '00';
        2:
          KolPrint := Copy(TempStr, 0, DelChar - 1) + Copy(TempStr, DelChar + 1, Length(TempStr)) + '0';
      else
        KolPrint := Copy(TempStr, 0, DelChar - 1) + Copy(TempStr, DelChar + 1, Length(TempStr));
      end;
    end;
    TempStr := FloatToStr(RoundTo(0.25, -2));
    DelChar := 0;
    for Cycle := 1 to Length(TempStr) do
    begin
      if Pos(',', TempStr) > 0 then
        DelChar := Pos(',', TempStr);
    end;
    if DelChar = 0 then
      PricePrint := TempStr + '00'
    else
    begin
      case (Length(TempStr) - DelChar) of
        1:
          PricePrint := Copy(TempStr, 0, DelChar - 1) + Copy(TempStr, DelChar + 1, Length(TempStr)) + '0';
      else
        PricePrint := Copy(TempStr, 0, DelChar - 1) + Copy(TempStr, DelChar + 1, Length(TempStr));
      end;
    end;
    SummaCash := 0;
    SummaCash := 1 * 0.25;
    if SummaCash > 0.01 then
    begin
      MessageDlg('Товар: ' + 'ПАКЕТИК' + ', Кол-во: ' + KolPrint + ', Цена: ' + PricePrint + ', Делимость: ' + IntToStr(Divided) + ' Сумма:' + FloatToStr(SummaCash), mtInformation, [mbOk], 0);
      if FiscPrinter.FiscalLine('ПАКЕТИК', StrToInt(KolPrint), StrToInt(PricePrint), Divided, 1, 0, 99) <> 0 then
      begin

        //
      end;
    end;
    //

    //                 end;

                    //Закрыть чек
                    {Закрытие фискального чека.
                    ВОЗВРАЩАЕТ: Сумму по чеку в случае успеха, 0 в случае неудачи.
                    CheckSum (результат) - Сумма наличности по чеку с учетом наложенных
                    налогов. Сумма может быть отрицательной в случае, если сумма возврата
                    по чеку превышает сумму продажи по чеку. Печатает чек, самостоятельно
                    рассчитывая сумму наличности. Весь чек идет как наличная оплата;}

    if FiscPrinter.CloseCheck = 0 then
      MessageDlg('Ошибка закрытия чека!!!', mtInformation, [mbOk], 0);

  end;

  //           MessageDlg('Не удается открыть чек', mtInformation,[mbOk], 0);
            //Освободить принтер для других приложений
  FiscPrinter.UnlockPrinter;
end;

procedure TfmMain.N112Click(Sender: TObject);
begin
  SaleCompanyPeriod;
end;

procedure TfmMain.N212Click(Sender: TObject);
begin
  SaleCompanyPeriodExcel;
end;

procedure TfmMain.N1111Click(Sender: TObject);
begin
  SaleCustomersPeriodExcel;
end;

procedure TfmMain.Excel2Click(Sender: TObject);
begin
  SaleCustomersPeriodExcel;
end;

procedure TfmMain.N103Click(Sender: TObject);
begin
  SaleCustomersPeriod;
end;

procedure TfmMain.N113Click(Sender: TObject);
begin
  OthetBuh_1;
end;

procedure TfmMain.N105Click(Sender: TObject);
begin
  SaleSotrud;
end;

procedure TfmMain.Excel3Click(Sender: TObject);
begin
  SaleSotrudExcel;
end;

procedure TfmMain.N106Click(Sender: TObject);
begin
//  Tovar(False, True, 3);
end;

procedure TfmMain.N107Click(Sender: TObject);
var
  i: integer;
  Pkey: Int64;
begin
  Pkey := -1;
  PrihodTovar(3, Pkey);
end;

procedure TfmMain.N108Click(Sender: TObject);
var
  Pkey: Int64;
begin
  TfmEditNaklR.EditNaklR(Pkey, 'ADD', false, True);
end;

procedure TfmMain.N120Click(Sender: TObject);
var
  RetSelNakl: TRetSelNakl;
begin
  RetSelNakl.PostNo := 0;
  RetSelNakl.DateBegin := Date();
  RetSelNakl.DateEnd := Date();
  RetSelNakl.OtdelNo := '(3)';
  RetSelNakl.Return := False;
  NaklR0.NaklR(RetSelNakl);
end;

procedure TfmMain.NaklRCur1Click(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelNakl: TRetSelNakl;
begin
  DecodeDate(Date(), Year, Month, Day);
  RetSelNakl.PostNo := 0;
  RetSelNakl.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelNakl.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelNakl.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  RetSelNakl.OtdelNo := '(3)';
  RetSelNakl.Return := False;
  NaklR(RetSelNakl);
end;

procedure TfmMain.NaklRPrev1Click(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelNakl: TRetSelNakl;
begin
  DecodeDate(Date(), Year, Month, Day);
  RetSelNakl.PostNo := 0;
  if Month = 1 then
  begin
    Year := Year - 1;
    Month := 12;
  end
  else
    Month := Month - 1;

  RetSelNakl.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelNakl.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelNakl.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  RetSelNakl.OtdelNo := '(3)';
  RetSelNakl.Return := False;
  NaklR(RetSelNakl);
end;

procedure TfmMain.N121Click(Sender: TObject);
var
  RetSelNakl: TRetSelNakl;
begin
  RetSelNakl := SelectNakl('-1', False);
  RetSelNakl.Return := False;
  if RetSelNakl.PostNo <> -1 then
    NaklR0.NaklR(RetSelNakl);
end;

procedure TfmMain.N118Click(Sender: TObject);
var
  RetSelNakl: TRetSelNakl;
begin
  RetSelNakl.PostNo := 0;
  RetSelNakl.DateBegin := Date();
  RetSelNakl.DateEnd := Date();
  RetSelNakl.OtdelNo := '(3)';
  RetSelNakl.Return := False;
  NaklP(RetSelNakl);
end;

procedure TfmMain.NaklPCur1Click(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelNakl: TRetSelNakl;
begin
  DecodeDate(Date(), Year, Month, Day);
  RetSelNakl.PostNo := 0;
  RetSelNakl.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelNakl.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelNakl.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  RetSelNakl.OtdelNo := '(3)';
  RetSelNakl.Return := False;
  NaklP(RetSelNakl);
end;

procedure TfmMain.NaklPPrev1Click(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelNakl: TRetSelNakl;
begin
  DecodeDate(Date(), Year, Month, Day);
  RetSelNakl.PostNo := 0;
  if Month = 1 then
  begin
    Year := Year - 1;
    Month := 12;
  end
  else
    Month := Month - 1;

  RetSelNakl.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelNakl.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelNakl.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  RetSelNakl.OtdelNo := '(3)';
  RetSelNakl.Return := False;
  NaklP(RetSelNakl);

end;

procedure TfmMain.N119Click(Sender: TObject);
var
  RetSelNakl: TRetSelNakl;
begin
  RetSelNakl := SelectNakl('-1', False);
  RetSelNakl.Return := False;
  if RetSelNakl.PostNo <> -1 then
    NaklP(RetSelNakl);
end;

procedure TfmMain.N125Click(Sender: TObject);
begin
  // DolgSotrud;
  SotrudDolgNew(True);
end;

procedure TfmMain.Excel4Click(Sender: TObject);
begin
  DolgSotrudExcel;
end;

procedure TfmMain.N128Click(Sender: TObject);
var
  RetSelNakl: TRetSelNakl;
begin
  RetSelNakl.PostNo := 0;
  RetSelNakl.DateBegin := Date();
  RetSelNakl.DateEnd := Date();
  RetSelNakl.OtdelNo := '(1,2)';
  RetSelNakl.Return := True;
  NaklR0.NaklR(RetSelNakl);
end;

procedure TfmMain.NaklRetCurClick(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelNakl: TRetSelNakl;
  i: string;
begin
  DecodeDate(Date(), Year, Month, Day);
  RetSelNakl.PostNo := 0;
  RetSelNakl.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelNakl.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelNakl.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  RetSelNakl.OtdelNo := '';
  RetSelNakl.Return := True;
  NaklR(RetSelNakl);
end;

procedure TfmMain.NaklRetPrevClick(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelNakl: TRetSelNakl;
  i: string;
begin
  DecodeDate(Date(), Year, Month, Day);
  RetSelNakl.PostNo := 0;
  if Month = 1 then
  begin
    Year := Year - 1;
    Month := 12;
  end
  else
    Month := Month - 1;
  RetSelNakl.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelNakl.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelNakl.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  RetSelNakl.OtdelNo := '';
  RetSelNakl.Return := True;
  NaklR(RetSelNakl);
end;

procedure TfmMain.N129Click(Sender: TObject);
var
  RetSelNakl: TRetSelNakl;
begin
  RetSelNakl := SelectNakl('', True);
  RetSelNakl.Return := True;
  if RetSelNakl.PostNo <> -1 then
    NaklR0.NaklR(RetSelNakl);
end;

procedure TfmMain.N126Click(Sender: TObject);
var
  Pkey: Int64;
begin
  TfmEditNaklR.EditNaklR(Pkey, 'ADD', true, false);
end;

procedure TfmMain.N130Click(Sender: TObject);
begin
  TMlekoListPriceForm.ShowForm(False);
end;

procedure TfmMain.N132Click(Sender: TObject);
begin
  TMlekoListAdrInfoPayBanForm.ShowForm(False);
end;

procedure TfmMain.N138Click(Sender: TObject);
begin
  NaklNotSvedenie;
  // N138.Checked:=True;
  // N139.Checked:=False;
end;

procedure TfmMain.N134Click(Sender: TObject);
var
  RetSelExpedition: TRetSelExpedition;
begin
  RetSelExpedition.CarsNo := 0;
  RetSelExpedition.Shipping_AgentNo := 0;
  RetSelExpedition.DateBegin := Date();
  RetSelExpedition.DateEnd := Date();
  Expedition(RetSelExpedition, False);
end;

procedure TfmMain.N140Click(Sender: TObject);
begin
  ShowEmployee;
end;

procedure TfmMain.N135Click(Sender: TObject);
begin
  SvedenieNaklNotCar;
end;

procedure TfmMain.N142Click(Sender: TObject);
begin
  BlockDate;
end;

procedure TfmMain.N136Click(Sender: TObject);
begin
  NaklChange(Date());
end;

procedure TfmMain.N137Click(Sender: TObject);
begin
  TfmTovarSvedenie.TovarSvedenie(Date());
end;

procedure TfmMain.Z1Click(Sender: TObject);
begin
  if MessageDlg('Вы уверены что хотите распечатать Z-Отчет?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if dmDataModule.FiscPrinterConnect(True) then
    begin
           {Получение информации о текущем положении ключа на принтере.
            ВОЗВРАЩАЕТ: Положение ключа в случае успеха или -1 в случае неудачи.
           GetPrinterKeyPosition принимает следующие значения:
           0 -  "ОТКЛЮЧЕН" (О);
            1 - "РАБОТА" (Р);
             2 - "X- ОТЧЕТ" (X);
               3 - "Z-ОТЧЕТ" (Z);
                4 - "ПРОГРАММИРОВАНИЕ" (П).}


        //*******************************************************************************************
      if GlobalOurFirmNo = 490 then
      begin

        if FiscPrinter.GetPrinterKeyPosition = 3 then
        begin

             //Захватить доступ к принтеру
          if FiscPrinter.LockPrinter(3000) = 1 then
          begin
							//       FiscPrinter.SetCheckHeadLine('ТОВ "Млеко" вул. Б.Чичибабіна,2-114А');//36
            FiscPrinter.SetCheckBottomLine('          "Дякуємо за покупку!"');
            FiscPrinter.ZReport;
            FiscPrinter.UnlockPrinter;
            dmDataModule.quWork.Close;
            dmDataModule.quWork.SQL.Clear;
            dmDataModule.quWork.SQL.Add('DELETE FROM Articles');
            try
              dmDataModule.quWork.Execute;
            except
              MessageDlg('Ошибка в очистки артиклей!!!', mtInformation, [mbOk], 0);
            end;
              //       FiscPrinter.OpenCashBox;
          end
          else
            MessageDlg('Фискальный принтер занят другим приложением. Попоробуйте позже', mtInformation, [mbOk], 0);
        end
        else
          MessageDlg('Переведите ключ в положение "Z-ОТЧЕТ" (Z)', mtInformation, [mbOk], 0);
      end;
         
        //*******************************************************************************************


        //*******************************************************************************************
      if GlobalOurFirmNo = 7419 then
      begin

             //Захватить доступ к принтеру
        if FiscPrinter.LockPrinter(3000) = 1 then
        begin
							//       FiscPrinter.SetCheckHeadLine('ТОВ "Млеко" вул. Б.Чичибабіна,2-114А');//36
          FiscPrinter.SetCheckBottomLine('          "Дякуємо за покупку!"');
          FiscPrinter.ZReport;
          FiscPrinter.UnlockPrinter;
          dmDataModule.quWork.Close;
          dmDataModule.quWork.SQL.Clear;
          dmDataModule.quWork.SQL.Add('DELETE FROM Articles');
          try
            dmDataModule.quWork.Execute;
          except
            MessageDlg('Ошибка в очистки артиклей!!!', mtInformation, [mbOk], 0);
          end;
              //       FiscPrinter.OpenCashBox;
        end
        else
          MessageDlg('Фискальный принтер занят другим приложением. Попоробуйте позже', mtInformation, [mbOk], 0);
      end
    end
 
 //*******************************************************************************************
    else
      MessageDlg('Фискальный принтер не подключен!', mtInformation, [mbOk], 0);
  end;
end;

procedure TfmMain.X1Click(Sender: TObject);
begin
  if MessageDlg('Вы уверены что хотите распечатать X-Отчет?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if dmDataModule.FiscPrinterConnect(True) then
    begin
 			  
			  
			  
 //***************************************************************************************************************

      if GlobalOurFirmNo = 490 then
      begin
        if FiscPrinter.GetPrinterKeyPosition = 2 then
        begin
						        //Захватить доступ к принтеру
          if FiscPrinter.LockPrinter(3000) = 1 then
          begin
								        	  //       FiscPrinter.SetCheckHeadLine('ТОВ "Млеко" вул. Б.Чичибабіна,2-114А');//36
            FiscPrinter.SetCheckBottomLine('          "Дякуємо за покупку!"');
            FiscPrinter.XReport;
            FiscPrinter.UnlockPrinter;
								          	//       FiscPrinter.OpenCashBox;
          end
          else
            MessageDlg('Фискальный принтер занят другим приложением. Попоробуйте позже', mtInformation, [mbOk], 0);
        end
        else
          MessageDlg('Переведите ключ в положение "X-ОТЧЕТ" (X)', mtInformation, [mbOk], 0);
      end;
			  
          //*****************************************************************************************************

			  //*******************************************************************************************************

      if GlobalOurFirmNo = 7419 then
      begin

			          	//Захватить доступ к принтеру
        if FiscPrinter.LockPrinter(3000) = 1 then
        begin
					               	//       FiscPrinter.SetCheckHeadLine('ТОВ "Млеко" вул. Б.Чичибабіна,2-114А');//36
          FiscPrinter.SetCheckBottomLine('          "Дякуємо за покупку!"');
          FiscPrinter.XReport;
          FiscPrinter.UnlockPrinter;
					            	//       FiscPrinter.OpenCashBox;
        end
        else
          MessageDlg('Фискальный принтер занят другим приложением. Попоробуйте позже', mtInformation, [mbOk], 0);
      end
    end

			//***************************************************************************************

    else
      MessageDlg('Фискальный принтер не подключен!', mtInformation, [mbOk], 0);

  end

end;

procedure TfmMain.N144Click(Sender: TObject);
var
  SummCash: string;
begin
  if dmDataModule.FiscPrinterConnect(True) then
  begin
    {Получение информации о текущем положении ключа на принтере.
    ВОЗВРАЩАЕТ: Положение ключа в случае успеха или -1 в случае неудачи.
    GetPrinterKeyPosition принимает следующие значения:
    0 -  "ОТКЛЮЧЕН" (О);
    1 - "РАБОТА" (Р);
    2 - "X- ОТЧЕТ" (X);
    3 - "Z-ОТЧЕТ" (Z);
    4 - "ПРОГРАММИРОВАНИЕ" (П).}

        //*****************************************************************************************************

    if GlobalOurFirmNo = 490 then
    begin

      if FiscPrinter.GetPrinterKeyPosition = 1 then
      begin
           //Захватить доступ к принтеру
        if FiscPrinter.LockPrinter(3000) = 1 then
        begin
               //     FiscPrinter.SetCheckHeadLine('ТОВ "Млеко" вул. Б.Чичибабіна,2-114А');//36
          FiscPrinter.SetCheckBottomLine('          "Дякуємо за покупку!"');
          SummCash := '';
          SummCash := InOutCash('Внесение наличности:');
          if SummCash <> '' then
            FiscPrinter.MoveCash(1, SummCash);
          FiscPrinter.UnlockPrinter;
          if PrinterOpenCashBox then
            FiscPrinter.OpenCashBox;
        end
        else
          MessageDlg('Фискальный принтер занят другим приложением. Попоробуйте позже', mtInformation, [mbOk], 0);

      end
      else
        MessageDlg('Переведите ключ в положение "РАБОТА" (Р)', mtInformation, [mbOk], 0);
    end;

   //******************************************************************************************************************

   //******************************************************************************************************************
    if GlobalOurFirmNo = 7419 then
    begin

            //Захватить доступ к принтеру
      if FiscPrinter.LockPrinter(3000) = 1 then
      begin
        //     FiscPrinter.SetCheckHeadLine('ТОВ "Млеко" вул. Б.Чичибабіна,2-114А');//36
        FiscPrinter.SetCheckBottomLine('          "Дякуємо за покупку!"');
        SummCash := '';
        SummCash := InOutCash('Внесение наличности:');
        if SummCash <> '' then
          FiscPrinter.MoveCash(1, SummCash);
        FiscPrinter.UnlockPrinter;
        if PrinterOpenCashBox then
          FiscPrinter.OpenCashBox;
      end
      else
        MessageDlg('Фискальный принтер занят другим приложением. Попоробуйте позже', mtInformation, [mbOk], 0);

    end

   //****************************************************************************************************************

  end
  else
    MessageDlg('Фискальный принтер не подключен!', mtInformation, [mbOk], 0);

end;

procedure TfmMain.N145Click(Sender: TObject);
var
  SummCash: string;
begin
  if dmDataModule.FiscPrinterConnect(True) then
  begin
    {Получение информации о текущем положении ключа на принтере.
    ВОЗВРАЩАЕТ: Положение ключа в случае успеха или -1 в случае неудачи.
    GetPrinterKeyPosition принимает следующие значения:
    0 -  "ОТКЛЮЧЕН" (О);
    1 - "РАБОТА" (Р);
    2 - "X- ОТЧЕТ" (X);
    3 - "Z-ОТЧЕТ" (Z);
    4 - "ПРОГРАММИРОВАНИЕ" (П).}

 //*****************************************************************************************************

    if GlobalOurFirmNo = 490 then
    begin

      if FiscPrinter.GetPrinterKeyPosition = 1 then
      begin
            //Захватить доступ к принтеру
        if FiscPrinter.LockPrinter(3000) = 1 then
        begin
                   //       FiscPrinter.SetCheckHeadLine('ТОВ "Млеко" вул. Б.Чичибабіна,2-114А');//36
          FiscPrinter.SetCheckBottomLine('          "Дякуємо за покупку!"');
          SummCash := '';
          SummCash := InOutCash('Выдача наличности:');
          if SummCash <> '' then
            FiscPrinter.MoveCash(0, SummCash);
          FiscPrinter.UnlockPrinter;
          if PrinterOpenCashBox then
            FiscPrinter.OpenCashBox;
        end
        else
          MessageDlg('Фискальный принтер занят другим приложением. Попоробуйте позже', mtInformation, [mbOk], 0);
      end
      else
        MessageDlg('Переведите ключ в положение "РАБОТА" (Р)', mtInformation, [mbOk], 0);

    end;



//*****************************************************************************************************

//*****************************************************************************************************
    if GlobalOurFirmNo = 7419 then
    begin
               //Захватить доступ к принтеру
      if FiscPrinter.LockPrinter(3000) = 1 then
      begin
                  //       FiscPrinter.SetCheckHeadLine('ТОВ "Млеко" вул. Б.Чичибабіна,2-114А');//36
        FiscPrinter.SetCheckBottomLine('          "Дякуємо за покупку!"');
        SummCash := '';
        SummCash := InOutCash('Выдача наличности:');
        if SummCash <> '' then
          FiscPrinter.MoveCash(0, SummCash);
        FiscPrinter.UnlockPrinter;
        if PrinterOpenCashBox then
          FiscPrinter.OpenCashBox;
      end
      else
        MessageDlg('Фискальный принтер занят другим приложением. Попоробуйте позже', mtInformation, [mbOk], 0);
    end
  end

 //**********************************************************************************************************
  else
    MessageDlg('Фискальный принтер не подключен!', mtInformation, [mbOk], 0);
end;

procedure TfmMain.N146Click(Sender: TObject);
begin
  if MessageDlg('Вы уверены что хотите распечатать нулевые чеки?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if dmDataModule.FiscPrinterConnect(True) then
    begin
      {Получение информации о текущем положении ключа на принтере.
      ВОЗВРАЩАЕТ: Положение ключа в случае успеха или -1 в случае неудачи.
      GetPrinterKeyPosition принимает следующие значения:
      0 -  "ОТКЛЮЧЕН" (О);
      1 - "РАБОТА" (Р);
      2 - "X- ОТЧЕТ" (X);
      3 - "Z-ОТЧЕТ" (Z);
      4 - "ПРОГРАММИРОВАНИЕ" (П).}

//*************************************************************************************************************
      if GlobalOurFirmNo = 490 then
      begin
        if FiscPrinter.GetPrinterKeyPosition = 1 then
        begin
                    //Захватить доступ к принтеру
          if FiscPrinter.LockPrinter(3000) = 1 then
          begin
                             //       FiscPrinter.SetCheckHeadLine('ТОВ "Млеко" вул. Б.Чичибабіна,2-114А');//36
            FiscPrinter.SetCheckBottomLine('          "Дякуємо за покупку!"');
            FiscPrinter.CutAndBeep(0, 1);
                              {Включает или отключает авто обрезку и/или звуковой
                              сигнал в конце каждого чека. Примечание: Эта функция
                              работает только с ЭККА Мария-М301 МТМ.
                              ВОЗВРАЩАЕТ: 1 в случае успеха, 0 в случае неудачи.
                            CutterOn - включение(1)/выключение(0) авто обрезки
                            бумаги в конце каждого чека.
                            BeepOn - включение(1)/выключение(0) звукового
                            сигнала в конце каждого чека.}
            FiscPrinter.NullCheck;
            FiscPrinter.NullCheck;
            FiscPrinter.NullCheck;
            FiscPrinter.CutAndBeep(1, 1);
            FiscPrinter.UnlockPrinter;
                              //       FiscPrinter.OpenCashBox;
          end
          else
            MessageDlg('Фискальный принтер занят другим приложением. Попоробуйте позже', mtInformation, [mbOk], 0);
        end
        else
          MessageDlg('Переведите ключ в положение "РАБОТА" (Р)', mtInformation, [mbOk], 0);

      end;


 //****************************************************************************************************************************

 //***************************************************************************************************************************


      if GlobalOurFirmNo = 7419 then
      begin
              //Захватить доступ к принтеру
        if FiscPrinter.LockPrinter(3000) = 1 then
        begin
                      //       FiscPrinter.SetCheckHeadLine('ТОВ "Млеко" вул. Б.Чичибабіна,2-114А');//36
          FiscPrinter.SetCheckBottomLine('          "Дякуємо за покупку!"');
          FiscPrinter.CutAndBeep(1, 1, 1);
                      {Включает или отключает авто обрезку и/или звуковой
                        сигнал в конце каждого чека. Примечание: Эта функция
                        работает только с ЭККА Мария-М301 МТМ.
                        ВОЗВРАЩАЕТ: 1 в случае успеха, 0 в случае неудачи.
                        CutterOn - включение(1)/выключение(0) авто обрезки
                        бумаги в конце каждого чека.
                        BeepOn - включение(1)/выключение(0) звукового
                        сигнала в конце каждого чека.}
          FiscPrinter.NullCheck;
          FiscPrinter.NullCheck;
          FiscPrinter.NullCheck;
          FiscPrinter.CutAndBeep(1, 1);
          FiscPrinter.UnlockPrinter;
                        //       FiscPrinter.OpenCashBox;
        end
        else
          MessageDlg('Фискальный принтер занят другим приложением. Попоробуйте позже', mtInformation, [mbOk], 0);
      end
    end

    //*******************************************************************************************************************************


    else
      MessageDlg('Фискальный принтер не подключен!', mtInformation, [mbOk], 0);
  end
end;

procedure TfmMain.N147Click(Sender: TObject);
begin
  if dmDataModule.FiscPrinterConnect(False) then
  begin
    FiscPrinter.Done;
    FiscPrinter := UnAssigned;
  end;
  fmMain.N147.Checked := True;
  fmMain.N148.Checked := False;
  dmDataModule.quWork.Close;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('UPDATE Setup SET PrinterCash = 0');
  dmDataModule.quWork.Execute;
end;

procedure TfmMain.N148Click(Sender: TObject);
var
  Ini: TIniFile;
  Port: Integer;
begin
  //Подключение фискального принтера
  if dmDataModule.FiscPrinterConnect(True) then
  begin
    fmMain.N147.Checked := False;
    fmMain.N148.Checked := True;
    dmDataModule.quWork.Close;
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('UPDATE Setup SET PrinterCash = 1');
    dmDataModule.quWork.Execute;
  end;
end;

procedure TfmMain.N1C1Click(Sender: TObject);
var
  Period: TPeriodDate;
begin
  Screen.Cursor := crHourGlass;
  dmDataModule.OpenSQL('select * from d_our_firm where PostNo= ' + IntToStr(dmDataModule.FirmNo));
  Path1C := dmDataModule.QFO.FIeldByName('Path1C').AsString;
  Server1C := dmDataModule.QFO.FIeldByName('Server1C').AsString;
  DataBase1C := dmDataModule.QFO.FIeldByName('DataBase1C').AsString;
  Connect1C := True;

  if Length(Path1C) = 0 then
  begin
    ShowMessage('Нет строки подключения');
    exit;
  end;

  {
  ShowMessage(Path1C);
  ShowMessage(Server1C);
  ShowMessage(DataBase1C);
   }
  dmDataModule.ADOConnection1C.Connected := False;
 { dmDataModule.ADOConnection1C.Server := dmDataModule.QFO.FIeldByName('Server1C').AsString;
  dmDataModule.ADOConnection1C.Database := dmDataModule.QFO.FIeldByName('DataBase1C').AsString;}
  dmDataModule.ADOConnection1C.Server := Server1C;
  dmDataModule.ADOConnection1C.Database := DataBase1C;

  User1C := 'Александр';
  Pass1C := '104';
  {
  ShowMessage(User1C);
  ShowMessage(Pass1C);
   }
  dmDataModule.ADOConnection1C.Connected := true;

  onesobj := createoleobject('V77S.Application');
  onesobj.initialize(onesobj.rmtrade, '/D' + Path1C + ' /N' + User1C + ' /P' + Pass1C, 'NO_SPLASH_SHOW');

//  ShowMessage(onesobj.initialize(onesobj.rmtrade, '/D' + Path1C + ' /N' + User1C + ' /P' + Pass1C, 'NO_SPLASH_SHOW'));

  Kontragent := onesobj.createobject('Справочник.Контрагенты');
  DenSchet := onesobj.createobject('Справочник.ДенежныеСчета');
  TMC := onesobj.createobject('Справочник.ТМЦ');
  RashNakl := onesobj.createobject('Документ.РасходнаяНакладная');
  PrihNakl := onesobj.createobject('Документ.ПриходнаяНакладная');
  RashNaklReturn := onesobj.createobject('Документ.ВозвратнаяНакладная');
  PrihNaklReturn := onesobj.createobject('Документ.ВозвратПоставщику');
  PKO := onesobj.createobject('Документ.ПриходныйКассовый');
  try
    TfmExport1C.Export1C;
  finally
    onesobj := UnAssigned;
    Kontragent := UnAssigned;
    DenSchet := UnAssigned;
    TMC := UnAssigned;
    RashNakl := UnAssigned;
    PrihNakl := UnAssigned;
    RashNaklReturn := UnAssigned;
    PrihNaklReturn := UnAssigned;
    PKO := UnAssigned;
    dmDataModule.ADOConnection1C.Connected := False;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmMain.N150Click(Sender: TObject);
var
  RetSelExpedition: TRetSelExpedition;
begin
  RetSelExpedition.CarsNo := 0;
  RetSelExpedition.Shipping_AgentNo := 0;
  RetSelExpedition.DateBegin := Date();
  RetSelExpedition.DateEnd := Date();
  RetSelExpedition := SelExpedition;
  if RetSelExpedition.CarsNo <> -1 then
    Expedition(RetSelExpedition, False);
end;

{
procedure TfmMain.AnalisReturnOrderClick(Sender: TObject);
var
  Period: TPeriodDate;
begin
  Period := ZapDate(1);
  if Period[1] <> 0 then
    TfmTovarSvedenie.TovarSvedenie(Period[1]);
end;
}
procedure TfmMain.Excel5Click(Sender: TObject);
begin
  CrossPostCompanyExcel(False);
end;

procedure TfmMain.Excel6Click(Sender: TObject);
begin
  CrossPostCompanyExcel(True);
end;

procedure TfmMain.N97Click(Sender: TObject);
begin
  if dmDataModule.FiscPrinterConnect(True) then
  begin
    if FiscPrinter.LockPrinter(3000) = 1 then
      FiscPrinter.OpenCashBox;
  end
  else
    MessageDlg('Фискальный принтер не подключен!', mtInformation, [mbOk], 0);
end;

procedure TfmMain.N102Click(Sender: TObject);
var
  Period: TPeriodDate;
begin

//*****************************************************************************************************************************
  if dmDataModule.FiscPrinterConnect(True) then
  begin
    Period := ZapDate(3);
    if (Period[1] = 0) or (Period[2] = 0) then
      exit;
    FiscPrinter.PeriodicalFiscalReportDate(DateToStr(Period[1]), DateToStr(Period[2]));
  end
  else
    MessageDlg('Фискальный принтер не подключен!', mtInformation, [mbOk], 0);
   //**************************************************************************************************************************
end;

procedure TfmMain.N178Click(Sender: TObject);
var
  RetSelRas: TRetSelRas;
begin
  RetSelRas := SelectRas;
  // if RetSelRas.PostNo<>-1 then  NaklR0.NaklR(RetSelNakl);
end;

procedure TfmMain.N115Click(Sender: TObject);
begin
  ShowOstatki(3);
end;

procedure TfmMain.N182Click(Sender: TObject);
var
  l_str: string;
  ld_date: Tdate;
begin
  l_str := 'Сегодня суббота! Вы хотите делать вывоз на воскресенье(Да) или понедельник(Нет)?';
  ld_date := GlobalDateNakl;
  if main.day_of_week = 1 then
    if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then
      ld_date := GlobalDateNakl
    else
      ld_date := GlobalDateNakl + 1;
  TMlekoBlankListForm.ShowListForm(GlobalOtdelNo, ld_date);
end;

procedure TfmMain.N186Click(Sender: TObject);
begin
  TMlekoSelectDayDeptDlg.SelectDayDept;
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('Select OtdelName from VidOtdel where OtdelNo=' + IntToStr(GlobalOtdelNo));
  dmDataModule.quWork.Open;
{
  fmMain.StatusBar.Panels[3].Text := 'Подразделение: ' + dmDataModule.quWork.FieldByName('OtdelName').AsString;
  fmMain.StatusBar.Panels[2].Text := 'Рабочая дата: ' + DateToStr(GlobalDateNakl);
}
end;

procedure TfmMain.N124Click(Sender: TObject);
begin
  inherited;
  begin
    with TfmNaklRPost.Create(Application) do
    try
      dtDateBeg.Date := GlobalDateNakl - 1;
      dtDateEnd.Date := GlobalDateNakl;
      quFilterPost.Open;

      quNaklRpostExport.ParamByName('date1').Value := GlobalDateNakl - 1;
      quNaklRpostExport.ParamByName('date2').Value := GlobalDateNakl;

      quNaklRpostExport.Open;
      if quNaklRpostExport.RecordCount = 0 then
        raise Exception.Create('Нет записи в запросе! Сообщите программисту!!!' + #10#13 + quNaklRpostExport.SQL.Text);
      ShowModal;
    finally
//    quFilterPost.Close;
      quNaklRpostExport.Close;

      Free;
    end;
  end;
end;

procedure TfmMain.N187Click(Sender: TObject);
var
  ID: integer;
  lv_key, lv_txt: string;
  Params: TParams;
  SERVER_TYPE: string;
  l_str: string;
begin
  inherited;
  Meko_Blanc_Price.BLANC_PRICE.Y_N_Label.Caption := '';
  MlekoBlkParamPrivyazka.NaborAddTovar.Label1.Caption := '';
  if TCFLMLKSelectDlg.OpenHoldSelect('main_form', 'select_report', 'D_REPORT', false, ' code=''REPORT''') then
  begin
    dmDataModule.get_selected_value('main_form', 'select_report', 'D_REPORT', lv_txt, lv_key);
    id := StrToInt(lv_key);
    Params := TParams.Create;
    try
      DmDataModule.OpenSQL('select sval from DbProp.dbo.d_instance_prop where Name=''SERVER_TYPE''');
      SERVER_TYPE := DmDataModule.QFO.FieldByName('sval').AsString;
      DmDataModule.OpenSQL('select SERVER_TYPE from d_prop_dlg where id= :p1_id', [ID]);
      if DmDataModule.QFO.FieldByName('SERVER_TYPE').AsString <> SERVER_TYPE then
        Application.MessageBox('Этот отчет может открываться только на резервном сервере!', 'Предупреждение', MB_OK + MB_ICONSTOP)
      else if (id = 12) or (id = 112) or (id = 130) then
      begin
        dmDataModule.quWork.SQL.Clear;
        dmDataModule.quWork.SQL.Add('select isnull(MaxKol,0) as MaxKol from MaxKolFromOstatok');
        dmDataModule.quWork.Open;
        l_str := 'Желаете изменить максимально выводимое количество остатков?' + #10#13 + 'На данный момент максимально выводимое количество: ' + inttostr(dmDataModule.quWork.FieldByName('MaxKol').Value);
        if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then
        begin
          with TMlekoSelectFloatDlg.Create(Application) do
          try
            FloatEditFromOststok.Visible := true;
            FloatEditFromAnalysisOstatok.Visible := false;
            FloatEditForAnalysisUnlocking.Visible := false;
            quMaxKolFromOstatok.Open;
            ShowModal;
          finally
            quMaxKolFromOstatok.Close;
            Free;
          end;
        end;
      end;
      if (id = 113) then
      begin
        dmDataModule.quWork.SQL.Clear;
        dmDataModule.quWork.SQL.Add('select isnull(MaxKol,0) as MaxKol from MaxKolFromAnalysisOstatok');
        dmDataModule.quWork.Open;
        l_str := 'Желаете изменить минимальное выводимое количество дней продажи товара?' + #10#13 + 'На данный момент минимальное выводимое количество дней продажи: ' + inttostr(dmDataModule.quWork.FieldByName('MaxKol').Value);
        if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then
        begin
          with TMlekoSelectFloatDlg.Create(Application) do
          try
            FloatEditFromAnalysisOstatok.Visible := true;
            FloatEditFromOststok.Visible := false;
            FloatEditForAnalysisUnlocking.Visible := false;
            quMaxKolFromAnalysisOstatok.Open;
            ShowModal;
          finally
            quMaxKolFromAnalysisOstatok.Close;
            Free;
          end;
        end;
        l_str := 'Желаете изменить список исключаемых контрагентов?';
        if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then
        begin
          with TListMinusPostForAnalizOstatkaaForm.Create(Application) do
          try
            quListMinusPostForAnalizOstatkaa.Open;
            ShowModal;
          finally
            quListMinusPostForAnalizOstatkaa.Close;
            Free;
          end;
        end;
      end;
      if (id = 114) then
      begin
        l_str := 'Желаете изменить список исключаемых контрагентов?';
        if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then
        begin
          with TListMinusPostForOstatokZeroaForm.Create(Application) do
          try
            quListMinusPostForOstatokZeroa.Open;
            ShowModal;
          finally
            quListMinusPostForOstatokZeroa.Close;
            Free;
          end;
        end;
        l_str := 'Желаете изменить список исключаемых статей расходов?';
        if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then
        begin
          with TListMinusVidRashodForOstatokZeroaForm.Create(Application) do
          try
            quListMinusVidRashodForOstatokZeroa.Open;
            ShowModal;
          finally
            quListMinusVidRashodForOstatokZeroa.Close;
            Free;
          end;
        end;
      end;

      if (id = 116) then
      begin
        l_str := 'Желаете изменить список контрагентов?';
        if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then
        begin
          with TListPlusPostForDolgForm.Create(Application) do
          try
            quListPlusPostForDolg.Open;
            ShowModal;
          finally
            quListPlusPostForDolg.Close;
            Free;
          end;
        end;
        l_str := 'Желаете изменить список исключаемых контрагентов?';
        if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then
        begin
          with TListMinusPostForDolgForm.Create(Application) do
          try
            quListMinusPostForDolg.Open;
            ShowModal;
          finally
            quListMinusPostForDolg.Close;
            Free;
          end;
        end;
      end;

      if (id = 80) then
      begin
        l_str := 'Желаете изменить список исключаемых контрагентов?';
        if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then
        begin
          with TListMinusPostForAnalizPrihodaForm.Create(Application) do
          try
            quListMinusPostForAnalizPrihoda.Open;
            ShowModal;
          finally
            quListMinusPostForAnalizPrihoda.Close;
            Free;
          end;
        end;
      end;

      if (id = 120) then
      begin
        dmDataModule.quWork.SQL.Clear;
        dmDataModule.quWork.SQL.Add('select isnull(MaxKol,0) as MaxKol from MaxKolForAnalysisUnlocking');
        dmDataModule.quWork.Open;
        l_str := 'Желаете изменить количество дней просрочки?' + #10#13 + 'На данный момент количество дней просрочки: ' + inttostr(dmDataModule.quWork.FieldByName('MaxKol').Value);
        if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then
        begin
          with TMlekoSelectFloatDlg.Create(Application) do
          try
            FloatEditForAnalysisUnlocking.Visible := true;
            FloatEditFromAnalysisOstatok.Visible := false;
            FloatEditFromOststok.Visible := false;
            quMaxKolForAnalysisUnlocking.Open;
            ShowModal;
          finally
            quMaxKolForAnalysisUnlocking.Close;
            Free;
          end;
        end;

      end;

      if (id = 126) then
      begin
        l_str := 'Желаете изменить список исключаемых контрагентов?';
        if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then
        begin
          with TListMinusPostForAnalizPrihodNewaForm.Create(Application) do
          try
            quListMinusPostForAnalizPrihodNewa.Open;
            ShowModal;
          finally
            quListMinusPostForAnalizPrihodNewa.Close;
            Free;
          end;
        end;
      end;

      TCFLMLKCustomRepDlg.ShowRep(ID, Params);
    finally
      Params.Free;
    end;
  end;
end;

procedure TfmMain.N188Click(Sender: TObject);
begin
  inherited;
  TCFLMLKEditReportForm.ShowForm(-1, 'REPORT');
end;

procedure TfmMain.N189Click(Sender: TObject);
begin
  TMlekoListTovarWieghtForm.ShowForm(-1, -1, -1);
end;

procedure TfmMain.N190Click(Sender: TObject);
begin
  TMlekoClosePlatRForm.ShowForm(false);
end;

procedure TfmMain.N198Click(Sender: TObject);
begin
  TMlekoListAdrInfoForm.ShowForm(False);
end;

procedure TfmMain.N199Click(Sender: TObject);
begin
  TMlekoListRestAuditForm.ShowForm(False);
end;

procedure TfmMain.export_txt(p_head: string = 'V_tavria_head'; p_spec: string = 'v_tavria_spec');
var
  txt: TStrings;
  Period: TPeriodDate;
  l_sql: string;
begin
  txt := TStringList.Create;
  try
    Period := ZapDate(4);
    if Period[1] = 0 then
      exit;
    dmDataModule.QFO.Close;
    dmDataModule.QFO.SQL.Clear;
    dmDataModule.QFO.SQL.Add('select * from ' + p_head + ' where DateNakl between :DateBegin and :DateEnd ');
    dmDataModule.QFO.Params.ParamByName('DateBegin').Value := Period[1];
    dmDataModule.QFO.Params.ParamByName('DateEnd').Value := Period[2];
    dmDataModule.QFO.Open;
    dmDataModule.QFO.First;
    while not dmDataModule.QFO.Eof do
    begin
      dmDataModule.quWork.Close;
      dmDataModule.quWork.SQL.Clear;
      l_sql := 'select * from ' + p_spec + ' where NaklNo=<NAKLNO>';
      l_sql := AnsiReplaceText(l_sql, '<NAKLNO>', dmDataModule.QFO.FIeldByName('NaklNo').AsString);
      dmDataModule.quWork.SQL.Add(l_sql);
      dmDataModule.quWork.Open;
      dmDataModule.quWork.First;
      txt.Clear;
      while not dmDataModule.quWork.Eof do
      begin
        txt.Add(dmDataModule.quWork.FieldByName('String').AsString);
        dmDataModule.quWork.Next;
      end;
      if not DirectoryExists(dmDataModule.QFO.FIeldByName('Dir').AsString) then
        ForceDirectories(dmDataModule.QFO.FIeldByName('Dir').AsString);
      if FileExists(dmDataModule.QFO.FIeldByName('FName').AsString) then
        DeleteFile(dmDataModule.QFO.FIeldByName('FName').AsString);
      txt.SaveToFile(dmDataModule.QFO.FIeldByName('FName').AsString);
      dmDataModule.QFO.Next;
    end;
  finally
    txt.Free;
  end;
end;

procedure TfmMain.N122Click(Sender: TObject);
begin
  export_txt;
end;

procedure TfmMain.N131Click(Sender: TObject);
begin
  TMlekoListLogistForm.ShowForm(false);
end;

procedure TfmMain.N200Click(Sender: TObject);
type
  TOpenForm = function(PackageName: string; FormClass: string; Action: string; var Params: TParams; var aForm: TForm): Boolean;
var
  hPackHandle: HMODULE;
  FormMethod: TOpenForm;
  Res: Boolean;
  Params: TParams;
  pForm: TForm;
begin
  inherited;
  hPackHandle := LoadPackage('BC.bpl');
  FormMethod := TOpenForm(GetProcAddress(hPackHandle, PChar('OpenForm')));
  Params := TParams.Create;
  try
    pForm := nil;
    Res := FormMethod('CJ.bpl', 'TCJChildDheadForm', 'SHOW', Params, pForm);
  finally
    Params.Free;
  end;
end;

procedure TfmMain.N33Click(Sender: TObject);
begin
  TMlekoListActivityForm.ShowForm('d_activity_type');
end;

procedure TfmMain.N183Click(Sender: TObject);
var
  ID: integer;
  lv_key, lv_txt: string;
  params: TParams;
  res: boolean;
begin
  inherited;
  if TCFLMLKSelectDlg.OpenHoldSelect('main_form', 'select_dlg', 'D_PROP_DLG', false, ' code=''PROP''') then
  begin
    dmDataModule.get_selected_value('main_form', 'select_dlg', 'D_PROP_DLG', lv_txt, lv_key);
    id := StrToInt(lv_key);
    params := TParams.Create;
    try
      res := TCFLMLKPropDbDlg.ShowDlg(id, 'EDIT', params);
    finally
      params.Free;
    end;
  end;
end;
//  TCFLMLKListEntityForm.ShowForm(False);

procedure TfmMain.N202Click(Sender: TObject);
var
  params: TParams;
  res: boolean;
begin
  inherited;
  params := TParams.Create;
  try
    res := TCFLMLKPropDbDlg.ShowDlg(36, 'EDIT', params);
  finally
    params.Free;
  end;
end;

procedure TfmMain.N203Click(Sender: TObject);
begin
  inherited;
  TCFLMLKEditReportForm.ShowForm(-1, 'PROP');
end;

procedure TfmMain.N204Click(Sender: TObject);
begin
  inherited;
  export_txt('v_billa_head', 'dbo.v_billa_spec(<NAKLNO>)')
end;

procedure TfmMain.routeClick(Sender: TObject);
begin
  inherited;
  TMlekoListRouteForm.ShowForm(false);
end;

procedure TfmMain.MnTestFormClick(Sender: TObject);
begin
  inherited;
  TMlekoTestForm.ShowForm(false);
end;

procedure TfmMain.ActionServerInfo1Execute(Sender: TObject);
begin
  inherited;
  MessageDlg('ConnectString:' + #10#13 + dmDataModule.ConnectionInfo + #10#13 + 'ADO_SPID:' + IntToStr(MainDm.SPID), mtWarning, [mbOk], 0);
end;

procedure TfmMain.OnSetModule;
begin
  DataModuleClassName := 'TMlekoDbDsMSSQLDm';
  ResourceModuleClassName := 'TMlekoResDm';
  inherited;
end;

procedure TfmMain.ActionBlockMainFormExecute(Sender: TObject);
begin
  inherited;
  if TMlekoPropDbBlockAppDlg.Block then
    Exit;
end;

procedure TfmMain.N37Click(Sender: TObject);
begin
  inherited;
  TMlekoListCFOForm.ShowForm('d_response_dept');
end;

procedure TfmMain.N16Click(Sender: TObject);
begin
  inherited;
  ShowDolgNam;
end;

procedure TfmMain.N43Click(Sender: TObject);
var
  Params: TParams;
begin
  inherited;
  Params := TParams.Create;
  try
    BCCommon.OpenForm(Sender, nil, 'TMlkChildArticleGroupForm', Params);
  finally
    Params.Free;
  end;
end;

procedure TfmMain.N45Click(Sender: TObject);
var
  Params: TParams;
begin
  inherited;
  Params := TParams.Create;
  try
    BCCommon.OpenForm(Sender, nil, 'TMlkChildSetArticleGroupForm', Params);
  finally
    Params.Free;
  end;
end;

procedure TfmMain.N53Click(Sender: TObject);
var
  Params: TParams;
begin
  inherited;
  Params := TParams.Create;
  try
    BCCommon.OpenForm(Sender, nil, 'TMlkChildPostSetForm', Params);
  finally
    Params.Free;
  end;
end;

// Сетка/Общий бланк заказов напрямую только для просмотра
procedure TfmMain.N69Click(Sender: TObject);
var
  l_str: string;
  ld_date: Tdate;
begin
  inherited;
  l_str := 'Сегодня суббота! Вы хотите просмотреть заказы на воскресенье(Да) или понедельник(Нет)?';
  ld_date := GlobalDateNakl;
  if main.day_of_week = 1 then
    if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then
      ld_date := GlobalDateNakl
    else
      ld_date := GlobalDateNakl + 1;
  Edit_CrossBlankOrder := False;
  TMlekoCrossBlankOrderForm.ShowFormBrand(ld_date);
end;

procedure TfmMain.N123Click(Sender: TObject);
begin
  inherited;
  begin
    with TfmTovarPost.Create(Application) do
    try
      quTovarPost.Open;
      quFilterPost.Open;
      quFilterBarCode.Open;
      quFilterNameTovar.Open;
      quTovarPost.Open;

      ShowModal;
    finally
      quTovarPost.Close;
      quFilterPost.Close;
      quFilterBarCode.Close;
      quFilterNameTovar.Close;
      Free;
    end;
  end;
end;

procedure TfmMain.J1Click(Sender: TObject);
var
  params: TParams;
begin
  inherited;
  Params := TParams.Create;
  try
    TCFLMLKCustomRepDlg.ShowRep(103, Params);
  finally
    Params.Free;
  end;
end;

procedure TfmMain.N141Click(Sender: TObject);
begin
  inherited;
  begin
    with TMlekoBlankListOutSideForm.Create(Application) do
    try
      quFilterPrice.Open;
      quOrders.Open;
      dtDateDelivery.Date := GlobalDateNakl;
      ShowModal;
    finally
      quFilterPrice.Close;
      quOrders.Close;
      Free;
    end;
  end;
end;

procedure TfmMain.N149Click(Sender: TObject);
begin
  inherited;
  begin
    with TfmChangePrice.Create(Application) do
    try
      qu_ChangePrice.Open;
      ShowModal;
    finally
      qu_ChangePrice.Close;
      Free;
    end;
  end;

end;

procedure TfmMain.N152Click(Sender: TObject);
begin
  inherited;
  begin
    with TTimetableForDriver0.Create(Application) do
    try
      quListTimeTable.Open;
      quFilterPost.Open;
      DateTimePickerBeg.Date := GlobalDateNakl;
      DateTimePickerEnd.Date := GlobalDateNakl;
      ShowModal;
    finally
      quListTimeTable.Close;
      quFilterPost.Close;
      Free;
    end;
  end;

end;

procedure TfmMain.N153_CangePriceListClick(Sender: TObject);
begin
  inherited;
  begin
    with TChangePriceList.Create(Application) do
    try
      quFilterPrice.Open;
      qu_ChangePriceList.Open;
      ShowModal;
    finally
      quFilterPrice.Close;
      qu_ChangePriceList.Close;
      Free;
    end;
  end;
end;

procedure TfmMain.NCrosPaymentFromPostClick(Sender: TObject);
begin
  inherited;
  begin
    with TCrossPaymentsFromPost.Create(Application) do
    try
      quPaymentForPost.Open;
{
          spPaymentForPost.Close;
          spPaymentForPost.ParamByName('isPostNoMinus').AsInteger := 1;
          spPaymentForPost.ParamByName('isPostNo').AsInteger := 1;
          spPaymentForPost.ParamByName('DateBegin').Value := GlobalDateNakl - 7;
          spPaymentForPost.ParamByName('DateEnd').Value := GlobalDateNakl;
          spPaymentForPost.ParamByName('SPID').AsInteger := dmDataModule.SPID;
          spPaymentForPost.ParamByName('UserNo').AsInteger := data.UserNo;
          spPaymentForPost.Open;
}
      dtDateBeg.Value := GlobalDateNakl - 7;
      dtDateEnd.Value := GlobalDateNakl;

      quPaymentDelay.Open;

      dbEditNaklNom.Value := 0;
      dbEditDayDelay.Value := 0;

      ShowModal;
    finally
      quPaymentForPost.Close;
      spPaymentForPost.Close;
      quPaymentDelay.Open;
      Free;
    end;
  end;
end;

procedure TfmMain.StandartsOfGoodsClick(Sender: TObject);
begin
  inherited;
  begin
    with TStandartsOfGoodsForm.Create(Application) do
    try
      quGoodStandarts.Open;
      ShowModal;
    finally
      quGoodStandarts.Close;
      Free;
    end;
  end;
end;

procedure TfmMain.TypeReturnClick(Sender: TObject);
begin
  inherited;
  begin
    with TTypeReturnForm.Create(Application) do
    try
      quTypeReturn.Open;
      ShowModal;
    finally
      quTypeReturn.Close;
      Free;
    end;
  end;
end;

procedure TfmMain.CategoryTTClick(Sender: TObject);
begin
  inherited;
  begin
    with TCategoryTTForm.Create(Application) do
    try
      quCategoryTT.Open;
      EnabledEvents := True;
      ShowModal;
    finally
      quCategoryTT.Close;
      Free;
    end;
  end;

end;

procedure TfmMain.MlekoBlankListWisKPKClick(Sender: TObject);
begin
  inherited;
  begin
    with TMlekoBlankListWithKPKForm.Create(Application) do
    try
      que_blank_head_online.Open;
      que_blank_head_online.ReadOnly := True;
      DBGridEhOrders.ReadOnly := True;

      dtDateBeg.Value := GlobalDateNakl - 1;
      dtDateEnd.Value := GlobalDateNakl;

      ShowModal;
    finally
      que_blank_head_online.Close;
      Free;
    end;
  end;

end;

procedure TfmMain.RestContainerClick(Sender: TObject);
begin
  ShowOstatki(3);
end;

procedure TfmMain.IndentOrdersClick(Sender: TObject);
begin
  inherited;

  if GlobalOurFirmNo = 490 then
    if not (FileExists('\\SIRIUS\ImportOrdersVeb\orders.csv')) then
      raise Exception.Create('Файла d:\ImportOrdersVeb\orders.csv не существует на сервере!');
  if GlobalOurFirmNo = 7419 then
    if not (FileExists('\\SIRIUS\ImportOrdersVebMarket\orders.csv')) then
      raise Exception.Create('Файла d:\ImportOrdersVebMarket\orders.csv не существует на сервере!');

  dmDataModule.QFO.Close;
  dmDataModule.QFO.SQL.Clear;
  dmDataModule.QFO.SQL.Add('exec sp_ImportOrdersVeb ');
  dmDataModule.QFO.Execute;
  dmDataModule.QFO.Close;

  if GlobalOurFirmNo = 490 then
    ShowMessage('Файл d:\ImportOrdersVeb\orders.csv втянут во внешние заказы.');
  if GlobalOurFirmNo = 7419 then
    ShowMessage('Файл d:\ImportOrdersVebMarket\orders.csv втянут во внешние заказы.');
end;

procedure TfmMain.ExpotrTovForScalesClick(Sender: TObject);
begin
  inherited;
  begin
    with TExportTovarForScalesForm.Create(Application) do
    try
      quFilterVidTovarForScales.Open;
      ShowModal;
    finally
      quFilterVidTovarForScales.Close;
      Free;
    end;
  end
end;

procedure TfmMain.InputOrderExcelClick(Sender: TObject);
begin
  inherited;
  begin
    with TInputOrderWithExcelForm.Create(Application) do
    try
      ShowModal;
    finally
      Free;
    end;
  end
end;

procedure TfmMain.MarijaGroupTaxClick(Sender: TObject);
begin
  inherited;
  begin
    with TMlekoSelectMarijaGroupTaxDlg.Create(Application) do
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TfmMain.ReceiptOrdersTodeyClick(Sender: TObject);
var
  RetSelNakl: TRetSelNakl;
begin
  RetSelNakl.PostNo := 0;
  RetSelNakl.DateBegin := Date();
  RetSelNakl.DateEnd := Date();
  RetSelNakl.OtdelNo := '';
  RetSelNakl.Return := False;
  PrihodOrdersHead(RetSelNakl);
end;

procedure TfmMain.ReceiptOrdersCurClick(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelNakl: TRetSelNakl;
begin
  DecodeDate(Date(), Year, Month, Day);
  RetSelNakl.PostNo := 0;
  RetSelNakl.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelNakl.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelNakl.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  RetSelNakl.OtdelNo := '';
  RetSelNakl.Return := False;
  PrihodOrdersHead(RetSelNakl);
end;

procedure TfmMain.ReceiptOrdersPrevClick(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelNakl: TRetSelNakl;
begin
  DecodeDate(Date(), Year, Month, Day);
  RetSelNakl.PostNo := 0;
  if Month = 1 then
  begin
    Year := Year - 1;
    Month := 12;
  end
  else
    Month := Month - 1;

  RetSelNakl.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelNakl.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelNakl.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  RetSelNakl.OtdelNo := '';
  RetSelNakl.Return := False;
  PrihodOrdersHead(RetSelNakl);

end;

procedure TfmMain.ReceiptOrdersDopClick(Sender: TObject);
var
  RetSelNakl: TRetSelNakl;
begin
  RetSelNakl := SelectNakl('', False);
  RetSelNakl.Return := False;
  if RetSelNakl.PostNo <> -1 then
    PrihodOrdersHead(RetSelNakl);
end;

procedure TfmMain.ReceiptOrderClick(Sender: TObject);
var
  Spid: integer;
  Pkey: Int64;
begin
  inherited;
  begin
    Pkey := -1;
    PrihodOrders('Add', Pkey);
{
     with TPrihodOrderForm.Create(Application) do
       try
         dmDataModule.QFO.Close;
         dmDataModule.QFO.SQL.Clear;
         dmDataModule.QFO.SQL.Add('select @@SPID as Spid');
         dmDataModule.QFO.Open;
         Spid := dmDataModule.QFO.FieldByName('Spid').Value;
         dmDataModule.QFO.Close;
         dmDataModule.QFO.SQL.Clear;

         quDocType.Open;
         quBuh.Open;
         quPrihodOrderHead.Open;
         quPrihodOrderSpec.ParamByName('SPID').Value := Spid;
         quPrihodOrderSpec.ParamByName('USERNO').Value := data.UserNo;
         quPrihodOrderSpec.ParamByName('is_all_TovarOrders').Value := 1;
         is_all_TovarOrders.Checked := true;
         dbeOrderDate.Value := GlobalDateNakl;
         dbeAnalisDateBeg.Value := GlobalDateNakl - 30;
         dbeAnalisDateEnd.Value := GlobalDateNakl - 1;
         ShowModal;
       finally
         quPrihodOrderSpec.Close;
         quPrihodOrderHead.Close;
         quBuh.Close;
         quDocType.Close;
         Free;
       end;
}
  end;
end;

procedure TfmMain.N153Click(Sender: TObject);
begin
  inherited;
  BlockDateExpedition;
end;

procedure TfmMain.TmDeliveryOfGoodsClick(Sender: TObject);
begin
  inherited;
  DeliveryOfGoods(True);
end;

procedure TfmMain.N01Click(Sender: TObject);
begin
  inherited;
  begin
    with TListMinusVidTovaraForm.Create(Application) do
    try
      quListMinusVidTovara.Open;
      ShowModal;
    finally
      quListMinusVidTovara.Close;
      Free;
    end;
  end;
end;

procedure TfmMain.NOstatokZeroClick(Sender: TObject);
begin
  inherited;
  begin
    with TListMinusPostForOstatokZeroaForm.Create(Application) do
    try
      quListMinusPostForOstatokZeroa.Open;
      ShowModal;
    finally
      quListMinusPostForOstatokZeroa.Close;
      Free;
    end;
  end;
end;

procedure TfmMain.NMinusVidRashodClick(Sender: TObject);
begin
  inherited;
  begin
    with TListMinusVidRashodForOstatokZeroaForm.Create(Application) do
    try
      quListMinusVidRashodForOstatokZeroa.Open;
      ShowModal;
    finally
      quListMinusVidRashodForOstatokZeroa.Close;
      Free;
    end;
  end;
end;

procedure TfmMain.NClearBaseClick(Sender: TObject);
var
  quClearBaseTrunc: TMSQuery;
  Period: TPeriodDate;
begin
  inherited;
  Period := ZapDate(1);
  if Period[1] = 0 then
    exit;
  sp_ClearBaseTrunc.Close;
  sp_ClearBaseTrunc.ParamByName('FixDay').Value := Period[1];
  sp_ClearBaseTrunc.ExecProc;
{
  quClearBaseTrunc := TMSQuery.Create(nil);
  quClearBaseTrunc.Connection:=dmDataModule.DB;
  quClearBaseTrunc.SQL.Clear;
  quClearBaseTrunc.SQL.Text := 'exec sp_ClearBaseTranc ';
  quClearBaseTrunc.Execute;
  quClearBaseTrunc.Close;
 }
{
  dmDataModule.QFO.Close;
  dmDataModule.QFO.SQL.Clear;
  dmDataModule.QFO.SQL.Clear;
  dmDataModule.QFO.SQL.Add('exec sp_ClearBaseTranc ');
  dmDataModule.QFO.Execute;
}
  ShowMessage('Очистка базы завершена!');
end;

procedure TfmMain.NCorrectRestOfVPrihClick(Sender: TObject);
begin
  inherited;
  dmDataModule.QFO.Close;
  dmDataModule.QFO.SQL.Add('update Ostatok ' + ' set kol = 0 ' + 'where TovarNo in (select o.TovarNo ' + '                   from Ostatok o left join ' + '                        Tovar t on t.TovarNo = o.TovarNo ' + '                    where o.TovarNo not in (select distinct ARTICLE_ID from DSPEC) ' + '                      and o.Kol <> 0 ');
  dmDataModule.QFO.Execute;
  ShowMessage('Корректировка остатков по виртуальным приходам завершена!');
end;

procedure TfmMain.NPostMinusClearBaseClick(Sender: TObject);
begin
  inherited;
  begin
    with TListMinusPostForClearBaseForm.Create(Application) do
    try
      quListMinusPostForClearBase.Open;
      ShowModal;
    finally
      quListMinusPostForClearBase.Close;
      Free;
    end;
  end;
end;

procedure TfmMain.NMinusVidTovarClick(Sender: TObject);
begin
  inherited;
  begin
    with TListMinusVidTovaraForm.Create(Application) do
    try
      quListMinusVidTovara.Open;
      ShowModal;
    finally
      quListMinusVidTovara.Close;
      Free;
    end;
  end;
end;

procedure TfmMain.NMinVidTovForClBaseClick(Sender: TObject);
begin
  inherited;
  inherited;
  begin
    with TListMinusVidRashodForClearBaseForm.Create(Application) do
    try
      quListMinusVidRashodForClearBase.Open;
      ShowModal;
    finally
      quListMinusVidRashodForClearBase.Close;
      Free;
    end;
  end;
end;

procedure TfmMain.NWriteOffCostsClick(Sender: TObject);
var
  SelectPostNo, VidRashodNo: integer;
  Dlg: TWriteOffCostsForm;
begin
  inherited;

//  showmessage(inttostr(VidRashorNo));

  SelectPostNo := SelectPostForWriteOffCost(VidRashodNo);
  if SelectPostNo = 0 then
    Exit;

  VidRashodNo := VidRashod.VidRashoda(False, SelectPostNo);
  if VidRashodNo = 0 then
    Exit;

  Dlg := TWriteOffCostsForm.Create(Application);
  try
    Dlg.quWriteOffCosts.ParamByName('VidRashodNo').AsInteger := VidRashodNo;
    Dlg.quWriteOffCosts.ParamByName('SelectPostNo').AsInteger := SelectPostNo;
    Dlg.quWriteOffCosts.Open;
    Dlg.mdSpravka.Active := true;

    Dlg.quPost.Open;
    Dlg.QuBuh.Open;
    Dlg.quOtdel.Open;
    Dlg.quPlatType.Open;

    Dlg.lcPost.KeyValue := SelectPostNo;
    Dlg.lcSotrud.KeyValue := Dlg.quWriteOffCostsSotrudNo.AsVariant;
    Dlg.lcPlatType.KeyValue := 1;

    Dlg.quMaxNom.ParamByName('Buh').AsInteger := Dlg.quWriteOffCostsBuh.Value;
    Dlg.quMaxNom.Open;

    Dlg.quPlatP.Open;
    Dlg.quPlatP.Insert;

    Dlg.quPlatPSotrudNo.Value := Dlg.quWriteOffCostsSotrudNo.Value;
    Dlg.quPlatPBuh.Value := Dlg.quWriteOffCostsBuh.Value;
    Dlg.quPlatP.FieldByName('Nom').AsInteger := Dlg.quMaxNomNom.AsInteger + 1;
    Dlg.quPlatPPostNo.Value := SelectPostNo;
    Dlg.quPlatP.FieldByName('PostNoFirst').AsInteger := SelectPostNo;
    Dlg.quPlatP.FieldByName('Spravka').AsString := 'Расход денег. № ';
    Dlg.quPlatP.FieldByName('VidRashodNo').AsInteger := VidRashodNo;
    Dlg.quPlatP.FieldByName('TipPlat').AsInteger := 1;

    Dlg.ShowModal;
  finally
    Dlg.quWriteOffCosts.Close;
    Dlg.quPlatP.Close;
    Dlg.quPost.Close;
    Dlg.QuBuh.Close;
    Dlg.quOtdel.Close;
    Dlg.quPlatType.Close;

    Dlg.Free;
  end;
end;

procedure TfmMain.ABCDZ1Click(Sender: TObject);
begin
  with TClassifierABCDZForm.Create(Application) do
  try
    dmDataModule.quClassifierABCDZ.Open;
    ShowModal;
  finally
    dmDataModule.quClassifierABCDZ.Close;
    Free;
  end;
end;

procedure TfmMain.NBanksClick(Sender: TObject);
begin
  inherited;
  with TBankAndInvoiceForm.Create(Application) do
  try
    dmDataModule.quBanks.Open;
    ShowModal;
  finally
    dmDataModule.quBanks.Close;
    Free;
  end;

end;

procedure TfmMain.NKassaClick(Sender: TObject);
begin
  inherited;
  with TKassaForm.Create(Application) do
  try
    dmDataModule.quKassa.Open;
    dmDataModule.quKassa.Edit;
    ShowModal;
  finally
    dmDataModule.quKassa.Close;
    Free;
  end;
end;

procedure TfmMain.NBDDSClick(Sender: TObject);
begin
  inherited;
  with TBDDSForm.Create(Application) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfmMain.NPepsicoClick(Sender: TObject);
begin
  inherited;
  VidSotrudInPepsi(False);
end;

procedure TfmMain.NSalesChannelsPepsiClick(Sender: TObject);
begin
  inherited;
  SalesChannelsPepsico(False);
end;

procedure TfmMain.NKOATUUClick(Sender: TObject);
begin
  inherited;

  ShowKOATUU(False);
{
  with TMlekoSelectBankInvoiceDlg.Create(Application) do
   try
     ShowModal;
   finally
     Free;
   end;
}
end;

procedure TfmMain.NRequestForSupplyClick(Sender: TObject);
begin
  inherited;
  with TRequestForSupplyGoodsHeadForm.Create(Application) do
  try
    quRequestForSupplyGoodsHead.Open;
    ShowModal;
  finally
    quRequestForSupplyGoodsHead.Close;
    Free;
  end;

end;

procedure TfmMain.NCommerceNetworkClick(Sender: TObject);
begin
  inherited;
  ShowAddressPost_CODE_Commerce_Network(false);
end;

procedure TfmMain.NExportSotrudClick(Sender: TObject);
var
  FileName, DateStr, MonthStr, DayStr: string;
  Year, Month, Day: Word;
  BossNo: string;
begin
  inherited;

  BossNo := SotrudLevelStr(false, 'L4');

  if (BossNo = '-1') then
  begin
    raise Exception.Create('Отменено пользователем!');
  end;

  dmDataModule.ExecSQL('exec sp_ExportSotrudForSandora :p1_BossNo', [BossNo]);

  DecodeDate(Date, Year, Month, Day);

  if Day = 1 then
    DayStr := '01';
  if Day = 2 then
    DayStr := '02';
  if Day = 3 then
    DayStr := '03';
  if Day = 4 then
    DayStr := '04';
  if Day = 5 then
    DayStr := '05';
  if Day = 6 then
    DayStr := '06';
  if Day = 7 then
    DayStr := '07';
  if Day = 8 then
    DayStr := '08';
  if Day = 9 then
    DayStr := '09';
  if Day > 9 then
    DayStr := IntToStr(Day);

  if Month = 1 then
    MonthStr := '01';
  if Month = 2 then
    MonthStr := '02';
  if Month = 3 then
    MonthStr := '03';
  if Month = 4 then
    MonthStr := '04';
  if Month = 5 then
    MonthStr := '05';
  if Month = 6 then
    MonthStr := '06';
  if Month = 7 then
    MonthStr := '07';
  if Month = 8 then
    MonthStr := '08';
  if Month = 9 then
    MonthStr := '09';
  if Month > 9 then
    MonthStr := IntToStr(Month);

  DateStr := IntToStr(Year) + MonthStr + DayStr;

  FileName := '\\SIRIUS\ExportForSandora\24_ROUTES_' + DateStr + '.txt';

  if FileExists(FileName) then
    ShowMessage('Создан файл ' + FileName)
  else
    ShowMessage('Файл ' + FileName + ' не создан!' + #10#13 + 'Обратитесь к системному администратору!');
end;

procedure TfmMain.NExportAdrPostClick(Sender: TObject);
var
  FileName, DateStr, MonthStr, DayStr: string;
  Year, Month, Day: Word;
  BossNo: string;
begin
  inherited;

  BossNo := SotrudLevelStr(false, 'L4');

  if (BossNo = '-1') then
  begin
    raise Exception.Create('Отменено пользователем!');
  end;

  dmDataModule.ExecSQL('exec sp_ExportClassifierDeliveryPointsForSandora :p1_BossNo', [BossNo]);

  DecodeDate(Date, Year, Month, Day);

  if Day = 1 then
    DayStr := '01';
  if Day = 2 then
    DayStr := '02';
  if Day = 3 then
    DayStr := '03';
  if Day = 4 then
    DayStr := '04';
  if Day = 5 then
    DayStr := '05';
  if Day = 6 then
    DayStr := '06';
  if Day = 7 then
    DayStr := '07';
  if Day = 8 then
    DayStr := '08';
  if Day = 9 then
    DayStr := '09';
  if Day > 9 then
    DayStr := IntToStr(Day);

  if Month = 1 then
    MonthStr := '01';
  if Month = 2 then
    MonthStr := '02';
  if Month = 3 then
    MonthStr := '03';
  if Month = 4 then
    MonthStr := '04';
  if Month = 5 then
    MonthStr := '05';
  if Month = 6 then
    MonthStr := '06';
  if Month = 7 then
    MonthStr := '07';
  if Month = 8 then
    MonthStr := '08';
  if Month = 9 then
    MonthStr := '09';
  if Month > 9 then
    MonthStr := IntToStr(Month);

  DateStr := IntToStr(Year) + MonthStr + DayStr;

  FileName := '\\SIRIUS\ExportForSandora\24_OUTLETS_' + DateStr + '.txt';

  if FileExists(FileName) then
    ShowMessage('Создан файл ' + FileName)
  else
    ShowMessage('Файл ' + FileName + ' не создан!' + #10#13 + 'Обратитесь к системному администратору!');
end;

procedure TfmMain.NExportSalesClick(Sender: TObject);
var
  Period: TPeriodDate;
  FileName, DateStr, MonthStr, DayStr: string;
  Year, Month, Day: Word;
  PostNo: integer;
  IsRun: Boolean;
  Dlg: TMlekoSelectFIrmSupplierDlg;
  BossNo: string;
begin
  inherited;

  IsRun := true;

  ShowMessage('Необходимо выбрать руководителя из списка! ');

  BossNo := SotrudLevelStr(false, 'L4');

  if (BossNo = '-1') then
  begin
    raise Exception.Create('Отменено пользователем!');

  end;

  ShowMessage('Необходимо выбрать поставщика из списка');
  Dlg := TMlekoSelectFIrmSupplierDlg.Create(Application);
  try
    case Dlg.ShowModal of
      mrOk:
        PostNo := Dlg.Query.FieldByName('PostNo').Value;
      mrCancel:
        IsRun := False;
      mrIgnore:
        begin
        end;
    end;
  finally
    Dlg.Query.Close;
    Dlg.Free;
  end;

  if not IsRun then
    raise Exception.Create('Отменено пользователем!');

  Period := ZapDate(2);

  if (Period[1] = 0) then
    raise Exception.Create('Отменено пользователем!');

  if IsRun then
    dmDataModule.ExecSQL('exec sp_ExportSalesForSandora :p1_DateBeg, :p2_DateEnd, :p3_PostNo, :p4_BossNo ', [Period[1] - 2, Period[2] - 2, PostNo, BossNo]);

  DecodeDate(Period[1], Year, Month, Day);

  if Day = 1 then
    DayStr := '01';
  if Day = 2 then
    DayStr := '02';
  if Day = 3 then
    DayStr := '03';
  if Day = 4 then
    DayStr := '04';
  if Day = 5 then
    DayStr := '05';
  if Day = 6 then
    DayStr := '06';
  if Day = 7 then
    DayStr := '07';
  if Day = 8 then
    DayStr := '08';
  if Day = 9 then
    DayStr := '09';
  if Day > 9 then
    DayStr := IntToStr(Day);

  if Month = 1 then
    MonthStr := '01';
  if Month = 2 then
    MonthStr := '02';
  if Month = 3 then
    MonthStr := '03';
  if Month = 4 then
    MonthStr := '04';
  if Month = 5 then
    MonthStr := '05';
  if Month = 6 then
    MonthStr := '06';
  if Month = 7 then
    MonthStr := '07';
  if Month = 8 then
    MonthStr := '08';
  if Month = 9 then
    MonthStr := '09';
  if Month > 9 then
    MonthStr := IntToStr(Month);

  DateStr := IntToStr(Year) + MonthStr + DayStr;

  DecodeDate(Period[2], Year, Month, Day);

  if Day = 1 then
    DayStr := '01';
  if Day = 2 then
    DayStr := '02';
  if Day = 3 then
    DayStr := '03';
  if Day = 4 then
    DayStr := '04';
  if Day = 5 then
    DayStr := '05';
  if Day = 6 then
    DayStr := '06';
  if Day = 7 then
    DayStr := '07';
  if Day = 8 then
    DayStr := '08';
  if Day = 9 then
    DayStr := '09';
  if Day > 9 then
    DayStr := IntToStr(Day);

  if Month = 1 then
    MonthStr := '01';
  if Month = 2 then
    MonthStr := '02';
  if Month = 3 then
    MonthStr := '03';
  if Month = 4 then
    MonthStr := '04';
  if Month = 5 then
    MonthStr := '05';
  if Month = 6 then
    MonthStr := '06';
  if Month = 7 then
    MonthStr := '07';
  if Month = 8 then
    MonthStr := '08';
  if Month = 9 then
    MonthStr := '09';
  if Month > 9 then
    MonthStr := IntToStr(Month);

  DateStr := DateStr + '_' + IntToStr(Year) + MonthStr + DayStr;

  FileName := '\\SIRIUS\ExportForSandora\24_SALES_' + DateStr + '.txt';

  if IsRun then
    if FileExists(FileName) then
      ShowMessage('Создан файл ' + FileName)
    else
      ShowMessage('Файл ' + FileName + ' не создан!' + #10#13 + 'Обратитесь к системному администратору!');

end;

procedure TfmMain.NExportRestSandClick(Sender: TObject);
var
  Period: TPeriodDate;
  FileName, DateStr, MonthStr, DayStr: string;
  Year, Month, Day: Word;
  PostNo: integer;
  IsRun: boolean;
  Dlg: TMlekoSelectFIrmSupplierDlg;
begin
  inherited;

  IsRun := true;

  ShowMessage('Необходимо выбрать поставщика из списка');
  Dlg := TMlekoSelectFIrmSupplierDlg.Create(Application);
  try
    case Dlg.ShowModal of
      mrOk:
        PostNo := Dlg.Query.FieldByName('PostNo').Value;
      mrCancel:
        IsRun := False;
      mrIgnore:
        begin
        end;
    end;
{
    if Dlg.ShowModal = mrok Then
      begin
        PostNo := Dlg.Query.FieldByName('PostNo').Value;
      end;
    if Dlg.ShowModal = mrCancel Then
      begin
        IsRun := false;
      end;
}
  finally
    Dlg.Query.Close;
    Dlg.Free;
  end;

  if not IsRun then
    raise Exception.Create('Отменено пользователем!');

  Period := ZapDate(2);

  if (Period[1] = 0) then
    raise Exception.Create('Отменено пользователем!');

  if IsRun then
    dmDataModule.ExecSQL('exec sp_ExportRestForSandora :p1_DateBeg, :p2_DateEnd, :p3_PostNo ', [Period[1] - 2, Period[2] - 2, PostNo]);

  DecodeDate(Period[1], Year, Month, Day);

  if Day = 1 then
    DayStr := '01';
  if Day = 2 then
    DayStr := '02';
  if Day = 3 then
    DayStr := '03';
  if Day = 4 then
    DayStr := '04';
  if Day = 5 then
    DayStr := '05';
  if Day = 6 then
    DayStr := '06';
  if Day = 7 then
    DayStr := '07';
  if Day = 8 then
    DayStr := '08';
  if Day = 9 then
    DayStr := '09';
  if Day > 9 then
    DayStr := IntToStr(Day);

  if Month = 1 then
    MonthStr := '01';
  if Month = 2 then
    MonthStr := '02';
  if Month = 3 then
    MonthStr := '03';
  if Month = 4 then
    MonthStr := '04';
  if Month = 5 then
    MonthStr := '05';
  if Month = 6 then
    MonthStr := '06';
  if Month = 7 then
    MonthStr := '07';
  if Month = 8 then
    MonthStr := '08';
  if Month = 9 then
    MonthStr := '09';
  if Month > 9 then
    MonthStr := IntToStr(Month);

  DateStr := IntToStr(Year) + MonthStr + DayStr;

  DecodeDate(Period[2], Year, Month, Day);

  if Day = 1 then
    DayStr := '01';
  if Day = 2 then
    DayStr := '02';
  if Day = 3 then
    DayStr := '03';
  if Day = 4 then
    DayStr := '04';
  if Day = 5 then
    DayStr := '05';
  if Day = 6 then
    DayStr := '06';
  if Day = 7 then
    DayStr := '07';
  if Day = 8 then
    DayStr := '08';
  if Day = 9 then
    DayStr := '09';
  if Day > 9 then
    DayStr := IntToStr(Day);

  if Month = 1 then
    MonthStr := '01';
  if Month = 2 then
    MonthStr := '02';
  if Month = 3 then
    MonthStr := '03';
  if Month = 4 then
    MonthStr := '04';
  if Month = 5 then
    MonthStr := '05';
  if Month = 6 then
    MonthStr := '06';
  if Month = 7 then
    MonthStr := '07';
  if Month = 8 then
    MonthStr := '08';
  if Month = 9 then
    MonthStr := '09';
  if Month > 9 then
    MonthStr := IntToStr(Month);

  DateStr := DateStr + '_' + IntToStr(Year) + MonthStr + DayStr;

  FileName := '\\SIRIUS\ExportForSandora\24_STOCKS_' + DateStr + '.txt';

  if IsRun then
    if FileExists(FileName) then
      ShowMessage('Создан файл ' + FileName)
    else
      ShowMessage('Файл ' + FileName + ' не создан!' + #10#13 + 'Обратитесь к системному администратору!');
end;

procedure TfmMain.NRest1Click(Sender: TObject);
begin
  inherited;
  with TOstatok1HeadForm.Create(Application) do
  try
    quOstatok1Head.Open;
    ShowModal;
  finally
    quOstatok1Head.Close;
    Free;
  end;
end;

procedure TfmMain.NUPClick(Sender: TObject);
begin
  inherited;
  Params := TParams.Create;
  try
    TCFLMLKCustomRepDlg.ShowRep(119, Params);
  finally
    Params.Free;
  end;
end;

procedure TfmMain.NReasonForUnlockingClick(Sender: TObject);
begin
  inherited;
  ReasonForUnlocking(true);
end;

procedure TfmMain.NPlanningOrderClick(Sender: TObject);
var
  Pkey: Int64;
begin
  inherited;
{
  Pkey := 1;
  PlanningOrders('Edit',Pkey);
  
  Pkey := -1;
  PlanningOrders('Add',Pkey);
}
end;

procedure TfmMain.NNewPlanningOrderClick(Sender: TObject);
var
  Pkey: Int64;
begin
  inherited;
  Pkey := -1;
  PlanningOrders('Add', Pkey);
end;

procedure TfmMain.NPlanningTodayClick(Sender: TObject);
var
  RetSelNakl: TRetSelNakl;
begin
  inherited;
  RetSelNakl.PostNo := 0;
  RetSelNakl.DateBegin := Date();
  RetSelNakl.DateEnd := Date();
  RetSelNakl.OtdelNo := '';
  RetSelNakl.Return := False;
  PlanningOrdersHead(RetSelNakl);
end;

procedure TfmMain.PlanningOrderCurClick(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelNakl: TRetSelNakl;
begin
  inherited;
  DecodeDate(Date(), Year, Month, Day);
  RetSelNakl.PostNo := 0;
  RetSelNakl.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelNakl.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelNakl.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  RetSelNakl.OtdelNo := '';
  RetSelNakl.Return := False;
  PlanningOrdersHead(RetSelNakl);
end;

procedure TfmMain.PlanningOrderPrevClick(Sender: TObject);
var
  Year, Month, Day: word;
  RetSelNakl: TRetSelNakl;
begin
  inherited;
  DecodeDate(Date(), Year, Month, Day);
  RetSelNakl.PostNo := 0;
  if Month = 1 then
  begin
    Year := Year - 1;
    Month := 12;
  end
  else
    Month := Month - 1;

  RetSelNakl.DateBegin := EncodeDate(Year, Month, 01);
  if Month = 12 then
    RetSelNakl.DateEnd := EncodeDate(Year + 1, 01, 01) - 1
  else
    RetSelNakl.DateEnd := EncodeDate(Year, Month + 1, 01) - 1;
  PlanningOrdersHead(RetSelNakl);
end;

procedure TfmMain.PlanningOrderDopClick(Sender: TObject);
var
  RetSelNakl: TRetSelNakl;
begin
  inherited;
  RetSelNakl := SelectNakl('', False);
  RetSelNakl.Return := False;
  PlanningOrdersHead(RetSelNakl);
end;

procedure TfmMain.AnalisPlanProdagClick(Sender: TObject);
var
  Year, Month, Day: word;
  KolDayInMons: Integer;
begin
  inherited;

  with TAnalisPlanningOrderForm.Create(Application) do
  try
    DecodeDate(Date(), Year, Month, Day);

    quAnalisPlanningOrder.Open;

    KolDayInMons := DaysInMonth(EncodeDate(Year, Month, 01));

    EdDatePlanningBeg.Date := EncodeDate(Year, Month, 01);
    EdDatePlanningEnd.Date := EncodeDate(Year, Month, KolDayInMons);
    EdDatePlanningEndFact.Date := Date();

    ShowModal;
  finally
    quAnalisPlanningOrder.Close;
    Free;
  end;

end;

procedure TfmMain.AnalizReturnOrderClick(Sender: TObject);
var
  Year, Month, Day: word;
  KolDayInMons: Integer;
begin
  inherited;
  with TAnalisReturnOrderForm.Create(Application) do
  try
    DecodeDate(Date(), Year, Month, Day);

    quAnalisReturnOrder.Open;

    KolDayInMons := DaysInMonth(EncodeDate(Year, Month - 1, 01));

    EdDateBeg1.Date := EncodeDate(Year, Month, 01);
    EdDateEnd1.Date := Date();

    EdDateBeg2.Date := EncodeDate(Year, Month - 1, 01);
    EdDateEnd2.Date := EncodeDate(Year, Month - 1, KolDayInMons);

    ShowModal;
  finally
    quAnalisReturnOrder.Close;
    Free;
  end;
end;

procedure TfmMain.InfarmAnalysisClick(Sender: TObject);
begin
  inherited;
  with TInfarmatsionny_AnalysisForm.Create(Application) do
  try

    quInfarmatsionny_AnalysisHead.Open;

    EdDateBeg.Date := Date();
    EdDateEnd.Date := Date();

    ShowModal;
  finally
    quInfarmatsionny_AnalysisHead.Close;
    Free;
  end;

end;

procedure TfmMain.ListAdrInfoNewClick(Sender: TObject);
begin
  inherited;
  TMLekoListAdrInfoNewForm.ShowForm(False);
end;

procedure TfmMain.PricingListClick(Sender: TObject);
begin
  inherited;
  with TPricingListForm.Create(Application) do
  try
    quHistoriPrice.Open;
    quListVidTovName.Open;
    ShowModal;
  finally
    quHistoriPrice.Close;
    quListVidTovName.Close;
    Free;
  end
end;

procedure TfmMain.RestOfDateManufClick(Sender: TObject);
begin
  inherited;
  with TRestTovarOfDateManufactureForm.Create(Application) do
  try
    quTovarDateOfManufacture.Open;
    quFltVidTovara.Open;
    ShowModal;
  finally
    quTovarDateOfManufacture.Close;
    quFltVidTovara.Close;
    Free;
  end
end;

procedure TfmMain.NExportOtchetSandClick(Sender: TObject);
var
  Period: TPeriodDate;
  FileName, DateStr, MonthStr, DayStr: string;
  Year, Month, Day: Word;
  PostNo: integer;
  IsRun: Boolean;
  Dlg: TMlekoSelectFIrmSupplierDlg;
begin
  inherited;
  IsRun := true;

  ShowMessage('Необходимо выбрать поставщика из списка');
  Dlg := TMlekoSelectFIrmSupplierDlg.Create(Application);
  try
    case Dlg.ShowModal of
      mrOk:
        PostNo := Dlg.Query.FieldByName('PostNo').Value;
      mrCancel:
        IsRun := False;
      mrIgnore:
        begin
        end;
    end;
  finally
    Dlg.Query.Close;
    Dlg.Free;
  end;

  if not IsRun then
    raise Exception.Create('Отменено пользователем!');

  Period := ZapDate(2);

  if (Period[1] = 0) then
    raise Exception.Create('Отменено пользователем!');

  if IsRun then
    dmDataModule.ExecSQL('exec sp_ExportOtchetForSandora :p1_DateBeg, :p2_DateEnd, :p3_PostNo ', [Period[1] - 2, Period[2] - 2, PostNo]);

  DecodeDate(Period[1], Year, Month, Day);

  if Day = 1 then
    DayStr := '01';
  if Day = 2 then
    DayStr := '02';
  if Day = 3 then
    DayStr := '03';
  if Day = 4 then
    DayStr := '04';
  if Day = 5 then
    DayStr := '05';
  if Day = 6 then
    DayStr := '06';
  if Day = 7 then
    DayStr := '07';
  if Day = 8 then
    DayStr := '08';
  if Day = 9 then
    DayStr := '09';
  if Day > 9 then
    DayStr := IntToStr(Day);

  if Month = 1 then
    MonthStr := '01';
  if Month = 2 then
    MonthStr := '02';
  if Month = 3 then
    MonthStr := '03';
  if Month = 4 then
    MonthStr := '04';
  if Month = 5 then
    MonthStr := '05';
  if Month = 6 then
    MonthStr := '06';
  if Month = 7 then
    MonthStr := '07';
  if Month = 8 then
    MonthStr := '08';
  if Month = 9 then
    MonthStr := '09';
  if Month > 9 then
    MonthStr := IntToStr(Month);

  DateStr := IntToStr(Year) + MonthStr + DayStr;

  DecodeDate(Period[2], Year, Month, Day);

  if Day = 1 then
    DayStr := '01';
  if Day = 2 then
    DayStr := '02';
  if Day = 3 then
    DayStr := '03';
  if Day = 4 then
    DayStr := '04';
  if Day = 5 then
    DayStr := '05';
  if Day = 6 then
    DayStr := '06';
  if Day = 7 then
    DayStr := '07';
  if Day = 8 then
    DayStr := '08';
  if Day = 9 then
    DayStr := '09';
  if Day > 9 then
    DayStr := IntToStr(Day);

  if Month = 1 then
    MonthStr := '01';
  if Month = 2 then
    MonthStr := '02';
  if Month = 3 then
    MonthStr := '03';
  if Month = 4 then
    MonthStr := '04';
  if Month = 5 then
    MonthStr := '05';
  if Month = 6 then
    MonthStr := '06';
  if Month = 7 then
    MonthStr := '07';
  if Month = 8 then
    MonthStr := '08';
  if Month = 9 then
    MonthStr := '09';
  if Month > 9 then
    MonthStr := IntToStr(Month);

  DateStr := DateStr + '_' + IntToStr(Year) + MonthStr + DayStr;

  FileName := '\\SIRIUS\ExportForSandora\24_Otchets_' + DateStr + '.csv';

  if IsRun then
    if FileExists(FileName) then
      ShowMessage('Создан файл ' + FileName)
    else
      ShowMessage('Файл ' + FileName + ' не создан!' + #10#13 + 'Обратитесь к системному администратору!');

end;

procedure TfmMain.ControlRestDOMClick(Sender: TObject);
begin
  inherited;
  with TControlRestTovarOfDateManufactureForm.Create(Application) do
  try
    quTovarOfDateManufacture.Open;
    dtDateOfManufacture.Date := GlobalDateNakl - 2;
    ShowModal;
  finally
    quTovarOfDateManufacture.Close;
    Free;
  end
end;

procedure TfmMain.CheckPriceInInstClick(Sender: TObject);
begin
  inherited;
  with TReconciliationReceiptPriceInInstForm.Create(Application) do
  try
    qul_PriceInInstForNaklP.Open;

    EdDateBeg.Date := Date();
    EdDateEnd.Date := Date();

    ShowModal;
  finally
    qul_PriceInInstForNaklP.Close;
    Free;
  end;
end;

procedure TfmMain.NOtdelClick(Sender: TObject);
begin
  inherited;
  VidOtdel(false, false);

{
  begin
      with TOtdelForm.Create(Application) do
        try
          qu_VidOtdel.Open;
          ShowModal;
        finally
          qu_VidOtdel.Close;
          Free;
        end;
  end;
}
end;

procedure TfmMain.CreatWithExelClick(Sender: TObject);
var
  Pkey: Int64;
begin
  inherited;
  Pkey := -1;
  PrihodTovarWithExel(-1, Pkey);
end;

procedure TfmMain.NewClientCardClick(Sender: TObject);
var
  PostNo: integer;
  Dlg: TMlekoSelectFIrmDlg;
  IsRun: boolean;
  Id: integer;
begin
  IsRun := true;
  Id := -1;

  Dlg := TMlekoSelectFIrmDlg.Create(Application);
  try
    case Dlg.ShowModal of
      mrOk:
        PostNo := Dlg.Query.FieldByName('PostNo').Value;
      mrCancel:
        IsRun := False;
      mrIgnore:
        begin
        end;
    end;
  finally
    Dlg.Query.Close;
    Dlg.Free;
  end;

  if not IsRun then
    raise Exception.Create('Отменено пользователем!');

  dmDataModule.quUsers.Open;
  dmDataModule.quOtdel.Open;
  dmDataModule.quRegions.Open;
  dmDataModule.quGroupCutting.Open;
  dmDataModule.quVidTov.Open;

  ClientCard('Add', PostNo, Id);

  dmDataModule.quUsers.Close;
  dmDataModule.quOtdel.Close;
  dmDataModule.quRegions.Close;
  dmDataModule.quGroupCutting.Close;
  dmDataModule.quVidTov.Close;
end;

procedure TfmMain.VidDocClick(Sender: TObject);
begin
  inherited;
  with TVidDocForm.Create(Application) do
  try
    quVidDoc.open;
    quListUserForVidDoc.Open;
    dmDataModule.quUsers.Open;
    dmDataModule.quOtdel.Open;
    quListUserForConductingDoc.Open;

    ShowModal;
  finally
    quListUserForVidDoc.Close;
    quVidDoc.Close;
    dmDataModule.quUsers.Close;
    dmDataModule.quOtdel.Close;
    quListUserForConductingDoc.Close;
    Free;
  end;
end;

procedure TfmMain.NotAppCardsClientsClick(Sender: TObject);
begin
  inherited;
  DocClientCardsHead(False);
end;

procedure TfmMain.AppliedCardsClientsClick(Sender: TObject);
begin
  inherited;
  DocClientCardsHead(True);
end;

procedure TfmMain.ContVidRashodClick(Sender: TObject);
begin
  inherited;
  with TControlVidRashodForPlatForm.Create(Application) do
  try
    quVidRashodPlatP.Open;
    quVidRashodPlatR.Open;
    ShowModal;
  finally
    quVidRashodPlatP.Close;
    quVidRashodPlatR.Close;
    Free;
  end
end;

procedure TfmMain.GroupCuttingClick(Sender: TObject);
begin
  inherited;
  with TGroupCuttingForm.Create(Application) do
  try
    quGroupCutting.Open;
    ShowModal;
  finally
    quGroupCutting.Close;
    Free;
  end
end;

procedure TfmMain.ListVidTovForGrCutClick(Sender: TObject);
begin
  inherited;
  with TListVidTovForGroupCuttingForm.Create(Application) do
  try
    quListVidTovForGroupCutting.open;
    dmDataModule.quVidTov.Open;
    quL_ListVidTovForGroupCutting.Open;
    quGroupCutting.Open;
    ShowModal;
  finally
    quListVidTovForGroupCutting.Close;
    quListVidTovForGroupCutting.Free;
    dmDataModule.quVidTov.Close;
    quL_ListVidTovForGroupCutting.Close;
    quL_ListVidTovForGroupCutting.Free;
    quGroupCutting.Close;
    quGroupCutting.Free;
    Free;
  end;
end;

procedure TfmMain.CheckMeshCuttingClick(Sender: TObject);
begin
  inherited;
  CheckCuttingMesh;
end;

procedure TfmMain.PostFromGroupCuttingClick(Sender: TObject);
begin
  inherited;
  with TPostFromGroupCuttingForm.Create(Application) do
  try
    quPostFromGroupCutting.Open;
    quGroupCutting.Open;
    quVidTov.Open;
    quPost.Open;
    ShowModal;
  finally
    quPostFromGroupCutting.Close;
    quGroupCutting.Close;
    quVidTov.Close;
    quPost.Close;
    Free;
  end
end;

procedure TfmMain.AnalisCuttingMeshClick(Sender: TObject);
begin
  inherited;
  with TAnalisCuttingMeshForm.Create(Application) do
  try
    quAnalisCuttingMesh.Open;
    quAnalisCuttingMeshBrandFilter.Open;
    quAnalisCuttingMeshTovarFilter.Open;
    quAnalisCuttingMeshGroupFilter.Open;
    ShowModal;
  finally
    quAnalisCuttingMesh.Close;
    quAnalisCuttingMeshBrandFilter.Close;
    quAnalisCuttingMeshTovarFilter.Close;
    quAnalisCuttingMeshGroupFilter.Close;
    Free;
  end
end;

procedure TfmMain.CurrencyClick(Sender: TObject);
begin
  inherited;
  ShowCurrency(false);
end;

procedure TfmMain.ExchangeRatesClick(Sender: TObject);
begin
  inherited;
  ShowCurrencyExchange(True);
end;

procedure TfmMain.VidRashGroupClick(Sender: TObject);
begin
  inherited;
  ShowVidRashodGroup(True);
end;

end.


