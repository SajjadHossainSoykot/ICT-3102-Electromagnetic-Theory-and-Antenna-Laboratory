clear; close all; clc;

% Define constants
f = 9e9;  % Frequency in Hz
c = 3e10; % Speed of light in cm/s
m = 1;    % TE mode m index
n = 0;    % TE mode n index
a = 2;    % Width of waveguide in cm
b = 1;    % Height of waveguide in cm

% Calculate wavelengths
lambda0 = c / f; % Free-space wavelength
lambda_c = 2 / sqrt((m / a)^2 + (n / b)^2); % Cutoff wavelength
lambda_g = lambda0 / sqrt(1 - (lambda0 / lambda_c)^2); % Guide wavelength

% Calculate phase and group velocities
v_phase = f * lambda_g; % Phase velocity
v_group = c^2 / v_phase; % Group velocity

% Display results
fprintf('Wavelength: %.2f cm\n', lambda0);
fprintf('Phase Velocity: %.2e cm/s\n', v_phase);
fprintf('Group Velocity: %.2e cm/s\n', v_group);
