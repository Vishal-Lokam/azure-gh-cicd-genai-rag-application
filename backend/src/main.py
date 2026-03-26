from fastapi import FastAPI
from fastapi.responses import JSONResponse
from fastapi import status
from src.api.routes.authentication import auth_router
from src.api.routes.user import user_router
from src.repository.database import create_db_and_tables
from contextlib import asynccontextmanager


@asynccontextmanager
async def lifespan(app: FastAPI):
    create_db_and_tables()
    yield
    print("closing database connection")


app = FastAPI(
    title="Astralbound backend",
    summary="This is the backend api for the Astralbound project. It connects to the frontend and api service for additional functionality",
    version="0.0.1",
    root_path="/api/v1",
    lifespan=lifespan,
)

app.include_router(auth_router)
app.include_router(user_router)


@app.get("/health")
async def get_health():
    return JSONResponse(content="Health ok!", status_code=status.HTTP_200_OK)
