@echo off
echo ================================================
echo SIH Platform - Service Health Check
echo Enhanced WebGIS System
echo ================================================

echo.
echo Checking Docker services status...
echo.

echo [1/6] Checking Backend Service...
curl -s http://localhost:8000/docs > nul
if %errorlevel% equ 0 (
    echo ✅ Backend Service: HEALTHY
) else (
    echo ❌ Backend Service: NOT RESPONDING
)

echo.
echo [2/6] Checking Asset Mapping Backend...
curl -s http://localhost:8001 > nul
if %errorlevel% equ 0 (
    echo ✅ Asset Mapping Backend: HEALTHY
) else (
    echo ❌ Asset Mapping Backend: NOT RESPONDING  
)

echo.
echo [3/6] Checking Asset Mapping Frontend...
curl -s http://localhost:3000 > nul
if %errorlevel% equ 0 (
    echo ✅ Asset Mapping Frontend: HEALTHY
) else (
    echo ❌ Asset Mapping Frontend: NOT RESPONDING
)

echo.
echo [4/6] Checking FRA Atlas System (WebGIS)...
curl -s http://localhost:5173 > nul
if %errorlevel% equ 0 (
    echo ✅ FRA Atlas System: HEALTHY
) else (
    echo ❌ FRA Atlas System: NOT RESPONDING
)

echo.
echo [5/6] Checking PostgreSQL Database...
docker-compose exec -T postgres pg_isready -U sih_user > nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ PostgreSQL Database: HEALTHY
) else (
    echo ❌ PostgreSQL Database: NOT RESPONDING
)

echo.
echo [6/6] Checking Redis Cache...
docker-compose exec -T redis redis-cli ping > nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Redis Cache: HEALTHY
) else (
    echo ❌ Redis Cache: NOT RESPONDING
)

echo.
echo ================================================
echo Container Status Summary:
echo ================================================
docker-compose ps

echo.
echo ================================================
echo WebGIS-Specific Health Checks:
echo ================================================

echo Testing WebGIS page accessibility...
curl -s http://localhost:5173/webgis > nul
if %errorlevel% equ 0 (
    echo ✅ WebGIS Page: ACCESSIBLE
) else (
    echo ❌ WebGIS Page: NOT ACCESSIBLE
)

echo.
echo Testing GIS API endpoints...
curl -s http://localhost:8000/api/gis/states > nul
if %errorlevel% equ 0 (
    echo ✅ GIS API: RESPONDING
) else (
    echo ❌ GIS API: NOT RESPONDING
)

echo.
echo ================================================
echo System Resource Usage:
echo ================================================
docker stats --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}"

echo.
echo Health check completed!
echo.
pause