@echo off
echo ===============================================
echo    Starting All Services
echo    SIH FRA Atlas System
echo ===============================================

cd /d "c:\Users\Aaditya\Desktop\final sih coppro"

echo.
echo Activating Virtual Environment...
call ".venv\Scripts\activate.bat"

echo.
echo ===============================================
echo    Starting Backend Services
echo ===============================================

echo.
echo [1/5] Starting DSS Backend with Asset Mapping (Port 8000)...
start "DSS Backend - Port 8000" cmd /c "cd backend && python main_dss.py"
timeout /t 3 >nul

echo.
echo [2/5] Starting Digitization Backend (Port 8001)...
start "Digitization Backend - Port 8001" cmd /c "cd backend && set PORT=8001 && python main.py"
timeout /t 3 >nul

echo.
echo [3/5] Starting Asset Mapping Backend (Port 8002)...
start "Asset Mapping Backend - Port 8002" cmd /c "cd asset-mapping-backend && python main.py"
timeout /t 3 >nul

echo.
echo ===============================================
echo    Starting Frontend Services
echo ===============================================

echo.
echo [4/5] Starting FRA Atlas System (Port 5173)...
start "FRA Atlas System - Port 5173" cmd /c "cd fra-atlas-system && npm run dev"
timeout /t 5 >nul

echo.
echo [5/5] Starting Asset Mapping Frontend (Port 3000)...
start "Asset Mapping Frontend - Port 3000" cmd /c "cd asset-mapping-frontend && npm start"
timeout /t 5 >nul

echo.
echo ===============================================
echo    All Services Started!
echo ===============================================
echo.
echo Services are starting in separate windows:
echo.
echo Backend Services:
echo   ✓ DSS Backend (with Asset Mapping): http://localhost:8000
echo     - API Documentation: http://localhost:8000/docs
echo     - Asset Mapping Routes: http://localhost:8000/api/asset-mapping/
echo.
echo   ✓ Digitization Backend: http://localhost:8001
echo     - API Documentation: http://localhost:8001/docs
echo     - File Processing: http://localhost:8001/api/files/
echo.
echo   ✓ Asset Mapping Backend: http://localhost:8002
echo     - Direct API Access (if needed)
echo.
echo Frontend Services:
echo   ✓ FRA Atlas System: http://localhost:5173
echo     - Main application with integrated asset mapping
echo.
echo   ✓ Asset Mapping Frontend: http://localhost:3000
echo     - Standalone asset mapping interface
echo.
echo ===============================================
echo    Service Architecture
echo ===============================================
echo.
echo The system uses integrated backends:
echo.
echo 1. FRA Atlas System (localhost:5173) communicates with:
echo    - DSS Backend (localhost:8000) for asset mapping
echo    - Digitization Backend (localhost:8001) for file processing
echo.
echo 2. Asset Mapping Frontend (localhost:3000) communicates with:
echo    - Asset Mapping Backend (localhost:8002) directly
echo.
echo 3. All backend services are independent and can be used
echo    directly via their API documentation endpoints.
echo.
echo ===============================================
echo.
echo All services should be ready in 30-60 seconds.
echo Check the individual windows for any startup errors.
echo.
echo Press any key to return to the launcher...
pause >nul