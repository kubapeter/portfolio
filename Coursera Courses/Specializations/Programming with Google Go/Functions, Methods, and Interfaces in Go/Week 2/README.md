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

Assignment: **Function as a return value**. [^1] The main emphasis is on using the possibility of functions as return values. The code I present [in this repo](conjugation.go) also concentrates on this, but it is not the one I submitted. It has
- function as a return value
- function as a variable and also
- function as an argument

The problem it solves seems to be quite different on the surface: asks the user for a regular German or Spanish verb, finds out the language then conjugates accordingly. 

[^1]: Let us assume the following formula for displacement *s* as a function of time *t*, acceleration *a*, initial velocity *v*<sub>0</sub>,
and initial displacement *s*<sub>0</sub> is the following: 
  *s* = ½ *a* *t*<sup>2</sup> + *vt* + *s*<sub>0</sub>.
  Write a program which first prompts the user to enter values for acceleration, initial velocity, and initial displacement. Then the program should prompt the user to enter a value for time and the program should compute the displacement after the entered time.
  You will need to define and use a function called `GenDisplaceFn()` which takes three `float64` arguments, acceleration *a*, initial velocity *v*<sub>0</sub>, and initial displacement *s*<sub>0</sub>. `GenDisplaceFn()` should return a function which computes displacement as a function of time, assuming the given values acceleration, initial velocity, and initial displacement. The function returned by `GenDisplaceFn()` should take one `float64` argument *t*, representing time, and return one `float64` argument which is the displacement travelled after time *t*.
