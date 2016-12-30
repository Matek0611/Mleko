ALTER PROCEDURE [dbo].[Sp_Add_prop_dlg] (@p_id int output,@prop_dlg_type_code varchar(64))

AS
begin

declare 
@l_num int
,@l_rowid varchar(36)
,@l_type_id int
,@l_date smalldatetime

select @l_type_id=id from d_prop_dlg_type where code=@prop_dlg_type_code

select @l_num=isnull(max(num),0)+1 from d_prop_dlg where type_id=@l_type_id
Begin Tran

if @prop_dlg_type_code='REPORT' 
begin
  insert into d_prop_dlg(name,Description,Active,Num,type_id,class,create_date)
  values ('Новый отчет','Новый Отчет',1,@l_num,@l_type_id,'TCFLCustomRepDlg',@l_date)
end

if @prop_dlg_type_code='PROP' 
begin
  insert into d_prop_dlg(name,Description,Active,Num,type_id,class)
  values ('Новая форма свойств','Новая форма свойств',1,@l_num,@l_type_id,'TCFLPropDbDlg')
end

set @p_id=@@IDENTITY
commit
end
GO