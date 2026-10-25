%% Тестирование библиотеки dsp_lib: сквозная передача сообщения
clear all; clc;
current_dir = fileparts(mfilename('fullpath'));
addpath(current_dir);

fprintf('====================================================\n');
fprintf('     Тестирование DSP библиотеки (dsp_lib)\n');
fprintf('====================================================\n');

% Исходное сообщение
msg = 'This is a test message for practice 8 var 8..';
fprintf('1. Исходный текст:     "%s"\n', msg);

% 1. Знаковое кодирование
tx_bits = char_encode(msg);
fprintf('2. Знаковое кодирование:  %d бит\n', length(tx_bits));

% 2. Сверточное кодирование
conv_bits = conv_encode(tx_bits);
fprintf('3. Сверточное кодирование: %d бит (R = 1/2)\n', length(conv_bits));

% 3. Перемежение
[inter_bits, inter_seq] = interleave(conv_bits);
fprintf('4. Перемежение:           %d бит\n', length(inter_bits));

% 4. QPSK модуляция
[qpsk_syms, ~] = qpsk_mod(inter_bits);
fprintf('5. QPSK модуляция:        %d комплексных символов\n', length(qpsk_syms));

% 5. OFDM модуляция (Delta_RS = 4, T_cp = 1/16, C = 1/4)
[ofdm_tx, params] = ofdm_mod(qpsk_syms, 4, 1/16, 1/4);
fprintf('6. OFDM модуляция:        %d отсчетов (N_fft = %d, N_cp = %d)\n', ...
    length(ofdm_tx), params.N_fft, params.N_cp);

% 6. Многолучевой канал (Nb = 6 лучей) + слабый шум
[rx_signal, ~, ch_info] = channel_multipath(ofdm_tx, 6, -100);
fprintf('7. Канал связи:           Nb = %d лучей, отсчетов на выходе = %d\n', ...
    length(ch_info.D), length(rx_signal));

% 7. OFDM демодуляция и эквалайзирование
[rx_qpsk, C, C_eq] = ofdm_demod(rx_signal, params);
fprintf('8. OFDM демодуляция:      получено %d QPSK символов\n', length(rx_qpsk));

% 8. QPSK демодуляция
demod_bits = qpsk_demod(rx_qpsk);
fprintf('9. QPSK демодуляция:      получено %d бит\n', length(demod_bits));

% 9. Деперемежение
deinter_bits = inv_interleave(demod_bits, inter_seq);
fprintf('10. Деперемежение:        выполнено\n');

% 10. Декодер Витерби
decoded_bits = viterbi_decode(deinter_bits);
fprintf('11. Декодер Витерби:      восстановлено %d бит\n', length(decoded_bits));

% 11. Знаковое декодирование
rx_msg = char_decode(decoded_bits);
fprintf('12. Принятый текст:       "%s"\n', rx_msg);

% 12. Расчет BER
[ber, errs] = calc_ber(tx_bits, decoded_bits);
fprintf('13. Ошибок бит:           %d / %d (BER = %f)\n', errs, length(tx_bits), ber);

answers = ["FAIL", "SUCCESS"];
fprintf('\nРезультат тестирования библиотеки: %s!\n', answers((strcmp(msg, rx_msg) && ber == 0) + 1));
fprintf('====================================================\n');
