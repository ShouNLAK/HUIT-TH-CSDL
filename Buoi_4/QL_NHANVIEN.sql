CREATE DATABASE QL_NHANVIEN
USE QL_NHANVIEN
--
CREATE TABLE PHONGBAN
(
	MAPH char(6) not null,
	TENPH nvarchar(30),
	DIADIEM nvarchar(40),
	CONSTRAINT PK_PHONGBAN primary key (MAPH)
)

CREATE TABLE NHANVIEN
(
	MANV char(6) not null,
	HOTEN nvarchar(40),
	NGAYSINH date,
	PHAI nchar(3),
	DIACHI nvarchar(50),
	LUONG money,
	MANQL char(6),
	MAPH char(6),
	CONSTRAINT PK_NHANVIEN primary key (MANV),
	CONSTRAINT FK_NHANVIEN_PHONGBAN foreign key (MAPH) references PHONGBAN(MAPH)
)

CREATE TABLE DEAN
(
	MADA char(5) not null,
	TENDA nvarchar(50),
	DIADIEMDA nvarchar(30),
	NGAYBD date,
	CONSTRAINT PK_DEAN primary key (MADA)
)

CREATE TABLE PHANCONG
(
	MANV char(6) not null,
	MADA char(5) not null,
	NGAYPC date,
	CONSTRAINT PK_PHANCONG primary key (MANV,MADA),
	CONSTRAINT FK_PHANCONG_NHANVIEN foreign key (MANV) references NHANVIEN(MANV),
	CONSTRAINT FK_PHANCONG_DEAN foreign key (MADA) references DEAN(MADA)
)

CREATE TABLE THANNHAN
(
	MANV char(6) not null,
	TENTN nvarchar(40) not null,
	PHAI nchar(3),
	NGAYSINH date,
	QUANHE nvarchar(15),
	CONSTRAINT PK_THNANNHAN primary key (MANV),
	CONSTRAINT FK_THANNHAN_NHANVIEN foreign key (MANV) references NHANVIEN(MANV)
)

CREATE TABLE THENHANVIEN
(
	MANV char(6) not null,
	NGAYCAP date,
	CONSTRAINT PK_THENHHANVIEN primary key (MANV),
	CONSTRAINT FK_THENHANVIEN_NHANVIEN foreign key (MANV) references NHANVIEN(MANV)
)
--
INSERT INTO PHONGBAN VALUES ('PH001',N'Kế hoạch',N'Tầng 1 nhà A'),
							('PH002',N'Quản trị',N'Tầng 1 nhà B'),
							('PH003',N'Nhân sự', N'Tầng 2 nhà A'),
							('PH004',N'Tài vụ',N'Tầng 3 nhà A'),
							('PH005',N'Đầu tư',N'Tầng 2 nhà B'),
							('PH006',N'Vật tư',N'Tầng 3 nhà B'),
							('PH007',N'Tư vấn',N'Tầng 3 nhà B')
SET DATEFORMAT DMY
INSERT INTO NHANVIEN VALUES ('NV001',N'Nguyễn Văn Nam',	'12-07-1988',	N'Nam',	N'Tây Ninh',	15000000,	'NV009',	'PH003'),
							('NV002',N'Nguyễn Kim Ánh',	'10-02-1990',	N'Nữ',	N'TP.HCM',		8000000,	'NV009',	'PH003'),
							('NV003',N'Nguyễn Thị Châu','12-10-1979',	N'Nữ',	N'Vũng Tàu',	12000000,	'NV006',	'PH003'),
							('NV004',N'Trần Văn Út',	'23-08-1977',	N'Nam',	N'Hà Nội',		7000000,	'NV005',	'PH002'),
							('NV005',N'Trần Lệ Quyên',	'22-12-1987',	N'Nữ',	N'Hà Nội',		9000000,	'NV005',	'PH002'),
							('NV006',N'Bùi Đức Chí',	'10-11-1987',	N'Nam',	N'TP.HCM',		10000000,	'NV008',	'PH003'),
							('NV007',N'Nguyễn Tuấn Anh','06-09-1991',	N'Nam',	N'Tây Ninh',	35000000,	'NV002',	'PH003'),
							('NV008',N'Đỗ Xuân Thủy',	'14/05/1985' ,	N'Nam', N'TP. HCM',		21000000,	'NV0002',	'PH002'),
							('NV009',N'Trần Minh Tú',	'17-09-1985',	N'Nam', N'Đồng Nai',	18000000,	null,		'PH001'),
							('NV010',N' Trần Khánh An',	'13-11-1987',	N'Nữ',	N'Khánh Hòa',	12000000,	null,		null),
							('NV011',N'Nguyễn Ngọc Phan','02-06-1995',	N'Nam', N'Đồng Nai',	13000000,	null,		null)

