from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
import os
from app.api import files, processing, test

# Create FastAPI app
app = FastAPI(
    title="FRA Atlas AI Backend",
    description="AI-powered backend for Forest Rights Act document processing",
    version="1.0.0"
)

# Add CORS middleware to allow frontend connections
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173", "http://localhost:3000"],  # React dev servers
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Mount static files for uploaded documents
if not os.path.exists("uploads"):
    os.makedirs("uploads")
app.mount("/uploads", StaticFiles(directory="uploads"), name="uploads")

# Include API routers
app.include_router(files.router, prefix="/api/files", tags=["files"])
app.include_router(processing.router, prefix="/api/processing", tags=["processing"])
app.include_router(test.router, prefix="/api/test", tags=["testing"])

@app.get("/")
async def root():
    return {
        "message": "FRA Atlas AI Backend",
        "status": "running",
        "version": "1.0.0"
    }

@app.get("/health")
async def health_check():
    return {"status": "healthy", "service": "FRA Atlas AI Backend"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)
