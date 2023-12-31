USE master
GO

IF DB_ID('PROP1041_QuanLySach') IS NOT NULL
DROP DATABASE [PROP1041_QuanLySach]
GO

IF DB_ID('PROP1041_QuanLySach') IS NULL
CREATE DATABASE [PROP1041_QuanLySach]
GO

USE [PROP1041_QuanLySach]
GO
/****** Object:  FullTextCatalog [sach_ctlg]    Script Date: 11/28/2022 12:42:31 PM ******/
CREATE FULLTEXT CATALOG [sach_ctlg] WITH ACCENT_SENSITIVITY = OFF
AS DEFAULT
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 11/28/2022 12:42:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[Id] [uniqueidentifier] NOT NULL,
	[Ma] [nvarchar](30) NOT NULL,
	[Ten] [nvarchar](30) NOT NULL,
	[MoTa] [nvarchar](100) NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HinhThucThanhToan]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhThucThanhToan](
	[Id] [uniqueidentifier] NOT NULL,
	[IdHoaDon] [uniqueidentifier] NOT NULL,
	[HinhThucThanhToan] [int] NOT NULL,
	[TienThanhToan] [decimal](38, 5) NULL,
 CONSTRAINT [PK_HinhThucThanhToan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[Id] [uniqueidentifier] NOT NULL,
	[IdNhanVien] [uniqueidentifier] NOT NULL,
	[IdKhachHang] [uniqueidentifier] NULL,
	[Ma] [nvarchar](30) NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[NgayShip] [datetime] NULL,
	[NgayNhan] [datetime] NULL,
	[NgayThanhToan] [datetime] NULL,
	[SoDiemSuDung] [int] NULL,
	[TrangThai] [int] NOT NULL,
	[MoTa] [nvarchar](100) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonChiTiet]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonChiTiet](
	[Id] [uniqueidentifier] NOT NULL,
	[IdHoaDon] [uniqueidentifier] NOT NULL,
	[IdSach] [uniqueidentifier] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [decimal](38, 5) NOT NULL,
	[MoTa] [nvarchar](100) NULL,
 CONSTRAINT [PK_HoaDonChiTiet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[Id] [uniqueidentifier] NOT NULL,
	[Ma] [nvarchar](30) NOT NULL,
	[Ten] [nvarchar](30) NOT NULL,
	[TenDem] [nvarchar](30) NOT NULL,
	[Ho] [nvarchar](30) NOT NULL,
	[GioiTinh] [nvarchar](5) NOT NULL,
	[NgaySinh] [date] NULL,
	[SDT] [nvarchar](12) NOT NULL,
	[DiemTichLuy] [int] NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[Id] [uniqueidentifier] NOT NULL,
	[Ma] [nvarchar](30) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[ChietKhau] [int] NOT NULL,
	[NgayBatDau] [date] NOT NULL,
	[NgayKetThuc] [date] NOT NULL,
	[TrangThai] [int] NOT NULL,
	[MoTa] [nvarchar](100) NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMaiChiTiet]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMaiChiTiet](
	[IdKhuyenMai] [uniqueidentifier] NOT NULL,
	[IdSach] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_KhuyenMaiChiTiet] PRIMARY KEY CLUSTERED 
(
	[IdKhuyenMai] ASC,
	[IdSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[Id] [uniqueidentifier] NOT NULL,
	[Ma] [nvarchar](30) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[SDT] [nvarchar](12) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[Id] [uniqueidentifier] NOT NULL,
	[IdChucVu] [uniqueidentifier] NOT NULL,
	[Ma] [nvarchar](30) NOT NULL,
	[Ten] [nvarchar](30) NOT NULL,
	[TenDem] [nvarchar](30) NOT NULL,
	[Ho] [nvarchar](30) NOT NULL,
	[GioiTinh] [nvarchar](5) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[SDT] [nvarchar](12) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[MatKhau] [nvarchar](32) NOT NULL,
	[Hinh] [image] NULL,
	[TrangThai] [int] NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[Id] [uniqueidentifier] NOT NULL,
	[Ma] [nvarchar](30) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](100) NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[Id] [uniqueidentifier] NOT NULL,
	[IdNhaCungCap] [uniqueidentifier] NOT NULL,
	[Ma] [nvarchar](30) NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[MoTa] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhapChiTiet]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhapChiTiet](
	[IdPhieuNhap] [uniqueidentifier] NOT NULL,
	[IdSach] [uniqueidentifier] NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_PhieuNhapChiTiet] PRIMARY KEY CLUSTERED 
