USE [master]
GO
/****** Object:  Database [Prj3_ARS]    Script Date: 06-Dec-20 1:22:06 AM ******/
CREATE DATABASE [Prj3_ARS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prj3_ARS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Prj3_ARS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prj3_ARS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Prj3_ARS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Prj3_ARS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prj3_ARS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prj3_ARS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prj3_ARS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prj3_ARS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prj3_ARS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prj3_ARS] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prj3_ARS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prj3_ARS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prj3_ARS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prj3_ARS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prj3_ARS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prj3_ARS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prj3_ARS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prj3_ARS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prj3_ARS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prj3_ARS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Prj3_ARS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prj3_ARS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prj3_ARS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prj3_ARS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prj3_ARS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prj3_ARS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prj3_ARS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prj3_ARS] SET RECOVERY FULL 
GO
ALTER DATABASE [Prj3_ARS] SET  MULTI_USER 
GO
ALTER DATABASE [Prj3_ARS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prj3_ARS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prj3_ARS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prj3_ARS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prj3_ARS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Prj3_ARS', N'ON'
GO
ALTER DATABASE [Prj3_ARS] SET QUERY_STORE = OFF
GO
USE [Prj3_ARS]
GO
/****** Object:  Table [dbo].[Aircraft]    Script Date: 06-Dec-20 1:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aircraft](
	[AircraftID] [varchar](50) NOT NULL,
	[AircraftName] [nvarchar](100) NOT NULL,
	[FirstClassSeats] [int] NULL,
	[BussinessSeats] [int] NULL,
	[EconomySeats] [int] NOT NULL,
	[Range] [int] NOT NULL,
	[ServiceFee] [float] NOT NULL,
 CONSTRAINT [PK_Aircraft] PRIMARY KEY CLUSTERED 
(
	[AircraftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airline]    Script Date: 06-Dec-20 1:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airline](
	[AirlineID] [varchar](10) NOT NULL,
	[AirlineCountry] [varchar](10) NOT NULL,
	[AirlineName] [varchar](60) NOT NULL,
	[AirlineIcon] [varchar](100) NULL,
 CONSTRAINT [PK_Airline] PRIMARY KEY CLUSTERED 
(
	[AirlineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 06-Dec-20 1:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[AirportID] [varchar](10) NOT NULL,
	[AirportName] [varchar](60) NOT NULL,
	[CityName] [nvarchar](60) NOT NULL,
	[CountryID] [varchar](10) NOT NULL,
	[GMT] [float] NOT NULL,
 CONSTRAINT [PK_Airport] PRIMARY KEY CLUSTERED 
(
	[AirportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 06-Dec-20 1:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [varchar](10) NOT NULL,
	[CountryName] [nvarchar](100) NOT NULL,
	[CountryFlag] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditCard]    Script Date: 06-Dec-20 1:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCard](
	[CCNo] [varchar](12) NOT NULL,
	[CVV] [varchar](3) NOT NULL,
	[OwnerName] [varchar](100) NOT NULL,
	[Balance] [float] NOT NULL,
 CONSTRAINT [PK_CreditCard] PRIMARY KEY CLUSTERED 
(
	[CCNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06-Dec-20 1:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpID] [varchar](50) NOT NULL,
	[Password] [nvarchar](256) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phone] [varchar](12) NOT NULL,
	[Email] [varchar](256) NOT NULL,
	[Sex] [bit] NOT NULL,
	[DoB] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 06-Dec-20 1:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[FNo] [varchar](10) NOT NULL,
	[RNo] [int] NOT NULL,
	[AvailSeatsF] [int] NULL,
	[AvailSeatsB] [int] NULL,
	[AvailSeatsE] [int] NOT NULL,
	[DepartureTime] [datetime] NOT NULL,
	[ArrivalTime] [datetime] NOT NULL,
	[FlightTime] [float] NOT NULL,
	[BasePrice] [float] NOT NULL,
 CONSTRAINT [PK_Flight] PRIMARY KEY CLUSTERED 
(
	[FNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightDistance]    Script Date: 06-Dec-20 1:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightDistance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AirportID1] [varchar](10) NOT NULL,
	[AirportID2] [varchar](10) NOT NULL,
	[Distance] [int] NOT NULL,
 CONSTRAINT [PK_FlightDistance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 06-Dec-20 1:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [bigint] NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Total] [float] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route]    Script Date: 06-Dec-20 1:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[RNo] [int] IDENTITY(1,1) NOT NULL,
	[RAirline] [varchar](10) NOT NULL,
	[RAircraft] [varchar](50) NOT NULL,
	[Departure] [varchar](10) NOT NULL,
	[Destination] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED 
(
	[RNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 06-Dec-20 1:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [varchar](10) NOT NULL,
	[ServiceName] [nvarchar](100) NOT NULL,
	[ServiceDetails] [nvarchar](max) NULL,
	[ServiceFee] [float] NOT NULL,
	[IsServing] [bit] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 06-Dec-20 1:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[FNo] [varchar](10) NOT NULL,
	[PassportNo] [varchar](10) NOT NULL,
	[Class] [varchar](1) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Sex] [bit] NOT NULL,
	[Age] [int] NOT NULL,
	[IsReturn] [bit] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketService]    Script Date: 06-Dec-20 1:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketService](
	[TSID] [int] IDENTITY(1,1) NOT NULL,
	[TicketID] [bigint] NOT NULL,
	[ServiceID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_TicketService] PRIMARY KEY CLUSTERED 
(
	[TSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 06-Dec-20 1:22:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [varchar](50) NOT NULL,
	[Password] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phone] [varchar](12) NOT NULL,
	[Email] [varchar](256) NOT NULL,
	[Sex] [bit] NOT NULL,
	[Age] [int] NOT NULL,
	[CCNo] [varchar](12) NOT NULL,
	[PassportNo_] [varchar](10) NULL,
	[Skymiles] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Aircraft] ([AircraftID], [AircraftName], [FirstClassSeats], [BussinessSeats], [EconomySeats], [Range], [ServiceFee]) VALUES (N'1', N'1', 90, 90, 90, 1, 1)
INSERT [dbo].[Aircraft] ([AircraftID], [AircraftName], [FirstClassSeats], [BussinessSeats], [EconomySeats], [Range], [ServiceFee]) VALUES (N'BRR', N'Boring747', 20, 30, 60, 1000, 30000)
INSERT [dbo].[Aircraft] ([AircraftID], [AircraftName], [FirstClassSeats], [BussinessSeats], [EconomySeats], [Range], [ServiceFee]) VALUES (N'KCC', N'Boring747', 20, 30, 70, 11111, 11111)
GO
INSERT [dbo].[Airline] ([AirlineID], [AirlineCountry], [AirlineName], [AirlineIcon]) VALUES (N'1', N'VN', N'NB', N'AXM.png')
INSERT [dbo].[Airline] ([AirlineID], [AirlineCountry], [AirlineName], [AirlineIcon]) VALUES (N'2', N'JP', N'Japan Airline', N'CEB.png')
GO
INSERT [dbo].[Airport] ([AirportID], [AirportName], [CityName], [CountryID], [GMT]) VALUES (N'JP', N'Japan', N'Tokyo', N'JP', 9)
INSERT [dbo].[Airport] ([AirportID], [AirportName], [CityName], [CountryID], [GMT]) VALUES (N'NB', N'Noi Bai', N'Ha Noi', N'VN', 7)
GO
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryFlag]) VALUES (N'CH1', N'China1', N'/img/pro pict205054056.jpg')
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryFlag]) VALUES (N'HK', N'HongKong', N'/img/IMG_20180724_162416_HDR200044160.jpg')
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryFlag]) VALUES (N'JP', N'Japan', N'1')
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryFlag]) VALUES (N'MY', N'Malaysia', N'/img/download205555652.png')
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryFlag]) VALUES (N'VN', N'Viet Nam', N'1')
GO
INSERT [dbo].[CreditCard] ([CCNo], [CVV], [OwnerName], [Balance]) VALUES (N'111', N'1', N'vu', 43329.7706913213)
GO
INSERT [dbo].[Employee] ([EmpID], [Password], [Firstname], [Lastname], [Address], [Phone], [Email], [Sex], [DoB], [IsActive], [Role]) VALUES (N'Admin', N'123', N'vu', N'vu', N'VietNam', N'00333', N'vu@gmailcom', 1, CAST(N'1994-01-17T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Employee] ([EmpID], [Password], [Firstname], [Lastname], [Address], [Phone], [Email], [Sex], [DoB], [IsActive], [Role]) VALUES (N'vu', N'vu', N'vu', N'vu', N'vu', N'09', N'vu', 1, CAST(N'1994-01-17T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[Flight] ([FNo], [RNo], [AvailSeatsF], [AvailSeatsB], [AvailSeatsE], [DepartureTime], [ArrivalTime], [FlightTime], [BasePrice]) VALUES (N'111', 6, 90, 90, 88, CAST(N'2020-12-17T12:00:00.000' AS DateTime), CAST(N'2020-12-20T12:00:00.000' AS DateTime), 14, 20000)
INSERT [dbo].[Flight] ([FNo], [RNo], [AvailSeatsF], [AvailSeatsB], [AvailSeatsE], [DepartureTime], [ArrivalTime], [FlightTime], [BasePrice]) VALUES (N'12', 7, 20, 30, 48, CAST(N'2020-12-20T00:00:00.000' AS DateTime), CAST(N'2020-12-21T00:00:00.000' AS DateTime), 16, 2000)
INSERT [dbo].[Flight] ([FNo], [RNo], [AvailSeatsF], [AvailSeatsB], [AvailSeatsE], [DepartureTime], [ArrivalTime], [FlightTime], [BasePrice]) VALUES (N'2', 6, 90, 90, 90, CAST(N'2020-12-01T20:40:00.000' AS DateTime), CAST(N'2020-12-07T20:41:00.000' AS DateTime), 0, 20)
GO
SET IDENTITY_INSERT [dbo].[FlightDistance] ON 

INSERT [dbo].[FlightDistance] ([ID], [AirportID1], [AirportID2], [Distance]) VALUES (1, N'JP', N'NB', 1000)
INSERT [dbo].[FlightDistance] ([ID], [AirportID1], [AirportID2], [Distance]) VALUES (2, N'NB', N'JP', 1000)
SET IDENTITY_INSERT [dbo].[FlightDistance] OFF
GO
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [Total], [Status]) VALUES (202012514016, N'vu', CAST(N'2020-12-05T14:00:16.403' AS DateTime), 20834.409562162964, 2)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [Total], [Status]) VALUES (202012518454, N'vu', CAST(N'2020-12-05T18:04:54.723' AS DateTime), 22903.364502168981, 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [Total], [Status]) VALUES (2020111221344, N'vu', CAST(N'2020-11-12T21:34:04.807' AS DateTime), 20001, 2)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [Total], [Status]) VALUES (2020111221345, N'vu', CAST(N'2020-11-12T21:34:05.723' AS DateTime), 20001, 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [Total], [Status]) VALUES (2020111221346, N'vu', CAST(N'2020-11-12T21:34:06.933' AS DateTime), 20001, 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [Total], [Status]) VALUES (2020111221348, N'vu', CAST(N'2020-11-12T21:34:08.123' AS DateTime), 20001, 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [Total], [Status]) VALUES (2020111221349, N'vu', CAST(N'2020-11-12T21:34:09.573' AS DateTime), 20001, 0)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [Total], [Status]) VALUES (2020111221372, N'vu', CAST(N'2020-11-12T21:37:02.177' AS DateTime), 20001, 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [Total], [Status]) VALUES (2020125174714, N'vu', CAST(N'2020-12-05T17:47:14.300' AS DateTime), 22898.455244346758, 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [Total], [Status]) VALUES (20201112213325, N'vu', CAST(N'2020-11-12T21:33:25.543' AS DateTime), 20001, 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [Total], [Status]) VALUES (20201112213423, N'vu', CAST(N'2020-11-12T21:34:23.383' AS DateTime), 20001, 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderDate], [Total], [Status]) VALUES (20201112214352, N'vu', CAST(N'2020-11-12T21:43:52.050' AS DateTime), 20001, 1)
GO
SET IDENTITY_INSERT [dbo].[Route] ON 

INSERT [dbo].[Route] ([RNo], [RAirline], [RAircraft], [Departure], [Destination]) VALUES (6, N'1', N'1', N'NB', N'JP')
INSERT [dbo].[Route] ([RNo], [RAirline], [RAircraft], [Departure], [Destination]) VALUES (7, N'1', N'1', N'JP', N'NB')
SET IDENTITY_INSERT [dbo].[Route] OFF
GO
INSERT [dbo].[Service] ([ServiceID], [ServiceName], [ServiceDetails], [ServiceFee], [IsServing]) VALUES (N'S00', N'Lunch', N'Offer lunch to customer', 1000, 1)
GO
INSERT [dbo].[Ticket] ([TicketID], [OrderID], [FNo], [PassportNo], [Class], [Firstname], [Lastname], [Sex], [Age], [IsReturn], [Price]) VALUES (2020125140161, 202012514016, N'111', N'11111111', N'E', N'Vu', N'Tran', 1, 20, 0, 20834.409562162964)
INSERT [dbo].[Ticket] ([TicketID], [OrderID], [FNo], [PassportNo], [Class], [Firstname], [Lastname], [Sex], [Age], [IsReturn], [Price]) VALUES (2020125184541, 202012518454, N'111', N'11111111', N'E', N'Vu', N'Tran', 1, 26, 0, 20902.364502168981)
INSERT [dbo].[Ticket] ([TicketID], [OrderID], [FNo], [PassportNo], [Class], [Firstname], [Lastname], [Sex], [Age], [IsReturn], [Price]) VALUES (2020125184542, 202012518454, N'12', N'11111111', N'E', N'Vu', N'Tran', 1, 26, 1, 2001)
INSERT [dbo].[Ticket] ([TicketID], [OrderID], [FNo], [PassportNo], [Class], [Firstname], [Lastname], [Sex], [Age], [IsReturn], [Price]) VALUES (20201112213441, 2020111221344, N'111', N'11111111', N'E', N'Vu', N'Tran', 1, 19, 0, 20001)
INSERT [dbo].[Ticket] ([TicketID], [OrderID], [FNo], [PassportNo], [Class], [Firstname], [Lastname], [Sex], [Age], [IsReturn], [Price]) VALUES (20201112213451, 2020111221345, N'111', N'11111111', N'E', N'Vu', N'Tran', 1, 19, 0, 20001)
INSERT [dbo].[Ticket] ([TicketID], [OrderID], [FNo], [PassportNo], [Class], [Firstname], [Lastname], [Sex], [Age], [IsReturn], [Price]) VALUES (20201112213461, 2020111221346, N'111', N'11111111', N'E', N'Vu', N'Tran', 1, 19, 0, 20001)
INSERT [dbo].[Ticket] ([TicketID], [OrderID], [FNo], [PassportNo], [Class], [Firstname], [Lastname], [Sex], [Age], [IsReturn], [Price]) VALUES (20201112213481, 2020111221348, N'111', N'11111111', N'E', N'Vu', N'Tran', 1, 19, 0, 20001)
INSERT [dbo].[Ticket] ([TicketID], [OrderID], [FNo], [PassportNo], [Class], [Firstname], [Lastname], [Sex], [Age], [IsReturn], [Price]) VALUES (20201112213491, 2020111221349, N'111', N'11111111', N'E', N'Vu', N'Tran', 1, 19, 0, 20001)
INSERT [dbo].[Ticket] ([TicketID], [OrderID], [FNo], [PassportNo], [Class], [Firstname], [Lastname], [Sex], [Age], [IsReturn], [Price]) VALUES (20201112213721, 2020111221372, N'111', N'111111', N'E', N'Vu', N'vu', 1, 20, 0, 20001)
INSERT [dbo].[Ticket] ([TicketID], [OrderID], [FNo], [PassportNo], [Class], [Firstname], [Lastname], [Sex], [Age], [IsReturn], [Price]) VALUES (20201251747141, 2020125174714, N'111', N'11111111', N'E', N'Vu', N'Tran', 0, 44, 0, 20897.455244346758)
INSERT [dbo].[Ticket] ([TicketID], [OrderID], [FNo], [PassportNo], [Class], [Firstname], [Lastname], [Sex], [Age], [IsReturn], [Price]) VALUES (20201251747142, 2020125174714, N'12', N'11111111', N'E', N'Vu', N'Tran', 0, 44, 1, 2001)
INSERT [dbo].[Ticket] ([TicketID], [OrderID], [FNo], [PassportNo], [Class], [Firstname], [Lastname], [Sex], [Age], [IsReturn], [Price]) VALUES (202011122133251, 20201112213325, N'111', N'11111111', N'E', N'Vu', N'Tran', 1, 19, 0, 20001)
INSERT [dbo].[Ticket] ([TicketID], [OrderID], [FNo], [PassportNo], [Class], [Firstname], [Lastname], [Sex], [Age], [IsReturn], [Price]) VALUES (202011122134231, 20201112213423, N'111', N'11111111', N'E', N'Vu', N'Tran', 1, 19, 0, 20001)
INSERT [dbo].[Ticket] ([TicketID], [OrderID], [FNo], [PassportNo], [Class], [Firstname], [Lastname], [Sex], [Age], [IsReturn], [Price]) VALUES (202011122143521, 20201112214352, N'111', N'11111111', N'E', N'Vu', N'Tran', 1, 22, 0, 20001)
GO
INSERT [dbo].[User] ([UserID], [Password], [FirstName], [LastName], [Address], [Phone], [Email], [Sex], [Age], [CCNo], [PassportNo_], [Skymiles]) VALUES (N'vu', N'vu', N'vu', N'vu', N'vu', N'01', N'vu', 1, 20, N'111', N'1111', 3111)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_Airline_AirlineCountry_Country_CountryID]    Script Date: 06-Dec-20 1:22:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Airline_AirlineCountry_Country_CountryID] ON [dbo].[Airline]
(
	[AirlineCountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_Airport_CountryID_Country_CountryID]    Script Date: 06-Dec-20 1:22:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Airport_CountryID_Country_CountryID] ON [dbo].[Airport]
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Flight_Route_RNo]    Script Date: 06-Dec-20 1:22:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Flight_Route_RNo] ON [dbo].[Flight]
(
	[RNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_FlightDistance_AirportID1_Airport_AirportID]    Script Date: 06-Dec-20 1:22:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_FlightDistance_AirportID1_Airport_AirportID] ON [dbo].[FlightDistance]
(
	[AirportID1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_FlightDistance_AirportID2_Airport_AirportID]    Script Date: 06-Dec-20 1:22:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_FlightDistance_AirportID2_Airport_AirportID] ON [dbo].[FlightDistance]
(
	[AirportID2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_Order_UserID_User_UserID]    Script Date: 06-Dec-20 1:22:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Order_UserID_User_UserID] ON [dbo].[Order]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_Route_Departure_Airport_AirportID]    Script Date: 06-Dec-20 1:22:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Route_Departure_Airport_AirportID] ON [dbo].[Route]
(
	[Departure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_Route_Destination_Airport_AirportID]    Script Date: 06-Dec-20 1:22:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Route_Destination_Airport_AirportID] ON [dbo].[Route]
(
	[Destination] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_Route_RAircraft_Aircraft_AircraftID]    Script Date: 06-Dec-20 1:22:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Route_RAircraft_Aircraft_AircraftID] ON [dbo].[Route]
(
	[RAircraft] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_Route_RAirline_Airline_AirlineID]    Script Date: 06-Dec-20 1:22:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Route_RAirline_Airline_AirlineID] ON [dbo].[Route]
(
	[RAirline] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_Ticket_FNo_Flight_FNo]    Script Date: 06-Dec-20 1:22:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Ticket_FNo_Flight_FNo] ON [dbo].[Ticket]
(
	[FNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Ticket_OrderID_Order_OrderID]    Script Date: 06-Dec-20 1:22:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Ticket_OrderID_Order_OrderID] ON [dbo].[Ticket]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_TicketService_ServiceID_Service_ServiceID]    Script Date: 06-Dec-20 1:22:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_TicketService_ServiceID_Service_ServiceID] ON [dbo].[TicketService]
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_TicketService_TicketID_Ticket_TicketID]    Script Date: 06-Dec-20 1:22:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_TicketService_TicketID_Ticket_TicketID] ON [dbo].[TicketService]
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Airline]  WITH CHECK ADD  CONSTRAINT [FK_Airline_AirlineCountry_Country_CountryID] FOREIGN KEY([AirlineCountry])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Airline] CHECK CONSTRAINT [FK_Airline_AirlineCountry_Country_CountryID]
GO
ALTER TABLE [dbo].[Airport]  WITH CHECK ADD  CONSTRAINT [FK_Airport_CountryID_Country_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Airport] CHECK CONSTRAINT [FK_Airport_CountryID_Country_CountryID]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Route_RNo] FOREIGN KEY([RNo])
REFERENCES [dbo].[Route] ([RNo])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Route_RNo]
GO
ALTER TABLE [dbo].[FlightDistance]  WITH CHECK ADD  CONSTRAINT [FK_FlightDistance_AirportID1_Airport_AirportID] FOREIGN KEY([AirportID1])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[FlightDistance] CHECK CONSTRAINT [FK_FlightDistance_AirportID1_Airport_AirportID]
GO
ALTER TABLE [dbo].[FlightDistance]  WITH CHECK ADD  CONSTRAINT [FK_FlightDistance_AirportID2_Airport_AirportID] FOREIGN KEY([AirportID2])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[FlightDistance] CHECK CONSTRAINT [FK_FlightDistance_AirportID2_Airport_AirportID]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UserID_User_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UserID_User_UserID]
GO
ALTER TABLE [dbo].[Route]  WITH CHECK ADD  CONSTRAINT [FK_Route_Departure_Airport_AirportID] FOREIGN KEY([Departure])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[Route] CHECK CONSTRAINT [FK_Route_Departure_Airport_AirportID]
GO
ALTER TABLE [dbo].[Route]  WITH CHECK ADD  CONSTRAINT [FK_Route_Destination_Airport_AirportID] FOREIGN KEY([Destination])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[Route] CHECK CONSTRAINT [FK_Route_Destination_Airport_AirportID]
GO
ALTER TABLE [dbo].[Route]  WITH CHECK ADD  CONSTRAINT [FK_Route_RAircraft_Aircraft_AircraftID] FOREIGN KEY([RAircraft])
REFERENCES [dbo].[Aircraft] ([AircraftID])
GO
ALTER TABLE [dbo].[Route] CHECK CONSTRAINT [FK_Route_RAircraft_Aircraft_AircraftID]
GO
ALTER TABLE [dbo].[Route]  WITH CHECK ADD  CONSTRAINT [FK_Route_RAirline_Airline_AirlineID] FOREIGN KEY([RAirline])
REFERENCES [dbo].[Airline] ([AirlineID])
GO
ALTER TABLE [dbo].[Route] CHECK CONSTRAINT [FK_Route_RAirline_Airline_AirlineID]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_FNo_Flight_FNo] FOREIGN KEY([FNo])
REFERENCES [dbo].[Flight] ([FNo])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_FNo_Flight_FNo]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_OrderID_Order_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_OrderID_Order_OrderID]
GO
ALTER TABLE [dbo].[TicketService]  WITH CHECK ADD  CONSTRAINT [FK_TicketService_ServiceID_Service_ServiceID] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[TicketService] CHECK CONSTRAINT [FK_TicketService_ServiceID_Service_ServiceID]
GO
ALTER TABLE [dbo].[TicketService]  WITH CHECK ADD  CONSTRAINT [FK_TicketService_TicketID_Ticket_TicketID] FOREIGN KEY([TicketID])
REFERENCES [dbo].[Ticket] ([TicketID])
GO
ALTER TABLE [dbo].[TicketService] CHECK CONSTRAINT [FK_TicketService_TicketID_Ticket_TicketID]
GO
USE [master]
GO
ALTER DATABASE [Prj3_ARS] SET  READ_WRITE 
GO
