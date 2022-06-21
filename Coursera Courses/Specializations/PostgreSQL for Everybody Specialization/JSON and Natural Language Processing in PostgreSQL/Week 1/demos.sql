-- Strings, arrays, and rows

SELECT string_to_array('Hello world', ' ');

SELECT unnest(string_to_array('Hello world', ' '));
  -- puts every element of the array to a new row
  -- unnest
  ----------
  -- Hello
  -- world
  --(2 rows)

-- SETUP

CREATE TABLE docs (
    id SERIAL, 
    doc TEXT, 
    PRIMARY KEY(id)
  );
  
INSERT INTO docs (doc) 
  VALUES ('This is SQL and Python and other fun teaching stuff'),
         ('More people should learn SQL from UMSI'),
         ('UMSI also teaches Python and also SQL');

SELECT * FROM docs;
  -- end SETUP
  
  
-- We want to make mapping between keywords and document ids

-- Break the document column into one row per word + primary key
SELECT id, 
       s.keyword AS keyword
  FROM docs AS D, 
       unnest(string_to_array(D.doc, ' ')) s(keyword)
  ORDER BY id;

-- We can see the wanted mapping

-- id | keyword  
------+----------
--  1 | This
--  1 | is 
--  1 | SQL 
--  1 | and 
--  1 | Python 
--  1 | and 
--  1 | other 
--  1 | fun 
--  1 | teaching 
--  1 | stuff 
--  2 | More 
--  2 | people 
--  2 | should 
--  2 | learn 
--  2 | SQL 
--  2 | from 
--  2 | UMSI 
--  3 | UMSI 
--  3 | also 
--  3 | teaches 
--  3 | Python 
--  3 | and 
--  3 | also  
--  3 | SQL 
--(24 rows)

-- Discard duplicate rows
SELECT DISTINCT id, 
       s.keyword AS keyword
  FROM docs AS D, 
       unnest(string_to_array(D.doc, ' ')) s(keyword)
  ORDER BY id;
  
-- Now we creare a table and insert the data above
CREATE TABLE docs_gin (
    keyword TEXT,
    doc_id INTEGER REFERENCES docs(id) ON DELETE CASCADE
  );

-- Insert the keyword / primary key rows into a table
INSERT INTO docs_gin (doc_id, keyword)
  SELECT DISTINCT id, 
                  s.keyword AS keyword
    FROM docs AS D, 
         unnest(string_to_array(D.doc, ' ')) s(keyword)
    ORDER BY id;
    
-- Just to see it is the same wanted mapping again
SELECT * FROM docs_gin ORDER BY doc_id;

-- Find all the distinct documents that match a keyword
SELECT DISTINCT id, 
                doc 
  FROM 
    docs AS D
      JOIN 
    docs_gin AS G 
      ON D.id = G.doc_id
  WHERE G.keyword = 'UMSI';
  
-- id |                  doc
------+----------------------------------------
--  2 | More people should learn SQL from UMSI
--  3 | UMSI also teaches Python and also SQL
--(2 rows)

-- We can remove duplicates and have more than one keyword
SELECT DISTINCT id, 
                doc 
  FROM 
    docs AS D
      JOIN 
    docs_gin AS G 
      ON D.id = G.doc_id
  WHERE G.keyword IN ('fun', 'people');
  
-- Doing the same thing with only docs_gin table
SELECT DISTINCT doc_id, 
                keyword 
  FROM docs_gin AS G 
  WHERE G.keyword = 'UMSI';
  -- these are all the documents that mention 'UMSI'
  
-- We can handle a phrase
SELECT DISTINCT id, 
                doc 
  FROM 
    docs AS D
      JOIN 
    docs_gin AS G 
      ON D.id = G.doc_id
WHERE G.keyword = ANY(string_to_array('I want to learn', ' '));

-- This can go sideways - (foreshadowing stop words)
SELECT DISTINCT id, 
                doc 
  FROM 
    docs AS D
      JOIN 
    docs_gin AS G 
      ON D.id = G.doc_id
WHERE G.keyword = ANY(string_to_array('Search for Lemons and Neons', ' '));
-- we get results, but only because of the word 'and'. Not really useful. 

-- docs_gin is purely a text (not language) based Inverted Index
-- PostgreSQL already knows how to do this using the GIN index

