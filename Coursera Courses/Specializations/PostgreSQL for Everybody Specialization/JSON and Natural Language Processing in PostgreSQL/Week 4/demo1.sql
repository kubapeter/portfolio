
--SETUP
DROP TABLE IF EXISTS jtrack CASCADE;

CREATE TABLE IF NOT EXISTS jtrack 
  (
    id SERIAL, 
    body JSONB
  );

-- JSON import with copy, is often easier with Python, but for 
-- simple JSON without embedded newlines in the JSON values, this is good enough.

-- http://adpgtech.blogspot.com/2014/09/importing-json-data.html

-- wget https://www.pg4e.com/code/library.jstxt

\copy jtrack (body) FROM 'library.jstxt' WITH CSV QUOTE E'\x01' DELIMITER E'\x02';

SELECT * FROM jtrack LIMIT 5;
SELECT pg_typeof(body) FROM jtrack LIMIT 1;

SELECT body->>'name' FROM jtrack LIMIT 5;

-- Could we use parenthesis and cast to convert to text?
SELECT pg_typeof(body->'name') FROM jtrack LIMIT 1;
SELECT pg_typeof(body->'name'::text) FROM jtrack LIMIT 1;
SELECT pg_typeof(body->'name')::text FROM jtrack LIMIT 1;
SELECT pg_typeof((body->'name')::text) FROM jtrack LIMIT 1;

-- Yes we could, but why even try?
SELECT pg_typeof(body->>'name') FROM jtrack LIMIT 1;

SELECT MAX((body->>'count')::int) FROM jtrack;

SELECT body->>'name' AS name FROM jtrack ORDER BY (body->>'count')::int DESC LIMIT 5;

-- Yes you need the cast even though it is an integer in the JSON :(
SELECT pg_typeof(body->'count') FROM jtrack LIMIT 1;
SELECT pg_typeof(body->>'count') FROM jtrack LIMIT 1;
