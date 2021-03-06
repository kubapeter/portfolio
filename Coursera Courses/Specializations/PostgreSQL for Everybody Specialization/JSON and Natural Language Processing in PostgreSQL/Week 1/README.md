<a href="../">
  <img src="/img/JSON_and_Natural_Language_Processing_in_PostgreSQL_logo.avif" width="120" align="right">
</a>

# Week 1 <br> Natural Language

## Learning Objectives
- Recall why PostgreSQL stores rows in blocks with unused space on disk.
- Recall the typical block size used by PostgreSQL.
- Differentiate between HASH index and B-tree index.
- Create a reverse index for a table of documents.
- Utilize stop words with a reverse index.

## Assignments[^1]
- Initial database setup (get used to the course settings)
- > "In this assignment, you will create a table of documents and then produce a reverse index  for those documents that identifies each document which contains a particular word using SQL.   In contrast with the provided sample SQL, you will  map all the words in the reverse index to lower case (i.e. Python, PYTHON, and python should all end up as "python" in the inverted index)."
- > "In this assignment, you will create a table of documents and then produce a reverse index with stop words for those documents that identifies each document which contains a particular word using SQL."

[^1]:Please note, that I do not share the solutions of the assignments, as the lecturer firmly asks not to. However, I share the [source code](./demos.sql) of all the coding demonstrations of the week. This gives a code-level insight into the week. It covers everything that is needed to get through the assignments with 100% of the points.
