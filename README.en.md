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
├── dsp_lib/                        # Unified DSP library containing all practice functions
│   ├── char_encode.m               # Character encoder
│   ├── char_decode.m               # Character decoder
│   ├── conv_encode.m               # Convolutional encoder K=7
│   ├── viterbi_decode.m            # 64-state Viterbi decoder
│   ├── interleave.m                # Bit interleaver
│   ├── inv_interleave.m            # Bit deinterleaver
│   ├── qpsk_mod.m                  # QPSK modulator
│   ├── qpsk_demod.m                # QPSK demodulator
│   ├── ofdm_mod.m                  # OFDM modulator
│   ├── channel_multipath.m         # Multipath channel + AWGN
│   ├── ofdm_demod.m                # OFDM demodulator and equalizer
│   ├── calc_ber.m                  # Bit error rate (BER) calculation
│   ├── test_dsp_lib.m              # End-to-end library test script
│   └── README.md                   # DSP library documentation
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
│   ├── lab5/                       # Lab 5 (Practice 2): Convolutional Code & Viterbi Decoder
│   │   └── lab5.m                  # Convolutional encoder K=7 and manual Viterbi decoder
│   ├── lab6/                       # Lab 6 (Practice 3): Interleaving
│   │   └── lab6.m                  # Forward and inverse bit interleaver
│   ├── lab7/                       # Lab 7 (Practice 4): QPSK Modulation
│   │   └── lab7.m                  # QPSK constellation mapper and demapper
│   ├── lab8/                       # Lab 8 (Practice 5): OFDM Modulation
│   │   └── lab8.m                  # OFDM modulator with pilot insertion, zero guard, IFFT, CP
│   ├── lab9/                       # Lab 9 (Practice 6): Channel Model
│   │   └── lab9.m                  # Multipath channel (6 rays) with path loss and AWGN
│   ├── lab10/                      # Lab 10 (Practice 7): Equalization and OFDM Demodulation
│   │   └── lab10.m                 # CP removal, FFT, pilot-based channel estimation and equalizer
│   └── lab11/                      # Lab 11 (Practice 8): BER Calculation and Graphs
│       ├── graphic_lab11.jpg       # Exported spectra and signal constellation plots
│       └── lab11.m                 # Full end-to-end communication system model
└── reports/                        # Weekly project reports
    ├── report_2026-10-04.md        # Report for week 1 (Lab 1)
    ├── report_2026-10-11.md        # Report for week 2 (Lab 2)
    ├── report_2026-10-18.md        # Report for week 3 (Lab 3)
    ├── report_2026-10-18-2.md      # Report for week 3 (Lab 4 / Practice 1)
    ├── report_2026-10-18-3.md      # Report for week 3 (Lab 5 / Practice 2)
    ├── report_2026-10-25.md        # Report for week 4 (Lab 6 / Practice 3)
    ├── report_2026-10-25-2.md      # Report for week 4 (Lab 7 / Practice 4)
    ├── report_2026-10-25-3.md      # Report for week 4 (Lab 8 / Practice 5)
    ├── report_2026-10-25-4.md      # Report for week 4 (Lab 9 / Practice 6)
    ├── report_2026-10-25-5.md      # Report for week 4 (Lab 10 / Practice 7)
    └── report_2026-10-25-6.md      # Report for week 4 (Lab 11 / Practice 8)
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

### Lab 6 (Practice 3): Interleaving (`labs/lab6/`)
* **Scope:** Pseudo-random forward bit interleaving and reverse deinterleaving to preserve data order.
* **Script:** [`labs/lab6/lab6.m`](labs/lab6/lab6.m)
* **Execution via Terminal:**
  ```bash
  cd labs/lab6 && matlab -batch "run('lab6.m')"
  ```

### Lab 7 (Practice 4): QPSK Modulation (`labs/lab7/`)
* **Scope:** Mapping bit stream into complex QPSK symbols ($\pm 0.707$) according to constellation table and demapping based on the signs of real and imaginary parts.
* **Script:** [`labs/lab7/lab7.m`](labs/lab7/lab7.m)
* **Execution via Terminal:**
  ```bash
  cd labs/lab7 && matlab -batch "run('lab7.m')"
  ```

### Lab 8 (Practice 5): OFDM Modulation (`labs/lab8/`)
* **Scope:** Generation of OFDM symbols: pilot insertion (spacing $\Delta RS = 4$), zero guard bands ($C = 1/4$), IFFT, and cyclic prefix addition ($T_{CP} = 1/16$).
* **Script:** [`labs/lab8/lab8.m`](labs/lab8/lab8.m)
* **Execution via Terminal:**
  ```bash
  cd labs/lab8 && matlab -batch "run('lab8.m')"
  ```

### Lab 9 (Practice 6): Channel Model (`labs/lab9/`)
* **Scope:** Multipath channel simulation ($N_B = 6$ rays, distance 10–500 m, delays $\tau_i$ and path loss $G_i$ for $f_0 = 2.1$ GHz and $B = 11$ MHz) and additive white Gaussian noise (AWGN).
* **Script:** [`labs/lab9/lab9.m`](labs/lab9/lab9.m)
* **Execution via Terminal:**
  ```bash
  cd labs/lab9 && matlab -batch "run('lab9.m')"
  ```

