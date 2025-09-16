@echo off
echo ================================================
echo SIH Platform - Production Deployment
echo Enhanced WebGIS System
echo ================================================

echo.
echo WARNING: This will deploy the system in PRODUCTION mode
echo Make sure you have configured:
echo - .env.production file with proper credentials
echo - SSL certificates (if using HTTPS)
echo - Production database settings
echo.
set /p confirm="Continue with production deployment? (y/N): "
if /i not "%confirm%"=="y" (
    echo Deployment cancelled.
    pause
    exit /b 0
)

echo.
echo Starting production deployment...

echo.
echo [1/4] Stopping any existing services...
docker-compose -f docker-compose.prod.yml down

echo.
echo [2/4] Building production images...
docker-compose -f docker-compose.prod.yml build --no-cache

echo.
echo [3/4] Starting production services...
docker-compose -f docker-compose.prod.yml up -d

echo.
echo [4/4] Waiting for services to initialize...
timeout /t 15 /nobreak > nul

echo.
echo ================================================
echo Production Deployment Status:
echo ================================================
docker-compose -f docker-compose.prod.yml ps

echo.
echo ================================================
echo Production Access Points:
echo ================================================
echo - Main Backend API: http://your-domain:8000
echo - Asset Mapping Backend: http://your-domain:8001  
echo - Asset Mapping Frontend: http://your-domain:3000
echo - FRA Atlas System (WebGIS): http://your-domain:5173
echo - Nginx Reverse Proxy: http://your-domain

echo.
echo ================================================
echo WebGIS Production Features:
echo ================================================
echo ✅ Production-optimized Leaflet Maps
echo ✅ Cached GIS Data with PostGIS
echo ✅ Optimized Asset Detection Pipeline
echo ✅ Secure Authentication ^& Authorization
echo ✅ Export Functionality (CSV/PDF/Excel)
echo ✅ Performance Monitoring ^& Logging

echo.
echo ================================================
echo Production Management:
echo ================================================
echo - Monitor logs: docker-compose -f docker-compose.prod.yml logs -f
echo - Stop services: docker-compose -f docker-compose.prod.yml down
echo - Update service: docker-compose -f docker-compose.prod.yml up -d --build [service]

echo.
echo Production deployment completed!
echo Configure your domain DNS to point to this server.
echo.
pause