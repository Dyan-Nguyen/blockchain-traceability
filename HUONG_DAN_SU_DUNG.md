# 🚀 HƯỚNG DẪN CÀI ĐẶT VÀ SỬ DỤNG

## ⚙️ Bước 1: Cài đặt Node.js

1. Tải Node.js từ: https://nodejs.org/
2. Chọn phiên bản LTS (Long Term Support) - khuyên dùng v20.x hoặc mới hơn
3. Cài đặt theo hướng dẫn (chọn tất cả các tùy chọn mặc định)
4. Khởi động lại máy tính sau khi cài đặt

**Kiểm tra cài đặt thành công:**
```powershell
node --version
npm --version
```

Nếu hiển thị số phiên bản (VD: v20.10.0) là đã cài đặt thành công.

---

## 📦 Bước 2: Cài đặt Dependencies

Mở PowerShell trong thư mục dự án và chạy:

```powershell
npm install
```

Lệnh này sẽ cài đặt các thư viện cần thiết:
- express: Web server framework
- body-parser: Xử lý JSON
- cors: Cho phép cross-origin requests
- qrcode: Tạo mã QR

---

## 🎯 Bước 3: Chạy ứng dụng

```powershell
npm start
```

Server sẽ chạy tại: **http://localhost:3000**

**Lưu ý:** Để dừng server, nhấn `Ctrl + C` trong terminal

---

## 💡 Bước 4: Sử dụng ứng dụng

### A. TẠO LÔ SẢN PHẨM (Vai trò: Nông dân)

1. Mở trình duyệt: http://localhost:3000
2. Chọn tab "👨‍🌾 Nông dân"
3. Điền form "Tạo lô sản phẩm mới":
   ```
   Mã lô: LOT-2025-001
   Sản phẩm: Xoài Cát Hòa Lộc
   Người sản xuất: Hợp tác xã Đồng Tháp
   Vị trí: Đồng Tháp, Việt Nam
   Diện tích: 2 hecta
   Ngày gieo trồng: [Chọn ngày]
   Ghi chú: Giống xoài chất lượng cao
   ```
4. Click "Tạo lô sản phẩm"
5. Kết quả sẽ hiển thị bên dưới

### B. GHI NHẬN CHĂM SÓC

1. Vẫn ở tab "👨‍🌾 Nông dân"
2. Form "Ghi nhận hoạt động chăm sóc":
   ```
   Mã lô: LOT-2025-001
   Người thực hiện: Nguyễn Văn A
   Hoạt động: Bón phân / Tưới tiêu / Phun thuốc
   Phân bón: NPK 16-16-8, 50kg
   Thuốc BVTV: Confidor 200SL, 100ml
   Chi tiết: Phun vào buổi sáng, không mưa
   ```
3. Click "Ghi nhận"

### C. GHI NHẬN THU HOẠCH

1. Form "Ghi nhận thu hoạch":
   ```
   Mã lô: LOT-2025-001
   Người thu hoạch: Đội thu hoạch HTX
   Ngày thu hoạch: [Chọn ngày]
   Số lượng: 500 kg
   Chất lượng: Tốt / Xuất sắc
   Ghi chú: Độ ngọt cao, màu đẹp
   ```
2. Click "Ghi nhận thu hoạch"

### D. KIỂM ĐỊNH CHẤT LƯỢNG (Vai trò: Doanh nghiệp)

1. Chọn tab "🏭 Doanh nghiệp"
2. Form "Kiểm định chất lượng":
   ```
   Mã lô: LOT-2025-001
   Người kiểm định: Trung tâm Kiểm định XYZ
   Chứng nhận: VietGAP
   Kết quả: Đạt tiêu chuẩn an toàn thực phẩm
   ☑ Đạt tiêu chuẩn
   ```
3. Click "Lưu kết quả kiểm định"

### E. ĐÓNG GÓI

1. Form "Đóng gói sản phẩm":
   ```
   Mã lô: LOT-2025-001
   Đơn vị đóng gói: Công ty ABC
   Loại bao bì: Thùng carton
   Số lượng: 50 thùng x 10kg
   Ngày đóng gói: [Chọn ngày]
   ```
