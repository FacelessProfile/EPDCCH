function bits = qpsk_demod(symbols)
% QPSK_DEMOD Демодуляция комплексных символов QPSK в биты
%   bits = qpsk_demod(symbols)
    N = length(symbols);
    bits = zeros(1, 2*N);
    for i = 1:N
        s = symbols(i);
        bits(2*i - 1) = double(real(s) < 0);
        bits(2*i)     = double(imag(s) < 0);
    end
end
