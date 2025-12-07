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
-- 1. Tạo bảng ảo hiển thị danh sách nhân viên (MANV, HOTEN), ngày cấp thẻ nhân viên tương ứng với từng nhân viên
CREATE VIEW DSNV
AS (SELECT NV.MANV, NV.HOTEN, TNV.NGAYCAP
	FROM NHANVIEN NV, THENHANVIEN TNV
	WHERE NV.MANV = TNV.MANV)

SELECT * FROM DSNV
-- 2. Tìm những nhân viên (MANV, HOTEN, NGAYSINH, DIACHI, PHAI, LUONG, MANQL, MAPH) có lương trên 10.000.000 đồng
SELECT MANV, HOTEN, NGAYSINH, DIACHI, PHAI, LUONG, MANQL, MAPH
FROM NHANVIEN
WHERE LUONG > 10000000

-- 3. Cho biết họ tên của những nhân viên nam ở TP. HCM hoặc nhân viên nữ ở Hà Nội
SELECT HOTEN
FROM NHANVIEN
WHERE (PHAI = N'Nam' AND DIACHI LIKE N'TP.HCM')
   OR (PHAI = N'Nữ' AND DIACHI LIKE N'Hà Nội')

-- 4. Cho biết mã người quản lý của nhân viên Nguyễn Kim Ánh
SELECT MANQL
FROM NHANVIEN
WHERE HOTEN = N'Nguyễn Kim Ánh'

-- 5. Tìm mã và họ tên những nhân viên thuộc phòng Quản trị
SELECT NV.MANV, NV.HOTEN
FROM NHANVIEN NV, PHONGBAN PB
WHERE NV.MAPH = PB.MAPH AND PB.TENPH = N'Quản trị'

-- 6. Liệt kê danh sách gồm mã, họ tên và địa chỉ của những nhân viên thuộc phòng Nhân sự
SELECT NV.MANV, NV.HOTEN, NV.DIACHI
FROM NHANVIEN NV, PHONGBAN PB
WHERE NV.MAPH = PB.MAPH AND PB.TENPH = N'Nhân sự'

-- 7. Cho biết ngày sinh, địa chỉ và tên phòng làm việc của nhân viên Trần Lệ Quyên
SELECT NV.NGAYSINH, NV.DIACHI, PB.TENPH
FROM NHANVIEN NV, PHONGBAN PB
WHERE NV.MAPH = PB.MAPH AND NV.HOTEN = N'Trần Lệ Quyên'

-- 8. Tìm những nhân viên có lương lớn hơn 15.000.000 đồng ở phòng Nhân sự hoặc lương lớn hơn 20.000.000 đồng ở phòng Quản trị. Thông tin bao gồm tất cả các cột trên bảng NHANVIEN
SELECT NV.*
FROM NHANVIEN NV, PHONGBAN PB
WHERE NV.MAPH = PB.MAPH
  AND ((PB.TENPH = N'Nhân sự' AND NV.LUONG > 15000000) OR (PB.TENPH = N'Quản trị' AND NV.LUONG > 20000000))

-- 9. Phòng Quản trị có bao nhiêu nhân viên?
SELECT COUNT(*) AS N'Số lượng nhân viên'
FROM NHANVIEN NV, PHONGBAN PB
WHERE NV.MAPH = PB.MAPH AND PB.TENPH = N'Quản trị'

-- 10. Tìm tên những nữ nhân viên và tên người thân của họ
SELECT NV.HOTEN, TN.TENTN
FROM NHANVIEN NV, THANNHAN TN
WHERE NV.MANV = TN.MANV AND NV.PHAI = N'Nữ'

-- 11. Với mỗi phòng ban liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó
SELECT PB.TENPH, AVG(NV.LUONG) AS LUONG_TB
FROM PHONGBAN PB, NHANVIEN NV
WHERE PB.MAPH = NV.MAPH
GROUP BY PB.TENPH

-- 12. Cho biết danh sách nhân viên (MANV, HOTEN) không làm quản lý
SELECT MANV, HOTEN
FROM NHANVIEN
WHERE MANV NOT IN (	SELECT DISTINCT MANQL 
					FROM NHANVIEN 
					WHERE MANQL IS NOT NULL	)

-- 13. Cho biết danh sách những nhân viên làm quản lý (MANQL, HOTEN)
SELECT DISTINCT NV.MANV AS MANQL, NV.HOTEN
FROM NHANVIEN NV
WHERE NV.MANV IN (	SELECT MANQL 
					FROM NHANVIEN 
					WHERE MANQL IS NOT NULL	)

-- 14. Cho biết danh sách những nhân viên (MANV, HOTEN) không có thân nhân
SELECT NV.MANV, NV.HOTEN
FROM NHANVIEN NV
WHERE NV.MANV NOT IN (	SELECT TN.MANV 
						FROM THANNHAN TN	)