2. Click "Ghi nhận đóng gói"

### F. VẬN CHUYỂN (Vai trò: Đơn vị vận chuyển)

1. Chọn tab "🚚 Vận chuyển"
2. Form "Ghi nhận vận chuyển":
   ```
   Mã lô: LOT-2025-001
   Đơn vị vận chuyển: Vận tải Hoàng Long
   Xuất phát từ: Đồng Tháp
   Đến: TP. HCM
   Phương tiện: Xe tải lạnh
   Nhiệt độ: 5-8°C
   Thời gian xuất phát: [Chọn ngày giờ]
   Dự kiến đến: [Chọn ngày giờ]
   ```
3. Click "Ghi nhận vận chuyển"

### G. NHẬP KHO (Vai trò: Siêu thị)

1. Chọn tab "🏪 Siêu thị"
2. Form "Quản lý kho":
   ```
   Mã lô: LOT-2025-001
   Tên kho / Siêu thị: Co.opMart Quận 1
   Hành động: Nhập kho
   Số lượng: 50 thùng
   Tình trạng: Tốt
   Ghi chú: Kiểm tra OK
   ```
3. Click "Ghi nhận"

### H. TẠO MÃ QR (Cho người tiêu dùng)

1. Chọn tab "👤 Người tiêu dùng"
2. Form "Tạo mã QR cho lô sản phẩm":
   ```
   Mã lô: LOT-2025-001
   ```
3. Click "Tạo mã QR"
4. Mã QR sẽ hiển thị → In ra dán lên sản phẩm

### I. THANH TOÁN (Tính năng mới)

#### I.1. Tạo mã QR thanh toán
1. Chọn tab "💳 Thanh toán"
2. Form "Tạo mã QR thanh toán":
   ```
   Mã lô: LOT-2025-001
   Số tiền: 500000
   Số tài khoản: 0123456789
   Tên ngân hàng: Vietcombank
   Tên chủ TK: Hợp tác xã Đồng Tháp
   Nội dung: Thanh toan ma lo LOT-2025-001
   ```
3. Click "Tạo mã QR thanh toán"
4. Hệ thống hiển thị mã QR thanh toán
5. Khách hàng quét mã QR bằng app ngân hàng để chuyển tiền

#### I.2. Ghi nhận thanh toán
Sau khi khách hàng thanh toán, ghi nhận vào blockchain:
1. Form "Ghi nhận thanh toán":
   ```
   Mã lô: LOT-2025-001
   Tên người mua: Nguyễn Văn B
   Số tiền: 500000
   Phương thức: Chuyển khoản ngân hàng
   Mã giao dịch: TXN-20251216001
   Tài khoản: 0123456789
   Ghi chú: Đã nhận tiền đầy đủ
   ```
2. Click "Ghi nhận thanh toán"

#### I.3. Xem lịch sử thanh toán
1. Form "Xem lịch sử thanh toán":
   ```
   Mã lô: LOT-2025-001
   ```
2. Click "Xem lịch sử"
3. Hiển thị:
   - Tổng số giao dịch
   - Tổng doanh thu
   - Chi tiết từng giao dịch (người mua, số tiền, thời gian, mã GD)

---

## 🎯 LUỒNG SỬ DỤNG ĐẦY ĐỦ

### Kịch bản: Từ nông trại đến người tiêu dùng

1. Chọn tab "👤 Người tiêu dùng"
2. Phần "Tạo mã QR cho lô sản phẩm"
3. Nhập mã lô: `LOT-2025-001`
4. Click "Tạo mã QR"
5. Mã QR sẽ hiển thị → Click chuột phải → Lưu ảnh
6. In mã QR và dán lên sản phẩm

### I. QUÉT QR - TRUY XUẤT NGUỒN GỐC

**Cách 1: Trực tiếp trên web**
1. Chọn tab "👤 Người tiêu dùng"
2. Nhập mã lô: `LOT-2025-001`
3. Click "Truy xuất"
4. Xem toàn bộ lịch sử sản phẩm

