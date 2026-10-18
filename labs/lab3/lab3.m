%% Расчет пропускной способности канала по Шеннону
clear all;
close all;

% Параметры
c = 3e8;
B = 11e6;       % 11 МГц
f = 2.1e9;      % 2.1 ГГц
d = 100;        % 100 м
P = 1;          % 1 Вт
N0 = 1e-15;     % Вт/Гц

%% Зависимость C(d) от расстояния
d_range = d:d:50*d;
alpha_d = (4 * pi * d_range * f) / c;
C_d = B * log2(1 + (P ./ alpha_d.^2) / (B * N0));

figure;
subplot(3, 1, 1);
plot(d_range, C_d / 1e6,LineWidth=0.2);
xlabel('Расстояние d, м');
ylabel('C, Мбит/с');
title('Зависимость C(d)');
grid on;

%% Зависимость C(f) от несущей частоты
f_range = 0.1*f:0.1*f:2*f;
alpha_f = (4 * pi * d * f_range) / c;
C_f = B * log2(1 + (P ./ alpha_f.^2) / (B * N0));

subplot(3, 1, 2);
plot(f_range / 1e9, C_f / 1e6,LineWidth=0.2);
xlabel('Частота f, ГГц');
ylabel('C, Мбит/с');
title('Зависимость C(f)');
grid on;

%% Зависимость C(B) от ширины полосы
B_range = 0.01*B:0.01*B:10*B;
alpha = (4 * pi * d * f) / c;
C_B = B_range .* log2(1 + (P / alpha^2) ./ (B_range * N0));

subplot(3, 1, 3);
plot(B_range / 1e6, C_B / 1e6,LineWidth=0.2);
xlabel('Полоса B, МГц');
ylabel('C, Мбит/с');
title('Зависимость C(B)');
grid on;

saveas(gcf, 'graphic_lab3.jpg');
