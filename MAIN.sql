-- Xóa các bảng con trước
IF OBJECT_ID('ChiTietHoaDon', 'U') IS NOT NULL DROP TABLE ChiTietHoaDon;
IF OBJECT_ID('HoaDon', 'U') IS NOT NULL DROP TABLE HoaDon;
IF OBJECT_ID('PhanPhoiSanPham', 'U') IS NOT NULL DROP TABLE PhanPhoiSanPham;
IF OBJECT_ID('HoatDongChinh', 'U') IS NOT NULL DROP TABLE HoatDongChinh;
IF OBJECT_ID('ViTri', 'U') IS NOT NULL DROP TABLE ViTri;
IF OBJECT_ID('BoPhan', 'U') IS NOT NULL DROP TABLE BoPhan;
IF OBJECT_ID('KhachHang_CaNhan', 'U') IS NOT NULL DROP TABLE KhachHang_CaNhan;
IF OBJECT_ID('KhachHang_CoToChuc', 'U') IS NOT NULL DROP TABLE KhachHang_CoToChuc;
IF OBJECT_ID('KhachHang_DacThu', 'U') IS NOT NULL DROP TABLE KhachHang_DacThu;
IF OBJECT_ID('KenhPhanPhoi', 'U') IS NOT NULL DROP TABLE KenhPhanPhoi;
IF OBJECT_ID('SanPham', 'U') IS NOT NULL DROP TABLE SanPham;
IF OBJECT_ID('DoiTuong', 'U') IS NOT NULL DROP TABLE DoiTuong;

--IF OBJECT_ID('TTDonHang', 'U') IS NOT NULL DROP TABLE TTDonHang;
--IF OBJECT_ID('DonHang', 'U') IS NOT NULL DROP TABLE DonHang;
--IF OBJECT_ID('TaiKhoanMXH', 'U') IS NOT NULL DROP TABLE TaiKhoanMXH;
--IF OBJECT_ID('NhanVien', 'U') IS NOT NULL DROP TABLE NhanVien;
--IF OBJECT_ID('MatHang', 'U') IS NOT NULL DROP TABLE MatHang;
--IF OBJECT_ID('LoaiHang', 'U') IS NOT NULL DROP TABLE LoaiHang;
--IF OBJECT_ID('KhachHang', 'U') IS NOT NULL DROP TABLE KhachHang;

-- BẢNG ĐỐI TƯỢNG & KHÁCH HÀNG
CREATE TABLE DoiTuong (
    MaDoiTuong VARCHAR(10) PRIMARY KEY,
    TenDoiTuong NVARCHAR(50) NOT NULL,
    LoaiDoiTuong NVARCHAR(20) NOT NULL -- Cá nhân / Tổ chức / Đặc thù
);

-- Khách hàng cá nhân
CREATE TABLE KhachHang_CaNhan (
    MaDoiTuong VARCHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(50) NOT NULL,
    NgaySinh DATE NULL,
    DiaChi NVARCHAR(100) NOT NULL,
    SoDienThoai VARCHAR(15) NOT NULL,
    FOREIGN KEY (MaDoiTuong) REFERENCES DoiTuong(MaDoiTuong) ON DELETE CASCADE
);

-- Khách hàng tổ chức
CREATE TABLE KhachHang_CoToChuc (
    MaDoiTuong VARCHAR(10) PRIMARY KEY,
    TenToChuc NVARCHAR(100) NOT NULL,
    MaSoThue VARCHAR(20) NULL,
    DiaChi NVARCHAR(100) NOT NULL,
    SoDienThoai VARCHAR(15) NOT NULL,
    DaiDienPhapLy NVARCHAR(50) NULL,
    FOREIGN KEY (MaDoiTuong) REFERENCES DoiTuong(MaDoiTuong) ON DELETE CASCADE
);

-- Khách hàng đặc thù
CREATE TABLE KhachHang_DacThu (
    MaDoiTuong VARCHAR(10) PRIMARY KEY,
    TenKH NVARCHAR(50) NOT NULL,
    LoaiUuDai NVARCHAR(50) NULL,
    GhiChu NVARCHAR(200) NULL,
    FOREIGN KEY (MaDoiTuong) REFERENCES DoiTuong(MaDoiTuong) ON DELETE CASCADE
);


-- BẢNG KÊNH PHÂN PHỐI

CREATE TABLE KenhPhanPhoi (
    MaKenh VARCHAR(10) PRIMARY KEY,
    TenKenh NVARCHAR(50) NOT NULL,
    LoaiKenh NVARCHAR(50) NOT NULL,
    MoTa NVARCHAR(200) NULL,
    MaDoiTuong VARCHAR(10) NULL,
    FOREIGN KEY (MaDoiTuong) REFERENCES DoiTuong(MaDoiTuong)
);


-- BẢNG VỊ TRÍ & BỘ PHẬN

CREATE TABLE BoPhan (
    MaBoPhan VARCHAR(10) PRIMARY KEY,
    TenBoPhan NVARCHAR(50) NOT NULL,
    MoTa NVARCHAR(200) NULL
);

