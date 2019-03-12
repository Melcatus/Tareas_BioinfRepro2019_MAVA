# README

This directory contains the scripts, data, metadata and the results from the project of Unit 5 of the class *Introducción a la Bioinformática para Biólogo/as y Genetistas*:  **Analysis of genetic of cotton**.

### Data
In this project, the data correspond to those used in the article *Diversity analysis of cotton (Gossypium
hirsutum L.) germplasm using the CottonSNP63K Array*. [Data access link](https://www.cottongen.org/data/community_projects/tamu63k/data)

### Prerequisites
PLINK v1.90b3m
VCFtools 0.1.15
R 3.5.2

### R packages:
ggplot2

### Data analysis
**PLINK v1.90b3m** will be used to calculate SNP allele frequencies with ```-freq``` option and to stimates of expected heterozygosity with ```-hardy```.

**VCFtools 0.1.15** will be used to calculate the number of homozygous difference between domesticated and wild populations.

**R 3.5.2** will be used to generate a graph resulting from a principal component analysis showing the diferences between wild and domesticated populations.ec

### Directories:
**bin**  ```ProyectoUnidad5_MAVA/bin```: will contain the scripts used for the analysis, with the specifies the prerequisites, order and input files required for each script.

**data** ```ProyectoUnidad5_MAVA/data```: will contain the SNP data of wild and domesticated populations of *G. hirsutum*. The data is provided in vcf format.

**meta** ```ProyectoUnidad5_MAVA/meta```: in this directory will find the metadata of *G. hirsutum*.

**out** ```ProyectoUnidad5_MAVA/out```: will contain output files of the analyses. Some of them are used as inputs for graphics.
