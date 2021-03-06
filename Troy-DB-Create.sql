USE [master]
GO
/****** Object:  Database [Troy]    Script Date: 12/03/2014 13:09:54 ******/
CREATE DATABASE [Troy] ON  PRIMARY 
( NAME = N'Troy', FILENAME = N'd:\Program Files\Microsoft SQL Server\MSSQL10.RAGIS\MSSQL\DATA\Troy.mdf' , SIZE = 56320KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Troy_log', FILENAME = N'd:\Program Files\Microsoft SQL Server\MSSQL10.RAGIS\MSSQL\DATA\Troy_log.ldf' , SIZE = 242688KB , MAXSIZE = 1048576KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Troy] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Troy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Troy] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Troy] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Troy] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Troy] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Troy] SET ARITHABORT OFF
GO
ALTER DATABASE [Troy] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Troy] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Troy] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Troy] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Troy] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Troy] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Troy] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Troy] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Troy] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Troy] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Troy] SET  DISABLE_BROKER
GO
ALTER DATABASE [Troy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Troy] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Troy] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Troy] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Troy] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Troy] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Troy] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Troy] SET  READ_WRITE
GO
ALTER DATABASE [Troy] SET RECOVERY FULL
GO
ALTER DATABASE [Troy] SET  MULTI_USER
GO
ALTER DATABASE [Troy] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Troy] SET DB_CHAINING OFF
GO
/****** Object:  Login [viweb]    Script Date: 12/03/2014 13:09:54 ******/
/* For security reasons the login is created disabled and with a random password. */
CREATE LOGIN [viweb] WITH PASSWORD=N'ÒôJW1%§(ß}QÅL.Z¡û´ó!MªoÕC¡W úO', DEFAULT_DATABASE=[Vehicle Inspections], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [viweb] DISABLE
GO
/****** Object:  Login [troyweb]    Script Date: 12/03/2014 13:09:54 ******/
/* For security reasons the login is created disabled and with a random password. */
CREATE LOGIN [troyweb] WITH PASSWORD=N'Í6á&#OáMBYpôE>%«"GAÂµýS~H^Þ', DEFAULT_DATABASE=[Troy], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [troyweb] DISABLE
GO
/****** Object:  Login [sd1web]    Script Date: 12/03/2014 13:09:54 ******/
/* For security reasons the login is created disabled and with a random password. */
CREATE LOGIN [sd1web] WITH PASSWORD=N'Z®Ðò4h¡Gæb#WuIMÈ¨Êà¨¾Í<vÖ¢¢@', DEFAULT_DATABASE=[SD1], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [sd1web] DISABLE
GO
/****** Object:  Login [ragis]    Script Date: 12/03/2014 13:09:54 ******/
/* For security reasons the login is created disabled and with a random password. */
CREATE LOGIN [ragis] WITH PASSWORD=N'AÃÆ³s8Ó´t×+ñL¶âtÌ×¢ZI|ûôÛQ+', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
EXEC sys.sp_addsrvrolemember @loginame = N'ragis', @rolename = N'sysadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'ragis', @rolename = N'securityadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'ragis', @rolename = N'serveradmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'ragis', @rolename = N'setupadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'ragis', @rolename = N'processadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'ragis', @rolename = N'diskadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'ragis', @rolename = N'dbcreator'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'ragis', @rolename = N'bulkadmin'
GO
ALTER LOGIN [ragis] DISABLE
GO
/****** Object:  Login [rac\tprice]    Script Date: 12/03/2014 13:09:54 ******/
CREATE LOGIN [rac\tprice] FROM WINDOWS WITH DEFAULT_DATABASE=[SWOW], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [rac\lrover]    Script Date: 12/03/2014 13:09:54 ******/
CREATE LOGIN [rac\lrover] FROM WINDOWS WITH DEFAULT_DATABASE=[Columbus], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [rac\dmetz]    Script Date: 12/03/2014 13:09:54 ******/
CREATE LOGIN [rac\dmetz] FROM WINDOWS WITH DEFAULT_DATABASE=[Columbus], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [RAC\aseidel]    Script Date: 12/03/2014 13:09:54 ******/
CREATE LOGIN [RAC\aseidel] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [RAC\administrator]    Script Date: 12/03/2014 13:09:54 ******/
CREATE LOGIN [RAC\administrator] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLAgent$RAGIS]    Script Date: 12/03/2014 13:09:54 ******/
CREATE LOGIN [NT SERVICE\SQLAgent$RAGIS] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\MSSQL$RAGIS]    Script Date: 12/03/2014 13:09:54 ******/
CREATE LOGIN [NT SERVICE\MSSQL$RAGIS] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 12/03/2014 13:09:54 ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [gepweb]    Script Date: 12/03/2014 13:09:54 ******/
/* For security reasons the login is created disabled and with a random password. */
CREATE LOGIN [gepweb] WITH PASSWORD=N'ç!­ûÆ+Øì©ÖÆuÎk¼JIj1ÇÑ3E', DEFAULT_DATABASE=[GEP], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [gepweb] DISABLE
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 12/03/2014 13:09:54 ******/
/* For security reasons the login is created disabled and with a random password. */
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N';×·ÂÒÖ]	ÿøDÄôeôY*¯Gðß', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 12/03/2014 13:09:54 ******/
/* For security reasons the login is created disabled and with a random password. */
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'.ÆølàWC©díýsC< ^.°¢ íÑ³rè', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
USE [Troy]
GO
/****** Object:  User [TroyWeb]    Script Date: 12/03/2014 13:09:54 ******/
CREATE USER [TroyWeb] FOR LOGIN [troyweb] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [RAC\administrator]    Script Date: 12/03/2014 13:09:54 ******/
CREATE USER [RAC\administrator] FOR LOGIN [RAC\administrator] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[SDE_state_lineages]    Script Date: 12/03/2014 13:09:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_state_lineages](
	[lineage_name] [bigint] NOT NULL,
	[lineage_id] [bigint] NOT NULL,
 CONSTRAINT [state_lineages_pk] PRIMARY KEY CLUSTERED 
(
	[lineage_name] ASC,
	[lineage_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [lineage_id_idx2] ON [dbo].[SDE_state_lineages] 
(
	[lineage_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SDE_spatial_references]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SDE_spatial_references](
	[srid] [int] NOT NULL,
	[description] [nvarchar](64) NULL,
	[auth_name] [nvarchar](255) NULL,
	[auth_srid] [int] NULL,
	[falsex] [float] NOT NULL,
	[falsey] [float] NOT NULL,
	[xyunits] [float] NOT NULL,
	[falsez] [float] NOT NULL,
	[zunits] [float] NOT NULL,
	[falsem] [float] NOT NULL,
	[munits] [float] NOT NULL,
	[xycluster_tol] [float] NULL,
	[zcluster_tol] [float] NULL,
	[mcluster_tol] [float] NULL,
	[object_flags] [int] NOT NULL,
	[srtext] [varchar](1024) NOT NULL,
 CONSTRAINT [spatial_ref_pk] PRIMARY KEY CLUSTERED 
(
	[srid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SDE_set_globals]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_set_globals] 
@current_state BIGINT,
@protected CHAR(1),
@is_default CHAR(1),
@edit_version_id INTEGER
AS SET NOCOUNT ON
BEGIN
  -- This is a private support procedure for SDE versioned views.
  -- 
  -- Context info contains: SDE,current state id,protected,is_default_version,edit_version_id;
  DECLARE @context_info VARCHAR(128)
  DECLARE @varbin_context_info VARBINARY(128)
  SET @context_info = 'SDE,' + CAST (@current_state AS VARCHAR(21)) + ',' +
    @protected + ',' + @is_default + ',' + CAST (@edit_version_id AS VARCHAR(10)) + ';'
  SET @varbin_context_info = CAST (@context_info AS VARBINARY(128) )
  SET CONTEXT_INFO @varbin_context_info
END
GO
/****** Object:  Table [dbo].[SDE_object_locks]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SDE_object_locks](
	[sde_id] [int] NOT NULL,
	[object_id] [int] NOT NULL,
	[object_type] [int] NOT NULL,
	[application_id] [int] NOT NULL,
	[autolock] [char](1) NOT NULL,
	[lock_type] [char](1) NOT NULL,
	[lock_time] [datetime] NOT NULL,
 CONSTRAINT [object_locks_pk] PRIMARY KEY CLUSTERED 
(
	[sde_id] ASC,
	[object_id] ASC,
	[object_type] ASC,
	[application_id] ASC,
	[autolock] ASC,
	[lock_type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SDE_server_config]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_server_config](
	[prop_name] [nvarchar](32) NOT NULL,
	[char_prop_value] [nvarchar](512) NULL,
	[num_prop_value] [int] NULL,
 CONSTRAINT [server_config_pk] PRIMARY KEY CLUSTERED 
(
	[prop_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SDE_state_locks]    Script Date: 12/03/2014 13:09:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SDE_state_locks](
	[sde_id] [int] NOT NULL,
	[state_id] [bigint] NOT NULL,
	[autolock] [char](1) NOT NULL,
	[lock_type] [char](1) NOT NULL,
	[lock_time] [datetime] NOT NULL,
 CONSTRAINT [state_locks_pk] PRIMARY KEY CLUSTERED 
(
	[sde_id] ASC,
	[state_id] ASC,
	[autolock] ASC,
	[lock_type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SDE_versions]    Script Date: 12/03/2014 13:09:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_versions](
	[name] [nvarchar](64) NOT NULL,
	[owner] [nvarchar](32) NOT NULL,
	[version_id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[state_id] [bigint] NOT NULL,
	[description] [nvarchar](64) NULL,
	[parent_name] [nvarchar](64) NULL,
	[parent_owner] [nvarchar](32) NULL,
	[parent_version_id] [int] NULL,
	[creation_time] [datetime] NOT NULL,
 CONSTRAINT [versions_pk] PRIMARY KEY CLUSTERED 
(
	[version_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY],
 CONSTRAINT [versions_uk] UNIQUE NONCLUSTERED 
(
	[name] ASC,
	[owner] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ver_state_ix] ON [dbo].[SDE_versions] 
(
	[state_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SDE_version]    Script Date: 12/03/2014 13:09:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_version](
	[MAJOR] [int] NOT NULL,
	[MINOR] [int] NOT NULL,
	[BUGFIX] [int] NOT NULL,
	[DESCRIPTION] [nvarchar](96) NOT NULL,
	[RELEASE] [int] NOT NULL,
	[SDESVR_REL_LOW] [int] NOT NULL,
 CONSTRAINT [version_pk] PRIMARY KEY CLUSTERED 
(
	[MAJOR] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SDE_tables_modified]    Script Date: 12/03/2014 13:09:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_tables_modified](
	[table_name] [sysname] NOT NULL,
	[time_last_modified] [datetime] NOT NULL,
 CONSTRAINT [tables_modified_pk] PRIMARY KEY CLUSTERED 
(
	[table_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SDE_table_registry]    Script Date: 12/03/2014 13:09:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_table_registry](
	[registration_id] [int] NOT NULL,
	[database_name] [nvarchar](32) NULL,
	[table_name] [sysname] NOT NULL,
	[owner] [nvarchar](32) NOT NULL,
	[rowid_column] [nvarchar](32) NULL,
	[description] [nvarchar](65) NULL,
	[object_flags] [int] NOT NULL,
	[registration_date] [int] NOT NULL,
	[config_keyword] [nvarchar](32) NULL,
	[minimum_id] [int] NULL,
	[imv_view_name] [nvarchar](128) NULL,
 CONSTRAINT [registry_pk] PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY],
 CONSTRAINT [registry_uk2] UNIQUE NONCLUSTERED 
(
	[table_name] ASC,
	[owner] ASC,
	[database_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SDE_table_locks]    Script Date: 12/03/2014 13:09:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SDE_table_locks](
	[sde_id] [int] NOT NULL,
	[registration_id] [int] NOT NULL,
	[lock_type] [char](1) NOT NULL,
	[lock_time] [datetime] NOT NULL,
 CONSTRAINT [table_locks_pk] PRIMARY KEY CLUSTERED 
(
	[sde_id] ASC,
	[registration_id] ASC,
	[lock_type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SDE_xml_indexes]    Script Date: 12/03/2014 13:09:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_xml_indexes](
	[index_id] [int] IDENTITY(1,1) NOT NULL,
	[index_name] [nvarchar](32) NOT NULL,
	[owner] [nvarchar](32) NOT NULL,
	[index_type] [int] NOT NULL,
	[description] [nvarchar](64) NULL,
 CONSTRAINT [xml_indexes_pk] PRIMARY KEY CLUSTERED 
(
	[index_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [xml_indexes_uk] ON [dbo].[SDE_xml_indexes] 
(
	[owner] ASC,
	[index_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stratagis_Vehicle_Info]    Script Date: 12/03/2014 13:09:59 ******/
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
/****** Object:  Table [dbo].[Stratagis_Report_Trip_Mart]    Script Date: 12/03/2014 13:09:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stratagis_Report_Trip_Mart](
	[StartObjectId] [int] NULL,
	[StopObjectId] [int] NULL,
	[VehicleId] [nvarchar](50) NULL,
	[DateYear] [int] NULL,
	[DateMonth] [int] NULL,
	[DateDay] [int] NULL,
	[LocalDate] [date] NULL,
	[StartLocalTime] [varchar](30) NULL,
	[StopLocalTime] [varchar](30) NULL,
	[TripDuration] [varchar](30) NULL,
	[IdleTime] [varchar](30) NULL,
	[TripMiles] [numeric](38, 8) NULL,
	[StopLength] [varchar](30) NULL,
	[STX] [float] NULL,
	[STY] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stratagis_Historic_Mart]    Script Date: 12/03/2014 13:09:59 ******/
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
/****** Object:  Table [dbo].[STRATAGIS_FLEET_REALTIME]    Script Date: 12/03/2014 13:09:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STRATAGIS_FLEET_REALTIME](
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
 CONSTRAINT [R7_pk] PRIMARY KEY CLUSTERED 
(
	[OBJECTID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE SPATIAL INDEX [S2_idx] ON [dbo].[STRATAGIS_FLEET_REALTIME] 
(
	[SHAPE]
)USING  GEOMETRY_GRID 
WITH (
BOUNDING_BOX =(-119670700, -95612900, 2954992284792.94, 2955016342592.94), GRIDS =(LEVEL_1 = MEDIUM,LEVEL_2 = MEDIUM,LEVEL_3 = MEDIUM,LEVEL_4 = MEDIUM), 
CELLS_PER_OBJECT = 16, PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stratagis_Daily_Report_Mart]    Script Date: 12/03/2014 13:09:59 ******/
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
/****** Object:  Table [dbo].[STRATAGIS_FLEET_HISTORIC_Current]    Script Date: 12/03/2014 13:09:59 ******/
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
/****** Object:  StoredProcedure [dbo].[geometry_columns]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[geometry_columns]
@owner NVARCHAR(128), @table NVARCHAR(128)
AS SET NOCOUNT ON
BEGIN
SELECT c.name column_name FROM sys.objects o INNER JOIN sys.columns c
  INNER JOIN sys.types t
  ON c.user_type_id = t.user_type_id AND c.user_type_id = t.user_type_id
  ON c.object_id = o.object_id 
  WHERE t.name in ('geometry','geography')
  AND c.object_id = OBJECT_ID(@owner + '.' + @table)
END
GO
/****** Object:  UserDefinedFunction [dbo].[geometry_column_type]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[geometry_column_type]
(@owner NVARCHAR(128), @table NVARCHAR(128), @column NVARCHAR(128))
RETURNS VARCHAR(128)
AS BEGIN
DECLARE @spatial_type VARCHAR(128)
SELECT @spatial_type = CAST (t.name AS VARCHAR(128)) 
  FROM sys.objects o INNER JOIN sys.columns c INNER JOIN sys.types t
  ON c.user_type_id = t.user_type_id AND c.user_type_id = t.user_type_id 
  ON c.object_id = o.object_id 
  WHERE c.object_id = OBJECT_ID(@owner + '.' + @table) AND c.name = @column

if (@spatial_type != 'geometry' AND @spatial_type != 'geography')
  set @spatial_type = NULL

RETURN @spatial_type
END
GO
/****** Object:  StoredProcedure [dbo].[gdb_util_release]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[gdb_util_release] AS SELECT 3
GO
/****** Object:  Table [dbo].[GDB_TABLES_LAST_MODIFIED]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDB_TABLES_LAST_MODIFIED](
	[table_name] [nvarchar](160) NOT NULL,
	[last_modified_count] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [GDB_LMODIFIED_IX1] ON [dbo].[GDB_TABLES_LAST_MODIFIED] 
(
	[table_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[i2]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[i2](
	[id_type] [int] NOT NULL,
	[base_id] [int] NOT NULL,
	[num_ids] [int] NOT NULL,
	[last_id] [int] NULL,
 CONSTRAINT [i2_pk] PRIMARY KEY CLUSTERED 
(
	[id_type] ASC,
	[num_ids] ASC,
	[base_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[i3]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[i3](
	[id_type] [int] NOT NULL,
	[base_id] [int] NOT NULL,
	[num_ids] [int] NOT NULL,
	[last_id] [int] NULL,
 CONSTRAINT [i3_pk] PRIMARY KEY CLUSTERED 
(
	[id_type] ASC,
	[num_ids] ASC,
	[base_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[check_mv_release]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[check_mv_release] () RETURNS VARCHAR(20)
BEGIN
  RETURN 'DEFAULT 1.0'
END
GO
/****** Object:  Table [dbo].[i4]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[i4](
	[id_type] [int] NOT NULL,
	[base_id] [int] NOT NULL,
	[num_ids] [int] NOT NULL,
	[last_id] [int] NULL,
 CONSTRAINT [i4_pk] PRIMARY KEY CLUSTERED 
(
	[id_type] ASC,
	[num_ids] ASC,
	[base_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[i5]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[i5](
	[id_type] [int] NOT NULL,
	[base_id] [int] NOT NULL,
	[num_ids] [int] NOT NULL,
	[last_id] [int] NULL,
 CONSTRAINT [i5_pk] PRIMARY KEY CLUSTERED 
(
	[id_type] ASC,
	[num_ids] ASC,
	[base_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[i6]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[i6](
	[id_type] [int] NOT NULL,
	[base_id] [int] NOT NULL,
	[num_ids] [int] NOT NULL,
	[last_id] [int] NULL,
 CONSTRAINT [i6_pk] PRIMARY KEY CLUSTERED 
(
	[id_type] ASC,
	[num_ids] ASC,
	[base_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[i7]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[i7](
	[id_type] [int] NOT NULL,
	[base_id] [int] NOT NULL,
	[num_ids] [int] NOT NULL,
	[last_id] [int] NULL,
 CONSTRAINT [i7_pk] PRIMARY KEY CLUSTERED 
(
	[id_type] ASC,
	[num_ids] ASC,
	[base_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SDE_keyset_remove]    Script Date: 12/03/2014 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_keyset_remove]
@tableNameVal sysname
AS
BEGIN
BEGIN TRAN keyset_tran
DECLARE @sql AS NVARCHAR(256)
SET @sql = N'DROP TABLE dbo.' + @tableNameVal
EXECUTE (@sql)
COMMIT TRAN keyset_tran
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_keyset_delete]    Script Date: 12/03/2014 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_keyset_delete]
@tableNameVal sysname,
@keysetIdVal INTEGER
AS
BEGIN
BEGIN TRAN keyset_tran
DECLARE @sql AS NVARCHAR(256)
SET @sql = N'DELETE FROM dbo.' + @tableNameVal + N'WHERE KEYSET_ID = ' + @keysetIdVal
EXECUTE (@sql)
COMMIT TRAN keyset_tran
END
GO
/****** Object:  UserDefinedFunction [dbo].[SDE_is_user_sde_dba]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SDE_is_user_sde_dba] () RETURNS INTEGER
BEGIN
  --This is a private support function for SDE versioned views.
  DECLARE @user  NVARCHAR (128)
  DECLARE @is_dba INTEGER

  SELECT @user = user_name()
  IF ((@user <> 'dbo') AND (IS_SRVROLEMEMBER ('sysadmin') <> 1)) 
  BEGIN
    IF (IS_MEMBER('db_owner') <> 1) 
      SET @is_dba = 0 -- is not dba
    ELSE
      SET @is_dba = 1 -- is dba
  END
  ELSE
    SET @is_dba = 1 -- is dba

  RETURN @is_dba
END
GO
/****** Object:  Table [dbo].[SDE_GEOMETRY3]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SDE_GEOMETRY3](
	[GEOMETRY_ID] [int] NOT NULL,
	[CAD] [varbinary](max) NULL,
 CONSTRAINT [geom3_idx] PRIMARY KEY CLUSTERED 
(
	[GEOMETRY_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SDE_GEOMETRY2]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SDE_GEOMETRY2](
	[GEOMETRY_ID] [int] NOT NULL,
	[CAD] [varbinary](max) NULL,
 CONSTRAINT [geom2_idx] PRIMARY KEY CLUSTERED 
(
	[GEOMETRY_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SDE_GEOMETRY1]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SDE_GEOMETRY1](
	[GEOMETRY_ID] [int] NOT NULL,
	[CAD] [varbinary](max) NULL,
 CONSTRAINT [geom1_idx] PRIMARY KEY CLUSTERED 
(
	[GEOMETRY_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SDE_dbtune]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_dbtune](
	[keyword] [nvarchar](32) NOT NULL,
	[parameter_name] [nvarchar](32) NOT NULL,
	[config_string] [nvarchar](2048) NULL,
 CONSTRAINT [dbtune_pk] PRIMARY KEY CLUSTERED 
(
	[keyword] ASC,
	[parameter_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SDE_generate_guid]    Script Date: 12/03/2014 13:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SDE_generate_guid] AS 
 SELECT '{' + CONVERT(NVARCHAR(36),newid()) + '}' as guidstr
GO
/****** Object:  StoredProcedure [dbo].[get_filtered_table_names]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_filtered_table_names]
AS SET NOCOUNT ON
BEGIN
SELECT SCHEMA_NAME(o.schema_id) + '.' + o.name
FROM sys.objects o
WHERE o.type IN ('U','V') AND 
  (has_perms_by_name (SCHEMA_NAME(o.schema_id) + '.' + o.name,'OBJECT','SELECT') = 1)
  AND o.name NOT LIKE 'GDB_%%'
  AND o.name NOT LIKE 'f[1-9]%%'
  AND o.name NOT LIKE 's[1-9]%%'
  AND o.name NOT LIKE 'a[1-9]%%'
  AND o.name NOT LIKE 'd[1-9]%%'
  AND o.name NOT LIKE 'i[1-9]%%'
  AND o.name NOT LIKE 'sde_%%'
  AND o.name NOT LIKE '%%_H'
  AND o.name NOT LIKE 'ST_%%'
  AND o.name != 'dbtune'
END
GO
/****** Object:  Table [dbo].[i8]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[i8](
	[id_type] [int] NOT NULL,
	[base_id] [int] NOT NULL,
	[num_ids] [int] NOT NULL,
	[last_id] [int] NULL,
 CONSTRAINT [i8_pk] PRIMARY KEY CLUSTERED 
(
	[id_type] ASC,
	[num_ids] ASC,
	[base_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[next_globalid]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[next_globalid]
@guid NVARCHAR(38) OUTPUT
AS SET NOCOUNT ON
BEGIN
SELECT @guid =  '{' + CAST (NEWID() AS NVARCHAR(38)) + '}'
END
GO
/****** Object:  StoredProcedure [dbo].[isGeoDatabase]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[isGeoDatabase]
@isgdb VARCHAR(5) OUTPUT
AS SET NOCOUNT ON
BEGIN
DECLARE @intval INT
-- check if current database is a gdb
SELECT @intval = 1 FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'GDB_TABLES_LAST_MODIFIED' AND TABLE_SCHEMA IN ('sde','dbo')
IF @@ROWCOUNT = 0
BEGIN
  BEGIN TRY
    -- check if this database is part of a multi-db sde database. We need to wrap
    -- this statement in an execute block, since try/catch does not catch name
    -- resolution errors.
    DECLARE @count int
    DECLARE @sql NVARCHAR(256)
    SET @sql = N'SELECT @intval = count(*) FROM sde.sde.SDE_table_registry
                 WHERE database_name = ''' +  DB_NAME() + N''''
    EXECUTE sp_executesql @sql, N'@intval integer output', @intval = @count output
    IF @count > 0
      SET @isgdb = 'TRUE'
    ELSE
      SET @isgdb = 'FALSE'
  END TRY
  BEGIN CATCH
    -- sde database doesn't exist or we don't have login permission
    SET @isgdb = 'FALSE'
  END CATCH
END
ELSE
  SET @isgdb = 'TRUE'
END
GO
/****** Object:  UserDefinedFunction [dbo].[OhioSouthLon]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[OhioSouthLon]  (@N float,@E float)
RETURNS float(53)
AS
BEGIN
   DECLARE @N0 float(53); --False Northing: Northing value at the true projection origin "B0"
   DECLARE @E0 float(53); --False Easting: Easting value at the origin "L0"
   DECLARE @L0 float(53); --Longitude of the true and grid origin, the "central meridian"
   DECLARE @R0 float(53); --Mapping radius at "B0"
   DECLARE @B0 float(53); --Lattitude of the true projection origin, the "central parallel"
   DECLARE @sinB0 float(53);
   DECLARE @G1 float(53);
   DECLARE @G2 float(53);
   DECLARE @G3 float(53);
   DECLARE @G4 float(53);
   DECLARE @Np float(53);
   DECLARE @Ep float(53);
   DECLARE @Rp float(53);
   DECLARE @gamma float(53); --convergence angle
   DECLARE @lambda float(53); --longitude
   DECLARE @u float(53); 
   DECLARE @phi float(53); --latitude
   DECLARE @deltaphi float(53); 
   
   SET @B0= 39.38435855118;
   SET @sinB0= 0.634519536788;
   SET @N0= 153682.0906;
   SET @E0= 600000.0;
   SET @R0= 7779186.9467;
   SET @G1= 9.007734087*power(10,-6);
   SET @G2= -6.99281*power(10,-15);
   SET @G3= -3.70945*power(10,-20);
   SET @G4= -1.0564*power(10,-27);
   
   
   SET @Np = @N - @N0;
   SET @Ep = @E - @E0;
   SET @Rp = @R0 - @Np;
   SET @gamma = atan(@Ep/@Rp);
   SET @lambda = @L0 - @gamma/@sinB0;
   SET @u = @Np - @Ep*tan(@gamma/2);
   SET @deltaphi = @u * (@G1 + @u * (@G2 + @u * (@G3 + @u * @G4)));
   SET @phi = @B0 + @deltaphi;

   RETURN(@lambda)
END
GO
/****** Object:  Table [dbo].[SDE_process_information]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SDE_process_information](
	[sde_id] [int] NOT NULL,
	[spid] [int] NOT NULL,
	[server_id] [int] NOT NULL,
	[start_time] [datetime] NOT NULL,
	[rcount] [int] NOT NULL,
	[wcount] [int] NOT NULL,
	[opcount] [int] NOT NULL,
	[numlocks] [int] NOT NULL,
	[fb_partial] [int] NOT NULL,
	[fb_count] [int] NOT NULL,
	[fb_fcount] [int] NOT NULL,
	[fb_kbytes] [int] NOT NULL,
	[owner] [nvarchar](30) NOT NULL,
	[direct_connect] [varchar](1) NOT NULL,
	[sysname] [nvarchar](32) NOT NULL,
	[nodename] [nvarchar](256) NOT NULL,
	[xdr_needed] [varchar](1) NOT NULL,
	[table_name] [nvarchar](95) NOT NULL,
 CONSTRAINT [process_pk] PRIMARY KEY CLUSTERED 
(
	[sde_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SDE_object_ids]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SDE_object_ids](
	[id_type] [int] NOT NULL,
	[base_id] [bigint] NOT NULL,
	[object_type] [varchar](30) NOT NULL,
 CONSTRAINT [object_ids_pk] PRIMARY KEY CLUSTERED 
(
	[id_type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SDE_get_current_user_name]    Script Date: 12/03/2014 13:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_get_current_user_name]
@current_user NVARCHAR (128) OUTPUT AS SET NOCOUNT ON
BEGIN
 DECLARE @delimiter INTEGER
 DECLARE @owner NVARCHAR(128)
 -- Get current user name. Format the user name as quoted identifier
 -- if the current user name does not comply with the rules for the format of
 -- regular identifiers

 SET @current_user = user_name()
 SET @delimiter = charindex('~', @current_user)
 IF @delimiter = 0
   SET @delimiter = charindex ('.', @current_user)
 IF @delimiter = 0
   SET @delimiter = charindex ('%', @current_user)
 IF @delimiter = 0
   SET @delimiter = charindex ('^', @current_user)
 IF @delimiter = 0
   SET @delimiter = charindex ('(', @current_user)
 IF @delimiter = 0
   SET @delimiter = charindex (')', @current_user)
 IF @delimiter = 0
   SET @delimiter = charindex ('-', @current_user)
 IF @delimiter = 0
   SET @delimiter = charindex ('{', @current_user)
 IF @delimiter = 0
   SET @delimiter = charindex ('}', @current_user)
 IF @delimiter = 0
   SET @delimiter = charindex (' ', @current_user)
 IF @delimiter = 0
   SET @delimiter = charindex ('\', @current_user)
 IF  @delimiter <> 0
 BEGIN
   SET  @current_user = N'"' + user_name() + N'"'
 END
 -- This stored prcedure will return current user name in upper case format 
 -- if the database is case insenstive. In order to know if the database is case
 -- sensitive, here to compare the @current_user to the same string but in upper 
 -- case. If they are equal, then the database is case insenstive and uppercase 
 -- format of current user name will be returned. 
 SET  @owner = UPPER(@current_user)
 IF  @current_user = @owner 
   SET  @current_user = @owner
END
GO
/****** Object:  Table [dbo].[SDE_layer_locks]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SDE_layer_locks](
	[sde_id] [int] NOT NULL,
	[layer_id] [int] NOT NULL,
	[autolock] [char](1) NOT NULL,
	[lock_type] [char](1) NOT NULL,
	[lock_time] [datetime] NOT NULL,
	[minx] [bigint] NULL,
	[miny] [bigint] NULL,
	[maxx] [bigint] NULL,
	[maxy] [bigint] NULL,
 CONSTRAINT [layer_locks_pk] PRIMARY KEY CLUSTERED 
(
	[sde_id] ASC,
	[layer_id] ASC,
	[autolock] ASC,
	[lock_type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SDE_lineages_modified]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_lineages_modified](
	[lineage_name] [bigint] NOT NULL,
	[time_last_modified] [datetime] NOT NULL,
 CONSTRAINT [lineages_mod_pk] PRIMARY KEY CLUSTERED 
(
	[lineage_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SDE_metadata]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_metadata](
	[record_id] [int] NOT NULL,
	[object_database] [nvarchar](32) NULL,
	[object_name] [nvarchar](160) NOT NULL,
	[object_owner] [nvarchar](32) NOT NULL,
	[object_type] [int] NOT NULL,
	[class_name] [nvarchar](32) NULL,
	[property] [nvarchar](32) NULL,
	[prop_value] [nvarchar](255) NULL,
	[description] [nvarchar](65) NULL,
	[creation_date] [datetime] NOT NULL,
 CONSTRAINT [sdemetadata_pk] PRIMARY KEY CLUSTERED 
(
	[record_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SDE_logfile_pool]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_logfile_pool](
	[table_id] [int] NOT NULL,
	[sde_id] [int] NULL,
 CONSTRAINT [logfile_pool_pk] PRIMARY KEY CLUSTERED 
(
	[table_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SDE_locators]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_locators](
	[locator_id] [int] NOT NULL,
	[name] [nvarchar](32) NOT NULL,
	[owner] [nvarchar](32) NOT NULL,
	[category] [nvarchar](32) NOT NULL,
	[type] [int] NOT NULL,
	[description] [nvarchar](64) NULL,
 CONSTRAINT [sdelocators_pk] PRIMARY KEY CLUSTERED 
(
	[locator_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY],
 CONSTRAINT [sdelocators_uk] UNIQUE NONCLUSTERED 
(
	[name] ASC,
	[owner] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SDE_layers]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_layers](
	[layer_id] [int] NOT NULL,
	[description] [nvarchar](65) NULL,
	[database_name] [nvarchar](32) NOT NULL,
	[table_name] [sysname] NOT NULL,
	[owner] [nvarchar](32) NOT NULL,
	[spatial_column] [nvarchar](32) NOT NULL,
	[eflags] [int] NOT NULL,
	[layer_mask] [int] NOT NULL,
	[gsize1] [float] NOT NULL,
	[gsize2] [float] NOT NULL,
	[gsize3] [float] NOT NULL,
	[minx] [float] NOT NULL,
	[miny] [float] NOT NULL,
	[maxx] [float] NOT NULL,
	[maxy] [float] NOT NULL,
	[minz] [float] NULL,
	[maxz] [float] NULL,
	[minm] [float] NULL,
	[maxm] [float] NULL,
	[cdate] [int] NOT NULL,
	[layer_config] [nvarchar](32) NULL,
	[optimal_array_size] [int] NULL,
	[stats_date] [int] NULL,
	[minimum_id] [int] NULL,
	[srid] [int] NOT NULL,
	[base_layer_id] [int] NOT NULL,
	[secondary_srid] [int] NULL,
 CONSTRAINT [layers_pk] PRIMARY KEY CLUSTERED 
(
	[database_name] ASC,
	[table_name] ASC,
	[owner] ASC,
	[spatial_column] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY],
 CONSTRAINT [layers_uk] UNIQUE NONCLUSTERED 
(
	[layer_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SDE_locator_def_update]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_locator_def_update] @locator_idVal INTEGER,      @categoryVal NVARCHAR(32), @typeVal INTEGER, @descriptionVal NVARCHAR(64),      @nameVal NVARCHAR(32) AS SET NOCOUNT ON      UPDATE Troy.dbo.SDE_locators SET name = @nameVal, category = @categoryVal,type = @typeVal,      description = @descriptionVal WHERE locator_id = @locator_idVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_locator_def_insert]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_locator_def_insert]       @locator_idVal INTEGER,@categoryVal NVARCHAR(32),@typeVal INTEGER,       @descriptionVal NVARCHAR(64), @nameVal NVARCHAR(32),       @ownerVal NVARCHAR(32) AS SET NOCOUNT ON INSERT INTO Troy.dbo.SDE_locators      (locator_id,category,type,description,name,owner) VALUES (      @locator_idVal,@categoryVal,@typeVal,@descriptionVal,@nameVal,@ownerVal)
GO
/****** Object:  StoredProcedure [dbo].[SDE_locator_def_delete]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_locator_def_delete] @id1        INTEGER AS SET NOCOUNT ON DELETE FROM Troy.dbo.SDE_locators WHERE locator_id = @id1
GO
/****** Object:  StoredProcedure [dbo].[SDE_logfile_pool_release_id]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_logfile_pool_release_id]
@tableIdVal INTEGER
AS SET NOCOUNT ON
BEGIN TRAN logfile_tran
  UPDATE Troy.dbo.SDE_logfile_pool SET sde_id = NULL
    WHERE table_id = @tableIdVal
COMMIT TRAN logfile_tran
GO
/****** Object:  StoredProcedure [dbo].[SDE_logfile_pool_get_id]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_logfile_pool_get_id]
@sdeIdVal INTEGER,
@checkOrphansVal INTEGER,
@useTruncateVal INTEGER
AS
BEGIN TRAN logfile_tran
DECLARE @table_id INTEGER
SET @table_id = 0
SELECT TOP 1 @table_id = table_id
  FROM Troy.dbo.SDE_logfile_pool WITH (TABLOCKX, HOLDLOCK)
  WHERE sde_id IS NULL
IF @@ROWCOUNT > 0
BEGIN
  /* Grab this table */
  UPDATE Troy.dbo.SDE_logfile_pool SET sde_id = @sdeIdVal
    WHERE table_id = @table_id
END
ELSE
BEGIN
  IF @checkOrphansVal = 1
  BEGIN
    /* Check if any of the tables are orphaned */
    SELECT TOP 1 @table_id = LP.table_id FROM Troy.dbo.SDE_logfile_pool LP
    LEFT JOIN (SELECT PR.sde_id FROM Troy.dbo.SDE_process_information PR 
    INNER JOIN  tempdb.sys.objects SO      ON object_id (PR.table_name) = SO.object_id
    WHERE SO.object_id IS NOT NULL) SPR
    ON LP.sde_id = SPR.sde_id WHERE SPR.sde_id IS NULL
    IF @@ROWCOUNT > 0
    BEGIN
      /* Grab this orphaned table */
      UPDATE Troy.dbo.SDE_logfile_pool SET sde_id = @sdeIdVal
        WHERE table_id = @table_id
    END
  END
END
/* If we got a table, truncate it in case the last user did
   not clean it up properly. */
IF @table_id > 0
BEGIN
  DECLARE @sqlstmt AS VARCHAR (64)
  IF @useTruncateVal = 1
  BEGIN
    SET @sqlstmt = 'TRUNCATE TABLE dbo.SDE_logpool_' + cast (@table_id as varchar(10))
  END
  ELSE
  BEGIN
    SET @sqlstmt = 'DELETE FROM dbo.SDE_logpool_' + cast (@table_id as varchar(10))
  END
  EXEC (@sqlstmt)
END
COMMIT TRAN logfile_tran
RETURN @table_id
GO
/****** Object:  StoredProcedure [dbo].[SDE_last_modified_def_update]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_last_modified_def_update]
@tableNameVal sysname,
@newTimeVal DATETIME OUTPUT AS SET NOCOUNT ON
BEGIN TRAN last_modified_tran
DECLARE @current_time DATETIME
SELECT @current_time = time_last_modified
  FROM Troy.dbo.SDE_tables_modified WITH (TABLOCKX, HOLDLOCK)
  WHERE table_name = @tableNameVal
IF @@ROWCOUNT = 0
BEGIN
  /* Insert a value for this table */
  INSERT INTO Troy.dbo.SDE_tables_modified (table_name,time_last_modified)
VALUES (@tableNameVal, @newTimeVal)
END
ELSE
BEGIN
  /* Never let the last_time_modifed remain the same or decrement */
  IF DATEDIFF (second, @current_time, @newTimeVal) <= 0
    SET @newTimeVal = DATEADD(second, 1, @current_time)
  UPDATE Troy.dbo.SDE_tables_modified SET time_last_modified = @newTimeVal
    WHERE table_name = @tableNameVal
END
COMMIT TRAN last_modified_tran
GO
/****** Object:  StoredProcedure [dbo].[SDE_last_lineage_mod_def_insert]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_last_lineage_mod_def_insert]
@lineageNameVal BIGINT,
@newTimeVal DATETIME AS SET NOCOUNT ON
BEGIN TRAN last_lineage_mod_tran
DECLARE @current_time DATETIME
SELECT @current_time = time_last_modified
  FROM Troy.dbo.SDE_lineages_modified WITH (TABLOCKX, HOLDLOCK)
  WHERE lineage_name = @lineageNameVal
IF @@ROWCOUNT > 0
BEGIN
/* Never let the last_time_modifed remain the same or decrement */
  IF DATEDIFF (second, @current_time, @newTimeVal) <= 0
    SET @newTimeVal = DATEADD(second, 1, @current_time)
  UPDATE Troy.dbo.SDE_lineages_modified SET time_last_modified = @newTimeVal
    WHERE lineage_name = @lineageNameVal
END
ELSE
  INSERT INTO Troy.dbo.SDE_lineages_modified (lineage_name, time_last_modified)    VALUES(@lineageNameVal,@newTimeVal)

COMMIT TRAN last_lineage_mod_tran
GO
/****** Object:  StoredProcedure [dbo].[SDE_generator_release]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_generator_release] AS SELECT 3 FROM Troy.dbo.SDE_version
GO
/****** Object:  StoredProcedure [dbo].[SDE_layer_lock_def_delete_user]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_layer_lock_def_delete_user] @sdeIdVal INTEGER AS SET NOCOUNT ON     BEGIN TRAN layer_lock_tran     DELETE FROM Troy.dbo.SDE_layer_locks WHERE  sde_id = @sdeIdVal     COMMIT TRAN layer_lock_tran
GO
/****** Object:  StoredProcedure [dbo].[SDE_layer_lock_def_delete]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_layer_lock_def_delete] @sdeIdVal INTEGER, @layerIdVal INTEGER,     @autoLockVal VARCHAR(1) AS SET NOCOUNT ON     BEGIN TRAN layer_lock_del_tran     DECLARE @ret_val INTEGER     DELETE FROM Troy.dbo.SDE_layer_locks WHERE  sde_id = @sdeIdVal AND layer_id = @layerIdVal AND     autolock = @autoLockVal     IF @@ROWCOUNT = 0 SET @ret_val = -48 /* SE_NO_LOCKS */     ELSE SET @ret_val = 0 /* SE_SUCCESS */     COMMIT TRAN layer_lock_del_tran     RETURN @ret_val
GO
/****** Object:  StoredProcedure [dbo].[SDE_pinfo_def_delete]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_pinfo_def_delete] @sdeIdVal INTEGER AS SET NOCOUNT ON     BEGIN TRAN pinfo_tran     DELETE FROM Troy.dbo.SDE_layer_locks WHERE sde_id = @sdeIdVal     DELETE FROM Troy.dbo.SDE_state_locks WHERE sde_id = @sdeIdVal     DELETE FROM Troy.dbo.SDE_table_locks WHERE sde_id = @sdeIdVal     DELETE FROM Troy.dbo.SDE_object_locks WHERE sde_id = @sdeIdVal     UPDATE Troy.dbo.SDE_logfile_pool SET sde_id = NULL WHERE sde_id = @sdeIdVal     DELETE FROM Troy.dbo.SDE_process_information WHERE sde_id = @sdeIdVal     COMMIT TRAN pinfo_tran
GO
/****** Object:  StoredProcedure [dbo].[SDE_parse_version_name]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_parse_version_name] 
@version_name NVARCHAR (97),
@parsed_name NVARCHAR (64) OUTPUT,
@parsed_owner NVARCHAR (32) OUTPUT AS SET NOCOUNT ON
BEGIN
  --This is a private support function for SDE versioned views.

  DECLARE @error_string NVARCHAR(256)
  DECLARE @delimiter INTEGER
  DECLARE @SE_INVALID_VERSION_NAME INTEGER
  SET @SE_INVALID_VERSION_NAME = 50171

  -- Parse the version name.
  SET @delimiter = PATINDEX ('%".%', @version_name)
  IF @delimiter <> 0
  BEGIN
    SET @parsed_owner = substring (@version_name, 1, @delimiter)
    SET @parsed_name = substring (@version_name, @delimiter + 2, 64)
  END
  ELSE
  BEGIN
    SET @delimiter = charindex ('.', @version_name)
    IF @delimiter <> 0
    BEGIN
      SET @parsed_owner = substring (@version_name, 1, @delimiter - 1)
      SET @parsed_name = substring (@version_name, @delimiter + 1, 64)
    END
    ELSE
    BEGIN
      SET @parsed_name = @version_name
      EXECUTE Troy.dbo.SDE_get_current_user_name @parsed_owner OUTPUT
    END
  END

  IF RTRIM (@parsed_name) IS NULL OR LEN (@parsed_name) = 0 OR
     RTRIM (@parsed_owner) IS NULL OR LEN (@parsed_owner) = 0
  BEGIN
    SET @error_string = ISNULL (@version_name, '(null)') +
                       ' is not a valid version name.'
    RAISERROR (@error_string,16,-1)
    RETURN @SE_INVALID_VERSION_NAME
  END

  RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_object_lock_def_delete_user]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_object_lock_def_delete_user] @sdeIdVal INTEGER AS SET NOCOUNT ON     BEGIN TRAN object_lock_tran     DELETE FROM Troy.dbo.SDE_object_locks WHERE  sde_id = @sdeIdVal     COMMIT TRAN object_lock_tran
GO
/****** Object:  StoredProcedure [dbo].[SDE_object_lock_def_delete]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_object_lock_def_delete] @sdeIdVal INTEGER, @objectIdVal INTEGER,     @objectTypeVal INTEGER, @applicationIdVal INTEGER,     @autoLockVal VARCHAR(1) AS SET NOCOUNT ON     BEGIN TRAN object_lock_del_tran     DECLARE @ret_val INTEGER     DELETE FROM Troy.dbo.SDE_object_locks WITH (TABLOCKX) WHERE  sde_id = @sdeIdVal AND     object_id = @objectIdVal AND object_type = @objectTypeVal     AND application_id = @applicationIdVal AND autolock = @autoLockVal     IF @@ROWCOUNT = 0 SET @ret_val = -48 /* SE_NO_LOCKS */     ELSE SET @ret_val = 0 /* SE_SUCCESS */     COMMIT TRAN object_lock_del_tran     RETURN @ret_val
GO
/****** Object:  StoredProcedure [dbo].[SDE_procedure_release]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_procedure_release] AS SELECT 5000100 FROM Troy.dbo.SDE_version
GO
/****** Object:  StoredProcedure [dbo].[SDE_pinfo_def_update]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_pinfo_def_update] @sdeIdVal INTEGER, @rcountVal INTEGER,     @wcountVal INTEGER, @opcountVal INTEGER, @numlocksVal INTEGER,     @fb_partialVal INTEGER, @fb_countVal INTEGER, @fb_fcountVal INTEGER,     @fb_kbytesVal INTEGER AS SET NOCOUNT ON     BEGIN TRAN pinfo_tran     UPDATE Troy.dbo.SDE_process_information  SET rcount = @rcountVal, wcount = @wcountVal,     opcount = @opcountVal, numlocks = @numlocksVal,      fb_partial = @fb_partialVal, fb_count = @fb_countVal,     fb_fcount = @fb_fcountVal, fb_kbytes = @fb_kbytesVal     WHERE sde_id = @sdeIdVal     COMMIT TRAN pinfo_tran
GO
/****** Object:  Table [dbo].[SDE_raster_columns]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_raster_columns](
	[rastercolumn_id] [int] NOT NULL,
	[description] [nvarchar](65) NULL,
	[database_name] [nvarchar](32) NOT NULL,
	[owner] [nvarchar](32) NOT NULL,
	[table_name] [sysname] NOT NULL,
	[raster_column] [nvarchar](32) NOT NULL,
	[cdate] [int] NOT NULL,
	[config_keyword] [nvarchar](32) NULL,
	[minimum_id] [int] NULL,
	[base_rastercolumn_id] [int] NOT NULL,
	[rastercolumn_mask] [int] NOT NULL,
	[srid] [int] NULL,
 CONSTRAINT [rascol_pk] PRIMARY KEY CLUSTERED 
(
	[database_name] ASC,
	[owner] ASC,
	[table_name] ASC,
	[raster_column] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY],
 CONSTRAINT [rascol_uk] UNIQUE NONCLUSTERED 
(
	[rastercolumn_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[next_rowid]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[next_rowid]
@owner NVARCHAR(128), @table NVARCHAR(128), @rowid INT OUTPUT
AS SET NOCOUNT ON
BEGIN
DECLARE @regid INT
DECLARE @newid INT
DECLARE @sql NVARCHAR (1024)
SELECT @regid = registration_id FROM Troy.dbo.SDE_table_registry  WHERE owner = @owner AND table_name = @table
IF @@ROWCOUNT = 0
BEGIN
  SELECT @regid = registration_id FROM Troy.dbo.SDE_table_registry    WHERE owner = @owner AND imv_view_name = @table
  IF @@ROWCOUNT = 0
  BEGIN
    DECLARE @errstr VARCHAR (256)
    SET @errstr = 'Class ' + @table + ' not registered to the Geodatabase.'
    RAISERROR (@errstr,16,-1)
    RETURN
  END
END
SET @sql = 
'DECLARE @num_ids INT ' +
'EXEC ' + @owner + '.i' +cast (@regid AS VARCHAR(10)) + '_get_ids 2,1,@newid OUTPUT,@num_ids OUTPUT'
EXECUTE sp_executesql @sql, N'@newid INTEGER OUTPUT', @newid = @rowid OUTPUT
END
GO
/****** Object:  UserDefinedFunction [dbo].[retrieve_guid]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[retrieve_guid] () RETURNS NVARCHAR(38)
BEGIN
  RETURN(SELECT guidstr from Troy.dbo.SDE_generate_guid )
END
GO
/****** Object:  StoredProcedure [dbo].[i7_return_ids]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[i7_return_ids]
@id_type integer,
@base_id integer,
@num_ids integer
AS SET NOCOUNT ON
BEGIN
  DECLARE @last_id integer
  DECLARE @fetched_base_id integer
  BEGIN TRAN id_tran
  SELECT @last_id = last_id, @fetched_base_id = base_id
    FROM TROY.DBO.i7 WITH (tablockx, holdlock)
    WHERE num_ids = -1 AND id_type = @id_type
  IF ( (@last_id < @base_id) AND
       ((@base_id + @num_ids) = @fetched_base_id))
  BEGIN
    /* only return ids if no one else has grabbed a block
       and were returning the remainder of the block. */
    UPDATE TROY.DBO.i7 SET base_id = @base_id
       WHERE num_ids = -1 AND id_type = @id_type
  END
  ELSE
  BEGIN
    /* Insert a new fragment */
    INSERT INTO TROY.DBO.i7 (base_id, num_ids, id_type)
      VALUES (@base_id, @num_ids, @id_type)
  END
  COMMIT TRAN id_tran /* releases holdlock table lock */
END
GO
/****** Object:  StoredProcedure [dbo].[i7_get_ids]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[i7_get_ids]
@id_type integer,
@num_requested_ids integer,
@base_id integer OUTPUT,
@num_obtained_ids integer OUTPUT AS SET NOCOUNT ON
BEGIN
  IF (@num_requested_ids < 0)
  BEGIN 
    BEGIN TRAN id_tran
    /* We are resetting the generator. */
    /* Delete fragments and update the base value.*/
    UPDATE TROY.DBO.i7 WITH  (tablockx, holdlock)
      SET base_id = base_id + @num_requested_ids
      WHERE num_ids = -1 AND id_type = @id_type
    DELETE FROM TROY.DBO.i7 WHERE id_type = @id_type and num_ids <> -1
    COMMIT TRAN id_tran /* releases holdlock table lock */
  END
  ELSE
  BEGIN
    IF (@num_requested_ids > 0)
    BEGIN
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM TROY.DBO.i7 WITH (tablockx, holdlock)
        WHERE id_type = @id_type
        ORDER BY num_ids DESC /* ensures that fragments come first */
        FOR UPDATE /* to get a lock */
    END
    ELSE
    BEGIN
      /* only interested in base id */
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM TROY.DBO.i7 WITH (tablockx, holdlock)
        WHERE id_type = @id_type AND num_ids = -1
        FOR UPDATE /* to get a lock */
    END
    BEGIN TRAN id_tran
    OPEN I_cursor
    FETCH NEXT FROM I_cursor INTO @base_id, @num_obtained_ids
    IF (@num_requested_ids = 0)
    BEGIN
      /* Just getting current value */
      SET @num_obtained_ids = 0
    END
    ELSE
    BEGIN
      IF (@num_obtained_ids = -1)
      BEGIN
        /* user got the amount they wanted */
        SET @num_obtained_ids = @num_requested_ids
        /* update the last id and base id */
        UPDATE TROY.DBO.i7
          SET base_id = base_id + @num_obtained_ids,
              last_id =  @base_id
          WHERE CURRENT OF I_cursor
      END
      ELSE
      BEGIN
        /* user got a fragment */
        IF (@num_requested_ids = 1) AND (@num_obtained_ids > 1)
        BEGIN
          /* they want one and exactly one id */
          SET @num_obtained_ids = 1
          UPDATE TROY.DBO.i7 SET base_id = base_id + 1,
            num_ids =  num_ids - 1 WHERE CURRENT OF I_cursor
        END
        ELSE
        BEGIN
          /* Return the whole fragment, delete the the row */
          DELETE FROM TROY.DBO.i7 WHERE CURRENT OF I_cursor
        END
      END
    END
    CLOSE I_cursor
    COMMIT TRAN id_tran /* releases holdlock table lock */
    DEALLOCATE I_cursor
  END
END
GO
/****** Object:  UserDefinedFunction [dbo].[is_archive_enabled]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[is_archive_enabled]
(@owner NVARCHAR(128), @table NVARCHAR(128))
RETURNS NVARCHAR(128)
AS BEGIN
DECLARE @oflags INTEGER
SELECT @oflags = object_flags FROM Troy.dbo.SDE_table_registry  WHERE owner = @owner AND table_name = @table 
IF @@ROWCOUNT = 0
  RETURN 'NOT REGISTERED'
IF (@oflags & 262144) > 0 
  RETURN 'TRUE'
RETURN 'FALSE'
END
GO
/****** Object:  StoredProcedure [dbo].[i8_return_ids]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[i8_return_ids]
@id_type integer,
@base_id integer,
@num_ids integer
AS SET NOCOUNT ON
BEGIN
  DECLARE @last_id integer
  DECLARE @fetched_base_id integer
  BEGIN TRAN id_tran
  SELECT @last_id = last_id, @fetched_base_id = base_id
    FROM TROY.DBO.i8 WITH (tablockx, holdlock)
    WHERE num_ids = -1 AND id_type = @id_type
  IF ( (@last_id < @base_id) AND
       ((@base_id + @num_ids) = @fetched_base_id))
  BEGIN
    /* only return ids if no one else has grabbed a block
       and were returning the remainder of the block. */
    UPDATE TROY.DBO.i8 SET base_id = @base_id
       WHERE num_ids = -1 AND id_type = @id_type
  END
  ELSE
  BEGIN
    /* Insert a new fragment */
    INSERT INTO TROY.DBO.i8 (base_id, num_ids, id_type)
      VALUES (@base_id, @num_ids, @id_type)
  END
  COMMIT TRAN id_tran /* releases holdlock table lock */
END
GO
/****** Object:  StoredProcedure [dbo].[i8_get_ids]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[i8_get_ids]
@id_type integer,
@num_requested_ids integer,
@base_id integer OUTPUT,
@num_obtained_ids integer OUTPUT AS SET NOCOUNT ON
BEGIN
  IF (@num_requested_ids < 0)
  BEGIN 
    BEGIN TRAN id_tran
    /* We are resetting the generator. */
    /* Delete fragments and update the base value.*/
    UPDATE TROY.DBO.i8 WITH  (tablockx, holdlock)
      SET base_id = base_id + @num_requested_ids
      WHERE num_ids = -1 AND id_type = @id_type
    DELETE FROM TROY.DBO.i8 WHERE id_type = @id_type and num_ids <> -1
    COMMIT TRAN id_tran /* releases holdlock table lock */
  END
  ELSE
  BEGIN
    IF (@num_requested_ids > 0)
    BEGIN
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM TROY.DBO.i8 WITH (tablockx, holdlock)
        WHERE id_type = @id_type
        ORDER BY num_ids DESC /* ensures that fragments come first */
        FOR UPDATE /* to get a lock */
    END
    ELSE
    BEGIN
      /* only interested in base id */
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM TROY.DBO.i8 WITH (tablockx, holdlock)
        WHERE id_type = @id_type AND num_ids = -1
        FOR UPDATE /* to get a lock */
    END
    BEGIN TRAN id_tran
    OPEN I_cursor
    FETCH NEXT FROM I_cursor INTO @base_id, @num_obtained_ids
    IF (@num_requested_ids = 0)
    BEGIN
      /* Just getting current value */
      SET @num_obtained_ids = 0
    END
    ELSE
    BEGIN
      IF (@num_obtained_ids = -1)
      BEGIN
        /* user got the amount they wanted */
        SET @num_obtained_ids = @num_requested_ids
        /* update the last id and base id */
        UPDATE TROY.DBO.i8
          SET base_id = base_id + @num_obtained_ids,
              last_id =  @base_id
          WHERE CURRENT OF I_cursor
      END
      ELSE
      BEGIN
        /* user got a fragment */
        IF (@num_requested_ids = 1) AND (@num_obtained_ids > 1)
        BEGIN
          /* they want one and exactly one id */
          SET @num_obtained_ids = 1
          UPDATE TROY.DBO.i8 SET base_id = base_id + 1,
            num_ids =  num_ids - 1 WHERE CURRENT OF I_cursor
        END
        ELSE
        BEGIN
          /* Return the whole fragment, delete the the row */
          DELETE FROM TROY.DBO.i8 WHERE CURRENT OF I_cursor
        END
      END
    END
    CLOSE I_cursor
    COMMIT TRAN id_tran /* releases holdlock table lock */
    DEALLOCATE I_cursor
  END
END
GO
/****** Object:  Table [dbo].[SDE_column_registry]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_column_registry](
	[database_name] [nvarchar](32) NOT NULL,
	[table_name] [sysname] NOT NULL,
	[owner] [nvarchar](32) NOT NULL,
	[column_name] [nvarchar](32) NOT NULL,
	[sde_type] [int] NOT NULL,
	[column_size] [int] NULL,
	[decimal_digits] [int] NULL,
	[description] [nvarchar](65) NULL,
	[object_flags] [int] NOT NULL,
	[object_id] [int] NULL,
 CONSTRAINT [colregistry_pk] PRIMARY KEY CLUSTERED 
(
	[database_name] ASC,
	[table_name] ASC,
	[owner] ASC,
	[column_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SDE_archives]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_archives](
	[archiving_regid] [int] NOT NULL,
	[history_regid] [int] NOT NULL,
	[from_date] [nvarchar](32) NOT NULL,
	[to_date] [nvarchar](32) NOT NULL,
	[archive_date] [bigint] NOT NULL,
	[archive_flags] [bigint] NOT NULL,
 CONSTRAINT [archives_pk] PRIMARY KEY CLUSTERED 
(
	[archiving_regid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [archives_uk] UNIQUE NONCLUSTERED 
(
	[history_regid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SDE_current_version_not_default]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_current_version_not_default] @current_state BIGINT AS 
SET NOCOUNT ON BEGIN
--This is a private support procedure for SDE versioned views.
--Check for default version.
  DECLARE @count INTEGER
  SELECT @count = count(*)
  FROM   Troy.dbo.SDE_versions 
  WHERE  name = 'DEFAULT' AND owner = 'dbo' AND state_id = @current_state
IF @count = 1
BEGIN
  DECLARE @error_string NVARCHAR(256)
  SET @error_string = 'You may not update this view on an ' +
                      'archiving table in the DEFAULT version.'
  RAISERROR (@error_string,16,-1)
  RETURN -1
END
RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_dbtune_def_update]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_dbtune_def_update]       @keywordVal NVARCHAR(32),@parameter_nameVal NVARCHAR(32),       @config_stringVal NVARCHAR(2048) AS UPDATE Troy.dbo.SDE_dbtune       SET  config_string = @config_stringVal WHERE       keyword = @keywordVal AND parameter_name = @parameter_nameVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_dbtune_def_truncate]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_dbtune_def_truncate]       AS SET NOCOUNT ON DELETE FROM Troy.dbo.SDE_dbtune
GO
/****** Object:  StoredProcedure [dbo].[SDE_dbtune_def_insert]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_dbtune_def_insert]       @keywordVal NVARCHAR(32),@parameter_nameVal NVARCHAR(32),       @config_stringVal NVARCHAR(2048) AS INSERT INTO Troy.dbo.SDE_dbtune       (keyword,parameter_name,config_string) VALUES       (@keywordVal,@parameter_nameVal,@config_stringVal)
GO
/****** Object:  StoredProcedure [dbo].[SDE_dbtune_def_delete]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_dbtune_def_delete]       @keywordVal NVARCHAR(32),@parameter_nameVal NVARCHAR(32)       AS SET NOCOUNT OFF IF (@parameter_nameVal IS NULL)        DELETE FROM Troy.dbo.SDE_dbtune WHERE keyword = @keywordVal      ELSE DELETE FROM Troy.dbo.SDE_dbtune WHERE keyword = @keywordVal AND           parameter_name = @parameter_nameVal
GO
/****** Object:  Table [dbo].[SDE_geometry_columns]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_geometry_columns](
	[f_table_catalog] [nvarchar](32) NOT NULL,
	[f_table_schema] [nvarchar](32) NOT NULL,
	[f_table_name] [sysname] NOT NULL,
	[f_geometry_column] [nvarchar](32) NOT NULL,
	[g_table_catalog] [nvarchar](32) NULL,
	[g_table_schema] [nvarchar](32) NOT NULL,
	[g_table_name] [sysname] NOT NULL,
	[storage_type] [int] NULL,
	[geometry_type] [int] NULL,
	[coord_dimension] [int] NULL,
	[max_ppr] [int] NULL,
	[srid] [int] NOT NULL,
 CONSTRAINT [geocol_pk] PRIMARY KEY CLUSTERED 
(
	[f_table_catalog] ASC,
	[f_table_schema] ASC,
	[f_table_name] ASC,
	[f_geometry_column] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[SDE_get_view_state]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SDE_get_view_state] () RETURNS BIGINT
BEGIN
--This is a private support function for SDE versioned views.
DECLARE @state_id BIGINT
DECLARE @context_info VARCHAR(128)
SELECT @context_info = CAST (context_info AS VARCHAR(128))
FROM master.dbo.sysprocesses
WHERE spid = @@SPID AND CAST (context_info AS VARCHAR(128)) like 'SDE%'
IF @context_info IS NULL
  SET @state_id = -1  -- version has not been set.
ELSE
BEGIN
  DECLARE @delimiter INTEGER
  SET @delimiter = charindex (',', @context_info)
  IF @delimiter = 0
    SET @state_id = -1  -- version has not been set.
  ELSE
  BEGIN
    DECLARE @next_delimiter INTEGER
    SET @next_delimiter = charindex (',', @context_info, @delimiter + 1)
    SET @context_info = substring (@context_info, @delimiter + 1,
        @next_delimiter - @delimiter - 1)
    SET @state_id = CAST (@context_info as bigint)
  END
END
IF @state_id < 0
  -- Set to default version's state id
  SELECT @state_id = state_id FROM Troy.dbo.SDE_versions
    WHERE name = 'DEFAULT' AND owner = 'dbo'
RETURN @state_id
END
GO
/****** Object:  UserDefinedFunction [dbo].[SDE_get_version_access]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SDE_get_version_access] (
@status INTEGER,
@version_owner NVARCHAR (128)) 
RETURNS CHAR(1) 
BEGIN
--This is a private support function for SDE versioned views.

-- Get the current login & user name
DECLARE @user      NVARCHAR (128)
DECLARE @protected CHAR (1)
DECLARE @is_dba INTEGER
DECLARE @delimiter INTEGER
SELECT @user = user_name()
SET @delimiter = PATINDEX('"%', @version_owner)
IF @delimiter > 0
BEGIN
 SET @user = N'"' + user_name() + N'"' 
END
SET @is_dba = Troy.dbo.SDE_is_user_sde_dba ()
SET @status = @status - floor (@status / 4) * 4
IF @status = 0 -- private version
BEGIN
  IF ((@is_dba = 0) AND (@user <> @version_owner))
    SET @protected = '2' -- no permission
  ELSE
    SET @protected = '0'; -- full permission
END
ELSE IF @status = 2 -- protected version
BEGIN
  IF ((@is_dba = 0) AND (@user <> @version_owner))
    SET @protected = '1' -- read only permission
  ELSE
    SET @protected = '0' -- full permission
END
ELSE
  SET @protected = '0' -- must be a public version
RETURN @protected
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_get_primary_oid]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_get_primary_oid]
@id_type INTEGER,
@num_ids INTEGER,
@base_id BIGINT OUTPUT
AS
BEGIN
  IF @id_type = -1
    SET @base_id = 2
  ELSE
  BEGIN
    DECLARE object_cursor CURSOR LOCAL FOR
      SELECT base_id
      FROM Troy.dbo.SDE_object_ids WITH (UPDLOCK)
      WHERE id_type = @id_type
      FOR UPDATE
    OPEN object_cursor
    BEGIN TRAN id_tran
    FETCH NEXT FROM object_cursor INTO @base_id
    /* update the base id */
    UPDATE Troy.dbo.SDE_object_ids SET base_id = base_id + @num_ids
      WHERE CURRENT OF object_cursor
    CLOSE object_cursor
    COMMIT TRAN id_tran /* releases update lock */
    DEALLOCATE object_cursor
  END
END
GO
/****** Object:  StoredProcedure [dbo].[i6_return_ids]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[i6_return_ids]
@id_type integer,
@base_id integer,
@num_ids integer
AS SET NOCOUNT ON
BEGIN
  DECLARE @last_id integer
  DECLARE @fetched_base_id integer
  BEGIN TRAN id_tran
  SELECT @last_id = last_id, @fetched_base_id = base_id
    FROM TROY.DBO.i6 WITH (tablockx, holdlock)
    WHERE num_ids = -1 AND id_type = @id_type
  IF ( (@last_id < @base_id) AND
       ((@base_id + @num_ids) = @fetched_base_id))
  BEGIN
    /* only return ids if no one else has grabbed a block
       and were returning the remainder of the block. */
    UPDATE TROY.DBO.i6 SET base_id = @base_id
       WHERE num_ids = -1 AND id_type = @id_type
  END
  ELSE
  BEGIN
    /* Insert a new fragment */
    INSERT INTO TROY.DBO.i6 (base_id, num_ids, id_type)
      VALUES (@base_id, @num_ids, @id_type)
  END
  COMMIT TRAN id_tran /* releases holdlock table lock */
END
GO
/****** Object:  StoredProcedure [dbo].[i6_get_ids]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[i6_get_ids]
@id_type integer,
@num_requested_ids integer,
@base_id integer OUTPUT,
@num_obtained_ids integer OUTPUT AS SET NOCOUNT ON
BEGIN
  IF (@num_requested_ids < 0)
  BEGIN 
    BEGIN TRAN id_tran
    /* We are resetting the generator. */
    /* Delete fragments and update the base value.*/
    UPDATE TROY.DBO.i6 WITH  (tablockx, holdlock)
      SET base_id = base_id + @num_requested_ids
      WHERE num_ids = -1 AND id_type = @id_type
    DELETE FROM TROY.DBO.i6 WHERE id_type = @id_type and num_ids <> -1
    COMMIT TRAN id_tran /* releases holdlock table lock */
  END
  ELSE
  BEGIN
    IF (@num_requested_ids > 0)
    BEGIN
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM TROY.DBO.i6 WITH (tablockx, holdlock)
        WHERE id_type = @id_type
        ORDER BY num_ids DESC /* ensures that fragments come first */
        FOR UPDATE /* to get a lock */
    END
    ELSE
    BEGIN
      /* only interested in base id */
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM TROY.DBO.i6 WITH (tablockx, holdlock)
        WHERE id_type = @id_type AND num_ids = -1
        FOR UPDATE /* to get a lock */
    END
    BEGIN TRAN id_tran
    OPEN I_cursor
    FETCH NEXT FROM I_cursor INTO @base_id, @num_obtained_ids
    IF (@num_requested_ids = 0)
    BEGIN
      /* Just getting current value */
      SET @num_obtained_ids = 0
    END
    ELSE
    BEGIN
      IF (@num_obtained_ids = -1)
      BEGIN
        /* user got the amount they wanted */
        SET @num_obtained_ids = @num_requested_ids
        /* update the last id and base id */
        UPDATE TROY.DBO.i6
          SET base_id = base_id + @num_obtained_ids,
              last_id =  @base_id
          WHERE CURRENT OF I_cursor
      END
      ELSE
      BEGIN
        /* user got a fragment */
        IF (@num_requested_ids = 1) AND (@num_obtained_ids > 1)
        BEGIN
          /* they want one and exactly one id */
          SET @num_obtained_ids = 1
          UPDATE TROY.DBO.i6 SET base_id = base_id + 1,
            num_ids =  num_ids - 1 WHERE CURRENT OF I_cursor
        END
        ELSE
        BEGIN
          /* Return the whole fragment, delete the the row */
          DELETE FROM TROY.DBO.i6 WHERE CURRENT OF I_cursor
        END
      END
    END
    CLOSE I_cursor
    COMMIT TRAN id_tran /* releases holdlock table lock */
    DEALLOCATE I_cursor
  END
END
GO
/****** Object:  StoredProcedure [dbo].[i5_return_ids]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[i5_return_ids]
@id_type integer,
@base_id integer,
@num_ids integer
AS SET NOCOUNT ON
BEGIN
  DECLARE @last_id integer
  DECLARE @fetched_base_id integer
  BEGIN TRAN id_tran
  SELECT @last_id = last_id, @fetched_base_id = base_id
    FROM TROY.DBO.i5 WITH (tablockx, holdlock)
    WHERE num_ids = -1 AND id_type = @id_type
  IF ( (@last_id < @base_id) AND
       ((@base_id + @num_ids) = @fetched_base_id))
  BEGIN
    /* only return ids if no one else has grabbed a block
       and were returning the remainder of the block. */
    UPDATE TROY.DBO.i5 SET base_id = @base_id
       WHERE num_ids = -1 AND id_type = @id_type
  END
  ELSE
  BEGIN
    /* Insert a new fragment */
    INSERT INTO TROY.DBO.i5 (base_id, num_ids, id_type)
      VALUES (@base_id, @num_ids, @id_type)
  END
  COMMIT TRAN id_tran /* releases holdlock table lock */
END
GO
/****** Object:  StoredProcedure [dbo].[i5_get_ids]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[i5_get_ids]
@id_type integer,
@num_requested_ids integer,
@base_id integer OUTPUT,
@num_obtained_ids integer OUTPUT AS SET NOCOUNT ON
BEGIN
  IF (@num_requested_ids < 0)
  BEGIN 
    BEGIN TRAN id_tran
    /* We are resetting the generator. */
    /* Delete fragments and update the base value.*/
    UPDATE TROY.DBO.i5 WITH  (tablockx, holdlock)
      SET base_id = base_id + @num_requested_ids
      WHERE num_ids = -1 AND id_type = @id_type
    DELETE FROM TROY.DBO.i5 WHERE id_type = @id_type and num_ids <> -1
    COMMIT TRAN id_tran /* releases holdlock table lock */
  END
  ELSE
  BEGIN
    IF (@num_requested_ids > 0)
    BEGIN
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM TROY.DBO.i5 WITH (tablockx, holdlock)
        WHERE id_type = @id_type
        ORDER BY num_ids DESC /* ensures that fragments come first */
        FOR UPDATE /* to get a lock */
    END
    ELSE
    BEGIN
      /* only interested in base id */
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM TROY.DBO.i5 WITH (tablockx, holdlock)
        WHERE id_type = @id_type AND num_ids = -1
        FOR UPDATE /* to get a lock */
    END
    BEGIN TRAN id_tran
    OPEN I_cursor
    FETCH NEXT FROM I_cursor INTO @base_id, @num_obtained_ids
    IF (@num_requested_ids = 0)
    BEGIN
      /* Just getting current value */
      SET @num_obtained_ids = 0
    END
    ELSE
    BEGIN
      IF (@num_obtained_ids = -1)
      BEGIN
        /* user got the amount they wanted */
        SET @num_obtained_ids = @num_requested_ids
        /* update the last id and base id */
        UPDATE TROY.DBO.i5
          SET base_id = base_id + @num_obtained_ids,
              last_id =  @base_id
          WHERE CURRENT OF I_cursor
      END
      ELSE
      BEGIN
        /* user got a fragment */
        IF (@num_requested_ids = 1) AND (@num_obtained_ids > 1)
        BEGIN
          /* they want one and exactly one id */
          SET @num_obtained_ids = 1
          UPDATE TROY.DBO.i5 SET base_id = base_id + 1,
            num_ids =  num_ids - 1 WHERE CURRENT OF I_cursor
        END
        ELSE
        BEGIN
          /* Return the whole fragment, delete the the row */
          DELETE FROM TROY.DBO.i5 WHERE CURRENT OF I_cursor
        END
      END
    END
    CLOSE I_cursor
    COMMIT TRAN id_tran /* releases holdlock table lock */
    DEALLOCATE I_cursor
  END
END
GO
/****** Object:  StoredProcedure [dbo].[i4_return_ids]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[i4_return_ids]
@id_type integer,
@base_id integer,
@num_ids integer
AS SET NOCOUNT ON
BEGIN
  DECLARE @last_id integer
  DECLARE @fetched_base_id integer
  BEGIN TRAN id_tran
  SELECT @last_id = last_id, @fetched_base_id = base_id
    FROM TROY.DBO.i4 WITH (tablockx, holdlock)
    WHERE num_ids = -1 AND id_type = @id_type
  IF ( (@last_id < @base_id) AND
       ((@base_id + @num_ids) = @fetched_base_id))
  BEGIN
    /* only return ids if no one else has grabbed a block
       and were returning the remainder of the block. */
    UPDATE TROY.DBO.i4 SET base_id = @base_id
       WHERE num_ids = -1 AND id_type = @id_type
  END
  ELSE
  BEGIN
    /* Insert a new fragment */
    INSERT INTO TROY.DBO.i4 (base_id, num_ids, id_type)
      VALUES (@base_id, @num_ids, @id_type)
  END
  COMMIT TRAN id_tran /* releases holdlock table lock */
END
GO
/****** Object:  StoredProcedure [dbo].[i4_get_ids]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[i4_get_ids]
@id_type integer,
@num_requested_ids integer,
@base_id integer OUTPUT,
@num_obtained_ids integer OUTPUT AS SET NOCOUNT ON
BEGIN
  IF (@num_requested_ids < 0)
  BEGIN 
    BEGIN TRAN id_tran
    /* We are resetting the generator. */
    /* Delete fragments and update the base value.*/
    UPDATE TROY.DBO.i4 WITH  (tablockx, holdlock)
      SET base_id = base_id + @num_requested_ids
      WHERE num_ids = -1 AND id_type = @id_type
    DELETE FROM TROY.DBO.i4 WHERE id_type = @id_type and num_ids <> -1
    COMMIT TRAN id_tran /* releases holdlock table lock */
  END
  ELSE
  BEGIN
    IF (@num_requested_ids > 0)
    BEGIN
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM TROY.DBO.i4 WITH (tablockx, holdlock)
        WHERE id_type = @id_type
        ORDER BY num_ids DESC /* ensures that fragments come first */
        FOR UPDATE /* to get a lock */
    END
    ELSE
    BEGIN
      /* only interested in base id */
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM TROY.DBO.i4 WITH (tablockx, holdlock)
        WHERE id_type = @id_type AND num_ids = -1
        FOR UPDATE /* to get a lock */
    END
    BEGIN TRAN id_tran
    OPEN I_cursor
    FETCH NEXT FROM I_cursor INTO @base_id, @num_obtained_ids
    IF (@num_requested_ids = 0)
    BEGIN
      /* Just getting current value */
      SET @num_obtained_ids = 0
    END
    ELSE
    BEGIN
      IF (@num_obtained_ids = -1)
      BEGIN
        /* user got the amount they wanted */
        SET @num_obtained_ids = @num_requested_ids
        /* update the last id and base id */
        UPDATE TROY.DBO.i4
          SET base_id = base_id + @num_obtained_ids,
              last_id =  @base_id
          WHERE CURRENT OF I_cursor
      END
      ELSE
      BEGIN
        /* user got a fragment */
        IF (@num_requested_ids = 1) AND (@num_obtained_ids > 1)
        BEGIN
          /* they want one and exactly one id */
          SET @num_obtained_ids = 1
          UPDATE TROY.DBO.i4 SET base_id = base_id + 1,
            num_ids =  num_ids - 1 WHERE CURRENT OF I_cursor
        END
        ELSE
        BEGIN
          /* Return the whole fragment, delete the the row */
          DELETE FROM TROY.DBO.i4 WHERE CURRENT OF I_cursor
        END
      END
    END
    CLOSE I_cursor
    COMMIT TRAN id_tran /* releases holdlock table lock */
    DEALLOCATE I_cursor
  END
END
GO
/****** Object:  StoredProcedure [dbo].[i3_return_ids]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[i3_return_ids]
@id_type integer,
@base_id integer,
@num_ids integer
AS SET NOCOUNT ON
BEGIN
  DECLARE @last_id integer
  DECLARE @fetched_base_id integer
  BEGIN TRAN id_tran
  SELECT @last_id = last_id, @fetched_base_id = base_id
    FROM TROY.DBO.i3 WITH (tablockx, holdlock)
    WHERE num_ids = -1 AND id_type = @id_type
  IF ( (@last_id < @base_id) AND
       ((@base_id + @num_ids) = @fetched_base_id))
  BEGIN
    /* only return ids if no one else has grabbed a block
       and were returning the remainder of the block. */
    UPDATE TROY.DBO.i3 SET base_id = @base_id
       WHERE num_ids = -1 AND id_type = @id_type
  END
  ELSE
  BEGIN
    /* Insert a new fragment */
    INSERT INTO TROY.DBO.i3 (base_id, num_ids, id_type)
      VALUES (@base_id, @num_ids, @id_type)
  END
  COMMIT TRAN id_tran /* releases holdlock table lock */
END
GO
/****** Object:  StoredProcedure [dbo].[i3_get_ids]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[i3_get_ids]
@id_type integer,
@num_requested_ids integer,
@base_id integer OUTPUT,
@num_obtained_ids integer OUTPUT AS SET NOCOUNT ON
BEGIN
  IF (@num_requested_ids < 0)
  BEGIN 
    BEGIN TRAN id_tran
    /* We are resetting the generator. */
    /* Delete fragments and update the base value.*/
    UPDATE TROY.DBO.i3 WITH  (tablockx, holdlock)
      SET base_id = base_id + @num_requested_ids
      WHERE num_ids = -1 AND id_type = @id_type
    DELETE FROM TROY.DBO.i3 WHERE id_type = @id_type and num_ids <> -1
    COMMIT TRAN id_tran /* releases holdlock table lock */
  END
  ELSE
  BEGIN
    IF (@num_requested_ids > 0)
    BEGIN
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM TROY.DBO.i3 WITH (tablockx, holdlock)
        WHERE id_type = @id_type
        ORDER BY num_ids DESC /* ensures that fragments come first */
        FOR UPDATE /* to get a lock */
    END
    ELSE
    BEGIN
      /* only interested in base id */
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM TROY.DBO.i3 WITH (tablockx, holdlock)
        WHERE id_type = @id_type AND num_ids = -1
        FOR UPDATE /* to get a lock */
    END
    BEGIN TRAN id_tran
    OPEN I_cursor
    FETCH NEXT FROM I_cursor INTO @base_id, @num_obtained_ids
    IF (@num_requested_ids = 0)
    BEGIN
      /* Just getting current value */
      SET @num_obtained_ids = 0
    END
    ELSE
    BEGIN
      IF (@num_obtained_ids = -1)
      BEGIN
        /* user got the amount they wanted */
        SET @num_obtained_ids = @num_requested_ids
        /* update the last id and base id */
        UPDATE TROY.DBO.i3
          SET base_id = base_id + @num_obtained_ids,
              last_id =  @base_id
          WHERE CURRENT OF I_cursor
      END
      ELSE
      BEGIN
        /* user got a fragment */
        IF (@num_requested_ids = 1) AND (@num_obtained_ids > 1)
        BEGIN
          /* they want one and exactly one id */
          SET @num_obtained_ids = 1
          UPDATE TROY.DBO.i3 SET base_id = base_id + 1,
            num_ids =  num_ids - 1 WHERE CURRENT OF I_cursor
        END
        ELSE
        BEGIN
          /* Return the whole fragment, delete the the row */
          DELETE FROM TROY.DBO.i3 WHERE CURRENT OF I_cursor
        END
      END
    END
    CLOSE I_cursor
    COMMIT TRAN id_tran /* releases holdlock table lock */
    DEALLOCATE I_cursor
  END
END
GO
/****** Object:  UserDefinedFunction [dbo].[archive_view_name]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[archive_view_name]
(@owner NVARCHAR(128), @table NVARCHAR(128))
RETURNS NVARCHAR(128)
AS BEGIN
DECLARE @view_name NVARCHAR(128)
SELECT @view_name = imv_view_name FROM Troy.dbo.SDE_table_registry  WHERE owner = @owner AND table_name = @table AND 
(object_flags & 8) = 0 AND (object_flags & 262144) > 0 
RETURN @view_name
END
GO
/****** Object:  View [dbo].[dbtune]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[dbtune] as select * from Troy.dbo.SDE_dbtune
GO
/****** Object:  Table [dbo].[GDB_ITEMTYPES]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDB_ITEMTYPES](
	[ObjectID] [int] NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](226) NOT NULL,
	[ParentTypeID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [ItemTypes_UUID_idx] ON [dbo].[GDB_ITEMTYPES] 
(
	[UUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ItemTypes_Name_idx] ON [dbo].[GDB_ITEMTYPES] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ItemTypes_ParentTypeID_idx] ON [dbo].[GDB_ITEMTYPES] 
(
	[ParentTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [R4_SDE_ROWID_UK] ON [dbo].[GDB_ITEMTYPES] 
(
	[ObjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[i2_return_ids]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[i2_return_ids]
@id_type integer,
@base_id integer,
@num_ids integer
AS SET NOCOUNT ON
BEGIN
  DECLARE @last_id integer
  DECLARE @fetched_base_id integer
  BEGIN TRAN id_tran
  SELECT @last_id = last_id, @fetched_base_id = base_id
    FROM TROY.DBO.i2 WITH (tablockx, holdlock)
    WHERE num_ids = -1 AND id_type = @id_type
  IF ( (@last_id < @base_id) AND
       ((@base_id + @num_ids) = @fetched_base_id))
  BEGIN
    /* only return ids if no one else has grabbed a block
       and were returning the remainder of the block. */
    UPDATE TROY.DBO.i2 SET base_id = @base_id
       WHERE num_ids = -1 AND id_type = @id_type
  END
  ELSE
  BEGIN
    /* Insert a new fragment */
    INSERT INTO TROY.DBO.i2 (base_id, num_ids, id_type)
      VALUES (@base_id, @num_ids, @id_type)
  END
  COMMIT TRAN id_tran /* releases holdlock table lock */
END
GO
/****** Object:  StoredProcedure [dbo].[i2_get_ids]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[i2_get_ids]
@id_type integer,
@num_requested_ids integer,
@base_id integer OUTPUT,
@num_obtained_ids integer OUTPUT AS SET NOCOUNT ON
BEGIN
  IF (@num_requested_ids < 0)
  BEGIN 
    BEGIN TRAN id_tran
    /* We are resetting the generator. */
    /* Delete fragments and update the base value.*/
    UPDATE TROY.DBO.i2 WITH  (tablockx, holdlock)
      SET base_id = base_id + @num_requested_ids
      WHERE num_ids = -1 AND id_type = @id_type
    DELETE FROM TROY.DBO.i2 WHERE id_type = @id_type and num_ids <> -1
    COMMIT TRAN id_tran /* releases holdlock table lock */
  END
  ELSE
  BEGIN
    IF (@num_requested_ids > 0)
    BEGIN
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM TROY.DBO.i2 WITH (tablockx, holdlock)
        WHERE id_type = @id_type
        ORDER BY num_ids DESC /* ensures that fragments come first */
        FOR UPDATE /* to get a lock */
    END
    ELSE
    BEGIN
      /* only interested in base id */
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM TROY.DBO.i2 WITH (tablockx, holdlock)
        WHERE id_type = @id_type AND num_ids = -1
        FOR UPDATE /* to get a lock */
    END
    BEGIN TRAN id_tran
    OPEN I_cursor
    FETCH NEXT FROM I_cursor INTO @base_id, @num_obtained_ids
    IF (@num_requested_ids = 0)
    BEGIN
      /* Just getting current value */
      SET @num_obtained_ids = 0
    END
    ELSE
    BEGIN
      IF (@num_obtained_ids = -1)
      BEGIN
        /* user got the amount they wanted */
        SET @num_obtained_ids = @num_requested_ids
        /* update the last id and base id */
        UPDATE TROY.DBO.i2
          SET base_id = base_id + @num_obtained_ids,
              last_id =  @base_id
          WHERE CURRENT OF I_cursor
      END
      ELSE
      BEGIN
        /* user got a fragment */
        IF (@num_requested_ids = 1) AND (@num_obtained_ids > 1)
        BEGIN
          /* they want one and exactly one id */
          SET @num_obtained_ids = 1
          UPDATE TROY.DBO.i2 SET base_id = base_id + 1,
            num_ids =  num_ids - 1 WHERE CURRENT OF I_cursor
        END
        ELSE
        BEGIN
          /* Return the whole fragment, delete the the row */
          DELETE FROM TROY.DBO.i2 WHERE CURRENT OF I_cursor
        END
      END
    END
    CLOSE I_cursor
    COMMIT TRAN id_tran /* releases holdlock table lock */
    DEALLOCATE I_cursor
  END
END
GO
/****** Object:  Table [dbo].[GDB_ITEMS]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GDB_ITEMS](
	[ObjectID] [int] NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
	[Type] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](226) NULL,
	[PhysicalName] [nvarchar](226) NULL,
	[Path] [nvarchar](512) NULL,
	[Url] [nvarchar](255) NULL,
	[Properties] [int] NULL,
	[Defaults] [varbinary](max) NULL,
	[DatasetSubtype1] [int] NULL,
	[DatasetSubtype2] [int] NULL,
	[DatasetInfo1] [nvarchar](255) NULL,
	[DatasetInfo2] [nvarchar](255) NULL,
	[Definition] [xml] NULL,
	[Documentation] [xml] NULL,
	[ItemInfo] [xml] NULL,
	[Shape] [geometry] NULL,
 CONSTRAINT [R2_pk] PRIMARY KEY CLUSTERED 
(
	[ObjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [GDB_Items_UUID_idx] ON [dbo].[GDB_ITEMS] 
(
	[UUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Items_Name_idx] ON [dbo].[GDB_ITEMS] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Items_PhysicalName_idx] ON [dbo].[GDB_ITEMS] 
(
	[PhysicalName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Items_Type_idx] ON [dbo].[GDB_ITEMS] 
(
	[Type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
CREATE SPATIAL INDEX [S1_idx] ON [dbo].[GDB_ITEMS] 
(
	[Shape]
)USING  GEOMETRY_GRID 
WITH (
BOUNDING_BOX =(-400, -90, 400, 90), GRIDS =(LEVEL_1 = MEDIUM,LEVEL_2 = MEDIUM,LEVEL_3 = MEDIUM,LEVEL_4 = MEDIUM), 
CELLS_PER_OBJECT = 16, PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
CREATE PRIMARY XML INDEX [xmlprim_GDB_ITEMS_Definition] ON [dbo].[GDB_ITEMS] 
(
	[Definition]
)WITH (PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
CREATE PRIMARY XML INDEX [xmlprim_GDB_ITEMS_Documentation] ON [dbo].[GDB_ITEMS] 
(
	[Documentation]
)WITH (PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
CREATE PRIMARY XML INDEX [xmlprim_GDB_ITEMS_ItemInfo] ON [dbo].[GDB_ITEMS] 
(
	[ItemInfo]
)WITH (PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
CREATE XML INDEX [xmlpath_GDB_ITEMS_Definition] ON [dbo].[GDB_ITEMS] 
(
	[Definition]
)
USING XML INDEX [xmlprim_GDB_ITEMS_Definition] FOR PATH WITH (PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
CREATE XML INDEX [xmlpath_GDB_ITEMS_Documentation] ON [dbo].[GDB_ITEMS] 
(
	[Documentation]
)
USING XML INDEX [xmlprim_GDB_ITEMS_Documentation] FOR PATH WITH (PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
CREATE XML INDEX [xmlpath_GDB_ITEMS_ItemInfo] ON [dbo].[GDB_ITEMS] 
(
	[ItemInfo]
)
USING XML INDEX [xmlprim_GDB_ITEMS_ItemInfo] FOR PATH WITH (PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
CREATE XML INDEX [xmlval_GDB_ITEMS_Definition] ON [dbo].[GDB_ITEMS] 
(
	[Definition]
)
USING XML INDEX [xmlprim_GDB_ITEMS_Definition] FOR VALUE WITH (PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
CREATE XML INDEX [xmlval_GDB_ITEMS_Documentation] ON [dbo].[GDB_ITEMS] 
(
	[Documentation]
)
USING XML INDEX [xmlprim_GDB_ITEMS_Documentation] FOR VALUE WITH (PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
CREATE XML INDEX [xmlval_GDB_ITEMS_ItemInfo] ON [dbo].[GDB_ITEMS] 
(
	[ItemInfo]
)
USING XML INDEX [xmlprim_GDB_ITEMS_ItemInfo] FOR VALUE WITH (PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  Table [dbo].[GDB_ITEMRELATIONSHIPTYPES]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDB_ITEMRELATIONSHIPTYPES](
	[ObjectID] [int] NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](226) NOT NULL,
	[ForwardLabel] [nvarchar](226) NULL,
	[BackwardLabel] [nvarchar](226) NULL,
	[OrigItemTypeID] [uniqueidentifier] NOT NULL,
	[DestItemTypeID] [uniqueidentifier] NOT NULL,
	[IsContainment] [smallint] NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [ItmRTypes_UUID_idx] ON [dbo].[GDB_ITEMRELATIONSHIPTYPES] 
(
	[UUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ItmRTypes_BackwardLabel_idx] ON [dbo].[GDB_ITEMRELATIONSHIPTYPES] 
(
	[BackwardLabel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ItmRTypes_DestItemTypeID_idx] ON [dbo].[GDB_ITEMRELATIONSHIPTYPES] 
(
	[DestItemTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ItmRTypes_ForwardLabel_idx] ON [dbo].[GDB_ITEMRELATIONSHIPTYPES] 
(
	[ForwardLabel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ItmRTypes_Name_idx] ON [dbo].[GDB_ITEMRELATIONSHIPTYPES] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ItmRTypes_OrigItemTypeID_idx] ON [dbo].[GDB_ITEMRELATIONSHIPTYPES] 
(
	[OrigItemTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [R5_SDE_ROWID_UK] ON [dbo].[GDB_ITEMRELATIONSHIPTYPES] 
(
	[ObjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GDB_ITEMRELATIONSHIPS]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDB_ITEMRELATIONSHIPS](
	[ObjectID] [int] NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
	[Type] [uniqueidentifier] NOT NULL,
	[OriginID] [uniqueidentifier] NOT NULL,
	[DestID] [uniqueidentifier] NOT NULL,
	[Properties] [int] NULL,
	[Attributes] [xml] NULL,
 CONSTRAINT [R3_pk] PRIMARY KEY CLUSTERED 
(
	[ObjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GDB_ItemRel_DestID_idx] ON [dbo].[GDB_ITEMRELATIONSHIPS] 
(
	[DestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GDB_ItemRel_OriginID_idx] ON [dbo].[GDB_ITEMRELATIONSHIPS] 
(
	[OriginID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GDB_ItemRel_Type_idx] ON [dbo].[GDB_ITEMRELATIONSHIPS] 
(
	[Type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [GDB_ItemRelationships_UUID_idx] ON [dbo].[GDB_ITEMRELATIONSHIPS] 
(
	[UUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
CREATE PRIMARY XML INDEX [xmlprim_GDB_ITEMRELATIONSHIPS_Attributes] ON [dbo].[GDB_ITEMRELATIONSHIPS] 
(
	[Attributes]
)WITH (PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
CREATE XML INDEX [xmlpath_GDB_ITEMRELATIONSHIPS_Attributes] ON [dbo].[GDB_ITEMRELATIONSHIPS] 
(
	[Attributes]
)
USING XML INDEX [xmlprim_GDB_ITEMRELATIONSHIPS_Attributes] FOR PATH WITH (PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
CREATE XML INDEX [xmlval_GDB_ITEMRELATIONSHIPS_Attributes] ON [dbo].[GDB_ITEMRELATIONSHIPS] 
(
	[Attributes]
)
USING XML INDEX [xmlprim_GDB_ITEMRELATIONSHIPS_Attributes] FOR VALUE WITH (PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  Table [dbo].[GDB_REPLICALOG]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDB_REPLICALOG](
	[ID] [int] NOT NULL,
	[ReplicaID] [int] NOT NULL,
	[Event] [int] NOT NULL,
	[ErrorCode] [int] NOT NULL,
	[LogDate] [datetime2](7) NOT NULL,
	[SourceBeginGen] [int] NOT NULL,
	[SourceEndGen] [int] NOT NULL,
	[TargetGen] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [R6_SDE_ROWID_UK] ON [dbo].[GDB_REPLICALOG] 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STRATAGIS_FLEET_HISTORIC]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STRATAGIS_FLEET_HISTORIC](
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
 CONSTRAINT [R8_pk] PRIMARY KEY CLUSTERED 
(
	[OBJECTID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE SPATIAL INDEX [S3_idx] ON [dbo].[STRATAGIS_FLEET_HISTORIC] 
(
	[SHAPE]
)USING  GEOMETRY_GRID 
WITH (
BOUNDING_BOX =(-119670700, -95612900, 2954992284792.94, 2955016342592.94), GRIDS =(LEVEL_1 = MEDIUM,LEVEL_2 = MEDIUM,LEVEL_3 = MEDIUM,LEVEL_4 = MEDIUM), 
CELLS_PER_OBJECT = 16, PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Stratagis_Date_View]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Date_View]
AS
SELECT     CONVERT(date, LocalTimeStamp) AS LocalDate, DateYear, DateMonth, DATEPART(wk, LocalTimeStamp) AS DateWeek, DateDay
FROM         dbo.Stratagis_Historic_Mart
GROUP BY CONVERT(date, LocalTimeStamp), CONVERT(datetime, CONVERT(date, LocalTimeStamp)), DateYear, DateMonth, DATEPART(wk, LocalTimeStamp), DateDay
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Stratagis_Historic_Mart"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 289
               Right = 363
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Date_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Date_View'
GO
/****** Object:  View [dbo].[Stratagis_Mart_MIL_Codes]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Mart_MIL_Codes]
AS
SELECT DISTINCT CONVERT(date, a.LocalTimeStamp) AS LocalDate, a.DateYear, a.DateMonth, DATEPART(wk, a.LocalTimeStamp) AS DateWeek, a.DateDay
, a.VehicleId, STUFF
                   ((SELECT N', ' + CAST(Replace(Replace(MILCodes, '#' + b.VehicleId + '#', ''), 'v', '') AS VarChar(150))
                     FROM   dbo.Stratagis_Historic_Mart b
                     WHERE b.MILCodes <> '' AND b.MILCodes IS NOT NULL AND b.DateYear = a.DateYear AND b.DateMonth = a.DateMonth AND b.DateDay = a.DateDay AND 
                                    a.VehicleId = b.VehicleId FOR XML PATH('')/*,TYPE*/ ), 1, 2, '') AS MILCodes
FROM  dbo.Stratagis_Historic_Mart a
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_MIL_Codes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_MIL_Codes'
GO
/****** Object:  View [dbo].[Stratagis_Report_Monthly]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Report_Monthly]
AS
SELECT a.DateYear, a.DateMonth, a.VehicleId, SUM(HoursRunning) AS HoursRunning, SUM(HoursIdle) AS HoursIdle, SUM(HoursOff) AS HoursOff, Sum(DIHours) 
               AS DIHours, SUM(TotalMiles) AS TotalMiles, round(SUM(TotalMiles) / SUM(HoursRunning), 2) AS AvgSpeed, max(a.MaxSpeed) AS MaxSpeed, 
               CONVERT(varchar, CONVERT(time, cast(avg(cast(CONVERT(datetime, OnTime) AS float)) AS datetime)), 100) AS OnTime, CONVERT(varchar, CONVERT(time, cast(avg(cast(CONVERT(datetime, OffTime) AS float)) AS datetime)), 
               100) AS OffTime, STUFF
                   ((SELECT N', ' + CAST(Replace(Replace(MILCodes, '#' + b.VehicleId + '#', ''), 'v', '') AS VarChar(150))
                     FROM   dbo.Stratagis_Daily_Report_Mart b
                     WHERE b.MILCodes <> '' AND b.MILCodes IS NOT NULL AND b.DateYear = a.DateYear AND b.DateMonth = a.DateMonth AND a.VehicleId = b.VehicleId FOR 
                                    XML PATH('')/*,TYPE*/ ), 1, 2, '') AS MILCodes
FROM  dbo.Stratagis_Daily_Report_Mart a
GROUP BY a.DateYear, a.DateMonth, a.VehicleId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Report_Monthly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Report_Monthly'
GO
/****** Object:  View [dbo].[Stratagis_Report_Weekly]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Report_Weekly]
AS
SELECT a.DateYear, a.DateMonth, a.DateWeek, a.VehicleId, SUM(HoursRunning) AS HoursRunning, SUM(HoursIdle) AS HoursIdle, SUM(HoursOff) AS HoursOff, 
               sum(ROUND(ISNULL(DIHours, 0), 2)) AS DIHours, SUM(TotalMiles) AS TotalMiles, round(SUM(TotalMiles) / SUM(HoursRunning), 2) AS AvgSpeed, 
               max(a.MaxSpeed) AS MaxSpeed, CONVERT(varchar, CONVERT(time, cast(avg(cast(CONVERT(datetime, OnTime) AS float)) AS datetime)), 100) 
               AS OnTime,  CONVERT(varchar, CONVERT(time, 
               cast(avg(cast(CONVERT(datetime, OffTime) AS float)) AS datetime)), 100) AS OffTime, STUFF
                   ((SELECT N', ' + CAST(Replace(Replace(MILCodes, '#' + b.VehicleId + '#', ''), 'v', '') AS VarChar(150))
                     FROM   dbo.Stratagis_Daily_Report_Mart b
                     WHERE b.MILCodes <> '' AND b.MILCodes IS NOT NULL AND b.DateYear = a.DateYear AND b.DateMonth = a.DateMonth AND b.DateWeek = a.DateWeek AND 
                                    a.VehicleId = b.VehicleId FOR XML PATH('')/*,TYPE*/ ), 1, 2, '') AS MILCodes
FROM  dbo.Stratagis_Daily_Report_Mart a

GROUP BY a.DateYear, a.DateMonth, a.DateWeek, a.VehicleId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Report_Weekly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Report_Weekly'
GO
/****** Object:  UserDefinedFunction [dbo].[version_view_name]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[version_view_name]
(@owner NVARCHAR(128), @table NVARCHAR(128))
RETURNS NVARCHAR(128)
AS BEGIN
DECLARE @view_name NVARCHAR(128)
SELECT @view_name = imv_view_name FROM Troy.dbo.SDE_table_registry  WHERE owner = @owner AND table_name = @table AND 
(object_flags & 8) > 0
RETURN @view_name
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_xml_indexes_def_update]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_xml_indexes_def_update]
@index_id INTEGER, @indexNameVal NVARCHAR(32),
@descriptionVal NVARCHAR(64)
AS SET NOCOUNT ON
BEGIN
  UPDATE Troy.dbo.SDE_xml_indexes
   SET index_name = @indexNameVal, description = @descriptionVal
   WHERE index_id = @index_id
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_xml_indexes_def_insert]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_xml_indexes_def_insert]
@ownerVal NVARCHAR(32),@indexNameVal NVARCHAR(32),
@indexTypeVal INTEGER, @descriptionVal NVARCHAR(64) AS
SET NOCOUNT ON BEGIN
INSERT INTO Troy.dbo.SDE_xml_indexes(index_name, owner, index_type, description) VALUES 
  (@indexNameVal, @ownerVal, @indexTypeVal, @descriptionVal)
DECLARE @index_id INTEGER
SELECT @index_id = @@IDENTITY
RETURN @index_id
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_xml_indexes_def_delete]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_xml_indexes_def_delete]
@ownerVal NVARCHAR(32),@indexNameVal NVARCHAR(64) AS
SET NOCOUNT ON BEGIN
BEGIN TRAN xml_index_del
-- Delete index record. Cascading constraint will delete from Troy.dbo.SDE_xml_index_tags 
DELETE FROM Troy.dbo.SDE_xml_indexes
  WHERE owner = @ownerVal AND index_name = @indexNameVal
COMMIT TRAN xml_index_del
END
GO
/****** Object:  View [dbo].[ST_SPATIAL_REFERENCE_SYSTEMS]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ST_SPATIAL_REFERENCE_SYSTEMS] (srs_id, x_offset,       x_scale, y_offset, y_scale, z_offset, z_scale, m_offset,        m_scale, organization,organization_coordsys_id, definition)       AS SELECT srid, falsex, xyunits, falsey, xyunits,       falsez, zunits, falsem, munits,        auth_name, auth_srid, srtext  FROM       Troy.dbo.SDE_spatial_references
GO
/****** Object:  Table [dbo].[SDE_xml_columns]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_xml_columns](
	[column_id] [int] IDENTITY(1,1) NOT NULL,
	[registration_id] [int] NOT NULL,
	[column_name] [nvarchar](32) NOT NULL,
	[index_id] [int] NULL,
	[minimum_id] [int] NULL,
	[config_keyword] [nvarchar](32) NULL,
	[xflags] [int] NOT NULL,
 CONSTRAINT [xml_columns_pk] PRIMARY KEY NONCLUSTERED 
(
	[column_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [xml_columns_uk] ON [dbo].[SDE_xml_columns] 
(
	[registration_id] ASC,
	[column_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SDE_versions_def_update]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_versions_def_update]        @statusVal INTEGER, @descVal NVARCHAR(64), @nameVal NVARCHAR(64),        @ownerVal NVARCHAR(32) AS SET NOCOUNT ON UPDATE Troy.dbo.SDE_versions SET status = @statusVal,        description = @descVal WHERE name = @nameVal and owner = @ownerVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_versions_def_rename_parent]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_versions_def_rename_parent] @newNameVal     NVARCHAR(64), @oldNameVal NVARCHAR(64), @ownerVal NVARCHAR(32) AS    SET NOCOUNT OFF    UPDATE Troy.dbo.SDE_versions     SET parent_name = @newNameVal WHERE parent_name = @oldNameVal    AND parent_owner = @ownerVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_versions_def_rename]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_versions_def_rename] @newNameVal     NVARCHAR(64), @oldNameVal NVARCHAR(64), @ownerVal NVARCHAR(32) AS    DECLARE @result INTEGER    SET @result = 0    IF UPPER(@ownerVal) = 'dbo' AND UPPER(@oldNameVal) = 'DEFAULT'      SET @result = -25 /* SE_NO_PERMISSIONS */    ELSE    BEGIN      SET NOCOUNT OFF      UPDATE Troy.dbo.SDE_versions SET name = @newNameVal        WHERE name = @oldNameVal and owner = @ownerVal    END    RETURN @result
GO
/****** Object:  StoredProcedure [dbo].[SDE_versions_def_insert]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_versions_def_insert]
@nameVal NVARCHAR(64) OUTPUT, @ownerVal NVARCHAR(32), @versionIdVal INTEGER,
@statusVal INTEGER, @stateIdVal BIGINT, @descVal NVARCHAR(64),
@pNameVal NVARCHAR(64), @pOwnerVal NVARCHAR(32), @pVersionIdVal INTEGER,
@dateVal DATETIME, @nameRuleVal INTEGER AS SET NOCOUNT ON
BEGIN
  DECLARE @suffix INTEGER
  DECLARE @ret_code INTEGER
  DECLARE @err_code INTEGER
  DECLARE @error_string NVARCHAR(256)
  DECLARE @local_version_name NVARCHAR(65)
  DECLARE @done INTEGER

  DECLARE @SE_VERSION_EXIST INTEGER
  SET @SE_VERSION_EXIST = 50177

  SET @local_version_name = RTRIM (@nameVal)
  SET @done = 0
  SET @suffix = 0

  WHILE @done = 0
  BEGIN 
    INSERT INTO Troy.dbo.SDE_versions (name, owner, version_id, status,
      state_id, description, parent_name, parent_owner,
      parent_version_id, creation_time) VALUES (
      @local_version_name,@ownerVal,@versionIdVal,@statusVal,@stateIdVal,
      @descVal,@pNameVal,@pOwnerVal,@pVersionIdVal,@dateVal)
    SET @err_code = @@error
    IF @err_code = 0
    BEGIN
      -- Insert worked, exit loop
      SET @done = 1
      SET @ret_code = 0
    END
    ELSE
    BEGIN
      IF @err_code = 2627
      BEGIN
        IF @nameRuleVal = 1
        BEGIN
          -- Unique constraint violation, let's try to generate a
          -- unique name
          SET @suffix = @suffix + 1
          SET @local_version_name = RTRIM (@nameVal) +
                                    cast (@suffix AS NVARCHAR(10))
          IF LEN (@local_version_name) > 64
          BEGIN
            SET @done = 1
            SET @ret_code = @SE_VERSION_EXIST
            SET @error_string = N'Unable to generate a name for ' + @nameVal
            RAISERROR (@error_string,16,-1)
          END
        END
        ELSE
        BEGIN
          -- Unique constraint violation, and we are not generating
          -- unique names
          SET @done = 1
          SET @ret_code = @SE_VERSION_EXIST
          SET @error_string = N'Version ' +  @nameVal + N' already exists.'
          RAISERROR (@error_string,16,-1)
        END
      END
      ELSE
      BEGIN
        -- Some other error occurred
        SET @done = 1
        SET @ret_code = @err_code
        SET @error_string = N'Unable to create version ' +  @nameVal
        RAISERROR (@error_string,16,-1)
      END
    END
  END

  -- Set the returned name, in case we changed it.
  SET @nameVal = @local_version_name

  RETURN @ret_code
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_versions_def_delete]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_versions_def_delete]       @ownerVal NVARCHAR(32), @nameVal  NVARCHAR(64) AS SET NOCOUNT ON      DECLARE @result INTEGER      SET @result = 0      IF UPPER(@ownerVal) = UPPER('dbo') AND UPPER(@nameVal) = 'DEFAULT'        SET @result = -25 /* SE_NO_PERMISSIONS */      ELSE        DELETE FROM Troy.dbo.SDE_versions WHERE owner = @ownerVal AND name = @nameVal      RETURN @result
GO
/****** Object:  StoredProcedure [dbo].[SDE_versions_def_change_state]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_versions_def_change_state] @newStateIdVal BIGINT,      @nameVal NVARCHAR(64), @ownerVal NVARCHAR(32), @oldStateIdVal BIGINT AS      SET NOCOUNT OFF      UPDATE Troy.dbo.SDE_versions SET       state_id = @newStateIdVal WHERE name = @nameVal and owner = @ownerVal AND       state_id = @oldStateIdVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_table_lock_def_delete_user]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_table_lock_def_delete_user] @sdeIdVal INTEGER AS SET NOCOUNT ON     BEGIN TRAN table_lock_tran     DELETE FROM Troy.dbo.SDE_table_locks WHERE  sde_id = @sdeIdVal     COMMIT TRAN table_lock_tran
GO
/****** Object:  StoredProcedure [dbo].[SDE_table_lock_def_delete]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_table_lock_def_delete] @sdeIdVal INTEGER, @registrationIdVal INTEGER AS     SET NOCOUNT ON BEGIN TRAN table_lock_del_tran     DECLARE @ret_val INTEGER     DELETE FROM Troy.dbo.SDE_table_locks WITH (TABLOCKX) WHERE  sde_id = @sdeIdVal AND     registration_id = @registrationIdVal     IF @@ROWCOUNT = 0 SET @ret_val = -48 /* SE_NO_LOCKS */     ELSE SET @ret_val = 0 /* SE_SUCCESS */     COMMIT TRAN table_lock_del_tran     RETURN @ret_val
GO
/****** Object:  Table [dbo].[SDE_xml_index_tags]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_xml_index_tags](
	[index_id] [int] NOT NULL,
	[tag_id] [int] IDENTITY(1,1) NOT NULL,
	[tag_name] [nvarchar](1024) NOT NULL,
	[data_type] [int] NOT NULL,
	[tag_alias] [int] NULL,
	[description] [nvarchar](64) NULL,
	[is_excluded] [int] NOT NULL,
 CONSTRAINT [xml_indextags_pk] PRIMARY KEY CLUSTERED 
(
	[index_id] ASC,
	[tag_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [xml_indextags_ix1] ON [dbo].[SDE_xml_index_tags] 
(
	[tag_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [xml_indextags_ix2] ON [dbo].[SDE_xml_index_tags] 
(
	[tag_alias] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SDE_states]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_states](
	[state_id] [bigint] NOT NULL,
	[owner] [nvarchar](32) NOT NULL,
	[creation_time] [datetime] NOT NULL,
	[closing_time] [datetime] NULL,
	[parent_state_id] [bigint] NOT NULL,
	[lineage_name] [bigint] NOT NULL,
 CONSTRAINT [states_pk] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY],
 CONSTRAINT [states_cuk] UNIQUE NONCLUSTERED 
(
	[parent_state_id] ASC,
	[lineage_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SDE_state_lock_def_delete_user]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_state_lock_def_delete_user] @sdeIdVal INTEGER AS SET NOCOUNT ON     BEGIN TRAN state_lock_tran     DELETE FROM Troy.dbo.SDE_state_locks WHERE  sde_id = @sdeIdVal     COMMIT TRAN state_lock_tran
GO
/****** Object:  StoredProcedure [dbo].[SDE_state_lock_def_delete]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_state_lock_def_delete]
@sdeIdVal INTEGER,
@stateIdVal BIGINT,
@autoLockVal VARCHAR(1),
@markedVal INTEGER AS SET NOCOUNT ON
BEGIN TRAN state_lock_del_tran
DECLARE @ret_val INTEGER
IF (@markedVal = 0)
 DELETE FROM Troy.dbo.SDE_state_locks WITH (TABLOCKX) WHERE  sde_id = @sdeIdVal AND state_id = @stateIdVal AND autolock = @autoLockVal AND lock_type <> 'M'
ELSE
 DELETE FROM Troy.dbo.SDE_state_locks WITH (TABLOCKX) WHERE  sde_id = @sdeIdVal AND state_id = @stateIdVal AND autolock = @autoLockVal
IF @@ROWCOUNT = 0 SET @ret_val = -48 /* SE_NO_LOCKS */
ELSE SET @ret_val = 0 /* SE_SUCCESS */
COMMIT TRAN state_lock_del_tran
RETURN @ret_val
GO
/****** Object:  StoredProcedure [dbo].[SDE_sref_def_update]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_sref_def_update]       @sridVal INTEGER, @falsexVal FLOAT, @falseyVal FLOAT, @xyunitsVal FLOAT,      @falsezVal FLOAT, @zunitsVal FLOAT, @falsemVal FLOAT,       @munitsVal FLOAT, @object_flagsVal INTEGER,       @srtextVal TEXT, @descriptionVal NVARCHAR(64),       @auth_nameVal NVARCHAR(255), @auth_sridVal INTEGER,       @xycluster_tolVal FLOAT, @zcluster_tolVal FLOAT, @mcluster_tolVal FLOAT      AS SET NOCOUNT ON UPDATE Troy.dbo.SDE_spatial_references SET falsex = @falsexVal,       falsey = @falseyVal,xyunits = @xyunitsVal,falsez = @falsezVal,       zunits = @zunitsVal,falsem = @falsemVal,munits = @munitsVal,       object_flags = @object_flagsVal, srtext = @srtextVal,       description = @descriptionVal,       auth_name = @auth_nameVal, auth_srid = @auth_sridVal,      xycluster_tol = @xycluster_tolVal,zcluster_tol = @zcluster_tolVal,      mcluster_tol = @mcluster_tolVal      WHERE srid = @sridVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_sref_def_insert]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_sref_def_insert]       @sridVal INTEGER, @falsexVal FLOAT, @falseyVal FLOAT,       @xyunitsVal FLOAT, @falsezVal FLOAT, @zunitsVal FLOAT,       @falsemVal FLOAT, @munitsVal FLOAT, @object_flagsVal INTEGER,       @srtextVal TEXT, @descriptionVal NVARCHAR(64),       @auth_nameVal NVARCHAR(255), @auth_sridVal INTEGER,       @xycluster_tolVal FLOAT, @zcluster_tolVal FLOAT, @mcluster_tolVal FLOAT      AS SET NOCOUNT ON INSERT INTO Troy.dbo.SDE_spatial_references       (srid,falsex,falsey,xyunits,falsez,zunits,falsem,munits,object_flags,       srtext, description,auth_name,auth_srid,xycluster_tol,zcluster_tol,      mcluster_tol) VALUES (@sridVal, @falsexVal, @falseyVal,       @xyunitsVal, @falsezVal, @zunitsVal, @falsemVal, @munitsVal,       @object_flagsVal, @srtextVal, @descriptionVal, @auth_nameVal,      @auth_sridVal, @xycluster_tolVal, @zcluster_tolVal, @mcluster_tolVal)
GO
/****** Object:  StoredProcedure [dbo].[SDE_sref_def_delete]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_sref_def_delete]       @sridVal INTEGER AS SET NOCOUNT ON DELETE FROM Troy.dbo.SDE_spatial_references WHERE srid = @sridVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_metadata_def_update]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_metadata_def_update]       @record_idVal INTEGER, @class_nameVal      NVARCHAR(32), @propertyVal NVARCHAR(32), @prop_valueVal NVARCHAR(255),        @descriptionVal NVARCHAR(64), @creation_dateVal DATETIME AS      SET NOCOUNT ON UPDATE Troy.dbo.SDE_metadata      SET class_name = @class_nameVal,property = @propertyVal,      prop_value = @prop_valueVal,description = @descriptionVal,      creation_date = @creation_dateVal WHERE record_id = @record_idVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_metadata_def_insert]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_metadata_def_insert]       @record_idVal INTEGER, @object_nameVal NVARCHAR(32), @object_databaseVal NVARCHAR(32),       @object_ownerVal NVARCHAR(32),@object_typeVal INTEGER, @class_nameVal      NVARCHAR(32), @propertyVal NVARCHAR(32), @prop_valueVal NVARCHAR(255),        @descriptionVal NVARCHAR(64), @creation_dateVal DATETIME AS SET NOCOUNT ON      INSERT INTO Troy.dbo.SDE_metadata      (record_id,object_name,object_database,object_owner,object_type,class_name,property,      prop_value,description,creation_date) VALUES (@record_idVal, @object_nameVal,      @object_databaseVal, @object_ownerVal, @object_typeVal, @class_nameVal, @propertyVal,      @prop_valueVal, @descriptionVal, @creation_dateVal)
GO
/****** Object:  StoredProcedure [dbo].[SDE_metadata_def_delete]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_metadata_def_delete] @id1        INTEGER, @id2 INTEGER, @id3 INTEGER, @id4 INTEGER, @id5 INTEGER,        @id6 INTEGER, @id7 INTEGER, @id8 INTEGER, @id9 INTEGER, @id10 INTEGER AS       SET NOCOUNT ON DELETE FROM Troy.dbo.SDE_metadata WHERE record_id IN (       @id1, @id2, @id3, @id4, @id5, @id6, @id7, @id8, @id9, @id10)
GO
/****** Object:  StoredProcedure [dbo].[SDE_registry_def_change_table_name]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_registry_def_change_table_name]       @tabNameVal sysname, @regIdVal INTEGER AS SET NOCOUNT ON
      UPDATE m set m.object_name = @tabNameVal from Troy.dbo.SDE_metadata m 
       INNER JOIN Troy.dbo.SDE_table_registry r ON 
       m.object_database = r.database_name AND m.object_name = r.table_name AND 
       m.object_owner = r.owner 
       WHERE  r.registration_id = @regIdVal AND m.object_type = 1 
      UPDATE Troy.dbo.SDE_table_registry SET table_name = @tabNameVal WHERE registration_id = @regIdVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_registry_def_update]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_registry_def_update]        @rowidColVal NVARCHAR(32), @descVal NVARCHAR(65), @objFlagsVal INTEGER,       @conKeyWordVal  NVARCHAR(32), @minIdVal INTEGER, @regIdVal INTEGER,       @imvNameVal NVARCHAR (128) AS SET NOCOUNT ON       UPDATE Troy.dbo.SDE_table_registry SET rowid_column = @rowidColVal, description = @descVal,       object_flags = @objFlagsVal ,config_keyword = @conKeyWordVal,       minimum_id = @minIdVal, imv_view_name = @imvNameVal       WHERE registration_id = @regIdVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_registry_def_insert]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_registry_def_insert]        @regIdVal INTEGER, @dbNameVal NVARCHAR(32), @tabNameVal sysname, @ownerVal NVARCHAR(32),       @rowidColVal NVARCHAR(32), @descVal NVARCHAR(65), @objFlagsVal INTEGER,       @regDate INTEGER, @conKeyWordVal  NVARCHAR(32), @minIdVal INTEGER,        @imvNameVal NVARCHAR(128) AS SET NOCOUNT ON       INSERT INTO Troy.dbo.SDE_table_registry (registration_id, database_name, table_name, owner,       rowid_column,description,object_flags,registration_date,       config_keyword,minimum_id,imv_view_name) VALUES ( @regIdVal, @dbNameVal, @tabNameVal,       @ownerVal,@rowidColVal, @descVal, @objFlagsVal, @regDate, @conKeyWordVal, @minIdVal,       @imvNameVal)
GO
/****** Object:  StoredProcedure [dbo].[SDE_server_config_insert]    Script Date: 12/03/2014 13:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_server_config_insert]
 @PropNameVal NVARCHAR(32),
    @CharPropVal NVARCHAR(512),
    @NumPropVal INTEGER AS SET NOCOUNT ON
    UPDATE Troy.dbo.SDE_server_config SET prop_name = UPPER(@PropNameVal), 
    char_prop_value = @CharPropVal, 
     num_prop_value = @NumPropVal WHERE prop_name =  UPPER(@PropNameVal) 

    IF @@ROWCOUNT = 0 
     INSERT INTO Troy.dbo.SDE_server_config (prop_name,char_prop_value,num_prop_value) 
     VALUES (UPPER(@PropNameVal),@CharPropVal,@NumPropVal)
GO
/****** Object:  StoredProcedure [dbo].[SDE_state_def_update]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_state_def_update]
@stateIdVal BIGINT, @OpenOrCloseVal INTEGER,
@clTimeVal DATETIME OUTPUT AS SET NOCOUNT ON 
BEGIN
DECLARE @closeTimeVal DATETIME
SET @clTimeVal = GETDATE()
IF @OpenOrCloseVal = 2
BEGIN
  SET @closeTimeVal = @clTimeVal
END
ELSE
BEGIN
  SET @closeTimeVal = NULL
END
BEGIN TRAN state_def_update
UPDATE Troy.dbo.SDE_states SET closing_time = @closeTimeVal
  WHERE state_id = @stateIdVal
COMMIT TRAN state_def_update
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_state_def_trim_states]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_state_def_trim_states]
@highStateIdVal BIGINT, @lowStateIdVal BIGINT AS SET NOCOUNT ON
BEGIN
  IF @lowStateIdVal = 0
  BEGIN
    -- Uninvert the inverted lineage names; once the delete is done
    -- it is safe to put them back. Make sure to use RC so that
    -- we don't update another process's negative lineages.
    UPDATE Troy.dbo.SDE_states WITH (READCOMMITTED)
    SET    lineage_name = -lineage_name
    WHERE  lineage_name < 0 AND parent_state_id = 0
  END
  ELSE
  BEGIN
    -- Return the lineage id to a positive number.
    UPDATE Troy.dbo.SDE_states
    SET    lineage_name = -lineage_name
    WHERE  state_id = @highStateIdVal
  END
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_state_check_lock_conflicts]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_state_check_lock_conflicts]
@sdeIdVal INTEGER,
@stateIdVal BIGINT,
@autoLockVal VARCHAR(1),
@lockTypeVal VARCHAR(1),
@lock_conflict INTEGER OUTPUT AS SET NOCOUNT ON
BEGIN
  DECLARE locks_cursor CURSOR LOCAL FAST_FORWARD FOR
    SELECT sde_id
    FROM   Troy.dbo.SDE_state_locks WITH (TABLOCKX,HOLDLOCK)
    WHERE ((state_id = @stateIdVal AND
           (sde_id <> @sdeIdVal OR 
            autolock = @autoLockVal) AND
           (lock_type = 'E' /* E: Exclusive lock */ OR 
            @lockTypeVal = 'E')) OR
          (lock_type = 'X' /* X: Exclusive lock all */ OR
           @lockTypeVal = 'X')) AND
          lock_type <> 'M'
  /* Find any conflicting locks.  The query we use is sensitive about
     whether we are trying to place an exclusive lock (in which case we
     have to consider all locks as possibly conflicting), or a shared lock
     (in which case we only have to worry about conflicting with exclusive
     locks).  With all of the about constraints in place, if any rows
     are returned, we probably have a conflict.  The last thing we have to
     check is if the connection owning the lock has somehow died without
     cleaning up. */
  OPEN locks_cursor
  DECLARE @loop_done INTEGER
  DECLARE @id INTEGER
  SET @lock_conflict = 0
  SET @loop_done = 0
  DECLARE @f_sde_id INTEGER
  WHILE @loop_done = 0
  BEGIN 
    FETCH NEXT FROM locks_cursor INTO @f_sde_id
    IF @@FETCH_STATUS = 0
    BEGIN
      /* We found a matching table lock.  See if the owning connection
         id is still out there.  If not, then this lock is invalid. */

      SELECT @id = SO.object_id
        FROM tempdb.sys.objects SO INNER JOIN
            Troy.dbo.SDE_process_information        PR ON object_id (PR.table_name) = SO.object_id
        WHERE PR.sde_id = @f_sde_id

      IF @@ROWCOUNT > 0
      BEGIN
        /* we have a lock conflict! */
        SET @lock_conflict = 1
        SET @loop_done = 1
      END
      ELSE
      BEGIN
         /* defunct connection found, clean it up */
         EXECUTE Troy.dbo.SDE_pinfo_def_delete @f_sde_id
      END
     END
     ELSE
       SET @loop_done = 1
  END /* while */
  CLOSE locks_cursor
  DEALLOCATE locks_cursor
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_xml_columns_def_update]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_xml_columns_def_update]
@columnIdVal INTEGER, @indexIdVal INTEGER, @minimumIdVal INTEGER,
@configKeywordVal NVARCHAR(32), @xflagsVal INTEGER
AS SET NOCOUNT ON
BEGIN
-- Either we're updating all three columns, or just the index
IF @minimumIdVal IS NOT NULL
BEGIN
  UPDATE Troy.dbo.SDE_xml_columns
  SET index_id =  @indexIdVal,
  minimum_id =  @minimumIdVal,
  config_keyword =  @configKeywordVal,
  xflags =  @xflagsVal
  WHERE column_id =  @columnIdVal
END
ELSE
BEGIN
  UPDATE Troy.dbo.SDE_xml_columns
  SET index_id =  @indexIdVal
  WHERE column_id =  @columnIdVal
END
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_xml_columns_def_insert]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_xml_columns_def_insert]
@regIdVal INTEGER, @colNameVal NVARCHAR(32),
@indexIdVal INTEGER, @minimumIdVal INTEGER,
@configKeywordVal NVARCHAR(32), @xflagsVal INTEGER
AS SET NOCOUNT ON
BEGIN
INSERT INTO Troy.dbo.SDE_xml_columns
  (registration_id, column_name, index_id, minimum_id, config_keyword, xflags) VALUES
  (@regIdVal, @colNameVal, @indexIdVal, @minimumIdVal, @configKeywordVal, @xflagsVal)
DECLARE @column_id INTEGER
SELECT @column_id = @@IDENTITY
RETURN @column_id
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_xml_columns_def_delete]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_xml_columns_def_delete]
@columnIdVal INTEGER AS SET NOCOUNT ON
BEGIN
DELETE FROM Troy.dbo.SDE_xml_columns WHERE column_id =  @columnIdVal
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_table_check_lock_conflicts]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_table_check_lock_conflicts]
@sdeIdVal INTEGER,
@registrationIdVal INTEGER,
@lockTypeVal VARCHAR(1),
@lock_conflict INTEGER OUTPUT AS SET NOCOUNT ON
BEGIN
  DECLARE locks_cursor CURSOR LOCAL FAST_FORWARD FOR
    SELECT sde_id
    FROM   Troy.dbo.SDE_table_locks WITH (TABLOCKX,HOLDLOCK)
    WHERE  registration_id = @registrationIdVal AND
           (lock_type = 'E' /* E: Exclusive lock */ OR
           @lockTypeVal = 'E')
  /* Find any conflicting locks.  The query we use is sensitive about
     whether we are trying to place an exclusive lock (in which case we
     have to consider all locks as possibly conflicting), or a shared lock
     (in which case we only have to worry about conflicting with exclusive
     locks).  With all of the about constraints in place, if any rows
     are returned, we probably have a conflict.  The last thing we have to
     check is if the connection owning the lock has somehow died without
     cleaning up. */
  OPEN locks_cursor
  DECLARE @loop_done INTEGER
  DECLARE @id INTEGER
  SET @lock_conflict = 0
  SET @loop_done = 0
  DECLARE @f_sde_id INTEGER
  WHILE @loop_done = 0
  BEGIN 
    FETCH NEXT FROM locks_cursor
      INTO @f_sde_id
    IF @@FETCH_STATUS = 0
    BEGIN
      /* We found a matching table lock.  See if the owning connection
         id is still out there.  If not, then this lock is invalid. */

      SELECT @id = SO.object_id
        FROM tempdb.sys.objects SO INNER JOIN
            Troy.dbo.SDE_process_information        PR ON object_id (PR.table_name) = SO.object_id
        WHERE PR.sde_id = @f_sde_id

      IF @@ROWCOUNT > 0
      BEGIN
        /* we have a lock conflict! */
        SET @lock_conflict = 1
        SET @loop_done = 1
      END
      ELSE
      BEGIN
         /* defunct connection found, clean it up */
         EXECUTE Troy.dbo.SDE_pinfo_def_delete @f_sde_id
      END
     END
     ELSE
       SET @loop_done = 1
  END /* while */
  CLOSE locks_cursor
  DEALLOCATE locks_cursor
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_xml_index_tags_def_update]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_xml_index_tags_def_update]
@indexIdVal INTEGER, @tagNameVal NVARCHAR(1024),
@tagAliasVal INTEGER, @descriptionVal NVARCHAR(64),
@isExcludedVal INTEGER AS
SET NOCOUNT ON
BEGIN
  UPDATE Troy.dbo.SDE_xml_index_tags SET tag_alias = @tagAliasVal,
    description = @descriptionVal, is_excluded = @isExcludedVal
    WHERE index_id = @indexIdVal AND tag_name = @tagNameVal
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_xml_index_tags_def_insert]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_xml_index_tags_def_insert]
@index_id INTEGER, @tagNameVal NVARCHAR(1024),
@dataTypeVal INTEGER, @tagAliasVal INTEGER,
@descriptionVal NVARCHAR(64), @excluded  INTEGER
AS SET NOCOUNT ON
BEGIN
  INSERT INTO Troy.dbo.SDE_xml_index_tags
   (index_id, tag_name, data_type, tag_alias, description, is_excluded)   VALUES (@index_id, @tagNameVal, @dataTypeVal, @tagAliasVal,
           @descriptionVal, @excluded)
  DECLARE @tag_id INTEGER
  SELECT @tag_id = @@IDENTITY
  RETURN @tag_id
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_xml_index_tags_def_delete]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_xml_index_tags_def_delete]
@indexIdVal INTEGER, @id1 INTEGER, @id2 INTEGER, @id3 INTEGER,
@id4 INTEGER, @id5 INTEGER, @id6 INTEGER, @id7 INTEGER, @id8 INTEGER AS
SET NOCOUNT ON
BEGIN
  DELETE FROM Troy.dbo.SDE_xml_index_tags WHERE index_id = @indexIdVal
  AND tag_id IN (@id1, @id2, @id3, @id4, @id5, @id6, @id7, @id8)
END
GO
/****** Object:  View [dbo].[ST_GEOMETRY_COLUMNS]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ST_GEOMETRY_COLUMNS] (table_schema, table_name,       column_name, type_schema, type_name,  srs_id) AS        SELECT f_table_schema, f_table_name, f_geometry_column,'dbo',       CASE geometry_type        WHEN 0 THEN 'ST_GEOMETRY'        WHEN 1 THEN 'ST_POINT'        WHEN 2 THEN 'ST_CURVE'        WHEN 3 THEN 'ST_LINESTRING'        WHEN 4 THEN 'ST_SURFACE'        WHEN 5 THEN 'ST_POLYGON'        WHEN 6 THEN 'ST_COLLECTION'        WHEN 7 THEN 'ST_MULTIPOINT'        WHEN 8 THEN 'ST_MULTICURVE'        WHEN 9 THEN 'ST_MULTISTRING'        WHEN 10 THEN 'ST_MULTISURFACE'        WHEN 11 THEN 'ST_MULTIPOLYGON'        ELSE 'ST_GEOMETRY'        END,        srid FROM Troy.dbo.SDE_geometry_columns g
GO
/****** Object:  StoredProcedure [dbo].[spatial_ref_info]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatial_ref_info]
@owner NVARCHAR(128), @table NVARCHAR(128), @column NVARCHAR(128),
@wkid INT OUTPUT, @wkt NVARCHAR(4000) OUTPUT, @st_srid INT OUTPUT
AS SET NOCOUNT ON
BEGIN
DECLARE @layer_table NVARCHAR (128)
DECLARE @get_meta_spref INT

SET @get_meta_spref = 0 --Assume no metadata
SET @layer_table = @table

SELECT @layer_table = table_name FROM dbo.SDE_table_registry
  WHERE owner = @owner AND table_name = @table
IF @@ROWCOUNT = 0
BEGIN
  SELECT @layer_table = table_name FROM dbo.SDE_table_registry
    WHERE owner = @owner AND imv_view_name = @table
  IF @@ROWCOUNT > 0
    SET @get_meta_spref = 1
END
ELSE
  SET @get_meta_spref = 1

IF @get_meta_spref = 1
BEGIN
  -- table is registered, see if it's in the layers table
  SELECT @wkid = s.auth_srid, @wkt = s.srtext, @st_srid = s.srid 
  FROM dbo.SDE_layers l INNER JOIN dbo.SDE_spatial_references s
  ON l.srid = s.srid
  WHERE l.owner = @owner and l.table_name = @layer_table AND l.spatial_column = @column
  IF @@ROWCOUNT > 0
    RETURN -- we're done!
END

-- Need to get the spatial info from first shape
DECLARE @sql NVARCHAR(256)
SET @sql = N'SELECT TOP 1 @intval = ' + @column + '.STSrid FROM ' + @owner +  '.' + @layer_table +
           ' WHERE ' + @column + ' IS NOT NULL'
EXECUTE sp_executesql @sql, N'@intval integer output', @intval = @st_srid output

SELECT @wkid = spatial_reference_id, @wkt = well_known_text FROM sys.spatial_reference_systems
  WHERE spatial_reference_id = @st_srid
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_state_new_edit]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_state_new_edit]
@stateIdVal BIGINT, @ownerVal NVARCHAR(32),
@pStateIdVal BIGINT, @pLineageNameVal BIGINT OUTPUT,
@sdeIdVal INTEGER,
@crTimeVal DATETIME OUTPUT AS SET NOCOUNT ON
BEGIN
  DECLARE @new_lineage_name BIGINT
  DECLARE @ClosingTime DATETIME

  BEGIN TRAN state_new_edit
  --  Close parent state if it is open
  SELECT @ClosingTime = closing_time FROM Troy.dbo.SDE_states
     WHERE state_id = @pStateIdVal

  SET @crTimeVal = GETDATE()
  IF @ClosingTime  IS NULL
  BEGIN
     UPDATE Troy.dbo.SDE_states SET closing_time =  @crTimeVal 
          WHERE state_id = @pStateIdVal
  END

  SET @new_lineage_name = @pLineageNameVal
  BEGIN TRY
    INSERT INTO Troy.dbo.SDE_states (state_id,owner,
      creation_time, closing_time,parent_state_id,lineage_name) VALUES
      (@stateIdVal, @ownerVal, @crTimeVal, NULL, @pStateIdVal,
       @pLineageNameVal)
  END TRY
  BEGIN CATCH
    IF ERROR_NUMBER() = 2627 /* unique constraint violation */ 
    BEGIN
      INSERT INTO Troy.dbo.SDE_states (state_id,owner,creation_time, closing_time,
                                  parent_state_id,lineage_name) VALUES 
                (@stateIdVal, @ownerVal, @crTimeVal, NULL, @pStateIdVal, 
                 @stateIdVal)
      SET @new_lineage_name = @stateIdVal
    END
    ELSE
    BEGIN
      -- rethrow unexpected error
      DECLARE @ErrorMessage    NVARCHAR(4000),
        @ErrorNumber     INT,
        @ErrorSeverity   INT,
        @ErrorState      INT,
        @ErrorLine       INT,
        @ErrorProcedure  NVARCHAR(200);
      SELECT @ErrorNumber = ERROR_NUMBER(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE(),
        @ErrorLine = ERROR_LINE(),
        @ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-');
      SELECT @ErrorMessage = 
        N'Error %d, Level %d, State %d, Procedure %s, Line %d, ' +
        'Message: '+ ERROR_MESSAGE();
      RAISERROR (@ErrorMessage, @ErrorSeverity, 1,
        @ErrorNumber, @ErrorSeverity, @ErrorState,
        @ErrorProcedure, @ErrorLine);
    END
  END CATCH
  -- If we created a new lineage, insert it into the STATE_LINEAGE table
  --  in normalized form. 
  IF @new_lineage_name <> @pLineageNameVal
  BEGIN
    INSERT INTO Troy.dbo.SDE_state_lineages (lineage_name, lineage_id)
         SELECT @new_lineage_name,l.lineage_id
         FROM Troy.dbo.SDE_state_lineages l 
         WHERE l.lineage_name = @pLineageNameVal AND
               l.lineage_id <= @pStateIdVal
    SET @pLineageNameVal = @new_lineage_name
  END

  -- We also insert a row for this state, as if it were in its own
  -- state lineage. 

  INSERT INTO Troy.dbo.SDE_state_lineages  (lineage_name, lineage_id)
      VALUES (@new_lineage_name,@stateIdVal)

  -- Place a lock entry in the SDE_state_locks table.  Doing this directly
  -- is both safe and necessary.  Safe, as this is a newly created state
  -- so there can not be a conflict; necessary as this function needs to
  -- be efficient and secure, this is the only way to avoid rechecking
  -- the current user's access rights.

  INSERT INTO Troy.dbo.SDE_state_locks(sde_id,state_id,autolock,lock_type)
     VALUES (@sdeIdVal, @stateIdVal, 'N', 'E')
  COMMIT TRAN state_new_edit

END
GO
/****** Object:  View [dbo].[Stratagis_Vehicle_View]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Vehicle_View]
AS
SELECT     TOP (100) PERCENT derivedtbl_1.VehicleId, dbo.Stratagis_Vehicle_Info.AdjOdometer AS OdometerAdj, dbo.Stratagis_Vehicle_Info.Department, 
                      dbo.Stratagis_Vehicle_Info.VIN, dbo.Stratagis_Vehicle_Info.Year, dbo.Stratagis_Vehicle_Info.Make, dbo.Stratagis_Vehicle_Info.Model, 
                      dbo.Stratagis_Vehicle_Info.UseDescription, dbo.Stratagis_Vehicle_Info.MEID, dbo.Stratagis_Vehicle_Info.PhoneNumber
FROM         dbo.Stratagis_Vehicle_Info RIGHT OUTER JOIN
                          (SELECT     VehicleId
                            FROM          dbo.STRATAGIS_FLEET_HISTORIC
                            GROUP BY VehicleId) AS derivedtbl_1 ON dbo.Stratagis_Vehicle_Info.VehicleId = derivedtbl_1.VehicleId
GROUP BY derivedtbl_1.VehicleId, dbo.Stratagis_Vehicle_Info.AdjOdometer, dbo.Stratagis_Vehicle_Info.Department, dbo.Stratagis_Vehicle_Info.VIN, 
                      dbo.Stratagis_Vehicle_Info.Year, dbo.Stratagis_Vehicle_Info.Make, dbo.Stratagis_Vehicle_Info.Model, dbo.Stratagis_Vehicle_Info.UseDescription, 
                      dbo.Stratagis_Vehicle_Info.MEID, dbo.Stratagis_Vehicle_Info.PhoneNumber
ORDER BY derivedtbl_1.VehicleId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Stratagis_Vehicle_Info"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 278
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "derivedtbl_1"
            Begin Extent = 
               Top = 7
               Left = 280
               Bottom = 94
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Vehicle_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Vehicle_View'
GO
/****** Object:  View [dbo].[Stratagis_Trip_Stop]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Trip_Stop]
AS
SELECT     y.OBJECTID, y.TimeStamp, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), y.TimeStamp) AS LocalTimeStamp, YEAR(DATEADD(mi, DATEDIFF(mi, 
                      sysutcdatetime(), sysdatetime()), y.TimeStamp)) AS DateYear, MONTH(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), y.TimeStamp)) AS DateMonth, 
                      DAY(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), y.TimeStamp)) AS DateDay, CONVERT(varchar, CONVERT(time, DATEADD(mi, DATEDIFF(mi, 
                      sysutcdatetime(), sysdatetime()), y.TimeStamp)), 100) AS LocalTime, y.VehicleId, y.GpsOdometerMiles, DATEDIFF(s, y.TimeStamp, x.TimeStamp) AS StopTimeS, 
                      DATEDIFF(minute, y.TimeStamp, x.TimeStamp) AS StopTimeM, DATEDIFF(HH, y.TimeStamp, x.TimeStamp) AS StopTimeH
FROM         (SELECT     a.OBJECTID, a.VehicleId, MIN(b.OBJECTID) AS newObjectId
                       FROM          (SELECT     OBJECTID, TimeStamp, VehicleId, GpsOdometerMiles
                                               FROM          dbo.STRATAGIS_FLEET_HISTORIC
                                               WHERE      (EventNumber = 30)) AS a INNER JOIN
                                                  (SELECT     OBJECTID, TimeStamp, VehicleId, GpsOdometerMiles
                                                    FROM          dbo.STRATAGIS_FLEET_HISTORIC AS STRATAGIS_FLEET_HISTORIC_1
                                                    WHERE      (EventNumber = 30)) AS b ON a.OBJECTID < b.OBJECTID AND a.VehicleId = b.VehicleId
                       GROUP BY a.OBJECTID, a.TimeStamp, a.VehicleId) AS z INNER JOIN
                      dbo.STRATAGIS_FLEET_HISTORIC AS y ON z.OBJECTID = y.OBJECTID INNER JOIN
                      dbo.STRATAGIS_FLEET_HISTORIC AS x ON z.newObjectId = x.OBJECTID
WHERE     (DATEDIFF(minute, y.TimeStamp, x.TimeStamp) >= 2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "z"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 110
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "y"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "x"
            Begin Extent = 
               Top = 6
               Left = 473
               Bottom = 125
               Right = 672
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Trip_Stop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Trip_Stop'
GO
/****** Object:  View [dbo].[Stratagis_Trip_Start]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Trip_Start]
AS
SELECT     y.OBJECTID, y.TimeStamp, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), y.TimeStamp) AS LocalTimeStamp, YEAR(DATEADD(mi, DATEDIFF(mi, 
                      sysutcdatetime(), sysdatetime()), y.TimeStamp)) AS DateYear, MONTH(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), y.TimeStamp)) AS DateMonth, 
                      DAY(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), y.TimeStamp)) AS DateDay, CONVERT(varchar, CONVERT(time, DATEADD(mi, DATEDIFF(mi, 
                      sysutcdatetime(), sysdatetime()), y.TimeStamp)), 100) AS LocalTime, y.VehicleId, y.GpsOdometerMiles
FROM         (SELECT     a.OBJECTID, a.VehicleId, MAX(b.OBJECTID) AS newObjectId
                       FROM          (SELECT     OBJECTID, TimeStamp, VehicleId, GpsOdometerMiles
                                               FROM          dbo.STRATAGIS_FLEET_HISTORIC
                                               WHERE      (EventNumber = 30)) AS a INNER JOIN
                                                  (SELECT     OBJECTID, TimeStamp, VehicleId, GpsOdometerMiles
                                                    FROM          dbo.STRATAGIS_FLEET_HISTORIC AS STRATAGIS_FLEET_HISTORIC_1
                                                    WHERE      (EventNumber = 30)) AS b ON a.OBJECTID > b.OBJECTID AND a.VehicleId = b.VehicleId
                       GROUP BY a.OBJECTID, a.TimeStamp, a.VehicleId) AS z INNER JOIN
                      dbo.STRATAGIS_FLEET_HISTORIC AS y ON z.OBJECTID = y.OBJECTID INNER JOIN
                      dbo.STRATAGIS_FLEET_HISTORIC AS x ON z.newObjectId = x.OBJECTID
WHERE     (DATEDIFF(minute, y.TimeStamp, x.TimeStamp) <= - 2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "y"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 125
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "x"
            Begin Extent = 
               Top = 6
               Left = 473
               Bottom = 125
               Right = 672
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "z"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 110
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Trip_Start'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Trip_Start'
GO
/****** Object:  Trigger [STRATAGIS_FLEET_HISTORIC_insert]    Script Date: 12/03/2014 13:10:13 ******/
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
/****** Object:  Trigger [GDB_REP_LOG_TR]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[GDB_REP_LOG_TR] ON [dbo].[GDB_REPLICALOG] FOR INSERT, UPDATE, DELETE AS BEGIN 
SET NOCOUNT ON 
UPDATE dbo.GDB_TABLES_LAST_MODIFIED SET last_modified_count = last_modified_count + 1 WHERE table_name = 'GDB_REPLICALOG' IF @@ROWCOUNT = 0 
BEGIN 
INSERT INTO dbo.GDB_TABLES_LAST_MODIFIED VALUES ('GDB_REPLICALOG', 1) 
END 
END
GO
/****** Object:  Trigger [GDB_ITEM_TYP_TR]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[GDB_ITEM_TYP_TR] ON [dbo].[GDB_ITEMTYPES] FOR INSERT, UPDATE, DELETE AS BEGIN 
SET NOCOUNT ON 
UPDATE dbo.GDB_TABLES_LAST_MODIFIED SET last_modified_count = last_modified_count + 1 WHERE table_name = 'GDB_ITEMTYPES' IF @@ROWCOUNT = 0 
BEGIN 
INSERT INTO dbo.GDB_TABLES_LAST_MODIFIED VALUES ('GDB_ITEMTYPES', 1) 
END 
END
GO
/****** Object:  Trigger [GDB_ITEM_REL_TYP_TR]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[GDB_ITEM_REL_TYP_TR] ON [dbo].[GDB_ITEMRELATIONSHIPTYPES] FOR INSERT, UPDATE, DELETE AS BEGIN 
SET NOCOUNT ON 
UPDATE dbo.GDB_TABLES_LAST_MODIFIED SET last_modified_count = last_modified_count + 1 WHERE table_name = 'GDB_ITEMRELATIONSHIPTYPES' IF @@ROWCOUNT = 0 
BEGIN 
INSERT INTO dbo.GDB_TABLES_LAST_MODIFIED VALUES ('GDB_ITEMRELATIONSHIPTYPES', 1) 
END 
END
GO
/****** Object:  UserDefinedFunction [dbo].[globalid_name]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[globalid_name]
(@owner NVARCHAR(128), @table NVARCHAR(128))
RETURNS VARCHAR(14)
AS BEGIN
-- check if the object is a multiversioned view
DECLARE @base_table NVARCHAR(128)
DECLARE @qualified_table NVARCHAR (200)
SET @qualified_table = db_name() + '.' + @owner + '.'

SELECT @base_table = table_name FROM Troy.dbo.SDE_table_registry 
  WHERE owner = @owner AND imv_view_name = @table
IF @@ROWCOUNT = 0
  SET @qualified_table = @qualified_table + @table
ELSE
  SET @qualified_table = @qualified_table + @base_table

DECLARE @def VARCHAR(max)
DECLARE @properties int
SELECT @def = CAST (definition AS VARCHAR(max)), @properties = properties
  FROM dbo.GDB_Items WHERE physicalname = @qualified_table
IF @@ROWCOUNT = 0
    RETURN 'NOT REGISTERED'
DECLARE @pos INT
DECLARE @pos2 INT
SET @pos = charindex ('<HasGlobalID>', @def)
SET @pos2 = charindex('</HasGlobalID>', @def, @pos)
IF @pos >= @pos2
    RETURN 'FALSE'
SET @pos = @pos + 13

DECLARE @str_val NVARCHAR(128)
SET @str_val = substring(@def,@pos,@pos2 - @pos)
IF @str_val = 'TRUE'
BEGIN
  SET @pos = charindex ('<GlobalIDFieldName>', @def)
  SET @pos2 = charindex('</GlobalIDFieldName>', @def, @pos)
  IF @pos >= @pos2
      RETURN NULL -- no global id in this table

  SET @pos = @pos + 19
  SET @str_val = substring(@def,@pos,@pos2 - @pos)
END
ELSE
  RETURN NULL
RETURN @str_val
END
GO
/****** Object:  Trigger [GDB_ITEMS_TAB_TR]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[GDB_ITEMS_TAB_TR] ON [dbo].[GDB_ITEMS] FOR INSERT, UPDATE, DELETE AS BEGIN 
SET NOCOUNT ON 
IF (SELECT COUNT(*) from inserted WHERE Type NOT IN ('4ED4A58E-621F-4043-95ED-850FBA45FCBC', 'D98421EB-D582-4713-9484-43304D0810F6','DC64B6E4-DC0F-43BD-B4F5-F22385DCF055','5B966567-FB87-4DDE-938B-B4B37423539D','D86502F9-9758-45C6-9D23-6DD1A0107B47')) > 0  OR 
(SELECT COUNT(*) from deleted WHERE Type NOT IN ('4ED4A58E-621F-4043-95ED-850FBA45FCBC', 'D98421EB-D582-4713-9484-43304D0810F6','DC64B6E4-DC0F-43BD-B4F5-F22385DCF055','5B966567-FB87-4DDE-938B-B4B37423539D','D86502F9-9758-45C6-9D23-6DD1A0107B47')) > 0 
 BEGIN 
UPDATE dbo.GDB_TABLES_LAST_MODIFIED SET last_modified_count = last_modified_count + 1 WHERE table_name = 'GDB_ITEMS' IF @@ROWCOUNT = 0 
BEGIN 
INSERT INTO dbo.GDB_TABLES_LAST_MODIFIED VALUES ('GDB_ITEMS', 1) 
END 
END END
GO
/****** Object:  Trigger [GDB_ITEMS_REL_TR]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[GDB_ITEMS_REL_TR] ON [dbo].[GDB_ITEMRELATIONSHIPS] FOR INSERT, UPDATE, DELETE AS BEGIN 
SET NOCOUNT ON 
IF (SELECT COUNT(*) from inserted WHERE Type NOT IN ('8DB31AF1-DF7C-4632-AA10-3CC44B0C6914', 'CC28387C-441F-4D7C-A802-41A160317FE0','79CC71C8-B7D9-4141-9014-B6373E236ABB', 'D022DE33-45BD-424C-88BF-5B1B6B957BD3')) > 0 OR 
(SELECT COUNT(*) from deleted WHERE Type NOT IN ('8DB31AF1-DF7C-4632-AA10-3CC44B0C6914', 'CC28387C-441F-4D7C-A802-41A160317FE0','79CC71C8-B7D9-4141-9014-B6373E236ABB', 'D022DE33-45BD-424C-88BF-5B1B6B957BD3')) > 0
BEGIN 
UPDATE dbo.GDB_TABLES_LAST_MODIFIED SET last_modified_count = last_modified_count + 1 WHERE table_name = 'GDB_ITEMRELATIONSHIPS' IF @@ROWCOUNT = 0 
BEGIN 
INSERT INTO dbo.GDB_TABLES_LAST_MODIFIED VALUES ('GDB_ITEMRELATIONSHIPS', 1) 
END 
END END
GO
/****** Object:  StoredProcedure [dbo].[SDE_get_globals]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_get_globals] 
@current_state BIGINT OUTPUT,
@protected CHAR(1) OUTPUT,
@is_default CHAR(1) OUTPUT,
@edit_version_id INTEGER OUTPUT,
@state_is_set INTEGER = -1 OUTPUT --optional param
AS SET NOCOUNT ON
BEGIN
  -- This is a private support procedure for SDE versioned views.
  -- 
  -- Context info contains: SDE,current state id,protected,is_default_version,edit_version_id;
  DECLARE @context_info VARCHAR(128)
  DECLARE  @delimiter INTEGER
  SELECT @context_info = CAST (context_info AS VARCHAR(128))
  FROM master.dbo.sysprocesses
  WHERE spid = @@SPID AND CAST (context_info AS VARCHAR(128)) like 'SDE%'
  IF @context_info IS NULL
    SET @delimiter = 0
  ELSE
  BEGIN
    IF substring (@context_info, 1, 3) != 'SDE'
      SET @delimiter = 0 -- unknown context info
    ELSE
    BEGIN
      SET @delimiter = charindex (',', @context_info)
      IF @delimiter != 0
        -- move past the state id
        SET @delimiter = charindex (',', @context_info, @delimiter + 1)
    END
  END
  IF @delimiter = 0
  BEGIN
    -- No context info set, so we're working off the default version.
    DECLARE @status INTEGER
    SELECT @current_state = v.state_id, @status = v.status
      FROM   Troy.dbo.SDE_versions v
      WHERE  v.name = 'DEFAULT' AND v.owner = 'dbo'
    SET @protected = Troy.dbo.SDE_get_version_access (@status, 'dbo')
    SET @is_default = '1'
    SET @edit_version_id = -1 -- not in edit version mode
    IF (@state_is_set != -1) OR (@state_is_set IS NULL)
      SET @state_is_set = 0 -- not a fixed state
  END
  ELSE
  BEGIN
    SET @current_state = CAST (substring (@context_info, 5,
      @delimiter - 5) AS BIGINT)
    SET @protected = substring (@context_info, @delimiter + 1, 1)
    SET @is_default = substring (@context_info, @delimiter + 3, 1)
    SET @edit_version_id = CAST (substring (@context_info, @delimiter + 5,
      charindex (';', @context_info, @delimiter + 5) - @delimiter - 5 ) AS INTEGER) 
    IF (@state_is_set != -1) OR (@state_is_set IS NULL)
      SET @state_is_set = 1 -- working with a fixed state
  END
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_geocol_def_update]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_geocol_def_update]             @layerIdVal INTEGER, @srTextVal TEXT, @xycluster_tolVal FLOAT,            @zcluster_tolVal FLOAT, @mcluster_tolVal FLOAT AS SET NOCOUNT ON            UPDATE Troy.dbo.SDE_spatial_references SET srtext = @srTextVal,            xycluster_tol = @xycluster_tolVal, zcluster_tol = @zcluster_tolVal,            mcluster_tol = @mcluster_tolVal WHERE srid  in (SELECT srid            FROM Troy.dbo.SDE_layers WHERE layer_id = @layerIdVal)
GO
/****** Object:  StoredProcedure [dbo].[SDE_geocol_def_insert]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_geocol_def_insert] @fTabCatVal NVARCHAR(32),     @fTabSchVal NVARCHAR(32), @fTabNameVal sysname, @fGeoColVal NVARCHAR(32), @gTabCatVal     NVARCHAR(32), @gTabSchVal NVARCHAR(32), @gTabNameVal sysname,    @storageTypeVal INTEGER, @geometryTypeVal INTEGER,    @CoordDimensionVal INTEGER, @sridVal INTEGER AS    SET NOCOUNT ON    BEGIN    BEGIN TRAN geocol_insert    INSERT INTO Troy.dbo.SDE_geometry_columns (f_table_catalog,f_table_schema,f_table_name, f_geometry_column,     g_table_catalog,g_table_schema,g_table_name,storage_type, geometry_type,    coord_dimension, srid) VALUES ( @fTabCatVal, @fTabSchVal,    @fTabNameVal, @fGeoColVal, @gTabCatVal, @gTabSchVal, @gTabNameVal,    @storageTypeVal, @geometryTypeVal, @CoordDimensionVal, @sridVal)    COMMIT TRAN geocol_insert    END
GO
/****** Object:  StoredProcedure [dbo].[SDE_geocol_def_delete]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_geocol_def_delete]                 @fTableCatalogVal NVARCHAR(32), @fTableSchemaVal NVARCHAR(32),                @fTableNameVal sysname, @fGeometryColumnVal NVARCHAR(32) AS                 SET NOCOUNT ON                BEGIN                BEGIN TRAN geocol_delete                DELETE FROM Troy.dbo.SDE_geometry_columns WHERE f_table_catalog = @fTableCatalogVal AND                 f_table_schema = @fTableSchemaVal AND                 f_table_name = @fTableNameVal AND                 f_geometry_column = @fGeometryColumnVal                COMMIT TRAN geocol_delete                END
GO
/****** Object:  StoredProcedure [dbo].[SDE_geocol_def_change_table_name]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_geocol_def_change_table_name]              @tabNameVal sysname, @layerIdVal INTEGER AS SET NOCOUNT ON             UPDATE Troy.dbo.SDE_geometry_columns SET f_table_name = @tabNameVal FROM Troy.dbo.SDE_geometry_columns INNER JOIN Troy.dbo.SDE_layers ON (            (Troy.dbo.SDE_geometry_columns.f_table_catalog = Troy.dbo.SDE_layers.database_name) AND             (Troy.dbo.SDE_geometry_columns.f_table_schema = Troy.dbo.SDE_layers.owner) AND             (Troy.dbo.SDE_geometry_columns.f_table_name = Troy.dbo.SDE_layers.table_name) AND             (Troy.dbo.SDE_geometry_columns.f_geometry_column =  Troy.dbo.SDE_layers.spatial_column) )              WHERE layer_id= @layerIdVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_current_version_writable]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_current_version_writable] @current_state BIGINT OUTPUT AS 
SET NOCOUNT ON BEGIN
--This is a private support procedure for SDE versioned views.
DECLARE @context_info VARCHAR(128)
SELECT @context_info = CAST (context_info AS VARCHAR(128))
FROM master.dbo.sysprocesses
WHERE spid = @@SPID AND CAST (context_info AS VARCHAR(128)) like 'SDE%'
DECLARE @protected CHAR (1)
DECLARE @delimiter INTEGER
IF @context_info IS NULL
  SET @delimiter = 0
ELSE
BEGIN
  SET @delimiter = charindex (',', @context_info)
  IF @delimiter != 0 -- move past the SDE token
    SET @delimiter = charindex (',', @context_info, @delimiter + 1)
END
IF @delimiter = 0
BEGIN
  -- No context info set, so we're working off the default version.
  DECLARE @status INTEGER
  SELECT @current_state = v.state_id, @status = v.status
  FROM   Troy.dbo.SDE_versions v
  WHERE  v.name = 'DEFAULT' AND v.owner = 'dbo'
  SET @protected = Troy.dbo.SDE_get_version_access (@status, 'dbo')
END
ELSE
BEGIN
  SET @protected = substring (@context_info, @delimiter + 1, 1)
  DECLARE @sde_delimiter INTEGER
  SET @sde_delimiter = charindex (',', @context_info)
  SET @current_state = CAST (substring (@context_info, @sde_delimiter + 1,
      @delimiter - @sde_delimiter - 1) AS BIGINT)
END
DECLARE @error_string NVARCHAR(256)
IF @protected = '1'
BEGIN
    SET @error_string = 'Current version is protected, and you ' +
                        'are not the owner.'
    RAISERROR (@error_string,16,-1)
    RETURN -1
END
-- Make sure that the state exists, and that the current user can write 
-- to it.
DECLARE @owner NVARCHAR (128)
DECLARE @closing_time DATETIME
SELECT @owner = owner, @closing_time = closing_time
FROM Troy.dbo.SDE_states
WHERE state_id = @current_state
IF (@owner IS NULL)
BEGIN
  SET @error_string = 'State ' + cast (@current_state AS VARCHAR (20)) +
                      ' not found.'
  RAISERROR (@error_string,16,-1)
  RETURN -1
END
DECLARE @user NVARCHAR (128)
EXECUTE Troy.dbo.SDE_get_current_user_name @user OUTPUT 
IF @user != @owner
BEGIN
  DECLARE @is_dba INTEGER
  SET @is_dba = Troy.dbo.SDE_is_user_sde_dba ()
  IF @is_dba = 0
  BEGIN
    SET @error_string = 'Not owner of state ' +
                        CAST (@current_state AS VARCHAR (20)) + '.'
    RAISERROR (@error_string,16,-1)
    RETURN -1
  END
END
IF @closing_time IS NOT NULL 
BEGIN
  SET @error_string = 'State ' + CAST (@current_state AS VARCHAR (20)) +
                      ' is closed.'
  RAISERROR (@error_string,16,-1)
  RETURN -1
END
RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_column_registry_def_update]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_column_registry_def_update]        @dbNameVal NVARCHAR(32), @tabNameVal sysname, @ownerVal NVARCHAR(32),       @colNameVal NVARCHAR(32), @sdeTypeVal INTEGER, @colSizeVal INTEGER,        @decDigitVal INTEGER, @descVal NVARCHAR(65), @objFlagsVal INTEGER,       @objIdVal INTEGER AS SET NOCOUNT ON       UPDATE Troy.dbo.SDE_column_registry SET sde_type = @sdeTypeVal, column_size = @colSizeVal,        decimal_digits = @decDigitVal, description = @descVal,       object_flags = @objFlagsVal ,object_id = @objIdVal        WHERE database_name = @dbNameVal AND table_name = @tabNameVal AND              owner = @ownerVal AND column_name = @colNameVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_column_registry_def_insert]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_column_registry_def_insert]        @dbNameVal NVARCHAR(32), @tabNameVal sysname, @ownerVal NVARCHAR(32),       @colNameVal NVARCHAR(32), @sdeTypeVal INTEGER, @colSizeVal INTEGER,        @decDigitVal INTEGER, @descVal NVARCHAR(65), @objFlagsVal INTEGER,       @objIdVal INTEGER AS SET NOCOUNT ON       INSERT INTO Troy.dbo.SDE_column_registry (database_name, table_name, owner, column_name, sde_type,        column_size, decimal_digits,description,object_flags, object_id )        VALUES ( @dbNameVal, @tabNameVal, @ownerVal, @colNameVal, @sdeTypeVal,        @colSizeVal ,@decDigitVal, @descVal, @objFlagsVal, @objIdVal)
GO
/****** Object:  StoredProcedure [dbo].[SDE_column_registry_def_delete]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_column_registry_def_delete]                         @dbNameVal NVARCHAR(32), @tabNameVal sysname,                         @ownerVal NVARCHAR(32), @colNameVal NVARCHAR(32) AS                         SET NOCOUNT ON DELETE FROM Troy.dbo.SDE_column_registry WHERE                         database_name = @dbNameVal AND table_name = @tabNameVal AND                         owner = @ownerVal AND column_name = @colNameVal
GO
/****** Object:  UserDefinedFunction [dbo].[rowid_name]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[rowid_name](
@owner NVARCHAR(128), @table NVARCHAR(128))
RETURNS NVARCHAR(128)
AS BEGIN
-- check if the object is a multiversioned view
DECLARE @base_table NVARCHAR(128)
DECLARE @qualified_table NVARCHAR (200)
SET @qualified_table = db_name() + '.' + @owner + '.'

SELECT @base_table = table_name FROM Troy.dbo.SDE_table_registry 
  WHERE owner = @owner AND imv_view_name = @table
IF @@ROWCOUNT = 0
  SET @qualified_table = @qualified_table + @table
ELSE
  SET @qualified_table = @qualified_table + @base_table

DECLARE @def VARCHAR(max)
DECLARE @properties int
SELECT @def = CAST (definition AS VARCHAR(max)), @properties = properties
  FROM dbo.GDB_Items WHERE physicalname = @qualified_table
IF @@ROWCOUNT = 0
    RETURN NULL -- layer not found, but can't raise errors in a function!

DECLARE @pos INT
DECLARE @pos2 INT
SET @pos = charindex ('<OIDFieldName>', @def)
SET @pos2 = charindex('</OIDFieldName>', @def, @pos)
IF @pos >= @pos2
    RETURN NULL -- no rowid column in this table

SET @pos = @pos + 14

DECLARE @rowid_name NVARCHAR(128)
SET @rowid_name = substring(@def,@pos,@pos2 - @pos)
RETURN @rowid_name
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_col_registry_def_update]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_col_registry_def_update]        @dbNameVal NVARCHAR(32), @tabNameVal sysname, @ownerVal NVARCHAR(32),       @colNameVal NVARCHAR(32), @sdeTypeVal INTEGER, @colSizeVal INTEGER,        @decDigitVal INTEGER, @descVal NVARCHAR(65), @objFlagsVal INTEGER,       @objIdVal INTEGER, @oldColNameVal NVARCHAR(32) AS SET NOCOUNT ON       UPDATE Troy.dbo.SDE_column_registry SET column_name = @colNameVal, sde_type = @sdeTypeVal,       column_size = @colSizeVal,        decimal_digits = @decDigitVal, description = @descVal,       object_flags = @objFlagsVal ,object_id = @objIdVal        WHERE database_name = @dbNameVal AND table_name = @tabNameVal AND              owner = @ownerVal AND column_name = @oldColNameVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_archives_def_insert]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_archives_def_insert]
@archivingRegIdVal INTEGER, @historyRegIdVal INTEGER,
@fromDateVal NVARCHAR(32),
@toDateVal NVARCHAR(32),
@archiveDateVal BIGINT, @archiveFlagsVal BIGINT
AS SET NOCOUNT ON
BEGIN
INSERT INTO Troy.dbo.SDE_archives
  (archiving_regid,history_regid,from_date,to_date,archive_date,archive_flags) VALUES
  (@archivingRegIdVal,@historyRegIdVal,@fromDateVal,@toDateVal,@archiveDateVal,@archiveFlagsVal)
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_archives_def_delete]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_archives_def_delete]
@archivingRegIdVal INTEGER AS SET NOCOUNT ON
BEGIN
DELETE FROM Troy.dbo.SDE_archives WHERE archiving_regid =  @archivingRegIdVal
END
GO
/****** Object:  StoredProcedure [dbo].[get_extent]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_extent]
@owner NVARCHAR(128), @table NVARCHAR(128), @column NVARCHAR(128),
@minx DOUBLE PRECISION OUTPUT, @miny DOUBLE PRECISION OUTPUT,
@maxx DOUBLE PRECISION OUTPUT, @maxy DOUBLE PRECISION OUTPUT
AS SET NOCOUNT ON
BEGIN
DECLARE @layer_table NVARCHAR (128)
DECLARE @get_meta_extent INT
DECLARE @errstr varchar (256)

SET @get_meta_extent = 0 --Assume no metadata
SET @layer_table = @table

SELECT @layer_table = table_name FROM dbo.SDE_table_registry
  WHERE owner = @owner AND table_name = @table
IF @@ROWCOUNT = 0
BEGIN
  SELECT @layer_table = table_name FROM dbo.SDE_table_registry
    WHERE owner = @owner AND imv_view_name = @table
  IF @@ROWCOUNT > 0
    SET @get_meta_extent = 1
END
ELSE
  SET @get_meta_extent = 1

IF @get_meta_extent = 1
BEGIN
  -- table is registered, see if it's in the layers table
  SELECT @minx = minx, @miny = miny, @maxx = maxx, @maxy = maxy 
  FROM dbo.SDE_layers l
  WHERE l.owner = @owner and l.table_name = @layer_table AND l.spatial_column = @column
  IF @@ROWCOUNT > 0
    RETURN -- we're done!
END

-- Need to calculate the extent. Check if it's a geometry or geography

DECLARE @spatial_type NVARCHAR(128)
SELECT @spatial_type = DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS
  WHERE  table_schema = @owner AND table_name = @layer_table AND column_name = @column
IF @@ROWCOUNT = 0
BEGIN
  SET @errstr = 'Class ' + @owner + '.' + @table + '.' + @column + ' does not exist.'
  RAISERROR (@errstr,16,-1)
  RETURN
END
-- Calculate the extent
DECLARE @sql NVARCHAR (1024)
IF @spatial_type = 'geometry' 
BEGIN
  SET @sql = 
    'SELECT @lminx = MIN(((' + @column + '.STEnvelope()).STPointN(1)).STX),' + 
    ' @lminy = MIN(((' + @column + '.STEnvelope()).STPointN(1)).STY),' + 
    ' @lmaxx = MAX(((' + @column + '.STEnvelope()).STPointN(3)).STX),' + 
    ' @lmaxy = MAX(((' + @column + '.STEnvelope()).STPointN(3)).STY) ' + 
    'FROM ' + @owner + '.' + @layer_table +
    ' WHERE ' + @column + ' IS NOT NULL'
  EXECUTE sp_executesql @sql, N'@lminx double precision output,@lminy double precision output,@lmaxx double precision output,@lmaxy double precision output',
  @lminx = @minx output,@lminy = @miny output,@lmaxx = @maxx output, @lmaxy = @maxy output
END
ELSE
BEGIN
  IF @spatial_type = 'geography'
  BEGIN
    SET @sql = 
      'SELECT @lminx = MIN(((geometry::STGeomFromWKB(' + @column + '.STAsBinary(),' + @column + '.STSrid).STEnvelope()).STPointN(1)).STX),' + 
      '  @lminy = MIN(((geometry::STGeomFromWKB(' + @column + '.STAsBinary(),' + @column + '.STSrid).STEnvelope()).STPointN(1)).STY),' + 
      '  @lmaxx = MAX(((geometry::STGeomFromWKB(' + @column + '.STAsBinary(),' + @column + '.STSrid).STEnvelope()).STPointN(3)).STX),' + 
      '  @lmaxy = MAX(((geometry::STGeomFromWKB(' + @column + '.STAsBinary(),' + @column + '.STSrid).STEnvelope()).STPointN(3)).STY) ' + 
      'FROM ' + @owner + '.' + @layer_table +
      ' WHERE ' + @column + ' IS NOT NULL'
    EXECUTE sp_executesql @sql, N'@lminx double precision output,@lminy double precision output,@lmaxx double precision output,@lmaxy double precision output',
    @lminx = @minx output,@lminy = @miny output,@lmaxx = @maxx output, @lmaxy = @maxy output
  END
  ELSE
  BEGIN
    SET @errstr = 'Column ' + @owner + '.' + @table + '.' + @column + ' is not a geometry or geography column.'
    RAISERROR (@errstr,16,-1)
    RETURN
  END
END
END
GO
/****** Object:  StoredProcedure [dbo].[geometry_type]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[geometry_type]
@owner NVARCHAR(128), @table NVARCHAR(128), @column NVARCHAR(128)
AS SET NOCOUNT ON
BEGIN
DECLARE @eflags INT
DECLARE @type_tab AS TABLE (type_names NVARCHAR(128))
DECLARE @type AS NVARCHAR(128)
DECLARE @zm AS NVARCHAR(3)
DECLARE @multi AS NVARCHAR(5)

-- Check if it's a registered layer
SELECT @eflags = eflags FROM dbo.SDE_layers 
WHERE owner = @owner AND table_name = @table AND spatial_column = @column

IF @@ROWCOUNT = 1
BEGIN
  -- Decode eflags to determine shape type
  IF (@eflags & 262144) > 0
    SET @multi = N'MULTI'
  ELSE
    SET @multi = N''

  SET @zm = N''
  IF (@eflags & 65536) > 0
    SET @zm = @zm + N' Z'
  IF (@eflags & 524288) > 0
  BEGIN
    IF @zm = ''
      SET @zm = @zm + N' M'
    ELSE
      SET @zm = @zm + N'M'
  END

  IF (@eflags & 1) > 0
    INSERT INTO @type_tab (type_names) VALUES (N'NIL')

  IF (@eflags & 2) > 0
    INSERT INTO @type_tab (type_names) VALUES (@multi + N'POINT' + @zm)

  IF (@eflags & 4) > 0
    INSERT INTO @type_tab (type_names) VALUES (@multi + N'LINESTRING' + @zm)

  IF (@eflags & 8) > 0
    INSERT INTO @type_tab (type_names) VALUES (@multi + N'SIMPLELINESTRING' + @zm)

  IF (@eflags & 16) > 0
    INSERT INTO @type_tab (type_names) VALUES (@multi + N'POLYGON' + @zm)

  SELECT type_names AS geometry_type from @type_tab

END
ELSE
BEGIN
  -- Not a registered layer, check if it's a spatial column
  DECLARE @spatial_type VARCHAR(128)
  SELECT @spatial_type = CAST (t.name AS VARCHAR(128)) 
    FROM sys.objects o INNER JOIN sys.columns c INNER JOIN sys.types t
    ON c.user_type_id = t.user_type_id AND c.user_type_id = t.user_type_id 
    ON c.object_id = o.object_id 
    WHERE c.object_id = OBJECT_ID(@owner + '.' + @table) AND c.name = @column

  IF (@spatial_type IS NULL OR (@spatial_type != 'geometry' AND @spatial_type != 'geography'))
  BEGIN
    DECLARE @errstr varchar (256)
    SET @errstr = 'Spatial column ' + @owner + '.' + @table + '.' + @column + ' does not exist.'
    RAISERROR (@errstr,16,-1)
    RETURN
  END

  -- Let's fetch the first shape
  DECLARE @sql NVARCHAR (1024)
  SET @sql = 'SELECT TOP 1 UPPER (' + @column + '.STGeometryType()) AS geometry_type FROM ' + @owner + '.' + @table +
             ' WHERE ' + @column + ' IS NOT NULL'
  EXEC (@sql)
END
END
GO
/****** Object:  UserDefinedFunction [dbo].[is_versioned]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[is_versioned]
(@owner NVARCHAR(128), @table NVARCHAR(128))
RETURNS VARCHAR(14)
AS BEGIN
-- check if the object is a multiversioned view
DECLARE @base_table NVARCHAR(128)
DECLARE @qualified_table NVARCHAR (200)
SET @qualified_table = db_name() + '.' + @owner + '.'

SELECT @base_table = table_name FROM Troy.dbo.SDE_table_registry 
  WHERE owner = @owner AND imv_view_name = @table
IF @@ROWCOUNT = 0
  SET @qualified_table = @qualified_table + @table
ELSE
  SET @qualified_table = @qualified_table + @base_table

DECLARE @def VARCHAR(max)
DECLARE @properties int
SELECT @def = CAST (definition AS VARCHAR(max)), @properties = properties
  FROM dbo.GDB_Items WHERE physicalname = @qualified_table
IF @@ROWCOUNT = 0
    RETURN 'NOT REGISTERED'
DECLARE @pos INT
DECLARE @pos2 INT
SET @pos = charindex ('<Versioned>', @def)
SET @pos2 = charindex('</Versioned>', @def, @pos)
IF @pos >= @pos2
    RETURN 'FALSE'
SET @pos = @pos + 11

DECLARE @is_versioned VARCHAR(5)
SET @is_versioned = substring(@def,@pos,@pos2 - @pos)
RETURN UPPER(@is_versioned)
END
GO
/****** Object:  UserDefinedFunction [dbo].[is_simple]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[is_simple](
@owner NVARCHAR(128), @table NVARCHAR(128))
RETURNS VARCHAR(14)
AS BEGIN
-- check if the object is a multiversioned view
DECLARE @base_table NVARCHAR(128)
DECLARE @qualified_table NVARCHAR (200)
DECLARE @is_reg INT
DECLARE @int_val INT

SET @qualified_table = db_name() + '.' + @owner + '.'

SELECT @base_table = table_name FROM Troy.dbo.SDE_table_registry 
  WHERE owner = @owner AND imv_view_name = @table
IF @@ROWCOUNT = 0
  SET @qualified_table = @qualified_table + @table
ELSE
  SET @qualified_table = @qualified_table + @base_table

-- Check ArcSDE metadata first
SET @is_reg = 0
SELECT @is_reg = 1 FROM dbo.SDE_table_registry WHERE owner = @owner AND table_name = @table

-- Get XML string from view. Return NOT REGISTERED when not found.
DECLARE @def VARCHAR(max)
DECLARE @datasetsubtype1 int
SELECT @def = CAST (definition AS VARCHAR(max)), @datasetsubtype1 = datasetsubtype1
  FROM dbo.GDB_Items WHERE physicalname = @qualified_table
IF @@ROWCOUNT = 0
BEGIN
  IF @is_reg = 1
    RETURN 'TRUE'
  ELSE
      RETURN 'NOT REGISTERED'
END

IF @datasetsubtype1 != 1
  RETURN 'FALSE'

-- Check FeatureType for esriFTSimple. This check also 
-- covers checks for:
--
--   * Dimension feature classes
--   * Annotation eature classes
--   * Schematics, Locators, and Toolboxes

DECLARE @pos INT
DECLARE @pos2 INT
SET @pos = charindex('<FeatureType>',@def);
IF @pos > 0
BEGIN
  SET @pos2 = charindex('</FeatureType>', @def, @pos)
  SET @pos = @pos + 13
  IF substring(@def,@pos,@pos2 - @pos) != 'ESRIFTSIMPLE'
    RETURN 'FALSE'
END

SET @int_val = 0
SELECT @int_val = 1 FROM dbo.GDB_Items a
  WHERE a.PhysicalName = @qualified_table and a.Type IN
    (SELECT b.UUID FROM dbo.GDB_ItemTypes b WHERE b.Name in ('Feature Class','Feature Dataset','Table'))
IF @int_val != 1
  RETURN 'FALSE'

-- Check if the object participates in a	Parcel Fabric, Networkdataset,
-- Geometric Network, Terrain, Networkdataset, Topology or Relationship.

SET @int_val = 0
SELECT TOP 1 @int_val = 1
FROM (SELECT b.originid FROM dbo.GDB_Items a INNER JOIN dbo.GDB_ItemRelationships b
        ON a.uuid = b.destid WHERE a.physicalname = @qualified_table) objclass
  INNER JOIN dbo.GDB_Items origin_items
    ON origin_items.uuid = objclass.originid
  INNER JOIN dbo.GDB_ItemRelationships  rel1
    ON rel1.originid = origin_items.uuid
  INNER JOIN dbo.GDB_ItemRelationships rel2
    ON rel2.destid = rel1.destid
WHERE origin_items.physicalname IS NOT NULL AND
  ((rel2.type = '{583A5BAA-3551-41AE-8AA8-1185719F3889}') OR 
   (rel2.type = '{DC739A70-9B71-41E8-868C-008CF46F16D7}') OR
   (rel2.type = '{55D2F4DC-CB17-4E32-A8C7-47591E8C71DE}') OR
   (rel2.type = '{B32B8563-0B96-4D32-92C4-086423AE9962}') OR
   (rel2.type = '{D088B110-190B-4229-BDF7-89FDDD14D1EA}') OR
   (rel2.type = '{725BADAB-3452-491B-A795-55F32D67229C}'))
IF @int_val = 1
  RETURN 'FALSE'

-- Check if Dataset has dependent objects that participate in a Parcel Fabric
-- Networkdataset, Geometric Network, Terrain, Networkdataset, Topology or Relationship.

SET @int_val = 0
SELECT TOP 1 @int_val = 1
FROM (SELECT rel2.uuid FROM (SELECT UUID, Type FROM dbo.GDB_Items WHERE PhysicalName = @qualified_table) src_items
  INNER JOIN dbo.GDB_Itemrelationships rel1 ON src_items.uuid = rel1.originid
  INNER JOIN dbo.GDB_Itemrelationships rel2 ON rel2.originid = rel1.destid 
WHERE ((rel2.type = '{583A5BAA-3551-41AE-8AA8-1185719F3889}') OR
       (rel2.type = '{DC739A70-9B71-41E8-868C-008CF46F16D7}') OR
       (rel2.type = '{55D2F4DC-CB17-4E32-A8C7-47591E8C71DE}') OR
       (rel2.type = '{B32B8563-0B96-4D32-92C4-086423AE9962}') OR
       (rel2.type = '{D088B110-190B-4229-BDF7-89FDDD14D1EA}') OR
       (rel2.type = '{725BADAB-3452-491B-A795-55F32D67229C}')) ) expr
IF @int_val = 1
  RETURN 'FALSE'

-- Check if Object (No Dataset) has dependent objects that participate in a Parcel Fabric
-- Networkdataset, Geometric Network, Terrain, Networkdataset, Topology or Relationship.

SET @int_val = 0
SELECT TOP 1 @int_val = 1
FROM (SELECT rel1.type FROM (SELECT UUID, Type FROM dbo.GDB_Items WHERE PhysicalName = @qualified_table) src_items
  INNER JOIN dbo.GDB_Itemrelationships rel1 ON rel1.originid = src_items.uuid
  INNER JOIN dbo.GDB_Itemrelationships rel2 ON rel2.destid = rel1.destid
WHERE ((rel2.type = '{583A5BAA-3551-41AE-8AA8-1185719F3889}') OR
       (rel2.type = '{DC739A70-9B71-41E8-868C-008CF46F16D7}') OR
       (rel2.type = '{55D2F4DC-CB17-4E32-A8C7-47591E8C71DE}') OR
       (rel2.type = '{B32B8563-0B96-4D32-92C4-086423AE9962}') OR
       (rel2.type = '{D088B110-190B-4229-BDF7-89FDDD14D1EA}') OR
       (rel2.type = '{725BADAB-3452-491B-A795-55F32D67229C}')) ) expr
IF @int_val = 1
  RETURN 'FALSE'

-- Check XML Definition
SET @pos = charindex ('<ControllerMemberships>', @def)
IF @pos = 0
  SET @pos = charindex ('<ControllerMemberships ', @def)
IF @pos > 0
BEGIN
  SET @pos = charindex ('<GeometricNetworkMembership>', @def)
  IF @pos > 0
    RETURN 'FALSE'

  SET @pos = charindex ('<TopologyMembership>', @def)
  IF @pos > 0
    RETURN 'FALSE'

  SET @pos = charindex ('<NetworkDatasetMembership>', @def)
  IF @pos > 0
    RETURN 'FALSE'

  SET @pos = charindex ('<NetworkDatasetName>', @def)
  IF @pos > 0
    RETURN 'FALSE'

  SET @pos = charindex ('<TerrainMembership>', @def)
  IF @pos = 0
    SET @pos = charindex ('<TerrainName>', @def)
  IF @pos > 0
    RETURN 'FALSE'
END

-- Check for Editor Tracking enabled.

SET @pos = charindex('<EditorTrackingEnabled>',@def);
IF @pos > 0
BEGIN
  SET @pos2 = charindex('</EditorTrackingEnabled>', @def, @pos)
  SET @pos = @pos + 23
  IF substring(@def,@pos,@pos2 - @pos) = 'TRUE'
    RETURN 'FALSE'
END

-- Check for Custom Class Extensions. 

SET @pos = charindex('<EXTCLSID>',@def);
IF @pos > 0
BEGIN
  SET @pos2 = charindex('</EXTCLSID>', @def, @pos)
  IF @pos2 != (@pos + 10)
    RETURN 'FALSE'
END

RETURN 'TRUE'
END
GO
/****** Object:  UserDefinedFunction [dbo].[is_replicated]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[is_replicated]
(@owner NVARCHAR(128), @table NVARCHAR(128))
RETURNS VARCHAR(14)
AS BEGIN
-- check if the object is a multiversioned view
DECLARE @base_table NVARCHAR(128)
DECLARE @qualified_table NVARCHAR (200)
SET @qualified_table = db_name() + '.' + @owner + '.'

SELECT @base_table = table_name FROM Troy.dbo.SDE_table_registry 
  WHERE owner = @owner AND imv_view_name = @table
IF @@ROWCOUNT = 0
  SET @qualified_table = @qualified_table + @table
ELSE
  SET @qualified_table = @qualified_table + @base_table

DECLARE @intval INT
SELECT TOP 1 @intval = 1 
FROM (SELECT UUID, Type FROM dbo.GDB_Items
      WHERE PhysicalName = @qualified_table) objclass 
  INNER JOIN dbo.GDB_Itemrelationships rel1
  ON rel1.destid = objclass.uuid
WHERE ((rel1.type = '{D022DE33-45BD-424C-88BF-5B1B6B957BD3}') OR
       (rel1.type = '{8DB31AF1-DF7C-4632-AA10-3CC44B0C6914}'))
IF @@ROWCOUNT = 0
  RETURN 'FALSE'
RETURN 'TRUE'
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_rascol_srid_update]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_rascol_srid_update]              @sridVal INTEGER, @rastercolumn_idVal INTEGER AS             SET NOCOUNT ON UPDATE Troy.dbo.SDE_raster_columns               SET srid = @sridVal WHERE rastercolumn_id = @rastercolumn_idVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_rascol_spatial_reference_update]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_rascol_spatial_reference_update]             @rastercolumn_idVal INTEGER, @srTextVal TEXT,            @xycluster_tolVal FLOAT,            @zcluster_tolVal FLOAT, @mcluster_tolVal FLOAT AS            SET NOCOUNT ON UPDATE Troy.dbo.SDE_spatial_references SET             srtext = @srTextVal, xycluster_tol = @xycluster_tolVal,            zcluster_tol = @zcluster_tolVal, mcluster_tol = @mcluster_tolVal            WHERE srid  in (SELECT srid from Troy.dbo.SDE_raster_columns             WHERE rastercolumn_id = @rastercolumn_idVal)
GO
/****** Object:  StoredProcedure [dbo].[SDE_rascol_def_update_migrate]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_rascol_def_update_migrate] @rastercolumn_idVal INTEGER,      @descriptionVal NVARCHAR(65), @config_keywordVal NVARCHAR(32),       @minimum_idVal INTEGER, @rastercolumn_maskVal INTEGER,       @raster_columnVal NVARCHAR(32)       AS SET NOCOUNT ON UPDATE Troy.dbo.SDE_raster_columns SET description = @descriptionVal,      config_keyword = @config_keywordVal,       minimum_id = @minimum_idVal, rastercolumn_mask = @rastercolumn_maskVal,       raster_column = @raster_columnVal       WHERE rastercolumn_id = @rastercolumn_idVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_rascol_def_update]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_rascol_def_update] @rastercolumn_idVal INTEGER,      @descriptionVal NVARCHAR(65), @config_keywordVal NVARCHAR(32),       @minimum_idVal INTEGER, @rastercolumn_maskVal INTEGER      AS SET NOCOUNT ON UPDATE Troy.dbo.SDE_raster_columns SET description = @descriptionVal,      config_keyword = @config_keywordVal,       minimum_id = @minimum_idVal, rastercolumn_mask = @rastercolumn_maskVal       WHERE rastercolumn_id = @rastercolumn_idVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_rascol_def_rename]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_rascol_def_rename] @table_nameVal sysname,      @rastercolumn_idVal INTEGER       AS SET NOCOUNT ON UPDATE Troy.dbo.SDE_raster_columns SET table_name = @table_nameVal       WHERE rastercolumn_id = @rastercolumn_idVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_rascol_def_insert]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_rascol_def_insert]       @rastercolumn_idVal INTEGER,@descriptionVal NVARCHAR(65),       @database_nameVal NVARCHAR(32),@ownerVal NVARCHAR(32), @table_nameVal sysname,      @raster_columnVal NVARCHAR(32), @cdateVal INTEGER,       @config_keywordVal NVARCHAR(32), @minimum_idVal INTEGER, @base_idVal INTEGER,       @rastercolumn_maskVal INTEGER, @sridVal INTEGER AS SET NOCOUNT ON      INSERT INTO Troy.dbo.SDE_raster_columns       (rastercolumn_id,description,database_name,owner,table_name,raster_column,      cdate,config_keyword,minimum_id,base_rastercolumn_id, rastercolumn_mask,srid) VALUES       (@rastercolumn_idVal,@descriptionVal,@database_nameVal,@ownerVal,       @table_nameVal,@raster_columnVal,@cdateVal,@config_keywordVal,       @minimum_idVal,@base_idVal,@rastercolumn_maskVal,@sridVal)
GO
/****** Object:  StoredProcedure [dbo].[SDE_rascol_def_delete]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_rascol_def_delete] @rascol_idVal        INTEGER AS SET NOCOUNT ON DELETE FROM Troy.dbo.SDE_raster_columns WHERE rastercolumn_id =       @rascol_idVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_purge_processes]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_purge_processes] AS SET NOCOUNT ON
BEGIN
  BEGIN TRAN pinfo_tran
  DECLARE process_cursor CURSOR LOCAL FAST_FORWARD FOR
    SELECT PR.sde_id, SO.object_id
    FROM Troy.dbo.SDE_process_information PR WITH  (TABLOCK,XLOCK,HOLDLOCK)
      LEFT JOIN tempdb.sys.objects SO
      ON object_id (PR.table_name) = SO.object_id
  OPEN process_cursor
  DECLARE @sde_id INTEGER
  DECLARE @table_id INTEGER
  FETCH NEXT FROM process_cursor INTO @sde_id,@table_id
  WHILE @@FETCH_STATUS = 0
    BEGIN
    IF (@table_id IS NULL)
    BEGIN
      /* We found an invalid connection, clean it up. */
      EXECUTE Troy.dbo.SDE_pinfo_def_delete @sde_id
    END
    FETCH NEXT FROM process_cursor INTO @sde_id,@table_id
  END /* while */
  CLOSE process_cursor
  DEALLOCATE process_cursor
  COMMIT TRAN pinfo_tran
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_pinfo_def_insert]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_pinfo_def_insert]
 @sdeIdVal INTEGER,
  @serverIdVal INTEGER,
 @directConnectVal VARCHAR(1),
 @sysnameVal NVARCHAR(32),
 @nodenameVal NVARCHAR(256),
 @xdrneededVal VARCHAR(1),
 @tablenameVal NVARCHAR(95) AS SET NOCOUNT ON
 BEGIN TRAN pinfo_tran
 DECLARE @current_user NVARCHAR(30)
 DECLARE process_cursor CURSOR LOCAL FAST_FORWARD FOR 
 SELECT sde_id FROM Troy.dbo.SDE_process_information WITH  (TABLOCK,XLOCK,HOLDLOCK) 
 WHERE spid = @@spid and table_name <> @tablenameVal 
 OPEN process_cursor 
 DECLARE @sde_id INTEGER
 FETCH NEXT FROM process_cursor INTO @sde_id
 WHILE @@FETCH_STATUS = 0
  BEGIN
  /* We found an invalid connection, clean it up. */ 
  EXECUTE Troy.dbo.SDE_pinfo_def_delete @sde_id
  FETCH NEXT FROM process_cursor INTO @sde_id
  END /* while */ 
 CLOSE process_cursor
 DEALLOCATE process_cursor
 EXECUTE Troy.dbo.SDE_get_current_user_name @current_user OUTPUT
 INSERT INTO Troy.dbo.SDE_process_information (sde_id,spid,server_id,start_time,
    rcount,wcount,opcount,numlocks,fb_partial,fb_count,fb_fcount,
    fb_kbytes,owner,direct_connect,sysname,nodename,xdr_needed,table_name)
 VALUES (@sdeIdVal,@@spid,@serverIdVal,getdate(),0,0,0,0,0,0,0,0,
    @current_user,@directConnectVal,@sysnameVal,@nodenameVal,
    @xdrneededVal,@tablenameVal)
 DELETE FROM Troy.dbo.SDE_lineages_modified 
    WHERE DATEDIFF (day, time_last_modified, getdate()) > 2
 COMMIT TRAN pinfo_tran
GO
/****** Object:  StoredProcedure [dbo].[SDE_object_check_lock_conflicts]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_object_check_lock_conflicts]
@sdeIdVal INTEGER,
@objectIdVal INTEGER,
@objectTypeVal INTEGER,
@applicationIdVal INTEGER,
@autoLockVal VARCHAR(1),
@lockTypeVal VARCHAR(1),
@lock_conflict INTEGER OUTPUT AS SET NOCOUNT ON
BEGIN
  DECLARE locks_cursor CURSOR LOCAL FAST_FORWARD FOR
    SELECT sde_id
    FROM   Troy.dbo.SDE_object_locks WITH (TABLOCKX,HOLDLOCK)
    WHERE  object_id = @objectIdVal AND
           object_type = @objectTypeVal AND
           application_id = @applicationIdVal AND
           (sde_id <> @sdeIdVal OR
            autolock = @autoLockVal) AND
           (lock_type = 'E' /* E: Exclusive lock */ OR 
            @lockTypeVal = 'E')
  /* Find any conflicting locks.  The query we use is sensitive about
     whether we are trying to place an exclusive lock (in which case we
     have to consider all locks as possibly conflicting), or a shared lock
     (in which case we only have to worry about conflicting with exclusive
     locks).  With all of the about constraints in place, if any rows
     are returned, we probably have a conflict.  The last thing we have to
     check is if the connection owning the lock has somehow died without
     cleaning up. */
  OPEN locks_cursor
  DECLARE @loop_done INTEGER
  DECLARE @id INTEGER
  SET @lock_conflict = 0
  SET @loop_done = 0
  DECLARE @f_sde_id INTEGER
  WHILE @loop_done = 0
  BEGIN 
    FETCH NEXT FROM locks_cursor INTO @f_sde_id
    IF @@FETCH_STATUS = 0
    BEGIN
      /* We found a matching table lock.  See if the owning connection
         id is still out there.  If not, then this lock is invalid. */

      SELECT @id = SO.object_id
        FROM tempdb.sys.objects SO INNER JOIN
            Troy.dbo.SDE_process_information      PR ON object_id (PR.table_name) = SO.object_id
        WHERE PR.sde_id = @f_sde_id

      IF @@ROWCOUNT > 0
      BEGIN
        /* we have a lock conflict! */
        SET @lock_conflict = 1
        SET @loop_done = 1
      END
      ELSE
      BEGIN
         /* defunct connection found, clean it up */
         EXECUTE Troy.dbo.SDE_pinfo_def_delete @f_sde_id
      END
     END
     ELSE
       SET @loop_done = 1
  END /* while */
  CLOSE locks_cursor
  DEALLOCATE locks_cursor
END
GO
/****** Object:  Table [dbo].[SDE_mvtables_modified]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_mvtables_modified](
	[state_id] [bigint] NOT NULL,
	[registration_id] [int] NOT NULL,
 CONSTRAINT [mvtables_modified_pk] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC,
	[registration_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SDE_layer_def_update]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_layer_def_update]
@descVal NVARCHAR(65), @g1Val FLOAT, @g2Val FLOAT, @g3Val FLOAT,
@minxVal FLOAT, @minyVal FLOAT, @maxxVal FLOAT, @maxyVal FLOAT,
@minzVal FLOAT, @maxzVal FLOAT, @minmVal FLOAT, @maxmVal FLOAT,
@efVal INTEGER, @layerMaskVal INTEGER, @layerConVal  NVARCHAR(32),
@optArrSize INTEGER, @statDateVal INTEGER, @minIdVal INTEGER,
@layerIdVal INTEGER, @geometryTypeVal INTEGER, @secondarySridVal INTEGER AS
SET NOCOUNT ON
UPDATE Troy.dbo.SDE_layers
SET description = @descVal, gsize1 = @g1Val, gsize2 = @g2Val,
  gsize3 = @g3Val, minx = @minxVal, miny = @minyVal, maxx = @maxxVal,
  maxy = @maxyVal, minz = @minzVal, maxz = @maxzVal, minm = @minmVal,
  maxm = @maxmVal, eflags = @efVal, layer_mask = @layerMaskVal,
  layer_config = @layerConVal, optimal_array_size = @optArrSize,
  stats_date = @statDateVal, minimum_id = @minIdVal, secondary_srid = @secondarySridVal 
WHERE layer_id = @layerIdVal
UPDATE Troy.dbo.SDE_geometry_columns
SET geometry_type = @geometryTypeVal
FROM Troy.dbo.SDE_layers l
WHERE l.layer_id = @layerIdVal AND l.database_name = f_table_catalog
  AND l.owner = f_table_schema AND l.table_name = f_table_name AND
  l.spatial_column = f_geometry_column
GO
/****** Object:  StoredProcedure [dbo].[SDE_layer_def_mask_update]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_layer_def_mask_update]              @maskVal INTEGER, @layeridVal INTEGER AS              SET NOCOUNT ON              BEGIN             BEGIN TRAN layer_mask_update             UPDATE Troy.dbo.SDE_layers              SET layer_mask = @maskVal              WHERE layer_id = @layeridVal             COMMIT TRAN layer_mask_update             END
GO
/****** Object:  StoredProcedure [dbo].[SDE_layer_def_insert]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_layer_def_insert]
@layerIdVal INTEGER, @descVal NVARCHAR(65),@dbNameVal NVARCHAR(32),
@tabNameVal sysname, @ownerVal NVARCHAR(32), @spColVal NVARCHAR(32),
@eflagsVal INTEGER, @layerMaskVal INTEGER, @gsize1Val FLOAT, @gsize2Val FLOAT,
@gsize3Val FLOAT,@minxVal FLOAT,@minyVal FLOAT, @maxxVal FLOAT, @maxyVal FLOAT,
@minzVal FLOAT, @maxzVal FLOAT,@minmVal FLOAT, @maxmVal FLOAT, @cdateVal INTEGER,
@layerConfigVal NVARCHAR(32),@optArraySizeVal INTEGER, @statsDateVal INTEGER,
@minIdVal INTEGER, @sridVal INTEGER, @baseId INTEGER, @secondarySridVal INTEGER AS
SET NOCOUNT ON
BEGIN
BEGIN TRAN layer_insert
INSERT INTO Troy.dbo.SDE_layers (layer_id,description,database_name,table_name,owner,
spatial_column,eflags,layer_mask,gsize1,gsize2,gsize3,minx,miny,maxx,maxy,
minz,maxz,minm, maxm,cdate,layer_config,optimal_array_size,stats_date,
minimum_id,srid,base_layer_id,secondary_srid) VALUES (@layerIdVal, @descVal,
@dbNameVal, @tabNameVal,
@ownerVal, @spColVal,@eflagsVal, @layerMaskVal, @gsize1Val, @gsize2Val, @gsize3Val,
@minxVal, @minyVal, @maxxVal, @maxyVal,@minzVal, @maxzVal, @minmVal, @maxmVal,
@cdateVal,@layerConfigVal, @optArraySizeVal, @statsDateVal, @minIdVal, @sridVal,
@baseId, @secondarySridVal)
COMMIT TRAN layer_insert
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_layer_def_envelope_update]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_layer_def_envelope_update]              @minxVal FLOAT, @minyVal FLOAT, @maxxVal FLOAT,              @maxyVal FLOAT, @minzVal FLOAT, @maxzVal FLOAT,              @minmVal FLOAT, @maxmVal FLOAT, @layeridVal INTEGER AS              SET NOCOUNT ON              BEGIN             BEGIN TRAN layer_env_update             UPDATE Troy.dbo.SDE_layers              SET minx = @minxVal,              miny = @minyVal,              maxx = @maxxVal,              maxy = @maxyVal,              minz = @minzVal,              maxz = @maxzVal,              minm = @minmVal,              maxm = @maxmVal              WHERE layer_id = @layeridVal             COMMIT TRAN layer_env_update             END
GO
/****** Object:  StoredProcedure [dbo].[SDE_layer_def_delete]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_layer_def_delete]               @layer_idVal INTEGER AS SET NOCOUNT ON             DELETE FROM Troy.dbo.SDE_layers WHERE layer_id = @layer_idVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_layer_def_change_table_name]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_layer_def_change_table_name]              @tabNameVal sysname, @layerIdVal INTEGER AS SET NOCOUNT ON             UPDATE Troy.dbo.SDE_layers SET              table_name = @tabNameVal  WHERE layer_id = @layerIdVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_layer_check_lock_conflicts]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_layer_check_lock_conflicts]
@sdeIdVal INTEGER,
@layerIdVal INTEGER,
@autoLockVal VARCHAR(1),
@lockTypeVal VARCHAR(1),
@minxVal BIGINT,
@minyVal BIGINT,
@maxxVal BIGINT,
@maxyVal BIGINT,
@lock_conflict INTEGER OUTPUT AS SET NOCOUNT ON
BEGIN
  DECLARE locks_cursor CURSOR LOCAL FAST_FORWARD FOR
    SELECT sde_id
    FROM   Troy.dbo.SDE_layer_locks WITH (TABLOCKX,HOLDLOCK)
    WHERE  layer_id = @layerIdVal AND
           (sde_id <> @sdeIdVal OR
           autolock = @autoLockVal) AND
           (lock_type = 'E' /* E: Exclusive lock */ OR
            @lockTypeVal = 'E') AND
           ((maxx >= @minxVal AND maxy >= @minyVal AND
             @maxxVal >= minx AND @maxyVal >= miny) OR
             (minx IS NULL OR @minxVal IS NULL))
  /* Find any conflicting locks.  The query we use is sensitive about
     whether we are trying to place an exclusive lock (in which case we
     have to consider all locks as possibly conflicting), or a shared lock
     (in which case we only have to worry about conflicting with exclusive
     locks).  In either case, the query will include a range expression so
     composed that a lock with NULL envelope variables will always match
     any other lock.  This is because a NULL envelope indicates a layer-
     wide lock.  With all of the about constraints in place, if any rows
     are returned, we probably have a conflict.  The last thing we have to
     check is if the connection owning the lock has somehow died without
     cleaning up. */
  OPEN locks_cursor
  DECLARE @id INTEGER
  DECLARE @loop_done INTEGER
  SET @lock_conflict = 0
  SET @loop_done = 0
  DECLARE @f_sde_id INTEGER
  WHILE @loop_done = 0
  BEGIN 
    FETCH NEXT FROM locks_cursor INTO @f_sde_id
    IF @@FETCH_STATUS = 0
    BEGIN
      /* We found a matching layer lock.  See if the owning connection
         id is still out there.  If not, then this lock is invalid. */

      SELECT @id = SO.object_id
        FROM tempdb.sys.objects SO INNER JOIN 
            Troy.dbo.SDE_process_information PR ON object_id (PR.table_name) = SO.object_id
        WHERE PR.sde_id = @f_sde_id

      IF @@ROWCOUNT > 0
      BEGIN
          /* we have a lock conflict! */
          SET @lock_conflict = 1
          SET @loop_done = 1
      END
      ELSE
      BEGIN
          /* defunct connection found, clean it up */
         EXECUTE Troy.dbo.SDE_pinfo_def_delete @f_sde_id
       END
     END
     ELSE
       SET @loop_done = 1
  END /* while */
  CLOSE locks_cursor
  DEALLOCATE locks_cursor
END
GO
/****** Object:  UserDefinedFunction [dbo].[SDE_get_cad_table_name]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SDE_get_cad_table_name]
(@owner NVARCHAR(128),@table NVARCHAR(128),@spatial_column NVARCHAR(128))
RETURNS NVARCHAR(128)
AS BEGIN
DECLARE @layer_id INTEGER
DECLARE @qualified_table NVARCHAR(200)
DECLARE @cad_mask BIGINT
DECLARE @layer_eflags INTEGER
/* set SE_CAD_TYPE_MASK defined sdecomn.h */
SELECT @cad_mask = 1 * POWER(2,22)
SET @qualified_table = db_name() + '.' + @owner + '.SDE_GEOMETRY'
SELECT @layer_id = layer_id, @layer_eflags = eflags FROM Troy.dbo.SDE_layers
 WHERE owner = @owner AND table_name = @table AND spatial_column = @spatial_column
IF @@ROWCOUNT = 0
  SET @qualified_table =  NULL
ELSE
BEGIN
  IF @layer_eflags & @cad_mask = @cad_mask
    SET @qualified_table = @qualified_table + CONVERT(NVARCHAR(10),@layer_id)
  ELSE
    SET @qualified_table =  NULL
END
RETURN @qualified_table
END
GO
/****** Object:  Table [dbo].[SDE_layer_stats]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SDE_layer_stats](
	[oid] [int] IDENTITY(1,1) NOT NULL,
	[layer_id] [int] NOT NULL,
	[version_id] [int] NULL,
	[minx] [float] NOT NULL,
	[miny] [float] NOT NULL,
	[maxx] [float] NOT NULL,
	[maxy] [float] NOT NULL,
	[minz] [float] NULL,
	[minm] [float] NULL,
	[maxz] [float] NULL,
	[maxm] [float] NULL,
	[total_features] [int] NOT NULL,
	[total_points] [int] NOT NULL,
	[last_analyzed] [datetime] NOT NULL,
 CONSTRAINT [sdelayer_stats_pk] PRIMARY KEY CLUSTERED 
(
	[oid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [sdelayer_stats_uk] UNIQUE NONCLUSTERED 
(
	[layer_id] ASC,
	[version_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SDE_layer_srid_update]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_layer_srid_update]              @sridVal INTEGER, @layeridVal INTEGER AS SET NOCOUNT ON BEGIN              DECLARE @g_table sysname              SET @g_table = N'f' + cast(@layeridVal as NVARCHAR)              UPDATE Troy.dbo.SDE_layers SET srid = @sridVal WHERE layer_id = @layeridVal 
 UPDATE             Troy.dbo.SDE_geometry_columns SET srid = @sridVal WHERE g_table_name = @g_table END
GO
/****** Object:  StoredProcedure [dbo].[SDE_layer_lock_def_insert]    Script Date: 12/03/2014 13:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_layer_lock_def_insert]
@sdeIdVal INTEGER,
@layerIdVal INTEGER,
@autoLockVal VARCHAR(1),
@lockTypeVal VARCHAR(1),
@minxVal BIGINT,
@minyVal BIGINT,
@maxxVal BIGINT,
@maxyVal BIGINT AS SET NOCOUNT ON
DECLARE @lock_conflict INTEGER
/* If this is not an autolock, delete any existing regular lock on this
   layer owned by this user.
   The lock is to be removed even if we subsequently encounter a lock
   conflict (this behavior is unique to layer locks).*/
BEGIN TRAN layer_lock_tran
IF @autoLockVal <> 'Y'
  EXECUTE Troy.dbo.SDE_layer_lock_def_delete @sdeIdVal, @layerIdVal, @autoLockVal
/* check for conflicts */

  DECLARE locks_cursor CURSOR LOCAL FAST_FORWARD FOR
    SELECT sde_id
    FROM   Troy.dbo.SDE_layer_locks WITH (TABLOCKX,HOLDLOCK)
    WHERE  layer_id = @layerIdVal AND
           (sde_id <> @sdeIdVal OR
           autolock = @autoLockVal) AND
           (lock_type = 'E' /* E: Exclusive lock */ OR
            @lockTypeVal = 'E') AND
           ((maxx >= @minxVal AND maxy >= @minyVal AND
             @maxxVal >= minx AND @maxyVal >= miny) OR
             (minx IS NULL OR @minxVal IS NULL))
  /* Find any conflicting locks.  The query we use is sensitive about
     whether we are trying to place an exclusive lock (in which case we
     have to consider all locks as possibly conflicting), or a shared lock
     (in which case we only have to worry about conflicting with exclusive
     locks).  In either case, the query will include a range expression so
     composed that a lock with NULL envelope variables will always match
     any other lock.  This is because a NULL envelope indicates a layer-
     wide lock.  With all of the about constraints in place, if any rows
     are returned, we probably have a conflict.  The last thing we have to
     check is if the connection owning the lock has somehow died without
     cleaning up. */
  OPEN locks_cursor
  DECLARE @loop_done INTEGER
  DECLARE @id INTEGER
  SET @lock_conflict = 0
  SET @loop_done = 0
  DECLARE @f_sde_id INTEGER
  WHILE @loop_done = 0
  BEGIN 
    FETCH NEXT FROM locks_cursor INTO @f_sde_id
    IF @@FETCH_STATUS = 0
    BEGIN
      /* We found a matching layer lock.  See if the owning connection
         id is still out there.  If not, then this lock is invalid. */

      SELECT @id = SO.object_id
        FROM tempdb.sys.objects SO INNER JOIN 
            Troy.dbo.SDE_process_information       PR ON object_id (PR.table_name) = SO.object_id
        WHERE PR.sde_id = @f_sde_id

      IF @@ROWCOUNT > 0
      BEGIN
        /* we have a lock conflict! */
        SET @lock_conflict = 1
        SET @loop_done = 1
      END
      ELSE
      BEGIN
        /* defunct connection found, clean it up */
        EXECUTE Troy.dbo.SDE_pinfo_def_delete @f_sde_id
      END
     END
     ELSE
       SET @loop_done = 1
  END /* while */
  CLOSE locks_cursor
  DEALLOCATE locks_cursor

DECLARE @ret_val INTEGER
IF (@lock_conflict = 0)
BEGIN
  INSERT INTO Troy.dbo.SDE_layer_locks
         (sde_id,layer_id,autolock,lock_type,minx,miny,maxx,maxy)
  VALUES (@sdeIdVal,@layerIdVal,@autoLockVal,@lockTypeVal,@minxVal,
          @minyVal,@maxxVal,@maxyVal)
  SET @ret_val = 0 /* SE_SUCCESS */
  COMMIT TRAN layer_lock_tran
END
ELSE
BEGIN
  SET @ret_val = -49 /* SE_LOCK_CONFLICT */
  ROLLBACK TRAN layer_lock_tran
END
RETURN @ret_val
GO
/****** Object:  Trigger [sde_lineage_delete]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[sde_lineage_delete] ON [Troy].[dbo].[SDE_states] FOR DELETE AS      DELETE FROM Troy.dbo.SDE_state_lineages WHERE lineage_id IN (SELECT state_id FROM deleted)
GO
/****** Object:  StoredProcedure [dbo].[SDE_layer_stats_def_update]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_layer_stats_def_update]
@layerIdVal INTEGER, @versionIdVal INTEGER,
@minxVal FLOAT,@minyVal FLOAT, @maxxVal FLOAT, @maxyVal FLOAT,
@minzVal FLOAT, @maxzVal FLOAT,@minmVal FLOAT, @maxmVal FLOAT,
@totalFeaturesVal INTEGER, @totalPointsVal INTEGER AS
SET NOCOUNT ON
BEGIN
BEGIN TRAN layer_stats_update
IF @versionIdVal IS NULL
BEGIN
  UPDATE Troy.dbo.SDE_layer_stats  SET minx = @minxVal, miny = @minyVal, maxx = @maxxVal, maxy = @maxyVal,
      minz = @minzVal, maxz = @maxzVal, minm = @minmVal, maxm = @maxmVal,
      total_features = @totalFeaturesVal, total_points = @totalPointsVal,
      last_analyzed = GETDATE()
  WHERE layer_id = @layerIdVal AND version_id IS NULL
END
ELSE
BEGIN
  UPDATE Troy.dbo.SDE_layer_stats  SET minx = @minxVal, miny = @minyVal, maxx = @maxxVal, maxy = @maxyVal,
      minz = @minzVal, maxz = @maxzVal, minm = @minmVal, maxm = @maxmVal,
      total_features = @totalFeaturesVal, total_points = @totalPointsVal,
      last_analyzed = GETDATE()
  WHERE layer_id = @layerIdVal AND version_id = @versionIdVal
END
COMMIT TRAN layer_stats_update
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_layer_stats_def_insert]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_layer_stats_def_insert]
@layerIdVal INTEGER, @versionIdVal INTEGER,
@minxVal FLOAT,@minyVal FLOAT, @maxxVal FLOAT, @maxyVal FLOAT,
@minzVal FLOAT, @maxzVal FLOAT,@minmVal FLOAT, @maxmVal FLOAT,
@totalFeaturesVal INTEGER, @totalPointsVal INTEGER AS
SET NOCOUNT ON
BEGIN
BEGIN TRAN layer_stats_insert
INSERT INTO Troy.dbo.SDE_layer_stats (layer_id,version_id, 
  minx, miny, maxx, maxy, minz, maxz, minm, maxm, 
  total_features, total_points, last_analyzed)
 VALUES (@layerIdVal, @versionIdVal, @minxVal, @minyVal, @maxxVal, @maxyVal,
  @minzVal, @maxzVal, @minmVal, @maxmVal, @totalFeaturesVal, @totalPointsVal,
  GETDATE())
COMMIT TRAN layer_stats_insert
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_layer_stats_def_delete]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_layer_stats_def_delete]
@layerIdVal INTEGER, @versionIdVal INTEGER AS
SET NOCOUNT ON
BEGIN
BEGIN TRAN layer_stats_delete
IF @versionIdVal <= 0
BEGIN
  DELETE FROM Troy.dbo.SDE_layer_stats  WHERE layer_id = @layerIdVal AND version_id IS NULL
END
ELSE
BEGIN
  DELETE FROM Troy.dbo.SDE_layer_stats  WHERE layer_id = @layerIdVal AND version_id = @versionIdVal
END
COMMIT TRAN layer_stats_delete
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_layer_lock_def_update]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_layer_lock_def_update]
@sdeIdVal INTEGER,
@layerIdVal INTEGER,
@autoLockVal VARCHAR(1),
@lockTypeVal VARCHAR(1),
@minxVal BIGINT,
@minyVal BIGINT,
@maxxVal BIGINT,
@maxyVal BIGINT AS SET NOCOUNT ON
DECLARE @isConflictVal INTEGER
DECLARE @ret_val INTEGER
BEGIN TRAN layer_lock_tran
/* Delete the lock we are to update.  If it doesn't exist, we will
   report an error.  If it does exist, this will
   get it out of the way so we can test for conflicts.*/
  EXECUTE @ret_val = Troy.dbo.SDE_layer_lock_def_delete @sdeIdVal, @layerIdVal, @autoLockVal
  IF @ret_val <> 0
    RETURN @ret_val
/* check for conflicts */
EXECUTE Troy.dbo.SDE_layer_check_lock_conflicts @sdeIdVal,@layerIdVal,@autoLockVal,@lockTypeVal,@minxVal,
        @minyVal,@maxxVal,@maxyVal, @isConflictVal OUTPUT
IF (@isConflictVal = 0)
BEGIN
  INSERT INTO Troy.dbo.SDE_layer_locks
         (sde_id,layer_id,autolock,lock_type,minx,miny,maxx,maxy)
  VALUES (@sdeIdVal,@layerIdVal,@autoLockVal,@lockTypeVal,@minxVal,
          @minyVal,@maxxVal,@maxyVal)
  SET @ret_val = 0 /* SE_SUCCESS */
  COMMIT TRAN layer_lock_tran
END
ELSE
BEGIN
  SET @ret_val = -49 /* SE_LOCK_CONFLICT */
  ROLLBACK TRAN layer_lock_tran
END
RETURN @ret_val
GO
/****** Object:  StoredProcedure [dbo].[SDE_mvmodified_table_insert]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_mvmodified_table_insert]       @registration_idVal INTEGER, @state_idVal BIGINT AS      SET NOCOUNT ON      BEGIN      BEGIN TRAN mvmodified_insert      INSERT INTO Troy.dbo.SDE_mvtables_modified (registration_id, state_id)       VALUES ( @registration_idVal, @state_idVal )      COMMIT TRAN mvmodified_insert      END
GO
/****** Object:  StoredProcedure [dbo].[SDE_mvmodified_table_del_base_save]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_mvmodified_table_del_base_save]       @high_state_idVal BIGINT, @lineage_nameVal BIGINT, @id1 INTEGER,      @id2 INTEGER, @id3 INTEGER, @id4 INTEGER, @id5 INTEGER,      @id6 INTEGER, @id7 INTEGER, @id8 INTEGER AS      SET NOCOUNT ON      BEGIN      DELETE FROM Troy.dbo.SDE_mvtables_modified WHERE registration_id IN         (@id1, @id2, @id3, @id4, @id5, @id6, @id7, @id8)        AND state_id IN (SELECT state_id FROM Troy.dbo.SDE_states WHERE state_id > 0 AND        state_id <= @high_state_idVal AND lineage_name = @lineage_nameVal)      END
GO
/****** Object:  View [dbo].[Stratagis_Historic_OBD]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Historic_OBD]
AS
SELECT     STRATAGIS_FLEET_HISTORIC_2.OBJECTID, STRATAGIS_FLEET_HISTORIC_2.TimeStamp, STRATAGIS_FLEET_HISTORIC_2.Validity, 
                      STRATAGIS_FLEET_HISTORIC_2.Speed, STRATAGIS_FLEET_HISTORIC_2.Course, STRATAGIS_FLEET_HISTORIC_2.Variation, 
                      STRATAGIS_FLEET_HISTORIC_2.EastWest, STRATAGIS_FLEET_HISTORIC_2.DeviceId, STRATAGIS_FLEET_HISTORIC_2.VehicleId, 
                      STRATAGIS_FLEET_HISTORIC_2.EventNumber, CASE WHEN STRATAGIS_FLEET_HISTORIC_2.VIN IS NULL 
                      THEN dbo.Stratagis_Vehicle_View.VIN ELSE STRATAGIS_FLEET_HISTORIC_2.VIN END AS VIN, STRATAGIS_FLEET_HISTORIC_2.ODBProtocol, 
                      STRATAGIS_FLEET_HISTORIC_2.FirmWareVersion, STRATAGIS_FLEET_HISTORIC_2.RSSI, STRATAGIS_FLEET_HISTORIC_2.MILCount, 
                      STRATAGIS_FLEET_HISTORIC_2.MILCodes, STRATAGIS_FLEET_HISTORIC_2.GpsOdometerMiles, STRATAGIS_FLEET_HISTORIC_2.OBDTripOdometerMiles, 
                      STRATAGIS_FLEET_HISTORIC_2.SHAPE, STRATAGIS_FLEET_HISTORIC_2.GpsOdometerMiles + dbo.Stratagis_Vehicle_View.OdometerAdj AS AdjOdometer, 
                      dbo.Stratagis_Vehicle_View.Department, dbo.Stratagis_Vehicle_View.UseDescription
FROM         dbo.STRATAGIS_FLEET_HISTORIC AS STRATAGIS_FLEET_HISTORIC_2 INNER JOIN
                      dbo.Stratagis_Vehicle_View ON STRATAGIS_FLEET_HISTORIC_2.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId
WHERE     (STRATAGIS_FLEET_HISTORIC_2.EventNumber = 30) AND (STRATAGIS_FLEET_HISTORIC_2.GpsOdometerMiles IS NOT NULL)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "STRATAGIS_FLEET_HISTORIC_2"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 302
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 16
         End
         Begin Table = "Stratagis_Vehicle_View"
            Begin Extent = 
               Top = 6
               Left = 275
               Bottom = 254
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_OBD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_OBD'
GO
/****** Object:  View [dbo].[Stratagis_Historic_Acc]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Historic_Acc]
AS
SELECT     dbo.STRATAGIS_FLEET_HISTORIC.OBJECTID, dbo.STRATAGIS_FLEET_HISTORIC.TimeStamp, dbo.STRATAGIS_FLEET_HISTORIC.Validity, 
                      dbo.STRATAGIS_FLEET_HISTORIC.Speed, dbo.STRATAGIS_FLEET_HISTORIC.Course, dbo.STRATAGIS_FLEET_HISTORIC.Variation, 
                      dbo.STRATAGIS_FLEET_HISTORIC.EastWest, dbo.STRATAGIS_FLEET_HISTORIC.DeviceId, dbo.STRATAGIS_FLEET_HISTORIC.VehicleId, 
                      dbo.STRATAGIS_FLEET_HISTORIC.EventNumber, dbo.STRATAGIS_FLEET_HISTORIC.VIN, dbo.STRATAGIS_FLEET_HISTORIC.ODBProtocol, 
                      dbo.STRATAGIS_FLEET_HISTORIC.FirmWareVersion, dbo.STRATAGIS_FLEET_HISTORIC.RSSI, dbo.STRATAGIS_FLEET_HISTORIC.MILCount, 
                      dbo.STRATAGIS_FLEET_HISTORIC.MILCodes, dbo.STRATAGIS_FLEET_HISTORIC.GpsOdometerMiles, dbo.STRATAGIS_FLEET_HISTORIC.OBDTripOdometerMiles, 
                      dbo.STRATAGIS_FLEET_HISTORIC.VehicleSpeedMph, dbo.STRATAGIS_FLEET_HISTORIC.Rpms, dbo.STRATAGIS_FLEET_HISTORIC.CoolantTempF, 
                      dbo.STRATAGIS_FLEET_HISTORIC.GPSStatus, dbo.STRATAGIS_FLEET_HISTORIC.IdleTimeSec, dbo.STRATAGIS_FLEET_HISTORIC.UserVar, 
                      dbo.STRATAGIS_FLEET_HISTORIC.AccelerationX, dbo.STRATAGIS_FLEET_HISTORIC.AccelerationY, dbo.STRATAGIS_FLEET_HISTORIC.AccelerationZ, 
                      dbo.STRATAGIS_FLEET_HISTORIC.ExcAccelTime, dbo.STRATAGIS_FLEET_HISTORIC.ExcAccelLength, dbo.STRATAGIS_FLEET_HISTORIC.ExcAcceleration, 
                      dbo.STRATAGIS_FLEET_HISTORIC.ExcDecelTime, dbo.STRATAGIS_FLEET_HISTORIC.ExcDecelLength, dbo.STRATAGIS_FLEET_HISTORIC.ExcDeceleration
FROM         dbo.STRATAGIS_FLEET_HISTORIC INNER JOIN
                      dbo.Stratagis_Vehicle_View AS Stratagis_Vehicle_View_4 ON dbo.STRATAGIS_FLEET_HISTORIC.VehicleId = Stratagis_Vehicle_View_4.VehicleId
WHERE     (dbo.STRATAGIS_FLEET_HISTORIC.EventNumber = 31)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "STRATAGIS_FLEET_HISTORIC"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Vehicle_View_4"
            Begin Extent = 
               Top = 6
               Left = 275
               Bottom = 125
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 37
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_Acc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_Acc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_Acc'
GO
/****** Object:  View [dbo].[Stratagis_Historic_DI]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Historic_DI]
AS
SELECT     STRATAGIS_FLEET_HISTORIC_1.OBJECTID, STRATAGIS_FLEET_HISTORIC_1.TimeStamp, STRATAGIS_FLEET_HISTORIC_1.Validity, 
                      STRATAGIS_FLEET_HISTORIC_1.Speed, STRATAGIS_FLEET_HISTORIC_1.Course, STRATAGIS_FLEET_HISTORIC_1.Variation, 
                      STRATAGIS_FLEET_HISTORIC_1.EastWest, STRATAGIS_FLEET_HISTORIC_1.DeviceId, STRATAGIS_FLEET_HISTORIC_1.VehicleId, 
                      STRATAGIS_FLEET_HISTORIC_1.EventNumber, STRATAGIS_FLEET_HISTORIC_1.GpsOdometerMiles + Stratagis_Vehicle_View_1.OdometerAdj AS AdjOdometer, 
                      Stratagis_Vehicle_View_1.Department, STRATAGIS_FLEET_HISTORIC_1.DigitalInput, STRATAGIS_FLEET_HISTORIC_1.GpsOdometerMiles, 
                      STRATAGIS_FLEET_HISTORIC_1.GPSStatus, STRATAGIS_FLEET_HISTORIC_1.IdleTimeSec
FROM         dbo.STRATAGIS_FLEET_HISTORIC AS STRATAGIS_FLEET_HISTORIC_1 INNER JOIN
                      dbo.Stratagis_Vehicle_View AS Stratagis_Vehicle_View_1 ON STRATAGIS_FLEET_HISTORIC_1.VehicleId = Stratagis_Vehicle_View_1.VehicleId
WHERE     (STRATAGIS_FLEET_HISTORIC_1.EventNumber = 32)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "STRATAGIS_FLEET_HISTORIC_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 302
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "Stratagis_Vehicle_View_1"
            Begin Extent = 
               Top = 6
               Left = 275
               Bottom = 251
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 38
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_DI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_DI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_DI'
GO
/****** Object:  View [dbo].[Stratagis_Mart_On_Off]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Mart_On_Off]
AS
SELECT     dbo.Stratagis_Date_View.LocalDate, dbo.Stratagis_Date_View.DateYear, dbo.Stratagis_Date_View.DateMonth, dbo.Stratagis_Date_View.DateWeek, 
                      dbo.Stratagis_Date_View.DateDay, dbo.Stratagis_Vehicle_View.VehicleId, CONVERT(varchar, CONVERT(time, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), 
                      sysdatetime()), MIN(dbo.Stratagis_Historic_Mart.TimeStamp))), 100) AS OnTime, CONVERT(varchar, CONVERT(time, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), 
                      sysdatetime()), MAX(dbo.Stratagis_Historic_Mart.TimeStamp))), 100) AS OffTime
FROM         dbo.Stratagis_Historic_Mart RIGHT OUTER JOIN
                      dbo.Stratagis_Date_View ON dbo.Stratagis_Historic_Mart.DateYear = dbo.Stratagis_Date_View.DateYear AND 
                      dbo.Stratagis_Historic_Mart.DateMonth = dbo.Stratagis_Date_View.DateMonth AND 
                      dbo.Stratagis_Historic_Mart.DateDay = dbo.Stratagis_Date_View.DateDay RIGHT OUTER JOIN
                      dbo.Stratagis_Vehicle_View ON dbo.Stratagis_Historic_Mart.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId
GROUP BY CONVERT(date, dbo.Stratagis_Historic_Mart.TimeStamp), dbo.Stratagis_Vehicle_View.VehicleId, dbo.Stratagis_Date_View.LocalDate, 
                      dbo.Stratagis_Date_View.DateYear, dbo.Stratagis_Date_View.DateMonth, dbo.Stratagis_Date_View.DateWeek, dbo.Stratagis_Date_View.DateDay
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Stratagis_Historic_Mart"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 292
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Date_View"
            Begin Extent = 
               Top = 4
               Left = 316
               Bottom = 266
               Right = 492
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Vehicle_View"
            Begin Extent = 
               Top = 6
               Left = 505
               Bottom = 266
               Right = 681
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_On_Off'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_On_Off'
GO
/****** Object:  View [dbo].[Stratagis_Mart_Miles]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Mart_Miles]
AS
SELECT     dbo.Stratagis_Date_View.LocalDate, dbo.Stratagis_Date_View.DateYear, dbo.Stratagis_Date_View.DateMonth, dbo.Stratagis_Date_View.DateWeek, 
                      dbo.Stratagis_Date_View.DateDay, dbo.Stratagis_Vehicle_View.VehicleId, ROUND(z.GPSOdometerMiles - ISNULL(z.Miles, 0), 2) AS Miles
FROM         (SELECT     a.LocalDate, a.DateYear, a.DateMonth, a.DateDay, a.VehicleId, a.GPSOdometerMiles, MAX(ISNULL(b.GPSOdometerMiles, 0)) AS Miles
                       FROM          (SELECT     CONVERT(date, LocalTimeStamp) AS LocalDate, DateYear, DateMonth, DateDay, VehicleId, MAX(GpsOdometerMiles) 
                                                                      AS GPSOdometerMiles
                                               FROM          dbo.Stratagis_Historic_Mart
                                               GROUP BY CONVERT(date, LocalTimeStamp), DateYear, DateMonth, DateDay, VehicleId) AS a LEFT OUTER JOIN
                                                  (SELECT     CONVERT(date, LocalTimeStamp) AS LocalDate, DateYear, DateMonth, DateDay, VehicleId, MAX(GpsOdometerMiles) 
                                                                           AS GPSOdometerMiles
                                                    FROM          dbo.Stratagis_Historic_Mart AS Stratagis_Historic_Mart_1
                                                    GROUP BY CONVERT(date, LocalTimeStamp), DateYear, DateMonth, DateDay, VehicleId) AS b ON a.VehicleId = b.VehicleId AND 
                                              a.GPSOdometerMiles > b.GPSOdometerMiles AND a.LocalDate > b.LocalDate
                       GROUP BY a.LocalDate, a.DateYear, a.DateMonth, a.DateDay, a.VehicleId, a.GPSOdometerMiles) AS z RIGHT OUTER JOIN
                      dbo.Stratagis_Date_View ON z.LocalDate = dbo.Stratagis_Date_View.LocalDate AND z.DateYear = dbo.Stratagis_Date_View.DateYear AND 
                      z.DateMonth = dbo.Stratagis_Date_View.DateMonth AND z.DateDay = dbo.Stratagis_Date_View.DateDay RIGHT OUTER JOIN
                      dbo.Stratagis_Vehicle_View ON z.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "z"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 238
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Date_View"
            Begin Extent = 
               Top = 0
               Left = 329
               Bottom = 208
               Right = 489
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Vehicle_View"
            Begin Extent = 
               Top = 136
               Left = 917
               Bottom = 255
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Miles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Miles'
GO
/****** Object:  View [dbo].[Stratagis_Mart_Mile_Speed_View]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Mart_Mile_Speed_View]
AS
SELECT     dbo.Stratagis_Date_View.LocalDate, dbo.Stratagis_Date_View.DateYear, dbo.Stratagis_Date_View.DateMonth, dbo.Stratagis_Date_View.DateWeek, 
                      dbo.Stratagis_Date_View.DateDay, dbo.Stratagis_Vehicle_View.VehicleId, b_1.MaxSpeed
FROM         dbo.Stratagis_Vehicle_View LEFT OUTER JOIN
                      dbo.Stratagis_Date_View LEFT OUTER JOIN
                          (SELECT     DateYear, DateMonth, DateDay, VehicleId, MAX(Speed) AS MaxSpeed
                            FROM          dbo.Stratagis_Historic_Mart AS Stratagis_Historic_Mart_2
                            GROUP BY DateYear, DateMonth, DateDay, VehicleId) AS b_1 ON dbo.Stratagis_Date_View.DateYear = b_1.DateYear AND 
                      dbo.Stratagis_Date_View.DateMonth = b_1.DateMonth AND dbo.Stratagis_Date_View.DateDay = b_1.DateDay ON dbo.Stratagis_Vehicle_View.VehicleId = b_1.VehicleId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Stratagis_Vehicle_View"
            Begin Extent = 
               Top = 167
               Left = 340
               Bottom = 290
               Right = 540
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b_1"
            Begin Extent = 
               Top = 62
               Left = 888
               Bottom = 203
               Right = 1088
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Date_View"
            Begin Extent = 
               Top = 7
               Left = 533
               Bottom = 164
               Right = 717
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1356
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Mile_Speed_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Mile_Speed_View'
GO
/****** Object:  View [dbo].[Stratagis_Report_Daily]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Report_Daily]
AS
SELECT     dbo.Stratagis_Daily_Report_Mart.Date, dbo.Stratagis_Daily_Report_Mart.DateYear, dbo.Stratagis_Daily_Report_Mart.DateMonth, 
                      dbo.Stratagis_Daily_Report_Mart.DateWeek, dbo.Stratagis_Daily_Report_Mart.DateDay, dbo.Stratagis_Daily_Report_Mart.VehicleId, 
                      dbo.Stratagis_Daily_Report_Mart.HoursRunning, dbo.Stratagis_Daily_Report_Mart.HoursIdle, dbo.Stratagis_Daily_Report_Mart.HoursOff, 
                      dbo.Stratagis_Daily_Report_Mart.DIHours, dbo.Stratagis_Daily_Report_Mart.TotalMiles, dbo.Stratagis_Daily_Report_Mart.AvgSpeed, 
                      dbo.Stratagis_Daily_Report_Mart.MaxSpeed, dbo.Stratagis_Daily_Report_Mart.OnTime, dbo.Stratagis_Daily_Report_Mart.OffTime, 
                      dbo.Stratagis_Daily_Report_Mart.MILCodes, dbo.Stratagis_Vehicle_View.Department, dbo.Stratagis_Vehicle_View.UseDescription
FROM         dbo.Stratagis_Daily_Report_Mart LEFT OUTER JOIN
                      dbo.Stratagis_Vehicle_View ON dbo.Stratagis_Daily_Report_Mart.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Stratagis_Daily_Report_Mart"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 249
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Vehicle_View"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 240
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Report_Daily'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Report_Daily'
GO
/****** Object:  View [dbo].[Stratagis_Realtime_View]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Realtime_View]
AS
SELECT     diobd.OBJECTID, diobd.TimeStamp, diobd.LocalTimeStamp, diobd.DateYear, diobd.DateMonth, diobd.DateDay, diobd.LocalTime, diobd.Validity, diobd.Speed, 
                      diobd.Course, diobd.Variation, diobd.EastWest, diobd.DeviceId, diobd.VehicleId, diobd.EventNumber, CASE WHEN diobd.VIN IS NULL 
                      THEN Stratagis_Vehicle_View_3.VIN ELSE diobd.VIN END AS VIN, diobd.ODBProtocol, diobd.FirmWareVersion, diobd.RSSI, diobd.MILCount, diobd.MILCodes, 
                      diobd.GpsOdometerMiles, diobd.OBDTripOdometerMiles, diobd.SHAPE, diobd.AdjOdometer, diobd.Department, diobd.DigitalInput, accobd.VehicleSpeedMph, 
                      accobd.Rpms, accobd.CoolantTempF, accobd.GPSStatus, 
                      case when isnull(accobd.IdleTimeSec,0) >= isnull(diobd.IdleTimeSec,0) then
						isnull(accobd.IdleTimeSec,0)
						else isnull(diobd.IdleTimeSec,0)
						end as IdleTimeSec
                      
                      , accobd.UserVar, accobd.AccelerationX, accobd.AccelerationY, accobd.AccelerationZ, 
                      accobd.ExcAccelTime, accobd.ExcAccelLength, accobd.ExcAcceleration, accobd.ExcDecelTime, accobd.ExcDecelLength, accobd.ExcDeceleration, 
                      ISNULL(Stratagis_Vehicle_View_3.OdometerAdj, 0) + ISNULL(diobd.GpsOdometerMiles, 0) AS Odometer, Stratagis_Vehicle_View_3.UseDescription
FROM         (SELECT     obd.OBJECTID, obd.TimeStamp, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), obd.TimeStamp) AS LocalTimeStamp, YEAR(DATEADD(mi, 
                                              DATEDIFF(mi, sysutcdatetime(), sysdatetime()), obd.TimeStamp)) AS DateYear, MONTH(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), 
                                              obd.TimeStamp)) AS DateMonth, DAY(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), obd.TimeStamp)) AS DateDay, CONVERT(varchar, 
                                              CONVERT(time, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), obd.TimeStamp)), 100) AS LocalTime, obd.Validity, obd.Speed, obd.Course, 
                                              obd.Variation, obd.EastWest, obd.DeviceId, obd.VehicleId, obd.EventNumber, obd.VIN, obd.ODBProtocol, obd.FirmWareVersion, obd.RSSI, obd.MILCount, 
                                              obd.MILCodes, obd.GpsOdometerMiles, obd.OBDTripOdometerMiles, obd.SHAPE, obd.AdjOdometer, obd.Department, di.DigitalInput, di.IdleTimeSec
                       FROM          (SELECT     STRATAGIS_FLEET_REALTIME_1.OBJECTID, STRATAGIS_FLEET_REALTIME_1.TimeStamp, STRATAGIS_FLEET_REALTIME_1.Validity, 
                                                                      STRATAGIS_FLEET_REALTIME_1.Speed, STRATAGIS_FLEET_REALTIME_1.Course, STRATAGIS_FLEET_REALTIME_1.Variation, 
                                                                      STRATAGIS_FLEET_REALTIME_1.EastWest, STRATAGIS_FLEET_REALTIME_1.DeviceId, STRATAGIS_FLEET_REALTIME_1.VehicleId, 
                                                                      STRATAGIS_FLEET_REALTIME_1.EventNumber, STRATAGIS_FLEET_REALTIME_1.VIN, STRATAGIS_FLEET_REALTIME_1.ODBProtocol, 
                                                                      STRATAGIS_FLEET_REALTIME_1.FirmWareVersion, STRATAGIS_FLEET_REALTIME_1.RSSI, STRATAGIS_FLEET_REALTIME_1.MILCount, 
                                                                      STRATAGIS_FLEET_REALTIME_1.MILCodes, STRATAGIS_FLEET_REALTIME_1.GpsOdometerMiles, 
                                                                      STRATAGIS_FLEET_REALTIME_1.OBDTripOdometerMiles, STRATAGIS_FLEET_REALTIME_1.VehicleSpeedMph, 
                                                                      STRATAGIS_FLEET_REALTIME_1.Rpms, STRATAGIS_FLEET_REALTIME_1.CoolantTempF, STRATAGIS_FLEET_REALTIME_1.GPSStatus, 
                                                                      STRATAGIS_FLEET_REALTIME_1.IdleTimeSec, STRATAGIS_FLEET_REALTIME_1.UserVar, STRATAGIS_FLEET_REALTIME_1.AccelerationX, 
                                                                      STRATAGIS_FLEET_REALTIME_1.AccelerationY, STRATAGIS_FLEET_REALTIME_1.AccelerationZ, 
                                                                      STRATAGIS_FLEET_REALTIME_1.ExcAccelTime, STRATAGIS_FLEET_REALTIME_1.ExcAccelLength, 
                                                                      STRATAGIS_FLEET_REALTIME_1.ExcAcceleration, STRATAGIS_FLEET_REALTIME_1.ExcDecelTime, 
                                                                      STRATAGIS_FLEET_REALTIME_1.ExcDecelLength, STRATAGIS_FLEET_REALTIME_1.ExcDeceleration, STRATAGIS_FLEET_REALTIME_1.SHAPE, 
                                                                      STRATAGIS_FLEET_REALTIME_1.GpsOdometerMiles + Stratagis_Vehicle_View_1.OdometerAdj AS AdjOdometer, 
                                                                      Stratagis_Vehicle_View_1.Department, STRATAGIS_FLEET_REALTIME_1.DigitalInput
                                               FROM          dbo.STRATAGIS_FLEET_REALTIME AS STRATAGIS_FLEET_REALTIME_1 LEFT OUTER JOIN
                                                                      dbo.Stratagis_Vehicle_View AS Stratagis_Vehicle_View_1 ON 
                                                                      STRATAGIS_FLEET_REALTIME_1.VehicleId = Stratagis_Vehicle_View_1.VehicleId
                                               WHERE      (STRATAGIS_FLEET_REALTIME_1.EventNumber = 32)) AS di RIGHT OUTER JOIN
                                                  (SELECT     STRATAGIS_FLEET_REALTIME_2.OBJECTID, STRATAGIS_FLEET_REALTIME_2.TimeStamp, STRATAGIS_FLEET_REALTIME_2.Validity, 
                                                                           STRATAGIS_FLEET_REALTIME_2.Speed, STRATAGIS_FLEET_REALTIME_2.Course, STRATAGIS_FLEET_REALTIME_2.Variation, 
                                                                           STRATAGIS_FLEET_REALTIME_2.EastWest, STRATAGIS_FLEET_REALTIME_2.DeviceId, STRATAGIS_FLEET_REALTIME_2.VehicleId, 
                                                                           STRATAGIS_FLEET_REALTIME_2.EventNumber, STRATAGIS_FLEET_REALTIME_2.VIN, STRATAGIS_FLEET_REALTIME_2.ODBProtocol, 
                                                                           STRATAGIS_FLEET_REALTIME_2.FirmWareVersion, STRATAGIS_FLEET_REALTIME_2.RSSI, STRATAGIS_FLEET_REALTIME_2.MILCount, 
                                                                           STRATAGIS_FLEET_REALTIME_2.MILCodes, STRATAGIS_FLEET_REALTIME_2.GpsOdometerMiles, 
                                                                           STRATAGIS_FLEET_REALTIME_2.OBDTripOdometerMiles, STRATAGIS_FLEET_REALTIME_2.VehicleSpeedMph, 
                                                                           STRATAGIS_FLEET_REALTIME_2.Rpms, STRATAGIS_FLEET_REALTIME_2.CoolantTempF, STRATAGIS_FLEET_REALTIME_2.GPSStatus, 
                                                                           STRATAGIS_FLEET_REALTIME_2.IdleTimeSec, STRATAGIS_FLEET_REALTIME_2.UserVar, STRATAGIS_FLEET_REALTIME_2.AccelerationX, 
                                                                           STRATAGIS_FLEET_REALTIME_2.AccelerationY, STRATAGIS_FLEET_REALTIME_2.AccelerationZ, 
                                                                           STRATAGIS_FLEET_REALTIME_2.ExcAccelTime, STRATAGIS_FLEET_REALTIME_2.ExcAccelLength, 
                                                                           STRATAGIS_FLEET_REALTIME_2.ExcAcceleration, STRATAGIS_FLEET_REALTIME_2.ExcDecelTime, 
                                                                           STRATAGIS_FLEET_REALTIME_2.ExcDecelLength, STRATAGIS_FLEET_REALTIME_2.ExcDeceleration, 
                                                                           STRATAGIS_FLEET_REALTIME_2.SHAPE, 
                                                                           STRATAGIS_FLEET_REALTIME_2.GpsOdometerMiles + dbo.Stratagis_Vehicle_View.OdometerAdj AS AdjOdometer, 
                                                                           dbo.Stratagis_Vehicle_View.Department
                                                    FROM          dbo.STRATAGIS_FLEET_REALTIME AS STRATAGIS_FLEET_REALTIME_2 LEFT OUTER JOIN
                                                                           dbo.Stratagis_Vehicle_View ON STRATAGIS_FLEET_REALTIME_2.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId
                                                    WHERE      (STRATAGIS_FLEET_REALTIME_2.EventNumber = 30) AND (STRATAGIS_FLEET_REALTIME_2.GpsOdometerMiles IS NOT NULL)) AS obd ON 
                                              di.VehicleId = obd.VehicleId AND di.DeviceId = obd.DeviceId AND di.EastWest = obd.EastWest
                       WHERE      (ABS(di.OBJECTID - obd.OBJECTID) <= 2) AND (ABS(DATEDIFF(second, di.TimeStamp, obd.TimeStamp)) <= 5)) AS diobd INNER JOIN
                          (SELECT     MAX(OBJECTID) AS OBJECTID, VehicleId
                            FROM          dbo.STRATAGIS_FLEET_REALTIME AS STRATAGIS_FLEET_REALTIME_3
                            WHERE      (EventNumber = 30)
                            GROUP BY VehicleId) AS mostrecent ON diobd.OBJECTID = mostrecent.OBJECTID INNER JOIN
                      dbo.Stratagis_Vehicle_View AS Stratagis_Vehicle_View_3 ON diobd.VehicleId = Stratagis_Vehicle_View_3.VehicleId LEFT OUTER JOIN
                          (SELECT     obda.OBJECTID, obda.TimeStamp, obda.Validity, obda.Speed, obda.Course, obda.Variation, obda.EastWest, obda.DeviceId, obda.VehicleId, 
                                                   obda.EventNumber, obda.VIN, obda.ODBProtocol, obda.FirmWareVersion, obda.OBDTripOdometerMiles, obda.GpsOdometerMiles, obda.MILCodes, 
                                                   obda.MILCount, obda.RSSI, obda.SHAPE, obda.AdjOdometer, obda.Department, acc.VehicleSpeedMph, acc.Rpms, acc.CoolantTempF, acc.GPSStatus, 
                                                   acc.IdleTimeSec, acc.UserVar, acc.AccelerationX, acc.AccelerationY, acc.AccelerationZ, acc.ExcAccelTime, acc.ExcAccelLength, acc.ExcAcceleration, 
                                                   acc.ExcDecelTime, acc.ExcDecelLength, acc.ExcDeceleration
                            FROM          (SELECT     OBJECTID, TimeStamp, Validity, Speed, Course, Variation, EastWest, DeviceId, VehicleId, EventNumber, VIN, ODBProtocol, FirmWareVersion, 
                                                                           RSSI, MILCount, MILCodes, GpsOdometerMiles, OBDTripOdometerMiles, VehicleSpeedMph, Rpms, CoolantTempF, GPSStatus, IdleTimeSec, 
                                                                           UserVar, AccelerationX, AccelerationY, AccelerationZ, ExcAccelTime, ExcAccelLength, ExcAcceleration, ExcDecelTime, ExcDecelLength, 
                                                                           ExcDeceleration, SHAPE
                                                    FROM          dbo.STRATAGIS_FLEET_REALTIME
                                                    WHERE      (EventNumber = 31)) AS acc INNER JOIN
                                                       (SELECT     STRATAGIS_FLEET_REALTIME_2.OBJECTID, STRATAGIS_FLEET_REALTIME_2.TimeStamp, STRATAGIS_FLEET_REALTIME_2.Validity, 
                                                                                STRATAGIS_FLEET_REALTIME_2.Speed, STRATAGIS_FLEET_REALTIME_2.Course, STRATAGIS_FLEET_REALTIME_2.Variation, 
                                                                                STRATAGIS_FLEET_REALTIME_2.EastWest, STRATAGIS_FLEET_REALTIME_2.DeviceId, STRATAGIS_FLEET_REALTIME_2.VehicleId, 
                                                                                STRATAGIS_FLEET_REALTIME_2.EventNumber, STRATAGIS_FLEET_REALTIME_2.VIN, STRATAGIS_FLEET_REALTIME_2.ODBProtocol, 
                                                                                STRATAGIS_FLEET_REALTIME_2.FirmWareVersion, STRATAGIS_FLEET_REALTIME_2.RSSI, STRATAGIS_FLEET_REALTIME_2.MILCount, 
                                                                                STRATAGIS_FLEET_REALTIME_2.MILCodes, STRATAGIS_FLEET_REALTIME_2.GpsOdometerMiles, 
                                                                                STRATAGIS_FLEET_REALTIME_2.OBDTripOdometerMiles, STRATAGIS_FLEET_REALTIME_2.VehicleSpeedMph, 
                                                                                STRATAGIS_FLEET_REALTIME_2.Rpms, STRATAGIS_FLEET_REALTIME_2.CoolantTempF, STRATAGIS_FLEET_REALTIME_2.GPSStatus, 
                                                                                STRATAGIS_FLEET_REALTIME_2.IdleTimeSec, STRATAGIS_FLEET_REALTIME_2.UserVar, STRATAGIS_FLEET_REALTIME_2.AccelerationX, 
                                                                                STRATAGIS_FLEET_REALTIME_2.AccelerationY, STRATAGIS_FLEET_REALTIME_2.AccelerationZ, 
                                                                                STRATAGIS_FLEET_REALTIME_2.ExcAccelTime, STRATAGIS_FLEET_REALTIME_2.ExcAccelLength, 
                                                                                STRATAGIS_FLEET_REALTIME_2.ExcAcceleration, STRATAGIS_FLEET_REALTIME_2.ExcDecelTime, 
                                                                                STRATAGIS_FLEET_REALTIME_2.ExcDecelLength, STRATAGIS_FLEET_REALTIME_2.ExcDeceleration, 
                                                                                STRATAGIS_FLEET_REALTIME_2.SHAPE, 
                                                                                STRATAGIS_FLEET_REALTIME_2.GpsOdometerMiles + Stratagis_Vehicle_View_2.OdometerAdj AS AdjOdometer, 
                                                                                Stratagis_Vehicle_View_2.Department
                                                         FROM          dbo.STRATAGIS_FLEET_REALTIME AS STRATAGIS_FLEET_REALTIME_2 LEFT OUTER JOIN
                                                                                dbo.Stratagis_Vehicle_View AS Stratagis_Vehicle_View_2 ON 
                                                                                STRATAGIS_FLEET_REALTIME_2.VehicleId = Stratagis_Vehicle_View_2.VehicleId
                                                         WHERE      (STRATAGIS_FLEET_REALTIME_2.EventNumber = 30) AND (STRATAGIS_FLEET_REALTIME_2.GpsOdometerMiles IS NOT NULL)) AS obda ON
                                                    acc.DeviceId = obda.DeviceId AND acc.EastWest = obda.EastWest AND acc.VehicleId = obda.VehicleId
                            WHERE      (ABS(acc.OBJECTID - obda.OBJECTID) <= 2) AND (ABS(DATEDIFF(second, acc.TimeStamp, obda.TimeStamp)) <= 5)) AS accobd ON 
                      diobd.VehicleId = accobd.VehicleId AND diobd.DeviceId = accobd.DeviceId AND diobd.OBJECTID = accobd.OBJECTID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "diobd"
            Begin Extent = 
               Top = 10
               Left = 258
               Bottom = 297
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "mostrecent"
            Begin Extent = 
               Top = 182
               Left = 630
               Bottom = 271
               Right = 790
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Vehicle_View_3"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 279
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "accobd"
            Begin Extent = 
               Top = 12
               Left = 609
               Bottom = 153
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Realtime_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Realtime_View'
GO
/****** Object:  View [dbo].[Stratagis_Current_OBD]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Current_OBD]
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "STRATAGIS_FLEET_HISTORIC_Current_2"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Vehicle_View"
            Begin Extent = 
               Top = 6
               Left = 275
               Bottom = 278
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Current_OBD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Current_OBD'
GO
/****** Object:  View [dbo].[Stratagis_Current_DI]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Current_DI]
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "STRATAGIS_FLEET_HISTORIC_Current_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 316
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "Stratagis_Vehicle_View_1"
            Begin Extent = 
               Top = 6
               Left = 275
               Bottom = 125
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Current_DI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Current_DI'
GO
/****** Object:  View [dbo].[Stratagis_Current_Acc]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Current_Acc]
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
/****** Object:  View [dbo].[Stratagis_Trip]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Trip]
AS
SELECT     z.OBJECTID as StartObjectId
		, y.OBJECTID AS StopObjectId
		, z.VehicleId
		, z.DateYear
		, z.DateMonth
		, z.DateDay
		, z.TimeStamp as StartTimeStamp
		, y.TimeStamp AS StopTimeStamp
		, z.LocalTimeStamp as StartLocalTimeStamp
		,  y.LocalTimeStamp AS StopLocalTimeStamp
		, z.LocalTime as StartLocalTime
		, y.LocalTime AS StopLocalTime
		
		, CONVERT(VARCHAR(5), DATEDIFF(s, z.TimeStamp, y.TimeStamp) / 60 / 60) + ':' + RIGHT('0' + CONVERT(VARCHAR(2), DATEDIFF(s, z.TimeStamp,  y.TimeStamp) / 60 % 60), 2) + ':' + RIGHT('0' + CONVERT(VARCHAR(2), DATEDIFF(s, z.TimeStamp, y.TimeStamp) % 60), 2) AS TripDuration
        , y.GpsOdometerMiles - z.GpsOdometerMiles AS TripMiles
        
        , CONVERT(VARCHAR(5), y.StopTimeS / 60 / 60) + ':' + RIGHT('0' + CONVERT(VARCHAR(2), y.StopTimeS / 60 % 60), 2) + ':' + RIGHT('0' + CONVERT(VARCHAR(2), y.StopTimeS % 60), 2) AS StopLength
        , x.SHAPE.STX as STX
        , x.SHAPE.STY as STY
FROM         (SELECT     a.OBJECTID, a.TimeStamp, a.LocalTimeStamp, a.DateYear, a.DateMonth, a.DateDay, a.LocalTime, a.VehicleId, a.GpsOdometerMiles, MIN(b.OBJECTID) 
                                              AS newObjectId
                       FROM          (SELECT     OBJECTID, TimeStamp, LocalTimeStamp, DateYear, DateMonth, DateDay, LocalTime, VehicleId, GpsOdometerMiles
                                               FROM          dbo.Stratagis_Trip_Start) AS a INNER JOIN
                                                  (SELECT     OBJECTID, TimeStamp, LocalTimeStamp, DateYear, DateMonth, DateDay, LocalTime, VehicleId, GpsOdometerMiles
                                                    FROM          dbo.Stratagis_Trip_Stop) AS b ON a.OBJECTID < b.OBJECTID AND a.VehicleId = b.VehicleId
                       GROUP BY a.OBJECTID, a.TimeStamp, a.LocalTimeStamp, a.DateYear, a.DateMonth, a.DateDay, a.LocalTime, a.VehicleId, a.GpsOdometerMiles) AS z INNER JOIN
                      dbo.Stratagis_Trip_Stop AS y ON z.newObjectId = y.OBJECTID INNER JOIN
                      dbo.STRATAGIS_FLEET_HISTORIC AS x ON y.OBJECTID = x.OBJECTID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "z"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "y"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 125
               Right = 432
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "x"
            Begin Extent = 
               Top = 6
               Left = 470
               Bottom = 125
               Right = 669
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Trip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Trip'
GO
/****** Object:  View [dbo].[Stratagis_Mart_Daily_Hours]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Mart_Daily_Hours]
AS
SELECT     dbo.Stratagis_Date_View.LocalDate, dbo.Stratagis_Date_View.DateYear, dbo.Stratagis_Date_View.DateMonth, dbo.Stratagis_Date_View.DateWeek, 
                      dbo.Stratagis_Date_View.DateDay, dbo.Stratagis_Vehicle_View.VehicleId, ISNULL(run.HoursRunning, 0) AS HoursRunning, ISNULL(idle.HoursIdle, 0) AS HoursIdle, 
                      24 - ISNULL(run.HoursRunning, 0) - ISNULL(idle.HoursIdle, 0) AS HoursOff, ISNULL(derivedtbl_1.DIHours, 0) AS DIHours
FROM         dbo.Stratagis_Date_View LEFT OUTER JOIN
                          (SELECT     VehicleId, CONVERT(date, LocalTimeStamp) AS DayDate, CONVERT(datetime, CONVERT(date, LocalTimeStamp)) AS Date, ROUND(CONVERT(float, 
                                                   COUNT(*)) / 2 / 60, 2) AS DIHours
                            FROM          dbo.Stratagis_Historic_Mart AS Stratagis_Historic_Mart_2
                            WHERE      (DigitalInput <> '') AND (DigitalInput IS NOT NULL)
                            GROUP BY VehicleId, CONVERT(date, LocalTimeStamp), CONVERT(datetime, CONVERT(date, LocalTimeStamp))) AS derivedtbl_1 INNER JOIN
                      dbo.Stratagis_Vehicle_View INNER JOIN
                          (SELECT     VehicleId, CONVERT(date, LocalTimeStamp) AS DayDate, ROUND(CONVERT(float, COUNT(*)) / 2 / 60, 2) AS HoursRunning, CONVERT(datetime, 
                                                   CONVERT(date, LocalTimeStamp)) AS Date
                            FROM          dbo.Stratagis_Historic_Mart
                            WHERE      (Speed > 0)
                            GROUP BY VehicleId, CONVERT(date, LocalTimeStamp)) AS run ON dbo.Stratagis_Vehicle_View.VehicleId = run.VehicleId ON 
                      derivedtbl_1.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId INNER JOIN
                          (SELECT     VehicleId, CONVERT(date, LocalTimeStamp) AS DayDate, DateYear, DateMonth, DateDay, CONVERT(float, COUNT(*)) / 2 / 60 AS HoursIdle, 
                                                   CONVERT(datetime, CONVERT(date, LocalTimeStamp)) AS Date
                            FROM          dbo.Stratagis_Historic_Mart AS Stratagis_Historic_Mart_1
                            WHERE      (Speed = 0)
                            GROUP BY VehicleId, DateYear, DateMonth, DateDay, CONVERT(date, LocalTimeStamp)) AS idle ON dbo.Stratagis_Vehicle_View.VehicleId = idle.VehicleId ON 
                      dbo.Stratagis_Date_View.LocalDate = derivedtbl_1.DayDate AND dbo.Stratagis_Date_View.LocalDate = run.DayDate AND 
                      dbo.Stratagis_Date_View.DateDay = idle.DateDay AND dbo.Stratagis_Date_View.DateMonth = idle.DateMonth AND 
                      dbo.Stratagis_Date_View.DateYear = idle.DateYear AND dbo.Stratagis_Date_View.LocalDate = idle.DayDate
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[52] 4[14] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "idle"
            Begin Extent = 
               Top = 41
               Left = 374
               Bottom = 278
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Date_View"
            Begin Extent = 
               Top = 189
               Left = 48
               Bottom = 381
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "derivedtbl_1"
            Begin Extent = 
               Top = 148
               Left = 657
               Bottom = 355
               Right = 841
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "run"
            Begin Extent = 
               Top = 7
               Left = 831
               Bottom = 223
               Right = 1015
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Vehicle_View"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 188
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Daily_Hours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Daily_Hours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Daily_Hours'
GO
/****** Object:  View [dbo].[Stratagis_Report_Trip_Mart_View]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Report_Trip_Mart_View]
AS
SELECT     dbo.Stratagis_Report_Trip_Mart.*, dbo.Stratagis_Vehicle_View.Department
FROM         dbo.Stratagis_Report_Trip_Mart INNER JOIN
                      dbo.Stratagis_Vehicle_View ON dbo.Stratagis_Report_Trip_Mart.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Stratagis_Report_Trip_Mart"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 318
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Vehicle_View"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 319
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Report_Trip_Mart_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Report_Trip_Mart_View'
GO
/****** Object:  StoredProcedure [dbo].[set_default]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[set_default] 
AS SET NOCOUNT ON
BEGIN
  /* This is a public procedure to set multi version views
  to point to the default version, even as other processes
  might be moving the default version to new states.*/

  -- Check if we are already in an edit session.
  DECLARE @g_state_id BIGINT
  DECLARE @g_protected CHAR(1)
  DECLARE @g_is_default CHAR(1)
  DECLARE @g_version_id INTEGER
  EXECUTE Troy.dbo.SDE_get_globals   @g_state_id OUTPUT,@g_protected OUTPUT,@g_is_default OUTPUT,@g_version_id OUTPUT
  IF @g_version_id != -1
  BEGIN
    -- Check that version and state still exist (e.g. may have been rolled back)
    DECLARE @exists INTEGER
    SELECT @exists = count(*) from Troy.dbo.SDE_versions
      WHERE version_id = @g_version_id
    IF @exists > 0
    BEGIN
      SELECT @exists = count(*) from Troy.dbo.SDE_states
        WHERE state_id = @g_state_id
      IF @exists > 0
      BEGIN
        DECLARE @error_string NVARCHAR(256)
        SET @error_string = 'Cannot set default with an open transaction to another version.'
        RAISERROR (@error_string,16,-1)
        RETURN
      END
    END
  END

  SET CONTEXT_INFO 0x0
END
GO
/****** Object:  StoredProcedure [dbo].[set_current_version]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[set_current_version] 
@version_name NVARCHAR (97) AS SET NOCOUNT ON
BEGIN
-- This is a public support function for SDE versioned views. When working with
-- versioned views, call this procedure with the version name you wish the views to
-- reflect. Failure to call this procedure will cause versioned views to be based
-- on version 'sde.default'.

DECLARE @error_string NVARCHAR(256)
DECLARE @ret_code INTEGER
DECLARE @version_id INTEGER
DECLARE @parsed_name NVARCHAR (64)
DECLARE @parsed_owner NVARCHAR (32)

-- Parse the version name.
EXECUTE @ret_code = Troy.dbo.SDE_parse_version_name @version_name,
                    @parsed_name OUTPUT,  @parsed_owner OUTPUT
IF (@ret_code != 0)
  RETURN
-- Fetch the state id.
DECLARE @state_id BIGINT
DECLARE @status INTEGER
SELECT @state_id = v.state_id, @status = v.status, @version_id = v.version_id
FROM   Troy.dbo.SDE_versions v
WHERE  v.name = @parsed_name AND
       v.owner = @parsed_owner;
IF @state_id IS NULL
BEGIN
  SET @error_string = 'Version ' + @version_name + ' not found.'
  RAISERROR (@error_string,16,-1)
  RETURN
END
-- Check the version status: if private, we must be owner to continue,
-- if protected, note for future use.
DECLARE @protected CHAR (1)
SET @protected = Troy.dbo.SDE_get_version_access (@status, @parsed_owner)
IF @protected = '2'
BEGIN
  DECLARE @login  NVARCHAR (128)
  SELECT @login = suser_sname()
  SET @error_string = @login + ' is not the owner of version ' + 
                      @version_name + '.'
  RAISERROR (@error_string,16,-1)
  RETURN
END

-- Check if we are already in an edit session.
DECLARE @g_state_id BIGINT
DECLARE @g_protected CHAR(1)
DECLARE @g_is_default CHAR(1)
DECLARE @g_version_id INTEGER
EXECUTE Troy.dbo.SDE_get_globals @g_state_id OUTPUT,@g_protected OUTPUT,@g_is_default OUTPUT,@g_version_id OUTPUT
IF @g_version_id != -1 AND @g_version_id != @version_id
BEGIN
  -- Check that version and state still exist (e.g. may have been rolled back)
  DECLARE @exists INTEGER
  SELECT @exists = count(*) from Troy.dbo.SDE_versions
    WHERE version_id = @g_version_id
  IF @exists > 0
  BEGIN
    SELECT @exists = count(*) from Troy.dbo.SDE_states
      WHERE state_id = @g_state_id
    IF @exists > 0
    BEGIN
      SET @error_string = 'Cannot set version with an open transaction to another version.'
      RAISERROR (@error_string,16,-1)
     RETURN
    END
  END
  -- state or version do not exist, clear any edit session we were in
  SET @g_version_id = -1
END

-- Finally, set the global info
DECLARE @is_default CHAR(1)
IF @parsed_owner = 'dbo' AND @parsed_name = 'DEFAULT'
  SET @is_default = '1'
ELSE
  SET @is_default = '0'
EXECUTE Troy.dbo.SDE_set_globals @state_id,@protected,@is_default,@g_version_id 
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_state_def_delete]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_state_def_delete]
@id1 BIGINT, @id2 BIGINT, @id3 BIGINT, @id4 BIGINT, @id5 BIGINT,
@id6 BIGINT, @id7 BIGINT, @id8 BIGINT AS SET NOCOUNT ON
BEGIN
  DECLARE @ret_code INTEGER
  SET @ret_code = 0
  -- If we are deleting a single state, we add an additional check
  -- to make sure that this state has no child states.  This
  -- prevents some potential timing problems with compress.
  IF @id2 = -1
  BEGIN
    DECLARE @SE_STATE_HAS_CHILDREN INTEGER
    SET @SE_STATE_HAS_CHILDREN = 50175

    DECLARE @childCount INTEGER
    SELECT @childCount = COUNT(*) FROM Troy.dbo.SDE_states
      WHERE  parent_state_id = @id1
    IF @childCount <> 0
    BEGIN
      SET @ret_code = @SE_STATE_HAS_CHILDREN
      RETURN @ret_code
    END
  END

  DELETE FROM Troy.dbo.SDE_mvtables_modified WHERE state_id IN
    (@id1, @id2, @id3, @id4, @id5, @id6, @id7, @id8)

  -- Delete any lineages about to be orphaned
  DELETE FROM Troy.dbo.SDE_state_lineages WHERE lineage_name IN
    (SELECT lineage_name FROM Troy.dbo.SDE_states S1 WHERE state_id in
         (@id1, @id2, @id3, @id4, @id5, @id6, @id7, @id8)
     AND NOT EXISTS (SELECT * FROM Troy.dbo.SDE_states S2
     WHERE S1.lineage_name = ABS(S2.lineage_name) AND S2.state_id NOT IN
         (@id1, @id2, @id3, @id4, @id5, @id6, @id7, @id8)))

  -- Delete the states
  DELETE FROM Troy.dbo.SDE_states WHERE state_id IN
    (@id1, @id2, @id3, @id4, @id5, @id6, @id7, @id8)

  -- Delete any automatically placed exclusive state locks.
  DELETE FROM Troy.dbo.SDE_state_locks WHERE  state_id IN
    (@id1, @id2, @id3, @id4, @id5, @id6, @id7, @id8) AND  state_id <> 0 AND
    autolock = 'Y' AND lock_type = 'E'
  RETURN @ret_code
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_table_lock_def_insert]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_table_lock_def_insert]
@sdeIdVal INTEGER,
@registrationIdVal INTEGER,
@lockTypeVal VARCHAR(1) AS SET NOCOUNT ON
DECLARE @isConflictVal INTEGER
DECLARE @ret_val INTEGER
BEGIN TRAN table_lock_tran

/* Delete any existing lock on this table owned by this user.*/
/* This gets it out of the way during conflict checking (it will be*/
/* restored via rollback if a conflict is detected).*/
EXECUTE Troy.dbo.SDE_table_lock_def_delete @sdeIdVal, @registrationIdVal

/* check for conflicts */
EXECUTE Troy.dbo.SDE_table_check_lock_conflicts @sdeIdVal,@registrationIdVal,@lockTypeVal,@isConflictVal OUTPUT
IF (@isConflictVal = 0)
BEGIN
  INSERT INTO Troy.dbo.SDE_table_locks
         (sde_id,registration_id,lock_type)
  VALUES (@sdeIdVal,@registrationIdVal,@lockTypeVal)
  SET @ret_val = 0 /* SE_SUCCESS */ 
  COMMIT TRAN table_lock_tran
END
ELSE
BEGIN
  SET @ret_val = -49 /* SE_LOCK_CONFLICT */
  ROLLBACK TRAN table_lock_tran
END
RETURN @ret_val
GO
/****** Object:  StoredProcedure [dbo].[SDE_state_trim_pre_delete]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_state_trim_pre_delete]
@highStateIdVal BIGINT, @lowStateIdVal BIGINT AS SET NOCOUNT ON
BEGIN
  IF @lowStateIdVal = 0
  BEGIN
    -- We need to delete any modified flags before changing the high
    -- state to be the base state, or the states<->mvtables_modified
    -- integrity constraint will be violated, aborting the following.
    -- UPDATE. Similarly, we must also remove old state_lineages entries.

    DELETE FROM Troy.dbo.SDE_mvtables_modified
    WHERE  state_id  = @highStateIdVal
    DELETE FROM Troy.dbo.SDE_state_lineages
    WHERE  lineage_id  = @highStateIdVal

    -- We need to insert a 0,0 entry in the state_lineages table
    -- if it doesn't exist.
    DECLARE @baseIdExists INTEGER
    SELECT @baseIdExists = count(*) FROM Troy.dbo.SDE_state_lineages
      WHERE lineage_name = 0 AND lineage_id = 0
    IF (@baseIdExists = 0)
    BEGIN
      INSERT INTO Troy.dbo.SDE_state_lineages (lineage_name,lineage_id) VALUES (0,0)
    END
    -- Make sure the base state is closed and proper.
    UPDATE Troy.dbo.SDE_states
      SET parent_state_id = 0,
          owner = 'dbo',
          closing_time = ISNULL (closing_time,GETDATE()),
          lineage_name = 0
      WHERE state_id = 0
    -- Make the lineage_name negative of any immediate child state
    -- of the state becoming the base state, so that when we update
    -- the parent_state_id to become the base_state_id, we don't
    -- violate the states_uk constraint on parent_state_id and
    -- lineage_name.
    UPDATE Troy.dbo.SDE_states
      SET    lineage_name = -lineage_name
      WHERE  parent_state_id = @highStateIdVal
    -- Update the parent_id of any immediate child state of the state
    -- becoming the base state to be the base state.
    UPDATE Troy.dbo.SDE_states
      SET    parent_state_id = 0
      WHERE  parent_state_id = @highStateIdVal
    -- Update any versions based on the state becoming the base state
    -- to point at the base state instead.
    UPDATE Troy.dbo.SDE_versions
      SET    state_id = 0
      WHERE  state_id = @highStateIdVal
    -- Remove the high_state now that it has been compressed.
    DELETE FROM Troy.dbo.SDE_states
    WHERE  state_id = @highStateIdVal
  END
  ELSE
  BEGIN
    -- Update the parent_id but also invert the lineage id to avoid
    -- violating states_uk.
    UPDATE Troy.dbo.SDE_states
    SET    parent_state_id = (SELECT parent_state_id
                              FROM  Troy.dbo.SDE_states
                              WHERE  state_id = @lowStateIdVal),
           lineage_name = -lineage_name
    WHERE  state_id = @highStateIdVal
  END
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_state_lock_def_insert]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_state_lock_def_insert]
@sdeIdVal INTEGER,
@stateIdVal BIGINT,
@autoLockVal VARCHAR(1),
@lockTypeVal VARCHAR(1) AS SET NOCOUNT ON
DECLARE @isConflictVal INTEGER
DECLARE @ret_val INTEGER
BEGIN TRAN state_lock_tran

/* Marks don't conflict and it doesn't hurt if they are duplicates, */
/* so skip all that for them */
IF @lockTypeVal <> 'M' 
BEGIN
/* Delete any existing lock on this state owned by this user. */
/* This gets it out of the way during conflict checking (it will be */
/* restored via rollback if a conflict is detected).*/
  EXECUTE Troy.dbo.SDE_state_lock_def_delete @sdeIdVal, @stateIdVal, @autoLockVal,0

/* check for conflicts */
  EXECUTE Troy.dbo.SDE_state_check_lock_conflicts @sdeIdVal,@stateIdVal,@autoLockVal,@lockTypeVal,@isConflictVal OUTPUT
END
ELSE
BEGIN
  SET @isConflictVal = 0
END

IF (@isConflictVal = 0)
BEGIN
  INSERT INTO Troy.dbo.SDE_state_locks
         (sde_id,state_id,autolock,lock_type)
  VALUES (@sdeIdVal,@stateIdVal,@autoLockVal,@lockTypeVal)
  SET @ret_val = 0 /* SE_SUCCESS */ 
  COMMIT TRAN state_lock_tran
END
ELSE
BEGIN
  SET @ret_val = -49 /* SE_LOCK_CONFLICT */
  ROLLBACK TRAN state_lock_tran
END
RETURN @ret_val
GO
/****** Object:  StoredProcedure [dbo].[SDE_registry_def_delete]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_registry_def_delete]        @regIdVal INTEGER AS SET NOCOUNT ON       DELETE FROM Troy.dbo.SDE_mvtables_modified WHERE registration_id = @regIdVal 
       DELETE FROM Troy.dbo.SDE_table_registry WHERE registration_id = @regIdVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_registry_clear_modified]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_registry_clear_modified]                         @regIdVal INTEGER AS SET NOCOUNT ON DELETE FROM Troy.dbo.SDE_mvtables_modified WHERE                        registration_id = @regIdVal
GO
/****** Object:  StoredProcedure [dbo].[SDE_object_lock_def_insert]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_object_lock_def_insert]
@sdeIdVal INTEGER,
@objectIdVal INTEGER,
@objectTypeVal INTEGER,
@applicationIdVal INTEGER,
@autoLockVal VARCHAR(1),
@lockTypeVal VARCHAR(1) AS SET NOCOUNT ON
DECLARE @isConflictVal INTEGER
DECLARE @ret_val INTEGER
BEGIN TRAN object_lock_tran

/* Delete any existing lock on this object owned by this user. */
/* This gets it out of the way during conflict checking (it will be */
/* restored via rollback if a conflict is detected).*/
EXECUTE Troy.dbo.SDE_object_lock_def_delete @sdeIdVal, @objectIdVal, @objectTypeVal,
  @applicationIdVal, @autoLockVal

/* check for conflicts */
EXECUTE Troy.dbo.SDE_object_check_lock_conflicts @sdeIdVal,@objectIdVal,@objectTypeVal,
  @applicationIdVal,@autoLockVal,@lockTypeVal,@isConflictVal OUTPUT
IF (@isConflictVal = 0)
BEGIN
  INSERT INTO Troy.dbo.SDE_object_locks
    (sde_id,object_id,object_type,application_id,autolock,lock_type)
  VALUES (@sdeIdVal,@objectIdVal,@objectTypeVal,@applicationIdVal,
    @autoLockVal,@lockTypeVal)
  SET @ret_val = 0 /* SE_SUCCESS */ 
  COMMIT TRAN object_lock_tran
END
ELSE
BEGIN
  SET @ret_val = -49 /* SE_LOCK_CONFLICT */
  ROLLBACK TRAN object_lock_tran
END
RETURN @ret_val
GO
/****** Object:  StoredProcedure [dbo].[SDE_state_def_insert]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_state_def_insert]
@stateIdVal BIGINT, @ownerVal NVARCHAR(32), @pStateIdVal BIGINT,
@pLineageNameVal BIGINT OUTPUT, @sdeIdVal INTEGER,@OpenOrCloseVal INTEGER,
@crTimeVal DATETIME OUTPUT AS SET NOCOUNT ON
BEGIN
  SET XACT_ABORT OFF
  DECLARE @new_lineage_name BIGINT
  DECLARE @clTimeVal DATETIME
  SET @new_lineage_name = @pLineageNameVal

  SET @crTimeVal = GETDATE()
  -- close state
  IF @OpenOrCloseVal = 2
  BEGIN
    SET @clTimeVal = @crTimeVal
  END
  ELSE
  BEGIN
    SET @clTimeVal = NULL
  END

  BEGIN TRAN state_insert
  BEGIN TRY
    INSERT INTO Troy.dbo.SDE_states (state_id,owner,
      creation_time, closing_time,parent_state_id,lineage_name) VALUES
      (@stateIdVal, @ownerVal, @crTimeVal, @clTimeVal, @pStateIdVal,
       @pLineageNameVal)
  END TRY
  BEGIN CATCH
    IF ERROR_NUMBER() = 2627 /* unique constraint violation */ 
    BEGIN
      INSERT INTO Troy.dbo.SDE_states (state_id,owner,creation_time, closing_time,
                                  parent_state_id,lineage_name) VALUES 
                (@stateIdVal, @ownerVal, @crTimeVal, @clTimeVal, @pStateIdVal, 
                 @stateIdVal)
      SET @new_lineage_name = @stateIdVal
    END
    ELSE
    BEGIN
      -- rethrow unexpected error
      DECLARE @ErrorMessage    NVARCHAR(4000),
        @ErrorNumber     INT,
        @ErrorSeverity   INT,
        @ErrorState      INT,
        @ErrorLine       INT,
        @ErrorProcedure  NVARCHAR(200);
      SELECT @ErrorNumber = ERROR_NUMBER(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE(),
        @ErrorLine = ERROR_LINE(),
        @ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-');
      SELECT @ErrorMessage = 
        N'Error %d, Level %d, State %d, Procedure %s, Line %d, ' +
        'Message: '+ ERROR_MESSAGE();
      RAISERROR (@ErrorMessage, @ErrorSeverity, 1,
        @ErrorNumber, @ErrorSeverity, @ErrorState,
        @ErrorProcedure, @ErrorLine);
    END
  END CATCH
  -- If we created a new lineage, insert it into the STATE_LINEAGE table
  --  in normalized form. 
  IF @new_lineage_name <> @pLineageNameVal
  BEGIN
    INSERT INTO Troy.dbo.SDE_state_lineages (lineage_name, lineage_id)
         SELECT @new_lineage_name,l.lineage_id
         FROM Troy.dbo.SDE_state_lineages l 
         WHERE l.lineage_name = @pLineageNameVal AND
               l.lineage_id <= @pStateIdVal
    SET @pLineageNameVal = @new_lineage_name
  END

  -- We also insert a row for this state, as if it were in its own
  -- state lineage. 

  INSERT INTO Troy.dbo.SDE_state_lineages  (lineage_name, lineage_id)
      VALUES (@new_lineage_name,@stateIdVal)

  -- Place a mark on the new state so that it doesn't get cleaned up
  -- by compress.  Do it before the commit so it won't ever be both
  -- visible and unmarked at the same time.

  EXECUTE Troy.dbo.SDE_state_lock_def_insert @sdeIdVal, @stateIdVal, 'Y', 'M'

  COMMIT TRAN state_insert
END
GO
/****** Object:  View [dbo].[Stratagis_Report_Trip]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*order by [VehicleId],[StartLocalTimeStamp]*/
CREATE VIEW [dbo].[Stratagis_Report_Trip]
AS
SELECT     a.StartObjectId, a.StopObjectId, a.VehicleId, a.DateYear, a.DateMonth, a.DateDay, CONVERT(date, a.StartLocalTimeStamp) AS LocalDate, a.StartLocalTime, 
                      a.StopLocalTime, a.TripDuration, CONVERT(VARCHAR(5), b.IdleTime / 60 / 60) + ':' + RIGHT('0' + CONVERT(VARCHAR(2), b.IdleTime / 60 % 60), 2) 
                      + ':' + RIGHT('0' + CONVERT(VARCHAR(2), b.IdleTime % 60), 2) AS IdleTime, a.TripMiles, a.StopLength, a.STX, a.STY, dbo.Stratagis_Vehicle_View.Department
FROM         dbo.Stratagis_Trip AS a INNER JOIN
                          (SELECT     z.StartObjectId, ROUND(COUNT(*) / 2, 2) AS IdleTime
                            FROM          dbo.Stratagis_Trip AS z INNER JOIN
                                                   dbo.STRATAGIS_FLEET_HISTORIC AS y ON z.StartObjectId <= y.OBJECTID AND z.StopObjectId >= y.OBJECTID
                            WHERE      (y.Speed = 0)
                            GROUP BY z.StartObjectId) AS b ON a.StartObjectId = b.StartObjectId INNER JOIN
                      dbo.Stratagis_Vehicle_View ON a.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 319
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 265
               Bottom = 117
               Right = 425
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Vehicle_View"
            Begin Extent = 
               Top = 42
               Left = 534
               Bottom = 255
               Right = 694
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Report_Trip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Report_Trip'
GO
/****** Object:  View [dbo].[Stratagis_Current_OBD_DI]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Current_OBD_DI]
AS
SELECT     dbo.Stratagis_Current_OBD.OBJECTID, dbo.Stratagis_Current_DI.DigitalInput, dbo.Stratagis_Current_OBD.VehicleId, dbo.Stratagis_Current_OBD.TimeStamp, 
                      dbo.Stratagis_Current_DI.IdleTimeSec
FROM         dbo.Stratagis_Current_DI RIGHT OUTER JOIN
                      dbo.Stratagis_Current_OBD ON dbo.Stratagis_Current_DI.VehicleId = dbo.Stratagis_Current_OBD.VehicleId
WHERE     (ABS(dbo.Stratagis_Current_DI.OBJECTID - dbo.Stratagis_Current_OBD.OBJECTID) <= 2) AND (ABS(DATEDIFF(second, dbo.Stratagis_Current_DI.TimeStamp, 
                      dbo.Stratagis_Current_OBD.TimeStamp)) <= 5)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Stratagis_Current_DI"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 294
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Stratagis_Current_OBD"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 125
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Current_OBD_DI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Current_OBD_DI'
GO
/****** Object:  View [dbo].[Stratagis_Current_OBD_Acc]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Current_OBD_Acc]
AS
SELECT     dbo.Stratagis_Current_OBD.OBJECTID, dbo.Stratagis_Current_OBD.TimeStamp, dbo.Stratagis_Current_OBD.VehicleId, dbo.Stratagis_Current_Acc.VehicleSpeedMph, 
                      dbo.Stratagis_Current_Acc.Rpms, dbo.Stratagis_Current_Acc.CoolantTempF, dbo.Stratagis_Current_Acc.GPSStatus, dbo.Stratagis_Current_Acc.IdleTimeSec, 
                      dbo.Stratagis_Current_Acc.UserVar, dbo.Stratagis_Current_Acc.AccelerationX, dbo.Stratagis_Current_Acc.AccelerationY, dbo.Stratagis_Current_Acc.AccelerationZ, 
                      dbo.Stratagis_Current_Acc.ExcAccelTime, dbo.Stratagis_Current_Acc.ExcAccelLength, dbo.Stratagis_Current_Acc.ExcAcceleration, 
                      dbo.Stratagis_Current_Acc.ExcDecelTime, dbo.Stratagis_Current_Acc.ExcDecelLength, dbo.Stratagis_Current_Acc.ExcDeceleration
FROM         dbo.Stratagis_Current_Acc RIGHT OUTER JOIN
                      dbo.Stratagis_Current_OBD ON dbo.Stratagis_Current_Acc.VehicleId = dbo.Stratagis_Current_OBD.VehicleId
WHERE     (ABS(dbo.Stratagis_Current_Acc.OBJECTID - dbo.Stratagis_Current_OBD.OBJECTID) <= 2) AND (ABS(DATEDIFF(second, dbo.Stratagis_Current_Acc.TimeStamp, 
                      dbo.Stratagis_Current_OBD.TimeStamp)) <= 5)
GO
/****** Object:  View [dbo].[Stratagis_Mart_Daily_Report]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Mart_Daily_Report]
AS
SELECT     dbo.Stratagis_Date_View.LocalDate, dbo.Stratagis_Date_View.DateYear, dbo.Stratagis_Date_View.DateMonth, dbo.Stratagis_Date_View.DateWeek, 
                      dbo.Stratagis_Date_View.DateDay, dbo.Stratagis_Vehicle_View.VehicleId, dbo.Stratagis_Mart_Daily_Hours.HoursRunning, dbo.Stratagis_Mart_Daily_Hours.HoursIdle, 
                      dbo.Stratagis_Mart_Daily_Hours.HoursOff, dbo.Stratagis_Mart_Daily_Hours.DIHours, dbo.Stratagis_Mart_Miles.Miles AS TotalMiles, 
                      CASE WHEN dbo.Stratagis_Mart_Daily_Hours.HoursRunning > 0 THEN ISNULL(dbo.Stratagis_Mart_Miles.Miles, 0) 
                      / dbo.Stratagis_Mart_Daily_Hours.HoursRunning ELSE 0 END AS AvgSpeed, dbo.Stratagis_Mart_Mile_Speed_View.MaxSpeed, 
                      dbo.Stratagis_Mart_MIL_Codes.MILCodes, dbo.Stratagis_Mart_On_Off.OnTime, dbo.Stratagis_Mart_On_Off.OffTime
FROM         dbo.Stratagis_Vehicle_View INNER JOIN
                      dbo.Stratagis_Mart_Daily_Hours INNER JOIN
                      dbo.Stratagis_Date_View ON dbo.Stratagis_Mart_Daily_Hours.LocalDate = dbo.Stratagis_Date_View.LocalDate AND 
                      dbo.Stratagis_Mart_Daily_Hours.DateYear = dbo.Stratagis_Date_View.DateYear AND 
                      dbo.Stratagis_Mart_Daily_Hours.DateMonth = dbo.Stratagis_Date_View.DateMonth AND 
                      dbo.Stratagis_Mart_Daily_Hours.DateWeek = dbo.Stratagis_Date_View.DateWeek AND 
                      dbo.Stratagis_Mart_Daily_Hours.DateDay = dbo.Stratagis_Date_View.DateDay ON 
                      dbo.Stratagis_Vehicle_View.VehicleId = dbo.Stratagis_Mart_Daily_Hours.VehicleId INNER JOIN
                      dbo.Stratagis_Mart_MIL_Codes ON dbo.Stratagis_Date_View.DateYear = dbo.Stratagis_Mart_MIL_Codes.DateYear AND 
                      dbo.Stratagis_Date_View.DateMonth = dbo.Stratagis_Mart_MIL_Codes.DateMonth AND 
                      dbo.Stratagis_Date_View.DateDay = dbo.Stratagis_Mart_MIL_Codes.DateDay AND 
                      dbo.Stratagis_Vehicle_View.VehicleId = dbo.Stratagis_Mart_MIL_Codes.VehicleId INNER JOIN
                      dbo.Stratagis_Mart_Miles ON dbo.Stratagis_Vehicle_View.VehicleId = dbo.Stratagis_Mart_Miles.VehicleId AND 
                      dbo.Stratagis_Date_View.DateYear = dbo.Stratagis_Mart_Miles.DateYear AND dbo.Stratagis_Date_View.DateMonth = dbo.Stratagis_Mart_Miles.DateMonth AND 
                      dbo.Stratagis_Date_View.DateDay = dbo.Stratagis_Mart_Miles.DateDay INNER JOIN
                      dbo.Stratagis_Mart_Mile_Speed_View ON dbo.Stratagis_Date_View.LocalDate = dbo.Stratagis_Mart_Mile_Speed_View.LocalDate AND 
                      dbo.Stratagis_Date_View.DateYear = dbo.Stratagis_Mart_Mile_Speed_View.DateYear AND 
                      dbo.Stratagis_Date_View.DateMonth = dbo.Stratagis_Mart_Mile_Speed_View.DateMonth AND 
                      dbo.Stratagis_Date_View.DateWeek = dbo.Stratagis_Mart_Mile_Speed_View.DateWeek AND 
                      dbo.Stratagis_Date_View.DateDay = dbo.Stratagis_Mart_Mile_Speed_View.DateDay AND 
                      dbo.Stratagis_Vehicle_View.VehicleId = dbo.Stratagis_Mart_Mile_Speed_View.VehicleId INNER JOIN
                      dbo.Stratagis_Mart_On_Off ON dbo.Stratagis_Date_View.DateYear = dbo.Stratagis_Mart_On_Off.DateYear AND 
                      dbo.Stratagis_Date_View.DateMonth = dbo.Stratagis_Mart_On_Off.DateMonth AND dbo.Stratagis_Date_View.DateDay = dbo.Stratagis_Mart_On_Off.DateDay AND 
                      dbo.Stratagis_Vehicle_View.VehicleId = dbo.Stratagis_Mart_On_Off.VehicleId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[51] 4[15] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Stratagis_Mart_MIL_Codes"
            Begin Extent = 
               Top = 317
               Left = 416
               Bottom = 501
               Right = 600
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Vehicle_View"
            Begin Extent = 
               Top = 209
               Left = 1038
               Bottom = 443
               Right = 1222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Date_View"
            Begin Extent = 
               Top = 10
               Left = 0
               Bottom = 228
               Right = 184
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Mart_Mile_Speed_View"
            Begin Extent = 
               Top = 20
               Left = 560
               Bottom = 291
               Right = 744
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Mart_On_Off"
            Begin Extent = 
               Top = 0
               Left = 822
               Bottom = 262
               Right = 982
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Mart_Miles"
            Begin Extent = 
               Top = 309
               Left = 807
               Bottom = 472
               Right = 967
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Mart_Daily_Hours"
            Begin Extent = 
               Top = 12
               Le' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Daily_Report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'ft = 323
               Bottom = 285
               Right = 507
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Daily_Report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Mart_Daily_Report'
GO
/****** Object:  View [dbo].[Stratagis_Historic_OBD_DI]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Historic_OBD_DI]
AS
SELECT     dbo.Stratagis_Historic_OBD.OBJECTID, dbo.Stratagis_Historic_DI.DigitalInput, dbo.Stratagis_Historic_OBD.VehicleId, dbo.Stratagis_Historic_OBD.TimeStamp, 
                      dbo.Stratagis_Historic_DI.IdleTimeSec
FROM         dbo.Stratagis_Historic_DI RIGHT OUTER JOIN
                      dbo.Stratagis_Historic_OBD ON dbo.Stratagis_Historic_DI.VehicleId = dbo.Stratagis_Historic_OBD.VehicleId
WHERE     (ABS(dbo.Stratagis_Historic_DI.OBJECTID - dbo.Stratagis_Historic_OBD.OBJECTID) <= 2) AND (ABS(DATEDIFF(second, dbo.Stratagis_Historic_DI.TimeStamp, 
                      dbo.Stratagis_Historic_OBD.TimeStamp)) <= 5)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Stratagis_Historic_OBD"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 319
               Right = 457
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Stratagis_Historic_DI"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 313
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 23
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_OBD_DI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_OBD_DI'
GO
/****** Object:  View [dbo].[Stratagis_Historic_OBD_Acc]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Historic_OBD_Acc]
AS
SELECT     dbo.Stratagis_Historic_OBD.OBJECTID, dbo.Stratagis_Historic_OBD.TimeStamp, dbo.Stratagis_Historic_OBD.VehicleId, dbo.Stratagis_Historic_Acc.VehicleSpeedMph, 
                      dbo.Stratagis_Historic_Acc.Rpms, dbo.Stratagis_Historic_Acc.CoolantTempF, dbo.Stratagis_Historic_Acc.GPSStatus, dbo.Stratagis_Historic_Acc.IdleTimeSec, 
                      dbo.Stratagis_Historic_Acc.UserVar, dbo.Stratagis_Historic_Acc.AccelerationX, dbo.Stratagis_Historic_Acc.AccelerationY, dbo.Stratagis_Historic_Acc.AccelerationZ, 
                      dbo.Stratagis_Historic_Acc.ExcAccelTime, dbo.Stratagis_Historic_Acc.ExcAccelLength, dbo.Stratagis_Historic_Acc.ExcAcceleration, 
                      dbo.Stratagis_Historic_Acc.ExcDecelTime, dbo.Stratagis_Historic_Acc.ExcDecelLength, dbo.Stratagis_Historic_Acc.ExcDeceleration
FROM         dbo.Stratagis_Historic_Acc RIGHT OUTER JOIN
                      dbo.Stratagis_Historic_OBD ON dbo.Stratagis_Historic_Acc.VehicleId = dbo.Stratagis_Historic_OBD.VehicleId
WHERE     (ABS(dbo.Stratagis_Historic_Acc.OBJECTID - dbo.Stratagis_Historic_OBD.OBJECTID) <= 2) AND (ABS(DATEDIFF(second, dbo.Stratagis_Historic_Acc.TimeStamp, 
                      dbo.Stratagis_Historic_OBD.TimeStamp)) <= 5)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Stratagis_Historic_Acc"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 302
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Historic_OBD"
            Begin Extent = 
               Top = 6
               Left = 275
               Bottom = 258
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 8
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 37
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_OBD_Acc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_OBD_Acc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_OBD_Acc'
GO
/****** Object:  StoredProcedure [dbo].[delete_version]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[delete_version]
@name NVARCHAR (97) AS SET NOCOUNT ON
BEGIN
  -- This is a public procedure to delete an SDE version.

  -- Setup possible return codes

  DECLARE @SE_NO_PERMISSIONS INTEGER
  SET @SE_NO_PERMISSIONS = 50025

  DECLARE @SE_VERSION_NOEXIST INTEGER
  SET @SE_VERSION_NOEXIST = 50126

  DECLARE @SE_VERSION_HAS_CHILDREN INTEGER
  SET @SE_VERSION_HAS_CHILDREN = 50175

  DECLARE @SE_MVV_VERSION_IN_USE INTEGER
  SET @SE_MVV_VERSION_IN_USE = 50553

  DECLARE @SE_LOCK_CONFLICT INTEGER
  SET @SE_LOCK_CONFLICT = 50049

  DECLARE @parsed_name NVARCHAR(64)
  DECLARE @parsed_owner NVARCHAR(32)
  DECLARE @error_string NVARCHAR(256)
  DECLARE @ret_code INTEGER

  -- Parse the version name.

  EXECUTE @ret_code = Troy.dbo.SDE_parse_version_name @name,
          @parsed_name OUTPUT, @parsed_owner OUTPUT
  IF (@ret_code != 0)
    RETURN @ret_code

  -- Make sure this is not the default version.

  IF @parsed_owner = 'dbo' AND @parsed_name = 'DEFAULT'
  BEGIN
    RAISERROR ('The default version may not be deleted.',16,-1)
    RETURN @SE_NO_PERMISSIONS
  END

  -- If we are not the DBA, make sure that we are the owner.

  DECLARE @current_user NVARCHAR(32)
  DECLARE @is_dba INTEGER
  SET @is_dba = Troy.dbo.SDE_is_user_sde_dba ()
  EXECUTE Troy.dbo.SDE_get_current_user_name @current_user OUTPUT

  IF @is_dba = 0
  BEGIN
    IF @current_user != @parsed_owner
    BEGIN
      SET @error_string = @current_user + ' not owner of version ' +
                          @name + '.'
      RAISERROR (@error_string,16,-1)
      RETURN @SE_NO_PERMISSIONS
    END
  END

  -- Make sure that the version exists.

  DECLARE @version_id INTEGER

  DECLARE @state_id INTEGER

  SELECT @version_id = version_id, @state_id = state_id
  FROM   Troy.dbo.SDE_versions
  WHERE  name = @parsed_name AND
         owner = @parsed_owner

  IF @version_id IS NULL
  BEGIN
    SET @error_string = 'Version ' + @name + ' not found.'
    RAISERROR (@error_string,16,-1)
    RETURN @SE_VERSION_NOEXIST
  END

  -- Make sure that this version has no children.

  DECLARE @parent_version_id INTEGER

  SET @parent_version_id = NULL

  SELECT @parent_version_id = version_id
  FROM   Troy.dbo.SDE_versions
  WHERE  parent_name = @parsed_name AND
         parent_owner = @parsed_owner

  IF @parent_version_id IS NOT NULL
  BEGIN
    SET @error_string = 'Version ' + @name +
                        ' can not be deleted, as it has children.'
    RAISERROR (@error_string,16,-1)
    RETURN @SE_VERSION_HAS_CHILDREN
  END

  -- Check if we set this version in the current session.
  DECLARE @g_state_id BIGINT
  DECLARE @g_protected CHAR(1)
  DECLARE @g_is_default CHAR(1)
  DECLARE @g_version_id INTEGER
  EXECUTE Troy.dbo.SDE_get_globals @g_state_id OUTPUT,@g_protected OUTPUT,@g_is_default OUTPUT,@g_version_id OUTPUT
  IF (@g_version_id = @version_id) OR
     (@g_state_id = @state_id AND @g_is_default = '0')
  BEGIN
    SET @error_string = 'Version ' + @name +
                        ' can not be deleted, as it is in use.'
    RAISERROR (@error_string,16,-1)
    RETURN @SE_MVV_VERSION_IN_USE
  END

  -- Place an object lock on the version to be deleted to be sure 
  -- it isn't currently in use.

  DECLARE @connection_id INTEGER

  -- Get an sde connection id for locking purposes

  EXECUTE Troy.dbo.SDE_get_primary_oid 12, 1, @connection_id OUTPUT

  -- We also need to insert into the process info table, otherwise if
  -- another process detects a lock conflict, this lock will be dropped
  -- since it doesn't belong to a valid SDE connection in the
  -- process info table.

  DECLARE @conn_tab NVARCHAR(95)
  DECLARE @node_name NVARCHAR(256)
  SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
    + N'_Troy' 
  DECLARE @sql AS NVARCHAR (256)
  SET @sql = N'CREATE TABLE ' + @conn_tab + N' (keycol INTEGER)'
  EXEC (@sql)
  SET @conn_tab = N'tempdb.' + USER_NAME() + N'.' + @conn_tab
  SET @node_name = HOST_NAME()
  EXECUTE Troy.dbo.SDE_pinfo_def_insert @connection_id, 0,'Y',
    'Win32',@node_name,'F',@conn_tab

  -- Lock the underlying object, to make sure it stays still.

  EXECUTE @ret_code = Troy.dbo.SDE_object_lock_def_insert @connection_id,
                      @version_id,1,999, 'Y', 'E'
  IF @ret_code = -49
    SET @ret_code = @SE_LOCK_CONFLICT
  IF @ret_code != 0
  BEGIN
    EXECUTE Troy.dbo.SDE_pinfo_def_delete @connection_id
    SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
      + N'_Troy' 
    SET @sql = N'DROP TABLE ' + @conn_tab
    EXEC (@sql)
    SET @error_string = 'Unable to delete version ' +  @name + 
           ' which may be currently referenced by other object'
    RAISERROR (@error_string,16,-1)
    RETURN @ret_code
  END

  -- Perform the delete.

  EXECUTE Troy.dbo.SDE_versions_def_delete @parsed_owner, @parsed_name

  -- Remove the lock.
  EXECUTE Troy.dbo.SDE_object_lock_def_delete            @connection_id,@version_id,1,999,'Y'

  -- It's now safe to remove pinfo entry.

  SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
    + N'_Troy' 
  SET @sql = N'DROP TABLE ' + @conn_tab
  EXEC (@sql)
  EXECUTE Troy.dbo.SDE_pinfo_def_delete @connection_id

END
GO
/****** Object:  StoredProcedure [dbo].[create_version]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[create_version] 
@parent_name NVARCHAR (97),
@name NVARCHAR (64) OUTPUT,
@name_rule INTEGER,
@access INTEGER,
@description NVARCHAR(64) AS SET NOCOUNT ON
BEGIN
  /* This is a public procedure to create an SDE version.
  The new version will be a child of the given parent version name.
  The new version may have a unique name generated, depending on the
  value of the name_rule parameter. Valid name rules are:
  1 - generate a new name if there's already a version with the given name.
    In this case, the new name will be returned in the @name parameter, 
    as long as the caller supplied the OUTPUT keyword with the parameter.
  2 - Only use the name supplied, return an error if it already exists.

  The access parameter specified the new version's access as follows:
  0 - private version.
  1 - public version.
  2 - protected version. */

  -- Setup possible return codes

  DECLARE @SE_NO_PERMISSIONS INTEGER
  SET @SE_NO_PERMISSIONS = 50025

  DECLARE @SE_LOCK_CONFLICT INTEGER
  SET @SE_LOCK_CONFLICT = 50049

  DECLARE @SE_INVALID_PARAM_VALUE INTEGER
  SET @SE_INVALID_PARAM_VALUE = 50066

  DECLARE @SE_VERSION_NOEXIST INTEGER
  SET @SE_VERSION_NOEXIST = 50126

  DECLARE @SE_INVALID_VERSION_NAME INTEGER
  SET @SE_INVALID_VERSION_NAME = 50171

  DECLARE @SE_STATE_NOEXIST INTEGER
  SET @SE_STATE_NOEXIST = 50172

  DECLARE @SE_INVALID_VERSION_ID INTEGER
  SET @SE_INVALID_VERSION_ID = 50298

  -- Check arguments.

  IF @parent_name IS NULL

  BEGIN
    RAISERROR ('Parent version can not be NULL.',16,-1)
    RETURN @SE_VERSION_NOEXIST
  END

  DECLARE @parsed_name NVARCHAR(64)
  DECLARE @parsed_owner NVARCHAR(32)
  DECLARE @current_user NVARCHAR(32)
  DECLARE @error_string NVARCHAR(256)
  DECLARE @node_name  NVARCHAR(256)
  DECLARE @ret_code INTEGER

  EXECUTE Troy.dbo.SDE_get_current_user_name @current_user OUTPUT 
  EXECUTE @ret_code = Troy.dbo.SDE_parse_version_name @name,
                      @parsed_name OUTPUT, 
                      @parsed_owner OUTPUT
  IF (@ret_code != 0)
    RETURN @ret_code

  IF @parsed_owner <> @current_user
  BEGIN
    RAISERROR ('The new version must be in the current user''s schema.', 16,-1)
    RETURN @SE_INVALID_VERSION_NAME
  END

  IF @access IS NULL
  BEGIN
    RAISERROR ('NULL is not a valid access type code.',16,-1)
    RETURN @SE_INVALID_PARAM_VALUE
  END
  ELSE IF @access < 0 OR @access > 2
  BEGIN
    SET @error_string = cast (@access AS VARCHAR (10)) + 
                       ' is not a valid access type code.'
    RAISERROR (@error_string,16,-1)
    RETURN @SE_INVALID_PARAM_VALUE
  END

  IF @name_rule IS NULL
  BEGIN
    RAISERROR ('NULL is not a valid name rule.',16,-1)
    RETURN @SE_INVALID_PARAM_VALUE
  END
  ELSE IF @name_rule < 1 OR @name_rule > 2
  BEGIN
   SET @error_string = cast (@name_rule AS VARCHAR (10)) + 
                       ' is not a valid name rule.'
    RAISERROR (@error_string,16,-1)
    RETURN @SE_INVALID_PARAM_VALUE
  END

  -- Fetch the proposed parent version.

  DECLARE @parsed_parent_name NVARCHAR(64)
  DECLARE @parsed_parent_owner NVARCHAR(32)
  DECLARE @parent_version_id INTEGER
  DECLARE @parent_state_id BIGINT
  DECLARE @parent_status INTEGER

  EXECUTE @ret_code = Troy.dbo.SDE_parse_version_name @parent_name,
                      @parsed_parent_name OUTPUT,
                      @parsed_parent_owner OUTPUT
  IF (@ret_code != 0)
    RETURN @ret_code

  SELECT @parent_version_id = version_id, @parent_state_id = state_id,
         @parent_status = status
  FROM   Troy.dbo.SDE_versions
  WHERE  name = @parsed_parent_name AND
         owner = @parsed_parent_owner

  IF @parent_version_id IS NULL
  BEGIN
    SET @error_string = 'Version ' + @parent_name + ' not found.'
    RAISERROR (@error_string,16,-1)
    RETURN @SE_VERSION_NOEXIST
  END

  -- Check permissions.  At least one of the following must be true for this
  -- operation:  (1) The parent version must be public or protected, or
  --             (2) The current user is the parent version's owner, or
  --             (3) The current user is the SDE DBA user.

  DECLARE @protected CHAR (1)

  SET @protected = Troy.dbo.SDE_get_version_access (@parent_status,
                    @parsed_parent_owner)
  IF @protected = '2'
  BEGIN
    SET @error_string = 'Insufficient access to version ' + @parent_name
    RAISERROR (@error_string,16,-1)
    RETURN @SE_NO_PERMISSIONS
  END

  -- Get an sde connection id for locking purposes

  DECLARE @connection_id INTEGER
  EXECUTE Troy.dbo.SDE_get_primary_oid 12, 1, @connection_id OUTPUT

  -- We also need to insert into the process info table, otherwise if
  -- another process detects a lock conflict, this lock will be dropped
  -- since it doesn't belong to a valid SDE connection in the
  -- process info table.

  DECLARE @conn_tab NVARCHAR(95)
  SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
    + N'_Troy' 
  DECLARE @sql AS NVARCHAR (256)
  SET @sql = N'CREATE TABLE ' + @conn_tab + N' (keycol INTEGER)'
  EXEC (@sql)
  SET @conn_tab = N'tempdb.' + USER_NAME() + N'.' + @conn_tab
  SET @node_name = HOST_NAME()
  EXECUTE Troy.dbo.SDE_pinfo_def_insert @connection_id, 0,'Y',
    'Win32',@node_name,'F',@conn_tab

  -- Lock the underlying state, to make sure it stays still.

  EXECUTE @ret_code = Troy.dbo.SDE_state_lock_def_insert @connection_id,
                      @parent_state_id, 'Y', 'S'
  IF @ret_code = -49
    SET @ret_code = @SE_LOCK_CONFLICT
  IF @ret_code != 0
  BEGIN
    EXECUTE Troy.dbo.SDE_pinfo_def_delete @connection_id
    SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
      + N'_Troy' 
    SET @sql = N'DROP TABLE ' + @conn_tab
    EXEC (@sql)
    RETURN @ret_code
  END

  -- Now that we have a lock, we safely check to see if the parent
  -- version's state still exists.

  DECLARE @state_id BIGINT

  SELECT @state_id = state_id
  FROM   Troy.dbo.SDE_states
  WHERE  state_id = @parent_state_id

  IF @state_id IS NULL
  BEGIN
    EXECUTE Troy.dbo.SDE_pinfo_def_delete @connection_id
    SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
      + N'_Troy' 
    SET @sql = N'DROP TABLE ' + @conn_tab
    EXEC (@sql)
    SET @error_string = 'State ' + cast (@parent_state_id AS VARCHAR (20))
                        + ' from version ' + @parent_name + ' not found.'
    RAISERROR (@error_string,16,-1)
    RETURN @SE_STATE_NOEXIST
  END

  -- Get a version ID.

  DECLARE @version_id INTEGER
  EXECUTE Troy.dbo.SDE_get_primary_oid 9, 1, @version_id OUTPUT

  IF @version_id IS NULL
  BEGIN
    EXECUTE Troy.dbo.SDE_pinfo_def_delete @connection_id
    SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
      + N'_Troy' 
    SET @sql = N'DROP TABLE ' + @conn_tab
    EXEC (@sql)
    SET @error_string = 'Unable to generate a version ID for ' +  @name
    RAISERROR (@error_string,16,-1)
    RETURN @SE_INVALID_VERSION_ID
  END

  -- Insert the new version.

  DECLARE @current_date DATETIME
  SET @current_date = GETDATE ()

  EXECUTE @ret_code = Troy.dbo.SDE_versions_def_insert @parsed_name OUTPUT,
       @current_user, @version_id, @access, @parent_state_id, @description,
       @parsed_parent_name, @parsed_parent_owner, @parent_version_id,
       @current_date, @name_rule

  -- Set the returned name, in case we changed it.
  SET @name = @parsed_name

  -- It's now safe to remove the state lock and pinfo entry.

  SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
    + N'_Troy' 
  SET @sql = N'DROP TABLE ' + @conn_tab
  EXEC (@sql)
  EXECUTE Troy.dbo.SDE_pinfo_def_delete @connection_id

  -- do a hard commit, even if called within a transaction.
  WHILE @@TRANCOUNT > 0
    COMMIT

  RETURN @ret_code
END
GO
/****** Object:  StoredProcedure [dbo].[SDE_new_branch_state]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SDE_new_branch_state] 
@current_state_id BIGINT,
@current_lineage_name BIGINT,
@new_state_id BIGINT OUTPUT AS SET NOCOUNT ON
BEGIN
  --This is a private support procedure for SDE versioned views.

  DECLARE @ret INTEGER
  DECLARE @i INTEGER
  DECLARE @l_current_state_id BIGINT
  DECLARE @l_current_lineage_name BIGINT
  DECLARE @new_lineage_name BIGINT
  DECLARE @new_state_time DATETIME
  DECLARE @connection_id INTEGER
  DECLARE @user NVARCHAR (128)
  SET @i = 1
  SET @ret = 0
  SET @l_current_state_id = @current_state_id
  SET @l_current_lineage_name = @current_lineage_name
  WHILE @i < 4
  BEGIN
    -- insert a new state and point the default version to it.
    EXECUTE Troy.dbo.SDE_get_primary_oid 8,1,@new_state_id OUTPUT
    SET @new_lineage_name = @l_current_lineage_name
    EXECUTE Troy.dbo.SDE_get_primary_oid 12, 1, @connection_id OUTPUT
    EXECUTE Troy.dbo.SDE_get_current_user_name @user OUTPUT 
    EXECUTE Troy.dbo.SDE_state_def_insert @new_state_id,
      @user, @l_current_state_id, @new_lineage_name OUTPUT,
      @connection_id, 2, @new_state_time OUTPUT

    SET NOCOUNT OFF
    EXECUTE Troy.dbo.SDE_versions_def_change_state @new_state_id, 'DEFAULT',
      'dbo', @l_current_state_id
    IF @@ROWCOUNT = 0
    BEGIN
      SET @ret = -1
      EXECUTE Troy.dbo.SDE_state_def_delete @new_state_id,-1,-1,-1,-1,-1,-1,-1
      SELECT @l_current_state_id = state_id, @l_current_lineage_name = lineage_name
      FROM   Troy.dbo.SDE_states
      WHERE  state_id = (SELECT state_id FROM Troy.dbo.SDE_versions
        WHERE name = 'DEFAULT' AND owner = 'dbo')
      SET @i = @i + 1
    END
    ELSE
    BEGIN
      SET @i = 4
      SET @ret = 0
    END
  END --while loop

  SET NOCOUNT ON
  IF @ret != 0
    RETURN @ret

  EXECUTE Troy.dbo.SDE_state_lock_def_delete_user @connection_id

  RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[edit_version]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[edit_version] 
@name NVARCHAR (97),
@edit_action INTEGER AS SET NOCOUNT ON
BEGIN

  /* This is a public procedure to toggle an SDE version's editability.
  If edit_action is 1, the version will be made editable by creating
  a new state as the child of the version's current state. The version
  will then point to this new state. The version will also be made the
  current version for versioned views.
  If edit_action is 2, the version will no longer be editable. The state
  it is pointing to will be closed. */
  -- Setup possible return codes

  DECLARE @SE_NO_PERMISSIONS INTEGER
  SET @SE_NO_PERMISSIONS = 50025

  DECLARE @SE_LOCK_CONFLICT INTEGER
  SET @SE_LOCK_CONFLICT = 50049

  DECLARE @SE_INVALID_PARAM_VALUE INTEGER
  SET @SE_INVALID_PARAM_VALUE = 50066

  DECLARE @SE_VERSION_NOEXIST INTEGER
  SET @SE_VERSION_NOEXIST = 50126

  DECLARE @SE_STATE_NOEXIST INTEGER
  SET @SE_STATE_NOEXIST = 50172

  DECLARE @SE_VERSION_HAS_MOVED INTEGER
  SET @SE_VERSION_HAS_MOVED = 50174

  DECLARE @SE_PARENT_NOT_CLOSED INTEGER
  SET @SE_PARENT_NOT_CLOSED = 50176

  DECLARE @SE_TRANS_IN_PROGRESS INTEGER
  SET @SE_TRANS_IN_PROGRESS = 50068

  DECLARE @SE_MVV_IN_EDIT_MODE INTEGER
  SET @SE_MVV_IN_EDIT_MODE = 50501

  DECLARE @SE_MVV_NAMEVER_NOT_CURRVER INTEGER
  SET @SE_MVV_NAMEVER_NOT_CURRVER = 50503

  DECLARE @parsed_name NVARCHAR(64)
  DECLARE @parsed_owner NVARCHAR(32)
  DECLARE @node_name  NVARCHAR(256)
  DECLARE @error_string NVARCHAR(256)
  DECLARE @ret_code INTEGER

  DECLARE @sql AS NVARCHAR (256)
  -- Check arguments.

  IF @edit_action IS NULL
  BEGIN
    RAISERROR ('Edit action may not be NULL.',16,-1)
    RETURN @SE_INVALID_PARAM_VALUE
  END
  ELSE IF @edit_action < 1 OR @edit_action > 2
  BEGIN
    SET @error_string = cast (@edit_action AS VARCHAR (10)) + 
                       ' is not a valid edit action code.'
    RAISERROR (@error_string,16,-1)
    RETURN @SE_INVALID_PARAM_VALUE
  END

  -- Parse the version name
  EXECUTE @ret_code = Troy.dbo.SDE_parse_version_name @name,
          @parsed_name OUTPUT, @parsed_owner OUTPUT
  IF (@ret_code != 0)
    RETURN @ret_code

  -- Do not allow editing of default version.

  IF (@parsed_name = 'DEFAULT') AND (@parsed_owner = 'dbo')
  BEGIN
    SET @error_string = 'Cannot edit the DEFAULT version in STANDARD transaction mode.'
    RAISERROR (@error_string,16,-1)
    RETURN @SE_INVALID_PARAM_VALUE
  END

  -- Get the information we need from the version.

  DECLARE @version_id INTEGER
  DECLARE @state_id BIGINT
  DECLARE @status INTEGER

  SELECT @version_id = version_id, @state_id = state_id,
         @status = status
  FROM   Troy.dbo.SDE_versions
  WHERE  name = @parsed_name AND
         owner = @parsed_owner

  IF @version_id IS NULL
  BEGIN
    SET @error_string = 'Version ' + @name + ' not found.'
    RAISERROR (@error_string,16,-1)
    RETURN @SE_VERSION_NOEXIST
  END

  -- Check if we are already in an edit session.
  DECLARE @g_state_id BIGINT
  DECLARE @g_protected CHAR(1)
  DECLARE @g_is_default CHAR(1)
  DECLARE @g_version_id INTEGER
  EXECUTE Troy.dbo.SDE_get_globals @g_state_id OUTPUT,@g_protected OUTPUT,@g_is_default OUTPUT,@g_version_id OUTPUT
  IF @edit_action = 1
  BEGIN
    DECLARE @exists INTEGER
    IF (@g_version_id != -1) AND (@g_version_id != @version_id)
    BEGIN
      -- Check that version and state still exist (e.g. may have been rolled back)
      SELECT @exists = count(*) from Troy.dbo.SDE_versions
        WHERE version_id = @g_version_id
      IF @exists > 0
      BEGIN
        SELECT @exists = count(*) from Troy.dbo.SDE_states
          WHERE state_id = @g_state_id
        IF @exists > 0
        BEGIN
          SET @error_string = 'Cannot start edit on a new version with an open edit session to another version.'
          RAISERROR (@error_string,16,-1)
          RETURN @SE_MVV_IN_EDIT_MODE
        END
      END
    END
    IF @g_version_id = @version_id
    BEGIN
      SELECT @exists = count(*) from Troy.dbo.SDE_states
        WHERE state_id = @g_state_id
      IF @exists > 0
        RETURN 0 -- no-op
    END
  END
  ELSE
  BEGIN
    IF @g_version_id != @version_id
    BEGIN
      IF @g_version_id = -1
        SET @error_string = 'Not currently editing a version, cannot stop edit.'
      ELSE
        SET @error_string = 'Cannot stop edit on ' + @name + ' while version id ' + 
          cast (@g_version_id AS VARCHAR(10)) + ' is the current edit version.'
      RAISERROR (@error_string,16,-1)
      RETURN @SE_MVV_NAMEVER_NOT_CURRVER
    END
  END

  -- Check permissions.  At least one of the following must be true for this
  -- operation:  (1) The version must be public, or
  --             (2) The current user is the version's owner, or
  --             (3) The current user is the SDE DBA user.

  DECLARE @protected CHAR (1)

  SET @protected = Troy.dbo.SDE_get_version_access (@status, @parsed_owner)
  IF @protected = '1' OR @protected = '2'
  BEGIN
    SET @error_string = 'Insufficient access to version ' + @name
    RAISERROR (@error_string,16,-1)
    RETURN @SE_NO_PERMISSIONS
  END

  -- Get an sde connection id for locking purposes

  DECLARE @connection_id INTEGER
  IF @edit_action = 2
  BEGIN
    SELECT @connection_id = sde_id from Troy.dbo.SDE_process_information WHERE spid = @@spid
  END
  IF @edit_action = 1 OR @connection_id IS NULL
  BEGIN
    EXECUTE Troy.dbo.SDE_get_primary_oid 12, 1, @connection_id OUTPUT

  -- We also need to insert into the process info table, otherwise if
  -- another process detects a lock conflict, this lock will be dropped
  -- since it doesn't belong to a valid SDE connection in the
  -- process info table.

    DECLARE @conn_tab NVARCHAR(95)
    SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
      + N'_Troy' 
    SET @sql = N'CREATE TABLE ' + @conn_tab + N' (keycol INTEGER)'
    EXEC (@sql)
    SET @conn_tab = N'tempdb.' + USER_NAME() + N'.' + @conn_tab
    SET @node_name = HOST_NAME()
    EXECUTE Troy.dbo.SDE_pinfo_def_insert @connection_id, 0,
      'Y','Win32',@node_name,'F',@conn_tab

  END
  -- Lock the version's state if this is a open edit.

  IF @edit_action = 1
  BEGIN
    EXECUTE @ret_code = Troy.dbo.SDE_state_lock_def_insert @connection_id,
                       @state_id, 'Y', 'S'

    IF @ret_code = -49
      SET @ret_code = @SE_LOCK_CONFLICT
    IF @ret_code != 0
    BEGIN
      SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
        + N'_Troy' 
      SET @sql = N'DROP TABLE ' + @conn_tab
      EXEC (@sql)
      EXECUTE Troy.dbo.SDE_pinfo_def_delete @connection_id
      SET @error_string = 'Lock conflict detected for state ' + cast(@state_id as varchar(10))
      RAISERROR (@error_string,16,-1)
      RETURN @ret_code
    END
  END

  DECLARE @state_owner NVARCHAR(32)
  DECLARE @closing_time DATETIME
  DECLARE @parent_lineage_name BIGINT

  DECLARE @current_user NVARCHAR(32)
  EXECUTE Troy.dbo.SDE_get_current_user_name @current_user OUTPUT

  DECLARE @current_date DATETIME
  SET @current_date = GETDATE ()

  -- Perform version open or close for editing.

  IF @edit_action = 2
  BEGIN
    -- If we are done editing, close the state.
    -- Make sure that the state exists, and that the current user can 
    -- write to it.
    SELECT @state_owner = owner, @closing_time = closing_time
    FROM   Troy.dbo.SDE_states
    WHERE  state_id = @state_id
    IF @state_owner IS NULL
    BEGIN
      SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
        + N'_Troy' 
      SET @sql = N'DROP TABLE ' + @conn_tab
      EXEC (@sql)
      EXECUTE Troy.dbo.SDE_pinfo_def_delete @connection_id
      SET @error_string = 'State ' + cast (@state_id AS VARCHAR (20)) +
                          ' from version ' + @name + ' not found.'
      RAISERROR (@error_string,16,-1)
      RETURN @SE_STATE_NOEXIST
    END

    DECLARE @is_dba INTEGER
    SET @is_dba = Troy.dbo.SDE_is_user_sde_dba ()

    IF @is_dba = 0
    BEGIN
      IF @current_user != @state_owner
      BEGIN
        SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
          + N'_Troy' 
        SET @sql = N'DROP TABLE ' + @conn_tab
        EXEC (@sql)
        EXECUTE Troy.dbo.SDE_pinfo_def_delete @connection_id
        SET @error_string = 'Not owner of state ' +
                            cast (@state_id AS VARCHAR (20)) + '.'
        RAISERROR (@error_string,16,-1)
        RETURN @SE_NO_PERMISSIONS
      END
    END

    BEGIN TRAN edit_version
    UPDATE Troy.dbo.SDE_states
    SET    closing_time = @current_date
    WHERE  state_id = @state_id

    -- The change is made, we can release our locks (incl. mark state locks).

    SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
      + N'_Troy' 
    SET @sql = N'DROP TABLE ' + @conn_tab
    EXEC (@sql)
    EXECUTE Troy.dbo.SDE_pinfo_def_delete @connection_id

    -- Update globals to mark that we're done editing.
    EXECUTE Troy.dbo.SDE_set_globals @g_state_id,@g_protected,@g_is_default,-1 
  END
  ELSE
  BEGIN
    -- If we starting editing, we will create a child of the current state,
    -- and move this version on to it.

    -- Fetch the information from the version's current state that we need
    -- to create the child state.

    SELECT @state_owner = owner, @closing_time = closing_time,
           @parent_lineage_name = lineage_name
    FROM   Troy.dbo.SDE_states
    WHERE  state_id = @state_id

    IF @state_owner IS NULL
    BEGIN
      SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
        + N'_Troy' 
      SET @sql = N'DROP TABLE ' + @conn_tab
      EXEC (@sql)
      EXECUTE Troy.dbo.SDE_pinfo_def_delete @connection_id
      SET @error_string = 'State ' + cast (@state_id AS VARCHAR (20)) +
                          ' from version ' + @name + ' not found.'
      RAISERROR (@error_string,16,-1)
      RETURN @SE_STATE_NOEXIST
    END

    -- If the version's current state is open, try to close it

    IF @closing_time IS NULL
    BEGIN
      UPDATE Troy.dbo.SDE_states
      SET    closing_time = @current_date
      WHERE  state_id = @state_id

    END

    -- Get a state ID.

    DECLARE @new_state_id BIGINT
    EXECUTE Troy.dbo.SDE_get_primary_oid 8, 1, @new_state_id OUTPUT

    -- Create the new state.

    EXECUTE Troy.dbo.SDE_state_def_insert  @new_state_id, @current_user,
                       @state_id, @parent_lineage_name,
                      @connection_id, 1, @current_date

    -- Unlock the parent state -- we don't need it any longer.

    EXECUTE Troy.dbo.SDE_state_lock_def_delete @connection_id, @state_id, 'Y', 0
    -- Move the version to the new state.

    EXECUTE Troy.dbo.SDE_versions_def_change_state @new_state_id, @parsed_name,
            @parsed_owner, @state_id
    IF @@ROWCOUNT = 0
    BEGIN
      -- determine if the version has been deleted or if it has
      -- already been changed
      SET @version_id = NULL
      SELECT @version_id = version_id
      FROM   Troy.dbo.SDE_versions
      WHERE  name = @parsed_name AND
            owner = @parsed_owner

      IF @version_id IS NULL
      BEGIN
        SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
          + N'_Troy' 
        SET @sql = N'DROP TABLE ' + @conn_tab
        EXEC (@sql)
        EXECUTE Troy.dbo.SDE_pinfo_def_delete @connection_id
        SET @error_string = 'Version ' + @name + ' not found.'
        RAISERROR (@error_string,16,-1)
        RETURN @SE_VERSION_NOEXIST
      END
      ELSE
      BEGIN
        SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
          + N'_Troy' 
        SET @sql = N'DROP TABLE ' + @conn_tab
        EXEC (@sql)
        EXECUTE Troy.dbo.SDE_pinfo_def_delete @connection_id
        SET @error_string = 'Version ' + @name + ' is no longer state ' +
                            cast (@state_id AS VARCHAR (10)) + '.'
        RAISERROR (@error_string,16,-1)
        RETURN @SE_VERSION_HAS_MOVED
      END
    END

    -- Now lock the new state with a persistent lock
    EXECUTE @ret_code = Troy.dbo.SDE_state_lock_def_insert @connection_id,
                       @new_state_id, 'Y', 'E'

    IF @ret_code = -49
      SET @ret_code = @SE_LOCK_CONFLICT
    IF @ret_code != 0
    BEGIN
      SET @conn_tab = N'##SDE_' + CAST(@connection_id as NVARCHAR(10))
        + N'_Troy' 
      SET @sql = N'DROP TABLE ' + @conn_tab
      EXEC (@sql)
      EXECUTE Troy.dbo.SDE_pinfo_def_delete @connection_id
      SET @error_string = 'Lock conflict detected for state ' + cast(@new_state_id as varchar(10))
      RAISERROR (@error_string,16,-1)
      RETURN @ret_code
    END
    -- Set the now editable version as the current version.

  EXECUTE Troy.dbo.SDE_set_globals @new_state_id,@protected,'0',@version_id 
  END

  -- do a hard commit, even if called within a transaction.
  while @@TRANCOUNT > 0
    COMMIT

END
GO
/****** Object:  View [dbo].[Stratagis_Historic_Current_View]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Historic_Current_View]
AS
SELECT     dbo.Stratagis_Current_OBD.OBJECTID, dbo.Stratagis_Current_OBD.TimeStamp, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), 
                      dbo.Stratagis_Current_OBD.TimeStamp) AS LocalTimeStamp, YEAR(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), 
                      dbo.Stratagis_Current_OBD.TimeStamp)) AS DateYear, MONTH(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), dbo.Stratagis_Current_OBD.TimeStamp)) 
                      AS DateMonth, DAY(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), dbo.Stratagis_Current_OBD.TimeStamp)) AS DateDay, CONVERT(varchar, 
                      CONVERT(time, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), dbo.Stratagis_Current_OBD.TimeStamp)), 100) AS LocalTime, 
                      dbo.Stratagis_Current_OBD.Validity, dbo.Stratagis_Current_OBD.Speed, dbo.Stratagis_Current_OBD.Course, dbo.Stratagis_Current_OBD.Variation, 
                      dbo.Stratagis_Current_OBD.EastWest, dbo.Stratagis_Current_OBD.DeviceId, dbo.Stratagis_Current_OBD.VehicleId, dbo.Stratagis_Current_OBD.EventNumber, 
                      dbo.Stratagis_Current_OBD.VIN, dbo.Stratagis_Current_OBD.ODBProtocol, dbo.Stratagis_Current_OBD.FirmWareVersion, dbo.Stratagis_Current_OBD.RSSI, 
                      dbo.Stratagis_Current_OBD.MILCount, dbo.Stratagis_Current_OBD.MILCodes, dbo.Stratagis_Current_OBD.GpsOdometerMiles, 
                      dbo.Stratagis_Current_OBD.OBDTripOdometerMiles, dbo.Stratagis_Current_OBD.SHAPE, dbo.Stratagis_Current_OBD.AdjOdometer, 
                      dbo.Stratagis_Current_OBD.Department, dbo.Stratagis_Current_OBD_Acc.VehicleSpeedMph, dbo.Stratagis_Current_OBD_Acc.Rpms, 
                      dbo.Stratagis_Current_OBD_Acc.CoolantTempF, dbo.Stratagis_Current_OBD_Acc.GPSStatus, 
                      case when isnull(dbo.Stratagis_Current_OBD_Acc.IdleTimeSec,0) >= isnull(dbo.Stratagis_Current_OBD_DI.IdleTimeSec,0) then
						isnull(dbo.Stratagis_Current_OBD_Acc.IdleTimeSec,0)
						else isnull(dbo.Stratagis_Current_OBD_DI.IdleTimeSec,0)
						end as IdleTimeSec
                      , 
                      dbo.Stratagis_Current_OBD_Acc.UserVar, dbo.Stratagis_Current_OBD_Acc.AccelerationX, dbo.Stratagis_Current_OBD_Acc.AccelerationY, 
                      dbo.Stratagis_Current_OBD_Acc.AccelerationZ, dbo.Stratagis_Current_OBD_Acc.ExcAccelTime, dbo.Stratagis_Current_OBD_Acc.ExcAccelLength, 
                      dbo.Stratagis_Current_OBD_Acc.ExcAcceleration, dbo.Stratagis_Current_OBD_Acc.ExcDecelTime, dbo.Stratagis_Current_OBD_Acc.ExcDecelLength, 
                      dbo.Stratagis_Current_OBD_Acc.ExcDeceleration, dbo.Stratagis_Current_OBD_DI.DigitalInput, dbo.Stratagis_Current_OBD.UseDescription
FROM         dbo.Stratagis_Current_OBD LEFT OUTER JOIN
                      dbo.Stratagis_Current_OBD_DI ON dbo.Stratagis_Current_OBD.OBJECTID = dbo.Stratagis_Current_OBD_DI.OBJECTID LEFT OUTER JOIN
                      dbo.Stratagis_Current_OBD_Acc ON dbo.Stratagis_Current_OBD.OBJECTID = dbo.Stratagis_Current_OBD_Acc.OBJECTID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[15] 2[26] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Stratagis_Current_OBD_DI"
            Begin Extent = 
               Top = 6
               Left = 275
               Bottom = 125
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Current_OBD_Acc"
            Begin Extent = 
               Top = 6
               Left = 473
               Bottom = 125
               Right = 645
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Current_OBD"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 290
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 7
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_Current_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_Current_View'
GO
/****** Object:  View [dbo].[Stratagis_Historic_Complete_View]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Historic_Complete_View]
AS
SELECT     dbo.Stratagis_Historic_OBD.OBJECTID, dbo.Stratagis_Historic_OBD.TimeStamp, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), 
                      dbo.Stratagis_Historic_OBD.TimeStamp) AS LocalTimeStamp, YEAR(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), 
                      dbo.Stratagis_Historic_OBD.TimeStamp)) AS DateYear, MONTH(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), dbo.Stratagis_Historic_OBD.TimeStamp))
                       AS DateMonth, DAY(DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), dbo.Stratagis_Historic_OBD.TimeStamp)) AS DateDay, CONVERT(varchar, 
                      CONVERT(time, DATEADD(mi, DATEDIFF(mi, sysutcdatetime(), sysdatetime()), dbo.Stratagis_Historic_OBD.TimeStamp)), 100) AS LocalTime, 
                      dbo.Stratagis_Historic_OBD.Validity, dbo.Stratagis_Historic_OBD.Speed, dbo.Stratagis_Historic_OBD.Course, dbo.Stratagis_Historic_OBD.Variation, 
                      dbo.Stratagis_Historic_OBD.EastWest, dbo.Stratagis_Historic_OBD.DeviceId, dbo.Stratagis_Historic_OBD.VehicleId, dbo.Stratagis_Historic_OBD.EventNumber, 
                      dbo.Stratagis_Historic_OBD.VIN, dbo.Stratagis_Historic_OBD.ODBProtocol, dbo.Stratagis_Historic_OBD.FirmWareVersion, dbo.Stratagis_Historic_OBD.RSSI, 
                      dbo.Stratagis_Historic_OBD.MILCount, dbo.Stratagis_Historic_OBD.MILCodes, dbo.Stratagis_Historic_OBD.GpsOdometerMiles, 
                      dbo.Stratagis_Historic_OBD.OBDTripOdometerMiles, dbo.Stratagis_Historic_OBD.SHAPE, dbo.Stratagis_Historic_OBD.AdjOdometer, 
                      dbo.Stratagis_Historic_OBD.Department, dbo.Stratagis_Historic_OBD_Acc.VehicleSpeedMph, dbo.Stratagis_Historic_OBD_Acc.Rpms, 
                      dbo.Stratagis_Historic_OBD_Acc.CoolantTempF, dbo.Stratagis_Historic_OBD_Acc.GPSStatus, 
                      case when isnull(dbo.Stratagis_Historic_OBD_Acc.IdleTimeSec,0) >= isnull(dbo.Stratagis_Historic_OBD_DI.IdleTimeSec,0) then
						isnull(dbo.Stratagis_Historic_OBD_Acc.IdleTimeSec,0)
						else isnull(dbo.Stratagis_Historic_OBD_DI.IdleTimeSec,0)
						end as IdleTimeSec
                      , 
                      dbo.Stratagis_Historic_OBD_Acc.UserVar, dbo.Stratagis_Historic_OBD_Acc.AccelerationX, dbo.Stratagis_Historic_OBD_Acc.AccelerationY, 
                      dbo.Stratagis_Historic_OBD_Acc.AccelerationZ, dbo.Stratagis_Historic_OBD_Acc.ExcAccelTime, dbo.Stratagis_Historic_OBD_Acc.ExcAccelLength, 
                      dbo.Stratagis_Historic_OBD_Acc.ExcAcceleration, dbo.Stratagis_Historic_OBD_Acc.ExcDecelTime, dbo.Stratagis_Historic_OBD_Acc.ExcDecelLength, 
                      dbo.Stratagis_Historic_OBD_Acc.ExcDeceleration, dbo.Stratagis_Historic_OBD_DI.DigitalInput, dbo.Stratagis_Historic_OBD.UseDescription
FROM         dbo.Stratagis_Historic_OBD LEFT OUTER JOIN
                      dbo.Stratagis_Historic_OBD_DI ON dbo.Stratagis_Historic_OBD.OBJECTID = dbo.Stratagis_Historic_OBD_DI.OBJECTID LEFT OUTER JOIN
                      dbo.Stratagis_Historic_OBD_Acc ON dbo.Stratagis_Historic_OBD.OBJECTID = dbo.Stratagis_Historic_OBD_Acc.OBJECTID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Stratagis_Historic_OBD"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 18
         End
         Begin Table = "Stratagis_Historic_OBD_DI"
            Begin Extent = 
               Top = 6
               Left = 275
               Bottom = 125
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Historic_OBD_Acc"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 245
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 43
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_Complete_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1740
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_Complete_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Historic_Complete_View'
GO
/****** Object:  StoredProcedure [dbo].[Stratagis_Report_Trip_Mart_Proc]    Script Date: 12/03/2014 13:10:13 ******/
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
/****** Object:  View [dbo].[Stratagis_Last_Location_View]    Script Date: 12/03/2014 13:10:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Stratagis_Last_Location_View]
AS
SELECT     dbo.Stratagis_Historic_Complete_View.OBJECTID, dbo.Stratagis_Historic_Complete_View.TimeStamp, dbo.Stratagis_Historic_Complete_View.LocalTimeStamp, 
                      dbo.Stratagis_Historic_Complete_View.DateYear, dbo.Stratagis_Historic_Complete_View.DateMonth, dbo.Stratagis_Historic_Complete_View.DateDay, 
                      dbo.Stratagis_Historic_Complete_View.LocalTime, dbo.Stratagis_Historic_Complete_View.Validity, dbo.Stratagis_Historic_Complete_View.Speed, 
                      dbo.Stratagis_Historic_Complete_View.Course, dbo.Stratagis_Historic_Complete_View.Variation, dbo.Stratagis_Historic_Complete_View.EastWest, 
                      dbo.Stratagis_Historic_Complete_View.DeviceId, dbo.Stratagis_Historic_Complete_View.VehicleId, dbo.Stratagis_Historic_Complete_View.EventNumber, 
                      CASE WHEN dbo.Stratagis_Historic_Complete_View.VIN IS NULL THEN Stratagis_Vehicle_View.VIN ELSE dbo.Stratagis_Historic_Complete_View.VIN END AS VIN, 
                      dbo.Stratagis_Historic_Complete_View.ODBProtocol, dbo.Stratagis_Historic_Complete_View.FirmWareVersion, dbo.Stratagis_Historic_Complete_View.RSSI, 
                      dbo.Stratagis_Historic_Complete_View.MILCount, dbo.Stratagis_Historic_Complete_View.MILCodes, dbo.Stratagis_Historic_Complete_View.GpsOdometerMiles, 
                      dbo.Stratagis_Historic_Complete_View.OBDTripOdometerMiles, dbo.Stratagis_Historic_Complete_View.VehicleSpeedMph, 
                      dbo.Stratagis_Historic_Complete_View.Rpms, dbo.Stratagis_Historic_Complete_View.CoolantTempF, dbo.Stratagis_Historic_Complete_View.GPSStatus, 
                      dbo.Stratagis_Historic_Complete_View.IdleTimeSec, dbo.Stratagis_Historic_Complete_View.UserVar, dbo.Stratagis_Historic_Complete_View.AccelerationX, 
                      dbo.Stratagis_Historic_Complete_View.AccelerationY, dbo.Stratagis_Historic_Complete_View.AccelerationZ, dbo.Stratagis_Historic_Complete_View.ExcAccelTime, 
                      dbo.Stratagis_Historic_Complete_View.ExcAccelLength, dbo.Stratagis_Historic_Complete_View.ExcAcceleration, 
                      dbo.Stratagis_Historic_Complete_View.ExcDecelTime, dbo.Stratagis_Historic_Complete_View.ExcDecelLength, 
                      dbo.Stratagis_Historic_Complete_View.ExcDeceleration, dbo.Stratagis_Historic_Complete_View.SHAPE, dbo.Stratagis_Historic_Complete_View.AdjOdometer, 
                      dbo.Stratagis_Historic_Complete_View.Department, dbo.Stratagis_Historic_Complete_View.DigitalInput, ISNULL(dbo.Stratagis_Vehicle_View.OdometerAdj, 0) 
                      + ISNULL(dbo.Stratagis_Historic_Complete_View.GpsOdometerMiles, 0) AS Odometer, dbo.Stratagis_Vehicle_View.UseDescription
FROM         dbo.Stratagis_Historic_Complete_View INNER JOIN
                          (SELECT     MAX(OBJECTID) AS ObjectId, VehicleId
                            FROM          dbo.Stratagis_Historic_Complete_View AS Stratagis_Historic_Complete_View_1
                            GROUP BY VehicleId) AS a ON dbo.Stratagis_Historic_Complete_View.OBJECTID = a.ObjectId INNER JOIN
                      dbo.Stratagis_Vehicle_View ON dbo.Stratagis_Historic_Complete_View.VehicleId = dbo.Stratagis_Vehicle_View.VehicleId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Stratagis_Historic_Complete_View"
            Begin Extent = 
               Top = 6
               Left = 377
               Bottom = 251
               Right = 605
            End
            DisplayFlags = 280
            TopColumn = 24
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 16
               Left = 691
               Bottom = 211
               Right = 875
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stratagis_Vehicle_View"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 254
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Last_Location_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Stratagis_Last_Location_View'
GO
/****** Object:  StoredProcedure [dbo].[StrataGIS_Mart_Proc]    Script Date: 12/03/2014 13:10:13 ******/
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
           ([Date]
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
     select [LocalDate]
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
/****** Object:  Default [DF__SDE_table__lock___44FF419A]    Script Date: 12/03/2014 13:09:59 ******/
ALTER TABLE [dbo].[SDE_table_locks] ADD  DEFAULT (getdate()) FOR [lock_time]
GO
/****** Object:  Default [DF__SDE_state__lock___4222D4EF]    Script Date: 12/03/2014 13:09:59 ******/
ALTER TABLE [dbo].[SDE_state_locks] ADD  DEFAULT (getdate()) FOR [lock_time]
GO
/****** Object:  Default [DF__SDE_objec__lock___47DBAE45]    Script Date: 12/03/2014 13:10:11 ******/
ALTER TABLE [dbo].[SDE_object_locks] ADD  DEFAULT (getdate()) FOR [lock_time]
GO
/****** Object:  Default [DF__SDE_layer__lock___3F466844]    Script Date: 12/03/2014 13:10:11 ******/
ALTER TABLE [dbo].[SDE_layer_locks] ADD  DEFAULT (getdate()) FOR [lock_time]
GO
/****** Object:  Check [registry_chk]    Script Date: 12/03/2014 13:09:59 ******/
ALTER TABLE [dbo].[SDE_table_registry]  WITH CHECK ADD  CONSTRAINT [registry_chk] CHECK  (([database_name]=db_name()))
GO
ALTER TABLE [dbo].[SDE_table_registry] CHECK CONSTRAINT [registry_chk]
GO
/****** Object:  Check [g2_ck]    Script Date: 12/03/2014 13:09:59 ******/
ALTER TABLE [dbo].[STRATAGIS_FLEET_REALTIME]  WITH CHECK ADD  CONSTRAINT [g2_ck] CHECK  (([SHAPE].[STSrid]=(3735)))
GO
ALTER TABLE [dbo].[STRATAGIS_FLEET_REALTIME] CHECK CONSTRAINT [g2_ck]
GO
/****** Object:  Check [g3c_ck]    Script Date: 12/03/2014 13:09:59 ******/
ALTER TABLE [dbo].[STRATAGIS_FLEET_HISTORIC_Current]  WITH CHECK ADD  CONSTRAINT [g3c_ck] CHECK  (([SHAPE].[STSrid]=(3735)))
GO
ALTER TABLE [dbo].[STRATAGIS_FLEET_HISTORIC_Current] CHECK CONSTRAINT [g3c_ck]
GO
/****** Object:  Check [spatial_ref_xyunits]    Script Date: 12/03/2014 13:10:11 ******/
ALTER TABLE [dbo].[SDE_spatial_references]  WITH CHECK ADD  CONSTRAINT [spatial_ref_xyunits] CHECK  (([xyunits]>=(1)))
GO
ALTER TABLE [dbo].[SDE_spatial_references] CHECK CONSTRAINT [spatial_ref_xyunits]
GO
/****** Object:  Check [spatial_ref_zunits]    Script Date: 12/03/2014 13:10:11 ******/
ALTER TABLE [dbo].[SDE_spatial_references]  WITH CHECK ADD  CONSTRAINT [spatial_ref_zunits] CHECK  (([zunits]>=(1)))
GO
ALTER TABLE [dbo].[SDE_spatial_references] CHECK CONSTRAINT [spatial_ref_zunits]
GO
/****** Object:  Check [g1_ck]    Script Date: 12/03/2014 13:10:11 ******/
ALTER TABLE [dbo].[GDB_ITEMS]  WITH CHECK ADD  CONSTRAINT [g1_ck] CHECK  (([Shape].[STSrid]=(4326)))
GO
ALTER TABLE [dbo].[GDB_ITEMS] CHECK CONSTRAINT [g1_ck]
GO
/****** Object:  Check [g3_ck]    Script Date: 12/03/2014 13:10:12 ******/
ALTER TABLE [dbo].[STRATAGIS_FLEET_HISTORIC]  WITH CHECK ADD  CONSTRAINT [g3_ck] CHECK  (([SHAPE].[STSrid]=(3735)))
GO
ALTER TABLE [dbo].[STRATAGIS_FLEET_HISTORIC] CHECK CONSTRAINT [g3_ck]
GO
/****** Object:  ForeignKey [rascol_fk]    Script Date: 12/03/2014 13:10:11 ******/
ALTER TABLE [dbo].[SDE_raster_columns]  WITH CHECK ADD  CONSTRAINT [rascol_fk] FOREIGN KEY([srid])
REFERENCES [dbo].[SDE_spatial_references] ([srid])
GO
ALTER TABLE [dbo].[SDE_raster_columns] CHECK CONSTRAINT [rascol_fk]
GO
/****** Object:  ForeignKey [layers_fk]    Script Date: 12/03/2014 13:10:11 ******/
ALTER TABLE [dbo].[SDE_layers]  WITH CHECK ADD  CONSTRAINT [layers_fk] FOREIGN KEY([srid])
REFERENCES [dbo].[SDE_spatial_references] ([srid])
GO
ALTER TABLE [dbo].[SDE_layers] CHECK CONSTRAINT [layers_fk]
GO
/****** Object:  ForeignKey [layers_sfk]    Script Date: 12/03/2014 13:10:11 ******/
ALTER TABLE [dbo].[SDE_layers]  WITH CHECK ADD  CONSTRAINT [layers_sfk] FOREIGN KEY([secondary_srid])
REFERENCES [dbo].[SDE_spatial_references] ([srid])
GO
ALTER TABLE [dbo].[SDE_layers] CHECK CONSTRAINT [layers_sfk]
GO
/****** Object:  ForeignKey [archives_fk1]    Script Date: 12/03/2014 13:10:11 ******/
ALTER TABLE [dbo].[SDE_archives]  WITH CHECK ADD  CONSTRAINT [archives_fk1] FOREIGN KEY([archiving_regid])
REFERENCES [dbo].[SDE_table_registry] ([registration_id])
GO
ALTER TABLE [dbo].[SDE_archives] CHECK CONSTRAINT [archives_fk1]
GO
/****** Object:  ForeignKey [archives_fk2]    Script Date: 12/03/2014 13:10:11 ******/
ALTER TABLE [dbo].[SDE_archives]  WITH CHECK ADD  CONSTRAINT [archives_fk2] FOREIGN KEY([history_regid])
REFERENCES [dbo].[SDE_table_registry] ([registration_id])
GO
ALTER TABLE [dbo].[SDE_archives] CHECK CONSTRAINT [archives_fk2]
GO
/****** Object:  ForeignKey [colregistry_fk]    Script Date: 12/03/2014 13:10:12 ******/
ALTER TABLE [dbo].[SDE_column_registry]  WITH CHECK ADD  CONSTRAINT [colregistry_fk] FOREIGN KEY([table_name], [owner], [database_name])
REFERENCES [dbo].[SDE_table_registry] ([table_name], [owner], [database_name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SDE_column_registry] CHECK CONSTRAINT [colregistry_fk]
GO
/****** Object:  ForeignKey [geocol_fk]    Script Date: 12/03/2014 13:10:12 ******/
ALTER TABLE [dbo].[SDE_geometry_columns]  WITH CHECK ADD  CONSTRAINT [geocol_fk] FOREIGN KEY([srid])
REFERENCES [dbo].[SDE_spatial_references] ([srid])
GO
ALTER TABLE [dbo].[SDE_geometry_columns] CHECK CONSTRAINT [geocol_fk]
GO
/****** Object:  ForeignKey [xml_columns_fk1]    Script Date: 12/03/2014 13:10:12 ******/
ALTER TABLE [dbo].[SDE_xml_columns]  WITH CHECK ADD  CONSTRAINT [xml_columns_fk1] FOREIGN KEY([registration_id])
REFERENCES [dbo].[SDE_table_registry] ([registration_id])
GO
ALTER TABLE [dbo].[SDE_xml_columns] CHECK CONSTRAINT [xml_columns_fk1]
GO
/****** Object:  ForeignKey [xml_columns_fk2]    Script Date: 12/03/2014 13:10:12 ******/
ALTER TABLE [dbo].[SDE_xml_columns]  WITH CHECK ADD  CONSTRAINT [xml_columns_fk2] FOREIGN KEY([index_id])
REFERENCES [dbo].[SDE_xml_indexes] ([index_id])
GO
ALTER TABLE [dbo].[SDE_xml_columns] CHECK CONSTRAINT [xml_columns_fk2]
GO
/****** Object:  ForeignKey [xml_indextags_fk1]    Script Date: 12/03/2014 13:10:12 ******/
ALTER TABLE [dbo].[SDE_xml_index_tags]  WITH CHECK ADD  CONSTRAINT [xml_indextags_fk1] FOREIGN KEY([index_id])
REFERENCES [dbo].[SDE_xml_indexes] ([index_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SDE_xml_index_tags] CHECK CONSTRAINT [xml_indextags_fk1]
GO
/****** Object:  ForeignKey [sdelayer_stats_fk1]    Script Date: 12/03/2014 13:10:13 ******/
ALTER TABLE [dbo].[SDE_layer_stats]  WITH CHECK ADD  CONSTRAINT [sdelayer_stats_fk1] FOREIGN KEY([layer_id])
REFERENCES [dbo].[SDE_layers] ([layer_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SDE_layer_stats] CHECK CONSTRAINT [sdelayer_stats_fk1]
GO
/****** Object:  ForeignKey [sdelayer_stats_fk2]    Script Date: 12/03/2014 13:10:13 ******/
ALTER TABLE [dbo].[SDE_layer_stats]  WITH CHECK ADD  CONSTRAINT [sdelayer_stats_fk2] FOREIGN KEY([version_id])
REFERENCES [dbo].[SDE_versions] ([version_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SDE_layer_stats] CHECK CONSTRAINT [sdelayer_stats_fk2]
GO
/****** Object:  ForeignKey [mvtables_modified_fk1]    Script Date: 12/03/2014 13:10:13 ******/
ALTER TABLE [dbo].[SDE_mvtables_modified]  WITH CHECK ADD  CONSTRAINT [mvtables_modified_fk1] FOREIGN KEY([state_id])
REFERENCES [dbo].[SDE_states] ([state_id])
GO
ALTER TABLE [dbo].[SDE_mvtables_modified] CHECK CONSTRAINT [mvtables_modified_fk1]
GO
/****** Object:  ForeignKey [mvtables_modified_fk2]    Script Date: 12/03/2014 13:10:13 ******/
ALTER TABLE [dbo].[SDE_mvtables_modified]  WITH CHECK ADD  CONSTRAINT [mvtables_modified_fk2] FOREIGN KEY([registration_id])
REFERENCES [dbo].[SDE_table_registry] ([registration_id])
GO
ALTER TABLE [dbo].[SDE_mvtables_modified] CHECK CONSTRAINT [mvtables_modified_fk2]
GO