CREATE TABLE ViTri (
    MaViTri VARCHAR(10) PRIMARY KEY,
    TenViTri NVARCHAR(50) NOT NULL,
    MoTa NVARCHAR(200) NULL,
    MaBoPhan VARCHAR(10) NOT NULL,
    FOREIGN KEY (MaBoPhan) REFERENCES BoPhan(MaBoPhan)
);

-- BẢNG HOẠT ĐỘNG CHÍNH
CREATE TABLE HoatDongChinh (
    MaHoatDong VARCHAR(10) PRIMARY KEY,
    TenHoatDong NVARCHAR(50) NOT NULL,
    MoTa NVARCHAR(200) NULL,
    MaViTri VARCHAR(10) NOT NULL,
    FOREIGN KEY (MaViTri) REFERENCES ViTri(MaViTri)
);

-- BẢNG SẢN PHẨM
CREATE TABLE SanPham (
    MaSP VARCHAR(10) PRIMARY KEY,
    TenSP NVARCHAR(50) NOT NULL,
    LoaiSP NVARCHAR(50) NOT NULL,
    GiaBan decimal (18,2) NOT NULL,
    BaoHanh NVARCHAR(20) NOT NULL,
    MoTa NVARCHAR(200) NULL
);

-- BẢNG TRUNG GIAN (SP – KÊNH PHÂN PHỐI)
CREATE TABLE PhanPhoiSanPham (
    MaSP VARCHAR(10) NOT NULL,
    MaKenh VARCHAR(10) NOT NULL,
    PRIMARY KEY (MaSP, MaKenh),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP) ON DELETE CASCADE, -- Xóa dữ liệu bảng con khi bảng cha bị xóa
    FOREIGN KEY (MaKenh) REFERENCES KenhPhanPhoi(MaKenh) ON DELETE CASCADE
);
-- BẢNG HÓA ĐƠN
CREATE TABLE HoaDon (
    MaHD VARCHAR(10) PRIMARY KEY,
    NgayLap DATE NOT NULL,
    MaDoiTuong VARCHAR(10) NOT NULL,
    TongTien MONEY NOT NULL, check (TongTien > 0),
    HinhThucThanhToan NVARCHAR(30) NULL,     
    GhiChu NVARCHAR(200) NULL,               
    FOREIGN KEY (MaDoiTuong) REFERENCES DoiTuong(MaDoiTuong)
        ON DELETE CASCADE
);


-- BẢNG CHI TIẾT HÓA ĐƠN
CREATE TABLE ChiTietHoaDon (
    MaHD VARCHAR(10) NOT NULL,               -- Mã hóa đơn (FK)
    MaSP VARCHAR(10) NOT NULL,               -- Mã sản phẩm (FK)
    SoLuong INT NOT NULL CHECK (SoLuong > 0),
    DonGia MONEY NOT NULL CHECK (DonGia > 0),
    ThanhTien AS (SoLuong * DonGia) PERSISTED, -- Tự động tính thành tiền
    PRIMARY KEY (MaHD, MaSP),
    FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD)
        ON DELETE CASCADE,
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
        ON DELETE CASCADE
);

--TỐI ƯU INDEX
create INDEX IX_DoiTuong_LoaiDoiTuong ON DoiTuong(LoaiDoiTuong);
create index IX_KhachHang_CaNhan_HoTen on KhachHang_CaNhan(Hoten);
create index IX_KhachHang_CoToChuc_TenToChuc on  KhachHang_CoToChuc(TenToChuc);
create index IX_KhachHang_DacThu_TenKH on KhachHang_DacThu (TenKH);
create index IX_SanPham_SearchByGiaBan on SanPham (GiaBan); 
create index IX_HoaDon_MaDoiTuong on  HoaDon (MaDoiTuong);
CREATE INDEX IX_HoaDon_FilterByNgayLap ON HoaDon(NgayLap);
CREATE INDEX IX_CTHD_MaHD ON ChiTietHoaDon(MaHD);
CREATE INDEX IX_CTHD_JoinBySanPham ON ChiTietHoaDon(MaSP);


--BẢNG VIEW 
IF OBJECT_ID('v_TongHop_HoaDon', 'V') IS NOT NULL
    DROP VIEW v_TongHop_HoaDon;
USE PCGaming;
GO

CREATE VIEW v_TongHop_HoaDon AS
SELECT 
    hd.MaHD,
    dt.TenDoiTuong AS TenKhachHang,
    hd.NgayLap,
    hd.TongTien,
    hd.HinhThucThanhToan,
    COUNT(ct.MaSP) AS SoSanPham,
    SUM(ct.ThanhTien) AS TongThanhTien
FROM HoaDon hd
JOIN DoiTuong dt ON hd.MaDoiTuong = dt.MaDoiTuong
LEFT JOIN ChiTietHoaDon ct ON hd.MaHD = ct.MaHD
GROUP BY hd.MaHD, dt.TenDoiTuong, hd.NgayLap, hd.TongTien, hd.HinhThucThanhToan;


