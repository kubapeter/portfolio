--1. List the names of the cities 
--in alphabetical order 
--where Classic Models has offices. (7)

SELECT city
  FROM "alanparadise/cm"."offices"
  ORDER BY city

--2. List the EmployeeNumber, LastName, FirstName, Extension 
--for all employees 
--working out of the Paris office. (5)  

SELECT employeenumber, lastname, firstname, extension
  FROM 
    "alanparadise/cm"."employees" E
    JOIN
    "alanparadise/cm"."offices" O
    ON E.officecode = O.officecode
  WHERE O.city = 'Paris'

--3. List the ProductCode, ProductName, ProductVendor, QuantityInStock and ProductLine 
--for all products 
--with a QuantityInStock between 200 and 1200. (11) 

SELECT 
    productcode, 
    productname, 
    productvendor, 
    quantityinstock, 
    productline
  FROM "alanparadise/cm"."products" 
  WHERE quantityinstock BETWEEN 200 AND 1200

--4. (Use a SUBQUERY) List the ProductCode, ProductName, ProductVendor, BuyPrice and MSRP 
--for the least expensive (lowest MSRP) product 
--sold by ClassicModels.  (“MSRP” is the Manufacturer’s Suggested Retail Price.)  (1)    

SELECT 
    productcode, 
    productname, 
    productvendor, 
    buyprice, 
    msrp 
  FROM "alanparadise/cm"."products" 
  WHERE msrp = 
    (
      SELECT MIN(msrp)
        FROM "alanparadise/cm"."products"
    )

--5. What is the ProductName and Profit 
--of the product that has the highest profit 
--(profit = MSRP minus BuyPrice). (1)   

SELECT productname, (msrp - buyprice) AS profit
  FROM "alanparadise/cm"."products" 
  ORDER BY profit DESC LIMIT 1

--6. List the country and the number of customers from that country 
--for all countries having just two customers. 
--List the countries sorted in ascending alphabetical order. 
--Title the column heading for the count of customers as “Customers”. (7)   

SELECT country, COUNT(customernumber) AS "Customers"
  FROM "alanparadise/cm"."Customers"
  GROUP BY country
    HAVING COUNT(customernumber) = 2
  ORDER BY country

--7. List the ProductCode, ProductName, and number of orders 
--for the products with exactly 25 orders. 
--Title the column heading for the count of orders as “OrderCount”.  (12)  

SELECT 
    PR.productcode, 
    productname, 
    COUNT(ordernumber) AS "Order Count"
  FROM
    "alanparadise/cm"."products" PR
    JOIN 
    "alanparadise/cm"."orderdetails" OD
    ON PR.productcode = OD.productcode     
  GROUP BY PR.productcode, productname 
    HAVING COUNT(ordernumber) = 25;

--8. List the EmployeeNumber, Firstname + Lastname  
--(concatenated into one column in the answer set, separated by a blank and referred to as ‘name’) 
--for all the employees 
--reporting to Diane Murphy or Gerard Bondur. (8)  

SELECT 
    E.employeenumber, 
    E.firstname || ' ' || E.lastname AS "name"
  FROM
    "alanparadise/cm"."employees" E
    JOIN 
    "alanparadise/cm"."employees" R
    ON E.reportsto = R.employeenumber
  WHERE 
    (R.firstname = 'Diane' AND R.lastname = 'Murphy')
    OR
    (R.firstname = 'Gerard' AND R.lastname = 'Bondur')

--or

SELECT 
    employeenumber, 
    CONCAT(firstname,' ',lastname) AS name 
  FROM "alanparadise/cm"."employees" 
  WHERE reportsto IN ('1002', '1102');

--9. List the EmployeeNumber, LastName, FirstName of 
--the president of the company (the one employee with no boss.)  (1)  

SELECT 
    employeenumber, 
    lastname, 
    firstname
  FROM "alanparadise/cm"."employees" 
  WHERE reportsto IS NULL

--10. List the ProductName for all products 
--in the “Classic Cars” product line from the 1950’s.  (6)

