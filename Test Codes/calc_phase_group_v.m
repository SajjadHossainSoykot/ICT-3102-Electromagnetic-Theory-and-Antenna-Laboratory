clear; close all; clc;
f = 9e9;
c=3e10;
m=1;
n=0;
a = 2;
b =1;

lambda0 = c/f;
lambdac=2/sqrt((m/a)^2+(n/b)^2);
lambdag = lambda0/sqrt(1-(lambda0/lambdac)^2);
v_phase = f * lambdag;
v_group = c*c/(v_phase);
fprintf('Wavelength: %f cm\n', lambda0);
fprintf('Phase Velocity: %f cm/s\n', v_phase);
fprintf('Group Velocity: %f cm/s\n', v_group);


