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
 
% TE Mode (TE10)
kx_TE10 = pi / a; 
E_TE10 = cos(kx_TE10 * x_grid) .* sin(pi * y_grid / b) .* cos(2 * pi * f * z_grid / c); 
 
% TM Mode (TM11)
kx_TM11 = pi / a; 
ky_TM11 = pi / b; 
E_TM11 = sin(kx_TM11 * x_grid) .* cos(ky_TM11 * y_grid) .* cos(2 * pi * f * z_grid / c); 
 
% Visualization
figure; 
subplot(2, 1, 1); 
surf(x_grid(:,:,1), y_grid(:,:,1), abs(E_TE10(:,:,1))); 
title('Electric Field (TE Mode)');
xlabel('Width (m)');
ylabel('Height (m)');
zlabel('Electric Field (E)');
colormap('jet');
colorbar; 
 
subplot(2, 1, 2); 
surf(x_grid(:,:,1), y_grid(:,:,1), abs(E_TM11(:,:,1))); 
title('Electric Field (TM Mode)');
xlabel('Width (m)');
ylabel('Height (m)');
zlabel('Electric Field (E)');
colormap('jet');
colorbar; 