(
	[IdPhieuNhap] ASC,
	[IdSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[Id] [uniqueidentifier] NOT NULL,
	[IdNXB] [uniqueidentifier] NOT NULL,
	[IdViTri] [uniqueidentifier] NOT NULL,
	[Ma] [nvarchar](30) NOT NULL,
	[Ten] [nvarchar](70) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[SoTrang] [int] NULL,
	[GiaNhap] [decimal](38, 5) NOT NULL,
	[GiaBan] [decimal](38, 5) NOT NULL,
	[TrangThai] [int] NOT NULL,
	[Hinh] [image] NULL,
	[BarCode] [nvarchar](20) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[BarCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SachTacGia]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SachTacGia](
	[IdTacGia] [uniqueidentifier] NOT NULL,
	[IdSach] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_SachTacGia] PRIMARY KEY CLUSTERED 
(
	[IdTacGia] ASC,
	[IdSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[Id] [uniqueidentifier] NOT NULL,
	[Ma] [nvarchar](30) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[Hinh] [image] NULL,
	[MoTa] [nvarchar](100) NULL,
 CONSTRAINT [PK_TacGia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[Id] [uniqueidentifier] NOT NULL,
	[Ma] [nvarchar](30) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](100) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoaiChiTiet]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoaiChiTiet](
	[IdTheLoai] [uniqueidentifier] NOT NULL,
	[IdSach] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TheLoaiChiTiet] PRIMARY KEY CLUSTERED 
(
	[IdTheLoai] ASC,
	[IdSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViTri]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViTri](
	[Id] [uniqueidentifier] NOT NULL,
	[Ma] [nvarchar](30) NOT NULL,
	[MoTa] [nvarchar](100) NULL,
 CONSTRAINT [PK_ViTri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChucVu] ADD  CONSTRAINT [Default_ID_ChucVu]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[HinhThucThanhToan] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [Default_ID_HoaDon]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[HoaDonChiTiet] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [Default_ID_KhachHang]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[KhuyenMai] ADD  CONSTRAINT [Default_ID_KhuyenMai]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[NhaCungCap] ADD  CONSTRAINT [Default_ID_NhaCungCap]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [Default_ID_NhanVien]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[NhaXuatBan] ADD  CONSTRAINT [Default_ID_NhaXuatBan]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [Default_ID_PhieuNhap]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Sach] ADD  CONSTRAINT [Default_ID_Sach]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[TacGia] ADD  CONSTRAINT [Default_ID_TacGia]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[TheLoai] ADD  CONSTRAINT [Default_ID_TheLoai]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ViTri] ADD  CONSTRAINT [Default_ID_ViTri]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[HinhThucThanhToan]  WITH CHECK ADD  CONSTRAINT [FK_HinhThucThanhToan_HoaDon] FOREIGN KEY([IdHoaDon])
