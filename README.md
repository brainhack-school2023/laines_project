
<img src="https://github.com/brainhack-school2023/laines_project/blob/main/MS_lesion_seg.gif" width="700" height="300"/>

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


### Methods #1: Splitting  of the data for training with cross-validation (CV)
In order to reduce the overfitting and build a more robust model, an automatic cross validation process was applied thanks to the nnUnet network.
   <br /><img src="https://github.com/brainhack-school2023/laines_project/assets/77469192/fcd0d214-381d-4f5f-9a18-f16e3b49fba2" width="500px;" alt=""/>
</a>
</a> 

### Methods #2: Pre-processing Pipeline for training and testing
The following preprocessing pipeline was applied to our entire CanProCo database and to the MP2RAGE database.
It is necessary to apply the same preprocessing pipeline to test the model on other data.
![image](https://github.com/brainhack-school2023/laines_project/assets/77469192/54564cf5-de83-4030-ba5b-65f005a02902)

## Methods #3: Conversion from BIDS formalism to nnUnet formalism
The nnUnet needs for its training and testing a particular data structure that we will call "nnUnet formalism", 
In this [Ivadomed repository](https://github.com/ivadomed/data-conversion/tree/jv/update_nnunet_conversion_script_to_v2) a script has been developed to convert data from the [BIDS](https://bids.neuroimaging.io/) formalism to the nnUnet formalism. 
This step is crucial for both training and testing steps. 

## Commands to use 

### Convert from BIDS to nnUnet:
`
python convert_bids_to_nnUnetv2.py --path-data BIDS_RPI_STIR_SPIR/  --path-out nnUNet_raw --dataset-name ms_lesion_PSIR_STIR  --label-suffix lesion-manual --dataset-number 520 --contrasts PSIR STIR --seed 99 --split 0.8 0.2  --labels-path-name BIDS_RPI_STIR_SPIR/derivatives/labels/  --session-name ses-M0
`
### Launch preprocessing for training:
`
nnUNetv2_plan_and_preprocess -d 520 --verify_dataset_integrity
`
### Launch parallel training :
`CUDA_VISIBLE_DEVICES=6 nnUNetv2_train 520 2d 0 --npz`

`CUDA_VISIBLE_DEVICES=7 nnUNetv2_train 520 2d 1 --npz`

`CUDA_VISIBLE_DEVICES=3 nnUNetv2_train 520 2d 2 --npz`

`CUDA_VISIBLE_DEVICES=4 nnUNetv2_train 520 2d 3 --npz`

`CUDA_VISIBLE_DEVICES=5 nnUNetv2_train 520 2d 4 --npz`

### Find the best configuration for testing :
`
nnUNetv2_find_best_configuration 520 -c 2d
`
#### Output (to test):
`
nnUNetv2_apply_postprocessing -i brainhack/ensembling_STIR_PSIR -o brainhack/ensembling_STIR_PSIR_proba -pp_pkl_file nnUNet_results/Dataset520_ms_lesion_PSIR_STIR/nnUNetTrainer__nnUNetPlans__2d/crossval_results_folds_0_1_2_3_4/postprocessing.pkl -np 8 -plans_json nnUNet_results/Dataset520_ms_lesion_PSIR_STIR/nnUNetTrainer__nnUNetPlans__2d/crossval_results_folds_0_1_2_3_4/plans.json
`
### Now let's move to our external database (CRMBM, Marseille):
### Convert from BIDS to nnUnet:
`
python convert_bids_to_nnUnetv2.py --path-data bids_mp2rage/  --path-out nnUNet_raw --dataset-name ms_lesion_T1q_UNI  --label-suffix lesion-manual --dataset-number 524 --contrasts T1q UNI --seed 99 --split 0.5 0.5  --labels-path-name bids_mp2rage/derivatives/labels/  --session-name ses-M0
`
### To test in external DB
`
nnUNetv2_predict -d Dataset520_ms_lesion_PSIR_STIR -i nnUNet_raw/Dataset522_ms_lesion_T1q_UNI/imagesTs -o  brainhack/test_T1q_UNI_proba -f  0 1 2 3 4 -tr nnUNetTrainer -c 2d -p nnUNetPlans 
`

### Results of training
Five models (each fold) were trained on different GPU cards for approximately 45 hours (1000 epochs).
and the following training curves were obtained, where a convergence of the pseudo Dice around 0.5 is observed, however we have a model that has started to suffer an overfitting (fold 2) where as the pseudo Dice falls, the loss validation increases. 
![image](https://github.com/brainhack-school2023/laines_project/assets/77469192/4f13505a-aa66-46b7-b52e-8260d1bc54a6)


### Results: Test of model in CanProCo dataset
In the following distribution of Dice values we observe an irregular distribution, none of them exceeds 0.8 and we have masks incompatible with the GT, obtaining 0, likewise, there are empty manual masks in the input images, as well as in the inferences. 
The boxplots show that the STIR images have a higher resolution than the PSIR images.
![image](https://github.com/brainhack-school2023/laines_project/assets/77469192/bb73788b-fb92-4532-b598-27da9b2858af)
Click [here](https://brainhack-school2023.github.io/laines_project/sc_PSIR.html) to see an interactive image of a automatic lesion segmentation by nnUnet in an PSIR image.

### Results: Test of model in MP2RAGE dataset
In the following distribution of Dice values we observe an irregular distribution, none of them exceeds 0.78. 
None of the UNI images could be segmented, however the T1q images were segmented, only with 8 empty masks. 

![image](https://github.com/brainhack-school2023/laines_project/assets/77469192/ce0ac0e1-824a-4cb0-8357-71b1a06571a5)
Click [here](https://brainhack-school2023.github.io/laines_project/sc_MP2RAGE.html) to see an interactive image of a automatic lesion segmentation by nnUnet in an 3T MP2RAGE image.

Click [here](https://brainhack-school2023.github.io/laines_project/sc_MP2RAGE_7T.html) to see an interactive image of a automatic lesion segmentation by nnUnet in an 7T MP2RAGE image.

### Examples of automatic segmentation 
Here is an example of the automatic lesion segmentations (green) from our model on images in the CanProCo database (test split) and in the external database (CRMBM, Marseille).
   <br /><img src="https://github.com/brainhack-school2023/laines_project/assets/77469192/bb74b15e-74be-4dc7-91f8-a025cfc3f3fb" width="700px;" alt=""/>
</a>
</a> 

## Deliverables
- Preprocessing pipeline for training/testing nnU-net in MS lesions 
- Model for segmenting lesions in Github repository 
- Preliminary results of the MS lesion segmentation in the SC using 2D nnUnet.
- Jupyter notebook for data analysis

## Conclusion
-   The segmentation of MS lesions in the spinal cord is a challenge:
                  there is no segmentation model that works "right" in MS lesions
	               it is linked to inter-rater bias, small volume and irregularity of lesions.
-   First approach (2D nnUnet) trained on STIR/PSIR and a replicability test on MP2RAGE data. 
-   Automatic deep learning lesion segmentation models is a work in progress.  


## Perspectives
1.    Train a 3D nnUnet models 
2.    Data augmentation methods (GAN; Diffusion models)
3.    Transfer learning of our model to other trainings 
4.    Ensemble multiple predictions approaches   (e.g. [Seg MS MP2RAGE model from Basel](https://github.com/ivadomed/model_seg_ms_mp2rage)) 
   <br /><img src="https://github.com/brainhack-school2023/laines_project/assets/77469192/5e31c28a-a481-4122-aca3-c28531dd2d6f" width="500px;" alt=""/>
</a>
</a> 

## References 

1.    A. J. Thompson et al., ‘Diagnosis of multiple sclerosis: 2017 revisions of the McDonald criteria’, Lancet Neurol., vol. 17, no. 2, pp. 162–173, Feb. 2018, doi: 10.1016/S1474-4422(17)30470-2.
2.    B. De Leener et al., ‘SCT: Spinal Cord Toolbox, an open-source software for processing spinal cord MRI data’, NeuroImage, vol. 145, pp. 24–43, Jan. 2017, doi: 10.1016/j.neuroimage.2016.10.009.
3.    C. Gros et al., ‘Automatic segmentation of the spinal cord and intramedullary multiple sclerosis lesions with convolutional neural networks’, NeuroImage, vol. 184, pp. 901–915, Jan. 2019, doi: 10.1016/j.neuroimage.2018.09.081.
4.    O. Vincent, C. Gros, J. P. Cohen, and J. Cohen-Adad, ‘Automatic segmentation of spinal multiple sclerosis lesions: How to generalize across MRI contrasts?’, ArXiv200304377 Cs Eess, Jun. 2020, Accessed: May 25, 2022. [Online]. Available: http://arxiv.org/abs/2003.04377
5.    H. Lassmann, ‘Multiple Sclerosis Pathology’, Cold Spring Harb. Perspect. Med., vol. 8, no. 3, Mar. 2018, doi: 10.1101/cshperspect.a028936. 
6.    O. Ronneberger, P. Fischer, and T. Brox, ‘U-Net: Convolutional Networks for Biomedical Image Segmentation’. arXiv, May 18, 2015. doi: 10.48550/arXiv.1505.04597.
7.    Ö. Çiçek, A. Abdulkadir, S. S. Lienkamp, T. Brox, and O. Ronneberger, ‘3D U-Net: Learning Dense Volumetric Segmentation from Sparse Annotation’. arXiv, Jun. 21, 2016. Accessed: Jun. 30, 2022. [Online]. Available: http://arxiv.org/abs/1606.06650
8.    Oh, J., Arbour, N., Giuliani, F., Guenette, M., Kolind, S., Lynd, L., Marrie, R. A., Metz, L. M., Patten, S. B., Prat, A., Schabas, A., Smyth, P., Tam, R., Traboulsee, A., & Yong, V. W. (2021). The Canadian prospective cohort study to understand progression in multiple sclerosis (CanProCo): Rationale, aims, and study design. BMC Neurology, 21(1), 418. https://doi.org/10.1186/s12883-021-02447-7
9.    Sastre-Garriga, J., Pareto, D., Alberich, M., Rodríguez-Acevedo, B., Vidal-Jordana, À., Corral, J. F., Tintoré, M., Río, J., Auger, C., Montalban, X., & Rovira, À. (2022). Spinal cord grey matter atrophy in Multiple Sclerosis clinical practice. Neuroscience Informatics, 2(2), 100071. https://doi.org/10.1016/j.neuri.2022.100071
