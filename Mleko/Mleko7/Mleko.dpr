program Mleko;

uses
  SysUtils,
  Forms,
  Controls,
  Post0 in 'Post0.pas' {fmPost},
  data in 'data.pas' {dmDataModule: TDataModule},
  main in 'main.pas' {fmMain},
  CFLMLKCustom in 'CFLMLKCustom.pas' {CFLMLKCustomForm},
  CFLMLKMDIChild in 'CFLMLKMDIChild.pas' {CFLMLKMDIChildForm},
  CFLMLKSelect in 'CFLMLKSelect.pas' {CFLMLKSelectDlg},
  CFLMLKList in 'CFLMLKList.pas' {CFLMLKListForm},
  CFLMLKProp in 'CFLMLKProp.pas' {CFLMLKPropDlg},
  CFLMLKPropDb in 'CFLMLKPropDb.pas' {CFLMLKPropDbDlg},
  Tovar0 in 'Tovar0.pas' {fmTovar},
  Ostatok in 'Ostatok.pas' {fmOstatok},
  Ostatok2 in 'Ostatok2.pas' {fmOstatok2},
  About in 'About.pas' {AboutBox},
  PrihodTov in 'PrihodTov.pas' {fmPrihodTov},
  DolgNash in 'DolgNash.pas' {fmDolgNash},
  PrintNaklP in 'PrintNaklP.pas' {fmrNaklP},
  GetDate0 in 'GetDate0.pas' {fmZapDate},
  InPlatTov in 'InPlatTov.pas' {fmEditPlat},
  Sotrud0 in 'Sotrud0.pas' {fmSotrud},
  fmrOtchet1 in 'fmrOtchet1.pas' {fmOtchet1: TQuickRep},
  fmrOtchet2 in 'fmrOtchet2.pas' {fmOtchet2: TQuickRep},
  EditPost0 in 'EditPost0.pas' {fmEditPost},
  VidTov0 in 'VidTov0.pas' {fmVidTov},
  fmrPrice in 'fmrPrice.pas' {fmPrice: TQuickRep},
  Password in 'Password.pas' {fmPassword},
  EditDebet in 'EditDebet.pas' {fmEditDebet},
  qrOtchet4 in 'qrOtchet4.pas' {fmOtchet4: TQuickRep},
  qrPOrder in 'qrPOrder.pas' {qrPrihOrder: TQuickRep},
  HotKey in 'HotKey.pas' {fmHKey},
  RasPlatTov in 'RasPlatTov.pas' {fmEditPlatR},
  EditKred in 'EditKred.pas' {fmEditKred},
  Skidka in 'Skidka.pas' {fmSkid},
  TovarPrih in 'TovarPrih.pas' {fmTovarPrih},
  Kart in 'Kart.pas' {fmKart},
  qrKart1 in 'qrKart1.pas' {qrKartTovar: TQuickRep},
  qrKart2 in 'qrKart2.pas' {qrKartTovar2: TQuickRep},
  qrKart3 in 'qrKart3.pas' {qrKartTovar3: TQuickRep},
  qrPost in 'qrPost.pas' {fmPrintPost},
  SelTip in 'SelTip.pas' {fmSelectTip},
  fmrOtchet1_1 in 'fmrOtchet1_1.pas' {fmOtchet1_1: TQuickRep},
  fmrOtchet2_1 in 'fmrOtchet2_1.pas' {fmOtchet2_1: TQuickRep},
  GetSpravka in 'GetSpravka.pas' {fmGetSpravka},
  GetSpravka2 in 'GetSpravka2.pas' {fmGetSpravka2},
  GetMonth0 in 'GetMonth0.pas' {fmGetMonth},
  Kart2 in 'Kart2.pas' {fmKart2},
  GetSpravka3 in 'GetSpravka3.pas' {fmGetSpravka3},
  qrNaklNdsNew in 'qrNaklNdsNew.pas' {qrNaklRNdsNew: TQuickRep},
  Setup0 in 'Setup0.pas' {fmSetup},
  qrSotrudPlat0 in 'qrSotrudPlat0.pas' {qrSotrudPlat: TQuickRep},
  qrSotrudDolg0 in 'qrSotrudDolg0.pas' {qrSotrudDolg: TQuickRep},
  GetPercent0 in 'GetPercent0.pas' {fmGetPercent},
  CheckPrice0 in 'CheckPrice0.pas' {fmCheckPrice},
  qrLoadCar0 in 'qrLoadCar0.pas' {qrLoadCar: TQuickRep},
  qrROrder in 'qrROrder.pas' {qrRashOrder: TQuickRep},
  qrDolgNash0 in 'qrDolgNash0.pas' {qrDolgNash: TQuickRep},
  qrOtchet6 in 'qrOtchet6.pas' {fmOtchet6: TQuickRep},
  EditTovar0 in 'EditTovar0.pas' {fmEditTovar},
  qrCheckSklad0 in 'qrCheckSklad0.pas' {qrCheckSklad: TQuickRep},
  qrSotrudFirm0 in 'qrSotrudFirm0.pas' {qrSotrudFirm: TQuickRep},
  Users in 'Users.pas' {fmUsers},
  EditUser0 in 'EditUser0.pas' {fmEditUser: Unit1},
  SetupMenu0 in 'SetupMenu0.pas' {fmSetupMenu},
  qrOstatokSelection0 in 'qrOstatokSelection0.pas' {qrOstatokSelection: TQuickRep},
  qrNaklSvor0 in 'qrNaklSvor0.pas' {qrNaklSvor: TQuickRep},
  qrNaklNdsSv0 in 'qrNaklNdsSv0.pas' {qrNaklRNdsSV: TQuickRep},
  SelectItem0 in 'SelectItem0.pas' {fmSelectItem},
  SotrudSalary0 in 'SotrudSalary0.pas' {fmSotrudSalary},
  Zakupka0 in 'Zakupka0.pas' {fmZakupka},
  qrZakupka0 in 'qrZakupka0.pas' {qrZakupka: TQuickRep},
  SelNakl0 in 'SelNakl0.pas' {fmSelectNakl},
  EditNaklR0 in 'EditNaklR0.pas' {fmEditNaklR},
  NaklR0 in 'NaklR0.pas' {fmNaklR_},
  EditVidTov0 in 'EditVidTov0.pas' {fmEditVidTov},
  EditSotrud0 in 'EditSotrud0.pas' {fmEditSotrud},
  Company0 in 'Company0.pas' {fmCompany},
  EditCompany0 in 'EditCompany0.pas' {fmEditCompay},
  NaklP0 in 'NaklP0.pas' {fmNaklP},
  qrNaklP0 in 'qrNaklP0.pas' {qrNaklP: TQuickRep},
  OrdersPrih0 in 'OrdersPrih0.pas' {fmOrdersPrih},
  EditOrdersPrih0 in 'EditOrdersPrih0.pas' {fmEditOrdersPrih},
  qrPLatP0 in 'qrPlatP0.pas' {qrPlatP: TQuickRep},
  SelPlat in 'SelPlat.pas' {fmSelectPlat},
  OrdersRash0 in 'OrdersRash0.pas' {fmOrdersRash},
  EditOrdersRash0 in 'EditOrdersRash0.pas' {fmEditOrdersRash},
  qrPlatPoruch0 in 'qrPlatPoruch0.pas' {qrPlatPoruch: TQuickRep},
  OtchetKassa0 in 'OtchetKassa0.pas' {fmOtchetKassa},
  qrNaklR0 in 'qrNaklR0.pas' {qrNaklR: TQuickRep},
  qrSalarySotrudPercent0 in 'qrSalarySotrudPercent0.pas' {qrSalarySotrudPercent: TQuickRep},
  Otchets0 in 'Otchets0.pas' {fmOtchets},
  EditRegion0 in 'EditRegion0.pas' {fmEditRegion},
  Regions0 in 'Regions0.pas' {fmRegions},
  qrNaklR1 in 'qrNaklR1.pas' {qrNaklREx: TQuickRep},
  GetPeriodDate0 in 'GetPeriodDate0.pas' {fmGetPeriodDate},
  TopTovars0 in 'TopTovars0.pas' {fmTopTovars},
  BadTovars0 in 'BadTovars0.pas' {fmBadTovars},
  InfoDolgNam0 in 'InfoDolgNam0.pas' {fmInfoDolgNam},
  CloseReturn0 in 'CloseReturn0.pas' {fmCloseReturn: CFL_MsList},
  CrossPostNaklR0 in 'CrossPostNaklR0.pas' {fmCrossPostNaklR},
  CrossPostNaklP0 in 'CrossPostNaklP0.pas' {fmCrossPostNaklP},
  InputPlan0 in 'InputPlan0.pas' {fmInputPlan},
  qrFilters0 in 'qrFilters0.pas' {fmQrFilters},
  uAccountCashRashod in 'uAccountCashRashod.pas' {fmAccountCashRashod},
  EditAccountCash in 'EditAccountCash.pas' {fmEditAccountCash},
  CrossReturne0 in 'CrossReturne0.pas' {fmCrossReturne},
  VidRashoda in 'VidRashoda.pas' {fmVidRashoda},
  EditRashoda in 'EditRashoda.pas' {fmEditRashod},
  Temp0 in 'Temp0.pas' {fmTemp0},
  TipTovara0 in 'TipTovara0.pas' {fmTipTovara},
  EditTipTovara0 in 'EditTipTovara0.pas' {fmEditTipTovara},
  CrossReturnePost0 in 'CrossReturnePost0.pas' {fmCrossReturnePost},
  GetNaklNo in 'GetNaklNo.pas' {fmGetNaklNo},
  CloseReturneNakl0 in 'CloseReturneNakl0.pas' {fmCloseReturneNakl},
  Cars0 in 'Cars0.pas' {fmCars},
  EditCars0 in 'EditCars0.pas' {fmEditCars},
  Shipping_Agent0 in 'Shipping_Agent0.pas' {fmShipping_Agent},
  EditShipping_Agent0 in 'EditShipping_Agent0.pas' {fmEditShipping_Agent},
  SelExpedition0 in 'SelExpedition0.pas' {fmSelectExpedition},
  Expedition0 in 'Expedition0.pas' {fmExpedition},
  EditExpedition0 in 'EditExpedition0.pas' {fmEditExpedition},
  ExpeditionNakl0 in 'ExpeditionNakl0.pas' {fmExpeditionNakl},
  OtchetSale0 in 'OtchetSale0.pas' {fmOtchetSale},
  Progress in 'Progress.pas' {fmProgress},
  PrihodPodotchet0 in 'PrihodPodotchet0.pas' {fmEditPodotchet},
  PodotchetR0 in 'PodotchetR0.pas' {fmPodotchetR},
  SelectPodotchet0 in 'SelectPodotchet0.pas' {fmSelectPodotchet},
  Podotchet0 in 'Podotchet0.pas' {fmPodotchet},
  Export1C0 in 'Export1C0.pas' {fmExport1C},
  Password1C0 in 'Password1C0.pas' {fmPassword1C},
  PlatNakl0 in 'PlatNakl0.pas' {fmPlatNakl},
  SelOtdel in 'SelOtdel.pas' {fmSelectOtdel},
  qrPLatR0 in 'qrPLatR0.pas' {qrPlatR: TQuickRep},
  KartData in 'KartData.pas' {fmKartDate},
  SvedenieNakl0 in 'SvedenieNakl0.pas' {fmSvedenieNakl},
  KartVerife0 in 'KartVerife0.pas' {fmKartVerife},
  SvedenieNaklNotCar0 in 'SvedenieNaklNotCar0.pas' {fmSvedenieNaklNotCar},
  BlockDate0 in 'BlockDate0.pas' {fmBlockDate},
  NaklChange0 in 'NaklChange0.pas' {fmNaklChange},
  RecycleExpedition0 in 'RecycleExpedition0.pas' {fmRecycleExpedition},
  TovarSvedenie0 in 'TovarSvedenie0.pas' {fmTovarSvedenie},
  KartTovarSvedenie0 in 'KartTovarSvedenie0.pas' {fmKartTovarSvedenie},
  NaklNotSvedenie0 in 'NaklNotSvedenie0.pas' {fmNaklNotSvedenie},
  InOutCash0 in 'InOutCash0.pas' {fmInOutCash},
  RealOst in 'RealOst.pas' {fmRealOst},
  BlankOst0 in 'BlankOst0.pas' {fmBlankOst},
  SelectRas0 in 'SelectRas0.pas' {fmSelectRas},
  KartRas0 in 'KartRas0.pas' {fmKartRas},
  MlekoBlankList in 'MlekoBlankList.pas' {MlekoBlankListForm},
  MlekoBlankParam in 'MlekoBlankParam.pas' {MlekoBlankParamForm},
  MlekoBlankSpec in 'MlekoBlankSpec.pas' {MlekoBlankSpecForm},
  GetPeriodDateProiz0 in 'GetPeriodDateProiz0.pas' {fmGetPeriodDateProiz},
  MlekoDbChekBoxList in 'MlekoDbChekBoxList.pas' {MlekoDbChekBoxListForm},
  MlekoSelectDayDept in 'MlekoSelectDayDept.pas' {MlekoSelectDayDeptDlg},
  CFLEHList in 'CFLEhList.pas' {CFLEHListForm},
  MlekoCrossRequestForGoods in 'MlekoCrossRequestForGoods.pas' {MlekoCrossRequestForGoodsForm},
  MlekoSelectFIrm in 'MlekoSelectFIrm.pas' {MlekoSelectFIrmDlg},
  MlekoSelectTovar in 'MlekoSelectTovar.pas' {MlekoSelectTovarDlg},
  MlekoAuditBlankPos in 'MlekoAuditBlankPos.pas' {MlekoAuditBlankPosForm},
  MlekoSelectSotrud in 'MlekoSelectSotrud.pas' {MlekoSelectSotrudDlg},
  MlekoSelectReport in 'MlekoSelectReport.pas' {MlekoSelectReportDlg},
  CFLMLKCustomRep in 'CFLMLKCustomRep.pas' {CFLMLKCustomRepDlg},
  CFLMLKEditReport in 'CFLMLKEditReport.pas' {CFLMLKEditReportForm},
  MlekoEditRepParam in 'MlekoEditRepParam.pas' {MlekoEditRepParamDlg},
  MlekoSelectOtdel in 'MlekoSelectOtdel.pas' {MlekoSelectOtdelDlg},
  MlekoSelectUser in 'MlekoSelectUser.pas' {MlekoSelectUserDlg},
  MlekoPropFindTov in 'MlekoPropFindTov.pas' {MlekoPropFindTovDlg},
  MlekoListTovarWieght in 'MlekoListTovarWieght.pas' {MlekoListTovarWieghtForm},
  MlekoSelectDhead in 'MlekoSelectDhead.pas' {MlekoSelectDheadDlg},
  CFLMLKPropCustomDialog in 'CFLMLKPropCustomDialog.pas' {CFLMLKPropCustomDialogDlg},
  MlekoPropTovWeightPos in 'MlekoPropTovWeightPos.pas' {MlekoPropTovWeightPosDlg},
  MlekoSelectWeight in 'MlekoSelectWeight.pas' {MlekoSelectWeightDlg},
  MlekoClosePlatR in 'MlekoClosePlatR.pas' {MlekoClosePlatRForm},
  MlekoSelectAddress in 'MlekoSelectAddress.pas' {MlekoSelectAddressDlg},
  MlekoPropCheckNakl in 'MlekoPropCheckNakl.pas' {MlekoPropCheckNaklDlg},
  MLekoListAdrInfo in 'MLekoListAdrInfo.pas' {MlekoListAdrInfoForm: TFrame},
  MlekoSelectSector in 'MlekoSelectSector.pas' {MlekoSelectSectorDlg},
  MlekoPropPlatR in 'MlekoPropPlatR.pas' {MlekoPropPlatRDlg},
  MLekoListRestAudit in 'MLekoListRestAudit.pas' {MlekoListRestAuditForm},
  MlekoAuditRestPos in 'MlekoAuditRestPos.pas' {MlekoAuditRestPosForm},
  MlekoSelectVidRash in 'MlekoSelectVidRash.pas' {MlekoSelectVidRashDlg},
  MlekoSelectEntityType in 'MlekoSelectEntityType.pas' {MlekoSelectEntityTypeDlg},
  MlekoSelectBuh in 'MlekoSelectBuh.pas' {MlekoSelectBuhDlg},
  MlekoSelectActivity in 'MlekoSelectActivity.pas' {MlekoSelectActivityDlg},
  MlekoSelectPlatType in 'MlekoSelectPlatType.pas' {MlekoSelectPlatTypeDlg},
  MlekoListLogist in 'MlekoListLogist.pas' {MlekoListLogistForm},
  MlekoListEntityBalance in 'MlekoListEntityBalance.pas' {MlekoListEntityBalanceForm},
  MlekoListPrice in 'MlekoListPrice.pas' {MlekoListPriceForm},
  MlekoPropDbPriceType in 'MlekoPropDBPriceType.pas' {MlekoPropDbPriceTypeDlg},
  MlekoSelectPriceType in 'MlekoSelectPriceType.pas' {MlekoSelectPriceTypeDlg},
  MlekoListRoute in 'MlekoListRoute.pas' {MlekoListRouteForm},
  MlekoAuditRashod in 'MlekoAuditRashod.pas' {MlekoAuditRashodForm},
  MlekoSelectDocState in 'MlekoSelectDocState.pas' {MlekoSelectDocStateDlg},
  MlekoSelectDept in 'MlekoSelectDept.pas' {MlekoSelectDeptDlg},
  MlekoTest in 'MlekoTest.pas' {MlekoTestForm},
  BCDbMSSQL in '..\..\BPL\BDDC\BCDbMSSQL.pas' {BCDbMSSQLDm: TDataModule},
  BCMain in '..\..\BPL\BDDC\BCMain.pas' {BCMainForm},
  BCProp in '..\..\BPL\BDDC\BCProp.pas' {BCPropDlg},
  BCPropDb in '..\..\BPL\BDDC\BCPropDb.pas' {BCPropDbDlg},
  MlekoSelectResponseDept in 'MlekoSelectResponseDept.pas' {MlekoSelectResponseDeptDlg},
  MlekoForm in 'MlekoForm.pas' {MlekoForm},
  MlekoRes in 'MlekoRes.pas' {MlekoResDm: TDataModule},
  MlekoDbDsMSSQL in 'MlekoDbDsMSSQL.pas' {MlekoDbDsMSSQLDm: TDataModule},
  BCLogon in '..\..\BPL\BDDC\BCLogon.pas' {BCLogonDlg},
  MlekoSelectFirmProp in 'MlekoSelectFirmProp.pas' {MlekoSelectFirmPropDlg},
  MlekoSelectReason in 'MlekoSelectReason.pas' {MlekoSelectReasonDlg},
  MlekoPropDbBlockApp in 'MlekoPropDbBlockApp.pas' {MlekoPropDbBlockAppDlg},
  MlekoListSimpleDict in 'MlekoListSimpleDict.pas' {MlekoListSimpleDictForm},
  MlekoListCFO in 'MlekoListCFO.pas' {MlekoListCFOForm},
  MlekoListActivity in 'MlekoListActivity.pas' {MlekoListActivityForm},
  MlekoListSimple in 'MlekoListSimple.pas' {MlekoListSimpleForm},
  DolgNam in 'DolgNam.pas' {fmDolgNam},
  MlekoListColumns in 'MlekoListColumns.pas' {MlekoListColumnsForm},
  MlekoSelectRegion in 'MlekoSelectRegion.pas' {MlekoSelectRegionDlg},
  BCList in '..\..\BPL\BDDC\BCList.pas' {BCListFrame: TFrame},
  MlkListPostArticleGroupDelayPay in 'MlkListPostArticleGroupDelayPay.pas' {MlkListPostArticleGroupDelayPayFrame: TFrame},
  MlkListVidTovGroup in 'MlkListVidTovGroup.pas' {MlkListVidTovGroupFrame: TFrame},
  BCChild in '..\..\BPL\BDDC\BCChild.pas' {BCChildForm},
  MlkChildVidTovGroup in 'MlkChildVidTovGroup.pas' {MlkChildVidTovGroupForm},
  MlkListLinkVidTovGroup in 'MlkListLinkVidTovGroup.pas' {MlkListLinkVidTovGroupFrame: TFrame},
  MlkPropDbVidGroup in 'MlkPropDbVidGroup.pas' {MlkPropDbVidGroupDlg},
  MlkListArticleGroup in 'MlkListArticleGroup.pas' {MlkListArticleGroupFrame: TFrame},
  MlkChildArticleGroup in 'MlkChildArticleGroup.pas' {MlkChildArticleGroupForm},
  MlkListLinkArticleGroup in 'MlkListLinkArticleGroup.pas' {MlkListLinkArticleGroupFrame: TFrame},
  MlkPropDbArticleGroup in 'MlkPropDbArticleGroup.pas' {MlkPropDbArticleGroupDlg},
  MlkListSetArticleGroup in 'MlkListSetArticleGroup.pas' {MlkListSetArticleGroupFrame: TFrame},
  MlkListLinkSetArticleGroup in 'MlkListLinkSetArticleGroup.pas' {MlkListLinkSetArticleGroupFrame: TFrame},
  MlkPropDbLinkSetArticleGroup in 'MlkPropDbLinkSetArticleGroup.pas' {MlkPropDbLinkSetArticleGroupDlg},
  MlkPropDbSetArticleGroup in 'MlkPropDbSetArticleGroup.pas' {MlkPropDbSetArticleGroupDlg},
  MlkChildSetArticleGroup in 'MlkChildSetArticleGroup.pas' {MlkChildSetArticleGroupForm},
  MlkListPostArticleGroupPriceType in 'MlkListPostArticleGroupPriceType.pas' {MlkListPostArticleGroupPriceTypeFrame: TFrame},
  MlkChildPostSet in 'MlkChildPostSet.pas' {MlkChildPostSetForm},
  MlekoSelectFirmForBlank in 'MlekoSelectFirmForBlank.pas' {MlekoSelectFirmForBlankDlg},
  PostForNaklRUnit in 'PostForNaklRUnit.pas' {fmPostForNaklR},
  MLKCxList in 'MLKCxList.pas' {MLKCxListFrame: TFrame},
  MLKCxListPost in 'MLKCxListPost.pas' {MLKCxListPostFrame: TFrame},
  MlkChild in 'MlkChild.pas' {MlkChildForm},
  PostForRashod0 in 'PostForRashod0.pas' {fmPostForRashod},
  MLKPropDb in 'MLKPropDb.pas' {MLKPropDbDlg},
  MlkChildArticle in 'MlkChildArticle.pas' {MlkChildArticleForm},
  MLKCxListArticle in 'MLKCxListArticle.pas' {MLKCxListArticleFrame: TFrame},
  MlkListLinkAGArticle in 'MlkListLinkAGArticle.pas' {MlkListLinkAGArticleFrame: TFrame},
  MlkListLinkAGGroup in 'MlkListLinkAGGroup.pas' {MlkListLinkAGGroupFrame: TFrame},
  MLKList in 'MLKList.pas' {MLKListFrame: TFrame},
  MLKListD_POST_DELAY_STOP_CONTROL in 'MLKListD_POST_DELAY_STOP_CONTROL.pas' {MLKListD_POST_DELAY_STOP_CONTROLFrame: TFrame},
  NaklR_Soravka in 'NaklR_Soravka.pas' {Spravka},
  OstatokFiltr in 'OstatokFiltr.pas' {Filter},
  MlekoBlnkPrivyazka in 'MlekoBlnkPrivyazka.pas' {Privyazka},
  MlekoBlkParamPrivyazka in 'MlekoBlkParamPrivyazka.pas' {NaborAddTovar},
  Meko_Blanc_Price in 'Meko_Blanc_Price.pas' {BLANC_PRICE},
  MlekoSelectArticleGroup in 'MlekoSelectArticleGroup.pas' {MlekoSelectArticleGroupDlg},
  TovarPost0 in 'TovarPost0.pas' {fmTovarPost},
  NaklRPost0 in 'NaklRPost0.pas' {fmNaklRPost},
  EditTovarPost0 in 'EditTovarPost0.pas' {fmEditTovarPost},
  MlekoSelectNaklR in 'MlekoSelectNaklR.pas' {MlekoSelectNaklRDlg},
  MlekoSelectNaklP in 'MlekoSelectNaklP.pas' {MlekoSelectNaklPDlg},
  ListPostForMail0 in 'ListPostForMail0.pas' {ListPostForMail},
  MlekoSelectTovar1 in 'MlekoSelectTovar1.pas' {MlekoSelectTovar1Dlg},
  MLekoListAdrInfoPayBan in 'MLekoListAdrInfoPayBan.pas' {MlekoListAdrInfoPayBanForm},
  Employee in 'Employee.pas' {Employee0},
  EditEmployee0 in 'EditEmployee0.pas' {EditEmployee},
  EmployeeScope in 'EmployeeScope.pas' {fmEmployeeScope},
  MlekoBlankListOutSide in 'MlekoBlankListOutSide.pas' {MlekoBlankListOutSideForm},
  MlekoBlankSpecOutSide in 'MlekoBlankSpecOutSide.pas' {MlekoBlankSpecOutSideForm},
  ChangePrice0 in 'ChangePrice0.pas' {fmChangePrice},
  TimetableForDriver in 'TimetableForDriver.pas' {TimetableForDriver0},
  ChangePriceList0 in 'ChangePriceList0.pas' {ChangePriceList},
  CrossPaymentsFromPost0 in 'CrossPaymentsFromPost0.pas' {CrossPaymentsFromPost},
  ListMinusPostPayment in 'ListMinusPostPayment.pas' {ListMinusPostPaymentForm},
  ListPlusPostPayment in 'ListPlusPostPayment.pas' {ListPlusPostPaymentForm},
  StandartsOfGoods in 'StandartsOfGoods.pas' {StandartsOfGoodsForm},
  EditStandarts in 'EditStandarts.pas' {EditStandartsOfGoodsForm},
  ListGoodStandart in 'ListGoodStandart.pas' {ListGoodStandartForm},
  MlekoSelectStandarts in 'MlekoSelectStandarts.pas' {MlekoSelectStandartsDlg},
  TypeReturn in 'TypeReturn.pas' {TypeReturnForm},
  EditTypeReturn in 'EditTypeReturn.pas' {EditTypeReturnForm},
  EditLinkTovarFromReturn in 'EditLinkTovarFromReturn.pas' {EditLinkTovarFromReturnForm},
  CategoryTT in 'CategoryTT.pas' {CategoryTTForm},
  EditCategoryTT in 'EditCategoryTT.pas' {EditCategoryTTForm},
  MlekoSelectCategoryTT in 'MlekoSelectCategoryTT.pas' {MlekoSelectCategoryTTDlg},
  MlekoSelectFloat in 'MlekoSelectFloat.pas' {MlekoSelectFloatDlg},
  MlekoBlankListWithKPK in 'MlekoBlankListWithKPK.pas' {MlekoBlankListWithKPKForm},
  MlekoBlankSpecWithKPK in 'MlekoBlankSpecWithKPK.pas' {MlekoBlankSpecWithKPKForm},
  VidTovForExportPrice in 'VidTovForExportPrice.pas' {VidTovForExportPriceForm},
  ExportTovarForScales in 'ExportTovarForScales.pas' {ExportTovarForScalesForm},
  InputOrderWithExcel in 'InputOrderWithExcel.pas' {InputOrderWithExcelForm},
  MlekoSelectVidNakl in 'MlekoSelectVidNakl.pas' {MlekoSelectVidNaklDlg},
  MlekoSelectTypeReturn in 'MlekoSelectTypeReturn.pas' {MlekoSelectTypeReturnDlg},
  TemplateFileFromExcelOrders in 'TemplateFileFromExcelOrders.pas' {TemplateFileFromExcelOrdersForm},
  MlekoSelectMarijaGroupTax in 'MlekoSelectMarijaGroupTax.pas' {MlekoSelectMarijaGroupTaxDlg},
  MlekoSelectVidTov in 'MlekoSelectVidTov.pas' {MlekoSelectVidTovDlg},
  PrihodOrder in 'PrihodOrder.pas' {PrihodOrderForm},
  PrihodOrderHead in 'PrihodOrderHead.pas' {PrihodOrderHeadForm},
  ListMinusPrihodOrder in 'ListMinusPrihodOrder.pas' {ListMinusPrihodOrderForm},
  BlockDateExpedition0 in 'BlockDateExpedition0.pas' {fmBlockDateExpedition},
  PatternPrihodOrder in 'PatternPrihodOrder.pas' {PatternPrihodOrderForm},
  PatternPrihodOrderSpec in 'PatternPrihodOrderSpec.pas' {PatternPrihodOrderSpecForm},
  DeliveryOfGoods0 in 'DeliveryOfGoods0.pas' {fmDeliveryOfGoods},
  EditDeliveryOfGoods0 in 'EditDeliveryOfGoods0.pas' {fmEditDeliveryOfGoods},
  MlekoSelectTipTovara in 'MlekoSelectTipTovara.pas' {MlekoSelectTipTovaraDlg},
  ListMinusVidTovar in 'ListMinusVidTovar.pas' {ListMinusVidTovaraForm},
  ListMinusPostForOstatokZero in 'ListMinusPostForOstatokZero.pas' {ListMinusPostForOstatokZeroaForm},
  ListMinusVidRashForOstatokZero in 'ListMinusVidRashForOstatokZero.pas' {ListMinusVidRashodForOstatokZeroaForm},
  DescriptionNaklPost in 'DescriptionNaklPost.pas' {DescriptionNaklPostForm},
  ListPlusPostForDolg in 'ListPlusPostForDolg.pas' {ListPlusPostForDolgForm},
  DescriptionNaklRPost0 in 'DescriptionNaklRPost0.pas' {DescriptionNaklRPost0Form},
  ListControlRequiredData in 'ListControlRequiredData.pas' {ListControlRequiredDataForm},
  ClassifierABCDZ in 'ClassifierABCDZ.pas' {ClassifierABCDZForm},
  VidRashod in 'VidRashod.pas' {VidRashodForm},
  SelectPostForWriteOffCosts in 'SelectPostForWriteOffCosts.pas' {SelectPostForWriteOffCostsForm},
  EditClassifierABCDZ in 'EditClassifierABCDZ.pas' {EditClassifierABCDZForm},
  BankAndInvoice in 'BankAndInvoice.pas' {BankAndInvoiceForm},
  EditBankAndInvoice in 'EditBankAndInvoice.pas' {EditBankAndInvoiceForm},
  Kassa in 'Kassa.pas' {KassaForm},
  ListMinusPostForBDDS in 'ListMinusPostForBDDS.pas' {ListMinusPostForBDDSForm},
  BDDS in 'BDDS.pas' {BDDSForm},
  VidSotrudInPepsico in 'VidSotrudInPepsico.pas' {VidSotrudInPepsicoForm},
  EditVidSotrudInPepsico in 'EditVidSotrudInPepsico.pas' {EditVidSotrudInPepsicoForm},
  SalesChannelsOfPepsico in 'SalesChannelsOfPepsico.pas' {SalesChannelsOfPepsicoForm},
  EditSalesChannelsOfPepsico in 'EditSalesChannelsOfPepsico.pas' {EditSalesChannelsOfPepsicoForm},
  KOATUU in 'KOATUU.pas' {KOATUUForm},
  EditKOATUU in 'EditKOATUU.pas' {EditKOATUUForm},
  MlekoSelectBankInvoice in 'MlekoSelectBankInvoice.pas' {MlekoSelectBankInvoiceDlg},
  RequestForSupplyGoods in 'RequestForSupplyGoods.pas' {RequestForSupplyGoodsForm},
  RequestForSupplyGoodsHead in 'RequestForSupplyGoodsHead.pas' {RequestForSupplyGoodsHeadForm},
  RequestForSupplyGoodsSpec in 'RequestForSupplyGoodsSpec.pas' {RequestForSupplyGoodsSpecForm},
  MlekoSelectSetArticleGroup in 'MlekoSelectSetArticleGroup.pas' {MlekoSelectSetArticleGroupForm},
  MleckSelectColNPrice in 'MleckSelectColNPrice.pas' {MleckSelectColNPriceForm},
  AddressPost_CODE_Commerce_Network in 'AddressPost_CODE_Commerce_Network.pas' {AddressPost_CODE_Commerce_NetworkForm},
  EditAddressPost_CODE_Commerce_Network in 'EditAddressPost_CODE_Commerce_Network.pas' {EditAddressPost_CODE_Commerce_NetworkForm},
  MlekoSelectFIrmSupplier in 'MlekoSelectFIrmSupplier.pas' {MlekoSelectFIrmSupplierDlg},
  Ostatok1Head in 'Ostatok1Head.pas',
  Ostatok1Spec in 'Ostatok1Spec.pas' {Ostatok1SpecForm},
  ListAddressPostForOstatok1 in 'ListAddressPostForOstatok1.pas' {ListAddressPostForOstatok1Form},
  MlekoCrossOstatok1 in 'MlekoCrossOstatok1.pas' {MlekoCrossOstatok1Form},
  ListAddressPostForOstatok1Prihod in 'ListAddressPostForOstatok1Prihod.pas' {ListAddressPostForOstatok1PrihodForm},
  ListMinusPostForAnalizPrihod in 'ListMinusPostForAnalizPrihod.pas' {ListMinusPostForAnalizPrihodaForm},
  MlekoSelectTovar2 in 'MlekoSelectTovar2.pas' {MlekoSelectTovar2Dlg},
  ListMinusPostForListAdrInfo in 'ListMinusPostForListAdrInfo.pas' {ListMinusPostForListAdrInfoaForm},
  ReasonForUnlocking0 in 'ReasonForUnlocking0.pas' {fmReasonForUnlocking},
  EditReasonForUnlocking0 in 'EditReasonForUnlocking0.pas' {fmEditReasonForUnlocking},
  ListMinusPostForAnalizOstatka in 'ListMinusPostForAnalizOstatka.pas' {ListMinusPostForAnalizOstatkaaForm},
  MlekoSelectReasonForUnlocking in 'MlekoSelectReasonForUnlocking.pas' {MlekoSelectReasonForUnlockingDlg},
  PlanningOrder in 'PlanningOrder.pas' {PlanningOrderForm},
  ListMinusPostForPlanningOrder in 'ListMinusPostForPlanningOrder.pas' {ListMinusPostForPlanningOrderaForm},
  ListMinusVidTovForPlanningOrder in 'ListMinusVidTovForPlanningOrder.pas' {ListMinusVidTovForAnalizOstatkaaForm},
  ListVidOtdelForPlanningOrder in 'ListVidOtdelForPlanningOrder.pas' {ListVidOtdelForPlanningOrderaForm},
  PlanningOrderHead in 'PlanningOrderHead.pas' {PlanningOrderHeadForm},
  ListTipNoIncrementRateForPlanProdag in 'ListTipNoIncrementRateForPlanProdag.pas' {ListTipNoIncrementRateForPlanProdagForm},
  AnalisPlanningOrder in 'AnalisPlanningOrder.pas' {AnalisPlanningOrderForm},
  AnalisReturnOrder in 'AnalisReturnOrder.pas' {AnalisReturnOrderForm},
  ListMinusPaymentForJournalOfExpenses in 'ListMinusPaymentForJournalOfExpenses.pas' {ListMinusPaymentForJournalOfExpensesaForm},
  Infarmatsionny_Analysis in 'Infarmatsionny_Analysis.pas' {Infarmatsionny_AnalysisForm},
  Infarmatsionny_AnalysisSpec in 'Infarmatsionny_AnalysisSpec.pas' {Infarmatsionny_AnalysisSpecForm},
  ListTovarNoForPlanningOrder in 'ListTovarNoForPlanningOrder.pas' {ListTovarNoForPlanningOrderaForm},
  AddressPostActive in 'AddressPostActive.pas' {AddressPostActiveForm},
  TempTableForCreateBlank in 'TempTableForCreateBlank.pas' {TempTableForCreateBlankForm},
  HistoryOfPriceChenge in 'HistoryOfPriceChenge.pas' {HistoryOfPriceChengeForm},
  ListMinusPostForAnalizPrihodNew in 'ListMinusPostForAnalizPrihodNew.pas' {ListMinusPostForAnalizPrihodNewaForm},
  MLekoListAdrInfoNew in 'MLekoListAdrInfoNew.pas' {MLekoListAdrInfoNewForm},
  PricingList in 'PricingList.pas' {PricingListForm},
  TovarPrihForDateOfManufacture in 'TovarPrihForDateOfManufacture.pas' {TovarPrihForDateOfManufactureForm},
  RestTovarOfDateManufacture in 'RestTovarOfDateManufacture.pas' {RestTovarOfDateManufactureForm},
  ControlRestTovarOfDateManufacture in 'ControlRestTovarOfDateManufacture.pas' {ControlRestTovarOfDateManufactureForm},
  ReconciliationReceiptPriceInInst in 'ReconciliationReceiptPriceInInst.pas' {ReconciliationReceiptPriceInInstForm},
  OtdelForm0 in 'OtdelForm0.pas' {OtdelForm},
  EditOtdel0 in 'EditOtdel0.pas' {EditOtdelForm},
  VidExportExelFileForJournalOfExpenses in 'VidExportExelFileForJournalOfExpenses.pas' {VidExportExelFileForJournalOfExpensesForm},
  CloseReturnePlat0 in 'CloseReturnePlat0.pas' {fmCloseReturnePlat},
  MlekoSelectEntityTypeFromCloseReturn in 'MlekoSelectEntityTypeFromCloseReturn.pas' {MlekoSelectEntityTypeFromCloseReturnForm},
  CloseReturneNaklP0 in 'CloseReturneNaklP0.pas',
  ListMinusPostForDolg in 'ListMinusPostForDolg.pas' {ListMinusPostForDolgForm},
  PrihodTovWithExel in 'PrihodTovWithExel.pas' {fmPrihodTovWithExel},
  EditClientCard in 'EditClientCard.pas' {EditClientCardForm},
  VidDoc in 'VidDoc.pas' {VidDocForm},
  DocClientCardHead in 'DocClientCardHead.pas' {DocClientCardHeadForm},
  ListTovarDateOfManufaktureFornakl in 'ListTovarDateOfManufaktureFornakl.pas' {ListTovarDateOfManufaktureForNaklForm},
  ControlVidRashodForPlat in 'ControlVidRashodForPlat.pas' {ControlVidRashodForPlatForm},
  GroupCutting in 'GroupCutting.pas' {GroupCuttingForm},
  MlekoCrossBlankOrderTmp in 'MlekoCrossBlankOrderTmp.pas' {MlekoCrossBlankOrderTmpForm},
  ListVidTovForGroupCutting in 'ListVidTovForGroupCutting.pas' {ListVidTovForGroupCuttingForm},
  CheckMeshCutting in 'CheckMeshCutting.pas' {CheckMeshCuttingForm},
  CuttingMesh in 'CuttingMesh.pas' {CuttingMeshForm},
  PostFromGroupCutting in 'PostFromGroupCutting.pas' {PostFromGroupCuttingForm},
  MlekoCrossBlankOrder in 'MlekoCrossBlankOrder.pas' {MlekoCrossBlankOrderForm},
  AnalisCuttingMesh in 'AnalisCuttingMesh.pas' {AnalisCuttingMeshForm},
  Currency in 'Currency.pas' {CurrencyForm},
  EditCurrency in 'EditCurrency.pas' {EditCurrencyForm},
  CurrencyExchange in 'CurrencyExchange.pas' {CurrencyExchangeForm},
  EditCurrencyExchange in 'EditCurrencyExchange.pas' {EditCurrencyExchangeForm},
  VidRashodGroup in 'VidRashodGroup.pas' {VidRashodGroupForm},
  EditVidRashodGroup in 'EditVidRashodGroup.pas' {EditVidRashodGroupForm};

