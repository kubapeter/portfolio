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
