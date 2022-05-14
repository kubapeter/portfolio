<a href="../">
<img src="/img/Concurrency_in_Go_logo.avif" width="120" align="right">
</a>

# Week 1 <br> CONCURRENCY BASICS

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

Quite surprisingly the lecturer does not provide any technical details at all about how one can wirte the program. The video lectures do not give any clue about how can one define routines in Go. The solution itself is not very complicated, but it is surprising, that every little detail about it must be learnt from outside sources. Might as well say "Please learn Go language from somewhere and write a code to prove that you learnt it". 
