-- Create table
DROP TABLE IF EXISTS racing;

CREATE TABLE racing (
  make VARCHAR, 
  model VARCHAR, 
  year INTEGER, 
  price INTEGER
);

INSERT INTO racing (make, model, year, price) 
  VALUES 
  ('Nissan', 'Stanza', 1990, 2000), 
  ('Dodge', 'Neon', 1995, 800), 
  ('Dodge', 'Neon', 1998, 2500), 
  ('Dodge', 'Neon', 1999, 3000), 
  ('Ford', 'Mustang', 2001, 1000), 
  ('Ford', 'Mustang', 2005, 2000), 
  ('Subaru', 'Impreza', 1997, 1000), 
  ('Mazda', 'Miata', 2001, 5000), 
  ('Mazda', 'Miata', 2001, 3000), 
  ('Mazda', 'Miata', 2001, 2500), 
  ('Mazda', 'Miata', 2002, 5500), 
  ('Opel', 'GT', 1972, 1500), 
  ('Opel', 'GT', 1969, 7500), 
  ('Opel', 'Cadet', 1973, 500)
;


-- SELECT and DISTINCT

-- no duplicate rows
SELECT DISTINCT make 
  FROM racing;

SELECT DISTINCT model 
  FROM racing;

-- no duplicate (make, model) pairs
SELECT DISTINCT make, model
  FROM racing;


--Can have duplicates in the make column
SELECT DISTINCT ON (model) 
    make, 
    model, 
    year 
  FROM racing;
  
-- Must include the DISTINCT column in ORDER BY
SELECT DISTINCT ON (model) 
    make, 
    model, 
    year 
  FROM racing
  ORDER BY model, year;
  
SELECT DISTINCT ON (model) 
    make, 
    model, 
    year 
  FROM racing
  ORDER BY model, year DESC;
  
SELECT DISTINCT ON (model) 
    make, 
    model, 
    year 
  FROM racing
  ORDER BY model, year DESC 
  LIMIT 2;
  
  
-- GROUP BY

-- Just look around a bit
SELECT * 
  FROM pg_timezone_names 
  LIMIT 20;
  
SELECT COUNT(*)
  FROM pg_timezone_names;
  
SELECT DISTINCT is_dst
  FROM pg_timezone_names;

-- Count with GROUP BY
SELECT 
    COUNT(is_dst), 
    is_dst
  FROM pg_timezone_names
  GROUP BY is_dst;
  
SELECT 
    COUNT(abbrev), 
    abbrev
  FROM pg_timezone_names

-- Filter with WHERE and HAVING
SELECT 
    COUNT(abbrev) AS ct, 
    abbrev
  FROM pg_timezone_names
  WHERE is_dst = 't'
  GROUP BY abbrev
    HAVING COUNT(abbrev) > 10;
  
SELECT 
    COUNT(abbrev) AS ct, 
    abbrev
  FROM pg_timezone_names
  GROUP BY abbrev
    HAVING COUNT(abbrev) > 10;
    
SELECT 
    COUNT(abbrev) AS ct, 
    abbrev
  FROM pg_timezone_names
  GROUP BY abbrev
    HAVING COUNT(abbrev) > 10
  ORDER BY COUNT(abbrev) DESC;


-- SUBQUERIES 

-- Look at racing table
SELECT * 
  FROM racing;
  
-- Find the highest number of makes
SELECT COUNT(make), make
  FROM racing
  GROUP BY make
  ORDER BY COUNT(make) DESC
  LIMIT 1;

-- Show only those rows where the make is the highest through the table
SELECT * 
  FROM racing
  WHERE make = 
    (
    SELECT make
      FROM racing
      GROUP BY make
      ORDER BY COUNT(make) DESC
      LIMIT 1
    );


-- CONCURRENCY 

-- (setup)
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
--(end of setup)


-- Do this twice
INSERT INTO fav (post_id, account_id, howmuch) 
  VALUES (1, 1, 1)
RETURNING *;
--complains because of UNIQUE(post_id, account_id)

-- We can check the changes
UPDATE fav SET howmuch = howmuch + 1
  WHERE post_id = 1 AND account_id = 1
RETURNING *;

-- If insert is not possible, then row exists, so do accodingly
INSERT INTO fav (post_id, account_id, howmuch) 
  VALUES (1, 1, 1)
  ON CONFLICT (post_id, account_id)
  DO UPDATE SET howmuch = fav.howmuch + 1
RETURNING *;


-- TRANSACTIONS (try in two windows)

-- FOR UPDATE OF grabs a lock on the row, ROLLBACK withdraws the update
BEGIN;
SELECT howmuch FROM fav WHERE account_id = 1 AND post_id = 1 FOR UPDATE OF fav; 
-- Time passes...
UPDATE fav SET howmuch = 999 WHERE account_id = 1 AND post_id = 1;
ROLLBACK;
SELECT howmuch FROM fav WHERE account_id = 1 AND post_id = 1;
RETURNING *;

-- FOR UPDATE OF grabs a lock on the row, COMMIT enforces the update to happen
-- This waits until the other finishes
BEGIN;
SELECT howmuch FROM fav WHERE account_id = 1 AND post_id = 1 FOR UPDATE OF fav; 
-- Time passes...
UPDATE fav SET howmuch = 999 WHERE account_id = 1 AND post_id = 1;
COMMIT;
SELECT howmuch FROM fav WHERE account_id = 1 AND post_id = 1;


-- STORED PROCEDURES 

UPDATE fav SET howmuch = howmuch + 1
  WHERE post_id = 1 AND account_id = 1
RETURNING *;

-- Stored procedure is defined here
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers that trigger the stored procedure
CREATE TRIGGER set_timestamp
BEFORE UPDATE ON post
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();


CREATE TRIGGER set_timestamp
BEFORE UPDATE ON fav
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();


CREATE TRIGGER set_timestamp
BEFORE UPDATE ON comment
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();
