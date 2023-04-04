/* Tạo và sử dụng database */
use master 
Create database QLBanHang
Use QLBanHang

/* Tạo các table */
Create table T1_SanPham
(
	MaSanPham nchar(10) not null,
	MaHangSanXuat nchar(10),
	TenSanPham nvarchar(20),
	SoLuong int,
	MauSac nvarchar(20),
	GiaBan money,
	DonViTinh nchar(10),
	MoTa nvarchar(max)
)

Create table T2_HangSanXuat
(
	MaHangSanXuat nchar(10) not null,
	TenHang nvarchar(20),
	DiaChi nvarchar(30),
	SoDienThoai nvarchar(20),
	Email nvarchar(30)
)

Create table T3_NhanVien
(
	MaNhanVien nchar(10) not null,
	TenNhanVien nvarchar(20),
	GioiTinh nchar(10),
	DiaChi nvarchar(30),
	SoDienThoai nvarchar(20),
	Email nvarchar(30),
	Phong nvarchar(30)
)

Create table T4_Nhap
(
	SoHoaDonNhap nchar(10) not null,
	MaSanPham nchar(10),
	MaNhanVien nchar(10),
	NgayNhap date,
	SoLuongNhap int,
	DonGiaNhap money
)

Create table T5_Xuat
(
	SoHoaDonXuat nchar(10) not null,
	MaSanPham nchar(10),
	MaNhanVien nchar(10),
	NgayXuat date,
	SoLuongXuat int 
)

/* Tạo Primary Key */
Alter table T1_SanPham
Add Constraint T1_SanPham_PK
Primary key (MaSanPham)

Alter table T2_HangSanXuat
Add Constraint T2_HangSanXuat_PK
Primary key (MaHangSanXuat)

Alter table T3_NhanVien
Add Constraint T3_NhanVien_PK
Primary key (MaNhanVien)

Alter table T4_Nhap
Add Constraint T4_Nhap_PK
Primary key (SoHoaDonNhap)

Alter table T5_Xuat
Add Constraint T5_Xuat_PK
Primary key (SoHoaDonXuat)

/* Tạo Foreign key cho các table */
Alter table T1_SanPham
Add Constraint T1_SanPham_FK
Foreign key (MaHangSanXuat)
References T2_HangSanXuat (MaHangSanXuat)

Alter table T4_Nhap
Add Constraint T4_Nhap_FK
Foreign key (MaSanPham)
References T1_SanPham(MaSanPham)

Alter table T4_Nhap
Add Constraint T4_Nhap_FK_1
Foreign key (MaNhanVien)
References T3_NhanVien(MaNhanVien)

Alter table T5_Xuat
Add Constraint T5_Xuat_FK
Foreign key (MaSanPham)
References T1_SanPham(MaSanPham)

Alter table T5_Xuat
Add Constraint T5_Xuat_FK_1
Foreign key (MaNhanVien)
References T3_NhanVien(MaNhanVien)

/* Thêm dữ liệu */
Insert into T2_HangSanXuat
Values ('H01','Samsung','Korea','011-08271717','ss@gmail.com.kr'),
('H02','OPPO','China','081-08626262','oppo@gmail.com.cn'),
('H03','Vinfone','Viet Nam','084-098262626','vf@gmail.com.vn')

Insert into T3_NhanVien
Values ('NV01','Nguyen Thi Thu','Nu','Ha Noi','0982626521','thu@gmail.com','Ke toan'),
('NV02','Le Van Nam','Nam','Bac Ninh','0972525252','nam@gmail.com','Vat tu'),
('NV03','Tran Hoa Binh','Nu','Ha Noi','0328388388','hb@gmail.com','Ke toan')

Insert into T1_SanPham
Values ('SP01','H02','F1 Plus',100,'Xam',7000000,'Chiec','Hang can cao cap'),
('SP02','H01','Galaxy Note 11',50,'Do',19000000,'Chiec','Hang cao cap'),
('SP03','H02','F3 lite',200,'Nau',3000000,'Chiec','Hang pho thong'),
('SP04','H03','Vjoy3',200,'Xam',1500000,'Chiec','Hang pho thong'),
('SP05','H01','Galaxy V21',500,'Nau',8000000,'Chiec','Hang can cao cap')

Insert into T4_Nhap
Values ('N01','SP02','NV01','2019/02/05',10,17000000),
('N02','SP01','NV02','2020/04/07',30,6000000),
('N03','SP04','NV02','2020/05/17',20,1200000),
('N04','SP01','NV03','2020/03/22',10,6200000),
('N05','SP05','NV01','2020/07/07',20,7000000)

