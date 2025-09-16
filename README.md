# 🌍 SIH Enhanced WebGIS Platform - Forest Rights Act Management System

[![Docker](https://img.shields.io/badge/Docker-Ready-blue.svg)](https://docker.com/)
[![WebGIS](https://img.shields.io/badge/WebGIS-Enhanced-green.svg)](http://localhost:5173/webgis)
[![React](https://img.shields.io/badge/React-18.x-61dafb.svg)](https://reactjs.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-Latest-009688.svg)](https://fastapi.tiangolo.com/)
[![PostGIS](https://img.shields.io/badge/PostGIS-Enabled-336791.svg)](https://postgis.net/)

## 🎯 Project Overview

A comprehensive Forest Rights Act (FRA) management platform featuring **advanced WebGIS capabilities**, interactive mapping, asset detection, and analytics dashboard. Built for the Smart India Hackathon (SIH) to digitize and streamline FRA processes across India.

## 🌟 Key Features

### ✅ **Interactive WebGIS System** 
- 🗺️ **Leaflet-based Interactive Maps** with zoom, pan, and multi-layer support
- 🎯 **IFR/CFR Claim Visualization** with color-coded status indicators
- 🏗️ **Village Asset Mapping** with AI detection results and condition monitoring  
- 🔍 **Advanced Filtering** by states, districts, villages, and tribal groups
- 🎛️ **Real-time Layer Toggles** with visual feedback

### ✅ **Comprehensive Analytics Dashboard**
- 📊 **Multi-level Progress Tracking** (State → District → Block → Village)
- 📈 **Interactive Charts** using Recharts (Bar, Pie, Line charts)
- 📋 **Export Capabilities** - CSV (functional), PDF & Excel (ready)
- 🎨 **Performance Metrics** with success rates and trends

### ✅ **Advanced AI & Detection**
- 🤖 **OCR Processing** for document digitization
- 🧠 **NER (Named Entity Recognition)** for information extraction
- 🛰️ **Asset Detection** using AI and satellite imagery
- 🏞️ **Land Use Classification** with confidence scoring

## 🚀 Quick Start Guide

### Option 1: Enhanced WebGIS (Recommended)
```batch
# Start complete WebGIS system with Docker
start-docker-webgis.bat

# Access Enhanced WebGIS at: http://localhost:5173/webgis
```

### Option 2: Legacy Development Setup
```batch
# Install dependencies (run ONCE)
install_dependencies.bat

# Start all services
start_all_services.bat
```

### Option 3: Production Deployment
```batch
# Deploy to production
deploy-production.bat

# Health check all services  
health-check.bat
```

## 🌐 Service URLs

### **Enhanced WebGIS Access:**
- **🗺️ Main WebGIS Interface**: http://localhost:5173/webgis
- **📊 FRA Atlas Dashboard**: http://localhost:5173
- **🏗️ Asset Mapping System**: http://localhost:3000
- **🔧 API Documentation**: http://localhost:8000/docs

### **Legacy Access:**
- Asset Mapping API: http://localhost:8002
- Digitization API: http://localhost:8000 

## 🎮 WebGIS Features

### **Interactive Map Controls:**
- 🎯 **IFR/CFR Claims**: Green (Approved), Orange (Pending), Red (Rejected)
- 🏗️ **Village Assets**: Schools, Water Infrastructure, Community Halls
- 🔍 **Smart Filtering**: State → District → Village → Tribal Group
- 🎛️ **Layer Management**: Toggle visibility with real-time indicators

### **Analytics Dashboard:**
- 📈 **Progress Charts**: Multi-level FRA implementation tracking
- 📊 **Export Functions**: CSV download (working), PDF/Excel ready
- 🎯 **Performance Metrics**: Success rates, completion trends
- 🌍 **Geographic Analysis**: Regional comparison and insights

### **AI-Powered Detection:**
- Named Entity Recognition (NER)
- Geographic coordinate detection
- Interactive maps with Google Maps integration

### Troubleshooting

#### If services fail to start:
1. Make sure Python and Node.js are installed
2. Run `install_dependencies.bat` first
3. Check that ports 3000, 5173, 8000, 8002 are not in use
4. Ensure virtual environment exists at `.venv/`

#### If tunnels don't work:
1. Make sure all local services are running first
2. Check tunnel windows for actual URLs
3. Ensure internet connection is stable
4. SSH must be available (usually pre-installed on Windows 10/11)

### System Requirements
- Windows 10/11
- Python 3.8+
- Node.js 16+
- Git (for dependency installation)
- Internet connection (for public tunnels)

### File Structure
```
final sih coppro/
├── install_dependencies.bat    # Install all modules
├── start_all_services.bat     # Start all services  
├── create_public_tunnels.bat  # Create internet tunnels
├── backend/                   # Digitization backend
├── asset-mapping-backend/     # Asset mapping backend
├── asset-mapping-frontend/    # Asset mapping frontend
├── fra-atlas-system/         # FRA digitization frontend
└── .venv/                    # Python virtual environment
```