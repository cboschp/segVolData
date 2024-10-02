% summary of segmented nuclei

%% initialise variables
dirs = init_dirs;
fg = init_figOptionsL;

%% ungzip data tables
C432_filteredGZ = 'C432_XNH-v10-segv1-masked_nuclei_data_sphericity_vx_filtered.csv.gz';
Y391_filteredGZ = 'Y391_XNH-v10-segv1-masked_nuclei_data_sphericity_vx_filtered.csv.gz';
Y489_filteredGZ = 'Y489_ID16A_v18-v13-29boxes-segv1-volume-masked-v2_nuclei_data_sphericity_vx_filtered.csv.gz';
gunzip([dirs.data_C432 filesep C432_filteredGZ],dirs.localcsv);
gunzip([dirs.data_Y391 filesep Y391_filteredGZ],dirs.localcsv);
gunzip([dirs.data_Y489 filesep Y489_filteredGZ],dirs.localcsv);

C432_th = 'C432_XNH-v10-segv1_thresholds_volume_sphericity.csv';
Y391_th = 'Y391_XNH-v10-segv1_thresholds_volume_sphericity.csv';
Y489_th = 'Y489_ID16A_v18-v13_thresholds_volume_sphericity.csv';
%% load data tables
C432_filtered = readtable([dirs.localcsv filesep C432_filteredGZ(1:end-3)]);
Y391_filtered = readtable([dirs.localcsv filesep Y391_filteredGZ(1:end-3)]);
Y489_filtered = readtable([dirs.localcsv filesep Y489_filteredGZ(1:end-3)]);
%%
C432_th = readtable([dirs.data_C432 filesep C432_th]);
Y391_th = readtable([dirs.data_Y391 filesep Y391_th]);
Y489_th = readtable([dirs.data_Y489 filesep Y489_th]);
th = vertcat(C432_th,Y391_th,Y489_th);

%% extract variables
scale_um = .2; % voxel sizes operated by the classifier = [200 200 200] nm3 in [x y z]
C432_filtered.volumes_um3 = C432_filtered.volumes .* (scale_um^3);
Y391_filtered.volumes_um3 = Y391_filtered.volumes .* (scale_um^3);
Y489_filtered.volumes_um3 = Y489_filtered.volumes .* (scale_um^3);

n_nuclei = [height(C432_filtered);height(Y391_filtered); height(Y489_filtered)];
datasets = {'C432_XNH'; 'Y391_XNH'; 'Y489_XNH'};

th.threshold_volume_um3 = th.threshold_volume .* (scale_um^3);
nucT = [table(datasets,n_nuclei) th];

%% average volume
volume_um3_avg = zeros(3,1);
volume_um3_std = zeros(3,1);

volume_um3_avg(1) = mean(C432_filtered.volumes_um3);
volume_um3_std(1) = std(C432_filtered.volumes_um3);

volume_um3_avg(2) = mean(Y391_filtered.volumes_um3);
volume_um3_std(2) = std(Y391_filtered.volumes_um3);

volume_um3_avg(3) = mean(Y489_filtered.volumes_um3);
volume_um3_std(3) = std(Y489_filtered.volumes_um3);

volume_um3_err = volume_um3_std ./ sqrt(n_nuclei);

%% average sphericity
sph_avg = zeros(3,1);
sph_std = zeros(3,1);

sph_avg(1) = mean(C432_filtered.sphericities);
sph_std(1) = std(C432_filtered.sphericities);

sph_avg(2) = mean(Y391_filtered.sphericities);
sph_std(2) = std(Y391_filtered.sphericities);

sph_avg(3) = mean(Y489_filtered.sphericities);
sph_std(3) = std(Y489_filtered.sphericities);

sph_err = sph_std ./ sqrt(n_nuclei);

%% update table
nucT.volume_um3_avg = volume_um3_avg;
nucT.volume_um3_std = volume_um3_std;
nucT.volume_um3_err = volume_um3_err;
nucT.sph_avg = sph_avg;
nucT.sph_std = sph_std;
nucT.sph_err = sph_err;

%% global averages
nucVolume_avg = mean(nucT.volume_um3_avg);
nucVolume_std = std(nucT.volume_um3_avg);
nucVolume_err = nucVolume_std/sqrt(height(nucT));

nucSph_avg = mean(nucT.sph_avg);
nucSph_std = std(nucT.sph_avg);
nucSph_err = nucSph_std/sqrt(height(nucT));

n_datasets = height(nucT);

% collate values in a summary table
summaryT = table(n_datasets, nucVolume_avg, nucVolume_std, nucVolume_err, nucSph_avg, nucSph_std, nucSph_err);

%% plot histograms
% volumes
fg_volumes(C432_filtered,nucT.threshold_volume_um3(1),[nucT.datasets{1} ', volume'],true,fg);
figSave([dirs.fg filesep 'C432_v_L']);
fg_volumes(Y391_filtered,nucT.threshold_volume_um3(2),[nucT.datasets{2} ', volume'],true,fg);
figSave([dirs.fg filesep 'Y391_v_L']);
fg_volumes(Y489_filtered,nucT.threshold_volume_um3(3),[nucT.datasets{3} ', volume'],true,fg);
figSave([dirs.fg filesep 'Y489_v_L']);

% sphericities
fg_sphericities(C432_filtered,nucT.threshold_sphericity(1),[nucT.datasets{1} ', sphericity'],true,fg);
figSave([dirs.fg filesep 'C432_s_L']);
fg_sphericities(C432_filtered,nucT.threshold_sphericity(2),[nucT.datasets{2} ', sphericity'],true,fg);
figSave([dirs.fg filesep 'Y391_s_L']);
fg_sphericities(C432_filtered,nucT.threshold_sphericity(3),[nucT.datasets{3} ', sphericity'],true,fg);
figSave([dirs.fg filesep 'Y489_s_L']);

%% plot v-sph across datasets
fg_vol_sph(nucT, 'all datasets', true, fg);
figSave([dirs.fg filesep 'alldatasets_vol-sph']);

%%%%%%%%%%%%%%%%%%%%%%%%%
%% save relevant tables 
save([dirs.data filesep 'nucleiXNH_summaryTables.mat'],...
    'nucT', 'summaryT',...
    '-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%


