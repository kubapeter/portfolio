-- 1. Create the right subtable for recently viewed events using the view_item_events table.


-- 2. "Check your joins." Join your tables together recent_views, users, items

SELECT * 
  FROM 
    (
    SELECT 
      user_id, 
      ROW_NUMBER( ) OVER PARTITION BY ORDER BY DESC AS FROM 
    )
  JOIN ON JOIN ON
 
-- 3. "Clean up your columns." The goal of all this is to return all of the information we’ll need 
-- to send users an email about the item they viewed more recently. 
-- Clean up this query outline from the outline in exercise 2 and pull only the columns you need. 
-- Make sure they are named appropriately so that another human can read and understand their contents.



-- 4. "Consider any edge cases." If we sent an email to everyone in the results of this query, what would we want to filter out. 
-- Add in any extra filtering that you think would make this email better. 
-- For example should we include deleted users? 
-- Should we send this email to users who already ordered the item they viewed most recently?
