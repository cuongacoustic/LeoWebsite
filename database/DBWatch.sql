USE [master]
GO
/****** Object:  Database [DBWatch]    Script Date: 04/04/2018 16:29:21 ******/
CREATE DATABASE [DBWatch]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBWatch', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBWatch.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBWatch_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBWatch_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBWatch] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBWatch].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBWatch] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBWatch] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBWatch] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBWatch] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBWatch] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBWatch] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBWatch] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DBWatch] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBWatch] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBWatch] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBWatch] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBWatch] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBWatch] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBWatch] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBWatch] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBWatch] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBWatch] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBWatch] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBWatch] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBWatch] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBWatch] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBWatch] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBWatch] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBWatch] SET RECOVERY FULL 
GO
ALTER DATABASE [DBWatch] SET  MULTI_USER 
GO
ALTER DATABASE [DBWatch] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBWatch] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBWatch] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBWatch] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBWatch', N'ON'
GO
USE [DBWatch]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 04/04/2018 16:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Brand]    Script Date: 04/04/2018 16:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 04/04/2018 16:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 04/04/2018 16:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CusName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[BirthDay] [date] NULL,
	[Gender] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 04/04/2018 16:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[FBackID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[CusName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FBackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 04/04/2018 16:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CusName] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Payment] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 04/04/2018 16:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 04/04/2018 16:29:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProID] [int] IDENTITY(1,1) NOT NULL,
	[ProName] [nvarchar](50) NULL,
	[CateID] [int] NULL,
	[Price] [int] NULL,
	[Specials] [bit] NULL,
	[Description] [nvarchar](50) NULL,
	[Origin] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[BrandID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD FOREIGN KEY([CusName])
REFERENCES [dbo].[Customer] ([CusName])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CusName])
REFERENCES [dbo].[Customer] ([CusName])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CateID])
REFERENCES [dbo].[Categories] ([CateID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [DBWatch] SET  READ_WRITE
