declare  @ColnPrice int
       , @TovarNo int

select isnull(case when @ColnPrice = 1 then Isnull(Price,0)             
                   when @ColnPrice = 2 then Isnull(Price1,0)            
                   when @ColnPrice = 3 then Isnull(Price2,0)            
                   when @ColnPrice = 4 then Isnull(Price3,0)            
                   when @ColnPrice = 5 then Isnull(Price4,0)            
                   when @ColnPrice = 6 then Isnull(Price5,0)            
                   when @ColnPrice = 7 then Isnull(Price6,0)            
                   when @ColnPrice = 8 then Isnull(Price7,0)            
                   when @ColnPrice = 10 then Isnull(Price8,0)           
                   when @ColnPrice = 11 then Isnull(Price9,0)           
                   when @ColnPrice = 12 then Isnull(Price10,0)          
                   when @ColnPrice = 13 then Isnull(Price13,0)          
                   when @ColnPrice = 14 then Isnull(Price14,0)          
                   when @ColnPrice = 15 then Isnull(Price15,0)          
                   when @ColnPrice = 9 then Isnull(AvgPriceIn,0)        
                   when @ColnPrice = 17 then Isnull(pfv.PriceVeb, 0)    
                   when @ColnPrice = 18 then Isnull(pfv.PriceInInst, 0) 
              end,0) as Price                                           
 from Ostatok o                                                         
     ,PriceForVeb pfv                                                   
  where o.TovarNo = @TovarNo                                            
    and o.TovarNo = pfv.TovarNo