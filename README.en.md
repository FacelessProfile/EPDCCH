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
│   ├── Основы Matlab (студентам).pdf
│   └── Практики. Студентам.pdf
├── labs/                           # Root folder for all laboratory assignments
│   ├── lab1/                       # Lab 1: Introduction to Matlab/Octave
│   │   ├── graphic.jpg             # Rendered visualization figure
│   │   └── lab1.m                  # Source script
│   ├── lab2/                       # Lab 2: Signal Representation in the Simulation Model
│   │   ├── graphic_lab2.jpg        # Exported plot of filtering and demodulation
│   │   └── lab2.m                  # Source script
│   ├── lab3/                       # Lab 3: Channel Capacity Calculation via Shannon's Theorem
│   │   ├── graphic_lab3.jpg        # Exported curves of C(d), C(f), C(B)
│   │   └── lab3.m                  # Source script
│   ├── lab4/                       # Lab 4 (Practice 1): Character Encoding
│   │   └── lab4.m                  # Sign encoder and decoder (64-character alphabet)
│   └── lab5/                       # Lab 5 (Practice 2): Convolutional Code & Viterbi Decoder
│       └── lab5.m                  # Convolutional encoder K=7 and manual Viterbi decoder
└── reports/                        # Weekly project reports
    ├── report_2026-10-04.md        # Report for week 1 (Lab 1)
    ├── report_2026-10-11.md        # Report for week 2 (Lab 2)
    ├── report_2026-10-18.md        # Report for week 3 (Lab 3)
    ├── report_2026-10-25.md        # Report for week 4 (Lab 4 / Practice 1)
    └── report_2026-11-01.md        # Report for week 5 (Lab 5 / Practice 2)
```

---

## Laboratory Assignments

### Lab 1: Introduction to Matlab/Octave (`labs/lab1/`)
* **Scope:** Basic syntax, constants, complex numbers, vector and matrix linear algebra, for and while loops with conditionals, statistical library functions, and graphics export.
* **Variant Parameters:** a = 24 (student index), b = 26 (group size).
* **Script:** [`labs/lab1/lab1.m`](labs/lab1/lab1.m)
* **Execution via Terminal:**
  ```bash
  cd labs/lab1 && matlab -batch "run('lab1.m')"
  ```
* **Output Artifact:** [`labs/lab1/graphic.jpg`](labs/lab1/graphic.jpg)

### Lab 2: Signal Representation in the Simulation Model (`labs/lab2/`)
* **Scope:** Harmonic oscillations, time discretization, amplitude spectrum via FFT (fft), AWGN channel modeling (wgn), moving average FIR filtering, carrier frequency up-conversion, coherent down-conversion, and Butterworth low-pass filtering (butter, filtfilt).
* **Variant Parameters:** frequency f = 5 rad/s, noise power N = -10 dBW, filter window Len = 3.
* **Script:** [`labs/lab2/lab2.m`](labs/lab2/lab2.m)
* **Execution via Terminal:**
  ```bash
  cd labs/lab2 && matlab -batch "run('lab2.m')"
  ```
* **Output Artifact:** [`labs/lab2/graphic_lab2.jpg`](labs/lab2/graphic_lab2.jpg)

### Lab 3: Point-to-Point Channel Capacity Calculation via Shannon's Theorem (`labs/lab3/`)
* **Scope:** Modeling point-to-point channel capacity under additive white Gaussian noise (AWGN) via the Shannon-Hartley theorem. Free-space path loss attenuation, parametric analysis of distance dependence $C(d)$ ($1d \dots 50d$), carrier frequency dependence $C(f)$ ($0.1f \dots 2f$), bandwidth dependence $C(B)$ ($0.01B \dots 10B$), and asymptotic Shannon limit as $B \to \infty$.
* **Variant 8 Parameters:** bandwidth $B = 11$ MHz, carrier frequency $f = 2.1$ GHz, parameter combination (3, 3, 3, 2, 2, 2). Transmitter power $P = 1.0$ W, noise spectral density $N_0 = 10^{-15}$ W/Hz, base distance $d = 100$ м.
* **Script:** [`labs/lab3/lab3.m`](labs/lab3/lab3.m)
* **Execution via Terminal:**
  ```bash
  cd labs/lab3 && matlab -batch "run('lab3.m')"
  ```
* **Output Artifact:** [`labs/lab3/graphic_lab3.jpg`](labs/lab3/graphic_lab3.jpg)

### Lab 4 (Practice 1): Character Encoding (`labs/lab4/`)
* **Scope:** Conversion of text message to binary bit stream and reverse decoding without high-level conversion functions (`dec2bin`, `typecast`). 64-character alphabet (`a-z`, `A-Z`, `0-9`, space, dot), 6 bits per character.
* **Variant 8 Parameters:** message length of 45 characters (270 bits).
* **Script:** [`labs/lab4/lab4.m`](labs/lab4/lab4.m)
* **Execution via Terminal:**
  ```bash
  cd labs/lab4 && matlab -batch "lab4"
  ```

### Lab 5 (Practice 2): Error-Correction Coding & Viterbi Decoder (`labs/lab5/`)
* **Scope:** Convolutional encoder with rate $R = 1/2$, constraint length $K = 7$ (generator polynomials $[171_{oct}, 133_{oct}]$), bit-error insertion in channel, and custom hard-decision 64-state Viterbi decoder implemented from scratch. End-to-end integration with Lab 4.
* **Variant 8 Parameters:** message length of 45 characters, corrects all 6 injected channel errors.
* **Script:** [`labs/lab5/lab5.m`](labs/lab5/lab5.m)
* **Execution via Terminal:**
  ```bash
  cd labs/lab5 && matlab -batch "lab5"
  ```

---

## Weekly Progress Reports

The [`reports/`](reports/) directory contains weekly progress reports following the project standard:
* [Report for Week 1 (28.09.2026 - 04.10.2026)](reports/report_2026-10-04.md): implementation of Lab 1 (basic syntax, vector-matrix operations, loops, statistics, and visualization).
* [Report for Week 2 (05.10.2026 - 11.10.2026)](reports/report_2026-10-11.md): implementation of Lab 2, spectral analysis, noise injection, modulation, and Butterworth filtering.
* [Report for Week 3 (12.10.2026 - 18.10.2026)](reports/report_2026-10-18.md): implementation of Lab 3, channel capacity calculation via Shannon's theorem, analysis of $C(d)$, $C(f)$, $C(B)$, and project reorganization into the `labs/` directory.
* [Report for Week 4 (19.10.2026 - 25.10.2026)](reports/report_2026-10-25.md): implementation of Lab 4 (Practice 1: character encoding, 64-character alphabet, 45 characters for variant 8).
* [Report for Week 5 (26.10.2026 - 01.11.2026)](reports/report_2026-11-01.md): implementation of Lab 5 (Practice 2: convolutional coding $K=7$, noisy channel, manual 64-state Viterbi decoder).

---

## Requirements

* Matlab R2020b or later (or GNU Octave 6+)
* Required toolboxes:
  * Signal Processing Toolbox (butter, filtfilt, filter)
  * Communications Toolbox (wgn)

---

## License

This project is licensed under the [Apache 2.0 License](LICENSE).
