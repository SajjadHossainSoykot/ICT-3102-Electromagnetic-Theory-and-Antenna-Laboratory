% Rectangular Waveguide Simulation (TE10 Mode) - Improved
clc; clear; close all;

% Parameters
a = 0.05;  % Width of the waveguide (in meters)
b = 0.02;  % Height of the waveguide (in meters)
f = 10e9;  % Operating frequency (10 GHz)
c = 3e8;   % Speed of light (m/s)
mu_0 = 4 * pi * 1e-7;  % Permeability of free space (H/m)

% Derived Parameters
lambda_c = 2 * a;  % Cutoff wavelength for TE10 mode
f_c = c / lambda_c;  % Cutoff frequency
lambda = c / f;  % Free-space wavelength
beta = 2 * pi * sqrt((1 / lambda)^2 - (1 / lambda_c)^2); % Propagation constant
omega = 2 * pi * f;  % Angular frequency

% Validation
if f <= f_c
    error('Operating frequency must be higher than the cutoff frequency.');
end

% Grid for Fields
x = linspace(0, a, 50);  % Width
y = linspace(0, b, 50);  % Height
z = linspace(0, 2 * lambda, 100);  % Length
[X, Y, Z] = meshgrid(x, y, z);

% Time and Animation Parameters
t = 0;  % Start time
time_steps = 50;  % Number of animation steps
dt = 1 / (2 * f);  % Time step duration

% Fields (TE10 Mode)
E_z = cos(pi * X / a) .* sin(omega * t - beta * Z);  % Electric field (dominant)
H_x = -(pi / (omega * a * mu_0)) * sin(pi * X / a) .* cos(omega * t - beta * Z);  % Magnetic field
H_z = (1 / (omega * mu_0 * b)) * cos(pi * X / a) .* cos(omega * t - beta * Z);  % Magnetic field

% Animation of Field Propagation
figure;
for t_idx = 1:time_steps
    % Update time
    t = (t_idx - 1) * dt;
    E_z = cos(pi * X / a) .* sin(omega * t - beta * Z);
    H_x = -(pi / (omega * a * mu_0)) * sin(pi * X / a) .* cos(omega * t - beta * Z);
    H_z = (1 / (omega * mu_0 * b)) * cos(pi * X / a) .* cos(omega * t - beta * Z);

    % Electric Field Plot
    subplot(3, 1, 1);
    surf(X(:, :, 1), Y(:, :, 1), E_z(:, :, 1));
    shading interp;
    title('Electric Field E_z (TE10 Mode)');
    xlabel('Width (m)');
    ylabel('Height (m)');
    zlabel('Electric Field (V/m)');
    colorbar;
    axis tight;

    % Magnetic Field H_x
    subplot(3, 1, 2);
    surf(X(:, :, 1), Y(:, :, 1), H_x(:, :, 1));
    shading interp;
    title('Magnetic Field H_x (TE10 Mode)');
    xlabel('Width (m)');
    ylabel('Height (m)');
    zlabel('Magnetic Field (A/m)');
    colorbar;
    axis tight;

    % Magnetic Field H_z
    subplot(3, 1, 3);
    surf(X(:, :, 1), Y(:, :, 1), H_z(:, :, 1));
    shading interp;
    title('Magnetic Field H_z (TE10 Mode)');
    xlabel('Width (m)');
    ylabel('Height (m)');
    zlabel('Magnetic Field (A/m)');
    colorbar;
    axis tight;

    % Pause for Animation
    pause(0.1);
end
