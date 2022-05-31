-- 1. Write a query to format the view_item event into a table with the appropriate columns. 
-- Starter Code:

SELECT *
  FROM dsv1069.events
  WHERE event_name = 'view_item'

-- 2. Write a query to format the view_item event into a table with the appropriate columns
-- (This replicates what we had in the slides, but it is missing a column)


SELECT 
    event_id, 
    event_time, 
    user_id,
    platform,
    (
    CASE WHEN parameter_name == 'viewed_user_id'
         THEN CAST(parameter_value AS INT)
         ELSE NULL
    END
    ) AS viewed_user_id
  FROM dsv1069.events
  WHERE event_name = 'view_user_profile'
