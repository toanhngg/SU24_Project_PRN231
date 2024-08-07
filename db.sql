USE [master]
GO
/****** Object:  Database [PizzaLab]    Script Date: 7/12/2024 1:12:37 PM ******/
CREATE DATABASE [PizzaLab]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PizzaLab', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PizzaLab.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PizzaLab_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PizzaLab_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PizzaLab] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PizzaLab].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PizzaLab] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PizzaLab] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PizzaLab] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PizzaLab] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PizzaLab] SET ARITHABORT OFF 
GO
ALTER DATABASE [PizzaLab] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PizzaLab] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PizzaLab] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PizzaLab] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PizzaLab] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PizzaLab] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PizzaLab] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PizzaLab] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PizzaLab] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PizzaLab] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PizzaLab] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PizzaLab] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PizzaLab] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PizzaLab] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PizzaLab] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PizzaLab] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PizzaLab] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PizzaLab] SET RECOVERY FULL 
GO
ALTER DATABASE [PizzaLab] SET  MULTI_USER 
GO
ALTER DATABASE [PizzaLab] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PizzaLab] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PizzaLab] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PizzaLab] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PizzaLab] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PizzaLab] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PizzaLab', N'ON'
GO
ALTER DATABASE [PizzaLab] SET QUERY_STORE = ON
GO
ALTER DATABASE [PizzaLab] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PizzaLab]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/12/2024 1:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/12/2024 1:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nchar](10) NULL,
	[Email] [nchar](50) NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/12/2024 1:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[Freight] [money] NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[isCart] [bit] NULL,
	[TableAdress] [nchar](10) NULL,
	[CustomerId] [int] NULL,
	[Note] [nvarchar](100) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/12/2024 1:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/12/2024 1:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [money] NOT NULL,
	[Weight] [float] NOT NULL,
	[Image] [varchar](max) NOT NULL,
	[Ammount] [int] NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 7/12/2024 1:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[DateModified] [datetime] NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/12/2024 1:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/12/2024 1:12:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](18) NOT NULL,
	[Phone] [nchar](10) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[ContactName] [nvarchar](50) NULL,
	[RoleId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CategoryName], [Description]) VALUES (1, N'Pizza', N'Pizza là một món ăn có nguồn gốc từ Italia. Nó bao gồm một lớp bột mỏng được nướng trong lò, được phủ đầy những thành phần như sốt cà chua, pho mát và các loại thịt, rau quả, gia vị tuỳ ý.')
