function encoded = conv_encode(bits)
% CONV_ENCODE Сверточное кодирование (Rate 1/2, K = 7, полиномы [171, 133]_oct)
%   encoded = conv_encode(bits)
    mem = zeros(1, 6);
    encoded = zeros(1, 2 * length(bits));
    for i = 1:length(bits)
        x = bits(i);
        encoded(2*i-1) = mod(x + mem(1) + mem(2) + mem(3) + mem(6), 2);
        encoded(2*i)   = mod(x + mem(2) + mem(3) + mem(5) + mem(6), 2);
        mem = [x, mem(1:5)];
    end
end
