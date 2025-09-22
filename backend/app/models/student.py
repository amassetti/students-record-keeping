from pydantic import BaseModel
from typing import List

class Student(BaseModel):
    id: int
    first_name: str
    last_name: str
    email: str
    ppsn: str
    course_code: str | None
    course_name: str | None

