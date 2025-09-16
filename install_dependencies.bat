@echo off
echo ===============================================
echo    Installing All Dependencies
echo    Asset Mapping + Digitization Systems
echo ===============================================

cd /d "c:\Users\Aaditya\Desktop\final sih coppro"

echo.
echo [1/6] Activating Virtual Environment...
call ".venv\Scripts\activate.bat"

echo.
echo [2/6] Installing Python Dependencies for Backend...
cd backend
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo Error installing backend dependencies
    pause
    exit /b 1
)

echo.
echo [3/6] Installing Python Dependencies for Asset Mapping Backend...
cd "..\asset-mapping-backend"
pip install fastapi uvicorn pillow numpy python-multipart
if %errorlevel% neq 0 (
    echo Error installing asset mapping backend dependencies
    pause
    exit /b 1
)

echo.
echo [4/6] Installing Node.js Dependencies for Asset Mapping Frontend...
cd "..\asset-mapping-frontend"
npm install
if %errorlevel% neq 0 (
    echo Error installing asset mapping frontend dependencies
    pause
    exit /b 1
)

echo.
echo [5/6] Installing Node.js Dependencies for FRA Atlas System...
cd "..\fra-atlas-system"
npm install
if %errorlevel% neq 0 (
    echo Error installing FRA atlas dependencies
    pause
    exit /b 1
)

echo.
echo [6/6] Installation Complete!
echo ===============================================
echo    All Dependencies Successfully Installed!
echo ===============================================
echo.
echo You can now run start_all_services.bat to launch all systems
pause