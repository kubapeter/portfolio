--1. Create an “items” table with the following schema [...]

CREATE TABLE "anon_UnmatchedEloquentClimate/demo_repo"."items" 
( 
    itemID     INT         NOT NULL ,
    itemcode   VARCHAR(5)  NULL,
    itemname   VARCHAR(40) NOT NULL DEFAULT ' ',
    quantity   INT         NOT NULL DEFAULT 0,
    price      REAL	    NOT NULL DEFAULT 0
)

--2. Populate your new table with data from the Products table, 
--consisting of productid, concat(supplierid, categoryid, discontinued), 
--productname, unitsinstock, unitprice 

INSERT INTO "anon_UnmatchedEloquentClimate/demo_repo"."items"
(
  SELECT 
    productid, 
    concat(supplierid, categoryid, discontinued), 
    productname, 
    unitsinstock, 
    unitprice 
  FROM "alanparadise/nw"."products"
)
  
  --3. Verify that your table was created and populated successfully
  
  SELECT * 
    FROM "anon_UnmatchedEloquentClimate/demo_repo"."items"
