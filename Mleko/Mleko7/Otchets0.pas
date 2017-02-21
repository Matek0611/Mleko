  unit Otchets0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  FR_Class, FR_DSet, FR_DBSet, Db, DBAccess, MsAccess, MemDS, FR_E_RTF,
  frxClass, frxDBSet, frxExportPDF, frxExportImage, frxExportRTF,
  frxExportXML, frxExportXLS, frxExportHTML, frxExportTXT, FR_E_CSV,
  DBSumLst, RxMemDS, ComCtrls, StdCtrls,  
  ComObj, Variants, FR_E_TXT,  Excel97, IniFiles, AxCtrls, OleCtrls, 
  frXMLExl, frOLEExl,  FR_Desgn, frRtfExp,FR_DCtrl, ActnList, FR_BarC;

type
  TfmOtchets = class(TMlekoForm)
    quNaklR: TMSQuery;
    quNaklRDateNakl: TDateTimeField;
    quNaklRSumma: TFloatField;
    quNaklRNom: TIntegerField;
    quNaklRNameLong: TStringField;
    quNaklRDogovorNo: TStringField;
    quNaklRDateDogovor: TDateTimeField;

    quRashod: TMSQuery;
    quRashodKol: TFloatField;
    quRashodPriceOut: TFloatField;
    quRashodNameTovar: TStringField;
    quRashodVidName: TStringField;
    quRashodEdIzm: TStringField;

    dsRashod: TDataSource;                       
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    quPrintPost: TMSQuery;
    quPrintPostName: TStringField;
    quPrintPostNameLong: TStringField;
    quPrintPostPhone: TStringField;
    quPrintPostContact: TStringField;
    quPrintPostSotrudName: TStringField;
    quPrintPostAddressFact: TStringField;
    quPrintPostCategorName: TStringField;
    dsPrintPost: TDataSource;

    frDBDataSet2: TfrDBDataSet;
    frReport2: TfrReport;
    quPrintPostRegionName: TStringField;
    quPrintPostMarschrutNo: TSmallintField;
    quNotCompletOrder: TMSQuery;
    quNotCompletOrderTovarNo: TSmallintField;
    quNotCompletOrderKolC: TFloatField;
    quNotCompletOrderKolZ: TFloatField;
    quNotCompletOrderNameTovar: TStringField;
    quNotCompletOrderVidName: TStringField;
    dsNotCompletOrder: TDataSource;
    frDBDataSet3: TfrDBDataSet;
    frReport3: TfrReport;
    spSaleCompanyPeriods: TMSStoredProc;
    dsSaleCompanyPeriods: TDataSource;
    frDBDataSet4: TfrDBDataSet;
    frReport4: TfrReport;
    frUserDataset1: TfrUserDataset;
    spSaleCustomersPeriods: TMSStoredProc;
    dsSaleCustomersPeriods: TDataSource;
    frDBDataSet5: TfrDBDataSet;
    frReport5: TfrReport;
    frUserDataset2: TfrUserDataset;
    spCrossPostCompany: TMSStoredProc;
    dsCrossPostCompany: TDataSource;
    frDBDataSet6: TfrDBDataSet;
    frReport6: TfrReport;
    frUserDataset3: TfrUserDataset;
    quCompany: TMSQuery;
    quCompanyNameCompany: TStringField;
    quCompanyCompanyNo: TSmallintField;
    quNotCompletOrderPriceIn: TFloatField;
    quRashod2: TMSQuery;
    quNaklR2: TMSQuery;
    IntegerField1: TIntegerField;
    dsNaklR2: TDataSource;
    dsRashod2: TDataSource;
    quRashod2Kol: TFloatField;
    quRashod2NameTovar: TStringField;
    quRashod2NameCompany: TStringField;
    quRashod2VidName: TStringField;
    quRashod2AvgPriceIn: TFloatField;
    frDBDataSet7: TfrDBDataSet;
    frReport7: TfrReport;
    quRashod2EdIzm: TStringField;
    quNaklR2DateNakl: TDateTimeField;
    quPrintPostRegionNo: TSmallintField;
    quPrintPostAddress: TStringField;
    quSaleSotrudTipTovar: TMSQuery;
    quSaleSotrudSumm: TMSQuery;
    frDBDataSet8: TfrDBDataSet;
    frReport8: TfrReport;
    dsSaleSotrudTipTovar: TDataSource;
    DataSource2: TDataSource;
    quSaleSotrudTipTovarTipName: TStringField;
    quSaleSotrudTipTovarSotrudName: TStringField;
    quSaleSotrudTipTovarSumm: TFloatField;
    mdSaleSotrudTipTovar: TRxMemoryData;
    quSaleSotrudSummSotrudName: TStringField;
    quSaleSotrudSummSumma: TFloatField;
    quSaleSotrudSummSummaDolg: TFloatField;
    quSaleSotrudSummSummaPercent: TFloatField;
    frUserDataset4: TfrUserDataset;
    DBSumList1: TDBSumList;
    quExcelDanon: TMSQuery;
    quExcelDanonTovarNo: TSmallintField;
    quExcelDanonDateNakl: TDateTimeField;
    quExcelDanonNameLong: TStringField;
    quExcelDanonKol: TFloatField;
    quExcelDanonWeightTovar: TFloatField;
    quExcelDanonRegionName: TStringField;
    quExcelDanonNameTovar: TStringField;
    ProgressBar1: TProgressBar;
    quExcelDanonCodReport: TStringField;
    quSotrudDolg: TMSQuery;
    quSotrudDolgSotrudName: TStringField;
    quSotrudDolgPostNoFirst: TSmallintField;
    quSotrudDolgName: TStringField;
    quSotrudDolgAddressNo: TSmallintField;
    quSotrudDolgAddress: TStringField;
    quSotrudDolgSumma: TFloatField;
    quSotrudDolgSummaDolg: TFloatField;
    quSotrudDolgNoClose: TMSQuery;
    mdSotrudDolg: TRxMemoryData;
    mdSotrudDolgSotrudName: TStringField;
    mdSotrudDolgSummaAll: TFloatField;
    mdSotrudDolgSummaDolgAll: TFloatField;
    mdSotrudDolgSumma: TFloatField;
    mdSotrudDolgSummaDolg: TFloatField;
    quSotrudDolgNoCloseSotrudName: TStringField;
    quSotrudDolgNoClosePostNoFirst: TSmallintField;
    quSotrudDolgNoCloseName: TStringField;
    quSotrudDolgNoCloseAddressNo: TSmallintField;
    quSotrudDolgNoCloseAddress: TStringField;
    quSotrudDolgNoCloseSumma: TFloatField;
    quSotrudDolgNoCloseSummaDolg: TFloatField;
    mdSotrudDolgPostNo: TIntegerField;
    mdSotrudDolgAddressNo: TIntegerField;
    mdSotrudDolgAddressName: TStringField;
    mdSotrudDolgPostName: TStringField;
    frReport9: TfrReport;
    frDBDataSet9: TfrDBDataSet;
    dsSotrudDolg: TDataSource;
    quPresidentOtchet: TMSQuery;
    quPresidentOtchetCodReport: TStringField;
    quPresidentOtchetTovarNo: TSmallintField;
    quPresidentOtchetNameTovar: TStringField;
    quPresidentOtchetDateNakl: TDateTimeField;
    quPresidentOtchetNameLong: TStringField;
    quPresidentOtchetKol: TFloatField;
    quPresidentOtchetWeightTovar: TFloatField;
    quPresidentOtchetRegionName: TStringField;
    quExcelTara: TMSQuery;
    quExcelTaraDateNakl: TDateTimeField;
    quExcelTaraKol: TFloatField;
    quExcelTaraNaklNo: TIntegerField;
    quExcelTaraPrice: TFloatField;
    quExcelTaraBuh: TSmallintField;
    quExcelTaraVidNo: TSmallintField;
    quExcelTaraName: TStringField;
    quExcelTaraNameTovar: TStringField;
    quExcelTaraRashod: TIntegerField;
    spSalarySotrudPlat: TMSStoredProc;
    spSalarySotrudPlatDatePlat: TDateTimeField;
    spSalarySotrudPlatSummaPlat: TFloatField;
    spSalarySotrudPlatName: TStringField;
    spSalarySotrudPlatNom: TIntegerField;
    spSalarySotrudPlatSummaToNakl: TFloatField;
    spSalarySotrudPlatGroupBy: TIntegerField;
    spSalarySotrudPlatNamePercent: TStringField;
    spSalarySotrudPlatNaklNo: TIntegerField;
    spSalarySotrudPlatValuePercent2: TFloatField;
    spSalarySotrudPlatDateNaklFirst: TDateTimeField;
    spSalarySotrudPlatKolDay: TFloatField;
    spSalarySotrudPlatColnPrice: TSmallintField;
    quWork: TMSQuery;
    spCountPercentSalaryForNakl: TMSStoredProc;
    spCountPercentSalaryForNaklPercentSalary: TFloatField;
    quPercentsSalary: TMSQuery;
    quPercentsSalaryPercentNo: TSmallintField;
    quPercentsSalaryNamePercent: TStringField;
    quPercentsSalaryValuePercent2: TFloatField;
    dsSalarySotrudPlat: TDataSource;
    frDBDataSet10: TfrDBDataSet;
    frReport10: TfrReport;
    quPresidentTovar: TMSQuery;
    StringField1: TStringField;
    SmallintField1: TSmallintField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    StringField3: TStringField;
    BCDField1: TFloatField;
    BCDField2: TFloatField;
    StringField4: TStringField;
    quSotrudDolgPodotchet: TMSQuery;
    quSotrudDolgPodotchetDateNakl: TDateTimeField;
    quSotrudDolgPodotchetSotrudName: TStringField;
    quSotrudDolgPodotchetPodotchetNom: TStringField;
    quSotrudDolgPodotchetDatePodotche: TDateTimeField;
    quSotrudDolgPodotchetNom: TIntegerField;
    quSotrudDolgPodotchetName: TStringField;
    quSotrudDolgPodotchetSumma: TFloatField;
    quSotrudDolgPodotchetSummaPlat: TFloatField;
    dsSotrudDolgPodotchet: TDataSource;
    frReport11: TfrReport;
    frDBDataSet11: TfrDBDataSet;
    quNaklRNaklNo: TIntegerField;
    quNaklRNomFirst: TStringField;
    quNaklRPostNo: TSmallintField;
    quNaklRDateNaklFirst: TDateTimeField;
    quNaklRSummaDolg: TFloatField;
    quNaklRBuh: TSmallintField;
    quNaklRVidNaklNo: TSmallintField;
    quNaklRName: TStringField;
    quNaklRNoSvidNDS: TStringField;
    quNaklRCodeNDS: TStringField;
    quNaklRAddress: TStringField;
    quNaklRPhone: TStringField;
    quNaklRRS: TStringField;
    quNaklRMFO: TStringField;
    quNaklRNameBank: TStringField;
    quNaklRAddressBank: TStringField;
    quNaklROKPO: TStringField;
    quNaklRNotPlatNDS: TBooleanField;
    quNaklRContact: TStringField;
    quRashodRasNo: TSmallintField;
    quBuh_1: TMSQuery;
    quLoadCarPost: TMSQuery;
    quLoadCarPostPostNo: TSmallintField;
    quLoadCarPostAddressNo: TSmallintField;
    quLoadCarPostAddress: TStringField;
    quLoadCarPostName: TStringField;
    quLoadCarTovar: TMSQuery;
    quLoadCarTovarTovarNo: TSmallintField;
    quLoadCarTovarNameTovar: TStringField;
    quLoadCarTovarKolvo: TFloatField;
    mdLoadCar: TRxMemoryData;
    quLoadCarTovarKolPerPak: TSmallintField;
    quLoadCarTovarVidName: TStringField;
    dsLoadCar: TDataSource;
    frReport12: TfrReport;
    frDBdsLoadCar: TfrDBDataSet;
    frUDLoadCar: TfrUserDataset;
    quLoadNakl: TMSQuery;
    IntegerField2: TIntegerField;
    quTovarVidName: TMSQuery;
    quTovarVidNameNameTovar: TStringField;
    quTovarVidNameTovarNo: TSmallintField;
    quTovarVidNameVidName: TStringField;
    quLoadCarTovarSumm: TFloatField;
    quLoadCarTovarWeight: TFloatField;
    
    quNaklRPrint: TMSQuery;
    quRashodPrint: TMSQuery;
    quRashodPrintKol: TFloatField;
    quRashodPrintPriceOut: TFloatField;
    quRashodPrintNameTovar: TStringField;
    quRashodPrintVidName: TStringField;
    quRashodPrintPriceWithNDS: TBooleanField;
    quRashodPrintEdIzm: TStringField;

    quNaklRPrintDateNakl: TDateTimeField;
    quNaklRPrintSumma: TFloatField;
    quNaklRPrintNom: TIntegerField;
    quNaklRPrintNameLong: TStringField;
    quNaklRPrintDogovorNo: TStringField;
    quNaklRPrintDateDogovor: TDateTimeField;
    quNaklRPrintAddress: TStringField;

    frReportPrintNakl: TfrReport;
    frDBdsPrintNakl: TfrDBDataSet;
    dsPrintNakl: TDataSource;
    quRashodPrintKolvo: TMSQuery;
    quRashodPrintKolvoKolvo: TFloatField;
    quMaster: TMSQuery;
    quMasterSotrudName: TStringField;
    quMasterNom: TIntegerField;
    quMasterName: TStringField;
    quMasterPhone: TStringField;
    quMasterPSrok: TIntegerField;
    quMasterDateNakl: TDateTimeField;
    quMasterSummaDolg: TFloatField;
    quMasterDateOpl: TDateTimeField;
    quMasterContactFace: TStringField;
    quMasterBuhName: TStringField;
    quMasterSumma: TFloatField;
    quMasterSummaPlat: TFloatField;
    Label1: TLabel;
    quLoadCarPostP: TMSQuery;
    quLoadCarPostPPostNo: TSmallintField;
    quLoadCarPostPName: TStringField;
    quTovarVidNameP: TMSQuery;
    quTovarVidNamePNameTovar: TStringField;
    quTovarVidNamePTovarNo: TSmallintField;
    quTovarVidNamePVidName: TStringField;
    quLoadCarTovarP: TMSQuery;
    quLoadCarTovarPTovarNo: TSmallintField;
    quLoadCarTovarPNameTovar: TStringField;
    quLoadCarTovarPKolvo: TFloatField;
    quLoadCarTovarPKolPerPak: TSmallintField;
    quLoadCarTovarPVidName: TStringField;
    quLoadCarTovarPSumm: TFloatField;
    dsLoadCarP: TDataSource;
    frReport13: TfrReport;
    frDBdsLoadCarP: TfrDBDataSet;
    frUDLoadCarP: TfrUserDataset;
    quLoadNaklP: TMSQuery;
    IntegerField3: TIntegerField;

    quNaklRPrintWeight: TFloatField;
    quNaklRPrintKolPerPak: TFloatField;
    quNaklRPrintOKPO: TStringField;
    quRashodPrintWeight: TFloatField;
    quRashodPrintKolPerPak: TSmallintField;
    quNaklRPrintCarsName: TStringField;
    quNaklRPrintCarsDriver: TStringField;
    quNaklRPrintCarsType: TStringField;
    quNaklRPrintCarsNomer: TStringField;
    quNaklRPrintCarsOKPO: TStringField;
    dsPrintNaklTransport: TDataSource;
    frDBDSPrintNaklTransport: TfrDBDataSet;
    frReportPrintNaklTransport: TfrReport;
    quNaklRPrintCarsFirma: TStringField;
    quSotrudDolgNew: TMSQuery;
    dsSotrudDolgNew: TDataSource;
    frDBdsSotrudDolgNew: TfrDBDataSet;
    frReportSotrudDolgNew: TfrReport;
    quSotrudDolgNewNom: TIntegerField;
    quSotrudDolgNewSummaDolg: TFloatField;
    quSotrudDolgNewSumma: TFloatField;
    quSotrudDolgNewSummaPlat: TFloatField;
    quSotrudDolgNewDateNakl: TDateTimeField;
    quSotrudDolgNewDateOpl: TDateTimeField;
    quSotrudDolgNewSotrudName: TStringField;
    quSotrudDolgNewName: TStringField;
    quSotrudDolgNewContactFace: TStringField;
    quSotrudDolgNewPhone: TStringField;
    quSotrudDolgNewBuhName: TStringField;
    quSotrudDolgNewVIP: TBooleanField;
    quSotrudDolgNewPSrok: TIntegerField;
    spZPSotrudPlat: TMSStoredProc;
    dsZPSotrudPlat: TDataSource;
    frDBdsZPSotrudPlat: TfrDBDataSet;
    frReportZPSotrudPlat: TfrReport;
    quPercentsZP: TMSQuery;
    quPercentsZPPercentNo: TSmallintField;
    quPercentsZPNamePercent: TStringField;
    quPercentsZPValuePercent2: TFloatField;
    spCountPercentZPForNakl: TMSStoredProc;
    spCountPercentZPForNaklPercentSalary: TFloatField;
    spZPSotrudPlatDatePlat: TDateTimeField;
    spZPSotrudPlatSummaPlat: TFloatField;
    spZPSotrudPlatName: TStringField;
    spZPSotrudPlatNom: TIntegerField;
    spZPSotrudPlatSummaToNakl: TFloatField;
    spZPSotrudPlatGroupBy: TIntegerField;
    spZPSotrudPlatNamePercent: TStringField;
    spZPSotrudPlatNaklNo: TIntegerField;
    spZPSotrudPlatValuePercent2: TCurrencyField;
    spZPSotrudPlatDateNaklFirst: TDateTimeField;
    spZPSotrudPlatKolDay: TFloatField;
    spZPSotrudPlatColnPrice: TSmallintField;
    spZPSotrudPlatVip: TBooleanField;
    spCrossPostCompanyOld: TMSStoredProc;
    quRashod3: TMSQuery;
    frDBRashod3: TfrDBDataSet;
    DSRashod3: TDataSource;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxPDFExport1: TfrxPDFExport;
    RepDataSet: TfrxDBDataset;
    QuRepQuery: TMSQuery;
    frxReport: TfrxReport;
    quMasterAddress: TStringField;
    quSotrudDolgNewAddress: TStringField;
    frRTFExport1: TfrRTFExport;
    frOLEExcelExport1: TfrOLEExcelExport;
    frXMLExcelExport1: TfrXMLExcelExport;
    frDesigner1: TfrDesigner;
    frCSVExport1: TfrCSVExport;
    frTextExport1: TfrTextExport;
    frRtfAdvExport1: TfrRtfAdvExport;
    frDialogControls1: TfrDialogControls;
    quNaklRPrintOurFirmName: TStringField;
    quNaklRPrintContract_Name: TStringField;
    quNaklRPrintExpeditionNo: TIntegerField;
    Otchet_TTN: TMSQuery;
    quNaklRPrintOurOKPO: TStringField;
    quNaklRPrintOurAdres: TStringField;
    quNaklRPrintPostNo: TSmallintField;
    dsRashodPrintNew: TDataSource;
    quRashodPrintNew: TMSQuery;
    quRashodPrintNewKol: TFloatField;
    quRashodPrintNewPriceOut: TFloatField;
    quRashodPrintNewNameTovar: TStringField;
    quRashodPrintNewVidName: TStringField;
    quRashodPrintNewPriceWithNDS: TBooleanField;
    quRashodPrintNewEdIzm: TStringField;
    quRashodPrintNewWeight: TFloatField;
    quRashodPrintNewKolPerPak: TSmallintField;
    quRashodPrintNewSocial: TBooleanField;
    quRashodPrintSocial: TBooleanField;
    quRashodPrintAvgPriceIn: TFloatField;
    quRashodPrintArticle: TIntegerField;
    quNaklRPrintNaklNo: TIntegerField;
    quNaklRPrintContract_id: TIntegerField;
    quNaklRPrintCar: TStringField;
    quNaklRPrintDriver: TStringField;
    quNaklRPrintContract_Nom: TStringField;
    quNaklRPrintContract_date: TStringField;
    quNaklRPrintContract_type: TStringField;
    quLoadCarTovarBarCode: TStringField;
    frBarCodeObject1: TfrBarCodeObject;
    quRashodPrintWithNoNDS: TBooleanField;
    quNaklRPrintNDS: TFloatField;
    quNaklRPrintNoNDS: TFloatField;
    quNaklRPrintisTovNoNDS: TIntegerField;
    quNaklRPrintPhisicalAddress: TStringField;
    quNaklRPrintTypeReturn: TStringField;
    quNaklRPrintDescription: TStringField;
    quRashodPrintStavNDS: TIntegerField;
    quRashodPrintPriceNoNds: TFloatField;
    quRashodPrintSummaWIthNoNds: TFloatField;
    quRashodPrintPriceInInst: TFloatField;
    quRashodPrintBarCode: TLargeintField;
    quRashodPrintIsStavNDS: TIntegerField;
    quTovarVidNameOtdelName: TStringField;
    
    procedure frReport3GetValue(const ParName: String;
      var ParValue: Variant);
    procedure frUserDataset1First(Sender: TObject);
    procedure frUserDataset1Next(Sender: TObject);
    procedure frUserDataset1CheckEOF(Sender: TObject; var EOF: Boolean);
    procedure frReport4GetValue(const ParName: String;
      var ParValue: Variant);
    procedure frUserDataset2First(Sender: TObject);
    procedure frUserDataset2Next(Sender: TObject);
    procedure frUserDataset2CheckEOF(Sender: TObject; var EOF: Boolean);
    procedure frReport5GetValue(const ParName: String;
      var ParValue: Variant);
    procedure frUserDataset3First(Sender: TObject);
    procedure frUserDataset3Next(Sender: TObject);
    procedure frUserDataset3CheckEOF(Sender: TObject; var EOF: Boolean);
    procedure frReport6GetValue(const ParName: String;
      var ParValue: Variant);
    procedure frReport4BeginDoc;
    procedure frReport5BeginDoc;
    procedure frReport6BeginDoc;
    procedure frReport7GetValue(const ParName: String;
      var ParValue: Variant);
    procedure frReport8GetValue(const ParName: String;
      var ParValue: Variant);
    procedure frUserDataset4CheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frUserDataset4First(Sender: TObject);
    procedure frUserDataset4Next(Sender: TObject);
    procedure frReport9GetValue(const ParName: String;
      var ParValue: Variant);
    procedure frUDLoadCarCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frUDLoadCarFirst(Sender: TObject);
    procedure frUDLoadCarNext(Sender: TObject);
    procedure frReport12GetValue(const ParName: String;
      var ParValue: Variant);
    procedure frReportPrintNaklGetValue(const ParName: String;
      var ParValue: Variant);
    procedure quMasterCalcFields(DataSet: TDataSet);
    procedure frUDLoadCarPCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frUDLoadCarPFirst(Sender: TObject);
    procedure frUDLoadCarPNext(Sender: TObject);
    procedure frReport13GetValue(const ParName: String;
      var ParValue: Variant);
    procedure frReportPrintNaklTransportGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frReportSotrudDolgNewGetValue(const ParName: String;
      var ParValue: Variant);
    procedure quSotrudDolgNewCalcFields(DataSet: TDataSet);
    procedure frReportZPSotrudPlatGetValue(const ParName: String;
      var ParValue: Variant);
  private
    { Private declarations }
    RepTitle:string;
    Coln:Integer;
    Summa:Currency;
  public
    { Public declarations }
  end;
type PSummaPeriod=^TSummaPeriod;
     TSummaPeriod=record
      Period:string;
      Summa :double;
      SummaGroup:Currency;
end;
type
     PSummaCP=^TSummaCP;
     TSummaCP=record
      CompanyNo :SmallInt;
      KolRow    :SmallInt;
      Summa     :Currency;
      {текущая группа}
      SummaGroup:Currency;
      SummaVipGroup:Currency;
      SummaRozGroup:Currency;

end;

