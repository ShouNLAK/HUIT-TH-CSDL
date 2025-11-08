-- Quản lý linh kiện
CREATE DATABASE QL_LINHKIEN
USE QL_LINHKIEN
--
CREATE TABLE LOAILK
(
	MALOAI char(3) not null,
	TENLOAI nvarchar(50),
	Constraint PK_LOAILK primary key (MALOAI) 
)
CREATE TABLE LINHKIEN
(
	MALK char(6) not null,
	TENLK nvarchar(50),
	NGAYSX date,
	TGBH int,
	MALOAI char(3),
	NSX nvarchar (15),
	DVT char(5),
	Constraint PK_LINHKIEN primary key (MALK),
	Constraint FK_LINHKIEN_MALOAI foreign key (MALOAI) references LOAILK(MALOAI)
)
CREATE TABLE KHACHHANG
(
	MAKH char(5) not null,
	TENKH nvarchar(50),
	DIACHI nvarchar(15),
	DTHOAI char(10),
	Constraint PK_KHACHHANG primary key (MAKH)
)
CREATE TABLE HOADON
(
	MAHD char(5) not null,
	NGAYHD date,
	MAKH char(5),
    TONGTIEN money
	Constraint PK_HOADON primary key (MAHD),
	Constraint FK_HOADON_MAKH foreign key (MAKH) references KHACHHANG(MAKH)
)
CREATE TABLE CHITIETHD
(
	MAHD char(5) not null,
	MALK char(6) not null,
	SOLUONG int,
	DONGIA money,
	Constraint PK_CHITIETHD primary key (MAHD,MALK),
	Constraint FK_CHITIETHD_MAHD foreign key (MAHD) references HOADON(MAHD),
	Constraint FK_CHITIETHD_MALK foreign key (MALK) references LINHKIEN(MALK)
)
--
INSERT INTO LOAILK
VALUES	('MOU', N'Chuột'),
		('LAP', N'Máy tính xách tay'),
		('CPU', N'Bộ xử lý'),
		('PCX', N'Máy tính để bàn'),
		('MAI', N'Mainboard')

INSERT INTO LINHKIEN
VALUES	('MOU001', N'Chuột quang có dây', '2014-01-01', 12, 'MOU', 'Genius', N'Cái'),
		('MOU002', N'Chuột quang không dây', '2015-02-04', 12, 'MOU', 'Mitsumi', N'Cái'),
		('MOU003', N'Chuột không dây', '2014-04-02', 24, 'MOU', 'Abroad', N'Cái'),
		('CPU001', N'CPU ADM', '2015-04-05', 24, 'CPU', 'Abroad', N'Cái'),
		('CPU002', N'CPU INTEL', '2016-02-07', 36, 'CPU', 'Mitsumi', N'Cái'),
		('CPU003', N'CPU ASUS', '2015-12-08', 36, 'CPU', 'Abroad', N'Cái'),
		('MAI001', N'Mainboard ASUS', '2015-12-04', 36, 'MAI', 'Mitsumi', N'Cái'),
		('MAI002', N'Mainboard ATXX', '2016-03-01', 12, 'MAI', 'Mitsumi', N'Cái'),
		('MAI003', N'Mainboard ACER', '2015-04-14', 12, 'MAI', 'Genius', N'Cái'),
		('PCX001', N'Acer 20144', '2015-10-19', 12, 'PCX', 'Acer', N'Bộ')

INSERT INTO KHACHHANG
VALUES	('KH001', N'Nguyễn Thu Tâm', N'Tây Ninh', '0989751723'),
		('KH002', N'Đinh Bảo Lộc', N'Lâm Đồng', '0918234654'),
		('KH003', N'Trần Thanh Diệu', N'TP. HCM', '0978123765'),
		('KH004', N'Hồ Tuấn Thành', N'Hà Nội', '0909456768'),
		('KH005', N'Huỳnh Kim Ánh', N'Khánh Hòa', '0932987567')

INSERT INTO HOADON (MAHD, NGAYHD, MAKH) 
VALUES	('HD001', '2015-04-01', 'KH001'),
		('HD002', '2016-05-15', 'KH005'),
		('HD003', '2016-06-14', 'KH004'),
		('HD004', '2016-06-03', 'KH005'),
		('HD005', '2016-06-05', 'KH001'),
		('HD006', '2016-07-07', 'KH003'),
		('HD007', '2016-08-12', 'KH002'),
		('HD008', '2016-09-25', 'KH003')

