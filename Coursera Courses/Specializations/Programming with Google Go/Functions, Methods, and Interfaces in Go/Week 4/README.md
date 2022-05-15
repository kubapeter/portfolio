<a href="../">
  <img src="/img/Functions,%20Methods,%20and%20Interfaces%20in%20Go%20logo.avif" width="120" align="right">
</a>

# Week 4 <br> INTERFACES FOR ABSTRACTION

## Learning Objectives
- Identify the basic characteristics and features of interfaces in Go.
- Identify the characteristics of polymorphism.
- Identify the features associated with overriding and inheritance.
- Develop an interactive Go routine that uses classes, objects, instances, structs, and methods to create new class instances and later query their properties.

## Subjects covered
- Polymorphism, overriding
- Absence of inheritance in Go 
- Interfaces in Go, no need for expicit declaration of extension
  - Dynamic types and values of interfaces
  - Nil dynamic value is possible with not nil dynamic type (methods of the type are callable!)
  - Nil dynamic is type possible (methods are not callable)
- Concrete types vs. interface types
- Ways to use an interface
  - function with multiple types of parameters
  - concealing type differences
  - error handling `type error interface { Error() string }`
- Empty interface: `interface{}`
- Exposing type differences: `rect, ok := shape.(Rectangle)` returns a `Rectangle` (if possible) and a `bool`.

## Assignment

>"The goal of this assignment is to write a GoLang routine that allows users to create a set of animals and then get information about those animals."[^1]

Main points, and own [shared code](./code.language) 

[^1]: "Write a program which allows the user to create a set of animals and to get information about those animals. Each animal has a name and can be either a cow, bird, or snake. With each command, the user can either create a new animal of one of the three types, or the user can request information about an animal that he/she has already created. Each animal has a unique name, defined by the user. Note that the user can define animals of a chosen type, but the types of animals are restricted to either cow, bird, or snake. The following table contains the three types of animals and their associated data. \[...\] 
  Your program should present the user with a prompt, “>”, to indicate that the user can type a request. Your program should accept one command at a time from the user, print out a response, and print out a new prompt on a new line. Your program should continue in this loop forever. Every command from the user must be either a “newanimal” command or a “query” command.

Each “newanimal” command must be a single line containing three strings. The first string is “newanimal”. The second string is an arbitrary string which will be the name of the new animal. The third string is the type of the new animal, either “cow”, “bird”, or “snake”.  Your program should process each newanimal command by creating the new animal and printing “Created it!” on the screen.

Each “query” command must be a single line containing 3 strings. The first string is “query”. The second string is the name of the animal. The third string is the name of the information requested about the animal, either “eat”, “move”, or “speak”. Your program should process each query command by printing out the requested data.

Define an interface type called Animal which describes the methods of an animal. Specifically, the Animal interface should contain the methods Eat(), Move(), and Speak(), which take no arguments and return no values. The Eat() method should print the animal’s food, the Move() method should print the animal’s locomotion, and the Speak() method should print the animal’s spoken sound. Define three types Cow, Bird, and Snake. For each of these three types, define methods Eat(), Move(), and Speak() so that the types Cow, Bird, and Snake all satisfy the Animal interface. When the user creates an animal, create an object of the appropriate type. Your program should call the appropriate method when the user issues a query command."
