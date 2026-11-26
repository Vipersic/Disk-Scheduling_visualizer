# Disk Scheduling Visualizer & Performance Analyzer

**Capstone Project — Operating Systems (ENCS351)**  
**Department of Computer Science and Engineering**  
**School of Engineering and Technology, K.R. Mangalam University**

- **Submitted By:** Aditya Hans
- **Course:** Operating Systems (ENCS351)

---

## Overview

This repository implements a Java-based **Disk Scheduling Visualizer & Performance Analyzer** (Project #7 in the ENCS351 Operating Systems Capstone specification). It simulates, compares, and graphically plots disk read/write head trajectories across six classical disk scheduling algorithms using pure Java (`JDK 11+` and `Swing/Graphics2D` with zero external JAR dependencies).

## Implemented Disk Scheduling Algorithms

1. **FCFS (First-Come, First-Served):** Services cylinder requests strictly in arrival order.
2. **SSTF (Shortest Seek Time First):** Selects the pending cylinder closest to the current read/write head position.
3. **SCAN (Elevator Algorithm):** Sweeps toward the upper cylinder boundary (`199`), servicing requests along the way, then reverses direction.
4. **C-SCAN (Circular SCAN):** Sweeps to the upper boundary (`199`), jumps back to cylinder `0`, and continues servicing requests in the same direction.
5. **LOOK:** Sweeps toward the highest pending request without traveling unnecessarily to the physical disk boundary, then reverses.
6. **C-LOOK (Circular LOOK):** Sweeps to the highest pending request, jumps directly to the lowest pending request, and continues upward.

## Repository Structure

```text
ENCS351-Disk-Scheduling-Visualizer/
├── src/
│   ├── DiskAlgorithmEngine.java   # Core FCFS, SSTF, SCAN, C-SCAN, LOOK, C-LOOK engine
│   ├── DiskVisualizerGUI.java     # Interactive Java Swing & Graphics2D trajectory plotter
│   └── Main.java                  # Dual GUI and CLI batch execution entry point
├── tests/
│   └── sample_requests.txt        # Manual benchmark: Head=53, Queue=[98,183,37,122,14,124,65,67]
├── Makefile                       # Compilation & execution targets
├── .gitignore
└── README.md
```

## Build & Run

### 1. Compile
```bash
make compile
```

### 2. Launch Interactive GUI Visualizer
```bash
make gui
```

### 3. Run Command-Line Benchmark Mode
```bash
make cli
```

## Sample CLI Benchmark Output (`Head = 53`, `Cylinders = 0..199`)

```text
================================================================================
DISK SCHEDULING PERFORMANCE REPORT (ENCS351 Capstone)
Initial Head: 53 | Disk Range: [0..199] | Requests (8): [98, 183, 37, 122, 14, 124, 65, 67]
================================================================================
Algorithm  | Total Head Movement  | Avg Seek Time   | Seek Sequence
--------------------------------------------------------------------------------
FCFS       | 640                  | 80.00           | [53, 98, 183, 37, 122, 14, 124, 65, 67]
SSTF       | 236                  | 29.50           | [53, 65, 67, 37, 14, 98, 122, 124, 183]
SCAN       | 331                  | 41.38           | [53, 65, 67, 98, 122, 124, 183, 199, 37, 14]
C-SCAN     | 382                  | 47.75           | [53, 65, 67, 98, 122, 124, 183, 199, 0, 14, 37]
LOOK       | 299                  | 37.38           | [53, 65, 67, 98, 122, 124, 183, 37, 14]
C-LOOK     | 322                  | 40.25           | [53, 65, 67, 98, 122, 124, 183, 14, 37]
================================================================================
Optimal Algorithm for Workload: SSTF (Minimum Seek = 236 cylinders)
```
