USE PCGaming; -- hoặc tên database của bạn, ví dụ PCGaming
GO

delete from KhachHang_CaNhan;
delete from DoiTuong;


Insert INTO DoiTuong (MaDoiTuong, TenDoiTuong, LoaiDoiTuong)
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

INSERT INTO KhachHang_CaNhan (MaDoiTuong, HoTen, NgaySinh, DiaChi, SoDienThoai)
VALUES
('DT01', N'Phạm Uyên', '1991-01-25', N'Hà Nội', '0901234567'),
('DT02', N'Nguyễn Tùng', '1992-10-10', N'Đà Nẵng', '0902345678'),
('DT03', N'Trần Hoàng', '1993-09-10', N'Hồ Chí Minh', '0903456789'),
('DT04', N'Trần Thanh', '1993-01-10', N'Huế', '0903415674'),
('DT05', N'Lê Hoàng', '1995-11-15', N'Hồ Chí Minh', '0903647929'),
('DT06', N'Trần Thanh', '1993-01-10', N'Huế', '0903415674'),
('DT07', N'Lữ Bố', '1996-5-10', N'Hà Tây', '0903427554'),
('DT08', N'Hoàng Kiệt', '1995-01-12', N'Hà Nội', '0145885423'),
('DT09', N'Văn Lê', '1994-10-12', N'Huế', '0523446874'),
('DT10', N'Lý Nguyên', '1995-02-11', N'Quảng Trị', '0235974356');

-- Bổ sung đối tượng mới vào bảng cha DoiTuong
--INSERT INTO DoiTuong (MaDoiTuong, TenDoiTuong, LoaiDoiTuong)
--VALUES ('DT06', N'Lê Hoàng (mới)', N'Cá nhân');

--UPDATE KhachHang_CaNhan
--SET HoTen = 'Văn Thanh'
--WHERE MaDoiTuong = 'DT03';

--select Diachi
--from KhachHang_CaNhan

--delete KhachHang_CaNhan
--where HoTen = 'Lê Hoàng'

--delete from KhachHang_CaNhan

--select distinct DiaChi
--from KhachHang_CaNhan

--select top 40 percent *
--from KhachHang_CaNhan

--select HoTen as " Họ và tên",
--NgaySinh as "Ngày Sinh"
--from KhachHang_CaNhan

--select top 7 KHCN.*
--from KhachHang_CaNhan as "KHCN";

--select min(NgaySinh) as "Nhân viên lớn tuổi nhất", max(Ngaysinh) as "Nhân viên ít tuổi nhất"
--from KhachHang_CaNhan as KHCN

--select count(*) as "Tổng Khách Hàng"
--from KhachHang_CaNhan

select *
from KhachHang_CaNhan
group by HoTen, DiaChi
Having sum *
order by HoTen, DiaChi;

