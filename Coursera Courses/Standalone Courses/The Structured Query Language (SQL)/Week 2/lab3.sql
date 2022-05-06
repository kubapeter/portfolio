--2.1 List the employeeid, firstname + lastname concatenated as ‘employee’, 
--and the age of the employee when they were hired. 

SELECT employeeid, firstname || ' ' || lastname AS "employee",
    age(hiredate, birthdate)::text
  FROM "alanparadise/nw"."employees"

--or

SELECT EmployeeID, Firstname || ' ' || Lastname as "employee",
		cast (age(HireDate, BirthDate)as text) AS HIRE_AGE 
   	FROM "alanparadise/nw"."employees";

--2.2 Run a query to calculate your age as of today.  

SELECT age(now(), '19770701')::text

--or

SELECT CAST(age(now(),'2010-09-08')AS text);

--2.3 List the customerid, companyname and country 
--for all customers whose region is NULL.    

SELECT customerid, companyname, country 
  FROM "alanparadise/nw"."customers"
  WHERE region IS NULL
