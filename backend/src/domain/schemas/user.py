from pydantic import BaseModel, EmailStr


class UserBase(BaseModel):
    full_name: str
    email: EmailStr


class UserCreate(UserBase):
    """
    password is hashed password
    """

    password: str


class UserRead(UserBase):
    id: int


class UserUpdate(BaseModel):
    full_name: str | None = None
    email: EmailStr | None = None
    password: str | None = None


class User(BaseModel):
    full_name: str
    email: EmailStr
    hashed_password: str
