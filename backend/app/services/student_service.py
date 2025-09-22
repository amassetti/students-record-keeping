from app.db.student_db import get_students
from app.models.student import Student

def get_students_by_filter(filter: str, page: int, limit: int):
    """Return the filtered list of students."""
    offset = (page - 1) * limit
    return get_students(filter, offset=offset, limit=limit)