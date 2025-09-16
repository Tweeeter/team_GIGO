@echo off
echo ===============================================
echo    Creating Public Tunnels
echo    Asset Mapping + Digitization Systems
echo ===============================================

echo.
echo This script creates public internet tunnels using serveo.net
echo Your friend will be able to access the services from anywhere!
echo.
echo Make sure all services are running first (use start_all_services.bat)
echo.
pause

echo.
echo ===============================================
echo    Creating Tunnels
echo ===============================================

echo.
echo [1/4] Creating tunnel for Asset Mapping Frontend (Port 3000)...
start "Tunnel - Asset Frontend" cmd /c "ssh -o StrictHostKeyChecking=no -R 80:localhost:3000 serveo.net"
timeout /t 3 >nul

echo.
echo [2/4] Creating tunnel for Asset Mapping Backend (Port 8002)...
start "Tunnel - Asset Backend" cmd /c "ssh -o StrictHostKeyChecking=no -R 80:localhost:8002 serveo.net"
timeout /t 3 >nul

echo.
echo [3/4] Creating tunnel for FRA Atlas Frontend (Port 5173)...
start "Tunnel - FRA Frontend" cmd /c "ssh -o StrictHostKeyChecking=no -R 80:localhost:5173 serveo.net"
timeout /t 3 >nul

echo.
echo [4/4] Creating tunnel for Digitization Backend (Port 8000)...
start "Tunnel - Digitization Backend" cmd /c "ssh -o StrictHostKeyChecking=no -R 80:localhost:8000 serveo.net"
timeout /t 3 >nul

echo.
echo ===============================================
echo    Tunnels Created!
echo ===============================================
echo.
echo Check the individual tunnel windows for the public URLs.
echo Each tunnel will show a URL like:
echo   https://xxxxxxxxx.serveo.net
echo.
echo Share these URLs with your friend for remote access!
echo.
echo Services:
echo   - Asset Mapping Frontend: Check "Tunnel - Asset Frontend" window
echo   - Asset Mapping Backend: Check "Tunnel - Asset Backend" window  
echo   - FRA Atlas Frontend: Check "Tunnel - FRA Frontend" window
echo   - Digitization Backend: Check "Tunnel - Digitization Backend" window
echo.
echo ===============================================
echo.
pause