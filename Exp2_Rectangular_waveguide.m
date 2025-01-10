%waveguide
% Constants and dimensions
a = 0.02286; % Width of the waveguide (in meters)
b = 0.01016; % Height of the waveguide (in meters)
f = 10e9; % Frequency (10 GHz)
c = 3e8; % Speed of light (in meters per second)
lambda = c / f; % Wavelength (in meters)
 
% Spatial grid
x = linspace(0, a, 100); % Grid along the width
y = linspace(0, b, 50); % Grid along the height
z = linspace(0, lambda/2, 25); % Grid along the depth (half-wavelength)
 
% Create a 3D grid
[x_grid, y_grid, z_grid] = meshgrid(x, y, z); 
 
% Correct TE10 Mode Electric Field
kx = pi / a; 
ky = pi / b; 
kz = 2 * pi * f / c;
E_TE10 = cos(kx * x_grid) .* sin(ky * y_grid) .* cos(kz * z_grid);

% TM11 Mode
E_TM11 = sin(kx * x_grid) .* cos(ky * y_grid) .* cos(kz * z_grid);

% Visualization
figure;

% TE10 Mode Visualization
subplot(2, 1, 1);
surf(x_grid(:, :, 1), y_grid(:, :, 1), abs(E_TE10(:, :, 1))); % x-z plane
title('Electric Field (TE10 Mode)');
xlabel('Width (m)');
ylabel('Depth (m)');
zlabel('Electric Field (E)');
colormap('jet');
colorbar;

% TM11 Mode Visualization
subplot(2, 1, 2);
surf(x_grid(:, :, 1), y_grid(:, :, 1), abs(E_TM11(:, :, 1))); % x-y plane
title('Electric Field (TM11 Mode)');
xlabel('Width (m)');
ylabel('Height (m)');
zlabel('Electric Field (E)');
colormap('jet');
colorbar;