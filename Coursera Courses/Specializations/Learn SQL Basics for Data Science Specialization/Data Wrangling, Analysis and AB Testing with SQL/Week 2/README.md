<a href="../">
  <img src="/img/Data_Wrangling,_Analysis_and_AB_Testing_with_SQL_logo.avif" width="120" align="right">
</a>

# Week 2 <br> Creating Clean Datasets

## Learning Objectives
- Name the categories of data types.
- Explain how the unfiltered data can be manipulated into a table.
- Discuss why a data warehouse is separate from a production database.
- Use tools to create your own trustworthy table.

## Subjects covered
- Sublime Text bulk editing
- Right data type for the right tool
- 3 big type category: "number", "text" and "date" 
  - `TINYINT`, `SMALLINT`, `MEDIUMINT`, `INT`, `BIGINT`, `FLOAT`, `DOUBLE`, `DECIMAL`
  - `CHAR[Length]`, `VARCHAR[Length]`, `TINYTEXT`, `TEXT`, `MEDIUMTEXT`, `LONGTEXT`
  - `DATE`, `DATETIME`, `TIMESTAMP`, `TIME`
- Pipeline: several table creation/update tasks in a specific order
- Dependency: the data in the query refers to data in a preceding (in pipeline) table
- Extract transform load (ETL): "under the hood" steps during table creation
- Job: the task given to a database to perform ETL
- Backfill: to run a table creation/update task to a range of dates in the past

## Practice Exercises

There are 2 practice exercises for this week. 

## Remark
- The table creation is done in MySQL syntax
