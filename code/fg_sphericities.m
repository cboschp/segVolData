function F = fg_sphericities(T, th, ttl, singlePlot, fgOpts)
% params
bw = 0.05;
x_lim = [0 1];
xticks = [0 0.5 1];
y_lim = [0 50000];
yticks = [0 25000 50000];
sph_avg = mean(T.sphericities);

% plot
if singlePlot
    F = figure();
    F.Position(3:4) = fgOpts.sz;
end

h = histogram(T.sphericities,'BinWidth',bw);
hold on;
xline(th,'-.','spher. thr.','labelHorizontalAlignment','left',...
    'color',[.5 .5 .5],'LineWidth',fgOpts.lw,'FontSize',fgOpts.fsAx);
xline(sph_avg,'-.','mean',...
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
ax.YAxis.Exponent = 0;
xlabel('sphericity (n.u.)','FontSize',fgOpts.fsAx)
ylabel('counts','FontSize',fgOpts.fsAx);
title(ttl,'FontSize',fgOpts.fsT,'Interpreter','none');



end