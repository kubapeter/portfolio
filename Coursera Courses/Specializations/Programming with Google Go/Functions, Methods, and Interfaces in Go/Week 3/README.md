<a href="../">
  <img src="/img/Functions,%20Methods,%20and%20Interfaces%20in%20Go%20logo.avif" width="120" align="right">
</a>

# Week 3: <br> OBJECT ORIENTATION IN GO

## Learning Objectives
- Identify the basic properties and uses of objects and classes.
- Identify the differences between structs (in Go) and classes (in an object-oriented language).
- Identify the uses of methods and different data types.
- Develop an interactive Go routine that uses classes, objects, instances, structs, and methods to query the properties of existing instances.

## Subjects covered
- No `class` keyword, but possible to associate methods with a dataset (with structs)
  - Receiver type: `func (p Point) DistToOrig() {...}` can only be called on structs of type `Point` (calls by value)
  - Implicit method argument (e. g.: `p1.DistToOrig()` where `p1` is of type `Point`, the argument is `p1`)
- Encapsulation
  - controll of access through public functions (`function(x)` vs. `Function(x)`)
  - method cannot modify the data of the receiver (only copy is passed)
- Pointer receivers: `func (p *Point) OffsetX(v float64) {p.x = p.x + v}` calls by reference
  - no need for referencing (`{p.x = p.x + v}`) and dereferencing (can write `p1.OffsetX(5)`)
- Best practice: **all** methods have pointer receivers or **none of them**.

## Assignment[^1] 

### Main focus and shared code

There is one assignment for this week. Its detailed description can be found at the end of this document. Its **main focus** is on the basics of using Go in an object-oriented manner, namely
- to use structs as containers of related data
- to use receiver functions to bind dataset with related methods (basically create an object)
- to use receiver functions to get field values from a struct (basically as `getField()` methods in Java)

The code I share in [this repo](./quasiObjects.go) has the same focus. It does all three things listed above. It solves a bit more complicated problem. In the [previous course](../../Getting%20Started%20with%20Go) I shared [my own version](../../Getting%20Started%20with%20Go/Week%204/readwrite.go) of the assignemnt of [week 4](../../Getting%20Started%20with%20Go/Week%204) which already 
- used structs to store data
- used a special `get()` function to acces fields of the struct
- but it was **not** a receiver function

I upgraded that code to use recevier functions. The receiver functions of this week's assignment are a bit redundant as they are basically getter functions in a 1 file go program, where we have access to all the field values anyway (`valueAtField := Struct.field`). The code I share here has these "getter" functions too, but it also has a more general `get()` receiver function and a `toString()` receiver function (basically a Java type `toString()`). 

The shared program 
- reads `Flight` `struct`s sored in JSON format (they have 3 fields) 
- asks the user to choose a field 
- lists all the values of the chosen field across the loaded planes 
- ask the user to choose one of these values 
- writes all the planes that have the chosen value at the chosen field into a csv file. 

### The original assignment problem

#### What Does the Fox Say?

>"The goal of this assignment is to programmatically get information about a set of predefined objects using Go. \[...\] 
>
>Write a program which allows the user to get information about a predefined set of animals. Three animals are predefined, cow, bird, and snake. Each animal can eat, move, and speak. The user can issue a request to find out one of three things about an animal: 1) the food that it eats, 2) its method of locomotion, and 3) the sound it makes when it speaks. The following table contains the three animals and their associated data which should be hard-coded into your program. \[...\] 
>
>| Animal      | Food eaten  | Locomotion method | Spoken sound |
>| ----------- | ----------- | ----------------- | ------------ |
>| cow         | grass       | walk              | moo          |
>| bird        | worms       | fly               | peep         |
>| snake       | mice        | slither           | hsss         |
>
>Your program should present the user with a prompt, “>”, to indicate that the user can type a request. Your program accepts one request at a time from the user, prints out the answer to the request, and prints out a new prompt. Your program should continue in this loop forever. Every request from the user must be a single line containing 2 strings. The first string is the name of an animal, either “cow”, “bird”, or “snake”. The second string is the name of the information requested about the animal, either “eat”, “move”, or “speak”. Your program should process each request by printing out the requested data.
>
>You will need a data structure to hold the information about each animal. Make a type called `Animal` which is a struct containing three fields: `food`, `locomotion`, and `noise`, all of which are strings. Make three methods called `Eat()`, `Move()`, and `Speak()`. The receiver type of all of your methods should be your `Animal` type. The `Eat()` method should print the animal’s food, the `Move()` method should print the animal’s locomotion, and the `Speak()` method should print the animal’s spoken sound. Your program should call the appropriate method when the user makes a request."

[^1]: For ethical reasons I do not make my assignments publicly available. It is strictly against [Coursera Honor Code](https://www.coursera.support/s/article/209818863-Coursera-Honor-Code?language=en_US). However, I give a detailed description of the original problems, I highlight the main principles and techniques the problems want to check, and I give source code for another similar problem. The publicly available source code uses approximately the same principles and techniques as the original (maybe a bit more). 
