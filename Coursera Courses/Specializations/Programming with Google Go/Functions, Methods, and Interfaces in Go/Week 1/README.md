Week 1: FUNCTIONS AND ORGANIZATION

Learning Objectives

- Identify the basic features and purposes of functions.
- Identify the benefits of using pointers when working with functions.
- Identify the difference between passing a slice and an array as function arguments.
- Use functions and a slice to implement a sorting routine for integers.

There is one assignment for this week. **Bubble sort algorithm**. [^assignment_detailed] The main emphasis is on 
- decomposing functions to smaller functions that are
  -  (re)usable
  -  understandable
- giving descriptive function and variable names. 

The code I present [in this repo](https://github.com/kubapeter/portfolio/blob/main/Coursera%20Courses/Specializations/Programming%20with%20Google%20Go/Functions%2C%20Methods%2C%20and%20Interfaces%20in%20Go/Week%201/combSort.go) concentrates on the same principles, but it is not the one I submitted. It solves a similar problem: sorts the user input, but with [comb sort](https://en.wikipedia.org/wiki/Comb_sort) algorithm. 
[^assignment_detailed]: "Write a Bubble Sort program in Go. The program should prompt the user to type in a sequence of up to 10 integers. The program should print the integers out on one line, in sorted order, from least to greatest. 
  As part of this program, you should write a function called BubbleSort() which takes a slice of integers as an argument and returns nothing. The BubbleSort()  function should modify the slice so that the elements are in sorted order.
  A recurring operation in the bubble sort algorithm is the Swap operation which swaps the position of two adjacent elements in the slice. You should write a Swap() function which performs this operation. Your Swap() function should take two arguments, a slice of integers and an index value i which indicates a position in the slice. The Swap() function should return nothing, but it should swap the contents of the slice in position i with the contents in position i+1."
