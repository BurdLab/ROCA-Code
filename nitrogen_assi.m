function [N_assi,NH4_uptake,NO3_uptake,N2_uptake] = nitrogen_assi(Q_N,num_org,bug_attr,NH4,NO3,diffusion)
% to calculate nutrient assimilation rate for bugs
NH4_assi = zeros(1,num_org);
NO3_assi = zeros(1,num_org);
N2_assi = zeros(1,num_org);
N_assi = zeros(1,num_org);
NH4_uptake = zeros(1,num_org);
NO3_uptake = zeros(1,num_org);
N2_uptake = zeros(1,num_org);
N_assi = zeros(1,num_org);
portion = zeros(1,num_org);
% preallocation;
% NH4_critical = 1e9; % fmol N/l; 
% NH4 critical concentration (from literature, 1 uM for now), below that value, 
% amt (NH4 transporter gene will turn on to actively bring NH4 into cells); 
N2 = 1.428e12; % fmolN/l, N2 saturated in freshwater at 20oC; 
% solubility, 0.02g N2/l (values taken from website); 
cell_quota_N_diff = bug_attr(1:num_org,9)-bug_attr(1:num_org,8);
% nitrogen cell quota difference between maximum and minimum;
cell_quota_N_space= min(cell_quota_N_diff', bug_attr(1:num_org,9)'- Q_N);
% nitrogen cell quota maximum uptake space; 
portion_N = (cell_quota_N_space)./cell_quota_N_diff';
portion_N = max(0, portion_N);
portion_N = min(1, portion_N);
position_1=find(Q_N > 0.95*bug_attr(:,9)');
% position_1=find(Q_N > bug_attr(:,13)');
% position_1 is used to locate bug whose Q_N > middle value of (Q_N_min +
% Q_N_max), in other words, to find starving bugs; 
NH4_assi = diffusion(1,:).*(NH4-bug_attr(:,25)');
% bug_attr(:,25) is the critical NH4 value of each bug which is able to determine when amt gene will turn on; 
% also, when amt is off, NH4 concentration at the cell wall is equal to
% bug_attr(:,25); 
% bug_attr(:,25) is pre-determined by normrnd(NH4_critical, 1e8, 1, num_org);
% which means each bug's critical NH4 value is a normal distributino with a
% standard deviation of 1e8; 
position_3 = find(bug_attr(:,25)' > NH4);
% position_3 allocates those bugs whose amt gene is switched on; 
aa = bug_attr(1:num_org,15)';
% aa respresents amt gene existence; 
NH4_assi(position_3) = diffusion(1,position_3).*NH4.*aa(position_3);
% NH4 assimilation updates; 
% NH4_assi(position_1) = 0; 
% non-starving cells will not assimilate N;  
NH4_uptake=1000*NH4_assi.*portion_N;
% NH4 real uptake (fmol/cell/day); 
bb = bug_attr(1:num_org,16)';
NO3_assi(position_3) = diffusion(2,position_3).*NO3.*bb(position_3);
% NO3_assi(position_1) = 0; 
NO3_uptake=1000*NO3_assi.*portion_N;
% NO3 real uptake (fmol/cell/day)
cc = bug_attr(1:num_org,17)';
N2_assi(position_3) = diffusion(3,position_3).*N2.*cc(position_3);
% N2_assi(position_1) = 0; 
N2_uptake =1000*N2_assi.*portion_N;
% N2 real uptake (fmol/cell/day);
N_assi = NH4_uptake + NO3_uptake + N2_uptake;
% total nitrogen uptake; 
position_2 = find(cell_quota_N_space < N_assi);
% N uptake limited and adjusted by maximum N uptake space in the cell; 
NH4_uptake(position_2) = cell_quota_N_space(position_2).*(NH4_uptake(position_2)./N_assi(position_2));
NO3_uptake(position_2) = cell_quota_N_space(position_2).*(NO3_uptake(position_2)./N_assi(position_2));
N2_uptake(position_2) = cell_quota_N_space(position_2).*(N2_uptake(position_2)./N_assi(position_2));
NH4_uptake(position_1) = 0; 
NO3_uptake(position_1) = 0; 
N2_uptake(position_1) = 0; 
% non-starving bugs will not uptake N;
N_assi = NH4_uptake + NO3_uptake + N2_uptake;