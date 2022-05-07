--2.1 List the productid, productname, unitprice 
--of the lowest priced product Northwinds sells.   

SELECT productid, productname, unitprice
  FROM "alanparadise/nw"."products"
  WHERE unitprice = 
    (
      SELECT MIN(unitprice)
      FROM "alanparadise/nw"."products"
    )

--actually does not need subquery:

SELECT productid, productname, unitprice
  FROM "alanparadise/nw"."products"
  ORDER BY unitprice LIMIT 1

--2.2 How many orders in the orders table have a bad customerID 
--(either missing or not on file in the customers table.)     

SELECT COUNT(orderid)
  FROM "alanparadise/nw"."orders"
  WHERE customerid NOT IN 
    (
      SELECT customerID 
        FROM "alanparadise/nw"."customers"
    )

--2.3 Use a subquery in a SELECT to list something interesting.  

SELECT productname, 
    (
      SELECT to_char(sum(Unitprice*Unitsinstock),'999,999.99') AS TotalValue 
        FROM "alanparadise/nw"."products"
    )
  FROM "alanparadise/nw"."products";   
  
--(total value of each product stocked by the company)


--2.4 Use a subquery in a FROM to list something interesting.  

SELECT 
    orderid,
    ROUND(CAST(sum(total_cost) AS numeric), 2) total_value,
    TRUNC(sum(discount) * 100) total_discounts
FROM
  (
      SELECT  orderid, (quantity*unitprice) total_cost, discount
        FROM "alanparadise/nw"."orderdetails"
        WHERE discount IN 
          (
            SELECT discount 
              FROM "alanparadise/nw"."orderdetails"
              GROUP BY discount
              ORDER BY 1 DESC LIMIT 2
          )
  ) AS a
GROUP BY orderid
ORDER BY 3 DESC;

--orders with large amount of discounts
