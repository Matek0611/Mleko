declare @VidNo int
      , @DateNakl smalldatetime
	  , @TovarNo int
	  , @SumKolGroupCuttingIter decimal (18,3)
	  , @SumKolGroupCuttingIterPrev decimal (18,3)
	  , @KolOst decimal (18,3)
	  , @Id bigint
	  , @VidTovForGroupCutting int
      , @GroupCuttingId int
	  , @PercentGroupCutting int
	  , @KolOstIter decimal (18,3)
	  , @SumKolOstIter decimal (18,3)
	  , @SumKolOstIterPrev decimal (18,3)
	  , @SumKolOstIterFirst decimal (18,3)
	  , @SumKolGroupCuttingItog decimal (18,3)
	  , @SumZakTovarNovGroup decimal (18,3)

	  , @cnt int
	  , @cnt1 int
	  , @KolCuttingIter decimal (18,3) 

	  , @SumZakTovarNov decimal (18,3)
	  , @SumZakTovarNovPrev decimal (18,3)
	  , @Coeficient decimal (18,2)

set @VidNo = 15
set @DateNakl = '26.06.2016'
set @SumKolGroupCuttingIterPrev = 0
set @SumKolOstIterPrev = 0
set @cnt = 0
set @cnt1 = 0

truncate table KolGroupCutting
truncate table KolCuttiungBlanks


insert into KolGroupCutting (TovarNo,VidTovForGroupCutting,GroupCuttingId,PercentGroupCutting,KolOst,SumKolTovar,SumKolGroupCutting,SumKolGroupCuttingIter,Cnt)
select  l.TovarNo
      , isnull(lpgc.GroupCuttingVidNo,-1) as VidTovForGroupCutting
	  , isnull(lpgc.GroupCuttingId,(select GroupCuttingId from L_ListVidTovForGroupCutting where VidNo = -1 and DefaultGroupCutting = 1)) as GroupCuttingId
	  , isnull(ll.PercentGroupCutting,(select PercentGroupCutting from L_ListVidTovForGroupCutting where VidNo = -1 and DefaultGroupCutting = 1)) as PercentGroupCutting
	  , (select Kol from Ostatok where TovarNo = l.TovarNo) as KolOst
      , (select sum(KolOrd) from e_blanks where DateNakl = l.DateNakl and TovarNo = l.TovarNo and vidNaklNo = 1) as SumKolTovar
	  , sum(l.KolOrd) as SumKolGroupCutting
	  , case when (select Kol from Ostatok where TovarNo = l.TovarNo) = 0 then 0
	         when isnull(ll.PercentGroupCutting,(select PercentGroupCutting from L_ListVidTovForGroupCutting where VidNo = -1 and DefaultGroupCutting = 1)) = 0 and (select Kol from Ostatok where TovarNo = l.TovarNo) < sum(l.KolOrd) then (select Kol from Ostatok where TovarNo = l.TovarNo)
	         when (select Kol from Ostatok where TovarNo = l.TovarNo) < (select sum(KolOrd) from e_blanks where DateNakl = l.DateNakl and TovarNo = l.TovarNo) then sum(l.KolOrd) - (sum(l.KolOrd)*isnull(ll.PercentGroupCutting,(select PercentGroupCutting from L_ListVidTovForGroupCutting where VidNo = -1 and DefaultGroupCutting = 1)))/100
	                                                                                                                                                           else sum(l.KolOrd)
		end  as SumKolGroupCuttingIter
	  , count(l.Document_id) as Cnt
 from  (select  eb.TovarNo
             , vt.VidNo
             , vt.VidName
	         , ebh.PostNo
             , (select Name from Post where PostNo = ebh.PostNo) PostName
	         , isnull((select VidNo from ListVidTovForGroupCutting where VidNo = vt.VidNo),-1) VidTovForGroupCutting
	         , eb.KolOrd
			 , eb.DateNakl
			 , eb.Document_id
         from e_blanks eb left join
              e_blank_head ebh on ebh.ID = eb.Document_id left join
	          Tovar t on t.TovarNo = eb.TovarNo left join
        	  VidTov vt on vt.VidNo = t.VidNo
          where vt.VidNo = isnull(@VidNo,vt.VidNo)
            and eb.DateNakl = @DateNakl
			and eb.KolOrd <> 0
			and eb.vidNaklNo = 1) l left join
	   ListVidTovForGroupCutting lv on lv.VidNo = l.VidTovForGroupCutting left join
       l_PostGroupCutting lpgc on lpgc.GroupCuttingVidNo = lv.VidNo and lpgc.PostNo = l.PostNo left join
	   L_ListVidTovForGroupCutting ll on ll.ListVidTovForGroupCuttingId = lv.Id and ll.GroupCuttingId = lpgc.GroupCuttingId and ll.VidNo = lpgc.GroupCuttingVidNo 
	   
