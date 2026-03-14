from .model.user import User

from sqlmodel import SQLModel, create_engine

engine = create_engine("postgresql+psycopg://postgres:1234@localhost:5432/astralbounddb")


def create_db_and_tables():
    SQLModel.metadata.create_all(engine)
