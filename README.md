# segVolData
Segmented features in volumetric datasets.

You can find information on how to dowload raw and segmentation data from a webknossos dataset [in this link](https://docs.webknossos.org/webknossos-py/). 





## holographic nanotomography "XNH"

| Dataset | version | wk_link | training data | data layers in the wk scene | comments |
| --- | --- | --- | --- | --- | --- |
| C432 | XNH | [C432_XNH](https://webknossos.crick.ac.uk/links/sS0SgZKAmlTrI5aF) | <ul><li>[x] glomeruli: `2023-04-Glomeruli-Segmentation`</li><li>[x] nuclei: `2022-04-XNH-Nuclei`</li><li>[x] nuclei_reduced_color_layer: [C432_XNH_original_training_data_v1](https://webknossos.crick.ac.uk/annotations/665f23ca010000b8107bfd50)</li></ul> | <ul><li>[x] XNH</li><li>[x] tissue mask</li><li>[x] glomeruli</li><li>[x] nuclei</li></ul> | -- |
| Y391 | XNH | [Y391_XNH](https://webknossos.crick.ac.uk/links/Ytlbsi-HWYkuR4KE) | <ul><li>[x] glomeruli: `2023-04-Glomeruli-Segmentation`</li></ul> | <ul><li>[x] XNH</li><li>[x] tissue mask</li><li>[x] glomeruli</li><li>[x] nuclei</li></ul> | -- |
| Y489 | v18 | [Y489_ID16A_v18](https://webknossos.crick.ac.uk/links/1tU0GrH1vEKhDKNw) | <ul><li>[x] glomeruli: `2024-01-Glomeruli-Y489`</li><li>[x] nuclei: `2023-10-Y489-Nuclei`</li><li>[x] nuclei_reduced_color_layer: [Y489_ID16A_original_training_data_v1](https://webknossos.crick.ac.uk/annotations/666179be010000a0607bfda0)</li></ul> | <ul><li>[x] XNH</li><li>[x] tissue mask</li><li>[x] glomeruli</li><li>[x] nuclei</li></ul> | -- |


## serial block-face electron microscopy "SBF-SEM"
| Dataset | version | wk_link | training data | data layers in the wk scene | comments |
| --- | --- | --- | --- | --- | --- |
| C307-04 | nuclei_segmentation-v8-segv5_downsampled-masked | [C307-04-nuclei_segmentation-v8-segv5_downsampled-masked](https://webknossos.crick.ac.uk/links/jYeckKv-FcZZM8JY) | <ul><li>[x] glomeruli: `2021-02-Glomeruli-Segmentation`</li></ul> | <ul><li>[x] SBF-SEM</li><li>[x] tissue mask</li><li>[ ] glomeruli</li><li>[ ] nuclei</li></ul> | nuclei meshes not precomputed. |
| C308-05 | nuclei_segmentation-v8-segv5_downsampled-masked | [C308-05-nuclei_segmentation-v8-segv5_downsampled-masked](https://webknossos.crick.ac.uk/links/HR9ruutoTB3FbilV) | <ul><li>[x] glomeruli: `2021-02-Glomeruli-Segmentation`</li></ul> | <ul><li>[x] SBF-SEM</li><li>[x] tissue mask</li><li>[ ] glomeruli</li><li>[ ] nuclei</li></ul> | nuclei meshes not precomputed. |
| C402 | nuclei_segmentation-v8-segv5_downsampled_masked | [C402_nuclei_segmentation-v8-segv5_downsampled_masked](https://webknossos.crick.ac.uk/links/ubN_NoLM-KDxqZTZ) | <ul><li>[x] glomeruli: `2021-02-Glomeruli-Segmentation`</li></ul> | <ul><li>[x] SBF-SEM</li><li>[x] tissue mask</li><li>[ ] glomeruli</li><li>[ ] nuclei</li></ul> | nuclei meshes not precomputed. |
| C525b-12 | nuclei_segmentation-v8-segv5_downsampled-masked | [C525b-12_nuclei_segmentation-v8-segv5_downsampled-masked](https://webknossos.crick.ac.uk/links/r_0r9FFoAP8R7QzS) | <ul><li>[x] glomeruli: `2021-02-Glomeruli-Segmentation`</li><li>[x] nuclei: `2020-07-Segment-Nuclei-MindySupport`</li><li>[x] nuclei boxes with margin: [mag 2](https://webknossos.crick.ac.uk/annotations/Explorational/66799af5010000e7007b3c9d), [mag 4](https://webknossos.crick.ac.uk/annotations/Explorational/66818127010000a3397b3cb9), [mag 8](https://webknossos.crick.ac.uk/annotations/Explorational/6679aa4a0100005b397b3cae)</li><li>[x] [nuclei boxes for training with black area](https://webknossos.crick.ac.uk/annotations/Explorational/668574690100008c397b476e)</li><li>[x] [nuclei center boxes](https://webknossos.crick.ac.uk/annotations/Explorational/668573af010000230f7b476c) </li></ul> | <ul><li>[x] SBF-SEM</li><li>[x] tissue mask</li><li>[ ] glomeruli</li><li>[ ] nuclei </li></ul> | nuclei meshes not precomputed. |
