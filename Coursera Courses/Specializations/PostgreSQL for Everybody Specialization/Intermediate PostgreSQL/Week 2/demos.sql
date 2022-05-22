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

-- https://www.pg4e.com/lectures/03-Techniques-Load.txt

-- Start fresh - Cascade deletes it all

DELETE FROM account;
ALTER SEQUENCE account_id_seq RESTART WITH 1;
ALTER SEQUENCE post_id_seq RESTART WITH 1;
ALTER SEQUENCE comment_id_seq RESTART WITH 1;
ALTER SEQUENCE fav_id_seq RESTART WITH 1;

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

-- OR!
-- Load it from file
-- \i C:\Users\Dell\Desktop\03-Techniques-Load.sql


-- Load a CSV file and automatically normalize into none-to-many

-- Download 
-- wget https://www.pg4e.com/lectures/03-Techniques.csv

-- x,y
-- Zap,A
-- Zip,A
-- One,B
-- Two,B

DROP TABLE IF EXISTS xy_raw;
DROP TABLE IF EXISTS y;
DROP TABLE IF EXISTS xy;

CREATE TABLE xy_raw(x TEXT, y TEXT, y_id INTEGER);
CREATE TABLE y (id SERIAL, PRIMARY KEY(id), y TEXT);
CREATE TABLE xy(id SERIAL, PRIMARY KEY(id), x TEXT, y_id INTEGER, UNIQUE(x,y_id));

\d xy_raw
\d+ y
