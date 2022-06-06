There are 2 exercises in Module 3.

# Exercise 1: Create and Populate Tables

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

# Exercise 2: Modify, Drop, and Update Tables

>In this exercise, you are going to be modifying the four tables you created in the previous exercise: the Customers table, the Orders table, the Employees table, and the Vendors table. [...]
>## Modify the Orders Table
>
>1. We need to change our custCode in the Orders table to be a number instead of variable length character. 
>
>| Orders                            |
>|-----------------------------------|
>| orderNUM - int - not null         |
>| custCode - **int** - not null     |
>| empID - varchar2(10) - not null   |
>| orderDate - date                  |
>
>2. Use the describe statement to ensure custCode has been changed to an integer.
>
>## Remove the Vendors Table
>
>1. We’ve realized that we do not need the Vendors table, since our Customers table will contain the same information. Remove the Vendors table from our database using the drop command.
>
>## Update the Employees table
>
>1. Now, let’s update the Employees table. Select everything in the employees table to see our records.
>
>2. Update Jack Peterson’s **Role** to **Sales**.
>
>3. Check the output of your table to ensure the change is there.
>
>## Populate the Orders table
>
>1. Now, we need to populate the Orders table with data. Describe it so you can see the columns we’ll be populating. Once you have viewed your table, insert the following information into it: 
>
><ins>Hint</ins>: to enter a date, the value statement must specify date and be in YYYY-MM-DD format. Example: values (date ‘2015-11-07’) would enter the value of November 7, 2015 into the date field.
