USE [Troy]
GO

/****** Object:  View [dbo].[Stratagis_Mart_Mile_Speed_View]    Script Date: 11/12/2014 07:54:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Stratagis_Mart_Mile_Speed_View]
AS
SELECT dbo.Stratagis_Date_View.Date, dbo.Stratagis_Date_View.DayDate, dbo.Stratagis_Date_View.DateYear, dbo.Stratagis_Date_View.DateMonth, 
               dbo.Stratagis_Date_View.DateWeek, dbo.Stratagis_Date_View.DateDay, dbo.Stratagis_Vehicle_View.VehicleId, b_1.MaxSpeed, a_1.TotalMiles
FROM  dbo.Stratagis_Vehicle_View LEFT OUTER JOIN
                   (SELECT DateYear, DateMonth, DateDay, VehicleId, MAX(GpsOdometerMiles) - MIN(GpsOdometerMiles) AS TotalMiles
                    FROM   dbo.Stratagis_Historic_Mart
                    WHERE (OBJECTID NOT IN
                                       (SELECT b.OBJECTID
                                        FROM   dbo.Stratagis_Historic_Mart AS a INNER JOIN
                                                           (SELECT OBJECTID, LocalTimeStamp, VehicleId, GpsOdometerMiles
                                                            FROM   dbo.Stratagis_Historic_Mart AS Stratagis_Historic_Mart_1) AS b ON a.VehicleId = b.VehicleId AND 
                                                       a.LocalTimeStamp < b.LocalTimeStamp AND a.GpsOdometerMiles > b.GpsOdometerMiles
                                        GROUP BY b.OBJECTID, b.VehicleId, b.GpsOdometerMiles))
                    GROUP BY DateYear, DateMonth, DateDay, VehicleId) AS a_1 RIGHT OUTER JOIN
               dbo.Stratagis_Date_View LEFT OUTER JOIN
                   (SELECT DateYear, DateMonth, DateDay, VehicleId, MAX(Speed) AS MaxSpeed
                    FROM   dbo.Stratagis_Historic_Mart AS Stratagis_Historic_Mart_2
                    GROUP BY DateYear, DateMonth, DateDay, VehicleId) AS b_1 ON dbo.Stratagis_Date_View.DateYear = b_1.DateYear AND 
               dbo.Stratagis_Date_View.DateMonth = b_1.DateMonth AND dbo.Stratagis_Date_View.DateDay = b_1.DateDay ON 
               a_1.DateYear = dbo.Stratagis_Date_View.DateYear AND a_1.DateMonth = dbo.Stratagis_Date_View.DateMonth AND 
               a_1.DateDay = dbo.Stratagis_Date_View.DateDay ON dbo.Stratagis_Vehicle_View.VehicleId = b_1.VehicleId AND 
               dbo.Stratagis_Vehicle_View.VehicleId = a_1.VehicleId

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
         Begin Table = "b_1"
            Begin Extent = 
               Top = 62
               Left = 888
               Bottom = 203
               Right = 1088
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a_1"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 248
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Vehicle_View"
            Begin Extent = 
               Top = 167
               Left = 340
               Bottom = 290
               Right = 540
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Date_View"
            Begin Extent = 
               Top = 7
               Left = 533
               Bottom = 164
               Right = 717
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1356
         Filter = 1356
         Or = 1350
         Or = 1350
         Or =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Mile_Speed_View'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Mile_Speed_View'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Mile_Speed_View'
GO

