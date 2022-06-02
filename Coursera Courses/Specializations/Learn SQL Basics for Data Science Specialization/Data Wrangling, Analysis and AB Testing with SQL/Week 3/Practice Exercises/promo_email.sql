-- 1. Create the right subtable for recently viewed events using the view_item_events table.

-- First we see 3 windowing functions, just to see how they work

SELECT 
    user_id, 
    item_id, 
    event_time, 
    ROW_NUMBER( ) OVER 
      (
      PARTITION BY user_id 
      ORDER BY event_time DESC
      )                         AS row_number, 
    RANK( ) OVER 
      (
      PARTITION BY user_id 
      ORDER BY event_time DESC
      )                         AS rank, 
    DENSE_RANK( ) OVER 
      (
      PARTITION BY user_id 
      ORDER BY event_time DESC
      )                         AS dense_rank
  FROM dsv1069.view_item_events

-- We choose ROW_NUMBER()

SELECT 
    user_id, 
    item_id, 
    event_time, 
    ROW_NUMBER( ) OVER 
      (
      PARTITION BY user_id 
      ORDER BY event_time DESC
      )                         AS view_number
  FROM dsv1069.view_item_events


-- 2. "Check your joins." Join your tables together recent_views, users, items

SELECT * 
  FROM 
    (
    SELECT 
        user_id, 
        item_id, 
        event_time, 
        ROW_NUMBER( ) OVER 
          (
          PARTITION BY user_id 
          ORDER BY event_time DESC
          )                         AS view_number
      FROM dsv1069.view_item_events
    )                               AS recent_views
      JOIN 
    dsv1069.users 
      ON users.id = recent_views.user_id
      JOIN 
    dsv1069.items 
      ON items.id = recent_views.item_id
 
 
-- 3. "Clean up your columns." The goal of all this is to return all of the information we’ll need 
-- to send users an email about the item they viewed more recently. 
-- Clean up this query outline from the outline in exercise 2 and pull only the columns you need. 
-- Make sure they are named appropriately so that another human can read and understand their contents.

SELECT 
    users.id       AS user_id, 
    users.email_address, 
    items.id       AS item_id, 
    items.name     AS item_name,
    items.category AS item_category
  FROM 
    (
    SELECT 
        user_id, 
        item_id, 
        event_time, 
        ROW_NUMBER( ) OVER 
          (
          PARTITION BY user_id 
          ORDER BY event_time DESC
          )                         AS view_number
      FROM dsv1069.view_item_events
    )                               AS recent_views
      JOIN 
    dsv1069.users 
      ON users.id = recent_views.user_id
      JOIN 
    dsv1069.items 
      ON items.id = recent_views.item_id
  WHERE view_number = 1


-- 4. "Consider any edge cases." If we sent an email to everyone in the results of this query, what would we want to filter out. 
-- Add in any extra filtering that you think would make this email better. 
-- For example should we include deleted users? 
-- Should we send this email to users who already ordered the item they viewed most recently?

SELECT 
    COALESCE(users.parent_user_id, users.id) AS user_id,  -- to avoid merge duplicates
    users.email_address, 
    items.id                                 AS item_id, 
    items.name                               AS item_name,
    items.category                           AS item_category
  FROM 
    (
    SELECT 
        user_id, 
        item_id, 
        event_time, 
        ROW_NUMBER( ) OVER 
          (
          PARTITION BY user_id 
          ORDER BY event_time DESC
          )                         AS view_number
      FROM dsv1069.view_item_events
      WHERE event_time >= '2017-01-01'                   -- to avoid sending email about items viewed 10 years ago
    )                               AS recent_views
      JOIN 
    dsv1069.users 
      ON users.id = recent_views.user_id
      JOIN 
    dsv1069.items 
      ON items.id = recent_views.item_id
      LEFT OUTER JOIN                            -- this whole LEFT OUTER JOIN (with later WHERE) 
    dsv1069.orders                               -- is to avoid sending email to those who already bought the item
      ON 
        orders.item_id = recent_views.item_id
        AND
        orders.user_id = recent_views.user_id
  WHERE 
    view_number = 1
    AND
    users.deleted_at IS NULL  -- to avoid sending emails to deleted users
    AND
    orders.item_id IS NULL    -- to avoid sending email to those who already bought the item
