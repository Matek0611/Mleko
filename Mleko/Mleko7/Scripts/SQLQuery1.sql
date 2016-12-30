select * from Menu where UserNo = 74 order by ItemName

select * from e_Session_params where UserNo in (74,107)

select * from Post

SELECT SUSER_SNAME()

select @@SPID
select SYSTEM_USER

declare
   @UserName varchar(20)

select @UserName = SYSTEM_USER   

select cast(Param_Value as int)
                    from e_Session_Params
                     where Userno = (select UserNo from Users where UserName like '%'+ @UserName +'%')
                       and Owner_Name = 'CrossPaymentsFromPost'
                       and Param_Name = 'FLT_POST_BUH'
                       and Spid = @@SPID


/*
select top 100 dateadd(day,isnull(ldn.Day_Delay,0),vle.DateEntity) as DayPayment 
             , CONVERT(char(5),vle.PostNo)+'_'+ convert(CHAR(10),vle.Nom) as NaklNom
             , CONVERT(char(5),vle.PostNo)+'_'+ convert(CHAR(2),isnull(ldn.Day_Delay,0)) as DayDelay
             , CONVERT(char(5),vle.PostNo)+'_'+ convert(CHAR(25),vle.Summa) as SummaNakl
             , CONVERT(char(5),vle.PostNo)+'_'+ convert(CHAR(25),vle.CloseSumma) as SummaOpl
             , CONVERT(char(5),vle.PostNo)+'_'+ convert(CHAR(25),vle.FreeSumma) as SummaDolga
             , vle.PostNo
             , vle.DateEntity
 from V_List_entity vle left join
      L_Delay_NaklP ldn on ldn.NaklNo = vle.ID
  where Entity_Type = 'NAKLP'
order by vle.PostNo
       , vle.DateEntity  
*/
