import pytest
from fastapi.testclient import TestClient
from main import app
from unittest.mock import patch
from app.models.user import UserLogin

client = TestClient(app)

@pytest.fixture
def mock_user():
    from app.models.user import User
    return UserLogin(id=1, username="testuser", password="secret", role="role")


def test_login_success(mock_user):
    with patch("app.routers.users.check_user", return_value=mock_user):
        response = client.post(
            "/users/",
            json={"id":0, "username": "testuser", "password": "secret"}
        )
        assert response.status_code == 200
        data = response.json()
        assert data["message"] == "Login successful"
        assert data["username"] == "testuser"


def test_login_invalid_password(mock_user):
    with patch("app.routers.users.check_user", side_effect=PermissionError("Invalid password")):
        response = client.post(
            "/users/",
            json={"id":0, "username": "testuser", "password": "wrongpass"}
        )
        assert response.status_code == 401
        assert response.json() == {"detail": "Invalid password"}

def test_login_user_not_found():
    with patch("app.routers.users.check_user", side_effect=ValueError("User not found")):
        response = client.post(
            "/users/",
            json={"id":0, "username": "wrong_user", "password": "secret"}
        )
        assert response.status_code == 401
        assert response.json() == {"detail": "User not found"}

def test_user_is_empty(mock_user):
    with patch("app.routers.users.check_user", return_value=mock_user):
        response = client.post(
            "/users/",
            json={}
        )
        assert response.status_code == 422
