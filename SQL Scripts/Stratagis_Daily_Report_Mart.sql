USE [Troy]
GO

/****** Object:  Table [dbo].[Stratagis_Daily_Report_Mart]    Script Date: 11/12/2014 07:56:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Stratagis_Daily_Report_Mart](
	[DayDate] [date] NULL,
	[Date] [datetime] NULL,
	[DateYear] [int] NULL,
	[DateMonth] [int] NULL,
	[DateWeek] [int] NULL,
	[DateDay] [int] NULL,
	[VehicleId] [nvarchar](50) NULL,
	[HoursRunning] [float] NULL,
	[HoursIdle] [float] NULL,
	[HoursOff] [float] NULL,
	[DIHours] [float] NULL,
	[TotalMiles] [numeric](38, 8) NULL,
	[AvgSpeed] [float] NULL,
	[MaxSpeed] [numeric](38, 8) NULL,
	[OnTime] [varchar](30) NULL,
	[OffTime] [varchar](30) NULL,
	[MILCodes] [nvarchar](max) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

