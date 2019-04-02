#script for Principal Component Analysis
# Library
library(SNPRelate)
library(tidyverse)

# Transform the VCF file into gds format
vcf.fn<- "bos_listo.vcf.recode.vcf"
snpgdsVCF2GDS(vcf.fn, "bos_listo.gds", method="biallelic.only")
sampleinfo_filename <- c("popinfo.txt")

## open gds file
genofile <- snpgdsOpen('bos_listo.gds')
snpset_pruned <- snpgdsLDpruning(genofile, autosome.only=F)
snpset.id <- unlist(snpset_pruned)

#Run the PCA
pca <- snpgdsPCA(genofile, num.thread = 2, eigen.cnt = 16, 
                 snp.id = snpset.id, missing.rate = 0.10, 
                 maf = 0.01,autosome.only = F)
#Look at the percent variance explained
pc.percent <- pca$varprop*100
head(round(pc.percent, 2))

#Load sample information for plotting purposes
sampleinfo <- read_tsv(sampleinfo_filename)

#Make a dataframe of PCA
tab <- data.frame(name = pca$sample.id,
                  EV1 = pca$eigenvect[,1],  
                  EV2 = pca$eigenvect[,2],    
                  stringsAsFactors = FALSE)

#Merge the sampleinfo 
tab <- merge(tab, sampleinfo)

#Plot a PCA 
ggplot(data=tab,aes(EV1,EV2)) + geom_jitter(aes(color=population),
                                            width=0.01,height=0.01) + ylab("Principal component 2") + xlab("Principal component 1")
