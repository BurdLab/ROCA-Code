function [u_T] = growth_t(bug_attr,temp,num_org)
tao_1 = 0.33; 
tao_2 = 0.3; 
A = 1.04; 
B_small = 1e-3;
B_large = 3e-4;
C = 4;
% parameter used in Mick's paper; 
% temp: local temperature, (oC);
u_T_big = zeros(32,1);
u_T_small = zeros(64,1);
u_T = zeros(num_org,1);
u_T_small=(1/tao_1)*((A.^temp).*exp(-B_small*(temp-bug_attr(1:64,28)).^C)-tao_2);
u_T_big = (1/tao_1)*((A.^temp).*exp(-B_large*(temp-bug_attr(65:num_org,28)).^C)-tao_2);
% correlation used may be found in Mick's paper; 
position_T_small = find(u_T_small < 0);
position_T_big = find(u_T_big < 0);

u_T_small(position_T_small) = 0;
u_T_big(position_T_big) = 0; 

u_T_small = u_T_small./bug_attr(1:64,29);
u_T_big = u_T_big./bug_attr(65:num_org,29);

u_T = [u_T_small', u_T_big'];
% preserve growth rate from stopping;
position_u_T = find(u_T<0.2);
u_T(position_u_T) = 0.2;