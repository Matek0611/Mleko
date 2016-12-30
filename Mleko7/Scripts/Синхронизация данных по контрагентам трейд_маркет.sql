declare
        @PostNo int
      , @AddressNo int
	  , @Address varchar(256)
	  , @MarschrutNo int
	  , @RegionNo int
	  , @SotrudNo int
	  , @pkey bigint
	  , @Active bit
	  , @SpecialDelivery bit
	  , @QuantityDelivery numeric(18,3)
	  , @Refrezherator bit

	  , @Id bigint
	  , @ColNPrice int
	  , @Set_Article_Group_id bigint

	  , @DAY_DELAY int
	  , @DAY_DELAY_EXT int
	  , @Buh int

	  , @Cnt int
	  , @cnt1 int

	  , @NamePost varchar (10)
	  , @DescriptionDjob varchar(1024)
  
set @NamePost = '%ÈÌ'
set @cnt1 = 0
/*
declare CS cursor scroll local for
select  PostNo
      , AddressNo
	  , Address
	  , MarschrutNo
	  , RegionNo
	  , SotrudNo
	  , pkey
	  , Active
	  , SpecialDelivery
	  , QuantityDelivery
	  , Refrezherator
 from [sirius\mlk_market].[work].[dbo].[AddressPost] ap1
  where PostNo in (select PostNo
                    from [sirius\mlk_market].[work].[dbo].[Post] 
                     where Name like @NamePost
                       and PostNo >= 7104)

open CS;
while 1= 1 
begin
fetch next from CS 
      into @PostNo 
         , @AddressNo
	     , @Address
	     , @MarschrutNo
	     , @RegionNo
	     , @SotrudNo
	     , @pkey
	     , @Active
	     , @SpecialDelivery
	     , @QuantityDelivery
	     , @Refrezherator
    if @@FETCH_STATUS <> 0 break
      begin

        select @Cnt = count(*) 
		 from AddressPost 
		  where PostNo = @PostNo
		    and AddressNo = @AddressNo

        if @cnt = 0
		 insert into AddressPost (PostNo,AddressNo,Address,MarschrutNo,RegionNo,SotrudNo,pkey,Active,SpecialDelivery,QuantityDelivery,Refrezherator)
		  values (@PostNo,@AddressNo,@Address,@MarschrutNo,@RegionNo,@SotrudNo,@pkey,@Active,@SpecialDelivery,@QuantityDelivery,@Refrezherator)

        if @cnt =1
		 update AddressPost
		  set  Address = @Address
		     , MarschrutNo = @MarschrutNo
			 , RegionNo = @RegionNo
			 , SotrudNo = @SotrudNo
			 , pkey =@pkey
			 , Active = @Active
			 , SpecialDelivery = @SpecialDelivery
			 , QuantityDelivery = @QuantityDelivery
			 , Refrezherator = @Refrezherator
        where PostNo = @PostNo
		    and AddressNo = @AddressNo 

		set @cnt1 = @cnt1 + 1
      end

     
end
close CS;
deallocate CS; 

print @cnt1
*/
/*
set @cnt1 =0
declare CS1 cursor scroll local for
select  Id, ColNPrice, PostNo, Set_Article_Group_id
 from [sirius\mlk_market].[work].[dbo].[L_POST_SET_ARTGROUP_PRICE] l
  where PostNo in (select PostNo
                    from [sirius\mlk_market].[work].[dbo].[Post] 
                     where Name like @NamePost
                       and PostNo >= 7104)

open CS1;
while 1= 1 
begin
fetch next from CS1
      into @Id
	     , @ColNPrice 
	     , @PostNo
		 , @Set_Article_Group_id

    if @@FETCH_STATUS <> 0 break
      begin

        select @Cnt = count(*) 
		 from L_POST_SET_ARTGROUP_PRICE 
		  where PostNo = @PostNo
		    and Set_Article_Group_id = @Set_Article_Group_id

        if @cnt = 0
		 insert into L_POST_SET_ARTGROUP_PRICE
		  values (@Id, @ColNPrice,@PostNo,@Set_Article_Group_id)

        if @cnt = 1
		 update L_POST_SET_ARTGROUP_PRICE
		  set  ColNPrice = @ColNPrice
         where PostNo = @PostNo
		   and Set_Article_Group_id = @Set_Article_Group_id 
      end
      set @cnt1 = @cnt1 + 1
     
end
close CS1;
deallocate CS1;

print @cnt1
*/
/*
set @cnt1 =0
declare CS2 cursor scroll local for
select *
 from [sirius\mlk_market].[work].[dbo].[L_POST_SET_ARTGROUP_DELAY] l
  where PostNo in (select PostNo
                    from [sirius\mlk_market].[work].[dbo].[Post] 
                     where Name like '%ÈÌ'
                       and PostNo >= 7104)

open CS2;
while 1= 1 
begin
fetch next from CS2
      into @Id
	     , @PostNo
		 , @DAY_DELAY
		 , @DAY_DELAY_EXT
		 , @Buh
		 , @Set_Article_Group_id

    if @@FETCH_STATUS <> 0 break
      begin

        select @Cnt = count(*) 
		 from L_POST_SET_ARTGROUP_DELAY 
		  where PostNo = @PostNo
		    and Buh = @Buh
		    and Set_Article_Group_id = @Set_Article_Group_id


		

        if @cnt = 0 begin
		              select @PostNo, @Buh, @Set_Article_Group_id
		              insert into L_POST_SET_ARTGROUP_PRICE (COLNPRICE, POSTNO, SET_ARTICLE_GROUP_ID)
		              values (@ColNPrice,@PostNo,@Set_Article_Group_id)
		            end
        if @cnt = 1
		 update L_POST_SET_ARTGROUP_DELAY
		  set  DAY_DELAY = @DAY_DELAY
		     , DAY_DELAY_EXT = @DAY_DELAY_EXT
         where PostNo = @PostNo
		   and Buh = @Buh
		   and Set_Article_Group_id = @Set_Article_Group_id 

      end
      set @cnt1 = @cnt1 + 1
     
end
close CS2;
deallocate CS2;

print @cnt1
*/

set @cnt1 =0
declare CS3 cursor scroll local for
select PostNo,DescriptionDjob 
 from [sirius\mlk_market].[work].[dbo].[DescriptionDjobSupplier] d
  where PostNo in (select PostNo
                    from [sirius\mlk_market].[work].[dbo].[Post] 
                     where Name like '%ÈÌ'
                       and PostNo >= 7104)

open CS3;
while 1= 1 
begin
fetch next from CS3
      into @PostNo
		 , @DescriptionDjob


    if @@FETCH_STATUS <> 0 break
      begin

        select @Cnt = count(*) 
		 from DescriptionDjobSupplier 
		  where PostNo = @PostNo

        if @cnt = 0 begin
		              insert into DescriptionDjobSupplier (PostNo,DescriptionDjob)
		              values (@PostNo,@DescriptionDjob)
		            end
        if @cnt = 1
		 update DescriptionDjobSupplier
		  set  DescriptionDjob = @DescriptionDjob
		 where PostNo = @PostNo
		 
      end
      set @cnt1 = @cnt1 + 1
     
end
close CS3;
deallocate CS3;

print @cnt1

