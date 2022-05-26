<a href="../">
  <img src="/img/Object_Oriented_Java_Inheritance_and_Encapsulation_logo.avif" width="120" align="right">
</a>

# Week 4 <br> Advanced Topics

## Learning Objectives
- Set up and import an object defined in a separate file
- Create and manipulate a list of objects
- Define object composition
- Compare and contrast component and composite classes
- Identify when to use composition and when to use inheritance
- Represent an object as a string
- Create and implement an interface
- Compare the values of two objects

## [Coding practice challenge](./LabChallenge.java)

>"Problem
>
>The BankAccount class is defined in the IDE to the left. Create the toString method that returns a string representation of a BankAccount object.
>
>Expected Output
>
>Create two different BankAccount objects.

```java
    BankAccount account1 = new BankAccount(2432, 89.52);
    BankAccount account2 = new BankAccount(1998, 239.43);
```

>If you print each object, you should see the following output.
>
>| Method Call                     | Output                                         | 
>|---------------------------------|------------------------------------------------|
>| `System.out.println(account1);` | BankAccount\[checking=2432.0, savings=89.52\]  | 
>| `System.out.println(account2);` | BankAccount\[checking=1998.0, savings=239.43\] |
