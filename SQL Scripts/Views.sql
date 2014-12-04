USE [Troy]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Stratagis_Date_View]
AS
SELECT CONVERT(date, LocalTimeStamp) AS DayDate, CONVERT(datetime, CONVERT(date, LocalTimeStamp)) AS Date, DateYear, DateMonth, DATEPART(wk, 
               LocalTimeStamp) AS DateWeek, DateDay
FROM  dbo.Stratagis_Historic_Mart
GROUP BY CONVERT(date, LocalTimeStamp), CONVERT(datetime, CONVERT(date, LocalTimeStamp)), DateYear, DateMonth, DATEPART(wk, LocalTimeStamp), DateDay

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


CREATE VIEW [dbo].[Stratagis_Historic_Complete_View]
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
                       FROM          (SELECT     STRATAGIS_FLEET_HISTORIC_1.OBJECTID, STRATAGIS_FLEET_HISTORIC_1.TimeStamp, STRATAGIS_FLEET_HISTORIC_1.Validity, 
                                                                      STRATAGIS_FLEET_HISTORIC_1.Speed, STRATAGIS_FLEET_HISTORIC_1.Course, STRATAGIS_FLEET_HISTORIC_1.Variation, 
                                                                      STRATAGIS_FLEET_HISTORIC_1.EastWest, STRATAGIS_FLEET_HISTORIC_1.DeviceId, STRATAGIS_FLEET_HISTORIC_1.VehicleId, 
                                                                      STRATAGIS_FLEET_HISTORIC_1.EventNumber, STRATAGIS_FLEET_HISTORIC_1.VIN, STRATAGIS_FLEET_HISTORIC_1.ODBProtocol, 
                                                                      STRATAGIS_FLEET_HISTORIC_1.FirmWareVersion, STRATAGIS_FLEET_HISTORIC_1.RSSI, STRATAGIS_FLEET_HISTORIC_1.MILCount, 
                                                                      STRATAGIS_FLEET_HISTORIC_1.MILCodes, STRATAGIS_FLEET_HISTORIC_1.GpsOdometerMiles, 
                                                                      STRATAGIS_FLEET_HISTORIC_1.OBDTripOdometerMiles, STRATAGIS_FLEET_HISTORIC_1.VehicleSpeedMph, 
                                                                      STRATAGIS_FLEET_HISTORIC_1.Rpms, STRATAGIS_FLEET_HISTORIC_1.CoolantTempF, STRATAGIS_FLEET_HISTORIC_1.GPSStatus, 
                                                                      STRATAGIS_FLEET_HISTORIC_1.IdleTimeSec, STRATAGIS_FLEET_HISTORIC_1.UserVar, STRATAGIS_FLEET_HISTORIC_1.AccelerationX, 
                                                                      STRATAGIS_FLEET_HISTORIC_1.AccelerationY, STRATAGIS_FLEET_HISTORIC_1.AccelerationZ, STRATAGIS_FLEET_HISTORIC_1.ExcAccelTime, 
                                                                      STRATAGIS_FLEET_HISTORIC_1.ExcAccelLength, STRATAGIS_FLEET_HISTORIC_1.ExcAcceleration, 
                                                                      STRATAGIS_FLEET_HISTORIC_1.ExcDecelTime, STRATAGIS_FLEET_HISTORIC_1.ExcDecelLength, 
                                                                      STRATAGIS_FLEET_HISTORIC_1.ExcDeceleration, STRATAGIS_FLEET_HISTORIC_1.SHAPE, 
                                                                      STRATAGIS_FLEET_HISTORIC_1.GpsOdometerMiles + Stratagis_Vehicle_View_1.OdometerAdj AS AdjOdometer, 
                                                                      Stratagis_Vehicle_View_1.Department, STRATAGIS_FLEET_HISTORIC_1.DigitalInput
                                               FROM          dbo.STRATAGIS_FLEET_HISTORIC AS STRATAGIS_FLEET_HISTORIC_1 LEFT OUTER JOIN
                                                                      dbo.Stratagis_Vehicle_View AS Stratagis_Vehicle_View_1 ON 
                                                                      STRATAGIS_FLEET_HISTORIC_1.VehicleId = Stratagis_Vehicle_View_1.VehicleId
                                               WHERE      (STRATAGIS_FLEET_HISTORIC_1.EventNumber = 32)) AS di RIGHT OUTER JOIN
                                                  (SELECT     STRATAGIS_FLEET_HISTORIC_2.OBJECTID, STRATAGIS_FLEET_HISTORIC_2.TimeStamp, STRATAGIS_FLEET_HISTORIC_2.Validity, 
                                                                           STRATAGIS_FLEET_HISTORIC_2.Speed, STRATAGIS_FLEET_HISTORIC_2.Course, STRATAGIS_FLEET_HISTORIC_2.Variation, 
                                                                           STRATAGIS_FLEET_HISTORIC_2.EastWest, STRATAGIS_FLEET_HISTORIC_2.DeviceId, STRATAGIS_FLEET_HISTORIC_2.VehicleId, 
                                                                           STRATAGIS_FLEET_HISTORIC_2.EventNumber, STRATAGIS_FLEET_HISTORIC_2.VIN, STRATAGIS_FLEET_HISTORIC_2.ODBProtocol, 
                                                                           STRATAGIS_FLEET_HISTORIC_2.FirmWareVersion, STRATAGIS_FLEET_HISTORIC_2.RSSI, STRATAGIS_FLEET_HISTORIC_2.MILCount, 
                                                                           STRATAGIS_FLEET_HISTORIC_2.MILCodes, STRATAGIS_FLEET_HISTORIC_2.GpsOdometerMiles, 
                                                                           STRATAGIS_FLEET_HISTORIC_2.OBDTripOdometerMiles, STRATAGIS_FLEET_HISTORIC_2.VehicleSpeedMph, 
                                                                           STRATAGIS_FLEET_HISTORIC_2.Rpms, STRATAGIS_FLEET_HISTORIC_2.CoolantTempF, STRATAGIS_FLEET_HISTORIC_2.GPSStatus, 
                                                                           STRATAGIS_FLEET_HISTORIC_2.IdleTimeSec, STRATAGIS_FLEET_HISTORIC_2.UserVar, STRATAGIS_FLEET_HISTORIC_2.AccelerationX, 
                                                                           STRATAGIS_FLEET_HISTORIC_2.AccelerationY, STRATAGIS_FLEET_HISTORIC_2.AccelerationZ, 
                                                                           STRATAGIS_FLEET_HISTORIC_2.ExcAccelTime, STRATAGIS_FLEET_HISTORIC_2.ExcAccelLength, 
                                                                           STRATAGIS_FLEET_HISTORIC_2.ExcAcceleration, STRATAGIS_FLEET_HISTORIC_2.ExcDecelTime, 
                                                                           STRATAGIS_FLEET_HISTORIC_2.ExcDecelLength, STRATAGIS_FLEET_HISTORIC_2.ExcDeceleration, 
                                                                           STRATAGIS_FLEET_HISTORIC_2.SHAPE, 
                                                                           STRATAGIS_FLEET_HISTORIC_2.GpsOdometerMiles + dbo.Stratagis_Vehicle_View.OdometerAdj AS AdjOdometer, 
                                                                           dbo.Stratagis_Vehicle_View.Department
                                                    FROM          dbo.STRATAGIS_FLEET_HISTORIC AS STRATAGIS_FLEET_HISTORIC_2 LEFT OUTER JOIN
                                                                           dbo.Stratagis_Vehicle_View ON STRATAGIS_FLEET_HISTORIC_2.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId
                                                    WHERE      (STRATAGIS_FLEET_HISTORIC_2.EventNumber = 30) AND (STRATAGIS_FLEET_HISTORIC_2.GpsOdometerMiles IS NOT NULL)) AS obd ON 
                                              di.VehicleId = obd.VehicleId AND di.DeviceId = obd.DeviceId AND di.EastWest = obd.EastWest
                       WHERE      (ABS(di.OBJECTID - obd.OBJECTID) <= 2) AND (ABS(DATEDIFF(second, di.TimeStamp, obd.TimeStamp)) <= 5)) AS diobd INNER JOIN
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
                                                    FROM          dbo.STRATAGIS_FLEET_HISTORIC
                                                    WHERE      (EventNumber = 31)) AS acc INNER JOIN
                                                       (SELECT     STRATAGIS_FLEET_HISTORIC_2.OBJECTID, STRATAGIS_FLEET_HISTORIC_2.TimeStamp, STRATAGIS_FLEET_HISTORIC_2.Validity, 
                                                                                STRATAGIS_FLEET_HISTORIC_2.Speed, STRATAGIS_FLEET_HISTORIC_2.Course, STRATAGIS_FLEET_HISTORIC_2.Variation, 
                                                                                STRATAGIS_FLEET_HISTORIC_2.EastWest, STRATAGIS_FLEET_HISTORIC_2.DeviceId, STRATAGIS_FLEET_HISTORIC_2.VehicleId, 
                                                                                STRATAGIS_FLEET_HISTORIC_2.EventNumber, STRATAGIS_FLEET_HISTORIC_2.VIN, STRATAGIS_FLEET_HISTORIC_2.ODBProtocol, 
                                                                                STRATAGIS_FLEET_HISTORIC_2.FirmWareVersion, STRATAGIS_FLEET_HISTORIC_2.RSSI, STRATAGIS_FLEET_HISTORIC_2.MILCount, 
                                                                                STRATAGIS_FLEET_HISTORIC_2.MILCodes, STRATAGIS_FLEET_HISTORIC_2.GpsOdometerMiles, 
                                                                                STRATAGIS_FLEET_HISTORIC_2.OBDTripOdometerMiles, STRATAGIS_FLEET_HISTORIC_2.VehicleSpeedMph, 
                                                                                STRATAGIS_FLEET_HISTORIC_2.Rpms, STRATAGIS_FLEET_HISTORIC_2.CoolantTempF, STRATAGIS_FLEET_HISTORIC_2.GPSStatus, 
                                                                                STRATAGIS_FLEET_HISTORIC_2.IdleTimeSec, STRATAGIS_FLEET_HISTORIC_2.UserVar, STRATAGIS_FLEET_HISTORIC_2.AccelerationX, 
                                                                                STRATAGIS_FLEET_HISTORIC_2.AccelerationY, STRATAGIS_FLEET_HISTORIC_2.AccelerationZ, 
                                                                                STRATAGIS_FLEET_HISTORIC_2.ExcAccelTime, STRATAGIS_FLEET_HISTORIC_2.ExcAccelLength, 
                                                                                STRATAGIS_FLEET_HISTORIC_2.ExcAcceleration, STRATAGIS_FLEET_HISTORIC_2.ExcDecelTime, 
                                                                                STRATAGIS_FLEET_HISTORIC_2.ExcDecelLength, STRATAGIS_FLEET_HISTORIC_2.ExcDeceleration, 
                                                                                STRATAGIS_FLEET_HISTORIC_2.SHAPE, 
                                                                                STRATAGIS_FLEET_HISTORIC_2.GpsOdometerMiles + Stratagis_Vehicle_View_2.OdometerAdj AS AdjOdometer, 
                                                                                Stratagis_Vehicle_View_2.Department
                                                         FROM          dbo.STRATAGIS_FLEET_HISTORIC AS STRATAGIS_FLEET_HISTORIC_2 LEFT OUTER JOIN
                                                                                dbo.Stratagis_Vehicle_View AS Stratagis_Vehicle_View_2 ON 
                                                                                STRATAGIS_FLEET_HISTORIC_2.VehicleId = Stratagis_Vehicle_View_2.VehicleId
                                                         WHERE      (STRATAGIS_FLEET_HISTORIC_2.EventNumber = 30) AND (STRATAGIS_FLEET_HISTORIC_2.GpsOdometerMiles IS NOT NULL)) AS obda ON 
                                                   acc.DeviceId = obda.DeviceId AND acc.EastWest = obda.EastWest AND acc.VehicleId = obda.VehicleId
                            WHERE      (ABS(acc.OBJECTID - obda.OBJECTID) <= 2) AND (ABS(DATEDIFF(second, acc.TimeStamp, obda.TimeStamp)) <= 5)) AS accobd ON 
                      diobd.VehicleId = accobd.VehicleId AND diobd.DeviceId = accobd.DeviceId AND diobd.OBJECTID = accobd.OBJECTID

