USE PCGaming; -- hoặc tên database của bạn, ví dụ PCGaming
GO
delete KenhPhanPhoi
INSERT INTO KenhPhanPhoi (MaKenh, TenKenh, LoaiKenh, MoTa, MaDoiTuong)
VALUES
('K01', N'Kênh bán lẻ', N'Trực tiếp', N'Phân phối trực tiếp tại cửa hàng.', 'DT01'),
('K02', N'Kênh đại lý', N'Gián tiếp', N'Phân phối qua đại lý trung gian.', 'DT02'),
('K03', N'Kênh online', N'Trực tiếp', N'Bán hàng qua website và mạng xã hội.', 'DT04'),
('K04', N'Kênh hợp đồng doanh nghiệp', N'Gián tiếp', N'Cung cấp sản phẩm cho các tổ chức lớn.', 'DT03');
('K05', N'Kênh thương mại điện tử', N'Trực tiếp',N'Cung cấp qua các ứng dụng shopee, lazada.', 'DT01');
('K06', N'Kênh xuất khẩu', N'Gián tiếp', N'Bán hàng qua các nước khác.','DT01');
('K07', N'Kênh nhà phân phối khu vực', N'Gián tiếp', N'Cung cấp hàng cho các nhà phân phối tại từng khu vực địa lý.', 'DT07');
('K08', N'Kênh chăm sóc khách hàng cũ', N'Trực tiếp', N'Triển khai chương trình bán hàng và ưu đãi cho khách hàng cũ.', 'DT01');
('K09', N'Kênh siêu thị điện máy', N'Gián tiếp', N'Phân phối thông qua các chuỗi siêu thị điện máy lớn.', 'DT02');
('K10', N'Kênh cộng tác viên', N'Trực tiếp', N'Bán hàng cho các cộng tác viên.', 'DT01');
GO
