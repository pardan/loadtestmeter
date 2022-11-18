import mysql.connector
from mysql.connector import Error

def koneksi():
    try:
        connection = mysql.connector.connect(host='202.50.203.104',
                                            database='loadtest',
                                            user='loadtest',
                                            password='password')
        return connection
    except Error as e:
        print("Error while connecting to MySQL", e)
        return False

def close(connection, cursor):
        if(connection):
            cursor.close()
            connection.close()
            #print("PostgreSQL connection is closed")

#36.89.30.147