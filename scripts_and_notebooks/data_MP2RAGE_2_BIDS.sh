#!/bin/bash

subjects=(00    01      02      03      04      05      06      07      08      09      10      11      12      13      14      15      16      17      18      19      20      21      22      23      24      25      26      27      28      29 30 31        32      33      34      35      36      37      38      39      40)
#subjects=(00)
for subject in "${subjects[@]}"
do
    mkdir "bids/sub-$subject"
    mkdir "bids/sub-$subject/ses-M0"
    mkdir "bids/sub-$subject/ses-M0/anat"
    mkdir "bids/derivatives/labels/sub-$subject"
    mkdir "bids/derivatives/labels/sub-$subject/ses-M0"
    mkdir "bids/derivatives/labels/sub-$subject/ses-M0/anat"
    sct_image -i "sub$subject/t1q_crop_5_masked.nii.gz" -setorient RPI -o "bids/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_T1q.nii.gz"
    sct_image -i "sub$subject/UNI_crop_5_masked.nii.gz" -setorient RPI -o "bids/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_UNI.nii.gz"
    sct_image -i "sub$subject/lesion_crop_5.nii.gz" -setorient RPI -o  "bids/derivatives/labels/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_T1q_lesion-manual.nii.gz"
    sct_image -i "sub$subject/lesion_crop_5.nii.gz" -setorient RPI -o "bids/derivatives/labels/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_UNI_lesion-manual.nii.gz"
    sct_resample -i  "bids_mp2rage/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_T1q.nii.gz" -mm 3.0x0.6875x0.6875 -o "bids/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_T1q.nii.gz"
    sct_resample -i  "bids_mp2rage/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_UNI.nii.gz" -mm 3.0x0.6875x0.6875 -o "bids/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_UNI.nii.gz"
    sct_resample -i  "bids_mp2rage/derivatives/labels/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_T1q_lesion-manual.nii.gz" -mm 3.0x0.6875x0.6875 -o "bids/derivatives/labels/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_T1q_lesion-manual.nii.gz"
    sct_resample -i  "bids_mp2rage/derivatives/labels/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_UNI_lesion-manual.nii.gz" -mm 3.0x0.6875x0.6875 -o "bids/derivatives/labels/sub-$subject/ses-M0/anat/sub-$subject""_ses-M0_UNI_lesion-manual.nii.gz"
done
