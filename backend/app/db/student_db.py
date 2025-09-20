from app.models.student import Student
from app.db.mysql_db import get_db_connection

def get_students(filter: str):
    print(f"Searching students with filter {filter}")
    conn = get_db_connection()
    cursor = conn.cursor()

    # run a query with parameterized SQL to prevent SQL injection
    cursor.execute(
        '''
        SELECT 
            s.student_id,
            c.course_code,
            c.name course_name,
            s.first_name,
            s.last_name, 
            s.email,
            s.ppsn
        FROM student s, student_course sc, course c
        WHERE sc.student_id = s.student_id
        AND   sc.course_id = c.course_id
        AND   sc.last_name = %s;
        ''',
        (filter,)
    )

    # fetch results
    students = []
    for row in cursor.fetchall():
        student = Student(id=row[0], course_code=row[1], course_name=row[2], first_name=row[3], last_name=row[4], email=row[5], ppsn=row[6])
        students.append(student)

    # cleanup
    cursor.close()
    conn.close()

    if students:
        return students
    return None