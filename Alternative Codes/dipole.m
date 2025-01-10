% Radiation Pattern of a Half-Wave Dipole Antenna
clc;
clear;
close all;

% Define parameters
lambda = 1; % Wavelength (normalized)
L = lambda / 2; % Length of dipole (half-wave)
k = 2 * pi / lambda; % Wave number
theta = linspace(0, 2 * pi, 360); % Angular range (0 to 360 degrees)

% Radiation pattern equation for half-wave dipole
E = abs((cos(k * L / 2 * cos(theta)) - cos(k * L / 2)) ./ sin(theta));

% Handle singularity at theta = 0 and theta = pi
E(theta == 0 | theta == pi) = 0;

% Normalize the radiation pattern
E = E / max(E);

% Azimuthal angle for 3D plot
phi = linspace(0, 2 * pi, 360); % Azimuthal angle (0 to 360 degrees)
[thetaGrid, phiGrid] = meshgrid(theta, phi);

% 3D Radiation pattern
E3D = abs((cos(k * L / 2 * cos(thetaGrid)) - cos(k * L / 2)) ./ sin(thetaGrid));
E3D(thetaGrid == 0 | thetaGrid == pi) = 0;
E3D = E3D / max(E3D(:)); % Normalize

% Convert to Cartesian coordinates for 3D plotting
x = E3D .* sin(thetaGrid) .* cos(phiGrid);
y = E3D .* sin(thetaGrid) .* sin(phiGrid);
z = E3D .* cos(thetaGrid);

% Create Subplots
figure;

% Subplot 1: 2D Polar Plot
subplot(1, 2, 1); % 1 row, 2 columns, first plot
polarplot(theta, E, 'LineWidth', 2);
title('2D Radiation Pattern');
ax = gca;
ax.ThetaZeroLocation = 'top';
ax.ThetaDir = 'clockwise';
grid on;

% Subplot 2: 3D Radiation Pattern
subplot(1, 2, 2); % 1 row, 2 columns, second plot
surf(x, y, z, E3D, 'EdgeColor', 'none');
title('3D Radiation Pattern');
xlabel('X');
ylabel('Y');
zlabel('Z');
axis equal;
colorbar;
view(45, 30);
grid on;
