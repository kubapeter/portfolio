<a href="../">
<img src="/img/Concurrency_in_Go_logo.avif" width="120" align="right">
</a>

# Week 2 <br> CONCURRENCY BASICS

## Learning Objectives
- Identify the characteristics of processes, concurrency, and threads.
- Explain how and why race conditions can arise.

## Subjects covered
- Processes
- Scheduling: operating system arranges concurrency
  - Context switch: control flow change from one process to another (takes time)
- Threads
  - one process can have many threads, they share context (e. g. virtual memory, file descriptors)
  - today scheduling is done on thread level 
- Goroutines ~ a thread in Go
  - Go Runtime Scheduler: schedules goroutines inside an OS thread (~ OS in OS)
- Interleavings
  - Race condition: outcome of the program depends on the interleaving (non-deterministic ordering)
  - those tasks should be on different threads that are highly independent

## Assignment

>"Write two goroutines which have a race condition when executed concurrently. Explain what the race condition is and how it can occur."

This is the only major inconsistency in the specialization. The practical details needed to solve this problem are only discussed in the lectures of the next week. The [solution](./raceCondition.go) itself is not very complicated. In fact, it is so simple, that I cloud not write a different shareable version. Basically any solution of this problem can be submitted no matter how it twist it. 
