<img src=https://github.com/brainhack-school2023/laines_project/blob/main/MS_lesion_seg.gif>

# Automatic MS lesions segmentation in the spinal cord with CanProCo dataset

## About me
Hi! I'm a PhD student at [Aix Marseille Université](https://crmbm.univ-amu.fr/) and [Polytechnique de Montréal](http://neuro.polymtl.ca/). 
My background is in Biomedical Signal and Image Processing and Neurosciences. For the brainhack school, I would like to interact with the MRI data of multiple sclerosis (MS) [CanProCo](https://bmcneurol.biomedcentral.com/articles/10.1186/s12883-021-02447-7), being one of the most extensive databases of MS lesions in the brain and spinal cord. 
Focusing on the application of state-of-the-art deep learning approaches for biomedical image segmentation and then performing a replicability test on 3T and 7T MP2RAGE images from the [CRMBM Lab](https://crmbm.univ-amu.fr/).

<a href="https://github.com/Nilser3">
   <br /><img src="https://avatars.githubusercontent.com/u/77469192?v=4?s=100" width="100px;" alt=""/>
   <br /><sub><b>Nilser LAINES MEDINA</b></sub>
</a>
</a>

## Project Summary
### Introduction
My project aims to develop a multiple sclerosis (MS) lesion in the spinal cord (SC) segmentation algorithm in a multicentric database (CanProCo).
Through novel deep learning architectures performing for medical imaging such as [nnUNET](https://github.com/MIC-DKFZ/nnUNet). 
The model will be evaluated on external data, and on other contrasts such as MP2RAGE and other magnetic fields such as 7T.

### Main Objectives 
1. Interact with [CanProCo](https://bmcneurol.biomedcentral.com/articles/10.1186/s12883-021-02447-7) data
2. Provide a preprocessing pipeline for training/testing [nnU-net](https://github.com/MIC-DKFZ/nnUNet) in the spinal cord.
3. Train segmentation models of MS lesions in the spinal cord.
4. Replicability test on MP2RAGE contrast (CRMBM, Marseille data).
5. To propose improvement paths for the automatic segmentation of MS lesions

### Tools & Methods
- Pre processing: [Spinal Cord Toolbox](https://spinalcordtoolbox.com/), [ivadomed](https://ivadomed.org/index.html)
- Deep Learning: 2D [nnU-net](https://github.com/MIC-DKFZ/nnUNet)
- Data analyse: [Matplotlib](https://matplotlib.org/stable/index.html), [seaborn](https://matplotlib.org/stable/index.html)

### Data
Canadian Prospective Cohort study to understand progression in MS: [CanProCo](https://bmcneurol.biomedcentral.com/articles/10.1186/s12883-021-02447-7)
The dataset consists of 3T MRI data from 52 healthy controls (HC) and 393 sobjects with multiple sclerosis (MS).

##### CanProCo MS Dataset Description (N=393)

| **Center**    | **Manual Segmentation** | **PSIR** | **STIR** | **T2w** | **Total** |
|:-------------:|:---------------:|:--------:|:--------:|:-------:|:---------:|
| **Calgary**   | Lesion segmentation  |          | 82       |         | 82        |
|               | SC segmentation |          |          | 82      |           |
| **Edmonton**  | Lesion segmentation   | 59       |          |         | 59        |
|               | SC segmentation |          |          | 59      |           |
| **Montreal**  | Lesion segmentation   | 94      |          |         | 94      |
|               | SC segmentation |          |          | 94     |           |
| **Toronto**   | Lesion segmentation   | 80       |          |         | 80        |
|               | SC segmentation |          |          | 80      |           |
| **Vancouver** | Lesion segmentation   | 78       |          |         | 78        |
|               | SC segmentation |          |          | 78      |           |
| **Total**     |                 | 311      | 82       | 393     | 393       |


### Experiment #1: Splitting  of the data for training with cross-validation (CV)
![image](https://github.com/brainhack-school2023/laines_project/assets/77469192/fcd0d214-381d-4f5f-9a18-f16e3b49fba2)

### Pre-processing Pipeline for training and testing
![image](https://github.com/brainhack-school2023/laines_project/assets/77469192/83fd0678-3d1d-488d-b052-f6c8ba9bb49b)





[MS lesion GT](https://brainhack-school2023.github.io/laines_project/sc_STIR_GT_7T.html)
