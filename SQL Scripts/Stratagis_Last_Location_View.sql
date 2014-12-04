USE [Troy]
GO

/****** Object:  View [dbo].[Stratagis_Last_Location_View]    Script Date: 11/12/2014 07:53:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Stratagis_Last_Location_View]
AS
SELECT     dbo.Stratagis_Historic_Complete_View.OBJECTID, dbo.Stratagis_Historic_Complete_View.TimeStamp, dbo.Stratagis_Historic_Complete_View.LocalTimeStamp, 
                      dbo.Stratagis_Historic_Complete_View.DateYear, dbo.Stratagis_Historic_Complete_View.DateMonth, dbo.Stratagis_Historic_Complete_View.DateDay, 
                      dbo.Stratagis_Historic_Complete_View.LocalTime, dbo.Stratagis_Historic_Complete_View.Validity, dbo.Stratagis_Historic_Complete_View.Speed, 
                      dbo.Stratagis_Historic_Complete_View.Course, dbo.Stratagis_Historic_Complete_View.Variation, dbo.Stratagis_Historic_Complete_View.EastWest, 
                      dbo.Stratagis_Historic_Complete_View.DeviceId, dbo.Stratagis_Historic_Complete_View.VehicleId, dbo.Stratagis_Historic_Complete_View.EventNumber, 
                      CASE WHEN dbo.Stratagis_Historic_Complete_View.VIN IS NULL THEN Stratagis_Vehicle_View.VIN ELSE dbo.Stratagis_Historic_Complete_View.VIN END AS VIN, 
                      dbo.Stratagis_Historic_Complete_View.ODBProtocol, dbo.Stratagis_Historic_Complete_View.FirmWareVersion, dbo.Stratagis_Historic_Complete_View.RSSI, 
                      dbo.Stratagis_Historic_Complete_View.MILCount, dbo.Stratagis_Historic_Complete_View.MILCodes, dbo.Stratagis_Historic_Complete_View.GpsOdometerMiles, 
                      dbo.Stratagis_Historic_Complete_View.OBDTripOdometerMiles, dbo.Stratagis_Historic_Complete_View.VehicleSpeedMph, 
                      dbo.Stratagis_Historic_Complete_View.Rpms, dbo.Stratagis_Historic_Complete_View.CoolantTempF, dbo.Stratagis_Historic_Complete_View.GPSStatus, 
                      dbo.Stratagis_Historic_Complete_View.IdleTimeSec, dbo.Stratagis_Historic_Complete_View.UserVar, dbo.Stratagis_Historic_Complete_View.AccelerationX, 
                      dbo.Stratagis_Historic_Complete_View.AccelerationY, dbo.Stratagis_Historic_Complete_View.AccelerationZ, dbo.Stratagis_Historic_Complete_View.ExcAccelTime, 
                      dbo.Stratagis_Historic_Complete_View.ExcAccelLength, dbo.Stratagis_Historic_Complete_View.ExcAcceleration, 
                      dbo.Stratagis_Historic_Complete_View.ExcDecelTime, dbo.Stratagis_Historic_Complete_View.ExcDecelLength, 
                      dbo.Stratagis_Historic_Complete_View.ExcDeceleration, dbo.Stratagis_Historic_Complete_View.SHAPE, dbo.Stratagis_Historic_Complete_View.AdjOdometer, 
                      dbo.Stratagis_Historic_Complete_View.Department, dbo.Stratagis_Historic_Complete_View.DigitalInput, ISNULL(dbo.Stratagis_Vehicle_View.OdometerAdj, 0) 
                      + ISNULL(dbo.Stratagis_Historic_Complete_View.GpsOdometerMiles, 0) AS Odometer
FROM         dbo.Stratagis_Historic_Complete_View INNER JOIN
                          (SELECT     MAX(OBJECTID) AS ObjectId, VehicleId
                            FROM          dbo.Stratagis_Historic_Complete_View AS Stratagis_Historic_Complete_View_1
                            GROUP BY VehicleId) AS a ON dbo.Stratagis_Historic_Complete_View.OBJECTID = a.ObjectId INNER JOIN
                      dbo.Stratagis_Vehicle_View ON dbo.Stratagis_Historic_Complete_View.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId

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
         Begin Table = "Stratagis_Historic_Complete_View"
            Begin Extent = 
               Top = 6
               Left = 377
               Bottom = 251
               Right = 605
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 16
               Left = 691
               Bottom = 211
               Right = 875
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Vehicle_View"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 254
               Right = 198
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Last_Location_View'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Last_Location_View'
GO

