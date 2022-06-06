-- Create a table

CREATE TABLE customer 
(
  customerID int, 
  customerName varchar(20)
); 

-- Create a table with constraints

CREATE TABLE emps 
(
  empID int NOT NULL, 
  empName varchar(20) NOT NULL
); 

-- Add a column

ALTER TABLE emps
  ADD email varchar(20);
  
-- Add constraint to a column

ALTER TABLE emps
  MODIFY email NOT NULL;

-- Insert a row (notice the order of column names)

INSERT INTO emps
  (
    empName,
    empID,
    email
  )
  VALUES
  (
    'Mark Adams',
    1, 
    'madams@example.com'
  );

-- Select the result

SELECT * 
  FROM emps;

-- Drop just one column 

ALTER TABLE emps
  DROP COLUMN email;

-- 
