from app.db.student_db import get_students, count_students, delete_student_by_id
from app.models.student import Student

MAX_SIZE = 200

def get_students_by_filter(filter: str, page: int, limit: int):
    """Return the filtered list of students."""
    if page < 1:
        raise ValueError("Page cannot be 0")
    
    if limit > MAX_SIZE:
        raise ValueError(f"Limit cannot be greater than {MAX_SIZE}")
    
    offset = (page - 1) * limit
    total_students = count_students(filter)
    students = get_students(filter, offset=offset, limit=limit)
    return (total_students, students)

def delete_student(id: int):
    if id < 0:
        raise ValueError("Student id mus be greater than 0")
    
    affected = delete_student_by_id(id)

    return affected
    

    