function [diffusion]=diffu(num_org,p,bug)
% according to equation
% J = 4*pi*r*Sh*D*(M-m) or = 2*pi*d*Sh*D*(M-m);
% Sh: Sherwood number; Sh = 1 for now; 
% r: radius, (um);
% R: diameter, (um); 
% D: diffusion coefficient (m2/day);
% M: nutrient concentration (fmol N or P/l);
% this function is to calculate the first part of above equation
% 2*pi*R*Sh*D;  
% concentration difference has to be determined later according to nutrient
% forms;
for i = 1:num_org 
    diffusion(1,i)= 2*pi*bug(i).diameter*p(1).DN; % NH4 diffusion;
    diffusion(2,i)= 2*pi*bug(i).diameter*p(2).DN; % NO3 diffusion;
    diffusion(3,i)= 2*pi*bug(i).diameter*p(3).DN; % N2 diffusion;
    diffusion(4,i)= 2*pi*bug(i).diameter*p(1).DP; % PO4 diffusion;
    diffusion(5,i)= 2*pi*bug(i).diameter*p(2).DP; % COP diffusion;
    diffusion(6,i)= 2*pi*bug(i).diameter*p(3).DP; % CP diffusion;
end
diffusion = diffusion/1e6;
%a parameter to calculate nutrient diffusion (m^3/day);