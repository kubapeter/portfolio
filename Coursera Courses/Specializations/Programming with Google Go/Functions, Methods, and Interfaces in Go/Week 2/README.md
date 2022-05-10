Week2: **FUNCTION TYPES**

Learning Objectives
- Identify advanced types, properties, and uses of functions.
- Identify the output that would result from running a given code block containing functions.
- Develop a routine containing functions in Go that solves a practical physics problem.

Subjects covered: 
- Functions as first-calls values (functional programming)
  - variables as functions
  - functions as arguments
  - anonymous functions
  - functions as return values
- Environment and closure of a function
- Ellipsis e. g.: `...int` to define variable number of arguments (variadic function)
- Deferred function calls: `defer f(x)`

Assignment: **Function as a return value**. [^1]

[^1]: Let us assume the following formula for displacement *s* as a function of time *t*, acceleration *a*, initial velocity *v0*,
and initial displacement *s0*.
  *s* = ½ *a* *t*2 + *v~0~**t* + *s~0~*
  Write a program which first prompts the user to enter values for acceleration, initial velocity, and initial displacement. Then the program should prompt the user to enter a value for time and the program should compute the displacement after the entered time.
  You will need to define and use a function called `GenDisplaceFn()` which takes three `float64` arguments, acceleration *a*, initial velocity *v0*, and initial displacement so. GenDisplaceFn() should return a function which computes displacement as a function of time, assuming the given values acceleration, initial velocity, and initial displacement. The function returned by GenDisplaceFn() should take one float64 argument t, representing time, and return one float64 argument which is the displacement travelled after time t.