REFERENCES [dbo].[HoaDon] ([Id])
GO
ALTER TABLE [dbo].[HinhThucThanhToan] CHECK CONSTRAINT [FK_HinhThucThanhToan_HoaDon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([IdKhachHang])
REFERENCES [dbo].[KhachHang] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([IdNhanVien])
REFERENCES [dbo].[NhanVien] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonChiTiet_HoaDon] FOREIGN KEY([IdHoaDon])
REFERENCES [dbo].[HoaDon] ([Id])
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_HoaDonChiTiet_HoaDon]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonChiTiet_Sach] FOREIGN KEY([IdSach])
REFERENCES [dbo].[Sach] ([Id])
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_HoaDonChiTiet_Sach]
GO
ALTER TABLE [dbo].[KhuyenMaiChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_KhuyenMaiChiTiet_KhuyenMai] FOREIGN KEY([IdKhuyenMai])
REFERENCES [dbo].[KhuyenMai] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KhuyenMaiChiTiet] CHECK CONSTRAINT [FK_KhuyenMaiChiTiet_KhuyenMai]
GO
ALTER TABLE [dbo].[KhuyenMaiChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_KhuyenMaiChiTiet_Sach] FOREIGN KEY([IdSach])
REFERENCES [dbo].[Sach] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KhuyenMaiChiTiet] CHECK CONSTRAINT [FK_KhuyenMaiChiTiet_Sach]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChucVu] FOREIGN KEY([IdChucVu])
REFERENCES [dbo].[ChucVu] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChucVu]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhaCungCap] FOREIGN KEY([IdNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[PhieuNhapChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapChiTiet_PhieuNhap] FOREIGN KEY([IdPhieuNhap])
REFERENCES [dbo].[PhieuNhap] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhieuNhapChiTiet] CHECK CONSTRAINT [FK_PhieuNhapChiTiet_PhieuNhap]
GO
ALTER TABLE [dbo].[PhieuNhapChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapChiTiet_Sach] FOREIGN KEY([IdSach])
REFERENCES [dbo].[Sach] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhieuNhapChiTiet] CHECK CONSTRAINT [FK_PhieuNhapChiTiet_Sach]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_NhaXuatBan] FOREIGN KEY([IdNXB])
REFERENCES [dbo].[NhaXuatBan] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_NhaXuatBan]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_ViTri] FOREIGN KEY([IdViTri])
REFERENCES [dbo].[ViTri] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_ViTri]
GO
ALTER TABLE [dbo].[SachTacGia]  WITH CHECK ADD  CONSTRAINT [FK_SachTacGia_Sach] FOREIGN KEY([IdSach])
REFERENCES [dbo].[Sach] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SachTacGia] CHECK CONSTRAINT [FK_SachTacGia_Sach]
GO
ALTER TABLE [dbo].[SachTacGia]  WITH CHECK ADD  CONSTRAINT [FK_SachTacGia_TacGia] FOREIGN KEY([IdTacGia])
REFERENCES [dbo].[TacGia] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SachTacGia] CHECK CONSTRAINT [FK_SachTacGia_TacGia]
GO
ALTER TABLE [dbo].[TheLoaiChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_TheLoaiChiTiet_Sach] FOREIGN KEY([IdSach])
REFERENCES [dbo].[Sach] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TheLoaiChiTiet] CHECK CONSTRAINT [FK_TheLoaiChiTiet_Sach]
GO
ALTER TABLE [dbo].[TheLoaiChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_TheLoaiChiTiet_TheLoai] FOREIGN KEY([IdTheLoai])
REFERENCES [dbo].[TheLoai] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TheLoaiChiTiet] CHECK CONSTRAINT [FK_TheLoaiChiTiet_TheLoai]
GO
/****** Object:  StoredProcedure [dbo].[proc_getAllByKeyword]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_getAllByKeyword]
	(@keyword NVARCHAR(50))
AS
BEGIN
	select s.Id, s.Ma, s.Ten, s.SoLuong, s.GiaBan, s.GiaBan * km.ChietKhau GiaSale, km.ChietKhau, s.Hinh
	from Sach s
	left join TheLoaiChiTiet tlct on s.Id = tlct.IdSach
	left join TheLoai tl on tl.Id = tlct.IdTheLoai
	left join SachTacGia stg on s.Id = stg.IdSach
	left join TacGia tg on stg.IdSach = tg.Id
	left join KhuyenMaiChiTiet kmct on kmct.IdSach = s.Id
	left join KhuyenMai km on km.Id = kmct.IdKhuyenMai
	left join NhaXuatBan nxb on s.IdNXB = nxb.Id
	where (freetext(s.Ten, @keyword) or s.Ten like '%' + @keyword + '%' or freetext(tl.Ten, @keyword) or freetext(tg.Ten, @keyword) or freetext(s.BarCode, @keyword) or freetext(nxb.Ten, @keyword)) and s.TrangThai = 1
	order by s.ma asc
	offset 0 row
END
GO
/****** Object:  StoredProcedure [dbo].[proc_getListCustomSach]    Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_getListCustomSach]
(	
	@position int,
	@pageSize int
)
AS
BEGIN
	select s.Id, s.Ma, s.Ten, s.SoLuong, s.GiaBan, 
	iif((km.TrangThai = 1 and getdate() between km.NgayBatDau and km.NgayKetThuc), s.GiaBan - s.GiaBan * km.ChietKhau / 100, null) giaSale, 
	iif((km.TrangThai = 1 and getdate() between km.NgayBatDau and km.NgayKetThuc), km.ChietKhau, null) ChietKhau, s.Hinh
	from Sach s
	left join KhuyenMaiChiTiet kmct on kmct.IdSach = s.Id
	left join KhuyenMai km on km.Id = kmct.IdKhuyenMai
	where s.TrangThai = 1 
	order by s.ma asc
	offset @position rows
	fetch next @pageSize rows only
END
GO

/****** Object:  StoredProcedure [dbo].[proc_getCustomSachByBarCode] Script Date: 11/28/2022 12:42:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_getCustomSachByBarCode]
(	
	@BarCode NVARCHAR(30)
)
AS
BEGIN
	select s.Id, s.Ma, s.Ten, s.SoLuong, s.GiaBan, 
	iif((km.TrangThai = 1 and getdate() between km.NgayBatDau and km.NgayKetThuc), s.GiaBan - s.GiaBan * km.ChietKhau / 100, null) giaSale, 
	iif((km.TrangThai = 1 and getdate() between km.NgayBatDau and km.NgayKetThuc), km.ChietKhau, null) ChietKhau, s.Hinh
	from Sach s
	left join KhuyenMaiChiTiet kmct on kmct.IdSach = s.Id
	left join KhuyenMai km on km.Id = kmct.IdKhuyenMai
	where s.TrangThai = 1  and s.BarCode = @BarCode
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE PROCEDURE [dbo].[proc_deleteAllHDCT]
	@idHoaDon UNIQUEIDENTIFIER
AS
BEGIN
	DECLARE @counter INT = (SELECT COUNT(Id) FROM HoaDonChiTiet WHERE HoaDonChiTiet.IdHoaDon = @idHoaDon)
	WHILE @counter > 0
	BEGIN
		DELETE HoaDonChiTiet WHERE Id = (SELECT TOP 1 Id FROM HoaDonChiTiet WHERE HoaDonChiTiet.IdHoaDon = @idHoaDon)
		SET @counter = @counter - 1
	END
END


CREATE trigger [dbo].[delete_hoaDonCT]
on [dbo].[HoaDonChiTiet]
after delete as
begin
update Sach 
set SoLuong = sach.SoLuong + (select SoLuong from deleted)
from Sach
Join deleted on Sach.Id = deleted.IdSach
end
Go

CREATE trigger [dbo].[insert_hoaDonCT]
on [dbo].[HoaDonChiTiet]
after insert as
begin
update Sach 
set SoLuong = sach.SoLuong - (select SoLuong from inserted)
from Sach
Join inserted on Sach.Id = inserted.IdSach
end
GO

CREATE trigger [dbo].[update_hoaDonCT]
on [dbo].[HoaDonChiTiet]
after update as
begin
update Sach 
set SoLuong = sach.SoLuong + (select SoLuong from deleted) - (select SoLuong from inserted)
from Sach
Join deleted on Sach.Id = deleted.IdSach
end