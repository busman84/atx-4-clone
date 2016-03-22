conn = PG.connect(dbname: 'lecture')

conn.exec("DROP TABLE IF EXISTS events;")
conn.exec("DROP TABLE IF EXISTS tickets;")
conn.exec("DROP TABLE IF EXISTS users;")

conn.exec("CREATE TABLE IF NOT EXISTS events(   id SERIAL PRIMARY KEY,
                                                name TEXT,
                                                description TEXT,
                                                status TEXT,
                                                capacity INT);")

conn.exec("CREATE TABLE IF NOT EXISTS tickets(  id SERIAL PRIMARY KEY,
                                                code INTEGER,
                                                event_id INTEGER,
                                                user_id INTEGER);")

conn.exec("CREATE TABLE IF NOT EXISTS users(    id SERIAL PRIMARY KEY,
                                                first_name VARCHAR(50),
                                                last_name VARCHAR(50));")
