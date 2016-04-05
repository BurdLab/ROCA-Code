% running for sensitivity test;
clear all

% load some parameters; 
load bug_attr
num_org = 96;
year_cycle = 360;
num_time = 10*year_cycle; %tspan(end)+1;
clear cell_quota_C cell_quota_N cell_quota_P cell_density ammonia nitrate dip cop cp
clear gr_rate ntr_lmt dth_rate net_gr 
  
% y = gyre_SA_amt;
% calculation of biomass

for i = 1:num_org
    cell_quota_C(:,i) = y(end-359:end,4*i-3);
    cell_quota_N(:,i) = y(end-359:end,4*i-2);
    cell_quota_P(:,i) = y(end-359:end,4*i-1);
    cell_density(:,i) = y(end-359:end,4*i);
end

N_in_cells = cell_quota_N.*cell_density;
N_particle_csrt = sum(N_in_cells');
Biomass_N = N_particle_csrt'/1e9;
plot(Biomass_N)

% biomass_sensitivity contains biomass (uN/l) from baseline, 
% C_NH4, C_PO4, C_NH4 and C_PO4 (double), 
% penalty amt, nr, nif, pst, pho, and phn (double) in each column; 
load biomass_sensitivity
% relative changes to evaluate the parameter's impact on model results
% the reference values are base line values of biomass; 
RD_C_NH4 = 100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,2))./biomass_sensitivity(:,1); 
RD_C_PO4 = 100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,3))./biomass_sensitivity(:,1);
RD_C_NH4_PO4=100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,4))./biomass_sensitivity(:,1); 

% define the whole figure frame
plot_f = figure; 
% set the background as white
set(plot_f, 'Color', 'w')
set(plot_f, 'PaperPosition', [0 0 9 11])
plot_SA=subplot(1,1,1)

plot_SA_CNH4=plot([1:5:360], RD_C_NH4(1:5:360), '-^')
hold on
plot_SA_CPO4=plot([1:5:360], RD_C_PO4(1:5:360),'-*')
plot_SA_CNH4PO4=plot([1:5:360], RD_C_NH4_PO4(1:5:360),'-o')
% set(plot_SA_CNH4, 'LineWidth', 2)
% set(plot_SA_CPO4, 'LineWidth', 2)
% set(plot_SA_CNH4PO4, 'LineWidth', 2)
set(plot_SA_CNH4, 'MarkerSize', 10)
set(plot_SA_CPO4, 'MarkerSize', 10)
set(plot_SA_CNH4PO4, 'MarkerSize', 10)
% set limits for x and y axis
set(plot_SA, 'XLim', [0 360], 'FontWeight', 'bold')
set(plot_SA, 'XTick', [0 60 120 180 240 300 360], 'FontWeight', 'bold')
% set(plot_SA, 'YLim', [-1 5], 'FontWeight', 'bold')
% set(plot_SA, 'YTick', [-1 0 1 2 3 4 5], 'FontWeight', 'bold')
% set(plot_SA,'XTickLabel',[])
% set legend
set(plot_SA,'FontSize', 16, 'FontWeight', 'bold')
plot_legend = legend('C_N_H_4','C_P_O_4','C_N_H_4_P_O_4')
set(plot_legend, 'Position', [0.3 0.7 0.2031 0.20])
% set x and y labels
plot_xlabel=xlabel('Time (day)')
set(plot_xlabel, 'FontSize', [16])
set(plot_xlabel, 'FontWeight', 'Bold')
plot_ylabel=ylabel('Relative Difference (%)')
set(plot_ylabel, 'FontSize', [16])
set(plot_ylabel, 'FontWeight', 'Bold')
% 
grid on

RD_smooth = 100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,11))./biomass_sensitivity(:,1); 

% define the whole figure frame
plot_f = figure; 
% set the background as white
set(plot_f, 'Color', 'w')
set(plot_f, 'PaperPosition', [0 0 9 11])
plot_smooth=subplot(1,1,1)

plot_smooth_bio=plot([1:5:360], RD_smooth(1:5:360), '-^')
grid on

set(plot_smooth_bio, 'MarkerSize', 10)

