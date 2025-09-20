from fastapi import APIRouter, HTTPException
from app.models.user import User
from app.services.user_service import check_user

router = APIRouter(prefix="/users", tags=["users"])

@router.post("/")
def validate_user(user: User):
    if not user:
        raise HTTPException(status_code=400, detail="Bad request")

    user_from_db = check_user(username= user.username, password=user.password)
    if not user_from_db:
        raise HTTPException(status_code=401, detail="Invalid username or password")

    return {"message": "Login successful", "username": user_from_db.username, "role": user_from_db.role}
