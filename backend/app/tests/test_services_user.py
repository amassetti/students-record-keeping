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

def test_check_user_wrong():
    with patch("app.services.user_service.get_user_by_username", return_value=None):
        user = check_user("any_user", "any_password")
        assert user is None
