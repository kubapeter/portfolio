
--SETUP
DROP TABLE IF EXISTS jtrack CASCADE;

CREATE TABLE IF NOT EXISTS jtrack 
  (
    id SERIAL, 
    body JSONB
  );

-- Fancy way of saying insert every line as a line (not really a csv) 
\copy jtrack (body) FROM 'library.jstxt' WITH CSV QUOTE E'\x01' DELIMITER E'\x02';
  -- end SETUP

-- Take a look
SELECT * 
  FROM jtrack 
  LIMIT 5;
  
SELECT pg_typeof(body) 
  FROM jtrack 
  LIMIT 1;
  -- It's a JSONB. Looks like a TEXT but it is not. 

-- Pull one thing out with ->>
SELECT body->>'name' 
  FROM jtrack 
  LIMIT 5;

-- Could we use parenthesis and cast to convert to text?
SELECT pg_typeof(body->'name') 
  FROM jtrack 
  LIMIT 1;
  -- Still JSONB
  
SELECT pg_typeof(body->'name'::text) 
  FROM jtrack 
  LIMIT 1;
  -- STILL JSONB!!! Because of precedence only the string 'name' is converted into a string
  
SELECT pg_typeof(body->'name')::text 
  FROM jtrack 
  LIMIT 1;
  -- STILL JSONB!!! the pg_typeof return value is converted into a string
  
SELECT pg_typeof((body->'name')::text) 
  FROM jtrack 
  LIMIT 1;
  -- text

-- Yes we could, but why even try? The ->> turns it into text
SELECT pg_typeof(body->>'name') 
  FROM jtrack 
  LIMIT 1;
  -- text

SELECT MAX((body->>'count')::int) 
  FROM jtrack;
  -- without ::int it works, but 99 > 100

SELECT body->>'name' AS name 
  FROM jtrack 
  ORDER BY (body->>'count')::int DESC 
  LIMIT 5;

-- Yes you need the cast even though it is an integer in the JSON :(
SELECT pg_typeof(body->'count') 
  FROM jtrack 
  LIMIT 1;
  -- JSONB
  
SELECT pg_typeof(body->>'count') 
  FROM jtrack 
  LIMIT 1;
  -- text    We need the ::int
  
-- Look into JSON for a value. Number of tracks with the name of 'Summer Nights'
SELECT COUNT(*) 
  FROM jtrack 
  WHERE body->>'name' = 'Summer Nights';

-- Ask if the body contains a key/value pair
SELECT COUNT(*) 
  FROM jtrack 
  WHERE body @> '{"name": "Summer Nights"}';
  -- This and the one before is the same, but this is a JSON comparison and the one before is a string comparison

-- The same thing with some overkill
SELECT COUNT(*) 
  FROM jtrack 
  WHERE body @> ('{"name": "Summer Nights"}'::jsonb);

-- Adding something to the JSONB column
UPDATE jtrack 
  SET body = body || '{"favorite": "yes"}' 
  WHERE (body->'count')::int > 200;

-- Should see some with and without "favorite"
SELECT body 
  FROM jtrack 
  WHERE (body->'count')::int > 160 
  LIMIT 5;

-- We have an operator: ? 
-- to check is a tag ('favorite') is present
SELECT COUNT(*) 
  FROM jtrack 
  WHERE body ? 'favorite';



-- Now: INDEXES
-- Lets throw some bulk into the table
INSERT INTO jtrack (body) 
  SELECT ('{ "type": "Neon", "series": "24 Hours of Lemons", "number": ' || generate_series(1000,5000) || '}')::jsonb;

-- Prepare three indexes...
DROP INDEX jtrack_btree;
DROP INDEX jtrack_gin;
DROP INDEX jtrack_gin_path_ops;

CREATE INDEX jtrack_btree 
  ON jtrack 
  USING BTREE ((body->>'name'));
  
CREATE INDEX jtrack_gin 
  ON jtrack USING gin (body);
  
CREATE INDEX jtrack_gin_path_ops 
  ON jtrack USING gin (body jsonb_path_ops);

-- Might need to wait a little while while PostgreSQL catches up :)

-- See which query uses which index
EXPLAIN SELECT COUNT(*) FROM jtrack WHERE body->>'artist' = 'Queen';
EXPLAIN SELECT COUNT(*) FROM jtrack WHERE body->>'name' = 'Summer Nights';
EXPLAIN SELECT COUNT(*) FROM jtrack WHERE body ? 'favorite';
EXPLAIN SELECT COUNT(*) FROM jtrack WHERE body @> '{"name": "Summer Nights"}';
EXPLAIN SELECT COUNT(*) FROM jtrack WHERE body @> '{"artist": "Queen"}';
EXPLAIN SELECT COUNT(*) FROM jtrack WHERE body @> '{"name": "Folsom Prison Blues", "artist": "Johnny Cash"}';
