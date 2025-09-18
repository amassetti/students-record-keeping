import pytest
from fastapi.testclient import TestClient
from main import app
from app.db import memory_db
from app.models.user import User

client = TestClient(app)

# --- Setup fresh in-memory users for each test ---
@pytest.fixture(autouse=True)
def reset_memory_db():
    memory_db["users"] = [
        User(id=0, username="amassetti@gmail.com", password="asd123"),
        User(id=1, username="pepe@gmail.com", password="123"),
        User(id=2, username="poli@gmail.com", password="asd"),
    ]
    yield
    # teardown not needed, but you could clear memory_db if necessary


def test_login_success():
    response = client.post(
        "/users",
        json={"id": 0, "username": "pepe@gmail.com", "password": "123"}
    )
    assert response.status_code == 200
    data = response.json()
    assert data["message"] == "Login successful"
    assert data["username"] == "pepe@gmail.com"


def test_login_invalid_password():
    response = client.post(
        "/users",
        json={"id": 0, "username": "pepe@gmail.com", "password": "wrong"}
    )
    assert response.status_code == 401
    assert response.json() == {"detail": "Invalid username or password"}


def test_login_user_not_found():
    response = client.post(
        "/users",
        json={"id": 0, "username": "notfound@gmail.com", "password": "123"}
    )
    assert response.status_code == 401
    assert response.json() == {"detail": "Invalid username or password"}

def test_user_is_none():
    response = client.post(
        "/users",
        json={}
    )
    assert response.status_code == 422
