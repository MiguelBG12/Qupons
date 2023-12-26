from fastapi import FastAPI
from routes import admin

app = FastAPI()

# Agregar rutas del perfil del administrador
app.include_router(admin.router, prefix="/admin", tags=["Admin"])

# Otros middlewares, configuraciones de base de datos, etc., pueden ir aquí

if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8000)

