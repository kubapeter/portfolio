-- The program will do these two commands and insert some rows
DROP TABLE IF EXISTS pythonfun CASCADE;
CREATE TABLE pythonfun 
  (id SERIAL, 
   line TEXT);

-- To check the results, use psql and look at the pythonfun table
SELECT * 
  FROM pythonfun;
