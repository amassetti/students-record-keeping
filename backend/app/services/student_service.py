from app.db.student_db import get_students
from app.models.student import Student

def get_students_by_filter(filter: str):
    """Return the filtered list of students."""
    return get_students(filter)