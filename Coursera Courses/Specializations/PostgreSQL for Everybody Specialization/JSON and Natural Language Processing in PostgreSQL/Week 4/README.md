<a href="../">
  <img src="/img/JSON_and_Natural_Language_Processing_in_PostgreSQL_logo.avif" width="120" align="right">
</a>

# Week 4 <br> JSON and PostgreSQL

## Learning Objectives
-  Load and store JSON documents in a table.
-  Recall the historical events that spurred on the adoption of JSON.
-  Recall which index type is typically used for JSON in PostgreSQL.

## Subjects covered
- general concept of serialization and marshalling/unmarshalling
- `HSTORE` column, `JSON` column, `JSONB` column

## Demonstartions

There are 2 demonstartions in week 4. 

#### [Demo1](./demo1.sql): JSONB in PostgreSQL

Creating a table and importing a JSON file into the table, extracting field data from the JSON, using the `->>` operator

#### Demo3: loading many emails of different formats into SQL and using indexes in serches

The [python code](./demo3.py) pulls out sent date, subject, headers, body, creates table for them, and inserts them into it. The [SQL code](./demo3.sql) makes indexes, uses them, creates new column, uses different text search functions, ranks results. 

## Assignments[^1]

#### 1. Running simple.py

>"In this assignment we get the simple.py sample code working and write to a table from Python."

#### 2. A Sequence of Numbers

> "In this assignment we generate a sequence of numbers and put them into a table."

[^1]:Please note, that I do not share the solutions of the assignments, as the lecturer firmly asks not to. However, I share the [source code](./demo1.py) of [all](./demo2.py) the [coding](./demo3.py) [demonstrations](./demo3.sql) of the week. This gives a code-level insight into the week. It covers everything that is needed to get through the assignments with 100% of the points.
