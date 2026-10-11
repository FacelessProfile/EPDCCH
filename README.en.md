# EPDCCH - Telecommunications Modeling in Matlab

Repository for research and simulation of telecommunication signals, transmission chains, and physical layer channels using Matlab and GNU Octave.

[Русская версия](README.md)

---

## Repository Structure

```text
.
├── .gitignore                      # Ignore rules for Matlab autosave and temporary files
├── LICENSE                         # Apache 2.0 License
├── README.md                       # Russian documentation
├── README.en.md                    # English documentation
├── docs/                           # Manuals and reference documents
│   └── Основы Matlab (студентам).pdf
├── lab1/                           # Lab 1: Introduction to Matlab/Octave
│   ├── graphic.jpg                 # Rendered visualization figure
│   └── lab1.m                      # Source script
├── lab2/                           # Lab 2: Signal Representation in the Simulation Model
│   ├── graphic_lab2.jpg            # Exported plot of filtering and demodulation
│   └── lab2.m                      # Source script
└── reports/                        # Weekly project reports
    ├── report_2026-10-04.md        # Report for week 1 (Lab 1)
    └── report_2026-10-11.md        # Report for week 2 (Lab 2)
```

---

## Laboratory Assignments

### Lab 1: Introduction to Matlab/Octave (`lab1/`)
* **Scope:** Basic syntax, constants, complex numbers, vector and matrix linear algebra, for and while loops with conditionals, statistical library functions, and graphics export.
* **Variant Parameters:** a = 24 (student index), b = 26 (group size).
* **Script:** [`lab1/lab1.m`](lab1/lab1.m)
* **Execution via Terminal:**
  ```bash
  cd lab1 && matlab -batch "run('lab1.m')"
  ```
* **Output Artifact:** [`lab1/graphic.jpg`](lab1/graphic.jpg)

### Lab 2: Signal Representation in the Simulation Model (`lab2/`)
* **Scope:** Harmonic oscillations, time discretization, amplitude spectrum via FFT (fft), AWGN channel modeling (wgn), moving average FIR filtering, carrier frequency up-conversion, coherent down-conversion, and Butterworth low-pass filtering (butter, filtfilt).
* **Variant Parameters:** frequency f = 5 rad/s, noise power N = -10 dBW, filter window Len = 3.
* **Script:** [`lab2/lab2.m`](lab2/lab2.m)
* **Execution via Terminal:**
  ```bash
  cd lab2 && matlab -batch "run('lab2.m')"
  ```
* **Output Artifact:** [`lab2/graphic_lab2.jpg`](lab2/graphic_lab2.jpg)

---

## Weekly Progress Reports

The [`reports/`](reports/) directory contains weekly progress reports following the project standard:
* [Report for Week 1 (28.09.2026 - 04.10.2026)](reports/report_2026-10-04.md): implementation of Lab 1 (basic syntax, vector-matrix operations, loops, statistics, and visualization).
* [Report for Week 2 (05.10.2026 - 11.10.2026)](reports/report_2026-10-11.md): implementation of Lab 2, spectral analysis, noise injection, modulation, and Butterworth filtering.

---

## Requirements

* Matlab R2020b or later (or GNU Octave 6+)
* Required toolboxes:
  * Signal Processing Toolbox (butter, filtfilt, filter)
  * Communications Toolbox (wgn)

---

## License

This project is licensed under the [Apache 2.0 License](LICENSE).
