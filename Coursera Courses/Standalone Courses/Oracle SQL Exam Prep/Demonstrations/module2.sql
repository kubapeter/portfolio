-- ROLLBACK/COMMIT demonstration

SELECT * 
  FROM employees;
  
  -- we see the employees
  
INSERT INTO employees 
  VALUES (4, 'John Williams', 3);
  
SELECT * 
  FROM employees;
  
  -- we see the change
  
ROLLBACK;

SELECT * 
  FROM employees;
  
  -- now John Williams is not in the Table (was not COMMITted)


INSERT INTO employees 
  VALUES (4, 'Norah Jones', 3);
  
COMMIT; 

  -- From now on, ROLLBACK only goes back here, the last COMMIT


-- CTAS demonstration (create table as select)

CREATE TABLE emp2 AS 
  SELECT *
    FROM employees;
    
  -- a way to generate empty schema: 
  
  CREATE TABLE emp2 AS 
  SELECT *
    FROM employees 
    WHERE 1 = 2;
    
    
    
-- PSEUDOCOLUMN demonstration

SELECT rowid, 
       empID, 
       empName
  FROM employees; 
  
  -- no error message even though there is no defined rowid column (it is a pseudocolumn)
    
    