Insert into T5_Xuat
Values ('X01','SP03','NV02','2020/06/14',5),
('X02','SP01','NV03','2019/03/05',3),
('X03','SP02','NV01','2020/12/12',1),
('X04','SP03','NV02','2020/06/02',2),
('X05','SP05','NV01','2020/05/18',1)

/* Truy vấn */
/* Câu 1 */
Select *
From T1_SanPham

Select *
From T2_HangSanXuat

Select *
From T3_NhanVien

Select *
From T4_Nhap

Select *
From T5_Xuat

/* Câu 2 */
Select *
From T1_SanPham
Order by GiaBan DESC

/* Câu 3 */
Select T1_SanPham.MaSanPham, T1_SanPham.MaHangSanXuat, T1_SanPham.TenSanPham, MauSac, GiaBan, DonViTinh
From T1_SanPham, T2_HangSanXuat
Where (T1_SanPham.MaHangSanXuat=T2_HangSanXuat.MaHangSanXuat) 
		and (T2_HangSanXuat.TenHang='Samsung')

/* Câu 4 */
Select *
From T3_NhanVien
Where T3_NhanVien.GioiTinh='Nu' and T3_NhanVien.Phong='Ke toan'

/* Câu 5 */
Select T4.SoHoaDonNhap, T4.MaSanPham, T1.TenSanPham, T2.TenHang, T4.SoLuongNhap, T4.DonGiaNhap, T4.SoLuongNhap * T4.DonGiaNhap as TienNhap,
	T1.MauSac, T1.DonViTinh, T4.NgayNhap, T3.TenNhanVien, T3.Phong
From T4_Nhap T4, T1_SanPham T1, T2_HangSanXuat T2, T3_NhanVien T3
Where T4.MaSanPham=T1.MaSanPham and T1.MaHangSanXuat=T2.MaHangSanXuat and T4.MaNhanVien=T3.MaNhanVien
Order by T4.SoHoaDonNhap ASC

/* Câu 6 */
Select T5.SoHoaDonXuat, T5.MaSanPham, T1.TenSanPham, T2.TenHang, T5.SoLuongXuat, T1.GiaBan, T5.SoLuongXuat * T1.GiaBan as TienXuat,
	T1.MauSac, T1.DonViTinh, T5.NgayXuat, T3.TenNhanVien, T3.Phong
From T5_Xuat T5, T1_SanPham T1, T2_HangSanXuat T2, T3_NhanVien T3
Where T5.MaSanPham=T1.MaSanPham and T1.MaHangSanXuat=T2.MaHangSanXuat and T5.MaNhanVien=T3.MaNhanVien
		and NgayXuat>='2018/10/1' and NgayXuat<='2018/10/31'
Order by T5.SoHoaDonXuat DESC

/* Câu 7 */
Select T4.SoHoaDonNhap, T1.TenSanPham, T4.SoLuongNhap, T4.DonGiaNhap, T4.NgayNhap, T3.TenNhanVien, T3.Phong
From T4_Nhap T4, T1_SanPham T1, T3_NhanVien T3, T2_HangSanXuat T2
Where T4.MaSanPham=T1.MaSanPham and T1.MaHangSanXuat=T2.MaHangSanXuat and T2.TenHang='Samsung' and T4.MaNhanVien=T3.MaNhanVien
	and T4.NgayNhap>='2017/1/1' and T4.NgayNhap<='2017/12/31'

/* Câu 8 */
Select TOP(10) *
From T5_Xuat T5
Where T5.NgayXuat>='2018/1/1' and T5.NgayXuat<='2018/12/31'
Order by T5.SoLuongXuat DESC

/* Câu 9 */
Select TOP(10) *
From T1_SanPham T1
Order by T1.GiaBan DESC

/* Câu 10 */
Select *
From T1_SanPham T1
Where T1.GiaBan>=100000 and T1.GiaBan<=500000

/* Câu 11 */
Select SUM(DonGiaNhap *SoLuongNhap)
From T4_Nhap T4		

/* Câu 12 */
Select SUM(T1.GiaBan*T5.SoLuongXuat)
From T5_Xuat T5, T1_SanPham T1

/* Câu 13 */
Select TOP(1) T4.SoHoaDonNhap, T4.NgayNhap,  T4.DonGiaNhap*T4.SoLuongNhap as TienNhap
From T4_Nhap T4
Where T4.NgayNhap>='2018/1/1' and T4.NgayNhap<='2018/12/31'
Order by TienNhap DESC

