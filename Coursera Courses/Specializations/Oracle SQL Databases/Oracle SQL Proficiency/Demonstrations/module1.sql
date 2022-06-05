CREATE TABLE Customers
(
  custID int,
  custName varchar2(20)
);

ALTER TABLE Customers
  ADD zipCode varchar2(10);

DROP TABLE Customers; 
