from app.models.user import User, UserLogin
from app.db.mysql_db import get_db_connection
import mysql.connector

def get_users():
    conn = get_db_connection()
    cursor = conn.cursor()

    # run a query
    cursor.execute("SELECT user_id, username, password, role_id FROM user")

    # fetch results
    users = []
    for row in cursor.fetchall():
        user = User(id=row[0], username=row[1], password=row[2])
        users.append(user)

    # cleanup
    cursor.close()
    conn.close()

    return users

def get_user_by_username(username: str) -> UserLogin | None:
    print(f"Searching user with username {username}")
    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        # run a query with parameterized SQL to prevent SQL injection
        cursor.execute(
            '''
            SELECT u.user_id, u.username, u.password, r.role_code
            FROM user u, role r
            WHERE u.role_id = r.role_id
            AND username = %s;
            ''',
            (username,)
        )

        row = cursor.fetchone()

        # cleanup
        cursor.close()
        conn.close()

        if row:
            return UserLogin(id=row[0], username=row[1], password=row[2], role=row[3])
        return None
    except mysql.connector.Error as e:
        # Raise the error so the service layer can handle it
        print(f"Database error: {str(e)}")
        raise Exception(f"Database error: {str(e)}")
