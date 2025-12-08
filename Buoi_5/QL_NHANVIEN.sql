CREATE DATABASE QL_NHANVIEN
USE QL_NHANVIEN
--
CREATE TABLE PHONGBAN
(
	MAPH char(6) not null,
	TENPH nvarchar(30), -- UNIQUE - Bước 1(UNIQUE)
	DIADIEM nvarchar(40),
	-- CONSTRAINT UNI_TENPH UNIQUE(TENPH), - Bước 2 (UNIQUE)
	CONSTRAINT PK_PHONGBAN primary key (MAPH)
)
-- Bước 3 (UNIQUE)
ALTER TABLE PHONGBAN
ADD CONSTRAINT UNI_TENPH UNIQUE(TENPH)

CREATE TABLE NHANVIEN
(
	MANV char(6) not null,
	HOTEN nvarchar(40),
	NGAYSINH date,
	PHAI nchar(3),
	DIACHI nvarchar(50),
	LUONG money,
	-- CHECK(LUONG > 0) - Bước 1 (CHECK)
	MANQL char(6),
	MAPH char(6),
	-- CONSTRAINT CHK_LUONG CHECK (LUONG > 0) - Bước 2 (CHECK)
	CONSTRAINT PK_NHANVIEN primary key (MANV),
	CONSTRAINT FK_NHANVIEN_PHONGBAN foreign key (MAPH) references PHONGBAN(MAPH)
)
-- Bước 3 (CHECK)
ALTER TABLE NHANVIEN
ADD CONSTRAINT CHK_LUONG CHECK (LUONG > 0)

CREATE TABLE DEAN
(
	MADA char(5) not null,
	TENDA nvarchar(50),
	DIADIEMDA nvarchar(30), -- DEFAULT N'Chưa xác định' - Bước 1 (DEFAULT)
	NGAYBD date,
	CONSTRAINT PK_DEAN primary key (MADA)
	-- CONSTRAINT DEF_DIADIEMDA DEFAULT N'Chưa xác định' - Bước 2 (DEFAULT)
)
-- Bước 3 (DEFAULT)
ALTER TABLE DEAN
ADD CONSTRAINT DEF_DIADIEMDA DEFAULT N'Chưa xác định' FOR DIADIEMDA

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
							('NV008',N'Đỗ Xuân Thủy',	'14/05/1985' ,	N'Nam', N'TP. HCM',		21000000,	'NV002',	'PH002'),
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
-- 1. Kiểm tra ràng buộc lương lớn hơn 0 (CHECK)
INSERT INTO NHANVIEN
VALUES	('NV012',N'Nguyễn Ngọc Sơn','21-01-1999',	N'Nam', N'Vũng Tàu',	-2000000,	null,		null) -- Không thể thêm

INSERT INTO NHANVIEN
VALUES	('NV012',N'Nguyễn Ngọc Sơn','21-01-1999',	N'Nam', N'Vũng Tàu',	2000000,	null,		null) -- Thêm được
-- 2. Kiểm tra ràng buộc tên phòng không trùng nhau (UNIQUE)
INSERT INTO PHONGBAN
VALUES	('PH008',N'Kế hoạch',N'Tầng 2 nhà A') -- Không thể thêm

INSERT INTO NHANVIEN
VALUES	('PH008',N'Quản lý',N'Tầng 2 nhà A') -- Thêm được
-- 3.Kiểm tra ràng buộc giá trị mặc định
INSERT INTO DEAN(MADA,TENDA,NGAYBD)
VALUES ('DA006',N'Hoàn thiện nội thất','19/12/2016') -- Thêm được
-- 4. Xóa ràng buộc bất kỳ

ALTER TABLE NHANVIEN
ADD CONSTRAINT UNI_TENNV UNIQUE(HOTEN)

ALTER TABLE NHANVIEN
DROP CONSTRAINT UNI_TENNV
--------------------------------------------------------------------------
-- 1. Ràng buộc , Lương phải lớn hơn bằng 0
CREATE TRIGGER KT_LUONG ON NHANVIEN
FOR INSERT
AS
	IF (SELECT LUONG FROM INSERTED) > 0
		COMMIT TRAN
	ELSE
		BEGIN
			PRINT N' Lương phải lớn hơn 0 '
			ROLLBACK TRAN
		END
-- 2. Ràng buộc nhân viên sinh trước năm 1966
CREATE TRIGGER XOA_NV ON NHANVIEN
FOR DELETE
AS
	IF (SELECT YEAR(NGAYSINH) FROM DELETED) < 1966
		COMMIT TRAN
	ELSE
		BEGIN
			PRINT N'Không thể xóa nhân viên này'
			ROLLBACK TRAN
		END
-- 3. Ràng buộc tăng lương không vượt quá 10%
CREATE TRIGGER KT_CN_LUONG ON NHANVIEN
FOR UPDATE
AS
	IF (SELECT LUONG FROM INSERTED) <= 1.1 * (SELECT LUONG FROM DELETED)
		COMMIT TRAN
	ELSE
		BEGIN
			PRINT N'Tăng lương không quá 10%'
			ROLLBACK TRAN
		END
