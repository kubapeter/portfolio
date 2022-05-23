-- SETUP
-- Create tables
CREATE TABLE account (
  id SERIAL,
  email VARCHAR(128) UNIQUE,
  created_at DATE NOT NULL DEFAULT NOW(),
  updated_at DATE NOT NULL DEFAULT NOW(),
  PRIMARY KEY(id)
);

CREATE TABLE post (
  id SERIAL,
  title VARCHAR(128) UNIQUE NOT NULL, -- Will extend with ALTER
  content VARCHAR(1024),
  account_id INTEGER REFERENCES account(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY(id)
);

-- Allow multiple comments
CREATE TABLE comment (
  id SERIAL,
  content TEXT NOT NULL,
  account_id INTEGER REFERENCES account(id) ON DELETE CASCADE,
  post_id INTEGER REFERENCES post(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY(id)
);

CREATE TABLE fav (
  id SERIAL,
  oops TEXT, -- Will remove with ALTER
  post_id INTEGER REFERENCES post(id) ON DELETE CASCADE,
  account_id INTEGER REFERENCES account(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(post_id, account_id),
  PRIMARY KEY(id)
);

-- ALTER TABLE

ALTER TABLE post ALTER COLUMN content TYPE TEXT;

ALTER TABLE fav DROP COLUMN oops;

ALTER TABLE post ADD COLUMN howmuch INTEGER;


-- READ SQL COMMANDS FROM A SCRIPT 

-- We will load this:
-- https://www.pg4e.com/lectures/03-Techniques-Load.txt

-- Start fresh - Cascade deletes it all
DELETE FROM account;
ALTER SEQUENCE account_id_seq RESTART WITH 1;
ALTER SEQUENCE post_id_seq RESTART WITH 1;
ALTER SEQUENCE comment_id_seq RESTART WITH 1;
ALTER SEQUENCE fav_id_seq RESTART WITH 1;

-- Fills tables up with data
INSERT INTO account(email) VALUES 
('ed@umich.edu'), ('sue@umich.edu'), ('sally@umich.edu');

INSERT INTO post (title, content, account_id) VALUES
( 'Dictionaries', 'Are fun', 3),  
( 'BeautifulSoup', 'Has a complex API', 1), 
( 'Many to Many', 'Is elegant', (SELECT id FROM account WHERE email='sue@umich.edu' ));

INSERT INTO comment (content, post_id, account_id) VALUES
( 'I agree', 1, 1), 
( 'Especially for counting', 1, 2), 
( 'And I don''t understand why', 2, 2), 
( 'Someone should make "EasySoup" or something like that', 
    (SELECT id FROM post WHERE title='BeautifulSoup'),
    (SELECT id FROM account WHERE email='ed@umich.edu' )),
( 'Good idea - I might just do that', 
    (SELECT id FROM post WHERE title='BeautifulSoup'),
    (SELECT id FROM account WHERE email='sally@umich.edu' ))
;


-- Let's see, hogy to load this (start fresh and fill up) from file

-- linux:
-- wget https://www.pg4e.com/lectures/03-Techniques-Load.sql
-- psql:
-- \i 03-Techniques-Load.sql
-- Now account, post and comment are filled up with the data seen above


-- LOAD A CSV FILE AND AUTOMATICALLY NORMALIZE INTO ONE-TO-MANY

-- Download file
-- wget https://www.pg4e.com/lectures/03-Techniques.csv

-- x,y
-- Zap,A
-- Zip,A
-- One,B
-- Two,B

-- Create tables to load into
DROP TABLE IF EXISTS xy_raw;
DROP TABLE IF EXISTS y;
DROP TABLE IF EXISTS xy;

CREATE TABLE xy_raw(x TEXT, y TEXT, y_id INTEGER);
CREATE TABLE y (id SERIAL, PRIMARY KEY(id), y TEXT);
CREATE TABLE xy(id SERIAL, PRIMARY KEY(id), x TEXT, y_id INTEGER, UNIQUE(x,y_id));

--\copy xy_raw(x,y) FROM '03-Techniques.csv' WITH DELIMITER ',' CSV;

-- We can see that the data from the csv file is loaded 
SELECT * FROM xy_raw;
-- But in column y string is repeating -> not normalized

-- These should be in another table
SELECT DISTINCT y from xy_raw;

-- Let's put them there -> automatic ids for values of y
INSERT INTO y (y) SELECT DISTINCT y FROM xy_raw;

-- Put y_ids into xy_raw
UPDATE xy_raw SET y_id = (SELECT y.id FROM y WHERE y.y = xy_raw.y);

-- We can see the change
SELECT * FROM xy_raw;

--Let's fill the clean table
INSERT INTO xy (x, y_id) SELECT x, y_id FROM xy_raw;

-- We can see how it all matches
SELECT * FROM xy JOIN y ON xy.y_id = y.id;

-- We could also have done it: drop the unnecessary column
ALTER TABLE xy_raw DROP COLUMN y;

-- Clean up
DROP TABLE xy_raw;
