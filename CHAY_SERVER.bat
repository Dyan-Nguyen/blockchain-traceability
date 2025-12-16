@echo off
chcp 65001 >nul
cls
echo ============================================================
echo    KHỞI ĐỘNG SERVER BLOCKCHAIN TRACEABILITY
echo ============================================================
echo.
echo Server sẽ chạy tại: http://localhost:3000
echo Nhấn Ctrl+C để dừng server
echo.
echo Đang khởi động...
echo.

"C:\Program Files\nodejs\node.exe" server.js

pause
