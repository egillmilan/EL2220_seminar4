% EL2220 Modeling a fishing scenario
clc; clear all; close all;

% ================ a. ================
xr = (linspace(0,10,11)/10)*2000;       % [0, 200, 400, ..., 2000]
fr_dp = [0, 50, 100, 200, 320, 500, 550, 480, 280, 130, 0];

nr = 7;                                 % Degree of fitted polynomial
fr = polyfix(xr, fr_dp, nr, [0 2000], [0 0]);

% plot(xr,fr_dp, 'o'); hold on; grid on;
% plot(linspace(0,2000,2001), polyval(fr, linspace(0,2000,2001)));
% xlabel('Fish in the sea'); ylabel('Increase of fish per year');
% legend('Raw data', '7th degree polynomial fit');

% ================ b. ================
xe = [0 11 22 33 44 55 100]/100*2000;   % [0, 220, 440, 660, 880, 1100, 2000]
fe_dp = [0, 10, 16, 20, 22, 23, 25];

ne = 4;                                 % Degree of fitted polynomial
fe = polyfix(xe, fe_dp, ne, [0 2000], [0 25]);

% plot(xe,fe_dp, 'o'); hold on; grid on;
% plot(linspace(0,2000,2001), polyval(fe, linspace(0,2000,2001)));
% xlabel('Fish in the sea'); ylabel('Ship effectiveness [fish caught/yr.]');
% legend('Raw data', '4th degree polynomial fit');

% ================ c. ================
% No code

% ================ d. ================

k = 7;                                 % number of fishing boats
xdot = fr - k*[0 0 0 fe];

hold on; grid on;
plot(linspace(0,2000,2001), polyval(xdot, linspace(0,2000,2001)));
xlabel('Fish in the sea'); ylabel('Rate of change of fish population');

xeq = roots(xdot);
xeq = xeq(xeq==real(xeq))'