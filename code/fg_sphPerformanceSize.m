function F = fg_sphPerformanceSize(sphTable, fgtitle, fgOpts)
% extract some params
shapes = categories(sphTable.shape_id);
nShapes = height(shapes);
sizes = categories(sphTable.size_id);
nSizes = height(sizes);
mblue = "#0072BD";
mgreen = "#77AC30";

% plot figure
F = figure();
F.Position(3:4) = [300 300];
p = cell(3,1);

for i = 1:nShapes
    t = sphTable(sphTable.shape_id==shapes{i},:);
    % plot theoretical sphericity
    % x = repmat(i,3,1);
    x = t.globSide_vx;
    y1 = t.sph_th;
    y2 = t.sph_meas_python;
    p{1} = plot(x, y1,'s-','linewidth',1,'MarkerSize',10,'color',mblue);
    hold on;
    % plot actual sphericity
    p{2} = plot(x,y2,'+-','linewidth',1,'MarkerSize',10,'color',mgreen);
    % plot the name of the shape above ref line
    text(100,y1(1)+0.05,shapes{i},'FontSize',fgOpts.fsAx);
   

end
% plot ref lines
yline(1,'--','color',[0.5 0.5 0.5],'label','sph = 1');
yline(0,'--','color',[0.5 0.5 0.5],'label','sph = 0');

% edits
box off;
ax = gca();
xlim([0 7000]);
ax.XTick = [120 1200 2400 6000];
%ax.XTickLabelRotation = 90;
%ax.XTickLabel = shapes;
xlabel('object width (voxels)');
ylabel('sphericity');
ylim([-0.1 1.1]);
ax.YTick = [0 0.25 0.5 0.75 1];
ax.FontSize = fgOpts.fsAx;
axis square;
title(fgtitle,'FontSize',fgOpts.fsT);

lg = legend([p{1} p{2}], ...
    {'theoretical','measured'}, ...
    'location','southwest','FontSize',fgOpts.fsS);

end