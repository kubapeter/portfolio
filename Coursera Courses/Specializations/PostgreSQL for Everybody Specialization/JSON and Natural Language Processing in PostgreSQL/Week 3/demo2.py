import psycopg2
import hidden
import time

bookfile = input("Enter book file (i.e. pg19337.txt): ")
if bookfile == '' : bookfile = 'pg19337.txt';
base = bookfile.split('.')[0] # name of the book will be the name of the table

# Make sure we can open the file
fhand = open(bookfile)

# Load the secrets
secrets = hidden.secrets()

conn = psycopg2.connect(host=secrets['host'], port=secrets['port'],
        database=secrets['database'], 
        user=secrets['user'], 
        password=secrets['pass'], 
        connect_timeout=3)

cur = conn.cursor()

sql = 'DROP TABLE IF EXISTS '+base+' CASCADE;'
print(sql)
cur.execute(sql)

sql = 'CREATE TABLE '+base+' (id SERIAL, body TEXT);'
print(sql)
cur.execute(sql)

# finds paragraphs, throws away blank lines, transforms paragraph to a
# single line, inserts the single line into the table as row, counts paragraphs
# added, commits at every 50 rows, prints at every 100 rows
para = ''
chars = 0
count = 0
pcount = 0
for line in fhand:
    count = count + 1
    line = line.strip()
    chars = chars + len(line)
    if line == '' and para == '' : continue
    if line == '' :
        sql = 'INSERT INTO '+base+' (body) VALUES (%s);'
        cur.execute(sql, (para, ))
        pcount = pcount + 1
        if pcount % 50 == 0 : conn.commit()
        if pcount % 100 == 0 : 
            print(pcount, 'loaded...')
            time.sleep(1) # just for demonstration so that lecturer have a chance to stop execution in the middle
        para = ''
        continue

    para = para + ' ' + line

conn.commit()
cur.close()

print(' ')
print('Loaded',pcount,'paragraphs',count,'lines',chars,'characters')

# creating the index
sql = "CREATE INDEX TABLE_gin ON TABLE USING gin(to_tsvector('english', body));"
sql = sql.replace('TABLE', base)
print(' ')
print('Run this manually to make your index:')
print(sql)


# SELECT body FROM pg19337  WHERE to_tsquery('english', 'goose') @@ to_tsvector('english', body) LIMIT 5;
# EXPLAIN ANALYZE SELECT body FROM pg19337  WHERE to_tsquery('english', 'goose') @@ to_tsvector('english', body);
