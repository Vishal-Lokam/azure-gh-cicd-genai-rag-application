from fastapi import APIRouter
from fastapi import status, Depends
from typing import Annotated
from src.domain.services.user import UserService
from src.domain.schemas.user import UserCreate, UserRead
from src.dependencies import get_user_service

user_router = APIRouter(prefix="/user", tags=["User"])


# TODO: Add validation for email and password.
@user_router.post("", response_model=UserRead, status_code=status.HTTP_201_CREATED)
async def create_user(
    user_payload: UserCreate,
    user_service: Annotated[UserService, Depends(get_user_service)],
):
    response = user_service.create_user(user_payload)
    return response
