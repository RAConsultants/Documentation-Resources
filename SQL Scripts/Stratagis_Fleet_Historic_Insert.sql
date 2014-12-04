USE [Troy]
GO

/****** Object:  Trigger [dbo].[STRATAGIS_FLEET_HISTORIC_insert]    Script Date: 11/12/2014 08:03:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[STRATAGIS_FLEET_HISTORIC_insert]
ON [dbo].[STRATAGIS_FLEET_HISTORIC]
FOR INSERT 
AS
INSERT INTO [dbo].[STRATAGIS_FLEET_HISTORIC_Current]
           ([OBJECTID]
           ,[TimeStamp]
           ,[Validity]
           ,[Speed]
           ,[Course]
           ,[Variation]
           ,[EastWest]
           ,[DeviceId]
           ,[VehicleId]
           ,[EventNumber]
           ,[VIN]
           ,[ODBProtocol]
           ,[FirmWareVersion]
           ,[RSSI]
           ,[MILCount]
           ,[MILCodes]
           ,[GpsOdometerMiles]
           ,[OBDTripOdometerMiles]
           ,[VehicleSpeedMph]
           ,[Rpms]
           ,[CoolantTempF]
           ,[GPSStatus]
           ,[IdleTimeSec]
           ,[UserVar]
           ,[AccelerationX]
           ,[AccelerationY]
           ,[AccelerationZ]
           ,[ExcAccelTime]
           ,[ExcAccelLength]
           ,[ExcAcceleration]
           ,[ExcDecelTime]
           ,[ExcDecelLength]
           ,[ExcDeceleration]
           ,[SHAPE]
           ,[DigitalInput])
     
SELECT [OBJECTID]
           ,[TimeStamp]
           ,[Validity]
           ,[Speed]
           ,[Course]
           ,[Variation]
           ,[EastWest]
           ,[DeviceId]
           ,[VehicleId]
           ,[EventNumber]
           ,[VIN]
           ,[ODBProtocol]
           ,[FirmWareVersion]
           ,[RSSI]
           ,[MILCount]
           ,[MILCodes]
           ,[GpsOdometerMiles]
           ,[OBDTripOdometerMiles]
           ,[VehicleSpeedMph]
           ,[Rpms]
           ,[CoolantTempF]
           ,[GPSStatus]
           ,[IdleTimeSec]
           ,[UserVar]
           ,[AccelerationX]
           ,[AccelerationY]
           ,[AccelerationZ]
           ,[ExcAccelTime]
           ,[ExcAccelLength]
           ,[ExcAcceleration]
           ,[ExcDecelTime]
           ,[ExcDecelLength]
           ,[ExcDeceleration]
           ,[SHAPE]
           ,[DigitalInput] FROM INSERTED;
GO
