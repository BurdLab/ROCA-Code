clear all
load n_fix_rate
% define the whole figure frame
plot_f = figure; 
% set the background as white
set(plot_f, 'Color', 'w')
% define the first plot
plot_h = subplot(1,1,1)
% plot of nitrogen fixers' biomass
line_fix_c1=semilogy([1:8:360], n_fix_rate(1:8:360,1),'-')
hold on
line_fix_c2=semilogy([1:8:360], n_fix_rate(1:8:360,2), '--')
line_fix_c3=semilogy([1:8:360], n_fix_rate(1:8:360,3), ':')
line_fix_g=semilogy([1:8:360], n_fix_rate(1:8:360,4), 'o-')

set(line_fix_c1, 'LineWidth', 2)
set(line_fix_c2, 'LineWidth', 2)
set(line_fix_c3, 'LineWidth', 4)
set(line_fix_g, 'LineWidth', 2)

set(line_fix_c1, 'MarkerSize', 8)
set(line_fix_c2, 'MarkerSize', 8)
set(line_fix_c3, 'MarkerSize', 8)
set(line_fix_g, 'MarkerSize', 8)

set(plot_h, 'XLim', [0 360])
set(plot_h, 'XTick', [0 60 120 180 240 300 360])
set(plot_h,'FontSize', 16)
plot_xlabel=xlabel('Time (day)')
plot_ylabel=ylabel('N fixatino rate (\mumol N l^{-1}day^{-1})')
set(plot_xlabel, 'FontSize', [16])
set(plot_xlabel, 'FontWeight', 'Bold')
% set(plot_xlabel, 'Position', [179.585 -2.5 1.00011])
set(plot_ylabel, 'FontSize', [16])
set(plot_ylabel, 'FontWeight', 'Bold')
% set(plot_ylabel, 'Position', [-15.3456 14.8684 1.00011])
plot_legend = legend('Scenario I.1','Scenario I.2','Scenario I.3', 'Scenario II')
set(plot_legend, 'FontWeight', 'Bold')
set(plot_legend, 'Box', 'off')
set(plot_legend, 'Position', [0.55 0.15 0.2388 0.2136])
print -dpdf figure1.pdf