ZL = complex(20,25);
Z0 = 50;
gamma = (ZL-Z0)/(ZL+Z0);
ZL_matched = Z0 *(1+gamma)/(1-gamma);
smithchart(gamma);
fprintf('Antenna impedance (ZL): %.2f + %.2fj ohms\n', real(ZL), imag(ZL));
fprintf('RF circuit impedance (Z0): %d ohms\n', Z0);
fprintf('Reflection coefficient (Gamma): %.4f + %.4fj\n', real(gamma), imag(gamma));
fprintf('Matched antenna impedance (ZL_matched): %.2f + %.2fj ohms\n', real(ZL_matched), imag(ZL_matched));
 