INSERT INTO CHITIETHD 
VALUES	('HD001', 'MOU001', 2, 1000000),
		('HD002', 'MOU002', 1, 2000000),
		('HD003', 'MOU003', 6, 3000000),
		('HD004', 'CPU001', 5, 500000),
		('HD005', 'CPU002', 6, 560000),
		('HD006', 'CPU003', 3, 400000),
		('HD006', 'MAI001', 1, 200000),
		('HD007', 'MAI002', 1, 150000),
		('HD007', 'MAI003', 2, 160000),
		('HD007', 'MOU001', 1, 1000000)
--
SELECT * From LOAILK
SELECT * From LINHKIEN
SELECT * From KHACHHANG
SELECT * From HOADON
SELECT * From CHITIETHD
-- Cập nhật tổng tiền cho mỗi hóa đơn
UPDATE HOADON
SET TONGTIEN = (SELECT SUM(SOLUONG * DONGIA) 
                 FROM CHITIETHD 
                 WHERE HOADON.MAHD = CHITIETHD.MAHD)
-- Linh kiện được sản xuất bởi Genius có đơn vị tính là 'Cái'
SELECT * 
From LINHKIEN
WHERE NSX = 'Genius' AND DVT = N'Cái'
-- Linh kiện có thời gian bảo hành là 24 tháng
SELECT * 
From LINHKIEN
WHERE TGBH = 24
-- Hóa đơn được lập 06/2016
SELECT * 
From HOADON
WHERE MONTH(NGAYHD) = 6 AND YEAR(NGAYHD) = 2016
-- Tên và đơn vị tính của linh kiện có đơn giá lớn hơn 1 000 000
SELECT TENLK,DVT
FROM LINHKIEN LK, CHITIETHD CT
WHERE LK.MALK = CT.MALK AND CT.DONGIA > 1000000
-- Linh kiện được bán trước 31/05/2015
SELECT LK.MALK, TENLK, NSX, DVT
FROM LINHKIEN LK, CHITIETHD CT, HOADON HD
WHERE LK.MALK = CT.MALK AND CT.MAHD = HD.MAHD AND HD.NGAYHD < '2015-05-31'
-- Tổng số linh kiện HD007
SELECT SUM(SOLUONG) AS N'Tổng số linh kiện'
FROM CHITIETHD
WHERE MAHD = 'HD007'
-- Trong tháng 05/2016 số khách hàng ở Tây Ninh đến mua
SELECT COUNT(DISTINCT KH.MAKH) AS N'Số khách hàng'
FROM KHACHHANG KH, HOADON HD
WHERE KH.MAKH = HD.MAKH AND MONTH(HD.NGAYHD) = 5 AND YEAR(HD.NGAYHD) = 2016 AND KH.DIACHI = N'Tây Ninh'
-- SDT và địa chỉ của khách hàng có mã KH001.
SELECT DTHOAI, DIACHI
FROM KHACHHANG
WHERE MAKH = 'KH001'
-- Số đơn hàng của tháng 05/2016
SELECT COUNT(*) AS N'Số đơn hàng'
FROM HOADON
WHERE MONTH(NGAYHD) = 5 AND YEAR(NGAYHD) = 2016
-- Tổng tiền của hoá đơn HD006
SELECT HOADON.TONGTIEN AS N'Tổng tiền của hoá đơn HD006'
FROM HOADON
WHERE MAHD = 'HD006'
-- Tổng tiền của 2 hoá đơn HD005 và HD007
SELECT SUM(HOADON.TONGTIEN) AS N'Tổng tiền của 2 hoá đơn HD005 và HD007'
FROM HOADON
WHERE MAHD IN ('HD005', 'HD007')
-- Liệt kê MAHD và số linh kiện khác nhau trong từng hoá đơn.
SELECT MAHD, COUNT(DISTINCT MALK) AS N'Số linh kiện khác nhau'
FROM CHITIETHD
GROUP BY MAHD
-- Tên NSX và số linh kiện đã bán của từng NSX
SELECT LK.NSX, SUM(CT.SOLUONG) AS N'Số linh kiện đã bán'
FROM LINHKIEN LK
JOIN CHITIETHD CT ON LK.MALK = CT.MALK
GROUP BY LK.NSX
-- MAHD và tổng tiền của từng hoá đơn.
SELECT MAHD, TONGTIEN AS N'Tổng tiền của từng hoá đơn'
FROM HOADON
GROUP BY MAHD
-- Lập danh sách bao gồm TENKH và MAHD có tổng tiền lớn hơn 10.000.000 VNĐ.
SELECT KH.TENKH, HD.MAHD
FROM KHACHHANG KH, HOADON HD
WHERE KH.MAKH = HD.MAKH AND (SELECT SUM(SOLUONG * DONGIA)
                                FROM CHITIETHD
                                WHERE MAHD = HD.MAHD) > 10000000
