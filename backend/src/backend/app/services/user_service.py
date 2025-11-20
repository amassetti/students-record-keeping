from app.db.user_db import get_user_by_username
from app.models.user import UserLogin

def check_user(username: str, password: str) -> UserLogin | None:
    """Return the user if credentials are valid, otherwise None."""
    user = get_user_by_username(username)

    # TODO: review this logic. It is not good to give that much information to a potential attacker

    if not user:
        raise ValueError("User not found")
        #return None
    
    if user.password != password:
        #return None
        raise PermissionError("Invalid password")
    
    return user