function [symbols, bits] = qpsk_mod(bits)
    if nargin < 1 || isempty(bits)
        bits = randi([0, 1], 1, 30);
    end
    if mod(length(bits), 2) ~= 0
        bits = [bits, 0];
    end
    N = length(bits) / 2;
    symbols = zeros(1, N);
    for i = 1:N
        b0 = bits(2*i - 1);
        b1 = bits(2*i);
        I = (1 - 2*b0) * 0.707;
        Q = (1 - 2*b1) * 0.707;
        symbols(i) = I + 1j * Q;
    end
end

function [bits] = qpsk_demod(symbols)
    N = length(symbols);
    bits = zeros(1, 2*N);
    for i = 1:N
        s = symbols(i);
        bits(2*i - 1) = double(real(s) < 0);
        bits(2*i)     = double(imag(s) < 0);
    end
end


[symbols, tx_bits] = qpsk_mod(randi([0, 1], 1, 30));
rx_bits = qpsk_demod(symbols);
answers = ["NO", "YES"];
fprintf("Is rx == tx? %s\n", answers(all(rx_bits == tx_bits) + 1));
