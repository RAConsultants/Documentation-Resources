USE [Troy]
GO

/****** Object:  View [dbo].[Stratagis_Historic_Current_View]    Script Date: 12/03/2014 15:05:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[Stratagis_Historic_Current_View]
AS
SELECT     dbo.Stratagis_Current_OBD.OBJECTID, dbo.Stratagis_Current_OBD.TimeStamp, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), 
                      dbo.Stratagis_Current_OBD.TimeStamp) AS LocalTimeStamp, YEAR(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), 
                      dbo.Stratagis_Current_OBD.TimeStamp)) AS DateYear, MONTH(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), dbo.Stratagis_Current_OBD.TimeStamp)) 
                      AS DateMonth, DAY(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), dbo.Stratagis_Current_OBD.TimeStamp)) AS DateDay, CONVERT(varchar, 
                      CONVERT(time, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), dbo.Stratagis_Current_OBD.TimeStamp)), 100) AS LocalTime, 
                      dbo.Stratagis_Current_OBD.Validity, dbo.Stratagis_Current_OBD.Speed, dbo.Stratagis_Current_OBD.Course, dbo.Stratagis_Current_OBD.Variation, 
                      dbo.Stratagis_Current_OBD.EastWest, dbo.Stratagis_Current_OBD.DeviceId, dbo.Stratagis_Current_OBD.VehicleId, dbo.Stratagis_Current_OBD.EventNumber, 
                      dbo.Stratagis_Current_OBD.VIN, dbo.Stratagis_Current_OBD.ODBProtocol, dbo.Stratagis_Current_OBD.FirmWareVersion, dbo.Stratagis_Current_OBD.RSSI, 
                      dbo.Stratagis_Current_OBD.MILCount, dbo.Stratagis_Current_OBD.MILCodes, dbo.Stratagis_Current_OBD.GpsOdometerMiles, 
                      dbo.Stratagis_Current_OBD.OBDTripOdometerMiles, dbo.Stratagis_Current_OBD.SHAPE, dbo.Stratagis_Current_OBD.AdjOdometer, 
                      dbo.Stratagis_Current_OBD.Department, dbo.Stratagis_Current_OBD_Acc.VehicleSpeedMph, dbo.Stratagis_Current_OBD_Acc.Rpms, 
                      dbo.Stratagis_Current_OBD_Acc.CoolantTempF, dbo.Stratagis_Current_OBD_Acc.GPSStatus, 
                      case when isnull(dbo.Stratagis_Current_OBD_Acc.IdleTimeSec,0) >= isnull(dbo.Stratagis_Current_OBD_DI.IdleTimeSec,0) then
						isnull(dbo.Stratagis_Current_OBD_Acc.IdleTimeSec,0)
						else isnull(dbo.Stratagis_Current_OBD_DI.IdleTimeSec,0)
						end as IdleTimeSec
                      , 
                      dbo.Stratagis_Current_OBD_Acc.UserVar, dbo.Stratagis_Current_OBD_Acc.AccelerationX, dbo.Stratagis_Current_OBD_Acc.AccelerationY, 
                      dbo.Stratagis_Current_OBD_Acc.AccelerationZ, dbo.Stratagis_Current_OBD_Acc.ExcAccelTime, dbo.Stratagis_Current_OBD_Acc.ExcAccelLength, 
                      dbo.Stratagis_Current_OBD_Acc.ExcAcceleration, dbo.Stratagis_Current_OBD_Acc.ExcDecelTime, dbo.Stratagis_Current_OBD_Acc.ExcDecelLength, 
                      dbo.Stratagis_Current_OBD_Acc.ExcDeceleration, dbo.Stratagis_Current_OBD_DI.DigitalInput, dbo.Stratagis_Current_OBD.UseDescription
FROM         dbo.Stratagis_Current_OBD LEFT OUTER JOIN
                      dbo.Stratagis_Current_OBD_DI ON dbo.Stratagis_Current_OBD.OBJECTID = dbo.Stratagis_Current_OBD_DI.OBJECTID LEFT OUTER JOIN
                      dbo.Stratagis_Current_OBD_Acc ON dbo.Stratagis_Current_OBD.OBJECTID = dbo.Stratagis_Current_OBD_Acc.OBJECTID


GO

