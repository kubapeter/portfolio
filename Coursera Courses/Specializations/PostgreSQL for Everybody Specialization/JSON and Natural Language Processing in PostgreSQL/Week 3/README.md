<a href="../">
  <img src="/img/JSON_and_Natural_Language_Processing_in_PostgreSQL_logo.avif" width="120" align="right">
</a>

# Week 3 <br> Python and PostgreSQL

## Learning Objectives
- Connect and compare Python and PostgreSQL.
- Utilize Python to insert data into a table with a given schema.

## Subjects covered
- `psycopg2` library
- ranking functions in PostgreSQL: `ts_rank()`, `ts_rank_cd()`

## Demonstartions

There are 3 demonstartions in week 3. 

#### [Demo1](./demo1.py): connection and basic operations

This python program connects to the PostgreSQL server, (safety-drops and then) creates a table, inserts values into it using a for loop, selects a row, prints it, inserts a row and prints part of it, then demonstrates a mistake, and finally would close the connection, if the mistake did not happen.  

#### [Demo2](./demo2.py): loading a book into SQL in a usable format 

This python program connects to the PostgreSQL server, loads a book (.txt file), grabs out the paragraphs, transform every paragraph into one line, and insert these lines as rows into the database. 

#### [Demo3](./demo3.py): emails

main python file: Pulling out sent date, subject, headers, body
sql file: making indexes, queries, create new column

## Assignments[^1]

#### 1. Running simple.py

>"In this assignment we get the simple.py sample code working and write to a table from Python."

#### 2. A Sequence of Numbers

> "In this assignment we generate a sequence of numbers and put them into a table."

[^1]:Please note, that I do not share the solutions of the assignments, as the lecturer firmly asks not to. However, I share the [source code](./demos.sql) of all the coding demonstrations of the week. This gives a code-level insight into the week. It covers everything that is needed to get through the assignments with 100% of the points.