var
  fmOtchets: TfmOtchets;
  ListSum:TList;
  ReportTitle: String;
  LoadCarNakls, LoadCarPostNoCar:string;
  LoadCarDlgSpravkaShow, LoadCarPreview: Boolean;
  LoadCarCar, LoadCarExpedition: String;
  LoadCarDateBegin: String;
  CarDateBegin,CarDateEnd: TDate;
  LoadCarWeigth, LoadCarSumm, LoadCarKolPak: Extended;
  Summa1,Summa2,Summa3,SummCol: Extended;
  Osnova: string;
  ColRow: integer;
  KolTovar: Extended;
  WidthTovar: Extended;
  WidthTovar1: Extended;
  Params: TStrings;
  procedure PrintNaklTransportRasNew(NaklNo:integer; Preview, Print3: Boolean);
  procedure PrintNaklRShort(NaklNo:integer; Preview: Boolean);
  procedure PrintSchet(NaklNo:integer; Preview: Boolean);
  procedure PrintPost;
  procedure NotCompletOrder;
  procedure NotCompletOrderPost;
  procedure SaleCompanyPeriod;
  procedure SaleCompanyPeriodExcel;
  procedure SaleCustomersPeriod;
  procedure SaleCustomersPeriodExcel;
  procedure CrossPostCompany(Returne: Boolean);
  procedure CrossPostCompanyExcel(Returne: Boolean);
  procedure LoadCarNakl(Nakls:string);
  procedure LoadCarNaklTreb(Nakls:string);
  procedure LoadCarNaklTrebIM(Nakls:string);
  procedure LoadCarNaklTrebPostIM(Nakls:string);
  procedure PrintSaleSotrudTipTovar;
  procedure ExcelDanon;
  procedure ExcelTara;
  procedure SotrudDolg;
  procedure SalarySotrudPercentNew;
  procedure SotrudDolgPodotchet;
  procedure LoadCarNew(Copies: Integer; Nakls, PostNoCar:string; DlgSpravkaShow, Preview: Boolean; Car, Expedition: String; DateBegin: TDate);
  procedure LoadCarNoTTNew(
            Copies: Integer; Nakls, PostNoCar:string; DlgSpravkaShow, Preview: Boolean;
            Car, Expedition: String; DateBegin: TDate; DesignCode: Integer = 0);
  procedure PrintNaklRasNew( NaklNo:integer; Dlg, Preview, Buh, Print3: Boolean;
                             SecretKeyPressed: Boolean = False);
  procedure PrintNaklDesign(NaklNo:integer; Dlg, Preview, Buh, Print3: Boolean);
  procedure DolgSotrudExcel;
  procedure LoadCarNewP(Nakls:string; DateBegin,DateEnd: TDate);
  procedure SotrudDolgNew(Preview: Boolean);
  procedure ZPSotrudPercent;
  function IntToStringUkrKg(Value: LongInt): string;
  function UkrRecognizeAmount(Amount: real; CurrName, CurrSubname: string): string;

implementation

uses UtilsDataConvert, SelectItem0, GetDate0, GetPeriodDate0, data, Sotrud0,
  GetSpravka3, GetSpravka2, EditPost0, main, UFastDatasetView;

{$R *.DFM}
procedure ZPSotrudPercent;
var
 Period:TPeriodDate;
 SotrudNo:integer;
begin
 Summa1:=0;
 Summa2:=0;
 Summa3:=0;
 Period:=ZapDate(4);
 if Period[1]=0 then exit;

 SotrudNo:=Sotrud(True);
 if SotrudNo=0 then exit;

 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 try
 with fmOtchets do
  begin
   quWork.SQL.Clear;
   quWork.SQL.Add('select SotrudName from Sotrud where SotrudNo=:SotrudNo');
   quWork.ParamByName('SotrudNo').AsInteger:=SotrudNo;
   quWork.Open;
   ReportTitle:=quWork.FieldByName('SotrudName').AsString+'  '+DateToStr(Period[1])+' - '+DateToStr(Period[2]);
   quWork.Close;
   quPercentsZP.Open;
   spZPSotrudPlat.ParamByName('DateBegin').AsDate:=Period[1];
   spZPSotrudPlat.ParamByName('DateEnd').AsDate:=Period[2];
   spZPSotrudPlat.ParamByName('SotrudNo').AsSmallInt:=SotrudNo;
   spZPSotrudPlat.Open;
   Screen.Cursor:=crDefault;
   frReportZPSotrudPlat.LoadFromFile('ZPSotrudNew.frf');
   frReportZPSotrudPlat.ShowReport;
  end;

 finally
 fmOtchets.quPercentsZP.Close;
 fmOtchets.spZPSotrudPlat.Close;
 fmOtchets.Free;
 Screen.Cursor:=crDefault;
 end;
end;

procedure SotrudDolgNew(Preview: Boolean);
//Buh=False Без шапки
//Buh=True С шапкой
var
 SotrudNo: integer;
begin
 fmOtchets:=TfmOtchets.Create(Application);
 try
  with fmOtchets do
   begin
    if Application.MessageBox('По всем ?','Долги по менеджерам',MB_YESNO)=IDYES then
     begin
     end
    else
     begin
      SotrudNo:=Sotrud(True);
      quSotrudDolgNew.Close;
      quSotrudDolgNew.MacroByName('_Sotrud').Value:=' and (NaklR.SotrudNo=:SotrudNo) ';
      quSotrudDolgNew.Prepare;
      quSotrudDolgNew.ParamByName('SotrudNo').AsInteger:=SotrudNo;
     end;
    Screen.Cursor:=crHourGlass;
    quSotrudDolgNew.Open;
    Screen.Cursor:=crDefault;
    frReportSotrudDolgNew.LoadFromFile('SotrudDolgNew.frf');
    if Preview then
     frReportSotrudDolgNew.ShowReport
    else
     begin
      frReportSotrudDolgNew.PrepareReport;
      frReportSotrudDolgNew.PrintPreparedReport('', 1, True, frAll);
     end;
   end;
 finally
  fmOtchets.quSotrudDolgNew.Close;
  fmOtchets.Free;
 end;
end;

procedure DolgSotrudExcel;
var
 XLApp,Sheet,Colum:Variant;
 SotrudNo:integer;
 ColumnsCount, RowCount, i:Integer;

// ColumnsCount, RowCount, Cycle, i:Integer;
// ColumnName, ConvertParValue: String;
// KolDay:string;
// RowSumm: Extended;
 SotrudName: String;
// SumGroup, SumAll: array of Extended;
begin
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Nil);
 try
 with fmOtchets do
  begin
   if Application.MessageBox('По всем ?','Долги по менеджерам',MB_YESNO)=IDYES then
    begin
    end
   else
    begin
     SotrudNo:=Sotrud(True);
     quMaster.MacroByName('_Sotrud').Value:=' and (NaklR.SotrudNo=:SotrudNo) ';
     quMaster.Prepare;
     quMaster.ParamByName('SotrudNo').AsInteger:=SotrudNo;
    end;
   quMaster.Open;
   //
   fmOtchets.Width:=388;
   fmOtchets.Height:=61;
   //fmOtchets.ShowModal;
   fmOtchets.Position:=poScreenCenter;
   fmOtchets.Caption:='Подготовка отчета';
   XLApp:= CreateOleObject('Excel.Application');
   XLApp.Workbooks.Add(-4167);
   XLApp.Workbooks[1].WorkSheets[1].Name:='Отчёт';
   Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт'].Columns;

   ColumnsCount:=quMaster.FieldCount;
   Colum.Columns[1].ColumnWidth:=5;
   Colum.Columns[2].ColumnWidth:=8;
   Colum.Columns[3].ColumnWidth:=10;
   Colum.Columns[4].ColumnWidth:=7;
   Colum.Columns[5].ColumnWidth:=28;
   Colum.Columns[6].ColumnWidth:=9;
   Colum.Columns[7].ColumnWidth:=9;
   Colum.Columns[8].ColumnWidth:=9;
   Colum.Columns[9].ColumnWidth:=25;
   Colum.Columns[10].ColumnWidth:=25;

   Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт'].Rows;
   Colum.Rows[1].Font.Bold:=true;
   Colum.Rows[1].Font.Color:=clNavy;
   Colum.Rows[1].Font.Size:=14;

   Sheet:=XLApp.Workbooks[1].WorkSheets['Отчёт'];
   Sheet.Cells[1,1]:='Отчёт "Долги по менеджерам " за период: '+DateToStr(Now);

   ProgressBar1.Min := 0;
   ProgressBar1.Max := fmOtchets.quMaster.RecordCount;
   Show;
   Update;

   SotrudName:='';
   RowCount:=2;


   quMaster.First;
   while not quMaster.Eof do
    begin
     if SotrudName<>quMasterSotrudName.AsString then
      begin
       SotrudName:=quMasterSotrudName.AsString;
       for i:=1 to ColumnsCount-1 do
        begin
         //Sheet.Cells.Item[RowCount, i].Interior.Color := clWhite;
         Sheet.Cells.Item[RowCount, i].Font.Italic:=true;
         Sheet.Cells.Item[RowCount, i].Font.Bold:=true;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
         Sheet.Cells[RowCount,1]:=SotrudName;
        end;
       Sheet.Cells.Item[RowCount, 1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount, ColumnsCount-1].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
       RowCount:=RowCount+1;

       for i:=1 to ColumnsCount-1 do
        begin
         Sheet.Cells.Item[RowCount, i].Interior.Color := clSilver;
         Sheet.Cells.Item[RowCount, i].Font.Bold:=true;
         Sheet.Cells.Item[RowCount, i].HorizontalAlignment := xlCenter;
         Sheet.Cells.Item[RowCount, i].VerticalAlignment := xlCenter;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].WrapText := True;
        end;
       Sheet.Cells[RowCount,1]:='Дней';
       Sheet.Cells[RowCount,2]:='№';
       Sheet.Cells[RowCount,3]:='Дата';
       Sheet.Cells[RowCount,4]:='Тип';
       Sheet.Cells[RowCount,5]:='Покупатель';
       Sheet.Cells[RowCount,6]:='Сумма накл.';
       Sheet.Cells[RowCount,7]:='Опл. по накл.';
       Sheet.Cells[RowCount,8]:='Долг по накл.';
       Sheet.Cells[RowCount,9]:='Адрес';
       Sheet.Cells[RowCount,10]:='Контактное лицо';
       RowCount:=RowCount+1;
       Sheet.Cells[RowCount,1]:=quMasterPSrok.AsInteger;// 'Дней';
       Sheet.Cells[RowCount,2]:=quMasterNom.AsInteger; //'№';
       Sheet.Cells[RowCount,3]:=quMasterDateNakl.AsDateTime; //'Дата';
       Sheet.Cells[RowCount,4]:=quMasterBuhName.AsString; //'Тип';
       Sheet.Cells[RowCount,5]:=quMasterName.AsString; //'Покупатель';
       Sheet.Cells[RowCount,6]:=quMasterSumma.AsFloat; //'Сумма накл.';
       Sheet.Cells[RowCount,7]:=quMasterSummaPlat.AsFloat; //'Опл. по накл.';
       Sheet.Cells[RowCount,8]:=quMasterSummaDolg.AsFloat; //'Долг по накл.';
       Sheet.Cells[RowCount,9]:=quMasterAddress.AsString; //'Address';
       Sheet.Cells[RowCount,10]:=quMasterContactFace.AsString; //'Контактное лицо';
       RowCount:=RowCount+1;
      end
     else
      begin
       {for i:=1 to ColumnsCount-1 do
        begin
         Sheet.Cells.Item[RowCount, i].Interior.Color := clWhite;
         Sheet.Cells.Item[RowCount, i].Font.Bold:=False;
         Sheet.Cells.Item[RowCount, i].HorizontalAlignment := xlCenter;
         Sheet.Cells.Item[RowCount, i].VerticalAlignment := xlCenter;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].WrapText := False;
        end;}
       Sheet.Cells[RowCount,1]:=quMasterPSrok.AsInteger;// 'Дней';
       Sheet.Cells[RowCount,2]:=quMasterNom.AsInteger; //'№';
       Sheet.Cells[RowCount,3]:=quMasterDateNakl.AsDateTime; //'Дата';
       Sheet.Cells[RowCount,4]:=quMasterBuhName.AsString; //'Тип';
       Sheet.Cells[RowCount,5]:=quMasterName.AsString; //'Покупатель';
       Sheet.Cells[RowCount,6]:=quMasterSumma.AsFloat; //'Сумма накл.';
       Sheet.Cells[RowCount,7]:=quMasterSummaPlat.AsFloat; //'Опл. по накл.';
       Sheet.Cells[RowCount,8]:=quMasterSummaDolg.AsFloat; //'Долг по накл.';
       Sheet.Cells[RowCount,9]:=quMasterAddress.AsString; //'Address';
       Sheet.Cells[RowCount,10]:=quMasterContactFace.AsString; //'Контактное лицо';
       RowCount:=RowCount+1;
      end;
     quMaster.Next;
     ProgressBar1.StepBy(1);
     Update;
    end;



