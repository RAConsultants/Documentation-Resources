USE [Troy]
GO

/****** Object:  StoredProcedure [dbo].[Stratagis_Report_Trip_Mart_Proc]    Script Date: 12/03/2014 13:12:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Seidel, Aaron
-- Create date: 2014-09-05
-- Description:	Move Historic Data to DataMart Table
-- =============================================
CREATE PROCEDURE [dbo].[Stratagis_Report_Trip_Mart_Proc]
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DELETE FROM [Troy].[dbo].[Stratagis_Report_Trip_Mart]
      WHERE ABS(DATEDIFF(day, LocalDate,  sysdatetime())) <= 1;

INSERT INTO [Troy].[dbo].[Stratagis_Report_Trip_Mart]
           ([StartObjectId]
           ,[StopObjectId]
           ,[VehicleId]
           ,[DateYear]
           ,[DateMonth]
           ,[DateDay]
           ,[LocalDate]
           ,[StartLocalTime]
           ,[StopLocalTime]
           ,[TripDuration]
           ,[IdleTime]
           ,[TripMiles]
           ,[StopLength]
           ,[STX]
           ,[STY])
     select [StartObjectId]
           ,[StopObjectId]
           ,[VehicleId]
           ,[DateYear]
           ,[DateMonth]
           ,[DateDay]
           ,[LocalDate]
           ,[StartLocalTime]
           ,[StopLocalTime]
           ,[TripDuration]
           ,[IdleTime]
           ,[TripMiles]
           ,[StopLength]
           ,[STX]
           ,[STY]
       from [Troy].[dbo].[Stratagis_Report_Trip]
       WHERE ABS(DATEDIFF(day, LocalDate,  sysdatetime())) <= 1;
END




GO

