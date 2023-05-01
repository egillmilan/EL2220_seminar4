% EL2220 Modeling a fishing scenario
clc; clear all; close all;
x = (linspace(0,10,11)/10)*2000;    % [0, 200, 400, ..., 2000]
frx_dp = [0, 50, 100, 200, 320, 500, 550, 480, 280, 130, 0];
frx = fit(x, frx_dp, 'poly2');