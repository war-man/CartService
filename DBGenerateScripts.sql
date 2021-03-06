USE [master]
GO
/****** Object:  Database [CartService]    Script Date: 20.08.2020 15:21:28 ******/
CREATE DATABASE [CartService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CartService', FILENAME = N'D:\MSSERVER\DATA\CartService.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CartService_log', FILENAME = N'D:\MSSERVER\DATA\CartService_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CartService] SET COMPATIBILITY_LEVEL = 140

GO
ALTER DATABASE [CartService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CartService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CartService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CartService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CartService] SET ARITHABORT OFF 
GO
ALTER DATABASE [CartService] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CartService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CartService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CartService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CartService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CartService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CartService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CartService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CartService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CartService] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CartService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CartService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CartService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CartService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CartService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CartService] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CartService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CartService] SET RECOVERY FULL 
GO
ALTER DATABASE [CartService] SET  MULTI_USER 
GO
ALTER DATABASE [CartService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CartService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CartService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CartService] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CartService] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CartService', N'ON'
GO
ALTER DATABASE [CartService] SET QUERY_STORE = OFF
GO
USE [CartService]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20.08.2020 15:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[ForBonusPoints] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 20.08.2020 15:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Edited] [datetime] NOT NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCartProducts]    Script Date: 20.08.2020 15:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCartProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShoppingCart_id] [int] NOT NULL,
	[Product_id] [int] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_ShoppingCartProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([Id], [Name], [Cost], [ForBonusPoints]) VALUES (1, N'Овсянка', CAST(20.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [Cost], [ForBonusPoints]) VALUES (2, N'Творог', CAST(60.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Product] ([Id], [Name], [Cost], [ForBonusPoints]) VALUES (3, N'Чизкейк', CAST(140.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [Cost], [ForBonusPoints]) VALUES (4, N'Рябчики', CAST(1000.00 AS Decimal(18, 2)), 0)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoppingCart] ON 
GO
INSERT [dbo].[ShoppingCart] ([Id], [Guid], [Created], [Edited]) VALUES (2, N'c9697ced-bb35-4172-be24-c9b0dfe9e3a8', CAST(N'2020-08-18T15:28:00.000' AS DateTime), CAST(N'2020-08-19T21:18:32.060' AS DateTime))
GO
INSERT [dbo].[ShoppingCart] ([Id], [Guid], [Created], [Edited]) VALUES (4, N'c9617ced-bb35-4172-be24-c9b0dfe9e3a8', CAST(N'2020-08-18T16:38:19.863' AS DateTime), CAST(N'2020-08-19T21:18:32.060' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ShoppingCart] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoppingCartProducts] ON 
GO
INSERT [dbo].[ShoppingCartProducts] ([Id], [ShoppingCart_id], [Product_id], [Amount]) VALUES (2, 2, 2, 0)
GO
INSERT [dbo].[ShoppingCartProducts] ([Id], [ShoppingCart_id], [Product_id], [Amount]) VALUES (3, 2, 4, 0)
GO
INSERT [dbo].[ShoppingCartProducts] ([Id], [ShoppingCart_id], [Product_id], [Amount]) VALUES (11, 4, 1, 2)
GO
INSERT [dbo].[ShoppingCartProducts] ([Id], [ShoppingCart_id], [Product_id], [Amount]) VALUES (12, 4, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[ShoppingCartProducts] OFF
GO
ALTER TABLE [dbo].[ShoppingCartProducts] ADD  CONSTRAINT [DF_ShoppingCartProducts_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[ShoppingCartProducts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartProducts_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCartProducts] CHECK CONSTRAINT [FK_ShoppingCartProducts_Product]
GO
ALTER TABLE [dbo].[ShoppingCartProducts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartProducts_ShoppingCart] FOREIGN KEY([ShoppingCart_id])
REFERENCES [dbo].[ShoppingCart] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCartProducts] CHECK CONSTRAINT [FK_ShoppingCartProducts_ShoppingCart]
GO
USE [master]
GO
ALTER DATABASE [CartService] SET  READ_WRITE 
GO
