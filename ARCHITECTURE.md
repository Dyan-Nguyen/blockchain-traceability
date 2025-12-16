# 🏗️ KIẾN TRÚC HỆ THỐNG BLOCKCHAIN TRACEABILITY

## 📊 TỔNG QUAN KIẾN TRÚC

```
┌─────────────────────────────────────────────────────────────────┐
│                      NGƯỜI DÙNG / USER LAYER                     │
├─────────────┬──────────┬──────────┬──────────┬──────────────────┤
│  Nông dân   │ Doanh    │  Vận     │  Siêu    │  Người tiêu dùng │
│  👨‍🌾        │  nghiệp  │  chuyển  │  thị     │  & Quản lý 👤📊  │
│             │  🏭      │  🚚      │  🏪      │                  │
└─────────────┴──────────┴──────────┴──────────┴──────────────────┘
                              ↕️
┌─────────────────────────────────────────────────────────────────┐
│              FRONTEND LAYER (public/)                            │
├─────────────────────────────────────────────────────────────────┤
│  • index.html  - Giao diện chính (tabs đa vai trò)              │
│  • trace.html  - Trang truy xuất cho QR code                    │
│  • app.js      - Logic xử lý frontend                           │
│  • styles.css  - UI/UX responsive                               │
└─────────────────────────────────────────────────────────────────┘
                              ↕️
┌─────────────────────────────────────────────────────────────────┐
│              API LAYER (server.js)                               │
├─────────────────────────────────────────────────────────────────┤
│  REST API Endpoints:                                             │
│  • POST /api/batch             - Tạo lô sản phẩm                │
│  • POST /api/farming/:id       - Chăm sóc                       │
│  • POST /api/harvest/:id       - Thu hoạch                      │
│  • POST /api/quality/:id       - Kiểm định                      │
│  • POST /api/packaging/:id     - Đóng gói                       │
│  • POST /api/transport/:id     - Vận chuyển                     │
│  • POST /api/warehouse/:id     - Nhập/Xuất kho                  │
│  • GET  /api/batch/:id         - Truy xuất lô                   │
│  • GET  /api/qrcode/:id        - Tạo QR code                    │
│  • GET  /api/statistics        - Dashboard                      │
│  • GET  /api/validate          - Kiểm tra blockchain            │
└─────────────────────────────────────────────────────────────────┘
                              ↕️
┌─────────────────────────────────────────────────────────────────┐
│           BLOCKCHAIN LAYER (blockchain.js)                       │
├─────────────────────────────────────────────────────────────────┤
│  • Block Class    - Cấu trúc block (index, timestamp, data,     │
│                     previousHash, hash)                          │
│  • Blockchain     - Chain management, validation                │
│  • SHA-256        - Cryptographic hashing                       │
│  • Validation     - Integrity checking                          │
└─────────────────────────────────────────────────────────────────┘
                              ↕️
┌─────────────────────────────────────────────────────────────────┐
│           STORAGE LAYER (data/chain.json)                        │
├─────────────────────────────────────────────────────────────────┤
│  • File-based storage                                            │
│  • JSON format                                                   │
│  • Persistent data                                               │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🔄 LUỒNG DỮ LIỆU (DATA FLOW)

### 1. TẠO LÔ SẢN PHẨM (Create Batch)

```
Nông dân (Frontend)
    ↓
    Form: batchId, product, producer, farmLocation, area...
    ↓
    POST /api/batch
    ↓
    Server validates input
    ↓
    Blockchain.addBlock({type: 'batch', ...})
    ↓
    Create new Block:
    - index = lastBlock.index + 1
    - timestamp = now()
    - previousHash = lastBlock.hash
    - hash = SHA-256(...)
    ↓
    Save to data/chain.json
    ↓
    Return block to frontend
    ↓
    Display result
```

### 2. GHI NHẬN HOẠT ĐỘNG (Log Activity)

```
User (Any role)
    ↓
    POST /api/{endpoint}/:batchId
    ↓
    Server validates batchId exists
    ↓
    Blockchain.addBlock({type: 'activity', ...})
    ↓
    Append to chain
    ↓
    Save to file
    ↓
    Return confirmation
