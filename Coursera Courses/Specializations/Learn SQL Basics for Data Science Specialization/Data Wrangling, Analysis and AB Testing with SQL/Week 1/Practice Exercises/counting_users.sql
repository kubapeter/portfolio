-- Demonstration of how a very simple and obivous (looking) question can be complicated and ambiguous. 


-- 1. We’ll be using the users table to answer the question “How many new users are added each day?“. 
-- Start by making sure you understand the columns in the table.
-- Starter code: 

SELECT * 
  FROM dsv1069.users

-- user ids (accounts) can be deleted and can be merged into another account
  
  
-- 2. Without worrying about deleted user or merged users, count the number of users added each day.

SELECT 
    DATE(created_at) AS day, 
    COUNT(*)         AS users
  FROM dsv1069.users 
  GROUP BY DATE(created_at)


-- 3. Consider the following query. Is this the right way to count merged or deleted users? 
-- If all of our users were deleted tomorrow what would the result look like?
-- Starter code: 

SELECT
    date(created_at) AS day,
    COUNT(*) AS users
  FROM dsv1069.users
  WHERE
    deleted_at IS NULL  -- exclude deleted users
    AND
    (id <> parent_user_id OR parent_user_id IS NULL)  -- exclude merged accounts
  GROUP BY date(created_at)
  
-- Problem: if we delete users today, they will disappear from the day of account creation
  
  
-- 4. Count the number of users deleted each day. Then count the number of users removed due to merging in a similar way.
-- Starter code: (Use the result from #2 as a guide)

SELECT
    date(created_at) AS day,
    COUNT(*) AS users
  FROM dsv1069.users
  WHERE deleted_at IS NOT NULL  
  GROUP BY date(created_at)


-- 5. Use the pieces you’ve built as subtables and create a table that has a column for 
-- the date, the number of users created, the number of users deleted and the number of users merged that day.

SELECT 
    new.day,
    new.new_users_added,
    deleted.deleted_users,
    merged.merged_users
  FROM
      (
      SELECT 
          DATE(created_at) AS day, 
          COUNT(*)         AS new_users_added
        FROM dsv1069.users 
        GROUP BY DATE(created_at)
      ) AS new
    LEFT JOIN   -- LEFT because there may be days when there are no deleted users
      (
      SELECT
          date(deleted_at) AS day,
          COUNT(*)         AS deleted_users
        FROM dsv1069.users
        WHERE deleted_at IS NOT NULL  
        GROUP BY date(deleted_at)
      ) AS deleted  
    ON deleted.day = new.day
    LEFT JOIN   -- LEFT because there may be days when there are no merged users
      (
      SELECT
          date(merged_at) AS day,
          COUNT(*)        AS merged_users
        FROM dsv1069.users
        WHERE 
          id <> parent_user_id  
          AND 
          parent_user_id IS NOT NULL
        GROUP BY date(merged_at)
      ) AS merged 
    ON merged.day = new.day
  
  
-- 6. Refine your query from #5 to have informative column names and so that null columns return 0.

SELECT 
    new.day,
    new.new_users_added,
    COALESCE(deleted.deleted_users, 0) AS deleted_users, 
    COALESCE(merged.merged_users, 0)   AS merged_users,
    (new.new_users_added - COALESCE(deleted.deleted_users, 0) - COALESCE(merged.merged_users, 0)) 
      AS net_added_users
  FROM
      (
      SELECT 
          DATE(created_at) AS day, 
          COUNT(*)         AS new_users_added
        FROM dsv1069.users 
        GROUP BY DATE(created_at)
      ) AS new
    LEFT JOIN   -- LEFT because there may be days when there are no deleted users
      (
      SELECT
          date(deleted_at) AS day,
          COUNT(*)         AS deleted_users
        FROM dsv1069.users
        WHERE deleted_at IS NOT NULL  
        GROUP BY date(deleted_at)
      ) AS deleted  
    ON deleted.day = new.day
    LEFT JOIN   -- LEFT because there may be days when there are no merged users
      (
      SELECT
          date(merged_at) AS day,
          COUNT(*)        AS merged_users
        FROM dsv1069.users
        WHERE 
          id <> parent_user_id  
          AND 
          parent_user_id IS NOT NULL
        GROUP BY date(merged_at)
      ) AS merged 
    ON merged.day = new.day
