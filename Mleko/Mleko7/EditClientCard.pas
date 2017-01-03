unit EditClientCard;
   
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, StdCtrls, GridsEh, DBGridEh, ExtCtrls, ActnList,
  DB, MemDS, DBAccess, MSAccess, DBCtrls, Mask, DBCtrlsEh, DBLookupEh,
  Buttons;

type
  TEditClientCardForm = class(TCFLMLKCustomForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGridEhAddress: TDBGridEh;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGridEhSotrud: TDBGridEh;
    DBGridEhDelay: TDBGridEh;
    DBGridEhPrice: TDBGridEh;
    dsAddressPost: TMSDataSource;
    quAddressPost: TMSQuery;
    cbIsAllAddress: TCheckBox;
    cbIsAllSotrud: TCheckBox;
    dsSotrudAddress: TMSDataSource;
    quSotrudAddress: TMSQuery;
    dsDalay: TMSDataSource;
    quDalay: TMSQuery;
    quPrice: TMSQuery;
    dsPrice: TMSDataSource;
    quDalayNAME: TStringField;
    quDalayDAY_DELAY: TIntegerField;
    quDalayDAY_DELAY_EXT: TIntegerField;
    quDalayPayBan: TIntegerField;
    quPriceNAME: TStringField;
    quPriceColName: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    quDocClientCardHead: TMSQuery;
    dsDocClientCardHead: TMSDataSource;
    cbSotrud: TDBLookupComboboxEh;
    Label5: TLabel;
    dbtIdDoc: TDBText;
    dbtPostName: TDBText;
    dbtDocDate: TDBText;
    dbtUserName: TDBText;
    dbcbPrint3: TDBCheckBoxEh;
    dbcbTTN: TDBCheckBoxEh;
    GroupBox4: TGroupBox;
    DBGridEhSignature: TDBGridEh;
    dsListUserForVidDoc: TMSDataSource;
    quListUserForVidDoc: TMSQuery;
    quListUserForVidDocId: TIntegerField;
    quListUserForVidDocIdVidDoc: TIntegerField;
    quListUserForVidDocOtdelNo: TIntegerField;
    quListUserForVidDocUserNo: TIntegerField;
    quListUserForVidDocActive: TBooleanField;
    quListUserForVidDocOtdel: TStringField;
    quListUserForVidDocUser: TStringField;
    quDocClientCardHeadPostNo: TIntegerField;
    quDocClientCardHeadDocDate: TDateTimeField;
    quDocClientCardHeadUserNo: TIntegerField;
    quDocClientCardHeadSotrudNo: TIntegerField;
    quDocClientCardHeadPrint3: TBooleanField;
    quDocClientCardHeadTTN: TBooleanField;
    quDocClientCardHeadIsApp: TBooleanField;
    quDocClientCardHeadPostName: TStringField;
    quDocClientCardHeadSotrudName: TStringField;
    quDocClientCardHeadUserName: TStringField;
    quListUserForVidDocis_signature: TBooleanField;
    quDocClientCardHeadid: TIntegerField;
    quSotrudAddressAddressPost_id: TIntegerField;
    quSotrudAddressSotrudName: TStringField;
    quSotrudAddressOtdelName: TStringField;
    quSotrudAddressActive: TBooleanField;
    quSotrudAddressDateBegOnActive: TDateTimeField;
    quSotrudAddressDateEndOnActive: TDateTimeField;
    bbOK: TBitBtn;
    bbcancel: TBitBtn;
    quSotrudAddressSotrudNo: TSmallintField;
    cbIsDocSignature: TCheckBox;
    quAddressPostDocId: TIntegerField;
    quAddressPostApId: TIntegerField;
    quAddressPostPostNo: TIntegerField;
    quAddressPostAddressNo: TIntegerField;
    quAddressPostAddress: TStringField;
    quAddressPostActive: TBooleanField;
    quAddressPostRegionNo: TWordField;
    quAddressPostCity: TStringField;
    quAddressPostStreet: TStringField;
    quAddressPostHouseNo: TStringField;
    quAddressPostMarschrutNo: TSmallintField;
    quAddressPostTopic: TStringField;
    quAddressPostMessage: TStringField;
    quAddressPostMail1: TStringField;
    quAddressPostMail2: TStringField;
    quAddressPostMail3: TStringField;
    quAddressPostCar: TStringField;
    quAddressPostDriver: TStringField;
    quAddressPostDateDeparture: TDateTimeField;
    quAddressPostDegrees: TStringField;
    quAddressPostMminutes: TStringField;
    quAddressPostSeconds: TStringField;
    quAddressPostCoordinates: TBlobField;
    quAddressPostX: TStringField;
    quAddressPostY: TStringField;
    quAddressPostCategoryId: TIntegerField;
    quAddressPostCategoryName: TStringField;
    quAddressPostTimeBeg: TWideStringField;
    quAddressPostTimeEnd: TWideStringField;
    quAddressPostUnloading: TIntegerField;
    quAddressPostAddressPost: TStringField;
    quAddressPostAddressNoPost: TIntegerField;
    quAddressPostClassifierNo: TIntegerField;
    quAddressPostClassifierName: TStringField;
    quAddressPostKOATUU_ID_CODE: TStringField;
    quAddressPostCode: TIntegerField;
    quAddressPostCommerce_Network: TStringField;
    quAddressPostSpecialDelivery: TBooleanField;
    quAddressPostQuantityDelivery: TFloatField;
    quAddressPostRefrezherator: TBooleanField;
    quDalayPostNo: TIntegerField;
    quDalayBUH: TIntegerField;
    Panel4: TPanel;
    GroupBox5: TGroupBox;
    gbAdvancetProvAddress: TGroupBox;
    lbAddressNoPost: TLabel;
    DBEditEhAddressNoPost: TDBEditEh;
    lbAddressPost: TLabel;
    DBEditEhAddressPost: TDBEditEh;
    lbCategoryName: TLabel;
    DBEditEhCategoryName: TDBEditEh;
    lbTimeBeg: TLabel;
    DBEditEhTimeBeg: TDBEditEh;
    DBEditEhTimeEnd: TDBEditEh;
    lbUnloading: TLabel;
    DBEditEhUnloading: TDBEditEh;
    lbTimeEnd: TLabel;
    cbRefrezherator: TDBCheckBoxEh;
    lbQuantityDelivery: TLabel;
    DBEditEhQuantityDelivery: TDBEditEh;
    cbSpecialDelivery: TDBCheckBox;
    DBLookupComboboxEhRegionNo: TDBLookupComboboxEh;
    lbRegionName: TLabel;
    lbCity: TLabel;
    lbStreet: TLabel;
    lbHouseNo: TLabel;
    DBEditEhHouseNo: TDBEditEh;
    DBEditEhStreet: TDBEditEh;
    DBEditEhCity: TDBEditEh;
    lbCar: TLabel;
    DBEditEhCar: TDBEditEh;
    lbDriver: TLabel;
    DBEditEhDriver: TDBEditEh;
    lbX: TLabel;
    DBEditEhX: TDBEditEh;
    lbY: TLabel;
    DBEditEhY: TDBEditEh;
    lbDateDeparture: TLabel;
    DBEditEhDateDeparture: TDBEditEh;
    lbClassifierName: TLabel;
    DBEditEhClassifierName: TDBEditEh;
    lbMail1: TLabel;
    DBEditEhMail1: TDBEditEh;
    lbMail2: TLabel;
    DBEditEhMail2: TDBEditEh;
    lbMail3: TLabel;
    DBEditEhMail3: TDBEditEh;
    lbTopic: TLabel;
    DBEditEhTopic: TDBEditEh;
    lbMessage: TLabel;
    DBEditEhMessage: TDBEditEh;
    lbCode: TLabel;
    DBEditEhCode: TDBEditEh;
    lbKOATUU: TLabel;
    DBEditEhKOATUU: TDBEditEh;
    lbCommerce_Network: TLabel;
    DBEditEhCommerce_Network: TDBEditEh;
    quSotrudAddressDocId: TIntegerField;
    quDalayDocId: TIntegerField;
    quPriceDocId: TIntegerField;
    quAddressPostId: TLargeintField;
    quSotrudAddressid: TLargeintField;
    quSotrudAddressDsaId: TIntegerField;
    quDalayid: TLargeintField;
    quPriceid: TLargeintField;
    quPriceLpsagpId: TLargeintField;
    quPriceColNPrice: TSmallintField;
    quSotrudAddressSotrud: TStringField;
    quSotrudAddressOtdel: TStringField;
    quSotrudAddressOtdelNo: TIntegerField;
    quSotrudAddressSotrudOtdelName: TStringField;
    quSotrudAddressOtdelNom: TIntegerField;
    quDalaySetArticleGroupId: TLargeintField;
    quDSetArticleGroupId: TMSQuery;
    dsDSetArticleGroupId: TMSDataSource;
    quDSetArticleGroupIdID: TLargeintField;
    quDSetArticleGroupIdNAME: TStringField;
    quDSetArticleGroupIdACTIVE: TStringField;
    quDalayNameGroup: TStringField;
    quDBuhType: TMSQuery;
    dsDBuhType: TMSDataSource;
    quDBuhTypebuh: TSmallintField;
    quDBuhTypeBuh_type_name: TStringField;
    quDBuhTypeIS_FRACTION: TBooleanField;
    quDalayBuhName: TStringField;
    quPriceSetArticleGroupId: TLargeintField;
    quPricePostNo: TIntegerField;
    quPriceGroupName: TStringField;
    quPriceType: TMSQuery;
    dsPriceType: TMSDataSource;
    quPriceTypeColNPrice: TSmallintField;
    quPriceTypeColName: TStringField;
    quPriceTypeOtdelNo: TIntegerField;
    quPriceTypePRICE_LINE: TIntegerField;
    quPriceTypePARENT_COLNPRICE: TSmallintField;
    quPriceTypeFACTOR: TFloatField;
    quPriceTypetrash: TBooleanField;
    quPriceTypeFACTOR_BASE: TFloatField;
    quPriceTypeCOLNPRICE_BASE: TSmallintField;
    quPricePriceType: TStringField;
    quAddressPostisEdit: TBooleanField;
    cbIsEdit: TCheckBox;
    bbConductingDoc: TBitBtn;
    GroupBox6: TGroupBox;
    DBGridEhGroupCutting: TDBGridEh;
    dsDocClientCardPostGroupCuttingSpec: TMSDataSource;
    quDocClientCardPostGroupCuttingSpec: TMSQuery;
    quDocClientCardPostGroupCuttingSpecId: TLargeintField;
    quDocClientCardPostGroupCuttingSpecDocId: TIntegerField;
    quDocClientCardPostGroupCuttingSpecPostNo: TIntegerField;
    quDocClientCardPostGroupCuttingSpecGroupCuttingId: TIntegerField;
    quDocClientCardPostGroupCuttingSpecGroupCuttingVidNo: TIntegerField;
    quDocClientCardPostGroupCuttingSpecIsLock: TBooleanField;
    quDocClientCardPostGroupCuttingSpecGroupCuttingName: TStringField;
    quDocClientCardPostGroupCuttingSpecVidName: TStringField;
    quDalayCurrency: TStringField;
    dsCurrency: TMSDataSource;
    quCurrency: TMSQuery;
    quCurrencyName: TStringField;
    quCurrencyl_code: TStringField;
    quDalayCyrrencyName: TStringField;
    procedure quAddressPostBeforeOpen(DataSet: TDataSet);
    procedure quSotrudAddressBeforeOpen(DataSet: TDataSet);
    procedure quDalayBeforeOpen(DataSet: TDataSet);
    procedure quPriceBeforeOpen(DataSet: TDataSet);
    procedure DBGridEhAddressCellClick(Column: TColumnEh);
    procedure DBGridEhAddressKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbIsAllAddressClick(Sender: TObject);
    procedure cbIsAllSotrudClick(Sender: TObject);
    procedure Panel1Exit(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure bbcancelClick(Sender: TObject);
    procedure dbcbPrint3Click(Sender: TObject);
    procedure dbcbTTNClick(Sender: TObject);
    procedure DBGridEhSignatureDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure cbIsDocSignatureClick(Sender: TObject);
    procedure cbSotrudExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEditEhCategoryNameDblClick(Sender: TObject);
    procedure DBEditEhCodeDblClick(Sender: TObject);
    procedure DBEditEhKOATUUDblClick(Sender: TObject);
    procedure DBEditEhCommerce_NetworkDblClick(Sender: TObject);
    procedure quAddressPostBeforePost(DataSet: TDataSet);
    procedure quSotrudAddressBeforePost(DataSet: TDataSet);
    procedure quDalayBeforePost(DataSet: TDataSet);
    procedure DBEditEhAddressNoPostChange(Sender: TObject);
    procedure DBEditEhAddressNoPostCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhAddressPostChange(Sender: TObject);
    procedure DBEditEhAddressPostCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhCategoryNameChange(Sender: TObject);
    procedure DBEditEhCategoryNameCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhTimeBegChange(Sender: TObject);
    procedure DBEditEhTimeBegCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure dsAddressPostDataChange(Sender: TObject; Field: TField);
    procedure DBEditEhTimeEndChange(Sender: TObject);
    procedure DBEditEhTimeEndCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhUnloadingChange(Sender: TObject);
    procedure DBEditEhQuantityDeliveryChange(Sender: TObject);
    procedure DBEditEhUnloadingCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhQuantityDeliveryCheckDrawRequiredState(
      Sender: TObject; var DrawState: Boolean);
    procedure cbSpecialDeliveryClick(Sender: TObject);
    procedure cbRefrezheratorClick(Sender: TObject);
    procedure DBEditEhXChange(Sender: TObject);
    procedure DBEditEhXCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhYCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhYChange(Sender: TObject);
    procedure DBEditEhDateDepartureChange(Sender: TObject);
    procedure DBEditEhDateDepartureCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhCarChange(Sender: TObject);
    procedure DBEditEhCarCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhDriverChange(Sender: TObject);
    procedure DBEditEhDriverCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBLookupComboboxEhRegionNoChange(Sender: TObject);
    procedure DBLookupComboboxEhRegionNoCheckDrawRequiredState(
      Sender: TObject; var DrawState: Boolean);
    procedure DBEditEhCityChange(Sender: TObject);
    procedure DBEditEhCityCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhStreetChange(Sender: TObject);
    procedure DBEditEhStreetCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhHouseNoChange(Sender: TObject);
    procedure DBEditEhHouseNoCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhMail1Change(Sender: TObject);
    procedure DBEditEhMail1CheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhMail2Change(Sender: TObject);
    procedure DBEditEhMail2CheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhMail3Change(Sender: TObject);
    procedure DBEditEhMail3CheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhTopicChange(Sender: TObject);
    procedure DBEditEhTopicCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhMessageChange(Sender: TObject);
    procedure DBEditEhMessageCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhCodeChange(Sender: TObject);
    procedure DBEditEhCodeCheckDrawRequiredState(
      Sender: TObject; var DrawState: Boolean);
    procedure DBEditEhKOATUUChange(Sender: TObject);
    procedure DBEditEhKOATUUCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhCommerce_NetworkChange(Sender: TObject);
    procedure DBEditEhCommerce_NetworkCheckDrawRequiredState(
      Sender: TObject; var DrawState: Boolean);
    procedure DBGridEhAddressKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEhSotrudKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEhDelayKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEhPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure quSotrudAddressAfterPost(DataSet: TDataSet);
    procedure quPriceBeforePost(DataSet: TDataSet);
    procedure DBEditEhClassifierNameDblClick(Sender: TObject);
    procedure DBEditEhClassifierNameCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure DBEditEhClassifierNameChange(Sender: TObject);
    procedure DBGridEhSignatureGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure DBGridEhAddressGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure quAddressPostAfterPost(DataSet: TDataSet);
    procedure DBGridEhSotrudGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure DBGridEhDelayGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure DBGridEhPriceGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure DBGridEhAddressDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure cbIsEditClick(Sender: TObject);
    procedure quListUserForVidDocBeforeOpen(DataSet: TDataSet);
    procedure bbConductingDocClick(Sender: TObject);
    procedure DBGridEhAddressExit(Sender: TObject);
    procedure DBGridEhSotrudExit(Sender: TObject);
    procedure DBGridEhDelayExit(Sender: TObject);
    procedure DBGridEhPriceExit(Sender: TObject);
    procedure quDocClientCardPostGroupCuttingSpecBeforeOpen(
      DataSet: TDataSet);
    procedure quDocClientCardPostGroupCuttingSpecBeforePost(
      DataSet: TDataSet);
    procedure DBGridEhGroupCuttingExit(Sender: TObject);
    procedure DBGridEhGroupCuttingGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure DBGridEhGroupCuttingKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure quDalayAfterOpen(DataSet: TDataSet);
    procedure quDalayAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
    SearchString:string;
  public
    PostNoFirm : integer;
    MaxId : integer;
    AddressNo : integer;
    ActionForm : string;
    IsSignature : boolean;
    RealId : integer;
    { Public declarations }
  end;

var
  EditClientCardForm: TEditClientCardForm;


procedure ClientCard(Action: String; var PostNo: Integer; Id: Integer);
implementation

uses data, Main, CategoryTT, SalesChannelsOfPepsico, KOATUU,
     AddressPost_CODE_Commerce_Network, ClassifierABCDZ, DocClientCardHead;

{$R *.dfm}

procedure ClientCard(Action: String; var PostNo: Integer; Id: Integer);
var
  Dlg : TEditClientCardForm;
  SqlText : string;
  CheckbbConductingDoc : TMSQuery;
  IsCanEdit : Boolean;
  s : string;

begin
  Dlg := TEditClientCardForm.Create(Application);

  Dlg.PostNoFirm := PostNo;
  Dlg.ActionForm := Action;

//  dmDataModule.OpenSQL('select isnull(max(id),0) Id from DocClientCardHead');

  dmDataModule.OpenSQL('select isnull(max(Id),0) +1 as Id from s_DocClientCardHead');

  if (Id = -1) then begin
                      s := DmDataModule.QFO.FieldByName('Id').AsString + IntToStr(data.UserNo);
                      Dlg.MaxId := StrToInt(s); //dmDataModule.QFO.FieldByName('Id').Value + 1;
                      Dlg.RealId := dmDataModule.QFO.FieldByName('Id').Value;
                    end  
               else Dlg.MaxId := Id;

  dmDataModule.OpenSQL('select * from ListUserForVidDoc where Active = 1 and IdVidDoc = 1 and UserNo = :p1_UserNo',[UserNo]);

  if dmDataModule.QFO.RecordCount = 0 then Dlg.cbIsDocSignature.Visible := False
                                      else begin
                                             Dlg.cbIsDocSignature.Visible := True;
                                             dmDataModule.OpenSQL('select * from l_doc_signature where DocId = :p1_DocId and UserNo = :p2_UserNo',[Dlg.MaxId, UserNo]);
                                             if dmDataModule.QFO.RecordCount = 1 then Dlg.cbIsDocSignature.Checked := True;
                                           end;



  dmDataModule.OpenSQL('select * from ListUserForConductingDoc where Active = 1 and IdVidDoc = 1 and UserNo = :p1_UserNo',[UserNo]);

  if dmDataModule.QFO.RecordCount = 0 then Dlg.bbConductingDoc.Visible := False
                                      else Dlg.bbConductingDoc.Visible := True;

  SqlText := 'select  OtdelNo '
            +'      , sum(is_signature) '
            +' from (select OtdelNo '
            +'            , Case when l.id is null then cast(0 as int) '
            +'                                     else cast(1 as int) end as is_signature '
            +'        from ListUserForVidDoc u left join '
            +'             l_doc_signature l on l.UserNo = u.UserNo and l.DocId = :Id '
            +'         where IdVidDoc = 1 '
            +'           and Active = 1) g '
            +'group by OtdelNo '
            +'having sum(is_signature) = 0 ';

  CheckbbConductingDoc:=TMSQuery.Create(nil);
  CheckbbConductingDoc.Connection:=dmDataModule.DB;
  CheckbbConductingDoc.SQL.Clear;
  CheckbbConductingDoc.SQL.Text:= SqlText;
  CheckbbConductingDoc.ParamByName('Id').Value := Dlg.MaxId;
  CheckbbConductingDoc.Open;

  if CheckbbConductingDoc.RecordCount = 0 then Dlg.bbConductingDoc.Enabled := True
                                          else Dlg.bbConductingDoc.Enabled := False;

  dmDataModule.OpenSQL('select isApp from DocClientCardHead where Id = :p1_Id',[Dlg.MaxId]);

  if dmDataModule.QFO.FieldByName('isApp').AsBoolean then Dlg.bbConductingDoc.Enabled := False;


  Dlg.quAddressPost.Open;
  Dlg.quSotrudAddress.Open;
  Dlg.quDalay.Open;
  Dlg.quPrice.Open;
  Dlg.quDSetArticleGroupId.Open;
  Dlg.quDBuhType.Open;
  Dlg.quPriceType.Open;
  Dlg.quDocClientCardPostGroupCuttingSpec.Open;

  Dlg.quListUserForVidDoc.ParamByName('Id').Value := Dlg.MaxId;
  Dlg.quListUserForVidDoc.Open;

  Dlg.quDocClientCardHead.ParamByName('Id').Value := Dlg.MaxId;
  Dlg.quDocClientCardHead.Open;

  Dlg.quCurrency.Open;

  Dlg.AddressNo := Dlg.quAddressPostAddressNo.value;


  try
    if Action = 'Add' then
     begin
       Dlg.quDocClientCardHead.Insert;

       Dlg.quDocClientCardHeadIsApp.Value := False;
       Dlg.quDocClientCardHeadid.Value := Dlg.MaxId;
       Dlg.quDocClientCardHeadPostNo.Value := Dlg.PostNoFirm;
       Dlg.quDocClientCardHeadDocDate.Value := Date;
       Dlg.quDocClientCardHeadUserNo.Value := UserNo;

       dmDataModule.OpenSQL('select UserName from Users where UserNo = :p1_UserNo',[UserNo]);
       Dlg.quDocClientCardHeadUserName.Value := dmDataModule.QFO.FieldByName('UserName').Value;

       dmDataModule.OpenSQL('select Name from Post where PostNo = :p1_PostNo',[Dlg.PostNoFirm]);
       Dlg.quDocClientCardHeadPostName.Value := dmDataModule.QFO.FieldByName('Name').Value;


       dmDataModule.OpenSQL('select TTN from Post where PostNo = :p1_PostNo',[Dlg.PostNoFirm]);
       if dmDataModule.QFO.RecordCount = 0 then Dlg.quDocClientCardHeadTTN.Value := false
                                           else if dmDataModule.QFO.FieldByName('TTN').IsNull then Dlg.quDocClientCardHeadTTN.Value := false
                                                                                              else Dlg.quDocClientCardHeadTTN.Value := dmDataModule.QFO.FieldByName('TTN').Value;

       dmDataModule.OpenSQL('select print3 from Post where PostNo = :p1_PostNo',[Dlg.PostNoFirm]);
       if dmDataModule.QFO.RecordCount = 0 then Dlg.quDocClientCardHeadPrint3.Value := false
                                           else if dmDataModule.QFO.FieldByName('print3').IsNull then Dlg.quDocClientCardHeadPrint3.Value := false
                                                                                                 else Dlg.quDocClientCardHeadPrint3.Value := dmDataModule.QFO.FieldByName('print3').Value;

//       Dlg.quDocClientCardHeadSotrudNo := ;
//       Dlg.quDocClientCardHeadSotrudName: TStringField;


     end;
    if Action = 'Edit' then
     begin
       Dlg.quDocClientCardHead.Edit;
       Dlg.cbSotrud.KeyValue := Dlg.quDocClientCardHeadSotrudNo.Value;

       dmDataModule.OpenSQL('select isnull(IsCanEdit,0) as IsCanEdit from ListUserForVidDoc where IdVidDoc = 1 and UserNo = :p1_UserNo',[UserNo]);

       if dmDataModule.QFO.RecordCount > 0 then IsCanEdit := dmDataModule.QFO.FieldByName('IsCanEdit').Value
                                           else IsCanEdit := false;

       if Dlg.quDocClientCardHeadUserNo.Value <> UserNo then if IsCanEdit = false then begin
                                                                                         Dlg.DBGridEhAddress.ReadOnly := True;
                                                                                         Dlg.DBGridEhSotrud.ReadOnly := True;
                                                                                         Dlg.DBGridEhDelay.ReadOnly := True;
                                                                                         Dlg.DBGridEhPrice.ReadOnly := True;

                                                                                         Dlg.DBEditEhAddressNoPost.Enabled := False;
                                                                                         Dlg.DBEditEhAddressPost.Enabled := False;
                                                                                         Dlg.DBEditEhCategoryName.Enabled := False;
                                                                                         Dlg.DBEditEhTimeBeg.Enabled := False;
                                                                                         Dlg.DBEditEhTimeEnd.Enabled := False;
                                                                                         Dlg.DBEditEhUnloading.Enabled := False;
                                                                                         Dlg.DBEditEhQuantityDelivery.Enabled := False;
                                                                                         Dlg.DBEditEhX.Enabled := False;
                                                                                         Dlg.DBEditEhY.Enabled := False;
                                                                                         Dlg.cbSpecialDelivery.Enabled := False;
                                                                                         Dlg.cbRefrezherator.Enabled := False;
                                                                                         Dlg.DBEditEhDateDeparture.Enabled := False;
                                                                                         Dlg.DBEditEhClassifierName.Enabled := False;
                                                                                         Dlg.DBLookupComboboxEhRegionNo.Enabled := False;
                                                                                         Dlg.DBEditEhCity.Enabled := False;
                                                                                         Dlg.DBEditEhStreet.Enabled  := False;
                                                                                         Dlg.DBEditEhHouseNo.Enabled := False;
                                                                                         Dlg.DBEditEhCar.Enabled := False;
                                                                                         Dlg.DBEditEhDriver.Enabled := False;
                                                                                         Dlg.DBEditEhMail1.Enabled := False;
                                                                                         Dlg.DBEditEhMail2.Enabled := False;
                                                                                         Dlg.DBEditEhMail3.Enabled := False;
                                                                                         Dlg.DBEditEhTopic.Enabled := False;
                                                                                         Dlg.DBEditEhMessage.Enabled := False;
                                                                                         Dlg.DBEditEhCode.Enabled := False;
                                                                                         Dlg.DBEditEhKOATUU.Enabled := False;
                                                                                         Dlg.DBEditEhCommerce_Network.Enabled := False;

                                                                                         Dlg.dbcbPrint3.Enabled := False;
                                                                                         Dlg.dbcbTTN.Enabled := False;
                                                                                         Dlg.cbSotrud.Enabled := False;
                                                                                       end;



       dmDataModule.OpenSQL('select * from l_doc_signature where DocId = :p1_DocId',[Dlg.MaxId]);

       if dmDataModule.QFO.RecordCount > 0 then if IsCanEdit = false then begin
                                                                            Dlg.IsSignature := True;

                                                                            Dlg.DBGridEhAddress.ReadOnly := True;
                                                                            Dlg.DBGridEhSotrud.ReadOnly := True;
                                                                            Dlg.DBGridEhDelay.ReadOnly := True;
                                                                            Dlg.DBGridEhPrice.ReadOnly := True;

                                                                            Dlg.DBEditEhAddressNoPost.Enabled := False;
                                                                            Dlg.DBEditEhAddressPost.Enabled := False;
                                                                            Dlg.DBEditEhCategoryName.Enabled := False;
                                                                            Dlg.DBEditEhTimeBeg.Enabled := False;
                                                                            Dlg.DBEditEhTimeEnd.Enabled := False;
                                                                            Dlg.DBEditEhUnloading.Enabled := False;
                                                                            Dlg.DBEditEhQuantityDelivery.Enabled := False;
                                                                            Dlg.DBEditEhX.Enabled := False;
                                                                            Dlg.DBEditEhY.Enabled := False;
                                                                            Dlg.cbSpecialDelivery.Enabled := False;
                                                                            Dlg.cbRefrezherator.Enabled := False;
                                                                            Dlg.DBEditEhDateDeparture.Enabled := False;
                                                                            Dlg.DBEditEhClassifierName.Enabled := False;
                                                                            Dlg.DBLookupComboboxEhRegionNo.Enabled := False;
                                                                            Dlg.DBEditEhCity.Enabled := False;
                                                                            Dlg.DBEditEhStreet.Enabled  := False;
                                                                            Dlg.DBEditEhHouseNo.Enabled := False;
                                                                            Dlg.DBEditEhCar.Enabled := False;
                                                                            Dlg.DBEditEhDriver.Enabled := False;
                                                                            Dlg.DBEditEhMail1.Enabled := False;
                                                                            Dlg.DBEditEhMail2.Enabled := False;
                                                                            Dlg.DBEditEhMail3.Enabled := False;
                                                                            Dlg.DBEditEhTopic.Enabled := False;
                                                                            Dlg.DBEditEhMessage.Enabled := False;
                                                                            Dlg.DBEditEhCode.Enabled := False;
                                                                            Dlg.DBEditEhKOATUU.Enabled := False;
                                                                            Dlg.DBEditEhCommerce_Network.Enabled := False;

                                                                            Dlg.dbcbPrint3.Enabled := False;
                                                                            Dlg.dbcbTTN.Enabled := False;
                                                                            Dlg.cbSotrud.Enabled := False;
                                                                          end;

{
       Dlg.quAddressPost.Close;
       Dlg.quAddressPost.SQL.Clear;
       Dlg.quAddressPost.SQL.Text := 'select * from DocClientCardAddressPostSpec where DocId = :DocId';
       Dlg.quAddressPost.ParamByName('DocId').Value := Dlg.MaxId;
       Dlg.quAddressPost.Open;

       Dlg.quSotrudAddress.Close;
       Dlg.quSotrudAddress.SQL.Clear;
       Dlg.quSotrudAddress.SQL.Text := 'select * from DocClientCardSotrudAddressSpec where DocId = :DocId';
       Dlg.quSotrudAddress.ParamByName('DocId').Value := Dlg.MaxId;
       Dlg.quSotrudAddress.Open;

       Dlg.quDalay.Close;
       Dlg.quDalay.SQL.Clear;
       Dlg.quDalay.SQL.Text := 'select * from DocClientDelaySpec where DocId = :DocId';
       Dlg.quDalay.ParamByName('DocId').Value := Dlg.MaxId;
       Dlg.quDalay.Open;

       Dlg.quPrice.Close;
       Dlg.quPrice.SQL.Clear;
       Dlg.quPrice.SQL.Text := 'select * from DocClientPriceSpec where DocId = :DocId';
       Dlg.quPrice.ParamByName('DocId').Value := Dlg.MaxId;
       Dlg.quPrice.Open;
}

     end;

    Dlg.ShowModal;

  finally
    Dlg.quAddressPost.Close;
    Dlg.quSotrudAddress.Close;
    Dlg.quDalay.Close;
    Dlg.quPrice.Close;
    Dlg.quListUserForVidDoc.Close;
    Dlg.quDocClientCardHead.Close;
    Dlg.quDSetArticleGroupId.Close;
    Dlg.quDBuhType.Close;
    Dlg.quPriceType.Close;
    Dlg.quDocClientCardPostGroupCuttingSpec.Close;
    Dlg.quCurrency.Close;
    Dlg.Free;
  end;
end;

procedure TEditClientCardForm.quAddressPostBeforeOpen(DataSet: TDataSet);
begin
  inherited;
//  quAddressPost.ParamByName('PostNo').AsInteger := PostNoFirm;
//  quAddressPost.ParamByName('DateDeperture').AsDateTime := GlobalDateNakl;
  quAddressPost.ParamByName('IsAllAddress').Value := cbIsAllAddress.Checked;
  quAddressPost.ParamByName('DocId').Value := MaxId;
  quAddressPost.ParamByName('IsEdit').Value := cbIsEdit.Checked;
end;

procedure TEditClientCardForm.quSotrudAddressBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quSotrudAddress.ParamByName('IsAllSotrud').Value := cbIsAllSotrud.Checked;
  quSotrudAddress.ParamByName('AddressPost_id').Value := quAddressPostApId.Value;
  quSotrudAddress.ParamByName('DocId').Value := MaxId;

  DBEditEhAddressNoPost.Repaint;
  DBEditEhAddressPost.Repaint;
  DBEditEhCategoryName.Repaint;
  DBEditEhTimeBeg.Repaint;
  DBEditEhTimeEnd.Repaint;
  DBEditEhUnloading.Repaint;
  DBEditEhQuantityDelivery.Repaint;
  cbSpecialDelivery.Repaint;
  cbRefrezherator.Repaint;
  DBEditEhX.Repaint;
  DBEditEhY.Repaint;
  DBEditEhDateDeparture.Repaint;
  DBEditEhClassifierName.Repaint;
  DBLookupComboboxEhRegionNo.Repaint;
  DBEditEhCity.Repaint;
  DBEditEhStreet.Repaint;
  DBEditEhHouseNo.Repaint;
  DBEditEhCar.Repaint;
  DBEditEhDriver.Repaint;
  DBEditEhMail1.Repaint;
  DBEditEhMail2.Repaint;
  DBEditEhMail3.Repaint;
  DBEditEhTopic.Repaint;
  DBEditEhMessage.Repaint;
  DBEditEhCode.Repaint;
  DBEditEhKOATUU.Repaint;
  DBEditEhCommerce_Network.Repaint;





end;

procedure TEditClientCardForm.quDalayBeforeOpen(DataSet: TDataSet);
begin
  inherited;
//  quDalay.ParamByName('PostNo').Value := PostNoFirm;
  quDalay.ParamByName('DocId').Value := MaxId;
end;

procedure TEditClientCardForm.quPriceBeforeOpen(DataSet: TDataSet);
begin
  inherited;
//  quPrice.ParamByName('PostNo').Value := PostNoFirm;
  quPrice.ParamByName('DocId').Value := MaxId;
end;

procedure TEditClientCardForm.DBGridEhAddressCellClick(Column: TColumnEh);
begin
  inherited;
  quSotrudAddress.Close;
  quSotrudAddress.ParamByName('AddressPost_id').Value := quAddressPostApId.Value;
  quSotrudAddress.Open;

end;

procedure TEditClientCardForm.DBGridEhAddressKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  quSotrudAddress.Close;
  quSotrudAddress.ParamByName('AddressPost_id').Value := quAddressPostApId.Value;
  quSotrudAddress.Open;

end;

procedure TEditClientCardForm.cbIsAllAddressClick(Sender: TObject);
begin
  inherited;
  quAddressPost.Close;
  quAddressPost.Open;
end;

procedure TEditClientCardForm.cbIsAllSotrudClick(Sender: TObject);
begin
  inherited;
  quSotrudAddress.Close;
  quSotrudAddress.Open;
end;

procedure TEditClientCardForm.Panel1Exit(Sender: TObject);
begin
  inherited;
  if cbSotrud.Text = '' then begin
                               ShowMessage('Не указан торговый представитель');
                               ActiveControl := cbSotrud;
                             end;
end;

procedure TEditClientCardForm.bbOKClick(Sender: TObject);
var
  ListNameErr : string;
  SqlText, NoSignatureOtdel : string;
  quNoSignatureOtdel : TMSQuery;
begin
  if DBEditEhCategoryName.Text = '' then ListNameErr := ListNameErr + ' Категория ТТ,';
  if DBEditEhTimeBeg.Text = '' then ListNameErr := ListNameErr + ' Работа с,';
  if DBEditEhTimeEnd.Text = '' then ListNameErr := ListNameErr + ' Работа по,';
  if DBEditEhUnloading.Text = '' then ListNameErr := ListNameErr + ' Разгрузка(мин.),';
  if DBEditEhX.Text = '' then ListNameErr := ListNameErr + ' Широта,';
  if DBEditEhY.Text = '' then ListNameErr := ListNameErr + ' Долгота,';
  if DBLookupComboboxEhRegionNo.Text = '' then ListNameErr := ListNameErr + ' Район,';
  if DBEditEhCity.Text = '' then ListNameErr := ListNameErr + ' Город,';
  if DBEditEhStreet.Text = '' then ListNameErr := ListNameErr + ' Улица,';
  if DBEditEhHouseNo.Text = '' then ListNameErr := ListNameErr + ' № Дома,';

  delete (ListNameErr,Length(ListNameErr)-1,Length(ListNameErr));

  if ListNameErr <> '' then begin
                              ActiveControl := gbAdvancetProvAddress;
                              ModalResult := mrNone;
                              raise Exception.Create('Не заполнены обязательные поля!!!' + #10#13 + ListNameErr);
                            end;

  SqlText := 'select  OtdelNo '
            +'      , sum(is_signature) '
            +'      , (select OtdelName from VidOtdel where OtdelNo = g.OtdelNo) as OtdelName '
            +' from (select OtdelNo '
            +'            , Case when l.id is null then cast(0 as int) '
            +'                                     else cast(1 as int) end as is_signature '
            +'        from ListUserForVidDoc u left join '
            +'             l_doc_signature l on l.UserNo = u.UserNo and l.DocId = :Id '
            +'         where IdVidDoc = 1 '
            +'           and Active = 1) g '
            +'group by OtdelNo '
            +'having sum(is_signature) = 0 ';

  quNoSignatureOtdel:=TMSQuery.Create(nil);
  quNoSignatureOtdel.Connection:=dmDataModule.DB;
  quNoSignatureOtdel.SQL.Clear;
  quNoSignatureOtdel.SQL.Text:= SqlText;
  quNoSignatureOtdel.ParamByName('Id').Value := MaxId;
  quNoSignatureOtdel.Open;

  quNoSignatureOtdel.First;

  while not quNoSignatureOtdel.Eof do begin
                                        NoSignatureOtdel := NoSignatureOtdel + quNoSignatureOtdel.FieldByName('OtdelName').AsString + ', ';
                                        quNoSignatureOtdel.Next;
                                      end;
  delete (NoSignatureOtdel,Length(NoSignatureOtdel)-1,Length(NoSignatureOtdel));

  dmDataModule.ExecSQL('Update DocClientCardHead set NotSignatureOtdel = :p1_NotSignatureOtdel where id = :p2_id',[NoSignatureOtdel,MaxId]);

  if (quDocClientCardHead.State in [dsInsert, dsEdit]) then quDocClientCardHead.Post else quDocClientCardHead.Cancel;
  if (quAddressPost.State in [dsInsert, dsEdit]) then quAddressPost.Post else quAddressPost.Cancel;
  if (quSotrudAddress.State in [dsInsert, dsEdit]) then quSotrudAddress.Post else quSotrudAddress.Cancel;
  if (quDalay.State in [dsInsert, dsEdit]) then quDalay.Post else quDalay.Cancel;
  if (quPrice.State in [dsInsert, dsEdit]) then quPrice.Post else quPrice.Cancel;
end;

procedure TEditClientCardForm.bbcancelClick(Sender: TObject);
begin
  inherited;
  if (quDocClientCardHead.State in [dsInsert, dsEdit]) then quDocClientCardHead.Cancel;
  if (quAddressPost.State in [dsInsert, dsEdit]) then quAddressPost.Cancel;
  if (quSotrudAddress.State in [dsInsert, dsEdit]) then quSotrudAddress.Cancel;
  if (quDalay.State in [dsInsert, dsEdit]) then quDalay.Cancel;
  if (quPrice.State in [dsInsert, dsEdit]) then quPrice.Cancel;

  if ActionForm = 'App' then dmDataModule.ExecSQL('exec spDelDocClientCard :p1_DocId',[MaxId]);
end;

procedure TEditClientCardForm.dbcbPrint3Click(Sender: TObject);
var
  MainPrint3 : boolean;
begin
  dmDataModule.OpenSQL('select print3 from Post where PostNo = :p1_PostNo',[PostNoFirm]);
  if dmDataModule.QFO.RecordCount = 0 then MainPrint3 := false else if dmDataModule.QFO.FieldByName('print3').IsNull then MainPrint3 := false else MainPrint3 := dmDataModule.QFO.FieldByName('print3').Value;
  if dmDataModule.QFO.FieldByName('print3').IsNull then if (dmDataModule.QFO.FieldByName('print3').Value <> dbcbPrint3.Checked) then dbcbPrint3.Color := clYellow
                                                                                                                                else dbcbPrint3.Color := clBtnFace
                                                   else if MainPrint3 <> dbcbPrint3.Checked then dbcbPrint3.Color := clYellow
                                                                                            else dbcbPrint3.Color := clBtnFace;
end;

procedure TEditClientCardForm.dbcbTTNClick(Sender: TObject);
var
  MainTTN : boolean;
begin
  dmDataModule.OpenSQL('select TTN from Post where PostNo = :p1_PostNo',[PostNoFirm]);
  if dmDataModule.QFO.RecordCount = 0 then MainTTN := false else if dmDataModule.QFO.FieldByName('TTN').IsNull then MainTTN := false else MainTTN := dmDataModule.QFO.FieldByName('TTN').Value;
  if MainTTN <> dbcbTTN.Checked then dbcbTTN.Color := clYellow
                                else dbcbTTN.Color := clBtnFace;
end;

procedure TEditClientCardForm.DBGridEhSignatureDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if quListUserForVidDocis_signature.AsBoolean then begin
                                                      DBGridEhSignature.Canvas.Font.Color := clLime;
                                                    end;
  DBGridEhSignature.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TEditClientCardForm.cbIsDocSignatureClick(Sender: TObject);
begin
  dmDataModule.ExecSQL('exec sp_IsDocSignature :p1_UserNo, :p2_DocId, :p3_Value',[UserNo, quDocClientCardHeadid.value, cbIsDocSignature.Checked]);
  quListUserForVidDoc.Close;
  quListUserForVidDoc.Open;
end;


procedure TEditClientCardForm.cbSotrudExit(Sender: TObject);
begin
  if cbSotrud.Text <> '' then begin
                                if (quDocClientCardHead.State in [dsInsert, dsEdit]) then quDocClientCardHead.Post;
                                dmDataModule.ExecSQL('update s_DocClientCardHead set id = :p1_id ',[RealId]);
                                dmDataModule.OpenSQL('select *  from DocClientCardAddressPostSpec where DocId = :p1_DocId',[MaxId]);
                                if dmDataModule.QFO.RecordCount = 0 then dmDataModule.ExecSQL('exec spCreateDocClientCardSpec :p1_PostNo, :p2_DateDeperture,:p3_DocId, :p4_IsAllAddress, :p5_IsAllSotrud',[PostNoFirm, GlobalDateNakl, MaxId, cbIsAllAddress.Checked, cbIsAllSotrud.Checked])
                              end
                         else begin
                                ShowMessage('Не указан торговый представитель');
                                ActiveControl := cbSotrud;
                              end;

  quAddressPost.Close;
  quAddressPost.Open;

  quSotrudAddress.Close;
  quSotrudAddress.Open;

  quDalay.Close;
  quDalay.Open;

  quPrice.Close;
  quPrice.Open;

  quDocClientCardPostGroupCuttingSpec.Close;
  quDocClientCardPostGroupCuttingSpec.Open;

end;

procedure TEditClientCardForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDataModule.OpenSQL('select * from DocClientCardHead where Id = :p1_DocId',[MaxId]);
  if dmDataModule.QFO.RecordCount = 0 then  dmDataModule.ExecSQL('exec spDelDocClientCard :p1_DocId',[MaxId]);
  
end;

procedure TEditClientCardForm.DBEditEhCategoryNameDblClick(Sender: TObject);
var
  Dlg : TCategoryTTForm;
begin
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
                                   quAddressPostCategoryName.AsString := Dlg.quCategoryTTCategoryTTName.AsString;
                                   quAddressPostCategoryId.AsInteger := Dlg.quCategoryTTCategoryTTNo.AsInteger;
                                 end

  finally
    Dlg.quCategoryTT.Close;
    Dlg.Free;
  end;
end;

procedure TEditClientCardForm.DBEditEhCodeDblClick(Sender: TObject);
var
  Dlg : TSalesChannelsOfPepsicoForm;
begin
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

procedure TEditClientCardForm.DBEditEhKOATUUDblClick(Sender: TObject);
var
  Dlg : TKOATUUForm;
begin
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

procedure TEditClientCardForm.DBEditEhCommerce_NetworkDblClick(Sender: TObject);
var
  Dlg : TAddressPost_CODE_Commerce_NetworkForm;
begin

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

{
object quAddressPostAddressNo: TIntegerField
  DisplayLabel = #8470
  DisplayWidth = 3
  FieldName = 'AddressNo'
end

 }
procedure TEditClientCardForm.quAddressPostBeforePost(DataSet: TDataSet);
var
  AddressNo : integer;
begin
  quAddressPostDocId.Value := MaxId;
  quAddressPostPostNo.Value := PostNoFirm;
  dmDataModule.OpenSQL('select * from AddressPost where PostNo = :p1_PostNo and AddressNo = :p2_AddressNo',[PostNoFirm,quAddressPostAddressNo.Value]);

  if dmDataModule.QFO.RecordCount = 0 then begin
                                             dmDataModule.OpenSQL('select AddressNo from DocClientCardAddressPostSpec where PostNo = :p1_PostNo and DocId = :p2_DocId and AddressNo = :p3_AddressNo ',[PostNoFirm,MaxId,quAddressPostAddressNo.Value]);
                                             if not dmDataModule.QFO.FieldByName('AddressNo').IsNull then AddressNo := quAddressPostAddressNo.Value
                                                                                                     else begin
                                                                                                            dmDataModule.OpenSQL('select isnull(max(AddressNo),0)+1 as AddressNo from DocClientCardAddressPostSpec where PostNo = :p1_PostNo and DocId = :p2_DocId ',[PostNoFirm,MaxId]);
                                                                                                            AddressNo := dmDataModule.QFO.FieldByName('AddressNo').AsInteger;
                                                                                                          end;
                                           end
                                      else AddressNo := quAddressPostAddressNo.Value;

  quAddressPostAddressNo.Value := AddressNo;


{
  dmDataModule.OpenSQL('select AddressNo from DocClientCardAddressPostSpec where PostNo = :p1_PostNo and DocId = :p2_DocId and AddressNo = :p3_AddressNo ',[PostNoFirm,MaxId,AddressNo]);

  if dmDataModule.QFO.FieldByName('AddressNo').IsNull then quAddressPostAddressNo.Value := AddressNo;





  //  showmessage(dmDataModule.QFO.FieldByName('AddressNo').AsString);

  if dmDataModule.QFO.RecordCount = 0 then quAddressPostAddressNo.Value := 1
                                      else if dmDataModule.QFO.FieldByName('AddressNo').Value <> 1 then quAddressPostAddressNo.Value := dmDataModule.QFO.FieldByName('AddressNo').Value;
}
end;

procedure TEditClientCardForm.quSotrudAddressBeforePost(DataSet: TDataSet);
begin
  quSotrudAddressDocId.Value := MaxId;
  if quSotrudAddress.State = dsInsert then begin
                                             quSotrudAddressAddressPost_id.Value := quAddressPostApId.Value;
                                           end;
end;

procedure TEditClientCardForm.quDalayBeforePost(DataSet: TDataSet);
begin
  quDalayDocId.Value := MaxId;
  quDalayPostNo.Value := PostNoFirm;
  


end;

procedure TEditClientCardForm.DBEditEhAddressNoPostChange(Sender: TObject);
begin
  dmDataModule.OpenSQL('select AddressNoPost from AddressCorrespondence where PostNo = :p1_PostNo and AddressNo = :p2_AddressNo',[PostNoFirm,quAddressPostAddressNo.Value]);
  if DBEditEhAddressNoPost.Text <>  dmDataModule.QFO.FieldByName('AddressNoPost').AsString then begin
                                                                                                  DBEditEhAddressNoPost.Color := clYellow;
                                                                                                  lbAddressNoPost.Color := clYellow;
                                                                                                end
                                                                                           else begin
                                                                                                  DBEditEhAddressNoPost.Color := clWindow;
                                                                                                  lbAddressNoPost.Color := clBtnFace;
                                                                                                end;
end;

procedure TEditClientCardForm.DBEditEhAddressNoPostCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
begin
  dmDataModule.OpenSQL('select AddressNoPost from AddressCorrespondence where PostNo = :p1_PostNo and AddressNo = :p2_AddressNo',[PostNoFirm,quAddressPostAddressNo.Value]);
  if DBEditEhAddressNoPost.Text <>  dmDataModule.QFO.FieldByName('AddressNoPost').AsString then begin
                                                                                                  DBEditEhAddressNoPost.Color := clYellow;
                                                                                                  lbAddressNoPost.Color := clYellow;
                                                                                                end
                                                                                           else begin
                                                                                                  DBEditEhAddressNoPost.Color := clWindow;
                                                                                                  lbAddressNoPost.Color := clBtnFace;
                                                                                                end;

end;

procedure TEditClientCardForm.DBEditEhAddressPostChange(Sender: TObject);
begin
  dmDataModule.OpenSQL('select AddressPost from AddressCorrespondence where PostNo = :p1_PostNo and AddressNo = :p2_AddressNo',[PostNoFirm,quAddressPostAddressNo.Value]);
  if DBEditEhAddressPost.Text <>  dmDataModule.QFO.FieldByName('AddressPost').AsString then begin
                                                                                              DBEditEhAddressPost.Color := clYellow;
                                                                                              lbAddressPost.Color := clYellow;
                                                                                            end
                                                                                       else begin
                                                                                              DBEditEhAddressPost.Color := clWindow;
                                                                                              lbAddressPost.Color := clBtnFace;
                                                                                            end;
end;

procedure TEditClientCardForm.DBEditEhAddressPostCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
begin
  dmDataModule.OpenSQL('select AddressPost from AddressCorrespondence where PostNo = :p1_PostNo and AddressNo = :p2_AddressNo',[PostNoFirm,quAddressPostAddressNo.Value]);
  if DBEditEhAddressPost.Text <>  dmDataModule.QFO.FieldByName('AddressPost').AsString then begin
                                                                                              DBEditEhAddressPost.Color := clYellow;
                                                                                              lbAddressPost.Color := clYellow;
                                                                                            end
                                                                                       else begin
                                                                                              DBEditEhAddressPost.Color := clWindow;
                                                                                              lbAddressPost.Color := clBtnFace;
                                                                                            end;
end;

procedure TEditClientCardForm.DBEditEhCategoryNameChange(Sender: TObject);
begin
  dmDataModule.OpenSQL('select c.CategoryTTName as CategoryName from L_CategoryAddressPost l left join D_CategoryTT c on l.CategoryId = c.CategoryTTNo where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhCategoryName.Text = '' then begin
                                           DBEditEhCategoryName.Color := clRed
                                         end
                                    else begin
                                           if DBEditEhCategoryName.Text <>  dmDataModule.QFO.FieldByName('CategoryName').AsString then begin
                                                                                                                                         DBEditEhCategoryName.Color := clYellow;
                                                                                                                                         lbCategoryName.Color := clYellow;
                                                                                                                                       end
                                                                                                                                  else begin
                                                                                                                                         DBEditEhCategoryName.Color := clWindow;
                                                                                                                                         lbCategoryName.Color := clBtnFace;
                                                                                                                                       end;
                                         end;
end;

procedure TEditClientCardForm.DBEditEhCategoryNameCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
begin
  dmDataModule.OpenSQL('select c.CategoryTTName as CategoryName from L_CategoryAddressPost l left join D_CategoryTT c on l.CategoryId = c.CategoryTTNo where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhCategoryName.Text = '' then begin
                                           DBEditEhCategoryName.Color := clRed
                                         end
                                    else begin
                                           if DBEditEhCategoryName.Text <>  dmDataModule.QFO.FieldByName('CategoryName').AsString then begin
                                                                                                                                         DBEditEhCategoryName.Color := clYellow;
                                                                                                                                         lbCategoryName.Color := clYellow;
                                                                                                                                       end
                                                                                                                                  else begin
                                                                                                                                         DBEditEhCategoryName.Color := clWindow;
                                                                                                                                         lbCategoryName.Color := clBtnFace;
                                                                                                                                       end;
                                         end;
end;

procedure TEditClientCardForm.DBEditEhTimeBegChange(Sender: TObject);
var
  TimeBeg : string;
begin
  dmDataModule.OpenSQL('select TimeBeg from L_AddressPostProp l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[AddressNo,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('TimeBeg').IsNull then TimeBeg := '  :  ' else TimeBeg := dmDataModule.QFO.FieldByName('TimeBeg').AsString;
  if DBEditEhTimeBeg.Text = '  :  ' then begin
                                           DBEditEhTimeBeg.Color := clRed
                                         end
                                    else begin
                                           if DBEditEhTimeBeg.Text <> TimeBeg then begin
                                                                                     DBEditEhTimeBeg.Color := clYellow;
                                                                                     lbTimeBeg.Color := clYellow;
                                                                                   end
                                                                              else begin
                                                                                     DBEditEhTimeBeg.Color := clWindow;
                                                                                     lbTimeBeg.Color := clBtnFace;
                                                                                   end;
                                    end;

end;

procedure TEditClientCardForm.DBEditEhTimeBegCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  TimeBeg : string;
begin
  dmDataModule.OpenSQL('select TimeBeg from L_AddressPostProp l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[AddressNo,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('TimeBeg').IsNull then TimeBeg := '  :  ' else TimeBeg := dmDataModule.QFO.FieldByName('TimeBeg').AsString;
  if DBEditEhTimeBeg.Text = '  :  ' then begin
                                           DBEditEhTimeBeg.Color := clRed
                                         end
                                    else begin
                                           if DBEditEhTimeBeg.Text <> TimeBeg then begin
                                                                                     DBEditEhTimeBeg.Color := clYellow;
                                                                                     lbTimeBeg.Color := clYellow;
                                                                                   end
                                                                              else begin
                                                                                     DBEditEhTimeBeg.Color := clWindow;
                                                                                     lbTimeBeg.Color := clBtnFace;
                                                                                   end;
                                    end;
 
end;

procedure TEditClientCardForm.dsAddressPostDataChange(Sender: TObject;
  Field: TField);
begin
  AddressNo := quAddressPostAddressNo.value;
  dmDataModule.OpenSQL('select Refrezherator from AddressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if cbRefrezherator.Checked <> dmDataModule.QFO.FieldByName('Refrezherator').AsBoolean then cbRefrezherator.Color := clYellow
                                                                                        else cbRefrezherator.Color := clBtnFace;
  dmDataModule.OpenSQL('select SpecialDelivery from AddressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if cbSpecialDelivery.Checked <> dmDataModule.QFO.FieldByName('SpecialDelivery').AsBoolean then cbSpecialDelivery.Color := clYellow
                                                                                            else cbSpecialDelivery.Color := clBtnFace;
end;

procedure TEditClientCardForm.DBEditEhTimeEndChange(Sender: TObject);
var
  TimeEnd : string;
begin
  dmDataModule.OpenSQL('select TimeEnd from L_AddressPostProp l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[AddressNo,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('TimeEnd').IsNull then TimeEnd:= '  :  ' else TimeEnd := dmDataModule.QFO.FieldByName('TimeEnd').Value;
  if DBEditEhTimeEnd.Text = '  :  ' then begin
                                           DBEditEhTimeEnd.Color := clRed
                                         end
                                    else begin
                                           if DBEditEhTimeEnd.Text <> TimeEnd then begin
                                                                                     DBEditEhTimeEnd.Color := clYellow;
                                                                                     lbTimeEnd.Color := clYellow;
                                                                                   end
                                                                              else begin
                                                                                     DBEditEhTimeEnd.Color := clWindow;
                                                                                     lbTimeEnd.Color := clBtnFace;
                                                                                   end;
                                         end;

end;

procedure TEditClientCardForm.DBEditEhTimeEndCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  TimeEnd : string;
begin
  dmDataModule.OpenSQL('select TimeEnd from L_AddressPostProp l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[AddressNo,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('TimeEnd').IsNull then TimeEnd:= '  :  ' else TimeEnd := dmDataModule.QFO.FieldByName('TimeEnd').Value;
  if DBEditEhTimeEnd.Text = '  :  ' then begin
                                           DBEditEhTimeEnd.Color := clRed
                                         end
                                    else begin
                                           if DBEditEhTimeEnd.Text <> TimeEnd then begin
                                                                                     DBEditEhTimeEnd.Color := clYellow;
                                                                                     lbTimeEnd.Color := clYellow;
                                                                                   end
                                                                              else begin
                                                                                     DBEditEhTimeEnd.Color := clWindow;
                                                                                     lbTimeEnd.Color := clBtnFace;
                                                                                   end;
                                         end;

end;

procedure TEditClientCardForm.DBEditEhUnloadingChange(Sender: TObject);
begin
  dmDataModule.OpenSQL('select Unloading from L_AddressPostProp l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhUnloading.Text = '' then begin
                                        DBEditEhUnloading.Color := clRed
                                      end
                                 else begin
                                        if DBEditEhUnloading.Text <> dmDataModule.QFO.FieldByName('Unloading').AsString then begin
                                                                                                                               DBEditEhUnloading.Color := clYellow;
                                                                                                                               lbUnloading.Color := clYellow;
                                                                                                                             end
                                                                                                                        else begin
                                                                                                                               DBEditEhUnloading.Color := clWindow;
                                                                                                                               lbUnloading.Color := clBtnFace;
                                                                                                                             end;
                                      end;
end;

procedure TEditClientCardForm.DBEditEhUnloadingCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
begin
  dmDataModule.OpenSQL('select Unloading from L_AddressPostProp l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhUnloading.Text = '' then begin
                                        DBEditEhUnloading.Color := clRed
                                      end
                                 else begin
                                        if DBEditEhUnloading.Text <> dmDataModule.QFO.FieldByName('Unloading').AsString then begin
                                                                                                                               DBEditEhUnloading.Color := clYellow;
                                                                                                                               lbUnloading.Color := clYellow;
                                                                                                                             end
                                                                                                                        else begin
                                                                                                                               DBEditEhUnloading.Color := clWindow;
                                                                                                                               lbUnloading.Color := clBtnFace;
                                                                                                                             end;
                                      end;

end;

procedure TEditClientCardForm.DBEditEhQuantityDeliveryChange(Sender: TObject);
begin
  dmDataModule.OpenSQL('select QuantityDelivery from AddressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhQuantityDelivery.Text <> dmDataModule.QFO.FieldByName('QuantityDelivery').AsString then begin
                                                                                                       DBEditEhQuantityDelivery.Color := clYellow;
                                                                                                       lbQuantityDelivery.Color := clYellow;
                                                                                                     end
                                                                                                else begin
                                                                                                       DBEditEhQuantityDelivery.Color := clWindow;
                                                                                                       lbQuantityDelivery.Color := clBtnFace;
                                                                                                     end;
end;

procedure TEditClientCardForm.DBEditEhQuantityDeliveryCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
begin
  dmDataModule.OpenSQL('select QuantityDelivery from AddressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhQuantityDelivery.Text <> dmDataModule.QFO.FieldByName('QuantityDelivery').AsString then begin
                                                                                                       DBEditEhQuantityDelivery.Color := clYellow;
                                                                                                       lbQuantityDelivery.Color := clYellow;
                                                                                                     end
                                                                                                else begin
                                                                                                       DBEditEhQuantityDelivery.Color := clWindow;
                                                                                                       lbQuantityDelivery.Color := clBtnFace;
                                                                                                     end;

end;

procedure TEditClientCardForm.cbSpecialDeliveryClick(Sender: TObject);
begin
  dmDataModule.OpenSQL('select SpecialDelivery from AddressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if cbSpecialDelivery.Checked <> dmDataModule.QFO.FieldByName('SpecialDelivery').AsBoolean then cbSpecialDelivery.Color := clYellow
                                                                                            else cbSpecialDelivery.Color := clBtnFace;

end;

procedure TEditClientCardForm.cbRefrezheratorClick(
  Sender: TObject);
begin
  dmDataModule.OpenSQL('select Refrezherator from AddressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if cbRefrezherator.Checked <> dmDataModule.QFO.FieldByName('Refrezherator').AsBoolean then cbRefrezherator.Color := clYellow
                                                                                        else cbRefrezherator.Color := clBtnFace;

end;

procedure TEditClientCardForm.DBEditEhXChange(Sender: TObject);
begin
  dmDataModule.OpenSQL('select X from CoordinatesAddressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhX.Text = '' then begin
                                DBEditEhX.Color := clRed
                              end
                         else begin
                                 if DBEditEhX.Text <> dmDataModule.QFO.FieldByName('X').AsString then begin
                                                                                                        DBEditEhX.Color := clYellow;
                                                                                                        lbX.Color := clYellow;
                                                                                                      end
                                                                                                 else begin
                                                                                                        DBEditEhX.Color := clWindow;
                                                                                                        lbX.Color := clBtnFace;
                                                                                                      end;
                              end;

end;

procedure TEditClientCardForm.DBEditEhXCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
begin
  dmDataModule.OpenSQL('select X from CoordinatesAddressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhX.Text = '' then begin
                                DBEditEhX.Color := clRed
                              end
                         else begin
                                 if DBEditEhX.Text <> dmDataModule.QFO.FieldByName('X').AsString then begin
                                                                                                        DBEditEhX.Color := clYellow;
                                                                                                        lbX.Color := clYellow;
                                                                                                      end
                                                                                                 else begin
                                                                                                        DBEditEhX.Color := clWindow;
                                                                                                        lbX.Color := clBtnFace;
                                                                                                      end;
                              end;

end;

procedure TEditClientCardForm.DBEditEhYCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
begin
  dmDataModule.OpenSQL('select Y from CoordinatesAddressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhY.Text = '' then begin
                                DBEditEhY.Color := clRed
                              end
                         else begin
                                 if DBEditEhY.Text <> dmDataModule.QFO.FieldByName('Y').AsString then begin
                                                                                                        DBEditEhY.Color := clYellow;
                                                                                                        lbY.Color := clYellow;
                                                                                                      end
                                                                                                 else begin
                                                                                                        DBEditEhY.Color := clWindow;
                                                                                                        lbY.Color := clBtnFace;
                                                                                                      end;
                              end;

end;

procedure TEditClientCardForm.DBEditEhYChange(Sender: TObject);
begin
  dmDataModule.OpenSQL('select Y from CoordinatesAddressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhY.Text = '' then begin
                                DBEditEhY.Color := clRed
                              end
                         else begin
                                 if DBEditEhY.Text <> dmDataModule.QFO.FieldByName('Y').AsString then begin
                                                                                                        DBEditEhY.Color := clYellow;
                                                                                                        lbY.Color := clYellow;
                                                                                                      end
                                                                                                 else begin
                                                                                                        DBEditEhY.Color := clWindow;
                                                                                                        lbY.Color := clBtnFace;
                                                                                                      end;
                              end;

end;

procedure TEditClientCardForm.DBEditEhDateDepartureChange(Sender: TObject);
var
  DateDeparture : string;
begin
  dmDataModule.OpenSQL('select DateDeparture from CarForAdressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo and DateDeparture = :p3_DateDeparture',[quAddressPostAddressNo.Value,PostNoFirm,quDocClientCardHeadDocDate.Value+1]);
  DateDeparture := dmDataModule.QFO.FieldByName('DateDeparture').AsString;
  if DBEditEhDateDeparture.Text <> DateDeparture then begin
                                                        DBEditEhDateDeparture.Color := clYellow;
                                                        lbDateDeparture.Color := clYellow;
                                                      end
                                                 else begin
                                                        DBEditEhDateDeparture.Color := clWindow;
                                                        lbDateDeparture.Color := clBtnFace;
                                                      end;
end;


procedure TEditClientCardForm.DBEditEhDateDepartureCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  DateDeparture : string;
begin
  dmDataModule.OpenSQL('select DateDeparture from CarForAdressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo and DateDeparture = :p3_DateDeparture',[quAddressPostAddressNo.Value,PostNoFirm,quDocClientCardHeadDocDate.Value+1]);
  DateDeparture := dmDataModule.QFO.FieldByName('DateDeparture').AsString;
  if DBEditEhDateDeparture.Text <> DateDeparture then begin
                                                        DBEditEhDateDeparture.Color := clYellow;
                                                        lbDateDeparture.Color := clYellow;
                                                      end
                                                 else begin
                                                        DBEditEhDateDeparture.Color := clWindow;
                                                        lbDateDeparture.Color := clBtnFace;
                                                      end;

end;

procedure TEditClientCardForm.DBEditEhCarChange(Sender: TObject);
var
  Car : string;
begin
  dmDataModule.OpenSQL('select Car from CarForAdressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo and DateDeparture = :p3_DateDeparture',[quAddressPostAddressNo.Value,PostNoFirm,quDocClientCardHeadDocDate.Value+1]);
  Car := dmDataModule.QFO.FieldByName('Car').AsString;
  if DBEditEhCar.Text <> Car then begin
                                    DBEditEhCar.Color := clYellow;
                                    lbCar.Color := clYellow;
                                  end
                             else begin
                                    DBEditEhCar.Color := clWindow;
                                    lbCar.Color := clBtnFace;
                                  end;
end;

procedure TEditClientCardForm.DBEditEhCarCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  Car : string;
begin
  dmDataModule.OpenSQL('select Car from CarForAdressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo and DateDeparture = :p3_DateDeparture',[quAddressPostAddressNo.Value,PostNoFirm,quDocClientCardHeadDocDate.Value+1]);
  Car := dmDataModule.QFO.FieldByName('Car').AsString;
  if DBEditEhCar.Text <> Car then begin
                                    DBEditEhCar.Color := clYellow;
                                    lbCar.Color := clYellow;
                                  end
                             else begin
                                    DBEditEhCar.Color := clWindow;
                                    lbCar.Color := clBtnFace;
                                  end;

end;

procedure TEditClientCardForm.DBEditEhDriverChange(Sender: TObject);
var
  Driver : string;
begin
  dmDataModule.OpenSQL('select Driver from CarForAdressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo and DateDeparture = :p3_DateDeparture',[quAddressPostAddressNo.Value,PostNoFirm,quDocClientCardHeadDocDate.Value+1]);
  Driver := dmDataModule.QFO.FieldByName('Driver').AsString;
  if DBEditEhDriver.Text <> Driver then begin
                                          DBEditEhDriver.Color := clYellow;
                                          lbDriver.Color := clYellow;
                                        end
                                   else begin
                                          DBEditEhDriver.Color := clWindow;
                                          lbDriver.Color := clBtnFace;
                                        end;

end;

procedure TEditClientCardForm.DBEditEhDriverCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  Driver : string;
begin
  dmDataModule.OpenSQL('select Driver from CarForAdressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo and DateDeparture = :p3_DateDeparture',[quAddressPostAddressNo.Value,PostNoFirm,quDocClientCardHeadDocDate.Value+1]);
  Driver := dmDataModule.QFO.FieldByName('Driver').AsString;
  if DBEditEhDriver.Text <> Driver then begin
                                          DBEditEhDriver.Color := clYellow;
                                          lbDriver.Color := clYellow;
                                        end
                                   else begin
                                          DBEditEhDriver.Color := clWindow;
                                          lbDriver.Color := clBtnFace;
                                        end;

end;


procedure TEditClientCardForm.DBLookupComboboxEhRegionNoChange(
  Sender: TObject);
begin
  dmDataModule.OpenSQL('select RegionNo from AddressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBLookupComboboxEhRegionNo.Text = '' then begin
                                                 DBLookupComboboxEhRegionNo.Color := clRed
                                               end
                                          else begin
                                                 if DBLookupComboboxEhRegionNo.KeyValue <> dmDataModule.QFO.FieldByName('RegionNo').Value then begin
                                                                                                                                                 DBLookupComboboxEhRegionNo.Color := clYellow;
                                                                                                                                                 lbRegionName.Color := clYellow;
                                                                                                                                               end
                                                                                                                                          else begin
                                                                                                                                                 DBLookupComboboxEhRegionNo.Color := clWindow;
                                                                                                                                                 lbRegionName.Color := clBtnFace;
                                                                                                                                               end;
                                               end;

end;

procedure TEditClientCardForm.DBLookupComboboxEhRegionNoCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
begin
  dmDataModule.OpenSQL('select RegionNo from AddressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBLookupComboboxEhRegionNo.Text = '' then begin
                                                 DBLookupComboboxEhRegionNo.Color := clRed
                                               end
                                          else begin
                                                 if DBLookupComboboxEhRegionNo.KeyValue <> dmDataModule.QFO.FieldByName('RegionNo').Value then begin
                                                                                                                                                 DBLookupComboboxEhRegionNo.Color := clYellow;
                                                                                                                                                 lbRegionName.Color := clYellow;
                                                                                                                                               end
                                                                                                                                          else begin
                                                                                                                                                 DBLookupComboboxEhRegionNo.Color := clWindow;
                                                                                                                                                 lbRegionName.Color := clBtnFace;
                                                                                                                                               end;
                                               end;

end;

procedure TEditClientCardForm.DBEditEhCityChange(Sender: TObject);
var
  City : string;
begin
  dmDataModule.OpenSQL('select City from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhCity.Text = '' then begin
                                   DBEditEhCity.Color := clRed
                                 end
                            else begin
                                   if dmDataModule.QFO.FieldByName('City').IsNull then City := ''
                                                                                  else City := dmDataModule.QFO.FieldByName('City').Value;
                                   if DBEditEhCity.Text <> City then begin
                                                                       DBEditEhCity.Color := clYellow;
                                                                       lbCity.Color := clYellow;
                                                                     end
                                                                else begin
                                                                       DBEditEhCity.Color := clWindow;
                                                                       lbCity.Color := clBtnFace;
                                                                     end;
                                 end;
end;

procedure TEditClientCardForm.DBEditEhCityCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  City : string;
begin

  dmDataModule.OpenSQL('select City from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhCity.Text = '' then begin
                                   DBEditEhCity.Color := clRed
                                 end
                            else begin
                                   if dmDataModule.QFO.FieldByName('City').IsNull then City := ''
                                                                                  else City := dmDataModule.QFO.FieldByName('City').Value;
                                   if DBEditEhCity.Text <> City then begin
                                                                       DBEditEhCity.Color := clYellow;
                                                                       lbCity.Color := clYellow;
                                                                     end
                                                                else begin
                                                                       DBEditEhCity.Color := clWindow;
                                                                       lbCity.Color := clBtnFace;
                                                                     end;
                                 end;

end;

procedure TEditClientCardForm.DBEditEhStreetChange(Sender: TObject);
var
  Street : string;
begin
  dmDataModule.OpenSQL('select Street from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhStreet.Text = '' then begin
                                     DBEditEhStreet.Color := clRed
                                   end
                              else begin
                                     if dmDataModule.QFO.FieldByName('Street').IsNull then Street := '' else Street := dmDataModule.QFO.FieldByName('Street').Value;
                                     if DBEditEhStreet.Text <> Street then begin
                                                                             DBEditEhStreet.Color := clYellow;
                                                                             lbStreet.Color := clYellow;
                                                                           end
                                                                           else begin
                                                                                  DBEditEhStreet.Color := clWindow;
                                                                                  lbStreet.Color := clBtnFace;
                                                                                end;
                                   end;

end;

procedure TEditClientCardForm.DBEditEhStreetCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  Street : string;
begin
  dmDataModule.OpenSQL('select Street from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhStreet.Text = '' then begin
                                     DBEditEhStreet.Color := clRed
                                   end
                              else begin
                                     if dmDataModule.QFO.FieldByName('Street').IsNull then Street := '' else Street := dmDataModule.QFO.FieldByName('Street').Value;
                                     if DBEditEhStreet.Text <> Street then begin
                                                                             DBEditEhStreet.Color := clYellow;
                                                                             lbStreet.Color := clYellow;
                                                                           end
                                                                           else begin
                                                                                  DBEditEhStreet.Color := clWindow;
                                                                                  lbStreet.Color := clBtnFace;
                                                                                end;
                                   end;

end;

procedure TEditClientCardForm.DBEditEhHouseNoChange(Sender: TObject);
var
  HouseNo : string;
begin
  dmDataModule.OpenSQL('select HouseNo from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('HouseNo').IsNull then HouseNo := '' else HouseNo := dmDataModule.QFO.FieldByName('HouseNo').Value;
  if DBEditEhHouseNo.Text = '' then begin
                                      DBEditEhHouseNo.Color := clRed
                                    end
                               else begin
                                      if DBEditEhHouseNo.Text <> HouseNo then begin
                                                                                DBEditEhHouseNo.Color := clYellow;
                                                                                lbHouseNo.Color := clYellow;
                                                                              end
                                                                         else begin
                                                                                DBEditEhHouseNo.Color := clWindow;
                                                                                lbHouseNo.Color := clBtnFace;
                                                                              end;
                                    end;

end;

procedure TEditClientCardForm.DBEditEhHouseNoCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  HouseNo : string;
begin
  dmDataModule.OpenSQL('select HouseNo from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('HouseNo').IsNull then HouseNo := '' else HouseNo := dmDataModule.QFO.FieldByName('HouseNo').Value;
  if DBEditEhHouseNo.Text = '' then begin
                                      DBEditEhHouseNo.Color := clRed
                                    end
                               else begin
                                      if DBEditEhHouseNo.Text <> HouseNo then begin
                                                                                DBEditEhHouseNo.Color := clYellow;
                                                                                lbHouseNo.Color := clYellow;
                                                                              end
                                                                         else begin
                                                                                DBEditEhHouseNo.Color := clWindow;
                                                                                lbHouseNo.Color := clBtnFace;
                                                                              end;
                                    end;

end;

procedure TEditClientCardForm.DBEditEhMail1Change(Sender: TObject);
var
  Mail1 : string;
begin
  dmDataModule.OpenSQL('select isnull(Mail1,'''') as Mail1 from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('Mail1').IsNull then Mail1 := '' else Mail1 := dmDataModule.QFO.FieldByName('Mail1').Value;
  if DBEditEhMail1.Text <> Mail1 then begin
                                        DBEditEhMail1.Color := clYellow;
                                        lbMail1.Color := clYellow;
                                      end
                                 else begin
                                        DBEditEhMail1.Color := clWindow;
                                        lbMail1.Color := clBtnFace;
                                      end;

end;

procedure TEditClientCardForm.DBEditEhMail1CheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  Mail1 : string;
begin
  dmDataModule.OpenSQL('select isnull(Mail1,'''') as Mail1 from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('Mail1').IsNull then Mail1 := '' else Mail1 := dmDataModule.QFO.FieldByName('Mail1').Value;
  if DBEditEhMail1.Text <> Mail1 then begin
                                        DBEditEhMail1.Color := clYellow;
                                        lbMail1.Color := clYellow;
                                      end
                                 else begin
                                        DBEditEhMail1.Color := clWindow;
                                        lbMail1.Color := clBtnFace;
                                      end;

end;

procedure TEditClientCardForm.DBEditEhMail2Change(Sender: TObject);
var
  Mail2 : string;
begin
  dmDataModule.OpenSQL('select isnull(Mail2,'''') as Mail2 from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('Mail2').IsNull then Mail2 := '' else Mail2 := dmDataModule.QFO.FieldByName('Mail2').Value;
  if DBEditEhMail2.Text <> Mail2 then begin
                                        DBEditEhMail2.Color := clYellow;
                                        lbMail2.Color := clYellow;
                                      end
                                 else begin
                                        DBEditEhMail2.Color := clWindow;
                                        lbMail2.Color := clBtnFace;
                                      end;

end;

procedure TEditClientCardForm.DBEditEhMail2CheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  Mail2 : string;
begin
  dmDataModule.OpenSQL('select isnull(Mail2,'''') as Mail2 from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('Mail2').IsNull then Mail2 := '' else Mail2 := dmDataModule.QFO.FieldByName('Mail2').Value;
  if DBEditEhMail2.Text <> Mail2 then begin
                                        DBEditEhMail2.Color := clYellow;
                                        lbMail2.Color := clYellow;
                                      end
                                 else begin
                                        DBEditEhMail2.Color := clWindow;
                                        lbMail2.Color := clBtnFace;
                                      end;

end;

procedure TEditClientCardForm.DBEditEhMail3Change(Sender: TObject);
var
  Mail3 : string;
begin
  dmDataModule.OpenSQL('select isnull(Mail3,'''') as Mail3 from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('Mail3').IsNull then Mail3 := '' else Mail3 := dmDataModule.QFO.FieldByName('Mail3').Value;
  if DBEditEhMail3.Text <> Mail3 then begin
                                        DBEditEhMail3.Color := clYellow;
                                        lbMail3.Color := clYellow;
                                      end
                                 else begin
                                        DBEditEhMail3.Color := clWindow;
                                        lbMail3.Color := clBtnFace;
                                      end;

end;

procedure TEditClientCardForm.DBEditEhMail3CheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  Mail3 : string;
begin
  dmDataModule.OpenSQL('select isnull(Mail3,'''') as Mail3 from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('Mail3').IsNull then Mail3 := '' else Mail3 := dmDataModule.QFO.FieldByName('Mail3').Value;
  if DBEditEhMail3.Text <> Mail3 then begin
                                        DBEditEhMail3.Color := clYellow;
                                        lbMail3.Color := clYellow;
                                      end
                                 else begin
                                        DBEditEhMail3.Color := clWindow;
                                        lbMail3.Color := clBtnFace;
                                      end;

end;

procedure TEditClientCardForm.DBEditEhTopicChange(Sender: TObject);
var
  Topic : string;
begin
  dmDataModule.OpenSQL('select Topic from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('Topic').IsNull then Topic := '' else Topic := dmDataModule.QFO.FieldByName('Topic').Value;
  if DBEditEhTopic.Text <> Topic then begin
                                        DBEditEhTopic.Color := clYellow;
                                        lbTopic.Color := clYellow;
                                      end
                                 else begin
                                        DBEditEhTopic.Color := clWindow;
                                        lbTopic.Color := clBtnFace;
                                      end;

end;

procedure TEditClientCardForm.DBEditEhTopicCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  Topic : string;
begin
  dmDataModule.OpenSQL('select Topic from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('Topic').IsNull then Topic := '' else Topic := dmDataModule.QFO.FieldByName('Topic').Value;
  if DBEditEhTopic.Text <> Topic then begin
                                        DBEditEhTopic.Color := clYellow;
                                        lbTopic.Color := clYellow;
                                      end
                                 else begin
                                        DBEditEhTopic.Color := clWindow;
                                        lbTopic.Color := clBtnFace;
                                      end;

end;

procedure TEditClientCardForm.DBEditEhMessageChange(Sender: TObject);
var
  Message : string;
begin
  dmDataModule.OpenSQL('select Message from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('Message').IsNull then Message := '' else Message := dmDataModule.QFO.FieldByName('Message').Value;
  if DBEditEhMessage.Text <> Message then begin
                                            DBEditEhMessage.Color := clYellow;
                                            lbMessage.Color := clYellow;
                                          end
                                     else begin
                                            DBEditEhMessage.Color := clWindow;
                                            lbMessage.Color := clBtnFace;
                                          end;

end;

procedure TEditClientCardForm.DBEditEhMessageCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  Message : string;
begin
  dmDataModule.OpenSQL('select Message from Post_Mail l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('Message').IsNull then Message := '' else Message := dmDataModule.QFO.FieldByName('Message').Value;
  if DBEditEhMessage.Text <> Message then begin
                                            DBEditEhMessage.Color := clYellow;
                                            lbMessage.Color := clYellow;
                                          end
                                     else begin
                                            DBEditEhMessage.Color := clWindow;
                                            lbMessage.Color := clBtnFace;
                                          end;

end;

procedure TEditClientCardForm.DBEditEhCodeChange(
  Sender: TObject);
var
  Code : string;
begin
  dmDataModule.OpenSQL('select Code from L_AddressPostSalesChannelsOfPepsico l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('Code').IsNull then Code := '' else Code := dmDataModule.QFO.FieldByName('Code').Value;
  if DBEditEhCode.Text <> Code then begin
                                      DBEditEhCode.Color := clYellow;
                                      lbCode.Color := clYellow;
                                    end
                               else begin
                                      DBEditEhCode.Color := clWindow;
                                      lbCode.Color := clBtnFace;
                                    end;

end;

procedure TEditClientCardForm.DBEditEhCodeCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  Code : string;
begin
  dmDataModule.OpenSQL('select Code from L_AddressPostSalesChannelsOfPepsico l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('Code').IsNull then Code := '' else Code := dmDataModule.QFO.FieldByName('Code').Value;
  if DBEditEhCode.Text <> Code then begin
                                      DBEditEhCode.Color := clYellow;
                                      lbCode.Color := clYellow;
                                    end
                               else begin
                                      DBEditEhCode.Color := clWindow;
                                      lbCode.Color := clBtnFace;
                                    end;

end;

procedure TEditClientCardForm.DBEditEhKOATUUChange(Sender: TObject);
var
  KOATUU_ID_CODE : string;
begin
  dmDataModule.OpenSQL('select KOATUU_ID_CODE from L_AddressPostKOATUUOfPepsico l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('KOATUU_ID_CODE').IsNull then KOATUU_ID_CODE := '' else KOATUU_ID_CODE :=dmDataModule.QFO.FieldByName('KOATUU_ID_CODE').Value;
  if DBEditEhKOATUU.Text <> KOATUU_ID_CODE then begin
                                                  DBEditEhKOATUU.Color := clYellow;
                                                  lbKOATUU.Color := clYellow;
                                                end
                                           else begin
                                                  DBEditEhKOATUU.Color := clWindow;
                                                  lbKOATUU.Color := clBtnFace;
                                                end;

end;

procedure TEditClientCardForm.DBEditEhKOATUUCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  KOATUU_ID_CODE : string;
begin
  dmDataModule.OpenSQL('select KOATUU_ID_CODE from L_AddressPostKOATUUOfPepsico l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('KOATUU_ID_CODE').IsNull then KOATUU_ID_CODE := '' else KOATUU_ID_CODE :=dmDataModule.QFO.FieldByName('KOATUU_ID_CODE').Value;
  if DBEditEhKOATUU.Text <> KOATUU_ID_CODE then begin
                                                  DBEditEhKOATUU.Color := clYellow;
                                                  lbKOATUU.Color := clYellow;
                                                end
                                           else begin
                                                  DBEditEhKOATUU.Color := clWindow;
                                                  lbKOATUU.Color := clBtnFace;
                                                end;

end;

procedure TEditClientCardForm.DBEditEhCommerce_NetworkChange(Sender: TObject);
var
  Commerce_Network : string;
begin
  dmDataModule.OpenSQL('select Commerce_Network from L_AddressPost_CODE_Commerce_Network_Of_Pepsico l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('Commerce_Network').IsNull then Commerce_Network := '' else Commerce_Network := dmDataModule.QFO.FieldByName('Commerce_Network').Value;
  if DBEditEhCommerce_Network.Text <> Commerce_Network then begin
                                                              DBEditEhCommerce_Network.Color := clYellow;
                                                              lbCommerce_Network.Color := clYellow;
                                                            end
                                                       else begin
                                                              DBEditEhCommerce_Network.Color := clWindow;
                                                              lbCommerce_Network.Color := clBtnFace;
                                                            end;

end;

procedure TEditClientCardForm.DBEditEhCommerce_NetworkCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
var
  Commerce_Network : string;
begin
  dmDataModule.OpenSQL('select Commerce_Network from L_AddressPost_CODE_Commerce_Network_Of_Pepsico l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if dmDataModule.QFO.FieldByName('Commerce_Network').IsNull then Commerce_Network := '' else Commerce_Network := dmDataModule.QFO.FieldByName('Commerce_Network').Value;
  if DBEditEhCommerce_Network.Text <> Commerce_Network then begin
                                                              DBEditEhCommerce_Network.Color := clYellow;
                                                              lbCommerce_Network.Color := clYellow;
                                                            end
                                                       else begin
                                                              DBEditEhCommerce_Network.Color := clWindow;
                                                              lbCommerce_Network.Color := clBtnFace;
                                                            end;

end;

procedure TEditClientCardForm.DBGridEhAddressKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
  VK_INSERT: quAddressPost.Append;
  VK_DOWN,VK_UP:SearchString:='';
  VK_DELETE: if IsSignature = False then if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quAddressPost.Delete;
 end;
end;

procedure TEditClientCardForm.DBGridEhSotrudKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
  VK_INSERT: quSotrudAddress.Append;
  VK_DOWN,VK_UP:SearchString:='';
  VK_DELETE: if IsSignature = False Then if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quSotrudAddress.Delete;
 end;
end;

procedure TEditClientCardForm.DBGridEhDelayKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
  VK_INSERT: quDalay.Append;
  VK_DOWN,VK_UP:SearchString:='';
  VK_DELETE: if IsSignature = False Then if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quDalay.Delete;
 end;
end;

procedure TEditClientCardForm.DBGridEhPriceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
  VK_INSERT: quPrice.Append;
  VK_DOWN,VK_UP:SearchString:='';
  VK_DELETE: if IsSignature = False Then if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quPrice.Delete;
 end;
end;

procedure TEditClientCardForm.quSotrudAddressAfterPost(DataSet: TDataSet);
begin
  quSotrudAddress.Close;
  quSotrudAddress.Open;
end;

procedure TEditClientCardForm.quPriceBeforePost(DataSet: TDataSet);
begin
  quPriceDocId.Value := MaxId;
  quPricePostNo.Value := PostNoFirm;
end;

procedure TEditClientCardForm.DBEditEhClassifierNameDblClick(
  Sender: TObject);
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

end;

procedure TEditClientCardForm.DBEditEhClassifierNameCheckDrawRequiredState(
  Sender: TObject; var DrawState: Boolean);
begin
  dmDataModule.OpenSQL('select c.ClassifierName from L_AddressPostClassifierABCDZ l left join ClassifierABCDZ c on l.ClassifierNo = c.ClassifierNo where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhClassifierName.Text <>  dmDataModule.QFO.FieldByName('ClassifierName').AsString then begin
                                                                                                    DBEditEhClassifierName.Color := clYellow;
                                                                                                    lbClassifierName.Color := clYellow;
                                                                                                  end
                                                                                             else begin
                                                                                                    DBEditEhClassifierName.Color := clWindow;
                                                                                                    lbClassifierName.Color := clBtnFace;
                                                                                                  end;

end;

procedure TEditClientCardForm.DBEditEhClassifierNameChange(
  Sender: TObject);
begin
  dmDataModule.OpenSQL('select c.ClassifierName from L_AddressPostClassifierABCDZ l left join ClassifierABCDZ c on l.ClassifierNo = c.ClassifierNo where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);
  if DBEditEhClassifierName.Text <>  dmDataModule.QFO.FieldByName('ClassifierName').AsString then begin
                                                                                                    DBEditEhClassifierName.Color := clYellow;
                                                                                                    lbClassifierName.Color := clYellow;
                                                                                                  end
                                                                                             else begin
                                                                                                    DBEditEhClassifierName.Color := clWindow;
                                                                                                    lbClassifierName.Color := clBtnFace;
                                                                                                  end;

end;

procedure TEditClientCardForm.DBGridEhSignatureGetCellParams(
  Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if Column = nil then exit;
  if (Column.FieldName = 'is_signature') and quListUserForVidDoc.FieldByName('is_signature').Value = true then
   Background:= clLime;

end;

procedure TEditClientCardForm.DBGridEhAddressGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
 AddressNo : integer;
 Address : string;
 Active : boolean;
begin
  if Column = nil then exit;

  dmDataModule.OpenSQL('select AddressNo, Address, Active from AddressPost l where l.AddressNo = :p1_AddressNo and l.PostNo = :p2_PostNo',[quAddressPostAddressNo.Value,PostNoFirm]);

  if dmDataModule.QFO.FieldByName('AddressNo').IsNull then AddressNo := 0
                                                      else AddressNo := dmDataModule.QFO.FieldByName('AddressNo').Value;
  if dmDataModule.QFO.FieldByName('Address').IsNull then Addressno :=0
                                                    else Address := dmDataModule.QFO.FieldByName('Address').Value;
  if not dmDataModule.QFO.FieldByName('Active').IsNull then Active := dmDataModule.QFO.FieldByName('Active').Value;


  if ((Column.FieldName = 'AddressNo') and (quAddressPostAddressNo.Value <> AddressNo)) then begin
                                                                                               Background := clYellow;
                                                                                               AFont.Color := clRed;
                                                                                             end;
  if ((Column.FieldName = 'AddressNo') and (quAddressPostAddressNo.Value = AddressNo)) then begin
                                                                                               Background := clWindow;
                                                                                               AFont.Color := clNone;
                                                                                             end;

  if ((Column.FieldName = 'Address') and (quAddressPostAddress.Value <> Address)) then begin
                                                                                         Background := clYellow;
                                                                                         AFont.Color := clRed;
                                                                                       end;
  if ((Column.FieldName = 'Address') and (quAddressPostAddress.Value = Address)) then begin
                                                                                        Background := clWindow;
                                                                                        AFont.Color := clNone;
                                                                                      end;

  if ((Column.FieldName = 'Active') and (quAddressPostActive.Value <> Active)) then begin
                                                                                      Background := clYellow;
                                                                                      AFont.Color := clRed;
                                                                                    end;
  if ((Column.FieldName = 'Active') and (quAddressPostActive.Value = Active)) then begin
                                                                                     Background := clWindow;
                                                                                     AFont.Color := clNone;
                                                                                   end;

end;

procedure TEditClientCardForm.quAddressPostAfterPost(DataSet: TDataSet);
begin
  quAddressPost.Close;
  quAddressPost.Open;

end;

procedure TEditClientCardForm.DBGridEhSotrudGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
 SotrudNo, OtdelNo : integer;
// DateBeg,DateEnd : TDatetime;
 Active : boolean;
begin
  if Column = nil then exit;

  dmDataModule.OpenSQL('select s.SotrudNo,s.SotrudOtdel,d.Active as ActiveAddress,DateBegOnActive,DateEndOnActive from d_sotrud_address d left join AddressPost ap on d.AddressPost_id=ap.ID left join Sotrud s on s.SotrudNo=d.SotrudNo where ap.ID=:p1_id and s.SotrudNo=:p2_SotrudNo',[quAddressPostApId.Value,quSotrudAddressSotrudNo.Value]);

  if dmDataModule.QFO.FieldByName('SotrudNo').IsNull then SotrudNo := 0
                                                     else SotrudNo := dmDataModule.QFO.FieldByName('SotrudNo').Value;

  if dmDataModule.QFO.FieldByName('SotrudOtdel').IsNull then OtdelNo := 0
                                                        else OtdelNo := dmDataModule.QFO.FieldByName('SotrudOtdel').Value;

  if not dmDataModule.QFO.FieldByName('ActiveAddress').IsNull then Active := dmDataModule.QFO.FieldByName('ActiveAddress').Value;




  if ((Column.FieldName = 'Sotrud') and (quSotrudAddressSotrudNo.Value <> SotrudNo)) then begin
                                                                                            Background := clYellow;
                                                                                            AFont.Color := clRed;
                                                                                          end;
  if ((Column.FieldName = 'Sotrud') and (quSotrudAddressSotrudNo.Value = SotrudNo)) then begin
                                                                                           Background := clWindow;
                                                                                           AFont.Color := clNone;
                                                                                         end;
  if ((Column.FieldName = 'SotrudOtdelName') and (quSotrudAddressOtdelNom.Value <> OtdelNo)) then begin
                                                                                                  Background := clYellow;
                                                                                                  AFont.Color := clRed;
                                                                                                end;
  if ((Column.FieldName = 'SotrudOtdelName') and (quSotrudAddressOtdelNom.Value = OtdelNo)) then begin
                                                                                                 Background := clWindow;
                                                                                                 AFont.Color := clNone;
                                                                                               end;
  if ((Column.FieldName = 'Active') and (quSotrudAddressActive.Value <> Active)) then begin
                                                                                        Background := clYellow;
                                                                                        AFont.Color := clRed;
                                                                                      end;
  if ((Column.FieldName = 'Active') and (quSotrudAddressActive.Value = Active)) then begin
                                                                                       Background := clWindow;
                                                                                       AFont.Color := clNone;
                                                                                     end;
  if ((Column.FieldName = 'DateBegOnActive') and (quSotrudAddressDateBegOnActive.Value <> dmDataModule.QFO.FieldByName('DateBegOnActive').Value)) then begin
                                                                                                                                                         Background := clYellow;
                                                                                                                                                         AFont.Color := clRed;
                                                                                                                                                       end;
  if ((Column.FieldName = 'DateBegOnActive') and (quSotrudAddressDateEndOnActive.Value = dmDataModule.QFO.FieldByName('DateBegOnActive').Value)) then begin
                                                                                                                                                         Background := clWindow;
                                                                                                                                                         AFont.Color := clNone;
                                                                                                                                                       end;
  if ((Column.FieldName = 'DateEndOnActive') and
      (quSotrudAddressDateBegOnActive.Value <> dmDataModule.QFO.FieldByName('DateEndOnActive').Value) and
       not dmDataModule.QFO.FieldByName('DateEndOnActive').IsNull) then begin
                                                                          Background := clYellow;
                                                                          AFont.Color := clRed;
                                                                        end;
  if ((Column.FieldName = 'DateEndOnActive') and (quSotrudAddressDateEndOnActive.Value = dmDataModule.QFO.FieldByName('DateEndOnActive').Value)) then begin
                                                                                                                                                         Background := clWindow;
                                                                                                                                                         AFont.Color := clNone;
                                                                                                                                                       end;
end;

procedure TEditClientCardForm.DBGridEhDelayGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
  CheckDBGridEhDelayDoc : TMSQuery;
begin
  if Column = nil then exit;

  CheckDBGridEhDelayDoc:=TMSQuery.Create(nil);
  CheckDBGridEhDelayDoc.Connection:=dmDataModule.DB;
  CheckDBGridEhDelayDoc.SQL.Clear;
  CheckDBGridEhDelayDoc.SQL.Text:= 'select l.id '
                                  +'      ,l.SET_ARTICLE_GROUP_ID '
                                  +'      ,(select name from d_set_article_group where id=l.SET_ARTICLE_GROUP_ID) as set_article_group_Name '
                                  +'      ,l.PostNo '
                                  +'      ,l.Day_delay '
                                  +'      ,l.Day_delay_ext '
                                  +'      ,l.buh '
                                  +'      ,(select Buh_type_name from d_buh_type t where t.buh=l.buh) as buh_name '
                                  +'      ,isnull (lpb.PayBan,0) as PayBan '
                                  +'from L_POST_SET_ARTGROUP_DELAY l left join '
                                  +'     L_Post_Set_ArtGroup_PayBan lpb on (l.POSTNO = lpb.PostNo_PayBan '
                                  +'                                    and l.SET_ARTICLE_GROUP_ID = lpb.SET_ARTICLE_GROUP_ID_PayBan '
                                  +'                                    and l.Buh = lpb.Buh) '
                                  +' where l.PostNo = :PostNo '
                                  +'   and l.SET_ARTICLE_GROUP_ID = :SET_ARTICLE_GROUP_ID '
                                  +'   and l.buh = :buh ';
  CheckDBGridEhDelayDoc.ParamByName('PostNo').Value := PostNoFirm;
  CheckDBGridEhDelayDoc.ParamByName('SET_ARTICLE_GROUP_ID').Value := quDalaySetArticleGroupId.Value;
  CheckDBGridEhDelayDoc.ParamByName('buh').Value := quDalayBuh.Value;
  CheckDBGridEhDelayDoc.Open;

  dmDataModule.OpenSQL('select * from L_POST_SET_ARTGROUP_DELAY ld  where ld.BUH = :p1_Buh and ld.POSTNO = :p2_PostNo and ld.SET_ARTICLE_GROUP_ID = :p3_SET_ARTICLE_GROUP_ID ',[quDalayBUH.Value,quDalayPostNo.Value,quDalaySetArticleGroupId.Value]);

  if ((Column.FieldName = 'NameGroup') and (quDalaySetArticleGroupId.Value <> CheckDBGridEhDelayDoc.FieldByName('SET_ARTICLE_GROUP_ID').Value)) then begin
                                                                                                                                                       Background := clYellow;
                                                                                                                                                       AFont.Color := clRed;
                                                                                                                                                     end;
  if ((Column.FieldName = 'NameGroup') and (quDalaySetArticleGroupId.Value = CheckDBGridEhDelayDoc.FieldByName('SET_ARTICLE_GROUP_ID').Value)) then begin
                                                                                                                                                      Background := clWindow;
                                                                                                                                                      AFont.Color := clNone;
                                                                                                                                                    end;

  if ((Column.FieldName = 'BuhTypeName') and (quDalayBuh.Value <> CheckDBGridEhDelayDoc.FieldByName('Buh').Value)) then begin
                                                                                                                      Background := clYellow;
                                                                                                                      AFont.Color := clRed;
                                                                                                                    end;
  if ((Column.FieldName = 'BuhTypeName') and (quDalayBuh.Value = CheckDBGridEhDelayDoc.FieldByName('Buh').Value)) then begin
                                                                                                                     Background := clWindow;
                                                                                                                     AFont.Color := clNone;
                                                                                                                   end;

  if ((Column.FieldName = 'DAY_DELAY') and (quDalayDAY_DELAY.Value <> CheckDBGridEhDelayDoc.FieldByName('DAY_DELAY').Value)) then begin
                                                                                                                                Background := clYellow;
                                                                                                                                AFont.Color := clRed;
                                                                                                                              end;
  if ((Column.FieldName = 'DAY_DELAY') and (quDalayDAY_DELAY.Value = CheckDBGridEhDelayDoc.FieldByName('DAY_DELAY').Value)) then begin
                                                                                                                               Background := clWindow;
                                                                                                                               AFont.Color := clNone;
                                                                                                                             end;
  if ((Column.FieldName = 'DAY_DELAY_EXT') and (quDalayDAY_DELAY_EXT.Value <> CheckDBGridEhDelayDoc.FieldByName('DAY_DELAY_EXT').Value)) then begin
                                                                                                                                            Background := clYellow;
                                                                                                                                            AFont.Color := clRed;
                                                                                                                                          end;
  if ((Column.FieldName = 'DAY_DELAY_EXT') and (quDalayDAY_DELAY_EXT.Value = CheckDBGridEhDelayDoc.FieldByName('DAY_DELAY_EXT').Value)) then begin
                                                                                                                                           Background := clWindow;
                                                                                                                                           AFont.Color := clNone;
                                                                                                                                         end;

  dmDataModule.OpenSQL('select * from L_Post_Set_ArtGroup_PayBan ld where ld.BUH = :p1_Buh and ld.PostNo_PayBan = :p2_PostNo and ld.Set_Article_Group_Id_PayBan = :p3_Set_Article_Group_Id_PayBan ',[quDalayBUH.Value,quDalayPostNo.Value,quDalaySetArticleGroupId.Value]);

  if ((Column.FieldName = 'PayBan') and (quDalayPayBan.Value <> CheckDBGridEhDelayDoc.FieldByName('PayBan').Value)) then begin
                                                                                                                       Background := clYellow;
                                                                                                                       AFont.Color := clRed;
                                                                                                                     end;
  if ((Column.FieldName = 'PayBan') and (quDalayPayBan.Value = CheckDBGridEhDelayDoc.FieldByName('PayBan').Value)) then begin
                                                                                                                      Background := clWindow;
                                                                                                                      AFont.Color := clNone;
                                                                                                                    end;

end;

procedure TEditClientCardForm.DBGridEhPriceGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if Column = nil then exit;
  dmDataModule.OpenSQL('select * from L_POST_SET_ARTGROUP_PRICE where SET_ARTICLE_GROUP_ID = :p1_SET_ARTICLE_GROUP_ID and POSTNO = :p2_PostNo and ColNPrice is not null',[quPriceSetArticleGroupId.Value,PostNoFirm]);

  if ((Column.FieldName = 'GroupName') and (quPriceSetArticleGroupId.Value <> dmDataModule.QFO.FieldByName('SET_ARTICLE_GROUP_ID').Value) and (quPricePostNo.Value <> dmDataModule.QFO.FieldByName('SET_ARTICLE_GROUP_ID').Value)) then begin
                                                                                                                                                                                                                                        Background := clYellow;
                                                                                                                                                                                                                                        AFont.Color := clRed;
                                                                                                                                                                                                                                      end;

  if ((Column.FieldName = 'GroupName') and (quPriceSetArticleGroupId.Value = dmDataModule.QFO.FieldByName('SET_ARTICLE_GROUP_ID').Value) and (quPricePostNo.Value = dmDataModule.QFO.FieldByName('SET_ARTICLE_GROUP_ID').Value)) then begin
                                                                                                                                                                                                                                      Background := clWindow;
                                                                                                                                                                                                                                      AFont.Color := clNone;
                                                                                                                                                                                                                                      end;

  if ((Column.FieldName = 'PriceType') and (quPriceColNPrice.Value <> dmDataModule.QFO.FieldByName('COLNPRICE').Value) and (quPricePostNo.Value <> dmDataModule.QFO.FieldByName('SET_ARTICLE_GROUP_ID').Value)) then begin
                                                                                                                                                                                                                                        Background := clYellow;
                                                                                                                                                                                                                                        AFont.Color := clRed;
                                                                                                                                                                                                                                      end;

  if ((Column.FieldName = 'PriceType') and (quPriceColNPrice.Value = dmDataModule.QFO.FieldByName('COLNPRICE').Value) and (quPricePostNo.Value = dmDataModule.QFO.FieldByName('SET_ARTICLE_GROUP_ID').Value)) then begin
                                                                                                                                                                                                                                      Background := clWindow;
                                                                                                                                                                                                                                      AFont.Color := clNone;
                                                                                                                                                                                                                                      end;
end;

procedure TEditClientCardForm.DBGridEhAddressDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if quAddressPostisEdit.AsBoolean then
    DBGridEhAddress.Canvas.Brush.Color := clYellow;
  DBGridEhAddress.DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

procedure TEditClientCardForm.cbIsEditClick(Sender: TObject);
begin
  quAddressPost.Close;
  quAddressPost.Open;
end;

procedure TEditClientCardForm.quListUserForVidDocBeforeOpen(
  DataSet: TDataSet);
begin
  quListUserForVidDoc.ParamByName('id').Value := MaxId;

end;

procedure TEditClientCardForm.bbConductingDocClick(Sender: TObject);
var
  ListNameErr : string;
begin
  if DBEditEhCategoryName.Text = '' then ListNameErr := ListNameErr + ' Категория ТТ,';
  if DBEditEhTimeBeg.Text = '' then ListNameErr := ListNameErr + ' Работа с,';
  if DBEditEhTimeEnd.Text = '' then ListNameErr := ListNameErr + ' Работа по,';
  if DBEditEhUnloading.Text = '' then ListNameErr := ListNameErr + ' Разгрузка(мин.),';
  if DBEditEhX.Text = '' then ListNameErr := ListNameErr + ' Широта,';
  if DBEditEhX.Text = '' then ListNameErr := ListNameErr + ' Долгота,';
  if DBLookupComboboxEhRegionNo.Text = '' then ListNameErr := ListNameErr + ' Район,';
  if DBEditEhCity.Text = '' then ListNameErr := ListNameErr + ' Город,';
  if DBEditEhStreet.Text = '' then ListNameErr := ListNameErr + ' Улица,';
  if DBEditEhHouseNo.Text = '' then ListNameErr := ListNameErr + ' № Дома,';

  delete (ListNameErr,Length(ListNameErr)-1,Length(ListNameErr));

  if ListNameErr <> '' then begin
                              ActiveControl := gbAdvancetProvAddress;
                              raise Exception.Create('Не заполнены обязательные поля!!!' + #10#13 + ListNameErr);
                            end;


  if Application.MessageBox('Вы уверены?','Внимание! Провести документ!',MB_YESNO)=IDYES then
   begin
     dmDataModule.ExecSQL('exec sp_CreateAddressPostWithDoc :p1_DocId',[MaxId]);
     ShowMessage('Документ № '+ IntToStr(MaxId)+ ' проведен.');
   end;

end;

procedure TEditClientCardForm.DBGridEhAddressExit(Sender: TObject);
 var
   AddressPostId : integer;
begin
  inherited;

  if (quAddressPost.State in [dsInsert, dsEdit]) then quAddressPost.Post else quAddressPost.Cancel;

  AddressPostId := quAddressPostApId.Value;


  quAddressPost.Close;
  quAddressPost.Open;

  quAddressPost.Locate('ApId',AddressPostId,[]);
end;

procedure TEditClientCardForm.DBGridEhSotrudExit(Sender: TObject);
var
  id : largeint;
begin
  inherited;
  if (quSotrudAddress.State in [dsInsert, dsEdit]) then quSotrudAddress.Post else quSotrudAddress.Cancel;

  Id := quSotrudAddressId.Value;


  quSotrudAddress.Close;
  quSotrudAddress.Open;

  quSotrudAddress.Locate('Id',Id,[]);
end;

procedure TEditClientCardForm.DBGridEhDelayExit(Sender: TObject);
var
  id : largeint;
begin
  inherited;
  if (quDalay.State in [dsInsert, dsEdit]) then quDalay.Post else quDalay.Cancel;

  Id := quDalayId.Value;


  quDalay.Close;
  quDalay.Open;

  quDalay.Locate('Id',Id,[]);
end;

procedure TEditClientCardForm.DBGridEhPriceExit(Sender: TObject);
var
  id : largeint;
begin
  inherited;
  if (quPrice.State in [dsInsert, dsEdit]) then quPrice.Post else quPrice.Cancel;

  Id := quPriceId.Value;


  quPrice.Close;
  quPrice.Open;

  quPrice.Locate('Id',Id,[]);
end;

procedure TEditClientCardForm.quDocClientCardPostGroupCuttingSpecBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  quDocClientCardPostGroupCuttingSpec.ParamByName('DocId').Value := MaxId;
end;

procedure TEditClientCardForm.quDocClientCardPostGroupCuttingSpecBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  quDocClientCardPostGroupCuttingSpecDocId.Value := MaxId;
  quDocClientCardPostGroupCuttingSpecPostNo.Value := PostNoFirm;
end;

procedure TEditClientCardForm.DBGridEhGroupCuttingExit(Sender: TObject);
var
  id : largeint;
begin
  inherited;
  if (quDocClientCardPostGroupCuttingSpec.State in [dsInsert, dsEdit]) then quDocClientCardPostGroupCuttingSpec.Post else quDocClientCardPostGroupCuttingSpec.Cancel;

  Id := quDocClientCardPostGroupCuttingSpecId.Value;


  quDocClientCardPostGroupCuttingSpec.Close;
  quDocClientCardPostGroupCuttingSpec.Open;

  quDocClientCardPostGroupCuttingSpec.Locate('Id',Id,[]);
end;

procedure TEditClientCardForm.DBGridEhGroupCuttingGetCellParams(
  Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
  CheckDBGridEhGroupCuttingDoc : TMSQuery;
begin
  inherited;
  if Column = nil then exit;

  CheckDBGridEhGroupCuttingDoc:=TMSQuery.Create(nil);
  CheckDBGridEhGroupCuttingDoc.Connection:=dmDataModule.DB;
  CheckDBGridEhGroupCuttingDoc.SQL.Clear;
  CheckDBGridEhGroupCuttingDoc.SQL.Text:= 'select id '
                                         +'  	  ,	PostNo '
                                         +'	    , GroupCuttingId '
                                         +'	    , GroupCuttingVidNo '
                                         +'  	  , IsLock '
                                         +' from l_PostGroupCutting '
                                         +'  where PostNo = :PostNo '
                                         +'    and GroupCuttingId = :GroupCuttingId '
                                         +'    and GroupCuttingVidNo = :GroupCuttingVidNo ';
  CheckDBGridEhGroupCuttingDoc.ParamByName('PostNo').Value := PostNoFirm;
  CheckDBGridEhGroupCuttingDoc.ParamByName('GroupCuttingId').Value := quDocClientCardPostGroupCuttingSpecGroupCuttingId.Value;
  CheckDBGridEhGroupCuttingDoc.ParamByName('GroupCuttingVidNo').Value := quDocClientCardPostGroupCuttingSpecGroupCuttingVidNo.Value;
  CheckDBGridEhGroupCuttingDoc.Open;

  if ((Column.FieldName = 'GroupCuttingName') and (quDocClientCardPostGroupCuttingSpecGroupCuttingId.Value <> CheckDBGridEhGroupCuttingDoc.FieldByName('GroupCuttingId').Value)) then begin
                                                                                                                                                                                        Background := clYellow;
                                                                                                                                                                                        AFont.Color := clRed;
                                                                                                                                                                                      end;
  if ((Column.FieldName = 'GroupCuttingName') and (quDocClientCardPostGroupCuttingSpecGroupCuttingId.Value = CheckDBGridEhGroupCuttingDoc.FieldByName('GroupCuttingId').Value)) then begin
                                                                                                                                                                                       Background := clWindow;
                                                                                                                                                                                       AFont.Color := clNone;
                                                                                                                                                                                     end;

  if ((Column.FieldName = 'VidName') and (quDocClientCardPostGroupCuttingSpecGroupCuttingVidNo.Value <> CheckDBGridEhGroupCuttingDoc.FieldByName('GroupCuttingVidNo').Value)) then begin
                                                                                                                                                                                     Background := clYellow;
                                                                                                                                                                                     AFont.Color := clRed;
                                                                                                                                                                                   end;
  if ((Column.FieldName = 'VidName') and (quDocClientCardPostGroupCuttingSpecGroupCuttingVidNo.Value = CheckDBGridEhGroupCuttingDoc.FieldByName('GroupCuttingVidNo').Value)) then begin
                                                                                                                                                                                    Background := clWindow;
                                                                                                                                                                                    AFont.Color := clNone;
                                                                                                                                                                                  end;

  if ((Column.FieldName = 'IsLock') and (quDocClientCardPostGroupCuttingSpecIsLock.Value <> CheckDBGridEhGroupCuttingDoc.FieldByName('IsLock').Value)) then begin
                                                                                                                                                              Background := clYellow;
                                                                                                                                                              AFont.Color := clRed;
                                                                                                                                                            end;
  if ((Column.FieldName = 'IsLock') and (quDocClientCardPostGroupCuttingSpecIsLock.Value = CheckDBGridEhGroupCuttingDoc.FieldByName('IsLock').Value)) then begin
                                                                                                                                                             Background := clWindow;
                                                                                                                                                             AFont.Color := clNone;
                                                                                                                                                           end;
end;
procedure TEditClientCardForm.DBGridEhGroupCuttingKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 case Key of
  VK_INSERT : quDocClientCardPostGroupCuttingSpec.Append;
  VK_DOWN,VK_UP : SearchString:='';
  VK_DELETE : if IsSignature = False Then if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
               quDocClientCardPostGroupCuttingSpec.Delete;
 end;
end;

procedure TEditClientCardForm.quDalayAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dmDataModule.OpenSQL('select c.l_code, c.Name from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0');
  if quDalay.State in [dsInsert,dsEdit] then begin
                                               if quDalayCurrency.IsNull then quDalayCurrency.Value := dmDataModule.QFO.FieldByName('l_code').Value;
                                               if quDalayCyrrencyName.IsNull then quDalayCyrrencyName.Value := dmDataModule.QFO.FieldByName('Name').Value;
                                             end;  

end;

procedure TEditClientCardForm.quDalayAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dmDataModule.OpenSQL('select c.l_code, c.Name from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0');
  quDalayCurrency.Value := dmDataModule.QFO.FieldByName('l_code').Value;
  quDalayCyrrencyName.Value := dmDataModule.QFO.FieldByName('Name').Value;
end;

end.


