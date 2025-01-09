clc; 
close all; 
clear all; 
 
%Define frequency in Hz
f = 9e9; % 9 GHz
% Speed of light in cm/s
c = 3e10; 
m=1; 
n=0; 
a=2; 
b=1; 
 
% Calculate wavelength
lambda0 = c/f; 
lambda_c = 2/sqrt((m/a)^2+(n/b)^2); 
lambda_g=lambda0/(sqrt(1-(lambda0/lambda_c)^2)); 
omega=2*pi*f; 
beta=2*pi/lambda_g; 
 
% Calculate phase velocity
phase_velocity = omega/beta; 
 
% Calculate group velocity (approximate calculation)
group_velocity = c*c/phase_velocity; 
disp(['Wavelength: ', num2str(lambda0), ' cm']);
disp(['Phase Velocity: ', num2str(phase_velocity), ' cm/s']); 
disp(['Group Velocity: ', num2str(group_velocity), ' cm/s']);