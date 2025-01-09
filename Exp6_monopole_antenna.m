clc;
clear all;
close all;

% Define the wavelength (λ) and monopole antenna length (l)
lamda = 10; % Wavelength
l = 4; % Length of the monopole antenna
ratio = l / lamda; % Ratio of length to wavelength
B = (2 * pi / lamda); % Wave number (for the monopole)

% Define the range of angles (θ) for the plot
theta = -pi / 2:pi / 100:pi / 2;

% Check if the monopole is short or not
if ratio <= 0.1 % Short monopole antenna
    E = sin(theta); % Radiation pattern for short monopole
    En = abs(E); % Take the absolute value of E for plotting
    % Plot the radiation pattern
    figure;
    polarplot(theta, En, 'LineWidth', 2); % Use polarplot instead of polar
    title('Radiation Pattern of Short Monopole Antenna');
    rlim([0 1]);
    thetalim([0 360]); % Display half-circle (only upper half)
    grid on;
else % Non-short monopole antenna
    f1 = cos(B * l / 2 * cos(theta)); % Part of the radiation pattern function
    f2 = cos(B * l / 2); % Another part of the radiation pattern
    f3 = sin(theta); % Sinusoidal term for radiation
    % Calculate the electric field for longer monopoles
    E = (f1 - f2) ./ f3;
    En = abs(E); % Take the absolute value of E for plotting

    % Plot the radiation pattern
    figure;
    polarplot(theta, En, 'LineWidth', 2); % Use polarplot instead of polar
    title('Radiation Pattern of Non-Short Monopole Antenna');
    rlim([0 1]);
    thetalim([0 360]); % Display half-circle (only upper half)
    grid on;
end

% Output the parameters
fprintf('Wavelength (λ) = %.2f\n', lamda);
fprintf('Monopole Length (l) = %.2f\n', l);
