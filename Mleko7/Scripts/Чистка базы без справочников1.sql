delete Tovar where VidNo not in (1504,1505,1506)
delete Ostatok where TovarNo not in (select TovarNo from Tovar where VidNo in (1504,1505,1506))
delete PriceForVeb where TovarNo not in (select TovarNo from Tovar where VidNo in (1504,1505,1506))
delete REST where Article_id not in (select TovarNo from Tovar where VidNo in (1504,1505,1506))
delete TovarExpirationDate where TovarNo not in (select TovarNo from Tovar where VidNo in (1504,1505,1506))
delete TovarFromDeliveryOfGoods where TovarNo not in (select TovarNo from Tovar where VidNo in (1504,1505,1506))
delete TovarNDS where TovarNo not in (select TovarNo from Tovar where VidNo in (1504,1505,1506))
delete D_PRICE where TovarNo not in (select TovarNo from Tovar where VidNo in (1504,1505,1506))
delete L_ARTICLE_GROUP where ARTICLE_ID not in (select TovarNo from Tovar where VidNo in (1504,1505,1506))

update s_DocClientCardHead set id = 0
update s_NaklR_Nom set id = 0
update s_PlanningOrderHead set id = 0
update s_PlatP_Nom set id = 0
update s_PlatR_Nom set id = 0

truncate table A_l_firm_prop
truncate table AddresPostGLN
truncate table AddressCorrespondence
truncate table AddressPost
truncate table AddressPost_CODE_Commerce_Network_Of_Pepsico
truncate table audit_blank_head
truncate table Audit_e_blanks
truncate table CarCarrier_List
truncate table CarForAdressPost
truncate table Cars
truncate table CheckMeshCutting

truncate table NaklR
truncate table NaklP
truncate table PlatP
truncate table PlatR
truncate table dspec
truncate table e_blanks
truncate table e_blank_head

truncate table OrdersExite
truncate table TovarPost
truncate table d_firm_contract
truncate table D_POST_DELAY_STOP_CONTROL
truncate table D_Post_PayBan_Stop_Control
truncate table DocClientCardAddressPostSpec
truncate table DocClientCardDelaySpec
truncate table DocClientCardHead
truncate table DocClientCardPriceSpec
truncate table DocClientCardSotrudAddressSpec
truncate table e_debug
truncate table E_ENTITY_LINK
truncate table E_PlaT_Nakl_Link
truncate table Expedition
truncate table ExpeditionChange
truncate table FirstFreeNaklTmp
truncate table HistoriBanShipment
truncate table ImportTovarPost
truncate table ImportOrderVebTmp
truncate table KolCuttiungBlanks
truncate table KolGroupCutting
truncate table l_1c_dbbase
truncate table l_1c_dbbase_old26_02_2015
truncate table L_AddressPost_CODE_Commerce_Network_Of_Pepsico
truncate table L_AddressPostActive
truncate table L_AddressPostClassifierABCDZ
truncate table L_AddressPostKOATUUOfPepsico
truncate table L_AddressPostProp
truncate table L_AddressPostSalesChannelsOfPepsico
truncate table L_BlankForBlankOnline
truncate table l_BlankForExcel
truncate table l_BlankForVeb
truncate table L_BlankReturn
truncate table ListMinusPaymentForJournalOfExpenses
truncate table ListMinusPostForAnalizOstatka
truncate table ListMinusPostForAnalizPrihod
truncate table ListMinusPostForAnalizPrihodNew
truncate table ListMinusPostForBDDS
truncate table ListMinusPostForClearBase
truncate table ListMinusPostForDolg
truncate table ListMinusPostForListAdrInfo
truncate table ListMinusPostForOstatokZero
truncate table ListMinusPostForPlanningOrder
truncate table ListMinusPostPayment
truncate table ListMinusPrihodOrder
truncate table ListMinusVidRashForClearBase
truncate table ListMinusVidRashForOstatokZero
truncate table ListMinusVidRashPlatPForSite
truncate table ListMinusVidRashPlatRForSite
truncate table ListMinusVidTovar
truncate table ListMinusVidTovForPlanningOrder
truncate table ListPlusPostForDolg
truncate table ListPlusPostPayment
truncate table ListTovarNoForPlanningOrder
truncate table ListVidOtdelForPlanningOrder
truncate table L_CarsProperty
truncate table ClassifierABCDZ
truncate table ClearBaseRun
truncate table Company
truncate table Confidant_List
truncate table CoordinatesAddressPost
truncate table cp_rest
truncate table CreateBlancWithSite
truncate table Customer_List


