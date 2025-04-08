import sqlite3

# Replace with your actual file
conn = sqlite3.connect("data/db/sqlite-sakila.db")
cursor = conn.cursor()

# Run a query
cursor.execute(
    "SELECT customer.customer_id, payment.amount FROM payment JOIN rental ON payment.rental_id = rental.rental_id JOIN customer ON rental.customer_id = customer.customer_id WHERE payment.amount > 10;"
    )
rows = cursor.fetchall()

for row in rows:
    print(row)

conn.close()
