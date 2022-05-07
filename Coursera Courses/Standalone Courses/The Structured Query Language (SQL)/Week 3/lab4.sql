--2.1 List the total (unitprice * quantity) as “Total Value” 
--by orderid for the top 5 orders.  
--(That is, the five orders with the highest Total Value.)  

SELECT OrderID, 
		SUM(UnitPrice * Quantity) AS "Total Value" 
	    FROM "alanparadise/nw"."orderdetails"
	GROUP BY OrderID
	ORDER BY 2 DESC LIMIT 5;

--2.2 How many products does Northwinds have in inventory?    

SELECT count(productid) 
	FROM "alanparadise/nw"."products"
	WHERE unitsinstock > 0;

--2.3 How many products are out of stock? 

SELECT count(productid) 
	FROM "alanparadise/nw"."products"
  WHERE unitsinstock = 0;

--2.4 From which supplier(s) does Northwinds carry the fewest products? 

SELECT supplierid, count(productid) 
    FROM "alanparadise/nw"."products"
  GROUP BY supplierid
  ORDER BY count(productid) 

--2.5 Which Northwinds employees (just show their employeeid) had over 100 orders ?  

SELECT employeeid, count(orderid) AS "Orders" 
    FROM "alanparadise/nw"."orders"
  GROUP BY employeeid
  HAVING count(orderid) > 100
  ORDER BY 2 desc;
