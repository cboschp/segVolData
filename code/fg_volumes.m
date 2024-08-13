function F = fg_volumes(T, th, ttl, singlePlot, fgOpts)
% params
bw = 20;
x_lim = [0 500];
xticks = [0 250 500];
y_lim = [0 12000];
yticks = [0 5000 10000];
v_um3_avg = mean(T.volumes_um3);

% plot
if singlePlot
    F = figure();
    F.Position(3:4) = fgOpts.sz;
end

h = histogram(T.volumes_um3,'BinWidth',bw);
hold on;
xline(th,'-.','volume thr.','labelHorizontalAlignment','left',...
    'color',[.5 .5 .5],'LineWidth',fgOpts.lw,'FontSize',fgOpts.fsAx);
xline(v_um3_avg,'-.','mean',...
    'color','k','LineWidth',fgOpts.lw,'FontSize',fgOpts.fsAx);

% edit
box off;
axis square;
xlim(x_lim);
ylim(y_lim);
ax = gca();
ax.XTick = xticks;
ax.YTick = yticks;
ax.FontSize = fgOpts.fsAx;
xlabel('volume (µm^3)','FontSize',fgOpts.fsAx)
ylabel('counts','FontSize',fgOpts.fsAx);
title(ttl,'FontSize',fgOpts.fsT,'Interpreter','none');



end