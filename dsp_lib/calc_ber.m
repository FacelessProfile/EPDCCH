function [ber, num_errors] = calc_ber(tx_bits, rx_bits)
% CALC_BER Расчет вероятности битовых ошибок (Bit Error Rate)
%   [ber, num_errors] = calc_ber(tx_bits, rx_bits)
    min_len = min(length(tx_bits), length(rx_bits));
    num_errors = sum(tx_bits(1:min_len) ~= rx_bits(1:min_len));
    ber = num_errors / length(tx_bits);
end
