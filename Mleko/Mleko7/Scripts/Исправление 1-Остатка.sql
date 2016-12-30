select * 
 from Ostatok1Head 
  where id = 14


select * 
 from Ostatok1Spec 
  where Ostatok1Head_Id = 14
    and KolZakItog < 0 or KolZakNow < 0

select * from Ostatok1Nakl where Ostatok1Id = 29

select * 
 from Ostatok1Spec os left join
      (select TovarNo, sum(Qty) as KolZakItog
        from Ostatok1Nakl 
         where TovarNo in (select TovarNo 
                            from Ostatok1Spec 
                             where Ostatok1Head_Id = 29)
           and Ostatok1Id = 29
       group by TovarNo) u on u.TovarNo = os.TovarNo and os.Ostatok1Head_Id = 29

select * 
 from Ostatok1Spec os left join
      (select o.Ostatok1Id, TovarNo, sum(Qty) as KolZakItog
        from Ostatok1Nakl o
       group by Ostatok1Id, TovarNo) Itog on Itog.TovarNo = os.TovarNo and os.Ostatok1Head_Id = Itog.Ostatok1Id left join
      (select o.Ostatok1Id, TovarNo, sum(Qty) as KolZakNow
        from Ostatok1Nakl o
		 where NaklNo is null
       group by Ostatok1Id, TovarNo) Nov on nov.Ostatok1Id = os.Ostatok1Head_Id and nov.TovarNo = os.TovarNo
  where Itog.TovarNo is not null
    and os.Ostatok1Head_Id = 4
--	and Itog.TovarNo = 15448
order by Ostatok1Head_Id

select * from Ostatok1Nakl where Ostatok1Id = 4 and TovarNo = 5364

select * 
 from Ostatok1Spec
  where Ostatok1Head_Id = 4
    and TovarNo not in (select TovarNo from Ostatok1Nakl where Ostatok1Id = 4)

/*
update Ostatok1Spec  
  set  KolZakItog = Itog.KolZakItog
     , OstVirtKol = os.BegVirtKol - Itog.KolZakItog
	 , KolZakNow = isnull(Nov.KolZakNow,0)
from Ostatok1Spec os left join
      (select o.Ostatok1Id, TovarNo, sum(Qty) as KolZakItog
        from Ostatok1Nakl o
       group by Ostatok1Id, TovarNo) Itog on Itog.TovarNo = os.TovarNo and os.Ostatok1Head_Id = Itog.Ostatok1Id left join
      (select o.Ostatok1Id, TovarNo, sum(Qty) as KolZakNow
        from Ostatok1Nakl o
		 where NaklNo is null
       group by Ostatok1Id, TovarNo) Nov on nov.Ostatok1Id = os.Ostatok1Head_Id and nov.TovarNo = os.TovarNo
  where Itog.TovarNo is not null
    and os.Ostatok1Head_Id = 14
*/

select * from L_Ostatok1Tovar



-- delete Ostatok1Nakl where Ostatok1Id = 29
/*
update Ostatok1Spec
 set  KolZakItog = null
    , OstVirtKol = null
	, KolZakNow = null
where Ostatok1Head_Id = 29

update Ostatok1Spec
 set  KolZakItog = null
    , OstVirtKol = null
	, KolZakNow = null
where id in (select id 
              from Ostatok1Spec
               where Ostatok1Head_Id = 14
                 and TovarNo not in (select TovarNo from Ostatok1Nakl where Ostatok1Id = 14))
*/



select * 
 from Ostatok1Spec
  where TovarNo = 5780
    and Ostatok1Head_Id = 14

select *
 from Ostatok1Nakl
  where Ostatok1Id = 14
    and TovarNo = 5145
order by NaklNo

select sum(Qty)
 from Ostatok1Nakl
  where Ostatok1Id = 14
    and TovarNo = 5145


select * 
 from NaklR
  where NaklNo in (select NaklNo
                    from Ostatok1Nakl
                     where Ostatok1Id = 14
                       and TovarNo = 5145)

select *
 from DSPEC
  where NaklNo in (select NaklNo
                    from Ostatok1Nakl
                     where Ostatok1Id = 14
                       and TovarNo = 5145) 
    and ARTICLE_ID = 5145

select *
 from audit.dbo.Audit_Dspec
  where NaklNo in (select NaklNo
                    from Ostatok1Nakl
                     where Ostatok1Id = 14
                       and TovarNo = 5145) 
    and ARTICLE_ID = 5145
	and Edit_host_name <> 'SIRIUS'
order by Edit_date



select *
 from DSPEC
  where NaklNo in (select NaklNo
                    from Ostatok1Nakl
                     where Ostatok1Id = 14
                       and TovarNo = 5145) 
    and NaklNo = 175267
    and ARTICLE_ID in (select TovarNo
                        from Ostatok1Spec
                         where OstVirtKol < 0)
order by NaklNo

select *
 from Ostatok1Nakl
  where Ostatok1Id = 14
    and TovarNo = 8641
order by NaklNo


select *
 from DSPEC
  where ARTICLE_ID = 8641
    and NaklNo = 175267

select * 
 from Ostatok1Spec
  where OstVirtKol < 0

/*
delete Ostatok1Nakl where id = 38872 
 
delete dspec where id = 8554845464149592168

update Ostatok1Nakl
 set qty = 9
where id = 40157

update dspec
 set qty = 9
where id = 5099572459280331754

*/