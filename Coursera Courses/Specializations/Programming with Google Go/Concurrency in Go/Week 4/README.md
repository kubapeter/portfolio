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
```

## Assignment

>"quote"

Main points, and own [shared code](./code.language) 
