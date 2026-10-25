function [initial,seq,interleaved] = interleaver(bits)
    initial = randi([0,1],1,bits);
    seq = randperm(bits);
    interleaved = zeros(1,bits);
    for i=1:bits
        interleaved(seq(i)) = initial(i);
    end
end

function [initial] = inv_interleaver(interleaved,sequence)
    for i=1:length(interleaved)
        initial(i) = interleaved(sequence(i));
    end
end


[init,seq,interleaved] = interleaver(15);
inverted = inv_interleaver(interleaved,seq);
answers = ["NO","YES"];
fprintf("Is rx == tx? %s\n", answers(all(inverted == init)+1));