**Cách 2: Quét QR bằng điện thoại**
1. Mở ứng dụng Camera (iOS) hoặc QR Scanner (Android)
2. Quét mã QR trên sản phẩm
3. Tự động mở link: `http://localhost:3000/trace.html?batch=LOT-2025-001`
4. Hiển thị trang truy xuất nguồn gốc đầy đủ

### J. DASHBOARD QUẢN LÝ

1. Chọn tab "📊 Quản lý"
2. Click "Tải thống kê" → Xem tổng số lô, logs, hoạt động gần đây
3. Click "Tải danh sách" → Xem tất cả lô sản phẩm
4. Click "Kiểm tra" → Xác thực tính toàn vẹn blockchain

---

## 🎯 DEMO SCRIPT - TEST NHANH

Copy và paste từng khối lệnh này vào Console của trình duyệt (F12):

### Tạo lô nhanh
```javascript
fetch('/api/batch', {
  method: 'POST',
  headers: {'Content-Type': 'application/json'},
  body: JSON.stringify({
    batchId: 'LOT-2025-TEST',
    product: 'Xoài Cát Hòa Lộc',
    producer: 'HTX Đồng Tháp',
    farmLocation: 'Đồng Tháp, Việt Nam',
    area: '2 hecta'
  })
}).then(r => r.json()).then(console.log);
```

### Thêm hoạt động chăm sóc
```javascript
fetch('/api/farming/LOT-2025-TEST', {
  method: 'POST',
  headers: {'Content-Type': 'application/json'},
  body: JSON.stringify({
    actor: 'Nguyễn Văn A',
    activity: 'fertilizing',
    fertilizer: 'NPK 16-16-8, 50kg',
    pesticide: 'Confidor 200SL'
  })
}).then(r => r.json()).then(console.log);
```

### Truy xuất
```javascript
fetch('/api/batch/LOT-2025-TEST')
  .then(r => r.json())
  .then(data => console.table(data.history));
```

---

## 🔍 KIỂM TRA API BẰNG POSTMAN

### 1. Tạo lô (POST)
```
URL: http://localhost:3000/api/batch
Method: POST
Headers: Content-Type: application/json
Body (raw JSON):
{
  "batchId": "LOT-2025-001",
  "product": "Xoài Cát Hòa Lộc",
  "producer": "HTX Đồng Tháp",
  "farmLocation": "Đồng Tháp",
  "area": "2 hecta"
}
```

### 2. Truy xuất (GET)
```
URL: http://localhost:3000/api/batch/LOT-2025-001
Method: GET
```

### 3. Tạo QR (GET)
```
URL: http://localhost:3000/api/qrcode/LOT-2025-001
Method: GET
```

---

## ⚠️ TROUBLESHOOTING

### Lỗi: Port 3000 đã được sử dụng
```powershell
# Tìm process đang dùng port 3000
netstat -ano | findstr :3000

# Kill process (thay PID bằng số process ID)
taskkill /PID <PID> /F

# Hoặc đổi port trong server.js (dòng 9):
const PORT = process.env.PORT || 3001;
```

### Lỗi: Cannot find module
```powershell
# Xóa và cài lại
Remove-Item -Recurse -Force node_modules
npm install
```

### Lỗi: chain.json bị hỏng
```powershell
# Xóa file chain.json (sẽ tạo mới)
Remove-Item data\chain.json
npm start
```

---

## 📱 TRIỂN KHAI LÊN INTERNET

### Option 1: Heroku (Free)
```bash
# Cài Heroku CLI
heroku login
heroku create ten-app-cua-ban
git init
git add .
git commit -m "Initial commit"
git push heroku main
```

### Option 2: Railway (Free)
1. Đăng ký tài khoản: https://railway.app/
2. New Project → Deploy from GitHub
3. Connect repository
4. Tự động deploy

### Option 3: Vercel (Free)
1. Đăng ký: https://vercel.com/
2. Import Git Repository
3. Deploy

---

## 📞 HỖ TRỢ

- **Issues:** Tạo issue trên GitHub
- **Documentation:** Đọc README.md
- **API Reference:** Xem server.js để biết tất cả endpoints

---

**✅ Hoàn tất! Bây giờ bạn đã có một hệ thống truy xuất nguồn gốc blockchain đầy đủ!**
