from typing import Annotated

from fastapi import Depends
from sqlmodel import Session
from src.repository.database import engine
from src.domain.services.user import UserService
from src.repository.infrastructure.user_repository import SqlModelUserRepository


def get_session():
    with Session(engine) as session:
        yield session


def get_user_repository(session: Annotated[Session, Depends(get_session)]):
    return SqlModelUserRepository(session)


def get_user_service(
    repo: Annotated[SqlModelUserRepository, Depends(get_user_repository)],
):
    return UserService(repo)