{$R *.RES}
var
  CodeAccess, UserNo, ServIndex: integer;
  is_connect: Boolean;
  hPackHandle: HMODULE;
begin

  Application.Initialize;
  SysUtils.ShortDateFormat := 'dd.mm.yyyy';
  Application.Title := 'Учет товара';
  Application.Name := 'MLEKO';
  hPackHandle := LoadPackage('BC.bpl');
  Application.CreateForm(TdmDataModule, dmDataModule);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TMLKPropDbDlg, MLKPropDbDlg);
  Application.CreateForm(TSpravka, Spravka);
  Application.CreateForm(TFilter, Filter);
  Application.CreateForm(TPrivyazka, Privyazka);
  Application.CreateForm(TNaborAddTovar, NaborAddTovar);
  Application.CreateForm(TBLANC_PRICE, BLANC_PRICE);
  Application.CreateForm(TfmEmployeeScope, fmEmployeeScope);
  Application.CreateForm(TMlekoBlankListOutSideForm, MlekoBlankListOutSideForm);
  Application.CreateForm(TMlekoBlankSpecOutSideForm, MlekoBlankSpecOutSideForm);
  Application.CreateForm(TfmChangePrice, fmChangePrice);
  Application.CreateForm(TTimetableForDriver0, TimetableForDriver0);
  Application.CreateForm(TChangePriceList, ChangePriceList);
  Application.CreateForm(TListMinusPostPaymentForm, ListMinusPostPaymentForm);
  Application.CreateForm(TListPlusPostPaymentForm, ListPlusPostPaymentForm);
  Application.CreateForm(TEditStandartsOfGoodsForm, EditStandartsOfGoodsForm);
  Application.CreateForm(TListGoodStandartForm, ListGoodStandartForm);
  Application.CreateForm(TEditLinkTovarFromReturnForm, EditLinkTovarFromReturnForm);
  Application.CreateForm(TVidTovForExportPriceForm, VidTovForExportPriceForm);
  Application.CreateForm(TExportTovarForScalesForm, ExportTovarForScalesForm);
  Application.CreateForm(TInputOrderWithExcelForm, InputOrderWithExcelForm);
  Application.CreateForm(TMlekoSelectVidNaklDlg, MlekoSelectVidNaklDlg);
  Application.CreateForm(TMlekoSelectTypeReturnDlg, MlekoSelectTypeReturnDlg);
  Application.CreateForm(TTemplateFileFromExcelOrdersForm, TemplateFileFromExcelOrdersForm);
  Application.CreateForm(TMlekoSelectMarijaGroupTaxDlg, MlekoSelectMarijaGroupTaxDlg);
  Application.CreateForm(TMlekoSelectVidTovDlg, MlekoSelectVidTovDlg);
  Application.CreateForm(TPrihodOrderForm, PrihodOrderForm);
  Application.CreateForm(TListMinusPrihodOrderForm, ListMinusPrihodOrderForm);
  Application.CreateForm(TfmBlockDateExpedition, fmBlockDateExpedition);
  Application.CreateForm(TPatternPrihodOrderForm, PatternPrihodOrderForm);
  Application.CreateForm(TPatternPrihodOrderSpecForm, PatternPrihodOrderSpecForm);
  Application.CreateForm(TfmDeliveryOfGoods, fmDeliveryOfGoods);
  Application.CreateForm(TfmEditDeliveryOfGoods, fmEditDeliveryOfGoods);
  Application.CreateForm(TMlekoSelectTipTovaraDlg, MlekoSelectTipTovaraDlg);
  Application.CreateForm(TListMinusVidTovaraForm, ListMinusVidTovaraForm);
  Application.CreateForm(TListMinusPostForOstatokZeroaForm, ListMinusPostForOstatokZeroaForm);
  Application.CreateForm(TDescriptionNaklPostForm, DescriptionNaklPostForm);
  Application.CreateForm(TDescriptionNaklRPost0Form, DescriptionNaklRPost0Form);
  Application.CreateForm(TListControlRequiredDataForm, ListControlRequiredDataForm);
  Application.CreateForm(TClassifierABCDZForm, ClassifierABCDZForm);
  Application.CreateForm(TVidRashodForm, VidRashodForm);
  Application.CreateForm(TSelectPostForWriteOffCostsForm, SelectPostForWriteOffCostsForm);
  Application.CreateForm(TEditClassifierABCDZForm, EditClassifierABCDZForm);
  Application.CreateForm(TBankAndInvoiceForm, BankAndInvoiceForm);
  Application.CreateForm(TEditBankAndInvoiceForm, EditBankAndInvoiceForm);
  Application.CreateForm(TKassaForm, KassaForm);
  Application.CreateForm(TBDDSForm, BDDSForm);
  Application.CreateForm(TVidSotrudInPepsicoForm, VidSotrudInPepsicoForm);
  Application.CreateForm(TEditVidSotrudInPepsicoForm, EditVidSotrudInPepsicoForm);
  Application.CreateForm(TSalesChannelsOfPepsicoForm, SalesChannelsOfPepsicoForm);
  Application.CreateForm(TEditSalesChannelsOfPepsicoForm, EditSalesChannelsOfPepsicoForm);
  Application.CreateForm(TKOATUUForm, KOATUUForm);
  Application.CreateForm(TEditKOATUUForm, EditKOATUUForm);
  Application.CreateForm(TRequestForSupplyGoodsForm, RequestForSupplyGoodsForm);
  Application.CreateForm(TRequestForSupplyGoodsHeadForm, RequestForSupplyGoodsHeadForm);
  Application.CreateForm(TRequestForSupplyGoodsSpecForm, RequestForSupplyGoodsSpecForm);
  Application.CreateForm(TMlekoSelectSetArticleGroupForm, MlekoSelectSetArticleGroupForm);
  Application.CreateForm(TMleckSelectColNPriceForm, MleckSelectColNPriceForm);
  Application.CreateForm(TAddressPost_CODE_Commerce_NetworkForm, AddressPost_CODE_Commerce_NetworkForm);
  Application.CreateForm(TEditAddressPost_CODE_Commerce_NetworkForm, EditAddressPost_CODE_Commerce_NetworkForm);
  Application.CreateForm(TMlekoSelectFIrmSupplierDlg, MlekoSelectFIrmSupplierDlg);
  Application.CreateForm(TOstatok1HeadForm, Ostatok1HeadForm);
  Application.CreateForm(TOstatok1SpecForm, Ostatok1SpecForm);
  Application.CreateForm(TListAddressPostForOstatok1Form, ListAddressPostForOstatok1Form);
  Application.CreateForm(TListMinusPostForAnalizPrihodaForm, ListMinusPostForAnalizPrihodaForm);
  Application.CreateForm(TMlekoSelectTovar2Dlg, MlekoSelectTovar2Dlg);
  Application.CreateForm(TListMinusPostForListAdrInfoaForm, ListMinusPostForListAdrInfoaForm);
  Application.CreateForm(TfmReasonForUnlocking, fmReasonForUnlocking);
  Application.CreateForm(TfmEditReasonForUnlocking, fmEditReasonForUnlocking);
  Application.CreateForm(TListMinusPostForAnalizOstatkaaForm, ListMinusPostForAnalizOstatkaaForm);
  Application.CreateForm(TMlekoSelectReasonForUnlockingDlg, MlekoSelectReasonForUnlockingDlg);
  Application.CreateForm(TPlanningOrderForm, PlanningOrderForm);
  Application.CreateForm(TListMinusPostForPlanningOrderaForm, ListMinusPostForPlanningOrderaForm);
  Application.CreateForm(TListMinusVidTovForPlanningOrderaForm, ListMinusVidTovForPlanningOrderaForm);
  Application.CreateForm(TListVidOtdelForPlanningOrderaForm, ListVidOtdelForPlanningOrderaForm);
  Application.CreateForm(TListTipNoIncrementRateForPlanProdagForm, ListTipNoIncrementRateForPlanProdagForm);
  Application.CreateForm(TAnalisPlanningOrderForm, AnalisPlanningOrderForm);
  Application.CreateForm(TAnalisReturnOrderForm, AnalisReturnOrderForm);
  Application.CreateForm(TListMinusPaymentForJournalOfExpensesaForm, ListMinusPaymentForJournalOfExpensesaForm);
  Application.CreateForm(TInfarmatsionny_AnalysisForm, Infarmatsionny_AnalysisForm);
  Application.CreateForm(TInfarmatsionny_AnalysisSpecForm, Infarmatsionny_AnalysisSpecForm);
  Application.CreateForm(TListTovarNoForPlanningOrderaForm, ListTovarNoForPlanningOrderaForm);
  Application.CreateForm(TAddressPostActiveForm, AddressPostActiveForm);
  Application.CreateForm(TTempTableForCreateBlankForm, TempTableForCreateBlankForm);
  Application.CreateForm(THistoryOfPriceChengeForm, HistoryOfPriceChengeForm);
  Application.CreateForm(TListMinusPostForAnalizPrihodNewaForm, ListMinusPostForAnalizPrihodNewaForm);
  Application.CreateForm(TTovarPrihForDateOfManufactureForm, TovarPrihForDateOfManufactureForm);
  Application.CreateForm(TRestTovarOfDateManufactureForm, RestTovarOfDateManufactureForm);
  Application.CreateForm(TControlRestTovarOfDateManufactureForm, ControlRestTovarOfDateManufactureForm);
  Application.CreateForm(TReconciliationReceiptPriceInInstForm, ReconciliationReceiptPriceInInstForm);
  Application.CreateForm(TOtdelForm, OtdelForm);
  Application.CreateForm(TEditOtdelForm, EditOtdelForm);
  Application.CreateForm(TVidExportExelFileForJournalOfExpensesForm, VidExportExelFileForJournalOfExpensesForm);
  Application.CreateForm(TfmCloseReturnePlat, fmCloseReturnePlat);
  Application.CreateForm(TMlekoSelectEntityTypeFromCloseReturnForm, MlekoSelectEntityTypeFromCloseReturnForm);
  Application.CreateForm(TListMinusPostForDolgForm, ListMinusPostForDolgForm);
  Application.CreateForm(TfmPrihodTovWithExel, fmPrihodTovWithExel);
  Application.CreateForm(TListTovarDateOfManufaktureForNaklForm, ListTovarDateOfManufaktureForNaklForm);
  Application.CreateForm(TControlVidRashodForPlatForm, ControlVidRashodForPlatForm);
  Application.CreateForm(TGroupCuttingForm, GroupCuttingForm);
  Application.CreateForm(TCuttingMeshForm, CuttingMeshForm);
  Application.CreateForm(TPostFromGroupCuttingForm, PostFromGroupCuttingForm);
  Application.CreateForm(TAnalisCuttingMeshForm, AnalisCuttingMeshForm);
  Application.CreateForm(TCurrencyForm, CurrencyForm);
  Application.CreateForm(TEditCurrencyForm, EditCurrencyForm);
  Application.CreateForm(TCurrencyExchangeForm, CurrencyExchangeForm);
  Application.CreateForm(TEditCurrencyExchangeForm, EditCurrencyExchangeForm);
  Application.CreateForm(TVidRashodGroupForm, VidRashodGroupForm);
  Application.CreateForm(TEditVidRashodGroupForm, EditVidRashodGroupForm);
  //  Application.CreateForm(TListVidTovForGroupCuttingForm, ListVidTovForGroupCuttingForm);