group by l.TovarNo, lpgc.GroupCuttingVidNo, lpgc.GroupCuttingId, ll.PercentGroupCutting,l.DateNakl
having (select Kol from Ostatok where TovarNo = l.TovarNo) < (select sum(KolOrd) from e_blanks where DateNakl = l.DateNakl and TovarNo = l.TovarNo and vidNaklNo = 1)
order by TovarNo


update kgc
 set kgc.SumKolGroupCuttingIter = kgc.SumKolGroupCutting
 from KolGroupCutting kgc left join
      (select TovarNo, sum(SumKolGroupCuttingIter) as SumKolGroupCuttingIter from KolGroupCutting group by TovarNo) s on s.TovarNo = kgc.TovarNo
  where kgc.KolOst > s.SumKolGroupCuttingIter

--select * from KolGroupCutting

declare CS cursor scroll local for   

  select distinct eb.TovarNo
   from e_blanks eb left join
        Tovar t on t.TovarNo = eb.TovarNo
    where KolOrd <> 0
	  and vidNaklNo = 1
	  and DateNakl = @DateNakl
	  and t.VidNo = @VidNo

open CS;
  while 1= 1 
   begin
     fetch next from CS 
	  into @TovarNo
      
      if @@FETCH_STATUS <> 0 break
       begin
         select @SumKolGroupCuttingIter = round(sum(SumKolGroupCuttingIter),4) from KolGroupCutting where TovarNo = @TovarNo
		 select @KolOst = KolOst from KolGroupCutting where TovarNo = @TovarNo
		 
		 while @KolOst < @SumKolGroupCuttingIter 
		   begin
		     set @SumKolGroupCuttingIterPrev = @SumKolGroupCuttingIter

			 begin tran CuttingGroup  

		     update KolGroupCutting
			  set SumKolGroupCuttingIter = round(SumKolGroupCuttingIter - (SumKolGroupCuttingIter * PercentGroupCutting/100),4)
			 where TovarNo = @TovarNo  
             
			 select @SumKolGroupCuttingIter = round(sum(SumKolGroupCuttingIter),4) from KolGroupCutting where TovarNo = @TovarNo

			 if (@SumKolGroupCuttingIter > @KolOst) 
			  begin
			    if (@SumKolGroupCuttingIterPrev <> @SumKolGroupCuttingIter)
			     begin
			       commit tran CuttingGroup
				   continue
                 end
  			    else begin
			           rollback tran CuttingGroup
					   break  
                     end
              end
			 else begin
			        rollback tran CuttingGroup
					break
				  end   
                  
           end

         update KolGroupCutting
		  set CoefficientGroupCutting = round((1 - (SumKolGroupCuttingIter/SumKolGroupCutting)),4)
		 where TovarNo = @TovarNo
       end
     
   end
close CS;
deallocate CS;

--select * from KolGroupCutting