GO




CREATE VIEW [dbo].[Stratagis_Historic_Current_View]
AS
SELECT     diobd.OBJECTID, diobd.TimeStamp, diobd.LocalTimeStamp, diobd.DateYear, diobd.DateMonth, diobd.DateDay, diobd.LocalTime, diobd.Validity, diobd.Speed, 
                      diobd.Course, diobd.Variation, diobd.EastWest, diobd.DeviceId, diobd.VehicleId, diobd.EventNumber, CASE WHEN diobd.VIN IS NULL 
                      THEN Stratagis_Vehicle_View_3.VIN ELSE diobd.VIN END AS VIN, diobd.ODBProtocol, diobd.FirmWareVersion, diobd.RSSI, diobd.MILCount, diobd.MILCodes, 
                      diobd.GpsOdometerMiles, diobd.OBDTripOdometerMiles, diobd.SHAPE, diobd.AdjOdometer, diobd.Department, diobd.DigitalInput, accobd.VehicleSpeedMph, 
                      accobd.Rpms, accobd.CoolantTempF, accobd.GPSStatus, accobd.IdleTimeSec, accobd.UserVar, accobd.AccelerationX, accobd.AccelerationY, accobd.AccelerationZ, 
                      accobd.ExcAccelTime, accobd.ExcAccelLength, accobd.ExcAcceleration, accobd.ExcDecelTime, accobd.ExcDecelLength, accobd.ExcDeceleration, 
                      Stratagis_Vehicle_View_3.Department AS Expr1, ISNULL(Stratagis_Vehicle_View_3.OdometerAdj, 0) + ISNULL(diobd.GpsOdometerMiles, 0) AS Expr3
