-- Modify the Orders table

alter table orders 
  modify custCode int;

-- Remove the Vendors table

drop table vendors;

-- Update the Employees table

select * 
  from employees;
  
update employees 
  set role = 'Sales' 
  where empID='S1234';
  
select * 
  from employees;

-- Populate the Orders table 

insert into orders (orderNum, custCode, empID, orderDate) 
  values (04125, 3264, 'S1234', date '2018-01-18');
insert into orders (orderNum, custCode, empID, orderDate) 
  values (13160, 1042, 'I4567', date '2019-06-07');
insert into orders (orderNum, custCode, empID) 
  values (75692, 6774, 'S1234');

select * 
  from orders;

-- Delete a row

delete from orders 
  where orderNum=75692;
  
select * from orders;
