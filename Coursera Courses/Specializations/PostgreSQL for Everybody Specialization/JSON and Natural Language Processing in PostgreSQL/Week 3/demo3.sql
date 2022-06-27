-- SETUP in demos3.py

CREATE INDEX messages_gin 
  ON messages 
  USING gin(to_tsvector('english', body));

-- just to demonstarte how the stemming works
SELECT to_tsvector('english', body) 
  FROM messages 
  LIMIT 1;

-- demonstrate querying
SELECT to_tsquery('english', 'easier');

SELECT id, to_tsquery('english', 'neon') @@ to_tsvector('english', body)
  FROM messages 
  LIMIT 10;

SELECT id, to_tsquery('english', 'easier') @@ to_tsvector('english', body)
  FROM messages 
  LIMIT 10;

--- Extract from the headers and make a new column for display purposes
ALTER TABLE messages 
  ADD COLUMN sender TEXT;

UPDATE messages 
  SET sender=substring(headers, '\nFrom: [^\n]*<([^>]*)');

-- Using indexes
SELECT subject, 
       sender 
  FROM messages
  WHERE to_tsquery('english', 'monday') @@ to_tsvector('english', body) 
  LIMIT 10;

EXPLAIN ANALYZE 
  SELECT subject, 
         sender 
    FROM messages
    WHERE to_tsquery('english', 'monday') @@ to_tsvector('english', body);

-- We did not make a Spanish index
EXPLAIN ANALYZE 
  SELECT subject, 
         sender 
    FROM messages
    WHERE to_tsquery('spanish', 'monday') @@ to_tsvector('spanish', body);
  -- runs, but it is a sequential scan

-- Let's see the GiST variant
DROP INDEX messages_gin;
CREATE INDEX messages_gist 
  ON messages 
  USING gist(to_tsvector('english', body));
  -- no difference in the queries, only in the speed, maintainanace cost, and size

DROP INDEX messages_gist;

---

-- We will see variations for this query
SELECT subject, 
       sender 
  FROM messages
  WHERE to_tsquery('english', 'monday') @@ to_tsvector('english', body);

EXPLAIN ANALYZE 
  SELECT subject, 
         sender 
    FROM messages
    WHERE to_tsquery('english', 'monday') @@ to_tsvector('english', body);

-- https://www.postgresql.org/docs/current/functions-textsearch.html
-- &
SELECT id, 
       subject, 
       sender 
  FROM messages
  WHERE to_tsquery('english', 'personal & learning') @@ to_tsvector('english', body);

SELECT id, 
       subject, 
       sender 
  FROM messages
  WHERE to_tsquery('english', 'learning & personal') @@ to_tsvector('english', body);
  -- it is the same, because order does not matter

-- Both words but in order: <->
SELECT id, 
       subject, 
       sender 
  FROM messages
  WHERE to_tsquery('english', 'personal <-> learning') @@ to_tsvector('english', body);

SELECT id, 
       subject, 
       sender 
  FROM messages
  WHERE to_tsquery('english', 'learning <-> personal') @@ to_tsvector('english', body);
  -- different results because of order

-- unary not function: !
SELECT id, 
       subject, 
       sender 
  FROM messages
  WHERE to_tsquery('english', '! personal & learning') @@ to_tsvector('english', body);


-- plainto_tsquery() Is tolerant of "syntax errors" in the expression
SELECT id, 
       subject, 
       sender 
  FROM messages
  WHERE to_tsquery('english', '(personal learning') @@ to_tsvector('english', body);
  -- gives syntax error

SELECT id, 
       subject, 
       sender 
  FROM messages
  WHERE plainto_tsquery('english', '(personal learning') @@ to_tsvector('english', body);
  -- handles typo

-- phraseto_tsquery() implies followed by
SELECT id, 
       subject, 
       sender 
  FROM messages
  WHERE to_tsquery('english', 'I <-> think') @@ to_tsvector('english', body);

SELECT id, 
       subject, 
       sender 
  FROM messages
  WHERE phraseto_tsquery('english', 'I think') @@ to_tsvector('english', body);
  -- same result

-- websearch_to_tsquery is in PostgreSQL > 11
SELECT id, 
       subject, 
       sender 
  FROM messages
  WHERE to_tsquery('english', '! personal & learning') @@ to_tsvector('english', body);

SELECT id, 
       subject, 
       sender 
  FROM messages
  WHERE websearch_to_tsquery('english', '-personal learning') @@ to_tsvector('english', body)
  LIMIT 10;
  -- gives the same (Google format works)

-- https://www.postgresql.org/docs/12/textsearch-controls.html#TEXTSEARCH-RANKING


-- Text ranking
SELECT id, 
       subject, 
       sender,
       ts_rank(to_tsvector('english', body), 
       to_tsquery('english', 'personal & learning')) as ts_rank
  FROM messages
  WHERE to_tsquery('english', 'personal & learning') @@ to_tsvector('english', body)
  ORDER BY ts_rank DESC;

-- A different ranking algorithm: ts_rank_cd()
SELECT id, 
       subject, 
       sender,
       ts_rank_cd(to_tsvector('english', body), 
       to_tsquery('english', 'personal & learning')) as ts_rank
  FROM messages
  WHERE to_tsquery('english', 'personal & learning') @@ to_tsvector('english', body)
  ORDER BY ts_rank DESC;
