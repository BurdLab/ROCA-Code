clear all
load gene_ratio
% define the whole figure frame
plot_f = figure; 
% set the background as white
set(plot_f, 'Color', 'w')
% define the first plot
plot_h = subplot(1,1,1)
% plot of nitrogen fixers' biomass
line_gene_c1=semilogy([1:8:360], gene_ratio(1:8:360,1), '-')
hold on
line_gene_c2=semilogy([1:8:360], gene_ratio(1:8:360,2), '.')
line_gene_c3=semilogy([1:8:360], gene_ratio(1:8:360,3), '-.')
line_gene_c4=semilogy([1:8:360], gene_ratio(1:8:360,4))

set(line_gene_c1, 'LineWidth', 1.5)
set(line_gene_c2, 'LineWidth', 1.5)
set(line_gene_c3, 'LineWidth', 1.5)
set(line_gene_c4, 'LineWidth', 1.5)

set(plot_h, 'XLim', [0 360])
set(plot_h, 'XTick', [0 60 120 180 240 300 360])
set(plot_h,'FontSize', 16)

plot_xlabel=xlabel('Time (day)')
plot_ylabel=ylabel('Ratio of Activated Gene Clusters: N/P')
set(plot_xlabel, 'FontSize', [16])
set(plot_xlabel, 'FontWeight', 'Bold')

set(plot_ylabel, 'FontSize', [16])
set(plot_ylabel, 'FontWeight', 'Bold')
plot_legend = legend('Scenario I.1','Scenario I.2','Scenario I.3', 'Scenario II')
set(plot_legend, 'FontWeight', 'Bold')
set(plot_legend, 'Box', 'off')
set(plot_legend, 'Position', [0.15 0.55 0.2388 0.2136])

print -dpdf figure1.pdf