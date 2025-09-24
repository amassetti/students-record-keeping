from fastapi import APIRouter, Query
from app.models.student import Student
from app.services.student_service import get_students_by_filter
from typing import Optional
import math

router = APIRouter(prefix="/students", tags=["students"])

@router.get("/")
def get_students(
    filter: Optional[str] = Query(None, description="Filter for students"),
    page: int = Query(1, ge=1),
    limit: int = Query(20, ge=1, le=100)
):
    (total_students, students) = get_students_by_filter(filter, page, limit);

    return {
        "data": students,
        "total": total_students,
        "page": page,
        "totalPages": math.ceil(total_students / limit)
    }
