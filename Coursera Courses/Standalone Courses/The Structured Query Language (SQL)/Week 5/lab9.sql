--1. Check to make sure that your ‘items’ table from Lab 8 is available and full of data

SELECT * 
  FROM "anon_UnmatchedEloquentClimate/demo_repo"."items"

--2. Change the name of the ‘items’ table to ‘demo’

ALTER TABLE "anon_UnmatchedEloquentClimate/demo_repo"."items" 
  RENAME TO "alters"

--3. Change the name of the ‘itemcode’ column to ‘itemclass’  

ALTER TABLE "anon_UnmatchedEloquentClimate/demo_repo"."demo" 
  RENAME COLUMN "itemcode" TO "itemclass"

--4. Add a new column ‘iteminfo’ to your ‘demo’ table  

ALTER TABLE "anon_UnmatchedEloquentClimate/demo_repo"."demo" 
  ADD COLUMN "iteminfo" varchar(5)

--5. Add some data to your new column, copying the values from the itemclass column

UPDATE "anon_UnmatchedEloquentClimate/demo_repo"."demo" 
  SET "iteminfo" = "itemclass"

--6.  Take another look at your ALTERed table 

SELECT * FROM "anon_UnmatchedEloquentClimate/demo_repo"."demo" 
