import mysql.connector
from app.models.user import User, UserLogin

def get_db_connection():
    # connect
    conn = mysql.connector.connect(
        host="127.0.0.1",
        port=3306,
        user="gti_record_keeping",
        password="Asd$123!",
        database="gti_record_keeping_v2"
    )
    return conn

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

def get_user_by_username(username: str):
    print(f"Searching user with username {username}")
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
