function F = fg_vol_sph(T, ttl, singlePlot, fgOpts)
% params
x_lim = [100 300];
xticks = [100 200 300];
y_lim = [0.7 0.9];
yticks = [0.7 0.8 0.9];

% plot
if singlePlot
    F = figure();
    F.Position(3:4) = fgOpts.sz;
end

% f = plot(T.volume_um3_avg, T.sph_avg,'o',...
%     'MarkerEdgeColor','k','MarkerFaceColor','k');
% hold on;
errorbar(T.volume_um3_avg, T.sph_avg, ...
    T.sph_err, T.sph_err, T.volume_um3_err, T.volume_um3_err, ...
    'o','MarkerEdgeColor','k','MarkerFaceColor','k',...
    'color','k');
% hold on;
% xline(th,'-.','spher. thr.','labelHorizontalAlignment','left',...
%     'color',[.5 .5 .5],'LineWidth',fgOpts.lw,'FontSize',fgOpts.fsAx);

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
xlabel('volume (µm^3)','FontSize',fgOpts.fsAx)
ylabel('sphericity (n.u.)','FontSize',fgOpts.fsAx);
title(ttl,'FontSize',fgOpts.fsT,'Interpreter','none');



end