USE [Troy]
GO

/****** Object:  StoredProcedure [dbo].[StrataGIS_Mart_Proc]    Script Date: 11/13/2014 14:17:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Seidel, Aaron
-- Create date: 2014-09-05
-- Description:	Move Historic Data to DataMart Table
-- =============================================
CREATE PROCEDURE [dbo].[StrataGIS_Mart_Proc]
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DELETE FROM [Troy].[dbo].[STRATAGIS_FLEET_HISTORIC_Current]
      WHERE ABS(DATEDIFF(day, TimeStamp,  sysutcdatetime())) > 2;
	
	delete from [Troy].[dbo].[Stratagis_Historic_Mart];
	INSERT INTO [Troy].[dbo].[Stratagis_Historic_Mart]
           ([OBJECTID]
           ,[TimeStamp]
           ,[LocalTimeStamp]
           ,[DateYear]
           ,[DateMonth]
           ,[DateDay]
           ,[LocalTime]
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
           ,[AdjOdometer]
           ,[Department]
           ,[DigitalInput])
     SELECT [OBJECTID]
           ,[TimeStamp]
           ,[LocalTimeStamp]
           ,[DateYear]
           ,[DateMonth]
           ,[DateDay]
           ,[LocalTime]
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
           ,[AdjOdometer]
           ,[Department]
           ,[DigitalInput]
  FROM [Troy].[dbo].[Stratagis_Historic_Complete_View];




delete from Troy.dbo.Stratagis_Daily_Report_Mart;
   INSERT INTO [Troy].[dbo].[Stratagis_Daily_Report_Mart]
           ([DayDate]
           ,[Date]
           ,[DateYear]
           ,[DateMonth]
           ,[DateWeek]
           ,[DateDay]
           ,[VehicleId]
           ,[HoursRunning]
           ,[HoursIdle]
           ,[HoursOff]
           ,[DIHours]
           ,[TotalMiles]
           ,[AvgSpeed]
           ,[MaxSpeed]
           ,[OnTime]
           ,[OffTime]
           ,MILCodes)
     select [DayDate]
           ,[Date]
           ,[DateYear]
           ,[DateMonth]
           ,[DateWeek]
           ,[DateDay]
           ,[VehicleId]
           ,[HoursRunning]
           ,[HoursIdle]
           ,[HoursOff]
           ,[DIHours]
           ,[TotalMiles]
           ,[AvgSpeed]
           ,[MaxSpeed]
           ,[OnTime]
           ,[OffTime]
           ,MILCodes
        FROM [Troy].[dbo].[Stratagis_Mart_Daily_Report];
  
END



GO

