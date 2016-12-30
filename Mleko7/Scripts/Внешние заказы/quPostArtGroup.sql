declare  @PostNom int
       , @PostNo int
	   , @Buh int
	   , @OrderNo int
	   , @OrderNom int



set @OrderNo = 705356
set @OrderNom = 705356
set @Buh = 1
set @PostNo = 7498
set @PostNom = 7498

select distinct lag.ARTICLE_GROUP_ID 
               ,dag.NAME 
               ,lag.ARTICLE_ID 
               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID 
               ,dsag.NAME as Set_Article_Group_Name 
               ,lpsagd.POSTNO 
               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay 
               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY 
               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT 
               ,(select distinct COLNPRICE 
                  from L_SET_ARTICLE_GROUP lsag left join 
                       L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join 
                       L_POST_SET_ARTGROUP_PRICE lpsap on lpsap.SET_ARTICLE_GROUP_ID = lsag.SET_ARTICLE_GROUP_ID and POSTNO = @PostNom 
                   where COLNPRICE is not null 
                     and ARTICLE_ID = iov.Article 
	                    and ACTIVE = 'Y') as ColNPrice 
 from L_ARTICLE_GROUP lag left join 
      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join 
      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join 
      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join 
      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = @PostNo and lpsagd.BUH = @Buh left join 
      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID 
  where convert(int,iov.OrderNo) = convert(int,@OrderNo)  
    and lsag.SET_ARTICLE_GROUP_ID is not null 
    and convert(smallint,iov.Article) not in (select TovarNo 
                                               from e_blanks 
                                                where Document_id in (select idBlank 
                                                                       from l_BlankForVeb 
                                                                        where IdVeb = convert(bigint,@OrderNom) 
                                                                          and idBlank not in (select id 
                                     																		                      from e_blank_head 
                                               																							   where Status = -1))) 
    and lpsagd.POSTNO is not null 
order by lpsagd.DAY_DELAY, ColNPrice 

