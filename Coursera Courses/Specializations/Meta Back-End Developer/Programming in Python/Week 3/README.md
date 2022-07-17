<a href="../">
  <img src="/img/Programming_in_Python_logo.avif" width="120" align="right">
</a>

# Week 3 <br> Programming paradigms

## Learning Objectives
- Use functions to explore algorithmic thinking
- Use the logical concepts associated with procedural program flow.
- Identify and explain the paradigms of procedural programming.
- Instantiate and work with objects, classes and methods in Python.
- Explain the object-oriented programming concepts that underpin Python

## Subjects covered
- DRY principle (Don't repeat yourself)
- procedural programming
- algorithms, algorithmic complexity, big-O notation, refactoring
- functional programming 
  - traditional and pure functions
  - first-class citizen functions
  - recursion
  - `map(mapping_function, mapped_list)`, `filter(filtering_function,filtered_list)`
  - comprehension: `fourxsub = [x-1 for x in new_data if x%4 == 0]`
```python  
      months = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]
      number = [1,2,3,4,5,6,7,8,9,10,11,12]

      # Using one input list
      numdict = {x:x**2 for x in number}
      print("Using one input list to create dict: ", numdict)

      # Using two input lists
      months_dict = {key:value for (key, value) in zip(number, months)}
      print("Using two lists: ", months_dict)
```

## Assignments[^1]

[^1]: Please note that the codes I share here are not the codes submitted in the course for it would be against the [Coursera Honor Code](https://www.coursera.support/s/article/209818863-Coursera-Honor-Code?language=en_US). I solve a similar problems with similar techniques, so they cannot be submitted, but they cover roughly the same scope of knowledge. 

There are two assignments for week 3. 

#### [Mapping key-values to Dictionary data structures](./functions_loops_datastructures.py)

> "So far you have learned that Python has different techniques to modify a given iterator sequence such as list or dictionary using comprehensions, `map()` function and so on. Now you will be utilising what you have learned. Let’s say you have a list of employee data for the Little Lemon company. You want to create login accounts for the employees and you will create usernames for these employees in the first example. 
> 
> You also want to update the roster for these employees on the calendar and want easy access to their initials and employee IDs, as they are all unique. To get that, in the second example, you will create a dictionary with the required information."

#### [Abstract Classes and Methods](./read_write.py)

> "In this assignment, you will be creating an abstract class for a bank that will be used to create a regular class for a specific bank. This class will contain the implementation of the abstract method from the abstract class. "
