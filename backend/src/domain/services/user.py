from ..interfaces.user_interface import UserRepository
from ..schemas.user import UserCreate, UserRead
from src.repository.models.user import User
from argon2 import PasswordHasher


def hash_password(password: str):
    ph = PasswordHasher()
    return ph.hash(password)


class UserService:
    def __init__(self, repo: UserRepository):
        self.repo = repo

    def create_user(self, user_data: UserCreate) -> UserRead:
        user = User(
            full_name=user_data.full_name,
            email=user_data.email,
            password=hash_password(user_data.password),
        )

        created_user = self.repo.create(user=user)

        response = UserRead(
            id=created_user.id,
            full_name=created_user.full_name,
            email=created_user.email,
        )
        return UserRead.model_validate(response)
