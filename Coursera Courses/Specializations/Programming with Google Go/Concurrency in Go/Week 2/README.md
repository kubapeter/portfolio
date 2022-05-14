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
