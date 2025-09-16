@echo off
echo Starting SIH Project in Development Mode...

REM Load development environment
copy .env.development .env

REM Build and start all services
docker-compose up --build -d

echo.
echo Services starting up...
echo - Asset Mapping Frontend: http://localhost:3000
echo - FRA Atlas System: http://localhost:5173  
echo - Main Backend API: http://localhost:8000
echo - Asset Mapping API: http://localhost:8001
echo - Nginx Proxy: http://localhost:80
echo.
echo Use 'docker-compose logs -f [service-name]' to view logs
echo Use 'stop-dev.bat' to stop all services
echo.
pause