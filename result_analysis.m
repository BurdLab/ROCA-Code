% plot of nutrient inputs, temperature, and dilution change over time; 
ammonia_flowin = zeros(1,num_time);
nitrate_flowin = zeros(1,num_time);
po4_flowin = zeros(1,num_time);
cop_flowin = zeros(1,num_time); 
cp_flowin = zeros(1,num_time);
dilution_rate = zeros(1,num_time);
for time = 1:num_time
    [q] = time_nutrient(time); 
    ammonia_flowin(time) = q(1).N_fl/1e9; 
    nitrate_flowin(time) = q(2).N_fl/1e9; 
    po4_flowin(time) = q(1).P_fl/1e9; 
    cop_flowin(time) = q(2).P_fl/1e9; 
    cp_flowin(time) = q(3).P_fl/1e9;
    [dilution] = time_dilution(time); 
    dilution_rate(time)=dilution;
end
subplot(2,1,1)
plot(ammonia_flowin,'LineWidth',2);
hold on
plot(nitrate_flowin,'r','LineWidth',2)
xlabel('time (day)')
ylabel('nitrogen concentration (umol/l)')
legend('ammonia','nitrate');
subplot(2,1,2)
plot(po4_flowin,'LineWidth',2);
hold on
plot(cop_flowin,'r','LineWidth',2)
plot(cp_flowin,'g','LineWidth',2)
xlabel('time (day)')
ylabel('phosphorus concentration (umol/l)')
legend('phosphate','cop', 'cp');
% plot of dilution change; 
plot(dilution_rate,'LineWidth',2)
xlabel('time (day)')
ylabel('dilution_rate (/day)')
legend('dilution raet');
% plot of nutrient concentration in csrt; 
subplot(2,1,1)
plot(ammonia/1e9,'LineWidth',2);
hold on
plot(nitrate/1e9,'r','LineWidth',2)
xlabel('time (day)')
ylabel('nitrogen concentration in csrt (umol/l)')
legend('ammonia','nitrate');
subplot(2,1,2)
plot(dip/1e9,'LineWidth',2);
hold on
plot(cop/1e9,'r','LineWidth',2)
plot(cp/1e9, 'g','LineWidth',2)
xlabel('time (day)')
ylabel('phosphorus concentration in csrt (umol/l)')
legend('phosphate','cop', 'cp');

% plot of cell density
subplot(2,1,1)
plot(cell_density)
xlabel('time (day)')
ylabel('cell density (cells/l)')
title('cell density over 5 years')
subplot(2,1,2)
plot([1441:1800], cell_density(1441:1800,:))
xlabel('time (day)')
ylabel('cell density (cells/l)')
title('cell density in the last year')
% a function to find out the most abundant cells in spring and summer; 
spring = 1460; 
summer = 1660; 
[cell_abundance_spring, rank_spring] = sort(cell_density(spring,:), 'descend');
[cell_abundance_summer, rank_summer] = sort(cell_density(summer,:), 'descend');
% a function to calculate ratio of N:P in cell quota for most abundant
% cells; 
cell_quota_N(spring,rank_spring(1:3))./cell_quota_P(spring,rank_spring(1:3))
cell_quota_N(summer,rank_summer(1:3))./cell_quota_P(summer,rank_summer(1:3))
% plot of growth rate, death rate, and net growth rate for both all bugs 
% and the 3 most abundant bugs; 
% growth rate
subplot(3,1,1)
plot(gr_rate); 
xlabel('time (day)')
ylabel('growth rate (/day)')
title('growth rate for all bugs')
subplot(3,1,2)
plot(gr_rate(:,rank_spring(1:3)))
xlabel('time (day)')
ylabel('growth rate (/day)')
title('growth rate for 3 most abundant bugs in spring')
subplot(3,1,3)
plot(gr_rate(:,rank_summer(1:3)))
xlabel('time (day)')
ylabel('growth rate (/day)')
title('growth rate for 3 most abundant bugs in summer')
% death rate
subplot(3,1,1)
plot(dth_rate); 
xlabel('time (day)')
ylabel('death rate (/day)')
title('death rate for all bugs')
subplot(3,1,2)
plot(dth_rate(:,rank_spring(1:3)))
xlabel('time (day)')
ylabel('death rate (/day)')
title('death rate for 3 most abundant bugs in spring')
subplot(3,1,3)
plot(dth_rate(:,rank_summer(1:3)))
xlabel('time (day)')
ylabel('death rate (/day)')
title('death rate for 3 most abundant bugs in summer')
% net growth rate
subplot(3,1,1)
plot(net_gr);
xlabel('time (day)')
ylabel('net growth rate (/day)')
title('net growth rate for all bugs')
subplot(3,1,2)
plot(net_gr(:,rank_spring(1:3)))
hold on
x = [1:1:1800];
y = 0; 
plot(x, y)
xlabel('time (day)')
ylabel('net growth rate (/day)')
title('net growth rate for 3 most abundant bugs in spring')
subplot(3,1,3)
plot(net_gr(:,rank_summer(1:3)))
hold on
plot(x, y)
xlabel('time (day)')
ylabel('net growth rate (/day)')
title('net growth rate for 3 most abundant bugs in summer')

