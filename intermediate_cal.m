% this file is used to calculate intermediate useful results based on ode
% solutions; 
clear all 
load bug_attr
num_org = 96; % number of organisms included in this model; 
p = setUpP;
[bug] = bugs(num_org, bug_attr);
[diffusion]=diffu(num_org,p,bug);
load coast1 
y = coast1; 
% load simulated results: 
% coast1: scenaria I.1; 
% coast2: scenaria I.2;
% coast3: scenaria I.3; 
% gyre1: scenaria II.2; 
num_time = 360;
% bug_attr = bug_attr_test; % for test purpose; 
clear cell_quota_C cell_quota_N cell_quota_P cell_density ammonia nitrate dip cop cp
clear gr_rate ntr_lmt dth_rate net_gr 
for i = 1:num_org
    cell_quota_C(:,i) = y(:,4*i-3);
    cell_quota_N(:,i) = y(:,4*i-2);
    cell_quota_P(:,i) = y(:,4*i-1);
    cell_density(:,i) = y(:,4*i);
end

N_in_cells = cell_quota_N.*cell_density;
N_particle_csrt = sum(N_in_cells');
Biomass_N = N_particle_csrt/1e9;
plot(Biomass_N)
% Biomass_N: total biomass in terms of N for scenaria I.1 

ammonia = y(:,4*i+1)/1e9;
nitrate = y(:,4*i+2)/1e9;
n2 = y(:,4*i+3)/1e9;
dip = y(:,4*i+4)/1e9;
cop = y(:,4*i+5)/1e9;
cp = y(:,4*i+6)/1e9;
TN = ammonia + nitrate; 
TP = dip + cop + cp; 
clear i 
% extract nutrient concentrations information from y; 

for i = 1:num_time
    Q_C = cell_quota_C(i,:);
    Q_N = cell_quota_N(i,:);
    Q_P = cell_quota_P(i,:);
    [temp] = temp_local(i);
    [nutrient_lim] = growth_rate_lim(bug,Q_C,Q_N,Q_P,num_org);
    [u_T] = growth_t(bug_attr,temp,num_org); 
    [u] = growth_rate(bug_attr,Q_C,Q_N,Q_P,u_T);
    gr_rate(i,:) = u;
    ntr_lmt(i,:) = nutrient_lim;
end
% calculate limiting nutrient and growth rate for each bug;  

clear i Q_C Q_N Q_P u

for i = 1:num_time
    Q_B = cell_density(i,:);
    [death_rt]=death_rate(bug_attr,Q_B);
    dth_rate(i,:) = death_rt;  
end
% calculate death rate for each bug; 
net_gr = gr_rate-dth_rate;
clear Q_B death_rt
clear NH4_cell_uptake NO3_cell_uptake N2_cell_uptake N_cell_uptake
clear PO4_cell_uptake COP_cell_uptake CP_cell_uptake P_cell_uptake

for i = 1:num_time
    Q_C = cell_quota_C(i,:);
    Q_N = cell_quota_N(i,:);
    Q_P = cell_quota_P(i,:);
    [c_assi] = carbon_assi(Q_C,num_org,bug_attr,p);
    NH4 = ammonia(i,:);
    NO3 = nitrate(i,:);
    N2 = n2(i,:);
    [N_assi,NH4_uptake,NO3_uptake,N2_uptake] = nitrogen_assi(Q_N,num_org,bug_attr,NH4,NO3,diffusion);
    % [N_assi,NH4_uptake,NO3_uptake,N2_uptake] = nitrogen_assi_1(Q_N,num_org,bug_attr,NH4,NO3,N2,diffusion);
    NH4_cell_uptake(i,:) = NH4_uptake;
    NO3_cell_uptake(i,:) = NO3_uptake;
    N2_cell_uptake(i,:) = N2_uptake;
    N_cell_uptake(i, :) = N_assi;
    clear NH4_uptake NO3_uptake N2_uptake N_assi
    PO4 = dip(i,:);
    COP = cop(i,:);
    CP = cp(i,:);
    [P_assi,PO4_uptake,COP_uptake,CP_uptake] = phosphorus_assi(bug_attr,Q_P,num_org,PO4,COP,CP,diffusion);
    PO4_cell_uptake(i,:) = PO4_uptake;
    COP_cell_uptake(i,:) = COP_uptake;
    CP_cell_uptake(i, :) = CP_uptake;
    P_cell_uptake(i, :) = P_assi;
    clear PO4_uptake COP_uptake CP_uptake P_assi
end
% extract N and P uptake information; 
clear gene
gene = zeros(num_time, num_org, 6); 
[gene] = gene_expression(num_time,num_org,bug_attr,bug,ammonia,dip); 
% recalculate gene expression in each bug according to ammonia and DIP
% variations and the situation of bug's genetic combination;
% information stored in "gene" is according to the following order: 
% gene(:,:,1): amt; 
% gene(:,:,2): nr; 
% gene(:,:,3): nif; 
% gene(:,:,4): pst; 
% gene(:,:,5): cop; 
% gene(:,:,6): cp;
amt_amount = zeros(num_time,1); 
nr_amount = zeros(num_time,1);
nif_amount = zeros(num_time,1); 
pst_amount = zeros(num_time,1); 
pho_amount = zeros(num_time,1); 
phn_amount = zeros(num_time,1); 
for i = 1:num_time
    amt_position = find(gene(i,:,1) == 1);
    % finding bugs whose amt is on;
    amt_amount(i) = sum(cell_density(i, amt_position));
    % number of amt genes;
    nr_position = find(gene(i,:,2) == 1);
    % finding bugs whose nr is on;
    nr_amount(i) = sum(cell_density(i, nr_position));
    % number of nr genes;
    nif_position = find(gene(i,:,3) == 1);
    % finding bugs whose nif is on;
    nif_amount(i) = sum(cell_density(i, nif_position));
    % number of nif genes;
    pst_position = find(gene(i,:,4) == 1);
    % finding bugs whose pst is on;
    pst_amount(i) = sum(cell_density(i, pst_position));
    % number of pst genes;
    pho_position = find(gene(i,:,5) == 1);
    % finding bugs whose cop is on;
    pho_amount(i) = sum(cell_density(i, pho_position));
    % number of cop genes;
    phn_position = find(gene(i,:,6) == 1);
    % finding bugs whose cp is on;
    phn_amount(i) = sum(cell_density(i, phn_position));
    % number of cp genes;
end
clear N_in_cell P_in_cell
for i = 1:num_time
    Q_C = cell_quota_C(i,:);
    Q_N = cell_quota_N(i,:);
    Q_P = cell_quota_P(i,:);
    Q_B = cell_density(i,:);
    death_rt =dth_rate(i,:);
    [C_in_bio,N_in_bio,P_in_bio,bio_mass_C,bio_mass_N,bio_mass_P,N_in_gene,P_in_gene]=bio_mass(Q_C,Q_N,Q_P,Q_B,death_rt);
    C_in_cell(i) = C_in_bio; 
    N_in_cell(i) = N_in_bio;
    P_in_cell(i) = P_in_bio;
    clear N_in_bio P_in_bio
end
clear total_C total_N total_P