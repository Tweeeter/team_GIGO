@echo off
echo ========================================
echo      GitHub Repository Setup Script
echo ========================================
echo.
echo This script will help you upload your Enhanced WebGIS Platform to GitHub
echo.
echo Step 1: Create a GitHub Repository
echo ----------------------------------
echo 1. Go to https://github.com/new
echo 2. Repository name: sih-enhanced-webgis-platform
echo 3. Description: Enhanced WebGIS Platform for Forest Rights Act Management - Interactive Maps, Analytics & AI Detection
echo 4. Make it Public (for sharing with team)
echo 5. DON'T initialize with README (we already have one)
echo 6. Click "Create repository"
echo.
echo Step 2: Copy the Repository URL
echo -------------------------------
echo After creating, GitHub will show you a URL like:
echo https://github.com/yourusername/sih-enhanced-webgis-platform.git
echo.
echo Step 3: Run the Upload Commands
echo --------------------------------
echo Copy and paste these commands in PowerShell:
echo.
echo git branch -M main
echo git remote add origin https://github.com/YOURUSERNAME/sih-enhanced-webgis-platform.git
echo git push -u origin main
echo.
echo Replace YOURUSERNAME with your actual GitHub username!
echo.
echo ========================================
echo Current Git Status:
echo ========================================
git log --oneline -5
echo.
echo ========================================
echo Ready to Upload! Follow the steps above.
echo ========================================
pause