insert into KolCuttiungBlanks (id, TovarNo, VidTovForGroupCutting, VidName, PostNo, PostName, GroupCuttingId, GroupCutting, PercentGroupCutting, KolOst, KolOrd, SumAllTovar, 
                               SumKolGroupCutting, SumKolGroupCuttingItog, CoefficientGroupCutting, KolCutting, KolGroupCutting, KolZakazGroupCutting, KolOstFirst, KolOstIter, KolCuttingIter, is_weight)

select  l.ID
      , l.TovarNo
      , isnull(lpgc.GroupCuttingVidNo,-1) as VidTovForGroupCutting
	  , (select VidName from VidTov where VidNo = isnull(lpgc.GroupCuttingVidNo,-1)) VidName
	  , l.PostNo
	  , l.PostName
	  , isnull(lpgc.GroupCuttingId,(select GroupCuttingId from L_ListVidTovForGroupCutting where VidNo = -1 and DefaultGroupCutting = 1)) as GroupCuttingId
	  , (select NameGropCutting from GroupCutting where id = isnull(lpgc.GroupCuttingId,(select GroupCuttingId from L_ListVidTovForGroupCutting where VidNo = -1 and DefaultGroupCutting = 1))) as GroupCutting
	  , isnull(ll.PercentGroupCutting,(select PercentGroupCutting from L_ListVidTovForGroupCutting where VidNo = -1 and DefaultGroupCutting = 1)) as PercentGroupCutting
	  , (select Kol from Ostatok where TovarNo = l.TovarNo) as KolOst
	  , l.KolOrd
	  , kgc.SumKolTovar as SumAllTovar
	  , kgc.SumKolGroupCutting
	  , kgc.SumKolGroupCuttingIter as SumKolGroupCuttingItog
	  , kgc.CoefficientGroupCutting
	  , case when l.is_weight = 1 then l.KolOrd * kgc.CoefficientGroupCutting 
	                              else convert(decimal(18,3),(floor(l.KolOrd * kgc.CoefficientGroupCutting)))
	    end as KolCutting
      , floor(kgc.SumKolGroupCutting - kgc.SumKolGroupCuttingIter) as SumKolGroupCutting_SumKolGroupCuttingItog -- KolGroupCutting
	  , kgc.Cnt as KolZakazGroupCutting
	  , l.KolOrd - case when l.is_weight = 1 then l.KolOrd * kgc.CoefficientGroupCutting 
	                                         else convert(decimal(18,3),(floor(l.KolOrd * kgc.CoefficientGroupCutting)))
	               end as KolOstFirst
	  , l.KolOrd - case when l.is_weight = 1 then l.KolOrd * kgc.CoefficientGroupCutting 
	                                         else convert(decimal(18,3),(floor(l.KolOrd * kgc.CoefficientGroupCutting)))
	               end as KolOstIter
      , 1 - SumKolGroupCuttingIter/SumKolGroupCutting as KolCuttingIter
	  , l.is_weight
 from  (select  eb.TovarNo
             , vt.VidNo
             , vt.VidName
	         , ebh.PostNo
             , (select Name from Post where PostNo = ebh.PostNo) PostName
	         , isnull((select VidNo from ListVidTovForGroupCutting where VidNo = vt.VidNo),-1) VidTovForGroupCutting
	         , eb.KolOrd
			 , eb.DateNakl
			 , eb.ID
			 , isnull(t.is_weight,0) as is_weight
         from e_blanks eb left join
              e_blank_head ebh on ebh.ID = eb.Document_id left join
	          Tovar t on t.TovarNo = eb.TovarNo left join
        	  VidTov vt on vt.VidNo = t.VidNo
          where vt.VidNo = isnull(@VidNo,vt.VidNo)
            and eb.DateNakl = @DateNakl
			and eb.KolOrd <> 0
			and eb.vidNaklNo = 1) l left join
	   ListVidTovForGroupCutting lv on lv.VidNo = l.VidTovForGroupCutting left join
       l_PostGroupCutting lpgc on lpgc.GroupCuttingVidNo = lv.VidNo and lpgc.PostNo = l.PostNo left join
	   L_ListVidTovForGroupCutting ll on ll.ListVidTovForGroupCuttingId = lv.Id and ll.GroupCuttingId = lpgc.GroupCuttingId and ll.VidNo = lpgc.GroupCuttingVidNo left join
       KolGroupCutting kgc on (kgc.TovarNo = l.TovarNo) and (kgc.VidTovForGroupCutting = case when lpgc.GroupCuttingVidNo is null then -1 else lpgc.GroupCuttingVidNo end)
	                                                    and (kgc.GroupCuttingId = case when lpgc.GroupCuttingId is null then (select GroupCuttingId from L_ListVidTovForGroupCutting where VidNo = -1 and DefaultGroupCutting = 1)
														                                                                else lpgc.GroupCuttingId  end)
  where kgc.CoefficientGroupCutting is not null
