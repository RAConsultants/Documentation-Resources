USE [Troy]
GO

/****** Object:  Table [dbo].[STRATAGIS_FLEET_HISTORIC_Current]    Script Date: 11/12/2014 07:56:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STRATAGIS_FLEET_HISTORIC_Current](
	[OBJECTID] [int] NOT NULL,
	[TimeStamp] [datetime2](7) NULL,
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
	[DigitalInput] [nvarchar](50) NULL,
 CONSTRAINT [R8c_pk] PRIMARY KEY CLUSTERED 
(
	[OBJECTID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[STRATAGIS_FLEET_HISTORIC_Current]  WITH CHECK ADD  CONSTRAINT [g3c_ck] CHECK  (([SHAPE].[STSrid]=(3735)))
GO

ALTER TABLE [dbo].[STRATAGIS_FLEET_HISTORIC_Current] CHECK CONSTRAINT [g3c_ck]
GO

