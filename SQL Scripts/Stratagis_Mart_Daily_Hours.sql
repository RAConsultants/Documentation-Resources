USE [Troy]
GO

/****** Object:  View [dbo].[Stratagis_Mart_Daily_Hours]    Script Date: 11/12/2014 07:53:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Stratagis_Mart_Daily_Hours]
AS
SELECT dbo.Stratagis_Date_View.DayDate, dbo.Stratagis_Date_View.Date, dbo.Stratagis_Date_View.DateYear, dbo.Stratagis_Date_View.DateMonth, 
               dbo.Stratagis_Date_View.DateWeek, dbo.Stratagis_Date_View.DateDay, dbo.Stratagis_Vehicle_View.VehicleId, ISNULL(run.HoursRunning, 0) AS HoursRunning, 
               ISNULL(idle.HoursIdle, 0) AS HoursIdle, 24 - ISNULL(run.HoursRunning, 0) - ISNULL(idle.HoursIdle, 0) AS HoursOff, ISNULL(derivedtbl_1.DIHours, 0) 
               AS DIHours
FROM  (SELECT VehicleId, CONVERT(date, LocalTimeStamp) AS DayDate, DateYear, DateMonth, DateDay, CONVERT(float, COUNT(*)) / 2 / 60 AS HoursIdle, 
                              CONVERT(datetime, CONVERT(date, LocalTimeStamp)) AS Date
               FROM   dbo.Stratagis_Historic_Mart AS Stratagis_Historic_Mart_1
               WHERE (Speed = 0)
               GROUP BY VehicleId, DateYear, DateMonth, DateDay, CONVERT(date, LocalTimeStamp)) AS idle RIGHT OUTER JOIN
               dbo.Stratagis_Date_View LEFT OUTER JOIN
                   (SELECT VehicleId, CONVERT(date, LocalTimeStamp) AS DayDate, CONVERT(datetime, CONVERT(date, LocalTimeStamp)) AS Date, ROUND(CONVERT(float, 
                                   COUNT(*)) / 2 / 60, 2) AS DIHours
                    FROM   dbo.Stratagis_Historic_Mart AS Stratagis_Historic_Mart_2
                    WHERE (DigitalInput <> '') AND (DigitalInput IS NOT NULL)
                    GROUP BY VehicleId, CONVERT(date, LocalTimeStamp), CONVERT(datetime, CONVERT(date, LocalTimeStamp))) AS derivedtbl_1 ON 
               dbo.Stratagis_Date_View.DayDate = derivedtbl_1.DayDate AND dbo.Stratagis_Date_View.Date = derivedtbl_1.Date LEFT OUTER JOIN
                   (SELECT VehicleId, CONVERT(date, LocalTimeStamp) AS DayDate, ROUND(CONVERT(float, COUNT(*)) / 2 / 60, 2) AS HoursRunning, CONVERT(datetime, 
                                   CONVERT(date, LocalTimeStamp)) AS Date
                    FROM   dbo.Stratagis_Historic_Mart
                    WHERE (Speed > 0)
                    GROUP BY VehicleId, CONVERT(date, LocalTimeStamp)) AS run ON dbo.Stratagis_Date_View.DayDate = run.DayDate ON 
               idle.DateDay = dbo.Stratagis_Date_View.DateDay AND idle.DateMonth = dbo.Stratagis_Date_View.DateMonth AND 
               idle.DateYear = dbo.Stratagis_Date_View.DateYear AND idle.DayDate = dbo.Stratagis_Date_View.DayDate RIGHT OUTER JOIN
               dbo.Stratagis_Vehicle_View ON run.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId AND derivedtbl_1.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId AND 
               idle.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[52] 4[14] 2[16] 3) )"
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
         Begin Table = "idle"
            Begin Extent = 
               Top = 41
               Left = 374
               Bottom = 278
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "derivedtbl_1"
            Begin Extent = 
               Top = 148
               Left = 657
               Bottom = 355
               Right = 841
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "run"
            Begin Extent = 
               Top = 7
               Left = 831
               Bottom = 223
               Right = 1015
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Vehicle_View"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 188
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Date_View"
            Begin Extent = 
               Top = 189
               Left = 48
               Bottom = 381
               Right = 232
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
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Daily_Hours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Daily_Hours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Daily_Hours'
GO

