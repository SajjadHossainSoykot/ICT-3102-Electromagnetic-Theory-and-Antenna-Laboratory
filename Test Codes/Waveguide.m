% Constants and dimensions
a = 0.02286; % Width of waveguide (meters)
b = 0.01016; % Height of waveguide (meters)
f = 10e9; % Frequency (10 GHz)
c = 3e8; % Speed of light (meters/second)
lambda = c / f; % Free-space wavelength (meters)

% Spatial grid
x = linspace(0, a, 100); % Grid along the width
y = linspace(0, b, 50); % Grid along the height
z = linspace(0, lambda / 2, 25); % Grid along the depth (half-wavelength)
[x_grid, y_grid, z_grid] = meshgrid(x, y, z);

% Correct TE10 Mode Electric Field
kx = pi / a; % Wave number in x-direction
ky = pi / b; % No variation in y-direction for TE10
kz = 2 * pi * f / c; % Wave number in z-direction
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
