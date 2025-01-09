clc;
clear;
close all;

% Define parameters
N = 10; % Number of elements in the array
lambda = 1; % Wavelength (in arbitrary units)
d = lambda / 2; % Element spacing (half wavelength)
theta = linspace(-pi, pi, 360); % Angle range from -pi to pi

% Calculate array factor
AF = abs(sin(N * pi * d / lambda * cos(theta)) ./ sin(pi * d / lambda * cos(theta)));

% Plot radiation pattern
figure;
polarplot(theta, AF, 'LineWidth', 2);
title('Radiation Pattern of Uniform Linear Array');
rlim([0 max(AF)]); % Set radial limit
thetalim([0 360]); % Display half-circle for better view
grid on;