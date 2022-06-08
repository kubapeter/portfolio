-- VIEW demonstration

CREATE VIEW vwEmpInfo AS
  SELECT empName, 
         deptName
    FROM employees a, 
         depts b
    WHERE a.deptId = b.deptId;

SELECT * 
  FROM vwEmpInfo;
  
  -- changes can ce seen
  
INSERT INTO employees 
  VALUES ('Lawrence Adams', 1)
  
SELECT * 
  FROM vwEmpInfo;
  
  -- Lawrence can be seen in the view 
  
  
-- MATERIALIZED VIEW demonstration  
  
CREATE MATERIALIZED VIEW mvEmpInfo AS
  SELECT empName, 
         deptName
    FROM employees a, 
         depts b
    WHERE a.deptId = b.deptId;
    
SELECT * 
  FROM mvEmpInfo;
  
  --looks the same as vwEmpInfo
  
INSERT INTO employees 
  VALUES ('Amber Smith', 2)
  
SELECT * 
  FROM mvEmpInfo;
  
  -- Amber is not seen on this. mv is a snapshot in time.
  
