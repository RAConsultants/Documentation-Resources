USE [Troy]
GO

/****** Object:  Table [dbo].[Stratagis_Historic_Mart]    Script Date: 11/12/2014 07:56:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Stratagis_Historic_Mart](
	[OBJECTID] [int] NULL,
	[TimeStamp] [datetime2](7) NULL,
	[LocalTimeStamp] [datetime2](7) NULL,
	[DateYear] [int] NULL,
	[DateMonth] [int] NULL,
	[DateDay] [int] NULL,
	[LocalTime] [varchar](30) NULL,
	[Validity] [nvarchar](50) NULL,
	[Speed] [numeric](38, 8) NULL,
	[Course] [numeric](38, 8) NULL,
	[Variation] [numeric](38, 8) NULL,
	[EastWest] [nvarchar](50) NULL,
	[DeviceId] [nvarchar](50) NULL,
	[VehicleId] [nvarchar](50) NULL,
	[EventNumber] [smallint] NULL,
	[VIN] [nvarchar](50) NULL,
	[ODBProtocol] [nvarchar](50) NULL,
	[FirmWareVersion] [nvarchar](50) NULL,
	[RSSI] [nvarchar](50) NULL,
	[MILCount] [nvarchar](50) NULL,
	[MILCodes] [nvarchar](50) NULL,
	[GpsOdometerMiles] [numeric](38, 8) NULL,
	[OBDTripOdometerMiles] [numeric](38, 8) NULL,
	[VehicleSpeedMph] [smallint] NULL,
	[Rpms] [smallint] NULL,
	[CoolantTempF] [smallint] NULL,
	[GPSStatus] [smallint] NULL,
	[IdleTimeSec] [smallint] NULL,
	[UserVar] [nvarchar](50) NULL,
	[AccelerationX] [numeric](38, 8) NULL,
	[AccelerationY] [numeric](38, 8) NULL,
	[AccelerationZ] [numeric](38, 8) NULL,
	[ExcAccelTime] [nvarchar](50) NULL,
	[ExcAccelLength] [numeric](38, 8) NULL,
	[ExcAcceleration] [numeric](38, 8) NULL,
	[ExcDecelTime] [nvarchar](50) NULL,
	[ExcDecelLength] [numeric](38, 8) NULL,
	[ExcDeceleration] [numeric](38, 8) NULL,
	[SHAPE] [geometry] NULL,
	[AdjOdometer] [numeric](38, 8) NULL,
	[Department] [nvarchar](50) NULL,
	[DigitalInput] [nvarchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

