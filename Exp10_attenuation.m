% Attenuation Measurement
clc;
clear;
close all;

% Define input power (in mW)
P_in = 100; % Example: 100 mW

% Define attenuation values (in dB)
attenuation = 0:2:30; % Attenuation from 0 dB to 30 dB in steps of 2 dB

% Calculate output power (in mW) for each attenuation value
P_out = P_in ./ (10.^(attenuation / 10));

% Plot Attenuation vs. Output Power
figure;
plot(attenuation, P_out, 'b-o', 'LineWidth', 2, 'MarkerFaceColor', 'r');
xlabel('Attenuation (dB)', 'FontSize', 12);
ylabel('Output Power (mW)', 'FontSize', 12);
title('Attenuation vs. Output Power', 'FontSize', 14);
grid on;