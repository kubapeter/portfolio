// There are two goroutines in main(). Go runtime scheduler decides the 
//order of the execution. Each time it can be different. For most runs 
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
	"time"
) 

var str string

func main(){

	go func () { str += "_"} ()
	go func () { str += "+"} ()

	// for i := 0; i < 60; i++ {
	// 	go func () { str += "_"} ()
	// 	go func () { str += "+"} ()
	// }

    time.Sleep(1 * time.Second)
	fmt.Println(str)
}