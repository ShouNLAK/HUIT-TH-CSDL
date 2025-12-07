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
