Week 1: **Why Use Concurrency?**

Learning Objectives
- Identify basic terms and concepts related to concurrency.
- Identify hardware limitations that affect the design of future architectures.
- Explain Moore’s Law and how it affects the future of microprocessor design.

Subjects covered
- Concurrency is built into Go
- Parallel execution
  - non parallelizable or hardly parallelizable tasks
- Von Neumann bottleneck: the slower memory access delays execution even if the CPU is very fast
  - to mitigate this: cache memory (~100 times faster)
- Moore's law
  - Power wall
  - Dennard Scaling: voltage should scale (downward) with transistor size


physical limitations
- Von Neumann bottleneck
- processor density doubles, smaller transistor faster, exponential density increase -> exponential speed increase 
- power wall: smaller transistor uses less power but density scaling much faster -> high temperature -> 
  - more of a temperature wall, but power is problem because of battery run out
  - liquid cooling is not an option for desktop or laptop
  - reduced voltage can lead to reduced power (Dennard), but must be higher than threshold voltage of transistor
    - plus noise problems
  - ghdfgh
