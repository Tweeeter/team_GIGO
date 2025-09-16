@echo off
echo Stopping SIH Production Services...

docker-compose -f docker-compose.prod.yml down

echo Production services stopped.
pause