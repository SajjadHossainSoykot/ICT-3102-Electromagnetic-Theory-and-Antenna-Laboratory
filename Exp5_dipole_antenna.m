clc; clear; close all;

% Input parameters
lambda = input('Enter the value of wavelength (?) in meters: '); % Wavelength
l = input('Enter the dipole length (l) in meters: '); % Dipole length

% Ratio of dipole length to wavelength
ratio = l / lambda;

% Wave number and angle range
B = 2 * pi / lambda; % Wave number
theta = linspace(0, 2 * pi, 360); % Angle range in radians

% Calculate radiation pattern
if ratio <= 0.1
    % Short Dipole
    E = sin(theta); % Electric field for short dipole
else
    % Regular Dipole
    E = (cos(B * l / 2 .* cos(theta)) - cos(B * l / 2)) ./ sin(theta); % Electric field for regular dipole
end

% Normalize and take absolute value for proper visualization
E = abs(E) / max(abs(E));

% Plot radiation pattern
figure;
polarplot(theta, E, 'LineWidth', 2, 'Color', 'blue');
title(sprintf('Radiation Pattern of Dipole Antenna (? = %.2f m, l = %.2f m)', lambda, l));
grid on;