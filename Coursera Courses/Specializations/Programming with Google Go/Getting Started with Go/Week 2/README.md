<a href="../">
  <img src="/img/Getting%20Started%20with%20Go%20logo.avif" width="120" align="right">
</a>

# Week 2 <br> Basic Data Types

## Learning Objectives
- Describe the fundamental data types in Go.
- Explain how program flow is controlled in Go.
- Describe the process of garbage collection.
- Write and implement a Go program that manipulates floating-point numbers and performs truncation.
- Write and implement a Go program that manipulates strings.

## Subjects covered
- pointers
- variable scope
- garbage collection
- types
- some basic packages
- constants
- control flow

## Assignments[^1]

There are two assignments for week 2: 

#### 1. Simple type conversion

>"Write a program which prompts the user to enter a floating point number and prints the integer which is a truncated version of the floating point number that was entered. Truncation is the process of removing the digits to the right of the decimal place."

#### 2. Use of **"strings" package** and simple **control flow** (if-else)

>"Write a program which prompts the user to enter a string. The program searches through the entered string for the characters ‘i’, ‘a’, and ‘n’. The program should print “Found!” if the entered string starts with the character ‘i’, ends with the character ‘n’, and contains the character ‘a’. The program should print “Not Found!” otherwise. The program should not be case-sensitive, so it does not matter if the characters are upper-case or lower-case."

The main focus of the assignments is on 
- type conversion and
- control flow

The [code I share here](./week2.go) has the same focus. It prompts the user to enter a string that is a one digit number (e. g. "nine") and prints the same number as an integer.

[^1]: For ethical reasons I do not make my assignments publicly available. It is strictly against [Coursera Honor Code](https://www.coursera.support/s/article/209818863-Coursera-Honor-Code?language=en_US). However, I give a detailed description of the original problems, I highlight the main principles and techniques the problems want to check, and I give source code for another similar problem. The publicly available source code uses approximately the same principles and techniques as the original (maybe a bit more). 
