from pydantic import BaseModel
from typing import List

class StudentBase(BaseModel):
    first_name: str
    last_name: str
    email: str
    ppsn: str

class StudentCreate(StudentBase):
    id: int

class Student(StudentCreate):
    course_code: str | None
    course_name: str | None

