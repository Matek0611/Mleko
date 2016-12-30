delete Post

ALTER TABLE [dbo].[Tovar] DROP CONSTRAINT [DF_Tovar_TaraNo]
GO

ALTER TABLE [dbo].[Tovar] DROP CONSTRAINT [DF_Tovar_Visible]
GO

ALTER TABLE [dbo].[Tovar] DROP CONSTRAINT [DF_Tovar_weight_packed]
GO

ALTER TABLE [dbo].[Tovar] DROP CONSTRAINT [FK_Tovar_Company]
GO

ALTER TABLE [dbo].[Tovar] DROP CONSTRAINT [FK_Tovar_VidTov]
GO

delete VidTov

delete Tovar

delete D_SET_ARTICLE_GROUP
delete D_ARTICLE_GROUP

ALTER TABLE [dbo].[Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Tovar_VidTov] FOREIGN KEY([VidNo])
REFERENCES [dbo].[VidTov] ([VidNo])
GO

ALTER TABLE [dbo].[Tovar] CHECK CONSTRAINT [FK_Tovar_VidTov]
GO

ALTER TABLE [dbo].[Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Tovar_Company] FOREIGN KEY([CompanyNo])
REFERENCES [dbo].[Company] ([CompanyNo])
GO

ALTER TABLE [dbo].[Tovar] CHECK CONSTRAINT [FK_Tovar_Company]
GO

ALTER TABLE [dbo].[Tovar] ADD  CONSTRAINT [DF_Tovar_weight_packed]  DEFAULT ((0)) FOR [weight_packed]
GO

ALTER TABLE [dbo].[Tovar] ADD  CONSTRAINT [DF_Tovar_Visible]  DEFAULT ((0)) FOR [Visible]
GO

ALTER TABLE [dbo].[Tovar] ADD  CONSTRAINT [DF_Tovar_TaraNo]  DEFAULT ((0)) FOR [TaraNo]
GO

ALTER TABLE [dbo].[EmployeeScope] DROP CONSTRAINT [EmployeeScope_fk]
GO

truncate table EmployeeScope
truncate table Employee

