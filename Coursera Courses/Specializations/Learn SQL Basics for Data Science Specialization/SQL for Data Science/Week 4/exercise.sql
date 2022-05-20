-- 1. Pull a list of customer ids with the customer’s full name, and address, 
-- along with combining their city and country together. 
-- Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)

SELECT 
    customerID, 
    FirstName || ' ' ||LastName, 
    Address, 
    UPPER(City || ' ' || Country)
  FROM Customers


-- 2. Create a new employee user id by combining the first 4 letters of the employee’s first name 
-- with the first 2 letters of the employee’s last name. Make the new field lower case 
-- and pull each individual step to show your work.

SELECT 
    FirstName, 
    LastName, 
    LOWER(SUBSTR(FirstName,1,4) || SUBSTR(LastName,1,2)) AS newEmpID
  FROM employees
  
  
-- 3. Show a list of employees who have worked for the company for 15 or more years 
-- using the current date function. Sort by lastname ascending.

SELECT 
    LastName, 
    HireDate, 
    STRFTIME('%Y %m %d', HireDate) AS HireYMD, 
    STRFTIME('%Y %m %d', 'now') AS NowYMD, 
    DATE(STRFTIME('%Y %m %d', 'now') - STRFTIME('%Y %m %d', HireDate)) AS Years
  FROM employees
  ORDER BY LastName
  
  
-- 4. Profiling the Customers table, answer the following question.
-- Are there any columns with null values?

SELECT 
    COUNT(*),
    COUNT(*) - COUNT(CustomerId),
    COUNT(*) - COUNT(FirstName),
    COUNT(*) - COUNT(LastName),
    COUNT(*) - COUNT(Company),
    COUNT(*) - COUNT(Address),
    COUNT(*) - COUNT(City),
    COUNT(*) - COUNT(State),
    COUNT(*) - COUNT(Country),
    COUNT(*) - COUNT(PostalCode),
    COUNT(*) - COUNT(Phone),
    COUNT(*) - COUNT(Fax),
    COUNT(*) - COUNT(Email),
    COUNT(*) - COUNT(SupportRepId)
  FROM Customers
  
  
-- 5. Find the cities with the most customers and rank in descending order. 
-- Which of the following cities indicate having 2 customers?
  
SELECT 
    City, 
    COUNT(CustomerID)
  FROM customers
  GROUP BY City
    HAVING COUNT(CustomerID) == 2


-- 6. Create a new customer invoice id by combining a customer’s invoice id with their first and last name 
-- while ordering your query in the following order: firstname, lastname, and invoiceID.
-- Select all of the correct "AstridGruber" entries that are returned in your results below. 

SELECT
    i.invoiceid, 
    c.firstname, 
    c.lastname, 
    c.firstname||c.lastname||i.invoiceid AS newinvoiceID
  FROM 
    Customers c 
      INNER JOIN 
    Invoices i 
      ON c.customerID = i.customerID
  WHERE newinvoiceID LIKE 'AstridGruber%'
