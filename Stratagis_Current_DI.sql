USE [Troy]
GO

/****** Object:  View [dbo].[Stratagis_Current_DI]    Script Date: 12/04/2014 07:45:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[Stratagis_Current_DI]
AS
SELECT     STRATAGIS_FLEET_HISTORIC_Current_1.OBJECTID, STRATAGIS_FLEET_HISTORIC_Current_1.TimeStamp, STRATAGIS_FLEET_HISTORIC_Current_1.Validity, 
                      STRATAGIS_FLEET_HISTORIC_Current_1.Speed, STRATAGIS_FLEET_HISTORIC_Current_1.Course, STRATAGIS_FLEET_HISTORIC_Current_1.Variation, 
                      STRATAGIS_FLEET_HISTORIC_Current_1.EastWest, STRATAGIS_FLEET_HISTORIC_Current_1.DeviceId, STRATAGIS_FLEET_HISTORIC_Current_1.VehicleId, 
                      STRATAGIS_FLEET_HISTORIC_Current_1.EventNumber, 
                      STRATAGIS_FLEET_HISTORIC_Current_1.GpsOdometerMiles + Stratagis_Vehicle_View_1.OdometerAdj AS AdjOdometer, Stratagis_Vehicle_View_1.Department, 
                      STRATAGIS_FLEET_HISTORIC_Current_1.DigitalInput, STRATAGIS_FLEET_HISTORIC_Current_1.GpsOdometerMiles, 
                      STRATAGIS_FLEET_HISTORIC_Current_1.GPSStatus, STRATAGIS_FLEET_HISTORIC_Current_1.IdleTimeSec
FROM         dbo.STRATAGIS_FLEET_HISTORIC_Current AS STRATAGIS_FLEET_HISTORIC_Current_1 INNER JOIN
                      dbo.Stratagis_Vehicle_View AS Stratagis_Vehicle_View_1 ON STRATAGIS_FLEET_HISTORIC_Current_1.VehicleId = Stratagis_Vehicle_View_1.VehicleId
WHERE     (STRATAGIS_FLEET_HISTORIC_Current_1.EventNumber = 32)

GO

