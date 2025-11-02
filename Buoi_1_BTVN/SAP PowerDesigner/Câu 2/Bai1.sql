/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     11/02/2025 23:02:06                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHI_TIET_DAT_HANG') and o.name = 'FK_CHI_TIET_CHITIETDA_MATHANG')
alter table CHI_TIET_DAT_HANG
   drop constraint FK_CHI_TIET_CHITIETDA_MATHANG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHI_TIET_DAT_HANG') and o.name = 'FK_CHI_TIET_CHI_TIET__PHIEUDAT')
alter table CHI_TIET_DAT_HANG
   drop constraint FK_CHI_TIET_CHI_TIET__PHIEUDAT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHI_TIET_GIAO_HANG') and o.name = 'FK_CHI_TIET_CHITIETGI_MATHANG')
alter table CHI_TIET_GIAO_HANG
   drop constraint FK_CHI_TIET_CHITIETGI_MATHANG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHI_TIET_GIAO_HANG') and o.name = 'FK_CHI_TIET_CHI_TIET__PHIEUGIA')
alter table CHI_TIET_GIAO_HANG
   drop constraint FK_CHI_TIET_CHI_TIET__PHIEUGIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHI_TIET_HOA_DON') and o.name = 'FK_CHI_TIET_CHITIETHO_MATHANG')
alter table CHI_TIET_HOA_DON
   drop constraint FK_CHI_TIET_CHITIETHO_MATHANG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHI_TIET_HOA_DON') and o.name = 'FK_CHI_TIET_CHI_TIET__HOADON')
alter table CHI_TIET_HOA_DON
   drop constraint FK_CHI_TIET_CHI_TIET__HOADON
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATHANG') and o.name = 'FK_MATHANG_CHI_TIET__LOAIMATH')
alter table MATHANG
   drop constraint FK_MATHANG_CHI_TIET__LOAIMATH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHAN_PHOI') and o.name = 'FK_PHAN_PHO_PHAN_PHOI_NHACUNGC')
alter table PHAN_PHOI
   drop constraint FK_PHAN_PHO_PHAN_PHOI_NHACUNGC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHAN_PHOI') and o.name = 'FK_PHAN_PHO_PHAN_PHOI_MATHANG')
alter table PHAN_PHOI
   drop constraint FK_PHAN_PHO_PHAN_PHOI_MATHANG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUDATHANG') and o.name = 'FK_PHIEUDAT_CUNG_CAP_NHACUNGC')
alter table PHIEUDATHANG
   drop constraint FK_PHIEUDAT_CUNG_CAP_NHACUNGC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PHIEUDATHANG') and o.name = 'FK_PHIEUDAT_GIAO_HANG_PHIEUGIA')
alter table PHIEUDATHANG
   drop constraint FK_PHIEUDAT_GIAO_HANG_PHIEUGIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHI_TIET_DAT_HANG')
            and   name  = 'CHI_TIET_DAT_HANG2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHI_TIET_DAT_HANG.CHI_TIET_DAT_HANG2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHI_TIET_DAT_HANG')
            and   name  = 'CHI_TIET_DAT_HANG_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHI_TIET_DAT_HANG.CHI_TIET_DAT_HANG_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHI_TIET_DAT_HANG')
            and   type = 'U')
   drop table CHI_TIET_DAT_HANG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHI_TIET_GIAO_HANG')
            and   name  = 'CHI_TIET_GIAO_HANG2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHI_TIET_GIAO_HANG.CHI_TIET_GIAO_HANG2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHI_TIET_GIAO_HANG')
            and   name  = 'CHI_TIET_GIAO_HANG_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHI_TIET_GIAO_HANG.CHI_TIET_GIAO_HANG_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHI_TIET_GIAO_HANG')
            and   type = 'U')
   drop table CHI_TIET_GIAO_HANG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHI_TIET_HOA_DON')
            and   name  = 'CHI_TIET_HOA_DON2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHI_TIET_HOA_DON.CHI_TIET_HOA_DON2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHI_TIET_HOA_DON')
            and   name  = 'CHI_TIET_HOA_DON_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHI_TIET_HOA_DON.CHI_TIET_HOA_DON_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHI_TIET_HOA_DON')
            and   type = 'U')
   drop table CHI_TIET_HOA_DON
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HOADON')
            and   type = 'U')
   drop table HOADON
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOAIMATHANG')
            and   type = 'U')
   drop table LOAIMATHANG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATHANG')
            and   name  = 'CHI_TIET_LOAI_HANG_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATHANG.CHI_TIET_LOAI_HANG_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MATHANG')
            and   type = 'U')
   drop table MATHANG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHACUNGCAP')
            and   type = 'U')
   drop table NHACUNGCAP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHAN_PHOI')
            and   name  = 'PHAN_PHOI2_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHAN_PHOI.PHAN_PHOI2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHAN_PHOI')
            and   name  = 'PHAN_PHOI_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHAN_PHOI.PHAN_PHOI_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHAN_PHOI')
            and   type = 'U')
   drop table PHAN_PHOI
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUDATHANG')
            and   name  = 'GIAO_HANG_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUDATHANG.GIAO_HANG_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PHIEUDATHANG')
            and   name  = 'CUNG_CAP_FK'
            and   indid > 0
            and   indid < 255)
   drop index PHIEUDATHANG.CUNG_CAP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEUDATHANG')
            and   type = 'U')
   drop table PHIEUDATHANG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PHIEUGIAOHANG')
            and   type = 'U')
   drop table PHIEUGIAOHANG
