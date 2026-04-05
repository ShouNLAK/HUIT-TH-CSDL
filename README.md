<div align="center">

# 🗄️ HUIT - Thực Hành Cơ Sở Dữ Liệu

**Trường Đại học Công Thương Tp.HCM (HUIT)**  
*Ho Chi Minh City University of Industry and Trade*

</div>

---

<p align="center">
  <img alt="Language" src="https://img.shields.io/badge/Language-SQL-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white">
  <img alt="Database" src="https://img.shields.io/badge/Database-SQL%20Server-A91D22?style=for-the-badge&logo=microsoftsqlserver&logoColor=white">
  <img alt="University" src="https://img.shields.io/badge/University-HUIT-FF6B35?style=for-the-badge">
  <img alt="Status" src="https://img.shields.io/badge/Status-Completed-2EA043?style=for-the-badge">
  <img alt="License" src="https://img.shields.io/badge/License-Educational-0066CC?style=for-the-badge">
</p>

---

## 📌 Giới thiệu

Đây là kho lưu trữ tổng hợp các bài tập trên lớp, bài tập về nhà và kịch bản truy vấn của môn học **Thực hành Cơ sở dữ liệu** tại Trường Đại học Công Thương Tp.HCM.

**Mục tiêu repository:**
- ✅ Hệ thống hóa tiến trình học SQL theo từng buổi
- ✅ Cung cấp bộ script tham khảo cho thiết kế và truy vấn CSDL quan hệ
- ✅ Hỗ trợ sinh viên luyện tư duy mô hình dữ liệu và ràng buộc nghiệp vụ

---

## 📖 Giới thiệu

Repository này chứa tập hợp hoàn chỉnh các **bài tập trên lớp** và **bài tập về nhà** từ khóa học **Thực hành Cơ sở dữ liệu** tại **Trường Đại học Công Thương Tp.HCM**.

Mỗi buổi học được tổ chức theo hai phần:
- 🎓 **Bài tập trên lớp** (thư mục `Buoi_*`)
- 📝 **Bài tập về nhà** (thư mục `Buoi_*_BTVN`)

Đây là **tài liệu tham khảo** nhằm hỗ trợ sinh viên trong quá trình học tập. Sinh viên được khuyến khích:
- ✅ Tự thiết kế lược đồ và viết truy vấn trước khi đối chiếu
- ✅ Giải thích được ràng buộc dữ liệu sau mỗi script
- ✅ Chuẩn hóa script để tăng khả năng tái sử dụng và bảo trì

---

## 📁 Cấu trúc Repository

```text
HUIT-TH-CSDL/
├── README.md
├── Buoi_1/
│   ├── crebas.sql
│   ├── QUANLYNHANVIEN.pdm
│   └── ... (file mô hình PowerDesigner)
├── Buoi_1_BTVN/
│   ├── Microsoft SQL Server Management Studio 21/
│   └── SAP PowerDesigner/
├── Buoi_2/
│   └── QL_NHANVIEN.sql
├── Buoi_2_BTVN/
│   ├── QL_LINHKIEN.sql
│   └── QL_THUVIEN.sql
├── Buoi_4/
│   ├── QL_LINHKIEN.sql
│   └── QL_NHANVIEN.sql
├── Buoi_4_BTVN/
│   ├── QL_NHANVIEN.sql
│   └── QL_THUVIEN.sql
├── Buoi_5/
│   └── QL_NHANVIEN.sql
└── Buoi_5_BTVN/
    ├── QL_NHANVIEN.sql
    ├── QL_SINHVIEN.sql
    └── Trigger.sql
```

---

## 📅 Lịch Học

| Buổi | Nội dung | File chính | Trạng thái |
|------|----------|------------|------------|
| **1** | Thiết kế CSDL vật lý, tạo bảng từ mô hình | `Buoi_1/crebas.sql` | ✅ Hoàn thành |
| **2** | DDL nâng cao: ALTER, PK, FK, UNIQUE | `Buoi_2/QL_NHANVIEN.sql` | ✅ Hoàn thành |
| **3** | Truy vấn một bảng, nhóm hàm tổng hợp | `Các script SELECT tổng hợp` | ✅ Hoàn thành |
| **4** | Truy vấn nhiều bảng, JOIN, VIEW | `Buoi_4/*.sql` | ✅ Hoàn thành |
| **5** | Trigger, ràng buộc nghiệp vụ và kiểm soát dữ liệu | `Buoi_5_BTVN/Trigger.sql` | ✅ Hoàn thành |

---

## 🎯 Nội dung Chi tiết

