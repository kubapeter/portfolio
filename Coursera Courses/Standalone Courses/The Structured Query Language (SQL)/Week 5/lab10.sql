--1. Check to make sure that your ‘demo’ table from Lab 9 is available and full of data 

SELECT * 
  FROM "anon_UnmatchedEloquentClimate/demo_repo"."demo";

--2. Insert a new row of data into your "demo" table (INSERT format 1)  

INSERT INTO "anon_UnmatchedEloquentClimate/demo_repo"."demo" 
  (itemID, itemname, quantity, price, itemclass, iteminfo)
  VALUES
    (100, 'This is an item', 12, 11.05, '234', '123');

--3. Insert a new row of data into your "demo" table (INSERT format 2)  

INSERT INTO "anon_UnmatchedEloquentClimate/demo_repo"."demo" 
  VALUES
    (101, '001', 'This is an item too', 120, 7.25, '001');

--4. Update some data  

UPDATE "anon_UnmatchedEloquentClimate/demo_repo"."demo" 
  SET itemname = 'new name'
  WHERE itemID = 43;

--5.  Take another look at your updated table 

SELECT * 
  FROM "anon_UnmatchedEloquentClimate/demo_repo"."demo";

--6. Delete the rows you just added  

DELETE FROM "anon_UnmatchedEloquentClimate/demo_repo"."demo" 
  WHERE itemID >= 100;
  
--7. Drop the “demo” table

DROP TABLE "anon_UnmatchedEloquentClimate/demo_repo"."demo";