go

/*==============================================================*/
/* Table: CHI_TIET_DAT_HANG                                     */
/*==============================================================*/
create table CHI_TIET_DAT_HANG (
   PHI_SODONDATHANG     varchar(15)          not null,
   MAT_MAHANG           varchar(15)          not null,
   SODONDATHANG         varchar(15)          not null,
   MAHANG               varchar(15)          not null,
   SOLUONGDAT           float                not null,
   constraint PK_CHI_TIET_DAT_HANG primary key (PHI_SODONDATHANG, MAT_MAHANG)
)
go

/*==============================================================*/
/* Index: CHI_TIET_DAT_HANG_FK                                  */
/*==============================================================*/




create nonclustered index CHI_TIET_DAT_HANG_FK on CHI_TIET_DAT_HANG (PHI_SODONDATHANG ASC)
go

/*==============================================================*/
/* Index: CHI_TIET_DAT_HANG2_FK                                 */
/*==============================================================*/




create nonclustered index CHI_TIET_DAT_HANG2_FK on CHI_TIET_DAT_HANG (MAT_MAHANG ASC)
go

/*==============================================================*/
/* Table: CHI_TIET_GIAO_HANG                                    */
/*==============================================================*/
create table CHI_TIET_GIAO_HANG (
   PHI_SOPHIEUGIAO      varchar(15)          not null,
   MAT_MAHANG           varchar(15)          not null,
   SOPHIEUGIAO          varchar(15)          not null,
   MAHANG               varchar(15)          not null,
   SOLUONGGIAO          int                  not null,
   DONGIAMUA            money                not null,
   constraint PK_CHI_TIET_GIAO_HANG primary key (PHI_SOPHIEUGIAO, MAT_MAHANG)
)
go

/*==============================================================*/
/* Index: CHI_TIET_GIAO_HANG_FK                                 */
/*==============================================================*/




create nonclustered index CHI_TIET_GIAO_HANG_FK on CHI_TIET_GIAO_HANG (PHI_SOPHIEUGIAO ASC)
go

/*==============================================================*/
/* Index: CHI_TIET_GIAO_HANG2_FK                                */
/*==============================================================*/




create nonclustered index CHI_TIET_GIAO_HANG2_FK on CHI_TIET_GIAO_HANG (MAT_MAHANG ASC)
go

/*==============================================================*/
/* Table: CHI_TIET_HOA_DON                                      */
/*==============================================================*/
create table CHI_TIET_HOA_DON (
   HOA_SOHOADON         varchar(15)          not null,
   MAT_MAHANG           varchar(15)          not null,
   SOHOADON             varchar(15)          not null,
   MAHANG               varchar(15)          not null,
   DONGIAMUA            money                not null,
   SOLUONGMUA           float                not null,
   constraint PK_CHI_TIET_HOA_DON primary key (HOA_SOHOADON, MAT_MAHANG)
)
go

/*==============================================================*/
/* Index: CHI_TIET_HOA_DON_FK                                   */
/*==============================================================*/




create nonclustered index CHI_TIET_HOA_DON_FK on CHI_TIET_HOA_DON (HOA_SOHOADON ASC)
go

/*==============================================================*/
/* Index: CHI_TIET_HOA_DON2_FK                                  */
/*==============================================================*/




create nonclustered index CHI_TIET_HOA_DON2_FK on CHI_TIET_HOA_DON (MAT_MAHANG ASC)
go

/*==============================================================*/
/* Table: HOADON                                                */
/*==============================================================*/
create table HOADON (
   SOHOADON             varchar(15)          not null,
   NGAYLAPHOADON        datetime             not null,
   TENKHACHHANG         varchar(50)          not null,
   DIACHIKHACHHANG      varchar(50)          not null,
   DIENTHOAIKHACHHANG   varchar(15)          not null,
   constraint PK_HOADON primary key (SOHOADON)
)
go

/*==============================================================*/
/* Table: LOAIMATHANG                                           */
/*==============================================================*/
create table LOAIMATHANG (
   MALOAIHANG           varchar(15)          not null,
   TENLOAIHANG          varchar(50)          not null,
   constraint PK_LOAIMATHANG primary key (MALOAIHANG)
)
go

/*==============================================================*/
/* Table: MATHANG                                               */
/*==============================================================*/
create table MATHANG (
   MAHANG               varchar(15)          not null,
   LOA_MALOAIHANG       varchar(15)          not null,
   TENHANG              varchar(50)          not null,
   DONVITINH            varchar(15)          not null,
   QUYCACH              varchar(20)          not null,
   SOLUONGTON           float(8)             not null,
   MALOAIHANG           varchar(15)          null,
   constraint PK_MATHANG primary key (MAHANG)
)
go