INSERT INTO DEAN VALUES ('DA001',N'Đền bù giải tỏa','Phường 12, Q. Tân Bình','01/01/2015'),
						('DA002',N'Giải phóng mặt bằng','Phường 12, Q. Tân Bình','01/06/2015'),
						('DA003',N'Cải tạo mặt đường số 9','Phường Tây Thạnh, Q. Tân Phú','01/01/2016'),
						('DA004',N'Bắt đầu thi công','Phường 26, Q. Bình Thạnh','04/05/2016'),
						('DA005',N'Hoàn thiện thi công','Phường Tân Quy, Q. Tân Bình','10/12/2016')

INSERT INTO PHANCONG VALUES ('NV001',N'DA001','05/02/2015'),
							('NV002',N'DA003','17/03/2016'),
							('NV003',N'DA003','01/01/2016'),
							('NV005',N'DA004','10/05/2016'),
							('NV007',N'DA005','20/12/2016')

INSERT INTO THANNHAN VALUES ('NV001',N'Nguyễn Văn Bình',N'Nam','22/05/1983',N'Anh'),
							('NV002',N'Nguyễn Chính Nghĩa',N'Nam','07/03/1998',N'Em'),
							('NV005',N'Lê Anh Hùng',N'Nam','05/04/1978',N'Chồng'),
							('NV006',N'Bùi Đại An',N'Nam','03/12/1985',N'Anh'),
							('NV008',N'Lê Thảo Nguyên',N'Nữ','12/06/1985',N'Vợ'),
							('NV009',N'Trần Thanh Nhàn',N'Nữ','30/05/1979',N'Chị')

INSERT INTO THENHANVIEN VALUES  ('NV001','05/03/2018'),
								('NV002','17/03/2019'),
								('NV003','01/01/2020'),
								('NV004','10/05/2020'),
								('NV005','20/12/2021')
--
SELECT * FROM PHONGBAN
SELECT * FROM NHANVIEN
SELECT * FROM DEAN
SELECT * FROM PHANCONG
SELECT * FROM THANNHAN
SELECT * FROM THENHANVIEN
--
-- Ví dụ 2.12 : Cho biết tên phòng ban có nhiều nhân viên nhất
SELECT TenPH
FROM NHANVIEN NV, PHONGBAN PB
WHERE NV.MAPH = PB.MAPH
GROUP BY TENPH
HAVING COUNT(*) >= ALL (
						SELECT COUNT(*)
						FROM NHANVIEN
						GROUP BY MAPH 
						)
--
-- Ví dụ 2.13 : Kết hợp thông tin Nhân Viên và Thân Nhân về cùng 1 kết quả
SELECT MANV,HOTEN FROM NHANVIEN
UNION
SELECT MANV,TENTN FROM THANNHAN
--
-- Ví dụ 2.14 : Từ 2.13, sắp xêp theo mã nhân viên và tên tăng dần
SELECT MANV,HOTEN FROM NHANVIEN
UNION
SELECT MANV,TENTN FROM THANNHAN
ORDER BY MANV,HOTEN
-- Ví dụ 2.15 : Cho biết mã nhân viên đang được phân công
SELECT MANV FROM NHANVIEN
INTERSECT
SELECT MANV FROM PHANCONG
-- Ví dụ 2.16 : Cho biết mã nhân viên chưa được phân công
SELECT MANV FROM NHANVIEN
EXCEPT
SELECT MANV FROM PHANCONG
-- Ví dụ 2.17 : Cho biết thông tin nhân viên ở phòng Quản trị
SELECT NHANVIEN.*
FROM NHANVIEN
INNER JOIN PHONGBAN on NHANVIEN.MAPH = PHONGBAN.MAPH
WHERE TENPH = N'Quản trị'
-- Ví dụ 2.18 : Cho biết họ tên của tất cả nhân viên và tình trạng phân công đề án
SELECT HOTEN,MADA,NGAYPC
FROM NHANVIEN
LEFT JOIN PHANCONG on NHANVIEN.MANV = PHANCONG.MANV
-- Ví dụ 2.19 : Những nhân viên không được phân công đề án
SELECT HOTEN,MADA,NGAYPC
FROM NHANVIEN
LEFT JOIN PHANCONG on NHANVIEN.MANV = PHANCONG.MANV
WHERE MADA IS NULL
-- Ví dụ 2.20 : Cho biết họ tên của nhân viên và tình trạng phân công đề án của tất cả đề án
SELECT HOTEN,MADA
FROM NHANVIEN
RIGHT JOIN PHANCONG on NHANVIEN.MANV = PHANCONG.MANV
-- Ví dụ 2.21 : Cho biết danh sách nhân viên và danh sách phòng ban tương ứng
SELECT HOTEN,PHONGBAN.MAPH
FROM NHANVIEN
FULL JOIN PHONGBAN on NHANVIEN.MAPH = PHONGBAN.MAPH
-- Ví dụ 2.22 : Nhập dữ liệu sử dụng thông tin từ bảng khác
CREATE TABLE NV_NHANSU
(
	MANV char(6) not null,
	HOTEN nvarchar(40),
)
INSERT INTO NV_NHANSU
SELECT MaNV,HOTEN
FROM NHANVIEN, PHONGBAN
WHERE NHANVIEN.MAPH = PHONGBAN.MAPH AND TENPH = N'Nhân sự'
SELECT * FROM NV_NHANSU
