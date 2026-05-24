clc; clear; close all;

%% 1. 参数设置
fs = 1000;              % 采样频率 Hz
t = 0:1/fs:2;           % 时间轴 0~2 s
f = 5;                  % 信号频率 Hz

%% 2. 构造衰减正弦信号
A = exp(-1.5*t);        % 指数衰减包络
y = A .* sin(2*pi*f*t); % 衰减正弦波

%% 3. 绘图
figure;
plot(t, y, 'LineWidth', 1.5);
grid on;

xlabel('Time / s');
ylabel('Amplitude');
title('Damped Sine Wave');

set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);