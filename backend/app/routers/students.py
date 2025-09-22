from fastapi import APIRouter, Query
from app.models.student import Student
from app.services.student_service import get_students_by_filter
from typing import Optional

router = APIRouter(prefix="/students", tags=["students"])

@router.get("/")
def get_students(
    filter: Optional[str] = Query(None, description="Filter for students"),
    page: int = Query(1, ge=1),
    limit: int = Query(10, ge=1, le=100)
):
    return get_students_by_filter(filter, page, limit)
