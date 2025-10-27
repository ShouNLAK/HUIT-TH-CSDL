/*==============================================================*/
/* DBMS name:      SAP SQL Anywhere 17                          */
/* Created on:     27/10/2025 10:47:30                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_NHANVIEN_QUANLY_NV_NHANVIEN') then
    alter table NHANVIEN
       delete foreign key FK_NHANVIEN_QUANLY_NV_NHANVIEN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_NHANVIEN_THUOC_VE__PHONGBAN') then
    alter table NHANVIEN
       delete foreign key FK_NHANVIEN_THUOC_VE__PHONGBAN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PHANCONG_GIAO_DA_DEAN') then
    alter table PHANCONG_DA
       delete foreign key FK_PHANCONG_GIAO_DA_DEAN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PHANCONG_THUC_HIEN_NHANVIEN') then
    alter table PHANCONG_DA
       delete foreign key FK_PHANCONG_THUC_HIEN_NHANVIEN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_THANNHAN_GOM_NV_TN_NHANVIEN') then
    alter table THANNHAN
       delete foreign key FK_THANNHAN_GOM_NV_TN_NHANVIEN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_THENHANV_QUANHE_NV_NHANVIEN') then
    alter table THENHANVIEN
       delete foreign key FK_THENHANV_QUANHE_NV_NHANVIEN
end if;

drop index if exists DEAN.DEAN_PK;

drop table if exists DEAN;

drop index if exists NHANVIEN.THUOC_VE_PB_VN_FK;

drop index if exists NHANVIEN.QUANLY_NV_FK;

drop index if exists NHANVIEN.NHANVIEN_PK;

drop table if exists NHANVIEN;

drop index if exists PHANCONG_DA.GIAO_DA_FK;

drop index if exists PHANCONG_DA.THUC_HIEN_DA_FK;

drop index if exists PHANCONG_DA.PHANCONG_DA_PK;

drop table if exists PHANCONG_DA;

drop index if exists PHONGBAN.PHONGBAN_PK;

drop table if exists PHONGBAN;

drop index if exists THANNHAN.GOM_NV_TN_FK;

drop index if exists THANNHAN.THANNHAN_PK;

drop table if exists THANNHAN;

drop index if exists THENHANVIEN.QUANHE_NV_THENV_FK;

drop index if exists THENHANVIEN.THENHANVIEN_PK;

drop table if exists THENHANVIEN;

/*==============================================================*/
/* Table: DEAN                                                  */
/*==============================================================*/
create or replace table DEAN 
(
   MADA                 char(5)                        not null,
   TENDA                char(50)                       not null,
   DIADIEMDA            char(30)                       not null,
   NGAYBD               date                           not null,
   constraint PK_DEAN primary key clustered (MADA)
);

/*==============================================================*/
/* Index: DEAN_PK                                               */
/*==============================================================*/
create unique clustered index DEAN_PK on DEAN (
MADA ASC
);

/*==============================================================*/
/* Table: NHANVIEN                                              */
/*==============================================================*/
create or replace table NHANVIEN 
(
   MANV                 char(6)                        not null,
   NHA_MANV             char(6)                        null,
   MAPHONG              char(10)                       not null,
   HOTEN                char(40)                       not null,
   NGAYSINH             date                           not null,
   PHAI                 char(5)                        not null,
   DIACHI               char(40)                       not null,
   LUONG                numeric(8,2)                   null,
   constraint PK_NHANVIEN primary key clustered (MANV)
);

/*==============================================================*/
/* Index: NHANVIEN_PK                                           */
/*==============================================================*/
create unique clustered index NHANVIEN_PK on NHANVIEN (
MANV ASC
);

/*==============================================================*/
/* Index: QUANLY_NV_FK                                          */
/*==============================================================*/
create index QUANLY_NV_FK on NHANVIEN (
NHA_MANV ASC
);

/*==============================================================*/
/* Index: THUOC_VE_PB_VN_FK                                     */
/*==============================================================*/
create index THUOC_VE_PB_VN_FK on NHANVIEN (
MAPHONG ASC
);

