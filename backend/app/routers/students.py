from fastapi import APIRouter, Query, HTTPException, status
from app.models.student import Student
from app.services.student_service import get_students_by_filter, delete_student
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


@router.delete("/{student_id}")
def delete_student_endpoint(student_id: int):
    try:
        rows_affected = delete_student(student_id)

        if rows_affected > 0:
            return {"message": f"Student {student_id} deleted successfully"}
        else:
            return {"message": f"No student found with id {student_id}"}
    except ValueError as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=str(e))
    except Exception:
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail="Internal server error")