# README of data management with PLINK, vcftools and R

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

##### 4. Create VCF file
```
plink --bfile bos_fil --chr-set 31 --recode vcf --out bos_fil
```

##### 5. Choose individuals of 2 populations: *Alpine* and *Busa*  
```
vcftools bos_fil.vcf --keep mantener.txt --recode --out bos_listo.vcf
```

##### 6.Estimate Fst between populations (*Alpine* and *Busa*) in VCFtools
```
vcftools --vcf bos_fil.vcf --weir-fst-pop pop1.txt --weir-fst-pop pop2.txt
```
##### Output consol
```
VCFtools - 0.1.15
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
	--vcf bos_fil.vcf
	--weir-fst-pop pop1.txt
	--weir-fst-pop pop2.txt
	--keep pop1.txt
	--keep pop2.txt

Keeping individuals in 'keep' list
After filtering, kept 575 out of 1210 Individuals
Outputting Weir and Cockerham Fst estimates.
Weir and Cockerham mean Fst estimate: 0.018509
Weir and Cockerham weighted Fst estimate: 0.019902
After filtering, kept 50412 out of a possible 50412 Sites
Run Time = 4.00 seconds
```

##### 7. GDS format in R

```
vcf.fn<- "bos_listo.vcf.recode.vcf"

snpgdsVCF2GDS(vcf.fn, "bos_listo.gds", method="biallelic.only")
```

##### Output consol:

```
VCF Format ==> SNP GDS Format
Method: exacting biallelic SNPs
Number of samples: 575
Parsing "bos_listo.vcf.recode.vcf" ...
	import 50412 variants.
+ genotype   { Bit2 575x50412, 6.9M } *
Optimize the access efficiency ...
Clean up the fragments of GDS file:
    open the file 'bos_listo.gds' (7.3M)
    # of fragments: 60
    save to 'bos_listo.gds.tmp'
    rename 'bos_listo.gds.tmp' (7.3M, reduced: 480B)
    # of fragments: 20
```
