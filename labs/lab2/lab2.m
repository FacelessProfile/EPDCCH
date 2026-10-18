%% Часть Гармонический сигнал (1 период)
clear all;
close all;
SS = 0.1;
samples = 0:SS:2*pi;
y = sin(samples);

figure('Name', 'Часть 1: Однопериодная синусоида');
plot(samples, y);
xlabel('Время t, с');
ylabel('Амплитуда');
title('Синусоидальный сигнал (1 период, \Deltat = 0.1)');
grid on;

%% Части 2-4. Сигнал с повышенной частотой f и его спектр
f = 5;
samples = 0:SS:2*pi;
y = sin(f * samples);

figure('Name', 'Части 2-4: Сигнал частоты f и формы отображения');
subplot(2, 2, 1);
plot(samples, y);
xlabel('Время t, с');
ylabel('Амплитуда');
title('Непрерывный график (plot)');
grid on;

subplot(2, 2, 2);
stem(samples, y, 'filled');
xlabel('Время t, с');
ylabel('Амплитуда');
title('Дискретные отсчеты (stem)');
grid on;

subplot(2, 2, 3);
stairs(samples, y);
xlabel('Время t, с');
ylabel('Амплитуда');
title('Ступенчатый график (stairs)');
grid on;

freqs = f * samples;
spectrum = abs(fft(y));
subplot(2, 2, 4);
plot(freqs, spectrum, 'r');
xlabel('Частота \omega, рад/с');
ylabel('Амплитуда');
title('Амплитудный спектр (БПФ/FFT)');
grid on;

%% Части 5-8. Зашумленный сигнал и фильтр скользящего среднего
samples = 0:0.001:2*pi;
freqs = f * samples;
y = sin(f * samples);
noise = wgn(1, length(samples), -10);
signal = y + noise;

figure('Name', 'Части 5-8: Шум и фильтрация скользящим средним');
subplot(2, 2, 1);
plot(samples, signal);
xlabel('Время t, с');
ylabel('Амплитуда');
title('Зашумленный сигнал (WGN, -10 дБВт)');
grid on;

spectrum2 = abs(fft(signal));
subplot(2, 2, 2);
plot(freqs, spectrum2);
xlabel('Частота \omega, рад/с');
ylabel('Амплитуда');
title('Спектр зашумленного сигнала');
grid on;

Len = 3;
a = 1;
b = (1 / Len) * ones(1, Len);
filtered = filter(b, a, signal);

subplot(2, 2, 3);
plot(samples, filtered);
xlabel('Время t, с');
ylabel('Амплитуда');
title(sprintf('Отфильтрованный сигнал (L = %d)', Len));
grid on;

spectrum3 = abs(fft(filtered));
subplot(2, 2, 4);
plot(freqs, spectrum3);
xlabel('Частота \omega, рад/с');
ylabel('Амплитуда');
title('Спектр после скользящего среднего');
grid on;

%% Часть 9. Перенос сигнала на несущую частоту (модуляция)
carry = sin(10 * f * samples);
carried = y .* carry;

figure('Name', 'Часть 9: Модуляция на несущую частоту');
plot(samples, carried, 'Color', [0.2 0.4 0.8]);
hold on;
plot(samples, y, 'r');
xlabel('Время t, с');
ylabel('Амплитуда');
title('Перенос сигнала на несущую (10f = 50)');
legend('Модулированный сигнал', 'Исходный информационный сигнал');
grid on;

%% Части 10-11. Канал связи с шумом для модулированного сигнала
noised_carried = carried + noise;

figure('Name', 'Части 10-11: Модулированный сигнал в канале с шумом');
subplot(2, 1, 1);
plot(samples, noised_carried);
xlabel('Время t, с');
ylabel('Амплитуда');
title('Модулированный сигнал с аддитивным шумом');
grid on;

spectrum4 = abs(fft(noised_carried));
subplot(2, 1, 2);
plot(freqs, spectrum4);
xlabel('Частота \omega, рад/с');
ylabel('Амплитуда');
title('Спектр модулированного сигнала с шумом');
grid on;

%% Части 12-13. Демодуляция и фильтрация Баттерворта
NoCarry = noised_carried .* carry;

figure('Name', 'Части 12-13: Демодуляция и фильтрация Баттерворта');
subplot(2, 2, 1);
plot(samples, NoCarry);
xlabel('Время t, с');
ylabel('Амплитуда');
title('Сигнал после перемножения с несущей (детектирование)');
grid on;

[b_butter, a_butter] = butter(4, 0.008, 'low');
FillNoCar = 2 * filtfilt(b_butter, a_butter, NoCarry);

subplot(2, 2, 2);
plot(samples, FillNoCar);
xlabel('Время t, с');
ylabel('Амплитуда');
title('Восстановленный сигнал после ФНЧ Баттерворта');
grid on;


subplot(2,2,3);
spectrum5 = abs(fft(FillNoCar));
plot(freqs,spectrum5);
xlabel('Частота \omega, рад/с');
ylabel('Амплитуда');
title('Спектр после фильтра Баттерворта');
grid on;


exportgraphics(gcf, 'graphic_lab2.jpg');
