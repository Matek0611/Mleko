USE [work]
GO

/****** Object:  View [dbo].[V_PostLimitAll]    Script Date: 11.11.2013 15:43:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_PostLimitAll]
AS
select TOP (100) PERCENT
       a.PostNo /*Номер контрагента*/
       ,pdel.is_stop /*Запрет отгрузки пополный (0-разрешено,1-запрет)*/
       ,pdel.is_start as is_stop_check /*Отключение запрета отгрузки по просрочке платежа (1-Отключен контроль долга,0-включен)*/
       ,pdel.is_all_group /*Запрет на отгрузку по просрочке платежа(1-запрещена отгрузка, 0-разрешена)*/
       ,pdel.KolDayDolg /*Кол. дней просрочки*/
       ,pdel.postdaydelay as dayDelay /*Общая отсрочка*/
       ,isnull(pdel.DAY_DELAY,0) as day_Delay_Main /*Отсрочка платежа*/
       ,isnull(pdel.Day_delay_ext,0) as Day_delay_ext /*Дополнительная отсрочка платежа*/
       ,pdel.SET_ARTICLE_GROUP_NAME as Set_Name /*Наименование набора групп*/
       ,pdel.SET_ARTICLE_GROUP_ID /*ID набора групп*/
	   ,pdel.BUH /*Бухгалтерский тип*/
       ,(select Buh_type_name from d_buh_type where buh=pdel.BUH) as Buh_type_name /*Наименование бухгалтерского типа*/
       ,DATEADD(DAY, pdel.postdaydelay, isnull(pdel.DateNakl,pdel.CurDateNakl)) as LastEnabledDay
       ,DateNakl as FirstDateDolg
       ,pdel.CurDateNakl
       ,case when pdel.KolDayDolg > pdel.postdaydelay then 1 
             when ((DateNakl is not null) and (select isnull(max(1),0) from l_firm_prop where postNo=a.PostNo and prop_id=22)=1) then 1
                                                                                                                                 else 0 
        end as is_prosr /*Есть ли просрочка по платежам*/
       ,pdel.is_enable_stop_period /*временное отключение запрета отгрузки про просрочке платежа*/
	   ,(SELECT Isnull(Max(1),0)
          FROM D_Post_PayBan_Stop_Control pbsc left join
		       L_Post_Set_ArtGroup_PayBan lpbsc on pbsc.L_Post_Set_ArtGroup_PayBan_Id = lpbsc.id
           WHERE lpbsc.Set_Article_Group_Id_PayBan = pdel.set_article_group_id
             AND pbsc.Active = 1
			 and lpbsc.Buh = pdel.BUH
             AND ((CAST(CONVERT(varchar(10), GETDATE(), 104) AS smalldateTime)) BETWEEN pbsc.date_beg AND pbsc.date_end)) as is_enable_stop_Pay_Ban /*Отключена ли проверка на превышение лимита*/
       ,isnull((SELECT isnull(lpbsc.PayBan,0) as pay /*Лимит отгрузки товара*/
                 FROM L_Post_Set_ArtGroup_PayBan lpbsc 
                  WHERE lpbsc.Set_Article_Group_Id_PayBan = pdel.set_article_group_id
			        and lpbsc.Buh = pdel.BUH
			        and lpbsc.PostNo_PayBan = pdel.POSTNO),0) as PayBan /*Лимит отгрузки в долг (грн.)*/
       ,case when pdel.Day_Prosr>0 then pdel.Day_Prosr else 0 end as Day_Prosr /*Кол. дней просрочки*/
       ,case when pdel.Day_Prosr_group>0 then pdel.Day_Prosr_group else 0 end as Day_Prosr_group /*Кол-во дней просрочки по набору групп*/
	   ,isnull(pbr.Check1,0) as is_stop_return_blank
	   ,isnull(pbr.Description,'Нет данных') as Description_stop_return_blank
 from post a INNER JOIN 
      (select v2.id
             ,v2.DateNakl
             ,v2.KolDayDolg
             ,v2.DAY_DELAY
             ,v2.Day_delay_ext
             ,v2.SET_ARTICLE_GROUP_NAME
             ,v2.SET_ARTICLE_GROUP_ID
             ,v2.BUH
             ,v2.PostNo
             ,v2.postdaydelay
             ,v2.CurDateNakl
             ,v2.is_all_group
             ,v2.is_start
             ,v2.is_stop
             ,v2.KolDayDolg - v2.postdaydelay as Day_Prosr
             ,v2.KolDayDolgGroup - v2.postdaydelay as Day_Prosr_group
             ,is_enable_stop_period
        from (select v1.id
                     ,v1.DateNakl
                     ,v1.CurDateNakl
                     ,v1.DAY_DELAY
                     ,v1.Day_delay_ext
                     ,v1.SET_ARTICLE_GROUP_NAME
                     ,v1.SET_ARTICLE_GROUP_ID
                     ,v1.BUH
                     ,v1.PostNo
                     ,Isnull(v1.DAY_DELAY,0)+isnull(v1.DAY_DELAY_EXT,0)  AS postdaydelay
                     ,v1.is_all_group
                     ,v1.is_start
                     ,v1.is_stop
                     ,Datediff(dd,isnull(v1.DateNakl, v1.CurDateNakl ), v1.CurDateNakl ) as KolDayDolg
                     ,Datediff(dd,isnull(v1.group_first_nakl, v1.CurDateNakl ), v1.CurDateNakl ) as KolDayDolgGroup
                     ,is_enable_stop_period
                from (SELECT CASE WHEN pstart.id IS NOT NULL THEN Cast('01.01.2020' AS SMALLDATETIME)
                                  WHEN pstop.id IS NOT NULL THEN Cast('01.01.1970' AS SMALLDATETIME)
                                  WHEN EXISTS (SELECT 1
                                                FROM   d_post_delay_stop_control sc
                                                 WHERE  sc.l_post_set_delay_id = ldel.id
                                                   AND sc.active = 'Y'
                                                   AND ((CAST(CONVERT(varchar(10), GETDATE(), 104) AS smalldateTime)) BETWEEN sc.date_beg AND sc.date_end)) THEN (SELECT Min(sc.date_end)
                                                                                                                                                                   FROM   d_post_delay_stop_control sc
                                                                                                                                                                    WHERE  sc.l_post_set_delay_id = ldel.id
                                                                                                                                                                      AND sc.active = 'Y'
                                                                                                                                                                      AND ((CAST(CONVERT(varchar(10), GETDATE(), 104) AS smalldateTime)) BETWEEN sc.date_beg AND sc.date_end))
                                  WHEN p.id IS NOT NULL THEN (SELECT Min(h1.datenakl)
                                                               FROM naklr h1,
                                                                    l_post_set_artgroup_delay l2
                                                                WHERE  h1.summadolg > 0
                                                                  AND h1.postno = ldel.postno
                                                                  AND h1.ourfirmno = 490
                                                                  AND h1.vidnaklno = 1
                                                                  AND h1.set_article_group_id = l2.set_article_group_id
                                                                  AND h1.buh = l2.buh
                                                                  AND h1.postno = l2.postno
                                                                  AND Datediff(dd,h1.datenakl,(CAST(CONVERT(varchar(10), GETDATE(), 104) AS smalldateTime))) > (Isnull(l2.day_delay,0) + Isnull(l2.day_delay_ext,0)))
                                                        ELSE ldel.group_first_nakl
                             END AS datenakl,
                             ldel.postno,
                             ldel.set_article_group_id,
                             ldel.buh,
                             ldel.day_delay AS day_delay,
                             ldel.day_delay_ext AS day_delay_ext,
                             g.name AS set_article_group_name,
                             ldel.id,
                             CASE WHEN p.id IS NOT NULL THEN 1
                                                        ELSE 0
                             END AS is_all_group,
                             CASE WHEN pstart.id IS NOT NULL THEN 1
                                                             ELSE 0
                             END AS is_start,
                             CASE WHEN pstop.id IS NOT NULL THEN 1
                                                            ELSE 0
                             END AS is_stop,
                             (CAST(CONVERT(varchar(10), GETDATE(), 104) AS smalldateTime)) curdatenakl,
                             (SELECT Isnull(Max(1),0)
                               FROM d_post_delay_stop_control sc
                                WHERE  sc.l_post_set_delay_id = ldel.id
                                  AND sc.active = 'Y'
                                  AND ((CAST(CONVERT(varchar(10), GETDATE(), 104) AS smalldateTime)) BETWEEN sc.date_beg AND sc.date_end)) AS is_enable_stop_period,
                             ldel.group_first_nakl
                       FROM (SELECT Coalesce((SELECT Min(datenakl)
                                               FROM naklr h1
                                                WHERE h1.summadolg > 0
                                                  AND h1.postno = l.postno
                                                  AND h1.ourfirmno = 490
                                                  AND h1.vidnaklno = 1
                                                  AND h1.set_article_group_id = l.set_article_group_id),
                                             (SELECT Min(datenakl)
                                               FROM naklr h1
                                                WHERE h1.summadolg > 0
                                                  AND h1.postno = l.postno
                                                  AND h1.ourfirmno = 490
                                                  AND h1.vidnaklno = 1
                                                  AND h1.set_article_group_id IS NULL)) AS group_first_nakl,
                                             l.id,
                                             l.postno,
                                             l.day_delay,
                                             l.day_delay_ext,
                                             l.buh,
                                             l.set_article_group_id
                              FROM l_post_set_artgroup_delay l) ldel  INNER JOIN 
		                           d_set_article_group g ON ldel.set_article_group_id = g.id AND g.active = 'Y' LEFT OUTER JOIN 
				                   l_firm_prop p ON p.prop_id = 22  AND p.postno = ldel.postno LEFT OUTER JOIN 
				                   l_firm_prop pstop ON pstop.prop_id = 14 AND pstop.postno = ldel.postno LEFT OUTER JOIN 
				                   l_firm_prop pstart ON pstart.prop_id = 21 AND pstart.postno = ldel.postno) v1 ) v2) pdel on pdel.PostNo=a.PostNo left join
      Post_Ban_Return pbr on pbr.PostNo = a.PostNo
 where buh is not null
order by a.PostNo, pdel.SET_ARTICLE_GROUP_ID
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pdel"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 135
               Right = 468
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pbr"
            Begin Extent = 
               Top = 6
               Left = 506
               Bottom = 135
               Right = 680
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PostLimitAll'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PostLimitAll'
GO


