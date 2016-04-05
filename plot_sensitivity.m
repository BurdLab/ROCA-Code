% running for sensitivity test;
clear all

load biomass_sensitivity

% relative changes to evaluate the parameter's impact on model results
% the reference values are base line values of biomass; 
RD_C_NH4 = 100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,2))./biomass_sensitivity(:,1); 
RD_C_PO4 = 100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,3))./biomass_sensitivity(:,1);

% define the whole figure frame
plot_f = figure; 
% set the background as white
set(plot_f, 'Color', 'w')
set(plot_f, 'PaperPosition', [0 0 9 11])
plot_SA=subplot(3,1,1)

plot_SA_CNH4=plot([1:5:360], RD_C_NH4(1:5:360), '-^')
hold on
plot_SA_CPO4=plot([1:5:360], RD_C_PO4(1:5:360),'-*')

set(plot_SA_CNH4, 'MarkerSize', 10)
set(plot_SA_CPO4, 'MarkerSize', 10)
% set limits for x and y axis
set(plot_SA, 'XLim', [0 360], 'FontWeight', 'bold')
set(plot_SA, 'XTick', [0 60 120 180 240 300 360], 'FontWeight', 'bold')
% set(plot_SA,'FontSize', 16, 'FontWeight', 'bold')
plot_legend = legend('ExpI.1','ExpI.2')
set(plot_legend, 'Position', [0.15 0.85 0.1 0.07])
% set x and y labels
% plot_xlabel=xlabel('Time (day)')
% set(plot_xlabel, 'FontSize', [16])
% set(plot_xlabel, 'FontWeight', 'Bold')
% plot_ylabel=ylabel('Relative Difference (%)')
% set(plot_ylabel, 'FontSize', [16])
% set(plot_ylabel, 'FontWeight', 'Bold')
grid on

RD_amt = -100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,5))./biomass_sensitivity(:,1); 
RD_nr =-100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,6))./biomass_sensitivity(:,1);
RD_nif=-100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,7))./biomass_sensitivity(:,1); 

RD_pst = -100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,8))./biomass_sensitivity(:,1); 
RD_pho = -100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,9))./biomass_sensitivity(:,1);
RD_phn = -100*(biomass_sensitivity(:,1)-biomass_sensitivity(:,10))./biomass_sensitivity(:,1); 

plot_SA_n=subplot(3,1,2)

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
set(plot_SA_n, 'XLim', [0 360], 'FontWeight', 'bold')
set(plot_SA_n, 'YLim', [-40 40], 'FontWeight', 'bold')
set(plot_SA_n, 'XTick', [0 60 120 180 240 300 360], 'FontWeight', 'bold')
% set(plot_SA_n,'FontSize', 16, 'FontWeight', 'bold')
plot_legend_n = legend('Exp II.1','Exp II.2','Exp II.3')
set(plot_legend_n, 'Position', [0.78 0.6 0.1 0.05])
plot_ylabel=ylabel('Relative Percentage Difference (%): Biomass')
set(plot_ylabel, 'FontSize', [16])
set(plot_ylabel, 'FontWeight', 'Bold')


plot_SA_p=subplot(3,1,3)
plot_SA_pst=plot([1:5:360], RD_pst(1:5:360), '-^')
hold on
plot_SA_pho=plot([1:5:360], RD_pho(1:5:360),'-*')
plot_SA_phn=plot([1:5:360], RD_phn(1:5:360),'-o')
grid on
set(plot_SA_pst, 'MarkerSize', 10)
set(plot_SA_pho, 'MarkerSize', 10)
set(plot_SA_phn, 'MarkerSize', 10)
set(plot_SA_p, 'XLim', [0 360], 'FontWeight', 'bold')
set(plot_SA_p, 'YLim', [-40 40], 'FontWeight', 'bold')
set(plot_SA_p, 'XTick', [0 60 120 180 240 300 360], 'FontWeight', 'bold')
% set(plot_SA_p,'FontSize', 16, 'FontWeight', 'bold')
plot_legend_p = legend('Exp II.4','Exp II.5','Exp II.6')
set(plot_legend_p, 'Position', [0.16 0.28 0.1 0.05])
plot_xlabel=xlabel('Time (day)')
set(plot_xlabel, 'FontSize', [16])
set(plot_xlabel, 'FontWeight', 'Bold')