truncate table Audit.dbo.Audit_Dspec
truncate table Audit.dbo.audit_e_blank_head_online
truncate table Audit.dbo.audit_e_blanks_online
truncate table Audit.dbo.Audit_NaklP
truncate table Audit.dbo.Audit_NaklR

truncate table work.dbo.audit_blank_head
truncate table work.dbo.audit_e_blanks
truncate table work.dbo.CarForAdressPost
truncate table work.dbo.CoordinatesAddressPost
truncate table work.dbo.D_Control_PriceInInst
truncate table work.dbo.e_blank_head
truncate table work.dbo.e_blank_head_online
truncate table work.dbo.e_blanks
truncate table work.dbo.e_blanks_online
truncate table work.dbo.E_ENTITY_LINK
truncate table work.dbo.E_PlaT_Nakl_Link
truncate table work.dbo.Expedition
truncate table work.dbo.ExpeditionChange
truncate table work.dbo.l_BlankForVeb
truncate table work.dbo.L_BlankReturn
truncate table work.dbo.L_Delay_NaklP
truncate table work.dbo.L_NaklRReturn
truncate table work.dbo.NaklP
truncate table work.dbo.NaklPChange
truncate table work.dbo.NaklR
truncate table work.dbo.NaklRChange
truncate table work.dbo.NaklRToNaklR
truncate table work.dbo.NaklZachet
truncate table work.dbo.NotCompletOrder
update Ostatok set Kol = 0
truncate table work.dbo.PlatP
truncate table work.dbo.PlatR
truncate table work.dbo.PlatToNakl
truncate table work.dbo.PodotchetP
truncate table work.dbo.PodotchetR
truncate table work.dbo.PrihodChange
truncate table work.dbo.RashodChange
truncate table work.dbo.s_NaklP_Nom
truncate table work.dbo.s_NaklR_Nom
truncate table work.dbo.s_PlatP_Nom
truncate table work.dbo.s_PlatR_Nom
truncate table work.dbo.s_sub_num
truncate table work.dbo.SaleCash

exec Pr_correct_errors

begin
declare 
@DateFix SmallDateTime
,@DateBeg SmallDateTime
,@DateEnd SmallDateTime

set @DateFix=cast(convert(varchar,getdate(),104) as smalldateTime)-90
set @DateBeg=@DateFix+1
set @DateEnd=cast(convert(varchar,getdate(),104) as smalldateTime)
exec pr_rest @DateFix,'Y'
exec pr_rest_period @DateBeg,@DateEnd
end

EXEC	[dbo].[pr_defragment_indexes] 80


dbcc shrinkfile(work_log, 1)
dbcc shrinkfile(work_data, 1)