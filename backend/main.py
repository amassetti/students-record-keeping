import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
#from routers import users, students, teachers, grades
from app.routers import users, students

app = FastAPI()

origins = [
    "http://localhost:3000",
    "http://localhost:5173",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_methods=["*"],
    allow_headers=["*"]
)

app.include_router(users.router)
app.include_router(students.router)
#app.include_router(teachers.router)
#app.include_router(grades.router)

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
