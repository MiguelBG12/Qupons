from fastapi import FastAPI
from routes.admi import router as admin_router

app = FastAPI()

app.include_router(admin_router)
