USE PCGaming; -- hoặc tên database của bạn, ví dụ PCGaming
GO
delete from ChiTietHoaDon


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