INSERT [dbo].[Category] ([Id], [CategoryName], [Description]) VALUES (2, N'Đồ Uống', N'Các loại đồ uống')
INSERT [dbo].[Category] ([Id], [CategoryName], [Description]) VALUES (3, N'Mì', N'Các loại mì')
INSERT [dbo].[Category] ([Id], [CategoryName], [Description]) VALUES (4, N'Hamburger', N'Hamburger là một loại thức ăn bao gồm bánh mì kẹp thịt xay ở giữa. Miếng thịt có thể được nướng, chiên, hun khói hay nướng trên lửa. ')
INSERT [dbo].[Category] ([Id], [CategoryName], [Description]) VALUES (7, N'Đồ tráng miệng', N'Là các loại kem, chè')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Phone], [Email], [Name]) VALUES (3, N'0936471448', N'anhng130@gmail.com                                ', N'Nguyen To Anh')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [UserId], [Status], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [isCart], [TableAdress], [CustomerId], [Note]) VALUES (3, 3, 0, CAST(N'2023-03-21T00:00:00.000' AS DateTime), CAST(N'2023-03-21T00:00:00.000' AS DateTime), CAST(N'2023-03-21T00:00:00.000' AS DateTime), 123.0000, N'asfds', 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [Status], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [isCart], [TableAdress], [CustomerId], [Note]) VALUES (4, 3, 1, CAST(N'2023-03-21T00:00:00.000' AS DateTime), CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(N'2023-03-21T00:00:00.000' AS DateTime), 123.0000, N'asfds', 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [Status], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [isCart], [TableAdress], [CustomerId], [Note]) VALUES (5, 3, 1, CAST(N'2023-03-21T00:00:00.000' AS DateTime), CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(N'2023-03-21T00:00:00.000' AS DateTime), 123.0000, N'FPT', 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [Status], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [isCart], [TableAdress], [CustomerId], [Note]) VALUES (7, 3, 0, CAST(N'2023-03-28T00:00:00.000' AS DateTime), CAST(N'2023-03-29T00:00:00.000' AS DateTime), CAST(N'2023-03-28T00:00:00.000' AS DateTime), 1.0000, N'2asdf', 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [Status], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [isCart], [TableAdress], [CustomerId], [Note]) VALUES (8, 3, 0, CAST(N'2023-03-27T00:00:00.000' AS DateTime), CAST(N'2023-03-28T00:00:00.000' AS DateTime), CAST(N'2023-03-28T00:00:00.000' AS DateTime), 2.0000, N'UnKnown', 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [Status], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [isCart], [TableAdress], [CustomerId], [Note]) VALUES (9, 3, 0, CAST(N'2023-03-27T00:00:00.000' AS DateTime), CAST(N'2023-03-28T00:00:00.000' AS DateTime), CAST(N'2023-03-28T00:00:00.000' AS DateTime), 0.0000, N'asdf', 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [Status], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [isCart], [TableAdress], [CustomerId], [Note]) VALUES (10, 3, 0, CAST(N'2023-03-27T00:00:00.000' AS DateTime), CAST(N'2023-03-28T00:00:00.000' AS DateTime), CAST(N'2023-03-28T00:00:00.000' AS DateTime), 4.0000, N'abc', 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [Status], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [isCart], [TableAdress], [CustomerId], [Note]) VALUES (11, 3, 0, CAST(N'2023-03-27T00:00:00.000' AS DateTime), CAST(N'2023-03-27T00:00:00.000' AS DateTime), CAST(N'2023-03-27T00:00:00.000' AS DateTime), 1.0000, N'dsf', 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [Status], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [isCart], [TableAdress], [CustomerId], [Note]) VALUES (12, 2, 0, CAST(N'2023-12-15T00:00:00.000' AS DateTime), CAST(N'2023-12-16T00:00:00.000' AS DateTime), CAST(N'2023-12-16T00:00:00.000' AS DateTime), 3.0000, N'UnKnown', 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [Status], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipAddress], [isCart], [TableAdress], [CustomerId], [Note]) VALUES (15, 1, 0, CAST(N'2024-07-10T20:07:57.517' AS DateTime), NULL, NULL, 234000.0000, NULL, NULL, N'1         ', 3, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (3, 9, 1070000.0000, 10)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (3, 12, 465000.0000, 3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (5, 9, 321000.0000, 3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (5, 10, 420000.0000, 3)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (8, 3, 155000.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (9, 3, 155000.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (10, 4, 159000.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (10, 41, 62000.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (11, 3, 1860000.0000, 12)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (12, 4, 159000.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (15, 25, 234000.0000, 2)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (3, N'Fajita chicken Pizza - Pizza Gà', N'Thàn phần: Pizza cơ bản (phô mai, sốt cà chua, lá húng quê)', 155000.0000, 1, N'//product.hstatic.net/200000233557/product/trich_dan_tu_long_co_gai_ngoi_tren_mot_canh_dong__5__056801b80bef4e729f2b320834026bec_grande.png', 10, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (4, N'DMZ Pizza', N'Thành phần: Pizza cơ bản+ Nấm, thịt heo xông khói, hạt oliu', 159000.0000, 2, N'//product.hstatic.net/200000233557/product/dmzpizzza_be657f410cf74d60bab21ed24b729118_grande.jpg', 10, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (9, N'Magherita Pizza - Pizza Cơ bản', N'Thành phần: Phô mai, sốt cà chua, Oregano - lá húng chó', 107000.0000, 2, N'//product.hstatic.net/200000233557/product/pizzan1_cbb5a4f3b8f746c7bc269ee493a934be_grande.jpg', 10, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (10, N'Ortolana Pizza - Pizza Chay', N'Thành phần:Pizza cơ bản, rau củ quả/ Basic pizza', 140000.0000, 3, N'//product.hstatic.net/200000233557/product/pizzaotolana_3aaf9f85a98540788df69f102afdb448_grande.jpg', 10, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (12, N'Pizza 4 loại Phômai- Quattro Formaggi Pizza', N'Thành phần:Pizza cơ bản,Mozzarella, Gouda, Blue Cheese', 155000.0000, 2, N'//product.hstatic.net/200000233557/product/pizza4pnj_e4408441e04b4807912d3557864afc2e_grande.png', 10, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (13, N'Pizza Bacon - Thịt xông khói', N'Thành phần: Pizza cơ bản ( cà chua, phô mai mozzarella, húng quế)', 145000.0000, 1.5, N'//product.hstatic.net/200000233557/product/pizza-baccon-littleitaly-hue_4f9ed11c5a724c8fa2a4719b4861e27b_grande.jpg', 10, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (14, N'Pizza Pepperoni - Pizza Xúc xích cay Ý', N' Thành phần:Pizza cơ bản, oliu, xúc xích cay', 155000.0000, 2.5, N'//product.hstatic.net/200000233557/product/v01h01_3a534a35c8834298a52247b2c9c4d75b_grande.png', 10, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (16, N'Pizza Royal', N'Thành phần:Pizza cơ bản, thịt heo hun khói, jăm-bông, oliu, nấm', 157000.0000, 3, N'//product.hstatic.net/200000233557/product/trich_dan_tu_long_co_gai_ngoi_tren_mot_canh_dong__10__ea861c86b6e5400e913c5bd4d8adba10_grande.png', 10, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (17, N'Quattro Stagioni Pizza - Pizza Hải sản', N'Thành phần: Pizza cơ bản + Hải sản, thịt nguội, nấm, ớt xanh.', 155000.0000, 2, N'//product.hstatic.net/200000233557/product/pizzaseafoodpnj_cb54a0b434e745368853ad4a6e8cb3fc_grande.png', 10, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (18, N'SALMON PIZZA', N'B.P+ SALMON, FRESH TOMATO, CAPER, ONION, DILLS', 165000.0000, 1.5, N'//product.hstatic.net/200000233557/product/pizzathapcampnj_370dca8497c34c05be8c6389f0304e2e_grande.png', 10, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (19, N'Supreme Pizza - Pizza Bò', N'Thành phần: Pizza cơ bản, thịt bò, ớt xanh, nấm, jam-bông, oliu', 155000.0000, 1.5, N'//product.hstatic.net/200000233557/product/trich_dan_tu_long_co_gai_ngoi_tren_mot_canh_dong__7__f7799b70be084268be77095841f5c2e3_grande.png', 10, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (20, N'FETTUCCINE  ALFREDO WITH HAM', N'HOMEMADE YELLOW NOODLES WITH CREAM SAUCE, MILK', 127000.0000, 1, N'//product.hstatic.net/200000233557/product/fettucin_alfredo_with_ham_adc73e4c4c704432b8e6deb14f7b6837_grande.jpg', 10, 3)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (22, N'Gnocchi Con Speck - Bánh Ý truyền thống', N'Thành phần: Bánh ý với phomai, thịt xông khói, sốt kem, hành', 125000.0000, 1, N'//product.hstatic.net/200000233557/product/z4136639045482_f793e258224a7c0d38625d3102041f4f_dcce2a2aadbd4f3d885b0a142480ed21_grande.jpg', 10, 3)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (23, N'Lasagne verdi ai Forno - Mỳ Ý đút lò', N'Thành phần: Lasagne Ý truyền thống um thố với bò băm, sốt kem sữa, phomai', 147000.0000, 1, N'//product.hstatic.net/200000233557/product/benz9255_ee59b9d087b34dadbd76631c9206f78d_grande.jpg', 10, 3)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (24, N'Spaghetti aglio e olio - Mỳ Ý Với Dầu Oliu', N'Thành phần: Mỳ Ý, dầu oliu, hành, tỏi, ót đỏ./ With garlic, olive oil', 89000.0000, 1, N'//product.hstatic.net/200000233557/product/z4136639054335_46bf4e91518deb1c5cbff95e622e006e_f2d2afd2e822482faac94083655cc8f7_grande.jpg', 10, 3)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (25, N'Spaghetti Bolognese - Mỳ Ý Bò Băm', N'Thành phần: Mỳ Ý với bò băm, sốt cà chua, hành(Spaghetti with ', 117000.0000, 1, N'//product.hstatic.net/200000233557/product/mi-y-spaghetti-sot-bo-bam__1__cc9d4f10fa20486d974570262fe7011e_grande.jpg', 10, 3)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (26, N'Spaghetti carbonara - Mỳ Ý Sốt Kem', N'Thành phần: Mỳ Ý sốt kem với thịt nguội, trứng, thịt xông khói', 117000.0000, 1, N'//product.hstatic.net/200000233557/product/z4136639052920_759257322c6db5414ac0e67a4f7aba22_71593e920ebc4665b7f703153ef13d54_grande.jpg', 10, 3)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (27, N'Spaghetti pomodoro e basilico - Mỳ Ý Sốt Cà Chua', N'Thành phần: Mỳ Ý với sốt cà chua, hành, lá húng quế', 89000.0000, 1, N'//product.hstatic.net/200000233557/product/3-1200x676-2__1__369563751962481992f9d088b869c899_grande.jpg', 10, 3)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (29, N'Burger with Meat ball  (beef) + Cheese - Burger Bò', N'Thành phần: Bánh mỳ tròn, bò, sốt BBQ, jam-bông', 117000.0000, 1, N'//product.hstatic.net/200000233557/product/z_burger_2vvvvv_1519bf97547048a794fb4d1aa72257c8_grande.jpg', 10, 4)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (32, N'Burger Gà', N'Thành phần: Bánh mì tròn, thịt gà, sốt BBQ, jam-bông, phomai', 117000.0000, 1, N'//product.hstatic.net/200000233557/product/burger_kimchi_0fd6673ad69a41d191117036009f5cf2_master_b74d3412ebcf410e866b536cc39fb077_grande.jpg', 10, 4)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (33, N'sanwich croque monsieur', N'Thành phần: Bánh mỳ, thịt nguội, phomai', 92000.0000, 1, N'//product.hstatic.net/200000233557/product/untitled_design__3__ff6745ef305c4d6aa1fff5e0ceddb4d5_grande.png', 10, 4)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (34, N'Fajita sandwich - Sandwich Gà', N'Thành phần: Bánh mì, gà, phomai', 117000.0000, 1, N'//product.hstatic.net/200000233557/product/z_san_wich_3a8790a48b3e430ba80080e6a1d1cb7a_grande.jpg', 10, 4)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (36, N'Trà Sữa Trân Châu Hoàng Kim', N'Trà sữa đắt tiền', 55000.0000, 1, N'https://images.foody.vn/res/g10/96530/s120x120/4446825d-c380-4292-9715-09953bc1-39e220d1-230316134734.jpeg', 10, 2)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (38, N'Trà Xanh Trân Châu Trái Cây', N'Trà trái cây tươi mát kết hợp cùng Topping trân châu trắng giòn', 64000.0000, 1, N'https://images.foody.vn/res/g10/96530/s120x120/f7d3474e-a703-4dc9-aa40-d2cb793a-1b09bab4-230207160601.jpeg', 10, 2)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (39, N'Xoài Matcha Latte', N'Chỉ được thêm tối đa 01 loại topping', 65000.0000, 1, N'https://images.foody.vn/res/g10/96530/s120x120/f87b1585-539b-4fa0-8292-97caef28-e8ea3e03-230112163708.jpeg', 10, 2)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (40, N'Đào Latte', N'Chỉ được thêm tối đa 01 loại topping', 67000.0000, 1, N'https://images.foody.vn/res/g10/96530/s120x120/f796b036-7877-4dbd-8ae3-925fe4b4-6fdb859d-230112163524.jpeg', 10, 2)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (41, N'Mint Chocolate Milk Tea ', N'Thức uống đã bao gồm trân châu đen và kem sữa', 62000.0000, 1, N'https://images.foody.vn/res/g10/96530/s120x120/61d1ec34-c052-49df-86ee-9fe05758-fb97f89b-221108002429.jpeg', 10, 2)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Weight], [Image], [Ammount], [CategoryId]) VALUES (42, N'Kem tươi vani', N'Kem tươi tự nhiên', 12.0000, 12, N'https://httvietnam.vn/wp-content/uploads/2019/06/kem-vani-768x480.gif', 100, 7)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name], [Description]) VALUES (1, N'Member', N'Người có thể order')
INSERT [dbo].[Role] ([Id], [Name], [Description]) VALUES (2, N'Admin', N'Người quản lý toàn bộ app')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Email], [Password], [Phone], [FirstName], [LastName], [ContactName], [RoleId], [Active]) VALUES (1, N'str1ing@gmail.com', N'123', N'0123456789', N'stri1ng', N'str1ing', N'st1ring', 1, 1)
INSERT [dbo].[User] ([Id], [Email], [Password], [Phone], [FirstName], [LastName], [ContactName], [RoleId], [Active]) VALUES (2, N'user0@gmail.com', N'123', N'1234567890', N'a', N'b', N'abc', 1, 1)
INSERT [dbo].[User] ([Id], [Email], [Password], [Phone], [FirstName], [LastName], [ContactName], [RoleId], [Active]) VALUES (3, N'user1@gmail.com', N'123123', N'0987654321', N'Nguyen', N'Van A', N'Anv', 1, 1)
INSERT [dbo].[User] ([Id], [Email], [Password], [Phone], [FirstName], [LastName], [ContactName], [RoleId], [Active]) VALUES (4, N'admin@admin.com', N'admin123@', N'0123432515', N'abc', N'xyz', N'admin', 2, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Product]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [PizzaLab] SET  READ_WRITE 
GO
