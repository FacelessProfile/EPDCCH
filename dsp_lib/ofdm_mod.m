function [tx_signal, params] = ofdm_mod(qpsk_syms, Delta_RS, T_cp, C)
% OFDM_MOD Формирование OFDM-символа с опорными сигналами и циклическим префиксом
%   [tx_signal, params] = ofdm_mod(qpsk_syms, Delta_RS, T_cp, C)
    if nargin < 2 || isempty(Delta_RS), Delta_RS = 4; end
    if nargin < 3 || isempty(T_cp), T_cp = 1/16; end
    if nargin < 4 || isempty(C), C = 1/4; end
    
    N_qpsk = length(qpsk_syms);
    N_rs = floor(N_qpsk / Delta_RS);
    
    rs_syms = repmat(0.707 + 0.707j, 1, N_rs);
    rs_idx = 1 : Delta_RS : (1 + (N_rs - 1) * Delta_RS);
    
    N_active = N_qpsk + N_rs;
    data_idx = setdiff(1:N_active, rs_idx);
    
    active_syms = zeros(1, N_active);
    active_syms(rs_idx) = rs_syms;
    active_syms(data_idx) = qpsk_syms;
    
    Nz = round(C * N_active);
    spectrum = [zeros(1, Nz), active_syms, zeros(1, Nz)];
    N_fft = length(spectrum);
    
    time_signal = ifft(spectrum);
    N_cp = round(T_cp * N_fft);
    cp = time_signal(end - N_cp + 1 : end);
    tx_signal = [cp, time_signal];
    
    params.Delta_RS = Delta_RS;
    params.T_cp = T_cp;
    params.C = C;
    params.N_qpsk = N_qpsk;
    params.N_rs = N_rs;
    params.N_active = N_active;
    params.Nz = Nz;
    params.N_fft = N_fft;
    params.N_cp = N_cp;
    params.rs_idx = rs_idx;
    params.data_idx = data_idx;
    params.rs_syms = rs_syms;
    params.spectrum_tx = spectrum;
end
