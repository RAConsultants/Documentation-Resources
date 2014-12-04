USE [Troy]
GO

/****** Object:  View [dbo].[Stratagis_Mart_Daily_Report]    Script Date: 11/12/2014 07:53:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Stratagis_Mart_Daily_Report]
AS
SELECT dbo.Stratagis_Date_View.DayDate, dbo.Stratagis_Date_View.Date, dbo.Stratagis_Date_View.DateYear, dbo.Stratagis_Date_View.DateMonth, 
               dbo.Stratagis_Date_View.DateWeek, dbo.Stratagis_Date_View.DateDay, dbo.Stratagis_Vehicle_View.VehicleId, dbo.Stratagis_Mart_Daily_Hours.HoursRunning, 
               dbo.Stratagis_Mart_Daily_Hours.HoursIdle, dbo.Stratagis_Mart_Daily_Hours.HoursOff, dbo.Stratagis_Mart_Daily_Hours.DIHours, 
               dbo.Stratagis_Mart_Mile_Speed_View.TotalMiles, 
               CASE WHEN dbo.Stratagis_Mart_Daily_Hours.HoursRunning > 0 THEN ISNULL(dbo.Stratagis_Mart_Mile_Speed_View.TotalMiles, 0) 
               / dbo.Stratagis_Mart_Daily_Hours.HoursRunning ELSE 0 END AS AvgSpeed, dbo.Stratagis_Mart_Mile_Speed_View.MaxSpeed, onoff.OnTime, onoff.OffTime, 
               dbo.Stratagis_Mart_MIL_Codes.MILCodes
FROM  (SELECT DateYear, DateMonth, DateDay, VehicleId, CONVERT(varchar, CONVERT(time, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), 
                              MIN(TimeStamp))), 100) AS OnTime, CONVERT(varchar, CONVERT(time, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), MAX(TimeStamp))), 
                              100) AS OffTime
               FROM   dbo.Stratagis_Historic_Mart
               GROUP BY VehicleId, CONVERT(date, TimeStamp), DateYear, DateMonth, DateDay) AS onoff RIGHT OUTER JOIN
               dbo.Stratagis_Date_View LEFT OUTER JOIN
               dbo.Stratagis_Mart_MIL_Codes ON dbo.Stratagis_Date_View.DateYear = dbo.Stratagis_Mart_MIL_Codes.DateYear AND 
               dbo.Stratagis_Date_View.DateMonth = dbo.Stratagis_Mart_MIL_Codes.DateMonth AND 
               dbo.Stratagis_Date_View.DateDay = dbo.Stratagis_Mart_MIL_Codes.DateDay RIGHT OUTER JOIN
               dbo.Stratagis_Vehicle_View ON dbo.Stratagis_Mart_MIL_Codes.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId ON 
               onoff.DateYear = dbo.Stratagis_Date_View.DateYear AND onoff.DateMonth = dbo.Stratagis_Date_View.DateMonth AND 
               onoff.DateDay = dbo.Stratagis_Date_View.DateDay AND onoff.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId LEFT OUTER JOIN
               dbo.Stratagis_Mart_Mile_Speed_View ON dbo.Stratagis_Date_View.DayDate = dbo.Stratagis_Mart_Mile_Speed_View.DayDate AND 
               dbo.Stratagis_Date_View.Date = dbo.Stratagis_Mart_Mile_Speed_View.Date AND 
               dbo.Stratagis_Date_View.DateYear = dbo.Stratagis_Mart_Mile_Speed_View.DateYear AND 
               dbo.Stratagis_Date_View.DateMonth = dbo.Stratagis_Mart_Mile_Speed_View.DateMonth AND 
               dbo.Stratagis_Date_View.DateWeek = dbo.Stratagis_Mart_Mile_Speed_View.DateWeek AND 
               dbo.Stratagis_Date_View.DateDay = dbo.Stratagis_Mart_Mile_Speed_View.DateDay AND 
               dbo.Stratagis_Vehicle_View.VehicleId = dbo.Stratagis_Mart_Mile_Speed_View.VehicleId LEFT OUTER JOIN
               dbo.Stratagis_Mart_Daily_Hours ON dbo.Stratagis_Date_View.DayDate = dbo.Stratagis_Mart_Daily_Hours.DayDate AND 
               dbo.Stratagis_Date_View.Date = dbo.Stratagis_Mart_Daily_Hours.Date AND dbo.Stratagis_Date_View.DateYear = dbo.Stratagis_Mart_Daily_Hours.DateYear AND 
               dbo.Stratagis_Date_View.DateMonth = dbo.Stratagis_Mart_Daily_Hours.DateMonth AND 
               dbo.Stratagis_Date_View.DateWeek = dbo.Stratagis_Mart_Daily_Hours.DateWeek AND 
               dbo.Stratagis_Date_View.DateDay = dbo.Stratagis_Mart_Daily_Hours.DateDay AND 
               dbo.Stratagis_Vehicle_View.VehicleId = dbo.Stratagis_Mart_Daily_Hours.VehicleId

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[67] 4[11] 2[12] 3) )"
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
         Begin Table = "Stratagis_Vehicle_View"
            Begin Extent = 
               Top = 7
               Left = 744
               Bottom = 241
               Right = 928
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Date_View"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 225
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "onoff"
            Begin Extent = 
               Top = 231
               Left = 48
               Bottom = 372
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Mart_Mile_Speed_View"
            Begin Extent = 
               Top = 7
               Left = 512
               Bottom = 278
               Right = 696
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Mart_Daily_Hours"
            Begin Extent = 
               Top = 13
               Left = 303
               Bottom = 286
               Right = 487
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Mart_MIL_Codes"
            Begin Extent = 
               Top = 317
               Left = 416
               Bottom = 501
               Right = 600
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
   Begin Crite' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Daily_Report'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'riaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Daily_Report'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Daily_Report'
GO

