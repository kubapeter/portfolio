-- 1. Using any methods you like determine if you can you trust this events table.
-- Starter Code:

SELECT *
  FROM dsv1069.events_201701
  
-- From this query: 

SELECT 
    DATE(event_time) AS date,
    COUNT(*)         AS rows
  FROM dsv1069.events_201701
  GROUP BY DATE(event_time)
  ORDER BY DATE(event_time)
  
-- one can see that there are data for all days of January of 2017, but nothing else.
  

-- 2. Using any methods you like, determine if you can you trust this events table. 
-- (HINT: When did we start recording events on mobile)
-- Starter Code:

SELECT * 
  FROM dsv1069.events_ex2
  
-- From this query: 

SELECT 
    DATE(event_time) AS date,
    platform,
    COUNT(*) 
  FROM dsv1069.events_ex2
  GROUP BY 
    DATE(event_time), 
    platform
  
-- one can see that mobile logging has not been implemented until recently.


-- 3. Imagine that you need to count item views by day. You found this table item_views_by_category_temp 
-- should you use it to answer your question?
-- Starter Code:

SELECT * 
  FROM dsv1069.item_views_by_category_temp
  
-- One can see at first glance that there is no date in this table.
-- But another big problem can be seen from the following two queries:

SELECT SUM(view_events) AS event_count
  FROM dsv1069.item_views_by_category_temp
  
-- returns 14481

-- and

SELECT 
    COUNT(DISTINCT event_id) AS event_count
  FROM dsv1069.events
  WHERE event_name = 'view_item'
  
-- returns 262786

-- So dsv1069.item_views_by_category_temp does not have all the events for sure. 
  
  
-- 4. Is this the right way to join orders to users? Is this the right way this join.
-- Starter Code:

SELECT * 
  FROM 
    dsv1069.orders
      JOIN
    dsv1069.users
      ON orders.user_id = users.parent_user_id
      
-- The parent_user_id can be NULL and this eliminates many rows. Instead:

SELECT * 
  FROM 
    dsv1069.orders
      JOIN
    dsv1069.users
      ON orders.user_id = COALESCE(users.parent_user_id, users.id)
