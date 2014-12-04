USE [Troy]
GO

/****** Object:  View [dbo].[Stratagis_Current_OBD]    Script Date: 12/04/2014 07:45:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[Stratagis_Current_OBD]
AS
SELECT     STRATAGIS_FLEET_HISTORIC_Current_2.OBJECTID, STRATAGIS_FLEET_HISTORIC_Current_2.TimeStamp, STRATAGIS_FLEET_HISTORIC_Current_2.Validity, 
                      STRATAGIS_FLEET_HISTORIC_Current_2.Speed, STRATAGIS_FLEET_HISTORIC_Current_2.Course, STRATAGIS_FLEET_HISTORIC_Current_2.Variation, 
                      STRATAGIS_FLEET_HISTORIC_Current_2.EastWest, STRATAGIS_FLEET_HISTORIC_Current_2.DeviceId, STRATAGIS_FLEET_HISTORIC_Current_2.VehicleId, 
                      STRATAGIS_FLEET_HISTORIC_Current_2.EventNumber, CASE WHEN STRATAGIS_FLEET_HISTORIC_Current_2.VIN IS NULL 
                      THEN dbo.Stratagis_Vehicle_View.VIN ELSE STRATAGIS_FLEET_HISTORIC_Current_2.VIN END AS VIN, STRATAGIS_FLEET_HISTORIC_Current_2.ODBProtocol, 
                      STRATAGIS_FLEET_HISTORIC_Current_2.FirmWareVersion, STRATAGIS_FLEET_HISTORIC_Current_2.RSSI, STRATAGIS_FLEET_HISTORIC_Current_2.MILCount, 
                      STRATAGIS_FLEET_HISTORIC_Current_2.MILCodes, STRATAGIS_FLEET_HISTORIC_Current_2.GpsOdometerMiles, 
                      STRATAGIS_FLEET_HISTORIC_Current_2.OBDTripOdometerMiles, STRATAGIS_FLEET_HISTORIC_Current_2.SHAPE, 
                      STRATAGIS_FLEET_HISTORIC_Current_2.GpsOdometerMiles + dbo.Stratagis_Vehicle_View.OdometerAdj AS AdjOdometer, dbo.Stratagis_Vehicle_View.Department, 
                      dbo.Stratagis_Vehicle_View.UseDescription
FROM         dbo.STRATAGIS_FLEET_HISTORIC_Current AS STRATAGIS_FLEET_HISTORIC_Current_2 INNER JOIN
                      dbo.Stratagis_Vehicle_View ON STRATAGIS_FLEET_HISTORIC_Current_2.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId
WHERE     (STRATAGIS_FLEET_HISTORIC_Current_2.EventNumber = 30) AND (STRATAGIS_FLEET_HISTORIC_Current_2.GpsOdometerMiles IS NOT NULL)

GO

