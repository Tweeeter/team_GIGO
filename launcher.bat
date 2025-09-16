@echo off
:menu
cls
echo ===============================================
echo    SIH Asset Mapping ^& Digitization System
echo ===============================================
echo.
echo Choose an option:
echo.
echo [1] Install Dependencies (Run once)
echo [2] Start All Services (Local access)
echo [3] Create Public Tunnels (Internet access)
echo [4] View Service URLs
echo [5] Exit
echo.
set /p choice="Enter your choice (1-5): "

if "%choice%"=="1" goto install
if "%choice%"=="2" goto start
if "%choice%"=="3" goto tunnel
if "%choice%"=="4" goto urls
if "%choice%"=="5" goto exit
goto menu

:install
echo.
echo Starting installation...
call install_dependencies.bat
pause
goto menu

:start
echo.
echo Starting all services...
call start_all_services.bat
pause
goto menu

:tunnel
echo.
echo Creating public tunnels...
call create_public_tunnels.bat
pause
goto menu

:urls
cls
echo ===============================================
echo    Service URLs
echo ===============================================
echo.
echo Local Access URLs:
echo   Asset Mapping System: http://localhost:3000
echo   FRA Digitization System: http://localhost:5173
echo   Asset Mapping API: http://localhost:8002
echo   Digitization API: http://localhost:8000
echo   API Documentation: http://localhost:8000/docs
echo.
echo For public access, use option [3] to create tunnels
echo and check the tunnel windows for internet URLs.
echo.
pause
goto menu

:exit
echo.
echo Goodbye!
exit