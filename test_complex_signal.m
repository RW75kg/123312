clc; clear; close all;

%% 1. Parameter settings
fs = 1000;              % Sampling frequency, Hz
t = 0:1/fs:2;           % Time axis, 0 to 2 s
rng(7);                 % Fixed seed for repeatable noise

%% 2. Construct a composite signal
f1 = 5;                 % Low-frequency component, Hz
f2 = 18;                % High-frequency component, Hz
f3 = 42;                % Transient wave packet frequency, Hz

A1 = exp(-1.2*t);
A2 = 0.45*exp(-2.8*t);

y_low = A1 .* sin(2*pi*f1*t);
y_high = A2 .* sin(2*pi*f2*t + pi/5);

packet_center = 1.20;   % Center time of transient packet, s
packet_width = 0.075;   % Controls transient duration
packet_env = exp(-((t - packet_center).^2)/(2*packet_width^2));
y_packet = 0.70 * packet_env .* sin(2*pi*f3*t);

noise_level = 0.06;
y_noise = noise_level * randn(size(t));

y = y_low + y_high + y_packet + y_noise;

%% 3. Plot
figure;

subplot(4, 1, 1);
plot(t, y_low, 'LineWidth', 1.2);
grid on;
ylabel('Low');
title('Composite Signal Components');

subplot(4, 1, 2);
plot(t, y_high, 'LineWidth', 1.2);
grid on;
ylabel('High');

subplot(4, 1, 3);
plot(t, y_packet, 'LineWidth', 1.2);
grid on;
ylabel('Packet');

subplot(4, 1, 4);
plot(t, y, 'k', 'LineWidth', 1.5);
grid on;
xlabel('Time / s');
ylabel('Amplitude');
title('Damped Multi-Component Signal with Noise and Transient Packet');

set(findall(gcf, '-property', 'FontName'), 'FontName', 'Times New Roman');
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
