%% Лабораторная работа 1: Введение в Matlab/Octave
% Вариант параметров: a = 24 (номер в списке), b = 26 (число студентов)

%% Часть 1. Константы
clear all;
a = 24; b = 26;
c = b - a;
d = c.*b - a;
e = a + 1i*b;
h = d .* pow2(10,2);
g = a * pi;
save("lab1_part1.mat");

%% Часть 2. Векторы
clear all;
load("lab1_part1.mat",'c','d');
N = c + 1;
f = zeros(1,N); g = zeros(1,N);
h = f + g;
j = h * d;
v = ones(N,1);
v(3)
save("lab1_part2.mat");

%% Часть 3. Матрицы
clear all;
A = zeros(3,3); B = ones(3,3);
C = A * B;
D = A .* B;
D(1,1)
D(:,2)
D(2,:)
save("lab1_part3.mat");

%% Часть 4. Операторы и циклы
clear all;
load("lab1_part1.mat","a");
cntr = 0;
for c=1:10*a
    cntr = cntr + c;
end

cntr2 = 0;
for c=1:10*a
    if mod(c,2) ~= 0
        cntr2 = cntr2 + c;
    end
end

cntr3 = 0;
x = 0;
while x<a
   cntr3 = cntr3 + x;
   x = x+1;
end
save("lab1_part4.mat");

%% Часть 5. Библиотека функций
clear all;
A = randn(1,10);
[maxA, maxAind] = max(A); minA = min(A);
C = ones(1,10);
D = zeros(1,10);
save("lab1_part5.mat");

%% Блок 6. Графическое отображение
clear all;
A = randn(1,100);
figure;
bar(1:100,A,'FaceColor',[0.2 0.7 0.2]);
hold on;
stem(1:100,A,'Color','blue');
hold on;
plot(1:100,A,'Color','red');
xlabel('ось х - отсчеты');
ylabel('ось у - амплитуда');
title('Случайный вектор');
legend('Гистограмма (bar)','Отсчеты (stem)','Линейный график (plot)');
xlim([1,90]);
ylim([min(A), max(A)]);
grid on;
exportgraphics(gcf,'graphic.jpg');
save("lab1_part6.mat");
