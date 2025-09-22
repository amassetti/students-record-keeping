import pytest
from unittest.mock import patch
from app.models.user import UserLogin
from app.services.user_service import check_user

@pytest.fixture
def mock_user():
    from app.models.user import User
    return UserLogin(id=1, username="testuser", password="secret", role="role")

def test_check_user_ok(mock_user):
    with patch("app.services.user_service.get_user_by_username", return_value=mock_user):
        user = check_user(mock_user.username, mock_user.password)
        assert user.username == mock_user.username
        assert user.password == mock_user.password

def test_check_user_not_found():
    with patch("app.services.user_service.get_user_by_username", return_value=None):
        # assert that check_user raises ValueError
        with pytest.raises(ValueError) as exc_info:
            check_user("any_user", "any_password")
        
        # optionally check the exception message
        assert str(exc_info.value) == "User not found"


def test_check_user_wrong_password(mock_user):
    with patch("app.services.user_service.get_user_by_username", return_value=mock_user):
        # assert that check_user raises ValueError
        with pytest.raises(PermissionError) as exc_info:
            check_user("testuser", "wrong_password")
        
        # optionally check the exception message
        assert str(exc_info.value) == "Invalid password"