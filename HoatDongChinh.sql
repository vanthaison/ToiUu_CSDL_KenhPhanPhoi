USE PCGaming; -- hoặc tên database của bạn, ví dụ PCGaming
GO
delete from HoatDongChinh
INSERT INTO HoatDongChinh (MaHoatDong, TenHoatDong, MoTa, MaViTri)
VALUES
('HD01', N'Tư vấn khách hàng', N'Hỗ trợ khách hàng lựa chọn sản phẩm phù hợp.', 'VT01'),
('HD02', N'Ký kết hợp đồng', N'Đàm phán và ký hợp đồng bán hàng.', 'VT02'),
('HD03', N'Quảng bá thương hiệu', N'Tạo chiến dịch quảng cáo trên mạng xã hội.', 'VT03'),
('HD04', N'Quản lý tồn kho', N'Theo dõi và cập nhật số lượng hàng hóa.', 'VT04');