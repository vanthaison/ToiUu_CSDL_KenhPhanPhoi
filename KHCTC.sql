USE PCGaming; -- hoặc tên database của bạn, ví dụ PCGaming
GO
delete KhachHang_CoToChuc
INSERT INTO KhachHang_CoToChuc (MaDoiTuong, TenToChuc, MaSoThue, DiaChi, SoDienThoai, DaiDienPhapLy)
VALUES
('DT02', N'Công ty TNHH ABC', '0312345678', N'12 Nguyễn Trãi, Q.1, TP.HCM', '0909000001', N'Trần Văn Hưng'),
('DT05', N'Công ty XYZ', '0309876543', N'45 Lê Lợi, Q.1, TP.HCM', '0909000002', N'Phạm Thị Hồng');