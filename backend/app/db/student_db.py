from app.models.student import Student
from app.db.mysql_db import get_db_connection

def get_students(filter: str, offset: int, limit: int):
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
        FROM student s
        LEFT JOIN student_course sc
			ON s.student_id = sc.student_id
        LEFT JOIN course c
			ON sc.course_id = c.course_id
		WHERE ( s.first_name LIKE %s
        OR s.last_name LIKE %s)
        OR %s IS NOT NULL
        LIMIT %s OFFSET %s;
        ''',
        (filter, filter, filter, limit, offset)
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