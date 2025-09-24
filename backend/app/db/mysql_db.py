import mysql.connector

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

# Re-export connector
connector = mysql.connector