<a href="../">
  <img src="/img/Object_Oriented_Java_Inheritance_and_Encapsulation_logo.avif" width="120" align="right">
</a>

# Week 3 <br> Polymorphism

## Learning Objectives
- Define polymorphism
- Explain how method overriding is an example of polymorphism
- Overload a method
- Override a method
- Use an abstract method as a form of polymorphism

## [Coding practice challenge](./LabChallenge.java)

>"Problem
>
>\[... T\]he class Chef is already defined, as is the display method. However, it does not have a constructor. Create three constructors that take one, two, and three parameters respectively.
>
>Expected Output
>
>Instantiate three Chef objects each one using a different constructor.
```java
    //add code below this line

    Chef c1 = new Chef("Marco Pierre White");
    Chef c2 = new Chef("Rene Redzepi", "Nordic");
    Chef c3 = new Chef("Thomas Keller", "French", 3);
    
    //add code above this line
```
> Calling the display method for each object should return the following text:
> 
>| Method Call    | Return Value                                                           | 
>|----------------|------------------------------------------------------------------------|
>| `c1.display()` | Marco Pierre White is known for null cuisine and has 0 Michelin stars. | 
>| `c2.display()` | Rene Redzepi is known for Nordic cuisine and has 0 Michelin stars.     | 
>| `c3.display()` | Thomas Keller is known for French cuisine and has 3 Michelin stars.    |





