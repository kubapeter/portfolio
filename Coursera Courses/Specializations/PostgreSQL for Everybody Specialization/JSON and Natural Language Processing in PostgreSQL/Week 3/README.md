<a href="../">
  <img src="/img/JSON_and_Natural_Language_Processing_in_PostgreSQL_logo.avif" width="120" align="right">
</a>

# Week 3 <br> Python and PostgreSQL

## Learning Objectives
- Connect and compare Python and PostgreSQL.
- Utilize Python to insert data into a table with a given schema.

## Subjects covered


## Assignments[^1]
#### 1. Building a string array-based GIN index
>"In this assignment, you will create a table of documents and then produce a GIN-based `text[]` reverse index for those documents that identifies each document which contains a particular word using SQL. 
>
>FYI: In _contrast_ with the provided sample SQL, you will map all the words in the GIN index to lower case (i.e. Python, PYTHON, and python should all end up as "python" in the GIN index). 
>
>The goal of this assignment is to run several queries using the `<@` operator and (a) get the correct document(s) and (b) use the GIN index (i.e. not use a sequential scan)."

#### 2. Building a tsvector-based full text GIN index

> "In this assignment, you will create a table of documents and then produce a GIN-based `ts_vector` index on the documents. 
> 
> The goal of this assignment is to run these queries with the `@@` operator and (a) get the correct document(s) and (b) correctly use the GIN index (i.e. not use a sequential scan). "

[^1]:Please note, that I do not share the solutions of the assignments, as the lecturer firmly asks not to. However, I share the [source code](./demos.sql) of all the coding demonstrations of the week. This gives a code-level insight into the week. It covers everything that is needed to get through the assignments with 100% of the points.
