@echo off
echo ===============================================
echo    Starting All Services
echo    Asset Mapping + Digitization Systems
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
echo [1/4] Starting Digitization Backend (Port 8000)...
start "Digitization Backend" cmd /c "cd backend && python main.py"
timeout /t 3 >nul

echo.
echo [2/4] Starting Asset Mapping Backend (Port 8002)...
start "Asset Mapping Backend" cmd /c "cd asset-mapping-backend && python main.py"
timeout /t 3 >nul

echo.
echo ===============================================
echo    Starting Frontend Services
echo ===============================================

echo.
echo [3/4] Starting Asset Mapping Frontend (Port 3000)...
start "Asset Mapping Frontend" cmd /c "cd asset-mapping-frontend && npm start"
timeout /t 5 >nul

echo.
echo [4/4] Starting FRA Atlas System (Port 5173)...
start "FRA Atlas System" cmd /c "cd fra-atlas-system && npm run dev"
timeout /t 5 >nul

echo.
echo ===============================================
echo    All Services Started!
echo ===============================================
echo.
echo Services are starting in separate windows:
echo.
echo Backend Services:
echo   - Digitization Backend: http://localhost:8000
echo   - Asset Mapping Backend: http://localhost:8002
echo.
echo Frontend Services:
echo   - Asset Mapping Frontend: http://localhost:3000
echo   - FRA Atlas System: http://localhost:5173
echo.
echo ===============================================
echo    Service URLs
echo ===============================================
echo.
echo Asset Mapping System:
echo   Frontend: http://localhost:3000
echo   Backend API: http://localhost:8002
echo.
echo FRA Digitization System:
echo   Frontend: http://localhost:5173
echo   Backend API: http://localhost:8000
echo   API Docs: http://localhost:8000/docs
echo.
echo ===============================================
echo.
echo All services should be ready in 30-60 seconds.
echo Check the individual windows for any errors.
echo.
pause