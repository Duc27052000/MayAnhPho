USE [master]
GO
/****** Object:  Database [MayAnhPhoDB]    Script Date: 17/05/2022 6:03:24 CH ******/
CREATE DATABASE [MayAnhPhoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MayAnhPhoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MayAnhPhoDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MayAnhPhoDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MayAnhPhoDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MayAnhPhoDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MayAnhPhoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MayAnhPhoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MayAnhPhoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MayAnhPhoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MayAnhPhoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MayAnhPhoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MayAnhPhoDB] SET  MULTI_USER 
GO
ALTER DATABASE [MayAnhPhoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MayAnhPhoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MayAnhPhoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MayAnhPhoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MayAnhPhoDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MayAnhPhoDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MayAnhPhoDB', N'ON'
GO
ALTER DATABASE [MayAnhPhoDB] SET QUERY_STORE = OFF
GO
USE [MayAnhPhoDB]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 17/05/2022 6:03:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[cateID] [int] IDENTITY(1,1) NOT NULL,
	[cateName] [nvarchar](100) NULL,
	[catePhoto] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 17/05/2022 6:03:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[cusPhone] [varchar](20) NOT NULL,
	[cusFullName] [nvarchar](200) NULL,
	[cusEmail] [varchar](100) NULL,
	[cusAddress] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[cusPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nguoidung]    Script Date: 17/05/2022 6:03:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nguoidung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[Hoten] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Dienthoai] [nchar](10) NULL,
	[Matkhau] [varchar](50) NULL,
	[IDQuyen] [int] NULL,
	[Diachi] [nvarchar](100) NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 17/05/2022 6:03:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderID] [varchar](20) NOT NULL,
	[proID] [varchar](50) NOT NULL,
	[ordtsQuantity] [int] NULL,
	[ordtsThanhTien] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 17/05/2022 6:03:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [varchar](20) NOT NULL,
	[cusPhone] [varchar](20) NULL,
	[orderMessage] [nvarchar](max) NULL,
	[orderDateTime] [varchar](50) NULL,
	[orderStatus] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 17/05/2022 6:03:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[IDQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](20) NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[IDQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producers]    Script Date: 17/05/2022 6:03:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producers](
	[pdcID] [int] IDENTITY(1,1) NOT NULL,
	[pdcName] [nvarchar](100) NULL,
	[pdcPhone] [varchar](20) NULL,
	[pdcEmail] [varchar](50) NULL,
	[pdcAddress] [nvarchar](max) NULL,
	[pdcPhoto] [nvarchar](max) NULL,
	[pdcInfo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[pdcID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 17/05/2022 6:03:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[proID] [varchar](50) NOT NULL,
	[pdcID] [int] NULL,
	[typeID] [int] NULL,
	[proName] [nvarchar](200) NULL,
	[proPrice] [int] NULL,
	[proDiscount] [int] NULL,
	[proQuantity] [int] NULL,
	[proPhoto] [nvarchar](max) NULL,
	[proUpdateDate] [varchar](50) NULL,
	[proDescription] [nvarchar](max) NULL,
	[proImportPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 17/05/2022 6:03:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[typeID] [int] IDENTITY(1,1) NOT NULL,
	[cateID] [int] NULL,
	[typeName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rates]    Script Date: 17/05/2022 6:03:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rates](
	[proID] [varchar](50) NOT NULL,
	[rateStar] [int] NULL,
 CONSTRAINT [PK_Rates] PRIMARY KEY CLUSTERED 
(
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([cateID], [cateName], [catePhoto]) VALUES (1, N'Máy ảnh', N'/Image/img-box1.jpg')
INSERT [dbo].[Categories] ([cateID], [cateName], [catePhoto]) VALUES (2, N'Ống kính', N'/Image/Canon-70-200-non-IS.jpg')
INSERT [dbo].[Categories] ([cateID], [cateName], [catePhoto]) VALUES (3, N'Phụ kiện', N'/Image/img-box3.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567891', N'Nguyễn Thị A', N'a@gmail.com', N'Nhà A')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567892', N'Nguyễn Thị B', N'b@gmail.com', N'Nhà B')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567893', N'Nguyễn Thị C', N'c@gmail.com', N'Nhà C')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567894', N'Nguyễn Thị D', N'd@gmail.com', N'Nhà D')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'01234567895', N'Nguyễn Thị E', N'e@gmail.com', N'Nhà E')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'03333333333', N'Phạm Minh Đức', N'ducsoshi2000@gmail.com', N'HN')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'0339619817', N'Phạm Minh Đức', N'ducsoshi2000@gmail.com', N'HN')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'123', N'Test', N't@t', N'hn')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'12312312313', N'test', N'test@test', N'test')
INSERT [dbo].[Customers] ([cusPhone], [cusFullName], [cusEmail], [cusAddress]) VALUES (N'1233333', N'FFF', N'nhienkto2006@gmail.com', N'FWERS')
GO
SET IDENTITY_INSERT [dbo].[Nguoidung] ON 

INSERT [dbo].[Nguoidung] ([MaNguoiDung], [Hoten], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (14, N'Pham Minh Duc', N'Admin@gmail.com', N'6666666666', N'1', 2, N'Hà Nội')
INSERT [dbo].[Nguoidung] ([MaNguoiDung], [Hoten], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (15, N'Pham Minh Duc', N'test@gmail.com', N'6666666666', N'1', 1, N'Hà Nội')
INSERT [dbo].[Nguoidung] ([MaNguoiDung], [Hoten], [Email], [Dienthoai], [Matkhau], [IDQuyen], [Diachi]) VALUES (16, N'Phạm Minh Đức', N'Khach@gmail.com', N'6666666666', N'1', 1, N'Hà Nội')
SET IDENTITY_INSERT [dbo].[Nguoidung] OFF
GO
INSERT [dbo].[OrderDetails] ([orderID], [proID], [ordtsQuantity], [ordtsThanhTien]) VALUES (N'HD0', N'BV003', 1, 280000)
GO
INSERT [dbo].[Orders] ([orderID], [cusPhone], [orderMessage], [orderDateTime], [orderStatus]) VALUES (N'HD0', N'0339619817', N'Dán kính', N'17/04/2022 5:12:04 CH', N'0')
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([IDQuyen], [TenQuyen]) VALUES (1, N'Member')
INSERT [dbo].[PhanQuyen] ([IDQuyen], [TenQuyen]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[Producers] ON 

INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (1, N'Canon', N'000000000', N'Canon@gmail.com', N'TpHN', N'/Image/canon-logo.jpg', N'Google.com/canon')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (2, N'Fujifilm', N'1111111111', N'Fujifilm@gmail.com', N'TpHN', N'/Image/fuji-logo.png', N'Google.com/fujifilm')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (3, N'Nikon', N'222222222', N'Nikon@gmail.com', N'TpHN', N'/Image/nikon-logo.png', N'google.com/nikon')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (4, N'Sony', N'333333333', N'Sony@gmail.com', N'TpHN', N'/Image/logo-sony.jpg', N'google.com/sony')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (5, N'Lumix', N'444444444', N'Lumix@gmail.com', N'TpHN', N'/Image/lumix-logo.jpg', N'google.com/lumix')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (6, N'Panasonic', N'555555555', N'Panasonic@gmail.com', N'TpHN', N'/Image/panasonic-logo.jpg', N'google.com/panasonic')
INSERT [dbo].[Producers] ([pdcID], [pdcName], [pdcPhone], [pdcEmail], [pdcAddress], [pdcPhoto], [pdcInfo]) VALUES (7, N'Olympus', N'666666666', N'Olympus@gmail.com', N'TpHN', N'/Image/olympus-logo.png', N'google.com/olympus')
SET IDENTITY_INSERT [dbo].[Producers] OFF
GO
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'AS001', 6, 15, N'Bóng đèn Led 80W', 200000, 0, 100, N'/Image/bong-den-led-80w.png', N'27/04/2022 4:27:17 CH', N'Độ màu trắng tiêu chuẩn cho chụp ảnh ánh sáng trắng liên tục
Khử được màu sắc tốt, các vùng tối được triệt tiêu một cách tự nhiên
Tiết kiệm năng lượng 80% so với bóng đèn thông thường.', 100000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'AS002', 6, 15, N'Bowens Gemini 750 Pro (used)', 2500000, 0, 100, N'/Image/bowens-gemini-750-pro-used.png', N'27/04/2022 4:27:52 CH', N'Tùy chọn kích hoạt radio Plug-in Có
Có đa điện áp
Quạt làm mát
Nhiệt độ màu 5600K (± 300K)
Flash ức chế mạch Có
Đồng bộ điện áp 5V DC
Số hướng dẫn (m / 100 ISO) 104
Thời lượng đèn flash (t = 0,5) 1/2300
Thời gian tái chế (100%) 1,5 giây
Độ chính xác 1/10 điểm dừng', 1500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'AS003', 6, 15, N'Chân đèn & softbox (loại chân nhỏ)', 300000, 0, 100, N'/Image/chan-den-softbox-loai-chan-nho.png', N'27/04/2022 4:28:22 CH', N'Dễ dàng sử dụng
An toàn tuyệt đối
Thiết kế hiện đại
Độ bền cao', 200000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'AS004', 1, 15, N'Flash Canon 580 EX II', 3000005, 0, 100, N'/Image/flash-canon-580-ex-ii.png', N'27/04/2022 4:28:46 CH', N'Chỉ số Guide Number: 58m (tại 105mm, ISO 100)
Số lần Flash với Pin Alkaline: 100-700
Thời gian trễ giữa 2 lần Flash: 0.1-6 giây(Pin Alkaline)
Đèn hỗ trợ AF: Built-in, khoảng hoạt động 0.6-10m 
Mười bốn chế độ Flash được cài đặt sẵn 
Sử dụng 04 Pin AA', 2000005)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'BL001', 4, 23, N'Túi AERFEIS', 480000, 0, 95, N'/Image/tui-aerfeis.png', N'27/04/2022 4:43:11 CH', N'Túi đựng máy ảnh hãng Aerfeis thiết kế chắc chắn, hiện đại
Bao gồm 3 ngăn chính, có đệm lót rất dày
có thêm 4 ngăn phụ để đựng phụ kiện như nắp, cap, pin, sạc
Có dây đeo dày chống mỏi vai', 380000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'BL002', 1, 23, N'Túi canon cơ bản', 250000, 0, 97, N'/Image/tui-canon-co-ban.png', N'27/04/2022 4:43:37 CH', N'Chính hãng Canon 
Gọn gàng, nhẹ nhàng 
Bền đẹp , chắc chắn ', 150000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'BV001', 5, 22, N'Dây máy ảnh thời trang', 149000, 0, 100, N'/Image/day-may-anh-thoi-trang.png', N'27/04/2022 4:41:26 CH', N'Chất liệu bền và an toàn, tiện dụng, dễ thao tác
Gắn được với nhiều loại máy ảnh khác nhau bao gồm DSLR, mirrorrless và compact
', 49000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'BV002', 5, 22, N'Filter KENKO 49', 80000, 0, 100, N'/Image/filter-kenko-49.png', N'27/04/2022 4:41:49 CH', N'Chống trầy xước thấu kính 
Chống bụi bẩn 
Hấp thụ ánh sáng tốt hơn 
Khử bỏ tia cực tím', 70000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'BV003', 4, 22, N'filter K&F MCUV 49mm', 280000, 0, 98, N'/Image/filter-k-f-mcuv-49mm.png', N'27/04/2022 4:42:20 CH', N'Chất liệu kính quang học cao cấp 
Chống trầy xước 
Chống bụi bẩn 
Giảm thiểu tình trạng flare, giúp ảnh tương phản và chi tiết hơn', 180000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'CM001', 3, 18, N'Chân máy Benro T800EX', 6000000, 0, 100, N'/Image/chan-may-benro-t880ex.png', N'27/04/2022 4:33:03 CH', N'Số đoạn: 4, Số chân: 3
Chiều cao tối đa: 1450mm
Chiều cao khi thu gọn: 485mm
Khả năng chịu lực: 3Kg
Màu sắc: Đen
Chất liệu: Kim loại nhôm', 5000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'CN001', 1, 1, N'Máy ảnh Canon 1Dx', 25000000, 2, 99, N'/Image/canon-eos-1dx-body.png', N'07/05/2022 8:38:09 CH', N'Cảm biến CMOS Full Frame 18.1MP
Bộ xử lý hình ảnh Dual DIGIC 5+
Màn hình LCD ClearView II 3.2" 1.04m-Dot
ISO : Auto, 100-51200 (Mở rộng : 50-204800)
Tốc độ màn trập : 30 - 1/8000
Video Recording : 1920 x 1080 (Full HD), 1280 x 720, 640 x 480
Quay phim Full HD 1080p tại 30fps
Hệ thống lấy nét 61 điểm
Tốc độ chụp 12fps RAW+JPEG, 14fps JPEG
Thiết kế bằng hợp kim Magie
', 15000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'CN002', 1, 1, N'Canon EOS 200D Mark II', 12500000, 0, 100, N'/Image/canon-eos-200d-mark-ii-6.png', N'27/04/2022 3:49:15 CH', N'Cảm biến CMOS 24.1MP và bộ xử lý hình ảnh DIGIC 8
Dual Pixel CMOS AF
Hỗ trợ chụp ảnh selfie
ISO mạnh mẽ từ 100 - 25.600
Máy ảnh Canon EOS 200D Mark II được đánh giá là một trong những máy ảnh DSLR nhẹ nhất của Canon. Dù trọng lượng của thân máy ảnh chỉ nặng 402g nhưng máy ảnh vẫn được trang bị đầy đủ các tính năng, hỗ trợ người dùng chụp ảnh và quay video tốt nhất.', 10000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'CN003', 1, 1, N'Canon 850D', 18500000, 0, 100, N'/Image/canon-eos-850d-body-2.png', N'27/04/2022 3:50:09 CH', N'5 trục Digital chống rung, ổn định
Cảm biến CMOS APS-C 24.1MP/Bộ xử lý Digic 8
Kết nối Wifi và Bluetooth
Quay phim 4K UHD 25fps
Canon EOS 850D là mẫu máy ảnh hoàn hảo cho những nhiếp ảnh gia chuyên nghiệp. Theo đó, máy ảnh DSLR này kết hợp cảm biến CMOS APS-C 24,1MP với chế độ quay 4K chuyên nghiệp. Trên kính ngắm có tất cả 45 điểm lấy nét, màn hình live view sử dụng Dual Pixel CMOS AF. ', 15500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'CN004', 1, 1, N'Canon M200', 8000000, 0, 100, N'/Image/canon-m200-den.png', N'27/04/2022 3:51:38 CH', N'Cảm biến APS-C CMOS 24MP
- Bộ xử lý hình ảnh DIGIC 8
- Màn hình LCD cảm ứng 3" 1.04 triệu điểm, lật lên 180 độ
- Quay phim 4K lên đến 25 fps
- Hệ thống lấy nét tự động Dual Pixel CMOS AF
- ISO 100-25600 (mở rộng đến 51200)', 7000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'DT001', 6, 19, N'Đầu đọc CF ios', 4500000, 0, 100, N'/Image/dau-doc-cf-ios.png', N'27/04/2022 4:33:56 CH', N'Sử dụng cho hệ điều hành IOS 
Dây cap bền đẹp 
Truyền dẫn dữ liệu siêu nhanh', 3500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'DT002', 6, 19, N'Đầu đọc CF type C', 4500000, 0, 100, N'/Image/dau-doc-cf-type-c.png', N'27/04/2022 4:35:07 CH', N'Truyền dẫn dữ liệu siêu nhanh
Dây dẫn kết nối siêu bền', 3500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'DT003', 6, 19, N'Đầu đọc thẻ 3.0', 3500000, 0, 100, N'/Image/dau-doc-the-3-0.png', N'27/04/2022 4:35:35 CH', N' Loại sản phẩm: Đầu đọc thẻ đa năng All-In-One
Chuẩn kết nối: MicroSDHC, MicroSDXC, SDHC, SDXC, CF.
Chất liệu: Nhựa
Tốc độ: USB 3.0
Jack kết nối: USB port', 2500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'FJ001', 2, 2, N'Fujifilm X-A7', 8500000, 5, 98, N'/Image/fujifilm-x-a7-dark-silver.png', N'27/04/2022 3:53:03 CH', N'Cảm biến: APS-C CMOS Sensor 24.2MP
Màn hình: LCD cảm ứng 3.5", 2.76m-Dot, xoay lật
Dải ISO: 200-12800 (mở rộng từ 100-51200)
Quay video UHD 4K và Full HD
Chụp tối đa 6 khung hình/giây
Tích hợp hệ thống Hybrid AF
Kết nối Bluetooth và Wi-Fi
Kích thước: 119 x 67.7 x 41.1 mm
Trọng lượng: 320g', 7500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'FJ002', 2, 2, N'Fujifilm X-T4', 39000000, 0, 99, N'/Image/fuji-xt4-2.png', N'27/04/2022 3:54:01 CH', N'Ổn định hình ảnh trong thân máy 5 trục, 6.5 bước
Intelligent Hybrid AF, 425 điểm theo pha
Màn hình cảm ứng LCD 3.0" 1.62 triệu điểm
EVF OLED 0.5", 3.69 triệu điểm, phóng đại 0.75x
Quay phim DCI/UHD 4K60, Full HD 240 fps
Chụp liên tiếp 30 fps (màn trập điện tử, crop 1.25x)
ISO160-12800 (mở rộng 80-51200)
18 chế độ giả lập phim
Tích hợp Wi-Fi, Bluetooth', 29000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'FJ003', 2, 2, N'FUJIFILM X-A5', 5000000, 0, 99, N'/Image/may-anh-fujifilm-x-a5.png', N'27/04/2022 3:54:36 CH', N'Cảm biến: APS-C
Dải ISO: 200 to 12800 (Mở rộng lên 100 - 51200)
Độ phân giải: 24.2MP
Kết nối không dây: WiFi, bluetooth
Máy ảnh Fujifilm X-A5  với thiết kế thời thượng, sang trọng, không chỉ là một công cụ chụp ảnh chất lượng mà còn là một món phụ kiện thời trang vô cùng ấn tượng. Dòng máy ảnh kèm lens kit thiết kế dành cho cả những người mới tập tành nhiếp ảnh và nhiếp ảnh gia chuyên nghiệp.', 4000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'FJ004', 2, 2, N'Fujifilm X-T20', 10200000, 0, 99, N'/Image/xt20-1855.png', N'27/04/2022 3:55:20 CH', N'- Cảm biến APS-C X-Trans CMOS III 24.3MP
- Bộ xử lý hình ảnh X-Processor Pro
- Màn hình cảm ứng TFT LCD 3" 1.04 triệu điểm ảnh
- Ống ngắm điện tử OLED kích thước 0.39" 2,36MP
- ISO 51200, tốc độ chụp 14fps
- Khả năng quay video 4K UHD 
- Khả nang kết nối wifi
- 91 điểm lấy nét với chế độ AF-C
- Tương thích thẻ nhớ SD, SHHC, SDXC, UHS-II', 9200000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'GB001', 4, 14, N'Gimbal Zhiyun Smooth X', 1300000, 0, 100, N'/Image/gimbal-zhiyun-smooth-x.png', N'27/04/2022 4:26:21 CH', N'Tải trọng: 200g
Kích thước Điện thoại: 50 - 90 mm
Thiết kế gập gọn thông minh và khả năng kéo dài thêm 26 cm
Thời lượng pin: 5.5 giờ
Thời gian sạc: 3 giờ
Số lượng trục: 2 trục (Roll, Yaw)
Cổng kết nối: Type-C
Trọng lượng: 246g', 1000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'MC001', 5, 16, N'Mic Rode Wireless Go', 5000000, 0, 100, N'/Image/mic-rode-wireless-go.png', N'27/04/2022 4:30:15 CH', N'Tích hợp micro đa hướng và input micro 3.5mm
Bộ phát clip-on nhỏ nhất
Bộ thu clip-on nhỏ nhất
Thiết lập dễ dàng không cần menu
3 thiết lập chỉnh gain
Pin 7 tiếng có thể sạc lại qua USB
Màn hình LCD sáng, nhiều thông tin
Hiển thị thời lượng pin và mức độ âm thanh
Lên đến 8 micro cùng một set / Phạm vi 230''', 4000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'NK001', 3, 3, N'Nikon D750', 21000000, 4, 98, N'/Image/nikon-d750.png', N'27/04/2022 4:00:08 CH', N'Cảm biến: Full-Frame
Dải ISO: 100 - 12800 (mở rộng 50 - 51200)
Độ phân giải: 24.3MP
Kết nối không dây: WiFi
Nikon D750 là một trong những dòng máy ảnh Full Frame tốt nhất trong phân khúc tầm trung. Với mức giá hợp lý, đây có thể là sự lựa chọn khá phù hợp đối với những người mới cũng như những nhiếp ảnh gia bán chuyên.', 11000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'NK002', 3, 3, N'Nikon D3100', 2000000, 4, 98, N'/Image/nikon-d3100.png', N'27/04/2022 4:00:57 CH', N'- Cảm biến ảnh DX CMOS 14.2 Megapixels
- Bộ xử lý ảnh EXPEED II, ISO cao nhất tới 12,800
- Hệ thống lấy nét tự động 3D-tracking AF 11 điểm
- Hệ thống đo sáng Active D-Lighting thế hệ mới nhất
- Quay phim Full-HD 1080p với hiệu ứng Cinematic
- Tích hợp hai hệ thống tự động làm sạch cảm biến
- Màn hình Live View 3” độ phân giải 230,000 điểm ảnh', 1000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'NK003', 3, 3, N'Nikon D3300', 3500000, 0, 100, N'/Image/nikon-d3300.png', N'27/04/2022 4:01:30 CH', N'- Bộ vi xử lý hình ảnh EXPEED 4
- Độ phân giải 24.2 megapixe
- Tốc độ màn chập 1/4000 - 30 giây
- Tốc độ chụp 5 ảnh/giây
- 11 điểm lấy nét
- ISO 100 đến 6400 (mở rộng 25600)
- Quay phim Full HD
- Sử dụng Pin EN-EL14

Dòng máy ảnh Nikon D3300 có chất lượng ảnh sắc nét, nhỏ gọn dễ sử dụng, Là dòng máy phù hợp với người mới chơi, thích hợp với thể loại ảnh phong cảnh.', 2500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'NK004', 3, 3, N'Nikon D7100', 7500000, 0, 100, N'/Image/nikon-d7100.png', N'27/04/2022 4:02:06 CH', N'Bộ xử lý hình ảnh EXPEED 3
Cảm biến AF 51 điểm Multi-CAM 3500DX
Cảm biến CMOS định dạng DX 24.1 MP
Màn hình LCD 3.2 inch
Máy ảnh Nikon D7100 là máy ảnh DSLR có hiệu suất hoạt động cao với khả năng chụp ảnh chất lượng và quay video full HD. D7100 được làm bằng hợp kim magie đem đến sự chắc chắn và độ bền trong quá trình sử dụng. Có khả năng chống bụi và chống chịu thời tiết.', 6500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'OCN01', 1, 8, N'Canon EF 85mm f/1.8 USM', 5500000, 0, 100, N'/Image/Canon-EF-85mm-f1.8-USM.png', N'27/04/2022 4:13:43 CH', N'Ngàm EF định dạng Full frame
Khẩu độ f/1.8-22
1 thấu kính Fluorite và 5 thấu kính UD
Động cơ lấy nét tự động Ultrasonic  ', 4500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'OCN02', 1, 8, N'Canon EF-S 55-250mm f/4-5.6 IS STM', 2800000, 0, 100, N'/Image/Canon-EF-S-55-250mm-f4-5.6-IS-STM.png', N'27/04/2022 4:14:13 CH', N'Ngàm EF-S định dạng APS-C
Khẩu độ f/4-5.6
Thấu kính tán xạ ED
Động cơ lấy nét tự động Ultrasonic  
Ổn định hình ảnh quang học IS
7 lá khẩu tròn ', 1800000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'OCN03', 1, 8, N'Canon EF-S 35mm f/1.4', 8800000, 0, 100, N'/Image/Sigma-35mm-f-1.4-DG-HSM-ART.png', N'27/04/2022 4:15:13 CH', N'Ngàm EF định dạng Full frame
Khẩu độ f/1.4-16
13 thấu kính chia làm 11 nhóm
Tráng phủ Super Multi-Layer Coating
Động cơ lấy nét tự động Hyper Sonic
Khoảng cách lấy nét tối thiểu 30cm
9 lá khẩu tròn', 7800000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'ONK01', 3, 10, N'Nikon 50mm F1.4 DG HSM ART', 10000000, 0, 100, N'/Image/nikon-af-s-35mm-f-1-4g-nano.png', N'27/04/2022 4:16:18 CH', N'Cấu tạo ống kính: 13 thấu kính thuộc 8 nhóm
Góc nhìn ngang: 46.8º
Số lá màn chập: 9
Khoảng lấy nét nhỏ nhất: 0.40 m
Độ phóng đại lớn nhất: 0.18x
Đường kính Filter: ø 77mm
Trọng lượng : 815g
Dành cho máy ảnh định dạng fullframe', 9000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'ONK02', 3, 10, N'Nikon AF-S 35mm f/1.8 G', 33000000, 0, 100, N'/Image/nikon-af-s-35mm-f-1-8-g.png', N'27/04/2022 4:16:48 CH', N'Ngàm F định dạng DX
Khẩu độ f/1.8-22
Tráng phủ Super Integrated
Động cơ lấy nét tự động Silent Wave Motor
Hệ thống lấy nét sau Rear Focusing
Trình lấy nét thủ công ghi đè toàn thời gian
7 lá khẩu tròn', 23000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'ONK03', 3, 10, N'Nikon AF-S 70-300mm f/4.5-5.6 G ED VR', 35000000, 0, 100, N'/Image/nikon-af-s-70-300mm-f-4-5-5-6-g-ed-vr.png', N'27/04/2022 4:17:14 CH', N'Ngàm F định dạng FX
Khẩu độ f/4.5-32
2 thấu kính ED
Tráng phủ Super Integrated
Động cơ lấy nét tự động Silent Wave Motor
Hệ thống ổn định hình ảnh VR II
Hệ thống lấy nét trong IF
Trình lấy nét thủ công ghi đè toàn thời gian
9 lá khẩu tròn', 25000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'OSM01', 1, 12, N'Sigma 17-50mm f/2.8 EX DC OS HSM', 5800000, 0, 100, N'/Image/sigma-17-50mm-f-2-8-ex.png', N'27/04/2022 4:21:22 CH', N'Ngàm EF định dạng APS-C
Khẩu độ f/2.8-22
17 thấu kính chia làm 13 nhóm
Tráng phủ Super Multi-Layer Coating
Động cơ lấy nét tự động Hyper Sonic
Ổn định hình ảnh quang học
Khoảng cách lấy nét tối thiểu 28cm
7 lá khẩu tròn', 4800000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'OSM02', 4, 12, N'Sigma 30mm f/2.8 EX DN', 3800000, 0, 100, N'/Image/sigma-30-1.png', N'27/04/2022 4:21:54 CH', N'Không có mô t?', 2800000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'OSM03', 1, 12, N'Sigma 35mm F1.4 DG HSM Art', 9500000, 0, 100, N'/Image/Sigma-35mm-f1.4.png', N'27/04/2022 4:22:29 CH', N'Ngàm EF định dạng Full frame
Khẩu độ f/1.4-16
13 thấu kính chia làm 11 nhóm
Tráng phủ Super Multi-Layer Coating
Động cơ lấy nét tự động Hyper Sonic
Khoảng cách lấy nét tối thiểu 30cm
9 lá khẩu tròn', 8500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'OSM04', 3, 12, N'Sigma 50mm F1.4 DG HSM ART', 10000000, 0, 100, N'/Image/sigma-50mm-f-1-4-ex.png', N'27/04/2022 4:23:06 CH', N'Cấu tạo ống kính: 13 thấu kính thuộc 8 nhóm
Góc nhìn ngang: 46.8º
Số lá màn chập: 9
Khoảng lấy nét nhỏ nhất: 0.40 m
Độ phóng đại lớn nhất: 0.18x
Đường kính Filter: ø 77mm
Trọng lượng : 815g
Dành cho máy ảnh định dạng fullframe', 9000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'OSN01', 3, 11, N'7Artisans 50mm F0.95', 5500000, 0, 100, N'/Image/7artisans-50mm-f0-95-aps-c-e-mount-lens.png', N'27/04/2022 4:18:45 CH', N'Khẩu độ tối đa f / 0.95 nhanh phù hợp làm việc trong điều kiện ánh sáng yếu.
Ống kính sử dụng kính của HOYA chất lượng cao, với màu sắc tươi độ chi tiết cao
Tương thích với các ngàm Sony E, Fujifilm X, Canon EOS M, Nikon Z và ngàm M4/3.', 4500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'OSN02', 3, 11, N'Samyang 12mm F2 NCS For Sony E', 4000000, 0, 100, N'/Image/Samyang-12mm-F2-NCS-For-Sony-E.png', N'27/04/2022 4:19:17 CH', N'Ống kính ngàm Sony E-Mount (APS-C)
Tiêu cự 18mm ( theo định dạng 35mm)
Khẩu độ :  f/2 - f/22
Thấu kính phi cầu và thấu kính H-ASP
Thấu kính tán xạ cực thấp ED', 3000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'OSN03', 3, 11, N'Sony E 16-70mm F4 ZA OSS', 10500000, 0, 100, N'/Image/Sony-E -6-70mm-F4-ZA-OSS.png', N'27/04/2022 4:19:47 CH', N'Ngàm E định dạng APS-C
Khẩu độ f/4-22
4 thấu kính phi cầu và 1 thấu kính ED
Tráng phủ Zeiss T* Anti-Reflective
Động cơ lấy nét tự động tuyến tính và lấy nét trong
Ổn định hình ảnh quang học Optical SteadyShot
Khoảng cách lấy nét tối thiểu 13.8"
7 lá khẩu tròn', 9500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'OSN04', 3, 11, N'Sony FE 28mm f/2', 5500000, 0, 100, N'/Image/Sony-FE-28mm-f2.png', N'27/04/2022 4:20:16 CH', N'Ngàm E định dạng Full frame
 Khẩu độ f/2-22
Động cơ lấy nét tự động tuyến tính và lấy nét trong
Thiết kế chống bụi, chống ẩm
Ống chuyển mắt cá và góc rộng tùy chọn', 4500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'OTR01', 4, 13, N'Tamron 28-75mm f/2.8 Di III RXD', 14000000, 0, 100, N'/Image/tamron-28-75mm-f-2-8-di-iii-rxd.png', N'27/04/2022 4:23:50 CH', N'Ngàm E định dạng Full frame và APS-C
Khẩu độ f/2.8-22
15 thấu kính chia làm 12 nhóm
Tráng phủ Fluorine
Động cơ lấy nét tự động chuyển động bước RXD
Thiết kế chống ẩm
9 lá khẩu tròn', 13000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'OTR02', 1, 13, N'Tamron AF 70-300mm F/4-5.6 Di LD Macro', 1400000, 0, 100, N'/Image/tamron-af-70-300mm-f-4-5-6-di-ld.png', N'27/04/2022 4:24:22 CH', N'Hệ cảm biến: Full-frame
Loại ống kính: Tele-photo
Ngàm: Canon EF, Nikon F, Sony A, Pentax
Cấu tạo ống kính: 13 thấu kính thuộc 9 nhóm
Góc nhìn: 34° - 8°
Số lá màn chập: 9
Khoảng lấy nét nhỏ nhất: 0.95 m
Độ phóng đại lớn nhất: 0.5x
Đường kính Filter: ø62mm
Trọng lượng: 435g', 1000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'OTR03', 1, 13, N'Tamron SP AF 70-300mm F4-5.6 Di VC', 3000000, 0, 100, N'/Image/tamron-af-70-300mm-f-4-5-6-di-ld-macro-for-canon.png', N'27/04/2022 4:24:51 CH', N'Cấu tạo ống kính: 17 thấu kính thuộc 12 nhóm
Lấy nét cực nhanh với Môtơ siêu nhanh và vận hành siêu êm
Hệ thống chống rung
Khoảng lấy nét nhỏ nhất: 1.5m
Độ phóng đại lớn nhất: 1:3.9
Đường kính Filter: ø62', 2000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'PI001', 1, 20, N'Sạc Canon LPE6', 3800000, 0, 100, N'/Image/pin-canon-lpe6.png', N'27/04/2022 4:39:04 CH', N'Hãng sản xuất : Canon
Tên Sản phẩm: Pin Canon LP-E6
Dùng cho: Canon 5D II, 5D III, 60D, 70D, 7D
Dung lượng Pin: 1800mAh
Khả năng chụp: 850 tấm hình', 2800000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'PI002', 1, 20, N'Pin Canon Lpe6', 3800000, 0, 100, N'/Image/pin-canon-lpe6.png', N'27/04/2022 4:37:04 CH', N'Chất liệu: Lithium-ion
Dung lượng Pin: 1865mAh
Volt (điện thế): 7.4V
Kích thước: 5.6 x 2.0 x 3.8 cm
Pin Canon LP-E6N phù hợp với các máy : 
Canon 60D, Canon 70D, Canon 80D
Canon 6D, Canon 6D Mark II
Canon 5D II, Canon 5D Mark III, Canon 5Ds, Canon 5DsR, Canon 5D IV', 2800000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'PI003', 3, 20, N'Sạc Nikon MH25', 3500000, 0, 100, N'/Image/sac-nikon-mh25.png', N'27/04/2022 4:37:31 CH', N'Điện áp đầu vào: AC 100 ~ 240 V 50 ~ 60Hz
Điện áp đầu ra: DC8.4V 600mA
Kích thước: mét 82.55*38*44.45/3.3*1.5 * 1.8 inch (L * W * H)
Mục trọng lượng: 64 gam/2.3 oz
Kích thước gói: 87*50*46 mm/3.4*2.0 * 1.8 inch (L * W * H)
Trọng lượng gói: 75 gam/2.6 oz', 2500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'SN001', 4, 4, N'Sony A7II', 16500000, 2, 100, N'/Image/a72.png', N'27/04/2022 4:03:22 CH', N'Cảm biến CMOS Exmor Full frame 24.3MP
Bộ xử lý hình ảnh BIONZ X
Màn hình LCD TFT xoay lật 3.0" 1,228k-Dot
Kính ngắm điện tử OLED 2.4m-Dot
Quay phim Full HD lên đến 60fps
Tốc độ chụp liên tiếp lên đến 5fps
ISO 100-6400 (mở rộng đến 12800)
Tích hợp kết nối Wi-Fi với NFC', 15500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'SN002', 4, 4, N'Sony A6500', 16500000, 0, 100, N'/Image/a6500.png', N'27/04/2022 4:03:55 CH', N'Cảm biến 24.2MP APS-C
Bộ xử lý ảnh BIONZ X
Kính ngắm điện tử XGA Tru-Finder 2,36m dot OLED
Màn hình LCD xoay lật, cảm ứng 3.0" 921.6k-Dot
Quay video 4K
Chống rung 5 trục thân máy
Tốc độ chụp liên tục 11 fps
425 điểm lấy nét', 15500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'SN003', 4, 4, N'Sony RX100 Mark V', 9500000, 0, 100, N'/Image/rx-100-mark-v.png', N'27/04/2022 4:04:43 CH', N'Cảm biến CMOS BSI Exmor R 20.1MP
Bộ xử lý hình ảnh BIONZ X và chip ngoại vi Front-End LSI
Màn hình LCD 3" 1.23m-Dot, có thể xoay lật 180°
Quay phim UHD 4K với S-Log2 Gamma
Tốc độ chụp liên tiếp lên đến 24fps
Tích hợp kết nối Wi-Fi với NFC
Ống kính ZEISS Vario-Sonnar T* f/1.8-2.8 24-70mm (tương đương 35mm)
Kích thước : 101.6 x 58.1 x 41.0 mm
Trọng lượng : 299Gram', 8500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'SN004', 4, 4, N'Sony ZV-E10', 19500000, 0, 100, N'/Image/sony-zv-e10.png', N'27/04/2022 4:05:13 CH', N'Cảm biến: Exmor CMOS, loại APS-C (23,5 x 15,6 mm)
ISO: 100-32000, mở rộng lên 50 đến 51200
Số lượng điểm ảnh (hiệu dụng): 24,2 MP
Với 425 điểm lấy nét theo pha bao phủ 84%
Màn hình LCD cảm ứng 3 inch, Full View, xoay lật 180°
Chống rung quang học
Tự động nhận diện khuôn mặt
Đầu ra tai nghe 3,5 mm tiêu chuẩn', 18500000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'TN001', 7, 17, N'Thẻ nhớ Compact Flash CF 8GB', 3000000, 0, 100, N'/Image/the-nho-compact-flash-cf-8gb.png', N'27/04/2022 4:31:30 CH', N'Loại sản phẩm: Thẻ máy ảnh CF (CompactFlash)
Dung lượng: 8 GB
Tốc độ đọc: 50 MB/s
', 2000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'TN002', 4, 17, N'Thẻ Nhớ SDXC Sony 64GB 94MB/s', 8000000, 0, 100, N'/Image/the-nho-sdxc-sony-64gb-94mb-s.png', N'27/04/2022 4:32:04 CH', N'Dung lượng 64GB
Truyền tải tốc độ cao lên đến 94MB/s (tốc độ đọc)
Khả năng chống nước, chống shock, chống tia x-ray và nhiệt độ hoạt động trong phạm vi rộng
Miễn phí tải phần mềm (Memory Card File Rescue hỗ trợ định dạng 3D và AVCHD files & x-Pict Story for Memory Card)
SDXC UHS-I Class 10', 7000000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'TU001', 3, 21, N'Tủ chống ẩm Andbon AB-30C - 30L', 1500000, 0, 100, N'/Image/tu-chong-am-andbon-ab-30c-30l.png', N'27/04/2022 4:40:00 CH', N'Hút ẩm hiệu quả yên tĩnh, khử ẩm hiệu quả nhanh
Tiêu thụ điện năng ít hơn, không có tiếng ồn
Bề mặt tủ làm bằng thép không gỉ
Toàn bộ tủ được sơn tĩnh điện 2 lớp màu đen
Thiết kế cửa thủy tinh kín dày chống ẩm-bẩn và độ kín không khí', 1400000)
INSERT [dbo].[Products] ([proID], [pdcID], [typeID], [proName], [proPrice], [proDiscount], [proQuantity], [proPhoto], [proUpdateDate], [proDescription], [proImportPrice]) VALUES (N'TU002', 3, 21, N'Tủ chống ẩm SOLO MT-40L', 1700000, 0, 100, N'/Image/tu-chong-am-solo-mt-40l.png', N'27/04/2022 4:40:26 CH', N'Dung tích: 40l
Kích thước tổng thể: 395 x 395 x 420
Kích thước trong : 350 x 325 x 390
Trọng lượng : 7kg', 1600000)
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (1, 1, N'Máy ảnh Canon')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (2, 1, N'Máy ảnh Fujifilm')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (3, 1, N'Máy ảnh Nikon')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (4, 1, N'Máy ảnh Sony')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (5, 1, N'Máy ảnh Lumix')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (6, 1, N'Máy ảnh Panasonic')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (7, 1, N'Máy ảnh Olympus')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (8, 2, N'Ống kính Canon')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (10, 2, N'Ống kính Nikon')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (11, 2, N'Ống kính Sony')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (12, 2, N'Ống kính Sigma')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (13, 2, N'Ống kính Tamron')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (14, 3, N'Gimbal')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (15, 3, N'Phụ kiện ánh sáng')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (16, 3, N'Micro')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (17, 3, N'Thẻ nhớ')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (18, 3, N'Chân máy')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (19, 3, N'Đầu đọc thẻ')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (20, 3, N'Pin/ Sạc')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (21, 3, N'Tủ chống ẩm')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (22, 3, N'Phụ kiện bảo vệ')
INSERT [dbo].[ProductTypes] ([typeID], [cateID], [typeName]) VALUES (23, 3, N'Balo / Túi máy ảnh')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'CN001', 4)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'CN002', 5)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'CN003', 4)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'CN004', 4)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'NK001', 5)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'NK002', 5)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'NK003', 3)
INSERT [dbo].[Rates] ([proID], [rateStar]) VALUES (N'NK004', 5)
GO
ALTER TABLE [dbo].[Nguoidung]  WITH CHECK ADD  CONSTRAINT [FK_Nguoidung_PhanQuyen] FOREIGN KEY([IDQuyen])
REFERENCES [dbo].[PhanQuyen] ([IDQuyen])
GO
ALTER TABLE [dbo].[Nguoidung] CHECK CONSTRAINT [FK_Nguoidung_PhanQuyen]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([proID])
REFERENCES [dbo].[Products] ([proID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([cusPhone])
REFERENCES [dbo].[Customers] ([cusPhone])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([pdcID])
REFERENCES [dbo].[Producers] ([pdcID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([typeID])
REFERENCES [dbo].[ProductTypes] ([typeID])
GO
ALTER TABLE [dbo].[ProductTypes]  WITH CHECK ADD FOREIGN KEY([cateID])
REFERENCES [dbo].[Categories] ([cateID])
GO
ALTER TABLE [dbo].[Rates]  WITH CHECK ADD FOREIGN KEY([proID])
REFERENCES [dbo].[Products] ([proID])
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateSanPham]    Script Date: 17/05/2022 6:03:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[InsertUpdateSanPham]   
(    
@proID varchar(50),    
@pdcID int,    
@typeID int,    
@proName	nvarchar(20),
@proPrice	int,
@proDiscount int,
@proQuantity	int,
@proPhoto nvarchar(MAX),
@proUpdateDate varchar(50),
@proDescription nvarchar(MAX),
@proImportPrice int,
@Action varchar(10)    
)    
As    
Begin    
if @Action='Insert'    
Begin    
 Insert into Products(
pdcID,
typeID,
proName,
proPrice,
proDiscount,
proQuantity,
proPhoto,
proUpdateDate,
proDescription,
proImportPrice

) values(   
@pdcID,    
@typeID,    
@proName,
@proPrice,
@proDiscount,
@proQuantity,
@proPhoto,
@proUpdateDate,
@proDescription,
@proImportPrice);    
End    
if @Action='Update'    
Begin    
 Update Products 
 set pdcID=@pdcID,
	 typeID=@typeID,
	proName=@proName,
	proPrice=@proPrice,
	proDiscount=@proDiscount,
	proQuantity=@proQuantity,
	proPhoto=@proPhoto,
	proUpdateDate=@proUpdateDate,
	proDescription=@proDescription,
	proImportPrice=@proImportPrice
  where proID=@proID;    
End      
End
GO
/****** Object:  StoredProcedure [dbo].[SelectSanPham]    Script Date: 17/05/2022 6:03:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SelectSanPham]    
as     
Begin    
Select Products.proID,
Products.pdcID,
Products.typeID,
Products.proName,
Products.proPrice,
Products.proDiscount,
Products.proQuantity,
Products.proPhoto,
Products.proUpdateDate,
Products.proDescription,
Products.proImportPrice

From Products
End 
GO
USE [master]
GO
ALTER DATABASE [MayAnhPhoDB] SET  READ_WRITE 
GO
