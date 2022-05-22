--1. Create a View

CREATE VIEW "your_bit.io_account/demo_repo"."TopCustomers" AS 
  SELECT companyname, sum(unitprice * quantity) AS "Total Sales"
    FROM 
      "alanparadise/nw"."customers" C 
        JOIN
      "alanparadise/nw"."orders" O 
        ON C.customerid  =  O.customerid 
        JOIN 
      "alanparadise/nw"."orderdetails" D 
        ON O.orderid  =  D.orderid
    GROUP BY companyname 
    ORDER BY 2 DESC LIMIT 5;

--2. Run a Query Against Your View

SELECT * 
  FROM "your_bit.io_account/demo_repo"."TopCustomers";
