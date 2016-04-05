clear all
load biomass_coast1
% define the whole figure frame
plot_f = figure; 
% set the background as white
set(plot_f, 'Color', 'w')
% set(plot_f, 'PaperPosition', [0.15 0.15 8 10])
% define the first plot
plot_h = subplot(1,1,1)
line_sub1_con_c1=plot([1:8:360], biomass_coast1(1:8:360,5))
hold on
line_sub1_con_c2=plot([1:8:360], biomass_coast2(1:8:360,5), '<-')
line_sub1_con_c3=plot([1:8:360], biomass_coast3(1:8:360,5), 'o-')
% line_sub1_con_c3_ex=plot([1:8:360], biomass_coast3_ex(1:8:360,5), '-.')
line_sub1_con_g=plot([1:8:360], biomass_gyre(1:8:360,5), 's-')
set(line_sub1_con_c1, 'LineWidth', 2)
set(line_sub1_con_c2, 'LineWidth', 2)
set(line_sub1_con_c3, 'LineWidth', 2)
% set(line_sub1_con_c3_ex, 'LineWidth', 2)
set(line_sub1_con_g, 'LineWidth', 2)
set(line_sub1_con_c1, 'MarkerSize', 8)
set(line_sub1_con_c2, 'MarkerSize', 8)
set(line_sub1_con_c3, 'MarkerSize', 8)
% set(line_sub1_con_c3_ex, 'MarkerSize', 8)
set(line_sub1_con_g, 'MarkerSize', 8)
set(plot_h, 'XLim', [0 360])
set(plot_h, 'XTick', [0 60 120 180 240 300 360])
set(plot_h,'FontSize', 16)
plot_xlabel=xlabel('Time (day)')
plot_ylabel=ylabel('Biodiversity')
set(plot_xlabel, 'FontSize', [16])
set(plot_xlabel, 'FontWeight', 'Bold')
set(plot_xlabel, 'Position', [179.585 -2.5 1.00011])
set(plot_ylabel, 'FontSize', [16])
set(plot_ylabel, 'FontWeight', 'Bold')
set(plot_ylabel, 'Position', [-23.5 14.8684 1.00011])
plot_legend = legend('Scenario I.1','Scenario I.2','Scenario I.3', 'Scenario II')
set(plot_legend, 'FontWeight', 'Bold')
set(plot_legend, 'Box', 'off')
set(plot_legend, 'Position', [0.63 0.71 0.2388 0.2136])

print -dpdf figure1.pdf


