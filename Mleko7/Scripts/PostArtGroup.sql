select /*distinct*/ lag.ARTICLE_GROUP_ID 
               ,dag.NAME 
               ,lag.ARTICLE_ID 
               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID 
               ,dsag.NAME 
               ,lpsagd.POSTNO 
               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay 
               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY 
               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT 
               ,(select distinct COLNPRICE 
                  from L_SET_ARTICLE_GROUP lsag left join 
                       L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join 
                       L_POST_SET_ARTGROUP_PRICE lpsap on lpsap.SET_ARTICLE_GROUP_ID = lsag.SET_ARTICLE_GROUP_ID and POSTNO = 4832 
                   where COLNPRICE is not null 
                     and ARTICLE_ID = iov.Article 
	                 and ACTIVE = 'Y') as ColNPrice 
 from L_ARTICLE_GROUP lag left join 
      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join 
      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join 
      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join 
      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = 4832 and lpsagd.BUH =1 left join 
      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID 
  where convert(int,iov.OrderNo) = convert(int,217592)  
    and lsag.SET_ARTICLE_GROUP_ID is not null 
/*
    and convert(smallint,iov.Article) not in (select TovarNo 
                                               from e_blanks 
                                                where Document_id in (select idBlank 
                                                                       from l_BlankForVeb 
                                                                        where IdVeb = convert(bigint,217592) 
																		  and idBlank not in (select id 
                                     															from e_blank_head
																								 where status = -1)))
*/
    and lpsagd.POSTNO is not null 
order by lpsagd.SET_ARTICLE_GROUP_ID, ColNPrice 

select * from ImportOrderVebTmp iov where iov.OrderNo = 217592

select * from l_BlankForVeb where IdVeb = 217592
select * from e_blank_head where id in (select idBlank from l_BlankForVeb where IdVeb = 217592)
select * from e_blanks where document_id  in (select idBlank from l_BlankForVeb where IdVeb = 217592)