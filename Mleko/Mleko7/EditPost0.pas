unit EditPost0;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, MlekoForm, DBCtrls, DB, Mask, ExtCtrls, Buttons, Dialogs, ComCtrls,
  DBGridEh, ToolWin, DBCtrlsEh,
  RxToolEdit, DBAccess, MsAccess, ActnList, MemDS, GridsEh,
  citDBComboEdit, cxGraphics, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, BCFrame, BCContainer,
  MlkListPostArticleGroupDelayPay, MlkListPostArticleGroupPriceType,
  BCCxList, DBLookupEh;

type
  TfmEditPost = class(TMlekoForm)
    dsAddressPost: TDataSource;
    Panel1: TPanel;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    pgc: TPageControl;
    tsMain: TTabSheet;
    tsAdress: TTabSheet;
    CoolBar1: TCoolBar;
    tsContract: TTabSheet;
    DBGridEh1: TDBGridEh;
    qu_Contract: TMSQuery;
    ds_contract: TDataSource;
    qu_ContractType: TMSQuery;
    ds_ContractType: TDataSource;
    qu_Contractid: TAutoIncField;
    qu_ContractPostNo: TIntegerField;
    qu_ContractType_id: TIntegerField;
    qu_ContractDescription: TStringField;
    qu_ContractCreate_Date: TDateTimeField;
    qu_Contractnum: TStringField;
    qu_ContractTypeName: TStringField;
    qu_Prop: TMSQuery;
    ds_Prop: TDataSource;
    qu_PropName: TStringField;
    qu_Propis_prop: TBooleanField;
    spSetFirmProp: TMSStoredProc;
    ActionListCur: TActionList;
    ActionItemAdd: TAction;
    ActionItemProp: TAction;
    ActionItemDel: TAction;
    ActionViewRefresh: TAction;
    ActionViewLayout: TAction;
    ActionViewFilter: TAction;
    ActionViewFilterOff: TAction;
    ActionRowSelect: TAction;
    ActionDebugAll: TAction;
    ActionFind: TAction;
    ActionFindNext: TAction;
    ActionFindReverse: TAction;
    ActionShowContextValues: TAction;
    ActionDebugBuilder: TAction;
    ActionCopyProfile: TAction;
    ActionRestoreFormat: TAction;
    qu_Propid: TAutoIncField;
    Panel2: TPanel;
    Label4: TLabel;
    Splitter1: TSplitter;
    RxDBGrid1: TDBGridEh;
    ds_sotrud_address: TDataSource;
    Panel4: TPanel;
    DBGridEh3: TDBGridEh;
    ActionViewRefAddress: TAction;
    SpeedButton1: TSpeedButton;
    Panel5: TPanel;
    Label19: TLabel;
    qu_ContractExpire_Date: TDateTimeField;
    qu_Contractprint_on_nakl: TBooleanField;
    qu_PropPostNo: TIntegerField;
    qu_Contractprint_on_naklP: TBooleanField;
    qu_ContractOurFirmNo: TIntegerField;
    quOurFirm: TMSQuery;
    DsOurFirm: TDataSource;
    qu_ContractOurFirmName: TStringField;
    Panel6: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBText1: TDBText;
    Label1: TLabel;
    cbAccountCash: TDBCheckBox;
    cbExport1C: TDBCheckBox;
    cbNotPlatNDS: TDBCheckBox;
    cbPrint: TDBCheckBox;
    deAddressBank: TDBEdit;
    deCategorName: TDBEdit;
    deContact: TDBEdit;
    deDayDelay: TDBEdit;
    EditAddress: TDBEdit;
    EditCodeNds: TDBEdit;
    EditMFO: TDBEdit;
    EditName: TDBEdit;
    EditNameBank: TDBEdit;
    EditNameLong: TDBEdit;
    EditNoSvidNDS: TDBEdit;
    EditOKPO: TDBEdit;
    EditPhone: TDBEdit;
    EditRS: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    PanelBoolProp: TPanel;
    ToolBar: TToolBar;
    ToolBtnAdd: TToolButton;
    DBGridEh2: TDBGridEh;
    quAddressPost: TMSQuery;
    quAddressPostID: TIntegerField;
    quAddressPostPostNo: TSmallintField;
    quAddressPostAddressNo: TSmallintField;
    quAddressPostAddress: TStringField;
    quAddressPostRegionNo: TWordField;
    quAddressPostMarschrutNo: TSmallintField;
    quRegion: TMSQuery;
    quAddressPostRegionName: TStringField;
    Label14: TLabel;
    Tsotrud_address: TMSQuery;
    Tsotrud_addressid: TIntegerField;
    Tsotrud_addressAddressPost_id: TIntegerField;
    Tsotrud_addressSotrudNo: TIntegerField;
    Tsotrud_addressSotrudName: TStringField;
    Tsotrud_addressOtdelName: TStringField;
    quTrash: TMSQuery;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Label15: TLabel;
    dsTrash: TDataSource;
    tsDelayPay: TTabSheet;
    tsPriceType: TTabSheet;
    FrmDelayPay: TMlkListPostArticleGroupDelayPayFrame;
    FrmSetPriceType: TMlkListPostArticleGroupPriceTypeFrame;
    Use_Price: TDBComboBox;
    Label20: TLabel;
    Edit_Price: TDBComboBox;
    Label21: TLabel;
    TabSheet1: TTabSheet;
    DBCheckBox4: TDBCheckBox;
    Use_it: TDBCheckBox;
    Driver: TDBEdit;
    Cars: TDBEdit;
    AvtoLabel: TLabel;
    DriverLabel: TLabel;
    quTTN_Record: TMSQuery;
    dsTTN_Record: TDataSource;
    quTTN_RecordPostNo: TSmallintField;
    quTTN_RecordDriver: TStringField;
    quTTN_RecordCars: TStringField;
    quTTN_RecordCheck1: TBooleanField;
    quTTN_RecordID: TIntegerField;
    qu_Contractpkey: TLargeintField;
    Use_StoreKeeper: TDBCheckBox;
    StoreKeeper: TDBEdit;
    ds_Storekeeper: TDataSource;
    qu_Storekeeper: TMSQuery;
    qu_StorekeeperID: TIntegerField;
    qu_StorekeeperPostNo: TSmallintField;
    qu_StorekeeperStorekeeper: TStringField;
    qu_StorekeeperCheck1: TBooleanField;
    Use_Post_Ban: TDBCheckBox;
    ds_Post_Ban: TDataSource;
    BanDescription: TDBEdit;
    BanDescriptionLabel: TLabel;
    qu_Post_Ban: TMSQuery;
    qu_Post_Banid: TIntegerField;
    qu_Post_BanPostNo: TSmallintField;
    qu_Post_BanDescription: TStringField;
    qu_Post_BanCheck1: TBooleanField;
    MailGroupBox: TGroupBox;
    Mail1: TDBEdit;
    Mail2: TDBEdit;
    Mail3: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    qu_Post_Mail: TMSQuery;
    ds_Post_Mail: TDataSource;
    qu_Post_Mailid: TIntegerField;
    qu_Post_MailPostNo: TSmallintField;
    qu_Post_MailTopic: TStringField;
    qu_Post_MailMessage: TStringField;
    qu_Post_MailMail1: TStringField;
    qu_Post_MailMail2: TStringField;
    qu_Post_MailMail3: TStringField;
    Label25: TLabel;
    TopicMail: TDBEdit;
    Label26: TLabel;
    Message: TDBMemo;
    cbToMail: TCheckBox;
    qu_AddressPostForMail: TMSQuery;
    AddessPostForMail: TDBLookupComboboxEh;
    ds_AddressPostForMail: TDataSource;
    qu_Post_MailAddressNo: TSmallintField;
    qu_AddressPostForMailPostNo: TSmallintField;
    qu_AddressPostForMailAddressNo: TSmallintField;
    qu_AddressPostForMailAddress: TStringField;
    lb_AddressPostForMail: TLabel;
    quAddressPostMail1: TStringField;
    quAddressPostMail2: TStringField;
    quAddressPostMail3: TStringField;
    quAddressPostTopic: TStringField;
    quAddressPostMessage: TStringField;
    Label27: TLabel;
    dsPostBanPay: TDataSource;
    quPostBanPay: TMSQuery;
    Label28: TLabel;
    DBEditPostBanPay: TDBEdit;
    quPostBanPayid: TIntegerField;
    quPostBanPayid1: TLargeintField;
    quPostBanPayname: TStringField;
    quPostBanPaySET_ARTICLE_GROUP_ID_PayBan: TLargeintField;
    quPostBanPayPostNo_PayBan: TSmallintField;
    quPostBanPayPayBan: TIntegerField;
    Set_Article_Group: TDBLookupComboboxEh;
    quPostBanPayBuh: TLargeintField;
    quPostBanPayNameFull: TStringField;
    quPostBanPayid2: TLargeintField;
    DataSource1: TDataSource;
    Shipper: TDBEdit;
    Use_Shipper: TDBCheckBox;
    qu_Shipper: TMSQuery;
    ds_Shipper: TDataSource;
    quAddressPostCar: TStringField;
    quAddressPostDriver: TStringField;
    quAddressPostDateDeparture: TDateTimeField;
    quAddressPostCity: TStringField;
    quAddressPostStreet: TStringField;
    quAddressPostHouseNo: TStringField;
    ShipperOKPO: TDBEdit;
    Label29: TLabel;
    quAddressPostDegrees: TStringField;
    quAddressPostMminutes: TStringField;
    quAddressPostSeconds: TStringField;
    quAddressPostCoordinates: TBlobField;
    quAddressPostX: TStringField;
    quAddressPostY: TStringField;
    Use_Customer: TDBCheckBox;
    Customer: TDBEdit;
    CustomerOKPO: TDBEdit;
    Label30: TLabel;
    qu_Customer: TMSQuery;
    ds_Customer: TDataSource;
    qu_CustomerId: TIntegerField;
    qu_CustomerPostNo: TSmallintField;
    qu_CustomerCustomer: TStringField;
    qu_CustomerCustomerOKPO: TStringField;
    qu_CustomerCheck1: TBooleanField;
    qu_ShipperId: TIntegerField;
    qu_ShipperPostNo: TSmallintField;
    qu_ShipperShipper: TStringField;
    qu_ShipperShipperOKPO: TStringField;
    qu_ShipperCheck1: TBooleanField;
    quAddressPostCategoryName: TStringField;
    quAddressPostUnloading: TIntegerField;
    Use_Confidant: TDBCheckBox;
    Confidant: TDBEdit;
    Label31: TLabel;
    qu_Confidant: TMSQuery;
    ds_Confidant: TDataSource;
    qu_ConfidantID: TIntegerField;
    qu_ConfidantPostNo: TSmallintField;
    qu_ConfidantConfidant: TStringField;
    qu_ConfidantCheck1: TBooleanField;
    qu_ConfidantConfidantOKPO: TStringField;
    quAddressPostAddressPost: TStringField;
    quAddressPostAddressNoPost: TIntegerField;
    TabSheet2: TTabSheet;
    DescriptionDjob: TDBMemo;
    quDescriptionDjobSupplier: TMSQuery;
    dsDescriptionDjobSupplier: TMSDataSource;
    quDescriptionDjobSupplierId: TIntegerField;
    quDescriptionDjobSupplierPostNo: TSmallintField;
    quDescriptionDjobSupplierDescriptionDjob: TStringField;
    Label32: TLabel;
    BDescription: TButton;
    GroupBox1: TGroupBox;
    DBGridEhVidExportExelFile: TDBGridEh;
    dsVidExportExelFile: TMSDataSource;
    quVidExportExelFile: TMSQuery;
    quVidExportExelFileid: TLargeintField;
    quVidExportExelFilePostNo: TSmallintField;
    quVidExportExelFileColumn_Name: TWideStringField;
    quVidExportExelFileIs_Checked: TBooleanField;
    quVidExportExelFileN_pp: TSmallintField;
    DBCheckBoxEhExportInExcelFile: TDBCheckBoxEh;
    dsExportInExcelFile: TMSDataSource;
    quExportInExcelFile: TMSQuery;
    quExportInExcelFilePostNo: TSmallintField;
    quExportInExcelFileCheck1: TBooleanField;
    DBCheckBoxEhSeparationFile: TDBCheckBoxEh;
    quExportInExcelFileCheckSeparationFile: TBooleanField;
    quAddressPostTimeBeg: TWideStringField;
    quAddressPostTimeEnd: TWideStringField;
    quAddressPostForCheck: TMSQuery;
    dsAddressPostForCheck: TDataSource;
    quAddressPostForCheckID: TIntegerField;
    quAddressPostForCheckPostNo: TSmallintField;
    quAddressPostForCheckAddressNo: TSmallintField;
    quAddressPostForCheckAddress: TStringField;
    quAddressPostForCheckRegionNo: TWordField;
    quAddressPostForCheckCity: TStringField;
    quAddressPostForCheckStreet: TStringField;
    quAddressPostForCheckHouseNo: TStringField;
    quAddressPostForCheckMarschrutNo: TSmallintField;
    quAddressPostForCheckTopic: TStringField;
    quAddressPostForCheckMessage: TStringField;
    quAddressPostForCheckMail1: TStringField;
    quAddressPostForCheckMail2: TStringField;
    quAddressPostForCheckMail3: TStringField;
    quAddressPostForCheckCar: TStringField;
    quAddressPostForCheckDriver: TStringField;
    quAddressPostForCheckDateDeparture: TDateTimeField;
    quAddressPostForCheckDegrees: TStringField;
    quAddressPostForCheckMminutes: TStringField;
    quAddressPostForCheckSeconds: TStringField;
    quAddressPostForCheckCoordinates: TBlobField;
    quAddressPostForCheckX: TStringField;
    quAddressPostForCheckY: TStringField;
    quAddressPostForCheckCategoryName: TStringField;
    quAddressPostForCheckTimeBeg: TWideStringField;
    quAddressPostForCheckTimeEnd: TWideStringField;
    quAddressPostForCheckUnloading: TIntegerField;
    quAddressPostForCheckAddressPost: TStringField;
    quAddressPostForCheckAddressNoPost: TIntegerField;
    quAddressPostForCheckRegionName: TStringField;
    quAddressPostClassifierName: TStringField;
    Panel7: TPanel;
    GroupBoxAddressPostProp: TGroupBox;
    Splitter2: TSplitter;
    lbAddressNoPost: TLabel;
    lbCategoryName: TLabel;
    lbAddressPost: TLabel;
    lbTimeBeg: TLabel;
    lbTimeEnd: TLabel;
    lbUnloading: TLabel;
    lbRegionName: TLabel;
    lbCity: TLabel;
    lbStreet: TLabel;
    lbHouseNo: TLabel;
    lbTopic: TLabel;
    lbMessage: TLabel;
    lbMail1: TLabel;
    lbMail2: TLabel;
    lbMail3: TLabel;
    lbCar: TLabel;
    lbDriver: TLabel;
    lbDateDeparture: TLabel;
    lbX: TLabel;
    lbY: TLabel;
    lbClassifierName: TLabel;
    DBEditEhAddressNoPost: TDBEditEh;
    DBEditEhAddressPost: TDBEditEh;
    DBEditEhCategoryName: TDBEditEh;
    DBEditEhTimeBeg: TDBEditEh;
    DBEditEhTimeEnd: TDBEditEh;
    DBEditEhUnloading: TDBEditEh;
    DBLookupComboboxEhRegionNo: TDBLookupComboboxEh;
    DBEditEhCity: TDBEditEh;
    DBEditEhStreet: TDBEditEh;
    DBEditEhHouseNo: TDBEditEh;
    DBEditEhCar: TDBEditEh;
    DBEditEhDriver: TDBEditEh;
    DBEditEhDateDeparture: TDBEditEh;
    DBEditEhX: TDBEditEh;
    DBEditEhY: TDBEditEh;
    DBEditEhClassifierName: TDBEditEh;
    DBEditEhMail1: TDBEditEh;
    DBEditEhMail2: TDBEditEh;
    DBEditEhMail3: TDBEditEh;
    DBEditEhTopic: TDBEditEh;
    DBEditEhMessage: TDBEditEh;
    quAddressPostForCheckActive: TBooleanField;
    quAddressPostActive: TBooleanField;
    Label33: TLabel;
    DBEditEhSalesChannelsOfPepsico: TDBEditEh;
    Label34: TLabel;
    DBEditEhKOATUU: TDBEditEh;
    quAddressPostKOATUU_ID_CODE: TStringField;
    quAddressPostCode: TIntegerField;
    Label35: TLabel;
    DBEditEh1: TDBEditEh;
    quAddressPostCommerce_Network: TStringField;
    qu_CarCarrier: TMSQuery;
    ds_CarCarrier: TDataSource;
    Use_CarCarrier: TDBCheckBox;
    CarCarrier: TDBEdit;
    CarCarrierOKPO: TDBEdit;
    Label36: TLabel;
    qu_CarCarrierId: TIntegerField;
    qu_CarCarrierPostNo: TSmallintField;
    qu_CarCarrierCarCarrier: TStringField;
    qu_CarCarrierCarCarrierOKPO: TStringField;
    qu_CarCarrierCheck1: TBooleanField;
    sp_CorrectPostPayBan: TMSStoredProc;
    DBCheckBox5: TDBCheckBox;
    quAddressPostSpecialDelivery: TBooleanField;
    quAddressPostQuantityDelivery: TFloatField;
    Label37: TLabel;
    DBEditEh2: TDBEditEh;
    quAddressPostRefrezherator: TBooleanField;
    DBCheckBoxEhRefrezherator: TDBCheckBoxEh;
    Tsotrud_addressActive: TBooleanField;
    Tsotrud_addressDateBegOnActive: TDateTimeField;
    Tsotrud_addressDateEndOnActive: TDateTimeField;
    Button1: TButton;
    Panel9: TPanel;
    cbIsAllSotrud: TCheckBox;
    cbIsAllAddress: TCheckBox;
    Button2: TButton;
    DBCheckBoxEh1: TDBCheckBoxEh;
    GroupBox2: TGroupBox;
    DBGridEh4: TDBGridEh;
    quVidImportExelFileForNaklP: TMSQuery;
    dsVidImportExelFileForNaklP: TMSDataSource;
    quVidImportExelFileForNaklPID: TIntegerField;
    quVidImportExelFileForNaklPName: TStringField;
    quVidImportExelFileForNaklPColumn_Name_Post: TStringField;
    quVidImportExelFileForNaklPPostNo: TIntegerField;
    qul_PostGroupCutting: TMSQuery;
    dsl_PostGroupCutting: TMSDataSource;
    GroupBox4: TGroupBox;
    DBGridEh5: TDBGridEh;
    qul_PostGroupCuttingPostNo: TIntegerField;
    qul_PostGroupCuttingGroupCuttingId: TIntegerField;
    qul_PostGroupCuttingGroupCuttingVidNo: TIntegerField;
    qul_PostGroupCuttingIsLock: TBooleanField;
    qul_PostGroupCuttingGroupCuttingName: TStringField;
    qul_PostGroupCuttingVidName: TStringField;
    qul_PostGroupCuttingId: TLargeintField;
    GroupBox3: TGroupBox;
    DBGridEh6: TDBGridEh;
    quVidImportExelFileForBlanks: TMSQuery;
    dsVidImportExelFileForBlanks: TMSDataSource;
    quVidImportExelFileForBlanksID: TIntegerField;
    quVidImportExelFileForBlanksName: TStringField;
    quVidImportExelFileForBlanksColumn_Name_Post: TStringField;
    quVidImportExelFileForBlanksPostNo: TIntegerField;
    procedure lcRegionNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qu_ContractBeforePost(DataSet: TDataSet);
    procedure DBGridEh2Columns1UpdateData(Sender: TObject;
      var Text: string; var Value: Variant; var UseText, Handled: Boolean);
    procedure ActionViewRefAddressExecSQL(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure quAddressPostBeforePost(DataSet: TDataSet);
    procedure quTTN_RecordBeforePost(DataSet: TDataSet);
    procedure qu_Storekeeper_ListBefrePost(DataSet: TDataSet);
    procedure qu_Post_BanBeforePost(DataSet: TDataSet);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure DBGridEh3Exit(Sender: TObject);
    procedure DBGridEh2Exit(Sender: TObject);
    procedure quAddressPostBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Use_PriceKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qu_Post_MailBeforePost(DataSet: TDataSet);
    procedure cbToMailClick(Sender: TObject);
    procedure Mail1Exit(Sender: TObject);
    procedure Mail2Exit(Sender: TObject);
    procedure AddessPostForMailExit(Sender: TObject);
    procedure Mail3Exit(Sender: TObject);
    procedure qu_Post_MailAfterPost(DataSet: TDataSet);
    procedure AddessPostForMailChange(Sender: TObject);
    procedure quPostBanPayBeforePost(DataSet: TDataSet);
    procedure Set_Article_GroupChange(Sender: TObject);
    procedure qu_ShipperBeforePost(DataSet: TDataSet);
    procedure qu_CustomerBeforePost(DataSet: TDataSet);
    procedure RxDBGrid1Columns3EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure qu_ConfidantBeforePost(DataSet: TDataSet);
    procedure quDescriptionDjobSupplierBeforePost(DataSet: TDataSet);
    procedure BDescriptionClick(Sender: TObject);
    procedure DBCheckBoxEhExportInExcelFileMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBCheckBoxEhExportInExcelFileClick(Sender: TObject);
    procedure quVidExportExelFileBeforePost(DataSet: TDataSet);
    procedure quExportInExcelFileBeforePost(DataSet: TDataSet);
    procedure quAddressPostForCheckBeforeOpen(DataSet: TDataSet);
    procedure DBEditEhCategoryNameChange(Sender: TObject);
    procedure DBEditEhTimeBegChange(Sender: TObject);
    procedure DBEditEhTimeEndChange(Sender: TObject);
    procedure DBEditEhUnloadingChange(Sender: TObject);
    procedure DBLookupComboboxEhRegionNoChange(Sender: TObject);
    procedure DBEditEhCityChange(Sender: TObject);
    procedure DBEditEhStreetChange(Sender: TObject);
    procedure DBEditEhHouseNoChange(Sender: TObject);
    procedure DBEditEhXChange(Sender: TObject);
    procedure DBEditEhYChange(Sender: TObject);
    procedure DBEditEhCategoryNameCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhTimeBegCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhTimeEndCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhUnloadingCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBLookupComboboxEhRegionNoCheckDrawRequiredState(
      Sender: TObject; var DrawState: Boolean);
    procedure DBEditEhCityCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhStreetCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhHouseNoCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhXCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhYCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure GroupBoxAddressPostPropExit(Sender: TObject);
    procedure DBEditEhCategoryNameDblClick(Sender: TObject);
    procedure DBEditEhClassifierNameDblClick(Sender: TObject);
    procedure DBEditEhSalesChannelsOfPepsicoDblClick(Sender: TObject);
    procedure DBEditEhKOATUUDblClick(Sender: TObject);
    procedure DBEditEh1DblClick(Sender: TObject);
    procedure cxDBLookupComboBox1PropertiesCloseUp(Sender: TObject);
    procedure qu_CarCarrierBeforePost(DataSet: TDataSet);
    procedure Set_Article_GroupClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Tsotrud_addressBeforeOpen(DataSet: TDataSet);
    procedure Tsotrud_addressAfterPost(DataSet: TDataSet);
    procedure quVidImportExelFileForNaklPAfterPost(DataSet: TDataSet);
    procedure qul_PostGroupCuttingBeforePost(DataSet: TDataSet);
    procedure DBGridEh5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qul_PostGroupCuttingAfterPost(DataSet: TDataSet);
    procedure quVidImportExelFileForBlanksAfterPost(DataSet: TDataSet);
//    procedure btn1Click(Sender: TObject);
  private
    { private declarations }
    SearchString: string;

  public
    { public declarations }
  end;



var
  fmEditPost: TfmEditPost;
  read_only: boolean;
  is_save : boolean;
  CountNotRequiredData : integer;
  IsEditRequiredData : boolean;
  StopControlRequiredData : boolean;


procedure EditPost;
implementation

uses data, Main, MlekoDbDsMSSQL, Post0, CategoryTT, DescriptionNaklPost, ListControlRequiredData,
     ClassifierABCDZ, SalesChannelsOfPepsico, KOATUU, AddressPost_CODE_Commerce_Network, AddressPostActive,
     GroupCutting;

{$R *.DFM}

procedure EditPost;

Label Start;

var
  i,j: integer;
  ExtProp: Boolean;
  quCheckControlRequiredData : TMSQuery;

  Dlg : TListControlRequiredDataForm;

begin
  //if main.EditPostUser then exit;
  //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ShowMessage(BoolToStr(UserAccessToEditingPublishers));

  //UserAccessToEditingPublishers

  /////////////////////////////////////////////////////////////////////////////////
    dmDataModule.OpenSQL('select EditPost,UserName from Users where UserNo = :p1_id', [Data.UserNo]);

  read_only := not ((data.CodeAccess <= 1) and not (main.EditPostUser));
  fmEditPost := TfmEditPost.Create(Application);
  try
    dmDataModule.quRegions.Open;

    is_save := true;

    fmEditPost.quAddressPost.Open;
    fmEditPost.quAddressPostForCheck.Open;
    fmEditPost.Tsotrud_address.Open;

    StopControlRequiredData := False;

    quCheckControlRequiredData:=TMSQuery.Create(nil);
    quCheckControlRequiredData.Connection:=dmDataModule.DB;
    quCheckControlRequiredData.SQL.Clear;
    quCheckControlRequiredData.SQL.Text:= 'select isnull(RequiredData,0) as RequiredData '
                                         +' from ListUsersForRequiredData '
                                         +'  where UserNo = :UserNo ';
    quCheckControlRequiredData.ParamByName('UserNo').Value := Data.UserNo;
    quCheckControlRequiredData.Open;

    if (quCheckControlRequiredData.RecordCount > 0) and (quCheckControlRequiredData.FieldByName('RequiredData').AsBoolean = True) then StopControlRequiredData := True;

    if (UserAccessToEditingPublishers = True) and (StopControlRequiredData = False) then
     begin
       i := 0;
       Dlg := TListControlRequiredDataForm.Create(Application);

       Dlg.MemoListControlRequiredData.Lines.Clear;

       fmEditPost.quAddressPostForCheck.First;

       while (not fmEditPost.quAddressPostForCheck.Eof) do
        if (fmEditPost.quAddressPostForCheckActive.AsBoolean = true) then
        begin
          j := 0;

          Dlg.MemoListControlRequiredData.Lines.Add (fmEditPost.quAddressPostForCheckAddress.Value +' :'+ #10#13);

          if (fmEditPost.quAddressPostForCheckCategoryName.Value = '') and (isInsertMode <> true) then begin
                                                                                                         Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Категория ТТ!'+ #10#13);
                                                                                                         i := i+1;
                                                                                                         j := j +1;
                                                                                                       end;
          if (fmEditPost.quAddressPostForCheckTimeBeg.Value = '') and (isInsertMode <> true) then begin
                                                                                                    Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Работа с!'+ #10#13);
                                                                                                    i := i+1;
                                                                                                    j := j +1;
                                                                                                  end;
          if (fmEditPost.quAddressPostForCheckTimeEnd.Value = '') and (isInsertMode <> true) then begin
                                                                                                    Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Работа по!'+ #10#13);
                                                                                                    i := i+1;
                                                                                                    j := j +1;
                                                                                                  end;
          if ((fmEditPost.quAddressPostForCheckUnloading.Value = 0) or (fmEditPost.quAddressPostForCheckUnloading.IsNull)) then
           if isInsertMode <> true then begin
                                          Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Разгрузка(мин.)!'+ #10#13);
                                          i := i+1;
                                          j := j +1;
                                        end;
          if (fmEditPost.quAddressPostForCheckRegionNo.Value = 0) and (isInsertMode <> true) then begin
                                                                                                    Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Район!'+ #10#13);
                                                                                                    i := i+1;
                                                                                                    j := j +1;
                                                                                                  end;
          if (fmEditPost.quAddressPostForCheckCity.Value = '') and (isInsertMode <> true) then begin
                                                                                                 Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Город!'+ #10#13);
                                                                                                 i := i+1;
                                                                                                 j := j +1;
                                                                                               end;
          if (fmEditPost.quAddressPostForCheckStreet.Value = '') and (isInsertMode <> true) then begin
                                                                                                   Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Улица!'+ #10#13);
                                                                                                   i := i+1;
                                                                                                   j := j +1;
                                                                                                 end;
          if (fmEditPost.quAddressPostForCheckHouseNo.Value = '') and (isInsertMode <> true) then begin
                                                                                                    Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле № Дома!'+ #10#13);
                                                                                                    i := i+1;
                                                                                                    j := j +1;
                                                                                                  end;
          if (fmEditPost.quAddressPostForCheckX.Value = '') and (isInsertMode <> true) then begin
                                                                                              Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Широта!'+ #10#13);
                                                                                              i := i+1;
                                                                                              j := j +1;
                                                                                           end;
          if (fmEditPost.quAddressPostForCheckY.Value = '') and (isInsertMode <> true) then begin
                                                                                              Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Долгота!'+ #10#13);
                                                                                              i := i+1;
                                                                                              j := j +1;
                                                                                            end;
          if j = 0 then Dlg.MemoListControlRequiredData.Lines.Delete(Dlg.MemoListControlRequiredData.Lines.Count-1);
          if j > 0 then Dlg.MemoListControlRequiredData.Lines.Add (''+ #10#13);
          fmEditPost.quAddressPostForCheck.Next;
        end
        else fmEditPost.quAddressPostForCheck.Next;
       try
        CountNotRequiredData := i;
        if i > 0 then
         if Dlg.ShowModal = mrok then begin
                                        is_Save := true;
                                        IsEditRequiredData := true;
                                      end
                                 else begin
                                        is_Save := false;
                                        IsEditRequiredData := false;
                                      end;
       finally
        quCheckControlRequiredData.Close;
        Dlg.Free;
       end;


     end;

    Start:

    fmEditPost.qu_Contract.Close;
    fmEditPost.quTTN_Record.Close;
    fmEditPost.qu_Storekeeper.Close;
    fmEditPost.qu_Shipper.Close;
    fmEditPost.qu_CarCarrier.Close;
    fmEditPost.qu_Confidant.Close;
    fmEditPost.qu_Customer.Close;
    fmEditPost.qu_Post_Ban.Close;
    fmEditPost.qu_Post_Mail.Close;
    fmEditPost.qu_AddressPostForMail.Close;
    fmEditPost.quTrash.Open;
    fmEditPost.qu_Prop.Close;
    fmEditPost.qu_ContractType.Close;
    fmEditPost.quPostBanPay.Close;
    fmEditPost.quDescriptionDjobSupplier.Close;
    fmEditPost.quVidExportExelFile.Close;
    fmEditPost.quExportInExcelFile.Close;
    fmEditPost.quVidImportExelFileForNaklP.Close;
    fmEditPost.qul_PostGroupCutting.Close;
    fmEditPost.quVidImportExelFileForBlanks.Close;


    fmEditPost.quPostBanPay.Params.ParamByName('p_PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;

    fmEditPost.qu_Contract.Params.ParamByName('p_PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.qu_Prop.Params.ParamByName('p_PostNo').Value := fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.quTTN_Record.Params.ParamByName('p_PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.qu_Storekeeper.Params.ParamByName('p_PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.qu_Shipper.Params.ParamByName('p_PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.qu_CarCarrier.Params.ParamByName('p_PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.qu_Confidant.Params.ParamByName('p_PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.qu_Customer.Params.ParamByName('p_PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.qu_Post_Ban.Params.ParamByName('p_PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.qu_Post_Mail.ParamByName('p_PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.qu_Post_Mail.ParamByName('AddressNo').Value := fmEditPost.AddessPostForMail.KeyValue;
    fmEditPost.qu_AddressPostForMail.ParamByName('PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.quDescriptionDjobSupplier.ParamByName('PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.quVidExportExelFile.ParamByName('PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.quExportInExcelFile.ParamByName('PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.quVidImportExelFileForNaklP.ParamByName('PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.qul_PostGroupCutting.ParamByName('PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.quVidImportExelFileForBlanks.ParamByName('PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;

    fmEditPost.quPostBanPay.Open;

    fmEditPost.qu_Contract.Open;
    fmEditPost.qu_Prop.Open;
    fmEditPost.qu_ContractType.Open;
    fmEditPost.quTTN_Record.Open;
    fmEditPost.qu_Storekeeper.Open;
    fmEditPost.qu_Shipper.Open;
    fmEditPost.qu_CarCarrier.Open;
    fmEditPost.qu_Confidant.Open;
    fmEditPost.qu_Customer.Open;
    fmEditPost.qu_Post_Ban.Open;
    fmEditPost.qu_Post_Mail.Open;
    fmEditPost.qu_AddressPostForMail.Open;
    fmEditPost.quDescriptionDjobSupplier.Open;
    fmEditPost.quVidExportExelFile.Open;
    fmEditPost.quExportInExcelFile.Open;
    fmEditPost.quVidImportExelFileForNaklP.Open;
    fmEditPost.qul_PostGroupCutting.Open;
    fmEditPost.quVidImportExelFileForBlanks.Open;

    with fmEditPost do
    begin
      for i := 0 to fmEditPost.MLKCustomDm.quPost.FieldCount - 1 do
      begin
        fmEditPost.MLKCustomDm.quPost.Fields[i].ReadOnly := read_only;
      end;
      for i := 0 to quAddressPost.FieldCount - 1 do
      begin
        quAddressPost.Fields[i].ReadOnly := read_only;
      end;

      for i := 0 to qu_Contract.FieldCount - 1 do
      begin
        qu_Contract.Fields[i].ReadOnly := read_only;
      end;

      for i := 0 to qu_ContractType.FieldCount - 1 do
      begin
        qu_ContractType.Fields[i].ReadOnly := read_only;
      end;

      for i := 0 to qu_Prop.FieldCount - 1 do
      begin
        qu_Prop.Fields[i].ReadOnly := read_only;
      end;

      for i := 0 to qu_Post_Mail.FieldCount - 1 do
      begin
        qu_Post_Mail.Fields[i].ReadOnly := read_only;
      end;

      for i := 0 to Tsotrud_address.FieldCount - 1 do
      begin
        Tsotrud_address.Fields[i].ReadOnly := read_only;
      end;
      RxDBGrid1.ReadOnly := read_only;
      DBGridEh1.ReadOnly := read_only;


      if (qu_Post_MailMail1.AsString = '') or (Mail1.Text = '') then
       begin
         Mail1.Enabled := true;
         Mail2.ReadOnly := true;
         Mail2.Color := clSilver;
         Mail3.ReadOnly := true;
         Mail3.Color := clSilver;
         TopicMail.ReadOnly := true;
         TopicMail.Color := clSilver;
         Message.ReadOnly := true;
         Message.Color := clSilver;
       end
      else
       begin
         Mail2.ReadOnly := false;
         Mail2.Color := clWindow;
         Mail3.ReadOnly := true;
         Mail3.Color := clSilver;
         TopicMail.ReadOnly := false;
         TopicMail.Color := clWindow;
         Message.ReadOnly := false;
         Message.Color := clWindow;
       end;

      ExtProp := not fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').IsNull;
      if not ExtProp then
      begin
        tsDelayPay.Visible:=ExtProp;
        tsDelayPay.TabVisible:=ExtProp;
        tsDelayPay.Enabled:=ExtProp;
        tsAdress.Visible := ExtProp;
        tsAdress.TabVisible := ExtProp;
        tsAdress.Enabled := ExtProp;
        tsContract.Visible := ExtProp;
        tsContract.TabVisible := ExtProp;
        tsContract.Enabled := ExtProp;
        tsPriceType.TabVisible:=ExtProp;
        tsPriceType.Enabled:=ExtProp;
        PanelBoolProp.Visible := ExtProp;
      end;
      tsMain.Visible := True;
      tsMain.TabVisible := True;
    end;
    if ExtProp then
    begin
      fmEditPost.FrmDelayPay.Open;
      fmEditPost.FrmSetPriceType.Open;
    end;
    fmEditPost.RxDBGrid1.OptionsEh := [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghTraceColSizing];
    fmEditPost.RxDBGrid1.Col := 1;



    if fmEditPost.ShowModal = mrOk then
    begin

      if ((CountNotRequiredData > 0) and (is_Save = True)) then Goto Start;
      if fmEditPost.MLKCustomDm.quPost.State in [dsInsert, dsEdit] then
        fmEditPost.MLKCustomDm.quPost.Post;
    end
    else
    begin
      if fmEditPost.MLKCustomDm.quPost.State in [dsInsert, dsEdit] then
        fmEditPost.MLKCustomDm.quPost.Cancel;
    end

  finally
    fmEditPost.quAddressPost.Close;
    fmEditPost.quTTN_Record.Close;
    fmEditPost.qu_Storekeeper.Close;
    fmEditPost.qu_Shipper.Close;
    fmEditPost.qu_CarCarrier.Close;
    fmEditPost.qu_Confidant.Close;
    fmEditPost.qu_Customer.Close;
    fmEditPost.qu_Post_Ban.Close;
    fmEditPost.qu_Post_Mail.Close;
    fmEditPost.qu_AddressPostForMail.Close;

    fmEditPost.quPostBanPay.Close;

    fmEditPost.quVidExportExelFile.Close;
    fmEditPost.quExportInExcelFile.Close;

    dmDataModule.quRegions.Close;

    fmEditPost.Free;
  end;
end;

procedure TfmEditPost.lcRegionNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    if not (MLKCustomDm.quPost.State in [dsInsert, dsEdit]) then
      MLKCustomDm.quPost.Edit;
    MLKCustomDm.quPost.FieldByName('RegionNo').AsInteger := 0;
  end;
end;

procedure TfmEditPost.qu_ContractBeforePost(DataSet: TDataSet);
begin
  qu_ContractPostNo.AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
end;

procedure TfmEditPost.DBGridEh2Columns1UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
var
  prop: Integer;
begin
  if Value then
    prop := 1
  else
    prop := 0;
  spSetFirmProp.Close;
  //  spSetFirmProp.Prepare;
  spSetFirmProp.Params.ParamByName('p_postNo').Value := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
  spSetFirmProp.Params.ParamByName('p_PropId').Value := qu_Prop.FieldByName('id').AsInteger;
  spSetFirmProp.Params.ParamByName('p_Value').Value := prop;
  spSetFirmProp.ExecProc;
  //  qu_Prop.Refresh();
end;

procedure TfmEditPost.ActionViewRefAddressExecSQL(Sender: TObject);
var
  ln_id_addr, ln_id_sotr: Integer;
begin

  Ln_Id_Addr := quAddressPostID.Value;
  quAddressPost.Close;
  quAddressPost.Open;
  quAddressPost.Locate('Id',Ln_Id_Addr,[]);

  Tsotrud_address.Close;
  Tsotrud_address.Open;
end;

procedure TfmEditPost.bbOkClick(Sender: TObject);
var
  QuPostNo,QuWork,QuPostCheck,QuPostCheckOKPO : TMSQuery;
  str1,str2 : String;
  Dlg : TListControlRequiredDataForm;
  i,j : integer;
begin
{
     QuPostCheck:=TMSQuery.Create(nil);
     QuPostCheck.Connection:=dmDataModule.DB;
     QuPostCheck.SQL.Clear;
     QuPostCheck.SQL.Text:= 'select convert(int,count(PostNo)) as CheckPostNo'
                           +' from Post  '
                           +'  where isnull(Name,'''') = :Name and isnull(OKPO,'''') = :OKPO ';
     QuPostCheck.ParamByName('Name').Value := EditName.Text;
     QuPostCheck.ParamByName('OKPO').Value := EditOKPO.Text;
     QuPostCheck.Open;

     if ((QuPostCheck.FieldByName('CheckPostNo').AsInteger > 0) and (isInsertMode = true)) then
      begin
        ShowMessage('Партнер с такими реквизитами уже существует!' + #10#13 +
                    'Нажмите обновить, выберите партнера из списка и отредактируйте.');
        QuPostCheck.Close;
        isInsertMode := false;
        EditName.Text := '';
        bbCancel.Click;
      end;

        ShowMessage('Партнер с таким ОКПО уже существует!' + #10#13 +
                    'Номер партнера: ' + QuPostCheckOKPO.FieldByName('PostNo').AsString + #10#13 +
                    'Имя партнера: ' + QuPostCheckOKPO.FieldByName('Name').AsString + #10#13 +
                    'ОКПО партера: ' + QuPostCheckOKPO.FieldByName('OKPO').AsString + #10#13 +
                    'Нажмите обновить, выберите партнера из списка и отредактируйте.');
        QuPostCheckOKPO.Close;
        isInsertMode := false;
        EditName.Text := '';
        bbCancel.Click;

     is_save := true;

     if   (quAddressPostCategoryName.Value = '') and (isInsertMode <> true)
      then begin
             ShowMessage('Не заполнено обязательное поле Категория ТТ!'+ #10#13 +'Данные сохранены не будут!');
             is_save := false;
           end;
     if   (quAddressPostTimeBeg.Value = '') and (isInsertMode <> true)
      then begin
             ShowMessage('Не заполнено обязательное поле Работа с!'+ #10#13 +'Данные сохранены не будут!');
             is_save := false;
           end;
     if   (quAddressPostTimeEnd.Value = '') and (isInsertMode <> true)
      then begin
             ShowMessage('Не заполнено обязательное поле Работа по!'+ #10#13 +'Данные сохранены не будут!');
             is_save := false;
           end;
     if   ((quAddressPostUnloading.Value = 0) or (quAddressPostUnloading.IsNull)) then
      if isInsertMode <> true
       then begin
              ShowMessage('Не заполнено обязательное поле Разгрузка(мин.)!'+ #10#13 +'Данные сохранены не будут!');
              is_save := false;
            end;
     if   (quAddressPostRegionName.Value = '') and (isInsertMode <> true)
      then begin
             ShowMessage('Не заполнено обязательное поле Район!'+ #10#13 +'Данные сохранены не будут!');
             is_save := false;
           end;
     if   (quAddressPostCity.Value = '') and (isInsertMode <> true)
      then begin
             ShowMessage('Не заполнено обязательное поле Город!'+ #10#13 +'Данные сохранены не будут!');
             is_save := false;
           end;
     if   (quAddressPostStreet.Value = '') and (isInsertMode <> true)
      then begin
             ShowMessage('Не заполнено обязательное поле Улица!'+ #10#13 +'Данные сохранены не будут!');
             is_save := false;
           end;
     if   (quAddressPostHouseNo.Value = '') and (isInsertMode <> true)
      then begin
             ShowMessage('Не заполнено обязательное поле № Дома!'+ #10#13 +'Данные сохранены не будут!');
             is_save := false;
           end;

     if is_save = false then begin
                               tsAdress.Enabled := true;
                               tsAdress.Visible := true;
                               tsAdress.SetFocus;
                               tsAdress.Show;
                               RxDBGrid1.Enabled := true;
                               RxDBGrid1.SetFocus;
                               ActiveControl := RxDBGrid1;
                             end;
}
     if (is_save = true) then
      begin
       i := 0;

       Dlg := TListControlRequiredDataForm.Create(Application);

       Dlg.MemoListControlRequiredData.Lines.Clear;

       fmEditPost.quAddressPostForCheck.Close;
       fmEditPost.quAddressPostForCheck.Open;
       fmEditPost.quAddressPostForCheck.First;


       if StopControlRequiredData = false then
       while (not fmEditPost.quAddressPostForCheck.Eof) do
        if (fmEditPost.quAddressPostForCheckActive.AsBoolean = true) then
        begin
          j := 0;

          Dlg.MemoListControlRequiredData.Lines.Add (fmEditPost.quAddressPostAddress.Value +' :'+ #10#13);

          if (fmEditPost.quAddressPostForCheckCategoryName.Value = '') and (isInsertMode <> true) then begin
                                                                                                         Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Категория ТТ!'+ #10#13);
                                                                                                         i := i+1;
                                                                                                         j := j+1;
                                                                                                      end;
          if (fmEditPost.quAddressPostForCheckTimeBeg.Value = '') and (isInsertMode <> true) then begin
                                                                                                    Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Работа с!'+ #10#13);
                                                                                                    i := i+1;
                                                                                                    j := j+1;
                                                                                                  end;
          if (fmEditPost.quAddressPostForCheckTimeEnd.Value = '') and (isInsertMode <> true) then begin
                                                                                                    Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Работа по!'+ #10#13);
                                                                                                    i := i+1;
                                                                                                    j := j+1;
                                                                                                  end;
          if ((fmEditPost.quAddressPostForCheckUnloading.Value = 0) or (fmEditPost.quAddressPostForCheckUnloading.IsNull)) then
           if isInsertMode <> true then begin
                                          Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Разгрузка(мин.)!'+ #10#13);
                                          i := i+1;
                                          j := j+1;
                                        end;
          if (fmEditPost.quAddressPostForCheckRegionNo.Value = 0) and (isInsertMode <> true) then begin
                                                                                                       Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Район!'+ #10#13);
                                                                                                       i := i+1;
                                                                                                       j := j+1;
                                                                                                     end;
          if (fmEditPost.quAddressPostForCheckCity.Value = '') and (isInsertMode <> true) then begin
                                                                                                 Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Город!'+ #10#13);
                                                                                                 i := i+1;
                                                                                                 j := j+1;
                                                                                               end;
          if (fmEditPost.quAddressPostForCheckStreet.Value = '') and (isInsertMode <> true) then begin
                                                                                                   Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Улица!'+ #10#13);
                                                                                                   i := i+1;
                                                                                                   j := j+1;
                                                                                                 end;
          if (fmEditPost.quAddressPostForCheckHouseNo.Value = '') and (isInsertMode <> true) then begin
                                                                                                    Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле № Дома!'+ #10#13);
                                                                                                    i := i+1;
                                                                                                    j := j+1;
                                                                                                  end;
          if (fmEditPost.quAddressPostForCheckX.Value = '') and (isInsertMode <> true) then begin
                                                                                              Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Широта!'+ #10#13);
                                                                                              i := i+1;
                                                                                              j := j+1;
                                                                                            end;
          if (fmEditPost.quAddressPostForCheckY.Value = '') and (isInsertMode <> true) then begin
                                                                                              Dlg.MemoListControlRequiredData.Lines.Add (' Не заполнено обязательное поле Долгота!'+ #10#13);
                                                                                              i := i+1;
                                                                                              j := j+1;
                                                                                            end;
          if j = 0 then Dlg.MemoListControlRequiredData.Lines.Delete(Dlg.MemoListControlRequiredData.Lines.Count-1);
          if j > 0 then Dlg.MemoListControlRequiredData.Lines.Add (''+ #10#13);
          fmEditPost.quAddressPostForCheck.Next;
        end
        else fmEditPost.quAddressPostForCheck.Next;
       try
        dlg.IsRead.Caption := 'Выход';
        if i > 0 then
         if Dlg.ShowModal = mrok then begin
                                        CountNotRequiredData := i;
                                        is_Save := true;
                                      end
                                 else begin
                                        is_Save := false;
                                      end;
       finally
        Dlg.Free;
       end;


     end;

     QuPostCheck:=TMSQuery.Create(nil);
     QuPostCheck.Connection:=dmDataModule.DB;
     QuPostCheck.SQL.Clear;
     QuPostCheck.SQL.Text:= 'select PostNo, Name, OKPO'
                           +' from Post  '
                           +'  where isnull(Name,'''') = :Name ';
     QuPostCheck.ParamByName('Name').Value := EditName.Text;
     QuPostCheck.Open;

     if ((QuPostCheck.RecordCount > 0) and (isInsertMode = true)) then
      begin
        ShowMessage('Партнер с таким именем уже существует!' + #10#13 +
                    'Номер партнера: ' + QuPostCheck.FieldByName('PostNo').AsString + #10#13 +
                    'Имя партнера: ' + QuPostCheck.FieldByName('Name').AsString + #10#13 +
                    'ОКПО партера: ' + QuPostCheck.FieldByName('OKPO').AsString + #10#13 +
                    'Нажмите обновить, выберите партнера из списка и отредактируйте.');
        QuPostCheck.Close;
        isInsertMode := false;
        EditName.Text := '';
        bbCancel.Click;
      end;

     QuPostCheckOKPO:=TMSQuery.Create(nil);
     QuPostCheckOKPO.Connection:=dmDataModule.DB;
     QuPostCheckOKPO.SQL.Clear;
     QuPostCheckOKPO.SQL.Text:= 'select PostNo, Name, OKPO'
                           +' from Post  '
                           +'  where isnull(OKPO,'''') = :OKPO ';
     QuPostCheckOKPO.ParamByName('OKPO').Value := EditOKPO.Text;
     QuPostCheckOKPO.Open;

     str1 := 'Партнер с таким ОКПО уже существует!' + #10#13 +
             'Номер партнера: ' + QuPostCheckOKPO.FieldByName('PostNo').AsString + #10#13 +
             'Имя партнера: ' + QuPostCheckOKPO.FieldByName('Name').AsString + #10#13 +
             'ОКПО партера: ' + QuPostCheckOKPO.FieldByName('OKPO').AsString + #10#13 +
             'Вы уверены, что хотите продолжить?' + #10#13 +
             'Нажмите Да для внесения данных в базу или Нет для отмены';

//     showmessage(str1);

     if ((QuPostCheckOKPO.RecordCount > 0) and (isInsertMode = true)) then
      begin
        if (Application.MessageBox(PANSIChar(str1),PANSIChar('Проверка ОКПО'), MB_YESNO) = ID_NO) then
         begin
           QuPostCheckOKPO.Close;
           isInsertMode := false;
           EditName.Text := '';
           bbCancel.Click;
         end;
      end;





{Изменения в программе с последнего обновления (4.0.15)
- Добавлена проверка на повторную запись партнера}

{
     if ((EditNameLong.Text <> '') or (Edit_Price.Text <> '')
                                   or (Use_Price.Text <> '')
                                   or (cxDBLookupComboBox1.Text <> '')
                                   or (EditNameLong.Text <> '')
                                   or (EditOKPO.Text <> '')
                                   or (EditAddress.Text <> '')
                                   or (EditPhone.Text <> '')
                                   or (EditNoSvidNDS.Text <> '')
                                   or (EditCodeNds.Text <> '')
                                   or (EditRS.Text <> '')
                                   or (EditMFO.Text <> '')
                                   or (EditNameBank.Text <> '')
                                   or (deAddressBank.Text <> '')
                                   or (deDayDelay.Text <> '')
                                   or (deContact.Text <> '')
                                   or (deCategorName.Text <> '')
                                   or (cbNotPlatNDS.Checked and EditPostUser = false)
                                   or (not cbNotPlatNDS.Checked and EditPostUser = true)
                                   or (cbPrint.Checked and EditPostUser = false)
                                   or (not cbPrint.Checked and EditPostUser = true)
                                   or (cbAccountCash.Checked and EditPostUser = false)
                                   or (not cbAccountCash.Checked and EditPostUser = true)
                                   or (cbExport1C.Checked and EditPostUser = false)
                                   or (not cbExport1C.Checked and EditPostUser = true)
                                   or (DBCheckBox3.Checked and EditPostUser = false)
                                   or (DBCheckBox1.Checked and EditPostUser = false)
                                   or (DBCheckBox2.Checked and EditPostUser = false)) then isInsertMode := false;
}
     if (EditName.Text = '') then bbCancel.Click;


     if ((EditNameLong.Text = '') and (isInsertMode = true)) then EditNameLong.Text := EditName.Text;
     if ((Edit_Price.Text = '') and (isInsertMode = true)) then MLKCustomDm.quPostPriceChange.Value := 'N'; //Edit_Price.Text := 'N';
     if ((Use_Price.Text = '')  and (isInsertMode = true)) then MLKCustomDm.quPostAccept.Value := 'Y'; //Use_Price.Text := 'Y';
     if ((cxDBLookupComboBox1.Text = '')  and (isInsertMode = true)) then cxDBLookupComboBox1.Text := 'Активен';

     if ((isInsertMode = true) and (EditName.Text <> '')) then
      begin

        cbPrint.Checked := true;

        QuPostNo:=TMSQuery.Create(nil);
        QuPostNo.Connection:=dmDataModule.DB;
        QuPostNo.SQL.Clear;
        QuPostNo.SQL.Text:= 'select max(PostNo)+1 as PostNo'
                        +' from Post ';
        QuPostNo.Open;


        spSetFirmProp.Close;
        spSetFirmProp.Params.ParamByName('p_postNo').Value := QuPostNo.FieldByName('PostNo').AsInteger;
        spSetFirmProp.Params.ParamByName('p_PropId').AsInteger := 4;
        spSetFirmProp.Params.ParamByName('p_Value').Value := 1;
        spSetFirmProp.ExecProc;

        spSetFirmProp.Close;
        spSetFirmProp.Params.ParamByName('p_postNo').Value := QuPostNo.FieldByName('PostNo').AsInteger;
        spSetFirmProp.Params.ParamByName('p_PropId').AsInteger := 22;
        spSetFirmProp.Params.ParamByName('p_Value').Value := 1;
        spSetFirmProp.ExecProc;

        QuWork:=TMSQuery.Create(nil);
        QuWork.Connection:=dmDataModule.DB;
        QuWork.SQL.Clear;
        QuWork.SQL.Text:= 'declare @Currency varchar(5) '
                         +'set @Currency = :Currency '
                         +'insert into L_Post_Set_ArtGroup_Delay '
                         +'   (Set_Article_Group_Id, PostNo, Day_Delay, Day_Delay_Ext, Buh, Currency) '
                         +'values '
                         +'   (:Set_Article_Group_Id, :PostNo, :Day_Delay, :Day_Delay_Ext, :Buh, @Currency) '
                         +'insert into L_Post_Set_ArtGroup_PayBan '
                         +'   (PostNo_PayBan, Set_Article_Group_Id_PayBan, Buh, PayBan, Currency) '
                         +'values '
                         +'   (:PostNo, :Set_Article_Group_Id, :Buh, isnull(:PayBan,0), @Currency) '
                         +'insert into L_Post_Set_ArtGroup_Price '
                         +'    (ColNPrice, PostNo, Set_Article_Group_Id)'
                         +'values '
                         +'    (:ColNPrice, :PostNo, :Set_Article_Group_Id)'
                         +'declare '
                         +'   @Expire_Date smalldatetime '
                         +'  ,@Create_Date smalldatetime '
                         +'select @Expire_Date = convert(datetime, (SELECT convert(nvarchar(4), datepart(yyyy, GETDATE())) + ''-''+ ''12'' + ''-'' + ''31''), 121)'
                         +'select @Create_Date = convert(datetime, (SELECT convert(nvarchar(4), datepart(yyyy, GETDATE())) ++ ''-'' + convert(nvarchar(2), datepart(mm, GETDATE())) ++ ''-'' + convert(nvarchar(2), datepart(dd, GETDATE()))), 121) '
                         +'insert into d_firm_contract '
                         +'  (PostNo,num,OurFirmNo,Create_Date,Expire_Date,Type_id,print_on_naklR) '
                         +'values '
                         +'  (:PostNo,:num,:OurFirmNo,@Create_Date,@Expire_Date,:Type_id,:print_on_naklR)';

        if main.GlobalOurFirmNo = 1 then QuWork.ParamByName('Set_Article_Group_Id').Value := 1
                                    else QuWork.ParamByName('Set_Article_Group_Id').Value := 7718234909260420228;
        QuWork.ParamByName('PostNo').Value := QuPostNo.FieldByName('PostNo').AsInteger;
        QuWork.ParamByName('Day_Delay').Value := 0;
        QuWork.ParamByName('Day_Delay_Ext').Value := 1;
        QuWork.ParamByName('Buh').Value := 1;
        QuWork.ParamByName('PayBan').Value := 0;
        QuWork.ParamByName('ColNPrice').Value := 2;
        QuWork.ParamByName('num').Value := 'Б/Н';
        QuWork.ParamByName('OurFirmNo').Value := main.GlobalOurFirmNo;
//        QuWork.ParamByName('OurFirmNo').Value := 490;
        QuWork.ParamByName('Type_id').Value := 1;
        QuWork.ParamByName('print_on_naklR').Value := 1;

        dmDataModule.OpenSQL('select c.l_code,c.Name from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and isnull(c.isTrash,0) = 0');
        QuWork.ParamByName('Currency').Value := dmDataModule.QFO.FieldByName('l_code').Value;
 //    showmessage(QuWork.SQL.Text);

        QuWork.Execute;

        QuPostNo.Close;
        QuPostCheck.Close;
        isInsertMode := false;
      end;

  if StopControlRequiredData = true then is_save := true;

  if (qu_Contract.State in [dsInsert, dsEdit]) and (is_save = true) then qu_Contract.Post else qu_Contract.Cancel;
  if (Tsotrud_address.State in [dsInsert, dsEdit]) and (is_save = true) then Tsotrud_address.Post else Tsotrud_address.Cancel;
  if (quAddressPost.State in [dsInsert, dsEdit]) and (is_save = true) then quAddressPost.Post else quAddressPost.Cancel;
  if (quTTN_Record.State in [dsInsert, dsEdit]) and (is_save = true) then quTTN_Record.Post else quTTN_Record.Cancel;
  if (qu_Storekeeper.State in [dsInsert, dsEdit]) and (is_save = true) then qu_Storekeeper.Post else qu_Storekeeper.Cancel;
  if (qu_Shipper.State in [dsInsert, dsEdit]) and (is_save = true) then qu_Shipper.Post else qu_Shipper.Cancel;
  if (qu_CarCarrier.State in [dsInsert, dsEdit]) and (is_save = true) then qu_CarCarrier.Post else qu_CarCarrier.Cancel;
  if (qu_Confidant.State in [dsInsert, dsEdit]) and (is_save = true) then qu_Confidant.Post else qu_Confidant.Cancel;
  if (qu_Customer.State in [dsInsert, dsEdit]) and (is_save = true) then qu_Customer.Post else qu_Customer.Cancel;
  if (qu_Post_Ban.State in [dsInsert, dsEdit]) and (is_save = true) then qu_Post_Ban.Post else qu_Post_Ban.Cancel;
  if (qu_Post_Mail.State in [dsInsert, dsEdit]) and (cbToMail.Checked) and (is_save = true) then qu_Post_Mail.Post else qu_Post_Mail.Cancel;
  if (quPostBanPay.State in  [dsInsert, dsEdit]) and (is_save = true) then quPostBanPay.Post else quPostBanPay.Cancel;
  if (quDescriptionDjobSupplier.State in  [dsInsert, dsEdit]) and (is_save = true) then quDescriptionDjobSupplier.Post else quDescriptionDjobSupplier.Cancel;
  if (quExportInExcelFile.State in  [dsInsert, dsEdit]) and (is_save = true) then quExportInExcelFile.Post else quExportInExcelFile.Cancel;
  if (quVidExportExelFile.State in  [dsInsert, dsEdit]) and (is_save = true) then quVidExportExelFile.Post else quVidExportExelFile.Cancel;
  if (qul_PostGroupCutting.State in  [dsInsert, dsEdit]) and (is_save = true) then qul_PostGroupCutting.Post else qul_PostGroupCutting.Cancel;
  if (quVidImportExelFileForBlanks.State in  [dsInsert, dsEdit]) and (is_save = true) then quVidImportExelFileForBlanks.Post else quVidImportExelFileForBlanks.Cancel;
end;

procedure TfmEditPost.ActionViewRefreshExecute(Sender: TObject);
begin
  qu_Prop.Close;
  qu_Prop.Open;
end;

procedure TfmEditPost.quAddressPostBeforePost(DataSet: TDataSet);
var
  MaxId : int64;

begin
  if quAddressPost.State = dsInsert then
  begin
    quAddressPostPostNo.AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select MAX(AddressNo) AddressNo from AddressPost where PostNo=:PostNo');
    dmDataModule.quWork.ParamByName('PostNo').AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    dmDataModule.quWork.Open;
    quAddressPostAddressNo.AsInteger := dmDataModule.quWork.FieldByName('AddressNo').AsInteger + 1;

    quAddressPostPostNo.AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    dmDataModule.quWork.Close;
  end;

  if quAddressPostActive.Value then begin
                                      dmDataModule.quWork.SQL.Clear;
                                      dmDataModule.quWork.SQL.Add('insert into L_AddressPostActive (IdAddress, DateBeg,UserNoBeg) values (:IdAddress, :DateBeg, :UserNoBeg)');
                                      dmDataModule.quWork.ParamByName('IdAddress').AsInteger := quAddressPostId.Value;
                                      dmDataModule.quWork.ParamByName('DateBeg').AsDateTime := Date();
                                      dmDataModule.quWork.ParamByName('UserNoBeg').AsInteger := data.UserNo;
                                      dmDataModule.quWork.Execute;
                                    end
                               else begin
                                      dmDataModule.quWork.SQL.Clear;
                                      dmDataModule.quWork.SQL.Add('select max(id) as MaxId from L_AddressPostActive where IdAddress = :IdAddress');
                                      dmDataModule.quWork.ParamByName('IdAddress').Value := quAddressPostId.Value;
                                      dmDataModule.quWork.Open;
                                      MaxId := dmDataModule.quWork.FieldByName('MaxId').AsInteger;
                                      dmDataModule.quWork.SQL.Clear;
                                      dmDataModule.quWork.SQL.Add('update L_AddressPostActive set DateEnd = :DateEnd, UserNoEnd = :UserNoEnd where id = :MaxId');
                                      dmDataModule.quWork.ParamByName('DateEnd').AsDateTime := Date();
                                      dmDataModule.quWork.ParamByName('UserNoEnd').AsInteger := data.UserNo;
                                      dmDataModule.quWork.ParamByName('MaxId').AsInteger := MaxId;
                                      dmDataModule.quWork.Execute;
                                    end;

//  if (quAddressPost.State in [dsInsert, dsEdit]) and ((CountNotRequiredData > 0) and (is_Save = true)) then Exit;//quAddressPost.Cancel;
//  quAddressPostTimeBeg.Value := quAddressPost.FieldByName('TimeBeg').Value;   //RxDBGrid1.Columns[6].Field;
//  quAddressPostTimeEnd.Value := quAddressPost.FieldByName('TimeEnd').Value;


end;

procedure TfmEditPost.quTTN_RecordBeforePost(DataSet: TDataSet);
begin
  if quTTN_Record.State = dsInsert then
  begin
    quTTN_RecordPostNo.AsInteger :=  MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    quTTN_RecordDriver.AsString := fmEditPost.Driver.EditText;
    quTTN_RecordCars.AsString := fmEditPost.Cars.EditText;
    quTTN_RecordCheck1.AsBoolean := fmEditPost.Use_it.Checked;
  end;
  if quTTN_Record.State = dsEdit then
   begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select ID from TTN_Record where PostNo=:PostNo');
    dmDataModule.quWork.ParamByName('PostNo').AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    dmDataModule.quWork.Open;
    quTTN_RecordID.AsInteger := dmDataModule.quWork.FieldByName('ID').AsInteger;
    quTTN_RecordPostNo.AsInteger :=  MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    quTTN_RecordDriver.AsString := fmEditPost.Driver.EditText;
    quTTN_RecordCars.AsString := fmEditPost.Cars.EditText;
    quTTN_RecordCheck1.AsBoolean := fmEditPost.Use_it.Checked;
    dmDataModule.quWork.Close;
   end;
end;

procedure TfmEditPost.qu_Storekeeper_ListBefrePost(DataSet: TDataSet);
begin
  if qu_Storekeeper.State = dsInsert then
  begin
    qu_StorekeeperPostNo.AsInteger :=  MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_StorekeeperStorekeeper.AsString := fmEditPost.Storekeeper.EditText;
    qu_StorekeeperCheck1.AsBoolean := fmEditPost.Use_StoreKeeper.Checked;
  end;
  if qu_Storekeeper.State = dsEdit then
   begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select ID from Storekeeper_List where PostNo=:PostNo');
    dmDataModule.quWork.ParamByName('PostNo').AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    dmDataModule.quWork.Open;
    qu_StorekeeperID.AsInteger := dmDataModule.quWork.FieldByName('ID').AsInteger;
    qu_StorekeeperPostNo.AsInteger :=  MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_StorekeeperStorekeeper.AsString := fmEditPost.Storekeeper.EditText;
    qu_StorekeeperCheck1.AsBoolean := fmEditPost.Use_StoreKeeper.Checked;
    dmDataModule.quWork.Close;
   end;
end;


procedure TfmEditPost.qu_Post_BanBeforePost(DataSet: TDataSet);
begin
  if qu_Post_Ban.State = dsInsert then
  begin
    qu_Post_BanPostNo.AsInteger :=  MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_Post_BanDescription.AsString := fmEditPost.BanDescription.EditText;
    qu_Post_BanCheck1.AsBoolean := fmEditPost.Use_Post_Ban.Checked;
  end;
  if qu_Post_Ban.State = dsEdit then
   begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select ID from Post_Ban_Return where PostNo=:PostNo');
    dmDataModule.quWork.ParamByName('PostNo').AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    dmDataModule.quWork.Open;
//    qu_Post_BanID.AsInteger := dmDataModule.quWork.FieldByName('ID').AsInteger;
    qu_Post_BanPostNo.AsInteger :=  MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_Post_BanDescription.AsString := fmEditPost.BanDescription.EditText;
    qu_Post_BanCheck1.AsBoolean := fmEditPost.Use_Post_Ban.Checked;
    dmDataModule.quWork.Close;
   end;
end;


procedure TfmEditPost.qu_Post_MailBeforePost(DataSet: TDataSet);


begin

  if qu_Post_Mail.State = dsInsert then
  begin
    if AddessPostForMail.Text = '' then raise Exception.Create('Не выбран адрес доставки!' + #10#13 +'Сделайте выбор адреса доставки!');
    qu_Post_MailPostNo.AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_Post_MailMail1.AsString := fmEditPost.Mail1.EditText;
    qu_Post_MailMail2.AsString := fmEditPost.Mail2.EditText;
    qu_Post_MailMail3.AsString := fmEditPost.Mail3.EditText;
    qu_Post_MailTopic.AsString := fmEditPost.TopicMail.EditText;
    qu_Post_MailMessage.AsString := fmEditPost.Message.Text;

 //   showmessage(dblc_AddessPostForMail.KeyValue);

    qu_Post_MailAddressNo.AsInteger := AddessPostForMail.KeyValue;
  end;
  if qu_Post_Mail.State = dsEdit then
  begin
    if AddessPostForMail.Text = '' then raise Exception.Create('Не выбран адрес доставки!' + #10#13 +'Сделайте выбор адреса доставки!');
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select ID from Post_Mail where PostNo=:PostNo and AddressNo = :AddressNo');
    dmDataModule.quWork.ParamByName('PostNo').AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    dmDataModule.quWork.ParamByName('AddressNo').AsInteger := fmEditPost.AddessPostForMail.KeyValue;
    dmDataModule.quWork.Open;
    qu_Post_MailID.AsInteger := dmDataModule.quWork.FieldByName('ID').AsInteger;
    qu_Post_MailPostNo.AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_Post_MailMail1.AsString := fmEditPost.Mail1.EditText;
    qu_Post_MailMail2.AsString := fmEditPost.Mail2.EditText;
    qu_Post_MailMail3.AsString := fmEditPost.Mail3.EditText;
    qu_Post_MailTopic.AsString := fmEditPost.TopicMail.EditText;
    qu_Post_MailMessage.AsString := fmEditPost.Message.Text;
    qu_Post_MailAddressNo.AsInteger := fmEditPost.AddessPostForMail.KeyValue;
    dmDataModule.quWork.Close;
  end;
 {
    qu_Post_Mail.Close;
    qu_Post_Mail.ParamByName('p_PostNo').Value := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_Post_Mail.ParamByName('AddressNo').AsInteger := fmEditPost.AddessPostForMail.KeyValue;
    qu_Post_Mail.Open;

    Mail1.Refresh;
    Mail2.Refresh;
    Mail3.Refresh;
    TopicMail.Refresh;
    Message.Refresh;
    }
end;

procedure TfmEditPost.qu_Post_MailAfterPost(DataSet: TDataSet);
begin
  inherited;
    qu_Post_Mail.Close;
    qu_Post_Mail.ParamByName('p_PostNo').Value := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_Post_Mail.ParamByName('AddressNo').AsInteger := fmEditPost.AddessPostForMail.KeyValue;
    qu_Post_Mail.Open;

    Mail1.Refresh;
    Mail2.Refresh;
    Mail3.Refresh;
    TopicMail.Refresh;
    Message.Refresh;
end;

procedure TfmEditPost.RxDBGrid1Exit(Sender: TObject);
var Rec : TBookmarkStr;
    ListControlRequiredData, ListControlRequiredDataTemp : String;
    is_Post : boolean;
    i,j : integer;

begin
  is_Post := true;

  fmEditPost.quAddressPostForCheck.Close;
  fmEditPost.quAddressPostForCheck.Open;
  if fmEditPost.quAddressPostForCheck.RecordCount = 0 then is_save := true;
  fmEditPost.quAddressPostForCheck.First;
//  fmEditPost.quAddressPost.First;


  if StopControlRequiredData = false then 
  while (not fmEditPost.quAddressPostForCheck.Eof) do
   if (fmEditPost.quAddressPostForCheckActive.AsBoolean = true) then
   begin
     i := 0;
     ListControlRequiredDataTemp := '';

     ListControlRequiredDataTemp := quAddressPostForCheckAddress.Value + ':'+ #10#13;

     if ((fmEditPost.quAddressPostForCheckCategoryName.Value = '') or ((fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value) and (fmEditPost.quAddressPostCategoryName.Value = ''))) and (isInsertMode <> true) then
      begin
        ListControlRequiredDataTemp := ListControlRequiredDataTemp + ' Не заполнено обязательное поле Категория ТТ!'+ #10#13;
        i := i + 1;
        if (fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value)
         and (fmEditPost.quAddressPostCategoryName.Value <> '') then
         begin
           Delete(ListControlRequiredDataTemp,Pos(ListControlRequiredDataTemp,' Не заполнено обязательное поле Категория ТТ!'+ #10#13),Length(ListControlRequiredDataTemp));
           i := i - 1;
         end;
      end;
     if ((fmEditPost.quAddressPostForCheckTimeBeg.Value = '') or ((fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value) and (fmEditPost.quAddressPostTimeBeg.Value = '')) and (isInsertMode <> true)) then
      begin
        ListControlRequiredDataTemp := ListControlRequiredDataTemp + ' Не заполнено обязательное поле Работа с!'+ #10#13;
        i := i + 1;
        if (fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value)
         and (fmEditPost.quAddressPostTimeBeg.Value <> '') then
         begin
           Delete(ListControlRequiredDataTemp,Pos(ListControlRequiredDataTemp,' Не заполнено обязательное поле Работа с!'+ #10#13),Length(ListControlRequiredDataTemp));
           i := i - 1;
         end;
      end;
     if ((fmEditPost.quAddressPostForCheckTimeEnd.Value = '') or ((fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value) and (fmEditPost.quAddressPostTimeEnd.Value = '')) and (isInsertMode <> true)) then
      begin
        ListControlRequiredDataTemp := ListControlRequiredDataTemp + ' Не заполнено обязательное поле Работа по!'+ #10#13;
        i := i + 1;
        if (fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value)
         and (fmEditPost.quAddressPostTimeEnd.Value <> '') then
         begin
           Delete(ListControlRequiredDataTemp,Pos(ListControlRequiredDataTemp,' Не заполнено обязательное поле Работа по!'+ #10#13),Length(ListControlRequiredDataTemp));
           i := i - 1;
         end;
      end;
     if ((fmEditPost.quAddressPostForCheckUnloading.Value = 0) or (fmEditPost.quAddressPostForCheckUnloading.IsNull)) or ((fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value) and ((fmEditPost.quAddressPostUnloading.Value = 0) or (fmEditPost.quAddressPostUnloading.IsNull))) then
      if isInsertMode <> true then begin
                                     ListControlRequiredDataTemp := ListControlRequiredDataTemp + ' Не заполнено обязательное поле Разгрузка(мин.)!'+ #10#13;
                                     i := i + 1;
                                     if (fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value)
                                      and (fmEditPost.quAddressPostUnloading.Value <> 0) then
                                      begin
                                        Delete(ListControlRequiredDataTemp,Pos(ListControlRequiredDataTemp,' Не заполнено обязательное поле Разгрузка(мин.)!'+ #10#13),Length(ListControlRequiredDataTemp));
                                        i := i - 1;
                                      end;
                                   end;
     if ((fmEditPost.quAddressPostForCheckRegionNo.Value = 0) or ((fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value) and (fmEditPost.quAddressPostRegionNo.Value = 0)) and (isInsertMode <> true)) then
      begin
        ListControlRequiredDataTemp := ListControlRequiredDataTemp + ' Не заполнено обязательное поле Район!'+ #10#13;
        i := i + 1;
        if (fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value)
         and (fmEditPost.quAddressPostRegionNo.Value <> 0) then
         begin
           Delete(ListControlRequiredDataTemp,Pos(ListControlRequiredDataTemp,' Не заполнено обязательное поле Район!'+ #10#13),Length(ListControlRequiredDataTemp));
           i := i - 1;
         end;
      end;
     if ((fmEditPost.quAddressPostForCheckCity.Value = '') or ((fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value) and (fmEditPost.quAddressPostCity.Value = '')) and (isInsertMode <> true)) then
      begin
        ListControlRequiredDataTemp := ListControlRequiredDataTemp + ' Не заполнено обязательное поле Город!'+ #10#13;
        i := i +1;
        if (fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value)
         and (fmEditPost.quAddressPostCity.Value <> '') then
         begin
           Delete(ListControlRequiredDataTemp,Pos(ListControlRequiredDataTemp,' Не заполнено обязательное поле Город!'+ #10#13),Length(ListControlRequiredDataTemp));
           i := i - 1;
         end;
      end;
     if ((fmEditPost.quAddressPostForCheckStreet.Value = '') or ((fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value) and (fmEditPost.quAddressPostStreet.Value = '')) and (isInsertMode <> true)) then
      begin
        ListControlRequiredDataTemp := ListControlRequiredDataTemp + ' Не заполнено обязательное поле Улица!'+ #10#13;
        i := i +1;
        if (fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value)
         and (fmEditPost.quAddressPostStreet.Value <> '') then
         begin
           Delete(ListControlRequiredDataTemp,Pos(ListControlRequiredDataTemp,' Не заполнено обязательное поле Улица!'+ #10#13),Length(ListControlRequiredDataTemp));
           i := i - 1;
         end;
      end;
     if ((fmEditPost.quAddressPostForCheckHouseNo.Value = '') or ((fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value) and (fmEditPost.quAddressPostHouseNo.Value = '')) and (isInsertMode <> true)) then
      begin
        ListControlRequiredDataTemp := ListControlRequiredDataTemp + ' Не заполнено обязательное поле № Дома!'+ #10#13;
        i := i + 1;
        if (fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value)
         and (fmEditPost.quAddressPostHouseNo.Value <> '') then
         begin
           Delete(ListControlRequiredDataTemp,Pos(ListControlRequiredDataTemp,' Не заполнено обязательное поле № Дома!'+ #10#13),Length(ListControlRequiredDataTemp));
           i := i - 1;
         end;
      end;
     if ((fmEditPost.quAddressPostForCheckX.Value = '') or ((fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value) and (fmEditPost.quAddressPostX.Value = '')) and (isInsertMode <> true)) then
      begin
        ListControlRequiredDataTemp := ListControlRequiredDataTemp + ' Не заполнено обязательное поле Широта'+ #10#13;
        i := i + 1;
        if (fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value)
         and (fmEditPost.quAddressPostX.Value <> '') then
         begin
           Delete(ListControlRequiredDataTemp,Pos(ListControlRequiredDataTemp,' Не заполнено обязательное поле Широта'+ #10#13),Length(ListControlRequiredDataTemp));
           i := i - 1;
         end;
      end;
     if ((fmEditPost.quAddressPostForCheckY.Value = '') or ((fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value) and (fmEditPost.quAddressPostY.Value = '')) and (isInsertMode <> true)) then
      begin
        ListControlRequiredDataTemp := ListControlRequiredDataTemp + ' Не заполнено обязательное поле Долгота'+ #10#13;
        i := i + 1;
        if (fmEditPost.quAddressPostForCheckId.Value = fmEditPost.quAddressPostId.Value)
         and (fmEditPost.quAddressPostY.Value <> '') then
         begin
           Delete(ListControlRequiredDataTemp,Pos(ListControlRequiredDataTemp,' Не заполнено обязательное поле Долгота'+ #10#13),Length(ListControlRequiredDataTemp));
           i := i - 1;
         end;
      end;

     if i > 0 then ListControlRequiredData := ListControlRequiredData + ListControlRequiredDataTemp + #10#13;

     fmEditPost.quAddressPostForCheck.Next;
   end
   else fmEditPost.quAddressPostForCheck.Next;

  if ((fmEditPost.quAddressPostY.Value = '')or(fmEditPost.quAddressPostX.Value = '')or(fmEditPost.quAddressPostHouseNo.Value = '')or
       (fmEditPost.quAddressPostStreet.Value = '')or(fmEditPost.quAddressPostCity.Value = '')or(fmEditPost.quAddressPostRegionNo.Value = 0)or
       (fmEditPost.quAddressPostTimeEnd.Value = '')or(fmEditPost.quAddressPostTimeBeg.Value = '')or(fmEditPost.quAddressPostCategoryName.Value = '')or
       (fmEditPost.quAddressPostUnloading.Value = 0)) then j := 1 else j := 0;

  if (ListControlRequiredData <> '') and (is_save = true) then begin
                                                                 ShowMessage(' Не заполнены обязательные поля: ' + #10#13 + ListControlRequiredData + #10#13 +
                                                                             ' Данные сохранены не будут!');
                                                                 is_Post := false;
                                                                 if j = 0 then ActiveControl := RxDBGrid1;
                                                                 if j <> 0 then ActiveControl := GroupBoxAddressPostProp;
                                                               end;

  if (ListControlRequiredData = '') then CountNotRequiredData := 0;
  if (quAddressPost.State in [dsInsert, dsEdit]) and (is_save = true) and (is_Post = true) then quAddressPost.Post else quAddressPost.Cancel;
//  if (quAddressPost.State in [dsInsert, dsEdit]) and (is_save = false) then quAddressPost.Cancel;
  Rec:=quAddressPost.Bookmark;
  quAddressPost.DisableControls;
  ActionViewRefAddress.Execute;
  quAddressPost.Bookmark:=Rec;
  quAddressPost.EnableControls;
end;

procedure TfmEditPost.DBGridEh3Exit(Sender: TObject);
begin
  if (Tsotrud_address.State in [dsInsert, dsEdit]) and (is_save = true) then Tsotrud_address.Post else Tsotrud_address.Cancel;
end;

procedure TfmEditPost.DBGridEh2Exit(Sender: TObject);
begin
  if (qu_prop.State in [dsInsert, dsEdit]) and (is_save = true) then qu_prop.Post else qu_prop.Cancel;
end;

procedure TfmEditPost.quAddressPostBeforeOpen(DataSet: TDataSet);
begin
  quAddressPost.ParamByName('PostNo').AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
  quAddressPost.ParamByName('DateDeperture').AsDateTime := GlobalDateNakl;
  quAddressPost.ParamByName('IsAllAddress').Value := cbIsAllAddress.Checked;
  
end;


procedure TfmEditPost.FormCreate(Sender: TObject);
begin
  inherited;

  pgc.ActivePageIndex := 0;
  EditName.ReadOnly := EditPostUser;
  EditNameLong.ReadOnly := EditPostUser;
  EditOKPO.ReadOnly := EditPostUser;
  EditAddress.ReadOnly := EditPostUser;
  EditPhone.ReadOnly := EditPostUser;
  EditNoSvidNDS.ReadOnly := EditPostUser;
  EditCodeNds.ReadOnly := EditPostUser;
  EditRS.ReadOnly := EditPostUser;
  EditMFO.ReadOnly := EditPostUser;
  EditNameBank.ReadOnly := EditPostUser;
  deAddressBank.ReadOnly := EditPostUser;
  deDayDelay.ReadOnly := EditPostUser;
  deContact.ReadOnly := EditPostUser;
  deCategorName.ReadOnly := EditPostUser;
  // RxDBGrid1.ReadOnly:=EditPostUser;
  cbNotPlatNDS.ReadOnly := EditPostUser;
  cbPrint.ReadOnly := EditPostUser;
  cbAccountCash.ReadOnly := EditPostUser;
  cbExport1C.ReadOnly := EditPostUser;

end;

procedure TfmEditPost.FormShow(Sender: TObject);
begin
  inherited;
  fmEditPost.ActiveControl := EditName;

  if cbExport1C.Checked then
  begin
    cbExport1C.Checked := False;
    cbExport1C.Checked := True;
  end
  else
  begin
    cbExport1C.Checked := True;
    cbExport1C.Checked := False;
  end;



  ////////////////////////////////////////////////////////////////////////////
  //  блокировка изменений, у кого не стоит галочка "разрешить редактирование партнеров"
  if (UserAccessToEditingPublishers = False) Then
  Begin

  Panel6.Enabled := False;
  PanelBoolProp.Enabled := False;
//  RxDBGrid1.Enabled := False;
  RxDBGrid1.ReadOnly := True;
  Panel4.Enabled := False;
  DBGridEh1.Enabled := False;
  FrmDelayPay.Enabled := False;
  FrmSetPriceType.Enabled := False;
  MailGroupBox.Visible := False;
  cbToMail.Enabled := False;

  END
  ELSE IF (UserAccessToEditingPublishers = True) Then
  Begin

  Panel6.Enabled := True;
  PanelBoolProp.Enabled := True;
  RxDBGrid1.Enabled := True;
  Panel4.Enabled := True;
  DBGridEh1.Enabled := True;
  FrmDelayPay.Enabled := True;
  FrmSetPriceType.Enabled := True;
  MailGroupBox.Visible := False;
  cbToMail.Enabled := True;
  RxDBGrid1.Enabled := True;
  if IsEditRequiredData = true then begin
                                      pgc.ActivePageIndex := 1;
                                      fmEditPost.ActiveControl := RxDBGrid1;
                                    end;
  END;

  ///////////////////////////////////////////////////////////////////////////



end;

procedure TfmEditPost.Use_PriceKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if (Key <> 'Y') and (Key <> 'N') then    // ??? ?????????? ?????? ?????? ? ??
Key:=#0;
end;

procedure TfmEditPost.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
if (((Use_Price.Text = '') or (Edit_Price.Text = '')) and (EditName.Text <> '')) then
begin
  MessageDlg('           '+'  Внимание! '+#10#13+
  'Заполните поля "Цены справочника" и "Редактировать цены"'+#10#13+
  'за помощью обратитесь к юристу или к финансовому директору.'+#10#13+
  'Для выхода без заполнения шаблона полностью удалите название партнера и нажмите "Отмена"' ,mtWarning,[mbOK],0);
Action:=caNone;
isInsertMode:=false;
end;
    end;
{
procedure TfmEditPost.btn1Click(Sender: TObject);
begin
  inherited;
  ShowMessage(inttostr(qu_Storekeeper.RecordCount));
end;
}




procedure TfmEditPost.cbToMailClick(Sender: TObject);
begin
  inherited;
  if cbToMail.Checked then MailGroupBox.Visible := true
                      else MailGroupBox.Visible := false;
end;

procedure TfmEditPost.Mail1Exit(Sender: TObject);
begin
  inherited;
  if Mail1.Text = '' then
   begin
     Mail2.ReadOnly := true;
     Mail2.Color := clSilver;
     Mail3.ReadOnly := true;
     Mail3.Color := clSilver;
     TopicMail.ReadOnly := true;
     TopicMail.Color := clSilver;
     Message.ReadOnly := true;
     Message.Color := clSilver;
   end
   else
   begin
     Mail2.ReadOnly := false;
     Mail2.Color := clWindow;
     TopicMail.ReadOnly := false;
     TopicMail.Color := clWindow;
     Message.ReadOnly := false;
     Message.Color := clWindow;;
   end;
end;



procedure TfmEditPost.Mail2Exit(Sender: TObject);
begin
  inherited;
  if Mail2.Text = '' then
   begin
     Mail3.ReadOnly := True;
     Mail3.Color := clSilver;
   end
   else
   begin
     Mail3.ReadOnly := False;
     Mail3.Color := clWindow;
   end;
end;

procedure TfmEditPost.Mail3Exit(Sender: TObject);
begin
  inherited;
  if Mail3.Text = '' then
   begin
     Mail3.ReadOnly := True;
     Mail3.Color := clSilver;
   end
   else
   begin
     Mail3.ReadOnly := False;
     Mail3.Color := clWindow;
   end;
end;

procedure TfmEditPost.AddessPostForMailExit(Sender: TObject);
var
  QuPostCheck : TMSQuery;
begin
  inherited;

  QuPostCheck:=TMSQuery.Create(nil);
  QuPostCheck.Connection:=dmDataModule.DB;
  QuPostCheck.SQL.Clear;
  QuPostCheck.SQL.Text:='select *'
                     +'  from Post_Mail '
                     +'   where PostNo = :PostNo '
                     +'     and AddressNo = :AddressNo ';
  QuPostCheck.Prepare;

  QuPostCheck.ParamByName('PostNo').Value := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
  QuPostCheck.ParamByName('AddressNo').Value := fmEditPost.AddessPostForMail.KeyValue;
  QuPostCheck.Open;
  if QuPostCheck.RecordCount =0 then
  begin
{
    qu_Post_MailPostNo.AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_Post_MailMail1.AsString := fmEditPost.Mail1.EditText;
    qu_Post_MailMail2.AsString := fmEditPost.Mail2.EditText;
    qu_Post_MailMail3.AsString := fmEditPost.Mail3.EditText;
    qu_Post_MailTopic.AsString := fmEditPost.TopicMail.EditText;
    qu_Post_MailMessage.AsString := fmEditPost.Message.Text;
    qu_Post_MailAddressNo.AsInteger := fmEditPost.AddessPostForMail.KeyValue;
 }
    qu_Post_Mail.insert;
  end;

  QuPostCheck.Close;
//  qu_Post_Mail.Refresh;
{


 }
end;





procedure TfmEditPost.AddessPostForMailChange(Sender: TObject);
begin
  inherited;
    fmEditPost.qu_Post_Mail.Close;
    fmEditPost.qu_Post_Mail.ParamByName('p_PostNo').Value := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.qu_Post_Mail.ParamByName('AddressNo').Value := fmEditPost.AddessPostForMail.KeyValue;
    fmEditPost.qu_Post_Mail.Open;

    Mail1.Text := fmEditPost.qu_Post_Mail.FieldByName('Mail1').AsString;
    Mail2.Text := fmEditPost.qu_Post_Mail.FieldByName('Mail2').AsString;
    Mail3.Text := fmEditPost.qu_Post_Mail.FieldByName('Mail3').AsString;
    TopicMail.Text := fmEditPost.qu_Post_Mail.FieldByName('Topic').AsString;
    Message.Text := fmEditPost.qu_Post_Mail.FieldByName('Message').AsString;
end;



procedure TfmEditPost.quPostBanPayBeforePost(DataSet: TDataSet);
begin
  inherited;
  quPostBanPaySET_ARTICLE_GROUP_ID_PayBan.AsLargeInt := fmEditPost.Set_Article_Group.KeyValue - quPostBanPayBuh.Value;
  quPostBanPayPostNo_PayBan.AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
  quPostBanPayPayBan.AsInteger := fmEditPost.DBEditPostBanPay.Field.AsInteger;
 end;


procedure TfmEditPost.Set_Article_GroupChange(Sender: TObject);
begin
  inherited;
{    fmEditPost.quPostBanPay.Close;
    fmEditPost.quPostBanPay.Params.ParamByName('p_PostNo').Value :=fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    fmEditPost.quPostBanPay.Params.ParamByName('Set_Article_Group_Id_PayBan').Value := fmEditPost.Set_Article_Group.KeyValue;
    fmEditPost.quPostBanPay.Open;
}
    fmEditPost.Refresh;

//    showmessage(floattostr(fmEditPost.Set_Article_Group.KeyValue));
end;





procedure TfmEditPost.qu_ShipperBeforePost(DataSet: TDataSet);
begin
   if qu_Shipper.State = dsInsert then
  begin
    qu_ShipperPostNo.AsInteger :=  MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_ShipperShipper.AsString := fmEditPost.Shipper.EditText;
    qu_ShipperShipperOKPO.AsString := fmEditPost.ShipperOKPO.EditText;
    qu_ShipperCheck1.AsBoolean := fmEditPost.Use_Shipper.Checked;
  end;
  if qu_Shipper.State = dsEdit then
   begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select ID from Shipper_List where PostNo=:PostNo');
    dmDataModule.quWork.ParamByName('PostNo').AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    dmDataModule.quWork.Open;
    qu_ShipperID.AsInteger := dmDataModule.quWork.FieldByName('ID').AsInteger;
    qu_ShipperPostNo.AsInteger :=  MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_ShipperShipper.AsString := fmEditPost.Shipper.EditText;
    qu_ShipperShipperOKPO.AsString := fmEditPost.ShipperOKPO.EditText;
    qu_ShipperCheck1.AsBoolean := fmEditPost.Use_Shipper.Checked;
    dmDataModule.quWork.Close;
   end;

end;

procedure TfmEditPost.qu_CustomerBeforePost(DataSet: TDataSet);
begin
     if qu_Customer.State = dsInsert then
  begin
    qu_CustomerPostNo.AsInteger :=  MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_CustomerCustomer.AsString := fmEditPost.Customer.EditText;
    qu_CustomerCustomerOKPO.AsString := fmEditPost.Customer.EditText;
    qu_CustomerCheck1.AsBoolean := fmEditPost.Use_Customer.Checked;
  end;
  if qu_Customer.State = dsEdit then
   begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select ID from Customer_List where PostNo=:PostNo');
    dmDataModule.quWork.ParamByName('PostNo').AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    dmDataModule.quWork.Open;
    qu_CustomerID.AsInteger := dmDataModule.quWork.FieldByName('ID').AsInteger;
    qu_CustomerPostNo.AsInteger :=  MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_CustomerCustomer.AsString := fmEditPost.Customer.EditText;
    qu_CustomerCustomerOKPO.AsString := fmEditPost.CustomerOKPO.EditText;
    qu_CustomerCheck1.AsBoolean := fmEditPost.Use_Customer.Checked;
    dmDataModule.quWork.Close;
   end;

end;

procedure TfmEditPost.RxDBGrid1Columns3EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  inherited;
  begin
    if not (quAddressPost.State in [dsInsert, dsEdit]) then quAddressPost.Edit;
      with TCategoryTTForm.Create(Application) do
        try
          quCategoryTT.Open;

          quCategoryTTCategoryTTNo.ReadOnly := True;
          quCategoryTTCategoryTTName.ReadOnly := True;
          quCategoryTTActive.ReadOnly := True;

          StaticText1.Caption := 'Выберите категорию торговой точки';
          Label1.Visible := False;
          Label2.Visible := False;
          Label3.Visible := False;

          EnabledEvents := False;

          ShowModal;
        finally
          quAddressPostCategoryName.Value := quCategoryTTCategoryTTName.Value;
          quCategoryTT.Close;
          Free;
        end;
  end
end;

procedure TfmEditPost.qu_ConfidantBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qu_Confidant.State = dsInsert then
   begin
     qu_ConfidantPostNo.AsInteger :=  MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
     qu_ConfidantConfidant.AsString := fmEditPost.Confidant.EditText;
//     qu_ConfidantConfidantOKPO.AsString := fmEditPost.ConfidantOKPO.EditText;
     qu_ConfidantCheck1.AsBoolean := fmEditPost.Use_Confidant.Checked;
   end;
  if qu_Confidant.State = dsEdit then
   begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select ID from Shipper_List where PostNo=:PostNo');
    dmDataModule.quWork.ParamByName('PostNo').AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    dmDataModule.quWork.Open;
    qu_ConfidantID.AsInteger := dmDataModule.quWork.FieldByName('ID').AsInteger;
    qu_ConfidantPostNo.AsInteger :=  MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_ConfidantConfidant.AsString := fmEditPost.Confidant.EditText;
//    qu_ConfidantConfidantOKPO.AsString := fmEditPost.ConfidantOKPO.EditText;
    qu_ConfidantCheck1.AsBoolean := fmEditPost.Use_Confidant.Checked;
    dmDataModule.quWork.Close;
   end;

end;



procedure TfmEditPost.quDescriptionDjobSupplierBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  quDescriptionDjobSupplierPostNo.Value := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
  quDescriptionDjobSupplierDescriptionDjob.Value := DescriptionDjob.Text;
end;



procedure TfmEditPost.BDescriptionClick(Sender: TObject);
begin
  inherited;
  with TDescriptionNaklPostForm.Create(Application) do
      try
       ShowModal;
      finally
       Free;
      end;
end;



procedure TfmEditPost.DBCheckBoxEhExportInExcelFileMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
{
  if DBCheckBoxEhExportInExcelFile.Checked then begin
                                                  dmDataModule.quWork.SQL.Clear;
                                                  dmDataModule.quWork.SQL.Add('select count(*) as Cnt from L_VidExportExelFile where PostNo=:PostNo and Is_Checked = 1 and N_pp > 0');
                                                  dmDataModule.quWork.ParamByName('PostNo').AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
                                                  dmDataModule.quWork.Open;
                                                  if dmDataModule.quWork.FieldByName('Cnt').AsInteger = 0 then begin
                                                                                                                 ShowMessage (' Файл отправки не настроен!'+#10#13+
                                                                                                                              'Настройте файл отправки и повторите потітку!');
                                                                                                                 DBCheckBoxEhExportInExcelFile.Checked := false;
                                                                                                               end;

                                                end;
                                                }
end;

procedure TfmEditPost.DBCheckBoxEhExportInExcelFileClick(Sender: TObject);
begin
  inherited;
  if DBCheckBoxEhExportInExcelFile.Checked then begin
                                                  dmDataModule.quWork.SQL.Clear;
                                                  dmDataModule.quWork.SQL.Add('select count(*) as Cnt from L_VidExportExelFile where PostNo=:PostNo and Is_Checked = 1 and N_pp > 0');
                                                  dmDataModule.quWork.ParamByName('PostNo').AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
                                                  dmDataModule.quWork.Open;
                                                  if dmDataModule.quWork.FieldByName('Cnt').AsInteger = 0 then begin
                                                                                                                 ShowMessage (' Файл отправки не настроен!'+#10#13+
                                                                                                                              'Настройте файл отправки и повторите потітку!');
                                                                                                                 DBCheckBoxEhExportInExcelFile.Checked := false;
                                                                                                               end;

                                                end;
end;

procedure TfmEditPost.quVidExportExelFileBeforePost(DataSet: TDataSet);
begin
  inherited;
  quVidExportExelFilePostNo.Value := fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
end;

procedure TfmEditPost.quExportInExcelFileBeforePost(DataSet: TDataSet);
begin
  inherited;
  quExportInExcelFilePostNo.Value := fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
end;

procedure TfmEditPost.quAddressPostForCheckBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quAddressPostForCheck.ParamByName('PostNo').AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
  quAddressPostForCheck.ParamByName('DateDeperture').AsDateTime := GlobalDateNakl;
end;



procedure TfmEditPost.DBEditEhCategoryNameChange(Sender: TObject);
begin
  inherited;
  if DBEditEhCategoryName.Text = '' then DBEditEhCategoryName.Color := clRed
                                    else DBEditEhCategoryName.Color := clWindow;
end;

procedure TfmEditPost.DBEditEhTimeBegChange(Sender: TObject);
begin
  inherited;
  if DBEditEhTimeBeg.Text = '' then DBEditEhTimeBeg.Color := clRed
                               else DBEditEhTimeBeg.Color := clWindow;
end;

procedure TfmEditPost.DBEditEhTimeEndChange(Sender: TObject);
begin
  inherited;
  if DBEditEhTimeEnd.Text = '' then DBEditEhTimeEnd.Color := clRed
                               else DBEditEhTimeEnd.Color := clWindow;
end;

procedure TfmEditPost.DBEditEhUnloadingChange(Sender: TObject);
begin
  inherited;
  if DBEditEhUnloading.Text = '' then DBEditEhUnloading.Color := clRed
                                 else DBEditEhUnloading.Color := clWindow;
end;

procedure TfmEditPost.DBLookupComboboxEhRegionNoChange(Sender: TObject);
begin
  inherited;
  if DBLookupComboboxEhRegionNo.Text = '' then DBLookupComboboxEhRegionNo.Color := clRed
                                          else DBLookupComboboxEhRegionNo.Color := clWindow;
end;

procedure TfmEditPost.DBEditEhCityChange(Sender: TObject);
begin
  inherited;
  if DBEditEhCity.Text = '' then DBEditEhCity.Color := clRed
                            else DBEditEhCity.Color := clWindow;
end;

procedure TfmEditPost.DBEditEhStreetChange(Sender: TObject);
begin
  inherited;
  if DBEditEhStreet.Text = '' then DBEditEhStreet.Color := clRed
                              else DBEditEhStreet.Color := clWindow
end;

procedure TfmEditPost.DBEditEhHouseNoChange(Sender: TObject);
begin
  inherited;
  if DBEditEhHouseNo.Text = '' then DBEditEhHouseNo.Color := clRed
                               else DBEditEhHouseNo.Color := clWindow;
end;

procedure TfmEditPost.DBEditEhXChange(Sender: TObject);
begin
  inherited;
  if DBEditEhX.Text = '' then DBEditEhX.Color := clRed
                         else DBEditEhX.Color := clWindow;
end;

procedure TfmEditPost.DBEditEhYChange(Sender: TObject);
begin
  inherited;
  if DBEditEhY.Text = '' then DBEditEhY.Color := clRed
                         else DBEditEhY.Color := clWindow;
end;

procedure TfmEditPost.DBEditEhCategoryNameCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
begin
  inherited;
  if DBEditEhCategoryName.Text = '' then DBEditEhCategoryName.Color := clRed
                                    else DBEditEhCategoryName.Color := clWindow;
end;

procedure TfmEditPost.DBEditEhTimeBegCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
begin
  inherited;
  if DBEditEhTimeBeg.Text = '' then DBEditEhTimeBeg.Color := clRed
                               else DBEditEhTimeBeg.Color := clWindow;
end;

procedure TfmEditPost.DBEditEhTimeEndCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
begin
  inherited;
  if DBEditEhTimeEnd.Text = '' then DBEditEhTimeEnd.Color := clRed
                               else DBEditEhTimeEnd.Color := clWindow;
end;

procedure TfmEditPost.DBEditEhUnloadingCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
begin
  inherited;
  if DBEditEhUnloading.Text = '' then DBEditEhUnloading.Color := clRed
                                 else DBEditEhUnloading.Color := clWindow;
end;

procedure TfmEditPost.DBLookupComboboxEhRegionNoCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
begin
  inherited;
  if DBLookupComboboxEhRegionNo.Text = '' then DBLookupComboboxEhRegionNo.Color := clRed
                                          else DBLookupComboboxEhRegionNo.Color := clWindow;
end;

procedure TfmEditPost.DBEditEhCityCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  inherited;
  if DBEditEhCity.Text = '' then DBEditEhCity.Color := clRed
                            else DBEditEhCity.Color := clWindow;
end;

procedure TfmEditPost.DBEditEhStreetCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  inherited;
   if DBEditEhStreet.Text = '' then DBEditEhStreet.Color := clRed
                              else DBEditEhStreet.Color := clWindow;
end;

procedure TfmEditPost.DBEditEhHouseNoCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
begin
  inherited;
  if DBEditEhHouseNo.Text = '' then DBEditEhHouseNo.Color := clRed
                               else DBEditEhHouseNo.Color := clWindow;
end;



procedure TfmEditPost.DBEditEhXCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  inherited;
  if DBEditEhX.Text = '' then DBEditEhX.Color := clRed
                         else DBEditEhX.Color := clWindow;
end;

procedure TfmEditPost.DBEditEhYCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  inherited;
  if DBEditEhY.Text = '' then DBEditEhY.Color := clRed
                         else DBEditEhY.Color := clWindow;
end;

procedure TfmEditPost.GroupBoxAddressPostPropExit(Sender: TObject);
begin
  inherited;
  if((DBEditEhY.Text = '')or(DBEditEhX.Text = '')or(DBEditEhHouseNo.Text = '')or
     (DBEditEhStreet.Text = '')or(DBEditEhCity.Text = '')or(DBLookupComboboxEhRegionNo.Text = '')or
     (DBEditEhUnloading.Text = '')or(DBEditEhTimeEnd.Text = '')or(DBEditEhTimeBeg.Text = '')or
     (DBEditEhCategoryName.Text = '')) and (is_save = true) and (StopControlRequiredData = false) then begin
                                              ShowMessage ('Заполнены не все обязательные поля!'+ #10#13 +
                                                           'Для продолжения необходимо заполнить все обязательные поля!');
//                                              quAddressPost.Cancel;
//                                              is_Post := false;
                                              ActiveControl := GroupBoxAddressPostProp;
                                            end;
  if not ((DBEditEhY.Text = '')or(DBEditEhX.Text = '')or(DBEditEhHouseNo.Text = '')or
          (DBEditEhStreet.Text = '')or(DBEditEhCity.Text = '')or(DBLookupComboboxEhRegionNo.Text = '')or
          (DBEditEhUnloading.Text = '')or(DBEditEhTimeEnd.Text = '')or(DBEditEhTimeBeg.Text = '')or
          (DBEditEhCategoryName.Text = '')) and (CountNotRequiredData > 0) and (is_save = true) and (StopControlRequiredData = false) then ActiveControl := RxDBGrid1;

  if not ((DBEditEhY.Text = '')or(DBEditEhX.Text = '')or(DBEditEhHouseNo.Text = '')or
          (DBEditEhStreet.Text = '')or(DBEditEhCity.Text = '')or(DBLookupComboboxEhRegionNo.Text = '')or
          (DBEditEhUnloading.Text = '')or(DBEditEhTimeEnd.Text = '')or(DBEditEhTimeBeg.Text = '')or
          (DBEditEhCategoryName.Text = '')) and (is_save = true) then if (quAddressPost.State in [dsInsert, dsEdit]) then quAddressPost.Post;

  if StopControlRequiredData = true then if (quAddressPost.State in [dsInsert, dsEdit]) then quAddressPost.Post;
end;

procedure TfmEditPost.DBEditEhCategoryNameDblClick(Sender: TObject);
var
  Dlg : TCategoryTTForm;
begin
  inherited;

  if not (quAddressPost.State in [dsInsert, dsEdit]) then quAddressPost.Edit;

  Dlg := TCategoryTTForm.Create(Application);

  Dlg.quCategoryTT.Open;

  Dlg.quCategoryTTCategoryTTNo.ReadOnly := True;
  Dlg.quCategoryTTCategoryTTName.ReadOnly := True;
  Dlg.quCategoryTTActive.ReadOnly := True;

  Dlg.StaticText1.Caption := 'Выберите категорию торговой точки';
  Dlg.Label1.Visible := False;
  Dlg.Label2.Visible := False;
  Dlg.Label3.Visible := False;

  try
    if Dlg.ShowModal = mrok then begin
                                   quAddressPostCategoryName.Value := Dlg.quCategoryTTCategoryTTName.Value;
                                 end

  finally
    Dlg.quCategoryTT.Close;
    Dlg.Free;
  end;
  {
  begin
    if not (quAddressPost.State in [dsInsert, dsEdit]) then quAddressPost.Edit;
      with TCategoryTTForm.Create(Application) do
        try
          quCategoryTT.Open;

          quCategoryTTCategoryTTNo.ReadOnly := True;
          quCategoryTTCategoryTTName.ReadOnly := True;
          quCategoryTTActive.ReadOnly := True;

          StaticText1.Caption := 'Выберите категорию торговой точки';
          Label1.Visible := False;
          Label2.Visible := False;
          Label3.Visible := False;

          EnabledEvents := False;

          ShowModal;
        finally
          quAddressPostCategoryName.Value := quCategoryTTCategoryTTName.Value;
          quCategoryTT.Close;
          Free;
        end;
  end
}
end;

procedure TfmEditPost.DBEditEhClassifierNameDblClick(Sender: TObject);
var
  Dlg : TClassifierABCDZForm;
begin
  inherited;
  if not (quAddressPost.State in [dsInsert, dsEdit]) then quAddressPost.Edit;

  Dlg :=  TClassifierABCDZForm.Create(Application);
  dmDataModule.quClassifierABCDZ.Open;

  Dlg.StaticText1.Caption := 'Выберите выберите ABCDZ классификацию торговой точки';
  Dlg.Label1.Visible := False;
  Dlg.Label2.Visible := False;
  Dlg.Label3.Visible := False;

  try
    if Dlg.ShowModal = mrok then begin
                                   quAddressPostClassifierName.Value := dmDataModule.quClassifierABCDZClassifierName.Value;
                                 end

  finally
    dmDataModule.quClassifierABCDZ.Close;
    Dlg.Free;
  end;

{
  begin
    if not (quAddressPost.State in [dsInsert, dsEdit]) then quAddressPost.Edit;
      with TClassifierABCDZForm.Create(Application) do
        try
          dmDataModule.quClassifierABCDZ.Open;

          StaticText1.Caption := 'Выберите выберите ABCDZ классификацию торговой точки';
          Label1.Visible := False;
          Label2.Visible := False;
          Label3.Visible := False;

          EnabledEvents := False;

          ShowModal;
        finally
          quAddressPostClassifierName.Value := dmDataModule.quClassifierABCDZClassifierName.Value;
          dmDataModule.quClassifierABCDZ.Close;
          Free;
        end;
  end
}
end;



procedure TfmEditPost.DBEditEhSalesChannelsOfPepsicoDblClick(
  Sender: TObject);
var
  Dlg : TSalesChannelsOfPepsicoForm;
begin
  inherited;
  if not (quAddressPost.State in [dsInsert, dsEdit]) then quAddressPost.Edit;

  Dlg := TSalesChannelsOfPepsicoForm.Create(Application);

  dmDataModule.quSalesChannelsOfPepsico.Open;

  try
    if Dlg.ShowModal = mrok then begin
                                   quAddressPostCode.Value := dmDataModule.quSalesChannelsOfPepsicoCode.Value;
                                 end

  finally
    dmDataModule.quSalesChannelsOfPepsico.Close;
    Dlg.Free;
  end;
end;

procedure TfmEditPost.DBEditEhKOATUUDblClick(Sender: TObject);
var
  Dlg : TKOATUUForm;
begin
  inherited;
  if not (quAddressPost.State in [dsInsert, dsEdit]) then quAddressPost.Edit;

  Dlg := TKOATUUForm.Create(Application);

  dmDataModule.quKOATUU.Open;

  try
    if Dlg.ShowModal = mrok then begin
                                   quAddressPostKOATUU_ID_CODE.Value := dmDataModule.quKOATUUKOATUU_ID_CODE.Value;
                                 end

  finally
    dmDataModule.quKOATUU.Close;
    Dlg.Free;
  end;
end;

procedure TfmEditPost.DBEditEh1DblClick(Sender: TObject);
var
  Dlg : TAddressPost_CODE_Commerce_NetworkForm;
begin
  inherited;
  if not (quAddressPost.State in [dsInsert, dsEdit]) then quAddressPost.Edit;

  Dlg := TAddressPost_CODE_Commerce_NetworkForm.Create(Application);

  dmDataModule.quAddressPost_CODE_Commerce_Network.Open;

  try
    if Dlg.ShowModal = mrok then begin
                                   quAddressPostCommerce_Network.Value := dmDataModule.quAddressPost_CODE_Commerce_NetworkCode.Value;
                                 end

  finally
    dmDataModule.quAddressPost_CODE_Commerce_Network.Close;
    Dlg.Free;
  end;

end;

procedure TfmEditPost.cxDBLookupComboBox1PropertiesCloseUp(
  Sender: TObject);
begin
  inherited;
  if cxDBLookupComboBox1.Text = 'Удален' then dmDataModule.ExecSQL ('exec sp_SetFirmProp :p1_PostNo, :p2_Id, :p3_is_prop ', [fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger, 14, 1]);
  fmEditPost.DBGridEh2.Refresh;
end;

procedure TfmEditPost.qu_CarCarrierBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qu_CarCarrier.State = dsInsert then
  begin
    qu_CarCarrierPostNo.AsInteger :=  MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_CarCarrierCarCarrier.AsString := fmEditPost.CarCarrier.EditText;
    qu_CarCarrierCarCarrierOKPO.AsString := fmEditPost.CarCarrierOKPO.EditText;
    qu_CarCarrierCheck1.AsBoolean := fmEditPost.Use_CarCarrier.Checked;
  end;
  if qu_CarCarrier.State = dsEdit then
   begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select ID from CarCarrier_List where PostNo=:PostNo');
    dmDataModule.quWork.ParamByName('PostNo').AsInteger := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    dmDataModule.quWork.Open;
    qu_CarCarrierID.AsInteger := dmDataModule.quWork.FieldByName('ID').AsInteger;
    qu_CarCarrierPostNo.AsInteger :=  MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
    qu_CarCarrierCarCarrier.AsString := fmEditPost.CarCarrier.EditText;
    qu_CarCarrierCarCarrierOKPO.AsString := fmEditPost.CarCarrierOKPO.EditText;
    qu_CarCarrierCheck1.AsBoolean := fmEditPost.Use_CarCarrier.Checked;
    dmDataModule.quWork.Close;
   end;
end;

procedure TfmEditPost.Set_Article_GroupClick(Sender: TObject);
begin
  inherited;
  sp_CorrectPostPayBan.Close;
  sp_CorrectPostPayBan.ParamByName('PostNo').Value := MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
  sp_CorrectPostPayBan.Execute;
  quPostBanPay.Refresh;
end;

procedure TfmEditPost.Button1Click(Sender: TObject);
begin
  inherited;
  with TAddressPostActiveForm.Create(Application) do
   try
     quL_AddressPostActive.Close;
     quL_AddressPostActive.ParamByName('IdAddress').Value := quAddressPostId.Value;
     quL_AddressPostActive.Open;

     ShowModal;
   finally
     quL_AddressPostActive.Close;
     Free;
   end;
end;

procedure TfmEditPost.Tsotrud_addressBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  Tsotrud_address.ParamByName('IsAllSotrud').Value := cbIsAllSotrud.Checked;
end;

procedure TfmEditPost.Tsotrud_addressAfterPost(DataSet: TDataSet);
begin
  inherited;
  Tsotrud_address.Close;
  Tsotrud_address.Open;
end;

procedure TfmEditPost.quVidImportExelFileForNaklPAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  quVidImportExelFileForNaklP.Close;
  quVidImportExelFileForNaklP.Open;
end;


procedure TfmEditPost.qul_PostGroupCuttingBeforePost(DataSet: TDataSet);
begin
  inherited;
  qul_PostGroupCuttingPostNo.Value := fmEditPost.MLKCustomDm.quPost.FieldByName('PostNo').AsInteger;
end;

procedure TfmEditPost.DBGridEh5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_DELETE: if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then begin
                                                                                                            DmDataModule.OpenSQL('select * from l_PostGroupCutting where PostNo = :p1_PostNo',[MLKCustomDm.quPost.FieldByName('PostNo').AsInteger]);
                                                                                                            if DmDataModule.QFO.RecordCount > 0 then qul_PostGroupCutting.Delete;
                                                                                                          end;
  end;
end;

procedure TfmEditPost.qul_PostGroupCuttingAfterPost(DataSet: TDataSet);
var
 Id : int64;
begin
  inherited;
  Id := qul_PostGroupCuttingId.AsLargeInt;
  qul_PostGroupCutting.Close;
  qul_PostGroupCutting.Open;
  qul_PostGroupCutting.Locate('ID', Id, []);
end;

procedure TfmEditPost.quVidImportExelFileForBlanksAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  quVidImportExelFileForBlanks.Close;
  quVidImportExelFileForBlanks.Open;
end;

end.
