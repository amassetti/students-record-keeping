from fastapi import APIRouter, Query
from app.models.student import Student
from app.services.student_service import get_students_by_filter
from typing import Optional

router = APIRouter(prefix="/students", tags=["students"])

@router.get("/")
def get_students(filter: Optional[str] = Query(None, description="Filter for students")):
    return get_students_by_filter(filter)
