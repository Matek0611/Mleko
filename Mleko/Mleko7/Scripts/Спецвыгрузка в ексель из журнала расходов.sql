declare -- 915 588, 88 266
    @UserNo int 
	, @SPID int 
set @UserNo = convert(int,74) 
set @SPID = convert(int,62) 
/*
 select  + Select1

 union all 
*/
 select  *
 from dbo.V_List_entity a 
  where DateEntity between '01.01.2014' and '29.01.2016'
    and ((abs(Summa-CloseSumma-FreeSumma) > 0.02) or 0 =0) 
	and [a].[FreeSumma] <> 0
    and (is_econom= 0 or 1 = 1) 

    AND (a.PostNoFirst in (select cast(Param_Value as int) 
                            from e_Session_Params 
                             where Userno = @UserNo 
                               and Owner_Name = 'MlekoClosePlatRForm'
                               and Param_Name = 'FLT_POST'
                               and Spid = @SPID) or 1 = 1) 

 
    AND (a.PostNo in (select cast(Param_Value as int) 
                       from e_Session_Params 
                        where Userno = @UserNo 
                          and Owner_Name = 'MlekoClosePlatRForm'
                          and Param_Name = 'FLT_POST_BUH'
                          and Spid = @SPID) or 1 = 1) 
    AND (a.Entity_type_id in (select cast(Param_Value as int) 
                               from e_Session_Params 
                                where Userno = @UserNo 
                                  and Owner_Name = 'MlekoClosePlatRForm'
                                  and Param_Name = 'FLT_ENTITY_TYPE'
                                  and Spid = @SPID) or 0 = 1) 
    AND (a.buh in (select cast(Param_Value as int) 
                    from e_Session_Params 
                     where Userno = @UserNo 
                       and Owner_Name = 'MlekoClosePlatRForm'
                       and Param_Name = 'FLT_BUH'
                       and Spid = @SPID) or 1 = 1) 
    AND (a.OurFirmNo in (select cast(Param_Value as int) 
                          from e_Session_Params 
                           where Userno = @UserNo 
                             and Owner_Name = 'MlekoClosePlatRForm'
                             and Param_Name = 'FLT_OURFIRM'
                             and Spid = @SPID) or 1 = 1) 
    AND (a.OtdelNo in (select cast(Param_Value as int) 
                        from e_Session_Params 
                         where Userno = @UserNo 
                           and Owner_Name = 'MlekoClosePlatRForm'
                           and Param_Name = 'FLT_OTDEL'
                           and Spid = @SPID) or 1 = 1) 
    AND (a.tip in (select cast(Param_Value as int) 
                    from e_Session_Params 
                     where Userno = @UserNo 
                       and Owner_Name = 'MlekoClosePlatRForm'
                       and Param_Name = 'FLT_TIP'
                       and Spid = @SPID) or 1 = 1) 
    AND (a.VidNo in (select cast(Param_Value as int) 
                      from e_Session_Params 
                       where Userno = @UserNo 
                         and Owner_Name = 'MlekoClosePlatRForm'
                         and Param_Name = 'FLT_VIDRASH'
                         and Spid = @SPID) or 1 = 1) 
    and ((a.tip not in (select TipNo from ListMinusPaymentForJournalOfExpenses where CheckMinus = 1) or a.tip is null) or 1 = 0) 
