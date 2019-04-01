# README

This directory contains the scripts, data, metadata and the results from the project of Unit 5 of the class *Introducción a la Bioinformática para Biólogo/as y Genetistas*:  **Genetic of populations analysis of *Bos taurus*.**

### Data
In this project, the data correspond to those used in the article *Conservation of a domestic metapopulation structured into related and partly admixed strains*. [Data access link](https://datadryad.org/resource/doi:10.5061/dryad.q00k37c)

### Prerequisites
PLINK v1.90p
VCFtools - 0.1.15
R 3.5.2

###### R packages:
ggplot2
SNPRelate
tidyverse

### Data analysis
**PLINK v1.90p** was used for generate BED, FAM, BIN and VCF files, clean the duplicates IDs and individuals, defined polymorphic SNPs with a minor allele frequency (MAF) gretaeer than 0.01.

**VCFtools 0.1.15** will be used to filter individuals of Alpine and Busa populations and calculate Fst.

**R 3.5.2** will be used to generate a graph resulting from a principal component analysis showing the diferences between Alpine and Busa populations.

### Directories:
**bin**  ```[ProyectoUnidad5_MAVA/bin](https://github.com/Melcatus/Tareas_BioinfRepro2019_MAVA/tree/master/ProyectoUnidad5_MAVA/bin)```: will contain the scripts used for the analysis, with the specifies the prerequisites, order and input files required for each script.

**data** ```[ProyectoUnidad5_MAVA/data](https://github.com/Melcatus/Tareas_BioinfRepro2019_MAVA/tree/master/ProyectoUnidad5_MAVA/data)```: will contain the SNP data of population *Alpine* and *Busa* of *Bos taurus*. The data is provided in vcf format.

**meta** ```[ProyectoUnidad5_MAVA/meta](https://github.com/Melcatus/Tareas_BioinfRepro2019_MAVA/tree/master/ProyectoUnidad5_MAVA/meta)```: in this directory will find the metadata of *Bos taurus*.

**out** ```[ProyectoUnidad5_MAVA/out](https://github.com/Melcatus/Tareas_BioinfRepro2019_MAVA/tree/master/ProyectoUnidad5_MAVA/out)```: will contain output files of the analyses. Some of them are used as inputs for graphics and the markdown file with the abstract and discussion.

### Refrence
Ramljak J, Bunevski G, Bytyqi H, Marković B, Brka M, Ivanković A, Kume K, Stojanović S, Nikolov V, Simčič M, Soelkner J, Kunz E, Rothammer S, Seichter D, Grünenfelder H, Broxham ET, Kugler W, Medugorac I (2018) Conservation of a domestic metapopulation structured into related and partly admixed strains. Molecular Ecology 27(7): 1633-1650. https://doi.org/10.1111/mec.14555

Ramljak J, Bunevski G, Bytyqi H, Marković B, Brka M, Ivanković A, Kume K, Stojanović S, Nikolov V, Simčič M, Soelkner J, Kunz E, Rothammer S, Seichter D, Grünenfelder H, Broxham ET, Kugler W, Medugorac I (2018) Data from: Conservation of a domestic metapopulation structured into related and partly admixed strains. Dryad Digital Repository. https://doi.org/10.5061/dryad.q00k37c