//  Application.CreateForm(TCheckMeshCuttingForm, CheckMeshCuttingForm);
//  Application.CreateForm(TMlekoCrossBlankOrderTmpForm, MlekoCrossBlankOrderTmpForm);
//  Application.CreateForm(TEditClientCardForm, EditClientCardForm);
//  Application.CreateForm(TVidDocForm, VidDocForm);
//  Application.CreateForm(TDocClientCardHeadForm, DocClientCardHeadForm);
  //  Application.CreateForm(TPricingListForm, PricingListForm);
  //  Application.CreateForm(TMLekoListAdrInfoNewForm, MLekoListAdrInfoNewForm);
  //  Application.CreateForm(TPlanningOrderHeadForm, PlanningOrderHeadForm);
  //  Application.CreateForm(TListAddressPostForOstatok1PrihodForm, ListAddressPostForOstatok1PrihodForm);
  //  Application.CreateForm(TMlekoCrossOstatok1Form, MlekoCrossOstatok1Form);
  //  Application.CreateForm(TMlekoSelectBankInvoiceDlg, MlekoSelectBankInvoiceDlg);
  //  Application.CreateForm(TListPlusPostForDolgForm, ListPlusPostForDolgForm);
  //  Application.CreateForm(TListMinusVidRashodForOstatokZeroaForm, ListMinusVidRashodForOstatokZeroaForm);
  //  Application.CreateForm(TPrihodOrderHeadForm, PrihodOrderHeadForm);
  //  Application.CreateForm(TMlekoSelectCategoryTTDlg, MlekoSelectCategoryTTDlg);
