% Clear workspace
clc; clear; close all;

% Given Parameters
Z0 = 50;              % Characteristic impedance (Ohms)
ZL = 25 + 30j;        % Load impedance (Ohms)
f = 2.4e9;            % Frequency (2.4 GHz)
c = 3e8;              % Speed of light (m/s)
lambda = c / f;       % Wavelength (m)

% Step 1: Normalize Load Impedance
ZL_norm = ZL / Z0;    % Normalized load impedance

% Step 2: Reflection Coefficient
gamma = (ZL_norm - 1) / (ZL_norm + 1); % Reflection coefficient

% Step 3: Plot on Smith Chart
figure;
smithchart; % Initialize Smith Chart
hold on;

% Plot normalized load impedance
smithchart(real(ZL_norm), imag(ZL_norm)); % Load point
text(real(ZL_norm), imag(ZL_norm), ' Z_L', 'FontSize', 12, 'Color', 'r');

% Step 4: Add Matching Network (Stub Tuning Example)
% Assume we use a single stub matching technique
% Goal: Match ZL to Z0 using a shorted stub
% Step 4a: Move towards the center of the Smith Chart using transmission line
d1 = 0.2 * lambda;  % Arbitrary distance to move along the transmission line
beta = 2 * pi / lambda; % Phase constant
gamma_new = gamma * exp(-1j * 2 * beta * d1); % New reflection coefficient

% Plot new impedance after moving
[Z_new_norm] = (1 + gamma_new) ./ (1 - gamma_new);
smithplot(real(Z_new_norm), imag(Z_new_norm), 'bo', 'LineWidth', 2); % New point
text(real(Z_new_norm), imag(Z_new_norm), ' Z_{new}', 'FontSize', 12, 'Color', 'b');

% Step 4b: Add a shorted stub at the new point to cancel the imaginary part
% Plot final matched point (Z=1 on Smith Chart)
smithplot(1, 0, 'go', 'LineWidth', 2); % Final matched point
text(1, 0, ' Z_{matched}', 'FontSize', 12, 'Color', 'g');

% Add legend
legend('Z_L (Load)', 'Z_{new} (Intermediate)', 'Z_{matched} (Matched)', ...
    'Location', 'northeast');
title('Impedance Matching Using Smith Chart');
grid on;
