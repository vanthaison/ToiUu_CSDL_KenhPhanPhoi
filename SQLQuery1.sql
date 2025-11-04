-- Xóa các bảng con trước
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
    FOREIGN KEY (MaDoiTuong) REFERENCES DoiTuong(MaDoiTuong)
);

-- Khách hàng tổ chức
CREATE TABLE KhachHang_CoToChuc (
    MaDoiTuong VARCHAR(10) PRIMARY KEY,
    TenToChuc NVARCHAR(100) NOT NULL,
    MaSoThue VARCHAR(20) NULL,
    DiaChi NVARCHAR(100) NOT NULL,
    SoDienThoai VARCHAR(15) NOT NULL,
    DaiDienPhapLy NVARCHAR(50) NULL,
    FOREIGN KEY (MaDoiTuong) REFERENCES DoiTuong(MaDoiTuong)
);

-- Khách hàng đặc thù
CREATE TABLE KhachHang_DacThu (
    MaDoiTuong VARCHAR(10) PRIMARY KEY,
    TenKH NVARCHAR(50) NOT NULL,
    LoaiUuDai NVARCHAR(50) NULL,
    GhiChu NVARCHAR(200) NULL,
    FOREIGN KEY (MaDoiTuong) REFERENCES DoiTuong(MaDoiTuong)
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
    GiaBan money NOT NULL,
    BaoHanh NVARCHAR(20) NOT NULL,
    MoTa NVARCHAR(200) NULL
);

-- BẢNG TRUNG GIAN (SP – KÊNH PHÂN PHỐI)
CREATE TABLE PhanPhoiSanPham (
    MaSP VARCHAR(10) NOT NULL,
    MaKenh VARCHAR(10) NOT NULL,
    PRIMARY KEY (MaSP, MaKenh),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP),
    FOREIGN KEY (MaKenh) REFERENCES KenhPhanPhoi(MaKenh)
);
-- BẢNG HÓA ĐƠN
CREATE TABLE HoaDon (
    MaHD VARCHAR(10) PRIMARY KEY,            -- Mã hóa đơn (PK)
    NgayLap DATE NOT NULL,                   -- Ngày lập hóa đơn
    MaDoiTuong VARCHAR(10) NOT NULL,         -- Mã khách hàng (FK)
    TongTien MONEY NOT NULL,                 -- Tổng tiền hóa đơn
    HinhThucThanhToan NVARCHAR(30) NULL,     -- Tiền mặt / Chuyển khoản
    GhiChu NVARCHAR(200) NULL,               -- Ghi chú thêm
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

