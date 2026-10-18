clear; clc;
current_dir = fileparts(mfilename('fullpath'));
addpath(fullfile(current_dir, '..', 'lab4'));

% Для варианта 8 длина сообщения ровно 45 символов
msg = 'This is a test message for practice 2 var 8..';

%% Преобразование текста в биты (вызов лабы 4)
tx_bits = lab4('encode', msg);

%% Сверточное кодирование (Rate 1/2, K = 7, полиномы [171, 133]_oct)
coded_bits = encode_conv(tx_bits);

%% Канал с помехами
rx_coded = coded_bits;

% одиночные ошибки в разные части сообщения
error_indices = [15, 64, 150, 280, 395, 510];
rx_coded(error_indices) = ~rx_coded(error_indices);

%% Декодер Витерби для 64 состояний
decoded_bits = decode_viterbi(rx_coded);

%% Восстановление текста из бит (вызов лаб 4)
rx_msg = lab4('decode', decoded_bits);

fprintf('--- (Сверточный код K=7 + Витерби) ---\n');
fprintf('Исходный текст:   "%s"\n', msg);
fprintf('Длина текста:     %d симв.\n', length(msg));
fprintf('Бит данных:       %d (в канале: %d)\n', length(tx_bits), length(coded_bits));
fprintf('Ошибок в канале:  %d шт. (позиции: %s)\n', length(error_indices), num2str(error_indices));
fprintf('Принятый текст:   "%s"\n', rx_msg);

if strcmp(msg, rx_msg)
    fprintf('Результат:        УСПЕХ! Ошибки исправлены алгоритмом Витерби.\n\n');
else
    fprintf('Результат:        Неудача( Текст искажен.\n\n');
end


%% ================== ФУНКЦИИ ==================

function encoded = encode_conv(bits)
    % Регистр сдвига на 6 ячеек памяти (K = 7)
    mem = zeros(1, 6);
    encoded = zeros(1, 2 * length(bits));
    
    for i = 1:length(bits)
        x = bits(i);
        % Полином 171_oct = [1 1 1 1 0 0 1] -> x + D1 + D2 + D3 + D6
        encoded(2*i-1) = mod(x + mem(1) + mem(2) + mem(3) + mem(6), 2);
        % Полином 133_oct = [1 0 1 1 0 1 1] -> x + D2 + D3 + D5 + D6
        encoded(2*i)   = mod(x + mem(2) + mem(3) + mem(5) + mem(6), 2);
        
        mem = [x, mem(1:5)];
    end
end

function decoded = decode_viterbi(rx_bits)
    % Веса степеней двойки для быстрого вычисления индекса состояния
    weights = [32; 16; 8; 4; 2; 1];
    
    % Все 64 возможных состояния регистра сдвига (6 бит)
    states = mod(floor((0:63)' ./ [32 16 8 4 2 1]), 2);
    num_steps = length(rx_bits) / 2;
    
    % Начальные метрики путей: начинаем из нулевого состояния [0 0 0 0 0 0]
    path_metric = [0; inf(63, 1)];
    history = cell(64, 1);
    
    for t = 1:num_steps
        rx_pair = rx_bits(2*t-1 : 2*t);
        new_metric = inf(64, 1);
        new_history = cell(64, 1);
        
        for s = 1:64
            if isinf(path_metric(s)), continue; end
            
            m = states(s, :); % Память текущего состояния [D1 D2 D3 D4 D5 D6]
            
            for b = [0, 1]
                % Идеальные выходы для бита b по полиномам 171 и 133
                ideal_y1 = mod(b + m(1) + m(2) + m(3) + m(6), 2);
                ideal_y2 = mod(b + m(2) + m(3) + m(5) + m(6), 2);
                
                % Расстояние Хэмминга с принятой парой бит
                penalty = (ideal_y1 ~= rx_pair(1)) + (ideal_y2 ~= rx_pair(2));
                total_cost = path_metric(s) + penalty;
                
                % Следующее состояние памяти
                next_mem = [b, m(1:5)];
                next_s = next_mem * weights + 1;
                
                % Выбираем путь с наименьшей метрикой
                if total_cost < new_metric(next_s)
                    new_metric(next_s) = total_cost;
                    new_history{next_s} = [history{s}, b];
                end
            end
        end
        path_metric = new_metric;
        history = new_history;
    end
    
    % выжившее состояние с наименьшей суммарной метрикой
    [~, best_state] = min(path_metric);
    decoded = history{best_state};
end