--    and l.TovarNo in (4434)--4484, 4434)
order by l.id, l.TovarNo, l.PostName, l.VidTovForGroupCutting, GroupCuttingId

--select * from KolCuttiungBlanks

/*

declare CS1 cursor scroll local for   

select distinct VidTovForGroupCutting
              , GroupCuttingId
			  , PercentGroupCutting
			  , TovarNo
			  , KolOst
			  , id
			  , SumKolGroupCuttingItog
 from KolCuttiungBlanks

open CS1;
  while 1= 1 
   begin
     fetch next from CS1 
	  into @VidTovForGroupCutting
         , @GroupCuttingId
	     , @PercentGroupCutting
		 , @TovarNo
		 , @KolOst
		 , @id
		 , @SumKolGroupCuttingItog

      if @@FETCH_STATUS <> 0 break
       begin
	     set @cnt = 0
		 set @SumKolGroupCuttingItog = floor(@SumKolGroupCuttingItog)

	     select @SumKolOstIterFirst = sum(KolOstIter) 
		  from KolCuttiungBlanks
		   where TovarNo = @TovarNo 

         select @SumKolOstIter = sum(KolOstIter) 
		      from KolCuttiungBlanks
		       where TovarNo = @TovarNo 
			     and PercentGroupCutting = @PercentGroupCutting 
			     and GroupCuttingId = @GroupCuttingId
			     and VidTovForGroupCutting = @VidTovForGroupCutting




set @cnt1 = @cnt1 + 1
--select @SumKolGroupCuttingItog as SumKolGroupCuttingItog, @KolOst as KolOst, @SumKolOstIterFirst as SumKolOstIterFirst, @SumKolOstIter as SumKolOstIter, @SumKolOstIterPrev as SumKolOstIterPrev, @SumKolOstIter as SumKolOstIter, @TovarNo as TovarNo, @cnt1

         if @KolOst < @SumKolOstIterFirst 
		 while @SumKolGroupCuttingItog < @SumKolOstIter 
		   begin
		     set @cnt = @cnt+1
		     set @SumKolOstIterPrev = @SumKolOstIter

		     update KolCuttiungBlanks
			  set KolOstIter = case when KolOstIter > 1 then  case when is_weight = 1 then round((KolOstIter - KolCuttingIter),3)
			                                                                          else floor (KolOstIter - KolCuttingIter)
															  end
           			                                    else 1
					           end

			 where TovarNo = @TovarNo 
			   and PercentGroupCutting = @PercentGroupCutting 
			   and GroupCuttingId = @GroupCuttingId
			   and VidTovForGroupCutting = @VidTovForGroupCutting
			   and id = @Id

             select @SumKolOstIter = sum(KolOstIter) 
		      from KolCuttiungBlanks
		       where TovarNo = @TovarNo 
			     and PercentGroupCutting = @PercentGroupCutting 
			     and GroupCuttingId = @GroupCuttingId
			     and VidTovForGroupCutting = @VidTovForGroupCutting
--				 and id = @Id
				 
             
			 --select 2, @SumKolOstIter as SumKolOstIter, @KolOst as KolOst, @SumKolOstIterPrev as SumKolOstIterPrev, @SumKolOstIter as SumKolOstIter, @TovarNo as TovarNo

             update KolCuttiungBlanks
	   	      set KolCuttingIter = case when (@SumKolOstIter <> 0) then (1-(round(SumKolGroupCuttingItog/@SumKolOstIter,2)))*KolOstIter --floor(1-round(SumKolGroupCuttingItog/@SumKolOstIter,2))*KolOstIter
		                                                           else 0
					   		       end --KolOstIter * CoefficientGroupCutting
		     where PercentGroupCutting = @PercentGroupCutting 
		       and GroupCuttingId = @GroupCuttingId
		       and VidTovForGroupCutting = @VidTovForGroupCutting
		       and TovarNo = @TovarNo
			   and id = @Id


--             select 
             
--			 select 2, @SumKolOstIter as SumKolOstIter, @KolOst as KolOst, @SumKolOstIterPrev as SumKolOstIterPrev, @SumKolOstIter as SumKolOstIter, @TovarNo as TovarNo

			 if @cnt = 1 
			  update KolCuttiungBlanks
	   	       set KolCuttingIter1 = KolCuttingIter
                 , Coeff1 = 1-round(SumKolGroupCuttingItog/@SumKolOstIter,2)
				 , KolOstIter1 = KolOstIter
				 , SumKolOstIter1 = @SumKolOstIter
				 , SumKolOstIterPrev1 = @SumKolOstIterPrev

		      where PercentGroupCutting = @PercentGroupCutting 
		        and GroupCuttingId = @GroupCuttingId
		        and VidTovForGroupCutting = @VidTovForGroupCutting
		        and TovarNo = @TovarNo
				and id = @Id
			 
			 if @cnt = 2
			  update KolCuttiungBlanks
	   	       set KolCuttingIter2 = KolCuttingIter
                 , Coeff2 = 1-round(SumKolGroupCuttingItog/@SumKolOstIter,2)
				 , KolOstIter2 = KolOstIter
				 , SumKolOstIter2 = @SumKolOstIter
				 , SumKolOstIterPrev2 = @SumKolOstIterPrev

		      where PercentGroupCutting = @PercentGroupCutting 
		        and GroupCuttingId = @GroupCuttingId
		        and VidTovForGroupCutting = @VidTovForGroupCutting
		        and TovarNo = @TovarNo
				and id = @Id

             if @cnt = 3 
			  update KolCuttiungBlanks
	   	       set KolCuttingIter3 = KolCuttingIter
                 , Coeff3 = 1-round(SumKolGroupCuttingItog/@SumKolOstIter,2)
				 , KolOstIter3 = KolOstIter
				 , SumKolOstIter3 = @SumKolOstIter
				 , SumKolOstIterPrev3 = @SumKolOstIterPrev

		      where PercentGroupCutting = @PercentGroupCutting 
		        and GroupCuttingId = @GroupCuttingId
		        and VidTovForGroupCutting = @VidTovForGroupCutting
		        and TovarNo = @TovarNo
				and id = @Id

			 if (@SumKolGroupCuttingItog < @SumKolOstIter) 
			  if (@SumKolOstIterPrev <> @SumKolOstIter)
			  continue
			  else break  
           end

/*
         update KolCuttiungBlanks
		  set KolCuttingIter = case when (@SumKolOstIter <> 0) then 1-round(SumKolGroupCuttingItog/@SumKolOstIter,2)*KolOstIter --floor(1-round(SumKolGroupCuttingItog/@SumKolOstIter,2))*KolOstIter
		                                                       else 0
							   end --KolOstIter * CoefficientGroupCutting
		 where PercentGroupCutting = @PercentGroupCutting 
		   and GroupCuttingId = @GroupCuttingId
		   and VidTovForGroupCutting = @VidTovForGroupCutting
		   and TovarNo = @TovarNo
		   and id = @Id
*/
       end
     
   end
