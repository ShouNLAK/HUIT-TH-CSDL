CREATE DATABASE QL_SINHVIEN
USE QL_SINHVIEN
--
CREATE TABLE KHOA
(
    MAKH char(2) not null,
    TENKH nvarchar(50),
    CONSTRAINT PK_KHOA primary key (MAKH)
)
CREATE TABLE LOP
(
    MALOP char(7) not null,
    TENLOP nvarchar(50),
    SISO int,
    LOPTRUONG char(5) not null,
    MAKH char(2) not null,
    CONSTRAINT PK_LOP primary key (MALOP),
    CONSTRAINT FK_LOP_KHOA foreign key (MAKH) references KHOA(MAKH)
)
CREATE TABLE SINHVIEN
(
    MASV char(5) not null,
    HOTEN nvarchar(50),
    NGAYSINH date,
    GTINH nchar(3),
    DIACHI nvarchar(100),
    MALOP char(7) not null,
    CONSTRAINT PK_SINHVIEN primary key (MASV),
    CONSTRAINT FK_SINHVIEN_LOP foreign key (MALOP) references LOP(MALOP)
)
CREATE TABLE GIANGVIEN
(
    MAGV char(5) not null,
    TENGV nvarchar(50),
    MAKH char(2) not null,
    CONSTRAINT PK_GIANGVIEN primary key (MAGV),
    CONSTRAINT FK_GIANGVIEN_KHOA foreign key (MAKH) references KHOA(MAKH)
)
CREATE TABLE MONHOC
(
    MAMH char(4) not null,
    TENMH nvarchar(50),
    SOTC int,
    CONSTRAINT PK_MONHOC primary key (MAMH)
)
CREATE TABLE DIEM
(
    MASV char(5) not null,
    MAMH char(4) not null,
    LANTHI int,
    DIEMTHI float,
    CONSTRAINT PK_DIEM primary key (MASV, MAMH, LANTHI),
    CONSTRAINT FK_DIEM_SINHVIEN foreign key (MASV) references SINHVIEN(MASV),
    CONSTRAINT FK_DIEM_MONHOC foreign key (MAMH) references MONHOC(MAMH)
)
CREATE TABLE GIANGDAY
(
    MAGV char(5) not null,
    MAMH char(4) not null,
    NAMHOC nvarchar(9),
    HOCKY int,
    CONSTRAINT PK_GIANGDAY primary key (MAGV, MAMH, HOCKY, NAMHOC),
    CONSTRAINT FK_GIANGDAY_GIANGVIEN foreign key (MAGV) references GIANGVIEN(MAGV),
    CONSTRAINT FK_GIANGDAY_MONHOC foreign key (MAMH) references MONHOC(MAMH)
)
CREATE TABLE THANNHAN
(
    MATN char(5) not null,
    HOTEN nvarchar(40) not null,
    GIOITINH nchar(3),
    CONSTRAINT PK_THANNHAN primary key (MATN)
)
CREATE TABLE QUANHE
(
    MATN char(5) not null,
    MASV char(5) not null,
    QUANHE nvarchar(15),
    CONSTRAINT PK_QUANHE primary key (MATN, MASV),
    CONSTRAINT FK_QUANHE_THANNHAN foreign key (MATN) references THANNHAN(MATN),
    CONSTRAINT FK_QUANHE_SINHVIEN foreign key (MASV) references SINHVIEN(MASV)
)
--
INSERT INTO KHOA
VALUES  ('SH', N'Công nghệ sinh học'),
        ('TH', N'Công nghệ thông tin'),
        ('TC', N'Tài chính kế toán'),
        ('QT', N'Quản trị kinh doanh'),
        ('TP', N'Công nghệ thực phẩm')

INSERT INTO MONHOC 
VALUES  ('CSDL', N'Cơ sở dữ liệu', 3),
        ('KTLT', N'Kỹ thuật lập trình', 3),
        ('THVP', N'Tin học văn phòng', 3),
        ('TRR', N'Toán rời rạc', 3),
        ('TTNT', N'Trí tuệ nhân tạo', 2),
        ('TTQT', N'Thanh toán quốc tế', 2)

