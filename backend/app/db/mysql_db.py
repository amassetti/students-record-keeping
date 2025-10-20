import mysql.connector
import os

def get_db_connection():
    # connect
    conn = mysql.connector.connect(
        host=os.getenv("DATABASE_HOST", "127.0.0.1"),
        port=int(os.getenv("DATABASE_PORT", "3306")),
        user=os.getenv("DATABASE_USER", "gti_record_keeping"),
        password=os.getenv("DATABASE_PASSWORD", "TBD!"),
        database=os.getenv("DATABASE_NAME", "gti_record_keeping_v2")
    )
    return conn

# Re-export connector
connector = mysql.connector