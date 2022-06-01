-- 1. Putting a variable into SQL

{% assign ds = '2018-01-01' %}
SELECT 
    id, 
    '{{ds}}' AS variable_column
  FROM users
-- We get an id column and a column with '2018-01-01' in every row

-- A bit more meaningful example:

{% assign ds = '2018-01-01' %}
SELECT id
  FROM users
  WHERE created_at <= '{{ds}}'
  
  
-- 2. Now for the table

{% assign ds = '2018-01-01' %}

SELECT 
    users.id                                              AS user_id, 
    IF(users.created_at = '{{ds}}', 1, 0)                 AS created_today, 
    IF(users.deleted_at <= '{{ds}}', 1, 0)                AS is_deleted, 
    IF(users.deleted_at = '{{ds}}', 1, 0)                 AS is_deleted_today, 
    IF(users_with_orders.user_id IS NOT NULL, 1, 0)       AS has_ever_ordered, 
    IF(users_with_orders_today.user_id IS NOT NULL, 1, 0) AS ordered_today, 
    '{{ds}}'                                              AS ds
  FROM 
    users
      LEFT OUTER JOIN 
    (
    SELECT DISTINCT user_id
      FROM orders 
      WHERE created_at <= '{{ds}}'
    ) users_with_orders
      ON users_with_orders.user_id = users.id
      
      LEFT OUTER JOIN 
    (
    SELECT DISTINCT user_id
      FROM orders 
      WHERE created_at = '{{ds}}'
    ) users_with_orders_today
      ON users_with_orders_today.user_id = users.id
  WHERE users.created_at <= '{{ds}}'
    
-- We get the table. If we want it for another day we only have to rewrite the date in line 20. 


-- 3. Now create a table and put this stuff into
    
CREATE TABLE IF NOT EXISTS user_info 
  (
  user_id          INT(10) NOT NULL,
  created_today    INT(1) NOT NULL,
  is_deleted       INT(1) NOT NULL,
  is_deleted_today INT(1) NOT NULL, 
  has_ever_ordered INT(1) NOT NULL,
  ordered_today    INT(1) NOT NULL,
  ds               DATE NOT NULL,
  );
  
-- Let's take a look at it
DESCRIBE user_info;

-- And now put the data into the table

INSERT INTO user_info 
SELECT 
    users.id                                              AS user_id, 
    IF(users.created_at = '{{ds}}', 1, 0)                 AS created_today, 
    IF(users.deleted_at <= '{{ds}}', 1, 0)                AS is_deleted, 
    IF(users.deleted_at = '{{ds}}', 1, 0)                 AS is_deleted_today, 
    IF(users_with_orders.user_id IS NOT NULL, 1, 0)       AS has_ever_ordered, 
    IF(users_with_orders_today.user_id IS NOT NULL, 1, 0) AS ordered_today, 
    '{{ds}}'                                              AS ds
  FROM 
    users
      LEFT OUTER JOIN 
    (
    SELECT DISTINCT user_id
      FROM orders 
      WHERE created_at <= '{{ds}}'
    ) users_with_orders
      ON users_with_orders.user_id = users.id
      
      LEFT OUTER JOIN 
    (
    SELECT DISTINCT user_id
      FROM orders 
      WHERE created_at = '{{ds}}'
    ) users_with_orders_today
      ON users_with_orders_today.user_id = users.id
  WHERE users.created_at <= '{{ds}}'
  
