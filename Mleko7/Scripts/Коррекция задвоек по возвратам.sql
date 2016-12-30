select count(NaklNo) as cnt
      ,NaklNo
	  ,TypeReturnNo
	  ,max(id)
 from L_NaklRReturn
group by NaklNo,TypeReturnNo
having count(NaklNo) > 1

select * 
 from L_NaklRReturn
  where id in (select id 
                    from (select count(NaklNo) as cnt
                                ,NaklNo
                                ,TypeReturnNo
								,min(id) id
                           from L_NaklRReturn
                          group by NaklNo,TypeReturnNo
                          having count(NaklNo) > 1) c )
/*
delete L_NaklRReturn
where id in (select id 
              from (select count(NaklNo) as cnt
                                ,NaklNo
                                ,TypeReturnNo
								,min(id) id
                           from L_NaklRReturn
                          group by NaklNo,TypeReturnNo
                          having count(NaklNo) > 1) c )
*/

select * from L_NaklRReturn where NaklNo > 303588

select * from NaklR where NaklNo = 303588

select * from DSPEC where NaklNo = 303588

select * from l_BlankForVeb where idBlank = 207293

select * from L_NaklRReturn where NaklNo not in (select NaklNo from NaklR)

delete L_NaklRReturn where NaklNo not in (select NaklNo from NaklR)
