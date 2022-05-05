/*
Note that for etical reasons this is not the assignment submitted. I use 
roughly the same knowledge that I used for the assignment, but the problem 
I solve is my own creation.

The program prompts the user to enter a string that is a one digit number 
and prints the same number as an integer.
*/

package main

import "fmt"

func main() {

	var numAsString string
	var numAsInt int8

	fmt.Println("Enter an integer number as a string between zero and nine:")
	fmt.Scan(&numAsString)
	
	switch numAsString {
        case "zero":
        numAsInt = 0
        case "one":
        numAsInt = 1
        case "two":
        numAsInt = 2
        case "three":
        numAsInt = 3
        case "four":
        numAsInt = 4
        case "five":
        numAsInt = 5
        case "six":
        numAsInt = 6
        case "seven":
        numAsInt = 7
        case "eight":
        numAsInt = 8
        case "nine":
        numAsInt = 9
        default:
        numAsInt = -1
        fmt.Println("Cannot identify the string")
    }
    
    if numAsInt != -1 {
        fmt.Println("The entered number is an int:", numAsInt)
    }
}
