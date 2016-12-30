select * from D_ARTICLE_GROUP
select * from [sirius\mlk_market].[work].[dbo].[D_ARTICLE_GROUP]

select * 
 from Post p left join
      AddressPost ap1 on ap1.PostNo = p.PostNo left join
      [sirius\mlk_market].[work].[dbo].[addresspost] ap on ap.PostNo = ap1.PostNo and ap.addressno = ap1.AddressNo
  where p.Name like '%טל%'
    and ap1.AddressNo is null

select *
 from [sirius\mlk_market].[work].[dbo].[addresspost] ap

select *
 from Post 
  where Name like '%ÈÌ %'
    and PostNo >= 7104

select *
 from [sirius\mlk_market].[work].[dbo].[Post]
  where Name like '%ÈÌ %'
    and PostNo >= 7104

select *
 from AddressPost
  where PostNo in (select PostNo
                    from Post 
                     where Name like '%ÈÌ %'
                       and PostNo >= 7104)


insert into AddressPost (PostNo,AddressNo,Address,MarschrutNo,RegionNo,SotrudNo,pkey,Active,SpecialDelivery,QuantityDelivery,Refrezherator)
select PostNo,AddressNo,Address,MarschrutNo,RegionNo,SotrudNo,pkey,Active,SpecialDelivery,QuantityDelivery,Refrezherator
 from [sirius\mlk_market].[work].[dbo].[AddressPost] ap1
  where PostNo in (select PostNo
                    from [sirius\mlk_market].[work].[dbo].[Post] 
                     where Name like '%ÈÌ'
                       and PostNo >= 7104)
   and not exists (select *
                    from AddressPost
                     where PostNo in (select PostNo
                      from Post 
                       where Name like '%ÈÌ'
                         and PostNo >= 7104)
						 and AddressNo = ap1.AddressNo
						 and PostNo = ap1.PostNo)

select *
 from d_sotrud_address

select * from Sotrud where SotrudName like '%טל%' -- 321


insert into d_sotrud_address (AddressPost_id, SotrudNo, Active, DateBegOnActive)
select id, 321, 1, '01.01.2015'
 from AddressPost ap
  where PostNo in (select PostNo
                    from [sirius\mlk_market].[work].[dbo].[Post] 
                     where Name like '%ÈÌ'
                       and PostNo >= 7104)
    and not exists (select *
                     from d_sotrud_address
					  where ap.ID = AddressPost_id)

select * from L_CategoryAddressPost

select * from D_CategoryTT -- 12

insert into L_CategoryAddressPost (PostNo,AddressNo,CategoryId)
select PostNo, AddressNo, 12
 from AddressPost ap
  where PostNo in (select PostNo
                    from [sirius\mlk_market].[work].[dbo].[Post] 
                     where Name like '%ÈÌ'
                       and PostNo >= 7104)
    and not exists (select * 
	                 from L_CategoryAddressPost
					  where ap.PostNo = PostNo
					    and ap.AddressNo = AddressNo)

select * from L_AddressPostProp

insert into L_AddressPostProp (PostNo, AddressNo, TimeBeg, TimeEnd, Unloading)
select PostNo, AddressNo, '08:00:00.0000000', '20:00:00.0000000', 15
 from AddressPost ap
  where PostNo in (select PostNo
                    from [sirius\mlk_market].[work].[dbo].[Post] 
                     where Name like '%ÈÌ'
                       and PostNo >= 7104)
    and not exists (select * 
	                 from L_AddressPostProp
					  where ap.PostNo = PostNo
					    and ap.AddressNo = AddressNo)

select * from Post_Mail

insert into Post_Mail (PostNo, Topic, Message, Mail1, Mail2, Mail3, AddressNo, City, Street, HouseNo)
select PostNo, Topic, Message, Mail1, Mail2, Mail3, AddressNo, City, Street, HouseNo
 from [sirius\mlk_market].[work].[dbo].[Post_Mail] pm
  where PostNo in (select PostNo
                    from [sirius\mlk_market].[work].[dbo].[Post] 
                     where Name like '%ÈÌ'
                       and PostNo >= 7104)
    and not exists (select * 
	                 from Post_Mail
					  where pm.PostNo = PostNo
					    and pm.AddressNo = AddressNo)


select * from CoordinatesAddressPost
where PostNo in (select PostNo
                    from Post
                     where Name like '%ÈÌ %'
                       and PostNo >= 7104)

delete CoordinatesAddressPost
where PostNo in (select PostNo
                    from Post
                     where Name like '%ÈÌ %'
                       and PostNo >= 7104)

OPENQUERY  (sirius\mlk_market ,'select PostNo,AddressNo, x,Y
 from CoordinatesAddressPost cap
  where PostNo in (select PostNo
                    from Post
                     where Name like ''%ÈÌ %''
                       and PostNo >= 7104)
    and not exists (select * 
	                 from CoordinatesAddressPost
					  where cap.AddressNo = AddressNo
					    and cap.PostNo = PostNo)' )

select * from d_firm_contract

insert into d_firm_contract(PostNo, Type_id, Description, Create_Date, num, Expire_Date, OurFirmNo, print_on_naklP, print_on_naklR, pkey)
select PostNo, Type_id, Description, Create_Date, num, Expire_Date, OurFirmNo, print_on_naklP, print_on_naklR, pkey 
 from [sirius\mlk_market].[work].[dbo].[d_firm_contract] dfc
  where PostNo in (select PostNo
                    from [sirius\mlk_market].[work].[dbo].[Post] 
                     where Name like '%ÈÌ'
                       and PostNo >= 7104)
    and not exists (select * 
	                 from d_firm_contract
					  where dfc.PostNo = PostNo)

select * from L_POST_SET_ARTGROUP_DELAY

insert into L_POST_SET_ARTGROUP_DELAY
select *
 from [sirius\mlk_market].[work].[dbo].[L_POST_SET_ARTGROUP_DELAY] l
  where PostNo in (select PostNo
                    from [sirius\mlk_market].[work].[dbo].[Post] 
                     where Name like '%ÈÌ'
                       and PostNo >= 7104)
    and not exists (select * 
	                 from L_POST_SET_ARTGROUP_DELAY
					  where l.PostNo = PostNo)

select * from L_POST_SET_ARTGROUP_PRICE

insert into L_POST_SET_ARTGROUP_PRICE
select *
 from [sirius\mlk_market].[work].[dbo].[L_POST_SET_ARTGROUP_PRICE] l
  where PostNo in (select PostNo
                    from [sirius\mlk_market].[work].[dbo].[Post] 
                     where Name like '%ÈÌ'
                       and PostNo >= 7104)
    and not exists (select * 
	                 from L_POST_SET_ARTGROUP_PRICE
					  where l.PostNo = PostNo)

select * from DescriptionDjobSupplier (PostNo,DescriptionDjob)

insert into DescriptionDjobSupplier
select PostNo,DescriptionDjob 
 from [sirius\mlk_market].[work].[dbo].[DescriptionDjobSupplier] d
  where PostNo in (select PostNo
                    from [sirius\mlk_market].[work].[dbo].[Post] 
                     where Name like '%ÈÌ'
                       and PostNo >= 7104)
    and not exists (select * 
	                 from DescriptionDjobSupplier
					  where d.PostNo = PostNo)






    