/*==============================================================*/
/* Index: CHI_TIET_LOAI_HANG_FK                                 */
/*==============================================================*/




create nonclustered index CHI_TIET_LOAI_HANG_FK on MATHANG (LOA_MALOAIHANG ASC)
go

/*==============================================================*/
/* Table: NHACUNGCAP                                            */
/*==============================================================*/
create table NHACUNGCAP (
   MANCC                varchar(12)          not null,
   TENNCC               varchar(50)          not null,
   DIACHINCC            varchar(50)          not null,
   DIENTHOAINCC         varchar(10)          not null,
   constraint PK_NHACUNGCAP primary key (MANCC)
)
go

/*==============================================================*/
/* Table: PHAN_PHOI                                             */
/*==============================================================*/
create table PHAN_PHOI (
   MANCC                varchar(12)          not null,
   MAHANG               varchar(15)          not null,
   constraint PK_PHAN_PHOI primary key (MANCC, MAHANG)
)
go

/*==============================================================*/
/* Index: PHAN_PHOI_FK                                          */
/*==============================================================*/




create nonclustered index PHAN_PHOI_FK on PHAN_PHOI (MANCC ASC)
go

/*==============================================================*/
/* Index: PHAN_PHOI2_FK                                         */
/*==============================================================*/




create nonclustered index PHAN_PHOI2_FK on PHAN_PHOI (MAHANG ASC)
go

/*==============================================================*/
/* Table: PHIEUDATHANG                                          */
/*==============================================================*/
create table PHIEUDATHANG (
   SODONDATHANG         varchar(15)          not null,
   MANCC                varchar(12)          not null,
   SOPHIEUGIAO          varchar(15)          not null,
   NGAYDATHANG          datetime             not null,
   constraint PK_PHIEUDATHANG primary key (SODONDATHANG)
)
go

/*==============================================================*/
/* Index: CUNG_CAP_FK                                           */
/*==============================================================*/




create nonclustered index CUNG_CAP_FK on PHIEUDATHANG (MANCC ASC)
go

/*==============================================================*/
/* Index: GIAO_HANG_FK                                          */
/*==============================================================*/




create nonclustered index GIAO_HANG_FK on PHIEUDATHANG (SOPHIEUGIAO ASC)
go

/*==============================================================*/
/* Table: PHIEUGIAOHANG                                         */
/*==============================================================*/
create table PHIEUGIAOHANG (
   SOPHIEUGIAO          varchar(15)          not null,
   NGAYGIAO             datetime             not null,
   DONDATHANG           varchar(15)          not null,
   constraint PK_PHIEUGIAOHANG primary key (SOPHIEUGIAO)
)
go

alter table CHI_TIET_DAT_HANG
   add constraint FK_CHI_TIET_CHITIETDA_MATHANG foreign key (MAT_MAHANG)
      references MATHANG (MAHANG)
go

alter table CHI_TIET_DAT_HANG
   add constraint FK_CHI_TIET_CHI_TIET__PHIEUDAT foreign key (PHI_SODONDATHANG)
      references PHIEUDATHANG (SODONDATHANG)
go

alter table CHI_TIET_GIAO_HANG
   add constraint FK_CHI_TIET_CHITIETGI_MATHANG foreign key (MAT_MAHANG)
      references MATHANG (MAHANG)
go

alter table CHI_TIET_GIAO_HANG
   add constraint FK_CHI_TIET_CHI_TIET__PHIEUGIA foreign key (PHI_SOPHIEUGIAO)
      references PHIEUGIAOHANG (SOPHIEUGIAO)
go

alter table CHI_TIET_HOA_DON
   add constraint FK_CHI_TIET_CHITIETHO_MATHANG foreign key (MAT_MAHANG)
      references MATHANG (MAHANG)
go

alter table CHI_TIET_HOA_DON
   add constraint FK_CHI_TIET_CHI_TIET__HOADON foreign key (HOA_SOHOADON)
      references HOADON (SOHOADON)
go

alter table MATHANG
   add constraint FK_MATHANG_CHI_TIET__LOAIMATH foreign key (LOA_MALOAIHANG)
      references LOAIMATHANG (MALOAIHANG)
go

alter table PHAN_PHOI
   add constraint FK_PHAN_PHO_PHAN_PHOI_NHACUNGC foreign key (MANCC)
      references NHACUNGCAP (MANCC)
go

alter table PHAN_PHOI
   add constraint FK_PHAN_PHO_PHAN_PHOI_MATHANG foreign key (MAHANG)
      references MATHANG (MAHANG)
go

alter table PHIEUDATHANG
   add constraint FK_PHIEUDAT_CUNG_CAP_NHACUNGC foreign key (MANCC)
      references NHACUNGCAP (MANCC)
go

alter table PHIEUDATHANG
   add constraint FK_PHIEUDAT_GIAO_HANG_PHIEUGIA foreign key (SOPHIEUGIAO)
      references PHIEUGIAOHANG (SOPHIEUGIAO)
go