% set limits for x and y axis
set(plot_smooth, 'XLim', [0 360], 'FontWeight', 'bold')
set(plot_smooth, 'XTick', [0 60 120 180 240 300 360], 'FontWeight', 'bold')
set(plot_smooth,'FontSize', 16, 'FontWeight', 'bold')
% plot_legend = legend('C_N_H_4','C_P_O_4','C_N_H_4_P_O_4')
% set(plot_legend, 'Position', [0.3 0.7 0.2031 0.20])
% set x and y labels
plot_xlabel=xlabel('Time (day)')
set(plot_xlabel, 'FontSize', [16])
set(plot_xlabel, 'FontWeight', 'Bold')
plot_ylabel=ylabel('Relative Difference (%)')
set(plot_ylabel, 'FontSize', [16])
set(plot_ylabel, 'FontWeight', 'Bold')

RD_amt = 100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,5))./biomass_sensitivity(:,1); 
RD_nr =100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,6))./biomass_sensitivity(:,1);
RD_nif=100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,7))./biomass_sensitivity(:,1); 

RD_pst = 100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,8))./biomass_sensitivity(:,1); 
RD_pho = 100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,9))./biomass_sensitivity(:,1);
RD_phn = 100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,10))./biomass_sensitivity(:,1); 

% define the whole figure frame
plot_f = figure; 
% set the background as white
set(plot_f, 'Color', 'w')
set(plot_f, 'PaperPosition', [0 0 9 11])
plot_SA_n=subplot(2,1,1)

plot_SA_amt=plot([1:5:360], RD_amt(1:5:360), '-^')
hold on
plot_SA_nr=plot([1:5:360], RD_nr(1:5:360),'-*')
plot_SA_nif=plot([1:5:360], RD_nif(1:5:360),'-o')
% set(plot_SA_CNH4, 'LineWidth', 2)
% set(plot_SA_CPO4, 'LineWidth', 2)
% set(plot_SA_CNH4PO4, 'LineWidth', 2)
grid on
set(plot_SA_amt, 'MarkerSize', 10)
set(plot_SA_nr, 'MarkerSize', 10)
set(plot_SA_nif, 'MarkerSize', 10)
set(plot_SA_n, 'XLim', [0 360])
set(plot_SA_n, 'YLim', [-40 40])
set(plot_SA_n, 'XTick', [0 60 120 180 240 300 360])
set(plot_SA_n,'FontSize', 16, 'FontWeight', 'bold')
plot_legend_n = legend('amt','nr','nif')
set(plot_legend_n, 'Position', [0.2 0.82 0.1 0.05])
plot_ylabel=ylabel('Relative Difference (%)')
set(plot_ylabel, 'FontSize', [16])
set(plot_ylabel, 'FontWeight', 'Bold')


plot_SA_p=subplot(2,1,2)
plot_SA_pst=plot([1:5:360], RD_pst(1:5:360), '-^')
hold on
plot_SA_pho=plot([1:5:360], RD_pho(1:5:360),'-*')
plot_SA_phn=plot([1:5:360], RD_phn(1:5:360),'-o')
grid on
set(plot_SA_pst, 'MarkerSize', 10)
set(plot_SA_pho, 'MarkerSize', 10)
set(plot_SA_phn, 'MarkerSize', 10)
set(plot_SA_p, 'XLim', [0 360])
set(plot_SA_p, 'YLim', [-40 40])
set(plot_SA_p, 'XTick', [0 60 120 180 240 300 360])
set(plot_SA_p,'FontSize', 16, 'FontWeight', 'bold')
plot_legend_p = legend('pst','pho','phn')
set(plot_legend_p, 'Position', [0.2 0.15 0.1 0.05])
plot_xlabel=xlabel('Time (day)')
set(plot_xlabel, 'FontSize', [16])
set(plot_xlabel, 'FontWeight', 'Bold')

plot_ylabel=ylabel('Relative Difference (%)')
set(plot_ylabel, 'FontSize', [16])
set(plot_ylabel, 'FontWeight', 'Bold')

% calculation of biodiversity sensitivity test; 

diversity_record = zeros(360,num_org);
% Calculations of biomass distribution, diversity, and mean cell size; 
% Diversity is defined as the number of phytoplankton types 
% comprising greater than 0.1% of the total biomass
N_in_bugs=cell_density.*cell_quota_N/1e9; % N in each single bug (uM)

