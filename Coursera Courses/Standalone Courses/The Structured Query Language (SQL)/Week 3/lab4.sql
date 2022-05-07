--2.1 List the total (unitprice * quantity) as “Total Value”  by orderid for the top 5 orders.  (That is, the five orders with the highest Total Value.)  

SELECT orderid, (unitprice * quantity) as "Total Value"
  FROM "alanparadise/nw"."orderdetails"
  ORDER BY (unitprice * quantity) DESC

--2.2 How many products does Northwinds have in inventory?    

SELECT SUM(unitsinstock) 
  FROM "alanparadise/nw"."products";

--2.3 How many products are out of stock? 

--2.4 From which supplier(s) does Northwinds carry the fewest products? 

SELECT supplierid, count(productid) 
  FROM "alanparadise/nw"."products"
  GROUP BY supplierid
  ORDER BY count(productid) 

--2.5 Which Northwinds employees (just show their employeeid) had over 100 orders ?  

SELECT employeeid, COUNT(orderid)
  FROM "alanparadise/nw"."orders"
  GROUP BY employeeid
  HAVING COUNT(orderid) > 100
