-- Creating a table

CREATE TABLE Products
(
  productID int,
  productName varchar2(20)
);

-- To see the schema

DESCRIBE Products;

-- Add column

ALTER TABLE Products
  ADD productDesc varchar2(50);
  
-- To see the change

DESCRIBE Products;

-- Modify column

ALTER TABLE Products
  MODIFY productDesc varchar2(40);
  
-- To see the change

DESCRIBE Products;

-- Delete a table

DROP TABLE Products;

-- To see the change

DESCRIBE Products;
-- we get an error message

-- build table by executing a .sql file containing DDL commands

@c:\data\buildTable.sql

