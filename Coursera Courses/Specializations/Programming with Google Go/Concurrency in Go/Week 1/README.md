<a href="https://www.coursera.org/learn/golang-concurrency">
<img src="/img/Concurrency_in_Go_logo.avif" width="120" height="120" align="right">
</a>

# Week 1 <br> Why Use Concurrency?

## Learning Objectives
- Identify basic terms and concepts related to concurrency.
- Identify hardware limitations that affect the design of future architectures.
- Explain Moore’s Law and how it affects the future of microprocessor design.

## Subjects covered
- Concurrency is built into Go
- Parallel execution - execute at the same time
  - non parallelizable or hardly parallelizable tasks
- Von Neumann bottleneck: the slower memory access delays execution even if the CPU is very fast
- Moore's law vs. 
  - von Neumann bottleneck: memory access time is a performance bottleneck
  - Power wall
  - Dennard Scaling: voltage should scale (downward) with transistor size (also cannot continue)
- Concurrent execution - start and end times overlap
  - hides latency (One task can execute while another task is waiting on something.)
- Mapping tasks to hardware is not the porgrammers responsibility
  - only decides what CAN be parallelized
  - os decides what really happens


