@echo off
chcp 65001 >nul
cls
echo ============================================================
echo    TẠO 20 LÔ TRÁI CÂY MIỀN TÂY - BLOCKCHAIN TRACEABILITY
echo ============================================================
echo.
echo Lưu ý: Server phải đang chạy ở terminal khác!
echo.
echo Đang kiểm tra server và tạo dữ liệu...
echo.

"C:\Program Files\nodejs\node.exe" create-data-simple.js

echo.
echo ============================================================
echo Hoàn tất! Nhấn phím bất kỳ để đóng...
pause >nul
