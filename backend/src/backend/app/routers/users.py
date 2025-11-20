from fastapi import APIRouter, HTTPException, status
from app.models.user import User
from app.services.user_service import check_user

router = APIRouter(prefix="/users", tags=["users"])

@router.post("/")
def validate_user(user: User):
    if not user:
        raise HTTPException(status_code=400, detail="Bad request")

    try:
        user_from_db = check_user(username= user.username, password=user.password)
    except ValueError as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=str(e))
    except PermissionError as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=str(e))
    except RuntimeError as e:
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail=str(e))
    except Exception as e:
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail=str(e))

    return {"message": "Login successful", "username": user_from_db.username, "role": user_from_db.role}
