% EL2220 Modeling a fishing scenario
clc; clear all; close all;

% ================ a. ================
xr = (linspace(0,10,11)/10)*2000;       % [0, 200, 400, ..., 2000]
fr_dp = [0, 50, 100, 200, 320, 500, 550, 480, 280, 130, 0];

nr = 7;                                 % Degree of fitted polynomial
fr = polyfix(xr, fr_dp, nr, [0 2000], [0 0]);

% plot(xr,fr_dp, 'o'); hold on; grid on;
% plot([0:2000], polyval(fr, [0:2000]));
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

k = [1, 9, 17, 23];                     % Number of fishing boats
xdot_ = fr - k'*[0 0 0 fe];             % xdot = f(x,y)

% for i = 1:4
%     xdot = xdot_(i,:);
% 
%     hold on; grid on;
%     plot(linspace(0,2000,2001), polyval(xdot, linspace(0,2000,2001)));
%     xlabel('Fish in the sea'); ylabel('Rate of change of fish population');
%     xeq = roots(xdot);                  % Find the roots of x dot
%     xeq = xeq(xeq==real(xeq))';         % Remove imaginary solutions
% end
% legend('k = '+string(k(1)), 'k = '+string(k(2)), 'k = '+string(k(3)), ...
%        'k = '+string(k(4)))

% ================ e. ================
% No code

% ================ f. ================
step = 1/365;                           % How frequently is the number of boats evaluated? (daily)
n = 365*50;                             % Number of steps simulated (365 days * 20 years)
colour = eye(3);

ky = [1, 0.5, 0.1];                     % "Responsiveness" coefficient
c = 19:24;                              % Number of fish which must be caught to cover operational cost of boat
x0 = 1000;                              % Initial number of fish in sea
y0 = 10;                                % Initial number of fishing boats

% for j = 1:6
%     x = [x0, zeros(1,n-1)];
%     y = [y0, zeros(1,n-1)];
%     subplot(3,2,j); hold on; grid on; title('c = ' + string(c(j)))
%     for k = 1:3
%         for i = 2:n
%             xdot = polyval(fr - y(i-1) * [0 0 0 fe], x(i-1));   % Compute change in fish population
%             ydot = ky(k)*y(i-1)*(polyval(fe, x(i-1))-c(j));     % Compute change in boat quantity
%             x(i) = x(i-1) + step*xdot;                          % Compute fish population in next time step
%             y(i) = y(i-1) + step*ydot;                          % Compute boat quantity in next time step
%         end
%         plot(x,y,'.', 'Color', colour(k,:))
%     end
%     axis([0,2000, 0, inf]); xlabel('Fish'); ylabel('Boats');
%     legend('k_y = 1','k_y = 0.5', 'k_y = 0.1'); legend boxoff;
% end


% ================ g. ================
% No code

% ================ h. ================
% No code