### 📌 Buổi 1 & 2 - Thiết kế Lược đồ và DDL
**Các chủ đề:**
- Thiết kế lược đồ dữ liệu bằng PowerDesigner
- Chuyển mô hình sang script SQL Server
- Tạo bảng và khai báo khóa chính/khóa ngoại
- Mở rộng cấu trúc bảng với `ALTER TABLE`

**Bài tập mẫu:**
- CSDL quản lý nhân viên
- CSDL quản lý thư viện
- CSDL quản lý linh kiện

---

### 📌 Buổi 3 & 4 - DML và Truy vấn Quan hệ
**Các chủ đề:**
- `INSERT`, `UPDATE`, `DELETE`
- Truy vấn `SELECT`, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`
- Kết nối nhiều bảng bằng `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- Xây dựng `VIEW` cho báo cáo và tái sử dụng truy vấn

**Bài tập mẫu:**
- Truy xuất nhân viên theo phòng ban
- Thống kê lương trung bình theo nhóm
- Danh sách đối tượng không phát sinh giao dịch (left join)

---

### 📌 Buổi 5 - Trigger và Ràng buộc Nghiệp vụ
**Các chủ đề:**
- Trigger cho các sự kiện `INSERT`, `UPDATE`, `DELETE`
- Kiểm soát tính nhất quán dữ liệu bằng nghiệp vụ
- Kết hợp trigger với constraint để chặn dữ liệu không hợp lệ

**Bài tập mẫu:**
- Trigger cập nhật sĩ số tự động
- Trigger kiểm tra điều kiện tuổi tối thiểu
- Trigger bảo toàn ràng buộc liên bảng

---

## 🚀 Hướng dẫn Sử dụng

### ⚙️ Yêu cầu Hệ thống
- SQL Server / SQL Server Express
- SQL Server Management Studio (SSMS)
- (Tùy chọn) SAP PowerDesigner để xem mô hình `.pdm`

### 📥 Clone Repository

```bash
git clone https://github.com/ShouNLAK/HUIT-TH-CSDL.git
cd HUIT-TH-CSDL
```

### ▶️ Chạy các bài tập

```sql
-- Ví dụ chạy script buổi 2
:r .\Buoi_2\QL_NHANVIEN.sql
```

### 💡 Gợi ý Sử dụng

1. **Thực thi theo thứ tự buổi** để tránh thiếu bảng/phụ thuộc dữ liệu
2. **Đọc lược đồ trước khi truy vấn** để hiểu rõ quan hệ khóa
3. **Kiểm tra kết quả từng bước** bằng SELECT trung gian
4. **Viết chú thích SQL** cho các truy vấn có nghiệp vụ phức tạp

---

## ⚠️ Lưu ý Quan trọng

### 🎓 Học Tập Đạo Đức

```text
✅ ĐƯỢC PHÉP:
  • Tham khảo script để hiểu cú pháp và tư duy mô hình dữ liệu
  • Tái sử dụng ý tưởng truy vấn và cải tiến theo đề bài mới
  • Trao đổi học thuật về tối ưu truy vấn với bạn học/giảng viên

❌ KHÔNG ĐƯỢC PHÉP:
  • Sao chép nguyên bài để nộp
  • Nộp script mà không hiểu luồng dữ liệu và ràng buộc
  • Dùng repository cho mục đích gian lận học tập
```

### 📝 Quy Định

- 📌 Repository này phục vụ mục đích **học tập và tham khảo**
- 📌 Khuyến khích viết script chuẩn hóa, dễ đọc, dễ bảo trì
- 📌 Không khuyến khích sao chép máy móc

---

## 🤝 Đóng góp

Nếu bạn muốn cải thiện repository này:

1. Fork repository
2. Tạo branch mới (`git checkout -b feature/improvement`)
3. Commit thay đổi (`git commit -m 'Improve SQL practice scripts'`)
4. Push lên branch (`git push origin feature/improvement`)
5. Mở Pull Request

---

## 📞 Liên Hệ & Hỗ Trợ

- **Trường**: Trường Đại học Công Thương Tp.HCM
- **Môn học**: Thực hành Cơ sở dữ liệu
- **Repository**: [ShouNLAK/HUIT-TH-CSDL](https://github.com/ShouNLAK/HUIT-TH-CSDL)

Nếu có câu hỏi hoặc góp ý, vui lòng:
- 📧 Liên hệ giảng viên
- 💬 Tạo Issue trên GitHub
- 📝 Thảo luận cùng bạn học

---

## 📄 Giấy phép

Nội dung repository được chia sẻ cho mục đích học tập và tham khảo.
