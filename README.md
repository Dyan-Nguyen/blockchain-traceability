# 🌾 Hệ thống Truy xuất Nguồn gốc Nông sản - Blockchain v2.0

Ứng dụng blockchain hoàn chỉnh để truy xuất nguồn gốc nông sản, hỗ trợ đầy đủ các đối tượng trong chuỗi cung ứng.

## 🎯 Mục tiêu

- ✅ Ghi lại toàn bộ hoạt động từ sản xuất đến tiêu thụ
- ✅ Tạo dữ liệu minh bạch, chống sửa đổi
- ✅ Cho phép người tiêu dùng truy xuất nguồn gốc qua QR code
- ✅ Hỗ trợ nhiều đối tượng: Nông dân, Doanh nghiệp, Vận chuyển, Siêu thị

## 👥 Các đối tượng tham gia

1. **👨‍🌾 Nông dân / Hợp tác xã**
   - Tạo lô sản phẩm mới
   - Ghi nhận hoạt động chăm sóc (phân bón, thuốc BVTV, tưới tiêu)
   - Ghi nhận thu hoạch

2. **🏭 Doanh nghiệp / Nhà chế biến**
   - Kiểm định chất lượng (VietGAP, GlobalGAP, ...)
   - Đóng gói sản phẩm

3. **🚚 Đơn vị vận chuyển**
   - Ghi nhận thông tin vận chuyển
   - Theo dõi nhiệt độ, thời gian

4. **🏪 Siêu thị / Cửa hàng**
   - Nhập/xuất kho
   - Quản lý tồn kho

5. **👤 Người tiêu dùng**
   - Quét QR code để xem lịch sử sản phẩm
   - Truy xuất nguồn gốc minh bạch

6. **📊 Cơ quan quản lý**
   - Xem dashboard thống kê
   - Kiểm tra tính toàn vẹn blockchain
   - Giám sát chuỗi cung ứng

## 🏗️ Kiến trúc hệ thống

### 1. Lớp Blockchain (`blockchain.js`)
- Lưu dữ liệu bất biến
- Liên kết các block bằng hàm băm SHA-256
- Xác thực tính toàn vẹn dữ liệu

### 2. Lớp Backend API (`server.js`)
- **API Nông dân:**
  - `POST /api/batch` - Tạo lô sản phẩm
  - `POST /api/farming/:batchId` - Ghi nhận chăm sóc
  - `POST /api/harvest/:batchId` - Ghi nhận thu hoạch

- **API Doanh nghiệp:**
  - `POST /api/quality/:batchId` - Kiểm định chất lượng
  - `POST /api/packaging/:batchId` - Đóng gói

- **API Vận chuyển:**
  - `POST /api/transport/:batchId` - Ghi nhận vận chuyển

- **API Siêu thị:**
  - `POST /api/warehouse/:batchId` - Nhập/xuất kho

- **API Chung:**
  - `GET /api/batch/:batchId` - Truy xuất lô hàng
  - `GET /api/batches` - Danh sách tất cả lô
  - `GET /api/qrcode/:batchId` - Tạo mã QR
  - `GET /api/statistics` - Thống kê hệ thống
  - `GET /api/validate` - Kiểm tra blockchain

### 3. Lớp Frontend
- **index.html** - Giao diện chính với tabs đa vai trò
- **trace.html** - Trang truy xuất cho người tiêu dùng (khi quét QR)
- **app.js** - Xử lý logic frontend
- **styles.css** - Giao diện responsive, hiện đại

## 📦 Yêu cầu
- Node.js v14+ và npm

## 🚀 Cài đặt & Chạy

```bash
# Cài đặt dependencies
npm install

# Chạy ứng dụng
npm start
```

Sau đó mở trình duyệt tại: **http://localhost:3000**

## 💡 Hướng dẫn sử dụng

### Bước 1: Nông dân tạo lô sản phẩm
1. Chọn tab "👨‍🌾 Nông dân"
2. Điền thông tin: Mã lô (VD: `LOT-2025-001`), Sản phẩm, Người sản xuất, Vị trí
3. Click "Tạo lô sản phẩm"

### Bước 2: Ghi nhận các hoạt động
- **Chăm sóc:** Bón phân, phun thuốc BVTV, tưới tiêu
- **Thu hoạch:** Số lượng, chất lượng
- **Kiểm định:** Chứng nhận VietGAP, GlobalGAP
- **Đóng gói:** Loại bao bì, số lượng
- **Vận chuyển:** Từ đâu đến đâu, nhiệt độ
- **Nhập kho:** Siêu thị/cửa hàng

### Bước 3: Tạo mã QR cho lô
1. Chọn tab "👤 Người tiêu dùng"
2. Nhập mã lô vào phần "Tạo mã QR"
3. Click "Tạo mã QR"
4. Mã QR sẽ hiển thị, có thể in ra dán lên sản phẩm

### Bước 4: Người tiêu dùng quét QR
- Quét mã QR → Tự động mở trang `trace.html`
- Hiển thị đầy đủ thông tin: Nguồn gốc, hoạt động chăm sóc, kiểm định, vận chuyển...

### Bước 5: Quản lý giám sát
1. Chọn tab "📊 Quản lý"
2. Xem thống kê tổng quan
3. Kiểm tra tính toàn vẹn blockchain

## 🔧 Công nghệ sử dụng

- **Backend:** Node.js, Express
- **Blockchain:** Custom implementation với SHA-256
- **QR Code:** qrcode library
- **Frontend:** HTML5, CSS3, Vanilla JavaScript
- **Storage:** File-based (chain.json)

## 📁 Cấu trúc thư mục

```
blockchain-traceability/
├── blockchain.js          # Core blockchain logic
├── server.js             # Express API server
├── package.json          # Dependencies
├── README.md            # Documentation
├── data/
│   └── chain.json       # Blockchain data storage
└── public/
    ├── index.html       # Main interface
    ├── trace.html       # Consumer traceability page
    ├── app.js          # Frontend logic
    └── styles.css      # Styling
```

## 🎨 Tính năng nổi bật

✨ **Giao diện đa vai trò** - Tabs riêng cho từng đối tượng  
📱 **Responsive design** - Tương thích mobile, tablet  
🔐 **Blockchain bảo mật** - Dữ liệu bất biến, chống giả mạo  
📊 **Dashboard thống kê** - Giám sát toàn bộ hệ thống  
🎯 **QR Code tự động** - Tạo QR cho mỗi lô sản phẩm  
🌐 **Dễ triển khai** - Không cần database phức tạp

## 🔮 Nâng cấp trong tương lai

- [ ] Tích hợp Hyperledger Fabric / Ethereum
- [ ] Upload hình ảnh lên IPFS
- [ ] Mobile app (React Native)
- [ ] Thông báo real-time (WebSocket)
- [ ] Export báo cáo PDF
- [ ] Đa ngôn ngữ (i18n)
- [ ] Authentication & Authorization

## 📄 Ghi chú

- Đây là một blockchain DEMO (không phân tán) — dữ liệu lưu cục bộ trong `data/chain.json`
- Để triển khai thực tế, cần tích hợp cơ chế phân tán, xác thực, quyền truy cập, IPFS cho file, v.v.

## 📄 License

MIT License

## 👨‍💻 Tác giả

Hệ thống Truy xuất Nguồn gốc Nông sản - Blockchain v2.0

---

**🌟 Nếu bạn thấy hữu ích, hãy cho dự án một ⭐!**
