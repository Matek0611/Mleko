select * from work.dbo.d_firm_contract
/*
truncate table Audit.dbo.Audit_Dspec
truncate table Audit.dbo.audit_e_blank_head_online 
truncate table Audit.dbo.audit_e_blanks_online 
truncate table Audit.dbo.Audit_NaklP 
truncate table Audit.dbo.Audit_NaklR
truncate table Audit.[dbo].[Audit_TovarDateOfManufacture]
truncate table Audit.[dbo].[Audit_L_POST_SET_ARTGROUP_DELAY]
truncate table Audit.[dbo].[Audit_l_DspecForTovarDateOfManufacture]

*/

/*
truncate table work.dbo.Articles
truncate table work.dbo.audit_blank_head
truncate table work.dbo.Audit_e_blanks
truncate table work.dbo.AUDIT_RUN_FORM
truncate table work.dbo.CarForAdressPost
truncate table work.dbo.D_Control_PriceInInst
truncate table work.dbo.D_POST_DELAY_STOP_CONTROL
truncate table work.dbo.D_Post_PayBan_Stop_Control
truncate table work.dbo.d_firm_contract
truncate table work.dbo.DSPEC
truncate table work.dbo.e_blank_head
truncate table work.dbo.e_blank_head_e_blanks
truncate table work.dbo.e_blank_head_online
truncate table work.dbo.e_blanks
truncate table work.dbo.e_blanks_online
truncate table work.dbo.E_ENTITY_LINK
truncate table work.dbo.E_PlaT_Nakl_Link
truncate table work.dbo.e_Session_params
truncate table work.dbo.Expedition
truncate table work.dbo.ExpeditionChange
truncate table work.dbo.L_BlankForBlankOnline
truncate table work.dbo.l_BlankForExite
truncate table work.dbo.l_BlankForVeb
truncate table work.dbo.L_BlankReturn
truncate table work.dbo.L_Delay_NaklP
truncate table work.dbo.L_DICT_CATEGORY_TEMPLATE
truncate table work.dbo.L_ExpeditionWithLogistic
truncate table work.dbo.L_NaklRReturn
truncate table work.dbo.ListFileFromVostorgTmp
truncate table work.dbo.NaklP
truncate table work.dbo.NaklPChange
truncate table work.dbo.NaklR
truncate table work.dbo.NaklRChange
truncate table work.dbo.NaklRToNaklR
truncate table work.dbo.NotCompletOrder
truncate table work.dbo.Ostatok 
truncate table work.dbo.OstatokTmp
truncate table work.dbo.OstatokExpedition
truncate table work.dbo.OstatokReal
truncate table work.dbo.PlatP
truncate table work.dbo.PlatR
truncate table work.dbo.RashodChange
truncate table work.dbo.REST
-- truncate table work.dbo.s_sub_num ??????????????????????????????????????????????
truncate table work.dbo.SaleCash
truncate table work.dbo.Table_1
truncate table work.dbo.TEMP_1

truncate table work.dbo.E_PlaT_Nakl_LinkNoClose
truncate table work.dbo.E_PrihodOrderHead_TMP
truncate table work.dbo.E_PrihodOrderSpec_TMP

truncate table work.dbo.Infarmatsionny_AnalysisHead
truncate table work.dbo.Infarmatsionny_AnalysisSpec
truncate table work.dbo.l_1c_dbbase_old26_02_2015
truncate table work.dbo.l_DspecForTovarDateOfManufacture
truncate table work.dbo.l_DspecForTovarDateOfManufactureDel
truncate table work.dbo.L_ExpeditionWithLogistic

truncate table work.dbo.TempTableForCreateBlank
truncate table work.dbo.TmpDebugDateOfManufacture
truncate table work.dbo.TmpCrossPaymentForPost
truncate table work.dbo.TmpRun
truncate table work.dbo.TovarDateOfManufacture
truncate table work.dbo.TransferDayPaymentForNaklP
truncate table work.dbo.TransferDayPaymentForPlatPBDDS
truncate table work.dbo.TransferDayPaymentForPlatRBDDS
truncate table work.dbo.TTN_Record
truncate table work.dbo.w_naklr_fall_summa

truncate table work.dbo.Ostatok1Head
truncate table work.dbo.Ostatok1Nakl
truncate table work.dbo.Ostatok1Spec
truncate table work.dbo.L_Ostatok1Tovar
truncate table work.dbo.OrdersFromExcel

truncate table work.dbo.l_PriceInInstForNaklP
truncate table work.dbo.NaklPDspec
truncate table work.dbo.NaklRDspec
truncate table work.dbo.NaklRCommentOrderFromSite

truncate table work.dbo.PlanningOrderHead
truncate table work.dbo.PlanningOrderSpec
truncate table work.dbo.PlanningOrderTemp
truncate table work.dbo.PlanningOrderTovarTemp

truncate table work.dbo.PlatPNoClose
truncate table work.dbo.PlatRNoClose
truncate table work.dbo.RequestForSupplyGoodsHead
truncate table work.dbo.RequestForSupplyGoodsSpec
truncate table work.dbo.RESTTmp


truncate table arc.dbo.dspec_2008
truncate table arc.dbo.NaklP_2008
truncate table arc.dbo.NaklR_2008
truncate table arc.dbo.pack_Data_2008
truncate table arc.dbo.trace_table
truncate table arc.dbo.trace_table_2

update work.dbo.s_NaklP_Nom set id = 0
update work.dbo.s_NaklR_Nom set id = 0
update work.dbo.s_PlatP_Nom set id = 0
update work.dbo.s_PlatR_Nom set id = 0
update work.dbo.s_PlanningOrderHead set id = 0



truncate table RDATA.dbo.e_local_data

truncate table [ts_to_1c].[dbo].[CONTRACT]
truncate table [ts_to_1c].[dbo].[DSPEC]
truncate table [ts_to_1c].[dbo].[OUT_TRADE]
truncate table [ts_to_1c].[dbo].[PEOPLE]
truncate table [ts_to_1c].[dbo].[POST]
truncate table [ts_to_1c].[dbo].[PSPEC]
*/

delete Post

delete L_POST_SET_ARTGROUP_DELAY
delete L_Post_Set_ArtGroup_PayBan

DELETE FROM L_POST_SET_ARTGROUP_DELAY
DBCC CHECKIDENT('L_Post_Set_ArtGroup_PayBan', RESEED, 0)
