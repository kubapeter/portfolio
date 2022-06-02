-- 0. Count how many users we have

SELECT COUNT(*)
  FROM dsv1069.users


-- 1. Find out how many users have ever ordered

SELECT 
    COUNT(DISTINCT user_id) AS users_with_orders
  FROM dsv1069.orders
  

-- 2. Find how many users have reordered the same item

-- How many orders per user?

SELECT 
    user_id,
    item_id,
    COUNT(DISTINCT line_item_id) AS times_user_ordered
  FROM dsv1069.orders
  GROUP BY
    user_id,
    item_id

--  So this will be a subquery

SELECT 
    COUNT(DISTINCT user_id) AS users_who_reordered
  FROM 
    (
    SELECT 
        user_id,
        item_id,
        COUNT(DISTINCT line_item_id) AS times_user_ordered
      FROM dsv1069.orders
      GROUP BY
        user_id,
        item_id  
    ) user_level_orders
  WHERE times_user_ordered > 1


-- 3. Do users even order more than once?

-- How many invoices per user?

SELECT 
    user_id,
    COUNT(DISTINCT invoice_id) AS order_count 
  FROM dsv1069.orders
  GROUP BY
    user_id 

--  This will be a subquery like before

SELECT 
    COUNT(DISTINCT user_id) 
  FROM 
    (
    SELECT 
        user_id,
        COUNT(DISTINCT invoice_id) AS order_count 
      FROM dsv1069.orders
      GROUP BY
        user_id
    ) user_level
  WHERE order_count > 1
  

-- 4. Orders per item

SELECT 
    item_id,
    COUNT(line_item_id) AS times_ordered
  FROM dsv1069.orders
  GROUP BY item_id


-- 5. Orders per category

SELECT 
    item_category,
    COUNT(line_item_id) AS times_ordered
  FROM dsv1069.orders
  GROUP BY item_category


-- 6. Do user order multiple things from the same category?

SELECT 
    item_category,
    AVG(times_category_ordered) AS avg_times_category_ordered
  FROM 
    (
    SELECT 
        user_id,
        item_category,
        COUNT(DISTINCT line_item_id) AS times_category_ordered
      FROM dsv1069.orders
      GROUP BY 
        user_id,
        item_category
    ) user_level
  GROUP BY item_category


-- 7. Find the average time between orders. Decide if this analysis is necessary. 

SELECT
    first_orders.user_id,
    DATE(first_orders.paid_at)   AS first_order_date, 
    DATE(second_orders.paid_at)  AS second_order_date, 
    DATE(second_orders.paid_at) - DATE(first_orders.paid_at)  AS date_diff 
  FROM
    (
    SELECT 
        user_id,
        invoice_id,
        paid_at,
        DENSE_RANK( ) OVER 
          (
          PARTITION BY user_id
          ORDER BY paid_at ASC
          ) AS order_num
      FROM dsv1069.orders      
    ) AS first_orders
      JOIN
    (
    SELECT 
        user_id,
        invoice_id,
        paid_at,
        DENSE_RANK( ) OVER 
          (
          PARTITION BY user_id
          ORDER BY paid_at ASC
          ) AS order_num
      FROM dsv1069.orders      
    ) AS second_orders
      ON first_orders.user_id = second_orders.user_id
  WHERE 
    first_orders.order_num = 1
    AND
    second_orders.order_num = 2

-- Actually these are only the times between the first and the second order and not the time between orders in general.
