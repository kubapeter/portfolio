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

-- Just to see the table is empty

SELECT COUNT(*)
  FROM Products;
  
-- Insert a row into the table
  
INSERT INTO Products
  (
    productID, 
    productName
  )
  VALUES 
  (
    1,
    'shoes'
  );
  
-- Now we see the table has one row

SELECT COUNT(*)
  FROM Products;
  
-- To see the row(s)

SELECT *
  FROM Products;
  
-- Create another table

CREATE TABLE Inventory
(
  invID int,
  productName varchar2(20), 
  productQty int
);

-- Insert a row with not all values

INSERT INTO Inventory
  (
    invID, 
    productName
  )
  VALUES 
  (
    1,
    'car'
  );
  
-- To see that productQty is empty

SELECT *
  FROM Inventory;
  