INSERT INTO GIANGVIEN
VALUES  ('GV001', N'Phạm Thế Bảo', 'TH'),
        ('GV002', N'Lê Thế Truyền', 'TH'),
        ('GV003', N'Trương Anh Dũng', 'SH'),
        ('GV004', N'Bùi Chí Anh', 'TC'),
        ('GV005', N'Lê Công Hậu', 'QT'),
        ('GV006', N'Lê Trung Thành', 'TP')

INSERT INTO LOP 
VALUES  ('10DHSH1', N'10 Đại học Sinh học 1', 55, 'SV008', 'SH'),
        ('10DHTH1', N'10 Đại học Tin học 1', 50, 'SV001', 'TH'),
        ('11DHTH2', N'11 Đại học Tin học 2', 40, 'SV005', 'TH'),
        ('12DHTC1', N'12 Đại học Tài chính 1', 75, 'SV009', 'TC'),
        ('12DHTP1', N'12 Đại học Thực phẩm 1', 60, 'SV007', 'TP')

INSERT INTO SINHVIEN 
VALUES  ('SV001', N'Trần Lệ Quyên', '1995-01-21', N'Nữ', N'TPHCM', '10DHTH1'),
        ('SV002', N'Nguyễn Thế Bình', '1996-06-04', N'Nam', N'Tây Ninh', '11DHTH2'),
        ('SV003', N'Tô Ánh Nguyệt', '1995-05-02', N'Nữ', N'Vũng Tàu', '12DHTP1'),
        ('SV004', N'Nguyễn Thế Anh', '1996-12-15', N'Nam', N'Đồng Nai', '12DHTP1'),
        ('SV005', N'Lê Thanh Bình', '1994-12-09', N'Nam', N'Long An', '10DHTH1'),
        ('SV006', N'Phạm Quang Hậu', '1995-10-12', N'Nam', N'Tây Ninh', '10DHTH1'),
        ('SV007', N'Lê Cẩm Tú', '1989-02-13', N'Nữ', N'Bình Thuận', '12DHTP1'),
        ('SV008', N'Trương Thế Sang', '1993-04-04', N'Nam', N'Bình Dương', '10DHSH1'),
        ('SV009', N'Đậu Quang Ánh', '1994-12-03', N'Nam', N'Long An', '12DHTC1'),
        ('SV010', N'Huỳnh Kim Chi', '1996-10-18', N'Nữ', N'TPHCM', '11DHTH2'),
        ('SV011', N'Trịnh Đình Ánh', '1995-11-15', N'Nam', N'Bình Thuận', '10DHTH1')

INSERT INTO DIEM 
VALUES  ('SV001', 'CSDL', 1, 9),
        ('SV002', 'THVP', 1, 3),
        ('SV002', 'THVP', 2, 7),
        ('SV004', 'THVP', 1, 6),
        ('SV004', 'TTQT', 1, 5),
        ('SV005', 'CSDL', 1, 3),
        ('SV005', 'CSDL', 2, 6),
        ('SV006', 'KTLT', 1, 4),
        ('SV009', 'TTQT', 1, 4),
        ('SV010', 'THVP', 1, 8),
        ('SV010', 'TRR', 1, 7)

INSERT INTO GIANGDAY 
VALUES  ('GV001', 'CSDL', '2021-2022', 1),
        ('GV001', 'KTLT', '2020-2021', 2),
        ('GV001', 'TTNT', '2020-2021', 1),
        ('GV002', 'CSDL', '2021-2022', 2),
        ('GV002', 'KTLT', '2021-2022', 2)

INSERT INTO THANNHAN
VALUES  ('TN001', N'Nguyễn Thế Thành', N'Nam'),
        ('TN002', N'Tô Ánh Hồng', N'Nữ'),
        ('TN003', N'Lê Thanh An', N'Nam'),
        ('TN004', N'Phạm Thanh Tiến', N'Nữ'),
        ('TN006', N'Đậu Văn Thanh', N'Nam'),
        ('TN007', N'Nguyễn Thị Ánh', N'Nữ'),
        ('TN008', N'Lê Quang Định', N'Nam'),
        ('TN009', N'Huỳnh Văn Tư', N'Nam')