-- 15. Cho biết mã và họ tên nhân viên có lương thấp nhất
SELECT MANV, HOTEN
FROM NHANVIEN
WHERE LUONG = (	SELECT MIN(LUONG) 
				FROM NHANVIEN	)

-- 16. Cho biết mã và họ tên nhân viên có lương cao nhất phòng Nhân sự
SELECT NV.MANV, NV.HOTEN
FROM NHANVIEN NV, PHONGBAN PB
WHERE NV.MAPH = PB.MAPH AND	PB.TENPH = N'Nhân sự' AND NV.LUONG = (	SELECT MAX(NV2.LUONG)
																	FROM NHANVIEN NV2
																	JOIN PHONGBAN PB2 ON NV2.MAPH = PB2.MAPH
																	WHERE PB2.TENPH = N'Nhân sự'	)

-- 17. Cho biết tên những đề án có ít nhất hai nhân viên tham gia
SELECT DA.TENDA
FROM DEAN DA, PHANCONG PC
WHERE DA.MADA = PC.MADA
GROUP BY DA.TENDA
HAVING COUNT(DISTINCT PC.MANV) >= 2

-- 18. Những nhân viên nào (MANV, HOTEN) tham gia cả hai đề án DA003 và DA004?
SELECT NV.MANV, NV.HOTEN
FROM NHANVIEN NV
WHERE NV.MANV IN (	SELECT PC1.MANV
					FROM PHANCONG PC1, PHANCONG PC2
					WHERE PC1.MANV = PC2.MANV AND PC1.MADA = 'DA003' AND PC2.MADA = 'DA004'	)

-- 19. Những nhân viên nào (HOTEN) có lương lớn hơn lương cao nhất của các nhân viên phòng Quản trị?
SELECT HOTEN
FROM NHANVIEN
WHERE LUONG > (	SELECT MAX(NV.LUONG)
				FROM NHANVIEN NV, PHONGBAN PB
				WHERE NV.MAPH = PB.MAPH AND PB.TENPH = N'Quản trị'	)

-- 20. Phòng ban nào có số nhân viên nhiều hơn số nhân viên của phòng Kế hoạch?
SELECT PB.TENPH
FROM PHONGBAN PB, NHANVIEN NV
WHERE PB.MAPH = NV.MAPH
GROUP BY PB.TENPH
HAVING COUNT(NV.MANV) > (	SELECT COUNT(*)
							FROM NHANVIEN NV2, PHONGBAN PB2
							WHERE NV2.MAPH = PB2.MAPH AND PB2.TENPH = N'Kế hoạch'	)

-- 21. Liệt kê ba nhân viên (MANV, HOTEN) có mức lương cao nhất
SELECT TOP 3 MANV, HOTEN
FROM NHANVIEN
ORDER BY LUONG DESC

-- 22. Cập nhật tăng 10% lương cho những nhân viên đã từng tham gia ít nhất hai đề án
UPDATE NHANVIEN
SET LUONG = LUONG * 1.1
WHERE MANV IN (	SELECT MANV
				FROM PHANCONG
				GROUP BY MANV
				HAVING COUNT(DISTINCT MADA) >= 2	)

-- 23. Cho biết mã và họ tên những nhân viên tham gia tất cả các đề án
SELECT NV.MANV, NV.HOTEN
FROM NHANVIEN NV
WHERE NV.MANV IN (	SELECT PC.MANV
					FROM PHANCONG PC
					GROUP BY PC.MANV
					HAVING COUNT(DISTINCT PC.MADA) = (	SELECT COUNT(*)
														FROM DEAN	)	)

-- 24. Có bao nhiêu đề án bắt đầu từ ngày 01/01/2016?
SELECT COUNT(*) AS N'Số đề án'
FROM DEAN
WHERE NGAYBD >= '2016-01-01'

-- 25. Tầng 1 nhà A có bao nhiêu phòng ban?
SELECT COUNT(*) AS N'Số phòng ban'
FROM PHONGBAN
WHERE DIADIEM = N'Tầng 1 nhà A'

-- 26. Cho biết danh sách những nhân viên làm quản lý (MANV, HOTEN) và số lượng nhân viên thuộc nhân viên đó quản lý
SELECT NV.MANV, NV.HOTEN, COUNT(NV2.MANV) AS N'Số lượng nhân viên quản lý'
FROM NHANVIEN NV, NHANVIEN NV2 
WHERE NV.MANV = NV2.MANQL
GROUP BY NV.MANV, NV.HOTEN

-- 27. Cho biết danh sách những nhân viên (MANV, HOTEN) quản lý từ 2 nhân viên trở lên
SELECT NV.MANV, NV.HOTEN
FROM NHANVIEN NV, NHANVIEN NV2 
WHERE NV.MANV = NV2.MANQL
GROUP BY NV.MANV, NV.HOTEN
HAVING COUNT(NV2.MANV) >= 2