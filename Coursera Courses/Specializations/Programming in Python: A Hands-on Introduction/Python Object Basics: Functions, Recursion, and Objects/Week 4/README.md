<a href="../">
  <img src="/img/Python_Object_Basics_Functions,_Recursion,_and_Objects_logo.avif" width="120" align="right">
</a>

# Week 4 <br> Mutability

## Learning Objectives
- Define the term mutable
- Construct a function to modify instance variables (attributes)
- Convert a function that modifies an object into an instance method
- Explain how `self` is used in methods
- Explain how `cls` is used in class methods
- Explain when to use an instance method, when to use a static method, and when to use a class method

## [Coding practice challenge](./lab_challenge.py)

>Copy and paste the `Zoo` class below into the code editor.

```python
class Zoo:
  def __init__(self, big_cats, primates, reptiles, birds):
    self.big_cats = big_cats
    self.primates = primates
    self.reptiles = reptiles
    self.birds = birds
```

>Add the following methods to the class:
>- `total_animals` - returns the total number of animals
>- `total_mammals` - returns the number of mammals
>- `most_animals` - returns the name with the most animals in the zoo
>
>**Expected Output**
>
>If the following code is added to your program:

```python
my_zoo = Zoo(10, 30, 90, 120)
print(my_zoo.total_animals())
print(my_zoo.total_mammals())
print(my_zoo.most_animals())
```

>Then the output would be:

```python
250
40
birds
```
