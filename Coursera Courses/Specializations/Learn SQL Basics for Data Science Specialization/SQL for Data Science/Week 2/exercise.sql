--For all the questions in this practice set, you will be using the Salary by Job Range Table. This is a
--single table titled: salary_range_by_job_classification. This table contains the
--following columns:
--    SetID
--    Job_Code 
--    Eff_Date 
--    Sal_End_Date 
--    Salary_setID 
--    Sal_Plan 
--    Grade 
--    Step 
--    Biweekly_High_Rate 
--    Biweekly_Low_Rate 
--    Union_Code 
--    Extended_Step 
--    Pay_Type
    

-- 2. Find the distinct values for the extended step. 

SELECT DISTINCT Extended_step
  FROM salary_range_by_job_classification


-- 3. Excluding $0.00, what is the minimum bi-weekly high rate of pay (please include the dollar sign and decimal point in your answer)? 

SELECT MIN(Biweekly_high_Rate)
  FROM salary_range_by_job_classification 
  WHERE biweekly_high_rate <> '$0.00'


-- 4. What is the maximum biweekly high rate of pay (please include the dollar sign and decimal point in your answer)?

SELECT MAX(Biweekly_high_Rate) 
  FROM salary_range_by_job_classification 


-- 5. What is the pay type for all the job codes that start with '03'?

SELECT job_code, pay_type
  FROM salary_range_by_job_classification
  WHERE job_code LIKE '03%'


-- 6. Run a query to find the Effective Date (eff_date) or Salary End Date(sal_end_date) for grade Q90H0.

SELECT
    grade,
    eff_date,
    sal_end_date
  FROM salary_range_by_job_classification
  WHERE grade = 'Q90H0'


-- 7. Sort the Biweekly low rate in ascending order.

SELECT biweekly_low_rate
  FROM salary_range_by_job_classification
  ORDER BY biweekly_low_rate ASC

-- Are these values properly sorted? 
-- No, because this is a varchar field. 


-- 8. What Step are Job Codes 0110-0400?

SELECT 
    Job_Code,
    Salary_setID,
    Step
  FROM salary_range_by_job_classification
  WHERE Job_Code BETWEEN "0110" AND "0400"
  
  
-- 9. What is the Biweekly High Rate minus the Biweekly Low Rate for job Code 0170?  
  
SELECT
    Job_code,
    Biweekly_high_rate,
    Biweekly_low_rate, 
    (biweekly_high_rate - Biweekly_low_rate) AS calc
  FROM salary_range_by_job_classification
  WHERE Job_code = '0170'  
  

-- 10. What is the Extended Step for Pay Types M, H, and D?
  
SELECT Extended_step, Pay_Type
  FROM salary_range_by_job_classification
  WHERE Pay_Type IN ('M', 'H', 'D')


-- 11. What is the step for Union Code 990 and a Set ID of SFMTA or COMMN?

SELECT 
    Union_code,
    SetID,
    Step
  FROM salary_range_by_job_classification
  WHERE 
    Union_code = 990 
    AND 
    (SetID = 'SFMTA' OR SetID = 'COMMN')
