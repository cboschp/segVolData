% evaluate sphericity measurements

%% initialise variables
dirs = init_dirs;
fg = init_figOptions;

%% load data
load([dirs.data filesep 'sphChecks_240807.mat'])

%% extract variables
shapes = categories(sphT.shape_id);
nShapes = height(shapes);
sizes = categories(sphT.size_id);
nSizes = height(sizes);

%% plot measurements vs theoretical values
f = fg_sphPerformanceSize(sphT,'Sphericity',fg);
figSave([dirs.fg filesep 'sphericity_checks']);