{   spSaleCustomersPeriods.First;
   SotrudName:=spSaleCustomersPeriods.FieldByName('SotrudName').AsString;
   for i:=1 to ColumnsCount-1 do
    begin
     Sheet.Cells.Item[3, i].Interior.Color := clSkyBlue;
     Sheet.Cells.Item[3, i].Font.Italic:=true;
     Sheet.Cells.Item[3, i].Font.Bold:=true;
     Sheet.Cells.Item[3, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     Sheet.Cells.Item[3, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
     Sheet.Cells[3,1]:=SotrudName;
    end;
   Sheet.Cells.Item[3, 1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
   Sheet.Cells.Item[3, ColumnsCount-1].Borders.Item[xlEdgeRight].Linestyle := xlSolid;

   RowCount:=4;
   SetLength(SumGroup, ColumnsCount);
   SetLength(SumAll, ColumnsCount);
   for i:=0 to ColumnsCount-1 do
    begin
     SumGroup[i]:=0;
     SumAll[i]:=0;
    end;

   while not spSaleCustomersPeriods.Eof do
    begin
     if not (SotrudName=spSaleCustomersPeriods.FieldByName('SotrudName').AsString) then
      begin
       Colum.Rows[RowCount].Font.Bold:=true;
       Colum.Rows[RowCount].Font.Italic:=True;
       for i:=1 to ColumnsCount-2 do
        begin
         if i=1 then
          begin
           Sheet.Cells[RowCount,2]:='Итого';
           Sheet.Cells.Item[RowCount, 2].HorizontalAlignment := xlRight;
           Sheet.Cells.Item[RowCount, 1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
           Sheet.Cells.Item[RowCount, 2].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
          end;
         if i=2 then
          begin
           Sheet.Cells[RowCount,ColumnsCount-1]:=SumGroup[i];
           SumAll[i]:=SumAll[i]+SumGroup[i];
           SumGroup[i]:=0;
           Sheet.Cells.Item[RowCount,ColumnsCount-1].Interior.Color := clYellow;
           Sheet.Cells.Item[RowCount,ColumnsCount-1].Font.Italic:=true;
           Sheet.Cells.Item[RowCount,ColumnsCount-1].Font.Bold:=true;
           Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
           Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
           Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
           Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
          end;
         if i>2 then
          begin
           Sheet.Cells[RowCount,i]:=SumGroup[i];
           SumAll[i]:=SumAll[i]+SumGroup[i];
           SumGroup[i]:=0;
           Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
           Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
          end;
         Sheet.Cells.Item[RowCount, i].Interior.Color := clYellow;
         Sheet.Cells.Item[RowCount, i].Font.Italic:=true;
         Sheet.Cells.Item[RowCount, i].Font.Bold:=true;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
        end;
       RowCount:=RowCount+1;
       SotrudName:=spSaleCustomersPeriods.FieldByName('SotrudName').AsString;
       for i:=1 to ColumnsCount-1 do
        begin
         Sheet.Cells.Item[RowCount, i].Interior.Color := clSkyBlue;
         Sheet.Cells.Item[RowCount, i].Font.Italic:=true;
         Sheet.Cells.Item[RowCount, i].Font.Bold:=true;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
         Sheet.Cells[RowCount,1]:=SotrudName;
        end;
        Sheet.Cells.Item[RowCount, 1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
        Sheet.Cells.Item[RowCount, ColumnsCount-1].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
       RowCount:=RowCount+1;
      end;

     RowSumm:=0.00;
     for i:=1 to ColumnsCount-1 do
      begin
       if i=1 then
        Sheet.Cells[RowCount,i]:=spSaleCustomersPeriods.Fields[i].AsString;
       if i=3 then
        Sheet.Cells[RowCount,i-1]:=spSaleCustomersPeriods.Fields[i].AsString;
       if i>=4 then
        begin
         Sheet.Cells[RowCount,i-1]:=spSaleCustomersPeriods.Fields[i].AsFloat;
         SumGroup[i-1]:=SumGroup[i-1]+spSaleCustomersPeriods.Fields[i].AsFloat;
         RowSumm:=RowSumm+spSaleCustomersPeriods.Fields[i].AsFloat;
        end;
       Sheet.Cells.Item[RowCount,i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
      end;
     Sheet.Cells[RowCount,ColumnsCount-1]:=RowSumm;
     SumGroup[2]:=SumGroup[2]+RowSumm;

     RowCount:=RowCount+1;
     ProgressBar1.StepBy(1);
     spSaleCustomersPeriods.Next;
    end;

   Colum.Rows[RowCount].Font.Bold:=true;
   Colum.Rows[RowCount].Font.Italic:=True;
   for i:=1 to ColumnsCount-2 do
    begin
     if i=1 then
      begin
       Sheet.Cells[RowCount,2]:='Итого';
       Sheet.Cells.Item[RowCount, 2].HorizontalAlignment := xlRight;
       Sheet.Cells.Item[RowCount, 1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount, 2].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
      end;
     if i=2 then
      begin
       Sheet.Cells[RowCount,ColumnsCount-1]:=SumGroup[i];
       SumAll[i]:=SumAll[i]+SumGroup[i];
       SumGroup[i]:=0;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Interior.Color := clYellow;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Font.Italic:=true;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Font.Bold:=true;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
      end;
     if i>2 then
      begin
       Sheet.Cells[RowCount,i]:=SumGroup[i];
       SumAll[i]:=SumAll[i]+SumGroup[i];
       SumGroup[i]:=0;
       Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
      end;
     Sheet.Cells.Item[RowCount, i].Interior.Color := clYellow;
     Sheet.Cells.Item[RowCount, i].Font.Italic:=true;

     Sheet.Cells.Item[RowCount, i].Font.Bold:=true;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
    end;

   RowCount:=RowCount+1;
   Colum.Rows[RowCount].Font.Bold:=true;
   Colum.Rows[RowCount].Font.Italic:=True;
}   //
{   for i:=1 to ColumnsCount-2 do
    begin
     if i=1 then
      begin
       Sheet.Cells[RowCount,2]:='Всего';
       Sheet.Cells.Item[RowCount, 2].HorizontalAlignment := xlRight;
       Sheet.Cells.Item[RowCount, 1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount, 2].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
      end;
     if i=2 then
      begin
       Sheet.Cells[RowCount,ColumnsCount-1]:=SumAll[i];
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Interior.Color := clSilver;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Font.Italic:=true;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Font.Bold:=true;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
      end;
     if i>2 then
      begin
       Sheet.Cells[RowCount,i]:=SumAll[i];
       Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
      end;
     Sheet.Cells.Item[RowCount, i].Interior.Color := clSilver;
     Sheet.Cells.Item[RowCount, i].Font.Italic:=true;
     Sheet.Cells.Item[RowCount, i].Font.Bold:=true;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
    end;
}   //

  end;
 finally
 XLApp.Visible:=true;
 Screen.Cursor:=crDefault;
 fmOtchets.quMaster.Close;
 fmOtchets.Free;
 end;
end;

{procedure PrintNaklTransportRasNew(NaklNo:integer; Preview: Boolean);
//Buh=False  Без шапки
//Buh=True  С шапкой
var
  i: integer;
  b: Boolean;
begin
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 fmEditPost:=TfmEditPost.Create(Application);

 try
 with fmOtchets do
  begin


   quNaklRPrint.ParamByName('NaklNo').AsInteger:=NaklNo;
   quNaklRPrint.Open;
   quRashodPrint.ParamByName('NaklNo').AsInteger:=NaklNo;
   quRashodPrint.Open;
   quRashodPrintKolvo.ParamByName('NaklNo').AsInteger:=NaklNo;
   quRashodPrintKolvo.Open;
   fmEditPost.quTTN_Record.ParamByName('p_PostNo').AsInteger := fmOtchets.quNaklRPrintPostNo.AsInteger;
   fmEditPost.quTTN_Record.Open;
   fmEditPost.qu_Shipper.ParamByName('p_PostNo').AsInteger := fmOtchets.quNaklRPrintPostNo.AsInteger;
   fmEditPost.qu_Shipper.Open;

   b := fmEditPost.quTTN_RecordCheck1.Value;

   IsSelectItemTTN := True;
   if isPrintTTNForNight = true then i:=0 else i := SelectItem('Печать ТТН', ['ТТН новая', 'Расходная', 'Возвратная']);

   case i of
    0: frReportPrintNaklTransport.LoadFromFile('Tovarno_Transportnaya_New_1.frf');
    1: frReportPrintNaklTransport.LoadFromFile('Tovarno_Transportnaya_1_0.frf');
    2: frReportPrintNaklTransport.LoadFromFile('Tovarno_Transportnaya_1_0_1.frf');
   end;


//   frReportPrintNaklTransport.DesignReport;
   if Preview then
    frReportPrintNaklTransport.ShowReport
   else
    begin
     frReportPrintNaklTransport.PrepareReport;
     frReportPrintNaklTransport.PrintPreparedReport('', 1, True, frAll);
    end;
  end;
  finally
 IsSelectItemTTN := False;
 fmOtchets.quNaklRPrint.Close;
 fmOtchets.quRashodPrint.Close;
 fmOtchets.Free;
 fmEditPost.quTTN_Record.Close;
 fmEditPost.qu_Shipper.Close;
 fmEditPost.Free;
 Screen.Cursor:=crDefault;
 end;
end;}

procedure PrintNaklTransportRasNew(NaklNo:integer; Preview, Print3: Boolean);
//Buh=False  Без шапки
//Buh=True  С шапкой
var
  i: integer;
  b: Boolean;
begin
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 fmEditPost:=TfmEditPost.Create(Application);

 try
 with fmOtchets do
  begin


   quNaklRPrint.ParamByName('NaklNo').AsInteger:=NaklNo;
   quNaklRPrint.Open;
   quRashodPrint.ParamByName('NaklNo').AsInteger:=NaklNo;
   quRashodPrint.Open;
   quRashodPrintKolvo.ParamByName('NaklNo').AsInteger:=NaklNo;
   quRashodPrintKolvo.Open;
   fmEditPost.quTTN_Record.ParamByName('p_PostNo').AsInteger := fmOtchets.quNaklRPrintPostNo.AsInteger;
   fmEditPost.quTTN_Record.Open;
   fmEditPost.qu_Shipper.ParamByName('p_PostNo').AsInteger := fmOtchets.quNaklRPrintPostNo.AsInteger;
   fmEditPost.qu_Shipper.Open;
   fmEditPost.qu_CarCarrier.ParamByName('p_PostNo').AsInteger := fmOtchets.quNaklRPrintPostNo.AsInteger;
   fmEditPost.qu_CarCarrier.Open;
   fmEditPost.qu_Storekeeper.ParamByName('p_PostNo').AsInteger := fmOtchets.quNaklRPrintPostNo.AsInteger;
   fmEditPost.qu_Storekeeper.Open;
   fmEditPost.qu_Customer.ParamByName('p_PostNo').AsInteger := fmOtchets.quNaklRPrintPostNo.AsInteger;
   fmEditPost.qu_Customer.Open;

   b := fmEditPost.quTTN_RecordCheck1.Value;

   IsSelectItemTTN := True;
   if isPrintTTNForNight = true then
                                 begin
                                   i:=0;
                                   Preview := false;
                                 end
                                else i := SelectItem('Печать ТТН', ['ТТН новая', 'Расходная', 'Возвратная']);

   case i of
    0: frReportPrintNaklTransport.LoadFromFile('Tovarno_Transportnaya_2014.frf');
    1: frReportPrintNaklTransport.LoadFromFile('Tovarno_Transportnaya_1_0.frf');
    2: frReportPrintNaklTransport.LoadFromFile('Tovarno_Transportnaya_1_0_1.frf');
   end;

//   frReportPrintNaklTransport.DesignReport;
   if Preview then
    frReportPrintNaklTransport.ShowReport
   else
    begin
     frReportPrintNaklTransport.PrepareReport;
     if Print3 then frReportPrintNaklTransport.PrintPreparedReport('', 3, True, frAll)
               else frReportPrintNaklTransport.PrintPreparedReport('', 2, True, frAll);
    end;
  end;
  finally
 IsSelectItemTTN := False;
 fmOtchets.quNaklRPrint.Close;
 fmOtchets.quRashodPrint.Close;
 fmOtchets.Free;
 fmEditPost.quTTN_Record.Close;
 fmEditPost.qu_Shipper.Close;
 fmEditPost.qu_CarCarrier.Close;
 fmEditPost.qu_Storekeeper.Close;
 fmEditPost.qu_Customer.Close;
 fmEditPost.Free;
 Screen.Cursor:=crDefault;
 end;
end;

procedure ShowReportOrDesignerExt(Report: TfrReport; Copies:Integer; Preview, ShowDesigner: Boolean);
begin
  if ShowDesigner then
    Report.DesignReport else
  if Preview then
    Report.ShowReport
  else
  begin
  Report.PrepareReport;
  Report.PrintPreparedReport('', Copies, True, frAll);
  end;
end;

procedure ShowReportOrDesigner(Preview, ShowDesigner: Boolean);
begin
   ShowReportOrDesignerExt(fmOtchets.frReportPrintNakl, 1, Preview, ShowDesigner);
//   with fmOtchets do
//   begin
//     if ShowDesigner then
//        frReportPrintNakl.DesignReport else
//     if Preview then
//        frReportPrintNakl.ShowReport
//     else
//     begin
//      frReportPrintNakl.PrepareReport;
//      frReportPrintNakl.PrintPreparedReport('', 1, True, frAll);
//     end;
//   end;
end;

procedure PrintNaklRasNew( NaklNo:integer; Dlg, Preview, Buh, Print3: Boolean;
                           SecretKeyPressed: Boolean = False);
//Buh=False Без шапки
//Buh=True С шапкой
begin
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 fmGetSpravka2:=TfmGetSpravka2.Create(Application);
 fmEditPost:=TfmEditPost.Create(Application);
 try
 with fmOtchets do
  begin

   quNaklRPrint.ParamByName('NaklNo').AsInteger:=NaklNo;
   quNaklRPrint.Open;
   quRashodPrint.ParamByName('NaklNo').AsInteger:=NaklNo;
   quRashodPrint.Open;
   fmEditPost.qu_Storekeeper.ParamByName('p_PostNo').AsInteger := fmOtchets.quNaklRPrintPostNo.AsInteger;
   fmEditPost.qu_Storekeeper.Open;
   fmEditPost.qu_Shipper.ParamByName('p_PostNo').AsInteger := fmOtchets.quNaklRPrintPostNo.AsInteger;
   fmEditPost.qu_Shipper.Open;
   fmEditPost.qu_CarCarrier.ParamByName('p_PostNo').AsInteger := fmOtchets.quNaklRPrintPostNo.AsInteger;
   fmEditPost.qu_CarCarrier.Open;
   fmEditPost.qu_Confidant.ParamByName('p_PostNo').AsInteger := fmOtchets.quNaklRPrintPostNo.AsInteger;
   fmEditPost.qu_Confidant.Open;


  // ShowMessage(inttostr(quRashodPrint.RecordCount));

   quRashodPrintKolvo.ParamByName('NaklNo').AsInteger:=NaklNo;
   quRashodPrintKolvo.Open;
   Osnova:=format('Договор купли-продажи № %s от %s ',
                       [quNaklRPrintDogovorNo.AsString,
                        quNaklRPrintDateDogovor.AsString]);
   if Buh then
    begin
     if quRashodPrint.RecordCount>17 then
      begin
       ColRow:=0;

       if GlobalOurFirmNo = 1 then frReportPrintNakl.LoadFromFile('NaklR_1_1_BigMarket.frf');
       if GlobalOurFirmNo = 490 then frReportPrintNakl.LoadFromFile('NaklR_1_1.frf');
       if GlobalOurFirmNo = 7419 then frReportPrintNakl.LoadFromFile('NaklR_1_1_Market.frf');

//       frReportPrintNakl.LoadFromFile('NaklR_1_1.frf');

        if SecretKeyPressed then
           frReportPrintNakl.DesignReport else
       if Preview then
             frReportPrintNakl.ShowReport
       else
        begin
         frReportPrintNakl.PrepareReport;
         if Print3 then
          frReportPrintNakl.PrintPreparedReport('', 3, True, frAll)
         else
          frReportPrintNakl.PrintPreparedReport('', 2, True, frAll);
        end;
      end
     else
      begin
       ColRow:=17;

       if GlobalOurFirmNo = 1 then frReportPrintNakl.LoadFromFile('NaklR_1_2_BigMarket.frf');
       if GlobalOurFirmNo = 490 then frReportPrintNakl.LoadFromFile('NaklR_1_2.frf');
       if GlobalOurFirmNo = 7419 then frReportPrintNakl.LoadFromFile('NaklR_1_2_Market.frf');

//       frReportPrintNakl.LoadFromFile('NaklR_1_2.frf');

//     frReportPrintNakl.DesignReport;

//       if Preview then
//        frReportPrintNakl.ShowReport
//       else
//        begin
//         frReportPrintNakl.PrepareReport;
//         frReportPrintNakl.PrintPreparedReport('', 1, True, frAll);
//        end;
          ShowReportOrDesigner(Preview, SecretKeyPressed);
       if Print3 then
        begin

       if GlobalOurFirmNo = 1 then frReportPrintNakl.LoadFromFile('NaklR_1_1_BigMarket.frf');
       if GlobalOurFirmNo = 490 then frReportPrintNakl.LoadFromFile('NaklR_1_1.frf');
       if GlobalOurFirmNo = 7419 then frReportPrintNakl.LoadFromFile('NaklR_1_1_Market.frf');


//         frReportPrintNakl.LoadFromFile('NaklR_1_1.frf');

      //   frReportPrintNakl.DesignReport;

//         if Preview then
//          frReportPrintNakl.ShowReport
//         else
//          begin
//           frReportPrintNakl.PrepareReport;
//           frReportPrintNakl.PrintPreparedReport('', 1, True, frAll);
//          end;
          ShowReportOrDesigner(Preview, SecretKeyPressed);
        end;

      end;
    end
   else
    begin
     if quRashodPrint.RecordCount>20 then
      begin
       ColRow:=0;

       if GlobalOurFirmNo = 1 then frReportPrintNakl.LoadFromFile('NaklR_1_1_BigMarket.frf');
       if GlobalOurFirmNo = 490 then frReportPrintNakl.LoadFromFile('NaklR_1_1.frf');
       if GlobalOurFirmNo = 7419 then frReportPrintNakl.LoadFromFile('NaklR_1_1_Market.frf');

//       frReportPrintNakl.LoadFromFile('NaklR_1_1.frf');

//       frReportPrintNakl.DesignReport;

//       if Preview then
//        frReportPrintNakl.ShowReport
//       else
//        begin
//         frReportPrintNakl.PrepareReport;
//         frReportPrintNakl.PrintPreparedReport('', 1, True, frAll);
//        end;
          ShowReportOrDesigner(Preview, SecretKeyPressed);
{
       if GlobalOurFirmNo = 1 then frReportPrintNakl.LoadFromFile('NaklR_2_1_BigMarket.frf');
       if GlobalOurFirmNo = 490 then frReportPrintNakl.LoadFromFile('NaklR_2_1.frf');
       if GlobalOurFirmNo = 7419 then frReportPrintNakl.LoadFromFile('NaklR_2_1_Market.frf');
 }
       frReportPrintNakl.LoadFromFile('NaklR_2_1.frf');

//       frReportPrintNakl.DesignReport;

//       if Preview then
//        frReportPrintNakl.ShowReport
//       else
//        begin
//         frReportPrintNakl.PrepareReport;
//         frReportPrintNakl.PrintPreparedReport('', 1, True, frAll);
//        end;
        ShowReportOrDesigner(Preview, SecretKeyPressed);
      end
     else
      begin
       ColRow:=20;

       if GlobalOurFirmNo = 1 then frReportPrintNakl.LoadFromFile('NaklR_2_2_BigMarket.frf');
       if GlobalOurFirmNo = 490 then frReportPrintNakl.LoadFromFile('NaklR_2_2.frf');
       if GlobalOurFirmNo = 7419 then frReportPrintNakl.LoadFromFile('NaklR_2_2_Market.frf');

//      frReportPrintNakl.DesignReport;

//       if Preview then
//        frReportPrintNakl.ShowReport
//       else
//        begin
//         frReportPrintNakl.PrepareReport;
//         frReportPrintNakl.PrintPreparedReport('', 1, True, frAll);
//        end;
        ShowReportOrDesigner(Preview, SecretKeyPressed);
      end;
    end;

  end;
  finally
 fmEditPost.qu_Confidant.Close;
 fmEditPost.qu_Shipper.Close;
 fmEditPost.qu_CarCarrier.Close;
 fmEditPost.qu_Storekeeper.Close;
 fmOtchets.quNaklRPrint.Close;
 fmOtchets.quRashodPrint.Close;
 fmOtchets.quRashodPrintKolvo.Close;
 fmOtchets.Free;
 fmGetSpravka2.Free;
 fmEditPost.Free;
 Screen.Cursor:=crDefault;
 end;
end;

procedure LoadCarNewP(Nakls:string; DateBegin,DateEnd: TDate);
var
 KolPak: string;
begin
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 try
 with fmOtchets do
  begin
   RepTitle:='Требование на погрузку';

   LoadCarNakls:=Nakls;

   CarDateBegin:=DateBegin;
   CarDateEnd:=DateEnd;


   quLoadCarPostP.MacroByName('Nakl').Value:=Nakls;
   quLoadCarPostP.Open;

   quTovarVidNameP.MacroByName('Nakl').Value:=Nakls;
   quTovarVidNameP.Open;


   if quLoadCarPostP.RecordCount=0 then exit;


   with mdLoadCar do
    begin
     Active := False;
     FieldDefs.Clear;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'TovarNo';
       DataType := ftInteger;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'TovarName';
       DataType := ftString;
       Size := 40;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'VidTovarName';
       DataType := ftString;
       Size := 40;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'Kol';
       DataType := ftFloat;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'KolPerPak';
       DataType := ftString;
       Size := 10;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'Weight';
       DataType := ftFloat;
       Required := False;
      end;
     quLoadCarPostP.First;
     while not quLoadCarPostP.Eof do
      begin
       with FieldDefs.AddFieldDef do
        begin
         Name := IntToStr(quLoadCarPostPPostNo.AsInteger);
         DataType := ftFloat;
         Required := False;
        end;
       quLoadCarPostP.Next;
      end;
     Active:=True;
    end;
   quTovarVidNameP.First;
   while not quTovarVidNameP.Eof do
    begin
     mdLoadCar.Insert;
     mdLoadCar.FieldByName('Kol').AsFloat:=0;
     mdLoadCar.FieldByName('Weight').AsFloat:=0;
     mdLoadCar.FieldByName('KolPerPak').AsString:='';
     mdLoadCar.FieldByName('TovarName').AsString:=quTovarVidNamePNameTovar.AsString;
     mdLoadCar.FieldByName('VidTovarName').AsString:=quTovarVidNamePVidName.AsString;
     mdLoadCar.FieldByName('TovarNo').AsInteger:=quTovarVidNamePTovarNo.AsInteger;
     mdLoadCar.Post;
     mdLoadCar.Refresh;
     quTovarVidNameP.Next;
    end;

   LoadCarWeigth:=0;
   LoadCarSumm:=0;
   quLoadCarPostP.First;
   while not quLoadCarPostP.Eof do
    begin
     quLoadCarTovarP.Close;
     quLoadCarTovarP.MacroByName('Nakl').Value:=Nakls;
     quLoadCarTovarP.ParamByName('PostNo').AsInteger:=quLoadCarPostPPostNo.AsInteger;
//     quLoadCarTovarP.ParamByName('AddressNo').AsInteger:=0;
     quLoadCarTovarP.Open;

     while not quLoadCarTovarP.Eof do
      begin
       if mdLoadCar.Locate('TovarNo',quLoadCarTovarPTovarNo.AsInteger,[]) then
        begin
         mdLoadCar.Edit;
         mdLoadCar.FieldByName(IntToStr(quLoadCarPostPPostNo.AsInteger)).AsFloat:=quLoadCarTovarPKolvo.AsFloat;
         if quLoadCarTovarPKolPerPak.AsInteger>=1 then
          begin
           KolPak:=IntToStr((mdLoadCar.FieldByName('Kol').AsInteger+quLoadCarTovarPKolvo.AsInteger) div quLoadCarTovarPKolPerPak.AsInteger);
           if ((mdLoadCar.FieldByName('Kol').AsInteger+quLoadCarTovarPKolvo.AsInteger) mod quLoadCarTovarPKolPerPak.AsInteger)>0 then
            KolPak:=KolPak+'+('+IntToStr((mdLoadCar.FieldByName('Kol').AsInteger+quLoadCarTovarPKolvo.AsInteger) mod quLoadCarTovarPKolPerPak.AsInteger)+')';
          end;
         mdLoadCar.FieldByName('Kol').AsFloat:=mdLoadCar.FieldByName('Kol').AsFloat+quLoadCarTovarPKolvo.AsFloat;
         mdLoadCar.FieldByName('KolPerPak').AsString:=KolPak;
         mdLoadCar.FieldByName('Weight').AsFloat:=0;//mdLoadCar.FieldByName('Kol').AsFloat*quLoadCarTovarWeight.AsFloat;
         if quLoadCarTovarPKolPerPak.AsInteger<>0
          then LoadCarKolPak:=LoadCarKolPak+(quLoadCarTovarPKolvo.AsInteger/quLoadCarTovarPKolPerPak.AsInteger);
         mdLoadCar.Post;
         mdLoadCar.Refresh;
         LoadCarWeigth:=0;//LoadCarWeigth+quLoadCarTovarWeight.AsFloat;
         LoadCarSumm:=LoadCarSumm+quLoadCarTovarPSumm.AsFloat;
        end
       else
        begin
{         mdLoadCar.Insert;
         mdLoadCar.FieldByName('Kol').AsFloat:=quLoadCarTovarKolvo.AsFloat;
         mdLoadCar.FieldByName(IntToStr(quLoadCarPostPostNo.AsInteger)+'_'+IntToStr(quLoadCarPostAddressNo.AsInteger)).AsFloat:=quLoadCarTovarKolvo.AsFloat;
         mdLoadCar.FieldByName('Weight').AsFloat:=quLoadCarTovarWeight.AsFloat;
         if quLoadCarTovarKolPerPak.AsInteger>=1 then
          begin
           KolPak:=IntToStr(quLoadCarTovarKolvo.AsInteger div quLoadCarTovarKolPerPak.AsInteger);
           if (quLoadCarTovarKolvo.AsInteger mod quLoadCarTovarKolPerPak.AsInteger)>0 then
            KolPak:=KolPak+'+('+IntToStr(quLoadCarTovarKolvo.AsInteger mod quLoadCarTovarKolPerPak.AsInteger)+')';
          end;
         mdLoadCar.FieldByName('KolPerPak').AsString:=KolPak;
         mdLoadCar.FieldByName('TovarName').AsString:=quLoadCarTovarNameTovar.AsString;
         mdLoadCar.FieldByName('VidTovarName').AsString:=quLoadCarTovarVidName.AsString;
         mdLoadCar.FieldByName('TovarNo').AsInteger:=quLoadCarTovarTovarNo.AsInteger;
         mdLoadCar.Post;
         mdLoadCar.Refresh;}
        end;
       quLoadCarTovarP.Next;
      end;
     quLoadCarPostP.Next;
    end;
//   mdLoadCar.SortOnFields('VidTovarName',True,False);
//   mdLoadCar.SortOnFields('TovarName',True,False);
   frReport13.LoadFromFile('LoadCarP.frf');
   Screen.Cursor:=crDefault;

//   frReport13.DesignReport;

   frReport13.ShowReport


//   ShowModal;
  end;
 finally
 fmOtchets.quLoadCarPostP.Close;
 fmOtchets.quLoadCarTovarP.Close;
 fmOtchets.quTovarVidNameP.Close;
 fmOtchets.Free;
 Screen.Cursor:=crDefault;
 end;
end;

procedure LoadCarNew(Copies: Integer; Nakls, PostNoCar:string; DlgSpravkaShow, Preview: Boolean; Car, Expedition: String; DateBegin: TDate);
var
 KolPak: string;
begin
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 fmGetSpravka3:=TfmGetSpravka3.Create(Application);
 try
 with fmOtchets do
  begin
   RepTitle:='Требование на погрузку';

   KolTovar:=0;
   WidthTovar:=0;

   LoadCarNakls:=Nakls;
   LoadCarPostNoCar:=PostNoCar;
   LoadCarDlgSpravkaShow:=DlgSpravkaShow;
   LoadCarPreview:=Preview;
   LoadCarCar:=Car;
   LoadCarExpedition:=Expedition;
   LoadCarDateBegin:='Требование на погрузку от '+DateToStr(DateBegin);

   quLoadCarPost.MacroByName('Nakl').Value:=Nakls;
   quLoadCarPost.Open;

   quTovarVidName.MacroByName('Nakl').Value:=Nakls;
   quTovarVidName.Open;

{   quLoadCarTovar.MacroByName('Nakl').Value:=Nakls;
   quLoadCarTovar.ParamByName('PostNo').AsInteger:=;
   quLoadCarTovar.ParamByName('AddressNo').AsInteger:=;
   quLoadCarTovar.Open;
}

   if quLoadCarPost.RecordCount=0 then exit;

   if DlgSpravkaShow then
    begin
     fmGetSpravka3.Label2.Caption:='Погрузка';
     fmGetSpravka3.edDogovor.Text:='Требование на погрузку от '+DateToStr(Date()+1);
     fmGetSpravka3.ShowModal;
    end;
   if DlgSpravkaShow then
    LoadCarDateBegin:=fmGetSpravka3.edDogovor.Text;

   with mdLoadCar do
    begin
     Active := False;
     FieldDefs.Clear;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'TovarNo';
       DataType := ftInteger;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'TovarName';
       DataType := ftString;
       Size := 40;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'VidTovarName';
       DataType := ftString;
       Size := 40;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'Kol';
       DataType := ftFloat;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'KolPerPak';
       DataType := ftString;
       Size := 10;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'Weight';
       DataType := ftFloat;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'BarCode';
       DataType := ftString;
       Required := False;
      end;
{     with FieldDefs.AddFieldDef do
      begin
       Name := 'PostName';
       DataType := ftString;
       Size := 256;
       Required := False;
      end; }
     quLoadCarPost.First;
     while not quLoadCarPost.Eof do
      begin
       with FieldDefs.AddFieldDef do
        begin
         Name := IntToStr(quLoadCarPostPostNo.AsInteger)+'_'+IntToStr(quLoadCarPostAddressNo.AsInteger);
         DataType := ftFloat;
         Required := False;
        end;
       quLoadCarPost.Next;
      end;
     Active:=True;
    end;
   quTovarVidName.First;
   while not quTovarVidName.Eof do
    begin
     mdLoadCar.Insert;
     mdLoadCar.FieldByName('Kol').AsFloat:=0;
     mdLoadCar.FieldByName('Weight').AsFloat:=0;
     mdLoadCar.FieldByName('KolPerPak').AsString:='';
//     mdLoadCar.FieldByName('PostName').AsString:='';
     mdLoadCar.FieldByName('TovarName').AsString:=quTovarVidNameNameTovar.AsString;
     mdLoadCar.FieldByName('VidTovarName').AsString:=quTovarVidNameVidName.AsString;
     mdLoadCar.FieldByName('TovarNo').AsInteger:=quTovarVidNameTovarNo.AsInteger;
//     mdLoadCar.FieldByName('BarCode').AsInteger:=0;
     mdLoadCar.Post;
     mdLoadCar.Refresh;
     quTovarVidName.Next;
    end;

   LoadCarWeigth:=0;
   LoadCarSumm:=0;
   quLoadCarPost.First;
   while not quLoadCarPost.Eof do
    begin
     quLoadCarTovar.Close;
     quLoadCarTovar.MacroByName('Nakl').Value:=Nakls;
     quLoadCarTovar.ParamByName('PostNo').AsInteger:=quLoadCarPostPostNo.AsInteger;
     quLoadCarTovar.ParamByName('AddressNo').AsInteger:=quLoadCarPostAddressNo.AsInteger;
     quLoadCarTovar.Open;

     while not quLoadCarTovar.Eof do
      begin
       if mdLoadCar.Locate('TovarNo',quLoadCarTovarTovarNo.AsInteger,[]) then
        begin
         mdLoadCar.Edit;
         mdLoadCar.FieldByName(IntToStr(quLoadCarPostPostNo.AsInteger)+'_'+IntToStr(quLoadCarPostAddressNo.AsInteger)).AsFloat:=quLoadCarTovarKolvo.AsFloat;
         if quLoadCarTovarKolPerPak.AsInteger>=1 then
          begin
           KolPak:=IntToStr((mdLoadCar.FieldByName('Kol').AsInteger+quLoadCarTovarKolvo.AsInteger) div quLoadCarTovarKolPerPak.AsInteger);
           if ((mdLoadCar.FieldByName('Kol').AsInteger+quLoadCarTovarKolvo.AsInteger) mod quLoadCarTovarKolPerPak.AsInteger)>0 then
            KolPak:=KolPak+'+('+IntToStr((mdLoadCar.FieldByName('Kol').AsInteger+quLoadCarTovarKolvo.AsInteger) mod quLoadCarTovarKolPerPak.AsInteger)+')';
          end;
         mdLoadCar.FieldByName('Kol').AsFloat:=mdLoadCar.FieldByName('Kol').AsFloat+quLoadCarTovarKolvo.AsFloat;
         mdLoadCar.FieldByName('KolPerPak').AsString:=KolPak;
         mdLoadCar.FieldByName('Weight').AsFloat:=mdLoadCar.FieldByName('Kol').AsFloat*quLoadCarTovarWeight.AsFloat;
         mdLoadCar.FieldByName('BarCode').Value:=quLoadCarTovarBarCode.Value;
//         mdLoadCar.FieldByName('PostName').AsString:= quLoadCarPostName.Value;
         if quLoadCarTovarKolPerPak.AsInteger<>0
          then LoadCarKolPak:=LoadCarKolPak+(quLoadCarTovarKolvo.AsInteger/quLoadCarTovarKolPerPak.AsInteger);
         mdLoadCar.Post;
         mdLoadCar.Refresh;
         LoadCarWeigth:=LoadCarWeigth+quLoadCarTovarWeight.AsFloat;
         LoadCarSumm:=LoadCarSumm+quLoadCarTovarSumm.AsFloat;
        end
       else
        begin
{         mdLoadCar.Insert;
         mdLoadCar.FieldByName('Kol').AsFloat:=quLoadCarTovarKolvo.AsFloat;
         mdLoadCar.FieldByName(IntToStr(quLoadCarPostPostNo.AsInteger)+'_'+IntToStr(quLoadCarPostAddressNo.AsInteger)).AsFloat:=quLoadCarTovarKolvo.AsFloat;
         mdLoadCar.FieldByName('Weight').AsFloat:=quLoadCarTovarWeight.AsFloat;
         if quLoadCarTovarKolPerPak.AsInteger>=1 then
          begin
           KolPak:=IntToStr(quLoadCarTovarKolvo.AsInteger div quLoadCarTovarKolPerPak.AsInteger);
           if (quLoadCarTovarKolvo.AsInteger mod quLoadCarTovarKolPerPak.AsInteger)>0 then
            KolPak:=KolPak+'+('+IntToStr(quLoadCarTovarKolvo.AsInteger mod quLoadCarTovarKolPerPak.AsInteger)+')';
          end;
         mdLoadCar.FieldByName('KolPerPak').AsString:=KolPak;
         mdLoadCar.FieldByName('TovarName').AsString:=quLoadCarTovarNameTovar.AsString;
         mdLoadCar.FieldByName('VidTovarName').AsString:=quLoadCarTovarVidName.AsString;
         mdLoadCar.FieldByName('TovarNo').AsInteger:=quLoadCarTovarTovarNo.AsInteger;
         mdLoadCar.Post;
         mdLoadCar.Refresh;}
        end;
       quLoadCarTovar.Next;
      end;
     quLoadCarPost.Next;
    end;
//   mdLoadCar.SortOnFields('VidTovarName',True,False);
//   mdLoadCar.SortOnFields('TovarName',True,False);
   frReport12.LoadFromFile('LoadCar.frf');
//   frReport12.DesignReport;
   Screen.Cursor:=crDefault;



   if Preview then
    frReport12.ShowReport
   else
    begin
     frReport12.PrepareReport;
     frReport12.PrintPreparedReport('', Copies, True, frAll);
    end;


//   ShowModal;
  end;
 finally
 fmOtchets.quLoadCarPost.Close;
 fmOtchets.quLoadCarTovar.Close;
 fmOtchets.quTovarVidName.Close;
 fmOtchets.Free;
 fmGetSpravka3.Free;
 Screen.Cursor:=crDefault;
 end;
end;

procedure LoadCarNoTTNew( Copies: Integer; Nakls, PostNoCar:string;
                          DlgSpravkaShow, Preview: Boolean; Car, Expedition: String;
                          DateBegin: TDate; DesignCode: Integer = 0);
var
 KolPak: string;
begin
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 fmGetSpravka3:=TfmGetSpravka3.Create(Application);
 try
 with fmOtchets do
  begin
   RepTitle:='Требование на погрузку';

   KolTovar:=0;
   WidthTovar:=0;

   LoadCarNakls:=Nakls;
   LoadCarPostNoCar:=PostNoCar;
   LoadCarDlgSpravkaShow:=DlgSpravkaShow;
   LoadCarPreview:=Preview;
   LoadCarCar:=Car;
   LoadCarExpedition:=Expedition;
   LoadCarDateBegin:='Требование на погрузку от '+DateToStr(DateBegin);

   quLoadCarPost.MacroByName('Nakl').Value:=Nakls;
   quLoadCarPost.Open;

   quTovarVidName.MacroByName('Nakl').Value:=Nakls;
   quTovarVidName.Open;

{   quLoadCarTovar.MacroByName('Nakl').Value:=Nakls;
   quLoadCarTovar.ParamByName('PostNo').AsInteger:=;
   quLoadCarTovar.ParamByName('AddressNo').AsInteger:=;
   quLoadCarTovar.Open;
}

   if quLoadCarPost.RecordCount=0 then exit;

   if DlgSpravkaShow then
    begin
     fmGetSpravka3.Label2.Caption:='Погрузка';
     fmGetSpravka3.edDogovor.Text:='Требование на погрузку от '+DateToStr(Date()+1);
     fmGetSpravka3.ShowModal;
    end;
   if DlgSpravkaShow then
    LoadCarDateBegin:=fmGetSpravka3.edDogovor.Text;

   with mdLoadCar do
    begin
     Active := False;
     FieldDefs.Clear;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'NaklNo';
       DataType := ftInteger;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'TovarNo';
       DataType := ftInteger;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'TovarName';
       DataType := ftString;
       Size := 70;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'VidTovarName';
       DataType := ftString;
       Size := 40;
       Required := False;
      end;
//     with FieldDefs.AddFieldDef do
//      begin
//       Name := 'TovarOtdelNo';
//       DataType := ftInteger;
//       Required := False;
//      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'TovarOtdelName';
       DataType := ftString;
       Size := 40;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'Kol';
       DataType := ftFloat;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'KolPerPak';
       DataType := ftString;
       Size := 10;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'Weight';
       DataType := ftFloat;
       Required := False;
      end;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'BarCode';
       DataType := ftString;
       Required := False;
      end;
{     with FieldDefs.AddFieldDef do
      begin
       Name := 'PostName';
       DataType := ftString;
       Size := 256;
       Required := False;
      end; }
     quLoadCarPost.First;
     while not quLoadCarPost.Eof do
      begin
       with FieldDefs.AddFieldDef do
        begin
         Name := IntToStr(quLoadCarPostPostNo.AsInteger)+'_'+IntToStr(quLoadCarPostAddressNo.AsInteger);
         DataType := ftFloat;
         Required := False;
        end;
       quLoadCarPost.Next;
      end;
     Active:=True;
    end;
   quTovarVidName.First;
   while not quTovarVidName.Eof do
    begin
     mdLoadCar.Insert;
     mdLoadCar.FieldByName('Kol').AsFloat:=0;
     mdLoadCar.FieldByName('Weight').AsFloat:=0;
     mdLoadCar.FieldByName('KolPerPak').AsString:='';
//     mdLoadCar.FieldByName('NaklNo').AsInteger:=quTovarVidNameNaklNo.AsInteger;
//     mdLoadCar.FieldByName('PostName').AsString:='';
     mdLoadCar.FieldByName('TovarName').AsString:=quTovarVidNameNameTovar.AsString;
     mdLoadCar.FieldByName('VidTovarName').AsString:=quTovarVidNameVidName.AsString;
     mdLoadCar.FieldByName('TovarNo').AsInteger:=quTovarVidNameTovarNo.AsInteger;
     //mdLoadCar.FieldByName('TovarOtdelNo').AsInteger:=quTovarVidNameOtdelNo.AsInteger;
     mdLoadCar.FieldByName('TovarOtdelName').AsString:=quTovarVidNameOtdelName.AsString;
//     mdLoadCar.FieldByName('BarCode').AsInteger:=0;
     mdLoadCar.Post;
     mdLoadCar.Refresh;
     quTovarVidName.Next;
    end;

   LoadCarWeigth:=0;
   LoadCarSumm:=0;
   quLoadCarPost.First;
   while not quLoadCarPost.Eof do
    begin
     quLoadCarTovar.Close;
     quLoadCarTovar.MacroByName('Nakl').Value:=Nakls;
     quLoadCarTovar.ParamByName('PostNo').AsInteger:=quLoadCarPostPostNo.AsInteger;
     quLoadCarTovar.ParamByName('AddressNo').AsInteger:=quLoadCarPostAddressNo.AsInteger;
     quLoadCarTovar.Open;

     while not quLoadCarTovar.Eof do
      begin
       if mdLoadCar.Locate('TovarNo',quLoadCarTovarTovarNo.AsInteger,[]) then
        begin
         mdLoadCar.Edit;
         mdLoadCar.FieldByName(IntToStr(quLoadCarPostPostNo.AsInteger)+'_'+IntToStr(quLoadCarPostAddressNo.AsInteger)).AsFloat:=quLoadCarTovarKolvo.AsFloat;
         if quLoadCarTovarKolPerPak.AsInteger>=1 then
          begin
           KolPak:=IntToStr((mdLoadCar.FieldByName('Kol').AsInteger+quLoadCarTovarKolvo.AsInteger) div quLoadCarTovarKolPerPak.AsInteger);
           if ((mdLoadCar.FieldByName('Kol').AsInteger+quLoadCarTovarKolvo.AsInteger) mod quLoadCarTovarKolPerPak.AsInteger)>0 then
            KolPak:=KolPak+'+('+IntToStr((mdLoadCar.FieldByName('Kol').AsInteger+quLoadCarTovarKolvo.AsInteger) mod quLoadCarTovarKolPerPak.AsInteger)+')';
          end;
         mdLoadCar.FieldByName('Kol').AsFloat:=mdLoadCar.FieldByName('Kol').AsFloat+quLoadCarTovarKolvo.AsFloat;
         mdLoadCar.FieldByName('KolPerPak').AsString:=KolPak;
         mdLoadCar.FieldByName('Weight').AsFloat:=mdLoadCar.FieldByName('Kol').AsFloat*quLoadCarTovarWeight.AsFloat;
         mdLoadCar.FieldByName('BarCode').Value:=quLoadCarTovarBarCode.Value;
//         mdLoadCar.FieldByName('PostName').AsString:= quLoadCarPostName.Value;
         if quLoadCarTovarKolPerPak.AsInteger<>0
          then LoadCarKolPak:=LoadCarKolPak+(quLoadCarTovarKolvo.AsInteger/quLoadCarTovarKolPerPak.AsInteger);
         mdLoadCar.Post;
         mdLoadCar.Refresh;
         LoadCarWeigth:=LoadCarWeigth+quLoadCarTovarWeight.AsFloat;
         LoadCarSumm:=LoadCarSumm+quLoadCarTovarSumm.AsFloat;
        end
       else
        begin
{         mdLoadCar.Insert;
         mdLoadCar.FieldByName('Kol').AsFloat:=quLoadCarTovarKolvo.AsFloat;
         mdLoadCar.FieldByName(IntToStr(quLoadCarPostPostNo.AsInteger)+'_'+IntToStr(quLoadCarPostAddressNo.AsInteger)).AsFloat:=quLoadCarTovarKolvo.AsFloat;
         mdLoadCar.FieldByName('Weight').AsFloat:=quLoadCarTovarWeight.AsFloat;
         if quLoadCarTovarKolPerPak.AsInteger>=1 then
          begin
           KolPak:=IntToStr(quLoadCarTovarKolvo.AsInteger div quLoadCarTovarKolPerPak.AsInteger);
           if (quLoadCarTovarKolvo.AsInteger mod quLoadCarTovarKolPerPak.AsInteger)>0 then
            KolPak:=KolPak+'+('+IntToStr(quLoadCarTovarKolvo.AsInteger mod quLoadCarTovarKolPerPak.AsInteger)+')';
          end;
         mdLoadCar.FieldByName('KolPerPak').AsString:=KolPak;
         mdLoadCar.FieldByName('TovarName').AsString:=quLoadCarTovarNameTovar.AsString;
         mdLoadCar.FieldByName('VidTovarName').AsString:=quLoadCarTovarVidName.AsString;
         mdLoadCar.FieldByName('TovarNo').AsInteger:=quLoadCarTovarTovarNo.AsInteger;
         mdLoadCar.Post;
         mdLoadCar.Refresh;}
        end;
       quLoadCarTovar.Next;
      end;
     quLoadCarPost.Next;
    end;
//   mdLoadCar.SortOnFields('VidTovarName',True,False);
//   mdLoadCar.SortOnFields('TovarName',True,False);
   frReport12.LoadFromFile(ExtractFilePath(Application.ExeName) + 'LoadCarNoTT.frf');
//   frReport12.DesignReport;
   Screen.Cursor:=crDefault;

   if DesignCode = 200 then ViewDatasetFast(mdLoadCar) else
   ShowReportOrDesignerExt(frReport12, Copies, Preview, DesignCode=100);
//   if InDesigner then
//      frReport12.DesignReport else
//   if Preview then
//    frReport12.ShowReport
//   else
//    begin
//     frReport12.PrepareReport;
//     frReport12.PrintPreparedReport('', Copies, True, frAll);
//    end;


//   ShowModal;
  end;
 finally
 fmOtchets.quLoadCarPost.Close;
 fmOtchets.quLoadCarTovar.Close;
 fmOtchets.quTovarVidName.Close;
 fmOtchets.Free;
 fmGetSpravka3.Free;
 Screen.Cursor:=crDefault;
 end;
end;


procedure SalarySotrudPercentNew;
var
 Period:TPeriodDate;
 SotrudNo:integer;
begin
 Period:=ZapDate(4);
 if Period[1]=0 then exit;

 SotrudNo:=Sotrud(True);
 if SotrudNo=0 then exit;

 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 try
 with fmOtchets do
  begin
   quWork.SQL.Clear;
   quWork.SQL.Add('select SotrudName from Sotrud where SotrudNo=:SotrudNo');
   quWork.ParamByName('SotrudNo').AsInteger:=SotrudNo;
   quWork.Open;
//   qrLabel22.Caption:=quWork.FieldByName('SotrudName').AsString+'  '+DateToStr(Period[1])+' - '+DateToStr(Period[2]);
   quWork.Close;
   quPercentsSalary.Open;
   spSalarySotrudPlat.ParamByName('DateBegin').AsDate:=Period[1];
   spSalarySotrudPlat.ParamByName('DateEnd').AsDate:=Period[2];
   spSalarySotrudPlat.ParamByName('SotrudNo').AsSmallInt:=SotrudNo;
   spSalarySotrudPlat.Open;
   Screen.Cursor:=crDefault;
   frReport10.LoadFromFile('SalarySotrudPercent.frf');
   frReport10.ShowReport;
  end;
// qrSalarySotrudPercent.Preview;
 finally
 fmOtchets.quPercentsSalary.Close;
 fmOtchets.spSalarySotrudPlat.Close;
 fmOtchets.Free;
 Screen.Cursor:=crDefault;
 end;
end;

procedure SotrudDolgPodotchet;
var
 SotrudNo:integer;
// i:integer;
begin


// ReportTitle:='за период: '+DateToStr(Period.DateBegin)+' - '+DateToStr(Period.DateEnd);
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
// ListSum:=TList.Create;
 try
 with fmOtchets do
  begin
   if Application.MessageBox('По всем ?','Долги по менеджерам',MB_YESNO)=IDYES then
    begin
     fmOtchets.quSotrudDolgPodotchet.Open;
    end
   else
    begin
     SotrudNo:=Sotrud(True);
     fmOtchets.quSotrudDolgPodotchet.MacroByName('_Sotrud').Value:=' and (NaklR.SotrudNo=:SotrudNo) ';
     fmOtchets.quSotrudDolgPodotchet.Prepare;
     fmOtchets.quSotrudDolgPodotchet.ParamByName('SotrudNo').AsInteger:=SotrudNo;
     fmOtchets.quSotrudDolgPodotchet.Open;
    end;





   //While not quSotrudDolgPodotchet.Eof do
    //begin

    //end;

   Screen.Cursor:=crDefault;
   if fmOtchets.quSotrudDolgPodotchet.RecordCount>0 then
    begin
     frReport11.LoadFromFile('SotrudDolg0.frf');
     frReport11.ShowReport;
    end;
  end;
 finally
 Screen.Cursor:=crDefault;
 fmOtchets.quSotrudDolgPodotchet.Close;
 fmOtchets.Free;
 end;
end;

procedure SotrudDolg;
var
 Period:TDatePeriod;
 i:integer;
begin
 Period:=GetPeriodDate(0,0);
 if Period.DateBegin=0 then exit;
 ReportTitle:='за период: '+DateToStr(Period.DateBegin)+' - '+DateToStr(Period.DateEnd);
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
// ListSum:=TList.Create;
 try
 with fmOtchets do
  begin
   quSotrudDolg.Close;
   quSotrudDolg.ParamByName('DateBegin').AsDate:=Period.DateBegin;
   quSotrudDolg.ParamByName('DateEnd').AsDate:=Period.DateEnd;
   quSotrudDolg.Open;
   quSotrudDolgNoClose.Close;
   quSotrudDolgNoClose.ParamByName('DateBegin').AsDate:=Period.DateBegin;
   quSotrudDolgNoClose.ParamByName('DateEnd').AsDate:=Period.DateEnd;
   quSotrudDolgNoClose.ParamByName('DateNow').AsDate:=Now;
   quSotrudDolgNoClose.Open;
   mdSotrudDolg.Active:=False;
   mdSotrudDolg.Active:=True;
   While not quSotrudDolg.Eof do
    begin
     mdSotrudDolg.Insert;
     mdSotrudDolgSotrudName.AsString:=quSotrudDolgSotrudName.AsString;
     mdSotrudDolgPostNo.AsInteger:=quSotrudDolgPostNoFirst.AsInteger;
     mdSotrudDolgAddressNo.AsInteger:=quSotrudDolgAddressNo.AsInteger;
     mdSotrudDolgPostName.AsString:=quSotrudDolgName.AsString;
     mdSotrudDolgAddressName.AsString:=quSotrudDolgAddress.AsString;
     mdSotrudDolgSummaAll.AsFloat:=quSotrudDolgSumma.AsFloat;
     mdSotrudDolgSummaDolgAll.AsFloat:=quSotrudDolgSummaDolg.AsFloat;
     mdSotrudDolgSumma.AsFloat:=0;
     mdSotrudDolgSummaDolg.AsFloat:=0;
     mdSotrudDolg.Post;
     mdSotrudDolg.Refresh;
     quSotrudDolg.Next;
    end;
   While not quSotrudDolgNoClose.Eof do
    begin
     if mdSotrudDolg.Locate('PostNo;AddressNo', VarArrayOf([quSotrudDolgNoClosePostNoFirst.AsInteger, quSotrudDolgNoCloseAddressNo.AsInteger]), []) then
      begin
       mdSotrudDolg.Edit;
       mdSotrudDolgSumma.AsFloat:=quSotrudDolgNoCloseSumma.AsFloat;
       mdSotrudDolgSummaDolg.AsFloat:=quSotrudDolgNoCloseSummaDolg.AsFloat;
       mdSotrudDolg.Post;
       mdSotrudDolg.Refresh;
      end
     else
      begin
       mdSotrudDolg.Insert;
       mdSotrudDolgSotrudName.AsString:=quSotrudDolgNoCloseSotrudName.AsString;
       mdSotrudDolgPostNo.AsInteger:=quSotrudDolgNoClosePostNoFirst.AsInteger;
       mdSotrudDolgAddressNo.AsInteger:=quSotrudDolgNoCloseAddressNo.AsInteger;
       mdSotrudDolgPostName.AsString:=quSotrudDolgNoCloseName.AsString;
       mdSotrudDolgAddressName.AsString:=quSotrudDolgNoCloseAddress.AsString;
       mdSotrudDolgSummaAll.AsFloat:=0;
       mdSotrudDolgSummaDolgAll.AsFloat:=0;
       mdSotrudDolgSumma.AsFloat:=quSotrudDolgNoCloseSumma.AsFloat;
       mdSotrudDolgSummaDolg.AsFloat:=quSotrudDolgNoCloseSummaDolg.AsFloat;
       mdSotrudDolg.Post;
       mdSotrudDolg.Refresh;
      end;
     quSotrudDolgNoClose.Next;
    end;
    mdSotrudDolg.SortOnFields('SotrudName',True,False);
{   if Period.DateBegin=Period.DateEnd then
    RepTitle:='За '+DateToStr(Period.DateBegin)
   else
    RepTitle:=RepTitle+'С '+DateToStr(Period.DateBegin)+' по '+DateToStr(Period.DateEnd);
   spCrossPostCompany.ParamByName('DateBegin').AsDate:=Period.DateBegin;
   spCrossPostCompany.ParamByName('DateEnd').AsDate:=Period.DateEnd;
   spCrossPostCompany.Open;}
   Screen.Cursor:=crDefault;
   frReport9.LoadFromFile('SotrudDolg0.frf');
   frReport9.ShowReport;
  end;
 finally
{ for i:=0 to ListSum.Count-1 do
  FreeMem(PSummaCP(ListSum.Items[i]));
 ListSum.Free;}

 Screen.Cursor:=crDefault;
// fmOtchets.spCrossPostCompany.Close;
 fmOtchets.Free;
 end;
end;

procedure ExcelDanon;
var
 XLApp,Sheet,Colum:Variant;
 index,i:Integer;
 Period: TPeriodDate;
begin
 Period:=ZapDate(3);
 if Period[1]=0 then exit;

 Screen.Cursor:=crHourGlass;
// fmOtchets:=TfmOtchets.Create(Application);
 fmOtchets:=TfmOtchets.Create(nil);
 try
 with fmOtchets do
  begin
   fmOtchets.Width:=388;
   fmOtchets.Height:=61;
   fmOtchets.Position:=poScreenCenter;
   fmOtchets.Caption:='Подготовка отчета';
   XLApp:= CreateOleObject('Excel.Application');
//   XLApp.Visible:=true;
   XLApp.Workbooks.Add(-4167);
   XLApp.Workbooks[1].WorkSheets[1].Name:='Отчёт';
   Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт'].Columns;
   Colum.Columns[1].ColumnWidth:=5;
//   Colum.Columns[2].ColumnWidth:=30;
   Colum.Columns[2].ColumnWidth:=8;
   Colum.Columns[3].ColumnWidth:=30;
   Colum.Columns[4].ColumnWidth:=4;
   Colum.Columns[5].ColumnWidth:=5;
   Colum.Columns[6].ColumnWidth:=19;

   Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт'].Rows;
   Colum.Rows[2].Font.Bold:=true;
   Colum.Rows[1].Font.Bold:=true;
   Colum.Rows[1].Font.Color:=clBlue;
   Colum.Rows[1].Font.Size:=14;

  // Worksheets(1).Cells(1,1).Value = "Name"


   Sheet:=XLApp.Workbooks[1].WorkSheets['Отчёт'];
   Sheet.Cells[1,1]:='Отчёт по "Данон" за период: '+DateToStr(Period[1])+' - '+DateToStr(Period[2]);
   Sheet.Cells[2,1]:='Код';
//   Sheet.Cells[2,2]:='Название продукта';
   Sheet.Cells[2,2]:='Дата';
   Sheet.Cells[2,3]:='Название заказчика';
   Sheet.Cells[2,4]:='шт.';
   Sheet.Cells[2,5]:='кг.';
   Sheet.Cells[2,6]:='Название маршрута';


   fmOtchets.quExcelDanon.ParamByName('DateB').AsDate:=Period[1];
   fmOtchets.quExcelDanon.ParamByName('DateE').AsDate:=Period[2];
   fmOtchets.quExcelDanon.Open;

   index:=3;
     ProgressBar1.Min := 0;
     ProgressBar1.Max := fmOtchets.quExcelDanon.RecordCount;
     Show;
     Update;
     while not fmOtchets.quExcelDanon.Eof do
      begin
       Sheet.Cells[index,1]:=fmOtchets.quExcelDanonCodReport.AsString;
//       Sheet.Cells[index,2]:=fmOtchets.quExcelDanonNameTovar.AsString;
       Sheet.Cells[index,2]:=copy(DateToStr(fmOtchets.quExcelDanonDateNakl.AsDateTime),7,4)+copy(DateToStr(fmOtchets.quExcelDanonDateNakl.AsDateTime),4,2)+copy(DateToStr(fmOtchets.quExcelDanonDateNakl.AsDateTime),1,2);
       Sheet.Cells[index,3]:=fmOtchets.quExcelDanonNameLong.AsString;
       Sheet.Cells[index,4]:=fmOtchets.quExcelDanonKol.AsFloat;
       Sheet.Cells[index,5]:=fmOtchets.quExcelDanonWeightTovar.AsFloat/1000;
       Sheet.Cells[index,6]:=fmOtchets.quExcelDanonRegionName.AsString;
       Inc(index);
       fmOtchets.quExcelDanon.Next;
       ProgressBar1.StepBy(1);
      end;
  end;
 finally
  fmOtchets.quExcelDanon.Close;
  XLApp.Visible:=true;
  fmOtchets.Free;
  Screen.Cursor:=crDefault;
 end;
end;



procedure ExcelTara;
var
 XLApp,Sheet,Colum:Variant;
 index,i:Integer;
 Period: TPeriodDate;
begin
 Period:=ZapDate(3);
 if Period[1]=0 then exit;

 Screen.Cursor:=crHourGlass;
// fmOtchets:=TfmOtchets.Create(Application);
 fmOtchets:=TfmOtchets.Create(nil);
 try
 with fmOtchets do
  begin
   fmOtchets.Width:=388;
   fmOtchets.Height:=61;
   fmOtchets.Position:=poScreenCenter;
   fmOtchets.Caption:='Подготовка отчета';
   XLApp:= CreateOleObject('Excel.Application');
//   XLApp.Visible:=true;
   XLApp.Workbooks.Add(-4167);
   XLApp.Workbooks[1].WorkSheets[1].Name:='Отчёт';
   Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт'].Columns;
   Colum.Columns[1].ColumnWidth:=10;
   Colum.Columns[2].ColumnWidth:=10;
   Colum.Columns[3].ColumnWidth:=30;
   Colum.Columns[4].ColumnWidth:=8;
   Colum.Columns[5].ColumnWidth:=8;
   Colum.Columns[6].ColumnWidth:=8;
   Colum.Columns[7].ColumnWidth:=30;

   Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт'].Rows;
   Colum.Rows[2].Font.Bold:=true;
   Colum.Rows[1].Font.Bold:=true;
   Colum.Rows[1].Font.Color:=clBlue;
   Colum.Rows[1].Font.Size:=14;

   Sheet:=XLApp.Workbooks[1].WorkSheets['Отчёт'];
   Sheet.Cells[1,1]:='Отчёт по таре за период: '+DateToStr(Period[1])+' - '+DateToStr(Period[2]);
   Sheet.Cells[2,1]:='№ Накл.';
   Sheet.Cells[2,2]:='Дата';
   Sheet.Cells[2,3]:='Наименование товара';
   Sheet.Cells[2,4]:='Приход';
   Sheet.Cells[2,5]:='Расход';
   Sheet.Cells[2,6]:='Цена';
   Sheet.Cells[2,7]:='Название партнера';


   fmOtchets.quExcelTara.ParamByName('DateB').AsDate:=Period[1];
   fmOtchets.quExcelTara.ParamByName('DateE').AsDate:=Period[2];
   fmOtchets.quExcelTara.Open;

   index:=3;
     ProgressBar1.Min := 0;
     ProgressBar1.Max := fmOtchets.quExcelTara.RecordCount;
     Show;
     Update;
     while not fmOtchets.quExcelTara.Eof do
      begin
       Sheet.Cells[index,1]:=fmOtchets.quExcelTaraNaklNo.AsInteger;
//       Sheet.Cells[index,2]:=fmOtchets.quExcelPresidentNameTovar.AsString;
//       Sheet.Cells[index,2]:=copy(DateToStr(fmOtchets.quExcelPresidentDateNakl.AsDateTime),7,4)+copy(DateToStr(fmOtchets.quExcelDanonDateNakl.AsDateTime),4,2)+copy(DateToStr(fmOtchets.quExcelDanonDateNakl.AsDateTime),1,2);
       Sheet.Cells[index,2]:=DateToStr(fmOtchets.quExcelTaraDateNakl.AsDateTime);
       Sheet.Cells[index,3]:=fmOtchets.quExcelTaraNameTovar.AsString;
       if fmOtchets.quExcelTaraRashod.AsInteger=0 then
        Sheet.Cells[index,4]:=fmOtchets.quExcelTaraKol.AsFloat
       else
        Sheet.Cells[index,5]:=fmOtchets.quExcelTaraKol.AsFloat;
       Sheet.Cells[index,6]:=fmOtchets.quExcelTaraPrice.AsFloat;
       Sheet.Cells[index,7]:=fmOtchets.quExcelTaraName.AsString;
       Inc(index);
       fmOtchets.quExcelTara.Next;
       ProgressBar1.StepBy(1);
      end;
  end;
 finally
  fmOtchets.quExcelTara.Close;
  XLApp.Visible:=true;
  fmOtchets.Free;
  Screen.Cursor:=crDefault;
 end;
end;

procedure PrintSaleSotrudTipTovar;
var
 Period:TPeriodDate;
begin
 Period:=ZapDate(4);
 if Period[1]=0 then exit;

 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 try
 with fmOtchets do
  begin
   if Period[1]<>Period[2] then
    RepTitle:='Продажи по видам товара за '+DateToStr(Period[1])+' - '+DateToStr(Period[2])
   else
    RepTitle:='Продажи по видам товара за '+DateToStr(Period[1]);


   quSaleSotrudSumm.ParamByName('DatePostB').AsDate:=Period[1];
   quSaleSotrudSumm.ParamByName('DatePostE').AsDate:=Period[2];
   quSaleSotrudSumm.Open;
   quSaleSotrudTipTovar.ParamByName('DatePostB').AsDate:=Period[1];
   quSaleSotrudTipTovar.ParamByName('DatePostE').AsDate:=Period[2];
   quSaleSotrudTipTovar.Open;

   if quSaleSotrudSumm.RecordCount=0 then exit;

   with mdSaleSotrudTipTovar do
    begin
     Active := False;
     FieldDefs.Clear;
     with FieldDefs.AddFieldDef do
      begin
       Name := 'NameTovar';
       DataType := ftString;
       Size := 40;
       Required := False;
      end;
     quSaleSotrudSumm.First;
     while not quSaleSotrudSumm.Eof do
      begin
       with FieldDefs.AddFieldDef do
        begin
         Name := quSaleSotrudSummSotrudName.AsString;
         DataType := ftFloat;
         Required := False;
        end;
       quSaleSotrudSumm.Next;
      end;
     Active:=True;
    end;

   while not quSaleSotrudTipTovar.Eof do
    begin
     if mdSaleSotrudTipTovar.Locate('NameTovar',quSaleSotrudTipTovarTipName.AsString,[]) then
      begin
       mdSaleSotrudTipTovar.Edit;
       mdSaleSotrudTipTovar.FieldByName(quSaleSotrudTipTovarSotrudName.AsString).AsFloat:=quSaleSotrudTipTovarSumm.AsFloat;
      end
     else
      begin
       mdSaleSotrudTipTovar.Insert;
       mdSaleSotrudTipTovar.FieldByName('NameTovar').AsString:=quSaleSotrudTipTovarTipName.AsString;
       mdSaleSotrudTipTovar.FieldByName(quSaleSotrudTipTovarSotrudName.AsString).AsFloat:=quSaleSotrudTipTovarSumm.AsFloat;
      end;
     mdSaleSotrudTipTovar.Post;
     mdSaleSotrudTipTovar.Refresh;
     quSaleSotrudTipTovar.Next;
    end;

   if mdSaleSotrudTipTovar.Locate('NameTovar','',[]) then
    begin
     mdSaleSotrudTipTovar.Edit;
     mdSaleSotrudTipTovar.FieldByName('NameTovar').AsString:='яяяПрочее';
     mdSaleSotrudTipTovar.Post;
     mdSaleSotrudTipTovar.Refresh;
    end;
    mdSaleSotrudTipTovar.SortOnFields('NameTovar',True, False);
   if mdSaleSotrudTipTovar.Locate('NameTovar','яяяПрочее',[]) then
    begin
     mdSaleSotrudTipTovar.Edit;
     mdSaleSotrudTipTovar.FieldByName('NameTovar').AsString:='Прочее';
     mdSaleSotrudTipTovar.Post;
     mdSaleSotrudTipTovar.Refresh;
    end;


   frReport8.LoadFromFile('SaleSotrudVidTovar0.frf');
   Screen.Cursor:=crDefault;
   frReport8.ShowReport;
  end;
 finally
 fmOtchets.quSaleSotrudSumm.Close;
 fmOtchets.quSaleSotrudTipTovar.Close;
 fmOtchets.Free;
 Screen.Cursor:=crDefault;
 end;
end;

procedure PrintSchet(NaklNo:integer; Preview: Boolean);
var
 Ini:TIniFile;
 Firma: Integer;
 Bux, KOplate: String;
begin
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 try
 with fmOtchets do
  begin
   Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'setup.ini');
   Firma:=Ini.ReadInteger('Options','Firma',0);
   Bux:=Ini.ReadString('Options','FIO','');
   Ini.Free;

   dmDataModule.quPost.Close;
   dmDataModule.quPost.ParamByName('PostNo').AsInteger:=Firma;
   dmDataModule.quPost.Open;


   quNaklR.ParamByName('NaklNo').AsInteger:=NaklNo;
   quNaklR.Open;
   ///
   KOplate:=IntToString(Trunc(quNaklRSumma.AsFloat))+' грн. '+
   format('%.2d',[Round(Frac(quNaklRSumma.AsFloat)*100)])+' коп.';
   ///
   quRashod.ParamByName('NaklNo').AsInteger:=NaklNo;
   quRashod.Open;
   frVariables['Bux'] := Bux;
   frVariables['KOplate'] := KOplate;
   frReport1.LoadFromFile('Schet.frf');
   Screen.Cursor:=crDefault;
   if Preview then frReport1.ShowReport
   else
    begin
     frReport1.PrepareReport;
     frReport1.PrintPreparedReport('', 1, True, frAll); //D6
//     frReport1.PrintPreparedReport(1,10,1,True) ; //D5
    end;
  end;
 finally
 fmOtchets.quNaklR.Close;
 fmOtchets.quRashod.Close;
 fmOtchets.Free;
 Screen.Cursor:=crDefault;
 end;
end;

procedure PrintNaklRShort(NaklNo:integer; Preview: Boolean);
begin
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 try
 with fmOtchets do
  begin
   quNaklR.ParamByName('NaklNo').AsInteger:=NaklNo;
   quNaklR.Open;
   quRashod.ParamByName('NaklNo').AsInteger:=NaklNo;
   quRashod.Open;

   frReport1.LoadFromFile('NaklRShort0.frf');
   Screen.Cursor:=crDefault;
   if Preview then frReport1.ShowReport
   else
    begin
     frReport1.PrepareReport;
     frReport1.PrintPreparedReport('', 1, True, frAll); //D6
//     frReport1.PrintPreparedReport(1,10,1,True) ; //D5
    end;
  end;
 finally
 fmOtchets.quNaklR.Close;
 fmOtchets.quRashod.Close;
 fmOtchets.Free;
 Screen.Cursor:=crDefault;
 end;
end;

procedure PrintPost;
begin
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 try
 with fmOtchets do
  begin
   quPrintPost.Open;
   frReport2.LoadFromFile('Post0.frf');
   Screen.Cursor:=crDefault;
   frReport2.ShowReport;
  end;
 finally
 fmOtchets.quPrintPost.Close;
 fmOtchets.Free;
 Screen.Cursor:=crDefault;
 end;
end;

procedure NotCompletOrder;
var
 Period:TPeriodDate;
begin
 Period:=ZapDate(2);
 if Period[1]=0 then exit;

 fmOtchets:=TfmOtchets.Create(Application);
 try
 with fmOtchets do
  begin
   if Period[1]<>Period[2] then
    RepTitle:='Невыполненные заказы за '+DateToStr(Period[1])+' - '+DateToStr(Period[2])
   else
    RepTitle:='Невыполненные заказы за '+DateToStr(Period[1]);
   QuRepQuery.Close;
   QuRepQuery.SQL.Clear;
   QuRepQuery.SQL.Add('  select NameTovar,VidName');
   QuRepQuery.SQL.Add(' ,sum(KolZak) as KolZak,sum(KolNakl) as KolNakl,sum(KolRez) as KolRez');
   QuRepQuery.SQL.Add(' ,sum(KolStratil) as KolStratil,sum(KolDobavil) as KolDobavil');
   QuRepQuery.SQL.Add(' from v_repNedogruz');
   QuRepQuery.SQL.Add(' where dateNakl>= :DateBegin and dateNakl<= :DateEnd');
   QuRepQuery.SQL.Add(' group by NameTovar,VidName ');
   QuRepQuery.SQL.Add(' Order by VidName,NameTovar');
   QuRepQuery.Params.ParamByName('DateBegin').Value:=Period[1];
   QuRepQuery.Params.ParamByName('DateEnd').Value:=Period[2];
   QuRepQuery.Open;
   frxReport.LoadFromFile('RepNedogruz.fr3');
   frxReport.ShowReport;
  end;
 finally
 fmOtchets.QuRepQuery.Close;
 fmOtchets.Free;
 end;
end;

procedure NotCompletOrderPost;
var
 Period:TPeriodDate;
begin
 Period:=ZapDate(2);
 if Period[1]=0 then exit;

 fmOtchets:=TfmOtchets.Create(Application);
 try
 with fmOtchets do
  begin
   if Period[1]<>Period[2] then
    RepTitle:='Невыполненные заказы за '+DateToStr(Period[1])+' - '+DateToStr(Period[2])
   else
    RepTitle:='Невыполненные заказы за '+DateToStr(Period[1]);
   QuRepQuery.Close;
   QuRepQuery.SQL.Clear;
   QuRepQuery.SQL.Add('  select PostName,NameTovar,VidName,Address');
   QuRepQuery.SQL.Add(' ,sum(KolZak) as KolZak,sum(KolNakl) as KolNakl,sum(KolRez) as KolRez');
   QuRepQuery.SQL.Add(' ,sum(KolStratil) as KolStratil,sum(KolDobavil) as KolDobavil');
   QuRepQuery.SQL.Add(' from v_repNedogruz');
   QuRepQuery.SQL.Add(' where dateNakl>= :DateBegin and dateNakl<= :DateEnd');
   QuRepQuery.SQL.Add(' group by PostName,NameTovar,VidName,Address ');
   QuRepQuery.SQL.Add(' Order by VidName,PostName,Address,NameTovar');
   QuRepQuery.Params.ParamByName('DateBegin').Value:=Period[1];
   QuRepQuery.Params.ParamByName('DateEnd').Value:=Period[2];
   QuRepQuery.Open;
   frxReport.LoadFromFile('RepNedogruzPost.fr3');
   frxReport.ShowReport;
  end;
 finally
 fmOtchets.QuRepQuery.Close;
 fmOtchets.Free;
 end;
end;

procedure TfmOtchets.frReport3GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if ParName='RepTitle' then
  ParValue:=RepTitle;
end;

procedure SaleCompanyPeriodExcel;
var
 Period:TPeriodDate;
 XLApp,Sheet,Colum:Variant;
 ColumnsCount, RowCount, Cycle, i:Integer;
 ColumnName, ConvertParValue: String;
 KolDay:string;
 RowSumm: Extended;
 SumCol: array of Extended;
begin
 Period:=ZapDate(4);
 if Period[1]=0 then exit;
 KolDay:='7';
 if not InputQuery('Продажи по производителям','Введите длительность промежутка (дней)',KolDay) then exit;

 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Nil);
 try
 with fmOtchets do
  begin
   spSaleCompanyPeriods.ParamByName('DateBegin').AsDate:=Period[1];
   spSaleCompanyPeriods.ParamByName('DateEnd').AsDate:=Period[2];
   spSaleCompanyPeriods.ParamByName('KolDay').AsString:=KolDay;
   spSaleCompanyPeriods.Open;
   //
   fmOtchets.Width:=388;
   fmOtchets.Height:=61;
   //fmOtchets.ShowModal;
   fmOtchets.Position:=poScreenCenter;
   fmOtchets.Caption:='Подготовка отчета';
   XLApp:= CreateOleObject('Excel.Application');
   XLApp.Workbooks.Add(-4167);
   XLApp.Workbooks[1].WorkSheets[1].Name:='Отчёт';
   Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт'].Columns;

   ColumnsCount:=spSaleCompanyPeriods.FieldCount;
   Colum.Columns[1].ColumnWidth:=35;
   Colum.Columns[2].ColumnWidth:=5;
   for i:=3 to ColumnsCount do
    Colum.Columns[i].ColumnWidth:=13;


   Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт'].Rows;
   Colum.Rows[1].Font.Bold:=true;
   Colum.Rows[1].Font.Color:=clNavy;
   Colum.Rows[1].Font.Size:=14;

   Sheet:=XLApp.Workbooks[1].WorkSheets['Отчёт'];
   Sheet.Cells[1,1]:='Отчёт "По производителям " за период: '+DateToStr(Period[1])+' - '+DateToStr(Period[2]);
   for i:=1 to 2 do
    begin
     Sheet.Cells.Item[2, i].Interior.Color := clSilver;
     Sheet.Cells.Item[2, i].Font.Bold:=true;
     Sheet.Cells.Item[2, i].HorizontalAlignment := xlCenter;
     Sheet.Cells.Item[2, i].VerticalAlignment := xlCenter;
     Sheet.Cells.Item[2, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     Sheet.Cells.Item[2, i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
     Sheet.Cells.Item[2, i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
     Sheet.Cells.Item[2, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
     Sheet.Cells.Item[2, i].WrapText := True;
    end;

   Sheet.Cells[2,1]:='Производитель';
   Sheet.Cells[2,2]:='% з/п';
   //
   for Cycle:=3 to ColumnsCount-1 do
    begin
     i:=Pos('E',spSaleCompanyPeriods.Fields[Cycle].FieldName);
     ColumnName:=Copy(spSaleCompanyPeriods.Fields[Cycle].FieldName,2,i-2);
     ConvertParValue:=ColumnName+' '+Copy(spSaleCompanyPeriods.Fields[Cycle].FieldName,i+1,10);
     while Pos('_', ConvertParValue) > 0 do
      ConvertParValue[Pos('_', ConvertParValue)] := '.';
     Sheet.Cells.Item[2, Cycle].Interior.Color := clSilver;
     Sheet.Cells.Item[2, Cycle].Font.Bold:=true;
     Sheet.Cells.Item[2, Cycle].HorizontalAlignment := xlCenter;
     Sheet.Cells.Item[2, Cycle].VerticalAlignment := xlCenter;
     Sheet.Cells.Item[2, Cycle].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     Sheet.Cells.Item[2, Cycle].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
     Sheet.Cells.Item[2, Cycle].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
     Sheet.Cells.Item[2, Cycle].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
     Sheet.Cells.Item[2, Cycle].WrapText := True;
     Sheet.Cells[2,Cycle]:=ConvertParValue;
    end;
   Sheet.Cells.Item[2, ColumnsCount].Interior.Color := clSilver;
   Sheet.Cells.Item[2, ColumnsCount].Font.Bold:=true;
   Sheet.Cells.Item[2, ColumnsCount].HorizontalAlignment := xlCenter;
   Sheet.Cells.Item[2, ColumnsCount].VerticalAlignment := xlCenter;
   Sheet.Cells.Item[2, ColumnsCount].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
   Sheet.Cells.Item[2, ColumnsCount].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
   Sheet.Cells.Item[2, ColumnsCount].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
   Sheet.Cells.Item[2, ColumnsCount].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
   Sheet.Cells.Item[2, ColumnsCount].WrapText := True;
   Sheet.Cells[2,ColumnsCount]:='Итого';
   //
   SetLength(SumCol, ColumnsCount+1);
   for i:=0 to ColumnsCount do
    SumCol[i]:=0;

   ProgressBar1.Min := 0;
   ProgressBar1.Max := fmOtchets.spSaleCompanyPeriods.RecordCount;
   Show;
   Update;

   RowCount:=3;
   spSaleCompanyPeriods.First;
   while not spSaleCompanyPeriods.Eof do
    begin
     RowSumm:=0.00;
     for i:=1 to ColumnsCount-1 do
      begin
       if i=1 then
        Sheet.Cells[RowCount,i]:=spSaleCompanyPeriods.Fields[i].AsString;
       if i=2 then
        Sheet.Cells[RowCount,i]:=spSaleCompanyPeriods.Fields[i].AsFloat;
       if i>2 then
        begin
         Sheet.Cells[RowCount,i]:=spSaleCompanyPeriods.Fields[i].AsFloat;
         SumCol[i-1]:=SumCol[i-1]+spSaleCompanyPeriods.Fields[i].AsFloat;
         RowSumm:=RowSumm+spSaleCompanyPeriods.Fields[i].AsFloat;
        end;
       Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
      end;
     Sheet.Cells[RowCount,ColumnsCount]:=RowSumm;
     Sheet.Cells.Item[RowCount, ColumnsCount].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     Sheet.Cells.Item[RowCount, ColumnsCount].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
     Sheet.Cells.Item[RowCount, ColumnsCount].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
     Sheet.Cells.Item[RowCount, ColumnsCount].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
     SumCol[ColumnsCount-1]:=SumCol[ColumnsCount-1]+RowSumm;

     RowCount:=RowCount+1;
     ProgressBar1.StepBy(1);
     spSaleCompanyPeriods.Next;
    end;
   //
   Colum.Rows[RowCount].Font.Bold:=true;
   for i:=1 to ColumnsCount do
    begin
     if i=1 then
      Sheet.Cells[RowCount,i]:='Итого';
     if i>2 then
      Sheet.Cells[RowCount,i]:=SumCol[i-1];
     Sheet.Cells.Item[RowCount, i].HorizontalAlignment := xlRight;
     Sheet.Cells.Item[RowCount, i].Interior.Color := clSilver;
     Sheet.Cells.Item[RowCount, i].Font.Bold:=true;
     Sheet.Cells.Item[RowCount, i].Font.Italic:=true;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
    end;
  end;
 finally
 XLApp.Visible:=true;
 Screen.Cursor:=crDefault;
 fmOtchets.spSaleCompanyPeriods.Close;
 fmOtchets.Free;
 end;
end;

procedure SaleCompanyPeriod;
var
 Period:TPeriodDate;
 i:integer;
 KolDay:string;
begin
 Period:=ZapDate(4);
 if Period[1]=0 then exit;
 KolDay:='7';
 if not InpuTQuery('Продажи по производителям','Введите длительность промежутка (дней)',KolDay) then exit;

 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 ListSum:=TList.Create;
 try
 with fmOtchets do
  begin
   RepTitle:='Отчет по производителям ';
   if Period[1]=Period[2] then
    RepTitle:=RepTitle+' за '+DateToStr(Period[1])
   else
    RepTitle:=RepTitle+' c '+DateToStr(Period[1])+' по '+DateToStr(Period[2]);
   spSaleCompanyPeriods.ParamByName('DateBegin').AsDate:=Period[1];
   spSaleCompanyPeriods.ParamByName('DateEnd').AsDate:=Period[2];
   spSaleCompanyPeriods.ParamByName('KolDay').AsString:=KolDay;
   spSaleCompanyPeriods.Open;
   Screen.Cursor:=crDefault;
   frReport4.LoadFromFile('SaleCompanyPeriod0.frf');
   frReport4.ShowReport;
  end;
 finally
 for i:=0 to ListSum.Count-1 do
  FreeMem(PSummaPeriod(ListSum.Items[i]));
 ListSum.Free;
 Screen.Cursor:=crDefault;
 fmOtchets.spSaleCompanyPeriods.Close;
 fmOtchets.Free;
 end;
end;

procedure TfmOtchets.frUserDataset1First(Sender: TObject);
begin
 Coln:=3;
end;

procedure TfmOtchets.frUserDataset1Next(Sender: TObject);
begin
 Inc(Coln);
end;

procedure TfmOtchets.frUserDataset1CheckEOF(Sender: TObject;
  var EOF: Boolean);
begin
 EOF:=(Coln=spSaleCompanyPeriods.FieldCount);
end;

procedure TfmOtchets.frReport4BeginDoc;
var
 i:integer;
begin
 for i:=0 to ListSum.Count-1 do
  begin
   PSummaPeriod(ListSum.Items[i])^.Summa:=0;
  end;
end;

procedure TfmOtchets.frReport4GetValue(const ParName: String;
  var ParValue: Variant);
var
 i:integer;
 P:PSummaPeriod;
 ConvertParValue: String;
begin
 if ParName='RepTitle' then
  ParValue:=RepTitle;

 if ParName='Cell' then
  begin
   if spSaleCompanyPeriods.Fields[Coln].AsFloat<>0 then
    ParValue:=format('%.2n',[spSaleCompanyPeriods.Fields[Coln].AsFloat])
   else
    ParValue:='';
   for i:=0 to ListSum.Count-1 do
    begin
     if PSummaPeriod(ListSum.Items[i])^.Period=spSaleCompanyPeriods.Fields[Coln].FieldName then
      begin
        PSummaPeriod(ListSum.Items[i])^.Summa:=PSummaPeriod(ListSum.Items[i])^.Summa+spSaleCompanyPeriods.Fields[Coln].AsFloat;
        break;
      end;
    end;
  end;

 if ParName='CellHead' then
  begin
   ParValue:='';
   i:=Pos('E',spSaleCompanyPeriods.Fields[Coln].FieldName);
   ParValue:=Copy(spSaleCompanyPeriods.Fields[Coln].FieldName,2,i-2);
   ConvertParValue:=ParValue+' '+Copy(spSaleCompanyPeriods.Fields[Coln].FieldName,i+1,10);
   while Pos('_', ConvertParValue) > 0 do
    ConvertParValue[Pos('_', ConvertParValue)] := '.';
   ParValue:=ConvertParValue;

   New(P);
   P^.Period:=spSaleCompanyPeriods.Fields[Coln].FieldName;
   P^.Summa:=0;
   ListSum.Add(P);
  end;

 if ParName='SummaRow' then
  begin
   ParValue:=0.00;
   for i:=3 to spSaleCompanyPeriods.FieldCount-1 do
    begin
     ParValue:=ParValue+spSaleCompanyPeriods.Fields[i].AsFloat;
    end;
  end;

 if ParName='SummaCol' then
  begin
   ParValue:=0.00;
   for i:=0 to ListSum.Count-1 do
    begin
     if PSummaPeriod(ListSum.Items[i])^.Period=spSaleCompanyPeriods.Fields[Coln].FieldName then
      begin
       ParValue:=PSummaPeriod(ListSum.Items[i])^.Summa;
       break;
      end;
    end;
  end;

 if ParName='SummaItog' then
  begin
   ParValue:=0.00;
   for i:=0 to ListSum.Count-1 do
    begin
     Parvalue:=Parvalue+PSummaPeriod(ListSum.Items[i])^.Summa;
    end;
  end;

end;

procedure SaleCustomersPeriodExcel;
var
 Period:TDatePeriod;
 XLApp,Sheet,Colum:Variant;
 ColumnsCount, RowCount, Cycle, i:Integer;
 ColumnName, ConvertParValue: String;
 KolDay:string;
 RowSumm: Extended;
 SotrudName: String;
 SumGroup, SumAll: array of Extended;
begin
 Period:=GetPeriodDate(Date()-6,Date());
 if Period.DateBegin=0 then exit;
 KolDay:='1';
 if not InpuTQuery('Продажи по покупателям','Введите длительность промежутка (дней)',KolDay) then exit;

 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Nil);
 try
 with fmOtchets do
  begin
   spSaleCustomersPeriods.ParamByName('DateBegin').AsDate:=Period.DateBegin;
   spSaleCustomersPeriods.ParamByName('DateEnd').AsDate:=Period.DateEnd;
   spSaleCustomersPeriods.ParamByName('KolDay').AsString:=KolDay;
   spSaleCustomersPeriods.Open;
   //
   fmOtchets.Width:=388;
   fmOtchets.Height:=61;
   //fmOtchets.ShowModal;
   fmOtchets.Position:=poScreenCenter;
   fmOtchets.Caption:='Подготовка отчета';
   XLApp:= CreateOleObject('Excel.Application');
   XLApp.Workbooks.Add(-4167);
   XLApp.Workbooks[1].WorkSheets[1].Name:='Отчёт';
   Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт'].Columns;

   ColumnsCount:=spSaleCustomersPeriods.FieldCount;
   Colum.Columns[1].ColumnWidth:=25;
   Colum.Columns[2].ColumnWidth:=25;
   for i:=3 to ColumnsCount-1 do
    Colum.Columns[i].ColumnWidth:=13;


   Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт'].Rows;
   Colum.Rows[1].Font.Bold:=true;
   Colum.Rows[1].Font.Color:=clNavy;
   Colum.Rows[1].Font.Size:=14;

   Sheet:=XLApp.Workbooks[1].WorkSheets['Отчёт'];
   Sheet.Cells[1,1]:='Отчёт "По покупателям " за период: '+DateToStr(Period.DateBegin)+' - '+DateToStr(Period.DateEnd);
   for i:=1 to 2 do
    begin
     Sheet.Cells.Item[2, i].Interior.Color := clSilver;
     Sheet.Cells.Item[2, i].Font.Bold:=true;
     Sheet.Cells.Item[2, i].HorizontalAlignment := xlCenter;
     Sheet.Cells.Item[2, i].VerticalAlignment := xlCenter;
     Sheet.Cells.Item[2, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     Sheet.Cells.Item[2, i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
     Sheet.Cells.Item[2, i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
     Sheet.Cells.Item[2, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
     Sheet.Cells.Item[2, i].WrapText := True;
    end;
   Sheet.Cells[2,1]:='Покупатели';
   Sheet.Cells[2,2]:='Адрес';

   for Cycle:=4 to ColumnsCount-1 do
    begin
     i:=Pos('E',spSaleCustomersPeriods.Fields[Cycle].FieldName);
     ColumnName:=Copy(spSaleCustomersPeriods.Fields[Cycle].FieldName,2,i-2);
     ConvertParValue:=ColumnName+' '+Copy(spSaleCustomersPeriods.Fields[Cycle].FieldName,i+1,10);
     while Pos('_', ConvertParValue) > 0 do
      ConvertParValue[Pos('_', ConvertParValue)] := '.';
     Sheet.Cells.Item[2, Cycle-1].Interior.Color := clSilver;
     Sheet.Cells.Item[2, Cycle-1].Font.Bold:=true;
     Sheet.Cells.Item[2, Cycle-1].HorizontalAlignment := xlCenter;
     Sheet.Cells.Item[2, Cycle-1].VerticalAlignment := xlCenter;
     Sheet.Cells.Item[2, Cycle-1].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     Sheet.Cells.Item[2, Cycle-1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
     Sheet.Cells.Item[2, Cycle-1].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
     Sheet.Cells.Item[2, Cycle-1].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
     Sheet.Cells.Item[2, Cycle-1].WrapText := True;
     Sheet.Cells[2,Cycle-1]:=ConvertParValue;
    end;
   Sheet.Cells.Item[2, ColumnsCount-1].Interior.Color := clSilver;
   Sheet.Cells.Item[2, ColumnsCount-1].Font.Bold:=true;
   Sheet.Cells.Item[2, ColumnsCount-1].HorizontalAlignment := xlCenter;
   Sheet.Cells.Item[2, ColumnsCount-1].VerticalAlignment := xlCenter;
   Sheet.Cells.Item[2, ColumnsCount-1].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
   Sheet.Cells.Item[2, ColumnsCount-1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
   Sheet.Cells.Item[2, ColumnsCount-1].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
   Sheet.Cells.Item[2, ColumnsCount-1].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
   Sheet.Cells.Item[2, ColumnsCount-1].WrapText := True;
   Sheet.Cells[2,ColumnsCount-1]:='Итого';

   ProgressBar1.Min := 0;
   ProgressBar1.Max := fmOtchets.spSaleCustomersPeriods.RecordCount;
   Show;
   Update;

   spSaleCustomersPeriods.First;
   SotrudName:=spSaleCustomersPeriods.FieldByName('SotrudName').AsString;
   for i:=1 to ColumnsCount-1 do
    begin
     Sheet.Cells.Item[3, i].Interior.Color := clSkyBlue;
     Sheet.Cells.Item[3, i].Font.Italic:=true;
     Sheet.Cells.Item[3, i].Font.Bold:=true;
     Sheet.Cells.Item[3, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     Sheet.Cells.Item[3, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
     Sheet.Cells[3,1]:=SotrudName;
    end;
   Sheet.Cells.Item[3, 1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
   Sheet.Cells.Item[3, ColumnsCount-1].Borders.Item[xlEdgeRight].Linestyle := xlSolid;

   RowCount:=4;
   SetLength(SumGroup, ColumnsCount);
   SetLength(SumAll, ColumnsCount);
   for i:=0 to ColumnsCount-1 do
    begin
     SumGroup[i]:=0;
     SumAll[i]:=0;
    end;

   while not spSaleCustomersPeriods.Eof do
    begin
     if not (SotrudName=spSaleCustomersPeriods.FieldByName('SotrudName').AsString) then
      begin
       Colum.Rows[RowCount].Font.Bold:=true;
       Colum.Rows[RowCount].Font.Italic:=True;
       for i:=1 to ColumnsCount-2 do
        begin
         if i=1 then
          begin
           Sheet.Cells[RowCount,2]:='Итого';
           Sheet.Cells.Item[RowCount, 2].HorizontalAlignment := xlRight;
           Sheet.Cells.Item[RowCount, 1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
           Sheet.Cells.Item[RowCount, 2].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
          end;
         if i=2 then
          begin
           Sheet.Cells[RowCount,ColumnsCount-1]:=SumGroup[i];
           SumAll[i]:=SumAll[i]+SumGroup[i];
           SumGroup[i]:=0;
           Sheet.Cells.Item[RowCount,ColumnsCount-1].Interior.Color := clYellow;
           Sheet.Cells.Item[RowCount,ColumnsCount-1].Font.Italic:=true;
           Sheet.Cells.Item[RowCount,ColumnsCount-1].Font.Bold:=true;
           Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
           Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
           Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
           Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
          end;
         if i>2 then
          begin
           Sheet.Cells[RowCount,i]:=SumGroup[i];
           SumAll[i]:=SumAll[i]+SumGroup[i];
           SumGroup[i]:=0;
           Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
           Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
          end;
         Sheet.Cells.Item[RowCount, i].Interior.Color := clYellow;
         Sheet.Cells.Item[RowCount, i].Font.Italic:=true;
         Sheet.Cells.Item[RowCount, i].Font.Bold:=true;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
        end;
       RowCount:=RowCount+1;
       SotrudName:=spSaleCustomersPeriods.FieldByName('SotrudName').AsString;
       for i:=1 to ColumnsCount-1 do
        begin
         Sheet.Cells.Item[RowCount, i].Interior.Color := clSkyBlue;
         Sheet.Cells.Item[RowCount, i].Font.Italic:=true;
         Sheet.Cells.Item[RowCount, i].Font.Bold:=true;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
         Sheet.Cells[RowCount,1]:=SotrudName;
        end;
        Sheet.Cells.Item[RowCount, 1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
        Sheet.Cells.Item[RowCount, ColumnsCount-1].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
       RowCount:=RowCount+1;
      end;

     RowSumm:=0.00;
     for i:=1 to ColumnsCount-1 do
      begin
       if i=1 then
        Sheet.Cells[RowCount,i]:=spSaleCustomersPeriods.Fields[i].AsString;
       if i=3 then
        Sheet.Cells[RowCount,i-1]:=spSaleCustomersPeriods.Fields[i].AsString;
       if i>=4 then
        begin
         Sheet.Cells[RowCount,i-1]:=spSaleCustomersPeriods.Fields[i].AsFloat;
         SumGroup[i-1]:=SumGroup[i-1]+spSaleCustomersPeriods.Fields[i].AsFloat;
         RowSumm:=RowSumm+spSaleCustomersPeriods.Fields[i].AsFloat;
        end;
       Sheet.Cells.Item[RowCount,i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
      end;
     Sheet.Cells[RowCount,ColumnsCount-1]:=RowSumm;
     SumGroup[2]:=SumGroup[2]+RowSumm;

     RowCount:=RowCount+1;
     ProgressBar1.StepBy(1);
     spSaleCustomersPeriods.Next;
    end;

   Colum.Rows[RowCount].Font.Bold:=true;
   Colum.Rows[RowCount].Font.Italic:=True;
   for i:=1 to ColumnsCount-2 do
    begin
     if i=1 then
      begin
       Sheet.Cells[RowCount,2]:='Итого';
       Sheet.Cells.Item[RowCount, 2].HorizontalAlignment := xlRight;
       Sheet.Cells.Item[RowCount, 1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount, 2].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
      end;
     if i=2 then
      begin
       Sheet.Cells[RowCount,ColumnsCount-1]:=SumGroup[i];
       SumAll[i]:=SumAll[i]+SumGroup[i];
       SumGroup[i]:=0;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Interior.Color := clYellow;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Font.Italic:=true;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Font.Bold:=true;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
      end;
     if i>2 then
      begin
       Sheet.Cells[RowCount,i]:=SumGroup[i];
       SumAll[i]:=SumAll[i]+SumGroup[i];
       SumGroup[i]:=0;
       Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
      end;
     Sheet.Cells.Item[RowCount, i].Interior.Color := clYellow;
     Sheet.Cells.Item[RowCount, i].Font.Italic:=true;

     Sheet.Cells.Item[RowCount, i].Font.Bold:=true;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
    end;

   RowCount:=RowCount+1;
   Colum.Rows[RowCount].Font.Bold:=true;
   Colum.Rows[RowCount].Font.Italic:=True;
   //
   for i:=1 to ColumnsCount-2 do
    begin
     if i=1 then
      begin
       Sheet.Cells[RowCount,2]:='Всего';
       Sheet.Cells.Item[RowCount, 2].HorizontalAlignment := xlRight;
       Sheet.Cells.Item[RowCount, 1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount, 2].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
      end;
     if i=2 then
      begin
       Sheet.Cells[RowCount,ColumnsCount-1]:=SumAll[i];
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Interior.Color := clSilver;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Font.Italic:=true;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Font.Bold:=true;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount,ColumnsCount-1].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
      end;
     if i>2 then
      begin
       Sheet.Cells[RowCount,i]:=SumAll[i];
       Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
      end;
     Sheet.Cells.Item[RowCount, i].Interior.Color := clSilver;
     Sheet.Cells.Item[RowCount, i].Font.Italic:=true;
     Sheet.Cells.Item[RowCount, i].Font.Bold:=true;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
    end;
   //

  end;
 finally
 XLApp.Visible:=true;
 Screen.Cursor:=crDefault;
 fmOtchets.spSaleCustomersPeriods.Close;
 fmOtchets.Free;
 end;
end;

procedure SaleCustomersPeriod;
var
 Period:TDatePeriod;
 i:integer;
 KolDay:string;
begin
 Period:=GetPeriodDate(Date()-6,Date());
 if Period.DateBegin=0 then exit;
 KolDay:='1';
 if not InpuTQuery('Продажи по покупателям','Введите длительность промежутка (дней)',KolDay) then exit;

 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 ListSum:=TList.Create;
 try
 with fmOtchets do
  begin
   RepTitle:='Отчет по покупателям ';
   if Period.DateBegin=Period.DateEnd then
    RepTitle:=RepTitle+' за '+DateToStr(Period.DateBegin)
   else
    RepTitle:=RepTitle+' c '+DateToStr(Period.DateBegin)+' по '+DateToStr(Period.DateEnd);
   spSaleCustomersPeriods.ParamByName('DateBegin').AsDate:=Period.DateBegin;
   spSaleCustomersPeriods.ParamByName('DateEnd').AsDate:=Period.DateEnd;
   spSaleCustomersPeriods.ParamByName('KolDay').AsString:=KolDay;
   spSaleCustomersPeriods.Open;
   Screen.Cursor:=crDefault;
   frReport5.LoadFromFile('SaleCustomersPeriod1.frf');
   frReport5.ShowReport;
  end;
 finally
 for i:=0 to ListSum.Count-1 do
  FreeMem(PSummaPeriod(ListSum.Items[i]));
 ListSum.Free;

 Screen.Cursor:=crDefault;
 fmOtchets.spSaleCustomersPeriods.Close;
 fmOtchets.Free;
 end;
end;

procedure TfmOtchets.frUserDataset2First(Sender: TObject);
begin
 Coln:=4;
end;

procedure TfmOtchets.frUserDataset2Next(Sender: TObject);
begin
 Inc(Coln);
end;

procedure TfmOtchets.frUserDataset2CheckEOF(Sender: TObject;
  var EOF: Boolean);
begin
 EOF:=(spSaleCustomersPeriods.FieldCount=Coln);
end;

procedure TfmOtchets.frReport5GetValue(const ParName: String;
  var ParValue: Variant);
var
 i:integer;
 P:PSummaPeriod;
 ConvertParValue: String;
begin
 if ParName='RepTitle' then
  ParValue:=RepTitle;

 if ParName='Cell' then
  begin
   if spSaleCustomersPeriods.Fields[Coln].AsFloat<>0 then
    ParValue:=format('%.2n',[spSaleCustomersPeriods.Fields[Coln].AsFloat])
   else
    ParValue:='';
   for i:=0 to ListSum.Count-1 do
    begin
     if PSummaPeriod(ListSum.Items[i])^.Period=spSaleCustomersPeriods.Fields[Coln].FieldName then
      begin
        PSummaPeriod(ListSum.Items[i])^.Summa:=PSummaPeriod(ListSum.Items[i])^.Summa+spSaleCustomersPeriods.Fields[Coln].AsFloat;
        PSummaPeriod(ListSum.Items[i])^.SummaGroup:=PSummaPeriod(ListSum.Items[i])^.SummaGroup+spSaleCustomersPeriods.Fields[Coln].AsFloat;
        break;
      end;
    end;
  end;

 if ParName='CellHead' then
  begin
   ParValue:='';
   i:=Pos('E',spSaleCustomersPeriods.Fields[Coln].FieldName);
   ParValue:=Copy(spSaleCustomersPeriods.Fields[Coln].FieldName,2,i-2);
   ConvertParValue:=ParValue+' '+Copy(spSaleCustomersPeriods.Fields[Coln].FieldName,i+1,10);
   while Pos('_', ConvertParValue) > 0 do
    ConvertParValue[Pos('_', ConvertParValue)] := '.';
   ParValue:=ConvertParValue;


   New(P);
   P^.Period:=spSaleCustomersPeriods.Fields[Coln].FieldName;
   P^.Summa:=0;
   P^.SummaGroup:=0;
   ListSum.Add(P);
  end;

 if ParName='SummaRow' then
  begin
   ParValue:=0.00;
   for i:=4 to spSaleCustomersPeriods.FieldCount-1 do
    begin
     ParValue:=ParValue+spSaleCustomersPeriods.Fields[i].AsFloat;
    end;
  end;

 if ParName='SummaCol' then
  begin
   ParValue:=0.00;
   for i:=0 to ListSum.Count-1 do
    begin
     if PSummaPeriod(ListSum.Items[i])^.Period=spSaleCustomersPeriods.Fields[Coln].FieldName then
      begin
       ParValue:=(PSummaPeriod(ListSum.Items[i])^.Summa)/2;
       break;
      end;
    end;
  end;

 if ParName='SummaItog' then
  begin
   ParValue:=0.00;
   for i:=0 to ListSum.Count-1 do
    begin
     Parvalue:=ParValue+PSummaPeriod(ListSum.Items[i])^.Summa/2;
    end;
  end;

 if ParName='SummaColGroup' then
  begin
   ParValue:=0;
   for i:=0 to ListSum.Count-1 do
    begin
     if Coln<spSaleCustomersPeriods.FieldCount then
      if PSummaPeriod(ListSum.Items[i])^.Period=spSaleCustomersPeriods.Fields[Coln].FieldName then
       begin
        ParValue:=(PSummaPeriod(ListSum.Items[i])^.SummaGroup)/2;
        PSummaPeriod(ListSum.Items[i])^.SummaGroup:=0;
        Summa:=Summa+ParValue;
        break;
       end;
    end;
  end;

 if ParName='SummaRowGroup' then
  begin
   ParValue:=Summa;
   Summa:=0;
  end;
end;

procedure CrossPostCompanyExcel(Returne: Boolean);
var
 Period:TDatePeriod;
 XLApp,Sheet,Colum:Variant;
 ColumnsCount, RowCount, i:Integer;
 RowSumm: Extended;
 SotrudName: String;
 SumGroup, SumAll: array of Extended;
begin
 Period:=GetPeriodDate(0,0);
 if Period.DateBegin=0 then exit;

 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(nil);
 try
 with fmOtchets do
  begin
   spCrossPostCompanyOld.ParamByName('DateBegin').AsDate:=Period.DateBegin;
   spCrossPostCompanyOld.ParamByName('DateEnd').AsDate:=Period.DateEnd;
   if Returne then
   //Возвратные накладные
    spCrossPostCompanyOld.ParamByName('Returne').AsInteger:=3
   else
   //Расходные накладные
    spCrossPostCompanyOld.ParamByName('Returne').AsInteger:=1;
   spCrossPostCompanyOld.Open;
   //

   fmOtchets.Width:=388;
   fmOtchets.Height:=61;
   //fmOtchets.ShowModal;
   fmOtchets.Position:=poScreenCenter;
   fmOtchets.Caption:='Подготовка отчета';
   XLApp:= CreateOleObject('Excel.Application');
   XLApp.Workbooks.Add(-4167);
   XLApp.Workbooks[1].WorkSheets[1].Name:='Отчёт';
   Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт'].Columns;

   ColumnsCount:=spCrossPostCompanyOld.FieldCount;
   Colum.Columns[1].ColumnWidth:=35;
   Colum.Columns[2].ColumnWidth:=15;
   for i:=2 to ColumnsCount-2 do
    Colum.Columns[i].ColumnWidth:=15;


   Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт'].Rows;
   Colum.Rows[2].Font.Bold:=true;
   Colum.Rows[1].Font.Bold:=true;
   Colum.Rows[1].Font.Color:=clBlue;
   Colum.Rows[1].Font.Size:=14;

   Sheet:=XLApp.Workbooks[1].WorkSheets['Отчёт'];
   if Returne then
   //Возвратные накладные
    Sheet.Cells[1,1]:='Отчёт "По покупателю и производителю (Возвратные накладные)" за период: '+DateToStr(Period.DateBegin)+' - '+DateToStr(Period.DateEnd)
   else
   //Расходные накладные
    Sheet.Cells[1,1]:='Отчёт "По покупателю и производителю (Расходные накладные)" за период: '+DateToStr(Period.DateBegin)+' - '+DateToStr(Period.DateEnd);

   Sheet.Cells[2,1]:='Покупатель';
   Sheet.Cells[2,2]:='Итого';
   for i:=0 to ColumnsCount-1 do
    begin
     if Copy(spCrossPostCompanyOld.Fields[i].FieldName,1,1)='C' then
      if i<spCrossPostCompanyOld.FieldCount then
       begin
        quCompany.ParamByName('CompanyNo').AsString:=Copy(spCrossPostCompanyOld.Fields[i].FieldName,2,10);
        quCompany.Open;
        if quCompanyCompanyNo.AsInteger=0 then
         Sheet.Cells[2,i-1]:='ПРОЧЕЕ'
        else
         Sheet.Cells[2,i-1]:=quCompanyNameCompany.AsString;
        quCompany.Close;
       end;
    end;

   ProgressBar1.Min := 0;
   ProgressBar1.Max := fmOtchets.spCrossPostCompanyOld.RecordCount;
   Show;
   Update;

   //
   spCrossPostCompanyOld.First;
   SotrudName:=spCrossPostCompanyOld.FieldByName('SotrudName').AsString;
   Colum.Rows[3].Font.Bold:=true;
   Sheet.Cells[3,1]:=SotrudName;
   RowCount:=4;
   SetLength(SumGroup, ColumnsCount);
   SetLength(SumAll, ColumnsCount);
   for i:=0 to ColumnsCount-1 do
    begin
     SumGroup[i]:=0;
     SumAll[i]:=0;
    end;

   while not spCrossPostCompanyOld.Eof do
    begin
     if not (SotrudName=spCrossPostCompanyOld.FieldByName('SotrudName').AsString) then
      begin
       Colum.Rows[RowCount].Font.Bold:=true;
       Colum.Rows[RowCount].Font.Italic:=True;
       for i:=1 to ColumnsCount-2 do
        begin
         if i=1 then
          Sheet.Cells[RowCount,1]:='Итого'
         else
          begin
           Sheet.Cells[RowCount,i]:=SumGroup[i];
           SumAll[i]:=SumAll[i]+SumGroup[i];
           SumGroup[i]:=0;
          end;
        end;
       RowCount:=RowCount+1;
       SotrudName:=spCrossPostCompanyOld.FieldByName('SotrudName').AsString;
       Colum.Rows[RowCount].Font.Bold:=true;
       Sheet.Cells[RowCount,1]:=SotrudName;
       RowCount:=RowCount+1;
      end;

     RowSumm:=0.00;
     for i:=1 to ColumnsCount-1 do
      begin
       if i=1 then
        Sheet.Cells[RowCount,i]:=spCrossPostCompanyOld.Fields[i].AsString;
       if i>=4 then
        begin
         Sheet.Cells[RowCount,i-1]:=spCrossPostCompanyOld.Fields[i].AsFloat;
         SumGroup[i-1]:=SumGroup[i-1]+spCrossPostCompanyOld.Fields[i].AsFloat;
         RowSumm:=RowSumm+spCrossPostCompanyOld.Fields[i].AsFloat;
        end;
      end;
     Sheet.Cells[RowCount,2]:=RowSumm;
     SumGroup[2]:=SumGroup[2]+RowSumm;

     RowCount:=RowCount+1;
     ProgressBar1.StepBy(1);
     spCrossPostCompanyOld.Next;
    end;

    Colum.Rows[RowCount].Font.Bold:=true;
    Colum.Rows[RowCount].Font.Italic:=True;
    for i:=1 to ColumnsCount-2 do
     begin
      if i=1 then
       Sheet.Cells[RowCount,1]:='Итого'
      else
       begin
        Sheet.Cells[RowCount,i]:=SumGroup[i];
        SumAll[i]:=SumAll[i]+SumGroup[i];
        SumGroup[i]:=0;
       end;
     end;

    RowCount:=RowCount+1;
    Colum.Rows[RowCount].Font.Bold:=true;
    Colum.Rows[RowCount].Font.Italic:=True;
    for i:=1 to ColumnsCount-2 do
     begin
      if i=1 then
       Sheet.Cells[RowCount,1]:='Всего'
      else
       Sheet.Cells[RowCount,i]:=SumAll[i];
     end;
   //


  end;
 finally
 XLApp.Visible:=true;
 fmOtchets.spCrossPostCompanyOld.Close;
 fmOtchets.Free;
 Screen.Cursor:=crDefault;
 end;
end;

procedure CrossPostCompany(Returne: Boolean);
var
 Period:TDatePeriod;
 i:integer;
begin
 Period:=GetPeriodDate(0,0);
 if Period.DateBegin=0 then exit;

 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 ListSum:=TList.Create;
 try
 with fmOtchets do
  begin
   if Period.DateBegin=Period.DateEnd then
    RepTitle:='За '+DateToStr(Period.DateBegin)
   else
    RepTitle:=RepTitle+'С '+DateToStr(Period.DateBegin)+' по '+DateToStr(Period.DateEnd);
   spCrossPostCompany.ParamByName('DateBegin').AsDate:=Period.DateBegin;
   spCrossPostCompany.ParamByName('DateEnd').AsDate:=Period.DateEnd;
   if Returne then
   //Возвратные накладные
    spCrossPostCompany.ParamByName('Returne').AsInteger:=3
   else
   //Расходные накладные
    spCrossPostCompany.ParamByName('Returne').AsInteger:=1;
   spCrossPostCompany.Open;
   spCrossPostCompany.Open;
   Screen.Cursor:=crDefault;
   frReport6.LoadFromFile('CrossPostCompany0.frf');

//   Show;
//   Update;

   frReport6.ShowReport;
  end;
 finally
 for i:=0 to ListSum.Count-1 do
  FreeMem(PSummaCP(ListSum.Items[i]));
 ListSum.Free;

 Screen.Cursor:=crDefault;
 fmOtchets.spCrossPostCompany.Close;
 fmOtchets.Free;
 end;
end;

procedure TfmOtchets.frUserDataset3First(Sender: TObject);
begin
 Coln:=5;
end;

procedure TfmOtchets.frUserDataset3Next(Sender: TObject);
begin
 Inc(Coln);
end;

procedure TfmOtchets.frUserDataset3CheckEOF(Sender: TObject;
  var EOF: Boolean);
begin
 EOF:=(Coln=spCrossPostCompany.FieldCount);
end;

procedure TfmOtchets.frReport6GetValue(const ParName: String;
  var ParValue: Variant);
var
 i:integer;
 P:PSummaCP;
begin
 if ParName='RepTitle' then
  ParValue:=RepTitle;

 if ParName='Cell' then
  begin
   if spCrossPostCompany.Fields[Coln].AsFloat<>0 then
    ParValue:=format('%.2n',[spCrossPostCompany.Fields[Coln].AsFloat])
   else
    ParValue:='';

   for i:=0 to ListSum.Count-1 do
    begin
     if PSummaCP(ListSum.Items[i])^.CompanyNo=StrToInt(Copy(spCrossPostCompany.Fields[Coln].FieldName,2,10)) then
      begin
       PSummaCP(ListSum.Items[i])^.Summa:=PSummaCP(ListSum.Items[i])^.Summa+spCrossPostCompany.Fields[Coln].AsFloat;
       PSummaCP(ListSum.Items[i])^.SummaGroup:=PSummaCP(ListSum .Items[i])^.SummaGroup+spCrossPostCompany.Fields[Coln].AsFloat;
       if spCrossPostCompany.Fields[4].AsBoolean then
        PSummaCP(ListSum.Items[i])^.SummaVipGroup:=PSummaCP(ListSum .Items[i])^.SummaVipGroup+spCrossPostCompany.Fields[Coln].AsFloat
       else
        PSummaCP(ListSum.Items[i])^.SummaRozGroup:=PSummaCP(ListSum .Items[i])^.SummaRozGroup+spCrossPostCompany.Fields[Coln].AsFloat;
       if spCrossPostCompany.Fields[Coln].AsFloat<>0 then
        PSummaCP(ListSum.Items[i])^.KolRow:=PSummaCP(ListSum.Items[i])^.KolRow+1;
       break;
      end;
    end;
  end;

 if ParName='CellHeader' then
  begin
   ParValue:='';
   if Copy(spCrossPostCompany.Fields[Coln].FieldName,1,1)='C' then
    begin
     if Coln<spCrossPostCompany.FieldCount then
      begin
       quCompany.ParamByName('CompanyNo').AsString:=Copy(spCrossPostCompany.Fields[Coln].FieldName,2,10);
       quCompany.Open;
       ParValue:=quCompanyNameCompany.AsString;
       New(P);
       P^.CompanyNo:=quCompanyCompanyNo.AsInteger;
       P^.Summa:=0;
       P^.KolRow:=0;
       P^.SummaGroup:=0;
       P^.SummaVipGroup:=0;
       P^.SummaRozGroup:=0;
       ListSum.Add(P);
       if quCompanyCompanyNo.AsInteger=0 then ParValue:='ПРОЧЕЕ';
       quCompany.Close;
      end;
    end
  end;

 if ParName='SummaRow' then
  begin
   ParValue:=0.00;
   for i:=5 to spCrossPostCompany.FieldCount-1 do
    begin
     ParValue:=ParValue+spCrossPostCompany.Fields[i].AsFloat;
    end;
  end;

 if ParName='SummaCol' then
  begin
   ParValue:=0;
   for i:=0 to ListSum.Count-1 do
    begin
     if PSummaCP(ListSum.Items[i])^.CompanyNo=StrToInt(Copy(spCrossPostCompany.Fields[Coln].FieldName,2,10)) then
      begin
       ParValue:=PSummaCP(ListSum.Items[i])^.Summa;
       break;
      end;
    end;
   ParValue:=ParValue/2;
  end;

 if ParName='KolRow' then
  begin
   ParValue:=0;
   for i:=0 to ListSum.Count-1 do
    begin
     if PSummaCP(ListSum.Items[i])^.CompanyNo=StrToInt(Copy(spCrossPostCompany.Fields[Coln].FieldName,2,10)) then
      begin
       ParValue:=(PSummaCP(ListSum.Items[i])^.KolRow)/2;
       break;
      end;
    end;
  end;

 if ParName='SummaColGroup' then
  begin
   ParValue:=0;
   for i:=0 to ListSum.Count-1 do
    begin
     if Coln<spCrossPostCompany.FieldCount then
      if PSummaCP(ListSum.Items[i])^.CompanyNo=StrToInt(Copy(spCrossPostCompany.Fields[Coln].FieldName,2,10)) then
       begin
        ParValue:=PSummaCP(ListSum.Items[i])^.SummaGroup;
        PSummaCP(ListSum.Items[i])^.SummaGroup:=0;
        PSummaCP(ListSum.Items[i])^.SummaVipGroup:=0;
        PSummaCP(ListSum.Items[i])^.SummaRozGroup:=0;
        break;
       end;
    end;
   ParValue:=ParValue/2;
  end;

 if ParName='SummaAll' then
  begin
   ParValue:=0;
   for i:=0 to ListSum.Count-1 do
    begin
     ParValue:=ParValue+PSummaCP(ListSum.Items[i])^.Summa;
    end;
   ParValue:=ParValue/2;
  end;

 if ParName='SummaAllGroup' then
  begin
   ParValue:=0;
   for i:=0 to ListSum.Count-1 do
    begin
     ParValue:=ParValue+PSummaCP(ListSum.Items[i])^.SummaGroup;
    end;
   ParValue:=ParValue/2;
  end;

 if ParName='NameGroup' then
  if spCrossPostCompany.Fields[4].AsBoolean then
   ParValue:='Итого VIP:'
  else
   ParValue:='Итого розница:';

 if ParName='SummaCatAll' then
  begin
   ParValue:=0;
   for i:=0 to ListSum.Count-1 do
    begin
     if spCrossPostCompany.Fields[4].AsBoolean then
      ParValue:=ParValue+PSummaCP(ListSum.Items[i])^.SummaVipGroup
     else
      ParValue:=ParValue+PSummaCP(ListSum.Items[i])^.SummaRozGroup;
    end;
   ParValue:=ParValue/2;
  end;

 if ParName='SummaCatCol' then
  begin
   ParValue:=0;
   for i:=0 to ListSum.Count-1 do
    begin
     if Coln<spCrossPostCompany.FieldCount then
      if PSummaCP(ListSum.Items[i])^.CompanyNo=StrToInt(Copy(spCrossPostCompany.Fields[Coln].FieldName,2,10)) then
       begin
        if spCrossPostCompany.Fields[4].AsBoolean then
         begin
          ParValue:=PSummaCP(ListSum.Items[i])^.SummaVipGroup;
          PSummaCP(ListSum.Items[i])^.SummaVipGroup:=0;
         end
        else
         begin
          ParValue:=PSummaCP(ListSum.Items[i])^.SummaRozGroup;
          PSummaCP(ListSum.Items[i])^.SummaRozGroup:=0;
         end;
        break;
       end;
    end;
   ParValue:=ParValue/2;
  end;

end;


procedure TfmOtchets.frReport5BeginDoc;
var
 i:integer;
begin
 Summa:=0;
 for i:=0 to ListSum.Count-1 do
  begin
   PSummaPeriod(ListSum.Items[i])^.Summa:=0;
  end;
end;

procedure TfmOtchets.frReport6BeginDoc;
var
 i:integer;
begin
 for i:=0 to ListSum.Count-1 do
  begin
   PSummaCP(ListSum.Items[i])^.Summa:=0;
   PSummaCP(ListSum.Items[i])^.SummaGroup:=0;
   PSummaCP(ListSum.Items[i])^.SummaVipGroup:=0;
   PSummaCP(ListSum.Items[i])^.SummaRozGroup:=0;
   PSummaCP(ListSum.Items[i])^.KolRow:=0;
  end;
end;

procedure LoadCarNakl(Nakls:string);
begin
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 try
 with fmOtchets do
  begin
   fmOtchets.quNaklR2.Close;
   fmOtchets.quRashod2.Close;
   quNaklR2.MacroByName('Nakl').Value:=Nakls;
   quRashod2.MacroByName('Nakl').Value:=Nakls;
   quNaklR2.Open;
   quRashod2.Open;
   frReport7.LoadFromFile('NaklM0.frf');
   Screen.Cursor:=crDefault;
   frReport7.ShowReport;
  end;
 finally
 Screen.Cursor:=crDefault;
 fmOtchets.quNaklR2.Close;
 fmOtchets.quRashod2.Close;
 fmOtchets.Free;
 end;
end;

procedure LoadCarNaklTreb(Nakls:string);
begin
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 try
 with fmOtchets do
  begin
   fmOtchets.quRashod3.Close;
   quRashod3.SQL.Clear;
   quRashod3.SQL.Add(' select Sum(Kol) Kol,Tovar.NameTovar,Company.NameCompany,Tovar.EdIzm,VidTov.VidName, BarCode ');
   quRashod3.SQL.Add(' ,round(sum(weight/1000),2) as weight');
   quRashod3.SQL.Add(' ,round(sum(kol/kolperpak),0,1) as KolPak');
   quRashod3.SQL.Add(' ,sum(kol)-round(sum(kol/kolperpak),0,1)*KolperPak as KolOstPak');
   quRashod3.SQL.Add(' ,isnull(dog.DeliveryGoodsName,'''') as DeliveryGoodsName ');
   quRashod3.SQL.Add(' from Rashod,Tovar join VidTov on (VidTov.VidNo=Tovar.VidNo) left outer join Company on (Company.CompanyNo=Tovar.CompanyNo)');
   quRashod3.SQL.Add(' left join TovarFromDeliveryOfGoods tfdog on tfdog.TovarNo = Tovar.TovarNo ');
   quRashod3.SQL.Add(' left join DeliveryOfGoods dog on dog.DeliveryTovarNo = tfdog.DeliveryTovarNo and dog.Visible = 0 ');
   quRashod3.SQL.Add(' where Tovar.TovarNo=Rashod.TovarNo');
   quRashod3.SQL.Add(' and  NaklNo In ' + Nakls );
   quRashod3.SQL.Add(' group by VidName,NameCompany,NameTovar,EdIzm,kolperpak,Barcode,dog.DeliveryGoodsName');
   quRashod3.SQL.Add(' order by VidName,NameCompany,NameTovar');
   quRashod3.Open;
   frReport7.LoadFromFile('NaklTreb.frf');

//   frReport7.DesignReport;

   frReport7.ShowReport;
  end;
 finally
 Screen.Cursor:=crDefault;
 fmOtchets.Free;
 end;
end;

procedure LoadCarNaklTrebIM(Nakls:string);
begin
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 try
 with fmOtchets do
  begin
   fmOtchets.quRashod3.Close;
   quRashod3.SQL.Clear;
   quRashod3.SQL.Add(' select Sum(Kol) Kol,Tovar.NameTovar,Company.NameCompany,Tovar.EdIzm,VidTov.VidName, BarCode ');
   quRashod3.SQL.Add(' ,round(sum(weight/1000),2) as weight');
   quRashod3.SQL.Add(' ,round(sum(kol/kolperpak),0,1) as KolPak');
   quRashod3.SQL.Add(' ,sum(kol)-round(sum(kol/kolperpak),0,1)*KolperPak as KolOstPak');
   quRashod3.SQL.Add(' ,isnull(dog.DeliveryGoodsName,'''') as DeliveryGoodsName ');
   quRashod3.SQL.Add(' ,isnull(pfv.PriceVeb,0) as PriceVeb');
   quRashod3.SQL.Add(' from Rashod,Tovar join VidTov on (VidTov.VidNo=Tovar.VidNo) left outer join Company on (Company.CompanyNo=Tovar.CompanyNo)');
   quRashod3.SQL.Add(' left join TovarFromDeliveryOfGoods tfdog on tfdog.TovarNo = Tovar.TovarNo ');
   quRashod3.SQL.Add(' left join DeliveryOfGoods dog on dog.DeliveryTovarNo = tfdog.DeliveryTovarNo and dog.Visible = 0 ');
   quRashod3.SQL.Add(' left join PriceForVeb pfv on pfv.TovarNo = Tovar.TovarNo');
   quRashod3.SQL.Add(' where Tovar.TovarNo=Rashod.TovarNo');
   quRashod3.SQL.Add(' and  NaklNo In ' + Nakls );
   quRashod3.SQL.Add(' group by VidName,NameCompany,NameTovar,EdIzm,kolperpak,Barcode,dog.DeliveryGoodsName,pfv.PriceVeb');
   quRashod3.SQL.Add(' order by VidName,NameCompany,NameTovar');
   quRashod3.Open;
   frReport7.LoadFromFile('NaklTrebIM.frf');

//   frReport7.DesignReport;

   frReport7.ShowReport;
  end;
 finally
 Screen.Cursor:=crDefault;
 fmOtchets.Free;
 end;
end;

procedure LoadCarNaklTrebPostIM(Nakls:string);
var
  SqlText : string;
begin
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 try
 with fmOtchets do
  begin
   fmOtchets.quRashod3.Close;
   SqlText := 'select  Sum(Kol) Kol '+
              '      , t.NameTovar '+
              '  	   , Company.NameCompany '+
              '	     , t.EdIzm '+
              '	     , VidTov.VidName '+
              '	     , BarCode '+
              '      , round(sum(t.weight/1000),2) as weight '+
              '      , round(sum(kol/t.KolPerPak),0,1) as KolPak '+
              '      , sum(kol)-round(sum(kol/t.KolPerPak),0,1)*t.KolPerPak as KolOstPak '+
              '      , isnull(dog.DeliveryGoodsName,'''') as DeliveryGoodsName '+
              '      , isnull(pfv.PriceVeb,0) as PriceVeb '+
              '	     , (select Name from Post where PostNo = nr.PostNo) as PostName '+
              ' from  Rashod r  left join '+
              '       Tovar t on t.TovarNo = r.TovarNo  left join '+
              '	      VidTov on (VidTov.VidNo=t.VidNo) left outer join Company on (Company.CompanyNo=t.CompanyNo) left join '+
              '  	    TovarFromDeliveryOfGoods tfdog on tfdog.TovarNo = t.TovarNo left join '+
              '	      DeliveryOfGoods dog on dog.DeliveryTovarNo = tfdog.DeliveryTovarNo and dog.Visible = 0 left join '+
              '	      PriceForVeb pfv on pfv.TovarNo = t.TovarNo left join '+
              '	      NaklR nr on nr.NaklNo = r.NaklNo '+
              '  where r.NaklNo In ' +  Nakls +
              'group by VidName,NameCompany,NameTovar,EdIzm,t.kolperpak,Barcode,dog.DeliveryGoodsName,pfv.PriceVeb,nr.PostNo '+
              'order by VidName,NameCompany,NameTovar ';


   quRashod3.SQL.Clear;
   quRashod3.SQL.Add(SqlText);
   quRashod3.Open;
   frReport7.LoadFromFile('NaklTrebPostIM.frf');

//   frReport7.DesignReport;

   frReport7.ShowReport;
  end;
 finally
 Screen.Cursor:=crDefault;
 fmOtchets.Free;
 end;
end;

procedure TfmOtchets.frReport7GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if ParName='FirmName' then
  begin
   dmDataModule.quPost.Close;
   dmDataModule.quPost.ParamByName('PostNo').AsInteger:=dmDataModule.FirmNo;
   dmDataModule.quPost.Open;
   ParValue:=dmDataModule.quPost.FieldByName('NameLong').AsString;
   dmDataModule.quPost.Close;
  end;
end;

procedure TfmOtchets.frReport8GetValue(const ParName: String;
  var ParValue: Variant);
var
 i: integer;
 SummCol: Extended;
begin
 if ParName='RepTitle' then
  ParValue:=RepTitle;

 if ParName='Cell' then
  begin
   if Coln<>0 then
   begin
   if mdSaleSotrudTipTovar.Fields[Coln].AsFloat<>0 then
    begin
     ParValue:=format('%.2n',[mdSaleSotrudTipTovar.Fields[Coln].AsFloat]);
     SummCol:=SummCol+mdSaleSotrudTipTovar.Fields[Coln].AsFloat;
    end
   else
    ParValue:='';
   end
   else ParValue:='';
  end;

 if ParName='CellHead' then
  begin
   ParValue:='';
   ParValue:=mdSaleSotrudTipTovar.Fields[Coln].FieldName;
   SummCol:=0;
  end;

  if ParName='SummaRow' then
  begin
   ParValue:=0.00;
   for i:=1 to mdSaleSotrudTipTovar.FieldCount-1 do
    begin
     ParValue:=ParValue+mdSaleSotrudTipTovar.Fields[i].AsFloat;
    end;
  end;

 if ParName='Summa' then
  begin
   quSaleSotrudSumm.Locate('SotrudName',mdSaleSotrudTipTovar.Fields[Coln].FieldName,[]);
   ParValue:=quSaleSotrudSummSumma.AsFloat;
  end;
 if ParName='SummaDolg' then
  begin
   quSaleSotrudSumm.Locate('SotrudName',mdSaleSotrudTipTovar.Fields[Coln].FieldName,[]);
   ParValue:=quSaleSotrudSummSummaDolg.AsFloat;
  end;
 if ParName='SummaPercent' then
  begin
   quSaleSotrudSumm.Locate('SotrudName',mdSaleSotrudTipTovar.Fields[Coln].FieldName,[]);
   ParValue:=quSaleSotrudSummSummaPercent.AsFloat;
  end;


 if ParName='SummaAll' then
  begin
   ParValue:=FloatToStr(DBSumList1.SumCollection.Items[0].SumValue);
  end;
 if ParName='SummaDolgAll' then
  begin
   ParValue:=FloatToStr(DBSumList1.SumCollection.Items[1].SumValue);
  end;
 if ParName='SummaPercentAll' then
  begin
   ParValue:=FloatToStr(DBSumList1.SumCollection.Items[1].SumValue/(DBSumList1.SumCollection.Items[0].SumValue/100));
  end;

end;

procedure TfmOtchets.frUserDataset4CheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
 EOF:=(mdSaleSotrudTipTovar.FieldCount=Coln);
end;

procedure TfmOtchets.frUserDataset4First(Sender: TObject);
begin
 Coln:=1;
end;

procedure TfmOtchets.frUserDataset4Next(Sender: TObject);
begin
 Inc(Coln);
end;

procedure TfmOtchets.frReport9GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if ParName='ReportTitle' then
  ParValue:=ReportTitle;
end;

procedure TfmOtchets.frUDLoadCarCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
 EOF:=(mdLoadCar.FieldCount=Coln);
end;

procedure TfmOtchets.frUDLoadCarFirst(Sender: TObject);
begin
 Coln:=7;
end;

procedure TfmOtchets.frUDLoadCarNext(Sender: TObject);
begin
 Inc(Coln);
end;

procedure TfmOtchets.frReport12GetValue(const ParName: String; var ParValue: Variant);
var
 PostNoStr, AddressNoStr: String;
begin

 frVariables['RospCol'] := mdLoadCar.FieldCount-7;

 if ParName='NotLoad' then
  if LoadCarPostNoCar<>'' then
   //ParValue:='Без загрузки '+LoadCarPostNoCar
   ParValue:=LoadCarPostNoCar
  else
   ParValue:='';

 if ParName='DateReport' then
  ParValue:=LoadCarDateBegin;

 if ParName='Car' then
  ParValue:=LoadCarCar;


 if ParName='Expedition' then
  ParValue:=LoadCarExpedition;

  if ParName='Nakls' then
   begin
    ParValue:='';
    quLoadNakl.MacroByName('Nakl').Value:=LoadCarNakls;
    quLoadNakl.Open;
    while not quLoadNakl.EOF do
     begin
      ParValue:=ParValue+quLoadNakl.FieldByName('Nom').AsString+', ';
      quLoadNakl.Next;
     end;
    ParValue:=Copy(ParValue,1,Length(ParValue)-2)+';';
    quLoadNakl.Close;
   end;

  if ParName='PostName' then
   begin
    if Pos('_', mdLoadCar.Fields[Coln].FieldName) > 0 then
     begin
      PostNoStr:=Copy(mdLoadCar.Fields[Coln].FieldName,0,Pos('_', mdLoadCar.Fields[Coln].FieldName)-1);
      AddressNoStr:=Copy(mdLoadCar.Fields[Coln].FieldName,Pos('_', mdLoadCar.Fields[Coln].FieldName)+1,Length(mdLoadCar.Fields[Coln].FieldName));
      if Coln<>0 then
       begin
        quLoadCarPost.Locate('PostNo;AddressNo', VarArrayOf([ PostNoStr, AddressNoStr]), []);
        ParValue:=quLoadCarPostName.AsString;
       end;
     end;
   end;


  if ParName='Cell' then
  begin
   if Coln<>0 then
   begin
   if mdLoadCar.Fields[Coln].AsFloat<>0 then
    begin
     ParValue:=format('%.2n',[mdLoadCar.Fields[Coln].AsFloat]);
     SummCol:=SummCol+mdLoadCar.Fields[Coln].AsFloat;
    end
   else
    ParValue:='';
   end
   else ParValue:='';
  end;

  if ParName='KolPerPakAll' then ParValue:=round(LoadCarKolPak);
  if ParName='WeightAll' then  ParValue:=format('%.2n',[LoadCarWeigth/1000]);
  if ParName='SummaAll' then ParValue:=format('%.2n',[LoadCarSumm]);

{ if ParName='Cell' then
  begin
   if Coln<>0 then
   begin
   if mdSaleSotrudTipTovar.Fields[Coln].AsFloat<>0 then
    begin
     ParValue:=format('%.2n',[mdSaleSotrudTipTovar.Fields[Coln].AsFloat]);
     SummCol:=SummCol+mdSaleSotrudTipTovar.Fields[Coln].AsFloat;
    end
   else
    ParValue:='';
   end
   else ParValue:='';
  end;

 if ParName='CellHead' then
  begin
   ParValue:='';
   ParValue:=mdSaleSotrudTipTovar.Fields[Coln].FieldName;
   SummCol:=0;
  end;

  if ParName='SummaRow' then
  begin
   ParValue:=0.00;
   for i:=1 to mdSaleSotrudTipTovar.FieldCount-1 do
    begin
     ParValue:=ParValue+mdSaleSotrudTipTovar.Fields[i].AsFloat;
    end;
  end;

 if ParName='Summa' then
  begin
   quSaleSotrudSumm.Locate('SotrudName',mdSaleSotrudTipTovar.Fields[Coln].FieldName,[]);
   ParValue:=quSaleSotrudSummSumma.AsFloat;
  end;
 if ParName='SummaDolg' then
  begin
   quSaleSotrudSumm.Locate('SotrudName',mdSaleSotrudTipTovar.Fields[Coln].FieldName,[]);
   ParValue:=quSaleSotrudSummSummaDolg.AsFloat;
  end;
 if ParName='SummaPercent' then
  begin
   quSaleSotrudSumm.Locate('SotrudName',mdSaleSotrudTipTovar.Fields[Coln].FieldName,[]);
   ParValue:=quSaleSotrudSummSummaPercent.AsFloat;
  end;


 if ParName='SummaAll' then
  begin
   ParValue:=FloatToStr(DBSumList1.SumCollection.Items[0].SumValue);
  end;
 if ParName='SummaDolgAll' then
  begin
   ParValue:=FloatToStr(DBSumList1.SumCollection.Items[1].SumValue);
  end;
 if ParName='SummaPercentAll' then
  begin
   ParValue:=FloatToStr(DBSumList1.SumCollection.Items[1].SumValue/(DBSumList1.SumCollection.Items[0].SumValue/100));
  end;}

end;

procedure TfmOtchets.frReportPrintNaklGetValue(const ParName: String;
  var ParValue: Variant);
begin
 if ParName='Nom' then
  ParValue:=quNaklRPrintNom.AsInteger;
 if ParName='Date' then
  ParValue:=quNaklRPrintDateNakl.AsDateTime;
 if ParName='Post' then
  ParValue:=quNaklRPrintNameLong.AsString;
 if ParName='Osnova' then
  ParValue:=Osnova;
 if ParName='Adress' then
  ParValue:=quNaklRPrintAddress.AsString;
 if ParName='Kolvo' then
  ParValue:=IntToStr(Trunc(quRashodPrintKolvoKolvo.AsFloat))+' ('+IntToStringUkr(Trunc(quRashodPrintKolvoKolvo.AsFloat))+')';
{
 if ParName='Summa' then
  ParValue:= IntToStringUkr(Trunc(quNaklRPrintSumma.AsFloat))+' , '+
  format('%.2d ',[Round(Frac(quNaklRPrintSumma.AsFloat)*100)]);
}
 if ParName='Summa' then
  ParValue:= UkrRecognizeAmount(quNaklRPrintSumma.AsFloat,'','');

 if ParName='WNDS' then
  ParValue:=quNaklRPrintSumma.AsFloat/1.2;
 if ParName='NDS' then
  ParValue:= quNaklRPrintSumma.AsFloat-quNaklRPrintSumma.AsFloat/1.2;
 if ParName='NDSNEW' then
  ParValue:= quNaklRPrintNDS.AsFloat;
 if ParName='NONDSNEW' then
  ParValue:= quNaklRPrintNoNDS.AsFloat;
 if ParName='SummaNDS' then
  ParValue:=quNaklRPrintSumma.AsFloat;
 if ParName='Social' then
  ParValue:='';
 if ParName='OurAdres' then
  ParValue:= quNaklRPrintOurAdres.AsString;
 if ParName = 'Storekeeper' then
  if fmEditPost.qu_StorekeeperCheck1.Value = True then
   ParValue:= fmEditPost.qu_StorekeeperStorekeeper.AsString
    else ParValue:= '                   ';

 if ParName='Height' then
  begin
   if ColRow=0 then ParValue:=118
   else
    ParValue:=quRashodPrint.RecordCount*13;
  end;

end;

procedure TfmOtchets.quMasterCalcFields(DataSet: TDataSet);
var
 i:integer;
begin
 i:=Trunc(Date()-quMasterDateNakl.AsFloat);
 if i>0 then
  quMasterPSrok.AsInteger:=i
 else
  quMasterPSrok.AsInteger:=0;
end;

procedure TfmOtchets.frUDLoadCarPCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
 EOF:=(mdLoadCar.FieldCount=Coln);
end;

procedure TfmOtchets.frUDLoadCarPFirst(Sender: TObject);
begin
 Coln:=6;
end;

procedure TfmOtchets.frUDLoadCarPNext(Sender: TObject);
begin
 Inc(Coln);
end;

procedure TfmOtchets.frReport13GetValue(const ParName: String;
  var ParValue: Variant);
var
 PostNoStr, AddressNoStr: String;
begin
 frVariables['RospCol'] := mdLoadCar.FieldCount-6;

 if ParName='DateReport' then
  ParValue:='('+DateToStr(CarDateBegin)+' - '+DateToStr(CarDateEnd)+')';


  if ParName='Nakls' then
   begin
    ParValue:='';
    quLoadNaklP.MacroByName('Nakl').Value:=LoadCarNakls;
    quLoadNaklP.Open;
    while not quLoadNaklP.EOF do
     begin
      ParValue:=ParValue+quLoadNaklP.FieldByName('Nom').AsString+', ';
      quLoadNaklP.Next;
     end;
    ParValue:=Copy(ParValue,1,Length(ParValue)-2)+';';
    quLoadNaklP.Close;
   end;

  if ParName='PostName' then
   begin
    if Coln<>0 then
     begin
      quLoadCarPostP.Locate('PostNo', mdLoadCar.Fields[Coln].FieldName, []);
      ParValue:=quLoadCarPostPName.AsString;
     end;
   end;


  if ParName='Cell' then
  begin
   if Coln<>0 then
   begin
   if mdLoadCar.Fields[Coln].AsFloat<>0 then
    begin
     ParValue:=format('%.2n',[mdLoadCar.Fields[Coln].AsFloat]);
     SummCol:=SummCol+mdLoadCar.Fields[Coln].AsFloat;
    end
   else
    ParValue:='';
   end
   else ParValue:='';
  end;

  if ParName='KolPerPakAll' then ParValue:=round(LoadCarKolPak);
//  if ParName='WeightAll' then  ParValue:=format('%.2n',[LoadCarWeigth/1000]);
  if ParName='SummaAll' then ParValue:=format('%.2n',[LoadCarSumm]);
end;

procedure TfmOtchets.frReportPrintNaklTransportGetValue(
  const ParName: String; var ParValue: Variant);
var
 StrWeghtKgStr,s,KolPak: String;

begin


 if ParName='Nom' then
  ParValue:=quNaklRPrintNom.AsInteger;
 if ParName='Date' then
  ParValue:=quNaklRPrintDateNakl.AsDateTime;
 if ParName='Post' then
  ParValue:=quNaklRPrintNameLong.AsString;
 if ParName='OurFirmName' then
  ParValue:=quNaklRPrintOurFirmName.AsString;
 if ParName='Osnova' then
  ParValue:=Osnova;
 if ParName='Adress' then
  ParValue:=quNaklRPrintAddress.AsString;
 if ParName='KolvoTTN' then
  ParValue:= IntToStr(Abs(Trunc(quRashodPrintKolvoKolvo.AsFloat)))+' ('+IntToStringUkr(Abs(Trunc(quRashodPrintKolvoKolvo.AsFloat)))+')';
 if ParName='KolvoTTNStr' then
  ParValue:= IntToStringUkr(Abs(Trunc(quRashodPrintKolvoKolvo.AsFloat)));
 if ParName='SummaTTN' then
  ParValue:= IntToStringUkr(abs(Trunc(quNaklRPrintSumma.AsFloat)))+' грн. '+
  format('%.2d коп.',[Round(Frac(abs(quNaklRPrintSumma.AsFloat))*100)]);
 if ParName='WNDSTTN' then
  ParValue:=abs(quNaklRPrintSumma.AsFloat/1.2);
 if ParName='NDSTTN' then
  ParValue:=abs(quNaklRPrintSumma.AsFloat-quNaklRPrintSumma.AsFloat/1.2);
 if ParName='NDSTTNStr' then
  ParValue:= IntToStringUkr(abs(Trunc(quNaklRPrintSumma.AsFloat-quNaklRPrintSumma.AsFloat/1.2)))+' грн. '+
  format('%.2d коп.',[Round(Frac(abs(quNaklRPrintSumma.AsFloat-quNaklRPrintSumma.AsFloat/1.2))*100)]) ;
 if ParName='SummaNDSTTN' then
  ParValue:=abs(quNaklRPrintSumma.AsFloat);
 if ParName='CarsOKPO' then
  ParValue:=quNaklRPrintCarsOKPO.AsString;
 if ParName='OKPO' then
  ParValue:=quNaklRPrintOKPO.AsString;
 if ParName='OurOKPO' then
  ParValue:= quNaklRPrintOurOKPO.AsString;
 if ParName='OurAdres' then
  ParValue:= quNaklRPrintOurAdres.AsString;
 if ParName='OKPO4' then
  ParValue:=quNaklRPrintOKPO.AsString;

 if ParName='Car' then
  if fmEditPost.quTTN_RecordCheck1.Value = True then
   ParValue:= fmEditPost.quTTN_RecordCars.AsString
  else ParValue:= quNaklRPrintCarsName.AsString;

  if ParName='Driver' then
   if fmEditPost.quTTN_RecordCheck1.Value  = True then
    ParValue:= fmEditPost.quTTN_RecordDriver.AsString
   else ParValue:= quNaklRPrintCarsDriver.AsString;

 if ParName='Perevoz' then
  ParValue:=quNaklRPrintCarsFirma.AsString;
 if ParName='KolPak' then
  if quRashodPrintKolPerPak.AsFloat>=1 then
   begin
    KolTovar:=KolTovar+abs(quRashodPrintKol.AsInteger);
    WidthTovar:=WidthTovar+(abs(quRashodPrintWeight.AsFloat));
    WidthTovar1:=WidthTovar1+(abs(quRashodPrintWeight.AsFloat));
    KolPak:=IntToStr((abs(quRashodPrintKol.AsInteger)) div (abs(quRashodPrintKolPerPak.AsInteger)));
    if ((abs(quRashodPrintKol.AsInteger)) mod abs(quRashodPrintKolPerPak.AsInteger))>0 then
    KolPak:=KolPak+'+('+IntToStr((abs(quRashodPrintKol.AsInteger)) mod abs(quRashodPrintKolPerPak.AsInteger))+')';
    ParValue:=KolPak;
   end
  else
   ParValue:='';

 if ParName='Width' then
  begin
   ParValue:=WidthTovar;
   WidthTovar:=0;
  end;
 if ParName='WidthStr' then
  begin
   ParValue:= IntToStringUkr(abs(Trunc(WidthTovar)))+' кг. '+
   format('%.3d гр.',[Round(Frac(abs(WidthTovar))*1000)]);
   WidthTovar:=0;
  end;
 if ParName='WidthStr1' then
  begin
   ParValue:= IntToStringUkr(abs(Trunc(quNaklRPrintWeight.AsFloat)))+' кг. '+
   format('%.3d гр.',[Round(Frac(abs(quNaklRPrintWeight.AsFloat))*1000)]);
   WidthTovar1 := 0;
  end;
  if ParName='WidthStrTons' then
  begin

   StrWeghtKgStr := format('%.3d кг.',[Round(Frac(abs(quNaklRPrintWeight.AsFloat*0.001))*1000)]);

   StrWeghtKgStr := copy(StrWeghtKgStr,pos(',',StrWeghtKgStr)+1,3);

   ParValue:= IntToStringUkrKg(abs(Trunc(quNaklRPrintWeight.AsFloat*0.001)))+' т. '+
              IntToStringUkrKg(StrToInt(StrWeghtKgStr))+' кг.';
  end;
 if ParName='Kolvo' then
  begin
   ParValue:=KolTovar;
   KolTovar:=0;
  end;

 if ParName='Height' then
  begin
   if ColRow=0 then ParValue:=118
   else
    ParValue:=quRashodPrint.RecordCount*13;
  end;
 end;

procedure TfmOtchets.frReportSotrudDolgNewGetValue(const ParName: String;
  var ParValue: Variant);
begin
 if ParName='Vid' then
  if quSotrudDolgNewVIP.AsBoolean then
   ParValue:='VIP клиенты'
  else
   ParValue:='Розничные клиенты';
end;

procedure TfmOtchets.quSotrudDolgNewCalcFields(DataSet: TDataSet);
var
 i:integer;
begin
 i:=Trunc(Date()-quSotrudDolgNewDateNakl.AsFloat);
 if i>0 then
  quSotrudDolgNewPSrok.AsInteger:=i
 else
  quSotrudDolgNewPSrok.AsInteger:=0;
end;

procedure TfmOtchets.frReportZPSotrudPlatGetValue(const ParName: String;
  var ParValue: Variant);
{var
 SummaZP, Percent:double;}
begin
 if ParName='RepTitle' then
  begin
   ParValue:=ReportTitle;
   Summa1:=0;
  end;
 if ParName='%ZP' then
  begin
   spCountPercentZPForNakl.Close;
   spCountPercentZPForNakl.ParamByName('NaklNo').AsInteger:=spZPSotrudPlatNaklNo.AsInteger;
   spCountPercentZPForNakl.Open;
   ParValue:=spCountPercentZPForNaklPercentSalary.AsFloat;
   spCountPercentZPForNakl.Close;
  end;
 if ParName='SummaZP' then
  begin
   spCountPercentZPForNakl.Close;
   spCountPercentZPForNakl.ParamByName('NaklNo').AsInteger:=spZPSotrudPlatNaklNo.AsInteger;
   spCountPercentZPForNakl.Open;
   ParValue:=((spCountPercentZPForNaklPercentSalary.AsFloat/100)*spZPSotrudPlatSummaToNakl.AsFloat)/100*spZPSotrudPlatValuePercent2.AsFloat;
   Summa1:=Summa1+((spCountPercentZPForNaklPercentSalary.AsFloat/100)*spZPSotrudPlatSummaToNakl.AsFloat)/100*spZPSotrudPlatValuePercent2.AsFloat;
//   ParValue:=(spCountPercentZPForNaklPercentSalary.AsFloat/100)*spZPSotrudPlatSummaToNakl.AsFloat;
//   Summa1:=Summa1+(spCountPercentZPForNaklPercentSalary.AsFloat/100)*spZPSotrudPlatSummaToNakl.AsFloat;
//   Summa2:=Summa2+Summa1;
   spCountPercentZPForNakl.Close;
  end;
 if ParName='Tip' then
  if spZPSotrudPlatVip.AsBoolean then
   ParValue:='VIP клиенты'
  else
   ParValue:='Розничные клиенты';
 if ParName='NameTip' then
  if spZPSotrudPlatVip.AsBoolean then
   ParValue:='Итого по VIP клиентам:'
  else
   ParValue:='Итого по розничным клиентам:';
 if ParName='Summa1' then
  begin
   spCountPercentZPForNakl.Close;
   spCountPercentZPForNakl.ParamByName('NaklNo').AsInteger:=spZPSotrudPlatNaklNo.AsInteger;
   spCountPercentZPForNakl.Open;
//   ParValue:=Summa1*(spZPSotrudPlatValuePercent2.AsFloat/100);
   ParValue:=Summa1;
//   Summa2:=Summa2+Summa1*(spZPSotrudPlatValuePercent2.AsFloat/100);
   Summa2:=Summa2+Summa1;
   Summa1:=0;
   spCountPercentZPForNakl.Close;
  end;
 if ParName='Summa2' then
  begin
   ParValue:=Summa2;
   Summa3:=Summa3+Summa2;
   Summa2:=0;
  end;
 if ParName='Summa3' then
  begin
   ParValue:=Summa3;
   Summa3:=0;
  end;


end;

procedure PrintNaklDesign(NaklNo:integer; Dlg, Preview, Buh, Print3: Boolean);
//Buh=False Без шапки
//Buh=True С шапкой
begin
 Screen.Cursor:=crHourGlass;
 fmOtchets:=TfmOtchets.Create(Application);
 fmGetSpravka2:=TfmGetSpravka2.Create(Application);
 try
 with fmOtchets do
  begin
   quNaklRPrint.ParamByName('NaklNo').AsInteger:=NaklNo;
   quNaklRPrint.Open;
   quRashodPrint.ParamByName('NaklNo').AsInteger:=NaklNo;
   quRashodPrint.Open;
   quRashodPrintKolvo.ParamByName('NaklNo').AsInteger:=NaklNo;
   quRashodPrintKolvo.Open;
   Osnova:=format('Договор купли-продажи № %s от %s ',
                       [quNaklRPrintDogovorNo.AsString,
                        quNaklRPrintDateDogovor.AsString]);
   if Buh then
    begin
     if quRashodPrint.RecordCount>23 then
      begin
       ColRow:=0;
       frReportPrintNakl.LoadFromFile('NaklR_1_1.frf');
       if Preview then
        frReportPrintNakl.DesignReport
       else
        begin
         frReportPrintNakl.PrepareReport;
         if Print3 then
          frReportPrintNakl.DesignReport
         else
//          frReportPrintNakl.DesignReport;
        end;
      end
     else
      begin
       ColRow:=23;
       frReportPrintNakl.LoadFromFile('NaklR_1_2.frf');
       if Preview then
        frReportPrintNakl.DesignReport
       else
        begin
         frReportPrintNakl.PrepareReport;
//         frReportPrintNakl.DesignReport;
        end;
       if Print3 then
        begin
         frReportPrintNakl.LoadFromFile('NaklR_1_1.frf');
         if Preview then
          frReportPrintNakl.DesignReport
         else
          begin
           frReportPrintNakl.PrepareReport;
//           frReportPrintNakl.DesignReport;
          end;
        end;

      end;
    end
   else
    begin
     if quRashodPrint.RecordCount>26 then
      begin
       ColRow:=0;
       frReportPrintNakl.LoadFromFile('NaklR_1_1.frf');
       if Preview then
        frReportPrintNakl.DesignReport
       else
        begin
         frReportPrintNakl.PrepareReport;
//         frReportPrintNakl.DesignReport;
        end;
       frReportPrintNakl.LoadFromFile('NaklR_2_1.frf');
       if Preview then
        frReportPrintNakl.DesignReport
       else
        begin
         frReportPrintNakl.PrepareReport;
//         frReportPrintNakl.DesignReport;
        end;
      end
     else
      begin
       ColRow:=26;
       frReportPrintNakl.LoadFromFile('NaklR_2_2.frf');
       if Preview then
        frReportPrintNakl.DesignReport
       else
        begin
         frReportPrintNakl.PrepareReport;
//         frReportPrintNakl.DesignReport;
        end;
      end;
    end;

  end;
  finally
 fmOtchets.quNaklRPrint.Close;
 fmOtchets.quRashodPrint.Close;
 fmOtchets.quRashodPrintKolvo.Close;
 fmOtchets.Free;
 fmGetSpravka2.Free;
 Screen.Cursor:=crDefault;
 end;
end;


function IntToStringUkrKg(Value: LongInt): string;
var
  dig: array[1..6] of integer;
  i: integer;
  t: string;
begin
  Result := '';
  if Value = 0 then Result := 'ноль';
  t := 'тисяч ';
  if Value > 999999 then
  begin
    Result := '******';
    exit;
  end;
  for i := 1 to 6 do
  begin
    dig[i] := Value mod 10;
    Value := Value div 10;
  end;
  case dig[6] of
    1: Result := Result + 'сто ';
    2: Result := Result + 'двісті ';
    3: Result := Result + 'триста ';
    4: Result := Result + 'чотириста ';
    5: Result := Result + 'п`ятсот ';
    6: Result := Result + 'шістьсот ';
    7: Result := Result + 'сімсот ';
    8: Result := Result + 'вісімсот ';
    9: Result := Result + 'дев`ятсот ';
  end;
  case dig[5] of
    1:
      begin
        case dig[4] of
          0: Result := Result + 'десять ';
          1: Result := Result + 'одинадцять ';
          2: Result := Result + 'дванадцять ';
          3: Result := Result + 'тринадцять ';
          4: Result := Result + 'чотирнадцять ';
          5: Result := Result + 'п`ятнадцять ';
          6: Result := Result + 'шістнадцять ';
          7: Result := Result + 'сімнадцять ';
          8: Result := Result + 'вісімнадцять ';
          9: Result := Result + 'дев`ятнадцять ';
        end;
      end;
    2: Result := Result + 'двадцять ';
    3: Result := Result + 'тридцять ';
    4: Result := Result + 'сорок ';
    5: Result := Result + 'п`ятдесят ';
    6: Result := Result + 'шістьдесят ';
    7: Result := Result + 'сімдесят ';
    8: Result := Result + 'вісімдесят ';
    9: Result := Result + 'дев`яносто ';
  end;
  if dig[5] <> 1 then
    case dig[4] of
      1:
        begin
          Result := Result + 'одна ';
          t := 'тисяча ';
        end;
      2:
        begin
          Result := Result + 'дві ';
          t := 'тисячі ';
        end;
      3:
        begin
          Result := Result + 'три ';
          t := 'тисячі ';
        end;
      4:
        begin
          Result := Result + 'чотири ';
          t := 'тисячі ';
        end;
      5: Result := Result + 'п`ять ';
      6: Result := Result + 'шість ';
      7: Result := Result + 'сім ';
      8: Result := Result + 'вісім ';
      9: Result := Result + 'дев`ять ';
    end;
  if dig[6] + dig[5] + dig[4] > 0 then Result := Result + t;
  //********************
  case dig[3] of
    1: Result := Result + 'сто ';
    2: Result := Result + 'двісті ';
    3: Result := Result + 'триста ';
    4: Result := Result + 'чотириста ';
    5: Result := Result + 'пя`тьсот ';
    6: Result := Result + 'шістьсот ';
    7: Result := Result + 'сімсот ';
    8: Result := Result + 'вісімсот ';
    9: Result := Result + 'дев`ятьсот ';
  end;
  case dig[2] of
    1:
      begin
        case dig[1] of
          0: Result := Result + 'десять ';
          1: Result := Result + 'одинадцять ';
          2: Result := Result + 'дванадцять ';
          3: Result := Result + 'тринадцять ';
          4: Result := Result + 'чотирнадцять ';
          5: Result := Result + 'п`ятнадцять ';
          6: Result := Result + 'шістнадцять ';
          7: Result := Result + 'сімнадцять ';
          8: Result := Result + 'вісімнадцять ';
          9: Result := Result + 'дев`ятнадцять ';
        end;
      end;
    2: Result := Result + 'двадцять ';
    3: Result := Result + 'тридцять ';
    4: Result := Result + 'сорок ';
    5: Result := Result + 'п`ятдесят ';
    6: Result := Result + 'шістдесят ';
    7: Result := Result + 'сімдесят ';
    8: Result := Result + 'вісімдесят ';
    9: Result := Result + 'дев`яносто ';
  end;
  if dig[2] <> 1 then
    case dig[1] of
      1: Result := Result + 'один ';
      2: Result := Result + 'два ';
      3: Result := Result + 'три ';
      4: Result := Result + 'чотири ';
      5: Result := Result + 'п`ять ';
      6: Result := Result + 'шість ';
      7: Result := Result + 'сім ';
      8: Result := Result + 'вісім ';
      9: Result := Result + 'дев`ять ';
    end;
  Result := AnsiUpperCase(Copy(Result, 1, 1)) + Copy(Result, 2, 255);
end;


function UkrRecognizeAmount(Amount: real;
  CurrName, CurrSubname: string): string;
{* CurrName in [грн.]

CurrSubName in [коп.]
Распознается число <= 999 999 999 999.99*}
const
  suffBL: string = ' ';

  suffDCT: string = 'дцять';
  suffNA: string = 'надцять ';
  suffDCM: string = 'десят';
  suffMZ: string = 'ь';
  sot: string = 'сот';
  st: string = 'ст';
  aa: string = 'а';
  ee: string = 'и'; {e}
  ii: string = 'i'; {и}
  oo: string = 'о';
  ov: string = 'ов'; {ов}
  C2: string = 'дв';
  C3: string = 'тpи';
  C4: string = 'чотир';
  C5: string = 'п''ят';
  C6: string = 'шiст';
  C7: string = 'сiм';
  C8: string = 'вiсiм';
  C9: string = 'дев''ят';
var

  i: byte;
  sAmount, sdInt, sdDec: string;
  IsMln, IsTha {,IsDcm}, IsRange1019: boolean;
  currNum, endMlx, sResult: string;
begin

  if (amount <= 0) or (amount > 999999999999.99) then
  begin
    Result := '<<<< Ошибка в диапазоне >>>>';
    Exit;
  end;
  STR(Amount: 16: 2, sAmount);
  sdInt := Copy(sAmount, 1, 13);
  sdDec := Copy(sAmount, 15, 2);
  IsMln := false;
  //IsDcm:=false;
  IsTha := false;
  IsRange1019 := false;
  sResult := '';

  for i := 1 to 13 do
  begin
    currNum := Copy(sdInt, i, 1);

    if currNum <> suffBL then
    begin
      case i of
        5, 6, 7: if currNum <> '0' then
            IsMln := true;
        8, 9, 10: if currNum <> '0' then
            IsTha := true;
      end;

      if i in [2, 5, 8, 11] then {сотни}
      begin
        if currNum = '1' then
          sResult := sResult + st + oo + suffBL;
        if currNum = '2' then
          sResult := sResult + C2 + ii + st + ii + suffBL;
        if currNum = '3' then
          sResult := sResult + C3 + st + aa + suffBL;
        if currNum = '4' then
          sResult := sResult + C4 + ee + st + aa + suffBL;
        if currNum = '5' then
          sResult := sResult + C5 + sot + suffBL;
        if currNum = '6' then
          sResult := sResult + C6 + sot + suffBL;
        if currNum = '7' then
          sResult := sResult + C7 + sot + suffBL;
        if currNum = '8' then
          sResult := sResult + C8 + sot + suffBL;
        if currNum = '9' then
          sResult := sResult + C9 + sot + suffBL;
      end;
      if i in [3, 6, 9, 12] then {десятки}
      begin
        if currNum = '1' then
          IsRange1019 := true;
        if currNum = '2' then
          sResult := sResult + C2 + aa + suffDCT + suffBL;
        if currNum = '3' then
          sResult := sResult + C3 + suffDCT + suffBL;
        if currNum = '4' then
          sResult := sResult + 'соpок ';
        if currNum = '5' then
          sResult := sResult + C5 + suffMZ + suffDCM + suffBL;

        if currNum = '6' then
          sResult := sResult + C6 + suffMZ + suffDCM + suffBL;

        if currNum = '7' then
          sResult := sResult + C7 + suffMZ + suffDCM + suffBL;

        if currNum = '8' then
          sResult := sResult + C8 + suffMZ + suffDCM + suffBL;

        if currNum = '9' then
          sResult := sResult + 'дев''ян' + oo + st + oo + suffBL;

      end;
      if i in [4, 7, 10, 13] then {единицы}
      begin
        if (currNum = '0') then
          if IsRange1019 then
            sResult := sResult + suffDCM + suffMZ + suffBL;
        if (currNum = '1') then
        begin
          if (i = 13) and (not IsRange1019) then
            sResult := sResult + 'одна '
          else
          begin
            if (i = 10) and (IsRange1019) then
              sResult := sResult + 'один'
            else if (i = 10) and (not IsRange1019) then
              sResult := sResult + 'одна '
            else
              sResult := sResult + 'один' {ин};

            if IsRange1019 and (i = 13) then
              sResult := sResult + 'адцять' + suffBL

            else if IsRange1019 then
              sResult := sResult + suffNA
            else
              sResult := sResult + suffBL;
          end;
        end;
        if (currNum = '2') then
        begin
          sResult := sResult + C2;
          if (i = 10) and (IsRange1019 = False) then
            sResult := sResult + ii
          else if (i = 10) or (IsRange1019) then
            sResult := sResult + aa
          else
            sResult := sResult + {aa} ii;
          if IsRange1019 then
            sResult := sResult + suffNA
          else
            sResult := sResult + suffBL;
        end;
        if (currNum = '3') then
        begin
          sResult := sResult + C3;
          if IsRange1019 then
            sResult := sResult + suffNA
          else
            sResult := sResult + suffBL;
        end;
        if (currNum = '4') then
        begin
          sResult := sResult + C4;
          if IsRange1019 then
            sResult := sResult + suffNA
          else
            sResult := sResult + ee + suffBL;
        end;
        if (currNum = '5') then
        begin
          sResult := sResult + C5;
          if IsRange1019 then
            sResult := sResult + suffNA
          else
            sResult := sResult + suffMZ + suffBL;
        end;
        if (currNum = '6') then
        begin
          sResult := sResult + C6;
          if IsRange1019 then
            sResult := sResult + suffNA
          else
            sResult := sResult + suffMZ + suffBL;
        end;
        if (currNum = '7') then
        begin
          sResult := sResult + C7;
          if IsRange1019 then
            sResult := sResult + suffNA
          else
            sResult := sResult + suffBL;
        end;
        if (currNum = '8') then
        begin
          sResult := sResult + C8;
          if IsRange1019 then
            sResult := sResult + suffNA
          else
            sResult := sResult + suffBL;
        end;
        if (currNum = '9') then
        begin
          sResult := sResult + C9;
          if IsRange1019 then
            sResult := sResult + suffNA
          else
            sResult := sResult + suffMZ + suffBL;
        end;
      end;

      endMlx := '';
      case i of
        4:
          begin
            if IsRange1019 then
              endMlx := ov + suffBL
            else if currNum = '1' then
              endMlx := suffBL
            else if (currNum = '2') or (currNum = '3') or (currNum = '4') then
              endMlx := aa + suffBL
            else
              endMlx := ov + suffBL;
            sResult := sResult + 'мiльярд' + endMlx;
          end;
        7: if IsMln then
          begin
            if IsRange1019 then
              endMlx := ov + suffBL
            else if currNum = '1' then
              endMlx := suffBL
            else if (currNum = '2') or (currNum = '3') or (currNum = '4') then
              endMlx := aa + suffBL
            else
              endMlx := ov + suffBL;
            sResult := sResult + 'мiльйон' + endMlx;
          end;
        10: if IsTha then
          begin
            if IsRange1019 then
              endMlx := suffBL
            else if currNum = '1' then
              endMlx := aa + suffBL
            else if (currNum = '2') or (currNum = '3') or (currNum = '4') then
              endMlx := ii + suffBL
            else
              endMlx := suffBL;
            sResult := sResult + 'тисяч' + endMlx;
          end;
      end; {case}
      if i in [4, 7, 10, 13] then
        IsRange1019 := false;
    end; {IF}
  end; {FOR}

  sResult := sResult + CurrName + ',' + suffBL + sdDec + suffBL + CurrSubname;
  sResult := AnsiUpperCase(sResult[1]) + Copy(sResult, 2, length(sResult) - 1);
  Result := sResult;
end;


end.