INSERT INTO QUANHE
VALUES  ('TN001', 'SV002', N'Bố'),
        ('TN001', 'SV004', N'Bố'),
        ('TN003', 'SV005', N'Bố'),
        ('TN004', 'SV007', N'Mẹ'),
        ('TN006', 'SV009', N'Bố'),
        ('TN007', 'SV002', N'Mẹ'),
        ('TN008', 'SV005', N'Bố')
--
SELECT * FROM KHOA
SELECT * FROM LOP
SELECT * FROM SINHVIEN
SELECT * FROM GIANGVIEN
SELECT * FROM MONHOC
SELECT * FROM DIEM
SELECT * FROM GIANGDAY
SELECT * FROM THANNHAN
SELECT * FROM QUANHE
--
-- 1 - 2 - 3
-- UNIQUE
ALTER TABLE KHOA
ADD CONSTRAINT UNI_KHOA_TENKH UNIQUE(TENKH)

ALTER TABLE LOP
ADD CONSTRAINT UNI_LOP_TENLOP UNIQUE(TENLOP)

ALTER TABLE MONHOC
ADD CONSTRAINT UNI_MONHOC_TENMH UNIQUE(TENMH)

-- DEFAULT
ALTER TABLE LOP
ADD CONSTRAINT DEF_LOP_LOPTR DEFAULT N'Chưa xác định' FOR LOPTRUONG

ALTER TABLE MONHOC
ADD CONSTRAINT DEF_MONHOC_SOTC DEFAULT 3 FOR SOTC

-- CHECK
ALTER TABLE SINHVIEN
ADD CONSTRAINT CHK_SINHVIEN_GTINH CHECK (GTINH IN (N'Nam', N'Nữ'))

ALTER TABLE THANNHAN
ADD CONSTRAINT CHK_THANNHAN_GIOITINH CHECK (GIOITINH IN (N'Nam', N'Nữ'))

ALTER TABLE LOP
ADD CONSTRAINT CHK_LOP_SISO CHECK (SISO >= 0)

ALTER TABLE MONHOC
ADD CONSTRAINT CHK_MONHOC_SOTC CHECK (SOTC >= 1)

ALTER TABLE DIEM
ADD CONSTRAINT CHK_DIEM_DIEMTHI CHECK (DIEMTHI >= 0 AND DIEMTHI <= 10),
    CONSTRAINT CHK_DIEM_LANTHI CHECK (LANTHI >= 1)

ALTER TABLE GIANGDAY
ADD CONSTRAINT CHK_GIANGDAY_HOCKY CHECK (HOCKY IN (1,2))

-- Không cho phép sinh viên thi quá 3 lần cho một môn
CREATE TRIGGER KT_LANTHI_TOIDA ON DIEM
AFTER INSERT, UPDATE
AS
    IF EXISTS (
        SELECT I.MASV, I.MAMH
        FROM INSERTED I
        JOIN DIEM D ON D.MASV = I.MASV AND D.MAMH = I.MAMH
        GROUP BY I.MASV, I.MAMH
        HAVING COUNT(D.LANTHI) < 3
    )
        COMMIT TRAN
    ELSE
        BEGIN
            PRINT N'Lỗi: Một sinh viên không được thi quá 3 lần cho một môn!';
            ROLLBACK TRANSACTION;
        END

-- Tự động cập nhật sĩ số lớp trong bảng LOP khi có thay đổi trong bảng SINHVIEN
CREATE TRIGGER CAPNHAT_SISO ON SINHVIEN
AFTER INSERT, DELETE, UPDATE
AS
    IF EXISTS (SELECT * FROM DELETED)
    BEGIN
        UPDATE LOP
        SET SISO = SISO - (
            SELECT COUNT(*) FROM DELETED D WHERE D.MALOP = LOP.MALOP
        )
        WHERE LOP.MALOP IN (SELECT MALOP FROM DELETED)
    END
    IF EXISTS (SELECT * FROM INSERTED)
    BEGIN
        UPDATE LOP
        SET SISO = SISO + (
            SELECT COUNT(*) FROM INSERTED I WHERE I.MALOP = LOP.MALOP
        )
        WHERE LOP.MALOP IN (SELECT MALOP FROM INSERTED)
    END
