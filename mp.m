close all;
clear;
clc;

% publication quality plots, supports a total of 4 lines.

% inputs
load 'amp_abe_t_vs_psnr_0';
load 'gpsr_t_vs_psnr_0';
load 'twist_t_vs_psnr_0';
x{:,1} = amp_abe_t_vs_psnr_0(:,1);
y{:,1} = amp_abe_t_vs_psnr_0(:,2);
x{:,2} = gpsr_t_vs_psnr_0(:,1);
y{:,2} = gpsr_t_vs_psnr_0(:,2);
x{:,3} = twist_t_vs_psnr_0(:,1);
y{:,3} = twist_t_vs_psnr_0(:,2);
xlim([0,450]);
ylim([15,32]);
xlabel('Time (s)');
ylabel('Avg. PSNR (dB)');
text(150,22,'SNR = 0 dB','FontSize', 20);
name = "psnr_vs_time_0.png";
% also change legend (at end of script) as needed

set(0, 'DefaultLineLineWidth', 5);
set(gca,'FontSize',20);
set(gca,'linewidth',3);
set(gca,'TickLength',[0.02, 0.0]) % 0.0 is for 3D ticklength
colors = ["b","r","g","m"];
linestyle = ["-","--",":","-."];
legend boxoff;
box on;
hold on;
for i = 1:size(x,2)
    plot(cell2mat(x(:,i)),cell2mat(y(:,i)),linestyle(i),'color',colors(i));
end

legend('AMP','GPSR','TwIST','Location','southeast');

dim = 5;
set(gcf, 'Units', 'Inches', 'Position', [0, 0, dim, dim], 'PaperUnits', 'Inches', 'PaperSize', [dim, dim]);
saveas(gcf,name);
