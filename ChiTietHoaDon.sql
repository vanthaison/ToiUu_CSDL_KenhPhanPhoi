USE PCGaming; -- hoặc tên database của bạn, ví dụ PCGaming
GO
delete from ChiTietHoaDon
delete from SanPham

insert into SanPham (MaSP, TenSP, LoaiSP, GiaBan, BaoHanh, MoTa) Values
('SP01', N'Case PC', 'Computer', '500000', N'6 Months', N'Ben bi'),
('SP02', N'CPU', 'Computer', '2000000', N'12 Months', N'Intel Core I7'),
('SP03', N'GPU', 'Computer', '3500000', N'12 Months', 'RTX 2060'),
('SP04', N'Mainboard', 'Computer', '2000000', N'12 Months', 'Gigabyte'),
('SP05', N'Fan', 'Computer', '500000', N'6 Months', 'Jonsbo'),
('SP06', N'Mouse', 'Computer', '200000', N'6 Months', 'Surmit'),
('SP07', N'Keyboard', 'Computer', '500000', N'6 Months', 'Acer'),
('SP08', N'Ram-16GP', 'Computer', '200000', N'6 Months', 'Asus'),
('SP09', N'Ram-32GP', 'Computer', '500000', N'6 Months', 'Asus'),
('SP10', N'Monitor', 'Computer', '2000000', N'6 Months', 'Dell');

-- DỮ LIỆU CHI TIẾT HÓA ĐƠN
INSERT INTO ChiTietHoaDon (MaHD, MaSP, SoLuong, DonGia)
VALUES
-- Hóa đơn HD001 - Phạm Uyên
('HD001', 'SP01', 1, 15000000),
('HD001', 'SP03', 1, 900000),

-- Hóa đơn HD002 - Trần Hoàng
('HD002', 'SP02', 1, 12000000),
('HD002', 'SP04', 1, 10000000),

-- Hóa đơn HD003 - Lê Hoàng
('HD003', 'SP05', 1, 8900000),

-- Hóa đơn HD004 - Lữ Bố
('HD004', 'SP02', 1, 12000000),
('HD004', 'SP06', 1, 20000000),

-- Hóa đơn HD005 - Hoàng Kiệt
('HD005', 'SP07', 2, 2250000),

-- Hóa đơn HD006 - Văn Lê
('HD006', 'SP09', 1, 18900000);

