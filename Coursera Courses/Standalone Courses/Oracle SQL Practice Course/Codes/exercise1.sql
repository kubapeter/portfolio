-- Table 1: Create the Customers Table

create table customers(
 custCODE int not null,
 custName varchar2(20) not null,
 empID varchar(10) not null
 );
 
insert into customers (custCODE, custName, empID) 
  values (3264, 'TekNik', 'S2345');

insert into customers (custCODE, custName, empID) 
  values (1042, 'KomTex', 'I4567');

insert into customers (custCODE, custName, empID) 
  values (6774, 'Photon', 'S2345');

select * from customers;

-- Table 2: Create the Employees table

create table employees(
 empID varchar(10) not null,
 empName varchar(20) not null,
 role varchar(20)
 );

insert into employees (empID, empName) 
  values ('S1234', 'Jack Peterson');
insert into employees (empID, empName, Role) 
  values ('M3456', 'Tom Hill', 'Marketing');
insert into employees (empID, empName, Role) 
  values ('I4567', 'Matt Abrams', 'Installation');

select * from employees;

-- Table 3: Create the Orders table

create table orders(
 orderNUM int not null,
 custCODE varchar(20) not null,
 empID varchar(10) not null,
 orderDate date
 );
 
describe Orders;

-- Table 4: Create the Vendors table

create table vendors (
 vendorID int not null );

describe Vendors;
