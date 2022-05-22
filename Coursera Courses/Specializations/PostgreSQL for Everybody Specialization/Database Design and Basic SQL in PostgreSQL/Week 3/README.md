<a href="../">
  <img src="/img/Database_Design_and_Basic_SQL_in_PostgreSQL_logo.avif" width="120" align="right">
</a>

# Week 3 <br> One-To-Many Data Models

## Learning Objectives
- Identify and utilize the functions of primary, logical, and foreign keys within a database.
- Recall the function of SQL keywords in order to reconnect rows with corresponding data in a table.
- Effectively utilize `ON DELETE CASCADE` clauses within a database.
- Build a one-to-many roster that includes a foreign key.

## Subjects covered
- Database design, building data models
- Keys: primary, logical, foreign 
  - naming conventions: `id`, `artist_id`
- Database normalization
- `CREATE DATABASE`
- `REFERENCES`, `ON DELETE CASCADE`, `UNIQUE(album, track)`
- Inner `JOIN`, `ON`, `CROSS JOIN`
- Other `ON DELETE` choices: `RESTRICT`, `SET NULL`

## Assignment[^1]

>"**Entering Many-to-One Data**. \[... C\]reate two tables, and hand-load a small amount of data in the the tables while properly normalizing the data."

[^1]:Please note, that I do not share the solutions of the assignments, as the lecturer firmly asks not to. However, I share the [source code](../Final%20Demonstration/final_demo.sql) of the final demonstration of the course. This gives a code-level insight into the course. It covers everything that is needed to get through the assignments with 100% of the points.
