declare   @PostNo int
        , @PostNom int 
		, @Buh int
		, @ARTICLE_GROUP_ID bigint
		, @OrderNom int

select distinct lpsagp.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID_price
      , isnull(lpsagp.COLNPRICE,0) as COLNPRICE
 from L_POST_SET_ARTGROUP_PRICE lpsagp left join
      L_SET_ARTICLE_GROUP lsag on lpsagp.SET_ARTICLE_GROUP_ID = lsag.SET_ARTICLE_GROUP_ID left join
	  L_ARTICLE_GROUP lag on lsag.ARTICLE_GROUP_ID = lag.ARTICLE_GROUP_ID left join
	  ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID
  where POSTNO = @PostNo
    and lsag.ARTICLE_GROUP_ID in (select ARTICLE_GROUP_ID 
                                   from L_SET_ARTICLE_GROUP 
                                    where SET_ARTICLE_GROUP_ID in (select SET_ARTICLE_GROUP_ID from L_POST_SET_ARTGROUP_DELAY where POSTNO = @PostNom and buh = @Buh))
    and lsag.ARTICLE_GROUP_ID = ISNULL(@ARTICLE_GROUP_ID,lag.ARTICLE_GROUP_ID)
    and convert(smallint,iov.Article) not in (select TovarNo 
                                               from e_blanks 
                                                where Document_id in (select idBlank 
                                                                       from l_BlankForVeb 
                                                                        where IdVeb = convert(bigint,@OrderNom)
                                                                          and idBlank not in (select id
                                                  			                       from e_blank_head
						                  			                                where Status = -1)))