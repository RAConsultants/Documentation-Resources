USE [Troy]
GO

/****** Object:  View [dbo].[Stratagis_Realtime_View]    Script Date: 11/12/2014 07:54:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Stratagis_Realtime_View]
AS
SELECT     diobd.OBJECTID, diobd.TimeStamp, diobd.LocalTimeStamp, diobd.DateYear, diobd.DateMonth, diobd.DateDay, diobd.LocalTime, diobd.Validity, diobd.Speed, 
                      diobd.Course, diobd.Variation, diobd.EastWest, diobd.DeviceId, diobd.VehicleId, diobd.EventNumber, CASE WHEN diobd.VIN IS NULL 
                      THEN Stratagis_Vehicle_View_3.VIN ELSE diobd.VIN END AS VIN, diobd.ODBProtocol, diobd.FirmWareVersion, diobd.RSSI, diobd.MILCount, diobd.MILCodes, 
                      diobd.GpsOdometerMiles, diobd.OBDTripOdometerMiles, diobd.SHAPE, diobd.AdjOdometer, diobd.Department, diobd.DigitalInput, accobd.VehicleSpeedMph, 
                      accobd.Rpms, accobd.CoolantTempF, accobd.GPSStatus, accobd.IdleTimeSec, accobd.UserVar, accobd.AccelerationX, accobd.AccelerationY, accobd.AccelerationZ, 
                      accobd.ExcAccelTime, accobd.ExcAccelLength, accobd.ExcAcceleration, accobd.ExcDecelTime, accobd.ExcDecelLength, accobd.ExcDeceleration, 
                      ISNULL(Stratagis_Vehicle_View_3.OdometerAdj, 0) + ISNULL(diobd.GpsOdometerMiles, 0) AS Odometer
FROM         (SELECT     obd.OBJECTID, obd.TimeStamp, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), obd.TimeStamp) AS LocalTimeStamp, YEAR(DATEADD(mi, 
                                              DATEDIFF(mi, sysutcdatetime(), sysdatetime()), obd.TimeStamp)) AS DateYear, MONTH(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), 
                                              obd.TimeStamp)) AS DateMonth, DAY(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), obd.TimeStamp)) AS DateDay, CONVERT(varchar, 
                                              CONVERT(time, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), obd.TimeStamp)), 100) AS LocalTime, obd.Validity, obd.Speed, obd.Course, 
                                              obd.Variation, obd.EastWest, obd.DeviceId, obd.VehicleId, obd.EventNumber, obd.VIN, obd.ODBProtocol, obd.FirmWareVersion, obd.RSSI, obd.MILCount, 
                                              obd.MILCodes, obd.GpsOdometerMiles, obd.OBDTripOdometerMiles, obd.SHAPE, obd.AdjOdometer, obd.Department, di.DigitalInput
                       FROM          (SELECT     STRATAGIS_FLEET_REALTIME_1.OBJECTID, STRATAGIS_FLEET_REALTIME_1.TimeStamp, STRATAGIS_FLEET_REALTIME_1.Validity, 
                                                                      STRATAGIS_FLEET_REALTIME_1.Speed, STRATAGIS_FLEET_REALTIME_1.Course, STRATAGIS_FLEET_REALTIME_1.Variation, 
                                                                      STRATAGIS_FLEET_REALTIME_1.EastWest, STRATAGIS_FLEET_REALTIME_1.DeviceId, STRATAGIS_FLEET_REALTIME_1.VehicleId, 
                                                                      STRATAGIS_FLEET_REALTIME_1.EventNumber, STRATAGIS_FLEET_REALTIME_1.VIN, STRATAGIS_FLEET_REALTIME_1.ODBProtocol, 
                                                                      STRATAGIS_FLEET_REALTIME_1.FirmWareVersion, STRATAGIS_FLEET_REALTIME_1.RSSI, STRATAGIS_FLEET_REALTIME_1.MILCount, 
                                                                      STRATAGIS_FLEET_REALTIME_1.MILCodes, STRATAGIS_FLEET_REALTIME_1.GpsOdometerMiles, 
                                                                      STRATAGIS_FLEET_REALTIME_1.OBDTripOdometerMiles, STRATAGIS_FLEET_REALTIME_1.VehicleSpeedMph, 
                                                                      STRATAGIS_FLEET_REALTIME_1.Rpms, STRATAGIS_FLEET_REALTIME_1.CoolantTempF, STRATAGIS_FLEET_REALTIME_1.GPSStatus, 
                                                                      STRATAGIS_FLEET_REALTIME_1.IdleTimeSec, STRATAGIS_FLEET_REALTIME_1.UserVar, STRATAGIS_FLEET_REALTIME_1.AccelerationX, 
                                                                      STRATAGIS_FLEET_REALTIME_1.AccelerationY, STRATAGIS_FLEET_REALTIME_1.AccelerationZ, 
                                                                      STRATAGIS_FLEET_REALTIME_1.ExcAccelTime, STRATAGIS_FLEET_REALTIME_1.ExcAccelLength, 
                                                                      STRATAGIS_FLEET_REALTIME_1.ExcAcceleration, STRATAGIS_FLEET_REALTIME_1.ExcDecelTime, 
                                                                      STRATAGIS_FLEET_REALTIME_1.ExcDecelLength, STRATAGIS_FLEET_REALTIME_1.ExcDeceleration, STRATAGIS_FLEET_REALTIME_1.SHAPE, 
                                                                      STRATAGIS_FLEET_REALTIME_1.GpsOdometerMiles + Stratagis_Vehicle_View_1.OdometerAdj AS AdjOdometer, 
                                                                      Stratagis_Vehicle_View_1.Department, STRATAGIS_FLEET_REALTIME_1.DigitalInput
                                               FROM          dbo.STRATAGIS_FLEET_REALTIME AS STRATAGIS_FLEET_REALTIME_1 LEFT OUTER JOIN
                                                                      dbo.Stratagis_Vehicle_View AS Stratagis_Vehicle_View_1 ON 
                                                                      STRATAGIS_FLEET_REALTIME_1.VehicleId = Stratagis_Vehicle_View_1.VehicleId
                                               WHERE      (STRATAGIS_FLEET_REALTIME_1.EventNumber = 32)) AS di RIGHT OUTER JOIN
                                                  (SELECT     STRATAGIS_FLEET_REALTIME_2.OBJECTID, STRATAGIS_FLEET_REALTIME_2.TimeStamp, STRATAGIS_FLEET_REALTIME_2.Validity, 
                                                                           STRATAGIS_FLEET_REALTIME_2.Speed, STRATAGIS_FLEET_REALTIME_2.Course, STRATAGIS_FLEET_REALTIME_2.Variation, 
                                                                           STRATAGIS_FLEET_REALTIME_2.EastWest, STRATAGIS_FLEET_REALTIME_2.DeviceId, STRATAGIS_FLEET_REALTIME_2.VehicleId, 
                                                                           STRATAGIS_FLEET_REALTIME_2.EventNumber, STRATAGIS_FLEET_REALTIME_2.VIN, STRATAGIS_FLEET_REALTIME_2.ODBProtocol, 
                                                                           STRATAGIS_FLEET_REALTIME_2.FirmWareVersion, STRATAGIS_FLEET_REALTIME_2.RSSI, STRATAGIS_FLEET_REALTIME_2.MILCount, 
                                                                           STRATAGIS_FLEET_REALTIME_2.MILCodes, STRATAGIS_FLEET_REALTIME_2.GpsOdometerMiles, 
                                                                           STRATAGIS_FLEET_REALTIME_2.OBDTripOdometerMiles, STRATAGIS_FLEET_REALTIME_2.VehicleSpeedMph, 
                                                                           STRATAGIS_FLEET_REALTIME_2.Rpms, STRATAGIS_FLEET_REALTIME_2.CoolantTempF, STRATAGIS_FLEET_REALTIME_2.GPSStatus, 
                                                                           STRATAGIS_FLEET_REALTIME_2.IdleTimeSec, STRATAGIS_FLEET_REALTIME_2.UserVar, STRATAGIS_FLEET_REALTIME_2.AccelerationX, 
                                                                           STRATAGIS_FLEET_REALTIME_2.AccelerationY, STRATAGIS_FLEET_REALTIME_2.AccelerationZ, 
                                                                           STRATAGIS_FLEET_REALTIME_2.ExcAccelTime, STRATAGIS_FLEET_REALTIME_2.ExcAccelLength, 
                                                                           STRATAGIS_FLEET_REALTIME_2.ExcAcceleration, STRATAGIS_FLEET_REALTIME_2.ExcDecelTime, 
                                                                           STRATAGIS_FLEET_REALTIME_2.ExcDecelLength, STRATAGIS_FLEET_REALTIME_2.ExcDeceleration, 
                                                                           STRATAGIS_FLEET_REALTIME_2.SHAPE, 
                                                                           STRATAGIS_FLEET_REALTIME_2.GpsOdometerMiles + dbo.Stratagis_Vehicle_View.OdometerAdj AS AdjOdometer, 
                                                                           dbo.Stratagis_Vehicle_View.Department
                                                    FROM          dbo.STRATAGIS_FLEET_REALTIME AS STRATAGIS_FLEET_REALTIME_2 LEFT OUTER JOIN
                                                                           dbo.Stratagis_Vehicle_View ON STRATAGIS_FLEET_REALTIME_2.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId
                                                    WHERE      (STRATAGIS_FLEET_REALTIME_2.EventNumber = 30) AND (STRATAGIS_FLEET_REALTIME_2.GpsOdometerMiles IS NOT NULL)) AS obd ON 
                                              di.VehicleId = obd.VehicleId AND di.DeviceId = obd.DeviceId AND di.EastWest = obd.EastWest
                       WHERE      (ABS(di.OBJECTID - obd.OBJECTID) <= 2) AND (ABS(DATEDIFF(second, di.TimeStamp, obd.TimeStamp)) <= 5)) AS diobd INNER JOIN
                          (SELECT     MAX(OBJECTID) AS OBJECTID, VehicleId
                            FROM          dbo.STRATAGIS_FLEET_REALTIME AS STRATAGIS_FLEET_REALTIME_3
                            WHERE      (EventNumber = 30)
                            GROUP BY VehicleId) AS mostrecent ON diobd.OBJECTID = mostrecent.OBJECTID INNER JOIN
                      dbo.Stratagis_Vehicle_View AS Stratagis_Vehicle_View_3 ON diobd.VehicleId = Stratagis_Vehicle_View_3.VehicleId LEFT OUTER JOIN
                          (SELECT     obda.OBJECTID, obda.TimeStamp, obda.Validity, obda.Speed, obda.Course, obda.Variation, obda.EastWest, obda.DeviceId, obda.VehicleId, 
                                                   obda.EventNumber, obda.VIN, obda.ODBProtocol, obda.FirmWareVersion, obda.OBDTripOdometerMiles, obda.GpsOdometerMiles, obda.MILCodes, 
                                                   obda.MILCount, obda.RSSI, obda.SHAPE, obda.AdjOdometer, obda.Department, acc.VehicleSpeedMph, acc.Rpms, acc.CoolantTempF, acc.GPSStatus, 
                                                   acc.IdleTimeSec, acc.UserVar, acc.AccelerationX, acc.AccelerationY, acc.AccelerationZ, acc.ExcAccelTime, acc.ExcAccelLength, acc.ExcAcceleration, 
                                                   acc.ExcDecelTime, acc.ExcDecelLength, acc.ExcDeceleration
                            FROM          (SELECT     OBJECTID, TimeStamp, Validity, Speed, Course, Variation, EastWest, DeviceId, VehicleId, EventNumber, VIN, ODBProtocol, FirmWareVersion, 
                                                                           RSSI, MILCount, MILCodes, GpsOdometerMiles, OBDTripOdometerMiles, VehicleSpeedMph, Rpms, CoolantTempF, GPSStatus, IdleTimeSec, 
                                                                           UserVar, AccelerationX, AccelerationY, AccelerationZ, ExcAccelTime, ExcAccelLength, ExcAcceleration, ExcDecelTime, ExcDecelLength, 
                                                                           ExcDeceleration, SHAPE
                                                    FROM          dbo.STRATAGIS_FLEET_REALTIME
                                                    WHERE      (EventNumber = 31)) AS acc INNER JOIN
                                                       (SELECT     STRATAGIS_FLEET_REALTIME_2.OBJECTID, STRATAGIS_FLEET_REALTIME_2.TimeStamp, STRATAGIS_FLEET_REALTIME_2.Validity, 
                                                                                STRATAGIS_FLEET_REALTIME_2.Speed, STRATAGIS_FLEET_REALTIME_2.Course, STRATAGIS_FLEET_REALTIME_2.Variation, 
                                                                                STRATAGIS_FLEET_REALTIME_2.EastWest, STRATAGIS_FLEET_REALTIME_2.DeviceId, STRATAGIS_FLEET_REALTIME_2.VehicleId, 
                                                                                STRATAGIS_FLEET_REALTIME_2.EventNumber, STRATAGIS_FLEET_REALTIME_2.VIN, STRATAGIS_FLEET_REALTIME_2.ODBProtocol, 
                                                                                STRATAGIS_FLEET_REALTIME_2.FirmWareVersion, STRATAGIS_FLEET_REALTIME_2.RSSI, STRATAGIS_FLEET_REALTIME_2.MILCount, 
                                                                                STRATAGIS_FLEET_REALTIME_2.MILCodes, STRATAGIS_FLEET_REALTIME_2.GpsOdometerMiles, 
                                                                                STRATAGIS_FLEET_REALTIME_2.OBDTripOdometerMiles, STRATAGIS_FLEET_REALTIME_2.VehicleSpeedMph, 
                                                                                STRATAGIS_FLEET_REALTIME_2.Rpms, STRATAGIS_FLEET_REALTIME_2.CoolantTempF, STRATAGIS_FLEET_REALTIME_2.GPSStatus, 
                                                                                STRATAGIS_FLEET_REALTIME_2.IdleTimeSec, STRATAGIS_FLEET_REALTIME_2.UserVar, STRATAGIS_FLEET_REALTIME_2.AccelerationX, 
                                                                                STRATAGIS_FLEET_REALTIME_2.AccelerationY, STRATAGIS_FLEET_REALTIME_2.AccelerationZ, 
                                                                                STRATAGIS_FLEET_REALTIME_2.ExcAccelTime, STRATAGIS_FLEET_REALTIME_2.ExcAccelLength, 
                                                                                STRATAGIS_FLEET_REALTIME_2.ExcAcceleration, STRATAGIS_FLEET_REALTIME_2.ExcDecelTime, 
                                                                                STRATAGIS_FLEET_REALTIME_2.ExcDecelLength, STRATAGIS_FLEET_REALTIME_2.ExcDeceleration, 
                                                                                STRATAGIS_FLEET_REALTIME_2.SHAPE, 
                                                                                STRATAGIS_FLEET_REALTIME_2.GpsOdometerMiles + Stratagis_Vehicle_View_2.OdometerAdj AS AdjOdometer, 
                                                                                Stratagis_Vehicle_View_2.Department
                                                         FROM          dbo.STRATAGIS_FLEET_REALTIME AS STRATAGIS_FLEET_REALTIME_2 LEFT OUTER JOIN
                                                                                dbo.Stratagis_Vehicle_View AS Stratagis_Vehicle_View_2 ON 
                                                                                STRATAGIS_FLEET_REALTIME_2.VehicleId = Stratagis_Vehicle_View_2.VehicleId
                                                         WHERE      (STRATAGIS_FLEET_REALTIME_2.EventNumber = 30) AND (STRATAGIS_FLEET_REALTIME_2.GpsOdometerMiles IS NOT NULL)) AS obda ON
                                                    acc.DeviceId = obda.DeviceId AND acc.EastWest = obda.EastWest AND acc.VehicleId = obda.VehicleId
                            WHERE      (ABS(acc.OBJECTID - obda.OBJECTID) <= 2) AND (ABS(DATEDIFF(second, acc.TimeStamp, obda.TimeStamp)) <= 5)) AS accobd ON 
                      diobd.VehicleId = accobd.VehicleId AND diobd.DeviceId = accobd.DeviceId AND diobd.OBJECTID = accobd.OBJECTID

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
         Begin Table = "diobd"
            Begin Extent = 
               Top = 10
               Left = 258
               Bottom = 297
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "mostrecent"
            Begin Extent = 
               Top = 182
               Left = 630
               Bottom = 271
               Right = 790
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "accobd"
            Begin Extent = 
               Top = 12
               Left = 609
               Bottom = 153
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Vehicle_View_3"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Realtime_View'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Realtime_View'
GO

