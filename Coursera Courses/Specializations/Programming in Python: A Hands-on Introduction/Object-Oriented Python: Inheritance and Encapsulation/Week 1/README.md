<a href="../">
  <img src="/img/Object-Oriented_Python_Inheritance_and_Encapsulation_logo.avif" width="120" align="right">
</a>

# Week 1 <br> Inheritance

## Learning Objectives
- Explain the relationship between the parent class and child class
- Explain the role of the `super` keyword
- Create a child class from a given parent class
- Define the terms extending and overriding
- Extend the parent class with `new` method
- Override methods from the parent class with new functionality
- Define multiple inheritance
- Override the `__init__` method to inherit attributes from both parent classes
- Define the inheritance hierarchy of an object with more than one parent class

## [Coding practice challenge](./lab_challenge.py)

>**Problem**
>
>\[... T\]he class `MP3` is already defined. Use this class to do the following things:
>- Create the class `Podcast` that inherits from `MP3`
>- Override the __init__ method such that the podcast has the following attributes:
>  - `name` - a string that is the name of the podcast
>  - `title` - a string that is the title of the episode
>  - `length` - an integer that has the length of the podcast **in seconds**
>  - `genre` - a string that is the genre of the podcast
>  - `date` - a string that represents when the podcast was released to the public
>  
>**Expected Output**
>  
>Declare an instance of the `Podcast` class as shown below.
```python
    Podcast p = new Podcast("Planet Money", "Hollywood's Black List", 1460, "economics", "10 July 2020");
```
>  
>The table below shows the method calls (left) and the output (right). Your class will be expected to work with all of these method calls."
>
>| Method Call              | Return Value                              | 
>|--------------------------|-------------------------------------------|
>| `print(p.get_name());`   | `The name is Planet Money`                | 
>| `print(p.get_title());`  | `The title is Hollywood's Black List`     | 
>| `print(p.get_length());` | `The length is 24 minutes and 20 seconds` |
>| `print(p.get_genre());`  | `The genre is economics`                  |
>| `print(p.get_date());`   | `The date is 10 July 2020`                |

