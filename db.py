import psycopg2

def get_connection():
    return psycopg2.connect(
        dbname="gestaocondominio",
        user="postgres",
        password="Gong3572",
        host="localhost"
    )