import psycopg2
import hidden # created by the lecturer to make connection easier

# To connect to PostgreSQL 
# Load the secrets
secrets = hidden.secrets()

conn = psycopg2.connect(host=secrets['host'],
        port=secrets['port'],
        database=secrets['database'], 
        user=secrets['user'], 
        password=secrets['pass'], 
        connect_timeout=3)

cur = conn.cursor()

sql = 'DROP TABLE IF EXISTS pythonfun CASCADE;'
print(sql)
cur.execute(sql)

sql = 'CREATE TABLE pythonfun (id SERIAL, line TEXT);'
print(sql)
cur.execute(sql)

conn.commit()    # Flush it all to the DB server

for i in range(10) : 
    txt = "Have a nice day "+str(i)
    sql = 'INSERT INTO pythonfun (line) VALUES (%s);'
    cur.execute(sql, (txt, ))

conn.commit()

sql = "SELECT id, line FROM pythonfun WHERE id=5;" 
print(sql)
cur.execute(sql)

row = cur.fetchone()
if row is None : 
    print('Row not found')
else:
    print('Found', row)

sql = 'INSERT INTO pythonfun (line) VALUES (%s) RETURNING id;'
cur.execute(sql, (txt, ))
id = cur.fetchone()[0]
print('New id', id)

# Lets make a mistake
sql = "SELECT line FROM pythonfun WHERE mistake=5;"
print(sql)
cur.execute(sql)

conn.commit()
cur.close()
