clear; close all; clc;
w = 2;
t = linspace(0,10,200);
c = cos(w*t);

figure;
patch([t fliplr(t)], [c zeros(size(t))], [zeros(size(t)) zeros(size(t))],'y', 'DisplayName', 'Electric Field (E)');
hold on;
patch([t fliplr(t)], [zeros(size(t)) zeros(size(t))], [c zeros(size(t))],'m', 'DisplayName', 'Electric Field (E)');
hold off;
view (45,45);
xlabel('Time (T)');
ylabel('Electric Field (E)');
zlabel('Magnetic Field (B)');
grid on;
legend ('show', 'location', 'best');