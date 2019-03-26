# README of data management with PLINK

This README explains the transformations done to the **BushaLive_MC-17-1542_PLINK** to generate **bos** files used for the next analyses. Original plink download of [dryad](https://datadryad.org/resource/doi:10.5061/dryad.q00k37c)

##### 1. Generate file BED format
```
plink --file BushaLive_MC-17-1542_PLINK --chr-set 31 --make-bed --out bufa
```
##### 2. Delete duplicates IDs (DFV FV0028)
```
plink --bfile bufa --chr-set 31 --list-duplicate-vars --ids-only --suppress-first --make-bed --out bufa_clean
```
##### 3.Remove individuals with >0.1 of missing data and recording plink file BED format
```
plink --bfile bufa_clean --chr-set 31 --maf 0.01 --make-bed --out bos_fil
```

----------------------------

##### 4. The number of homozy-gous differences between each population was calculated with the ‘bcftools gtcheck’ command in VCFtools
