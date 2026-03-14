# Midterm 1

## **Chapter 1**

## Response Time and Throughput

- Response Time
  - How long it takes to do a task
- Throughput
  - Total work done per unit of time e.g. tasks/hr

- Relative Performance
  - performance_x / performance_y = execution_time_y / execution_time_x = n
  - Example time taken to run a program
    - 10s on A and 15s on B
    - Time_b / time_a = 15/10 = 1.5
    - So A is 1.5 times faster than B.

  - Measuring Time
    - Elapsed time
      - Includes total response time to include things like processing, IO, OS overhead
    - CPU Time
      - Time spent processing a job
      - Doesn't count I/O time or when other jobs are running on the CPU
    - Clock period: duration of a clock cycle
    - Clock Freq (rate): cycles per second

  ```
  CPU Time = CPU Clock Cycles X Clock Cycle Time

  = Clock Cycles / Clock Rate
  ```

  **Example:**
  - A: 2GHz clock, 10s CPU Time
  - B: Aim for 6s CPU time and faster clock but causes 1.2 x clock cycles

    Clock Rate_b = Cycles_b / time_b
                 = 1.2 x cycles_a / 6s  

    cycles_a = time_a x rate_a
             = 10s x 2GHz = 20x10^9

    rate_b = 1.2 x 20x10^9 / 6s
           = 24x10^9 / 6s = 4GHz

  ### Instruction Count and Cycles per Instruction (CPI)

   ```
   Clock Cycles = Instruction Count X Cycles per Instruction

   CPU Time = Instruction Count x CPI x Clock Cycle Time
            = (Instruction Count x CPI) / Clock Rate
   ```

  - Instruction count depends on program, ISA, and Compiler
  - Cycles per Instruction depends on CPU Hardware and different Instructions have different CPI

**Example:**

    A: Cycle Time = 250ps, CPI = 2.0

    B: Cycle Time = 500ps, CPI = 1.2

    CPU Time = Instruction Count x CPI x Clock Cycle Time
    time_a = I x 2.0 x 250 = I x 500ps
    
    time_b = I x 1.2 x 500 = I x 600ps
    So A is faster 
    
    time_b / time_a = 600ps / 500ps = 1.2  A is this much faster than B. 

**CPI Example:
  Compiled Code sequences using Instructions in classes A, B, C**

|CLASS |A|B|C|
|------|-|-|-|
|CPI|1|2|3|
|IC in sequence 1|2|1|2|
|IC in sequence 2|4|1|1|

```
Sequence 1: IC = 5
Clock Cycles = 2x1 + 1x2 + 2x3 = 10 
Avg. CPI = 10 / 5 = 2.0 

Sequence 2: IC = 6 
Clock Cycles = 4x1 + 1x2 + 1x3 = 9 
Avg. CPI = 9 / 6 = 1.5 
```

## Performance Summary

CPU Time = $\frac{Instructions}{Program}$ X $\frac{Clock Cycles}{Instruction}$ x $\frac{Seconds}{Clock Cycle}$

**Exercise 1**

Two processors P1 and P2. P1 has 3GHz CPU and CPI of 1.5. P2 has 2GHz CPU and CPI of 1.0.
Which processor is higher in number of instructions per second?

CPI x Number of instructions = CPU Cycles

1.5 x Instructions = $\frac{3G Hz}{second *1}$
Instructions = $\frac{3}{1.5}$ = 2G

## Power Trends

- In CMOS IC Technology

$Power$ = $Capacitive$ $load$ x $Voltage^2$ x $Frequency$

## Reducing Power

- Suppose a new CPU has
  - 85% of Capacitive load of old cpu
  - 15% voltage and 15% Frequency reduction

$$
\begin{aligned}
\frac{P_n}{P_o} &= \frac{C_o \times 0.85 \times (V_o \times 0.85)^2 \times F_o \times 0.85}{C_o \times V_o^2 \times F_o}

     &= 0.85^4
     &= 0.52
\end{aligned}
$$

## Multiprocessors

- More than one processor per chip

## Amdhal's Law

- Improving an aspect of a computer and expecting a proportional improvement in overall performance

$$
T_{\text{improved}} = \frac{T_{\text{affected}}}{\text{improvement factor}} + T_{\text{unaffected}}
$$

**Example: Multiply accounts for 80s/100s**

- How much improvement in Multiply performance to get 5x overall?

$$
  20 = \frac{80}{\text{n}} + 20
$$

Can't be done!

## **Pitfall: MIPS as a Performance Metric**

- Doesn't account for
  - Differences in ISA between computers
  - Differences in complexity between instructions

$$
\begin{aligned}

\text{MIPS} &= \frac{\text{Instruction Count}}{\text{Execution time} \times 10^6}

&= \frac{\text{Instruction count}}{{\frac{Instruction count \times \text{CPI}}{\text{Clock Rate}} \times 10^6 }}

&= \frac{\text{Clock Rate}}{\text{CPI} \times 10^6}

\end{aligned}
$$
place
