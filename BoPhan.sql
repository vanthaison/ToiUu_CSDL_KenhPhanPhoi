USE PCGaming; -- hoặc tên database của bạn, ví dụ PCGaming
GO
delete from BoPhan
INSERT INTO BoPhan (MaBoPhan, TenBoPhan, MoTa)
VALUES
('BP01', N'Kinh doanh', N'Phụ trách bán hàng và phát triển khách hàng.'),
('BP02', N'Marketing', N'Phụ trách truyền thông và quảng cáo.'),
('BP03', N'Kho vận', N'Phụ trách quản lý kho và vận chuyển.');