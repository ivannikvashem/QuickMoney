USE [master]
GO
/****** Object:  Database [Bank]    Script Date: 17.05.2021 11:33:07 ******/
CREATE DATABASE [Bank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bank', FILENAME = N'C:\Users\328-6\Bank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bank_log', FILENAME = N'C:\Users\328-6\Bank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Bank] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bank] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bank] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bank] SET  MULTI_USER 
GO
ALTER DATABASE [Bank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bank] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bank] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Bank] SET QUERY_STORE = OFF
GO
USE [Bank]
GO
/****** Object:  Table [dbo].[AdminLogPass]    Script Date: 17.05.2021 11:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminLogPass](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_AdminLogPass] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 17.05.2021 11:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[Passport] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](200) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 17.05.2021 11:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Payment] [int] IDENTITY(1,1) NOT NULL,
	[ServiceClientID] [int] NOT NULL,
	[Amount] [nvarchar](50) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Payment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 17.05.2021 11:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[PercentRate] [nvarchar](50) NULL,
	[MaximumDuration] [nvarchar](50) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceClient]    Script Date: 17.05.2021 11:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceClient](
	[ServiceClientID] [int] IDENTITY(1,1) NOT NULL,
	[Service] [int] NOT NULL,
	[Amount] [nvarchar](50) NOT NULL,
	[Client] [int] NOT NULL,
	[DateRegistr] [date] NOT NULL,
	[DateExpires] [date] NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ServiceClient] PRIMARY KEY CLUSTERED 
(
	[ServiceClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ServiceClient]  WITH CHECK ADD  CONSTRAINT [FK_ServiceClient_Client] FOREIGN KEY([Client])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[ServiceClient] CHECK CONSTRAINT [FK_ServiceClient_Client]
GO
ALTER TABLE [dbo].[ServiceClient]  WITH CHECK ADD  CONSTRAINT [FK_ServiceClient_Service] FOREIGN KEY([Service])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[ServiceClient] CHECK CONSTRAINT [FK_ServiceClient_Service]
GO
USE [master]
GO
ALTER DATABASE [Bank] SET  READ_WRITE 
GO
