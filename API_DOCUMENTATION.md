# 📚 TÀI LIỆU API - BLOCKCHAIN TRACEABILITY

## 📋 Mục lục
1. [Tổng quan](#tổng-quan)
2. [API Nông dân](#api-nông-dân)
3. [API Doanh nghiệp](#api-doanh-nghiệp)
4. [API Vận chuyển](#api-vận-chuyển)
5. [API Siêu thị](#api-siêu-thị)
6. [API Chung](#api-chung)
7. [API Quản lý](#api-quản-lý)

---

## 🌐 Tổng quan

**Base URL:** `http://localhost:3000`

**Content-Type:** `application/json`

**Response Format:** JSON

---

## 👨‍🌾 API NÔNG DÂN

### 1. Tạo lô sản phẩm mới

**Endpoint:** `POST /api/batch`

**Mô tả:** Nông dân tạo lô sản phẩm mới trên blockchain

**Request Body:**
```json
{
  "batchId": "LOT-2025-001",
  "product": "Xoài Cát Hòa Lộc",
  "producer": "Hợp tác xã Đồng Tháp",
  "farmLocation": "Đồng Tháp, Việt Nam",
  "area": "2 hecta",
  "plantingDate": "2025-01-01T00:00:00.000Z",
  "notes": "Giống xoài chất lượng cao"
}
```

**Response:**
```json
{
  "message": "Batch created",
  "block": {
    "index": 1,
    "timestamp": "2025-11-26T10:30:00.000Z",
    "data": {
      "type": "batch",
      "batchId": "LOT-2025-001",
      "product": "Xoài Cát Hòa Lộc",
      "producer": "Hợp tác xã Đồng Tháp",
      "farmLocation": "Đồng Tháp, Việt Nam",
      "area": "2 hecta",
      "plantingDate": "2025-01-01T00:00:00.000Z",
      "notes": "Giống xoài chất lượng cao",
      "status": "created"
    },
    "previousHash": "abc123...",
    "hash": "def456..."
  }
}
```

**Validation:**
- `batchId` (required): Mã lô duy nhất
- `product` (required): Tên sản phẩm
- `producer` (required): Người/Đơn vị sản xuất

---

### 2. Ghi nhận hoạt động chăm sóc

**Endpoint:** `POST /api/farming/:batchId`

**Mô tả:** Ghi nhận các hoạt động chăm sóc cây trồng

**URL Parameters:**
- `batchId`: Mã lô cần ghi nhận

**Request Body:**
```json
{
  "actor": "Nguyễn Văn A",
  "activity": "fertilizing",
  "fertilizer": "NPK 16-16-8, 50kg",
  "pesticide": "Confidor 200SL, 100ml",
  "wateringSchedule": "Buổi sáng và chiều",
  "notes": "Phun thuốc vào buổi sáng, không mưa"
}
```

**Activity Types:**
- `watering`: Tưới tiêu
- `fertilizing`: Bón phân
- `pesticide`: Phun thuốc BVTV
- `weeding`: Làm cỏ
- `care`: Chăm sóc chung

**Response:**
```json
{
  "message": "Farming activity logged",
  "block": { ... }
}
```

---

### 3. Ghi nhận thu hoạch

**Endpoint:** `POST /api/harvest/:batchId`

**Mô tả:** Ghi nhận kết quả thu hoạch

**Request Body:**
```json
{
  "actor": "Đội thu hoạch HTX",
  "harvestDate": "2025-03-15T08:00:00.000Z",
  "quantity": "500 kg",
  "quality": "excellent",
  "notes": "Độ ngọt cao, màu đẹp"
}
```

**Quality Levels:**
- `excellent`: Xuất sắc
- `good`: Tốt
- `medium`: Trung bình

**Validation:**
- `actor` (required)
- `quantity` (required)

---

## 🏭 API DOANH NGHIỆP

### 1. Kiểm định chất lượng

**Endpoint:** `POST /api/quality/:batchId`

**Mô tả:** Ghi nhận kết quả kiểm định chất lượng

**Request Body:**
```json
{
  "inspector": "Trung tâm Kiểm định XYZ",
  "testResults": "Đạt tiêu chuẩn an toàn thực phẩm. Không phát hiện tồn dư thuốc BVTV.",
  "certification": "VietGAP",
  "passed": true,
  "notes": "Chứng nhận có hiệu lực 1 năm"
}
```

**Certifications:**
- VietGAP
- GlobalGAP
- Organic
- ISO 22000
- HACCP

**Response:**
```json
{
  "message": "Quality inspection logged",
  "block": {
    "data": {
      "type": "quality",
      "testDate": "2025-11-26T10:30:00.000Z",
      ...
    }
  }
}
```

---

### 2. Đóng gói sản phẩm

**Endpoint:** `POST /api/packaging/:batchId`

**Mô tả:** Ghi nhận thông tin đóng gói

**Request Body:**
```json
{
  "packager": "Công ty Đóng gói ABC",
  "packageType": "box",
  "quantity": "50 thùng x 10kg",
  "packagingDate": "2025-03-16T10:00:00.000Z",
  "notes": "Đóng gói theo tiêu chuẩn xuất khẩu"
}
```

**Package Types:**
- `box`: Thùng carton
- `bag`: Túi nilon
- `tray`: Khay nhựa
- `vacuum`: Hút chân không

---

## 🚚 API VẬN CHUYỂN

### 1. Ghi nhận vận chuyển

**Endpoint:** `POST /api/transport/:batchId`

**Mô tả:** Ghi nhận thông tin vận chuyển

**Request Body:**
```json
{
  "transporter": "Vận tải Hoàng Long",
  "from": "Đồng Tháp",
  "to": "TP. Hồ Chí Minh",
  "vehicle": "Xe tải lạnh 5 tấn",
  "temperature": "5-8°C",
  "departureTime": "2025-03-16T14:00:00.000Z",
  "estimatedArrival": "2025-03-16T20:00:00.000Z",
  "notes": "Vận chuyển ban đêm để tránh nóng"
}
```

**Validation:**
- `transporter` (required)
- `from` (required)
- `to` (required)

**Response:**
```json
{
  "message": "Transport logged",
  "block": { ... }
}
```

---

## 🏪 API SIÊU THỊ

### 1. Quản lý nhập/xuất kho

**Endpoint:** `POST /api/warehouse/:batchId`

**Mô tả:** Ghi nhận hoạt động nhập/xuất kho

**Request Body:**
```json
{
  "warehouse": "Co.opMart Quận 1",
  "action": "import",
  "quantity": "50 thùng",
  "condition": "good",
  "notes": "Kiểm tra chất lượng OK"
}
```

**Actions:**
- `import`: Nhập kho
- `export`: Xuất kho

**Conditions:**
- `excellent`: Tuyệt vời
- `good`: Tốt
- `fair`: Khá
- `poor`: Kém

---

## 🌐 API CHUNG

### 1. Truy xuất lô hàng

**Endpoint:** `GET /api/batch/:batchId`

**Mô tả:** Lấy toàn bộ lịch sử của một lô hàng

**Response:**
```json
{
  "batchId": "LOT-2025-001",
  "history": [
    {
      "index": 1,
      "timestamp": "2025-11-26T10:30:00.000Z",
      "data": {
        "type": "batch",
        "batchId": "LOT-2025-001",
        ...
      },
      "previousHash": "...",
      "hash": "..."
    },
    {
      "index": 2,
      "timestamp": "2025-11-26T11:00:00.000Z",
      "data": {
        "type": "farming",
        ...
      }
    }
  ]
}
```

**Status Codes:**
- `200`: Success
- `404`: Batch not found

---

### 2. Danh sách tất cả lô

**Endpoint:** `GET /api/batches`

**Mô tả:** Lấy danh sách tóm tắt tất cả lô hàng

**Response:**
```json
{
  "count": 5,
  "batches": [
    {
      "batchId": "LOT-2025-001",
      "product": "Xoài Cát Hòa Lộc",
      "timestamp": "2025-11-26T10:30:00.000Z",
      "producer": "HTX Đồng Tháp",
      "farmLocation": "Đồng Tháp",
      "status": "active"
    },
    ...
  ]
}
```

---

### 3. Tạo mã QR

**Endpoint:** `GET /api/qrcode/:batchId`

**Mô tả:** Tạo mã QR cho lô sản phẩm

**Response:**
```json
{
  "batchId": "LOT-2025-001",
  "qrCode": "data:image/png;base64,iVBORw0KGgoAAAANS...",
  "traceUrl": "http://localhost:3000/trace.html?batch=LOT-2025-001"
}
```

**Status Codes:**
- `200`: Success
- `404`: Batch not found
- `500`: QR generation failed

---

### 4. Log tùy chỉnh (backward compatible)

**Endpoint:** `POST /api/log/:batchId`

**Mô tả:** Thêm log tùy chỉnh cho lô hàng

**Request Body:**
```json
{
  "action": "Xử lý sau thu hoạch",
  "actor": "Công ty XYZ",
  "details": "Làm sạch, phân loại, bảo quản lạnh"
}
```

---

## 📊 API QUẢN LÝ

### 1. Dashboard thống kê

**Endpoint:** `GET /api/statistics`

**Mô tả:** Lấy thông tin thống kê tổng quan

**Response:**
```json
{
  "totalBatches": 25,
  "totalLogs": 143,
  "totalBlocks": 169,
  "isValid": true,
  "recentActivity": [
    {
      "index": 168,
      "timestamp": "2025-11-26T15:30:00.000Z",
      "data": { ... }
    },
    ...
  ]
}
```

---

### 2. Kiểm tra tính toàn vẹn Blockchain

**Endpoint:** `GET /api/validate`

**Mô tả:** Xác thực tính toàn vẹn của blockchain

**Response:**
```json
{
  "valid": true,
  "message": "Blockchain is valid"
}
```

Hoặc nếu bị thay đổi:
```json
{
  "valid": false,
  "message": "Blockchain has been tampered!"
}
```

---

### 3. Health Check

**Endpoint:** `GET /api/health`

**Mô tả:** Kiểm tra trạng thái hệ thống

**Response:**
```json
{
  "status": "ok",
  "valid": true,
  "blocks": 169
}
```

---

## 🔒 ERROR HANDLING

### Error Response Format:
```json
{
  "error": "Error message here",
  "details": "Additional details if available"
}
```

### Common Error Codes:

| Status Code | Meaning |
|------------|---------|
| 400 | Bad Request - Missing required fields |
| 404 | Not Found - Batch ID not found |
| 500 | Internal Server Error - Server issue |

---

## 📝 EXAMPLES

### Tạo một chuỗi hoàn chỉnh (End-to-end)

```bash
# 1. Tạo lô
curl -X POST http://localhost:3000/api/batch \
  -H "Content-Type: application/json" \
  -d '{"batchId":"TEST-001","product":"Xoài","producer":"Nông dân A"}'

# 2. Chăm sóc
curl -X POST http://localhost:3000/api/farming/TEST-001 \
  -H "Content-Type: application/json" \
  -d '{"actor":"Nông dân A","activity":"watering"}'

# 3. Thu hoạch
curl -X POST http://localhost:3000/api/harvest/TEST-001 \
  -H "Content-Type: application/json" \
  -d '{"actor":"Nông dân A","quantity":"100kg","quality":"good"}'

# 4. Kiểm định
curl -X POST http://localhost:3000/api/quality/TEST-001 \
  -H "Content-Type: application/json" \
  -d '{"inspector":"Trung tâm ABC","passed":true}'

# 5. Truy xuất
curl http://localhost:3000/api/batch/TEST-001

# 6. Tạo QR
curl http://localhost:3000/api/qrcode/TEST-001
```

---

## 🌍 CORS Configuration

CORS được bật cho tất cả origins:
```javascript
app.use(cors());
```

Trong production, nên giới hạn:
```javascript
app.use(cors({
  origin: 'https://yourdomain.com'
}));
```

---

## 🔄 Blockchain Structure

Mỗi block có cấu trúc:
```javascript
{
  index: 0,
  timestamp: "2025-11-26T10:00:00.000Z",
  data: { 
    type: "batch" | "farming" | "harvest" | "quality" | "packaging" | "transport" | "warehouse" | "log",
    batchId: "LOT-2025-001",
    ...
  },
  previousHash: "abc123...",
  hash: "def456..."
}
```

Hash được tính bằng: `SHA-256(index + timestamp + JSON.stringify(data) + previousHash)`

---

**📖 Tài liệu này được cập nhật liên tục. Vui lòng kiểm tra version mới nhất!**
