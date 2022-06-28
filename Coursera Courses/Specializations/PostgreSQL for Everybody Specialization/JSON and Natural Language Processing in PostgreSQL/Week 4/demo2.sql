--- To restart the spider
DROP TABLE IF EXISTS swapi CASCADE;

-- demo2.py creates this if it does not exist
CREATE TABLE IF NOT EXISTS swapi
  (
    id SERIAL, 
    url VARCHAR(2048) UNIQUE, 
    status INTEGER, 
    body JSONB,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), 
    updated_at TIMESTAMPTZ
  );

-- While load is happening :)
SELECT url 
  FROM swapi 
  WHERE status = 200;
  
SELECT url 
  FROM swapi 
  WHERE status IS NULL;


-- Load completed...
SELECT COUNT(url) 
  FROM swapi;
  -- 207 documents loaded
    
SELECT url, status 
  FROM swapi 
  WHERE url LIKE '%film%';


SELECT body->>'url' 
  FROM swapi 
  LIMIT 1;

SELECT body->>'url' 
  FROM swapi 
  WHERE body @> '{"director": "George Lucas"}';
  
EXPLAIN 
  SELECT body->>'url' 
    FROM swapi 
    WHERE body @> '{"director": "George Lucas"}';
    -- sequential scan


-- Lets throw some race cars into the table to make sure PG finds indexes useful
INSERT INTO swapi (body) 
  SELECT ('{ "type": "Neon", "series": "24 Hours of Lemons", "number": ' || generate_series(1000,5000) || '}')::jsonb;

CREATE INDEX swapi_gin 
  ON swapi 
  USING gin (body jsonb_path_ops);
  
EXPLAIN 
  SELECT body->>'url' 
    FROM swapi 
    WHERE body @> '{"director": "George Lucas"}';
    -- and now it uses the GIN

-- Try this ... oops - not what we meant
SELECT body->>'url' 
  FROM swapi 
  WHERE NOT(body @> '{"director": "George Lucas"}'::jsonb);

-- We can fix that NOT bit with a clever WHERE clause...
-- First step:
SELECT body->>'url' 
  FROM swapi 
  WHERE body->>'url' LIKE 'https://swapi.py4e.com/api/films/%';
  
EXPLAIN 
  SELECT body->>'url' 
    FROM swapi 
    WHERE body->>'url' LIKE 'https://swapi.py4e.com/api/films/%';
    -- sequential scan

-- We can do a sequential scan
SELECT body->>'url' 
  FROM swapi 
  WHERE 
    NOT(body @> '{"director": "George Lucas"}'::jsonb) 
      AND 
    body->>'url' LIKE 'https://swapi.py4e.com/api/films/%';



SELECT body->>'url', 
       body->>'name' 
  FROM swapi 
  LIMIT 10;

SELECT body->>'url', 
       body->>'name' 
  FROM swapi 
  WHERE body->>'url' LIKE 'https://swapi.py4e.com/api/people/%' 
  LIMIT 10;

SELECT body->>'url', 
       body->>'name' 
  FROM swapi 
  WHERE body->>'url' LIKE 'https://swapi.py4e.com/api/species/%' 
  LIMIT 10;

-- LIKE makes a sequential scan
EXPLAIN 
  SELECT body->>'url', 
         body->>'name' 
    FROM swapi 
    WHERE body->>'url' LIKE 'https://swapi.py4e.com/api/species/%' 
    LIMIT 10;

-- Lets augment the JSON and add a "type" field using Regular Expressions
SELECT substring(body->>'url', 'https://swapi.py4e.com/api/([a-z]+)/') 
  FROM swapi 
  LIMIT 1;

SELECT ('{"type": "' || substring(body->>'url', 'https://swapi.py4e.com/api/([a-z]+)/') || '" }')
  FROM swapi 
  LIMIT 1;
  
SELECT ('{"type": "' || substring(body->>'url', 'https://swapi.py4e.com/api/([a-z]+)/') || '" }')::jsonb
  FROM swapi 
  LIMIT 1;

-- Merge new json back into the body
SELECT body || ('{"type": "' || substring(body->>'url', 'https://swapi.py4e.com/api/([a-z]+)/') || '" }')::jsonb
  FROM swapi 
  LIMIT 1;

-- Add the type field to all the records
UPDATE swapi SWT 
  SET body = body || ('{"type": "' || substring(body->>'url', 'https://swapi.py4e.com/api/([a-z]+)/') || '" }')::jsonb;

SELECT body->>'url', 
       body->>'name' 
  FROM swapi 
  WHERE body @> '{"type": "species"}'  
  LIMIT 10;

EXPLAIN 
  SELECT body->>'url', 
         body->>'name' 
    FROM swapi 
    WHERE body @> '{"type": "species"}'  
    LIMIT 10;
  -- Now: not sequential scan! Uses GIN.
  
-- The payoff
SELECT url 
  FROM swapi 
  WHERE 
    body @> '{"type": "films"}' 
      AND 
    NOT(body @> '{"director": "George Lucas"}');
    
EXPLAIN 
  SELECT url 
    FROM swapi 
    WHERE 
      body @> '{"type": "films"}' 
        AND 
      NOT(body @> '{"director": "George Lucas"}');
      -- Not sequential (GIN)
