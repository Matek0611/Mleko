select * from TovarDateOfManufacture where kol < 0

select * from TovarDateOfManufacture where TovarNo = 7647

select * from Audit.dbo.Audit_TovarDateOfManufacture where TovarNo = 7647 and CreateDate = '11.08.2016 14:56' order by Edit_date

select * from Audit.dbo.Audit_TovarDateOfManufacture where TovarNo = 7647 and DateBeg = '07.08.2016' order by Edit_date

select * from TmpDebugDateOfManufacture where InfoStr like '7647%' and date > '11.08.2016 14:56' order by Date

select * 
 from Audit.dbo.Audit_Dspec 
  where ARTICLE_ID = 7647 
    and doc_date > '10.08.2016' 
	and Edit_host_name <> 'SIRIUS'
	and DateOfManufacture = '07.08.2016'
order by Edit_date, DHEAD_ID 

select * from e_blank_head where id = 165600 -- 7662

select * from e_blanks where document_id = 165600

select * from Ostatok where TovarNo = 5272

select * from L_SET_ARTICLE_GROUP

select * from L_ARTICLE_GROUP

select distinct ARTICLE_ID, t.NameTovar
 from L_POST_SET_ARTGROUP_PRICE lpsagp left join
      L_SET_ARTICLE_GROUP lsag on lsag.SET_ARTICLE_GROUP_ID = lpsagp.SET_ARTICLE_GROUP_ID left join
	  L_ARTICLE_GROUP l on l.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID and l.ACTIVE = 'Y' left join
	  Tovar t on t.TovarNo = l.ARTICLE_ID
  where POSTNO = 7662
    and COLNPRICE = 5

select * from DocClientCardAddressPostSpec where docId = 109990

update DocClientCardAddressPostSpec
 set Commerce_Network = null
where docId = 109990

select * from dspec where NaklNo = 195878 order by ORDER_NUM

select * from l_DspecForTovarDateOfManufacture where TovarNo = 7647 and DateBeg = '07.08.2016' order by CreateDate

select * 
 from DSPEC
  where id in (select IdDspec from l_DspecForTovarDateOfManufacture where TovarNo = 7647 and DateBeg = '07.08.2016')

select * from post where postno in (1345,5677)

select * from dspec where NaklNo = 9066 order by ARTICLE_ID

select * from KolGroupCutting order by TovarNo