-- Qu?n lý linh ki?n
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
VALUES	('MOU', N'Chu?t'),
		('LAP', N'Máy tính xách tay'),
		('CPU', N'B? x? lý'),
		('PCX', N'Máy tính ?? bàn'),
		('MAI', N'Mainboard')

INSERT INTO LINHKIEN
VALUES	('MOU001', N'Chu?t quang có dây', '2014-01-01', 12, 'MOU', 'Genius', N'Cái'),
		('MOU002', N'Chu?t quang không dây', '2015-02-04', 12, 'MOU', 'Mitsumi', N'Cái'),
		('MOU003', N'Chu?t không dây', '2014-04-02', 24, 'MOU', 'Abroad', N'Cái'),
		('CPU001', N'CPU ADM', '2015-04-05', 24, 'CPU', 'Abroad', N'Cái'),
		('CPU002', N'CPU INTEL', '2016-02-07', 36, 'CPU', 'Mitsumi', N'Cái'),
		('CPU003', N'CPU ASUS', '2015-12-08', 36, 'CPU', 'Abroad', N'Cái'),
		('MAI001', N'Mainboard ASUS', '2015-12-04', 36, 'MAI', 'Mitsumi', N'Cái'),
		('MAI002', N'Mainboard ATXX', '2016-03-01', 12, 'MAI', 'Mitsumi', N'Cái'),
		('MAI003', N'Mainboard ACER', '2015-04-14', 12, 'MAI', 'Genius', N'Cái'),
		('PCX001', N'Acer 20144', '2015-10-19', 12, 'PCX', 'Acer', N'B?')

INSERT INTO KHACHHANG
VALUES	('KH001', N'Nguy?n Thu Tâm', N'Tây Ninh', '0989751723'),
		('KH002', N'?inh B?o L?c', N'Lâm ??ng', '0918234654'),
		('KH003', N'Tr?n Thanh Di?u', N'TP. HCM', '0978123765'),
		('KH004', N'H? Tu?n Thành', N'Hà N?i', '0909456768'),
		('KH005', N'Hu?nh Kim Ánh', N'Khánh Hòa', '0932987567')

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
-- C?p nh?t t?ng ti?n cho m?i hóa ??n
UPDATE HOADON
SET TONGTIEN = (SELECT SUM(SOLUONG * DONGIA) 
                 FROM CHITIETHD 
                 WHERE HOADON.MAHD = CHITIETHD.MAHD)
-- Linh ki?n ???c s?n xu?t b?i Genius có ??n v? tính là 'Cái'
SELECT * 
From LINHKIEN
WHERE NSX = 'Genius' AND DVT = N'Cái'
-- Linh ki?n có th?i gian b?o hành là 24 tháng
SELECT * 
From LINHKIEN
WHERE TGBH = 24
-- Hóa ??n ???c l?p 06/2016
SELECT * 
From HOADON
WHERE MONTH(NGAYHD) = 6 AND YEAR(NGAYHD) = 2016
-- Tên và ??n v? tính c?a linh ki?n có ??n giá l?n h?n 1 000 000
SELECT TENLK,DVT
FROM LINHKIEN LK, CHITIETHD CT
WHERE LK.MALK = CT.MALK AND CT.DONGIA > 1000000
-- Linh ki?n ???c bán tr??c 31/05/2015
SELECT LK.MALK, TENLK, NSX, DVT
FROM LINHKIEN LK, CHITIETHD CT, HOADON HD
WHERE LK.MALK = CT.MALK AND CT.MAHD = HD.MAHD AND HD.NGAYHD < '2015-05-31'
-- T?ng s? linh ki?n HD007
SELECT SUM(SOLUONG) AS N'T?ng s? linh ki?n'
FROM CHITIETHD
WHERE MAHD = 'HD007'
-- Trong tháng 05/2016 s? khách hàng ? Tây Ninh ??n mua
SELECT COUNT(DISTINCT KH.MAKH) AS N'S? khách hàng'
FROM KHACHHANG KH, HOADON HD
WHERE KH.MAKH = HD.MAKH AND MONTH(HD.NGAYHD) = 5 AND YEAR(HD.NGAYHD) = 2016 AND KH.DIACHI = N'Tây Ninh'
-- SDT và ??a ch? c?a khách hàng có mã KH001.
SELECT DTHOAI, DIACHI
FROM KHACHHANG
WHERE MAKH = 'KH001'
-- S? ??n hàng c?a tháng 05/2016
SELECT COUNT(*) AS N'S? ??n hàng'
FROM HOADON
WHERE MONTH(NGAYHD) = 5 AND YEAR(NGAYHD) = 2016
-- T?ng ti?n c?a hoá ??n HD006
SELECT HOADON.TONGTIEN AS N'T?ng ti?n c?a hoá ??n HD006'
FROM HOADON
WHERE MAHD = 'HD006'
-- T?ng ti?n c?a 2 hoá ??n HD005 và HD007
SELECT SUM(HOADON.TONGTIEN) AS N'T?ng ti?n c?a 2 hoá ??n HD005 và HD007'
FROM HOADON
WHERE MAHD IN ('HD005', 'HD007')
-- Li?t kê MAHD và s? linh ki?n khác nhau trong t?ng hoá ??n.
SELECT MAHD, COUNT(DISTINCT MALK) AS N'S? linh ki?n khác nhau'
FROM CHITIETHD
GROUP BY MAHD
-- Tên NSX và s? linh ki?n ?ã bán c?a t?ng NSX
SELECT LK.NSX, SUM(CT.SOLUONG) AS N'S? linh ki?n ?ã bán'
FROM LINHKIEN LK
JOIN CHITIETHD CT ON LK.MALK = CT.MALK
GROUP BY LK.NSX
-- MAHD và t?ng ti?n c?a t?ng hoá ??n.
SELECT MAHD, TONGTIEN AS N'T?ng ti?n c?a t?ng hoá ??n'
FROM HOADON
GROUP BY MAHD
-- L?p danh sách bao g?m TENKH và MAHD có t?ng ti?n l?n h?n 10.000.000 VN?.
SELECT KH.TENKH, HD.MAHD
FROM KHACHHANG KH, HOADON HD
WHERE KH.MAKH = HD.MAKH AND (SELECT SUM(SOLUONG * DONGIA)
                                FROM CHITIETHD
                                WHERE MAHD = HD.MAHD) > 10000000
-- Môi lo?i linh ki?n có s? linh ki?n
SELECT LLK.MALOAI,LLK.TENLOAI, COUNT(CT.MALK) AS N'S? linh ki?n'
FROM LOAILK LLK, LINHKIEN CT
WHERE LLK.MALOAI = CT.MALOAI
GROUP BY LLK.MALOAI,LLK.TENLOAI
-- MAHD có s? linh ki?n l?n h?n 10
SELECT MAHD
FROM CHITIETHD
GROUP BY MAHD
HAVING SUM(SOLUONG) > 10
-- T?ng ti?n các hóa ??n ngày 07/07/2016
SELECT SUM(TONGTIEN) AS N'T?ng ti?n các hóa ??n ngày 07/07/2016'
FROM HOADON
WHERE NGAYHD = '2016-07-07'
-- TENLK và SOLUONG trong HD007
SELECT LK.TENLK, CT.SOLUONG
FROM LINHKIEN LK, CHITIETHD CT
WHERE LK.MALK = CT.MALK AND CT.MAHD = 'HD007'
