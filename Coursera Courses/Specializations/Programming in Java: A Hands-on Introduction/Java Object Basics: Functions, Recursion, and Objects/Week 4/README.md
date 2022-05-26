<a href="../">
  <img src="/img/Java_Object_Basics_Functions,_Recursion,_and_Objects_logo.avif" width="120" align="right">
</a>

# Week 4 <br> Mutability

## Learning Objectives
- Define the term mutable
- Construct a function to modify instance variables (attributes)
- Define the term Instance method
- Convert an external method that modifies an object into an instance method
- Demonstrate the syntax for calling a method
- Define the term static method
- Identify when using a static method makes sense
- Demonstrate the syntax for calling an instance method
- Differentiate method scope between instance methods and static methods

## [Coding practice challenge](./LabChallenge.java)

>"Copy and paste the `Zoo` class below into the code editor.
```java
//add class definitions below this line

class Zoo {
  int bigCats;
  int primates;
  int reptiles;
  int birds;
  
  Zoo(int bc, int p, int r, int b) {
    bigCats = bc;
    primates = p;
    reptiles = r;
    birds = b;
  }
}
//add class definitions above this line
```
>Add the following methods to the class:
>- totalAnimals - returns the total number of animals
>- totalMammals - returns the number of mammals
>- mostAnimals - returns the name with the most animals in the zoo
>
>Expected Output
>
>If the following code is added to your program:
```java
    //add code below this line
    
    Zoo myZoo = new Zoo(10, 30, 90, 120);
    System.out.println(myZoo.totalAnimals());
    System.out.println(myZoo.totalMammals());
    System.out.println(myZoo.mostAnimals());

    //add code above this line
```
>Then the output would be:"

```java
250
40
birds
```
