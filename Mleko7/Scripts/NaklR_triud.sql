ALTER TRIGGER [dbo].[NaklR_triud] ON [dbo].[NaklR]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE, DELETE
AS
BEGIN
 declare  @NaklNo int
         ,@Nom int 
         ,@NomFirst varchar(10) 
         ,@NomReturn bigint
         ,@PostNo smallint
         ,@PostNoFirst smallint
         ,@PostNoReturn smallint
         ,@DateNakl smalldatetime
         ,@DateNaklFirst smalldatetime
         ,@Summa decimal(18, 2)
         ,@SummaDolg decimal(18, 2)
         ,@SotrudNo smallint
         ,@DateOpl smalldatetime
         ,@RealDateOpl smalldatetime
         ,@Buh smallint
         ,@VidNaklNo smallint
         ,@UserNo smallint
         ,@ColnPrice smallint
         ,@Ask bit
         ,@AddressNo smallint
         ,@ExpeditionNo int
         ,@Weight decimal(10, 3)
         ,@KolPerPak decimal(10, 3)
         ,@InCar bit
         ,@Change1C bit
         ,@Export1C bit
         ,@ID1C varchar(6)
         ,@OtdelNo smallint
         ,@Svedenie bit
         ,@is_check_first bit
         ,@id int
         ,@AddressNoFirst smallint 
         ,@contract_id int
         ,@edit_status_id smallint
         ,@description varchar(1024)
         ,@OurFirmNo int
         ,@dept_id int
         ,@num varchar(128)
         ,@sub_num int
         ,@doc_type_id int
         ,@pkey bigint
         ,@SET_ARTICLE_GROUP_ID bigint
         
         ,@Edit_date datetime
         ,@Edit_user varchar(50)
         ,@Edit_host_name varchar(50)
 
          
 declare @Cnt_inserted int, @Cnt_deleted int, @Action_type char(1), @IsSumma int
 
 select @Cnt_inserted = count(*) from inserted
 select @Cnt_deleted = count(*) from deleted
 
 select @Edit_date = getdate(),  
        @Edit_user = suser_sname(),
        @Edit_host_name = HOST_NAME()
 
 set @Action_type = 
  case 
    when (@Cnt_inserted <> 0) and (@Cnt_deleted <> 0) then 'U'
    when (@Cnt_inserted <> 0) and (@Cnt_deleted = 0) then 'I'
    else  'D'
  end 
  
 select @IsSumma = COUNT(*) from inserted where Summa is not Null
         
  
