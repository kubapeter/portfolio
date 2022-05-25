<a href="../">
  <img src="/img/Intermediate_PostgreSQL_logo.avif" width="120" align="right">
</a>

# Week 4 <br> Regular Expressions

## Learning Objectives
- Recall the functions of various regular expressions.
- Construct regular expressions to select rows from a table that match a pattern.

## Subjects covered
- 

## Assignments[^1]

#### 1. Puzzle: Break a Hashing Function

>In this assignment you will write[^2] a simple hashing function that uses addition and multiplication and then find a pair of strings that will return the same hash value for different strings (i.e you will cause a Hash Collision).
>
>The algorithm uses multiplication based on the position of a letter in the hash to avoid a hash collision when two letters are transposed like in 'ABCDE' and 'ABDCE'. Your strings need to be at least three characters long and no more than 10 characters long.
>
>Here is the code that computes your hash: "

```python
while True:
    txt = input("Enter a string: ")
    if len(txt) < 1 : break

    hv = 0
    pos = 0
    for let in txt:
        pos = ( pos % 3 ) + 1  
        hv = (hv + (pos * ord(let))) % 1000000
        print(let, pos, ord(let), hv)

    print(hv, txt)
 ```
 
 The task is to find two strings that share the same hash value.
 
#### 2. Generating Text

>"In this assignment you will create a table named bigtext with a single TEXT column named content. Insert 100000 records with numbers starting at 100000 and going through 199999 into the table as shown below:"

```
This is record number 100000 of quite a few text records.
This is record number 100001 of quite a few text records.
...
This is record number 199998 of quite a few text records.
This is record number 199999 of quite a few text records.
```

[^1]:Please note, that I do not share the solutions of the assignments, as the lecturer firmly asks not to. However, I share the [source code](./demos.sql) of all the coding demonstrations of the week. This gives a code-level insight into the week. It covers everything that is needed to get through the assignments with 100% of the points.

[^2]:As it turnes out there is no need to write any code. The lecturer gives the code himself as it can be seen below.
