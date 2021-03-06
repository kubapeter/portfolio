<a href="../">
  <img src="/img/Concurrency_in_Go_logo.avif" width="120" align="right">
</a>

# Week 4 <br> SYNCHRONIZED COMMUNICATION

## Learning Objectives
- Identify the uses of channels and how they are implemented in code.
- Identify the purpose of the “select” keyword and the meaning of “default clause.”
- Identify the definition of “mutual exclusion” and characteristics of a “deadlock."
- Develop a goroutine that makes use of concurrent algorithms and addresses synchronization issues.

## Subjects covered
- Iterating through a channel: `for i := range c { ... }` reads from channel continually
  - stops on `close(c)`
- Select: first-come first-served 
```go
    select {
      case a = <- c1: { ... }
      case b = <- c2: { ... }
    }
    
    //or
    
    select {
      case a = <- inchan: { ... }
      case outchan <- b: { ... }
    }    
```
- Abort channel to exit continual select
```go
    for {
      select {
        case a = <- c1: { ... }
        case b = <- abort: return
      }
    }
```
- Default select to exit avoid blocking
```go
    select {
      case a = <- c1: { ... }
      case b = <- c2: { ... }
      default: fmt.Println("I'm not blocking")
    }
```
- Concurrency-safe function
- Mutex (mutual exclusion): no access to shared variables at the same time
```go
    var i int = 0
    var mutx = sync.Mutex  // without Mutex inc() is not concurrency-safe
    func inc() {
      mutx.Lock()   // I use x, please don't touch it
      i = i + 1
      mutx.Unlock() // I'm finished with x anyone can use it
    }
```
- Synchronous Initialization: `sync.Once.Do(f)`
- Deadlock: circular dependencies between threads block the execution
- Dining philosophers problem


## Assignment

>"quote"

Main points, and own [shared code](./code.language) 
