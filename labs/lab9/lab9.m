function [rx_signal, Smpy, ch_info] = channel_multipath(tx_signal, Nb, N0_dB, f0, B)
    if nargin < 2, Nb = 6; end
    if nargin < 3, N0_dB = -30; end
    if nargin < 4, f0 = 2.1e9; end
    if nargin < 5, B = 11e6; end
    
    c = 3e8;
    Ts = 1 / B;
    L = length(tx_signal);
    
    D = sort(10 + (500 - 10) * rand(1, Nb));
    D1 = D(1);
    
    tau = round((D - D1) / (c * Ts));
    G = c ./ (4 * pi * D * f0);
    
    Smpy = zeros(1, L);
    for i = 1:Nb
        Si = [zeros(1, tau(i)), tx_signal];
        Smpy = Smpy + G(i) * Si(1:L);
    end
    
    noise_pwr = 10^(N0_dB / 10);
    noise = sqrt(noise_pwr / 2) * (randn(1, L) + 1j * randn(1, L));
    rx_signal = Smpy + noise;
    
    ch_info.D = D;
    ch_info.tau = tau;
    ch_info.G = G;
end


test_tx = randn(1, 120) + 1j * randn(1, 120);
[rx, smpy, ch] = channel_multipath(test_tx);
answers = ["NO", "YES"];
fprintf("Is channel applied? %s\n", answers((length(rx) == length(test_tx)) + 1));
