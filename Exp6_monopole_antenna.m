clc; clear; close all;

% Input parameters
lambda = input('Enter the value of wavelength (?) in meters: '); % Wavelength eg 10
l = input('Enter the monopole length (l) in meters: '); % Monopole length eg 4

% Ratio of monopole length to wavelength
ratio = l / lambda;

% Wave number and angle range
B = 2 * pi / lambda; % Wave number
theta = -pi/2:pi/100:pi/2; % Angle range for monopole (0 to pi, upper hemisphere)

% Calculate radiation pattern
if ratio <= 0.1
    % Short Monopole
    E = sin(theta); % Electric field for short monopole
else
    % Regular Monopole
    E = (cos(B * l / 2 .* cos(theta)) - cos(B * l / 2)); % Electric field for regular monopole
end

% Normalize and take absolute value for proper visualization
E = abs(E) / max(abs(E));

% Plot radiation pattern
figure;
polarplot(theta, E, 'LineWidth', 2, 'Color', 'blue');
title(sprintf('Radiation Pattern of Monopole Antenna (? = %.2f m, l = %.2f m)', lambda, l));
grid on;