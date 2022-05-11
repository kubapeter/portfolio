Week 4: **INTERFACES FOR ABSTRACTION**

Learning Objectives
- Identify the basic characteristics and features of interfaces in Go.
- Identify the characteristics of polymorphism.
- Identify the features associated with overriding and inheritance.
- Develop an interactive Go routine that uses classes, objects, instances, structs, and methods to create new class instances and later query their properties.

Subjects covered
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
- Empty interface: `interface{}`
- Exposing type differences: `rect, ok := shape.(Rectangle)` returns a `Rectangle` (if possible) and a `bool`.
