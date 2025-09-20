from app.db.user_db import get_user_by_username
from app.models.user import UserLogin

def check_user(username: str, password: str) -> UserLogin | None:
    """Return the user if credentials are valid, otherwise None."""
    user = get_user_by_username(username)

    if not user:
        return None
    
    if user.password != password:
        return None
    
    return user