```

### 3. TRUY XUẤT & QR CODE (Trace & QR)

```
Consumer
    ↓
    Scan QR Code OR Enter batchId
    ↓
    GET /api/batch/:batchId
    ↓
    Blockchain.findBatch(batchId)
    ↓
    Filter all blocks with matching batchId
    ↓
    Return full history array
    ↓
    Frontend displays timeline
```

### 4. TẠO QR CODE

```
User requests QR
    ↓
    GET /api/qrcode/:batchId
    ↓
    Check if batch exists
    ↓
    Generate trace URL
    ↓
    QRCode.toDataURL(url)
    ↓
    Return base64 image
    ↓
    Display QR on screen
```

---

## 🔐 BẢO MẬT & TOÀN VẸN (Security & Integrity)

### Blockchain Validation

```javascript
isChainValid() {
  for (let i = 1; i < chain.length; i++) {
    const current = chain[i];
    const previous = chain[i-1];
    
    // 1. Kiểm tra hash của block hiện tại
    if (current.hash !== current.computeHash()) {
      return false; // Block bị thay đổi!
    }
    
    // 2. Kiểm tra liên kết với block trước
    if (current.previousHash !== previous.hash) {
      return false; // Chain bị phá vỡ!
    }
  }
  return true; // Chain hợp lệ
}
```

### Hash Computation

```javascript
SHA-256(
  block.index + 
  block.timestamp + 
  JSON.stringify(block.data) + 
  block.previousHash
)
```

**Đặc điểm:**
- Thay đổi 1 ký tự → Hash hoàn toàn khác
- Không thể đảo ngược (one-way function)
- Deterministic (cùng input → cùng output)

---

## 📦 CẤU TRÚC DỮ LIỆU (Data Structures)

### Block Structure

```javascript
{
  index: 5,
  timestamp: "2025-11-26T10:30:00.000Z",
  data: {
    type: "farming",
    batchId: "LOT-2025-001",
    actor: "Nguyễn Văn A",
    activity: "fertilizing",
    fertilizer: "NPK 16-16-8",
    pesticide: "Confidor 200SL",
    notes: "..."
  },
  previousHash: "abc123def456...",
  hash: "789xyz012abc..."
}
```

### Data Types

```javascript
types = [
  'batch',      // Tạo lô
  'farming',    // Chăm sóc
  'harvest',    // Thu hoạch
  'quality',    // Kiểm định
  'packaging',  // Đóng gói
  'transport',  // Vận chuyển
  'warehouse',  // Nhập/Xuất kho
  'log'         // Log tùy chỉnh
]
```

### Chain File (data/chain.json)

```json
[
  {
    "index": 0,
    "timestamp": "2025-11-26T09:00:00.000Z",
    "data": { "info": "Genesis Block" },
    "previousHash": "0",
    "hash": "genesis123..."
  },
  {
    "index": 1,
    "timestamp": "2025-11-26T10:00:00.000Z",
    "data": {
      "type": "batch",
      "batchId": "LOT-2025-001",
      ...
    },
    "previousHash": "genesis123...",
    "hash": "abc456..."
  }
]
```

---

## 🎯 DESIGN PATTERNS

### 1. Singleton Pattern (Blockchain)

```javascript
// server.js
const ledger = new Blockchain(); // Duy nhất 1 instance
```

### 2. Factory Pattern (Block Creation)

```javascript
class Block {
  constructor(index, timestamp, data, previousHash) {
    this.index = index;
    this.timestamp = timestamp;
    this.data = data;
    this.previousHash = previousHash;
    this.hash = this.computeHash();
  }
}
```

### 3. Chain of Responsibility (Block Linking)

```
Genesis → Block1 → Block2 → Block3 → ...
   ↓         ↓         ↓         ↓
  hash → prevHash → prevHash → prevHash