for i = 1:360
    total_biomass(i,:) = sum(N_in_bugs(i,:));
    contribution_biomass(i,:) = 100*N_in_bugs(i,:)/total_biomass(i);
    for k=1:num_org
        if contribution_biomass(i,k) > 0.1
            diversity_record(i,k) = 1;
            diversity(i) = sum(diversity_record(i,:)); 
        end
    end
end
diversity = diversity';

load biodiversity_sensitivity
% relative changes to evaluate the parameter's impact on model results
% the reference values are base line values of biomass; 
bio_C_NH4 = 100*(biodiversity_sensitivity(:,1)-biodiversity_sensitivity(:,2))./biodiversity_sensitivity(:,1); 
bio_C_PO4 = 100*(biodiversity_sensitivity(:,1)-biodiversity_sensitivity(:,3))./biodiversity_sensitivity(:,1);
bio_C_NH4_PO4=100*(biodiversity_sensitivity(:,1)-biodiversity_sensitivity(:,4))./biodiversity_sensitivity(:,1); 

% define the whole figure frame
plot_f = figure; 
% set the background as white
set(plot_f, 'Color', 'w')
set(plot_f, 'PaperPosition', [0 0 9 11])
plot_SA=subplot(1,1,1)

plot_SA_CNH4=plot([1:5:360], bio_C_NH4(1:5:360), '-^')
hold on
plot_SA_CPO4=plot([1:5:360], bio_C_PO4(1:5:360),'-*')
plot_SA_CNH4PO4=plot([1:5:360], bio_C_NH4_PO4(1:5:360),'-o')
% set(plot_SA_CNH4, 'LineWidth', 2)
% set(plot_SA_CPO4, 'LineWidth', 2)
% set(plot_SA_CNH4PO4, 'LineWidth', 2)
set(plot_SA_CNH4, 'MarkerSize', 10)
set(plot_SA_CPO4, 'MarkerSize', 10)
set(plot_SA_CNH4PO4, 'MarkerSize', 10)
% set limits for x and y axis
set(plot_SA, 'XLim', [0 360], 'FontWeight', 'bold')
set(plot_SA, 'XTick', [0 60 120 180 240 300 360], 'FontWeight', 'bold')
% set(plot_SA, 'YLim', [-1 5], 'FontWeight', 'bold')
% set(plot_SA, 'YTick', [-1 0 1 2 3 4 5], 'FontWeight', 'bold')
% set(plot_SA,'XTickLabel',[])
% set legend
set(plot_SA,'FontSize', 16, 'FontWeight', 'bold')
plot_legend = legend('C_N_H_4','C_P_O_4','C_N_H_4_P_O_4')
set(plot_legend, 'Position', [0.3 0.7 0.2031 0.20])
% set x and y labels
plot_xlabel=xlabel('Time (day)')
set(plot_xlabel, 'FontSize', [16])
set(plot_xlabel, 'FontWeight', 'Bold')
plot_ylabel=ylabel('Relative Difference (%)')
set(plot_ylabel, 'FontSize', [16])
set(plot_ylabel, 'FontWeight', 'Bold')
% 
grid on

bio_amt = 100*(biodiversity_sensitivity(:,1)-biodiversity_sensitivity(:,5))./biodiversity_sensitivity(:,1); 
bio_nr =100*(biodiversity_sensitivity(:,1)-biodiversity_sensitivity(:,6))./biodiversity_sensitivity(:,1);
bio_nif=100*(biodiversity_sensitivity(:,1)-biodiversity_sensitivity(:,7))./biodiversity_sensitivity(:,1); 

bio_pst = 100*(biodiversity_sensitivity(:,1)-biodiversity_sensitivity(:,8))./biodiversity_sensitivity(:,1); 
bio_pho = 100*(biodiversity_sensitivity(:,1)-biodiversity_sensitivity(:,9))./biodiversity_sensitivity(:,1);
bio_phn = 100*(biodiversity_sensitivity(:,1)-biodiversity_sensitivity(:,10))./biodiversity_sensitivity(:,1); 

% define the whole figure frame
plot_f = figure; 
% set the background as white
set(plot_f, 'Color', 'w')
set(plot_f, 'PaperPosition', [0 0 9 11])
plot_SA_n=subplot(2,1,1)

