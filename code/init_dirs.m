function v = init_dirs
wd = pwd;
idx = strfind(wd,['segVolData' filesep 'code']);
v.data = [wd(1:idx+length('segVolData')-1) filesep 'data']; 
v.data_C432 = [v.data filesep 'C432_XNH_nuclei'];
v.data_Y391 = [v.data filesep 'Y391_XNH_nuclei'];
v.data_Y489 = [v.data filesep 'Y489_XNH_nuclei'];
v.fg = [wd(1:idx+length('segVolData')-1) filesep 'plots']; 
v.localcsv = 'local path to store uncompressed csv data during analysis (<15MB)';
end