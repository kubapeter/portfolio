-- Table 1: Create the Customers Table

create table customers(
 custCODE int not null,
 custName varchar2(20) not null,
 empID varchar(10) not null
 );
insert into customers (custCODE, custName, empID) values (3264,
'TekNik', 'S2345');
insert into customers (custCODE, custName, empID) values (1042,
'KomTex', 'I4567');
insert into customers (custCODE, custName, empID) values (6774,
'Photon', 'S2345');
select * from customers;
