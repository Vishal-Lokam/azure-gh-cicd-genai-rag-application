from sqlmodel import Session
from src.domain.schemas.user import User
from src.domain.interfaces.user_interface import UserRepository


class SqlModelUserRepository(UserRepository):
    def __init__(self, session: Session):
        self.session = session

    def create(self, user: User):
        self.session.add(user)
        self.session.commit()
        self.session.refresh(user)
        return user
