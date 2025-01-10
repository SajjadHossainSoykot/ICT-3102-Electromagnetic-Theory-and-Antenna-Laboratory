clc; clear; close all;

% Parameters for the monopole antenna
f = 1e9;          % Frequency in Hz (1 GHz)
c = 3e8;          % Speed of light in m/s
lambda = c / f;   % Wavelength
theta = linspace(0, 2*pi, 360); % Azimuthal angle (0 to 2*pi radians)

% Monopole antenna radiation pattern (idealized)
% For monopole, the pattern is sin(theta), but we'll use a smooth approximation for visualization
R = abs(sin(theta));  % Radiation pattern (amplitude)

% Convert radiation pattern to decibels (dB)
R_dB = 20 * log10(R / max(R));  % Normalize and convert to dB

% Plot the radiation pattern
figure;
subplot(2,1,1)
polarplot(theta, R, 'LineWidth', 2);
title('Radiation Pattern of Monopole Antenna');
rlim([0 1]);  % Set radial limits
thetalim([0 180]);  % Plot half-plane for monopole antenna (0 to 180 degrees)

% Optional: Plot in dB
subplot(2,1,2)
polarplot(theta, R_dB, 'LineWidth', 2);
title('Radiation Pattern of Monopole Antenna (in dB)');
rlim([-40 0]);  % Set dB radial limits
thetalim([0 180]);  % Plot half-plane for monopole antenna
