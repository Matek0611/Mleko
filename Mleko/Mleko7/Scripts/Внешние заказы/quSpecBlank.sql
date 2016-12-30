declare   @OrderNo int
        , @OrderNom int
		, @SET_ARTICLE_GROUP_ID bigint
		, @ARTICLE_GROUP_ID bigint

select convert(int,Article) as Article 
      ,convert(decimal(18,3),ivt.KolTov) as KolTov 
      ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov 
     ,convert(numeric(18,2),ltrim(rtrim(KomplectacijaOne))) as  KomplectacijaOne 
     ,convert(numeric(18,2),ltrim(rtrim(Komplectacija))) as  Komplectacija 
     ,convert(numeric(18,2),ltrim(rtrim(Residue))) as Residue 
     ,convert(numeric(18,2),ltrim(rtrim(Need))) as Need 
 from ImportOrderVebTmp ivt 
  where convert(bigint,ivt.OrderNo) = convert(bigint,@OrderNo) 
    and convert(smallint,Article) not in (select TovarNo 
                                                  from e_blanks 
                                                   where Document_id in (select idBlank 
                                                                          from l_BlankForVeb 
                                                                           where IdVeb = convert(bigint,@OrderNom) 
                                                                             and idBlank not in (select id 
																		                                                               from e_blank_head 
																							                                                      where Status = -1))) 
    and convert(bigint,Article) in (select lag.ARTICLE_ID 
                                     from L_SET_ARTICLE_GROUP lsag left join 
                                          L_ARTICLE_GROUP lag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID 
                                      where lsag.SET_ARTICLE_GROUP_ID = convert(bigint,@SET_ARTICLE_GROUP_ID) 
                                        and lag.ARTICLE_GROUP_ID = @ARTICLE_GROUP_ID) 
    and convert(decimal(18,3),ivt.KolTov) > 0