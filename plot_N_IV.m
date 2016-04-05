clear all
load n_scenario_IV
% define the whole figure frame
plot_f = figure; 
% set the background as white
set(plot_f, 'Color', 'w')
% define the first plot
plot_h = subplot(1,1,1)
% plot of nitrogen fixers' biomass
line_fixers=plot([1:8:360], n_scenario_IV(1:8:360,2),'o-')
hold on
line_others=plot([1:8:360], n_scenario_IV(1:8:360,3), '--')
line_din=plot([1:8:360], n_scenario_IV(1:8:360,4))

set(line_fixers, 'LineWidth', 2)
set(line_others, 'LineWidth', 2)
set(line_din, 'LineWidth', 2)

set(line_fixers, 'MarkerSize', 8)
set(line_others, 'MarkerSize', 8)
set(line_din, 'MarkerSize', 8)

set(plot_h, 'XLim', [0 360])
set(plot_h, 'XTick', [0 60 120 180 240 300 360])
set(plot_h,'FontSize', 16)
plot_xlabel=xlabel('Time (day)')
plot_ylabel=ylabel('Concentration (uM)')
set(plot_xlabel, 'FontSize', [16])
set(plot_xlabel, 'FontWeight', 'Bold')
% set(plot_xlabel, 'Position', [179.585 -2.5 1.00011])
set(plot_ylabel, 'FontSize', [16])
set(plot_ylabel, 'FontWeight', 'Bold')
% set(plot_ylabel, 'Position', [-15.3456 14.8684 1.00011])
plot_legend = legend('Biomass: N fixers','Biomass: Others','DIN Concentration')
set(plot_legend, 'FontWeight', 'Bold')
set(plot_legend, 'Box', 'off')
print -dpdf figure1.pdf

