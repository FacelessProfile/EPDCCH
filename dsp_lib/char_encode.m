function bits = char_encode(msg)
% CHAR_ENCODE Кодирование текстовой строки в биты (алфавит 64 символа, 6 бит/символ)
%   bits = char_encode(msg)
    alphabet = ['a':'z', 'A':'Z', '0':'9', ' ', '.'];
    weights  = [32, 16, 8, 4, 2, 1];
    bits = [];
    for i = 1:length(msg)
        idx = find(alphabet == msg(i)) - 1;
        if isempty(idx)
            error('Символ "%s" отсутствует в алфавите.', msg(i));
        end
        char_bits = mod(floor(idx ./ weights), 2);
        bits = [bits, char_bits];
    end
end
