% EL2220 Modeling a fishing scenario
clc; clear all; close all;

x = (linspace(0,10,11)/10)*2000;    % [0, 200, 400, ..., 2000]
frx_dp = [0, 50, 100, 200, 320, 500, 550, 480, 280, 130, 0];

n = 7;                              % Degree of fitted polynomial
frx = polyfix(x, frx_dp, n, [0 2000], [0 0]);

plot(x,frx_dp, 'o'); hold on; grid on;
plot(linspace(0,2000,2001), polyval(frx, linspace(0,2000,2001)));
xlabel('Fish in the sea'); ylabel('Increase of fish per year');
legend('Raw data', '7th degree polynomial fit');