-- if @action_type in ('I','U')
 
 if @action_type = 'I' or (@action_type = 'U' and @IsSumma <> 0 )
  begin
    declare CS cursor scroll local for 
      select  NaklNo
             ,Nom
             ,NomFirst
             ,NomReturn 
             ,PostNo 
             ,PostNoFirst
             ,PostNoReturn 
             ,DateNakl
             ,DateNaklFirst
             ,Summa
             ,SummaDolg
             ,SotrudNo
             ,DateOpl
             ,RealDateOpl
             ,Buh
             ,VidNaklNo
             ,UserNo
             ,ColnPrice
             ,Ask
             ,AddressNo
             ,ExpeditionNo
             ,Weight
             ,KolPerPak
             ,InCar
             ,Change1C
             ,Export1C
             ,ID1C
             ,OtdelNo 
             ,Svedenie
             ,is_check_first 
             ,id 
             ,AddressNoFirst
             ,contract_id
             ,edit_status_id
             ,description
             ,OurFirmNo
             ,dept_id 
             ,num 
             ,sub_num
             ,doc_type_id 
             ,pkey
             ,SET_ARTICLE_GROUP_ID 
             
       from inserted ;
    open CS; 
    while 1=1 
    begin 
      fetch next from CS 
      into    @NaklNo
             ,@Nom
             ,@NomFirst
             ,@NomReturn
             ,@PostNo
             ,@PostNoFirst
             ,@PostNoReturn
             ,@DateNakl
             ,@DateNaklFirst
             ,@Summa
             ,@SummaDolg
             ,@SotrudNo 
             ,@DateOpl 
             ,@RealDateOpl
             ,@Buh 
             ,@VidNaklNo
             ,@UserNo 
             ,@ColnPrice
             ,@Ask 
             ,@AddressNo
             ,@ExpeditionNo 
             ,@Weight 
             ,@KolPerPak 
             ,@InCar 
             ,@Change1C
             ,@Export1C
             ,@ID1C 
             ,@OtdelNo
             ,@Svedenie 
             ,@is_check_first
             ,@id 
             ,@AddressNoFirst
             ,@contract_id 
             ,@edit_status_id 
             ,@description 
             ,@OurFirmNo 
             ,@dept_id 
             ,@num 
             ,@sub_num 
             ,@doc_type_id 
             ,@pkey 
             ,@SET_ARTICLE_GROUP_ID;
             
    if @@FETCH_STATUS<>0 break ;
      insert into Audit_NaklR  ( NaklNo
                                ,Nom
                                ,NomFirst
                                ,NomReturn 
                                ,PostNo 
                                ,PostNoFirst
                                ,PostNoReturn 
                                ,DateNakl
                                ,DateNaklFirst
                                ,Summa
                                ,SummaDolg
                                ,SotrudNo
                                ,DateOpl
                                ,RealDateOpl
                                ,Buh
                                ,VidNaklNo
                                ,UserNo
                                ,ColnPrice
                                ,Ask
                                ,AddressNo
                                ,ExpeditionNo
                                ,Weight
                                ,KolPerPak
                                ,InCar
                                ,Change1C
                                ,Export1C
                                ,ID1C
                                ,OtdelNo 
                                ,Svedenie
                                ,is_check_first 
                                ,id 
                                ,AddressNoFirst
                                ,contract_id
                                ,edit_status_id
                                ,description
                                ,OurFirmNo
                                ,dept_id 
                                ,num 
                                ,sub_num
                                ,doc_type_id 
                                ,pkey
                                ,SET_ARTICLE_GROUP_ID
                                ,Edit_date
                                ,Edit_user
                                ,Edit_host_name
                                ,Action_type)  
        values (  @NaklNo
                 ,@Nom
                 ,@NomFirst
                 ,@NomReturn 
                 ,@PostNo 
                 ,@PostNoFirst
                 ,@PostNoReturn 
                 ,@DateNakl
                 ,@DateNaklFirst
                 ,@Summa
                 ,@SummaDolg
                 ,@SotrudNo
                 ,@DateOpl
                 ,@RealDateOpl
                 ,@Buh
                 ,@VidNaklNo
                 ,@UserNo
                 ,@ColnPrice
                 ,@Ask
                 ,@AddressNo
                 ,@ExpeditionNo
                 ,@Weight
                 ,@KolPerPak
                 ,@InCar
                 ,@Change1C
                 ,@Export1C
                 ,@ID1C
                 ,@OtdelNo 
                 ,@Svedenie
                 ,@is_check_first 
                 ,@id 
                 ,@AddressNoFirst
                 ,@contract_id
                 ,@edit_status_id
                 ,@description
                 ,@OurFirmNo
                 ,@dept_id 
                 ,@num 
                 ,@sub_num
                 ,@doc_type_id 
                 ,@pkey
                 ,@SET_ARTICLE_GROUP_ID
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
      select  NaklNo
             ,Nom
             ,NomFirst
             ,NomReturn 
             ,PostNo 
             ,PostNoFirst
             ,PostNoReturn 
             ,DateNakl
             ,DateNaklFirst
             ,Summa
             ,SummaDolg
             ,SotrudNo
             ,DateOpl
             ,RealDateOpl
             ,Buh
             ,VidNaklNo
             ,UserNo
             ,ColnPrice
             ,Ask
             ,AddressNo
             ,ExpeditionNo
             ,Weight
             ,KolPerPak
             ,InCar
             ,Change1C
             ,Export1C
             ,ID1C
             ,OtdelNo 
             ,Svedenie
             ,is_check_first 
             ,id 
             ,AddressNoFirst
             ,contract_id
             ,edit_status_id
             ,description
             ,OurFirmNo
             ,dept_id 
             ,num 
             ,sub_num
             ,doc_type_id 
             ,pkey
             ,SET_ARTICLE_GROUP_ID 
             
       from deleted ;
    open CS; 
    while 1=1 
    begin 
      fetch next from CS 
      into    @NaklNo
             ,@Nom
             ,@NomFirst
             ,@NomReturn
             ,@PostNo
             ,@PostNoFirst
             ,@PostNoReturn
             ,@DateNakl
             ,@DateNaklFirst
             ,@Summa
             ,@SummaDolg
             ,@SotrudNo 
             ,@DateOpl 
             ,@RealDateOpl
             ,@Buh 
             ,@VidNaklNo
             ,@UserNo 
             ,@ColnPrice
             ,@Ask 
             ,@AddressNo
             ,@ExpeditionNo 
             ,@Weight 
             ,@KolPerPak 
             ,@InCar 
             ,@Change1C
             ,@Export1C
             ,@ID1C 
             ,@OtdelNo
             ,@Svedenie 
             ,@is_check_first
             ,@id 
             ,@AddressNoFirst
             ,@contract_id 
             ,@edit_status_id 
             ,@description 
             ,@OurFirmNo 
             ,@dept_id 
             ,@num 
             ,@sub_num 
             ,@doc_type_id 
             ,@pkey 
             ,@SET_ARTICLE_GROUP_ID;
              
      if @@FETCH_STATUS<>0 break ;
      insert into Audit_NaklR  ( NaklNo
                                ,Nom
                                ,NomFirst
                                ,NomReturn 
                                ,PostNo 
                                ,PostNoFirst
                                ,PostNoReturn 
                                ,DateNakl
                                ,DateNaklFirst
                                ,Summa
                                ,SummaDolg
                                ,SotrudNo
                                ,DateOpl
                                ,RealDateOpl
                                ,Buh
                                ,VidNaklNo
                                ,UserNo
                                ,ColnPrice
                                ,Ask
                                ,AddressNo
                                ,ExpeditionNo
                                ,Weight
                                ,KolPerPak
                                ,InCar
                                ,Change1C
                                ,Export1C
                                ,ID1C
                                ,OtdelNo 
                                ,Svedenie
                                ,is_check_first 
                                ,id 
                                ,AddressNoFirst
                                ,contract_id
                                ,edit_status_id
                                ,description
                                ,OurFirmNo
                                ,dept_id 
                                ,num 
                                ,sub_num
                                ,doc_type_id 
                                ,pkey
                                ,SET_ARTICLE_GROUP_ID
                                ,Edit_date
                                ,Edit_user
                                ,Edit_host_name
                                ,Action_type)  
        values (  @NaklNo
                 ,@Nom
                 ,@NomFirst
                 ,@NomReturn 
                 ,@PostNo 
                 ,@PostNoFirst
                 ,@PostNoReturn 
                 ,@DateNakl
                 ,@DateNaklFirst
                 ,@Summa
                 ,@SummaDolg
                 ,@SotrudNo
                 ,@DateOpl
                 ,@RealDateOpl
                 ,@Buh
                 ,@VidNaklNo
                 ,@UserNo
                 ,@ColnPrice
                 ,@Ask
                 ,@AddressNo
                 ,@ExpeditionNo
                 ,@Weight
                 ,@KolPerPak
                 ,@InCar
                 ,@Change1C
                 ,@Export1C
                 ,@ID1C
                 ,@OtdelNo 
                 ,@Svedenie
                 ,@is_check_first 
                 ,@id 
                 ,@AddressNoFirst
                 ,@contract_id
                 ,@edit_status_id
                 ,@description
                 ,@OurFirmNo
                 ,@dept_id 
                 ,@num 
                 ,@sub_num
                 ,@doc_type_id 
                 ,@pkey
                 ,@SET_ARTICLE_GROUP_ID
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