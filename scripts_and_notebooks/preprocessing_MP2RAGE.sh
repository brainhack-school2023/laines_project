#!/bin/bash

list_sub=(00	01	02	03	04	05	06	07	08	09	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29 30 31	32	33	34	35	36	37	38	39	40)
#list_sub=(00)
for sub in ${list_sub[@]}; do
  sct_maths -i ../data_sep_3T/sub${sub}/t1q_cor_seg_rl.nii.gz -dilate 5 -shape ball -o ../data_sep_3T/sub${sub}/SC_dil_5.nii.gz
  
  sct_crop_image -i ../data_sep_3T/sub${sub}/t1q_cor_resamp.nii.gz -m ../data_sep_3T/sub${sub}/SC_dil_5.nii.gz -o ../data_sep_3T/sub${sub}/t1q_crop_5.nii.gz
  sct_crop_image -i ../data_sep_3T/sub${sub}/t1_mp2r_uni_crop_rl.nii.gz -m ../data_sep_3T/sub${sub}/SC_dil_5.nii.gz -o ../data_sep_3T/sub${sub}/UNI_crop_5.nii.gz  
  sct_crop_image -i ../data_sep_3T/sub${sub}/t1q_cor_LE_GT.nii.gz -m  ../data_sep_3T/sub${sub}/SC_dil_5.nii.gz -o ../data_sep_3T/sub${sub}/lesion_crop_5.nii.gz
  sct_crop_image -i ../data_sep_3T/sub${sub}/SC_dil_5.nii.gz -m ../data_sep_3T/sub${sub}/SC_dil_5.nii.gz -o ../data_sep_3T/sub${sub}/SC_dil_5_crop.nii.gz

  sct_maths -i ../data_sep_3T/sub${sub}/t1q_crop_5.nii.gz -mul  ../data_sep_3T/sub${sub}/SC_dil_5_crop.nii.gz -o ../data_sep_3T/sub${sub}/t1q_crop_5_masked.nii.gz
  sct_maths -i ../data_sep_3T/sub${sub}/UNI_crop_5.nii.gz -mul  ../data_sep_3T/sub${sub}/SC_dil_5_crop.nii.gz -o ../data_sep_3T/sub${sub}/UNI_crop_5_masked.nii.gz
  
done