close CS1;
deallocate CS1;
/*
select * from KolCuttiungBlanks 
-- where TovarNo = 4481
order by TovarNo, GroupCuttingId
*/
/*
--where SumKolGroupCuttingItog = 0
select sum(KolOstIter) from KolCuttiungBlanks where GroupCuttingId = 1 --76
select sum(KolOstIter) from KolCuttiungBlanks where GroupCuttingId = 2 --29
select sum(KolOstIter) from KolCuttiungBlanks where GroupCuttingId = 3 --15
select sum(KolOstIter) from KolCuttiungBlanks where GroupCuttingId = 4 -------------
select sum(KolOstIter) from KolCuttiungBlanks where GroupCuttingId = 5 --260
*/
/*
select  TovarNo
      , sum(KolOstIter) as SumKolOstIter
	  , SumKolGroupCuttingItog
	  , PercentGroupCutting 
 from KolCuttiungBlanks 
--  where TovarNo = 4484
group by  SumKolGroupCuttingItog
        , TovarNo
		, PercentGroupCutting
order by TovarNo
*/

declare CS2 cursor scroll local for   

select distinct VidTovForGroupCutting
              , GroupCuttingId
			  , PercentGroupCutting
			  , TovarNo
 from KolCuttiungBlanks
  where KolOstIter = 1

