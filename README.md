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
Multiple Sclerosis (MS) is a disabling disease of the brain and spinal cord (SC) characterized by presence of lesions.
Studies demonstrated the added value of 3T MP2RAGE sequence [5] and the advantages of 7T imaging.
Manual lesion identification is a slow process subject to inter-rater variability 9 10 and the automatic MS lesion segmentation in the SC has some initiatives.

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

Click [here](https://brainhack-school2023.github.io/laines_project/sc_STIR_GT_7T.html) to see an interactive image of a manual lesion segmentation in an STIR image.

In order to reduce the overfitting and build a more robust model, an automatic cross validation process was applied thanks to the nnUnet network.
### Methods #1: Splitting  of the data for training with cross-validation (CV)
![image](https://github.com/brainhack-school2023/laines_project/assets/77469192/fcd0d214-381d-4f5f-9a18-f16e3b49fba2)

The following preprocessing pipeline was applied to our entire CanProCo database and to the MP2RAGE database.
It is necessary to apply the same preprocessing pipeline to test the model on other data.

### Methods #2: Pre-processing Pipeline for training and testing
![image](https://github.com/brainhack-school2023/laines_project/assets/77469192/83fd0678-3d1d-488d-b052-f6c8ba9bb49b)

### Methods #3: Conversion from BIDS formalism to nnUnet formalism

### Results of training
![image](https://github.com/brainhack-school2023/laines_project/assets/77469192/4f13505a-aa66-46b7-b52e-8260d1bc54a6)

### Results: Test of model in CanProCo dataset
![image](https://github.com/brainhack-school2023/laines_project/assets/77469192/bb73788b-fb92-4532-b598-27da9b2858af)

### Results: Test of model in MP2RAGE dataset

![image](https://github.com/brainhack-school2023/laines_project/assets/77469192/ce0ac0e1-824a-4cb0-8357-71b1a06571a5)
