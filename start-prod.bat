@echo off
echo Starting SIH Project in Production Mode...

REM Load production environment
copy .env.production .env

REM Build and start all services in production mode
docker-compose -f docker-compose.prod.yml up --build -d

echo.
echo Production services starting up...
echo - Main Application: http://localhost:80
echo - Asset Mapping Frontend: http://localhost:3000
echo - FRA Atlas System: http://localhost:5173
echo - Database: localhost:5432
echo.
echo Use 'docker-compose -f docker-compose.prod.yml logs -f [service-name]' to view logs
echo Use 'stop-prod.bat' to stop all services
echo.
pause