truncate table L_CategoryAddressPost
truncate table L_Delay_NaklP
truncate table l_doc_signature
truncate table l_DspecForTovarDateOfManufacture
truncate table l_DspecForTovarDateOfManufactureDel
truncate table l_DspecForTovarDateOfManufactureTest
truncate table L_ExpeditionWithLogistic
truncate table L_ExportInExcelFile
truncate table l_firm_prop
truncate table l_GoodStandart
truncate table L_NaklNoAfterClearBaseTrunc
truncate table l_NaklPForNaklR
truncate table l_NaklPForNaklRTemp
truncate table L_NaklRReturn
truncate table L_Otdel_Tovar
--truncate table L_POST_SET_ARTGROUP_DELAY
--truncate table L_Post_Set_ArtGroup_PayBan
truncate table L_POST_SET_ARTGROUP_PRICE
truncate table L_POST_VIDTOVGR_DELAY_PAY
truncate table l_PostGroupCutting
truncate table l_PriceInInstForNaklP
truncate table l_TovarForReturn
truncate table L_VidExportExelFile
truncate table L_VidImportExelFileForNaklP
truncate table ListAddressPostForOstatok1
truncate table ListAddressPostForOstatok1Prihod
truncate table MonthOtchetForSandora
truncate table NaklRChange
truncate table NaklRCommentOrderFromSite
truncate table OrdersFromExcel
truncate table Ostatok1Head
truncate table Ostatok1Nakl
truncate table Ostatok1Spec
truncate table OstatokExpedition
truncate table Our_Tovar
truncate table Our_TovarTemp
truncate table PlanningOrderHead
truncate table PlanningOrderSpec
truncate table PlanningOrderTemp
truncate table PlanningOrderTovarTemp
--truncate table Post
truncate table Post_Ban_Return
truncate table Post_Mail
truncate table PrihodOrderShablon
truncate table RashodChange
truncate table RequestForSupplyGoodsHead
truncate table RequestForSupplyGoodsSpec
truncate table s_sub_num 
truncate table SaleCash
truncate table Service
truncate table Shipper_List
truncate table Shipping_Agent
truncate table Social_Tovar
truncate table Sotrud
truncate table Storekeeper_List
truncate table TempTableForCreateBlank
truncate table TmpDebugDateOfManufacture
truncate table TovarSupplier
truncate table TovarTmp
truncate table TransferDayPaymentForNaklP
truncate table TransferDayPaymentForPlatPBDDS
truncate table TransferDayPaymentForPlatRBDDS
truncate table TTN_Record
truncate table Veres_avtorizacia
truncate table w_delay
truncate table w_entity_type
truncate table w_naklr_fall_summa
truncate table D_Control_PriceInInst
truncate table d_Kassa
truncate table d_sotrud_address
truncate table d_tovar_weight
truncate table DescriptionDjobSupplier
truncate table DescriptionsOrdersVeb
truncate table ImportGPSPoint
truncate table ImportGPSPointTmp
truncate table Infarmatsionny_AnalysisHead
truncate table Infarmatsionny_AnalysisSpec
truncate table ListPostMail
truncate table ListTipNoIncrementRateForPlanProdag
truncate table TovarDateOfManufacture
truncate table TovarDateOfManufactureTmp
truncate table TopTovars
truncate table TmpRest
truncate table TmpRestPrice
truncate table TmpRun

