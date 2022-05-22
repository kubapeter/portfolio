<a href="../">
  <img src="/img/Database_Design_and_Basic_SQL_in_PostgreSQL_logo.avif" width="120" align="right">
</a>

# Week 2 <br> Single Table SQL

## Learning Objectives
- Recall and utilize common psql commands.
- Create a database using command line prompts.
- Utilize common SQL commands, including INSERT INTO, WHERE, and ORDER BY.

## Subjects covered
- `INSERT INTO`, `DELETE`, `UPDATE`, `SET`
- `SELECT`, `FROM`, `WHERE`, `ORDER BY`, `LIKE`
- `LIMIT`, `OFFSET` 
- `COUNT()`
- Data types
  - `CHAR(16)`, `VARCHAR(200)`, `TEXT`
  - `BYTEA`
  - `SMALLINT`, `INTEGER`, `BIGINT`
  - `REAL`, `DOUBLE PRECISION`, `NUMERIC(accuracy, decimal)`
  - `TIMESTAMP`, `DATE`, `TIME`, `NOW()`
- Keys, `SERIAL`, ` PRIMARY KEY(id)`, `UNIQUE` (logical key)
- Indexes, b-trees, hashes
- Create table from CSV file

## Assignment

>" Create a table named automagic with the following fields: 
>- An id field that is an auto-incrementing serial field. 
>- A name field that allows up to 32 characters but no more. This field is required. 
>- A height field that is a floating point number that is required. "

and

>"**Musical Track Database (CSV)**. This application will read an iTunes library in comma-separated values (CSV) and load the data into a table."
