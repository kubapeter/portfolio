<a href="../">
  <img src="/img/Object-Oriented_Python_Inheritance_and_Encapsulation_logo.avif" width="120" align="right">
</a>

# Week 4 <br> Advanced Topics

## Learning Objectives
- Compare and contrast the `__repr__` and `__str__` methods
- Identify when to use composition and when to use inheritance
- Compare and contrast component and composite classes
- Define object composition
- Create and manipulate a list of objects
- Set up and import an object defined in a separate file

## [Coding practice challenge](./lab_challenge.py)


>**Problem**
>
>There exists a user-defined class named `Stats` in the Python module `stats`. **Note**, there are no parameters when you instantiate an object of the `Stats` class. It has the methods, `mean`, `median`, and `mode`. Write a script that uses each of the methods with the following list:

```python
    [8, 7, 3, 9, 1, 4, 3]
```

>
>**Expected Output**
>
>When you print each method call with the list above, you should see the output below.
>
>| Method Call                                     | Output     | 
>|-------------------------------------------------|------------|
>| `print(my_stats.mean([8, 7, 3, 9, 1, 4, 3]))`   | mean: 5    | 
>| `print(my_stats.median([8, 7, 3, 9, 1, 4, 3]))` | median: 4  | 
>| `print(my_stats.mode([8, 7, 3, 9, 1, 4, 3]))`   | mode: 3    | 
