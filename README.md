# DESeq2 Signature Generation
 Generate gene expression signatures using DESeq2 with [DESeq2_Signature_Generation.r](https://github.com/ashleyduche/GFRN_Signature_Generation/blob/main/DESeq2_Signature_Generation.r).

# Simulation Datasets
The following datasets can be used to trial run DESeq2_Signature_Genertion.r:
1. AKT gene expression signature data: 2023.GFP18_AKT_FeatureCounts.csv
2. FeatureCounts annotation data: 2023.GFP18_AKT_FeatureCounts.csv 

# Data Background
The example RNA-seq dataset includes gene expression signature data for a GFRN-respective pathway known as AKT along with its respective control samples Green Fluorescent Proteins (GFPs). This signature data was produced from the overexpression of GFRN pathway-specific genes in human mammary epithelial cells (HMECs) generated and explored in ["Activity of distinct growth factor receptor network components in breast tumors uncovers two biologically relevant subtypes"](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5406893/). 

The original RNA-seq FastQ files were downloaded from NCBI-GEO for the dataset [GSE83083](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE83083) and data processing steps were updated as follows for alignment and quantification:
  #### Processing:
  - Raw sequencing FastQ files were downloaded from NCBI using SRA Run Selector for dataset [GSE83083](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE83083).
  - Reads trimming was performed using [Trimmomatic - bioconda](http://www.usadellab.org/cms/?page=trimmomatic).
  - Reads were aligned and quantified using R open source [Rsubread Package](https://bioconductor.org/packages/devel/bioc/vignettes/Rsubread/inst/doc/Rsubread.pdf) from Bioconductor.
    - Alignment Reference Genome: *GRCh38*  
# References
1. Rahman M, MacNeil SM, Jenkins DF, Shrestha G, Wyatt SR, McQuerry JA, Piccolo SR, Heiser LM, Gray JW, Johnson WE, Bild AH. Activity of distinct growth factor receptor network components in breast tumors uncovers two biologically relevant subtypes. Genome Med. 2017 Apr 26;9(1):40. doi: 10.1186/s13073-017-0429-x. PMID: 28446242; PMCID: PMC5406893.
2. Love MI, Huber W, Anders S (2014). “Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2.” Genome Biology, 15, 550. doi:10.1186/s13059-014-0550-8.