//  Application.CreateForm(TMlekoSelectFloatDlg, MlekoSelectFloatDlg);
//  Application.CreateForm(TMlekoBlankListWithKPKForm, MlekoBlankListWithKPKForm);
//  Application.CreateForm(TMlekoBlankSpecWithKPKForm, MlekoBlankSpecWithKPKForm);
  //  Application.CreateForm(TCategoryTTForm, CategoryTTForm);
//  Application.CreateForm(TEditCategoryTTForm, EditCategoryTTForm);
  //  Application.CreateForm(TTypeReturnForm, TypeReturnForm);
//  Application.CreateForm(TEditTypeReturnForm, EditTypeReturnForm);
  //  Application.CreateForm(TMlekoSelectStandartsDlg, MlekoSelectStandartsDlg);
  //  Application.CreateForm(TStandartsOfGoodsForm, StandartsOfGoodsForm);
  //  Application.CreateForm(TCrossPaymentsFromPost, CrossPaymentsFromPost);
  //  Application.CreateForm(TEmployee0, Employee0);
//  Application.CreateForm(TEditEmployee, EditEmployee);
  //  Application.CreateForm(TMlekoListAdrInfoPayBanForm, MlekoListAdrInfoPayBanForm);
  //  Application.CreateForm(TMlekoSelectTovar1Dlg, MlekoSelectTovar1Dlg);
  //  Application.CreateForm(TListPostForMail, ListPostForMail);
  //  Application.CreateForm(TMlekoSelectNaklPDlg, MlekoSelectNaklPDlg);
  //  Application.CreateForm(TMlekoSelectNaklRDlg, MlekoSelectNaklRDlg);
  //  Application.CreateForm(TfmEditTovarPost, fmEditTovarPost);
  //  Application.CreateForm(TfmTovarPost, fmTovarPost);
//  Application.CreateForm(TfmNaklRPost, fmNaklRPost);
//  Application.CreateForm(TMlekoSelectArticleGroupDlg, MlekoSelectArticleGroupDlg);
  fmMain.MainDm:=dmDataModule;
  fmMain.MainDm.Connect := true;
  if fmMain.MainDm.Connect then Application.Run;
  end.

