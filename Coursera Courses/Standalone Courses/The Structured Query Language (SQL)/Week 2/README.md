<a href="../">
  <img src="/img/The_Structured_Query_Language_(SQL)_logo.avif" width="120" align="right">
</a>

# Week 2 <br> The Basic SELECT Statement

## Learning Objectives
- Construct basic SQL queries to retrieve columns from tables
- Use the WHERE clause to retrieve a subset of rows
- Demonstrate how to include literals and expressions in the SELECT clause

## Subjects covered
- `SELECT` (specifies columns)
  - `*`, `FROM`, `AS`, `CONCAT()`, `||`, `to_char`, `date_part`, `--`, `/* */`
- `WHERE` (specifies rows)
  - `LIKE`, `IN`, `BETWEEN`, `AND`, `OR`, `NOT`
- `ORDER BY` and `DISTINCT`
  - `count()`, `ASC`, `DESC`, `LIMIT`
- date datatype
  - `DATE`, `TIMESTAMP`, `TIMESTAMPTZ`, `TIME`, `INTERVAL` (PostgreSQL)
  - `CAST (<A> AS <B>)`, `<A>::<B>`
  - `now()`, `age()`, date functions in general
- `NULL`
    - `IS NULL`, `IS NOT NULL`

## Labs

There are 3 labs for week 2. All the lab exercises are done on [this](https://bit.io/alanparadise/nw) database.
- [Coding Your First SELECT Statements](./lab1.sql)
- [Adding Conditions Using the WHERE Clause](./lab2.sql)
- [Date Functions and Nulls](./lab3.sql)
