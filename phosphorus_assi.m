function [P_assi,PO4_uptake,COP_uptake,CP_uptake] = phosphorus_assi(bug_attr,Q_P,num_org,PO4,COP,CP,diffusion)
% to calculate phosphorus assimilation rate for bugs
PO4_assi = zeros(1,num_org);
COP_assi = zeros(1,num_org);
CP_assi = zeros(1,num_org);
P_assi = zeros(1,num_org);
PO4_uptake = zeros(1,num_org);
COP_uptake = zeros(1,num_org);
CP_uptake = zeros(1,num_org);
P_assi = zeros(1,num_org);
portion_P = zeros(1,num_org);
% preallocation;
PO4_critical = 5e7; % fmol P/l
% PO4 critical concentration (from literature, 50 nM for now), below that value, 
% APA (pst transporter gene will turn to actively bring PO4 into cells); 
cell_quota_P_diff = bug_attr(1:num_org,11)-bug_attr(1:num_org,10);
% phosphorus cell quota difference between maximum and minimum;
cell_quota_P_space= min(cell_quota_P_diff', bug_attr(1:num_org,11)'- Q_P);
% phosphorus cell quota maximum uptake space;
portion_P = (cell_quota_P_space)./cell_quota_P_diff';
portion_P = max(0, portion_P);
portion_P = min(1, portion_P);
position_1=find(Q_P > 0.95*bug_attr(:,11)');
% position_1=find(Q_P > bug_attr(:,14)');
% position_1 is used to locate bug whose Q_P > middle value of (Q_P_min +
% Q_P_max), in other words, to find starved bugs; 
PO4_assi = diffusion(1,:).*(PO4-bug_attr(:,26)');
% bug_attr(:,26) is the critical PO4 value of each bug which is able to determine when pho gene will turn on; 
% meanwhile, when pho is off, PO4 concentration at the cell wall is equal to
% bug_attr(:,26); 
% bug_attr(:,26) is pre-determined by normrnd(PO4_critical, 5e6, 1, num_org);
% which means each bug's critical NH4 value is a normal distributino with a
% standard deviation of 1e6;
position_3 = find(bug_attr(:,26)' > PO4);
% position_3 allocates those bugs whose pho gene is switched on; 
aa = bug_attr(1:num_org,18)';
% aa respresents pst gene existence; 
PO4_assi(position_3) = diffusion(4,position_3).*PO4.*aa(position_3);
% PO4 assimilation updates; 
% PO4_assi(position_1) = 0;
% non-starving cells will not assimilate P; 
PO4_uptake=1000*PO4_assi.*portion_P;
% PO4 real uptake (fmol/cell/day); 
bb = bug_attr(1:num_org,19)';
COP_assi(position_3) = diffusion(5,position_3).*COP.*bb(position_3);
% COP_assi(position_1) = 0;
COP_uptake=1000*COP_assi.*portion_P;
% COP real uptake (fmol/cell/day)
cc = bug_attr(1:num_org,20)';
CP_assi(position_3) = diffusion(6,position_3).*CP.*cc(position_3);
% CP_assi(position_1) = 0;
CP_uptake =1000*CP_assi.*portion_P;
% CP real uptake (fmol/cell/day);
P_assi = PO4_uptake + COP_uptake + CP_uptake; 
position_2 = find(cell_quota_P_space < P_assi);
% P uptake limited and adjusted by maximum P uptake space in the cell; 
PO4_uptake(position_2) = cell_quota_P_space(position_2).*(PO4_uptake(position_2)./P_assi(position_2));
COP_uptake(position_2) = cell_quota_P_space(position_2).*(COP_uptake(position_2)./P_assi(position_2));
CP_uptake(position_2) = cell_quota_P_space(position_2).*(CP_uptake(position_2)./P_assi(position_2));
PO4_uptake(position_1) = 0; 
COP_uptake(position_1) = 0; 
CP_uptake(position_1) = 0; 
% non-starving bugs will not uptake P; 
P_assi = PO4_uptake + COP_uptake + CP_uptake;