%plot of gene expression
subplot(2,1,1)
% plot(amt_amount)
[AX,H1,H2] = plotyy(x,amt_amount,x,ammonia,'plot');
hold on
plot(nr_amount, 'r','LineStyle', '.')
plot(nif_amount, 'g')
set(get(AX(1),'Ylabel'),'String','nitrogen gene expression') 
set(get(AX(2),'Ylabel'),'String','ammonia concentration') 
% set(H1,'Color','g')
set(H2,'Color','k','LineStyle','--')
% plotyy(nif_amount,'g', ammonia, 'k')
xlabel('time (day)')
ylabel('nitrogen gene expression')
legend('amt','nr', 'nif', 'ammonia');

subplot(2,1,2)
% plot(amt_amount)
[AX,H1,H2] = plotyy(x,pst_amount,x,dip,'plot');
hold on
plot(pho_amount, 'r','LineStyle', '.')
plot(phn_amount, 'g')
set(get(AX(1),'Ylabel'),'String','phosphorus gene expression') 
set(get(AX(2),'Ylabel'),'String','phosphate concentration') 
% set(H1,'Color','g')
set(H2,'Color','k','LineStyle','--')
% plotyy(nif_amount,'g', ammonia, 'k')
xlabel('time (day)')
ylabel('phosphorus gene expression')
legend('pst','pho','phn','phosphate');
xlabel('time (day)')
ylabel('phosphorus gene expression')
legend('pst','pho', 'phn','po4')

% plot of most abundant bugs gene expression;
bug_spring = 80; % choose the most abundant bug during spring time;
bug_summer = 10; % choose the most abundant bug during summer time;
% the contribution of expressed genes (Nitrogen) by the most abundant bug 
% during spring and summer in the fifth year; 
subplot(3,1,1)
plot(amt_amount(:,1441:1800))
hold on
plot(cell_density(1441:1800,bug_spring).*gene(1441:1800,bug_spring,1)*bug_attr(bug_spring,15), 'r')
plot(cell_density(1441:1800,bug_summer).*gene(1441:1800,bug_summer,1)*bug_attr(bug_summer,15), 'g')
xlabel('time (day)')
ylabel('amt gene expressed')
title('amt gene expression for most abundant bugs in the fifth year')
legend('total amt','spring bug','summer bug');
subplot(3,1,2)
plot(nr_amount(:,1441:1800))
hold on
plot(cell_density(1441:1800,bug_spring).*gene(1441:1800,bug_spring,2)*bug_attr(bug_spring,16), 'r')
plot(cell_density(1441:1800,bug_summer).*gene(1441:1800,bug_summer,2)*bug_attr(bug_summer,16), 'g')
xlabel('time (day)')
ylabel('nr gene expressed')
title('nr gene expression for most abundant bugs in the fifth year')
legend('total nr','spring bug','summer bug');
subplot(3,1,3)
plot(nif_amount(:,1441:1800))
hold on
plot(cell_density(1441:1800,bug_spring).*gene(1441:1800,bug_spring,3)*bug_attr(bug_spring,17), 'r')
plot(cell_density(1441:1800,bug_summer).*gene(1441:1800,bug_summer,3)*bug_attr(bug_summer,17), 'g')
xlabel('time (day)')
ylabel('nif gene expressed')
title('nif gene expression for most abundant bugs in the fifth year')
legend('total nif','spring bug','summer bug');
% the contribution of expressed genes (Phosphorus) by the most abundant bug 
% during spring and summer in the fifth year;
subplot(3,1,1)
plot(pst_amount(:,1441:1800))
hold on
plot(cell_density(1441:1800,bug_spring).*gene(1441:1800,bug_spring,4)*bug_attr(bug_spring,18), 'r')
plot(cell_density(1441:1800,bug_summer).*gene(1441:1800,bug_summer,4)*bug_attr(bug_summer,18), 'g')
xlabel('time (day)')
ylabel('pst gene expressed')
title('pst gene expression for most abundant bugs in the fifth year')
legend('total pst','spring bug','summer bug');
subplot(3,1,2)
plot(pho_amount(:,1441:1800))
hold on
plot(cell_density(1441:1800,bug_spring).*gene(1441:1800,bug_spring,5)*bug_attr(bug_spring,19), 'r')
plot(cell_density(1441:1800,bug_summer).*gene(1441:1800,bug_summer,5)*bug_attr(bug_summer,19), 'g')
xlabel('time (day)')
ylabel('pho gene expressed')
title('pho gene expression for most abundant bugs in the fifth year')
legend('total pho','spring bug','summer bug');
subplot(3,1,3)
plot(phn_amount(:,1441:1800))
hold on
plot(cell_density(1441:1800,bug_spring).*gene(1441:1800,bug_spring,6)*bug_attr(bug_spring,20), 'r')
plot(cell_density(1441:1800,bug_summer).*gene(1441:1800,bug_summer,6)*bug_attr(bug_summer,20), 'g')
xlabel('time (day)')
ylabel('phn gene expressed')
title('phn gene expression for most abundant bugs in the fifth year')
legend('total phn','spring bug','summer bug');

