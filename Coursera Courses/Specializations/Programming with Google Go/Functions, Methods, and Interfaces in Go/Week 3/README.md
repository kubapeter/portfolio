Week 3: **OBJECT ORIENTATION IN GO**

Learning Objectives
- Identify the basic properties and uses of objects and classes.
- Identify the differences between structs (in Go) and classes (in an object-oriented language).
- Identify the uses of methods and different data types.
- Develop an interactive Go routine that uses classes, objects, instances, structs, and methods to query the properties of existing instances.

Subjects covered
- Encapsulation
  - controll of access through public functions (`function(x)` and `Function(x)`)
- No `class` keyword, but possible to associate methods with a dataset (with structs)
  - Receiver type: `func (p Point) DistToOrig() {...}` can only be called on structs of type `Point`
  - Implicit method argument (e. g.: `p1.DistToOrig()` where `p1` is of type `Point`, the argument is `p1`)
- 