-- Môi loại linh kiện có số linh kiện
SELECT LK.MALOAI, COUNT(CT.MALK) AS N'Số linh kiện'
FROM LOAILK LK, LINHKIEN CT
WHERE LK.MALOAI = CT.MALOAI
GROUP BY LK.MALOAI
-- MAHD có số linh kiện lớn hơn 10
SELECT MAHD
FROM CHITIETHD
GROUP BY MAHD
HAVING SUM(SOLUONG) > 10
-- Tổng tiền các hóa đơn ngày 07/07/2016
SELECT SUM(TONGTIEN) AS N'Tổng tiền các hóa đơn ngày 07/07/2016'
FROM HOADON
WHERE NGAYHD = '2016-07-07'
-- TENLK và SOLUONG trong HD007
SELECT LK.TENLK, CT.SOLUONG
FROM LINHKIEN LK, CHITIETHD CT
WHERE LK.MALK = CT.MALK AND CT.MAHD = 'HD007'

-- Quản lý thư viện
CREATE DATABASE QL_THUVIEN
USE QL_THUVIEN
--
CREATE TABLE TACGIA
(
    MATG char(5) not null,
    TENTG nvarchar(50),
    DIACHI nvarchar(25),
    Constraint PK_TACGIA primary key (MATG)
)
CREATE TABLE LOAISACH
(
    MALOAI char(2) not null,
    TENLOAI nvarchar(15),
    Constraint PK_LOAISACH primary key (MALOAI)
)
CREATE TABLE NHAXUATBAN
(   
    MANXB char(5) not null,
    TENNXB nvarchar(50),
    DCNXB nvarchar(25),
    DTNXB char(12),
    Constraint PK_NHAXUATBAN primary key (MANXB)
)
CREATE TABLE SACH
(
    MASH char(5) not null,
    TENSACH nvarchar(50),
    MATG char(5),
    NAMXB int,
    MANXB char(5),
    MALOAI char(2),
    Constraint PK_SACH primary key (MASH),
    Constraint FK_SACH_MATG foreign key (MATG) references TACGIA(MATG),
    Constraint FK_SACH_MANXB foreign key (MANXB) references NHAXUATBAN(MANXB),
    Constraint FK_SACH_MALOAI foreign key (MALOAI) references LOAISACH(MALOAI)
)
CREATE TABLE DOCGIA
(
    MADG char(5) not null,
    TENDG nvarchar(50),
    NGAYSINH date,
    GIOITINH nchar (3),
    LIENHE char(12),
    Constraint PK_DOCGIA primary key (MADG)
)
CREATE TABLE MUONTRASACH
(
    MADG char(5) not null,
    MASH char(5) not null,
    NGAYMUON date,
    NGAYTRA date,
    Constraint PK_MUONTRASACH primary key (MADG, MASH),
    Constraint FK_MUONTRASACH_MADG foreign key (MADG) references DOCGIA(MADG),
    Constraint FK_MUONTRASACH_MASH foreign key (MASH) references SACH(MASH)
)
--
INSERT INTO TACGIA 
VALUES  ('TG001', N'Nguyễn Hữu Anh', N'Q3, TP. HCM'),
        ('TG002', N'Tô Hoài', N'Bình Thạnh, TP. HCM'),
        ('TG003', N'Nguyễn Quang Sáng', N'Trảng Bàng, Tây Ninh'),
        ('TG004', N'Hồ Tùng Mậu', N'Trảng Bom, Đồng Nai'),
        ('TG005', N'Thi Anh Trung', N'Bến Lức, Long An'),
        ('TG006', N'Nguyễn Nhật Ánh', N'Q1, TP. HCM')

INSERT INTO LOAISACH 
VALUES  ('SH', N'SÁCH'),
        ('TR', N'TRUYỆN'),
        ('TC', N'TẠP CHÍ')


