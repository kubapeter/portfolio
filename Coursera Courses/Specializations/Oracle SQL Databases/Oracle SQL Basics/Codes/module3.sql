-- Setup

CREATE TABLE CustomerInfo
(
  custID int,
  custName varchar2(20)
);

-- Let's take a look

DESCRIBE CustomerInfo;

-- Now create an index on custName (index will have the same name)

CREATE INDEX custName
  ON CustomerInfo(custName);
  
-- We see no change in the schema

DESCRIBE CustomerInfo;

-- To see the created index

SELECT index_name
  FROM all_indexes
  WHERE table_name = 'CUSTOMERINFO';  -- all upper case is important
  
-- To see what column the created index is on

SELECT index_name,
       column_name
  FROM all_ind_columns
  WHERE table_name = 'CUSTOMERINFO'; 
  
-- Let's create another index for the custID

CREATE INDEX custIDIndex
  ON CustomerInfo(custID);
  
-- Now we can see the different column and index names

SELECT index_name,
       column_name
  FROM all_ind_columns
  WHERE table_name = 'CUSTOMERINFO'; 


-- Setup

CREATE TABLE UserInfo
(
  userID int,
  userName varchar2(20)
);

-- There are no indexes. See what happens at a where clause

EXPLAIN PLAN FOR
SELECT userID,
       userName
  FROM UserInfo
  WHERE userName = 'adam';
  
SELECT * 
  FROM TABLE(dbms_xplan.display);
-- We can see that there will be a full search (TABLE ACCESS FULL)

-- What if we had an index? 

CREATE INDEX userName
  ON CustomerInfo(userName);
  
SELECT userID,
       userName
  FROM UserInfo
  WHERE userName = 'adam';
  
SELECT * 
  FROM TABLE(dbms_xplan.display);
-- Now the scan will not go through the whole table

-- Setup

DROP TABLE UserInfo;

CREATE TABLE UserInfo
(
  id int,
  last_name varchar(20),
  first_name varchar(20),
  gender char(1)
);

-- Create a composite index

CREATE INDEX index_full_name
  ON UserInfo (last_name, first_name);
