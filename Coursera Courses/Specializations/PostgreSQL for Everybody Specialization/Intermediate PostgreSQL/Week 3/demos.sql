-- GENERATE DATA

-- Just to see how random, repeat and generate_series works
SELECT random(), random(), trunc(random()*100);
SELECT repeat('Neon ', 5);
SELECT generate_series(1,5);
SELECT 'Neon' || generate_series(1,5);

CREATE TABLE textfun (
  content TEXT
);

INSERT INTO textfun (content) SELECT 'Neon' || generate_series(1,5);

SELECT * FROM textfun;

DELETE FROM textfun;

-- BTree Index is Default
CREATE INDEX textfun_b ON textfun (content);

-- Too see how much more data does the index generates
SELECT pg_relation_size('textfun'), pg_indexes_size('textfun');

-- 5 rows to see how this works
SELECT (CASE WHEN (random() < 0.5)
         THEN 'https://www.pg4e.com/neon/'
         ELSE 'https://www.pg4e.com/LEMONS/'
         END) || generate_series(1000,1005);

-- Insert 100000 rows into the table
INSERT INTO textfun (content)
SELECT (CASE WHEN (random() < 0.5)
         THEN 'https://www.pg4e.com/neon/'
         ELSE 'https://www.pg4e.com/LEMONS/'
         END) || generate_series(100000,200000);

-- to see considerable size increase (index is bigger than indexed data itself)
SELECT pg_relation_size('textfun'), pg_indexes_size('textfun');


-- SOME STRING OPERATIONS

SELECT content FROM textfun WHERE content LIKE '%150000%';
--  https://www.pg4e.com/neon/150000
SELECT upper(content) FROM textfun WHERE content LIKE '%150000%';
--  HTTPS://WWW.PG4E.COM/NEON/150000
SELECT lower(content) FROM textfun WHERE content LIKE '%150000%';
--  https://www.pg4e.com/neon/150000
SELECT right(content, 4) FROM textfun WHERE content LIKE '%150000%';
-- 0000
SELECT left(content, 4) FROM textfun WHERE content LIKE '%150000%';
-- http
SELECT strpos(content, 'ttps://') FROM textfun WHERE content LIKE '%150000%';
-- 2
SELECT substr(content, 2, 4) FROM textfun WHERE content LIKE '%150000%';
-- ttps
SELECT split_part(content, '/', 4) FROM textfun WHERE content LIKE '%150000%';
-- neon
SELECT translate(content, 'th.p/', 'TH!P_') FROM textfun WHERE content LIKE '%150000%';
--  HTTPs:__www!Pg4e!com_neon_150000

-- LIKE-style wild cards
SELECT content FROM textfun WHERE content LIKE '%150000%';
SELECT content FROM textfun WHERE content LIKE '%150_00%';

SELECT content FROM textfun WHERE content IN ('https://www.pg4e.com/neon/150000', 'https://www.pg4e.com/neon/150001');

-- Don't want to fill up the server
DROP TABLE textfun;
