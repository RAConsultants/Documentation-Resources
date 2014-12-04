USE [Troy]
GO

/****** Object:  Table [dbo].[Stratagis_Vehicle_Info]    Script Date: 11/12/2014 07:56:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Stratagis_Vehicle_Info](
	[VehicleId] [nvarchar](50) NULL,
	[AdjOdometer] [numeric](38, 8) NULL,
	[Department] [nvarchar](150) NULL,
	[VIN] [nvarchar](150) NULL,
	[Year] [nvarchar](150) NULL,
	[Make] [nvarchar](150) NULL,
	[Model] [nvarchar](150) NULL,
	[UseDescription] [nvarchar](150) NULL,
	[MEID] [nvarchar](150) NULL,
	[PhoneNumber] [nvarchar](150) NULL
) ON [PRIMARY]

GO

