-- 1. Here we use users table to pull a list of user email addresses. Edit the query to pull email addresses, but only for non-deleted users.
-- Starter Code:

SELECT *
  FROM dsv1069.users
  
-- Solution: 

SELECT 
    id AS user_id, 
    email_address
  FROM dsv1069.users
  WHERE deleted_at IS NULL
  
  
-- 2. Use the items table to count the number of items for sale in each category.

-- Solution: 

SELECT 
    category, 
    COUNT(id) AS item_count
  FROM dsv1069.items
  GROUP BY category
  ORDER BY item_count DESC


-- 3. Select all of the columns from the result when you JOIN the users table to the orders table. 

-- Solution:

SELECT *
  FROM 
    dsv1069.users 
      JOIN
    dsv1069.orders 
      ON users.id = orders.user_id
      
      

-- 4. Check out the query below. This is not the right way to count the number of viewed_item events. 
-- Determine what is wrong and correct the error.
-- Starter Code:

SELECT
    COUNT(event_id) AS events
  FROM dsv1069.events
  WHERE event_name = 'view_item'
  
-- The query below shows that there are 2 rows for every event_id value

SELECT
    event_id,
    COUNT(*)
  FROM dsv1069.events
  GROUP BY event_id
  
-- So the right query uses DISTINCT 

SELECT
    COUNT(DISTINCT event_id) AS events
  FROM dsv1069.events
  WHERE event_name = 'view_item'


-- 5. Compute the number of items in the items table which have been ordered. The query below runs, but it isn’t right. 
-- Determine what is wrong and correct the error or start from scratch.
-- Starter Code: 

SELECT
    COUNT(item_id) AS item_count
  FROM 
    dsv1069.orders
      INNER JOIN 
    dsv1069.items
      ON orders.item_id = items.id
     
-- The query below shows that there are far less items at all than the ansewer to the query above

SELECT
    COUNT(*)
  FROM dsv1069.items

-- The right solution uses DISTINCT and does not use the JOIN as it is redundant (it is an inefficiency)

SELECT
    COUNT(DISTINCT item_id) AS item_count
  FROM dsv1069.orders
  
     
-- 6. For each user figure out IF a user has ordered something, and when their first purchase was. 
-- The query below doesn’t return info for any of the users who haven’t ordered anything.
-- Starter Code:

SELECT
  users.id AS user_id,
  MIN(orders.paid_at) AS min_paid_at
FROM 
  dsv1069.orders
    INNER JOIN 
  dsv1069.users
    ON orders.user_id = users.id
GROUP BY 
  users.id
  
-- The INNER JOIN is the problem. It leaves out all the users who has no order. The solution is OUTER JOIN

SELECT
  users.id AS user_id,
  MIN(orders.paid_at) AS min_paid_at
FROM 
  dsv1069.orders
    RIGHT OUTER JOIN 
  dsv1069.users
    ON orders.user_id = users.id
GROUP BY 
  users.id
  
  
-- 7. Figure out what percent of users have ever viewed the user profile page, but this query isn’t right. 
-- Check to make sure the number of users adds up, and if not, fix the query.
-- Starter Code:

SELECT
    (
    CASE WHEN first_view IS NULL THEN false
      ELSE true END
    ) AS has_viewed_profile_page,
    COUNT(user_id) AS users
  FROM 
    (
    SELECT 
      users.id AS user_id,
      MIN(event_time) AS first_view
    FROM 
      dsv1069.users
        LEFT OUTER JOIN
      dsv1069.events
        ON events.user_id = users.id
    WHERE event_name = 'view_user_profile'
    GROUP BY users.id
    ) first_profile_views
  GROUP BY 
    (
    CASE WHEN first_view IS NULL THEN false
      ELSE true END
    )

-- Problem: the line 
--   WHERE event_name = 'view_user_profile'
-- makes the LEFT OUTER JOIN an INNER JOIN
-- That is why we only get a "true" row and not a "false" row.

-- Solution: the right place for the 
--   event_name = 'view_user_profile'
-- conditon is in the ON conditon

SELECT
    (
    CASE WHEN first_view IS NULL THEN false
      ELSE true END
    ) AS has_viewed_profile_page,
    COUNT(user_id) AS users
  FROM 
    (
    SELECT 
      users.id AS user_id,
      MIN(event_time) AS first_view
    FROM 
      dsv1069.users
        LEFT OUTER JOIN
      dsv1069.events
        ON 
          events.user_id = users.id
          AND 
          event_name = 'view_user_profile'
    GROUP BY users.id
    ) first_profile_views
  GROUP BY 
    (
    CASE WHEN first_view IS NULL THEN false
      ELSE true END
    )
