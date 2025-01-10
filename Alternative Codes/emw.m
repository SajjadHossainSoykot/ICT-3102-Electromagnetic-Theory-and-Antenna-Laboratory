% Parameters
clc; clear; close all;
c = 3e8;                  % Speed of light (m/s)
f = 1e9;                  % Frequency (1 GHz)
lambda = c / f;           % Wavelength (m)
T = 1 / f;                % Period (s)
E0 = 3;                   % Amplitude of electric field (V/m)
H0 = E0 / 377;            % Amplitude of magnetic field (A/m)

% Grid for space and time
z = linspace(-5*lambda, 5*lambda, 500);  % Extended spatial axis (m)
t = linspace(0, T, 150);                 % Time axis (s)

% Create figure
figure;
hold on;
grid on;

% Plot setup
axis([-5*lambda 5*lambda -1.5*E0 1.5*E0 -1.5*H0 1.5*H0]);
xlabel('z (Position) [m]');
ylabel('E-Field (Electric) [V/m]');
zlabel('H-Field (Magnetic) [A/m]');
title('Electromagnetic Wave: Extended E and H Fields');
view(45, 30);

% Animation loop
for k = 1:length(t)
    % Electric field (E) oscillating in the y-direction
    E = E0 * cos(2*pi*f*t(k) - 2*pi*z/lambda);
    % Magnetic field (H) oscillating in the x-direction
    H = H0 * cos(2*pi*f*t(k) - 2*pi*z/lambda);
    
    % Clear previous plots
    cla;
    
    % Plot Electric Field
    plot3(z, E, zeros(size(z)), 'r', 'LineWidth', 2); % Red for E
    
    % Plot Magnetic Field
    plot3(z, zeros(size(z)), H, 'b', 'LineWidth', 2); % Blue for H
    
    % Legend
    legend('Electric Field (E)', 'Magnetic Field (H)', 'Location', 'northeast');
    
    % Pause for animation effect
    pause(0.03);  % Smooth animation
end
