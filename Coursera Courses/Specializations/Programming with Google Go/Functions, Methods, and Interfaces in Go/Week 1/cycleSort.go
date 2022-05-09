package main

import (
	"fmt"
	"strconv"
	"math"
)

func stringToInt(input string) (int, bool) {
	scannedNum, err := strconv.Atoi(input)
        if err != nil {
            fmt.Printf("That is not an integer. Enter an integer, or press Q to quit: ")
			return 0, false
        } 
	return scannedNum, true
}

func scanInput(input string) (int, bool){
	for {
		fmt.Scan(&input)
		if input == "Q" {
			return 0, true
		} else {
			userInt, conversionDone := stringToInt(input)
			if conversionDone == false {
				continue
			}
			return userInt, false
		}
	}
}

func scanAllUserInput() []int {
	var userInput string
	var container []int

	fmt.Println("You can enter up to 10 numbers. The program will sort them.")
	for i := 0; i < 10; i++ {
		fmt.Printf("Enter a number, or press Q to quit (you can enter %d more numbers): ", 10 - i)
		numInput, quit := scanInput(userInput)
		if quit {
			break
		} else {
			container = append(container, numInput)
		}
	}
	return container
}

func swap(slice []int, i1, i2 int) {
	slice[i1], slice[i2] = slice[i2], slice[i1]
}

func orderPair(slice []int, i1 int, i2 int) bool {
	pairUnvaried := true
	if slice[i1] > slice[i2] {
		swap(slice, i1, i2)
		pairUnvaried = false
	}
	return pairUnvaried
}

func orderWithGivenGap(slice []int, gap int, isSorted bool) bool{
	for i := 0; i + gap < len(slice); i++ {
		pairUnvaried := orderPair(slice, i, i + gap)
		isSorted = isSorted && pairUnvaried
	}
	return isSorted
}

func adjustGap(gap int, shrink float64, maybeFinalLoop bool) (int, bool) {
	gap = int(math.Floor((float64(gap) / shrink)))
	if gap <= 1 {
		gap = 1
		maybeFinalLoop = true
	}
	return gap, maybeFinalLoop
}

func combSort(slice []int) {
	gap := len(slice)
	shrink := 1.3
	isSorted := false

	for isSorted == false {
		gap, isSorted = adjustGap(gap, shrink, isSorted)
		isSorted = orderWithGivenGap(slice, gap, isSorted)	
	}
}

func main() {
	
	userSlice := scanAllUserInput()
	fmt.Println("The numbers you entered are: ", userSlice)
	combSort(userSlice)
	fmt.Println("The entered numbers sorted are: ", userSlice)
}
