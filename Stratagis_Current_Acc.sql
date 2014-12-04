USE [Troy]
GO

/****** Object:  View [dbo].[Stratagis_Current_Acc]    Script Date: 12/04/2014 07:45:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[Stratagis_Current_Acc]
AS
SELECT     dbo.STRATAGIS_FLEET_HISTORIC_Current.OBJECTID, dbo.STRATAGIS_FLEET_HISTORIC_Current.TimeStamp, dbo.STRATAGIS_FLEET_HISTORIC_Current.Validity, 
                      dbo.STRATAGIS_FLEET_HISTORIC_Current.Speed, dbo.STRATAGIS_FLEET_HISTORIC_Current.Course, dbo.STRATAGIS_FLEET_HISTORIC_Current.Variation, 
                      dbo.STRATAGIS_FLEET_HISTORIC_Current.EastWest, dbo.STRATAGIS_FLEET_HISTORIC_Current.DeviceId, dbo.STRATAGIS_FLEET_HISTORIC_Current.VehicleId, 
                      dbo.STRATAGIS_FLEET_HISTORIC_Current.EventNumber, dbo.STRATAGIS_FLEET_HISTORIC_Current.VIN, dbo.STRATAGIS_FLEET_HISTORIC_Current.ODBProtocol, 
                      dbo.STRATAGIS_FLEET_HISTORIC_Current.FirmWareVersion, dbo.STRATAGIS_FLEET_HISTORIC_Current.RSSI, dbo.STRATAGIS_FLEET_HISTORIC_Current.MILCount, 
                      dbo.STRATAGIS_FLEET_HISTORIC_Current.MILCodes, dbo.STRATAGIS_FLEET_HISTORIC_Current.GpsOdometerMiles, dbo.STRATAGIS_FLEET_HISTORIC_Current.OBDTripOdometerMiles, 
                      dbo.STRATAGIS_FLEET_HISTORIC_Current.VehicleSpeedMph, dbo.STRATAGIS_FLEET_HISTORIC_Current.Rpms, dbo.STRATAGIS_FLEET_HISTORIC_Current.CoolantTempF, 
                      dbo.STRATAGIS_FLEET_HISTORIC_Current.GPSStatus, dbo.STRATAGIS_FLEET_HISTORIC_Current.IdleTimeSec, dbo.STRATAGIS_FLEET_HISTORIC_Current.UserVar, 
                      dbo.STRATAGIS_FLEET_HISTORIC_Current.AccelerationX, dbo.STRATAGIS_FLEET_HISTORIC_Current.AccelerationY, dbo.STRATAGIS_FLEET_HISTORIC_Current.AccelerationZ, 
                      dbo.STRATAGIS_FLEET_HISTORIC_Current.ExcAccelTime, dbo.STRATAGIS_FLEET_HISTORIC_Current.ExcAccelLength, dbo.STRATAGIS_FLEET_HISTORIC_Current.ExcAcceleration, 
                      dbo.STRATAGIS_FLEET_HISTORIC_Current.ExcDecelTime, dbo.STRATAGIS_FLEET_HISTORIC_Current.ExcDecelLength, dbo.STRATAGIS_FLEET_HISTORIC_Current.ExcDeceleration
FROM         dbo.STRATAGIS_FLEET_HISTORIC_Current INNER JOIN
                      dbo.Stratagis_Vehicle_View AS Stratagis_Vehicle_View_4 ON dbo.STRATAGIS_FLEET_HISTORIC_Current.VehicleId = Stratagis_Vehicle_View_4.VehicleId
WHERE     (dbo.STRATAGIS_FLEET_HISTORIC_Current.EventNumber = 31)



GO

