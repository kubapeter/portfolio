<a href="../">
  <img src="/img/Object-Oriented_Python_Inheritance_and_Encapsulation_logo.avif" width="120" align="right">
</a>

# Week 4 <br> Advanced Topics

## Learning Objectives
- Define the term encapsulation
- Explain how Python implements private and public attributes
- Explain the limitations of Python conventions for encapsulation
- Define the terms getter, setter, and data validation
- Differentiate between using the property function and the `@property` decorator for getters and setter
- Demonstrate validating data for type and value errors

## [Coding practice challenge](./lab_challenge.py)


>"**Problem**
>
>Write a class named `Person` that has attributes for name, age, and occupation. These attributes should follow the Python convention for private attributes. Create getters and setters for each attribute. Name your getters and setters as `get_` followed by the attribute name or `set_` followed by the attribute name. Do not use the `property` decorator or function for the getters and setters.
>
>**Expected Output**
>- Declare the instance `my_person = Person("Citra Curie", 16, "student")`
>- The method `get_name()` returns `Citra Curie`
>- The method `set_name("Rowan Faraday")` changes the name attribute to “Rowan Faraday”
>- The method `get_age()` returns 16
>- The method `set_age(18)` changes the age attribute to 18
>- The method `get_occupation()` returns `student`
>- The method `set_occupation("plumber")` changes the occupation attribute to “plumber”"
>
>**Important**
>
>Use the Python convention for designating private attributes, and do not use the `property` decorator or function.
