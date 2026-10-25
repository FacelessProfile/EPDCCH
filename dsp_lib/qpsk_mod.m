function [symbols, bits] = qpsk_mod(bits)
% QPSK_MOD Модуляция бит в комплексные символы QPSK
%   [symbols, bits] = qpsk_mod(bits)
    if mod(length(bits), 2) ~= 0
        bits = [bits, 0];
    end
    N = length(bits) / 2;
    symbols = zeros(1, N);
    for i = 1:N
        I = (1 - 2*bits(2*i - 1)) * 0.707;
        Q = (1 - 2*bits(2*i))     * 0.707;
        symbols(i) = I + 1j * Q;
    end
end