% plot of most abundant bugs nutrient assimilation;
subplot(2,1,1)
plot(N_cell_uptake(1441:1800,bug_spring))
hold on
plot(NH4_cell_uptake(1441:1800,bug_spring), 'r')
plot(NO3_cell_uptake(1441:1800,bug_spring), 'g')
plot(N2_cell_uptake(1441:1800,bug_spring), 'k')
plot(cell_quota_N(1441:1800,bug_spring), 'y', 'LineWidth', 2)
plot([1:.1:360],bug_attr(bug_spring,9), 'y')
plot([1:.1:360],bug_attr(bug_spring,8), 'y')
xlabel('time (day)')
ylabel('nitrogen assimilation (fmolN/cell/day)')
title('nitrogen assimilation for most abundant spring bug in the fifth year')
legend('total N assi','NH4 assi','NO3 assi','N2 assi','N cell quota');
subplot(2,1,2)
plot(P_cell_uptake(1441:1800,bug_spring))
hold on
plot(PO4_cell_uptake(1441:1800,bug_spring), 'r')
plot(COP_cell_uptake(1441:1800,bug_spring), 'g')
plot(CP_cell_uptake(1441:1800,bug_spring), 'k')
plot(cell_quota_P(1441:1800,bug_spring), 'y', 'LineWidth', 2)
plot([1:.1:360],bug_attr(bug_spring,11), 'y')
plot([1:.1:360],bug_attr(bug_spring,10), 'y')
xlabel('time (day)')
ylabel('phosphorus assimilation (fmolP/cell/day)')
title('phosphorus assimilation for most abundant spring bug in the fifth year')
legend('total P assi','PO4 assi','cop assi','cp assi','P cell quota');

subplot(2,1,1)
plot(N_cell_uptake(1441:1800,bug_summer))
hold on
plot(NH4_cell_uptake(1441:1800,bug_summer), 'r')
plot(NO3_cell_uptake(1441:1800,bug_summer), 'g')
plot(N2_cell_uptake(1441:1800,bug_summer), 'k')
plot(cell_quota_N(1441:1800,bug_summer), 'y', 'LineWidth', 2)
plot([1:.1:360],bug_attr(bug_summer,9), 'y')
plot([1:.1:360],bug_attr(bug_summer,8), 'y')
xlabel('time (day)')
ylabel('nitrogen assimilation (fmolN/cell/day)')
title('nitrogen assimilation for most abundant summer bug in the fifth year')
legend('total N assi','NH4 assi','NO3 assi','N2 assi','N cell quota');
% subplot(2,1,1)
% plot(net_gr(1441:1800,bug_summer))
subplot(2,1,2)
plot(P_cell_uptake(1441:1800,bug_summer))
hold on
plot(PO4_cell_uptake(1441:1800,bug_summer), 'r')
plot(COP_cell_uptake(1441:1800,bug_summer), 'g')
plot(CP_cell_uptake(1441:1800,bug_summer), 'k')
plot(cell_quota_P(1441:1800,bug_summer), 'y', 'LineWidth', 2)
plot([1:.1:360],bug_attr(bug_summer,11), 'y')
plot([1:.1:360],bug_attr(bug_summer,10), 'y')
xlabel('time (day)')
ylabel('phosphorus assimilation (fmolP/cell/day)')
title('phosphorus assimilation for most abundant summer bug in the fifth year')
legend('total P assi','PO4 assi','cop assi','cp assi','P cell quota');

% Scenario plots
clear all
t = [1:10:361];
[q] = time_nutrient(t);
[dilution] = time_dilution(t);
subplot(2,2,4)
[AX,H1,H2] = plotyy(t,q(1).N_fl/1e9,t,dilution,'plot');
hold on
% plot(t,q(1).N_fl/1e9, '.')
plot(t,q(2).N_fl/1e9, '^')
plot(t,q(1).P_fl/1e9, 'd')
plot(t,q(2).P_fl/1e9, 'o')
plot(t,q(3).P_fl/1e9, '*')
set(get(AX(1),'Ylabel'),'String','Nutrient (uM)') 
set(get(AX(2),'Ylabel'),'String','Dilution rate (/day)') 
% legend('NH4','NO3','PO4','COP','CP','Dilution')
xlabel('time (day)')
title('Scenario IV')