/* Câu 14 */
Select TOP(10) *
From T4_Nhap T4
Where T4.NgayNhap>='2019/1/1' and T4.NgayNhap<='2019/12/31'
Order by T4.SoLuongNhap DESC

/* Câu 15 */
Select T1.MaSanPham, T1.TenSanPham, T2.TenHang, T4.MaNhanVien
From T1_SanPham T1, T2_HangSanXuat T2,T4_Nhap T4
Where T1.MaHangSanXuat=T2.MaHangSanXuat and T2.TenHang='Samsung' and T4.MaNhanVien='NV01'
	and T1.MaSanPham=T4.MaSanPham

/* Câu 16 */
Select T4.SoHoaDonNhap, T4.MaSanPham, T4.SoLuongNhap, T4.NgayNhap, T5.MaNhanVien
From T1_SanPham T1, T4_Nhap T4, T5_Xuat T5
Where T1.MaSanPham=T4.MaSanPham and T1.MaSanPham='SP02' and T4.MaNhanVien=T5.MaNhanVien
	and T4.MaSanPham=T5.MaSanPham and T5.MaNhanVien='NV02'

/* Câu 17 */
Select T3.MaNhanVien, T3.TenNhanVien
From T5_Xuat T5, T3_NhanVien T3
Where T5.MaSanPham='SP02' and T5.NgayXuat='2020/02/03'

/* Lab 3 Tuần 3 */
/* Câu 1. Hãy thống kê xem mỗi hãng sản xuất có bao nhiêu loại sản phẩm */
Select *
From T2_HangSanXuat

Select *
From T1_SanPham

Select T2.TenHang, COUNT (*) as 'Số sản phẩm'
From T1_SanPham T1, T2_HangSanXuat T2
Where T1.MaHangSanXuat=T2.MaHangSanXuat
Group by T2.TenHang

/* Câu 2. Hãy thống kê xem tổng tiền nhập của mỗi sản phẩm trong năm 2018 */
Select *
From T4_Nhap

Select MaSanPham, SUM(SoLuongNhap*DonGiaNhap) as 'Tổng tiền nhập'
From T4_Nhap
Group by MaSanPham

Select T4.MaSanPham, SUM(SoLuongNhap*DonGiaNhap) as 'Tổng tiền nhập'
From T4_Nhap T4
Where T4.NgayNhap>='2018/1/1' and T4.NgayNhap<='2018/12/31'
Group by T4.MaSanPham

/* Câu 3. Hãy thống kê các sản phẩm có tổng số lượng xuất năm 2018 là lớn hơn
10.000 sản phẩm của hãng Samsung */
Select *
From T5_Xuat

Select T1.TenSanPham, SUM(T5.SoLuongXuat) as 'Tổng số lượng xuất'
From T1_SanPham T1, T2_HangSanXuat T2, T5_Xuat T5
Where T5.MaSanPham=T1.MaSanPham and T1.MaHangSanXuat = T2.MaHangSanXuat and T2.TenHang='Samsung'
      and T5.NgayXuat>='2018/1/1' and T5.NgayXuat<='2018/12/31' and T5.SoLuongXuat>10000
Group by T1.TenSanPham

/* Câu 4. Thống kê số lượng nhân viên nam của mỗi phòng ban */
Select *
From T3_NhanVien

Select Phong, count (GioiTinh) as 'Số lượng nhân viên nam'
From T3_NhanVien
Group by Phong,GioiTinh
Having GioiTinh='Nam'

/* Câu 5. Thống kê tổng số lượng nhập của mỗi hãng sản xuất trong năm 2018 */
Select *
From T4_Nhap

Select *
From T2_HangSanXuat

Select *
From T1_SanPham

Select T2.TenHang, SUM(SoLuongNhap) as 'Số lượng nhập'
From T1_SanPham T1, T2_HangSanXuat T2, T4_Nhap T4
Where T4.MaSanPham=T1.MaSanPham and T2.MaHangSanXuat=T1.MaHangSanXuat 
	and T4.NgayNhap>='2018/1/1' and T4.NgayNhap<='2018/12/31'
Group by T2.TenHang

/* Câu 6. Hãy thống kê xem tổng lượng tiền xuất của mỗi nhân viên trong năm 2018 là bao nhiêu*/
Select *
From T5_Xuat 

Select T3.TenNhanVien, GiaBan*T5.SoLuongXuat as 'Tiền xuất'
From T1_SanPham T1, T5_Xuat T5, T3_NhanVien T3
Where T5.MaNhanVien=T3.MaNhanVien and T1.MaSanPham=T5.MaSanPham