ALTER TABLE [dbo].[EmployeeScope]  WITH CHECK ADD  CONSTRAINT [EmployeeScope_fk] FOREIGN KEY([EmployeeNo])
REFERENCES [dbo].[Employee] ([EmployeeNo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[EmployeeScope] CHECK CONSTRAINT [EmployeeScope_fk]
GO

USE [work]
GO

ALTER TABLE [dbo].[Company] DROP CONSTRAINT [DF_Company_Visible]
GO

delete Company

ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [DF_Company_Visible]  DEFAULT ((0)) FOR [Visible]
GO

truncate table D_POST_DELAY_STOP_CONTROL

delete L_POST_SET_ARTGROUP_DELAY
delete L_Post_Set_ArtGroup_PayBan


DELETE FROM L_Post_Set_ArtGroup_PayBan
DBCC CHECKIDENT('L_Post_Set_ArtGroup_PayBan', RESEED, 0)

delete Setup
delete SetupForExpedition
delete Users where UserNo <> 57


update s_DocClientCardHead set id = 0
update s_NaklP_Nom set id = 0
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
truncate table ClassifierABCDZ
truncate table ClearBaseRun

truncate table Confidant_List
truncate table CoordinatesAddressPost
truncate table cp_rest
truncate table CreateBlancWithSite
truncate table Customer_List
truncate table d_activity_type
truncate table d_app_settings
truncate table D_AREA

truncate table D_AUDIT_TABLE
truncate table D_BANK
truncate table D_BANK_INVOICE
truncate table d_blank_reason
truncate table d_blank_reason_old
truncate table d_buh_type
truncate table D_CASH_TYPE
truncate table D_CategoryTT
truncate table D_CONSIGN
truncate table d_contract_type
truncate table D_Control_PriceInInst
truncate table D_CURRENCY
truncate table D_DEPT
truncate table D_DEPT_TYPE
truncate table d_doc_state
truncate table d_doc_type
truncate table d_edit_status
truncate table D_EXPEDITION_ROUTE
truncate table d_Expedition_TimeGo
truncate table d_firm_contract
truncate table d_firm_prop
truncate table d_fiscal
truncate table D_INCLUDE
truncate table d_increment
truncate table d_Kassa
truncate table D_Manager_team
truncate table D_NAKLR_TYPE
truncate table D_OTDEL_BRAND_TYPE
truncate table d_place
truncate table d_PLat_Type
truncate table d_PlatR_Tip

truncate table D_Post_PayBan_Stop_Control
truncate table D_PRICE
truncate table D_REPL_TABLE
truncate table D_RESPONSE_DEPT
truncate table d_sector_response

truncate table d_settings_1c_EXPORT
truncate table d_settings_1c_IMPORT
truncate table d_sotrud_address
truncate table d_tovar_weight
truncate table D_TypeReturn
truncate table d_vidrash_group
truncate table d_vidtov_group
truncate table DeliveryOfGoods
truncate table DeltaPrice
truncate table DescriptionDjobSupplier
truncate table DescriptionsOrdersVeb
truncate table DocClientCardAddressPostSpec
truncate table DocClientCardDelaySpec
truncate table DocClientCardHead
truncate table DocClientCardPriceSpec
truncate table DocClientCardSotrudAddressSpec
truncate table dspec

truncate table E_APP_SETTINGS
truncate table e_blank_head
truncate table e_blank_headTMP
truncate table e_blanks
truncate table e_blanksTMP
truncate table e_debug
truncate table E_ENTITY_LINK
truncate table E_PlaT_Nakl_Link
truncate table e_Session_params

truncate table Expedition
truncate table ExpeditionChange
truncate table FirstFreeNaklTmp
truncate table GoodStandarts
truncate table GroupCutting
truncate table HistoriBanShipment
truncate table HistoriPrice
truncate table ImportGPSPoint
truncate table ImportGPSPointTmp
truncate table ImportOrderVebTmp
truncate table ImportOrderVebTmp1
truncate table ImportTovarPost
truncate table Infarmatsionny_AnalysisHead
truncate table Infarmatsionny_AnalysisSpec
truncate table KOATUUOfPepsico
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
truncate table L_ARTICLE_GROUP
truncate table L_BlankForBlankOnline
truncate table l_BlankForExcel
truncate table l_BlankForVeb
truncate table L_BlankReturn
truncate table L_CarsProperty
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
truncate table L_ListVidTovForGroupCutting
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
truncate table L_SET_ARTICLE_GROUP
truncate table l_TovarForReturn
truncate table L_VidExportExelFile
truncate table L_VidExportExelFileForJournalOfExpenses
truncate table L_VidImportExelFileForNaklP
truncate table l_VidOtdelProp
truncate table l_vidtov_group
truncate table L_VidTovForExportForScales
truncate table L_VidTovForExportPrise
truncate table LastDateDataSlice
truncate table ListAddressPostForOstatok1
truncate table ListAddressPostForOstatok1Prihod
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
truncate table ListPostMail
truncate table ListTipNoIncrementRateForPlanProdag
truncate table ListTovarNoForPlanningOrder
truncate table ListVidOtdelForPlanningOrder
truncate table ListUsersForChange
truncate table ListUsersForChangeBuh
truncate table ListUsersForRequiredData
truncate table ListVidOtdelForPlanningOrder
truncate table ListVidTovForGroupCutting
truncate table MarijaGroupTax
truncate table MaxKolForAnalysisUnlocking
truncate table MaxKolFromAnalysisOstatok
truncate table MaxKolFromOstatok
truncate table MonthOtchetForSandora
truncate table NaklP
truncate table NaklR
truncate table NaklRChange
truncate table NaklRCommentOrderFromSite
truncate table OrdersFromExcel
truncate table Ostatok
truncate table Ostatok1Head
truncate table Ostatok1Nakl
truncate table Ostatok1Spec
truncate table OstatokExpedition
truncate table Our_Tovar
truncate table Our_TovarTemp
truncate table PercentsSalary
truncate table PlanningOrderHead
truncate table PlanningOrderSpec
truncate table PlanningOrderTemp
truncate table PlanningOrderTovarTemp
truncate table PlatP
truncate table PlatR
--truncate table Post
truncate table Post_Ban_Return
truncate table Post_Mail
truncate table PriceForVeb
truncate table PriceForVebTmp
truncate table PrihodOrderShablon
truncate table PROFILE
truncate table RashodChange
truncate table ReasonForUnlocking
truncate table Regions
truncate table RequestForSupplyGoodsHead
truncate table RequestForSupplyGoodsSpec
truncate table REST
truncate table rest_recalc
truncate table s_sub_num 
truncate table SaleCash
truncate table SalesChannelsOfPepsico
truncate table Service
truncate table Shipper_List
truncate table Shipping_Agent
truncate table Social_Tovar
truncate table Sotrud
truncate table Storekeeper_List
truncate table TempTableForCreateBlank
truncate table TmpDebugDateOfManufacture
truncate table TmpRest
truncate table TmpRestPrice
truncate table TmpRun
truncate table TopTovars

truncate table TovarDateOfManufacture
truncate table TovarDateOfManufactureTmp
truncate table TovarExpirationDate
truncate table TovarExpirationDateTmp
truncate table TovarFromDeliveryOfGoods
truncate table TovarFromDeliveryOfGoodsTmp
truncate table TovarNDS
truncate table TovarNDSTmp
truncate table TovarNOPP
truncate table TovarNOPPTmp
truncate table TovarPost
truncate table TovarPostTemp
truncate table TovarSupplier
truncate table TovarTmp
truncate table TovarWithNoNDS
truncate table TovarWithNoNDSTemp
truncate table TransferDayPaymentForNaklP
truncate table TransferDayPaymentForPlatPBDDS
truncate table TransferDayPaymentForPlatRBDDS
truncate table TTN_Record
truncate table Veres_avtorizacia
truncate table VidDoc
truncate table VidNakl
truncate table VidOtdel
truncate table VidRashod

truncate table w_delay
truncate table w_entity_type
truncate table w_naklr_fall_summa

truncate table Audit.dbo.Audit_Dspec
truncate table Audit.dbo.audit_e_blank_head_online 
truncate table Audit.dbo.audit_e_blanks_online 
truncate table Audit.dbo.Audit_NaklP 
truncate table Audit.dbo.Audit_NaklR
truncate table Audit.[dbo].[Audit_TovarDateOfManufacture]
truncate table Audit.[dbo].[Audit_L_POST_SET_ARTGROUP_DELAY]
truncate table Audit.[dbo].[Audit_l_DspecForTovarDateOfManufacture]

truncate table arc.dbo.dspec_2008
truncate table arc.dbo.NaklP_2008
truncate table arc.dbo.NaklR_2008
truncate table arc.dbo.pack_Data_2008
truncate table arc.dbo.trace_table
truncate table arc.dbo.trace_table_2


truncate table RDATA.dbo.e_local_data

truncate table [ts_to_1c].[dbo].[CONTRACT]
truncate table [ts_to_1c].[dbo].[DSPEC]
truncate table [ts_to_1c].[dbo].[OUT_TRADE]
truncate table [ts_to_1c].[dbo].[PEOPLE]
truncate table [ts_to_1c].[dbo].[POST]
truncate table [ts_to_1c].[dbo].[PSPEC]

truncate table [1c_to_ts].[dbo].[SETTINGS]



















