function [interleaved, seq] = interleave(bits, seq)
% INTERLEAVE Прямое перемежение бит
%   [interleaved, seq] = interleave(bits, seq)
    N = length(bits);
    if nargin < 2 || isempty(seq)
        seq = randperm(N);
    end
    interleaved = zeros(1, N);
    for i = 1:N
        interleaved(seq(i)) = bits(i);
    end
end
