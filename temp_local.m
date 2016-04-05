function [temp] = temp_local(t)
% function used to calculate a local temperature according to time; 
% t = [1:1:360];
y_sin = (2*pi/359)*t - 2*pi/359;
% y_sin: calculate x in sin(x) from 0 to pi; 
% when t = 1, y_sin = 0;
% when t = 360, y_cos = 2*pi; 
% y_sin = k*t+b; 
temp = 15*(sin(y_sin-pi/2)+1);
% temp will change from 0 to 30 oC;
% temp = (1/3)*temp + 10; 
% this temp is used to calculate gyre_temp, changing from 10 to 20 oC; 