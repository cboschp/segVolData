# segVolData
Segmented features in volumetric datasets.


## How to use this repository

You can find information on how to dowload raw and segmentation data from a webknossos dataset [in this link](https://docs.webknossos.org/webknossos-py/). 


This repository contains the results of the analysis of three holographic nanotomography ("XNH") datasets:
- a list of all detected nuclei with their features (id, positions, volume, sphericity)
- a list of the detected nuclei (with all features) after filtering by volume and sphericity
- lists of true and false positives (with volume and sphericity)
- measured metrics on the cross-validation and test boxes for C432 and Y391. For Y489, the test boxes include the boxes used for classifier selection, the division is made afterwards in the code (see `code/generate_plots.ipynb`).
- the respective volume and sphericity threshold
- for Y489: results for the additional classifiers

Note that the volumes (including the volume threshold) here are given in voxels with a voxel size of (200nm)^3, i.e., the dataset voxel size ((100nm)^3) downscaled by 2.

Further, the repository includes the code for generating the plots from the provided data.


## Webknossos links

| Dataset | version | training data | test data |
| --- | --- | --- | --- |
| C432 | XNH | [C432_XNH_original_training_data_v1](https://wklink.org/9238) | [C432_XNH_test_data](https://wklink.org/8365) |
| Y391 | XNH | - | [Y391_XNH_test_data](https://wklink.org/8642) | 
| Y489 | v18 |[Y489_ID16A_original_training_data_v1](https://wklink.org/9123) | [Y489_ID16A_test_data](https://wklink.org/8193) |
