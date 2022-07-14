<a href="../">
  <img src="/img/Programming_in_Python_logo.avif" width="120" align="right">
</a>

# Week 2 <br> Basic Programming with Python

## Learning Objectives
- Explain the core concepts that underpin the Python programming language.
- Work with variables and different data types in Python.
- Use control flow and loops to execute code under specific conditions.
- Work with functions and data structures in Python.
- Recognize possible errors, their causes and how to handle them.
- Create, read and write data in files

## Subjects covered
- declaring and calling functions, `def`
- variable scope: local, enclosing, global, built-in
- data structures: built-in, user-defined
- mutability and immutability
- list, indexes, nested list, 
  - `list1 = [1, 2.3, 'A', True]`, `list1[index]`
  - `print(*list1)`, `list1.insert(index, element)`, `list1.append(element)`, `list1.extend(new_list)`
  - `list1.pop(element)`, `del list1[index]`
  - `for element in list1:`
- tuple, immutability
  - `tuple1 = (1, 2.3, 'A', True)`, `tuple1[index]`  
  - `tuple1.count(2.3)`,`tuple1.index(2.3)`
  - `for element in tuple1:`
- set
  - `set1 = {1, 1, 2.3, 'A', True}`
  - `set1.add(element)`, `set1.remove(element)`, `set1.discard(element)`
  - `set1.union(set2)`, `set1 | set2`, `set1.intersection(set2)`, `set1 & set2`, `set1.difference(set2)`, `set1 - set2`, `set1.symmetric_difference(set2)`, `set1 ^ set2`
- dictionary, key, value
  - `dict1 = {'a': 1, 100: True, 10.25: 1}`, `dict1[key]`
  - `dict1[key] = new_value`, `del dict1[key]`
  - `for key in dict1:`, `for key, value in dict1.items()`
- args: `def funct(*args)` -> `for argument in args:`, kwargs: `def funct(**kwargs)` -> `for key, value in kwargs.items():`
- error, exception, `try:`, `except:`, `except ZeroDivisionError as e:`
- `Exception` class
- file handling, `open()`, `close()`, `with open(filename, mode) as alias`
- `alias.write("text")`, `alias.writelines(['some', '\nLines'])`
- `alias.read()`, `alias.read(10)`, `alias.readline()`, `alias.readline(10)`, `alias.readlines()`
- absolute path, relative path


## Assignments[^1]

[^1]: Please note that the codes I share here are not the codes submitted in the course for it would be against the [Coursera Honor Code](https://www.coursera.support/s/article/209818863-Coursera-Honor-Code?language=en_US). I solve a similar problems with similar techniques, so they cannot be submitted, but they cover roughly the same scope of knowledge. 

There are two assignments for week 2. 

#### [Functions, loops and data structures](./functions_loops_datastructures.py)

> "In this lab you will be presented with a menu ordering system which will allow users to input three choices for a select menu. You are tasked with completing the menu system so that it returns and calculates the final bill for the user.
> 
> Objectives
>- Create new functions to solve specific problems.
>- Gain experience of using for loops to iterate over different data collections.
>- Create and use data structures to store, retrieve and loop over data.

#### [Read in data, store, manipulate and output new data to a file](./read_write.py)

> "In this lab you must read the contents of a file and then write the contents to another file. You must also store the contents of a file into a list so that it can be accessed in different ways. 
> 
> Goal: Use the open function for reading and writing files.
> 
> Objectives
>- Create a function for reading in a file.
>- Create a function for writing files.
