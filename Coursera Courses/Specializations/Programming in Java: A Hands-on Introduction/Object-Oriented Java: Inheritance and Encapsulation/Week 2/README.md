<a href="../">
  <img src="/img/Object_Oriented_Java_Inheritance_and_Encapsulation_logo.avif" width="120" align="right">
</a>

# Week 2 <br> Inheritance

## Learning Objectives
- Define the terms inheritance, superclass, and subclass
- Explain the relationship between the superclass and subclass
- Explain the role of the super keyword
- Create a subclass class from a given superclass
- Use instanceof to determine an object's parent class
- Define the substitution principle
- Define the terms extending and overriding
- Extend the superclass with new method
- Override methods from the superclass with new functionality
- Annotate a method when overriding it
- Define multiple inheritance
- Explain why multiple inheritance from two different classes is not allowed in Java
- Create multiple inheritance from a class with a superclass
- Define the inheritance hierarchy of an object with more than one superclass

## [Coding practice challenge](./LabChallenge.java)

>"Problem
>
>\[... T\]he class `MP3` is already defined. Use this class to do the following things:
>- Create the class `Podcast` that inherits from `MP3`
>- Override the constructor such that the podcast has the following attributes:
>  - `name` - a string that is the name of the podcast
>  - `title` - a string that is the title of the episode
>  - `length` - an integer that has the length of the podcast in seconds
>  - `genre` - a string that is the genre of the podcast
>  - `date` - a string that represents when the podcast was released to the public
>  
>Expected Output
>  
>Declare an instance of the `Podcast` class as shown below.
```java
    //add code below this line
  
    Podcast p = new Podcast("Planet Money", "Hollywood's Black List", 1460, "economics", "10 July 2020");
  
    //add code above this line   
```
>  
>The table below shows the method calls (left) and the output (right). Your class will be expected to work with all of these method calls."
>
>| Method Call                              | Return Value                              | 
>|------------------------------------------|-------------------------------------------|
>| `System.out.println(p.displayName());`   | `The name is Planet Money`                | 
>| `System.out.println(p.displayTitle());`  | `The title is Hollywood's Black List`     | 
>| `System.out.println(p.displayLength());` | `The length is 24 minutes and 20 seconds` |
>| `System.out.println(p.displayGenre());`  | `The genre is economics`                  |
>| `System.out.println(p.displayDate());`   | `The date is 10 July 2020`                |
