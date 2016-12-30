declare
@OurFirmNo int

set @OurFirmNo = 490

SELECT  -- distinct VidNaklNo  

           h.NaklNo
         , h.Summa
         , h.DateNakl
         , h.Buh
         , (select ID_1C from l_1C_dbBase where pkey=p.pkey and ourFirmNo=@OurFirmNo) as Post_ID1C
         , h.Nom
         , h.VidNaklNo
         , h.pkey

FROM NaklR h,Post p 
WHERE h.PostNo=p.PostNo
  and /*h.DateNakl = '15.02.2015' --*/(h.DateNakl between '19.02.2015' AND '19.02.2015')
  and h.Buh in (2,3)
  and h.OurFirmNo= @OurFirmNo
--  and not exists (select 1 from l_1c_dbBase where pkey=h.pkey and ourFirmNo=@OurFirmNo)
ORDER BY h.DateNakl, h.NaklNo




select pkey 
 from
(select count(pkey) as cnt, pkey 
 from l_1C_dbBase 
  where ourFirmNo = 490
    --and table_name = 'NAKLR'
group by pkey
having count(pkey) > 1) u

select * from l_1C_dbBase where pkey in
(select pkey 
 from
(select count(pkey) as cnt, pkey 
 from l_1C_dbBase 
  where ourFirmNo = 490
group by pkey
having count(pkey) > 1) u)
order by pkey

---------------------------------

select convert (varchar(19),pkey)+'_'+ convert(varchar(30),min(action_date)) as action_date
 from l_1C_dbBase
  where pkey in (select pkey 
                  from (select count(pkey) as cnt, pkey 
                         from l_1C_dbBase 
                          where ourFirmNo = 490
                 group by pkey
                 having count(pkey) > 1) u)
group by pkey

select * from VidNakl
/*

delete l_1c_dbbase
where pkey in (select pkey 
                from l_1c_dbbase 
                 where pkey in (select pkey
                                 from NaklR r
                                  where r.DateNakl >= '09.02.2015'
                                    and VidNaklNo in (1,3,5))
									and Buh in (2,3)
                   and table_name = 'NAKLR')


delete l_1C_dbBase
where convert (varchar(19),pkey)+'_'+ convert(varchar(30),action_date) in (select convert (varchar(19),pkey)+'_'+ convert(varchar(30),min(action_date)) as action_date
 from l_1C_dbBase
  where pkey in (select pkey 
                  from (select count(pkey) as cnt, pkey 
                         from l_1C_dbBase 
                          where ourFirmNo = 490
                 group by pkey
                 having count(pkey) > 1) u)
group by pkey)

*/

-- insert into l_1c_dbbase_old26_02_2015
/*
truncate table l_1c_dbbase

insert into l_1c_dbbase
select * from [logistics\logist].[work].[dbo].[l_1c_dbbase]

delete l_1c_dbbase
where pkey in (select l.pkey
                from (select *
                       from NaklR
                        where DateNakl >= '09.02.2015' 
                          and VidNaklNo in (1,3,5) 
	                      and Buh in (2,3)) s inner join
                      l_1c_dbbase l on l.table_name = 'NAKLR' and l.pkey = s.pkey)
--           order by postno

delete l_1c_dbbase
where pkey in (select l.pkey 
                from (select *
                       from NaklP
		                where DateNakl >= '09.02.2015') s inner join
               l_1c_dbbase l on l.table_name = 'NAKLP' and l.pkey = s.pkey)


delete l_1c_dbbase
where pkey in (select l.pkey 
                from (select *
                       from PLATP
		                where DatePlat >= '09.02.2015') s inner join
               l_1c_dbbase l on l.table_name = 'PLATP' and l.pkey = s.pkey)
*/

select   b.id_1c as id_1cB
       , l.id_1c as id_1cL
	   , b.action_date as action_dateB
	   , l.action_date as action_dateL
	   , p.PostNo
	   , p.Name
	   , p.NameLong
/*
	   , (select PostNo from Post where pkey = b.pkey and pkey = l.pkey) as PostNo
	   , (select name from Post where pkey = b.pkey and pkey = l.pkey) as name
	   , (select NameLong from Post where pkey = b.pkey and pkey = l.pkey) as NameLong
*/
 from (select * from l_1c_dbbase where table_name = 'POST') b ,
      (select * from [logistics\logist].[work].[dbo].[l_1c_dbbase] where table_name = 'POST') l,
	  Post p
  where b.pkey = l.pkey
    and b.id_1c <> l.id_1c
	and p.pkey = b.pkey 
	and p.pkey = l.pkey
order by l.action_date, p.Name

select *
                from (select *
                       from NaklR
                        where DateNakl >= '09.02.2015' 
                          and VidNaklNo  in (1,3,5) 
	                      and Buh in (2,3)
						  and PostNo = 90) s inner join
						  
                      l_1c_dbbase l on l.table_name = 'NAKLR' and l.pkey = s.pkey
order by /* PostNo ,*/ DateNakl 

select * 
 from (select *
        from NaklP
		 where DateNakl >= '09.02.2015') s inner join
      l_1c_dbbase l on l.table_name = 'NAKLP' and l.pkey = s.pkey

select * 
 from (select *
        from PLATP
		 where DatePlat >= '09.02.2015') s inner join
      l_1c_dbbase l on l.table_name = 'PLATP' and l.pkey = s.pkey


select * 
 from NaklR h
  where VidNaklNo = 5
    and (h.DateNakl between '09.02.2015' AND '15.02.2015')

select * from l_1C_dbBase where pkey in (8613104383954103098,5627782647947214968)

select distinct table_name from l_1C_dbBase

select * from Post where PostNo = 7662

select * 
 from [1C7SERVER\SRV_TERM].[MLK_2013_WORK].[dbo].[DH1545]



