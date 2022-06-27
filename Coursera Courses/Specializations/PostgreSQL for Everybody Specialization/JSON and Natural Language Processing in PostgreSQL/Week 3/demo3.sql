CREATE INDEX messages_gin ON messages USING gin(to_tsvector('english', body));

SELECT to_tsvector('english', body) FROM messages LIMIT 1;

SELECT to_tsquery('english', 'easier');

SELECT id, to_tsquery('english', 'neon') @@ to_tsvector('english', body)
FROM messages LIMIT 10;

SELECT id, to_tsquery('english', 'easier') @@ to_tsvector('english', body)
FROM messages LIMIT 10;

--- Extract from the headers and make a new column for display purposes
ALTER TABLE messages ADD COLUMN sender TEXT;
UPDATE messages SET sender=substring(headers, '\nFrom: [^\n]*<([^>]*)');

SELECT subject, sender FROM messages
WHERE to_tsquery('english', 'monday') @@ to_tsvector('english', body) LIMIT 10;

EXPLAIN ANALYZE SELECT subject, sender FROM messages
WHERE to_tsquery('english', 'monday') @@ to_tsvector('english', body);

-- We did not make a Spanish index
EXPLAIN ANALYZE SELECT subject, sender FROM messages
WHERE to_tsquery('spanish', 'monday') @@ to_tsvector('spanish', body);

DROP INDEX messages_gin;
CREATE INDEX messages_gist ON messages USING gist(to_tsvector('english', body));
DROP INDEX messages_gist;

---

SELECT subject, sender FROM messages
WHERE to_tsquery('english', 'monday') @@ to_tsvector('english', body);
EXPLAIN ANALYZE SELECT subject, sender
FROM messages WHERE to_tsquery('english', 'monday') @@ to_tsvector('english', body);

-- https://www.postgresql.org/docs/current/functions-textsearch.html
SELECT id, subject, sender FROM messages
WHERE to_tsquery('english', 'personal & learning') @@ to_tsvector('english', body);

SELECT id, subject, sender FROM messages
WHERE to_tsquery('english', 'learning & personal') @@ to_tsvector('english', body);

-- Both words but in order
SELECT id, subject, sender FROM messages
WHERE to_tsquery('english', 'personal <-> learning') @@ to_tsvector('english', body);

SELECT id, subject, sender FROM messages
WHERE to_tsquery('english', 'learning <-> personal') @@ to_tsvector('english', body);

SELECT id, subject, sender FROM messages
WHERE to_tsquery('english', '! personal & learning') @@ to_tsvector('english', body);

-- plainto_tsquery() Is tolerant of "syntax errors" in the expression
SELECT id, subject, sender FROM messages
WHERE to_tsquery('english', '(personal learning') @@ to_tsvector('english', body);

SELECT id, subject, sender FROM messages
WHERE plainto_tsquery('english', '(personal learning') @@ to_tsvector('english', body);

-- phraseto_tsquery() implies followed by
SELECT id, subject, sender FROM messages
WHERE to_tsquery('english', 'I <-> think') @@ to_tsvector('english', body);

SELECT id, subject, sender FROM messages
WHERE phraseto_tsquery('english', 'I think') @@ to_tsvector('english', body);

-- websearch_to_tsquery is in PostgreSQL > 11
SELECT id, subject, sender FROM messages
WHERE to_tsquery('english', '! personal & learning') @@ to_tsvector('english', body);

SELECT id, subject, sender FROM messages
WHERE websearch_to_tsquery('english', '-personal learning') @@ to_tsvector('english', body)
LIMIT 10;

-- https://www.postgresql.org/docs/12/textsearch-controls.html#TEXTSEARCH-RANKING

SELECT id, subject, sender,
  ts_rank(to_tsvector('english', body), to_tsquery('english', 'personal & learning')) as ts_rank
FROM messages
WHERE to_tsquery('english', 'personal & learning') @@ to_tsvector('english', body)
ORDER BY ts_rank DESC;

-- A different ranking algorithm
SELECT id, subject, sender,
  ts_rank_cd(to_tsvector('english', body), to_tsquery('english', 'personal & learning')) as ts_rank
FROM messages
WHERE to_tsquery('english', 'personal & learning') @@ to_tsvector('english', body)
ORDER BY ts_rank DESC;

-- Indexing within structured data - Email messages from address (advanced)

SELECT substring(headers, '\nFrom: [^\n]*<([^>]*)') FROM messages LIMIT 10;

--- Extract from the headers and make a new column
ALTER TABLE messages ADD COLUMN sender TEXT;
UPDATE messages SET sender=substring(headers, '\nFrom: [^\n]*<([^>]*)');

CREATE INDEX messages_from ON messages (substring(headers, '\nFrom: [^\n]*<([^>]*)'));

SELECT sender,subject FROM messages WHERE substring(headers, '\nFrom: [^\n]*<([^>]*)') = 'john@caret.cam.ac.uk';

EXPLAIN ANALYZE SELECT sent_at FROM messages WHERE substring(headers, '\nFrom: [^\n]*<([^>]*)') = 'john@caret.cam.ac.uk';

SELECT subject, substring(headers, '\nLines: ([0-9]*)') AS lines FROM messages LIMIT 100;
SELECT AVG(substring(headers, '\nLines: ([0-9]*)')::integer) FROM messages;

-- A variable - actually more like a macro - escaping is tricky
\set zap 'substring(headers, \'\\nFrom: [^\\n]*<([^>]*)\')'
DROP INDEX messages_from;
EXPLAIN ANALYZE SELECT :zap FROM messages where :zap = 'john@caret.cam.ac.uk';
CREATE INDEX messages_from ON messages (:zap);
EXPLAIN ANALYZE SELECT :zap FROM messages where :zap = 'john@caret.cam.ac.uk';
