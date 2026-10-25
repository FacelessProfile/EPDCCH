# DSP Library (`dsp_lib`)

Библиотека цифровой обработки сигналов (DSP), объединяющая функции, реализованные в рамках цикла практических занятий (Практики 1–8).

---

## Список функций

| Модуль | Файл | Описание | Вход | Выход |
|---|---|---|---|---|
| **Практика 1** | [`char_encode.m`](char_encode.m) | Знаковый кодер (алфавит 64 символа, 6 бит/символ) | `msg` (string) | `bits` (1xN double) |
| **Практика 1** | [`char_decode.m`](char_decode.m) | Знаковый декодер (восстановление текста из бит) | `bits` (1xN double) | `msg` (string) |
| **Практика 2** | [`conv_encode.m`](conv_encode.m) | Сверточный кодер ($R=1/2$, $K=7$, $[171_8, 133_8]$) | `bits` (1xN) | `encoded` (1x2N) |
| **Практика 2** | [`viterbi_decode.m`](viterbi_decode.m) | Декодер Витерби на 64 состояниях | `rx_bits` (1x2N) | `decoded` (1xN) |
| **Практика 3** | [`interleave.m`](interleave.m) | Прямое перемежение бит | `bits`, `[seq]` | `interleaved`, `seq` |
| **Практика 3** | [`inv_interleave.m`](inv_interleave.m) | Обратное перемежение бит (деперемежение) | `interleaved`, `seq` | `initial` |
| **Практика 4** | [`qpsk_mod.m`](qpsk_mod.m) | QPSK модуляция бит в комплексные символы | `bits` | `symbols`, `bits` |
| **Практика 4** | [`qpsk_demod.m`](qpsk_demod.m) | QPSK демодуляция комплексных символов | `symbols` | `bits` |
| **Практика 5** | [`ofdm_mod.m`](ofdm_mod.m) | OFDM модулятор (опорные RS, нули, ОБПФ, ЦП) | `qpsk_syms`, `[Delta_RS]`, `[T_cp]`, `[C]` | `tx_signal`, `params` |
| **Практика 6** | [`channel_multipath.m`](channel_multipath.m) | Многолучевой канал ($N_B$ лучей) + АБГШ ($N_0$ дБ) | `tx_signal`, `[Nb]`, `[N0_dB]`, `[f0]`, `[B]`, `[D]` | `rx_signal`, `Smpy`, `ch_info` |
| **Практика 7** | [`ofdm_demod.m`](ofdm_demod.m) | OFDM демодулятор, удаление ЦП, ДПФ, оценка АЧХ, EQ | `rx_signal`, `params` | `rx_qpsk`, `C`, `C_eq`, `H_eq` |
| **Практика 8** | [`calc_ber.m`](calc_ber.m) | Расчет коэффициента битовых ошибок (BER) | `tx_bits`, `rx_bits` | `ber`, `num_errors` |

---

## Тестирование

Для запуска сквозного тестирования всей библиотеки:
```matlab
addpath('dsp_lib');
test_dsp_lib;
```
или из терминала:
```bash
matlab -batch "run('dsp_lib/test_dsp_lib.m')"
```
