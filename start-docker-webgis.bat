@echo off
echo ================================================
echo SIH Comprehensive Platform - Enhanced WebGIS
echo ================================================
echo Starting all services with Docker...

echo.
echo Checking Docker status...
docker --version
if %errorlevel% neq 0 (
    echo ERROR: Docker not found. Please install Docker Desktop.
    pause
    exit /b 1
)

echo.
echo Building and starting all services...
docker-compose down
docker-compose up -d --build

echo.
echo Waiting for services to initialize...
timeout /t 10 /nobreak > nul

echo.
echo ================================================
echo Services Status:
echo ================================================
docker-compose ps

echo.
echo ================================================
echo Access Points:
echo ================================================
echo - Main Backend API: http://localhost:8000
echo - Asset Mapping Backend: http://localhost:8001  
echo - Asset Mapping Frontend: http://localhost:3000
echo - FRA Atlas System (Enhanced WebGIS): http://localhost:5173
echo - PostgreSQL Database: localhost:5432
echo - Redis Cache: localhost:6379
echo - Nginx Proxy: http://localhost:80

echo.
echo ================================================
echo WebGIS Features Available:
echo ================================================
echo ✅ Interactive Leaflet Maps with Multi-layers
echo ✅ IFR/CFR Claims with Status Indicators  
echo ✅ Village Asset Mapping ^& Detection Results
echo ✅ Advanced Filtering (States/Districts/Tribal Groups)
echo ✅ FRA Progress Dashboard with Export (CSV/PDF/Excel)
echo ✅ Real-time Layer Toggles and Visual Feedback

echo.
echo ================================================
echo Management Commands:
echo ================================================
echo - View logs: docker-compose logs -f [service_name]
echo - Stop services: docker-compose down
echo - Restart service: docker-compose restart [service_name]
echo - View status: docker-compose ps

echo.
echo All services are starting up...
echo Open http://localhost:5173/webgis to access the WebGIS system!
echo.
pause