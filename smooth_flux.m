clear all 

diffusion = 1.0116e-9; 
ammonia = [0:0.1:3.5]; % NH4 concentration, uM; 

NH4_assi_1 = zeros(1, length(ammonia)); 
NH4_assi_2 = NH4_assi_1; 

for i = 1:length(ammonia)
    NH4 = ammonia(i); 
    if NH4 > 1
        NH4_assi_1(i) = 1000*diffusion(1,1).*(NH4 - 1);
        NH4_assi_3(i) = 1000*diffusion(1,1).*(NH4 - 1);
    else
        NH4_assi_1(i) = 0; 
        NH4_assi_3(i) = 1000*diffusion(1,1).*NH4;
    end
    if NH4 > 2
        NH4_assi_2(i) = 1000*diffusion(1,1).*(NH4 - 1);
    else
        NH4_assi_2(i) = 1000*diffusion(1,1).*(NH4)/2; 
    end
end

NH4_assi_1 = 1e9*NH4_assi_1; 
NH4_assi_2 = 1e9*NH4_assi_2;
NH4_assi_3 = 1e9*NH4_assi_3;
% NH4 flux rate (fmol/cell/day); 

% define the whole figure frame
plot_f = figure; 
% set the background as white
set(plot_f, 'Color', 'w')
set(plot_f, 'PaperPosition', [0 0 9 11])

plot_smooth=subplot(2,1,1)

plot_smooth_1=plot(ammonia, NH4_assi_1, '.-.k')
hold on
plot_smooth_3=plot(ammonia, NH4_assi_3,'^-.k')

set(plot_smooth_1, 'MarkerSize', 17)
set(plot_smooth_3, 'MarkerSize', 10)

set(plot_smooth, 'FontSize', 12, 'FontWeight', 'bold')

% plot_xlabel=xlabel('NH4 Concentration (\muM)')
plot_ylabel=ylabel('NH4 flux (fmol N {day}^{-1})')

% set(plot_xlabel, 'FontSize', [16])
% set(plot_xlabel, 'FontWeight', 'Bold')
set(plot_smooth, 'XTickLabel',[])
set(plot_ylabel, 'FontSize', [16])
set(plot_ylabel, 'FontWeight', 'Bold')
plot_legend = legend('phytoplankton without amt','phytoplankton with amt')
plot_text = text(0.25, 2500,'a: quickly switching', 'FontSize',18)


plot_smooth=subplot(2,1,2)

plot_smooth_1=plot(ammonia, NH4_assi_1, '.-.k')
hold on
plot_smooth_2=plot(ammonia, NH4_assi_2,'^-.k')

set(plot_smooth_1, 'MarkerSize', 17)
set(plot_smooth_2, 'MarkerSize', 10)

set(plot_smooth, 'FontSize', 12, 'FontWeight', 'bold')

plot_xlabel=xlabel('NH4 Concentration (\muM)')
plot_ylabel=ylabel('NH4 flux (fmol N {day}^{-1})')

set(plot_xlabel, 'FontSize', [16])
set(plot_xlabel, 'FontWeight', 'Bold')
set(plot_ylabel, 'FontSize', [16])
set(plot_ylabel, 'FontWeight', 'Bold')
text(0.25, 2500,'b: gradually shifting','FontSize',18)