FROM         (SELECT     obd.OBJECTID, obd.TimeStamp, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), obd.TimeStamp) AS LocalTimeStamp, YEAR(DATEADD(mi, 
                                              DATEDIFF(mi, sysutcdatetime(), sysdatetime()), obd.TimeStamp)) AS DateYear, MONTH(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), 
                                              obd.TimeStamp)) AS DateMonth, DAY(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), obd.TimeStamp)) AS DateDay, CONVERT(varchar, 
                                              CONVERT(time, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), obd.TimeStamp)), 100) AS LocalTime, obd.Validity, obd.Speed, obd.Course, 
                                              obd.Variation, obd.EastWest, obd.DeviceId, obd.VehicleId, obd.EventNumber, obd.VIN, obd.ODBProtocol, obd.FirmWareVersion, obd.RSSI, obd.MILCount, 
                                              obd.MILCodes, obd.GpsOdometerMiles, obd.OBDTripOdometerMiles, obd.SHAPE, obd.AdjOdometer, obd.Department, di.DigitalInput
                       FROM          (SELECT     STRATAGIS_FLEET_HISTORIC_Current_1.OBJECTID, STRATAGIS_FLEET_HISTORIC_Current_1.TimeStamp, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.Validity, STRATAGIS_FLEET_HISTORIC_Current_1.Speed, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.Course, STRATAGIS_FLEET_HISTORIC_Current_1.Variation, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.EastWest, STRATAGIS_FLEET_HISTORIC_Current_1.DeviceId, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.VehicleId, STRATAGIS_FLEET_HISTORIC_Current_1.EventNumber, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.VIN, STRATAGIS_FLEET_HISTORIC_Current_1.ODBProtocol, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.FirmWareVersion, STRATAGIS_FLEET_HISTORIC_Current_1.RSSI, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.MILCount, STRATAGIS_FLEET_HISTORIC_Current_1.MILCodes, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.GpsOdometerMiles, STRATAGIS_FLEET_HISTORIC_Current_1.OBDTripOdometerMiles, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.VehicleSpeedMph, STRATAGIS_FLEET_HISTORIC_Current_1.Rpms, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.CoolantTempF, STRATAGIS_FLEET_HISTORIC_Current_1.GPSStatus, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.IdleTimeSec, STRATAGIS_FLEET_HISTORIC_Current_1.UserVar, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.AccelerationX, STRATAGIS_FLEET_HISTORIC_Current_1.AccelerationY, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.AccelerationZ, STRATAGIS_FLEET_HISTORIC_Current_1.ExcAccelTime, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.ExcAccelLength, STRATAGIS_FLEET_HISTORIC_Current_1.ExcAcceleration, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.ExcDecelTime, STRATAGIS_FLEET_HISTORIC_Current_1.ExcDecelLength, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.ExcDeceleration, STRATAGIS_FLEET_HISTORIC_Current_1.SHAPE, 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.GpsOdometerMiles + Stratagis_Vehicle_View_1.OdometerAdj AS AdjOdometer, 
                                                                      Stratagis_Vehicle_View_1.Department, STRATAGIS_FLEET_HISTORIC_Current_1.DigitalInput
                                               FROM          dbo.STRATAGIS_FLEET_HISTORIC_Current AS STRATAGIS_FLEET_HISTORIC_Current_1 LEFT OUTER JOIN
                                                                      dbo.Stratagis_Vehicle_View AS Stratagis_Vehicle_View_1 ON 
                                                                      STRATAGIS_FLEET_HISTORIC_Current_1.VehicleId = Stratagis_Vehicle_View_1.VehicleId
                                               WHERE      (STRATAGIS_FLEET_HISTORIC_Current_1.EventNumber = 32)) AS di RIGHT OUTER JOIN
                                                  (SELECT     STRATAGIS_FLEET_HISTORIC_Current_2.OBJECTID, STRATAGIS_FLEET_HISTORIC_Current_2.TimeStamp, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.Validity, STRATAGIS_FLEET_HISTORIC_Current_2.Speed, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.Course, STRATAGIS_FLEET_HISTORIC_Current_2.Variation, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.EastWest, STRATAGIS_FLEET_HISTORIC_Current_2.DeviceId, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.VehicleId, STRATAGIS_FLEET_HISTORIC_Current_2.EventNumber, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.VIN, STRATAGIS_FLEET_HISTORIC_Current_2.ODBProtocol, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.FirmWareVersion, STRATAGIS_FLEET_HISTORIC_Current_2.RSSI, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.MILCount, STRATAGIS_FLEET_HISTORIC_Current_2.MILCodes, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.GpsOdometerMiles, STRATAGIS_FLEET_HISTORIC_Current_2.OBDTripOdometerMiles, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.VehicleSpeedMph, STRATAGIS_FLEET_HISTORIC_Current_2.Rpms, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.CoolantTempF, STRATAGIS_FLEET_HISTORIC_Current_2.GPSStatus, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.IdleTimeSec, STRATAGIS_FLEET_HISTORIC_Current_2.UserVar, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.AccelerationX, STRATAGIS_FLEET_HISTORIC_Current_2.AccelerationY, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.AccelerationZ, STRATAGIS_FLEET_HISTORIC_Current_2.ExcAccelTime, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.ExcAccelLength, STRATAGIS_FLEET_HISTORIC_Current_2.ExcAcceleration, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.ExcDecelTime, STRATAGIS_FLEET_HISTORIC_Current_2.ExcDecelLength, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.ExcDeceleration, STRATAGIS_FLEET_HISTORIC_Current_2.SHAPE, 
                                                                           STRATAGIS_FLEET_HISTORIC_Current_2.GpsOdometerMiles + dbo.Stratagis_Vehicle_View.OdometerAdj AS AdjOdometer, 
                                                                           dbo.Stratagis_Vehicle_View.Department
                                                    FROM          dbo.STRATAGIS_FLEET_HISTORIC_Current AS STRATAGIS_FLEET_HISTORIC_Current_2 LEFT OUTER JOIN
                                                                           dbo.Stratagis_Vehicle_View ON STRATAGIS_FLEET_HISTORIC_Current_2.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId
                                                    WHERE      (STRATAGIS_FLEET_HISTORIC_Current_2.EventNumber = 30) AND 
                                                                           (STRATAGIS_FLEET_HISTORIC_Current_2.GpsOdometerMiles IS NOT NULL)) AS obd ON di.VehicleId = obd.VehicleId AND 
                                              di.DeviceId = obd.DeviceId AND di.EastWest = obd.EastWest
                       WHERE      (ABS(di.OBJECTID - obd.OBJECTID) <= 2) AND (ABS(DATEDIFF(second, di.TimeStamp, obd.TimeStamp)) <= 5)) AS diobd INNER JOIN
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
                                                    FROM          dbo.STRATAGIS_FLEET_HISTORIC_Current
                                                    WHERE      (EventNumber = 31)) AS acc INNER JOIN
                                                       (SELECT     STRATAGIS_FLEET_HISTORIC_Current_2.OBJECTID, STRATAGIS_FLEET_HISTORIC_Current_2.TimeStamp, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.Validity, STRATAGIS_FLEET_HISTORIC_Current_2.Speed, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.Course, STRATAGIS_FLEET_HISTORIC_Current_2.Variation, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.EastWest, STRATAGIS_FLEET_HISTORIC_Current_2.DeviceId, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.VehicleId, STRATAGIS_FLEET_HISTORIC_Current_2.EventNumber, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.VIN, STRATAGIS_FLEET_HISTORIC_Current_2.ODBProtocol, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.FirmWareVersion, STRATAGIS_FLEET_HISTORIC_Current_2.RSSI, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.MILCount, STRATAGIS_FLEET_HISTORIC_Current_2.MILCodes, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.GpsOdometerMiles, STRATAGIS_FLEET_HISTORIC_Current_2.OBDTripOdometerMiles, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.VehicleSpeedMph, STRATAGIS_FLEET_HISTORIC_Current_2.Rpms, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.CoolantTempF, STRATAGIS_FLEET_HISTORIC_Current_2.GPSStatus, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.IdleTimeSec, STRATAGIS_FLEET_HISTORIC_Current_2.UserVar, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.AccelerationX, STRATAGIS_FLEET_HISTORIC_Current_2.AccelerationY, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.AccelerationZ, STRATAGIS_FLEET_HISTORIC_Current_2.ExcAccelTime, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.ExcAccelLength, STRATAGIS_FLEET_HISTORIC_Current_2.ExcAcceleration, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.ExcDecelTime, STRATAGIS_FLEET_HISTORIC_Current_2.ExcDecelLength, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.ExcDeceleration, STRATAGIS_FLEET_HISTORIC_Current_2.SHAPE, 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.GpsOdometerMiles + Stratagis_Vehicle_View_2.OdometerAdj AS AdjOdometer, 
                                                                                Stratagis_Vehicle_View_2.Department
                                                         FROM          dbo.STRATAGIS_FLEET_HISTORIC_Current AS STRATAGIS_FLEET_HISTORIC_Current_2 LEFT OUTER JOIN
                                                                                dbo.Stratagis_Vehicle_View AS Stratagis_Vehicle_View_2 ON 
                                                                                STRATAGIS_FLEET_HISTORIC_Current_2.VehicleId = Stratagis_Vehicle_View_2.VehicleId
                                                         WHERE      (STRATAGIS_FLEET_HISTORIC_Current_2.EventNumber = 30) AND 
                                                                                (STRATAGIS_FLEET_HISTORIC_Current_2.GpsOdometerMiles IS NOT NULL)) AS obda ON acc.DeviceId = obda.DeviceId AND 
                                                   acc.EastWest = obda.EastWest AND acc.VehicleId = obda.VehicleId
                            WHERE      (ABS(acc.OBJECTID - obda.OBJECTID) <= 2) AND (ABS(DATEDIFF(second, acc.TimeStamp, obda.TimeStamp)) <= 5)) AS accobd ON 
                      diobd.VehicleId = accobd.VehicleId AND diobd.DeviceId = accobd.DeviceId AND diobd.OBJECTID = accobd.OBJECTID

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
CREATE VIEW [dbo].[Stratagis_Mart_MIL_Codes]
AS
SELECT DISTINCT a.DateYear, a.DateMonth, a.DateDay, a.VehicleId, STUFF
                   ((SELECT N', ' + CAST(Replace(Replace(MILCodes, '#' + b.VehicleId + '#', ''), 'v', '') AS VarChar(150))
                     FROM   dbo.Stratagis_Historic_Mart b
                     WHERE b.MILCodes <> '' AND b.MILCodes IS NOT NULL AND b.DateYear = a.DateYear AND b.DateMonth = a.DateMonth AND b.DateDay = a.DateDay AND 
                                    a.VehicleId = b.VehicleId FOR XML PATH('')/*,TYPE*/ ), 1, 2, '') AS MILCodes