plot_SA_amt=plot([1:5:360], bio_amt(1:5:360), '-^')
hold on
plot_SA_nr=plot([1:5:360], bio_nr(1:5:360),'-*')
plot_SA_nif=plot([1:5:360], bio_nif(1:5:360),'-o')
% set(plot_SA_CNH4, 'LineWidth', 2)
% set(plot_SA_CPO4, 'LineWidth', 2)
% set(plot_SA_CNH4PO4, 'LineWidth', 2)
grid on
set(plot_SA_amt, 'MarkerSize', 10)
set(plot_SA_nr, 'MarkerSize', 10)
set(plot_SA_nif, 'MarkerSize', 10)
set(plot_SA_n, 'XLim', [0 360])
% set(plot_SA_n, 'YLim', [-40 40])
set(plot_SA_n, 'XTick', [0 60 120 180 240 300 360])
set(plot_SA_n,'FontSize', 16, 'FontWeight', 'bold')
plot_legend_n = legend('amt','nr','nif')
set(plot_legend_n, 'Position', [0.2 0.82 0.1 0.05])
plot_ylabel=ylabel('Relative Difference (%)')
set(plot_ylabel, 'FontSize', [16])
set(plot_ylabel, 'FontWeight', 'Bold')


plot_SA_p=subplot(2,1,2)
plot_SA_pst=plot([1:5:360], bio_pst(1:5:360), '-^')
hold on
plot_SA_pho=plot([1:5:360], bio_pho(1:5:360),'-*')
plot_SA_phn=plot([1:5:360], bio_phn(1:5:360),'-o')
grid on
set(plot_SA_pst, 'MarkerSize', 10)
set(plot_SA_pho, 'MarkerSize', 10)
set(plot_SA_phn, 'MarkerSize', 10)
set(plot_SA_p, 'XLim', [0 360])
% set(plot_SA_p, 'YLim', [-40 40])
set(plot_SA_p, 'XTick', [0 60 120 180 240 300 360])
set(plot_SA_p,'FontSize', 16, 'FontWeight', 'bold')
plot_legend_p = legend('pst','pho','phn')
set(plot_legend_p, 'Position', [0.2 0.15 0.1 0.05])
plot_xlabel=xlabel('Time (day)')
set(plot_xlabel, 'FontSize', [16])
set(plot_xlabel, 'FontWeight', 'Bold')

plot_ylabel=ylabel('Relative Difference (%)')
set(plot_ylabel, 'FontSize', [16])
set(plot_ylabel, 'FontWeight', 'Bold')


% calculation of gene expression; 

clear gene
gene = zeros(num_time, num_org, 6);
ammonia = y(end-359:end,4*num_org+1);
nitrate = y(end-359:end,4*num_org+2);
n2 = y(end-359:end,4*num_org+3);
dip = y(end-359:end,4*num_org+4);
num_org = 96;
[bug] = bugs(num_org, bug_attr);
num_time = 360; 
[gene] = gene_expression(num_time,num_org,bug_attr,bug,ammonia,dip); 
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

N_P_ratio = (amt_amount+nr_amount+nif_amount)./(pst_amount+pho_amount+phn_amount); 
plot(N_P_ratio)


clear NH4_cell_uptake NO3_cell_uptake N2_cell_uptake N_cell_uptake
clear PO4_cell_uptake COP_cell_uptake CP_cell_uptake P_cell_uptake
% calcualte death rates of each bug at each time
p = setUpP;
[bug] = bugs(num_org, bug_attr);
[diffusion]=diffu(num_org,p,bug);
for i = 1:num_time
    Q_N = cell_quota_N(i,:);
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
end
N2_uptake = (sum((N2_cell_uptake.*cell_density)'))'; 
% N2 uptake is in the unit of (umolN/l/day)
plot(N2_uptake)
min(N2_uptake)
N2_uptake((find(N2_uptake == 0))) = 1;


N_in_bugs=cell_density.*cell_quota_N;
for i = 1:360
    total_biomass(i,:) = sum(N_in_bugs(i,:));
    contribution_biomass(i,:) = 100*N_in_bugs(i,:)/total_biomass(i);
    [bio_contribution_order(i,:),order(i,:)] = sort(contribution_biomass(i,:), 'descend');
end