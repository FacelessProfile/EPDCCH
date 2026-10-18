function out = lab4(action, data)
    alphabet = ['a':'z', 'A':'Z', '0':'9', ' ', '.'];
    weights  = [32, 16, 8, 4, 2, 1];

    if nargin == 0
        % 45 symbols
        msg = 'This is a test message for practice 1 var 8..';
        
        tx_bits = lab4('encode', msg);
        rx_msg  = lab4('decode', tx_bits);
        
        fprintf('\n--- Знаковое кодирование ---\n');
        fprintf('Исходное сообщение: %s\n', msg);
        fprintf('Восстановленное:    %s\n', rx_msg);
        fprintf('Длина текста:       %d симв.\n', length(msg));
        fprintf('Длина в битах:      %d bit\n', length(tx_bits));
        
        if strcmp(msg, rx_msg)
            s = "yes";
        else
            s = "no";
        end
        fprintf('Сообщения совпали:  %s\n\n', s);
        return;
    end

    switch lower(action)
        case 'encode'
            msg = data;
            out = [];
            for i = 1:length(msg)
                idx = find(alphabet == msg(i)) - 1;
                char_bits = mod(floor(idx ./ weights), 2);
                out = [out, char_bits];
            end
            
        case 'decode'
            bits = data;
            out = '';
            for i = 1:6:length(bits)
                chunk = bits(i : i+5);
                idx = sum(chunk .* weights);
                out = [out, alphabet(idx + 1)];
            end
            
        otherwise
            error('Неизвестная команда. Используйте "encode" или "decode".');
    end
end
