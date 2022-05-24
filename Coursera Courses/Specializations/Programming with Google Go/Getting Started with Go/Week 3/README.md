<a href="../">
  <img src="/img/Getting%20Started%20with%20Go%20logo.avif" width="120" align="right">
</a>

# Week 3 <br> Composite Data Types

## Learning Objectives
- Describe arrays, slices, maps, and structs. Explain how they are used in Go programming.
- Write a Go program employing a loop structure that fills a slice with an arbitrary number of integers.

## Subjects covered
- arrays and slices
- hash tables and maps
- structs

## Assignment[^1]

>"Write a program which prompts the user to enter integers and stores the integers in a sorted slice. The program should be written as a loop. Before entering the loop, the program should create an empty integer slice of size (length) 3. During each pass through the loop, the program prompts the user to enter an integer to be added to the slice. The program adds the integer to the slice, sorts the slice, and prints the contents of the slice in sorted order. The slice must grow in size to accommodate any number of integers which the user decides to enter. The program should only quit (exiting the loop) when the user enters the character ‘X’ instead of an integer."

The main focus of the assignments is on 
- scanning user input
- storing data in slice
- do operation on slice

The [code I share here](./week3.go) has similar focus. The user can bulid a fleet of airplanes (slice of structs), and put a captain and a first officer in the cockpit (both structs). When the build is finished the program finds the youngest and oldest of all the crews (sorting of slice) and prints their name, age and the name of the plane they are on. 

[^1]: For ethical reasons I do not make my assignments publicly available. It is strictly against [Coursera Honor Code](https://www.coursera.support/s/article/209818863-Coursera-Honor-Code?language=en_US). However, I give a detailed description of the original problems, I highlight the main principles and techniques the problems want to check, and I give source code for another similar problem. The publicly available source code uses approximately the same principles and techniques as the original (maybe a bit more). 
