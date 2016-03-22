conn = PG.connect(dbname: 'lecture')

conn.exec("DROP TABLE IF EXISTS books;")
conn.exec("DROP TABLE IF EXISTS authors;")
conn.exec("DROP TABLE IF EXISTS categories;")

# Create tables here!
