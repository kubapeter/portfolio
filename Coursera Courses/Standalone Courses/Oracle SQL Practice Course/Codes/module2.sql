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

-- Drop just one column 

ALTER TABLE emps
  DROP COLUMN email;
