CREATE TRIGGER [dbo].[DSPEC_triud] ON [dbo].[DSPEC]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE, DELETE
AS
BEGIN
Declare  @ID bigint
	    ,@ORDER_NUM smallint
	    ,@ARTICLE_ID smallint
	    ,@QTY decimal(18, 3)
	    ,@PRICE_ECO decimal(18, 6)
	    ,@DOC_DATE smalldatetime
	    ,@DOC_TYPE_ID int
	    ,@DHEAD_ID bigint
	    ,@ENTITY_TYPE varchar(32)
	    ,@IS_FRACTION char(1)
	    ,@OUR_FIRM_ID int
	    ,@PRICE_ECO_IN decimal(18, 6)
	    ,@DEPT_ID bigint
	    ,@CONTRACTOR_ID bigint
	    ,@QTY_PAY decimal(18, 3)
	    ,@QTY_FIRST decimal(18, 3)
	    ,@CreateUser smallint
	    ,@LastEditUser smallint
	    ,@blank_id int
	    ,@NaklNo int
	    ,@CONTRACTOR_ACC_ID bigint
	    ,@MANAGER_DEPT_ID bigint
	    ,@STATE_ID bigint
	    ,@OUT_TRADE_ID bigint
	    ,@TRIP_ID bigint
	    ,@QTY_FIT decimal(18, 3)
	    ,@MANAGER_ID bigint
	    ,@row_version int
	    ,@PRICE_TYPE_ID bigint
        
	    ,@Edit_date datetime
	    ,@Edit_user  varchar(50)
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
      select ID
	        ,ORDER_NUM
	        ,ARTICLE_ID
	        ,QTY
	        ,PRICE_ECO
	        ,DOC_DATE
	        ,DOC_TYPE_ID
	        ,DHEAD_ID
	        ,ENTITY_TYPE
	        ,IS_FRACTION
	        ,OUR_FIRM_ID
	        ,PRICE_ECO_IN
	        ,DEPT_ID
	        ,CONTRACTOR_ID
	        ,QTY_PAY
	        ,QTY_FIRST 
	        ,CreateUser
	        ,LastEditUser
	        ,blank_id
	        ,NaklNo
	        ,CONTRACTOR_ACC_ID
	        ,MANAGER_DEPT_ID
	        ,STATE_ID
	        ,OUT_TRADE_ID
	        ,TRIP_ID
	        ,QTY_FIT
	        ,MANAGER_ID
	        ,row_version
	        ,PRICE_TYPE_ID
       from inserted;
    open CS; 
    while 1=1 
    begin 
      fetch next from CS 
      into  @ID
           ,@ORDER_NUM
           ,@ARTICLE_ID
	       ,@QTY
           ,@PRICE_ECO
	       ,@DOC_DATE
           ,@DOC_TYPE_ID
	       ,@DHEAD_ID
           ,@ENTITY_TYPE
	       ,@IS_FRACTION
           ,@OUR_FIRM_ID
	       ,@PRICE_ECO_IN
	       ,@DEPT_ID
	       ,@CONTRACTOR_ID
	       ,@QTY_PAY
	       ,@QTY_FIRST
	       ,@CreateUser 
	       ,@LastEditUser
   	       ,@blank_id
	       ,@NaklNo
	       ,@CONTRACTOR_ACC_ID
	       ,@MANAGER_DEPT_ID
	       ,@STATE_ID
	       ,@OUT_TRADE_ID 
	       ,@TRIP_ID
	       ,@QTY_FIT
	       ,@MANAGER_ID
	       ,@row_version
	       ,@PRICE_TYPE_ID;
 
      if @@FETCH_STATUS<>0 break ;
      insert into Audit_Dspec ( ID
                  	           ,ORDER_NUM
	                           ,ARTICLE_ID
	                           ,QTY
	                           ,PRICE_ECO
	                           ,DOC_DATE
	                           ,DOC_TYPE_ID
	                           ,DHEAD_ID
	                           ,ENTITY_TYPE
  	                           ,IS_FRACTION
	                           ,OUR_FIRM_ID
	                           ,PRICE_ECO_IN
	                           ,DEPT_ID
	                           ,CONTRACTOR_ID
	                           ,QTY_PAY
	                           ,QTY_FIRST 
	                           ,CreateUser
	                           ,LastEditUser
	                           ,blank_id
	                           ,NaklNo
	                           ,CONTRACTOR_ACC_ID
 	                           ,MANAGER_DEPT_ID
	                           ,STATE_ID
	                           ,OUT_TRADE_ID
	                           ,TRIP_ID
       	                       ,QTY_FIT
	                           ,MANAGER_ID
	                           ,row_version
 	                           ,PRICE_TYPE_ID
                               ,Edit_date
	                           ,Edit_user
           	                   ,Edit_host_name
                               ,Action_type) 
        values ( @ID
                ,@ORDER_NUM
                ,@ARTICLE_ID
	            ,@QTY
                ,@PRICE_ECO
	            ,@DOC_DATE
                ,@DOC_TYPE_ID
	            ,@DHEAD_ID
                ,@ENTITY_TYPE
	            ,@IS_FRACTION
                ,@OUR_FIRM_ID
	            ,@PRICE_ECO_IN
 	            ,@DEPT_ID
	            ,@CONTRACTOR_ID
 	            ,@QTY_PAY
	            ,@QTY_FIRST
	            ,@CreateUser 
	            ,@LastEditUser
                ,@blank_id
	            ,@NaklNo
	            ,@CONTRACTOR_ACC_ID
	            ,@MANAGER_DEPT_ID
	            ,@STATE_ID
	            ,@OUT_TRADE_ID 
	            ,@TRIP_ID
	            ,@QTY_FIT
	            ,@MANAGER_ID
	            ,@row_version
	            ,@PRICE_TYPE_ID
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
      select ID
	        ,ORDER_NUM
	        ,ARTICLE_ID
	        ,QTY
	        ,PRICE_ECO
	        ,DOC_DATE
	        ,DOC_TYPE_ID
	        ,DHEAD_ID
	        ,ENTITY_TYPE
	        ,IS_FRACTION
	        ,OUR_FIRM_ID
	        ,PRICE_ECO_IN
	        ,DEPT_ID
	        ,CONTRACTOR_ID
	        ,QTY_PAY
	        ,QTY_FIRST 
	        ,CreateUser
	        ,LastEditUser
	        ,blank_id
	        ,NaklNo
	        ,CONTRACTOR_ACC_ID
	        ,MANAGER_DEPT_ID
	        ,STATE_ID
	        ,OUT_TRADE_ID
	        ,TRIP_ID
	        ,QTY_FIT
	        ,MANAGER_ID
	        ,row_version
	        ,PRICE_TYPE_ID
       from deleted;
    open CS; 
    while 1=1 
    begin 
      fetch next from CS 
      into  @ID
           ,@ORDER_NUM
           ,@ARTICLE_ID
	       ,@QTY
           ,@PRICE_ECO
	       ,@DOC_DATE
           ,@DOC_TYPE_ID
	       ,@DHEAD_ID
           ,@ENTITY_TYPE
	       ,@IS_FRACTION
           ,@OUR_FIRM_ID
	       ,@PRICE_ECO_IN
	       ,@DEPT_ID
	       ,@CONTRACTOR_ID
	       ,@QTY_PAY
	       ,@QTY_FIRST
	       ,@CreateUser 
	       ,@LastEditUser
   	       ,@blank_id
	       ,@NaklNo
	       ,@CONTRACTOR_ACC_ID
	       ,@MANAGER_DEPT_ID
	       ,@STATE_ID
	       ,@OUT_TRADE_ID 
	       ,@TRIP_ID
	       ,@QTY_FIT
	       ,@MANAGER_ID
	       ,@row_version
	       ,@PRICE_TYPE_ID;
 
      if @@FETCH_STATUS<>0 break ;
      insert into Audit_Dspec ( ID
                  	           ,ORDER_NUM
	                           ,ARTICLE_ID
	                           ,QTY
	                           ,PRICE_ECO
	                           ,DOC_DATE
	                           ,DOC_TYPE_ID
	                           ,DHEAD_ID
	                           ,ENTITY_TYPE
  	                           ,IS_FRACTION
	                           ,OUR_FIRM_ID
	                           ,PRICE_ECO_IN
	                           ,DEPT_ID
	                           ,CONTRACTOR_ID
	                           ,QTY_PAY
	                           ,QTY_FIRST 
	                           ,CreateUser
	                           ,LastEditUser
	                           ,blank_id
	                           ,NaklNo
	                           ,CONTRACTOR_ACC_ID
 	                           ,MANAGER_DEPT_ID
	                           ,STATE_ID
	                           ,OUT_TRADE_ID
	                           ,TRIP_ID
       	                       ,QTY_FIT
	                           ,MANAGER_ID
	                           ,row_version
 	                           ,PRICE_TYPE_ID
                               ,Edit_date
	                           ,Edit_user
           	                   ,Edit_host_name
                               ,Action_type)  
        values ( @ID
                ,@ORDER_NUM
                ,@ARTICLE_ID
	            ,@QTY
                ,@PRICE_ECO
	            ,@DOC_DATE
                ,@DOC_TYPE_ID
	            ,@DHEAD_ID
                ,@ENTITY_TYPE
	            ,@IS_FRACTION
                ,@OUR_FIRM_ID
	            ,@PRICE_ECO_IN
	            ,@DEPT_ID
	            ,@CONTRACTOR_ID
	            ,@QTY_PAY
	            ,@QTY_FIRST
	            ,@CreateUser 
	            ,@LastEditUser
   	            ,@blank_id
	            ,@NaklNo
	            ,@CONTRACTOR_ACC_ID
	            ,@MANAGER_DEPT_ID
	            ,@STATE_ID
	            ,@OUT_TRADE_ID 
	            ,@TRIP_ID
 	            ,@QTY_FIT
	            ,@MANAGER_ID
	            ,@row_version
	            ,@PRICE_TYPE_ID
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