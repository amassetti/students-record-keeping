import pytest
from unittest.mock import patch
from app.models.student import Student
from app.services.student_service import get_students_by_filter

@pytest.fixture
def mock_student():
    #from app.models.student import Student
    return Student(
        id=0, 
        course_code="691M", 
        course_name="Software Development", 
        first_name="Pepe", 
        last_name="Lui", 
        email="pl@x.com", 
        ppsn="BA123123"
    )

def test_get_students_by_filter():
    pass
    #with patch("app.services.student_service.get_user_by_username", return_value=mock_user):
    #    user = check_user(mock_user.username, mock_user.password)
    #    assert user.username == mock_user.username
    #    assert user.password == mock_user.password

