import mysql.connector

# Koneksi ke MySQL XAMPP
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",   # default XAMPP kosong
    database="littlelemon"
)

cursor = connection.cursor()

print("Connected to database!")

# Test Stored Procedure
cursor.callproc("GetMaxQuantity")

for result in cursor.stored_results():
    print("Max Quantity:", result.fetchall())

cursor.close()
connection.close()

print("Connection closed.")