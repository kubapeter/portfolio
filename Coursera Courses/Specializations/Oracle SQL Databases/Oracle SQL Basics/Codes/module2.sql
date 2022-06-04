-- Setup

CREATE TABLE Products
(
  productID int,
  productName varchar2(20)
);

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
  
-- Update a row

UPDATE Inventory 
  SET productQty = 50 
  WHERE invID = 1;
  
-- To see the change

SELECT *
  FROM Inventory;
  
-- Let's insert one more line

INSERT INTO Inventory
  (
    invID, 
    productName
  )
  VALUES 
  (
    2,
    'truck'
  );
  
-- Without WHERE clause all rows are updated

UPDATE Inventory 
  SET productQty = 500;
  
-- To see the change

SELECT *
  FROM Inventory;
