% Sample data (replace with actual measurements)
reflector_voltage = [100 110 120 130 140 150 160 170 180 190]; % in volts
output_power = [0 10 20 30 40 50 45 35 20 10]; % in mW

% Plot output power vs. reflector voltage
plot(reflector_voltage, output_power, 'b-', 'LineWidth', 2);
xlabel('Reflector Voltage (V)');
ylabel('Output Power (mW)');
title('Reflex Klystron Characteristics');
grid on;

% Find the approximate optimum reflector voltage
[max_power, idx] = max(output_power);
optimum_voltage = reflector_voltage(idx);

% Display the result
fprintf('Optimum Reflector Voltage: %.2f V\n', optimum_voltage);