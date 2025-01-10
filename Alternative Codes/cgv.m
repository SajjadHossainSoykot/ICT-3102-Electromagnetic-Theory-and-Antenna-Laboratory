% Constants
c = 3e8;                  % Speed of light (m/s)
f = 9e9;                  % Operating frequency (9 GHz)
a = 0.02286;              % Waveguide width (m) (standard WR-90)
b = 0.01016;              % Waveguide height (m) (standard WR-90)
m = 1;                    % Mode number (m for TE mode)
n = 0;                    % Mode number (n for TE mode)

% Calculate cutoff frequency (fc)
fc = (c / 2) * sqrt((m/a)^2 + (n/b)^2);

% Phase velocity (vp)
vp = c / sqrt(1 - (fc/f)^2);

% Group velocity (vg)
vg = c * sqrt(1 - (fc/f)^2);

% Display results
fprintf('Cutoff Frequency (fc): %.2f GHz\n', fc / 1e9);
fprintf('Phase Velocity (vp): %.2f m/s\n', vp);
fprintf('Group Velocity (vg): %.2f m/s\n', vg);
