lambda = input('Enter Wavelength, Lambda (m):  ');
l = input('Enter Dipole Length, L (m):');
ratio = l/lambda;
B = 2*pi/lambda;
theta = linspace(0, 2*pi, 360);

if ratio <= 0.1
    E = sin(theta);
else
    E = (cos((B*l/2.*cos(theta))) - cos(B*l/2)) ./ sin(theta);
end

E = abs(E) / max(abs(E));

figure;
polarplot(theta, E, 'LineWidth', 2, 'Color', 'Blue');
title(sprintf('Radiation Pattern for Dipole Antenna (\\lambda = %.2f, l = %.2f)', lambda, l));
grid on;
