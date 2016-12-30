CREATE TRIGGER [dbo].[NaklP_triud] ON [dbo].[NaklP]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE, DELETE
AS
BEGIN

 declare   @NaklNo int
          ,@Nom int
          ,@PostNo smallInt
          ,@DateNakl smalldatetime 
          ,@DatePrih smalldatetime
          ,@Summa decimal(18, 2)
          ,@SummaDolg decimal(18, 2)
          ,@Buh smallInt
          ,@UserNo smallInt
          ,@VidNaklNo tinyint
          ,@Change1C bit
          ,@Export1C bit
          ,@ID1C varchar(6)
          ,@OtdelNo smallint
          ,@Doc_type int
          ,@Parent_NaklNo int
          ,@Check_dolg bit
          ,@OurFirmNo int
          ,@Dept_id int
          ,@Num varchar(128)
          ,@Sub_num int
          ,@Pkey bigint
          ,@Edit_status_id smallint
          
          ,@Edit_date datetime
          ,@Edit_user varchar(50)
          ,@Edit_host_name varchar(50)
          
 declare @Cnt_inserted int, @Cnt_deleted int, @Action_type char(1)
 
 select @Cnt_inserted = count(*) from inserted
 select @Cnt_deleted = count(*) from deleted
 
 select @Edit_date = getdate(),  
        @Edit_user = suser_sname(),
        @Edit_host_name = HOST_NAME ()
  
 set @Action_type = 
  case 
    when (@Cnt_inserted <> 0) and (@Cnt_deleted <> 0) then 'U'
    when (@Cnt_inserted <> 0) and (@Cnt_deleted = 0) then 'I'
    else  'D'
  end;
 
   if @action_type in ('I','U')
  begin
    declare CS cursor scroll local for 
      select NaklNo, 
             Nom, 
             PostNo, 
             DateNakl, 
             DatePrih,
             Summa,
             SummaDolg,
             Buh,
             UserNo,
             VidNaklNo,
             Change1C,
             Export1C,
             ID1C,
             OtdelNo,
             Doc_type,
             Parent_NaklNo,
             Check_dolg,
             OurFirmNo,
             Dept_id,
             Num,
             Sub_num,
             Pkey,
             Edit_status_id
       from inserted ;
    open CS; 
    while 1=1 
    begin 
      fetch next from CS 
      into  @NaklNo 
           ,@Nom 
           ,@PostNo
           ,@DateNakl
           ,@DatePrih
           ,@Summa
           ,@SummaDolg
           ,@Buh 
           ,@UserNo 
           ,@VidNaklNo
           ,@Change1C 
           ,@Export1C 
           ,@ID1C 
           ,@OtdelNo 
           ,@Doc_type
           ,@Parent_NaklNo
           ,@Check_dolg
           ,@OurFirmNo
           ,@Dept_id 
           ,@Num 
           ,@Sub_num 
           ,@Pkey 
           ,@Edit_status_id;
 
      if @@FETCH_STATUS<>0 break ;
      insert into Audit_NaklP  (NaklNo, 
                                Nom, 
                                PostNo, 
                                DateNakl, 
                                DatePrih,
                                Summa,
                                SummaDolg,
                                Buh,
                                UserNo,
                                VidNaklNo,
                                Change1C,
                                Export1C,
                                ID1C,
                                OtdelNo,
                                Doc_type,
                                Parent_NaklNo,
                                Check_dolg,
                                OurFirmNo,
                                Dept_id,
                                Num,
                                Sub_num,
                                Pkey,
                                Edit_status_id,
                                Edit_date,
                                Edit_user,
                                Edit_host_name,
                                Action_type)  
        values ( @NaklNo
                ,@Nom
                ,@PostNo
                ,@DateNakl
                ,@DatePrih
                ,@Summa
                ,@SummaDolg
                ,@Buh
                ,@UserNo
                ,@VidNaklNo
                ,@Change1C
                ,@Export1C
                ,@ID1C
                ,@OtdelNo
                ,@Doc_type
                ,@Parent_NaklNo
                ,@Check_dolg
                ,@OurFirmNo
                ,@Dept_id
                ,@Num 
                ,@Sub_num
                ,@Pkey
                ,@Edit_status_id
                ,@Edit_date
                ,@Edit_user
                ,@Edit_host_name
                ,@Action_type)
    end 
    close CS 
    deallocate CS; 
  end
  else
  begin
    declare CS cursor scroll local for 
      select NaklNo, 
             Nom, 
             PostNo, 
             DateNakl, 
             DatePrih,
             Summa,
             SummaDolg,
             Buh,
             UserNo,
             VidNaklNo,
             Change1C,
             Export1C,
             ID1C,
             OtdelNo,
             Doc_type,
             Parent_NaklNo,
             Check_dolg,
             OurFirmNo,
             Dept_id,
             Num,
             Sub_num,
             Pkey,
             Edit_status_id
       from deleted;
    open CS; 
    while 1=1 
    begin 
      fetch next from CS 
      into  @NaklNo 
           ,@Nom 
           ,@PostNo
           ,@DateNakl
           ,@DatePrih
           ,@Summa
           ,@SummaDolg
           ,@Buh 
           ,@UserNo 
           ,@VidNaklNo
           ,@Change1C 
           ,@Export1C 
           ,@ID1C 
           ,@OtdelNo 
           ,@Doc_type
           ,@Parent_NaklNo
           ,@Check_dolg
           ,@OurFirmNo
           ,@Dept_id 
           ,@Num 
           ,@Sub_num 
           ,@Pkey 
           ,@Edit_status_id;
 
      if @@FETCH_STATUS<>0 break ;
      insert into Audit_NaklP  (NaklNo, 
                                Nom, 
                                PostNo, 
                                DateNakl, 
                                DatePrih,
                                Summa,
                                SummaDolg,
                                Buh,
                                UserNo,
                                VidNaklNo,
                                Change1C,
                                Export1C,
                                ID1C,
                                OtdelNo,
                                Doc_type,
                                Parent_NaklNo,
                                Check_dolg,
                                OurFirmNo,
                                Dept_id,
                                Num,
                                Sub_num,
                                Pkey,
                                Edit_status_id,
                                Edit_date,
                                Edit_user,
                                Edit_host_name,
                                Action_type)  
        values ( @NaklNo
                ,@Nom
                ,@PostNo
                ,@DateNakl
                ,@DatePrih
                ,@Summa
                ,@SummaDolg
                ,@Buh
                ,@UserNo
                ,@VidNaklNo
                ,@Change1C
                ,@Export1C
                ,@ID1C
                ,@OtdelNo
                ,@Doc_type
                ,@Parent_NaklNo
                ,@Check_dolg
                ,@OurFirmNo
                ,@Dept_id
                ,@Num 
                ,@Sub_num
                ,@Pkey
                ,@Edit_status_id
                ,@Edit_date
                ,@Edit_user
                ,@Edit_host_name
                ,@Action_type)
    end 
    close CS 
    deallocate CS; 

  end
         

END
GO