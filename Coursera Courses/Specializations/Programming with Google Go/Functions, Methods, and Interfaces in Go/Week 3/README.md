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

## Assignment

The assignment for this week is a program that calls field values from a struct[^1]. The main emphasis is on the basics of using Go in an object-oriented manner, namely
- to use structs as containers of related data
- to use receiver functions to bind dataset with methods (basically create an object)
- to use receiver functions to get field values from a struct (basically as `getField()` methods in other OO languages)

The code I present in [this repo](./) also fulfills these requirements, but it is not the one I submitted. It solves a bit more complicated problem. In the [previous course] I shared [my own version] of the assignemnt of [week 4] which already 
- contained data as structs
- used a special `get()` function to acces fields of the struct
- but it was **not** a receiver function

I upgraded that code to use recevier functions. The receiver functions of the original assignment are a bit redundant as they are basically getter functions in a 1 file go program, where we have access to all the filed values (`valueAtField := Struct.field`). In this shared code there are these "getter" functions, but also a more general `get()` receiver function and a `toString()` receiver function (basically a Java type `toString()`). 

The shared program reads flights sored in JSON format. These are objects with 3 fields. Asks the user to choose a field, lists all the values of the chosen field across the loaded planes, ask the user to choose one of them, and writes all the planes that have the chosen value at the chosen field into a csv file. 


[^1]: "Write a program which allows the user to get information about a predefined set of animals. Three animals are predefined, cow, bird, and snake. Each animal can eat, move, and speak. The user can issue a request to find out one of three things about an animal: 1) the food that it eats, 2) its method of locomotion, and 3) the sound it makes when it speaks. The following table contains the three animals and their associated data which should be hard-coded into your program. \[...\] 
  Your program should present the user with a prompt, “>”, to indicate that the user can type a request. Your program accepts one request at a time from the user, prints out the answer to the request, and prints out a new prompt. Your program should continue in this loop forever. Every request from the user must be a single line containing 2 strings. The first string is the name of an animal, either “cow”, “bird”, or “snake”. The second string is the name of the information requested about the animal, either “eat”, “move”, or “speak”. Your program should process each request by printing out the requested data.
  You will need a data structure to hold the information about each animal. Make a type called `Animal` which is a struct containing three fields: `food`, `locomotion`, and `noise`, all of which are strings. Make three methods called `Eat()`, `Move()`, and `Speak()`. The receiver type of all of your methods should be your `Animal` type. The `Eat()` method should print the animal’s food, the `Move()` method should print the animal’s locomotion, and the `Speak()` method should print the animal’s spoken sound. Your program should call the appropriate method when the user makes a request."
