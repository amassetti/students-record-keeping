from pydantic import BaseModel
from typing import List

class User(BaseModel):
    id: int
    username: str
    password: str

class Users(BaseModel):
    users: List[User]