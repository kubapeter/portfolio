-- REGEX

-- (setup)
CREATE TABLE em (id serial, primary key(id), email text);

INSERT INTO em (email) VALUES ('csev@umich.edu');
INSERT INTO em (email) VALUES ('coleen@umich.edu');
INSERT INTO em (email) VALUES ('sally@uiuc.edu');
INSERT INTO em (email) VALUES ('ted79@umuc.edu');
INSERT INTO em (email) VALUES ('glenn1@apple.com');
INSERT INTO em (email) VALUES ('nbody@apple.com');
-- (end of setup)

-- all emails with umich in them
SELECT email FROM em WHERE email ~ 'umich';

-- all emails starting with c
SELECT email FROM em WHERE email ~ '^c';

-- all emails ending with edu
SELECT email FROM em WHERE email ~ 'edu$';

-- all emails starting with g or n or t
SELECT email FROM em WHERE email ~ '^[gnt]';

-- all emails with numbers in them
SELECT email FROM em WHERE email ~ '[0-9]';

-- all emails with 2 digits next to each other
SELECT email FROM em WHERE email ~ '[0-9][0-9]';


-- PARSE COLUMNS WITH REGEX

-- if email has (one or more) numbers in it show me the numbers
SELECT substring(email FROM '[0-9]+') FROM em WHERE email ~ '[0-9]';

-- show me all the domains of the emails
SELECT substring(email FROM '.+@(.*)$') FROM em;

-- show each domain only once
SELECT DISTINCT substring(email FROM '.+@(.*)$') FROM em;

-- show each domain once and how many rows has it
SELECT substring(email FROM '.+@(.*)$'), 
    count(substring(email FROM '.+@(.*)$')) 
FROM em GROUP BY substring(email FROM '.+@(.*)$');

-- show all emails with domain umich.edu
SELECT * FROM em WHERE substring(email FROM '.+@(.*)$') = 'umich.edu';


--(setup)
CREATE TABLE tw (id serial, primary key(id), tweet text);

INSERT INTO tw (tweet) VALUES ('This is #SQL and #FUN stuff');
INSERT INTO tw (tweet) VALUES ('More people should learn #SQL FROM #UMSI');
INSERT INTO tw (tweet) VALUES ('#UMSI also teaches #PYTHON');
--(end of setup)

-- just to see the table
SELECT tweet FROM tw;

-- all tweets with #SQL in it
SELECT id, tweet FROM tw WHERE tweet ~ '#SQL';

-- all #tag substrings ('g' means more than once) - we get 6 of these though there are only 3 tweets
SELECT regexp_matches(tweet,'#([A-Za-z0-9_]+)', 'g') FROM tw;

-- just the distinct tags
SELECT DISTINCT regexp_matches(tweet,'#([A-Za-z0-9_]+)', 'g') FROM tw;

-- now we see which tag is in which tweet
SELECT id, regexp_matches(tweet,'#([A-Za-z0-9_]+)', 'g') FROM tw;


-- GRAB A FLAT TEXT FILE

--(setup)
-- wget https://www.pg4e.com/lectures/mbox-short.txt

CREATE TABLE mbox (line TEXT);

-- E'\007' is the BEL character and not in the data so each row is one column
\copy mbox FROM 'mbox-short.txt' with delimiter E'\007';

\copy mbox FROM PROGRAM 'wget -q -O - "$@" https://www.pg4e.com/lectures/mbox-short.txt' with delimiter E'\007';
--(end of setup)

-- all lines starting with From
SELECT line FROM mbox WHERE line ~ '^From ';

-- all email addresses from all lines starting with From
SELECT substring(line, ' (.+@[^ ]+) ') FROM mbox WHERE line ~ '^From ';

-- each email address once from all lines starting with From, with count
SELECT substring(line, ' (.+@[^ ]+) '), count(substring(line, ' (.+@[^ ]+) ')) FROM mbox WHERE line ~ '^From ' GROUP BY substring(line, ' (.+@[^ ]+) ') ORDER BY count(substring(line, ' (.+@[^ ]+) ')) DESC;

-- same as above, but with subquery
SELECT email, count(email) FROM
( SELECT substring(line, ' (.+@[^ ]+) ') AS email FROM mbox WHERE line ~ '^From '
) AS badsub
GROUP BY email ORDER BY count(email) DESC;
