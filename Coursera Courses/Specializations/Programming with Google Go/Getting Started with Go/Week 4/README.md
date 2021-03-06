<a href="../">
  <img src="/img/Getting%20Started%20with%20Go%20logo.avif" width="120" align="right">
</a>

# Week 4 <br> Protocols and Formats

## Learning Objectives
- Describe remote function calls (RFCs).
- Describe JavaScript Object Notation (JSON).
- Describe methods for accessing data in files.
- Write and implement a Go program that employs RFCs and JSON.
- Write and implement a Go program that reads structured text data from a file and then performs some manipulations with those data.

## Subjects covered
- Protocol packages
- JSON 
- file access (ioutil, os)

## Assignments[^1]

There are two assignments for week 2. Their detailed description can be found below. Their **main focus** is on
- Writing and reading data to and from file
- Using JSON for data storing
- transform data read from file

The [code I share here](./readwrite.go) has the same focus. It 
- reads JSON objects from a file, 
- unmarshals them to instances of a struct, 
- asks the user to choose one of the fields, 
- gives back all the existing values of the field (values of all instances)
- asks the user to choose one of the listed values and 
- writes all the instances that has the chosen value at the chosen field to a csv file. 

### The original assignment problems

#### 1. Create JSON from user input

>"Write a program which prompts the user to first enter a name, and then enter an address. Your program should create a map and add the name and address to the map using the keys “name” and “address”, respectively. Your program should use Marshal() to create a JSON object from the map, and then your program should print the JSON object."

#### 2. Create structs from file

>"Your program should prompt the user for the name of the text file. Your program will successively read each line of the text file and create a struct which contains the first and last names found in the file. Each struct created will be added to a slice, and after all lines have been read from the file, your program will have a slice containing one struct for each line in the file. After reading all lines from the file, your program should iterate through your slice of structs and print the first and last names found in each struct."

[^1]: For ethical reasons I do not make my assignments publicly available. It is strictly against [Coursera Honor Code](https://www.coursera.support/s/article/209818863-Coursera-Honor-Code?language=en_US). However, I give a detailed description of the original problems, I highlight the main principles and techniques the problems want to check, and I give source code for another similar problem. The publicly available source code uses approximately the same principles and techniques as the original (maybe a bit more). 
