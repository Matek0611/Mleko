-- quPostArtGroup

declare 
   @PostNo smallint
  ,@Buh int
  ,@OrderNo int
  ,@ARTICLE_GROUP_ID bigint
  ,@ColnPrice int
  ,@TovarNo smallint

set @PostNo = 3951 --3936
set @Buh = 1
set @OrderNo  = 27579

set @TovarNo = 5780
set @ColnPrice = 2


set @ARTICLE_GROUP_ID  = 15 --4671504746769141820

/*
select * from D_SET_ARTICLE_GROUP dsag inner join 
              L_POST_SET_ARTGROUP_DELAY lpsagd on lpsagd.SET_ARTICLE_GROUP_ID = dsag.ID and lpsagd.POSTNO = 3951 and lpsagd.BUH = 1 
where lpsagd.POSTNO is not null
*/

select distinct lag.ARTICLE_GROUP_ID 
               ,dag.NAME 
               ,lag.ARTICLE_ID 
               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID 
               ,dsag.NAME 
               ,lpsagd.POSTNO 
               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_delay 
               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY 
               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT 
               ,isnull(lpsagp.POSTNO,0) as POSTNOP 
               ,isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as SET_ARTICLE_GROUP_ID_price 
               ,isnull(lpsagp.COLNPRICE,0) as COLNPRICE 
 from L_ARTICLE_GROUP lag left join 
      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join 
      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join 
      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join 
      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = @PostNo and lpsagd.BUH = @Buh left join 
      L_POST_SET_ARTGROUP_PRICE lpsagp on lsag.SET_ARTICLE_GROUP_ID = lpsagp.SET_ARTICLE_GROUP_ID and lpsagp.POSTNO = @PostNo left join 
      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID 
  where  convert(int,iov.OrderNo) = convert(int,@OrderNo)  
    and  lsag.SET_ARTICLE_GROUP_ID is not null 
    and convert(smallint,iov.Article) not in (select TovarNo 
                                               from e_blanks 
                                                where Document_id in (select idBlank 
                                                                       from l_BlankForVeb 
                                                                        where IdVeb = convert(bigint,@OrderNo))) 
    and LEN(cast(isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as varchar(50))+ cast(isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as varchar(50))) > 2
	and lpsagd.POSTNO is not null

---------

select distinct /*lag.ARTICLE_GROUP_ID
               ,dag.NAME
               ,lag.ARTICLE_ID
               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID
               ,dsag.NAME
               ,lpsagd.POSTNO
               ,lpsagd.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID_delay
               ,lpsagd.DAY_DELAY
               ,lpsagd.DAY_DELAY_EXT
               ,lpsagp.POSTNO
               , */ lpsagp.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_ID_price
               ,isnull(lpsagp.COLNPRICE,0) as COLNPRICE
 from L_ARTICLE_GROUP lag left join
      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left join 
      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID left join
      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GROUP_ID left join
      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = @PostNo and lpsagd.BUH = @Buh left join 
      L_POST_SET_ARTGROUP_PRICE lpsagp on lsag.SET_ARTICLE_GROUP_ID = lpsagp.SET_ARTICLE_GROUP_ID and lpsagp.POSTNO = @PostNo left join
      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID 
  where convert(int,iov.OrderNo) = convert(int,@OrderNo)
    and lsag.SET_ARTICLE_GROUP_ID is not null
    and convert(smallint,iov.Article) not in (select TovarNo 
                                               from e_blanks 
                                                where Document_id in (select idBlank 
                                                                       from l_BlankForVeb 
                                                                        where IdVeb = convert(bigint,@OrderNo))) 
    and LEN(cast(isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as varchar(50))+ cast(isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as varchar(50))) > 2
    and lag.ARTICLE_GROUP_ID = ISNULL(@ARTICLE_GROUP_ID,lag.ARTICLE_GROUP_ID)
	and lpsagp.SET_ARTICLE_GROUP_ID is not null
order by lpsagp.COLNPRICE

select isnull(case when @ColnPrice = 1 then Isnull(Price,0) 
                   when @ColnPrice = 2 then Isnull(Price1,0) 
                   when @ColnPrice = 3 then Isnull(Price2,0) 
                   when @ColnPrice = 4 then Isnull(Price3,0) 
                   when @ColnPrice = 5 then Isnull(Price4,0) 
                   when @ColnPrice = 6 then Isnull(Price5,0) 
                   when @ColnPrice = 7 then Isnull(Price6,0) 
                   when @ColnPrice = 8 then Isnull(Price7,0) 
                   when @ColnPrice = 10 then Isnull(Price8,0) 
                   when @ColnPrice = 11 then Isnull(Price9,0) 
                   when @ColnPrice = 12 then Isnull(Price10,0) 
                   when @ColnPrice = 13 then Isnull(Price13,0) 
                   when @ColnPrice = 14 then Isnull(Price14,0) 
                   when @ColnPrice = 15 then Isnull(Price15,0) 
                   when @ColnPrice = 9 then Isnull(AvgPriceIn,0) 
                   when @ColnPrice = 17 then Isnull(pfv.PriceVeb, 0) 
                   when @ColnPrice = 18 then Isnull(pfv.PriceInInst, 0) 
              end,0) as Price 
 from Ostatok o 
     ,PriceForVeb pfv 
  where o.TovarNo = @TovarNo 
    and o.TovarNo = pfv.TovarNo
