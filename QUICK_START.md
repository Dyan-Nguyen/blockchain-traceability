# 🚀 QUICK START - Hướng dẫn nhanh 5 phút

## ⚡ Cài đặt & Chạy

### 1. Cài Node.js
Tải từ: https://nodejs.org/ (chọn LTS)

### 2. Cài dependencies
```bash
npm install
```

### 3. Chạy ứng dụng
```bash
npm start
```

### 4. Mở trình duyệt
```
http://localhost:3000
```

---

## 🎯 Demo nhanh

### Tạo lô sản phẩm (30 giây)
1. Tab "👨‍🌾 Nông dân"
2. Điền:
   - Mã lô: `LOT-2025-001`
   - Sản phẩm: `Xoài Cát Hòa Lộc`
   - Người sản xuất: `HTX Đồng Tháp`
3. Click "Tạo lô"

### Thêm hoạt động (30 giây)
1. Form "Ghi nhận chăm sóc"
2. Điền:
   - Mã lô: `LOT-2025-001`
   - Người: `Nguyễn Văn A`
   - Hoạt động: `Bón phân`
   - Phân bón: `NPK 16-16-8`
3. Click "Ghi nhận"

### Tạo QR code (20 giây)
1. Tab "👤 Người tiêu dùng"
2. Nhập mã lô: `LOT-2025-001`
3. Click "Tạo mã QR"
4. QR hiển thị → Lưu ảnh

### Truy xuất (20 giây)
1. Nhập mã lô: `LOT-2025-001`
2. Click "Truy xuất"
3. Xem timeline đầy đủ

---

## 📚 Tài liệu

- **README.md** - Tổng quan
- **HUONG_DAN_SU_DUNG.md** - Chi tiết đầy đủ
- **API_DOCUMENTATION.md** - API reference
- **ARCHITECTURE.md** - Kiến trúc hệ thống
- **TONG_KET_DU_AN.md** - Tổng kết toàn bộ

---

## 🎨 6 Tabs chính

1. **👨‍🌾 Nông dân** - Tạo lô, chăm sóc, thu hoạch
2. **🏭 Doanh nghiệp** - Kiểm định, đóng gói
3. **🚚 Vận chuyển** - Ghi vận chuyển
4. **🏪 Siêu thị** - Nhập/xuất kho
5. **👤 Người tiêu dùng** - Truy xuất, QR
6. **📊 Quản lý** - Thống kê, validation

---

## 🔧 API Endpoints

```
POST /api/batch              # Tạo lô
POST /api/farming/:id        # Chăm sóc
POST /api/harvest/:id        # Thu hoạch
POST /api/quality/:id        # Kiểm định
POST /api/packaging/:id      # Đóng gói
POST /api/transport/:id      # Vận chuyển
POST /api/warehouse/:id      # Nhập/xuất kho
GET  /api/batch/:id          # Truy xuất
GET  /api/qrcode/:id         # Tạo QR
GET  /api/statistics         # Thống kê
GET  /api/validate           # Kiểm tra blockchain
```

---

## ⚠️ Troubleshooting

### Lỗi: npm not found
→ Cài Node.js từ https://nodejs.org/

### Lỗi: Port 3000 busy
→ Đổi port trong `server.js` (dòng 9): `const PORT = 3001`

### Lỗi: Cannot find module
→ Chạy: `npm install`

### Chain bị lỗi
→ Xóa `data/chain.json` và chạy lại

---

## 📞 Hỗ trợ

1. Đọc `HUONG_DAN_SU_DUNG.md`
2. Check console logs (F12)
3. Xem `API_DOCUMENTATION.md`

---

**✅ Xong! Chúc bạn thành công! 🎉**
