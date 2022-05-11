Week 3: **OBJECT ORIENTATION IN GO**

Learning Objectives
- Identify the basic properties and uses of objects and classes.
- Identify the differences between structs (in Go) and classes (in an object-oriented language).
- Identify the uses of methods and different data types.
- Develop an interactive Go routine that uses classes, objects, instances, structs, and methods to query the properties of existing instances.

Subjects covered
- No `class` keyword, but possible to associate methods with a dataset (with structs)
  - Receiver type: `func (p Point) DistToOrig() {...}` can only be called on structs of type `Point` (calls by value)
  - Implicit method argument (e. g.: `p1.DistToOrig()` where `p1` is of type `Point`, the argument is `p1`)
- Encapsulation
  - controll of access through public functions (`function(x)` and `Function(x)`)
  - method cannot modify the data of the receiver (only copy is passed)
- Pointer receivers: `func (p *Point) OffsetX(v float64) {p.x = p.x + v}` calls by reference
  - no need for referencing (`{p.x = p.x + v}`) and dereferencing (can write `p1.OffsetX(5)`)
- Best practice: **all** methods have pointer receivers or **none of them**.

Assignment
The assignment for this week is a program that calls field values from a struct[^1]. 


[^1]: "Write a program which allows the user to get information about a predefined set of animals. Three animals are predefined, cow, bird, and snake. Each animal can eat, move, and speak. The user can issue a request to find out one of three things about an animal: 1) the food that it eats, 2) its method of locomotion, and 3) the sound it makes when it speaks. The following table contains the three animals and their associated data which should be hard-coded into your program."
|Header1 |Header2  | Header3|
|:--- | ---: | :---:|
|Align left| Align right|center text|
|cell data1|cell data2|cell data3|
