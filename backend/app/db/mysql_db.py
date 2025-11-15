import logging
import mysql.connector
import os
from sqlalchemy import create_engine

HOST=os.getenv("DATABASE_HOST", "127.0.0.1")
PORT=int(os.getenv("DATABASE_PORT", "3306"))
USER=os.getenv("DATABASE_USER", "gti_record_keeping")
PASSWORD=os.getenv("DATABASE_PASSWORD", "TBD!")
DATABASE=os.getenv("DATABASE_NAME", "gti_record_keeping_v2")
CONN_STRING = f"mysql+mysqlconnector://{USER}:{PASSWORD}@{HOST}:{PORT}/{DATABASE}"

engine = create_engine(CONN_STRING, echo=True)

def get_engine():
    return engine

def get_db_connection():
    # connect
    conn = mysql.connector.connect(
        host=os.getenv("DATABASE_HOST", "127.0.0.1"),
        port=int(os.getenv("DATABASE_PORT", "3306")),
        user=os.getenv("DATABASE_USER", "gti_record_keeping"),
        password=os.getenv("DATABASE_PASSWORD", "TBD!"),
        database=os.getenv("DATABASE_NAME", "gti_record_keeping_v2")
    )
    logging.info(f"Connected to DB: {CONN_STRING}")
    return conn

# Re-export connector
connector = mysql.connector