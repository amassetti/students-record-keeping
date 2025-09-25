import pytest
from unittest.mock import patch
from app.models.student import Student
from app.services.student_service import get_students_by_filter, delete_student, MAX_SIZE

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

def test_get_students_by_filter_wrong_page():
    with pytest.raises(ValueError) as exc_info:
        get_students_by_filter("filter", 0, 10)
    
    # optionally check the exception message
    assert str(exc_info.value) == "Page cannot be 0"


def test_get_students_by_filter_wrong_size():
    with pytest.raises(ValueError) as exc_info:
        get_students_by_filter("filter", 1, 201)
    
    # optionally check the exception message
    assert str(exc_info.value) == f"Limit cannot be greater than {MAX_SIZE}"


def test_get_students_by_filter_ok(mock_students):
    with patch("app.services.student_service.count_students", return_value=2):
        with patch("app.services.student_service.get_students", return_value=mock_students):
            (total_students, students) = get_students_by_filter("filter", 1, 10)
            assert total_students == 2
            assert len(students) == 2

def test_delete_student_wrong_id():
    with pytest.raises(ValueError) as exc_info:
        delete_student(-1)

    assert str(exc_info.value) == "Student id mus be greater than 0"

def test_delete_student_ok(mock_students):
    with patch("app.services.student_service.delete_student_by_id", return_value=1):
        affected = delete_student(10)

    assert affected == 1