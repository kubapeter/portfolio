--2.1 List each order and its Total Value (unitprice * quantity) for all orders shipping into France in descending Total Value order.  

SELECT O.orderid, SUM(unitprice * quantity) AS "Total Value"
  FROM 
    "alanparadise/nw"."orders" AS O 
    JOIN
    "alanparadise/nw"."orderdetails" AS OD
    ON O.orderid = OD.orderid
  WHERE shipcountry = 'France'
  GROUP BY O.orderid
  ORDER BY 2 DESC

--2.2 Create a Suppliers List showing Supplier CompanyName, and names of all the products sold by each supplier located in Japan.   

SELECT Supp.supplierid, companyname, productname
  FROM 
    "alanparadise/nw"."products" AS Prod 
    JOIN
    "alanparadise/nw"."suppliers" AS Supp
    ON Prod.supplierid = Supp.supplierid
  WHERE country = 'Japan'

--2.3 Create a “Low Performers” list showing 
--the employees who have less than $100,000 in total sales. 
--List the employee’s LastName, FirstName 
--followed by their total sales volume 
--(the total dollar value of their orders.)

SELECT LastName, Firstname, SUM(unitprice * quantity) as "Total Sales"
  FROM 
    "alanparadise/nw"."employees" E 
    JOIN
    "alanparadise/nw"."orders" O 
    ON E.employeeid  =  O.employeeid
    JOIN 
    "alanparadise/nw"."orderdetails" D 
    ON O.orderid  =  D.orderid
  GROUP BY LastName, FirstName
    HAVING  sum(unitprice * quantity) < 100000
