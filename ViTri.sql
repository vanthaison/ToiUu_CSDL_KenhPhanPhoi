USE PCGaming; -- hoặc tên database của bạn, ví dụ PCGaming
GO
delete from ViTri
INSERT INTO ViTri (MaViTri, TenViTri, MoTa, MaBoPhan)
VALUES
('VT01', N'Nhân viên bán hàng', N'Tiếp xúc và chăm sóc khách hàng.', 'BP01'),
('VT02', N'Trưởng phòng kinh doanh', N'Quản lý đội ngũ bán hàng và doanh số.', 'BP01'),
('VT03', N'Nhân viên truyền thông', N'Phụ trách quảng bá sản phẩm.', 'BP02'),
('VT04', N'Quản lý kho', N'Kiểm soát nhập xuất hàng hóa.', 'BP03');