% Parameters
c = 3e8;                  % Speed of light (m/s)
f = 1e9;                  % Operating frequency (1 GHz)
lambda = c / f;           % Wavelength (m)
N = 8;                    % Number of elements
d = lambda / 2;           % Spacing between elements (half-wavelength)
psi = 0;                  % Progressive phase shift (radians)

% Angular range for plotting
theta = linspace(0, 2*pi, 360);  % Angle in radians

% Array Factor Calculation
k = 2*pi / lambda;  % Wave number
AF = abs(sin(N*k*d*cos(theta)/2) ./ (N*sin(k*d*cos(theta)/2))); % Normalize for readability

% Convert to dB scale
AF_dB = 20*log10(AF / max(AF)); % Normalize to 0 dB

% Plot radiation pattern
figure;
polarplot(theta, max(AF_dB, -40)); % Limit minimum to -40 dB for better visualization
title('Radiation Pattern of Uniform Linear Array');
set(gca, 'ThetaZeroLocation', 'top', 'ThetaDir', 'clockwise');
grid on;
