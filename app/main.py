from flask import Flask, jsonify
import psycopg2
import os
from datetime import datetime


app = Flask(__name__)

def get_connection():
    return psycopg2.connect(
        dbname=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        host=os.getenv("DB_HOST"),
    )

@app.route('/')
def hello_devops():
    connection = get_connection()
    cursor = connection.cursor()

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS requests (
            id SERIAL PRIMARY KEY,
            request_time TIMESTAMP NOT NULL
        )
    """)

    cursor.execute(
        "INSERT INTO requests (request_time) VALUES (%s)",
        (datetime.now(),)
    )

    connection.commit()
    cursor.close()
    connection.close()

    return jsonify("HELLO MIE LITTLE AZURE GITTICATS!")

if __name__ == "__main__":
    app.run(host = "0.0.0.0", port=5000)
