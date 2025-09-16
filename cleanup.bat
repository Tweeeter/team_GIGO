@echo off
echo Cleaning up Docker resources...

REM Stop all containers
docker-compose down

REM Remove all containers, networks, and volumes
docker-compose down -v --remove-orphans

REM Clean up unused Docker resources
docker system prune -f

REM Clean up unused volumes
docker volume prune -f

REM Clean up unused images
docker image prune -f

echo.
echo Cleanup completed!
echo - All containers stopped and removed
echo - All networks removed  
echo - All volumes removed
echo - Unused Docker resources cleaned
echo.
pause