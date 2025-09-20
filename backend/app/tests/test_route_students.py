import pytest
from fastapi.testclient import TestClient
from main import app
from unittest.mock import patch
from app.models.student import Student

client = TestClient(app)

@pytest.fixture
def mock_students():
    return [
        Student(
            id=0, 
            course_code="691M", 
            course_name="Software Development", 
            first_name="Pepe", 
            last_name="Lui", 
            email="pl@x.com", 
            ppsn="BA123123"
        ),
        Student(
            id=1, 
            course_code="691M", 
            course_name="Software Development", 
            first_name="Juan", 
            last_name="Perez", 
            email="jp@x.com", 
            ppsn="BA3333333"
        ),
    ]

def test_get_students(mock_students):
    with patch("app.routers.students.get_students_by_filter", return_value=mock_students):
        response = client.get(
            "/students?filter=Pepe"
        )

        assert response.status_code == 200
        data = response.json()
        assert len(data) == 2

