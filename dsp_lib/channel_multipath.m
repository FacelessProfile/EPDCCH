function [rx_signal, Smpy, ch_info] = channel_multipath(tx_signal, Nb, N0_dB, f0, B, D)
% CHANNEL_MULTIPATH Модель многолучевого канала передачи с АБГШ
%   [rx_signal, Smpy, ch_info] = channel_multipath(tx_signal, Nb, N0_dB, f0, B, D)
    if nargin < 2 || isempty(Nb), Nb = 6; end
    if nargin < 3 || isempty(N0_dB), N0_dB = -100; end
    if nargin < 4 || isempty(f0), f0 = 2.1e9; end
    if nargin < 5 || isempty(B), B = 11e6; end
    
    c = 3e8;
    Ts = 1 / B;
    L = length(tx_signal);
    
    if nargin < 6 || isempty(D)
        D = sort(10 + (25 - 10) * rand(1, Nb));
    else
        D = sort(D);
    end
    
    tau = round((D - D(1)) / (c * Ts));
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
    ch_info.noise_pwr = noise_pwr;
end
