<a href="../">
<img src="/img/Concurrency_in_Go_logo.avif" width="120" align="right">
</a>

# Week 3 <br> THREADS IN GO

## Learning Objectives
- Identify features and operational characteristics of goroutines.
- Identify reasons for introducing synchronization in a goroutine.
- Write a goroutine that uses threads to sort integers via four sub-arrays that are then merged into a single array.

## Subjects covered
- `go` keyword to create goroutines
- Exiting goroutines
- Sychronization (`sync.WaitGroup`)
- Threads
  - communication of threads: channels 
  ```go
    c := make(chan int); 
    c <- 3; 
    x := <- 3
  ```
  - 

## Assignment

>"quote"

Main points, and own [shared code](./code.language) 
