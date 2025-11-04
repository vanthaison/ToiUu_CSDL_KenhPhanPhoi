USE PCGaming; -- hoặc tên database của bạn, ví dụ PCGaming
GO
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


--select*, TenSP + N' Mới' as TenSPMoi
--from SanPham

--select*
--from SanPham
--where TenSP = 'GPU'

--select distinct MaSP, BaoHanh, MoTa
--from SanPham

--select*, GiaBan = 1
--from SanPham
--Where TenSP = 'Case pc'

--select*
--from SanPham
--where GiaBan not between 2000000 and 3500000

--select* 
--from SanPham
--where MaSP not in ('SP01', 'SP03')

--select*
--from SanPham
--Where GiaBan like N'5%'

--select*
--from SanPham
--Where MoTa is not null

--select distinct top 20 percent MoTa
--from SanPham

--select MoTa as "Hiệu",
--TenSP as "Loại Sản Phẩm",
--BaoHanh "Bảo Hành"
--from dbo.SanPham;

--select top 7 
--MaSP as "Mã Sản Phẩm",
--TenSP as "Tên Sản Phẩm",
--LoaiSP as "Loại Sản Phẩm"
--from SanPham as SP

--select max(GiaBan) as "Giá Bán Cao Nhất"
--from SanPham;

--select sum(GiaBan) as "Tổng tiền hàng"
--from SanPham

--select	count(*) as "Number of Products",
--			sum(GiaBan) as "Total Unit of stock" ,
--			AVG(GiaBan) as "AVG Unit Price"
--from SanPham;

--select *
--from SanPham
--order by GiaBan desc;

--select top 1*
--from SanPham
--order by GiaBan desc;

--select top 3 GiaBan * 0.9 as "Gia Mới"
--from SanPham
--order by [Gia Mới] ;

select GiaBan as "Giá mới"
from SanPham
group by GiaBan
having count (Giaban) >1000000
order by [Giá mới]