INSERT INTO NHAXUATBAN
VALUES  ('NXB05', 'Nhã Đông', 'Quận 10, TP. HCM', '08.765746767'),
        ('NXB04', 'Tổng Hợp', 'Quận Thanh Xuân, Hà Nội', '04.876847876'),
        ('NXB03', 'Thanh Niên', 'Quận 3, TP. HCM', '08.765475665'),
        ('NXB02', 'Đại học quốc gia Hà Nội', 'Quận Cầu Giấy, Hà Nội', '04.765476574'),
        ('NXB01', 'Đại học quốc gia TP.HCM', 'Quận 1, TP. HCM', '08.765348758')

INSERT INTO SACH
VALUES  ('TC001', 'Tạp chí Tin học và Điều khiển số 6/2015', 'TG003', 2015, 'NXB04', 'TC'),
        ('TR002', 'Bàn có 5 chỗ ngồi', 'TG006', 2000, 'NXB05', 'TR'),
        ('TR001', 'Dế mèn phiêu lưu ký', 'TG002', 1997, 'NXB05', 'TR'),
        ('SH001', 'Toán rời rạc', 'TG001', 1998, 'NXB01', 'SH'),
        ('SH002', 'Lập trình C#', 'TG004', 1998, 'NXB04', 'SH'),
        ('TC002', 'Tạp chí Tin học và Điều khiển số 9/2015', 'TG003', 2015, 'NXB04', 'TC')

SET DATEFORMAT dmy;
INSERT INTO DOCGIA 
VALUES  ('DG004', 'Nguyễn Thị Thanh Thanh', '02/02/1997', 'Nữ', '01231452370'),
        ('DG003', 'Trần Thanh Anh', '30/10/1989', 'Nữ', '0165900123'),
        ('DG002', 'Lê Văn Nam', '24/04/1994', 'Nam', '0982999011'),
        ('DG001', 'Nguyễn Thanh Nam', '13/09/1990', 'Nam', '01681234567')

INSERT INTO MUONTRASACH 
VALUES  ('DG004', 'SH002', '21/05/2016', '28/05/2016'),
        ('DG001', 'SH001', '01/06/2016', '02/06/2016'),
        ('DG003', 'TC001', '01/06/2016', '11/06/2016'),
        ('DG001', 'SH002', '01/06/2016', NULL);
--
SELECT * From TACGIA
SELECT * From LOAISACH
SELECT * From NHAXUATBAN
SELECT * From SACH
SELECT * From DOCGIA
SELECT * From MUONTRASACH
-- Các sách thuộc NXB 'Đại học quốc gia TP.HCM'
SELECT *
FROM SACH S, NHAXUATBAN NXB
WHERE S.MANXB = NXB.MANXB AND NXB.TENNXB = N'Đại học quốc gia TP.HCM'
-- Số sách mượn của độc giả 'Nguyễn Thanh Nam' trong ngày 01/06/2016
SELECT COUNT(*) AS N'Số sách mượn'
FROM MUONTRASACH MT, DOCGIA DG
WHERE MT.MADG = DG.MADG AND DG.TENDG = N'Nguyễn Thanh Nam' AND MT.NGAYMUON = '01/06/2016'
-- Cuốn sách của 'Nguyễn Hữu Anh'
SELECT S.TENSACH
FROM SACH S, TACGIA TG
WHERE S.MATG = TG.MATG AND TG.TENTG = N'Nguyễn Hữu Anh'
-- Số cuốn sách / loại sách
SELECT LS.TENLOAI, COUNT(S.MASH) AS N'Số cuốn sách'
FROM LOAISACH LS, SACH S
WHERE LS.MALOAI = S.MALOAI
GROUP BY LS.TENLOAI
-- Mã và tên độc giả mượn nhiều sách nhất
SELECT DG.MADG, DG.TENDG
FROM DOCGIA DG
WHERE DG.MADG = (SELECT TOP 1 MT.MADG
                  FROM MUONTRASACH MT
                  GROUP BY MT.MADG
                  ORDER BY COUNT(MT.MASH) DESC)
-- Mã và tên cuốn sách chưa được mượn
SELECT S.MASH, S.TENSACH
FROM SACH S
WHERE S.MASH NOT IN (SELECT MT.MASH FROM MUONTRASACH MT)
-- Độc giả mượn 3 cuốn sách
SELECT DG.MADG, DG.TENDG
FROM DOCGIA DG
WHERE DG.MADG IN (SELECT MT.MADG
                   FROM MUONTRASACH MT
                   GROUP BY MT.MADG
                   HAVING COUNT(MT.MASH) = 3)
