#!/bin/bash

# Subjects
subjects=("cal073" "cal078" "cal080" )
path_database="../../canproco/"

for subject in "${subjects[@]}"
do
# Definition de variables 
    anat_T2w="$path_database""sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_T2w.nii.gz"
    anat_PSIR="$path_database""sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_PSIR.nii.gz"
    anat_STIR="$path_database""sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_STIR.nii.gz"
    sc_T2w="$path_database""derivatives/labels/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_T2w_seg-manual.nii.gz"
    lesion_PSIR="$path_database""derivatives/labels/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_PSIR_lesion-manual.nii.gz"
    lesion_STIR="$path_database""derivatives/labels/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_STIR_lesion-manual.nii.gz"
    anat_T2w_RPI="$path_database""sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_T2w_RPI.nii.gz"
    anat_T2w_RPI_r="$path_database""sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_T2w_RPI_r.nii.gz"
    warp_STIR="warp_sub-$subject""_ses-M0_T2w_RPI_r2sub-$subject""_ses-M0_STIR.nii.gz"
    sc_T2w_2_STIR="sub-$subject""_ses-M0_T2w_seg-manual_2_STIR.nii.gz"
    sc_T2w_2_STIR_dil="sub-$subject""_ses-M0_T2w_seg-manual_2_STIR_dil.nii.gz"
    lesion_STIR_crop="sub-$subject""_ses-M0_STIR_lesion_crop.nii.gz"
    anat_STIR_crop="sub-$subject""_ses-M0_STIR_crop.nii.gz"
    sc_T2w_2_STIR_dil_crop="sub-$subject""_ses-M0_T2w_seg-manual_2_STIR_dil_crop.nii.gz"
    anat_STIR_crop_masked="sub-$subject""_ses-M0_STIR_crop_masked.nii.gz"
    lesion_STIR_crop_masked="sub-$subject""_ses-M0_STIR_lesions_crop_masked.nii.gz"
    BIDS_masked="$path_database""sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_STIR-masked.nii.gz"
    BIDS_masked_lesion="$path_database""derivatives/labels/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_STIR-masked_lesion-manual.nii.gz"
# Reorient to RPI and resample to 0.8mm isotropic voxel
    sct_image -i  $(echo "$anat_T2w") -setorient RPI -o $(echo "$anat_T2w_RPI")
    sct_resample -i $(echo "$anat_T2w_RPI") -mm 0.8x0.8x0.8 -o $(echo "$anat_T2w_RPI_r")
# T2W SC mask to PSIR/STIR Registration 
    sct_register_multimodal -i $(echo "$anat_T2w_RPI_r") -d $(echo "$anat_STIR") -identity 1
    sct_apply_transfo -i $(echo "$sc_T2w") -d $(echo "$anat_STIR") -w $(echo "$warp_STIR") -x nn -o $(echo "$sc_T2w_2_STIR")
# SC registered masks dilation for inclusde CSF
    sct_maths -i  $(echo "$sc_T2w_2_STIR") -dilate 5 -shape ball -o  $(echo "$sc_T2w_2_STIR_dil")
# Images cropping in SC shape
    sct_crop_image -i  $(echo "$lesion_STIR") -m  $(echo "$sc_T2w_2_STIR_dil") -o  $(echo "$lesion_STIR_crop")
    sct_crop_image -i  $(echo "$anat_STIR") -m  $(echo "$sc_T2w_2_STIR_dil") -o  $(echo "$anat_STIR_crop")
    sct_crop_image -i  $(echo "$sc_T2w_2_STIR_dil") -m  $(echo "$sc_T2w_2_STIR_dil") -o  $(echo "$sc_T2w_2_STIR_dil_crop")
# PSIR/STIR/lesion images masking with SC_dilate for training
    sct_maths -i  $(echo "$anat_STIR_crop") -mul  $(echo "$sc_T2w_2_STIR_dil_crop") -o  $(echo "$BIDS_masked")
    sct_maths -i  $(echo "$lesion_STIR_crop") -mul  $(echo "$sc_T2w_2_STIR_dil_crop") -o  $(echo "$BIDS_masked_lesion")
done
