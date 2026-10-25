function [rx_qpsk, C, C_eq, H_eq] = ofdm_demod(rx_signal, params)
% OFDM_DEMOD Демодуляция OFDM-символа, оценка АЧХ и эквалайзирование
%   [rx_qpsk, C, C_eq, H_eq] = ofdm_demod(rx_signal, params)
    rx_no_cp = rx_signal(params.N_cp + 1 : params.N_cp + params.N_fft);
    rx_spec = fft(rx_no_cp);
    C = rx_spec(params.Nz + 1 : end - params.Nz);
    rs_rx = C(params.rs_idx);
    H = rs_rx ./ params.rs_syms;
    H_eq = interp1(params.rs_idx, H, 1:length(C), 'linear', 'extrap');
    C_eq = C ./ H_eq;
    rx_qpsk = C_eq(params.data_idx);
end
