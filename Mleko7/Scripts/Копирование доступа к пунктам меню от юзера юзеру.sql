/*
КОПИРОВАНИЕ ДОСТУПА К ПУНКТОВ МЕНЮ С ОДНОГО ПОЛЬЗОВАТЕЛЯ ДРУГОМУ
*/
declare
   @UserNoFrom int
  ,@UserNoFor int 
  ,@ItemName varchar(20)
  ,@Enadled bit
  ,@Caption varchar(128)
  
  set @UserNoFrom = 45 -- С кого копировать
  set @UserNoFor = 44 -- Кому копировать
  
declare CS cursor scroll local for
 select  Userno
        ,ItemName
        ,Enabled
        ,Caption
  from Menu
   where UserNo = 45 --@UserNoFrom;
open CS;
while 1=1
begin
 fetch next from CS 
 into @UserNoFrom
     ,@ItemName
     ,@Enadled
     ,@Caption
 if @@FETCH_STATUS<>0 break; 
 update Menu
  set -- ItemName = @ItemName
      Enabled = @Enadled
     -- ,Caption = @Caption
 where UserNo = @UserNoFor
   and ItemName = @ItemName;       
end;

close CS; 
deallocate CS; 

-----------------------------

declare
    @UserNoFr int
   ,@UserNoTo int
   
   set @UserNoFr = 107 -- С кого копировать
   set @UserNoTo = 126 -- Кому копировать

update mt
  set mt.Enabled = isnull(mf.Enabled,0)
from menu mt 
  left join menu mf on ((mf.ItemName = mt.ItemName) and (mf.UserNo = @UserNoFr))
where mt.UserNo = @UserNoTo

-- select * from menu where userno = 111
/*
insert into menu 
select 111, ItemName, Enabled, Caption  from menu where userno = 102
*/

select * from Users where UserName like '%борис%'

select * 
 from Menu 
  where userno = 107 
    and (ItemName not in (select ItemName from Menu where userno = 126)) -- 308

--insert into Menu
select 126,ItemName,Enabled,Caption
 from Menu 
  where userno = 107 
    and (ItemName not in (select ItemName from Menu where userno = 126))

select * from Menu where userno = 126 -- 304

/*
update Menu 
 set Enabled = 0
where UserNo = 107  
*/