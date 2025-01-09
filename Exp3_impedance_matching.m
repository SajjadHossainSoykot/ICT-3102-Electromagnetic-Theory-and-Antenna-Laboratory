clc;
clear all;
close all;

% Define antenna impedance (ZL) and RF circuitry impedance (Z0)
ZL = complex(25, 20);   % Example: Antenna impedance (Real part = 25 ohms, Imaginary part = 20 ohms)
Z0 = 50;                % RF circuitry impedance (50 ohms)

% Calculate reflection coefficient (Gamma)
gamma = (ZL - Z0) / (ZL + Z0);

% Plot impedance on the Smith chart
smithchart(gamma);

% Calculate the matched antenna impedance (ZL_matched)
ZL_matched = Z0 * (1 + gamma) / (1 - gamma);

% Display results
fprintf('Antenna impedance (ZL): %.2f + %.2fj ohms\n', real(ZL), imag(ZL));
fprintf('RF circuit impedance (Z0): %d ohms\n', Z0);
fprintf('Reflection coefficient (Gamma): %.4f + %.4fj\n', real(gamma), imag(gamma));
fprintf('Matched antenna impedance (ZL_matched): %.2f + %.2fj ohms\n', real(ZL_matched), imag(ZL_matched));
