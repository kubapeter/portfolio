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


-- Now take advantage of rules of the natural language. 
-- Let's define STOP WORDS (like 'is' or 'and') that do not add anything to the search.

-- SETUP
DROP TABLE docs cascade;
CREATE TABLE docs (
    id SERIAL, 
    doc TEXT, 
    PRIMARY KEY(id)
  );
  
INSERT INTO docs (doc) 
  VALUES ('This is SQL and Python and other fun teaching stuff'),
         ('More people should learn SQL from UMSI'),
         ('UMSI also teaches Python and also SQL');
         
-- Break the document column into one row per word + primary key
SELECT id, 
       s.keyword AS keyword
  FROM docs AS D, 
       unnest(string_to_array(D.doc, ' ')) s(keyword)
  ORDER BY id;

-- Lower case it all
SELECT DISTINCT id, 
                s.keyword AS keyword
  FROM docs AS D, 
       unnest(string_to_array(lower(D.doc), ' ')) s(keyword)
  ORDER BY id;

-- reset docs_gin table
DROP TABLE docs_gin CASCADE;
CREATE TABLE docs_gin (
  keyword TEXT,
  doc_id INTEGER REFERENCES docs(id) ON DELETE CASCADE
);
  -- end SETUP
  
-- Create table of stop words
DROP TABLE stop_words;
CREATE TABLE stop_words (word TEXT unique);
INSERT INTO stop_words (word) 
  VALUES ('is'), ('this'), ('and');
  
-- All we do is throw out the words in the stop word list
SELECT DISTINCT id, 
                s.keyword AS keyword
  FROM docs AS D, 
       unnest(string_to_array(lower(D.doc), ' ')) s(keyword)
  WHERE s.keyword NOT IN (
                          SELECT word 
                            FROM stop_words
                         )
  ORDER BY id;

-- Put the stop-word free list into the GIN
INSERT INTO docs_gin (doc_id, keyword)
  SELECT DISTINCT id, 
                  s.keyword AS keyword
    FROM docs AS D, 
         unnest(string_to_array(lower(D.doc), ' ')) s(keyword)
    WHERE s.keyword NOT IN (
                            SELECT word 
                              FROM stop_words
                           )
    ORDER BY id;


-- Just to see the result
SELECT * 
  FROM docs_gin;
  
-- A one word query
SELECT DISTINCT doc 
  FROM docs AS D
         JOIN 
       docs_gin AS G 
         ON D.id = G.doc_id
  WHERE G.keyword = lower('UMSI');

-- A multi-word query
SELECT DISTINCT doc 
  FROM docs AS D
         JOIN 
       docs_gin AS G 
         ON D.id = G.doc_id
  WHERE G.keyword = ANY(string_to_array(lower('Meet fun people'), ' '));

-- A stop word query - as if it were never there
SELECT DISTINCT doc 
  FROM docs AS D
         JOIN 
       docs_gin AS G 
         ON D.id = G.doc_id
  WHERE G.keyword = lower('and');
  -- 0 rows


-- Another aspect of natural language: ADD STEMMING
-- We can make the index even smaller
-- (3) Only store the "stems" of words

-- Our simple approach is to make a "dictionary" of word -> stem

CREATE TABLE docs_stem (word TEXT, stem TEXT);
INSERT INTO docs_stem (word, stem) 
  VALUES ('teaching', 'teach'), 
         ('teaches', 'teach');
         
-- Move the initial word extraction into a sub-query
SELECT id, 
       keyword 
  FROM (
        SELECT DISTINCT id, 
                        s.keyword AS keyword
          FROM docs AS D, 
               unnest(string_to_array(lower(D.doc), ' ')) s(keyword)
       ) AS X;
       
-- Add the stems as third column (may or may not exist)
SELECT id, 
       keyword, 
       stem
  FROM (
        SELECT DISTINCT id, 
                        s.keyword AS keyword
          FROM docs AS D, 
               unnest(string_to_array(lower(D.doc), ' ')) s(keyword)
       ) AS K
         LEFT JOIN 
       docs_stem AS S 
         ON K.keyword = S.word;


-- If the stem is there, use it
SELECT id,
       CASE WHEN stem IS NOT NULL 
            THEN stem 
            ELSE keyword 
       END AS awesome,
       keyword, 
       stem
  FROM (
        SELECT DISTINCT id, 
                        lower(s.keyword) AS keyword
          FROM docs AS D, 
               unnest(string_to_array(lower(D.doc), ' ')) s(keyword)
       ) AS K
         LEFT JOIN 
       docs_stem AS S 
         ON K.keyword = S.word;
         

-- Just to see COALESCE returns the first not null parameter
-- Null Coalescing - return the first non-null in a list
-- x = stem or 'teaching'  # Python
SELECT COALESCE(NULL, NULL, 'umsi');
SELECT COALESCE('umsi', NULL, 'SQL');

-- If the stem is there, use it instead of the keyword
SELECT id, 
       COALESCE(stem, keyword) AS keyword
  FROM (
        SELECT DISTINCT id, 
                        lower(s.keyword) AS keyword
          FROM docs AS D, 
               unnest(string_to_array(lower(D.doc), ' ')) s(keyword)
       ) AS K
         LEFT JOIN 
       docs_stem AS S 
         ON K.keyword = S.word;
         

-- Now insert this select statement into docs_gin
-- Insert only the stems
DELETE FROM docs_gin;

INSERT INTO docs_gin (doc_id, keyword)
  SELECT id, 
         COALESCE(stem, keyword) AS keyword
    FROM (
          SELECT DISTINCT id, 
                          lower(s.keyword) AS keyword
            FROM docs AS D, 
                 unnest(string_to_array(lower(D.doc), ' ')) s(keyword)
         ) AS K
           LEFT JOIN 
         docs_stem AS S 
           ON K.keyword = S.word;

-- Just to look at it
SELECT * FROM docs_gin;


-- Lets do stop words AND stems...
DELETE FROM docs_gin;

INSERT INTO docs_gin (doc_id, keyword)
  SELECT id, 
         COALESCE(stem, keyword) AS keyword
    FROM (
          SELECT DISTINCT id, 
                          lower(s.keyword) AS keyword
            FROM docs AS D, 
                 unnest(string_to_array(lower(D.doc), ' ')) s(keyword)
            WHERE s.keyword NOT IN (SELECT word FROM stop_words)
         ) AS K
           LEFT JOIN 
         docs_stem AS S 
           ON K.keyword = S.word;

-- Just to look at it
SELECT * FROM docs_gin;


-- Lets do some queries
SELECT COALESCE((
                 SELECT stem 
                   FROM docs_stem 
                   WHERE word=lower('SQL')                
                ), lower('SQL'));

-- Handling the stems in queries. Use the keyword if there is no stem
SELECT DISTINCT id, 
                doc 
  FROM docs AS D
         JOIN 
       docs_gin AS G 
         ON D.id = G.doc_id
  WHERE G.keyword = COALESCE((
                              SELECT stem 
                                FROM docs_stem 
                                WHERE word=lower('SQL')
                              ), lower('SQL'));

-- Prefer the stem over the actual keyword
SELECT COALESCE((
                 SELECT stem 
                   FROM docs_stem 
                   WHERE word=lower('teaching')                
                ), lower('teaching'));


SELECT DISTINCT id, 
                doc 
  FROM docs AS D
         JOIN 
       docs_gin AS G 
         ON D.id = G.doc_id
  WHERE G.keyword = COALESCE((
                              SELECT stem 
                                FROM docs_stem 
                                WHERE word=lower('teaching')
                              ), lower('teaching'));