Select T3.TenNhanVien, SUM(T1.GiaBan*T5.SoLuongXuat) as 'Tổng lượng tiền xuất'
From T1_SanPham T1, T5_Xuat T5, T3_NhanVien T3
Where T5.MaNhanVien=T3.MaNhanVien and T1.MaSanPham=T5.MaSanPham
	and T5.NgayXuat>='2018/1/1' and T5.NgayXuat<='2018/12/31'
Group by T3.TenNhanVien

/* Câu 7. Hãy đưa ra tổng tiền nhập của mỗi nhân viên trong tháng 8/2018 có tổng giá trị
lớn hơn 100.000 */
Select *
From T4_Nhap T4

Select *
From T3_NhanVien T3, T4_Nhap T4
Where T3.MaNhanVien=T4.MaNhanVien
	 and T4.NgayNhap>='2018/8/1' and T4.NgayNhap<='2018/8/31'

Select T3.TenNhanVien, SUM(T4.SoLuongNhap*T4.DonGiaNhap) as 'Tổng lượng tiền xuất'
From T4_Nhap T4, T3_NhanVien T3
Where T3.MaNhanVien=T4.MaNhanVien
	 and T4.NgayNhap>='2018/8/1' and T4.NgayNhap<='2018/8/31'
Group by T3.TenNhanVien
Having SUM(T4.SoLuongNhap*T4.DonGiaNhap)>100000

/* Câu 8. Hãy đưa ra danh sách các sản phẩm đã nhập nhưng chưa xuất bao giờ */
Select *
From T4_Nhap T4

Select *
From T5_Xuat T5

Select *
From T4_Nhap T4
Where T4.MaSanPham NOT IN (Select T5.MaSanPham From T5_Xuat T5)

/* Câu 9. Hãy đưa ra danh sách các sản phẩm đã nhập năm 2018 và đã xuất năm 2018 */
Select *
From T4_Nhap T4

Select *
From T5_Xuat T5

Select *
From T4_Nhap T4
Where T4.NgayNhap>='2018/1/1' and T4.NgayNhap<='2018/12/31'
	  and T4.MaSanPham IN (Select T5.MaSanPham 
						From T5_Xuat T5
						Where T5.NgayXuat>='2018/1/1' and T5.NgayXuat<='2018/12/31')

/* Câu 10. Hãy đưa ra danh sách các nhân viên vừa nhập vừa xuất */
Select *
From T4_Nhap T4

Select *
From T5_Xuat T5

Select DISTINCT (T4.MaNhanVien), T3.TenNhanVien
From T4_Nhap T4, T3_NhanVien T3
Where T4.MaNhanVien IN (Select T5.MaNhanVien
						From T5_Xuat T5)
		and T4.MaNhanVien=T3.MaNhanVien

/* Câu 11. Hãy đưa ra danh sách các nhân viên không tham gia việc nhập và xuất */
Select DISTINCT (T4.MaNhanVien), T3.TenNhanVien
From T4_Nhap T4, T3_NhanVien T3
Where T4.MaNhanVien NOT IN (Select T5.MaNhanVien
						From T5_Xuat T5)
		and T4.MaNhanVien=T3.MaNhanVien


/* Tuần 3 Lab 4: Tạo View */ 
/* Câu 1. View */
Create view C1_View as
	Select T2.TenHang, COUNT (*) as 'Số sản phẩm'
	From T1_SanPham T1, T2_HangSanXuat T2
	Where T1.MaHangSanXuat=T2.MaHangSanXuat
	Group by T2.TenHang

Select *
From C1_View

/* Câu 2. View */
Create view C2_View as
	Select T4.MaSanPham, SUM(SoLuongNhap*DonGiaNhap) as 'Tổng tiền nhập'
	From T4_Nhap T4
	Where T4.NgayNhap>='2018/1/1' and T4.NgayNhap<='2018/12/31'
	Group by T4.MaSanPham

Select *
From C2_View

/* Câu 3. View */
Create view C3_View as
	Select T1.TenSanPham, SUM(T5.SoLuongXuat) as 'Tổng số lượng xuất'
	From T1_SanPham T1, T2_HangSanXuat T2, T5_Xuat T5
	Where T5.MaSanPham=T1.MaSanPham and T1.MaHangSanXuat = T2.MaHangSanXuat and T2.TenHang='Samsung'
		  and T5.NgayXuat>='2018/1/1' and T5.NgayXuat<='2018/12/31' and T5.SoLuongXuat>10000
	Group by T1.TenSanPham

Select *
From C3_View

