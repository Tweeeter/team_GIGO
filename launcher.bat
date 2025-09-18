@echo off
cd /d "c:\Users\Aaditya\Desktop\final sih coppro"
:menu
cls
echo ===============================================
echo    SIH FRA Atlas System Launcher
echo    Asset Mapping ^& Digitization Platform
echo ===============================================
echo.
echo Choose an option:
echo.
echo [1] Install All Dependencies
echo [2] Start All Services (Local Development)
echo [3] Stop All Services
echo [4] View Service Status ^& URLs
echo [5] Exit
echo.
set /p choice="Enter your choice (1-5): "

if "%choice%"=="1" goto install
if "%choice%"=="2" goto start
if "%choice%"=="3" goto stop
if "%choice%"=="4" goto status
if "%choice%"=="5" goto exit
echo Invalid choice. Please try again.
timeout /t 2 >nul
goto menu

:install
echo.
echo ===============================================
echo Installing All Dependencies...
echo ===============================================
cd /d "c:\Users\Aaditya\Desktop\final sih coppro"
call install-all.bat
pause
goto menu

:start
echo.
echo ===============================================
echo Starting All Services...
echo ===============================================
cd /d "c:\Users\Aaditya\Desktop\final sih coppro"
call start-all-local.bat
pause
goto menu

:stop
echo.
echo ===============================================
echo Stopping All Services...
echo ===============================================
cd /d "c:\Users\Aaditya\Desktop\final sih coppro"
call stop-all.bat
pause
goto menu

:status
cls
echo ===============================================
echo    Service Status ^& URLs
echo ===============================================
echo.
echo Frontend Services:
echo   - FRA Atlas System: http://localhost:5173
echo   - Asset Mapping UI: http://localhost:3000
echo.
echo Backend Services:
echo   - DSS Backend (main): http://localhost:8000
echo   - DSS API Docs: http://localhost:8000/docs
echo   - Digitization Backend: http://localhost:8001
echo   - Digitization API Docs: http://localhost:8001/docs
echo   - Asset Mapping Backend: http://localhost:8002
echo.
echo Integrated Endpoints:
echo   - Asset Mapping via DSS: http://localhost:8000/api/asset-mapping/
echo   - File Processing: http://localhost:8001/api/files/
echo.
echo ===============================================
pause
goto menu

:exit
echo.
echo Goodbye!
timeout /t 2 >nul
exit