--2.1 Are there any Northwinds employees that have no orders?    

SELECT DISTINCT E.employeeid, O.employeeid
  FROM 
    "alanparadise/nw"."employees" E
    LEFT OUTER JOIN
    "alanparadise/nw"."orders" O
    ON
    E.employeeid = O.employeeid
  WHERE O.employeeid IS NULL
  ORDER BY 1

--returns empty table so there is no employee who has no orders

--or

SELECT 
    E.employeeid, 
    lastname, 
    firstname, 
    count(orderid)
  FROM 
    "alanparadise/nw"."employees" E  
    LEFT OUTER JOIN
    "alanparadise/nw"."orders" O 
    ON
    E.employeeid = O.employeeid 
  GROUP BY E.employeeid, lastname, firstname
  ORDER BY E.employeeid;

--the count is not 0 in any of the rows


--2.2 Are there any Northwinds customers that have no orders?     

SELECT DISTINCT Cus.customerid, O.employeeid
  FROM 
    "alanparadise/nw"."customers" Cus
    LEFT OUTER JOIN
    "alanparadise/nw"."orders" O
    ON
    Cus.customerid = O.customerid
  WHERE O.customerid IS NULL
  ORDER BY 1

--returns 3 customer ids

--or

SELECT 
    C.customerid, 
    companyname, 
    count(orderid)
  FROM 
    "alanparadise/nw"."customers" C  
    LEFT OUTER JOIN
    "alanparadise/nw"."orders" O  
    ON
    C.customerid = O.customerid 
  GROUP BY C.customerid, companyname
  HAVING count(orderid) = 0;
  
--returns the same 3 customer ids


--2.3 Are there any Northwinds orders that have bad (not on file) customer numbers? 

SELECT DISTINCT Cus.customerid, O.customerid
  FROM 
    "alanparadise/nw"."customers" Cus
    RIGHT OUTER JOIN
    "alanparadise/nw"."orders" O
    ON
    Cus.customerid = O.customerid
  WHERE Cus.customerid IS NULL
  ORDER BY 1

--returns 4 customer ids

--or

SELECT DISTINCT O.customerid, count(orderid)
  FROM 
    "alanparadise/nw"."orders" O 
    LEFT OUTER JOIN
    "alanparadise/nw"."customers" C 
    ON
    C.customerid = O.customerid 
  WHERE C.customerid is NULL
  GROUP BY O.customerid;

--returns the same 4 customer ids

--2.4 Are there any Shippers that have shipped no Northwinds orders?  

SELECT DISTINCT SH.shipperid, companyname, shipvia
  FROM 
    "alanparadise/nw"."shippers" SH
    LEFT OUTER JOIN
    "alanparadise/nw"."orders" O
    ON
    SH.shipperid = O.shipvia
  WHERE shipvia IS NULL
    
--returns empty table, so the answer is NO

--or

SELECT S.shipperid, companyname, count(orderid)
  FROM 
    "alanparadise/nw"."shippers" S 
    LEFT OUTER JOIN
    "alanparadise/nw"."orders" O 
    ON
    S.shipperid = O.shipvia 
  GROUP BY S.shipperid, companyname;

--no zero in count column se the answer is NO
