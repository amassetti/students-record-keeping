import pytest
from fastapi.testclient import TestClient
from main import app
from unittest.mock import patch
from app.models.student import Student, StudentCreate, StudentBase

client = TestClient(app)

@pytest.fixture
def mock_student_base():
    return StudentBase(
        first_name="Pepe",
        last_name="Lui",
        email="test@gmail.com",
        ppsn="123456"
    )

@pytest.fixture
def mock_student_create(mock_student_base: StudentBase):
    return StudentCreate(
        id=1,
        **mock_student_base.model_dump()
    )

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
    with patch("app.routers.students.get_students_by_filter", return_value=(2, mock_students)):
        response = client.get(
            "/students?filter=Pepe"
        )

        assert response.status_code == 200
        data = response.json()
        assert len(data['data']) == 2
        assert data['total'] == 2
        

def test_delete_student():
    with patch("app.routers.students.delete_student", return_value=1):
        response = client.delete(
            "/students/1"
        )
        assert response.status_code == 200


def test_add_student(mock_student_create, mock_student_base):
    with patch("app.routers.students.add_student", return_value=mock_student_create):
        response = client.post(
            "/students",
            json=mock_student_base.model_dump()
        )
        assert response.status_code == 201