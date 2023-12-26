from fastapi import APIRouter
from controller.admin_controller import (
    create_admin, 
    update_admin, 
    delete_admin,
    delete_client,
    delete_coupon,
    delete_user
)

router = APIRouter()

@router.post("/crear_admin")
async def create_admin(admin_data: AdminCreateRequest):
    return await create_admin(admin_data)

@router.get("/ver_administradores")
async def ver_administradores():
    return await get_administradores()

@router.put("/actualizar_admin")
async def update_admin(admin_data: AdminUpdateRequest):
    return await update_admin(admin_data)

@router.delete("/borrar_admin/{admin_id}")
async def remove_admin(admin_id: int):
    return await delete_admin(admin_id)

@router.get("/ver_clientes")
async def ver_clientes():
    return await get_clientes()

@router.delete("/borrar_cliente/{cliente_tienda_id}")
async def remove_client(client_id: int):
    return await delete_client(client_id)

@router.delete("/borrar_cupon/{cupon_id}")
async def remove_coupon(coupon_id: int):
    return await delete_coupon(coupon_id)

@router.delete("/borrar_usuario/{user_id}")
async def remove_user(user_id: int):
    return await delete_user(user_id)

# Puedes agregar más rutas y sus correspondientes llamadas a funciones de los controladores aquí

# Por ejemplo:
# @router.get("/")
# async def get_admin(admin_id: int):
#     return await obtener_admin(admin_id)

# Recuerda importar las clases y definiciones necesarias de los controladores
