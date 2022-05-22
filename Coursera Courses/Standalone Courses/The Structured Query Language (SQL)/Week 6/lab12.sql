--1. Check to make sure that your ‘view’ from Lab 11 is available and ready to use.

SELECT * 
  FROM "your_bit.io_account/demo_repo"."TopCustomers";

--2. Let’s drop and recreate your view from Lab 11, adding a CASE expression.

DROP VIEW "your_bit.io_account/demo_repo"."TopCustomers";

CREATE VIEW "your_bit.io_account/demo_repo"."TopCustomers" AS 
  SELECT 
      companyname, 
      sum(unitprice * quantity) AS "Total Sales",
    CASE  
      WHEN sum(unitprice * quantity) < 60000 THEN 'NeedsFocus'
      WHEN sum(unitprice * quantity) < 110000 THEN 'Average'
      ELSE 'Outstanding'
    END Assessment

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

--3. Run a Query Against Your View to see the CASE results

SELECT * 
  FROM "your_bit.io_account/demo_repo"."TopCustomers";
