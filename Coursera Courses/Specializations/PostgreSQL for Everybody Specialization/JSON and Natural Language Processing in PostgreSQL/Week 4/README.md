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

- creating a table and importing a JSON file into the table 
- extracting field data from the JSON, using the `->>` operator (retrieve field and convert from jsonb to text)
- querying JSONB fields by comparing them to other JSONB documents or document fragments using the contains (`@>`) operator
- checking if a JSONB document contains a key, using the `?` operator
- use of casting (e. g. `::int`)
- easiness of indexing JSONB

#### Demo2: Loading JSON from an API

The [python code](./demo2.py) pulls out data from API, creates table for them, and inserts them into it. The [SQL code](./demo2.sql) uses JSON possibilities heavily. 

## Assignments[^1]

#### 1. Running simple.py

>"In this assignment we get the simple.py sample code working and write to a table from Python."

#### 2. A Sequence of Numbers

> "In this assignment we generate a sequence of numbers and put them into a table."

[^1]:Please note, that I do not share the solutions of the assignments, as the lecturer firmly asks not to. However, I share the [source code](./demo1.py) of [all](./demo2.py) the [coding](./demo3.py) [demonstrations](./demo3.sql) of the week. This gives a code-level insight into the week. It covers everything that is needed to get through the assignments with 100% of the points.
