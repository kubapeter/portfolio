// There are two goroutines in main(). Go runtime scheduler decides the 
// order of the execution. Each time it can be different. For most runs 
// it prints "_+", but sometimes it prints "+_". This is due to the fact 
// that both goroutines are communicating through variable str. Race 
// condition occures because the access of this shared variable is 
// non-deterministic.
//
// If you "comment back" the outcommented section, you will get a visually 
// very convincing representation of the race condition. (Although this uses 
// 120 go routines (122 in fact) instead of the required 2.)

package main

import(
	"fmt"
	"sync"
) 

var str string

func underscore(wg *sync.WaitGroup) { 
	str += "_"
	wg.Done()
}

func plus(wg *sync.WaitGroup) { 
	str += "+"
	wg.Done()
}

func main(){
	var wg sync.WaitGroup

	wg.Add(1)
	go underscore(&wg)

	wg.Add(1)
	go plus(&wg)

	// for i := 0; i < 60; i++ {
	// 	wg.Add(1)
	// 	go underscore(&wg)
	// 	wg.Add(1)
	// 	go plus(&wg)
	// }
	
	wg.Wait()
	fmt.Println(str)
}
