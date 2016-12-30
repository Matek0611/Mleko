--> отгрузки delivery.csv    без учета 1-остаток \ конечный покупатель \ конечный потребитель
SELECT  DISTINCT

 [Kod_Spot_2D]
,(CONVERT (varchar, [Nomber_Client]) +'_'+  (CASE  WHEN [AddressNo] is null THEN '9999' ELSE CONVERT (varchar, [AddressNo]) END)) AS Nomer_Clients
,(CONVERT (char(10), [Date_of_Sale], 102)) AS Date_of_Sale
,[TovarNo]
,[Koli4estvo]
,isnull(Sale_Price_to_the_Clients,0)
,[Dealer_Namber]
     
FROM [work].[dbo].[Veres_delivery\clients\ta]
where [Date_of_Sale]>= (CONVERT (date, GETDATE()-45)) AND ([Nomber_Client] > 5498 or [Nomber_Client] < 5498) AND ([Nomber_Client] > 5513 or [Nomber_Client] < 5513) AND ([Nomber_Client] > 90 or [Nomber_Client] < 90) 
  and [TovarNo] not in (6364, 6363, 6335)
  --and Nomber_Client in (5215)
ORDER BY [Date_of_Sale]


---------------

--> Клиенты   clients.csv    без учета 1-остаток \ конечный покупатель \ конечный потребитель
SELECT DISTINCT
		  
		  (CASE  WHEN [Kod_Spot_2D] is null THEN 'нет данных'  ELSE [Kod_Spot_2D] END) AS Kod_v_Veres
		, (CONVERT (varchar, [Nomber_Client]) +'_'+  (CASE  WHEN [AddressNo] is null THEN '9999' ELSE CONVERT (varchar, [AddressNo]) END)) AS Nomer_Clients
		, (CASE  WHEN [Name_Client] is null THEN 'нет данных'  ELSE [Name_Client] END) 
		, (CASE  WHEN [Address_Client_Point] is null THEN 'нет данных'  ELSE [Address_Client_Point] END) AS  Address_Point  
 FROM [work].[dbo].[Veres_delivery\clients\ta]
where [Date_of_Sale]>= (CONVERT (date, GETDATE()-45)) AND ([Nomber_Client] > 5498 or [Nomber_Client] < 5498) AND ([Nomber_Client] > 5513 or [Nomber_Client] < 5513) AND ([Nomber_Client] > 90 or [Nomber_Client] < 90) 
ORDER BY Nomer_Clients 


--------------


--> Остатки  stocks.csv
SELECT  DISTINCT
       [Kod_Spot_2D]
      ,(CONVERT (char(10), GETDATE(), 102))  AS DayNow
      ,[TovarNo]
      ,[Kol]      
  FROM [work].[dbo].[Veres_stocks]
  where Kol>0
  ORDER BY [TovarNo] 
  
  
---------------

--> Продукция   products.csv
SELECT  DISTINCT
	  [TovarNo]
       ,[NameTovar]      
  FROM [work].[dbo].[Tovar]
  WHERE ([CompanyNo] = 135 or [CompanyNo] = 145) 
    and [TovarNo] in (15831,15832,15833)
    
---------------------
---------------------
--> Остатки  stocks.csv
SELECT  DISTINCT
       [Kod_Spot_2D]
      ,(CONVERT (char(10), GETDATE(), 102))  AS DayNow
      ,[TovarNo]
      ,[Kol]      
  FROM [work].[dbo].[Veres_stocks]
  where Kol>0
    and TovarNo in (18546)
  ORDER BY [TovarNo]   

------------------ Tovar    
    
SELECT TovarNo
      ,NameTovar
	  ,barCode
	  ,EdIzm
	  ,Weight
  FROM [work].[dbo].[Tovar]
  WHERE [TovarNo] in (25674)  

--------------------- TA
select  distinct Kod_Spod_2D
               , Dealer_Namber
			   , Dealer_Name
			   , Dailer_Type
			   , Dailer_City 
 from [work].[dbo].[v_Delivery\Clients\Ta_For_Spod2D] 
  where CompanyNo in (135,145) 
    and Dealer_Namber in (152,253,264,266,289,308,309,312,321,43,45,78,87,94)
order by Dealer_Namber
---------------------

SELECT  DISTINCT

 [Kod_Spot_2D]
,(CONVERT (varchar, [Nomber_Client]) +'_'+  (CASE  WHEN [AddressNo] is null THEN '9999' ELSE CONVERT (varchar, [AddressNo]) END)) AS Nomer_Clients
,(CONVERT (char(10), [Date_of_Sale], 102)) AS Date_of_Sale
,[TovarNo]
,[Koli4estvo]
,isnull(Sale_Price_to_the_Clients,0)
,[Dealer_Namber]
     
FROM [work].[dbo].[Veres_delivery\clients\ta]
where [Date_of_Sale]>= (CONVERT (date, GETDATE()-45)) AND ([Nomber_Client] > 5498 or [Nomber_Client] < 5498) AND ([Nomber_Client] > 5513 or [Nomber_Client] < 5513) AND ([Nomber_Client] > 90 or [Nomber_Client] < 90) 
  and [Nomber_Client] like '%3524%' and AddressNo = 9
ORDER BY [Date_of_Sale]
        ,[TovarNo] 


select * from Post where PostNo in (3524)
select * from AddressPost where PostNo = 3524

exec work.dbo.sp_ExportVeres
exec work.dbo.sp_ExportHohland
exec work.dbo.sp_ExportUkrProdukt
exec work.dbo.sp_ExportKMK


select * from D_ARTICLE_GROUP
select * from d_blank_reason
select * from AddressPost where PostNo = 1345

select * from AddressPost where Address like '%клоч%'

select * from Ostatok where TovarNo = 5303
select * from Users where UserName like '%ноч%'
select * from Users where UserName like '%сиб%'
select * from Users where UserNo = 116

insert into Users (UserNo,UserName,CodeAccess,Password,EditPost,FormWight,FormHeight,FormLeft,FormTop)
values (116,'Сибиров С (Ночник)',-2,'TMDMUKG', 0, 300,	180, 1,	1)

insert into Menu

select 116,ItemName,Enabled,Caption from Menu where UserNo = 97


select * from D_ARTICLE_GROUP
select * from D_SET_ARTICLE_GROUP
select * from L_ARTICLE_GROUP
select * from L_SET_ARTICLE_GROUP




    