FROM  dbo.Stratagis_Historic_Mart a

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


CREATE VIEW [dbo].[Stratagis_Report_Daily]
AS
SELECT dbo.Stratagis_Daily_Report_Mart.*
FROM  dbo.Stratagis_Daily_Report_Mart

GO


CREATE VIEW [dbo].[Stratagis_Report_Monthly]
AS
SELECT a.DateYear, a.DateMonth, a.VehicleId, SUM(HoursRunning) AS HoursRunning, SUM(HoursIdle) AS HoursIdle, SUM(HoursOff) AS HoursOff, Sum(DIHours) 
               AS DIHours, SUM(TotalMiles) AS TotalMiles, round(SUM(TotalMiles) / SUM(HoursRunning), 2) AS AvgSpeed, max(a.MaxSpeed) AS MaxSpeed, 
               CONVERT(varchar, CONVERT(time, cast(avg(cast(CONVERT(datetime, OnTime) AS float)) AS datetime)), 100) AS OnTime, CONVERT(varchar, CONVERT(time, cast(avg(cast(CONVERT(datetime, OffTime) AS float)) AS datetime)), 
               100) AS OffTime, STUFF
                   ((SELECT N', ' + CAST(Replace(Replace(MILCodes, '#' + b.VehicleId + '#', ''), 'v', '') AS VarChar(150))
                     FROM   dbo.Stratagis_Daily_Report_Mart b
                     WHERE b.MILCodes <> '' AND b.MILCodes IS NOT NULL AND b.DateYear = a.DateYear AND b.DateMonth = a.DateMonth AND a.VehicleId = b.VehicleId FOR 
                                    XML PATH('')/*,TYPE*/ ), 1, 2, '') AS MILCodes
