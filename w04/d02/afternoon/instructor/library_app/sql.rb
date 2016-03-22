conn = PG.connect(dbname: 'lecture')

conn.exec("DROP TABLE IF EXISTS books;")
conn.exec("DROP TABLE IF EXISTS authors;")
conn.exec("DROP TABLE IF EXISTS categories;")
conn.exec("DROP TABLE IF EXISTS category_books;")

# Create tables here!
conn.exec("CREATE TABLE books(id SERIAL PRIMARY KEY, title VARCHAR(250), author_id INTEGER);")
conn.exec("CREATE TABLE authors(id SERIAL PRIMARY KEY, name VARCHAR(250));")
conn.exec("CREATE TABLE categories(id SERIAL PRIMARY KEY, name VARCHAR(50));")
conn.exec("CREATE TABLE category_books(id SERIAL PRIMARY KEY, category_id INTEGER, book_id INTEGER);")