open CS2;
  while 1= 1 
   begin
     fetch next from CS2
	  into @VidTovForGroupCutting
         , @GroupCuttingId
	     , @PercentGroupCutting
		 , @TovarNo

      if @@FETCH_STATUS <> 0 break 
       begin
	     set @cnt = 0

	     declare CS3 cursor for   

         select id
          from KolCuttiungBlanks
		   where VidTovForGroupCutting = @VidTovForGroupCutting
		     and GroupCuttingId = @GroupCuttingId
			 and PercentGroupCutting = @PercentGroupCutting
			 and TovarNo = @TovarNo
			 and KolOstIter = 1
         order by id

         open CS3;
         while 1= 1 
         begin
           fetch next from CS3
	       into @id

           if @@FETCH_STATUS <> 0 break 
            begin
			  set @cnt = @cnt+1
--			  select @id, @cnt
	          update KolCuttiungBlanks
			   set NoPP_1 = @cnt
              where id = @id
            end
     
         end
         close CS3;
		 deallocate CS3;
       end
     
   end
close CS2;
deallocate CS2;

update KolCuttiungBlanks
 set KolOstIter = 0
where NoPP_1 is not null
  and NoPP_1 > floor(SumKolGroupCuttingItog)
*/

declare CS cursor scroll local for   

select distinct VidTovForGroupCutting
              , GroupCuttingId
			  , PercentGroupCutting
			  , SumKolGroupCuttingItog
			  , TovarNo
			  , KolOst
 from KolCuttiungBlanks
order by  VidTovForGroupCutting
        , GroupCuttingId
		, PercentGroupCutting
		, TovarNo

open CS;
  while 1= 1 
   begin
     fetch next from CS 
	  into  @VidTovForGroupCutting
	      , @GroupCuttingId
		  , @PercentGroupCutting
		  , @SumKolGroupCuttingItog
		  , @TovarNo
		  , @KolOst
      
      if @@FETCH_STATUS <> 0 break
       begin

	     set @Cnt = 0
		 
		 select @SumZakTovarNov = sum(KolOstIter) 
		  from KolCuttiungBlanks
		   where TovarNo = @TovarNo

         set @SumKolGroupCuttingItog = floor(@SumKolGroupCuttingItog)

