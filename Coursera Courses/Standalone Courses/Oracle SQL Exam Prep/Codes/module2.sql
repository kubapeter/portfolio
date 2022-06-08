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
