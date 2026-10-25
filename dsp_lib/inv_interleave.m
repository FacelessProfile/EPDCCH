function initial = inv_interleave(interleaved, seq)
% INV_INTERLEAVE Обратное перемежение бит (деперемежение)
%   initial = inv_interleave(interleaved, seq)
    N = length(interleaved);
    initial = zeros(1, N);
    for i = 1:N
        initial(i) = interleaved(seq(i));
    end
end
