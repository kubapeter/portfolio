There are 2 exercises in Module 3.

># Exercise 1: Create and Populate Tables
>
>In this exercise, you are going to create a database for a tech company. The company needs to track their sales to their customers, and which employees handle the sales. We will need four tables: A Customers table, an Orders table, an Employees table, and a Vendors table. Use the data below to create the tables. [...]
>
>## Table 1: Create the Customers Table
>
>1. Use the details below to create a **Customers** table.
>
>| Customers                          |
>|------------------------------------|
>| custCode - int - not null          |
>| custName - varchar2(20) - not null |
>| empID - varchar(10) - not null     |
>
>2. Once your Customers table is created, populate it with the following information using the **insert** statement:
>
>custCode = 3264, custName = TekNik, empID = S2345
>
>custCode = 1042, custName = KomTex, empID = I4567
>
>custCode = 6774, custName = Photon, empID = S2345
>
>3. Do a **select all** statement to ensure the data is correct.
>
>## Table 2: Create the Employees table
>
>1. Use the details below to create an **Employees** table.
>
>| Employees                        |
>|----------------------------------|
>| empID - varchar(10) - not null   |
>| empName - varchar(20) - not null |
>| Role - varchar(20)               |
>
>2. Now, we need to populate the employees table with data. View the description so you can see the columns we’ll be populating. 
>
>3. Once you have viewed your table, insert the following information into it:
>
>empID = S1234, empName = Jack Peterson, Role = 
>
>empID = M3456, empName = Tom Hill, Role = Marketing
>
>empID = I4567, empName = Matt Abrams, Role = Installation
>
>4. Select all to view the output to ensure the data is correct.
>
>## Table 3: Create the Orders table
>
>1. Use the details below to create an **Orders** table.
>
>| Orders                            |
>|-----------------------------------|
>| orderNUM - int - not null         |
>| custCode - varchar(20) - not null |
>| empID - varchar2(10) - not null   |
>| orderDate - date                  |
>
>2. We aren't populating this table just yet, so view the output to ensure the columns are correct using the describe command.
>
>## Table 4: Create the Vendors table
>
>1. Use the details below to create an **Vendors** table.
>
>| Vendors                           |
>|-----------------------------------|
>| vendorID - int - not null         |
>
>2. We aren't populating this table just yet, so view the output to ensure the columns are correct using the describe command.