/*
         select @VidTovForGroupCutting as VidTovForGroupCutting
		      , @GroupCuttingId as GroupCuttingId
              , @PercentGroupCutting as PercentGroupCutting
			  , @TovarNo as TovarNo
			  , @SumKolGroupCuttingItog as SumKolGroupCuttingItog
			  , @SumZakTovarNov as SumZakTovarNov
  */       
		 

		 select @SumZakTovarNovGroup = sum(KolOstIter) 
	    	  from KolCuttiungBlanks
		       where VidTovForGroupCutting = @VidTovForGroupCutting
		         and GroupCuttingId = @GroupCuttingId
		         and PercentGroupCutting = @PercentGroupCutting
--			     and SumKolGroupCuttingItog= @SumKolGroupCuttingItog
			     and TovarNo = @TovarNo

         if @SumZakTovarNovGroup > 0 set @Coeficient = 1-@SumKolGroupCuttingItog/@SumZakTovarNovGroup else set @Coeficient = 1
         
--		 select @KolOst, @SumZakTovarNov, @SumZakTovarNovGroup , @VidTovForGroupCutting,  @GroupCuttingId, @PercentGroupCutting, @SumKolGroupCuttingItog, @TovarNo  

		 if @KolOst < @SumZakTovarNov
		  while @SumZakTovarNovGroup > @SumKolGroupCuttingItog
		   begin
		     set @Cnt = @Cnt + 1

			 begin tran CuttingTovarGroup

--			 select @SumZakTovarNovGroup , @SumKolGroupCuttingItog

			 select @SumZakTovarNovGroup = sum(KolOstIter) 
	    	  from KolCuttiungBlanks
		       where VidTovForGroupCutting = @VidTovForGroupCutting
		         and GroupCuttingId = @GroupCuttingId
		         and PercentGroupCutting = @PercentGroupCutting
--			     and SumKolGroupCuttingItog= @SumKolGroupCuttingItog
			     and TovarNo = @TovarNo
		     			                               
		     declare CS1 cursor scroll local for   
		 
		     select id
		      from KolCuttiungBlanks
		       where VidTovForGroupCutting = @VidTovForGroupCutting
		         and GroupCuttingId = @GroupCuttingId
			     and PercentGroupCutting = @PercentGroupCutting
--			     and SumKolGroupCuttingItog= @SumKolGroupCuttingItog
			     and TovarNo = @TovarNo

		     open CS1;
             while 1= 1 
              begin
                fetch next from CS1
	            into @Id
      
             if @@FETCH_STATUS <> 0 break
              begin
			    
--				insert into TmpRun (ExecStr,kol) values (convert(varchar,@id),@cnt)

                select @KolCuttingIter = floor(KolOstIter * @Coeficient)
				 from KolCuttiungBlanks
				  where id = @Id

                update KolCuttiungBlanks
			     set KolOstIter = case when is_weight = 1 then round((KolOstIter - (KolOstIter * @Coeficient)),3)
				                                          else case when (KolOstIter - floor(KolOstIter * @Coeficient)) < 1 then 1
														                                                                    else KolOstIter - (floor(KolOstIter * @Coeficient) )
														       end
                                  end
                   , KolCuttingIter = @KolCuttingIter
				   , SumZakTovarNovGroupIter = @SumZakTovarNovGroup
                where id = @Id 

			    if @Cnt = 1
			     update KolCuttiungBlanks
			      set  KolCuttingIter1 = @KolCuttingIter
			         , Coeff1 = @Coeficient
				     , KolOstIter1 = KolOstIter
				     , SumKolOstIter1 = @SumZakTovarNovGroup
				     , SumKolOstIterPrev1 = @SumZakTovarNovPrev
                 where id = @Id
 
                if @Cnt = 2
			     update KolCuttiungBlanks
			      set  KolCuttingIter2 = @KolCuttingIter
			         , Coeff2 = @Coeficient
               	     , KolOstIter2 = KolOstIter
				     , SumKolOstIter2 = @SumZakTovarNovGroup
				     , SumKolOstIterPrev2 = @SumZakTovarNovPrev
                 where id = @Id

                if @Cnt = 3
			     update KolCuttiungBlanks
			      set  KolCuttingIter3 = @KolCuttingIter
			         , Coeff3 = @Coeficient
				     , KolOstIter3 = KolOstIter
				     , SumKolOstIter3 = @SumZakTovarNovGroup
				     , SumKolOstIterPrev3 = @SumZakTovarNovPrev
                 where id = @Id
             
				
              end
     
           end
             close CS1;
             deallocate CS1;

			 set @SumZakTovarNovPrev = @SumZakTovarNovGroup

             select @SumZakTovarNovGroup = sum(KolOstIter) 
	    	  from KolCuttiungBlanks
		       where VidTovForGroupCutting = @VidTovForGroupCutting
		         and GroupCuttingId = @GroupCuttingId
		         and PercentGroupCutting = @PercentGroupCutting
			     and TovarNo = @TovarNo
         