/* Câu 4. View */
Create view C4_View as
	Select Phong, count (GioiTinh) as 'Số lượng nhân viên nam'
	From T3_NhanVien
	Group by Phong,GioiTinh
	Having GioiTinh='Nam'

Select *
From C4_View

/* Câu 5. View */
Create view C5_View as
	Select T2.TenHang, SUM(SoLuongNhap) as 'Số lượng nhập'
	From T1_SanPham T1, T2_HangSanXuat T2, T4_Nhap T4
	Where T4.MaSanPham=T1.MaSanPham and T2.MaHangSanXuat=T1.MaHangSanXuat 
		and T4.NgayNhap>='2018/1/1' and T4.NgayNhap<='2018/12/31'
	Group by T2.TenHang

Select *
From C5_View

/* Câu 6. View */
Create view C6_View as
	Select T3.TenNhanVien, SUM(T1.GiaBan*T5.SoLuongXuat) as 'Tổng lượng tiền xuất'
	From T1_SanPham T1, T5_Xuat T5, T3_NhanVien T3
	Where T5.MaNhanVien=T3.MaNhanVien and T1.MaSanPham=T5.MaSanPham
		and T5.NgayXuat>='2018/1/1' and T5.NgayXuat<='2018/12/31'
	Group by T3.TenNhanVien

Select *
From C6_View

/* Câu 7. View */
Create view C7_View as
	Select T3.TenNhanVien, SUM(T4.SoLuongNhap*T4.DonGiaNhap) as 'Tổng lượng tiền xuất'
	From T4_Nhap T4, T3_NhanVien T3
	Where T3.MaNhanVien=T4.MaNhanVien
		 and T4.NgayNhap>='2018/8/1' and T4.NgayNhap<='2018/8/31'
	Group by T3.TenNhanVien
	Having SUM(T4.SoLuongNhap*T4.DonGiaNhap)>100000

Select *
From C7_View

/* Câu 8. View */
Create view C8_View as
	Select *
	From T4_Nhap T4
	Where T4.MaSanPham NOT IN (Select T5.MaSanPham From T5_Xuat T5)

Select *
From C8_View

/* Câu 9. View */
Create view C9_View as
	Select *
	From T4_Nhap T4
	Where T4.NgayNhap>='2018/1/1' and T4.NgayNhap<='2018/12/31'
		  and T4.MaSanPham IN (Select T5.MaSanPham 
								From T5_Xuat T5
								Where T5.NgayXuat>='2018/1/1' and T5.NgayXuat<='2018/12/31')

Select *
From C9_View

/* Câu 10. View */
Create view C10_View as
	Select DISTINCT (T4.MaNhanVien), T3.TenNhanVien
	From T4_Nhap T4, T3_NhanVien T3
	Where T4.MaNhanVien IN (Select T5.MaNhanVien
							From T5_Xuat T5)
			and T4.MaNhanVien=T3.MaNhanVien

Select *
From C10_View

/* Câu 11. View */
Create view C11_View as
	Select DISTINCT (T4.MaNhanVien), T3.TenNhanVien
	From T4_Nhap T4, T3_NhanVien T3
	Where T4.MaNhanVien NOT IN (Select T5.MaNhanVien
							From T5_Xuat T5)
			and T4.MaNhanVien=T3.MaNhanVien

Select *
From C11_View

/* Tuần 3 - Lab 5:Hàm */
/* Câu 1: Hãy xây dựng hàm đưa ra tên hangsx khi nhập vào masp từ bàn phím */
Select *
From T1_SanPham

Create function	Cau1_Function (@MaSanPham nvarchar(10))
returns nvarchar(20) as
	begin
		Declare @KetQua nvarchar(20)
		set @KetQua= (Select T2.TenHang
					 From T1_SanPham T1, T2_HangSanXuat T2
				     Where T1.MaHangSanXuat=T2.MaHangSanXuat and T1.MaSanPham=@MaSanPham)
		return @KetQua
	end

Exec dbo.Cau1_Function 'SP01'
Select dbo.Cau1_Function('SP01')
print dbo.Cau1_Function('SP01')
/* Câu 2: Hãy xây dựng hàm đưa ra tổng giá trị nhập từ năm nhập x đến năm nhập y
với x,y được nhập từ bàn phím */


/* Câu 3: Hãy viết hàm thống kê	tổng số lượng thay đổi nhập xuất của tên sản phẩm x trong
năm y, với x,y được nhập từ bàn phím */


/* Câu 4: Hãy xây dựng hàm đưa ra tổng giá trị nhập từ ngày nhập x đến ngày nhập y,
với x, y được nhập từ bàn phím */
