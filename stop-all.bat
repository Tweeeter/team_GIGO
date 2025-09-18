@echo off
echo ===============================================
echo    Stopping All Services
echo    SIH FRA Atlas System
echo ===============================================

echo.
echo Stopping all running services...

echo.
echo [1/6] Stopping DSS Backend (Port 8000)...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":8000" ^| find "LISTENING"') do (
    echo Found process %%a on port 8000
    taskkill /f /pid %%a >nul 2>&1
)

echo.
echo [2/6] Stopping Digitization Backend (Port 8001)...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":8001" ^| find "LISTENING"') do (
    echo Found process %%a on port 8001
    taskkill /f /pid %%a >nul 2>&1
)

echo.
echo [3/6] Stopping Asset Mapping Backend (Port 8002)...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":8002" ^| find "LISTENING"') do (
    echo Found process %%a on port 8002
    taskkill /f /pid %%a >nul 2>&1
)

echo.
echo [4/6] Stopping FRA Atlas Frontend (Port 5173)...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":5173" ^| find "LISTENING"') do (
    echo Found process %%a on port 5173
    taskkill /f /pid %%a >nul 2>&1
)

echo.
echo [5/6] Stopping Asset Mapping Frontend (Port 3000)...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":3000" ^| find "LISTENING"') do (
    echo Found process %%a on port 3000
    taskkill /f /pid %%a >nul 2>&1
)

echo.
echo [6/6] Closing service terminal windows...
REM Close terminal windows by title
taskkill /f /fi "WindowTitle eq DSS Backend - Port 8000*" >nul 2>&1
taskkill /f /fi "WindowTitle eq Digitization Backend - Port 8001*" >nul 2>&1
taskkill /f /fi "WindowTitle eq Asset Mapping Backend - Port 8002*" >nul 2>&1
taskkill /f /fi "WindowTitle eq FRA Atlas System - Port 5173*" >nul 2>&1
taskkill /f /fi "WindowTitle eq Asset Mapping Frontend - Port 3000*" >nul 2>&1

echo.
echo ===============================================
echo    All Services Stopped!
echo ===============================================
echo.
echo All running services and their terminal windows
echo have been stopped and closed.
echo.
echo Services stopped:
echo   ✓ DSS Backend (Port 8000)
echo   ✓ Digitization Backend (Port 8001)
echo   ✓ Asset Mapping Backend (Port 8002)
echo   ✓ FRA Atlas Frontend (Port 5173)
echo   ✓ Asset Mapping Frontend (Port 3000)
echo.
echo You can restart services using the launcher.
echo.
pause