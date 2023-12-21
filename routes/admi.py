from fastapi import APIRouter
from controller import admi_controller

router = APIRouter()

router.include_router(admi_controller.router, prefix="/admin", tags=["Administradores"])
