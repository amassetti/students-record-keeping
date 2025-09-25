import logging
from app.models.student import Student
from app.db.mysql_db import get_db_connection, connector


def get_students(filter: str, offset: int, limit: int):
    logging.debug(f"Searching students with filter {filter}")

    try:
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
    except connector.Error as e:
        # Raise the error so the service layer can handle it
        print(f"Database error: {str(e)}")
        raise Exception(f"Database error: {str(e)}")


def count_students(filter: str) -> int:
    logging.debug(f"Counting students with filter {filter}")

    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        # run a query with parameterized SQL to prevent SQL injection
        cursor.execute(
            '''
            SELECT COUNT(1)
            FROM student s
            LEFT JOIN student_course sc
                ON s.student_id = sc.student_id
            LEFT JOIN course c
                ON sc.course_id = c.course_id
            WHERE ( s.first_name LIKE %s
            OR s.last_name LIKE %s)
            OR %s IS NOT NULL
            ''',
            (filter, filter, filter)
        )

        # fetch results
        (count,) = cursor.fetchone()

        # cleanup
        cursor.close()
        conn.close()

        return count
    
    except connector.Error as e:
        # Raise the error so the service layer can handle it
        print(f"Database error: {str(e)}")
        raise Exception(f"Database error: {str(e)}")


def delete_student_by_id(id: int) -> int:
    logging.debug(f"Deleting student with id {id}")
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM student WHERE student_id = %s", (id,))
        conn.commit()
        affected = cursor.rowcount
        cursor.close()
        conn.close()
        return affected
    except connector.Error as e:
        # Raise the error so the service layer can handle it
        print(f"Database error: {str(e)}")
        raise Exception(f"Database error: {str(e)}")