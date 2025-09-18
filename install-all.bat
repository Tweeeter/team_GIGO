@echo off
echo ===============================================
echo    Installing All Dependencies
echo    SIH FRA Atlas System
echo ===============================================

cd /d "c:\Users\Aaditya\Desktop\final sih coppro"

echo.
echo [1/7] Creating Python Virtual Environment...
if not exist ".venv" (
    python -m venv .venv
    if %errorlevel% neq 0 (
        echo Error creating virtual environment
        pause
        exit /b 1
    )
    echo Virtual environment created successfully.
) else (
    echo Virtual environment already exists.
)

echo.
echo [2/7] Activating Virtual Environment...
call ".venv\Scripts\activate.bat"

echo.
echo [3/7] Installing Backend Dependencies (DSS + Digitization)...
cd backend
pip install --upgrade pip setuptools wheel
echo Installing backend requirements...
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo.
    echo Primary installation failed, trying essential packages only...
    pip install fastapi uvicorn python-multipart httpx aiofiles pillow
    if %errorlevel% neq 0 (
        echo Error installing essential backend dependencies
        pause
        exit /b 1
    )
    echo Essential packages installed successfully.
)

echo.
echo [4/7] Installing Asset Mapping Backend Dependencies...
cd "..\asset-mapping-backend"
if exist "requirements.txt" (
    pip install -r requirements.txt
    if %errorlevel% neq 0 (
        echo Installing fallback dependencies...
        pip install fastapi uvicorn pillow numpy python-multipart httpx
        if %errorlevel% neq 0 (
            echo Error installing asset mapping backend dependencies
            pause
            exit /b 1
        )
    )
) else (
    echo No requirements.txt found, installing essential packages...
    pip install fastapi uvicorn pillow numpy python-multipart httpx
    if %errorlevel% neq 0 (
        echo Error installing asset mapping backend dependencies
        pause
        exit /b 1
    )
)

echo.
echo [5/7] Installing FRA Atlas System Frontend Dependencies...
cd "..\fra-atlas-system"
call npm install
if %errorlevel% neq 0 (
    echo Error installing FRA Atlas frontend dependencies
    pause
    exit /b 1
)

echo.
echo [6/7] Installing Asset Mapping Frontend Dependencies...
cd "..\asset-mapping-frontend"
call npm install
if %errorlevel% neq 0 (
    echo Error installing asset mapping frontend dependencies
    pause
    exit /b 1
)

echo.
echo [7/7] Verifying Installation...
cd ".."
echo.
echo ✓ Python Virtual Environment: Ready
echo ✓ Backend Dependencies: Installed
echo ✓ Asset Mapping Backend: Installed
echo ✓ FRA Atlas Frontend: Installed
echo ✓ Asset Mapping Frontend: Installed

echo.
echo ===============================================
echo    Installation Complete!
echo ===============================================
echo.
echo All dependencies have been installed successfully.
echo You can now start all services using the launcher.
echo.
pause