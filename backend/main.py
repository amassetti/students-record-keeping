import uvicorn
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List

class Fruit(BaseModel):
    name: str

class Fruits(BaseModel):
    fruits: List[Fruit]

class User(BaseModel):
    id: int
    username: str
    password: str

class Users(BaseModel):
    users: List[User]

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

memory_db = {
    "fruits": [],
    "users": [
        User(id= 0, username="amassetti@gmail.com", password="asd123"),
        User(id= 1, username="pepe@gmail.com", password="123"),
        User(id= 2, username="poli@gmail.com", password="asd"),
    ]
}

@app.get("/fruits", response_model=Fruits)
def get_fruits():
    return Fruits(fruits=memory_db["fruits"])

@app.post("/fruits")
def add_fruits(fruit: Fruit, response_model=Fruit):
    memory_db["fruits"].append(fruit)
    return fruit

@app.get("/users/{user_id}")
def get_user(user_id:int):
    return memory_db["users"][user_id]

@app.post("/users")
def validate_user(user: User):
    matches: List[User] = [u for u in memory_db["users"] if u.username == user.username]
    if not  matches:
        raise HTTPException(status_code=401, detail="Invalid username or password")
    user_to_validate = matches[0]
    if not  user_to_validate:
        raise HTTPException(status_code=401, detail="Invalid username or password")
    if user_to_validate.password != user.password:
        raise HTTPException(status_code=401, detail="Invalid username or password")
    return {"message": "Login successful", "username": user_to_validate.username}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)