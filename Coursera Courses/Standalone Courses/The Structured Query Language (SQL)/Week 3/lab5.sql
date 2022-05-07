2.1 List the productid, productname, unitprice of the lowest priced product Northwinds sells.   

SELECT productid, productname, unitprice
  FROM "alanparadise/nw"."products"
  WHERE unitprice = (
    SELECT MIN(unitprice)
    FROM "alanparadise/nw"."products"
  )

--actually does not need subquery:

SELECT productid, productname, unitprice
  FROM "alanparadise/nw"."products"
  ORDER BY unitprice LIMIT 1

2.2 How many orders in the orders table have a bad customerID (either missing or not on file in the customers table.)     

SELECT COUNT(orderid)
  FROM "alanparadise/nw"."orders"
  WHERE customerid NOT IN (
    SELECT customerID 
      FROM "alanparadise/nw"."customers"
  )

2.3 Use a subquery in a SELECT to list something interesting.   

2.4 Use a subquery in a FROM to list something interesting.  
