clc;
clear;
close all;

% Frequency and wave parameters
f = 3e9; % Frequency (3 GHz)
c = 3e8; % Speed of light in m/s
lambda = c / f; % Wavelength

% Define the angle range for plotting (0 to 360 degrees)
theta = linspace(0, 2*pi, 360); 

% Radiation pattern for dipole antenna (sinusoidal function of angle)
E = sin(pi * cos(theta)); 

% Plot radiation pattern
figure;
polarplot(theta, abs(E), 'LineWidth', 2);
title('Radiation Pattern of Dipole Antenna');
rlim([0 1]); % Limit the radial distance for better visualization
thetalim([0 360]); % Display the full circle for complete pattern
