from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from config.db_conexion import data_conexion

router = APIRouter()

class AdminRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombre: str
    cargo: str
    correo: str
    contraseña: str

@router.post("/crear_admin")
async def crear_admin(admin_request: AdminRequest):
    """
    Crea un nuevo administrador utilizando el procedimiento almacenado 'sp_crear_admin'.
    """
    params = [
        admin_request.nombre,
        admin_request.cargo,
        admin_request.correo,
        admin_request.contraseña
    ]
    result = data_conexion.ejecutar_procedure('sp_crear_admin', params)
    return result

@router.put("/actualizar_admin/{admin_id}")
async def actualizar_admin(admin_id: int, admin_request: AdminRequest):
    """
    Actualiza un administrador existente utilizando el procedimiento almacenado 'sp_actualizar_admin'.
    """
    params = [
        admin_id,
        admin_request.nombre,
        admin_request.cargo,
        admin_request.correo,
        admin_request.contraseña
    ]
    result = data_conexion.ejecutar_procedure('sp_actualizar_admin', params)
    return result

@router.delete("/borrar_admin/{admin_id}")
async def borrar_admin(admin_id: int):
    """
    Elimina un administrador utilizando el procedimiento almacenado 'sp_borrar_admin'.
    """
    result = data_conexion.ejecutar_procedure('sp_borrar_admin', [admin_id])
    return result

@router.get("/ver_administradores")
async def ver_administradores():
    """
    Obtiene todos los administradores utilizando el procedimiento almacenado 'sp_ver_administradores'.
    """
    result = data_conexion.ejecutar_procedure('sp_ver_administradores', [])
    return result
