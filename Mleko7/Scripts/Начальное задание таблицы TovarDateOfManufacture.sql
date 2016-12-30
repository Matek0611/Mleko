-- select * from TovarDateOfManufacture

declare @DateBeg smalldatetime

truncate table TovarDateOfManufacture

set @DateBeg = '01.09.2015'
insert into TovarDateOfManufacture (TovarNo,Kol,DateBeg,DateEnd)
select  o.TovarNo 
      , o.Kol
	  , @DateBeg
	  , dateadd(day,isnull(t.SrokReal,0),@DateBeg)
 from Ostatok o left join
      Tovar t on t.TovarNo = o.TovarNo
  where t.VidNo in (select distinct VidNo
                     from Tovar t 
					  where TovarNo in (select TovarNo from [LOGISTICS\LOGIST].work.dbo.TovarDateOfManufacture))
    and o.Kol > 0 