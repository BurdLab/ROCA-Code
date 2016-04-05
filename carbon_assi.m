function [c_assi] = carbon_assi(Q_C,num_org,bug_attr,p)
% a function calculating the size-dependent photosynthetic carbon fixation; 
P_max = 2.46e6*bug_attr(:,4).^0.49; 
% maximum photosynthetic fixation (fmol C/cell/day)
% V: cell size in um3; reference from Taguchi, 1976; 
% I_S = 50, light; % species for low light adaption (uEin/m2/s); 
% I_s = 100,light; % species for high light adaption(uEin/m2/s); 
% steele 1965, photosynthesis inhibited by high ligth
I = p(1).tank; % surface light intensity (uEin/m2/s);
H = p(2).tank; % water depth (m); 
ke = 1.8/p(3).tank; % light extinction coefficient (/m); 
I_ave = I*(1-exp(-ke*H))/(ke*H); % average light intensity in a water column;  
I_s = bug_attr(:,21); % load LL or HL adaptation info; 
F_I = (I_ave./I_s).*exp(-I_ave./I_s + 1);
P = P_max.*F_I; % carbon fixation rate for each bug (fmol C/cell/day); 
% CO2 solubility is about 1.45 g/L at 20oC, calculation indicates that P
% stays at the same level of CO2 free diffusion; 
cell_quota_C_diff = bug_attr(1:num_org,7)-bug_attr(1:num_org,6);
% carbon cell quota difference between maximum and minimum;
cell_quota_C_space= bug_attr(1:num_org,7)'- Q_C;
% carbon cell quota maximum uptake space; 
portion_c = (cell_quota_C_space)./cell_quota_C_diff';
portion_c = max(0, portion_c);
portion_c = min(1, portion_c);
c_assi = P'.*portion_c;
% carbon assimilation rate does not depend on bug's genes in our model, but
% is a function of P_max(V) and LL or HL adaptation;
position_1 = find(Q_C > 0.95*bug_attr(:,7)');
% position_1 is used to locate bugs whose Q_C > middle value of (Q_C_min +
% Q_C_max), in other words, to find starving bugs; 
position_2 = find(cell_quota_C_space < c_assi);
% C uptake limited and adjusted by maximum N uptake space in the cell; 
c_assi(position_2) = cell_quota_C_space(position_2);
c_assi(position_1) = 0; 
% non-starving bugs will not assimilate carbon;  
