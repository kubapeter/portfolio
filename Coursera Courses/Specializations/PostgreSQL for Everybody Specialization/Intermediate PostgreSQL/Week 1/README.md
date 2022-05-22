<a href="../">
  <img src="/img/Intermediate_PostgreSQL_logo.avif" width="120" align="right">
</a>

# Week 1 <br> SQL Techniques

## Learning Objectives
- Recall and utilize the SQL commands for adding, dropping, and editing columns and tables in a PostgreSQL database.
- Recall the proper psql command to read commands from a file.
- Create stored procedures.
- Utilize the SELECT DISTINCT command.

## Subjects covered
- `ALTER` possibilities
- Timestamp, timezones, `INTERVAL`, `DATE_TRUNC()`
- `CAST`
- Performance and full table scans
- `DISTINCT ON`, `GROUP BY`
- `WHERE` vs. `HAVING`
- Subqueries and performance
- Concurrency, atomicity, locking 
- `RETURNING *`, `ON CONFLICT`
- Stored procedures (plpgsql)

## Assignments[^1]
- Initial database setup (get used to the course settings)
- Alter table
- Use `SELECT DISTINCT`
- Add a stored procedure so that every time a record is updated, the updated_at variable is automatically set to the current time. 

[^1]:Please note, that I do not share the solutions of the assignments, as the lecturer firmly asks not to. However, I share the [source code](./demos.sql) of all the coding demonstrations of the week. This gives a code-level insight into the week. It covers everything that is needed to get through the assignments with 100% of the points.
