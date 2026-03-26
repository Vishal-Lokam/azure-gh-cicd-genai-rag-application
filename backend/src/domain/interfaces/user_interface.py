from typing import Protocol
from sqlmodel import Session

from src.repository.models.user import User


class UserRepository(Protocol):
    def create(self, session: Session) -> User: ...