```

---

## ⚡ PERFORMANCE CONSIDERATIONS

### Current Implementation (Small Scale)

- **Storage:** File-based (chain.json)
- **Query:** Linear search O(n)
- **Scalability:** ~10,000 blocks OK
- **Concurrency:** Single-threaded

### Optimization Strategies

#### 1. Indexing
```javascript
// Thêm index cho batchId
batchIndex = {
  'LOT-2025-001': [1, 5, 8, 12, 15],  // block indices
  'LOT-2025-002': [2, 6, 9]
}
```

#### 2. Caching
```javascript
// Cache recent queries
const cache = new Map();
cache.set(batchId, history);
```

#### 3. Database Migration
```javascript
// Chuyển sang MongoDB/PostgreSQL
// Lưu mỗi block như một document/row
```

---

## 🔮 NÂNG CẤP TRONG TƯƠNG LAI

### Phase 1: Enhanced Security
- [ ] User authentication (JWT)
- [ ] Role-based access control (RBAC)
- [ ] Digital signatures cho mỗi transaction
- [ ] Proof of Authority consensus

### Phase 2: Scalability
- [ ] Database integration (MongoDB/PostgreSQL)
- [ ] Redis caching
- [ ] Load balancing
- [ ] Microservices architecture

### Phase 3: Distributed System
- [ ] Multiple nodes
- [ ] Peer-to-peer networking
- [ ] Consensus mechanism (PoW/PoS/PoA)
- [ ] Byzantine fault tolerance

### Phase 4: Smart Contracts
- [ ] Ethereum/Hyperledger integration
- [ ] Automated business logic
- [ ] Token economics
- [ ] IoT integration (sensors)

### Phase 5: Advanced Features
- [ ] IPFS for images/documents
- [ ] Machine Learning analytics
- [ ] Predictive quality analysis
- [ ] Supply chain optimization
- [ ] Mobile app (React Native)
- [ ] Blockchain explorer UI

---

## 🌐 DEPLOYMENT ARCHITECTURE

### Development
```
localhost:3000
├── Node.js server
└── File storage (data/chain.json)
```

### Production (Option 1: Single Server)
```
Cloud Server (DigitalOcean/AWS)
├── Nginx (reverse proxy)
├── Node.js (PM2 process manager)
├── PostgreSQL (data storage)
└── SSL/TLS (Let's Encrypt)
```

### Production (Option 2: Microservices)
```
Load Balancer
├── API Gateway
├── Blockchain Service (Node 1, 2, 3)
├── QR Service
├── Database Cluster
└── Redis Cache
```

---

## 📊 MONITORING & LOGGING

### Metrics to Track
- Total blocks
- Blockchain size (MB)
- API response time
- Error rate
- Active batches
- User activity

### Logging Strategy
```javascript
// Winston logger
logger.info('Block added', { batchId, index });
logger.error('Validation failed', { error });
logger.warn('Large chain size', { blocks: 50000 });
```

---

## 🧪 TESTING STRATEGY

### Unit Tests
```javascript
describe('Blockchain', () => {
  it('should create genesis block', () => {
    const bc = new Blockchain();
    expect(bc.chain.length).toBe(1);
  });
  
  it('should validate chain', () => {
    expect(bc.isChainValid()).toBe(true);
  });
});
```

### Integration Tests
```javascript
describe('API', () => {
  it('POST /api/batch should create batch', async () => {
    const res = await request(app)
      .post('/api/batch')
      .send({ batchId: 'TEST', product: 'Test' });
    expect(res.status).toBe(200);
  });
});
```

---

## 📚 TECHNOLOGY STACK

| Layer | Technology | Purpose |
|-------|-----------|---------|
| Frontend | HTML5, CSS3, JavaScript | User interface |
| Backend | Node.js, Express | REST API server |
| Blockchain | Custom (SHA-256) | Data integrity |
| QR Code | qrcode library | QR generation |
| Storage | File system (JSON) | Persistence |
| Crypto | Node crypto module | Hashing |

---

## 🔗 INTEGRATION POINTS

### 1. External Systems
- ERP systems (via REST API)
- IoT sensors (MQTT/HTTP)
- Payment gateways
- Certification bodies

### 2. Third-party Services
- SMS notifications (Twilio)
- Email (SendGrid)
- Cloud storage (AWS S3)
- Maps (Google Maps API)

---

**📖 Document Version: 2.0**  
**Last Updated: November 26, 2025**  
**Author: Blockchain Traceability Team**