/*==============================================================*/
/* Table: PHANCONG_DA                                           */
/*==============================================================*/
create or replace table PHANCONG_DA 
(
   MANV                 char(6)                        not null,
   MADA                 char(5)                        not null,
   SONGAYTG             integer                        null,
   constraint PK_PHANCONG_DA primary key clustered (MANV, MADA)
);

/*==============================================================*/
/* Index: PHANCONG_DA_PK                                        */
/*==============================================================*/
create unique clustered index PHANCONG_DA_PK on PHANCONG_DA (
MANV ASC,
MADA ASC
);

/*==============================================================*/
/* Index: THUC_HIEN_DA_FK                                       */
/*==============================================================*/
create index THUC_HIEN_DA_FK on PHANCONG_DA (
MANV ASC
);

/*==============================================================*/
/* Index: GIAO_DA_FK                                            */
/*==============================================================*/
create index GIAO_DA_FK on PHANCONG_DA (
MADA ASC
);

/*==============================================================*/
/* Table: PHONGBAN                                              */
/*==============================================================*/
create or replace table PHONGBAN 
(
   MAPHONG              char(10)                       not null,
   TENPHONG             char(30)                       not null,
   DIADIEMPB            char(40)                       not null,
   constraint PK_PHONGBAN primary key clustered (MAPHONG)
);

/*==============================================================*/
/* Index: PHONGBAN_PK                                           */
/*==============================================================*/
create unique clustered index PHONGBAN_PK on PHONGBAN (
MAPHONG ASC
);

/*==============================================================*/
/* Table: THANNHAN                                              */
/*==============================================================*/
create or replace table THANNHAN 
(
   MANV                 char(6)                        not null,
   TENTN                char(40)                       not null,
   PHAI                 char(5)                        not null,
   NGAYSINH             date                           not null,
   QUANHE               char(15)                       not null,
   constraint PK_THANNHAN primary key clustered (MANV, TENTN)
);

/*==============================================================*/
/* Index: THANNHAN_PK                                           */
/*==============================================================*/
create unique clustered index THANNHAN_PK on THANNHAN (
MANV ASC,
TENTN ASC
);

/*==============================================================*/
/* Index: GOM_NV_TN_FK                                          */
/*==============================================================*/
create index GOM_NV_TN_FK on THANNHAN (
MANV ASC
);

/*==============================================================*/
/* Table: THENHANVIEN                                           */
/*==============================================================*/
create or replace table THENHANVIEN 
(
   MATHE                char(10)                       not null,
   MANV                 char(6)                        not null,
   NGAYCAP              date                           not null,
   constraint PK_THENHANVIEN primary key clustered (MATHE)
);

/*==============================================================*/
/* Index: THENHANVIEN_PK                                        */
/*==============================================================*/
create unique clustered index THENHANVIEN_PK on THENHANVIEN (
MATHE ASC
);

/*==============================================================*/
/* Index: QUANHE_NV_THENV_FK                                    */
/*==============================================================*/
create index QUANHE_NV_THENV_FK on THENHANVIEN (
MANV ASC
);

alter table NHANVIEN
   add constraint FK_NHANVIEN_QUANLY_NV_NHANVIEN foreign key (NHA_MANV)
      references NHANVIEN (MANV)
      on update restrict
      on delete restrict;

alter table NHANVIEN
   add constraint FK_NHANVIEN_THUOC_VE__PHONGBAN foreign key (MAPHONG)
      references PHONGBAN (MAPHONG)
      on update restrict
      on delete restrict;

alter table PHANCONG_DA
   add constraint FK_PHANCONG_GIAO_DA_DEAN foreign key (MADA)
      references DEAN (MADA)
      on update restrict
      on delete restrict;

alter table PHANCONG_DA
   add constraint FK_PHANCONG_THUC_HIEN_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
      on update restrict
      on delete restrict;

alter table THANNHAN
   add constraint FK_THANNHAN_GOM_NV_TN_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
      on update restrict
      on delete restrict;

alter table THENHANVIEN
   add constraint FK_THENHANV_QUANHE_NV_NHANVIEN foreign key (MANV)
      references NHANVIEN (MANV)
      on update restrict
      on delete restrict;

