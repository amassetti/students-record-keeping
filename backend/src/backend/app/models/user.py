from pydantic import BaseModel
from typing import List

class User(BaseModel):
    id: int
    username: str
    password: str

class UserLogin(BaseModel):
    id: int
    username: str
    password: str
    role: str

class Users(BaseModel):
    users: List[User]