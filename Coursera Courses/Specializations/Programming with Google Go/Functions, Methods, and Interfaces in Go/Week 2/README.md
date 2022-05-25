<a href="../">
  <img src="/img/Functions,%20Methods,%20and%20Interfaces%20in%20Go%20logo.avif" width="120" align="right">
</a>

# Week 2 <br> FUNCTION TYPES

## Learning Objectives
- Identify advanced types, properties, and uses of functions.
- Identify the output that would result from running a given code block containing functions.
- Develop a routine containing functions in Go that solves a practical physics problem.

## Subjects covered: 
- Functions as first-calls values (functional programming)
  - variables as functions
  - functions as arguments
  - anonymous functions
  - functions as return values
- Environment and closure of a function
- Ellipsis e. g.: `...int` to define variable number of arguments (variadic function)
- Deferred function calls: `defer f(x)`

## Assignment[^1] 

There is one assignment for this week. Its detailed description can be found at the end of this document. Its **main focus** is on the use of first-class functions, namely
- function as a return value
- function as a variable and also
- function as an argument

The code I share [in this repo](conjugation.go) has the same focus. It does all three things listed above. The problem it solves seems to be quite different at first glance: 
- asks the user for a [regular](https://en.wikipedia.org/wiki/Regular_and_irregular_verbs) [German](https://en.wikipedia.org/wiki/German_conjugation) or [Spanish](https://en.wikipedia.org/wiki/Spanish_conjugation) verb, 
- finds out the language then 
- conjugates accordingly. 

### The original assignment problem

#### A linear kinematics problem

>"Let us assume the following formula for displacement *s* as a function of time *t*, acceleration *a*, initial velocity *v*<sub>0</sub>,
and initial displacement *s*<sub>0</sub> is the following: 
>
>*s* = ½ *a* *t*<sup>2</sup> + *vt* + *s*<sub>0</sub>.
>
>Write a program which first prompts the user to enter values for acceleration, initial velocity, and initial displacement. Then the program should prompt the user to enter a value for time and the program should compute the displacement after the entered time.
>
>You will need to define and use a function called `GenDisplaceFn()` which takes three `float64` arguments, acceleration *a*, initial velocity *v*<sub>0</sub>, and initial displacement *s*<sub>0</sub>. `GenDisplaceFn()` should return a function which computes displacement as a function of time, assuming the given values acceleration, initial velocity, and initial displacement. The function returned by `GenDisplaceFn()` should take one `float64` argument *t*, representing time, and return one `float64` argument which is the displacement travelled after time *t*."

[^1]: For ethical reasons I do not make my assignments publicly available. It is strictly against [Coursera Honor Code](https://www.coursera.support/s/article/209818863-Coursera-Honor-Code?language=en_US). However, I give a detailed description of the original problems, I highlight the main principles and techniques the problems want to check, and I give source code for another similar problem. The publicly available source code uses approximately the same principles and techniques as the original (maybe a bit more). 
