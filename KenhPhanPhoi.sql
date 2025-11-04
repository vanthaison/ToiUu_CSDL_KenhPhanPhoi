USE PCGaming; -- hoặc tên database của bạn, ví dụ PCGaming
GO
delete KenhPhanPhoi
INSERT INTO KenhPhanPhoi (MaKenh, TenKenh, LoaiKenh, MoTa, MaDoiTuong)
VALUES
('K01', N'Kênh bán lẻ', N'Trực tiếp', N'Phân phối trực tiếp tại cửa hàng.', 'DT01'),
('K02', N'Kênh đại lý', N'Gián tiếp', N'Phân phối qua đại lý trung gian.', 'DT02'),
('K03', N'Kênh online', N'Trực tiếp', N'Bán hàng qua website và mạng xã hội.', 'DT04'),
('K04', N'Kênh hợp đồng doanh nghiệp', N'Gián tiếp', N'Cung cấp sản phẩm cho các tổ chức lớn.', 'DT03');