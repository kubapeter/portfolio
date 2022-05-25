--- Regex

CREATE TABLE em (id serial, primary key(id), email text);

INSERT INTO em (email) VALUES ('csev@umich.edu');
INSERT INTO em (email) VALUES ('coleen@umich.edu');
INSERT INTO em (email) VALUES ('sally@uiuc.edu');
INSERT INTO em (email) VALUES ('ted79@umuc.edu');
INSERT INTO em (email) VALUES ('glenn1@apple.com');
INSERT INTO em (email) VALUES ('nbody@apple.com');

SELECT email FROM em WHERE email ~ 'umich';
SELECT email FROM em WHERE email ~ '^c';
SELECT email FROM em WHERE email ~ 'edu$';
SELECT email FROM em WHERE email ~ '^[gnt]';
SELECT email FROM em WHERE email ~ '[0-9]';
SELECT email FROM em WHERE email ~ '[0-9][0-9]';

SELECT substring(email FROM '[0-9]+') FROM em WHERE email ~ '[0-9]';

SELECT substring(email FROM '.+@(.*)$') FROM em;

SELECT DISTINCT substring(email FROM '.+@(.*)$') FROM em;

SELECT substring(email FROM '.+@(.*)$'), 
    count(substring(email FROM '.+@(.*)$')) 
FROM em GROUP BY substring(email FROM '.+@(.*)$');

SELECT * FROM em WHERE substring(email FROM '.+@(.*)$') = 'umich.edu';

CREATE TABLE tw (id serial, primary key(id), tweet text);

INSERT INTO tw (tweet) VALUES ('This is #SQL and #FUN stuff');
INSERT INTO tw (tweet) VALUES ('More people should learn #SQL FROM #UMSI');
INSERT INTO tw (tweet) VALUES ('#UMSI also teaches #PYTHON');

SELECT tweet FROM tw;

SELECT id, tweet FROM tw WHERE tweet ~ '#SQL';

SELECT regexp_matches(tweet,'#([A-Za-z0-9_]+)', 'g') FROM tw;

SELECT DISTINCT regexp_matches(tweet,'#([A-Za-z0-9_]+)', 'g') FROM tw;

SELECT id, regexp_matches(tweet,'#([A-Za-z0-9_]+)', 'g') FROM tw;

-- wget https://www.pg4e.com/lectures/mbox-short.txt

CREATE TABLE mbox (line TEXT);

-- E'\007' is the BEL character and not in the data so each row is one column
\copy mbox FROM 'mbox-short.txt' with delimiter E'\007';

\copy mbox FROM PROGRAM 'wget -q -O - "$@" https://www.pg4e.com/lectures/mbox-short.txt' with delimiter E'\007';

SELECT line FROM mbox WHERE line ~ '^From ';
SELECT substring(line, ' (.+@[^ ]+) ') FROM mbox WHERE line ~ '^From ';

SELECT substring(line, ' (.+@[^ ]+) '), count(substring(line, ' (.+@[^ ]+) ')) FROM mbox WHERE line ~ '^From ' GROUP BY substring(line, ' (.+@[^ ]+) ') ORDER BY count(substring(line, ' (.+@[^ ]+) ')) DESC;

SELECT email, count(email) FROM
( SELECT substring(line, ' (.+@[^ ]+) ') AS email FROM mbox WHERE line ~ '^From '
) AS badsub
GROUP BY email ORDER BY count(email) DESC;


--- Advanced Indexes
--- Note these might overrun a class-provided server with a small disk quota

SELECT 'https://www.pg4e.com/neon/' || trunc(random()*1000000) || repeat('Lemon', 5) || generate_series(1,5);

CREATE TABLE cr1 (
  id SERIAL,
  url VARCHAR(128) UNIQUE,
  content TEXT
);

INSERT INTO cr1(url)
SELECT repeat('Neon', 1000) || generate_series(1,5000);

CREATE TABLE cr2 (
  id SERIAL,
  url TEXT,
  content TEXT
);

INSERT INTO cr2 (url)
SELECT repeat('Neon', 1000) || generate_series(1,5000);

SELECT pg_relation_size('cr2'), pg_indexes_size('cr2');

CREATE unique index cr2_unique on cr2 (url);

SELECT pg_relation_size('cr2'), pg_indexes_size('cr2');

DROP index cr2_unique;

SELECT pg_relation_size('cr2'), pg_indexes_size('cr2');

CREATE unique index cr2_md5 on cr2 (md5(url));

SELECT pg_relation_size('cr2'), pg_indexes_size('cr2');

explain SELECT * FROM cr2 WHERE url='lemons';

explain SELECT * FROM cr2 WHERE md5(url)=md5('lemons');

DROP index cr2_md5;

CREATE unique index cr2_sha256 on cr2 (sha256(url::bytea));

explain SELECT * FROM cr2 WHERE sha256(url::bytea)=sha256('bob'::bytea);

CREATE TABLE cr3 (
  id SERIAL,
  url TEXT,
  url_md5 uuid unique,
  content TEXT
);

INSERT INTO cr3 (url)
SELECT repeat('Neon', 1000) || generate_series(1,5000);

SELECT pg_relation_size('cr3'), pg_indexes_size('cr3');

update cr3 set url_md5 = md5(url)::uuid;

SELECT pg_relation_size('cr3'), pg_indexes_size('cr3');

EXPLAIN ANALYZE SELECT * FROM cr3 WHERE url_md5=md5('lemons')::uuid;

CREATE TABLE cr4 (
  id SERIAL,
  url TEXT,
  content TEXT
);

INSERT INTO cr4 (url)
SELECT repeat('Neon', 1000) || generate_series(1,5000);

CREATE index cr4_hash on cr4 using hash (url);

SELECT pg_relation_size('cr4'), pg_indexes_size('cr4');

EXPLAIN ANALYZE SELECT * FROM cr5 WHERE url='lemons';

-- Drop these tables to make sure not to overrun your server
DROP table cr1;
DROP table cr2;
DROP table cr3;
DROP table cr4;
DROP table cr5;
