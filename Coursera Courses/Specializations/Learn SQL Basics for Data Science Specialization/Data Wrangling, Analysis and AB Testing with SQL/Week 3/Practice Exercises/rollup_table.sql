-- 1. Create a subtable of orders per day. Make sure you decide whether you are counting invoices or line items.

SELECT 
    DATE(paid_at)                AS day, 
    COUNT(DISTINCT invoice_id)   AS orders,
    COUNT(DISTINCT line_item_id) AS line_items  -- because there may be more than one items in one invoice 
  FROM dsv1069.orders
  GROUP BY DATE(paid_at)

-- That is fine. We can see that for some days there are no orders at all. 


-- 2. “Check your joins.” We are still trying to count orders per day. 
-- In this step join the sub table from the previous exercise to the dates rollup table so we can get a row for every date. 
-- Check that the join works by just running a “select *” query

SELECT * 
  FROM 
    dsv1069.dates_rollup
      LEFT OUTER JOIN
    (
    SELECT 
        DATE(paid_at)                AS day, 
        COUNT(DISTINCT invoice_id)   AS orders,
        COUNT(DISTINCT line_item_id) AS items_ordered  
      FROM dsv1069.orders
      GROUP BY DATE(paid_at)    
    ) AS daily_orders
      ON daily_orders.day = dates_rollup.date


-- 3. “Clean up your Columns.” In this step be sure to specify the columns you actually want to return, 
-- and if necessary do any aggregation needed to get a count of the orders made per day.

SELECT 
    dates_rollup.date, 
    COALESCE(SUM(orders), 0)        AS orders, 
    COALESCE(SUM(items_ordered), 0) AS items_ordered
  FROM 
    dsv1069.dates_rollup
      LEFT OUTER JOIN
    (
    SELECT 
        DATE(paid_at)                AS day, 
        COUNT(DISTINCT invoice_id)   AS orders,
        COUNT(DISTINCT line_item_id) AS items_ordered  
      FROM dsv1069.orders
      GROUP BY DATE(paid_at)    
    ) AS daily_orders
      ON daily_orders.day = dates_rollup.date
  GROUP BY dates_rollup.date


-- 4. "Weekly Rollup." Figure out which parts of the JOIN condition need to be edited to create 7 day rolling orders table.
-- 5. "Column Cleanup." Finish creating the weekly rolling orders table, by performing any aggregation steps and naming your columns appropriately.

SELECT 
    dates_rollup.date, 
    COALESCE(SUM(orders), 0)        AS orders, 
    COALESCE(SUM(items_ordered), 0) AS items_ordered
  FROM 
    dsv1069.dates_rollup
      LEFT OUTER JOIN
    (
    SELECT 
        DATE(paid_at)                AS day, 
        COUNT(DISTINCT invoice_id)   AS orders,
        COUNT(DISTINCT line_item_id) AS items_ordered  
      FROM dsv1069.orders
      GROUP BY DATE(paid_at)    
    ) AS daily_orders
      ON 
        dates_rollup.date >= daily_orders.day
        AND
        dates_rollup.d7_ago < daily_orders.day
  GROUP BY dates_rollup.date
