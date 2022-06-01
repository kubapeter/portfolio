-- 1. Quick way to make a table: CREATE TABLE ... AS

CREATE TABLE
  view_item_events_1
AS
SELECT 
    event_id, 
    event_time, 
    user_id,
    platform,
    MAX(
    CASE WHEN parameter_name = 'item_id'
         THEN parameter_value 
         ELSE NULL
    END
    ) AS item_id,
    MAX(
    CASE WHEN parameter_name = 'referrer'
         THEN parameter_value 
         ELSE NULL
    END
    ) AS referrer
  FROM dsv1069.events
  WHERE event_name = 'view_item'
  GROUP BY 
    event_id, 
    event_time, 
    user_id,
    platform
  ORDER BY event_id
  
  
-- We can check the created table

-- General information
DESCRIBE view_item_events_1;

-- Closer look
SELECT * FROM view_item_events_1 LIMIT 10; 
-- We can see that NOT ALL DATA TYPES ARE GOOD FOR USE!

-- Clear the table (Only drop those tables that are yours)
DROP TABLE view_item_events_1;


-- 2. Now, not so quick table creation but the types are dealt with

CREATE TABLE IF NOT EXISTS 'view_item_events' 
  (
  event_id   VARCHAR(32) NOT NULL PRIMARY KEY, 
  event_time VARCHAR(26), 
  user_id    INT(10), 
  platform   VARCHAR(17), 
  item_id    INT(10), 
  referrer    VARCHAR(17)
  );

--INSERT INTO 'view_item_events' -- this would create duplicate rows
REPLACE INTO 'view_item_events' -- this clears out the table first

SELECT 
    event_id, 
    TIMESTAMP(event_time) AS event_time, 
    user_id,
    platform,
    MAX(
    CASE WHEN parameter_name = 'item_id'
         THEN parameter_value 
         ELSE NULL
    END
    ) AS item_id,
    MAX(
    CASE WHEN parameter_name = 'referrer'
         THEN parameter_value 
         ELSE NULL
    END
    ) AS referrer
  FROM dsv1069.events
  WHERE event_name = 'view_item'
  GROUP BY 
    event_id, 
    event_time, 
    user_id,
    platform
  ORDER BY event_id