SELECT 
    productname
  FROM "alanparadise/cm"."products" 
  WHERE 
    productline = 'Classic Cars' 
    AND 
    productname LIKE '195%' 

--11. List the month name and the total number of orders 
--for the month in 2004 
--in which ClassicModels customers placed the most orders. (1)  

SELECT 
    TO_CHAR(orderdate :: DATE, 'Month') AS "Name of month",
    COUNT(*) AS "Total number of orders"
  FROM "alanparadise/cm"."orders" 
  WHERE orderdate LIKE '2004%'
  GROUP BY TO_CHAR(orderdate :: DATE, 'Month')
  ORDER BY COUNT(*) DESC LIMIT 1

--12. List the firstname, lastname of employees 
--who are Sales Reps who have no assigned customers.  (2) 

SELECT firstname, lastname 
  FROM 
    "alanparadise/cm"."employees" E
    LEFT OUTER JOIN
    "alanparadise/cm"."Customers" CUS
    ON E.employeenumber = CUS.salesrepemployeenumber
  WHERE 
    jobtitle = 'Sales Rep' 
    AND 
    customernumber IS NULL

--13. List the customername of customers 
--from Switzerland with no orders. (2)  

SELECT customername, ordernumber
  FROM 
    "alanparadise/cm"."Customers" CUS
    LEFT OUTER JOIN
    "alanparadise/cm"."orders" O
    ON CUS.customernumber = O.customernumber
  WHERE country = 'Switzerland' AND ordernumber IS NULL

--14. List the customername and total quantity of products ordered 
--for customers who have ordered more than 1650 products across all their orders.  (8) 

SELECT customername, SUM(quantityordered) AS totalq 
  FROM 
    "alanparadise/cm"."Customers" CUS  
    JOIN 
    "alanparadise/cm"."orders" O 
    ON CUS.customernumber = O.customernumber 
    JOIN "alanparadise/cm"."orderdetails" D 
    ON O.ordernumber = D.ordernumber 
GROUP BY customername  
HAVING SUM(quantityordered) > 1650;

--15. Create a NEW table named “TopCustomers” with three columns: 
--CustomerNumber (integer), 
--ContactDate (DATE) and 
--OrderTotal (a real number.)  None of these columns can be NULL.  

CREATE TABLE IF NOT EXISTS TopCustomers ( 
  Customernumber int NOT NULL,  
  ContactDate DATE NOT NULL, 
  OrderTotal decimal(9,2) NOT NULL DEFAULT 0, constraint PKTopCustomers primary key (CustomerNumber) 
 );

--16. Populate the new table “TopCustomers” with 
--the CustomerNumber, today’s date, and the total value of all their orders 
--(PriceEach * quantityOrdered) 
--for those customers whose order total value is greater than $140,000. 
--(should insert 10 rows )  

INSERT INTO TopCustomers 
  SELECT 
    c.customernumber, 
    CURRENT_date,
    SUM(priceEach * Quantityordered) 
  FROM Customers c, Orders o,OrderDetails d
  WHERE 
    c.Customernumber = o.Customernumber  
    AND 
    o.Ordernumber = d.Ordernumber 
  GROUP BY c.Customernumber 
    HAVING SUM(priceEach * Quantityordered) > 140000;

--17. List the contents of the TopCustomers table 
--in descending OrderTotal sequence. (10) 

SELECT * FROM topcustomers ORDER BY 3 DESC; 

--18. Add a new column to the TopCustomers table called OrderCount (integer).

ALTER TABLE topcustomers 
  ADD COLUMN OrderCount integer ; 

--19. Update the Top Customers table, 
--setting the OrderCount to a random number between 1 and 10. 
--Hint: use (RANDOM() *10)

UPDATE topcustomers 
  SET ordercount = floor((rand()*18));

--20. List the contents of the TopCustomers table 
--in descending OrderCount sequence. (10 rows)

SELECT * 
  FROM topcustomers 
  ORDER BY 4 DESC;

--21. Drop the TopCustomers table. (no answer set)  

DROP TABLE topcustomers; 
