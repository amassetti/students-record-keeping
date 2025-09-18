from fastapi import APIRouter, HTTPException
from app.models.user import User
from app.db import memory_db
from app.mysql_db import get_user_by_username

router = APIRouter(prefix="/users", tags=["users"])

@router.post("/")
def validate_user(user: User):
    if not user:
        raise HTTPException(status_code=400, detail="Bad request")
    user_from_db = get_user_by_username(user.username)
    
    if not user_from_db:
        raise HTTPException(status_code=401, detail="Invalid username or password")

    if user_from_db.password != user.password:
        raise HTTPException(status_code=401, detail="Invalid username or password")
    return {"message": "Login successful", "username": user_from_db.username}
