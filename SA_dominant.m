clear all
% define the whole figure frame
plot_f = figure; 
% set the background as white
set(plot_f, 'Color', 'w')
set(plot_f, 'PaperPosition', [0 0 9 11])

plot_base=subplot(9,1,1)

load base
h_base = pcolor(base')
colormap(gray(2))
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', [])
set(h_base, 'LineStyle', '.')
set(h_base, 'MarkerSize', 2)
text(170, 8, 'Base', 'FontSize',12)

text(-12,1.5,'amt','FontSize',10)
text(-12,2.5,'nr','FontSize',10)
text(-12,3.5,'nif','FontSize',10)
text(-12,4.5,'pst','FontSize',10)
text(-12,5.5,'pho','FontSize',10)
text(-12,6.5,'phn','FontSize',10)

plot_exI1=subplot(9,1,2)

load exI1
h_exI1 = pcolor(exI1')
colormap(gray(2))
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', [])
set(h_exI1, 'LineStyle', '.')
set(h_exI1, 'MarkerSize', 2)
text(170, 8, 'Exp I.1', 'FontSize',12)

plot_exI2=subplot(9,1,3)

load exI2
h_exI2 = pcolor(exI2')
colormap(gray(2))
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', [])
set(h_exI2, 'LineStyle', '.')
set(h_exI2, 'MarkerSize', 2)
text(170, 8, 'Exp I.2', 'FontSize',12)

plot_exII1=subplot(9,1,4)

load exII1
h_exII1 = pcolor(exII1')
colormap(gray(2))
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', [])
set(h_exII1, 'LineStyle', '.')
set(h_exII1, 'MarkerSize', 2)
text(170, 8, 'Exp II.1', 'FontSize',12)

plot_exII2=subplot(9,1,5)

load exII2
h_exII2 = pcolor(exII2')
colormap(gray(2))
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', [])
set(h_exII2, 'LineStyle', '.')
set(h_exII2, 'MarkerSize', 2)

plot_ylabel=ylabel('Dominant Species')
set(plot_ylabel, 'FontSize', [14])
set(plot_ylabel, 'FontWeight', 'Bold')
text(170, 8, 'Exp II.2', 'FontSize',12)

plot_exII3=subplot(9,1,6)

load exII3
h_exII3 = pcolor(exII3')
colormap(gray(2))
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', [])
set(h_exII3, 'LineStyle', '.')
set(h_exII3, 'MarkerSize', 2)
text(170, 8, 'Exp II.3', 'FontSize',12)

plot_exII4=subplot(9,1,7)

load exII4
h_exII4 = pcolor(exII4')
colormap(gray(2))
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', [])
set(h_exII4, 'LineStyle', '.')
set(h_exII4, 'MarkerSize', 2)
text(170, 8, 'Exp II.4', 'FontSize',12)

plot_exII5=subplot(9,1,8)

load exII5
h_exII5 = pcolor(exII5')
colormap(gray(2))
set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', [])
set(h_exII5, 'LineStyle', '.')
set(h_exII5, 'MarkerSize', 2)
text(170, 8, 'Exp II.5', 'FontSize',12)

plot_exII6=subplot(9,1,9)

load exII6
h_exII6 = pcolor(exII6')
colormap(gray(2))
set(plot_exII6, 'XLim', [0 360], 'FontWeight', 'bold')
set(plot_exII6, 'XTick', [0 60 120 180 240 300 360], 'FontWeight', 'bold')
% set(gca, 'XTickLabel', [])
set(gca, 'YTickLabel', [])
set(h_exII6, 'LineStyle', '.')
set(h_exII6, 'MarkerSize', 2)
text(170, -2, 'Time (day)', 'FontSize',16)
text(170, 8, 'Exp II.6', 'FontSize',12)