FROM  dbo.Stratagis_Daily_Report_Mart a
GROUP BY a.DateYear, a.DateMonth, a.VehicleId

GO


CREATE VIEW [dbo].[Stratagis_Report_Weekly]
AS
SELECT a.DateYear, a.DateMonth, a.DateWeek, a.VehicleId, SUM(HoursRunning) AS HoursRunning, SUM(HoursIdle) AS HoursIdle, SUM(HoursOff) AS HoursOff, 
               sum(ROUND(ISNULL(DIHours, 0), 2)) AS DIHours, SUM(TotalMiles) AS TotalMiles, round(SUM(TotalMiles) / SUM(HoursRunning), 2) AS AvgSpeed, 
               max(a.MaxSpeed) AS MaxSpeed, CONVERT(varchar, CONVERT(time, cast(avg(cast(CONVERT(datetime, OnTime) AS float)) AS datetime)), 100) 
               AS OnTime,  CONVERT(varchar, CONVERT(time, 
               cast(avg(cast(CONVERT(datetime, OffTime) AS float)) AS datetime)), 100) AS OffTime, STUFF
                   ((SELECT N', ' + CAST(Replace(Replace(MILCodes, '#' + b.VehicleId + '#', ''), 'v', '') AS VarChar(150))
                     FROM   dbo.Stratagis_Daily_Report_Mart b
                     WHERE b.MILCodes <> '' AND b.MILCodes IS NOT NULL AND b.DateYear = a.DateYear AND b.DateMonth = a.DateMonth AND b.DateWeek = a.DateWeek AND 
                                    a.VehicleId = b.VehicleId FOR XML PATH('')/*,TYPE*/ ), 1, 2, '') AS MILCodes
FROM  dbo.Stratagis_Daily_Report_Mart a

GROUP BY a.DateYear, a.DateMonth, a.DateWeek, a.VehicleId

GO

