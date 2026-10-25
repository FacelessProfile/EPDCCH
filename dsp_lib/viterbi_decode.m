function decoded = viterbi_decode(rx_bits)
% VITERBI_DECODE Декодер Витерби для сверточного кода (K = 7, 64 состояния)
%   decoded = viterbi_decode(rx_bits)
    weights = [32; 16; 8; 4; 2; 1];
    states = mod(floor((0:63)' ./ [32 16 8 4 2 1]), 2);
    num_steps = floor(length(rx_bits) / 2);
    path_metric = [0; inf(63, 1)];
    history = cell(64, 1);
    
    for t = 1:num_steps
        rx_pair = rx_bits(2*t-1 : 2*t);
        new_metric = inf(64, 1);
        new_history = cell(64, 1);
        for s = 1:64
            if isinf(path_metric(s)), continue; end
            m = states(s, :);
            for b = [0, 1]
                y1 = mod(b + m(1) + m(2) + m(3) + m(6), 2);
                y2 = mod(b + m(2) + m(3) + m(5) + m(6), 2);
                penalty = (y1 ~= rx_pair(1)) + (y2 ~= rx_pair(2));
                cost = path_metric(s) + penalty;
                next_mem = [b, m(1:5)];
                next_s = next_mem * weights + 1;
                if cost < new_metric(next_s)
                    new_metric(next_s) = cost;
                    new_history{next_s} = [history{s}, b];
                end
            end
        end
        path_metric = new_metric;
        history = new_history;
    end
    [~, best_state] = min(path_metric);
    decoded = history{best_state};
end
