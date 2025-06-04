# segVolData
Segmented features in volumetric datasets.

Supporting code and data to [this paper](https://doi.org/10.1117/12.3028309): 

> Andrea Nathansen, Matthis Clausen, Manuel Berning, Ethan MacKenzie, Yuxin Zhang, Alexandra Pacureanu, Andreas T. Schaefer, Norman Rzepka, Carles Bosch, "Cell nuclei segmentation in mm-scale x-ray holographic nanotomography images of mouse brain tissue," Proc. SPIE 13152, Developments in X-Ray Tomography XV, 131521B (23 October 2024); https://doi.org/10.1117/12.3028309

Code version on paper release: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.14017461.svg)](https://doi.org/10.5281/zenodo.14017461)



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


## Evaluating the performance of the classifier

### Step 1: Gather true positives, false positives and false negatives
We annotated ground truth (all nuclei positions) inside 3D regions of interest (or “bounding boxes”). 

Each bounding box covered (50 µm)<sup>3</sup> and sampled a region inside a larger dataset. Bounding boxes targeted different histological zones, so the classifier’s performance would be evaluated taking into account nuclei of different shapes and sizes.

We launched a classifier on an enlarged version of that bounding box (borders extended by 8 µm in all directions). That meant that the classifier would see all relevant nuclei in full, not cropped. We calculated the 3D centroid of all segmented objects.

Segmented objects crossing the borders of the bounding box were only included in the analysis if their centroid was inside the bounding box, or if the centroid was outside the bounding box but with enough volume inside it to contain a ground truth node. 

Then,

- **True positives `TP`:** all segmented objects with a ground truth node inside.  
- **False negatives `FN`:** all ground truth nodes that are not inside any segmented object.  
- **False positives `FP`:** all segmented objects whose centroid is inside the bounding box and don’t have a ground truth node inside.

**Note:** This approach excludes from the analysis all nuclei outside the bounding box but tangentially touching the border which, because of that, were not manually tagged in the ground truth. This mitigates any artifactual effects derived from variable ground truth annotations at those instances.

![alt text](https://github.com/cboschp/segVolData/blob/main/eval_C432_XNH_final.png?raw=true)

**Figure Eval.1:** Example location in the C432\_XNH dataset that contains ground truth nodes and classifier outputs (explore it in 3D [here](https://webknossos.crick.ac.uk/links/3SsONJnScnSjX9fu)).

### Step 2: Filter segmented objects by volume and sphericity
Nuclei are round biological structures, with a diameter very rarely under 5 µm or above 25 µm.   
We implemented this field knowledge in our pipeline: we discarded all segmented objects not round (sphericity \<\< 1\) and too small (volume \<\< (5 µm)<sup>3</sup>) to be a cell nucleus.

This generated the **filtered table of segmented objects.**

### Step 3: Calculate final precision, recall, and F1

Then,

- **True positives of the filtered table (`TP_filt`):** all segmented objects in the filtered table with a ground truth node inside.  
- **False negatives of the filtered table (`FN_filt`):** all ground truth nodes that are not inside any segmented object in the filtered table.  
- **False positives of the filtered table (`FP_filt`):** all segmented objects in the filtered table whose centroid is inside the bounding box but that don’t have a ground truth node inside.

We used these scores to calculate the classifier’s performance, by the proxies defined below:

- **Precision (`P`)** \= TP\_filt / (TP\_filt \+ FP\_filt)  
- **Recall** **(`R`)** \= TP\_filt / (TP\_filt \+ FN\_filt)  
- **F1 (`F1`)** \= 2 \* P \* R / (P \+ R)

See below the scores obtained for two bounding boxes in the C432\_XNH dataset: ctr\_MCL3 (1500, 7224, 3520\) and ctr\_GL2 (5018, 2046, 920).

| bbID | TP | FN | FP | TP\_filt | FN\_filt | FP\_filt | P | R | F1 |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| ctr\_MCL3 | 69 | 2 | 33 | 68 | 3 | 3 | 0.9577 | 0.9577 | 0.9577 |
| ctr\_GL2 | 28 | 0 | 8 | 26 | 2 | 0 | 1.0 | 0.9286 | 0.9630 |

**Table Eval.1:** Example calculation of classification scores for two bounding boxes in the dataset C432\_XNH.

Tables delineating the coordinates of all bounding boxes used can be found [here](https://github.com/cboschp/segVolData/tree/main/data/bboxes). 

The scores for all tested bounding boxes in all datasets can be found together [here](https://github.com/cboschp/segVolData/blob/main/data/table_datasets_all_boxes_metrics.csv), and split in the tables below (see columns `precision`, `recall_thresholding_and_classifier`, and `f1_thresholding_and_classifier`):

| dataset | validation | test |
| :---- | :---- | :---- |
| C432\_XNH | [cross validation](https://github.com/cboschp/segVolData/blob/main/data/C432_XNH_nuclei/C432_XNH-v10-segv1_metrics_volume_sphericity_threshold_cross_validation_boxes.csv) | [test](https://github.com/cboschp/segVolData/blob/main/data/C432_XNH_nuclei/C432_XNH-v10-segv1_metrics_volume_sphericity_threshold_test_boxes.csv) |
| Y391\_XNH | [cross validation](https://github.com/cboschp/segVolData/blob/main/data/Y391_XNH_nuclei/Y391_XNH-v10-segv1_metrics_volume_sphericity_threshold_cross_validation_boxes.csv) | [test](https://github.com/cboschp/segVolData/blob/main/data/Y391_XNH_nuclei/Y391_XNH-v10-segv1_metrics_volume_sphericity_threshold_test_boxes.csv) |
| Y489\_XNH | [classifier selection](https://github.com/cboschp/segVolData/blob/main/data/Y489_XNH_nuclei/Y489_ID16A_v18_eval_v13_29boxes_segv1_metrics_volume_sphericity_threshold_classifier_selection_boxes.csv) | [test](https://github.com/cboschp/segVolData/blob/main/data/Y489_XNH_nuclei/Y489_ID16A_v18_eval_v13_29boxes_segv1_metrics_volume_sphericity_threshold_test_boxes.csv) |
