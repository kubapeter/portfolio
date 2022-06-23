-- Indexing with PostgreSQL

-- SETUP
DROP TABLE docs cascade;

CREATE TABLE docs (id SERIAL, 
                   doc TEXT, 
                   PRIMARY KEY(id)
                  );
  -- end SETUP

-- Creating the index
DROP INDEX gin1;

CREATE INDEX gin1 ON docs USING gin(string_to_array(doc, ' ')  array_ops);

-- Add some values
INSERT INTO docs (doc) 
  VALUES ('This is SQL and Python and other fun teaching stuff'),
         ('More people should learn SQL from UMSI'),
         ('UMSI also teaches Python and also SQL');

-- Insert enough lines to get PostgreSQL attention
-- (It will not use the index until the database is big enough)
INSERT INTO docs (doc) 
  SELECT 'Neon ' || generate_series(10000,20000);

-- You might need to wait a minute until the index catches up to the inserts

-- The <@ if "is contained within" or "intersection" from set theory
-- (Here '{learn}' is a one element string array.) 
SELECT id, 
       doc 
  FROM docs 
  WHERE '{learn}' <@ string_to_array(doc, ' ');

-- Look at the query plan
EXPLAIN 
  SELECT id, 
         doc 
    FROM docs 
    WHERE '{learn}' <@ string_to_array(doc, ' ');

--                                 QUERY PLAN
------------------------------------------------------------------------------
-- Bitmap Heap Scan on docs  (cost=12.05..21.53 rows=6 width=32)
--   Recheck Cond: ('{learn}'::text[] <@ string_to_array(doc, ' '::text))
--   ->  Bitmap Index Scan on gin1  (cost=0.00..12.05 rows=6 width=0)
--         Index Cond: ('{learn}'::text[] <@ string_to_array(doc, ' '::text))

-- we can see that it is not a sequential search but uses the index


-- Now using the rules of natural language

-- introduction: ts_vector() and ts_query() functions

SELECT to_tsvector('english', 'UMSI also teaches Python and also SQL');

--                   to_tsvector
----------------------------------------------------
-- 'also':2,6 'python':4 'sql':7 'teach':3 'umsi':1
 
-- no duplicates, stemming, no stop-words, all lowercase 

SELECT to_tsquery('english', 'teaching');

-- to_tsquery
--------------
-- 'teach'

-- also no duplicates, stemming, no stop-words, all lowercase 

-- one can use logical operators
SELECT to_tsquery('english', 'Teach | teaches | teaching | and | the | if');

-- connect ts_query() with ts_vector()
SELECT to_tsquery('english', 'teaching') @@
  to_tsvector('english', 'UMSI also teaches Python and also SQL');
  
-- Now: NATURAL LANGUAGE INVERTED INDEX WITH POSTGRESQL

--SETUP
DROP TABLE docs cascade;
DROP INDEX gin1;

CREATE TABLE docs 
  (
    id SERIAL, 
    doc TEXT, 
    PRIMARY KEY(id)
  );

CREATE INDEX gin1 
  ON docs 
  USING gin(to_tsvector('english', doc));

INSERT INTO docs (doc) 
  VALUES ('This is SQL and Python and other fun teaching stuff'), 
         ('More people should learn SQL from UMSI'),
         ('UMSI also teaches Python and also SQL');
         
-- Filler rows
INSERT INTO docs (doc) 
  SELECT 'Neon ' || generate_series(10000,20000);
  --end SETUP


SELECT id, 
       doc 
  FROM docs 
  WHERE to_tsquery('english', 'learn') @@ to_tsvector('english', doc);

EXPLAIN 
  SELECT id, 
         doc 
    FROM docs 
    WHERE to_tsquery('english', 'learn') @@ to_tsvector('english', doc);


-- How to make GiST index instead of GIN
DROP INDEX gin1;

CREATE INDEX gin1 
  ON docs 
  USING gist(to_tsvector('english', doc));
