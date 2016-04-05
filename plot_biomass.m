% codes for ploting biomass (figure 1 in paper); 
% biomass_coast1, biomass_coast2, biomass_coast3, biomass_coast3_ex,
% biomass_gyre;
clear all
load biomass_coast1

% define the whole figure frame
plot_f = figure; 
% set the background as white
set(plot_f, 'Color', 'w')
set(plot_f, 'PaperPosition', [0 0 9 11])
% define the first plot
plot_sub1=subplot(5,1,1)

line_sub1_total=plot(biomass_coast1(:,1))
set(line_sub1_total, 'LineWidth', 2)
hold on
line_sub1_small=plot([1:8:360], biomass_coast1(1:8:360,2),'-o')
set(line_sub1_small, 'MarkerSize', 10)
line_sub1_big=plot(biomass_coast1(:,3))
set(line_sub1_big, 'LineStyle', '--')
set(line_sub1_big, 'LineWidth', 2)
% remove xlabel
set(plot_sub1, 'XLim', [0 360])
set(plot_sub1, 'XTick', [0 60 120 180 240 300 360])
set(plot_sub1,'XTickLabel',[])
% enlarge subplot_1
set(plot_sub1, 'Position', [0.13 0.8 0.775 0.15])
set(plot_sub1,'FontSize', 16)
% plot_legend = legend('Total','Small','Large')
% set(plot_legend, 'Position', [0.57 0.85 0.2 0.1])
% set(plot_legend, 'Box', 'off')
plot_text1 = text(5, 50, 'Scenario I.1') 
set(plot_text1, 'FontSize', 16)
set(plot_text1, 'FontWeight', 'bold')

plot_sub2=subplot(5,1,2)

line_sub2_total=plot(biomass_coast2(:,1))
set(line_sub2_total, 'LineWidth', 2)
hold on
line_sub2_small=plot([1:8:360], biomass_coast2(1:8:360,2),'-o')
set(line_sub2_small, 'MarkerSize', 10)
line_sub2_big=plot(biomass_coast2(:,3))
set(line_sub2_big, 'LineStyle', '--')
set(line_sub2_big, 'LineWidth', 2)
set(plot_sub2, 'XLim', [0 360])
set(plot_sub2, 'XTick', [0 60 120 180 240 300 360])
set(plot_sub2,'XTickLabel',[])
set(plot_sub2, 'Position', [0.13 0.628008 0.775 0.15])
set(plot_sub2,'FontSize', 16)
plot_text2 = text(5, 133, 'Scenario I.2') 
set(plot_text2, 'FontSize', 16)
set(plot_text2, 'FontWeight', 'bold')

plot_sub3=subplot(5,1,3)

line_sub3_total=plot(biomass_coast3(:,1))
set(line_sub3_total, 'LineWidth', 2)
hold on
line_sub3_small=plot([1:8:360], biomass_coast3(1:8:360,2),'-o')
set(line_sub3_small, 'MarkerSize', 10)
line_sub3_big=plot(biomass_coast3(:,3))
set(line_sub3_big, 'LineStyle', '--')
set(line_sub3_big, 'LineWidth', 2)
set(plot_sub3, 'XLim', [0 360])
set(plot_sub3, 'XTick', [0 60 120 180 240 300 360])
set(plot_sub3,'XTickLabel',[])
set(plot_sub3, 'Position', [0.13 0.455339 0.775 0.15])
set(plot_sub3,'FontSize', 16)
plot_text3 = text(5, 200, 'Scenario I.3') 
set(plot_text3, 'FontSize', 16)
set(plot_text3, 'FontWeight', 'bold')
plot_ylabel=ylabel('Biomass (\mumol N l^{-1})')
set(plot_ylabel, 'FontSize', 20)
set(plot_ylabel, 'FontWeight', 'Bold')
set(plot_ylabel, 'Position', [-39 484.127 1.00011])

plot_sub4=subplot(5,1,4)

line_sub4_total=plot(biomass_coast3_ex(:,1))
set(line_sub4_total, 'LineWidth', 2)
hold on
line_sub4_small=plot([1:8:360], biomass_coast3_ex(1:8:360,2), '-o')
set(line_sub4_small, 'MarkerSize', 10)
line_sub4_big=plot(biomass_coast3_ex(:,3))
set(line_sub4_big, 'LineStyle', '--')
set(line_sub4_big, 'LineWidth', 2)
set(plot_sub4, 'XLim', [0 360])
set(plot_sub4, 'XTick', [0 60 120 180 240 300 360])
set(plot_sub4,'XTickLabel',[])
set(plot_sub4, 'Position', [0.13 0.282669 0.775 0.15])
set(plot_sub4,'FontSize', 16)
plot_text4 = text(5, 133, 'Scenario I.3 without N fixation') 
set(plot_text4, 'FontSize', 16)
set(plot_text4, 'FontWeight', 'bold')

plot_sub5=subplot(5,1,5)

line_sub5_total=plot(biomass_gyre(:,1))
set(line_sub5_total, 'LineWidth', 2)
hold on
line_sub5_small=plot([1:8:360], biomass_gyre(1:8:360,2),'-o')
set(line_sub5_small, 'MarkerSize', 8)
line_sub5_big=plot(biomass_gyre(:,3))
set(line_sub5_big, 'LineStyle', '--')
set(line_sub5_big, 'LineWidth', 2)
set(plot_sub5, 'Position', [0.13 0.11 0.775 0.15])
set(plot_sub5,'FontSize', 16)
plot_text5 = text(5, 2, 'Scenario II') 
set(plot_text5, 'FontSize', 16)
set(plot_text5, 'FontWeight', 'bold')
plot_xlabel=xlabel('Time (day)')
set(plot_xlabel, 'FontSize', [16])
set(plot_xlabel, 'FontWeight', 'Bold')
% set(plot_xlabel, 'Position', [179.585 -4.01 1.00011])
set(plot_sub5, 'XLim', [0 360])
set(plot_sub5, 'XTick', [0 60 120 180 240 300 360])

% generate a pdf file for review without printing;
print -dpdf figure1.pdf