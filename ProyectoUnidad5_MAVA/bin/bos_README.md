# README of data management with PLINK

This README explains the transformations done to the **BushaLive_MC-17-1542_PLINK** to generate **bos** files used for the next analyses. Original plink download of [dryad](https://datadryad.org/resource/doi:10.5061/dryad.q00k37c)

##### 1. Remove individuals with >0.1 of missing data and recording plink file BED format
```
PLINK v1.90p 64-bit (2 Dec 2018)              
www.cog-genomics.org/plink/1.9/
(C) 2005-2018 Shaun Purcell, Christopher Chang   GNU General Public License v3
Logging to bos_fil.log.
Options in effect:
  --chr-set 30
  --file BushaLive_MC-17-1542_PLINK
  --maf 0.01
  --make-bed
  --out bos_fil


Performing single-pass .bed write (55266 variants, 1210 samples).
--file: bos_fil-temporary.bed + bos_fil-temporary.bim + bos_fil-temporary.fam
written.
55266 variants loaded from .bim file.
1210 samples (1210 males, 0 females) loaded from .fam.
Using 1 thread (no multithreaded calculations invoked).
Before main variant filters, 1210 founders and 0 nonfounders present.
Calculating allele frequencies... done.
Warning: 299 het. haploid genotypes present (see bos_fil.hh ); many commands
treat these as missing.
Total genotyping rate is 0.962115.
4854 variants removed due to minor allele threshold(s)
(--maf/--max-maf/--mac/--max-mac).
50412 variants and 1210 samples pass filters and QC.```

----------------------------


##### 2. The number of homozy-gous differences between each population was calculated with the ‘bcftools gtcheck’ command in VCFtools

##### 3. Recoding the plink file for R analyses

Analyses in R used here used the file in GDS format (.gds) for the package SNPRelate. The recodification was done within R with the command:

    library(SNPRelate)
    snpgdsBED2GDS("nuevos_final.bed", "nuevos_final.fam", "nuevos_final.bim", out.gdsfn="nuevos_final.gds", option = snpgdsOption(Z=10))

Console output:

------

    Start snpgdsBED2GDS ...
    	BED file: "C:\Users\amastretta\Copy\Science\CONABIO\Maices\Maices1raEtapa\DataAnalysis\data\SNPs\nuevos_final.bed" in the SNP-major mode (Sample X SNP)
    	FAM file: "C:\Users\amastretta\Copy\Science\CONABIO\Maices\Maices1raEtapa\DataAnalysis\data\SNPs\nuevos_final.fam", DONE.
    	BIM file: "C:\Users\amastretta\Copy\Science\CONABIO\Maices\Maices1raEtapa\DataAnalysis\data\SNPs\nuevos_final.bim", DONE.
    Wed May 06 11:09:54 2015 	store sample id, snp id, position, and chromosome.
    	start writing: 165 samples, 36931 SNPs ...
     	Wed May 06 11:09:54 2015	0%
     	Wed May 06 11:09:54 2015	100%
    Wed May 06 11:09:54 2015 	Done.
    Optimize the access efficiency ...
    Clean up the fragments of GDS file:
    	open the file "nuevos_final.gds" (size: 1775842).
    	# of fragments in total: 39.
    	save it to "nuevos_final.gds.tmp".
    	rename "nuevos_final.gds.tmp" (size: 1775590).
    	# of fragments in total: 18.

------

### 4. Raw format

This is used for adegenet read.PLINK function

plink command:

`plink --file nuevos_final --recodeA`

Plink log:

---

---
