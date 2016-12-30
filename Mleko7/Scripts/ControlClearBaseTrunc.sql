select  (select max(nom) from ClearBaseRun) as CurrentNom
       ,(select TimeBeg from ClearBaseRun where nom = 1) as TimeBegin
       ,(select TimeEnd from ClearBaseRun where nom = (select max(nom) from ClearBaseRun)) as TimeEnding
	   ,(select count(*) from e_blank_head) as Cnte_blank_head
	   ,(select count(*) from e_blanks) as Cnte_blanks
	   ,(select count(distinct document_id) from e_blank_head_e_blanks) as CntSavingBlank
	   ,(select count(*) from e_blank_head_e_blanks) as Cnte_blank_head_e_blanksAll
       ,(select count(*) from NaklR) as CntNaklR
       ,(select count(distinct NaklNo) from NaklRDspec) as CntNaklRAll
       ,(select count(*) from dspec where entity_type = 'RASHOD') as CntDspecNaklR
       ,(select count(*) from NaklRDspec) as CntDspecNaklRAll
       ,(select count(*) from NaklP) as CntNaklP
       ,(select count(distinct NaklNo) from NaklPDspec) as CntNaklPAll
       ,(select count(*) from dspec where entity_type = 'PRIHOD') as CntDspecNaklP
       ,(select count(*) from NaklPDspec) as CntDspecNaklPAll
       ,(select count(*) from PlatP) as CntPlatP
       ,(select count(distinct PlatNo) from PlatPNoClose) as CntPlatPAll
       ,(select count(*) from PlatR) as CntPlatR
       ,(select count(distinct PlatNo) from PlatRNoClose) as CntPlatRAll
       ,(select count(*) from E_PlaT_Nakl_Link) as CntE_PlaT_Nakl_Link
       ,(select count(*) from E_PlaT_Nakl_LinkNoClose) as E_PlaT_Nakl_LinkNoClose
       ,(select count(*) from l_1c_dbbase) as Cntl_1c_dbbase
       ,((isnull((select TimeEnd from ClearBaseRun where nom = (select max(nom) from ClearBaseRun)),getdate()))-(select TimeBeg from ClearBaseRun where nom = (select max(nom) from ClearBaseRun))) as LastTimeRun
       ,((isnull((select TimeEnd from ClearBaseRun where nom = (select max(nom) from ClearBaseRun)),getdate()))-(select TimeBeg from ClearBaseRun where nom = 1)) as WorkTime
       ,(select TableRun from ClearBaseRun where nom = (select max(nom) from ClearBaseRun)) as CurrentWork
       , getdate() as CurrentTime