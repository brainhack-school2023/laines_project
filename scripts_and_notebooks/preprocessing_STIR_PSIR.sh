#!/bin/bash

# Subjects
subjects=("cal073" "cal078" "cal080" "cal083" "cal084" "cal085" "cal088" "cal090" "cal092" "cal094" "cal095" "cal104" "cal105" "cal106" "cal107" "cal109" "cal113" "cal114" cal115" "cal116" "cal117" "cal118" "cal119" "cal121" "cal122" "cal123" "cal125" "cal126" "cal127" "cal128" "cal129" "cal130" "cal131" "cal134" "cal135" "cal136" "cal137" "cal138" "cal140" "cal142" "cal143" "cal144" "cal145" "cal146" "cal149" "cal150" "cal151" "cal152" "cal153" "cal154" "cal156" "cal157" "cal158" "cal160" "cal161" "cal162" "cal164" "cal165" "cal167" "cal168" "cal169" "cal170" "cal173" "cal175" "cal176" "cal177" "cal182" "cal184" "cal185" "cal188" "cal190" "cal191" "cal192" "cal197" "cal198" "cal206" "cal207" "cal210" "cal213" "cal214" "edm005" "edm008" "edm010" "edm011" "edm013" "edm018" "edm019" "edm023" "edm025" "edm029" "edm031" "edm034" "edm035" "edm038" "edm043" "edm049" "edm053" "edm054" "edm057" "edm064" "edm065" "edm067" "edm070" "edm075" "edm076" "edm078" "edm082" "edm086" "edm087" "edm088" "edm089" "edm094" "edm095" "edm098" "edm105" "edm107" "edm113" "edm114" "edm118" "edm125" "edm126" "edm136" "edm142" "edm143" "edm146" "edm148" "edm156" "edm157" "edm162" "edm164" "edm172" "edm173" "edm175" "edm176" "edm180" "edm181" "edm182" "edm183" "edm184" "mon001" "mon002" "mon003" "mon004" "mon005" "mon006" "mon007" "mon009" "mon010" "mon011" "mon013" "mon014" "mon029" "mon032" "mon034" "mon036" "mon041" "mon050" "mon052" "mon055" "mon060" "mon064" "mon072" "mon077" "mon079" "mon080" "mon084" "mon092" "mon095" "mon097" "mon104" "mon107" "mon108" "mon109" "mon111" "mon113" "mon118" "mon121" "mon124" "mon125" "mon129" "mon131" "mon132" "mon133" "mon134" "mon136" "mon137" "mon138" "mon139" "mon140" "mon141" "mon142" "mon143" "mon148" "mon149" "mon150" "mon151" "mon152" "mon153" "mon154" "mon157" "mon160" "mon162" "mon163" "mon165" "mon166" "mon167" "mon168" "mon171" "mon173" "mon174" "mon175" "mon176" "mon180" "mon181" "mon183" "mon185" "mon186" "mon187" "mon189" "mon190" "mon191" "mon192" "mon193" "mon194" "mon196" "mon197" "mon198" "mon199" "mon201" "mon207" "mon209" "mon210" "mon211" "tor004" "tor006" "tor007" "tor010" "tor012" "tor014" "tor016" "tor017" "tor018" "tor020" "tor021" "tor024" "tor025" "tor027" "tor028" "tor029" "tor030" "tor031" "tor032" "tor033" "tor035" "tor036" "tor037" "tor040" "tor041" "tor043" "tor044" "tor049" "tor058" "tor059" "tor061" "tor062" "tor063" "tor064" "tor065" "tor066" "tor070" "tor073" "tor074" "tor076" "tor077" "tor079" "tor085" "tor089" "tor090" "tor095" "tor096" "tor097" "tor098" "tor099" "tor103" "tor106" "tor107" "tor109" "tor110" "tor112" "tor114" "tor115" "tor118" "tor121" "tor123" "tor124" "tor125" "tor126" "tor127" "tor128" "tor133" "tor135" "tor137" "tor139" "tor140" "tor141" "tor143" "tor144" "tor145" "tor146" "tor147" "tor153" "tor157" "tor161" "van009" "van010" "van022" "van034" "van052" "van054" "van055" "van065" "van072" "van093" "van111" "van112" "van116" "van123" "van124" "van125" "van129" "van131" "van133" "van134" "van135" "van136" "van137" "van144" "van145" "van146" "van147" "van148" "van149" "van150" "van151" "van152" "van154" "van155" "van158" "van161" "van168" "van170" "van171" "van172" "van173" "van174" "van175" "van176" "van177" "van178" "van180" "van181" "van182" "van183" "van184" "van185" "van186" "van189" "van191" "van192" "van194" "van196" "van198" "van200" "van201" "van202" "van204" "van206" "van207" "van208" "van209" "van210" "van211" "van212" "van213" "van214" "van215" "van216" "van217" "van219" "van221" "van222")
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
    sct_maths -i  $(echo "$anat_STIR_crop") -mul  $(echo "$sc_T2w_2_STIR_dil_crop") -o  $(echo "$anat_STIR_crop_masked")
    sct_maths -i  $(echo "$lesion_STIR_crop") -mul  $(echo "$sc_T2w_2_STIR_dil_crop") -o  $(echo "$lesion_STIR_crop_masked")
# PSIR/STIR/lesion images to RPI orientation 
    sct_image -i  $(echo "$anat_STIR_crop_masked") -setorient RPI -o  $(echo "$BIDS_masked")
    sct_image -i  $(echo "$lesion_STIR_crop_masked") -setorient RPI-o  $(echo "$BIDS_masked_lesion")
done