### Lab 10 (Practice 7): Equalization and OFDM Demodulation (`labs/lab10/`)
* **Scope:** OFDM receiver: CP stripping, FFT, zero guard removal, channel frequency response estimation via pilots ($H = RS_{rx} ./ RS_{tx}$), linear interpolation, equalization ($C / H_{EQ}$), and data extraction.
* **Script:** [`labs/lab10/lab10.m`](labs/lab10/lab10.m)
* **Execution via Terminal:**
  ```bash
  cd labs/lab10 && matlab -batch "run('lab10.m')"
  ```

### Lab 11 (Practice 8): BER Calculation and Graphs (`labs/lab11/`)
* **Scope:** Full end-to-end communication chain connecting all previous blocks: Sign encoder $\to$ Conv encoder $\to$ Interleaver $\to$ QPSK modulator $\to$ OFDM modulator $\to$ Multipath AWGN channel $\to$ OFDM demodulator and equalizer $\to$ QPSK demodulator $\to$ Deinterleaver $\to$ Viterbi decoder $\to$ Sign decoder. Bit error rate (BER) calculation and generation of spectra and constellation plots.
* **Script:** [`labs/lab11/lab11.m`](labs/lab11/lab11.m)
* **Execution via Terminal:**
  ```bash
  cd labs/lab11 && matlab -batch "run('lab11.m')"
  ```
* **Output Artifact:** [`labs/lab11/graphic_lab11.jpg`](labs/lab11/graphic_lab11.jpg)

---

## Digital Signal Processing Library (`dsp_lib/`)

All modular functions from practices are collected in [`dsp_lib/`](dsp_lib/):
* `char_encode`, `char_decode` — character encoding and decoding;
* `conv_encode`, `viterbi_decode` — convolutional encoding and Viterbi decoding;
* `interleave`, `inv_interleave` — interleaver and deinterleaver;
* `qpsk_mod`, `qpsk_demod` — QPSK modulator and demodulator;
* `ofdm_mod` — OFDM symbol generator;
* `channel_multipath` — multipath channel with AWGN;
* `ofdm_demod` — OFDM demodulator with channel estimation and equalizer;
* `calc_ber` — bit error rate calculation.

Run end-to-end test of the library:
```bash
matlab -batch "run('dsp_lib/test_dsp_lib.m')"
```

---

## Weekly Progress Reports

The [`reports/`](reports/) directory contains progress reports following the project standard:
* [Report for Week 1 (28.09.2026 - 04.10.2026)](reports/report_2026-10-04.md): implementation of Lab 1 (basic syntax, vector-matrix operations, loops, statistics, and visualization).
* [Report for Week 2 (05.10.2026 - 11.10.2026)](reports/report_2026-10-11.md): implementation of Lab 2, spectral analysis, noise injection, modulation, and Butterworth filtering.
* [Report for Week 3 (12.10.2026 - 18.10.2026)](reports/report_2026-10-18.md): implementation of Lab 3, channel capacity calculation via Shannon's theorem, analysis of $C(d)$, $C(f)$, $C(B)$.
* [Report for Week 3 (12.10.2026 - 18.10.2026, Part 2)](reports/report_2026-10-18-2.md): Lab 4 / Practice 1 (character encoding and decoding, 64-character alphabet, 45 characters for variant 8).
* [Report for Week 3 (12.10.2026 - 18.10.2026, Part 3)](reports/report_2026-10-18-3.md): Lab 5 / Practice 2 (convolutional code $K=7$, noisy channel, manual 64-state Viterbi decoder).
* [Report for 25.10.2026 (Lab 6 / Practice 3)](reports/report_2026-10-25.md): block pseudo-random bit interleaving and deinterleaving.
* [Report for 25.10.2026 (Lab 7 / Practice 4)](reports/report_2026-10-25-2.md): QPSK modulation, constellation mapping and demapping.
* [Report for 25.10.2026 (Lab 8 / Practice 5)](reports/report_2026-10-25-3.md): OFDM modulation, pilot subcarrier placement, guard intervals, IFFT, and cyclic prefix.
* [Report for 25.10.2026 (Lab 9 / Practice 6)](reports/report_2026-10-25-4.md): multipath channel model (6 rays, delays, path attenuation) and AWGN.
* [Report for 25.10.2026 (Lab 10 / Practice 7)](reports/report_2026-10-25-5.md): OFDM demodulation, cyclic prefix removal, FFT, pilot-based channel estimation, and Zero-Forcing equalization.
* [Report for 25.10.2026 (Lab 11 / Practice 8)](reports/report_2026-10-25-6.md): end-to-end communication system model, BER calculation, spectrum and constellation plotting.

---

## Requirements

* Matlab R2020b or later (or GNU Octave 6+)
* Required toolboxes:
  * Signal Processing Toolbox (butter, filtfilt, filter)
  * Communications Toolbox (wgn)

---

## License

This project is licensed under the [Apache 2.0 License](LICENSE).
