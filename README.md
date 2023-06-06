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

### CanProCo MS Dataset Description (N=393)


| **Center**    | **Sementation** | **PSIR** | **STIR** | **T2w** | **Total** |
|:-------------:|:---------------:|:--------:|:--------:|:-------:|:---------:|
| **Calgary**   | lesion-manual   |          | 82       |         | 82        |
|               | seg-manual (SC) |          |          | 82      |           |
| **Edmonton**  | lesion-manual   | 59       |          |         | 59        |
|               | seg-manual (SC) |          |          | 59      |           |
| **Montreal**  | lesion-manual   | 94      |          |         | 94      |
|               | seg-manual (SC) |          |          | 94     |           |
| **Toronto**   | lesion-manual   | 80       |          |         | 80        |
|               | seg-manual (SC) |          |          | 80      |           |
| **Vancouver** | lesion-manual   | 78       |          |         | 78        |
|               | seg-manual (SC) |          |          | 78      |           |
| **Total**     |                 | 311      | 82       | 393     | 393       |




[MS lesion GT](https://brainhack-school2023.github.io/laines_project/sc_STIR_GT_7T.html)
