from fastapi import APIRouter

auth_router = APIRouter(
    prefix="/auth",
)


@auth_router.post("/signup")
async def create_user():
    print("Hello world")
