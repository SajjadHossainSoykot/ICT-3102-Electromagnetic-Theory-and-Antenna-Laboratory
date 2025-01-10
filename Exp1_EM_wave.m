% Electromagnetic Wave Parameters
w = 2;                     % Angular frequency
t = linspace(0, 10, 200);   % Time vector
x = ones(size(t));          % Spatial constant
k = pi / 2;                 % Wavenumber
c = cos(w * t - k * x);     % Wave function

% Visualization of Electric and Magnetic Fields
figure
% Electric Field (E)
patch([t fliplr(t)], [c zeros(size(c))], [zeros(size(t)) zeros(size(t))], 'yellow', 'DisplayName', 'Electric Field (E)');

hold on;

% Magnetic Field (B)
patch([t fliplr(t)], [zeros(size(t)) zeros(size(t))], [c zeros(size(c))], 'magenta', 'DisplayName', 'Magnetic Field (B)');

hold off;

% Grid, View, and Legend
grid on;
view(45, 45);  % Set the 3D view angle
title('3D Visualization of Electromagnetic Wave');
xlabel('Time (t)');
ylabel('Electric Field (E)');
zlabel('Magnetic Field (B)');

% Add Legend
legend('show', 'Location', 'best');