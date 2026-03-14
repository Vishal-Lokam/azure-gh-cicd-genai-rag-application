from sqlmodel import SQLModel, Field


class UserBase(SQLModel):
    full_name: str
    email: str
    password: str


class User(UserBase, table=True):
    id: int | None = Field(default=None, primary_key=True)


class UserCreate(UserBase):
    pass


class UserGet(UserBase):
    id: int
