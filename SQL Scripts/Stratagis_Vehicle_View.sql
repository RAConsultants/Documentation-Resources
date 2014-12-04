USE [Troy]
GO

/****** Object:  View [dbo].[Stratagis_Vehicle_View]    Script Date: 11/12/2014 07:55:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Stratagis_Vehicle_View]
AS
SELECT     TOP (100) PERCENT derivedtbl_1.VehicleId, dbo.Stratagis_Vehicle_Info.AdjOdometer AS OdometerAdj, dbo.Stratagis_Vehicle_Info.Department, 
                      dbo.Stratagis_Vehicle_Info.VIN, dbo.Stratagis_Vehicle_Info.Year, dbo.Stratagis_Vehicle_Info.Make, dbo.Stratagis_Vehicle_Info.Model, 
                      dbo.Stratagis_Vehicle_Info.UseDescription, dbo.Stratagis_Vehicle_Info.MEID, dbo.Stratagis_Vehicle_Info.PhoneNumber
FROM         dbo.Stratagis_Vehicle_Info RIGHT OUTER JOIN
                          (SELECT     VehicleId
                            FROM          dbo.STRATAGIS_FLEET_HISTORIC
                            GROUP BY VehicleId) AS derivedtbl_1 ON dbo.Stratagis_Vehicle_Info.VehicleId = derivedtbl_1.VehicleId
GROUP BY derivedtbl_1.VehicleId, dbo.Stratagis_Vehicle_Info.AdjOdometer, dbo.Stratagis_Vehicle_Info.Department, dbo.Stratagis_Vehicle_Info.VIN, 
                      dbo.Stratagis_Vehicle_Info.Year, dbo.Stratagis_Vehicle_Info.Make, dbo.Stratagis_Vehicle_Info.Model, dbo.Stratagis_Vehicle_Info.UseDescription, 
                      dbo.Stratagis_Vehicle_Info.MEID, dbo.Stratagis_Vehicle_Info.PhoneNumber
ORDER BY derivedtbl_1.VehicleId

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
         Begin Table = "Stratagis_Vehicle_Info"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 278
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "derivedtbl_1"
            Begin Extent = 
               Top = 7
               Left = 280
               Bottom = 94
               Right = 464
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Vehicle_View'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Vehicle_View'
GO