--		     set @Coeficient = 1-@SumKolGroupCuttingItog/@SumZakTovarNovGroup

             if @SumZakTovarNovGroup > 0 set @Coeficient = 1-@SumKolGroupCuttingItog/@SumZakTovarNovGroup else set @Coeficient = 1

		     if (@SumKolGroupCuttingItog < @SumZakTovarNovGroup) 
		      if (@SumZakTovarNovPrev <> @SumZakTovarNovGroup)
			     begin
			       commit tran CuttingTovarGroup
				   continue
                 end
  			  else begin
			           rollback tran CuttingTovarGroup
				     break  
                   end
			 else begin
			        rollback tran CuttingTovarGroup
					break
				  end 
	     end
		  
       end
     
   end
close CS;
deallocate CS;

declare CS2 cursor scroll local for   

select distinct VidTovForGroupCutting
              , GroupCuttingId
			  , PercentGroupCutting
			  , TovarNo
 from KolCuttiungBlanks
  where KolOstIter = 1

open CS2;
  while 1= 1 
   begin
     fetch next from CS2
	  into @VidTovForGroupCutting
         , @GroupCuttingId
	     , @PercentGroupCutting
		 , @TovarNo

      if @@FETCH_STATUS <> 0 break 
       begin
	     set @cnt = 0

	     declare CS3 cursor for   

         select id
          from KolCuttiungBlanks
		   where VidTovForGroupCutting = @VidTovForGroupCutting
		     and GroupCuttingId = @GroupCuttingId
			 and PercentGroupCutting = @PercentGroupCutting
			 and TovarNo = @TovarNo
			 and KolOstIter = 1
         order by id

         open CS3;
         while 1= 1 
         begin
           fetch next from CS3
	       into @id

           if @@FETCH_STATUS <> 0 break 
            begin
			  set @cnt = @cnt+1
--			  select @id, @cnt
	          update KolCuttiungBlanks
			   set NoPP_1 = @cnt
              where id = @id
            end
     
         end
         close CS3;
		 deallocate CS3;
       end
     
   end
close CS2;
deallocate CS2;

update KolCuttiungBlanks
 set KolOstIter = 0
where NoPP_1 is not null
  and NoPP_1 > floor(SumKolGroupCuttingItog)

update KolCuttiungBlanks
 set KolOstIter = 0
where NoPP_1 is not null
  and NoPP_1 < floor(SumKolGroupCuttingItog)
  and SumZakTovarNovGroupIter > SumKolGroupCuttingItog


select * from KolCuttiungBlanks 
-- where TovarNo = 4480
 --where KolOstIter1 is not null --TovarNo = 4484
order by TovarNo, VidTovForGroupCutting, GroupCuttingId, NoPP_1 
