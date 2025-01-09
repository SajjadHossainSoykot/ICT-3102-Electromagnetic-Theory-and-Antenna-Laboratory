% Define voltage and current data (replace with actual measured data)
voltage = linspace(0, 1, 100); % Simulated voltage in volts (0 to 1V)
current = [linspace(0, 0.3, 50), linspace(0.3, 0, 50)]; % Simulated current in mA

% Plot the I-V characteristics
plot(voltage, current, 'b-', 'LineWidth', 2);
xlabel('Voltage (V)');
ylabel('Current (mA)');
title('I-V Characteristics of Gunn Diode');
grid on;

% Find the threshold voltage and current (approximate)
[~, idx] = max(current);
threshold_voltage = voltage(idx);
threshold_current = current(idx);

% Display results
fprintf('Threshold Voltage: %.2f V\n', threshold_voltage);
fprintf('Threshold Current: %.2f mA\n', threshold_current);