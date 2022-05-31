-- 1. Using any methods you like determine if you can you trust this events table.
-- Starter Code:

SELECT *
  FROM dsv1069.events_201701
  

-- 2. Using any methods you like, determine if you can you trust this events table. 
-- (HINT: When did we start recording events on mobile)
-- Starter Code:

SELECT * 
  FROM dsv1069.events_ex2
  

-- 3. Imagine that you need to count item views by day. You found this table item_views_by_category_temp - should you use it to answer your question?
-- Starter Code:

SELECT * 
  FROM dsv1069.item_views_by_category_temp
  
  
-- 4. Using any methods you like, decide if this table is ready to be used as a source of truth.
-- Starter Code:

SELECT * 
  FROM dsv1069.raw_events
  LIMIT 100
  
  
-- 5. Is this the right way to join orders to users? Is this the right way this join.
-- Starter Code:

SELECT * 
  FROM 
    dsv1069.orders
      JOIN
    dsv1069.users
      ON orders.user_id = users.parent_user_id


