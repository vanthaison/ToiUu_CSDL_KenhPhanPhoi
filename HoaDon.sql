USE PCGaming;
GO

DELETE FROM ChiTietHoaDon;
DELETE FROM HoaDon;
DELETE FROM DoiTuong;

---- DỮ LIỆU BẢNG DOI TUONG (KHÁCH HÀNG)
INSERT INTO DoiTuong (MaDoiTuong, TenDoiTuong, LoaiDoiTuong)
VALUES
('DT01', N'Phạm Uyên', N'Cá nhân'),
('DT02', N'Nguyễn Tùng', N'Cá nhân'),
('DT03', N'Trần Hoàng', N'Cá nhân'),
('DT04', N'Trần Thanh', N'Cá nhân'),
('DT05', N'Lê Hoàng', N'Cá nhân'),
('DT06', N'Trần Thanh', N'Cá nhân'),
('DT07', N'Lữ Bố', N'Cá nhân'),
('DT08', N'Hoàng Kiệt', N'Cá nhân'),
('DT09', N'Văn Lê', N'Cá nhân'),
('DT10', N'Lý Nguyên', N'Cá nhân');

-- DỮ LIỆU BẢNG HOA ĐƠN (TỔNG TIỀN KHỚP VỚI CHI TIẾT)
INSERT INTO HoaDon (MaHD, NgayLap, MaDoiTuong, TongTien, HinhThucThanhToan, GhiChu)
VALUES
('HD001', '2025-10-01', 'DT01', 15900000, N'Tiền mặt', N'Mua case + GPU'),
('HD002', '2025-10-03', 'DT03', 22000000, N'Chuyển khoản', N'Mua CPU + Mainboard'),
('HD003', '2025-10-04', 'DT05', 8900000, N'Tiền mặt', N'Mua Fan làm mát'),
('HD004', '2025-10-05', 'DT07', 32000000, N'Chuyển khoản', N'Mua CPU + Mouse cao cấp'),
('HD005', '2025-10-07', 'DT08', 4500000, N'Tiền mặt', N'Mua Keyboard gaming'),
('HD006', '2025-10-09', 'DT09', 18900000, N'Chuyển khoản', N'Mua Ram cao cấp');

