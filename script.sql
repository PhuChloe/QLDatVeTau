USE [QuanLyDatVeTau]
GO
/****** Object:  Table [dbo].[ChiTietDatVe]    Script Date: 06/08/2023 8:58:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDatVe](
	[MaChiTietDatVe] [bigint] IDENTITY(1,1) NOT NULL,
	[MaLichTrinh] [bigint] NOT NULL,
	[MaDatVe] [bigint] NOT NULL,
	[GiaVe] [decimal](18, 2) NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[MaGhe] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietDatVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatVe]    Script Date: 06/08/2023 8:58:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatVe](
	[MaDatVe] [bigint] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[TrangThai] [bigint] NOT NULL,
	[TongTien] [decimal](18, 0) NOT NULL,
	[KhuyenMai] [decimal](18, 0) NULL,
	[TongCong] [decimal](18, 0) NOT NULL,
	[SoVe] [int] NOT NULL,
	[PhuongThucThanhToan] [bigint] NULL,
	[NguoiDat] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDatVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GaTau]    Script Date: 06/08/2023 8:58:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GaTau](
	[MaGaTau] [bigint] IDENTITY(1,1) NOT NULL,
	[TenGa] [nvarchar](255) NOT NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGaTau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ghe]    Script Date: 06/08/2023 8:58:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ghe](
	[MaGhe] [bigint] IDENTITY(1,1) NOT NULL,
	[SoGhe] [int] NOT NULL,
	[MaLoaiGhe] [bigint] NOT NULL,
	[MaTau] [bigint] NOT NULL,
	[MaTrangThaiGhe] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 06/08/2023 8:58:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaKhuyenMai] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](255) NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[TuNgay] [datetime] NOT NULL,
	[DenNgay] [datetime] NOT NULL,
	[TrangThai] [nvarchar](255) NOT NULL,
	[SoTienKhuyenMai] [decimal](8, 2) NOT NULL,
	[PhanTramKhuyenMai] [decimal](8, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhuyenMai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichTrinh]    Script Date: 06/08/2023 8:58:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichTrinh](
	[MaLichTrinh] [bigint] IDENTITY(1,1) NOT NULL,
	[MaTau] [bigint] NOT NULL,
	[MaGaDi] [bigint] NOT NULL,
	[TenGaDi] [nvarchar](255) NOT NULL,
	[ThoiGianDi] [time](7) NOT NULL,
	[NgayDi] [datetime] NOT NULL,
	[MaGaDen] [bigint] NOT NULL,
	[TenGaDen] [nvarchar](255) NOT NULL,
	[NgayDen] [datetime] NOT NULL,
	[ThoiGianDen] [time](7) NOT NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[NguoiTao] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLichTrinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiGhe]    Script Date: 06/08/2023 8:58:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiGhe](
	[MaLoaiGhe] [bigint] IDENTITY(1,1) NOT NULL,
	[TenLoaiGhe] [nvarchar](255) NOT NULL,
	[MoTa] [nvarchar](255) NOT NULL,
	[GiaGhe] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiGhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 06/08/2023 8:58:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Phone] [int] NOT NULL,
	[Email] [varchar](255) NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Gender] [int] NOT NULL,
	[Role] [bigint] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Status] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuongThucThanhToan]    Script Date: 06/08/2023 8:58:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuongThucThanhToan](
	[MaPTTT] [bigint] IDENTITY(1,1) NOT NULL,
	[PTTT] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPTTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 06/08/2023 8:58:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tau]    Script Date: 06/08/2023 8:58:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tau](
	[MaTau] [bigint] IDENTITY(1,1) NOT NULL,
	[TenTau] [nvarchar](255) NOT NULL,
	[SucChua] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 06/08/2023 8:58:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [bigint] IDENTITY(1,1) NOT NULL,
	[TenTrangThai] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThaiGhe]    Script Date: 06/08/2023 8:58:42 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThaiGhe](
	[MaTrangThai] [bigint] IDENTITY(1,1) NOT NULL,
	[TrangThai] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDatVe] ON 

INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (1, 17, 3, CAST(700.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:03:10.973' AS DateTime), 206)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (2, 17, 3, CAST(1800.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:03:10.973' AS DateTime), 296)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (3, 17, 3, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:03:10.973' AS DateTime), 264)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (4, 17, 3, CAST(1800.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:03:10.977' AS DateTime), 298)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (5, 17, 4, CAST(1800.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:26:47.640' AS DateTime), 295)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (6, 17, 4, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:26:47.640' AS DateTime), 265)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (7, 17, 4, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:26:47.640' AS DateTime), 253)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (8, 17, 4, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:26:47.640' AS DateTime), 252)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (9, 17, 4, CAST(1800.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:26:47.640' AS DateTime), 295)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (10, 17, 5, CAST(1800.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:27:54.727' AS DateTime), 295)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (11, 17, 5, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:27:54.727' AS DateTime), 265)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (12, 17, 5, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:27:54.730' AS DateTime), 253)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (13, 17, 5, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:27:54.733' AS DateTime), 252)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (14, 17, 5, CAST(1800.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:27:54.733' AS DateTime), 295)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (15, 17, 6, CAST(1800.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:28:14.097' AS DateTime), 295)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (16, 17, 6, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:28:14.097' AS DateTime), 265)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (17, 17, 6, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:28:14.097' AS DateTime), 253)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (18, 17, 6, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:28:14.097' AS DateTime), 252)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (19, 17, 6, CAST(1800.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:28:14.097' AS DateTime), 295)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (20, 7, 7, CAST(700.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:29:53.633' AS DateTime), 217)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (21, 7, 7, CAST(700.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:29:53.633' AS DateTime), 207)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (22, 7, 7, CAST(900.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:29:53.633' AS DateTime), 238)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (23, 7, 8, CAST(700.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:30:16.907' AS DateTime), 217)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (24, 7, 8, CAST(700.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:30:16.907' AS DateTime), 207)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (25, 7, 8, CAST(900.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:30:16.907' AS DateTime), 238)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (26, 17, 9, CAST(700.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:44:09.717' AS DateTime), 206)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (27, 17, 9, CAST(900.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:44:09.720' AS DateTime), 236)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (28, 17, 9, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:44:09.720' AS DateTime), 244)
INSERT [dbo].[ChiTietDatVe] ([MaChiTietDatVe], [MaLichTrinh], [MaDatVe], [GiaVe], [NgayTao], [MaGhe]) VALUES (29, 17, 9, CAST(1800.00 AS Decimal(18, 2)), CAST(N'2023-08-06T20:44:09.720' AS DateTime), 294)
SET IDENTITY_INSERT [dbo].[ChiTietDatVe] OFF
GO
SET IDENTITY_INSERT [dbo].[DatVe] ON 

INSERT [dbo].[DatVe] ([MaDatVe], [NgayDat], [TrangThai], [TongTien], [KhuyenMai], [TongCong], [SoVe], [PhuongThucThanhToan], [NguoiDat]) VALUES (3, CAST(N'2023-08-06T20:03:10.970' AS DateTime), 1, CAST(5800 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(5800 AS Decimal(18, 0)), 4, 2, N'test01')
INSERT [dbo].[DatVe] ([MaDatVe], [NgayDat], [TrangThai], [TongTien], [KhuyenMai], [TongCong], [SoVe], [PhuongThucThanhToan], [NguoiDat]) VALUES (4, CAST(N'2023-08-06T20:26:47.637' AS DateTime), 1, CAST(8100 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(8100 AS Decimal(18, 0)), 5, 2, N'test01')
INSERT [dbo].[DatVe] ([MaDatVe], [NgayDat], [TrangThai], [TongTien], [KhuyenMai], [TongCong], [SoVe], [PhuongThucThanhToan], [NguoiDat]) VALUES (5, CAST(N'2023-08-06T20:27:54.727' AS DateTime), 1, CAST(8100 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(8100 AS Decimal(18, 0)), 5, 2, N'test01')
INSERT [dbo].[DatVe] ([MaDatVe], [NgayDat], [TrangThai], [TongTien], [KhuyenMai], [TongCong], [SoVe], [PhuongThucThanhToan], [NguoiDat]) VALUES (6, CAST(N'2023-08-06T20:28:14.093' AS DateTime), 1, CAST(8100 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(8100 AS Decimal(18, 0)), 5, 2, N'test01')
INSERT [dbo].[DatVe] ([MaDatVe], [NgayDat], [TrangThai], [TongTien], [KhuyenMai], [TongCong], [SoVe], [PhuongThucThanhToan], [NguoiDat]) VALUES (7, CAST(N'2023-08-06T20:29:53.627' AS DateTime), 1, CAST(2300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(2300 AS Decimal(18, 0)), 3, 2, N'test01')
INSERT [dbo].[DatVe] ([MaDatVe], [NgayDat], [TrangThai], [TongTien], [KhuyenMai], [TongCong], [SoVe], [PhuongThucThanhToan], [NguoiDat]) VALUES (8, CAST(N'2023-08-06T20:30:16.903' AS DateTime), 1, CAST(2300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(2300 AS Decimal(18, 0)), 3, 2, N'test01')
INSERT [dbo].[DatVe] ([MaDatVe], [NgayDat], [TrangThai], [TongTien], [KhuyenMai], [TongCong], [SoVe], [PhuongThucThanhToan], [NguoiDat]) VALUES (9, CAST(N'2023-08-06T20:44:09.713' AS DateTime), 1, CAST(4900 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(4900 AS Decimal(18, 0)), 4, 2, N'test01')
SET IDENTITY_INSERT [dbo].[DatVe] OFF
GO
SET IDENTITY_INSERT [dbo].[GaTau] ON 

INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (1, N'Ha Noi (HAN)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (2, N'Ho Chi Minh City (SGN)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (3, N'Da Nang (DAD)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (4, N'Phu Quoc (PQC)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (5, N'Nha Trang (CXR)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (6, N'Buon Ma Thuot (BMV)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (7, N'Ca Mau (CAH)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (8, N'Can Tho (VCA)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (9, N'Chu Lai (VCL)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (10, N'Con Dao (VCS)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (11, N'Da Lat (DLI)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (12, N'Dien Bien (DIN)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (13, N'Dong Hoi (DVH)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (14, N'Hai Phong (HPH)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (15, N'Hue (HUI)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (16, N'Pleiku (PXU)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (17, N'Quy Nhon (UIH)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (18, N'Rach Gia (VKG)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (19, N'Thanh Hoa (THD)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (20, N'Tuy Hoa (TBB)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (21, N'Van Don (VDO)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
INSERT [dbo].[GaTau] ([MaGaTau], [TenGa], [NgayTao]) VALUES (22, N'Vinh (VII)', CAST(N'2023-07-30T18:03:18.913' AS DateTime))
SET IDENTITY_INSERT [dbo].[GaTau] OFF
GO
SET IDENTITY_INSERT [dbo].[Ghe] ON 

INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (201, 1, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (202, 2, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (203, 3, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (204, 4, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (205, 5, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (206, 6, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (207, 7, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (208, 8, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (209, 9, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (210, 10, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (211, 11, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (212, 12, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (213, 13, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (214, 14, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (215, 15, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (216, 16, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (217, 17, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (218, 18, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (219, 19, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (220, 20, 4, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (221, 21, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (222, 22, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (223, 23, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (224, 24, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (225, 25, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (226, 26, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (227, 27, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (228, 28, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (229, 29, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (230, 30, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (231, 31, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (232, 32, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (233, 33, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (234, 34, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (235, 35, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (236, 36, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (237, 37, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (238, 38, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (239, 39, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (240, 40, 5, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (241, 41, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (242, 42, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (243, 43, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (244, 44, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (245, 45, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (246, 46, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (247, 47, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (248, 48, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (249, 49, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (250, 50, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (251, 51, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (252, 52, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (253, 53, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (254, 54, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (255, 55, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (256, 56, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (257, 57, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (258, 58, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (259, 59, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (260, 60, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (261, 61, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (262, 62, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (263, 63, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (264, 64, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (265, 65, 6, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (266, 66, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (267, 67, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (268, 68, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (269, 69, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (270, 70, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (271, 71, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (272, 72, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (273, 73, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (274, 74, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (275, 75, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (276, 76, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (277, 77, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (278, 78, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (279, 79, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (280, 80, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (281, 81, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (282, 82, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (283, 83, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (284, 84, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (285, 85, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (286, 86, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (287, 87, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (288, 88, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (289, 89, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (290, 90, 7, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (291, 91, 8, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (292, 92, 8, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (293, 93, 8, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (294, 94, 8, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (295, 95, 8, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (296, 96, 8, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (297, 97, 8, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (298, 98, 8, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (299, 99, 8, 14, 1)
GO
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (300, 100, 8, 14, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (301, 1, 4, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (302, 2, 4, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (303, 3, 4, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (304, 4, 4, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (305, 5, 4, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (306, 6, 5, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (307, 7, 5, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (308, 8, 5, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (309, 9, 5, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (310, 10, 5, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (311, 11, 6, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (312, 12, 6, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (313, 13, 6, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (314, 14, 6, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (315, 15, 6, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (316, 16, 7, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (317, 17, 7, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (318, 18, 7, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (319, 19, 7, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (320, 20, 7, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (321, 21, 8, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (322, 22, 8, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (323, 23, 8, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (324, 24, 8, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (325, 25, 8, 15, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (326, 1, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (327, 2, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (328, 3, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (329, 4, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (330, 5, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (331, 6, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (332, 7, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (333, 8, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (334, 9, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (335, 10, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (336, 11, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (337, 12, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (338, 13, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (339, 14, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (340, 15, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (341, 16, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (342, 17, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (343, 18, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (344, 19, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (345, 20, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (346, 21, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (347, 22, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (348, 23, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (349, 24, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (350, 25, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (351, 26, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (352, 27, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (353, 28, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (354, 29, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (355, 30, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (356, 31, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (357, 32, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (358, 33, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (359, 34, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (360, 35, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (361, 36, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (362, 37, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (363, 38, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (364, 39, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (365, 40, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (366, 41, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (367, 42, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (368, 43, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (369, 44, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (370, 45, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (371, 46, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (372, 47, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (373, 48, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (374, 49, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (375, 50, 4, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (376, 51, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (377, 52, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (378, 53, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (379, 54, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (380, 55, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (381, 56, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (382, 57, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (383, 58, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (384, 59, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (385, 60, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (386, 61, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (387, 62, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (388, 63, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (389, 64, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (390, 65, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (391, 66, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (392, 67, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (393, 68, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (394, 69, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (395, 70, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (396, 71, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (397, 72, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (398, 73, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (399, 74, 5, 16, 1)
GO
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (400, 75, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (401, 76, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (402, 77, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (403, 78, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (404, 79, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (405, 80, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (406, 81, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (407, 82, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (408, 83, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (409, 84, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (410, 85, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (411, 86, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (412, 87, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (413, 88, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (414, 89, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (415, 90, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (416, 91, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (417, 92, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (418, 93, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (419, 94, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (420, 95, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (421, 96, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (422, 97, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (423, 98, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (424, 99, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (425, 100, 5, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (426, 101, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (427, 102, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (428, 103, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (429, 104, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (430, 105, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (431, 106, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (432, 107, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (433, 108, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (434, 109, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (435, 110, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (436, 111, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (437, 112, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (438, 113, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (439, 114, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (440, 115, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (441, 116, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (442, 117, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (443, 118, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (444, 119, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (445, 120, 6, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (446, 121, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (447, 122, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (448, 123, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (449, 124, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (450, 125, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (451, 126, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (452, 127, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (453, 128, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (454, 129, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (455, 130, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (456, 131, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (457, 132, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (458, 133, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (459, 134, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (460, 135, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (461, 136, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (462, 137, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (463, 138, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (464, 139, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (465, 140, 7, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (466, 141, 8, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (467, 142, 8, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (468, 143, 8, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (469, 144, 8, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (470, 145, 8, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (471, 146, 8, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (472, 147, 8, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (473, 148, 8, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (474, 149, 8, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (475, 150, 8, 16, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (476, 1, 4, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (477, 2, 4, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (478, 3, 4, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (479, 4, 4, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (480, 5, 4, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (481, 6, 4, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (482, 7, 4, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (483, 8, 4, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (484, 9, 4, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (485, 10, 4, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (486, 11, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (487, 12, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (488, 13, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (489, 14, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (490, 15, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (491, 16, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (492, 17, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (493, 18, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (494, 19, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (495, 20, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (496, 21, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (497, 22, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (498, 23, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (499, 24, 5, 17, 1)
GO
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (500, 25, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (501, 26, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (502, 27, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (503, 28, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (504, 29, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (505, 30, 5, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (506, 31, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (507, 32, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (508, 33, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (509, 34, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (510, 35, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (511, 36, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (512, 37, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (513, 38, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (514, 39, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (515, 40, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (516, 41, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (517, 42, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (518, 43, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (519, 44, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (520, 45, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (521, 46, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (522, 47, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (523, 48, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (524, 49, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (525, 50, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (526, 51, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (527, 52, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (528, 53, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (529, 54, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (530, 55, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (531, 56, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (532, 57, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (533, 58, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (534, 59, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (535, 60, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (536, 61, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (537, 62, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (538, 63, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (539, 64, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (540, 65, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (541, 66, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (542, 67, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (543, 68, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (544, 69, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (545, 70, 6, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (546, 71, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (547, 72, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (548, 73, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (549, 74, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (550, 75, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (551, 76, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (552, 77, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (553, 78, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (554, 79, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (555, 80, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (556, 81, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (557, 82, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (558, 83, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (559, 84, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (560, 85, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (561, 86, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (562, 87, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (563, 88, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (564, 89, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (565, 90, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (566, 91, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (567, 92, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (568, 93, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (569, 94, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (570, 95, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (571, 96, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (572, 97, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (573, 98, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (574, 99, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (575, 100, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (576, 101, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (577, 102, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (578, 103, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (579, 104, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (580, 105, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (581, 106, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (582, 107, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (583, 108, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (584, 109, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (585, 110, 7, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (586, 111, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (587, 112, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (588, 113, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (589, 114, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (590, 115, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (591, 116, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (592, 117, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (593, 118, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (594, 119, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (595, 120, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (596, 121, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (597, 122, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (598, 123, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (599, 124, 8, 17, 1)
GO
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (600, 125, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (601, 126, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (602, 127, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (603, 128, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (604, 129, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (605, 130, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (606, 131, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (607, 132, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (608, 133, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (609, 134, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (610, 135, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (611, 136, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (612, 137, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (613, 138, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (614, 139, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (615, 140, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (616, 141, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (617, 142, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (618, 143, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (619, 144, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (620, 145, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (621, 146, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (622, 147, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (623, 148, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (624, 149, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (625, 150, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (626, 151, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (627, 152, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (628, 153, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (629, 154, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (630, 155, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (631, 156, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (632, 157, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (633, 158, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (634, 159, 8, 17, 1)
INSERT [dbo].[Ghe] ([MaGhe], [SoGhe], [MaLoaiGhe], [MaTau], [MaTrangThaiGhe]) VALUES (635, 160, 8, 17, 1)
SET IDENTITY_INSERT [dbo].[Ghe] OFF
GO
SET IDENTITY_INSERT [dbo].[LichTrinh] ON 

INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (1, 14, 1, N'Ha Noi (HAN)', CAST(N'08:00:00' AS Time), CAST(N'2023-08-01T00:00:00.000' AS DateTime), 2, N'Ho Chi Minh City (SGN)', CAST(N'2023-08-03T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'2023-07-31T03:31:27.620' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (2, 15, 1, N'Ha Noi (HAN)', CAST(N'08:00:00' AS Time), CAST(N'2023-08-01T00:00:00.000' AS DateTime), 4, N'Phu Quoc (PQC)', CAST(N'2023-08-03T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'2023-07-31T03:36:52.360' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (3, 14, 1, N'Ha Noi (HAN)', CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T00:00:00.000' AS DateTime), 2, N'Ho Chi Minh City (SGN)', CAST(N'2023-08-06T00:00:00.000' AS DateTime), CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T02:53:51.753' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (4, 14, 1, N'Ha Noi (HAN)', CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T00:00:00.000' AS DateTime), 1, N'Ha Noi (HAN)', CAST(N'2023-08-06T00:00:00.000' AS DateTime), CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T02:54:02.990' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (5, 14, 1, N'Ha Noi (HAN)', CAST(N'00:00:00' AS Time), CAST(N'2023-08-04T00:00:00.000' AS DateTime), 3, N'Da Nang (DAD)', CAST(N'2023-08-06T00:00:00.000' AS DateTime), CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T02:54:25.170' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (6, 14, 1, N'Ha Noi (HAN)', CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T00:00:00.000' AS DateTime), 3, N'Da Nang (DAD)', CAST(N'2023-08-05T00:00:00.000' AS DateTime), CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T02:54:31.490' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (7, 14, 1, N'Ha Noi (HAN)', CAST(N'00:00:00' AS Time), CAST(N'2023-08-08T00:00:00.000' AS DateTime), 3, N'Da Nang (DAD)', CAST(N'2023-08-08T00:00:00.000' AS DateTime), CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T02:54:57.813' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (8, 17, 6, N'Buon Ma Thuot (BMV)', CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T00:00:00.000' AS DateTime), 8, N'Can Tho (VCA)', CAST(N'2023-08-06T00:00:00.000' AS DateTime), CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T02:56:52.900' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (9, 14, 2, N'Ho Chi Minh City (SGN)', CAST(N'00:00:00' AS Time), CAST(N'2023-08-09T00:00:00.000' AS DateTime), 4, N'Phu Quoc (PQC)', CAST(N'2023-08-14T00:00:00.000' AS DateTime), CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T02:58:16.007' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (10, 15, 6, N'Buon Ma Thuot (BMV)', CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T00:00:00.000' AS DateTime), 6, N'Buon Ma Thuot (BMV)', CAST(N'2023-08-17T00:00:00.000' AS DateTime), CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T03:01:06.463' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (11, 15, 3, N'Da Nang (DAD)', CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T00:00:00.000' AS DateTime), 2, N'Ho Chi Minh City (SGN)', CAST(N'2023-08-17T00:00:00.000' AS DateTime), CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T03:01:12.510' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (12, 15, 4, N'Phu Quoc (PQC)', CAST(N'00:00:00' AS Time), CAST(N'2023-08-09T00:00:00.000' AS DateTime), 7, N'Ca Mau (CAH)', CAST(N'2023-08-17T00:00:00.000' AS DateTime), CAST(N'14:00:00' AS Time), CAST(N'2023-08-05T03:04:18.023' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (13, 14, 2, N'Ho Chi Minh City (SGN)', CAST(N'21:30:00' AS Time), CAST(N'2023-08-05T00:00:00.000' AS DateTime), 11, N'Da Lat (DLI)', CAST(N'2023-08-09T00:00:00.000' AS DateTime), CAST(N'07:00:00' AS Time), CAST(N'2023-08-05T03:08:30.320' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (14, 16, 2, N'Ho Chi Minh City (SGN)', CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T11:13:00.000' AS DateTime), 7, N'Ca Mau (CAH)', CAST(N'2023-08-07T03:14:00.000' AS DateTime), CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T03:14:49.850' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (15, 16, 3, N'Da Nang (DAD)', CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T22:33:00.000' AS DateTime), 8, N'Can Tho (VCA)', CAST(N'2023-08-07T21:34:00.000' AS DateTime), CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T21:34:18.570' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (16, 14, 1, N'Ha Noi (HAN)', CAST(N'00:00:00' AS Time), CAST(N'2023-08-16T22:09:00.000' AS DateTime), 2, N'Ho Chi Minh City (SGN)', CAST(N'2023-08-19T22:09:00.000' AS DateTime), CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T22:10:01.013' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (17, 14, 2, N'Ho Chi Minh City (SGN)', CAST(N'00:00:00' AS Time), CAST(N'2023-08-21T22:09:00.000' AS DateTime), 1, N'Ha Noi (HAN)', CAST(N'2023-08-23T22:09:00.000' AS DateTime), CAST(N'00:00:00' AS Time), CAST(N'2023-08-05T22:10:22.147' AS DateTime), NULL, N'admin')
INSERT [dbo].[LichTrinh] ([MaLichTrinh], [MaTau], [MaGaDi], [TenGaDi], [ThoiGianDi], [NgayDi], [MaGaDen], [TenGaDen], [NgayDen], [ThoiGianDen], [NgayTao], [NgayCapNhat], [NguoiTao]) VALUES (18, 15, 5, N'Nha Trang (CXR)', CAST(N'00:00:00' AS Time), CAST(N'2023-08-06T09:46:00.000' AS DateTime), 11, N'Da Lat (DLI)', CAST(N'2023-08-09T04:46:00.000' AS DateTime), CAST(N'00:00:00' AS Time), CAST(N'2023-08-06T02:46:49.560' AS DateTime), NULL, N'admin')
SET IDENTITY_INSERT [dbo].[LichTrinh] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiGhe] ON 

INSERT [dbo].[LoaiGhe] ([MaLoaiGhe], [TenLoaiGhe], [MoTa], [GiaGhe]) VALUES (4, N'Ghế ngồi cứng', N'Ghế ngồi cứng', 700)
INSERT [dbo].[LoaiGhe] ([MaLoaiGhe], [TenLoaiGhe], [MoTa], [GiaGhe]) VALUES (5, N'Ghế ngồi mềm', N'Ghế ngồi mềm', 900)
INSERT [dbo].[LoaiGhe] ([MaLoaiGhe], [TenLoaiGhe], [MoTa], [GiaGhe]) VALUES (6, N'Giường nằm khoang 4', N'Giường nằm khoang 4', 1500)
INSERT [dbo].[LoaiGhe] ([MaLoaiGhe], [TenLoaiGhe], [MoTa], [GiaGhe]) VALUES (7, N'Giường nằm khoang 6', N'Giường nằm khoang 6', 1200)
INSERT [dbo].[LoaiGhe] ([MaLoaiGhe], [TenLoaiGhe], [MoTa], [GiaGhe]) VALUES (8, N'Giường nằm khoang 2 VIP', N'Giường nằm khoang 2 VIP', 1800)
SET IDENTITY_INSERT [dbo].[LoaiGhe] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([Id], [Username], [Password], [Phone], [Email], [FullName], [Gender], [Role], [CreatedAt], [Status]) VALUES (1, N'admin', N'Qpf0SxOVUjUkWySXOZ16kw==', 924989444, NULL, N'Administrator 1', 1, 1, CAST(N'2023-07-30T18:28:19.830' AS DateTime), 1)
INSERT [dbo].[NguoiDung] ([Id], [Username], [Password], [Phone], [Email], [FullName], [Gender], [Role], [CreatedAt], [Status]) VALUES (2, N'phuphan', N'Qpf0SxOVUjUkWySXOZ16kw==', 924989444, NULL, N'Administrator 1', 1, 2, CAST(N'2023-07-30T18:28:46.473' AS DateTime), 1)
INSERT [dbo].[NguoiDung] ([Id], [Username], [Password], [Phone], [Email], [FullName], [Gender], [Role], [CreatedAt], [Status]) VALUES (6, N'test01', N'Qpf0SxOVUjUkWySXOZ16kw==', 924989444, NULL, N'test 01', 1, 2, CAST(N'2023-08-06T18:04:42.150' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[PhuongThucThanhToan] ON 

INSERT [dbo].[PhuongThucThanhToan] ([MaPTTT], [PTTT]) VALUES (1, N'Chuyển khoản ngân hàng')
INSERT [dbo].[PhuongThucThanhToan] ([MaPTTT], [PTTT]) VALUES (2, N'Thanh toán khi nhận vé')
INSERT [dbo].[PhuongThucThanhToan] ([MaPTTT], [PTTT]) VALUES (3, N'Momo')
INSERT [dbo].[PhuongThucThanhToan] ([MaPTTT], [PTTT]) VALUES (4, N'ZaloPay')
SET IDENTITY_INSERT [dbo].[PhuongThucThanhToan] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'Customer')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (3, N'Employee')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Tau] ON 

INSERT [dbo].[Tau] ([MaTau], [TenTau], [SucChua]) VALUES (14, N'SE01', 100)
INSERT [dbo].[Tau] ([MaTau], [TenTau], [SucChua]) VALUES (15, N'SE02', 25)
INSERT [dbo].[Tau] ([MaTau], [TenTau], [SucChua]) VALUES (16, N'SE03', 200)
INSERT [dbo].[Tau] ([MaTau], [TenTau], [SucChua]) VALUES (17, N'SE004', 200)
SET IDENTITY_INSERT [dbo].[Tau] OFF
GO
SET IDENTITY_INSERT [dbo].[TrangThai] ON 

INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai]) VALUES (1, N'Đã đặt - Chưa thanh toán')
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai]) VALUES (2, N'Đã đặt - Đã thanh toán')
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai]) VALUES (3, N'Đã hủy bởi khách hàng')
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai]) VALUES (4, N'Đã hủy bởi admin')
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai]) VALUES (5, N'Hết hạn')
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai]) VALUES (6, N'Đã sử dụng')
SET IDENTITY_INSERT [dbo].[TrangThai] OFF
GO
SET IDENTITY_INSERT [dbo].[TrangThaiGhe] ON 

INSERT [dbo].[TrangThaiGhe] ([MaTrangThai], [TrangThai]) VALUES (1, N'Còn trống')
INSERT [dbo].[TrangThaiGhe] ([MaTrangThai], [TrangThai]) VALUES (2, N'Đã đặt')
INSERT [dbo].[TrangThaiGhe] ([MaTrangThai], [TrangThai]) VALUES (3, N'Bảo trì')
SET IDENTITY_INSERT [dbo].[TrangThaiGhe] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietDatVe]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChiTietDatVe]
  @MaLichTrinh bigint,
  @MaDatVe bigint,
  @GiaVe DECIMAL(18, 1),
  @MaGhe bigint
AS
BEGIN	
  INSERT INTO ChiTietDatVe ( MaLichTrinh, MaDatVe, GiaVe, NgayTao, MaGhe)
  VALUES ( @MaLichTrinh, @MaDatVe, @GiaVe, GetDate(), @MaGhe);
  
SELECT 1 AS Status, N'Thành công' as Message, SCOPE_IDENTITY() as Id
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietLichTrinh]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ChiTietLichTrinh]
@MaLichTrinh bigint
AS
BEGIN

SELECT LT.*, COUNT(G.MaGhe) AS SoGhe
FROM LichTrinh LT
LEFT JOIN Tau T ON LT.MaTau= T.MaTau
LEFT JOIN Ghe G ON T.MaTau= G.MaTau
WHERE LT.MaLichTrinh=@MaLichTrinh
GROUP BY LT.MaGaDen, LT.MaGaDi, LT.MaLichTrinh, LT.MaTau, LT.NgayCapNhat,LT.NgayDen,LT.NgayDi,
LT.NgayTao, LT.NguoiTao, LT.TenGaDen, LT.TenGaDi, LT.ThoiGianDen, LT.ThoiGianDi

DECLARE @MaTau bigint
SELECT @MaTau= LT.MaTau
FROM LichTrinh LT
WHERE LT.MaLichTrinh=@MaLichTrinh


EXEC sp_DemGheTau @MaTau

SELECT G.*, LG.TenLoaiGhe, LG.GiaGhe, TT.TrangThai
FROM Ghe G
LEFT JOIN LoaiGhe LG ON G.MaLoaiGhe=LG.MaLoaiGhe
LEFT JOIN TrangThaiGhe TT ON TT.MaTrangThai=G.MaTrangThaiGhe
WHERE G.MaTau=@MaTau
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DangKyTaiKhoan]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DangKyTaiKhoan]
    @Username VARCHAR(255),
    @Password VARCHAR(255),
    @Phone INT,
    @Email VARCHAR(255) = NULL,
    @FullName NVARCHAR(50),
    @Gender INT,
    @Role BIGINT=2 --admin role-1, customer role=2, mặc định là đk tài khoản customer

AS
BEGIN
    -- Kiểm tra xem tài khoản có tồn tại chưa
    IF EXISTS (SELECT 1 FROM NguoiDung WHERE Username = @Username)
    BEGIN
        SELECT 0 AS STATUS,  N'Tài khoản đã tồn tại' AS MESSAGE
        RETURN;
    END

	IF CHARINDEX(' ', @Username) > 0
	 BEGIN
        SELECT 0 AS STATUS,  N'Username không được chứa ký tự khoảng trăng' AS MESSAGE
        RETURN;
	 END

    -- Thực hiện đăng ký tài khoản
    BEGIN TRY
        INSERT INTO NguoiDung (Username, Password, Phone, Email, FullName, Gender, Role, CreatedAt, Status)
        VALUES (@Username, @Password, @Phone, @Email, @FullName, @Gender, @Role, getdate(), 1);

        SELECT 1 AS STATUS,  N'Đăng ký thành công' AS MESSAGE
    END TRY
    BEGIN CATCH
       SELECT 0 AS STATUS,  ERROR_MESSAGE() AS MESSAGE ;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DangNhap]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[sp_DangNhap]
    @Username VARCHAR(255),
    @Password VARCHAR(255)
 
AS
BEGIN


    -- Kiểm tra thông tin đăng nhập
    IF EXISTS (SELECT 1 FROM NguoiDung WHERE Username = @Username AND Password = @Password AND Status = 1)
    BEGIN
        -- Lấy thông tin role và username
        SELECT Role, Username,1 as Status, N'Thành công' as Message
        FROM NguoiDung
        WHERE Username = @Username AND Password = @Password AND Status = 1;

        
    END
    ELSE
    BEGIN
        SELECT 0 as Status, N'Sai tên đăng nhập hoặc mật khẩu' as Message
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DanhSachGaTau]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[sp_DanhSachGaTau]
 as
 begin
 select * from GaTau
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_DanhSachLichTrinh]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DanhSachLichTrinh]
as
begin
select LichTrinh.MaLichTrinh,LichTrinh.MaTau,T.TenTau,
LichTrinh.TenGaDi,LichTrinh.ThoiGianDi, LichTrinh.NgayDi,
LichTrinh.TenGaDen,LichTrinh.ThoiGianDen,LichTrinh.NgayDen,
LichTrinh.NgayTao,LichTrinh.NguoiTao
from LichTrinh
left join Tau T on LichTrinh.MaTau=T.MaTau
ORDER BY LichTrinh.NgayDi DESC

end
GO
/****** Object:  StoredProcedure [dbo].[sp_DanhSachLoaiGhe]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DanhSachLoaiGhe]
as
begin
select * from LoaiGhe
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DanhSachNguoiDung]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_DanhSachNguoiDung]
 as
 begin
 select * from NguoiDung
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_DatVe]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DatVe]
@Username varchar(50),
@TongTien decimal(18,1),
@SoVe INT
as
begin

INSERT INTO DatVe(NguoiDat,NgayDat,TrangThai,TongTien,KhuyenMai,TongCong,SoVe,PhuongThucThanhToan)
VALUES(@Username,GETDATE(),1,@TongTien,0,@TongTien,@SoVe,2)

SELECT 1 AS Status, N'Thành công' as Message, SCOPE_IDENTITY() as Id

end
GO
/****** Object:  StoredProcedure [dbo].[sp_DemGhe]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DemGhe]
as
begin
select G.MaLoaiGhe, G.MaTau,LG.TenLoaiGhe,COUNT(G.MaGhe) AS SOLUONG

FROM GHE G
left join LoaiGhe LG on G.MaLoaiGhe=LG.MaLoaiGhe
GROUP BY  G.MaLoaiGhe, G.MaTau,LG.TenLoaiGhe
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DemGheTau]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DemGheTau]
@MaTau bigint
as
begin
select G.MaLoaiGhe, G.MaTau,LG.TenLoaiGhe,COUNT(G.MaGhe) AS SOLUONG
FROM GHE G
left join LoaiGhe LG on G.MaLoaiGhe=LG.MaLoaiGhe
where G.MaTau=@MaTau
GROUP BY  G.MaLoaiGhe, G.MaTau,LG.TenLoaiGhe
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayDanhSachTau]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_LayDanhSachTau]
as
begin

SELECT * FROM Tau
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LichTrinhHomNay]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LichTrinhHomNay]
AS
BEGIN
  SELECT * FROM LichTrinh
  LEFT JOIN Tau ON LichTrinh.MaTau=Tau.MaTau
  WHERE CAST(NgayDi AS DATE) = CAST(GETDATE() AS DATE) 
    AND NgayDi >= GETDATE()
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemGheTau]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ThemGheTau]
@SoGhe int,
@MaLoaiGhe bigint,
@MaTau bigint
as
begin
insert into Ghe(SoGhe,MaLoaiGhe,MaTau,MaTrangThaiGhe)
values(@SoGhe , @MaLoaiGhe, @MaTau,1 );
DECLARE @ID int;
  SET @ID = SCOPE_IDENTITY();

  SELECT * FROM Ghe WHERE MaGhe = @ID;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemLichTrinh]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ThemLichTrinh]
	@MaTau BIGINT,
    @MaGaDi BIGINT,
    @MaGaDen BIGINT,
    @NgayDi DATETIME,
    @NgayDen DATETIME,
    @NguoiTao NVARCHAR(255)
AS
BEGIN
BEGIN TRY

	IF(@MaGaDi=@MaGaDen)
			SELECT 0 AS STATUS,  N'Ga đi không được trùng với ga đến' AS MESSAGE
   
	IF(cast(@NgayDi as date) < cast(GETDATE() as date ))
			SELECT 0 AS STATUS,  N'Ngày đi phải bắt đầu từ hôm nay' AS MESSAGE

	IF(cast(@NgayDen as date) <= cast(@NgayDi as date ))
			SELECT 0 AS STATUS,  N'Ngày đến phải sau ngày đi' AS MESSAGE
	    
	ELSE
	BEGIN
		DECLARE @TenGaDen nvarchar(255), @TenGaDi nvarchar(255)

		set @TenGaDen = 
		(select ga.TenGa from GaTau ga where ga.MaGaTau=@MaGaDen )

		set @TenGaDi = 
		(select ga.TenGa from GaTau ga where ga.MaGaTau=@MaGaDi )

		INSERT INTO "LichTrinh" ("MaTau","MaGaDi","TenGaDen" ,"TenGaDi", "MaGaDen",  "NgayDi", "NgayDen", "ThoiGianDi", "ThoiGianDen", "NgayTao", "NguoiTao")
		VALUES (@MaTau,@MaGaDi,@TenGaDen,@TenGaDi, @MaGaDen, @NgayDi, @NgayDen,'00:00:00', '00:00:00', GETDATE(), @NguoiTao);

		SELECT 1 AS STATUS,  N'Thêm lịch trình thành công' AS MESSAGE
	END
		
    
	END TRY
	BEGIN CATCH
	SELECT 0 AS STATUS,  ERROR_MESSAGE() AS MESSAGE
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemTau]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemTau]
@TenTau nvarchar(255),
@SucChua int
as
begin
insert into Tau(TenTau,SucChua)
values(@TenTau,@SucChua)
 DECLARE @TauId int;
  SET @TauId = SCOPE_IDENTITY();

  SELECT * FROM Tau WHERE MaTau = @TauId;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongTinCaNhan]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThongTinCaNhan]
@Username nvarchar(50)
as
begin
select * from NguoiDung where Username=@Username
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongTinVe]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ThongTinVe]
@MaDatVe bigint
as
begin

select dv.*,tt.*,pttt.*
from DatVe dv
left join TrangThai tt on dv.TrangThai=tt.MaTrangThai
left join PhuongThucThanhToan pttt on dv.PhuongThucThanhToan=pttt.MaPTTT
where dv.MaDatVe=@MaDatVe

select ct.*, lt.*,g.*,lg.*
from ChiTietDatVe ct
left join LichTrinh lt on ct.MaLichTrinh=lt.MaLichTrinh
left join Ghe g on ct.MaGhe=g.MaGhe
left join LoaiGhe lg on g.MaLoaiGhe=lg.MaLoaiGhe
where MaDatVe=@MaDatVe
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TimLichTrinh]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_TimLichTrinh]
@MaGaDi bigint, @MaGaDen bigint, @NgayDi datetime
AS
BEGIN

SELECT * 
FROM LichTrinh
  LEFT JOIN Tau ON LichTrinh.MaTau=Tau.MaTau
WHERE MaGaDi=@MaGaDi 
	AND MaGaDen=@MaGaDen
	AND CAST(NgayDi AS DATE)=CAST(@NgayDi AS DATE)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimLichTrinhVe]    Script Date: 06/08/2023 8:58:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[sp_TimLichTrinhVe]
@MaGaDi bigint, @MaGaDen bigint, @NgayDi datetime
as
BEGIN
SELECT * 
FROM LichTrinh
WHERE MaGaDi=@MaGaDi 
	AND MaGaDen=@MaGaDen
	AND CAST(NgayDi AS DATE)=CAST(@NgayDi AS DATE)
END
GO
