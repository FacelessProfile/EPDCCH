function msg = char_decode(bits)
% CHAR_DECODE Декодирование бит в текстовую строку (6 бит/символ)
%   msg = char_decode(bits)
    alphabet = ['a':'z', 'A':'Z', '0':'9', ' ', '.'];
    weights  = [32, 16, 8, 4, 2, 1];
    msg = '';
    for i = 1:6:length(bits)
        chunk = bits(i : min(i+5, length(bits)));
        if length(chunk) < 6
            break;
        end
        idx = sum(chunk .* weights);
        msg = [msg, alphabet(idx + 1)];
    end
end
